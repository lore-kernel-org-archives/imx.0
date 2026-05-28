Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53349305047;
	Thu, 28 May 2026 03:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779937278; cv=none; b=TsrzESlgjkufs/i073VVAOdtv3nD/zy9jmXpKMGE2xpf2iRicfzkSv1XY+hhj6cDJYqED6QVtO5pDLlprJdH/B0v7e/eCaU3KbJ6S9RMUz/36afFxlSAXizuBiHRzScQQDSzjtDL16yFJIprH8y246eomSO4AeErCUqKnVVflp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779937278; c=relaxed/simple;
	bh=f37B4ha2lVZ/zAdX9tU8LH+hLTM/aMteW9Yia6uCh1A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ogkp5jBEkN+7+mH1GJF81oi02PJKyY9+hGrt08pyGaQsq0GeqxVcpGvbqRp/kw6ImYu6AkkILvZHETusEnz+GK3HGIoTFgiGvWDAZL8Qb1vk6RTbk0nEP9paXttI9S2rHTQE2NKyPfo6YM4Ah3NqprGXG8Kk1GSZymhnsCh4QfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BSOK1m1q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BSOK1m1q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661AC1F000E9;
	Thu, 28 May 2026 03:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779937276;
	bh=AziiLhnmYQCEMhVYdBkbk1Z98Dueth5dAF3cZEbw7EU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BSOK1m1qg/XkrYTndb8QFNM/eNvrGFVognEdLMmpAwmShEU7plyIgzQDwAEpk9Grf
	 aTt0xeCo+EgKGC6TIAa3er15IRi1tcfktcONRARlxEcPmeHNjXAB+u0CjF8SEfP3wF
	 14k47LwEkO8DCtR3Jge8qeZLEsUZkln4imo7oP+MQ2Nt6Fgg4VD7Kdx9przBVXoqNX
	 n0jThGCwpEGsnA9L/dOVFVBJpbBiUl6dsLCqZzVAXl9kusZ51ulfbMq03oSn4tBaLb
	 8akfkzc8mFA52Gm/tGSF36QrJkRvOwLGdsmjGY9aSgg0YxYjFSOj3dSQ0QVoPb5xFK
	 JIOL4CclWxQTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] ASoC: imx-rpmsg: Support headphone jack
 detection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chancel Liu" <chancel.liu@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260528020725.2265321-3-chancel.liu@nxp.com>
References: <20260528020725.2265321-3-chancel.liu@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 03:01:16 +0000
Message-Id: <20260528030116.661AC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Headphone jack initialization silently fails on deferred ASoC comp=
onent binding due to a cleared of_node.
- [Low] Redundant property check prevents fallback to singular '-gpio' bind=
ing.

Pre-existing issues:
- [High] Global state corruption by modifying a shared `device_driver`'s PM=
 operations.
--

commit 67115545a4cc25e24605dd54dbe245a56360b94c
Author: Chancel Liu <chancel.liu@nxp.com>

ASoC: imx-rpmsg: Support headphone jack detection

This patch adds headphone jack detection support for i.MX RPMSG audio cards.
It uses simple_util_init_jack() to register a headphone jack with GPIO-based
insertion detection when the "hp-det-gpios" property is present.

[ ... ]

> diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
> index fd4624786b627..48fe471499bac 100644
> --- a/sound/soc/fsl/imx-rpmsg.c
> +++ b/sound/soc/fsl/imx-rpmsg.c

[ ... ]

> @@ -86,6 +88,15 @@ static int imx_rpmsg_late_probe(struct snd_soc_card *c=
ard)
>  	struct device *dev =3D card->dev;
>  	int ret;
> =20
> +	if (of_property_present(card->dev->of_node, "hp-det-gpios")) {

[Severity: Low]
Is this of_property_present() check necessary?

Since simple_util_init_jack() calls gpiod_get_optional(), it already safely
returns 0 without side effects if no GPIO is found. By explicitly checking
for "hp-det-gpios", this prevents initialization if the device tree uses the
singular "hp-det-gpio" property instead, breaking standard gpiolib fallback
semantics.

[Severity: High]
Does this headphone jack initialization fail if ASoC component binding is
deferred?

During probe, the platform device's of_node is temporarily set to the CPU
DAI's of_node. When devm_snd_soc_register_card() is called, if a component
is missing, the ASoC core queues the card for deferred binding. The probe
function then falls through to the failure path and clears pdev->dev.of_node
to NULL.

Later, when the missing component appears and imx_rpmsg_late_probe() is
executed asynchronously, card->dev->of_node will be NULL. Consequently,
this of_property_present() check evaluates to false, and the initialization
is silently skipped.

> +		ret =3D simple_util_init_jack(card, &data->hp_jack,
> +					    1, NULL, "Headphone Jack");
> +		if (ret) {
> +			dev_err(dev, "failed to init hp jack\n");
> +			return ret;
> +		}
> +	}
> +
>  	if (data->lpa) {
>  		struct device_node *codec_np;
>  		struct device_driver *codec_drv;
>  		struct device *codec_dev =3D NULL;

[ ... ]

>  		if (codec_dev) {
>  			codec_drv =3D codec_dev->driver;
>  			if (codec_drv->pm) {
>  				memcpy(&lpa_pm, codec_drv->pm, sizeof(lpa_pm));
>  				lpa_pm.suspend =3D NULL;
>  				lpa_pm.resume =3D NULL;
>  				lpa_pm.freeze =3D NULL;
>  				lpa_pm.thaw =3D NULL;
>  				lpa_pm.poweroff =3D NULL;
>  				lpa_pm.restore =3D NULL;
>  				codec_drv->pm =3D &lpa_pm;

[Severity: High]
This is a pre-existing issue, but does overwriting codec_drv->pm corrupt the
power management operations for all instances of the codec?

The struct device_driver is a shared global structure registered by the cod=
ec
module. By modifying its pm pointer to point to the static global lpa_pm, it
corrupts the power management operations for all instances of that codec ac=
ross
the entire system.

Furthermore, using a single global lpa_pm structure could cause race condit=
ions
if multiple i.MX RPMSG cards are probed concurrently.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528020725.2265=
321-1-chancel.liu@nxp.com?part=3D2
