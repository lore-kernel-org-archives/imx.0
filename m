Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17533440638
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 10:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791457058; cv=none; b=Efy9Qlvp8YP0KMHzpnBb050xzje66TDQuVb7GxsD9ZK4IYrMRWTr1Ruy+E5wy0ZmwzPO4NErFk97nVemh2Hsyea3NxgK4Rvysb8HwiUqCTlUhUJey6Nidw8/CuuUdSJCJ7ML/9PvMbYzivS8/iF3eZhi7S+6sAz1eJ86tkRy0VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791457058; c=relaxed/simple;
	bh=euFLIPTWCleIm+KG636Dc/aiq0UWj86t0hqNGjL3AJ8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=MyywShdgkalRU7yUPIShwUOfPUP25F0HUB+YkQssJnes2ifC9LZaEJWW7myU3DXiUaTaFdKGRUPfNRlrzAx65XP80fE5bdgueHrJQB/JOuqiIb+SDpd6uF8ebeeqJCFF4xpsnYP2KCLV1Q0OnrFl73bpnxWj7EKm2JNAfAsJDjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HMXcE0NU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HMXcE0NU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E3C1F000FF;
	Thu,  8 Oct 2026 10:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791457056;
	bh=m9WIf2aHd30d4S04vgIjkMQUIDdt5Tcly6JZ/zaNvac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HMXcE0NU146AtrTm6J0wWHOCCsrm+2PrLxoOI+lSVVOct9v3pkYoTHvGVdyBYjq4J
	 eK2nuIiIJvaXUbCxjekuJhcNMGA8VA+UmT7xdT/ckycn1hyPVjA0TA1L7cF/ZKnj3V
	 tnYXSvOGxh8rNNLLV50NJNoHiHvvWt4DzBOPvuXT9skpuibWemOGeoZtyIctMXihiL
	 +PZqZUHFgkgFzv8hdJKbjKjgsx+cYV/bvCCvTXeUsMMA5N4HCxwexMcjpmScaekAIg
	 i5s8yuadeJnj9vAGa7JbdNP2Rlq1Z++PB1pA7hm+TIPB3WL451zMWA2g9WF1ZAWRQX
	 Qgyu8lCG1ogOg==
Message-ID: <sashiko-outbox-164068@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 21/24] ASoC: renesas: msiof: Fix msiof_close() being
 skipped on rollback
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: wsa+renesas@sang-engineering.com, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20261008103831.542533-22-phucduc.bui@gmail.com>
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-22-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 10:57:36 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] asoc: msiof: memory leak of prtd in msiof_open() error path
--

commit d7a4f2d9645c8240b2c60d42136e3b2e4694d703
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: renesas: msiof: Fix msiof_close() being skipped on rollback

snd_pcm_hw_constraint_integer() may return 1, which is then returned from
msiof_open(). ASoC only marks the component as opened when .open() returns
0, so this patch explicitly returns 0 on success to ensure .close() isn't
skipped on rollback.

> diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msio=
f.c
> index 128543fc4fc97..9fead9a22cdc4 100644
> --- a/sound/soc/renesas/rcar/msiof.c
> +++ b/sound/soc/renesas/rcar/msiof.c
> @@ -427,10 +427,12 @@ static int msiof_open(struct snd_soc_component *com=
ponent,
>  	ret =3D snd_pcm_hw_constraint_integer(substream->runtime, SNDRV_PCM_HW_=
PARAM_PERIODS);
> =20
>  open_err_dma:
> -	if (ret < 0)
> +	if (ret < 0) {
>  		dma_release_channel(chan);
> +		return ret;

[Severity: Medium]
Does this error path leak the dmaengine_pcm_runtime_data (prtd) memory?

In msiof_open(), if snd_dmaengine_pcm_open() succeeds, it allocates a prtd
object. If the subsequent call to snd_pcm_hw_constraint_integer() fails, the
function falls through to this open_err_dma error path.

Since this path calls dma_release_channel(chan) but fails to clean up the
PCM state via snd_dmaengine_pcm_close(substream) or
snd_dmaengine_pcm_close_release_chan(substream), is the prtd memory
permanently leaked when msiof_open() returns an error and the ASoC core
aborts the open sequence?

> +	}
> =20
> -	return ret;
> +	return 0;
>  }
> =20
>  static int msiof_close(struct snd_soc_component *component,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008103831.5425=
33-1-phucduc.bui@gmail.com?part=3D21
