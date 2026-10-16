Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5983769FD
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 04:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792124101; cv=none; b=UjKABwplsqnAZwo1c1+FP3lNI+A0FBDCB4ACX3RvmZjTWWhgwWfYxXjqwGhJ8u4bIGGWQER02+TnWtz4cWzjX3H/tDN5jGOqpH0k8/ABISV41Lnsi6OPuiDOL+68Rm0Ss+0GGvCzalfSJqVC7UrQhdNNL7USr/WSRofCUnab0fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792124101; c=relaxed/simple;
	bh=JsS1qKigA32TwTWkA0ijc5IJGDu/dHPZimpuAlXn3us=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=QG4n/iSXpByz5oU6ycIkSifKYIypCBsUabVUCVl2f8fe7FkYkOW49keN+TlndGszMwZbdTQvLgbWTKC75XTUmo0R/ZV6/l7KxCa5tfJYHANK1BJZgCWQvyZbSM/EEIGaAOjt4TUJPj1AcMw5NAnaBQAHFwMZ60Yazi+sdRYFrU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xhq7ztTd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xhq7ztTd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD601F000C4;
	Fri, 16 Oct 2026 04:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792124099;
	bh=MUQxIQbI6E8jRIQwMoZQ6KBFbH1byoEgl7YN7NeuSuM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xhq7ztTdM3kG9joeWJbJnxZwB8HTDnJx7DznibPVLaLyYlYWCiueuoSv/lSREX8B5
	 BG5XnbVyO4BLOVFnhioMQR7opZcMXpumtpnhMjj3sY0Z16R+Vy8Jl0P4hVsxBwbYUA
	 2yj2kM5joLjts2usSAVtgoQAiWC1WvQYnJfYtBgFO2EynaxDj5DRJahmYBsHChxdtb
	 pyF3vP6f0UFrTprYdrt85s/DGn1xHzP+Cu/DJSdAo+7wEZikJ+efnQM801WJ1eNSkM
	 x7px6df106joQuMtJkjIMWkATOVS3t7f211JW27Urj1DHwKTCkgPIdvKUogViaTwYl
	 dPMXGUTPHyBvQ==
Message-ID: <sashiko-outbox-173752@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/25] ASoC: amd: raven: Fix acp3x_dma_close() being
 skipped on rollback
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261015014324.5569-5-phucduc.bui@gmail.com>
References: <20261015014324.5569-1-phucduc.bui@gmail.com>
 <20261015014324.5569-5-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 04:14:59 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] sound: memory leak of runtime->private_data in acp3x_dma_close()
--

commit f9bf5629ed83739ae2130cf6fe20e488a93aca99
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: amd: raven: Fix acp3x_dma_close() being skipped on rollback

The commit ensures that acp3x_dma_open() explicitly returns 0 on success.
This prevents ASoC from skipping the .close() callback during rollback when
snd_pcm_hw_constraint_integer() returns 1.

> diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/ac=
p3x-pcm-dma.c
> index 37ea5c572eb94..7650574990210 100644
> --- a/sound/soc/amd/raven/acp3x-pcm-dma.c
> +++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
> @@ -237,7 +237,13 @@ static int acp3x_dma_open(struct snd_soc_component *=
component,
> =20
>  	i2s_data->acp3x_base =3D adata->acp3x_base;
>  	runtime->private_data =3D i2s_data;
> -	return ret;
> +
> +	/*
> +	 * ASoC only marks the component as opened when .open() returns 0.
> +	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
> +	 * return 0 to ensure .close() is not skipped on rollback.
> +	 */
> +	return 0;

[Severity: High]
Does this code leak the i2s_data structure stored in runtime->private_data?

While this patch ensures that acp3x_dma_close() is not skipped on rollback,
acp3x_dma_close() does not appear to free the memory allocated in
acp3x_dma_open():

sound/soc/amd/raven/acp3x-pcm-dma.c:acp3x_dma_close() {
    ...
	ins =3D substream->runtime->private_data;
	if (!ins)
		return -EINVAL;

	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
    ...
	}

	return 0;
}

Since there is no kfree(ins) in acp3x_dma_close(), repeatedly opening and
closing the stream could cause a memory leak.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015014324.5569=
-1-phucduc.bui@gmail.com?part=3D4
