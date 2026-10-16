Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5789E33122D
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 04:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792124355; cv=none; b=FhSVTB5g0Kn91y7W75oi7pi494QDiJHRGtb4ZjdVRqUpHqNuP+/4Vn59dgHTTNIaYJceSLAtRofhMq6wvMJ7CXg3UdPAbpbn+RbWjATbSUO/cEaCugRrKuULTrWee7E4EsWtsopmvlKV0Ndrk3rcxUrjlo92wohJ+A1ffrfB8Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792124355; c=relaxed/simple;
	bh=0R8tZd1mg8ApY2LghEjqMEF3R+nCYyP8y42omeJQq1A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=OrXlv6e1i05KjgmQvkvDP34gE5U7RF9w+O9/tqbE/jKwV/9fb4AOLEAzN8lAsVNjw496AW/6dJLI+NgqCndTFI7v40XWkIyxrXLAcuO7Kt3tTHIT0lG1uf4E1lxMkrNeOxnkwrItkwvnxI/5CycyZtj9TV5ZEmUgD9fmpE902OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/YToJ0z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/YToJ0z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1545F1F000C5;
	Fri, 16 Oct 2026 04:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792124354;
	bh=ucAVcgU8VuE83iaH8OKo9lWPck2l+0IvE4YJh6dFdw8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q/YToJ0zbmLwS8aLoN3GRZF8JhRF5NMAkkgOt2/grhMJOizBDfn/0V6EjGsmHgIXz
	 ldYpnR6OvdUKXGun7/tPTFJZyNlGgv9U2dhzQHUGKICoyTMA+lYJ+2PWAKG+dvoP8T
	 zGwI61TySm0TiJlmvPRw8SfmCwDI54EP35wq7dIciRwjc3zid7pa22+mu44lB4M2pv
	 RAOTodpEVnDH3x28y9h8Ig3R9jWcAlW+fZ39TUoUgrtOVBvxblKMZsZpAjoS26s51p
	 Fa+3600jpS5hujvGwdTb8CB+DVsOzhGcNGAekpEAEzL6QO7Ln5RJc90Qv5Ml45psJc
	 y+CxWmq2IZ24A==
Message-ID: <sashiko-outbox-173760@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/25] ASoC: amd: acp: Fix .close() being skipped on
 rollback
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261015014324.5569-2-phucduc.bui@gmail.com>
References: <20261015014324.5569-1-phucduc.bui@gmail.com>
 <20261015014324.5569-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 04:19:13 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] sound/soc/amd: raven: memory leak in acp3x_dma_close()
--

commit 85bba20e9cd8adc1bcd476d2122c1723541d8edd
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: amd: acp: Fix .close() being skipped on rollback

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from acp_dma_open(). ASoC only marks the component as opened when
.open() returns 0, so .close() can be skipped on rollback. Return 0
explicitly on success.

> diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-pla=
tform.c
> index 6b1e18b31c1c6..f2c8853775ad3 100644
> --- a/sound/soc/amd/acp/acp-platform.c
> +++ b/sound/soc/amd/acp/acp-platform.c
> @@ -248,7 +248,12 @@ static int acp_dma_open(struct snd_soc_component *co=
mponent, struct snd_pcm_subs
>  	list_add_tail(&stream->list, &chip->stream_list);
>  	spin_unlock_irq(&chip->acp_lock);
> =20
> -	return ret;
> +	/*
> +	 * ASoC only marks the component as opened when .open() returns 0.
> +	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
> +	 * return 0 to ensure .close() is not skipped on rollback.
> +	 */
> +	return 0;
>  }

[Severity: High]
Is there a memory leak in acp3x_dma_close() related to this subsystem?

Looking at sound/soc/amd/raven/acp3x-pcm-dma.c, the stream instance
structure is allocated on every stream open:

sound/soc/amd/raven/acp3x-pcm-dma.c:acp3x_dma_open() {
    ...
	i2s_data =3D kzalloc_obj(*i2s_data);
	if (!i2s_data)
		return -EINVAL;
    ...
}

However, when the stream is closed, acp3x_dma_close() returns without calli=
ng
kfree() to free the allocated stream instance structure:

sound/soc/amd/raven/acp3x-pcm-dma.c:acp3x_dma_close() {
    ...
	return 0;
}

Could this lead to a memory leak of the i2s_data structure on every stream
closure, allowing a user to drain system memory by repeatedly opening and
closing the device?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015014324.5569=
-1-phucduc.bui@gmail.com?part=3D1
