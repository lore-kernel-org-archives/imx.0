Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59EE3128D7
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 08:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785485977; cv=none; b=ibRMvDxGYeisSHtSrlYdWYX+kcg+Gp26NigxsJb8dDoG+ygYCQeO0ZD8YI8V2cxmpd1pN5rULkqoVJCh1UPF10cgkCGFTQhmF2iuXH78Pjx63I71MVpMo5jLNB1QAM/P1umtwyGqnuMvIzlkWMe/mGaSsRMjGdm0jRw7VwCirHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785485977; c=relaxed/simple;
	bh=5k9Dvuq5L5JdbLos/gBglhe0V7o/rcPH6IRWTDAVxqQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LQvw5UR4uXV9HMqkGUf/5E7FyXz+RuDssPg8SwRoWtVnTks3UIcqbwgi3BZKpa2d8SXQRvaqcnzKDsFDpqu9J1Xn89+ZJPk/HpJSNOxJ0EPaVFW6yGsZ/5hJAe20lxusp+E/wwhIt9hvsschoh84uzDVD3xkDZwrsf0TGayJwZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d5IFK89Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d5IFK89Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ABF41F000E9;
	Fri, 31 Jul 2026 08:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785485974;
	bh=Sm1aurHLJz4Ko3R6CdTMGHXFMOX+9IYL+HfV7dGOgE8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d5IFK89Qtt/iFMGuo8sJheqlXVM46rKycLPsjQnhwD5y68mik0Tv/xIYgT+ewW+06
	 Fqr0B4yzbEI0UBuvrVh0X3AufdHhr/N8Og/5nlQXc044g1vHutwpHEyns2acmomTqH
	 9fWm1pqCZEdIAPSoa5T0m+mZOY2tEyrddH4jXFT/szoYnpeqACm0bLKhBwIbdI6VYt
	 728hhwt56+62R51iiTq+k3EeuU7sfA/wpxTbS0MkG66hVZu3bDLU+hBzuAdwI1cZwu
	 9tvuFRiTQGIxzofYZpUvHEE0wQxCbeKYKR05P+a7NfBQukTuiooHqWCpCa/51+WUGv
	 H3w4YnjThinWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/6] phy: fsl-imx8mq-usb: fix typec switch leak on
 probe error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: Frank.Li@kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, imx@lists.linux.dev, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20260731-imx8mp-usb-phy-improvement-v8-1-2ec8d6b3854d@nxp.com>
References: <20260731-imx8mp-usb-phy-improvement-v8-0-2ec8d6b3854d@nxp.com>
 <20260731-imx8mp-usb-phy-improvement-v8-1-2ec8d6b3854d@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 08:19:33 +0000
Message-Id: <20260731081934.1ABF41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pre-existing race condition where `imx_phy->tca` is dereferenced b=
y the Type-C switch's `.set()` callback before it is actually assigned in t=
he probe path.
- [High] Lifetime mismatch between the devres-allocated provider data and t=
he registered typec switch callback, leading to Use-After-Free.
--

--- Patch [1]: [PATCH v8 1/6] phy: fsl-imx8mq-usb: fix typec switch leak on=
 probe error path ---
commit c464d7a13f05d9153fb1007a61d8f4290d1a196f
Author: Felix Gu <ustc.gu@gmail.com>

phy: fsl-imx8mq-usb: fix typec switch leak on probe error path

This commit fixes a typec switch leak when probe fails after
imx95_usb_phy_get_tca() succeeds. It uses devm_add_action_or_reset()
so the switch is cleaned up on both probe failure and driver removal.

> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/fre=
escale/phy-fsl-imx8mq-usb.c
> index b05d80e849a14..9a33c06d6fc39 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c

[ ... ]

> @@ -266,17 +267,11 @@ static struct tca_blk *imx95_usb_phy_get_tca(struct=
 platform_device *pdev,
>  	tca->orientation =3D TYPEC_ORIENTATION_NORMAL;
>  	tca->sw =3D tca_blk_get_typec_switch(pdev, imx_phy);

[Severity: High]
This is a pre-existing issue, but does registering the switch here expose i=
t=20
to consumers before we are fully initialized?

By registering the switch in tca_blk_get_typec_switch(), the device becomes
immediately discoverable. If a consumer acquires it and invokes the callbac=
k:

tca_blk_typec_switch_set()
   struct tca_blk *tca =3D imx_phy->tca;
   ...
   if (tca->orientation =3D=3D orientation)

Since imx_phy->tca is not assigned until imx8mq_usb_phy_probe() finishes
handling the return from imx95_usb_phy_get_tca(), won't this cause a NULL
pointer dereference if the callback is invoked during this window?

> =20
> -	return tca;
> -}
> -
> -static void imx95_usb_phy_put_tca(struct imx8mq_usb_phy *imx_phy)
> -{
> -	struct tca_blk *tca =3D imx_phy->tca;
> -
> -	if (!tca)
> -		return;
> +	ret =3D devm_add_action_or_reset(&pdev->dev, tca_blk_put_typec_switch, =
tca->sw);

[Severity: High]
This is also a pre-existing issue, but does using devres to unregister the=
=20
switch introduce a potential use-after-free?

If a consumer driver (like TCPM) obtains a reference to the switch, and the
PHY driver is subsequently unbound or probe fails:

1. devres calls tca_blk_put_typec_switch() to unregister the switch.

2. typec_switch_unregister() removes the device from sysfs and drops the=20
   provider's reference, but the consumer's reference keeps the sw_dev=20
   alive.

3. devres then frees the provider data (imx_phy) which was allocated with=20
   devm_kzalloc().

If the consumer later calls typec_switch_set(), the callback will access
imx_phy->tca, which has already been freed. Could this lead to memory
corruption?

> +	if (ret)
> +		return ERR_PTR(ret);
> =20
> -	tca_blk_put_typec_switch(tca->sw);
> +	return tca;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-imx8mp-usb=
-phy-improvement-v8-0-2ec8d6b3854d@nxp.com?part=3D1
