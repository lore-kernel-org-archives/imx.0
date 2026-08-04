Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6625344B68B;
	Tue,  4 Aug 2026 10:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785838385; cv=none; b=jPDc/gtOVkxyFgFv+DucME61XYc2/tvZ95xRGL1o4oQD373NgGkp/jvcRlSHjDHaG9Ve70200aw6z3h6hAQHMoblRU0qX0Ou3kxA9Hdx+ltdzrb6M3wPFA1TaKgQTEs8DbSSA3tLRW7TXkReJwN9ixtInZUPRPKycgyhSwJg/nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785838385; c=relaxed/simple;
	bh=N9x1t0ZHKQe5eHpsVN12X1p/c1/7V6KL/UX7je1i59w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ab1XMdux72+W120NXs5EcEfKTnNe1vRdCVLIhvCT4cxZlrXoX9dWTx8Bqs97CWVget75AYi2SQMg7PtnmKBMccHUrt4JPoN1eP/Qd/LF8UrgVsa1t8cLBV38i8yFPFTgvk8DE+48sSfI6atIN/MO4MetuIm9t13pxJxYSxYhHa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqRjdkIO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqRjdkIO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07821F000E9;
	Tue,  4 Aug 2026 10:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785838379;
	bh=adNZ2UOznIn4JXWe0t1E+QwqjlDEoqg6aLH8Gm1c/Nc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aqRjdkIOTt7S3fqfdVyRSylYeesnpnaXf1IKfe0YU5Ajr0JmDCuwmhjzhszAHA5Ns
	 4ztl6S0R4lC1N2NsKU8zzgZpBpl9hfXp+vhoNeP/qoqqF5qbUmmwAqBMju67l1cfDh
	 wJjf14Jklx/l2GM4RMyXhx+4BS//ux4UgjLFuWgJ83meFQQyrd/rNtA+AGU5QVhXNw
	 Vd2jYW4iY2ADu6F0YR8rXH1Me9XipYSJYF5SmYhzCSXzXR9u+AWDjXPtn+rz7gKUK/
	 97Wp8G1/9MK4a1vYA4dTXvXcmzFZfcZx/piXqAp2kfjtVzINJF39cA+cDTaKsHAoH+
	 GvwQWnoQz2z/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] ASoC: fsl_easrc: expose individual DAIs per
 conversion path
Reply-To: sashiko-reviews@lists.linux.dev
To: shengjiu.wang@oss.nxp.com
Cc: robh@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260804100218.49587-6-shengjiu.wang@oss.nxp.com>
References: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
 <20260804100218.49587-6-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 10:12:58 +0000
Message-Id: <20260804101258.C07821F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Calling ALSA hw_params multiple times on the same stream causes a =
context/pair leak in the ASRC, leading to a Use-After-Free and Denial of Se=
rvice.
--

--- Patch [5]: [PATCH v3 5/5] ASoC: fsl_easrc: expose individual DAIs per c=
onversion path ---
commit 6518fbf2be545cdd1e3224f3467d1c7ad789391e
Author: Shengjiu Wang <shengjiu.wang@nxp.com>

ASoC: fsl_easrc: expose individual DAIs per conversion path

The driver previously registered a single DAI with generic stream names,
preventing multiple independent conversion paths from being used
simultaneously. Replace the single fsl_easrc_dai instance with an array of
four DAI drivers to allow up to four independent conversion paths to be
active at the same time.

> diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
> index f1249da0658cd..17d85d4843588 100644
> --- a/sound/soc/fsl/fsl_easrc.c
> +++ b/sound/soc/fsl/fsl_easrc.c
> @@ -1589,27 +1589,99 @@ static const struct snd_soc_dai_ops fsl_easrc_dai=
_ops =3D {
>  	.hw_free	=3D fsl_easrc_hw_free,

[Severity: High]
This is a pre-existing issue, but if userspace repeatedly calls
SNDRV_PCM_IOCTL_HW_PARAMS on an audio stream without calling hw_free in
between, does fsl_easrc_hw_params() unconditionally request a new context?

Looking at fsl_easrc_hw_params():

sound/soc/fsl/fsl_easrc.c:fsl_easrc_hw_params() {
	...
	ret =3D fsl_easrc_request_context(channels, ctx);
	if (ret) {
		dev_err(dev, "failed to request context\n");
		return ret;
	}
	...
}

If this happens, fsl_easrc_request_context() finds the next available empty
slot in the easrc->pair[] array, overwrites ctx->index, and deducts channels
from easrc->channel_avail:

sound/soc/fsl/fsl_easrc.c:fsl_easrc_request_context() {
	...
	ctx->index =3D index;
	ctx->channels =3D channels;
	easrc->pair[index] =3D ctx;
	easrc->channel_avail -=3D channels;
	...
}

Because the previous index is overwritten without being freed, does
easrc->pair[old_index] permanently retain a dangling pointer to the context?

Furthermore, when the stream is closed, fsl_asrc_dma_shutdown() frees the
pair context but only clears asrc->pair[pair->index] using the latest index:

sound/soc/fsl/fsl_asrc_dma.c:fsl_asrc_dma_shutdown() {
	...
	if (asrc->pair[pair->index] =3D=3D pair)
		asrc->pair[pair->index] =3D NULL;

	kfree(pair);
	...
}

Would subsequent operations that iterate over all easrc->pair[] slots (such
as fsl_asrc_isr() or fsl_asrc_m2m_suspend()) then dereference these dangling
pointers, resulting in a use-after-free? (It appears the older ASRC driver
shares this same design flaw in fsl_asrc_dai_hw_params).

>  };
> =20
> -static struct snd_soc_dai_driver fsl_easrc_dai =3D {
> -	.playback =3D {
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804100218.4958=
7-1-shengjiu.wang@oss.nxp.com?part=3D5
