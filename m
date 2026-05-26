Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFFC23D297;
	Tue, 26 May 2026 06:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779777072; cv=none; b=Icb6YTpgZQ0L5iguvmcldNmlELvb3vNASbmjqBt/Orj20wZUQ0cQQBfOJVb9TDLYtdfCaUDUQUGFidiqaQwf3Fog6jGp66MO7A7uLVz0QaBCRN/LEhci40GG1LH009MoemxAqcPzj0ufwbTLst7/DttGY6Jcz6Pk6LllAoz9yAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779777072; c=relaxed/simple;
	bh=czlJn+mili7g92qqfj7XJ0aYUB5ocjZ09GN9NPhmgqA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fuuTfp4veKKn+mhngz2VZs228J89CyTHGkf2Y9Keg96RhonH9q7FBh8tfEZbEMBEqixDWuDn/zA+J9SDX1k3UAIiaUVjZ1P7fHNtlzyIAIsimn/7rwY48XWzCCNYe+owwOJ5St9sepCviEQk/m24cVpYPFuYT+KHUb6BNhbmIFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQ2KCreo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQ2KCreo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBEA31F000E9;
	Tue, 26 May 2026 06:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779777071;
	bh=fUq2MIG1mNpSAly9CiMCcavAufefLFdU+Ypw/V2Tjlg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MQ2KCreo8pXA+nEjl/UjfTmx5h1V8KjVdxQuP3gbwkVlP91RtqlcCvVwByMs6eKHz
	 Nln7tlB2YPrUFvIdFn4p3Fty6PrcbLIoxX91+WCNQFcPKBZbytCseLQ2oMFslsJW+U
	 umtGbfpvDmb9fffz7pQShiRfSE/ydL7onO+huVFyjub95yijo/4Ejf6CxFAUgIEdXx
	 eATgFrmpPn90XL250TbTSk5n7bLb1fKPZ6elEA+qhglq+FUVqE5MayQt1RlMxn1hCR
	 26/DGSBbIM9PhZ0xHvd0eu3vqDXdOsm2vqM4tvfNbUlqS11cwbskbYZoLPpbK2NB6M
	 sQgXzt8TmFm8g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] ASoC: imx-rpmsg: Support headphone jack detection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chancel Liu" <chancel.liu@nxp.com>
Cc: robh@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260526053815.140008-3-chancel.liu@nxp.com>
References: <20260526053815.140008-3-chancel.liu@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 06:31:10 +0000
Message-Id: <20260526063110.EBEA31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Headphone jack is initialized after the sound card is fully regist=
ered, causing multiple fatal issues including broken jack registration, ker=
nel bugs, and TOCTOU races with userspace.
- [Medium] The patch uses `simple_util_init_jack()` but fails to select its=
 Kconfig dependency, leading to linker errors.
--

commit 23df7e137d741b3d9989cc72e4eb7cee017f18a1
Author: Chancel Liu <chancel.liu@nxp.com>

ASoC: imx-rpmsg: Support headphone jack detection

This commit adds headphone jack detection support for i.MX RPMSG audio card=
s.
It uses simple_util_init_jack() to register a headphone jack with GPIO-based
insertion detection when the hp-det-gpios property is present.

> diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
> index 40e0043cfe15e..9c1cf7045381a 100644
> --- a/sound/soc/fsl/imx-rpmsg.c
> +++ b/sound/soc/fsl/imx-rpmsg.c
> @@ -12,6 +12,7 @@
>  #include <sound/control.h>
>  #include <sound/pcm_params.h>
>  #include <sound/soc-dapm.h>
> +#include <sound/simple_card_utils.h>

[Severity: Medium]
Is it possible to hit a linker error here if no other driver selects the
simple card utilities?

This patch uses simple_util_init_jack(), but doesn't appear to update the
Kconfig entry for SND_SOC_IMX_RPMSG to select SND_SIMPLE_CARD_UTILS. If
this driver is built in a configuration where no other selected options
pull in the simple card utilities, it might result in an undefined
reference error.

[ ... ]

> @@ -282,6 +284,12 @@ static int imx_rpmsg_probe(struct platform_device *p=
dev)
>  		goto fail;
>  	}
> =20
> +	if (of_property_present(np, "hp-det-gpios")) {
> +		ret =3D simple_util_init_jack(&data->card, &data->hp_jack,
> +					    1, NULL, "Headphone Jack");

[Severity: High]
Does initializing the headphone jack after devm_snd_soc_register_card() cau=
se
issues with probe deferral?

If devm_snd_soc_register_card() defers due to a missing component, it queues
the card onto the unbind_card_list and returns 0. The driver then proceeds =
to
call simple_util_init_jack().

At this point, the snd_card pointer is NULL, which triggers a
snd_BUG_ON(!card) in snd_device_new() and returns -ENXIO. This return
value aborts the probe and breaks probe deferral completely.

Additionally, if the card registers synchronously, snd_card_register() is
called before the jack is initialized. Any ALSA devices added after
registration remain in the SNDRV_DEV_BUILD state and are not exposed to
userspace.

This order also creates a window where userspace daemons might probe the
sound card before the jack is created.

Could this jack initialization be moved to the card's late_probe callback
instead?

> +		if (ret)
> +			goto fail;
> +	}
>  fail:
>  	pdev->dev.of_node =3D NULL;
>  	return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526053815.1400=
08-1-chancel.liu@nxp.com?part=3D2
