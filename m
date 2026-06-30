Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01FF3EF65F
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 10:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815497; cv=none; b=hH2m0lBRvK+qTSubY7gzefvnXZY4EuISEgRS6QO2DWKMt2H7LvxzCT9+061lzbygGrp7poRlV/pxoWG0PwN7q4QG/x2vGnY4p1TnMTy9iGRbJ2Y61bK1TkXroD5EyzPz0nOuMruGuw5NNyNliazxP9amRs7Pl78dLGphdyXNGV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815497; c=relaxed/simple;
	bh=0RRzRPhbFIQYeZLb/QZl8vyndfvLiQXvIdmRb238oVY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WRpNqEockqlunMOXdsEDDhpIpexQlWsFzM5JRFLzMqDmjPT6EcmsPBD8ZjHdxSnAiLRisfUYV7YRZE40NNhhEdg2fq4i50sZbEQRDipKvTVsVFha0IKzsd4IxhRcL9uG2mMgTHtEiQl5IuK9AdlFOIyo08cQGUOxHTuQbRBqWCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CmQ88Nsp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CmQ88Nsp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BECBC1F000E9;
	Tue, 30 Jun 2026 10:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782815496;
	bh=b14d/IpRs75D1LuW5UO7rbgBPeqHh4b7fdVDGwyJqXs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CmQ88Nsp4KhnTTOW9nm4kpBlaHaqUM5oBB2/jjBU8lljPxQHNymEnUbieXpObwEG4
	 GU5wHAOZ9NBZJjqUiQ4NIN0B2eN3FoHVkGPkTLVT9MRWeQxCjI3RM9RMkzLYgBSRTK
	 MCkrm4KX8AUdYx92+Gs+l2Iih3LoCbnu7AR4Aa8btyVtk6p/ACl/GnB2wCq31T/TFh
	 YaRkcBvCqqpq0JeXShGEmSeq3yNa9hlWRs7ftkZ8PertR8qZIbM4RAazKq0v0iPhqH
	 ZrR7wNUco8yy/vT+s/GOxD7vuqF2taIADEcmWg49CtT6uCBPkkDiWOtRNhID4R+vdX
	 F74jW8HJOuQEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/5] phy: fsl-imx8mq-usb: fix typec switch leak on
 probe error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: linux-phy@lists.infradead.org, Frank.Li@kernel.org, vkoul@kernel.org, imx@lists.linux.dev, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20260630-imx8mp-usb-phy-improvement-v5-1-25d616403844@nxp.com>
References: <20260630-imx8mp-usb-phy-improvement-v5-0-25d616403844@nxp.com>
 <20260630-imx8mp-usb-phy-improvement-v5-1-25d616403844@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 10:31:35 +0000
Message-Id: <20260630103135.BECBC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Race condition causing NULL pointer dereference during device prob=
e.
- [High] Use-After-Free of devm-allocated driver data during device unbind.
--

commit d64f34cfc15d26f577e5ff3a17572cf971e65696
Author: Felix Gu <ustc.gu@gmail.com>

phy: fsl-imx8mq-usb: fix typec switch leak on probe error path

If probe fails after imx95_usb_phy_get_tca() succeeds, the typec
switch leaks because the only cleanup path was in .remove, which
never runs on probe failure. Use devm_add_action_or_reset() so the
switch is cleaned up on both probe failure and driver removal.

> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/fre=
escale/phy-fsl-imx8mq-usb.c
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
[ ... ]
> @@ -266,17 +267,11 @@ static struct tca_blk *imx95_usb_phy_get_tca(struct=
 platform_device *pdev,
>  	tca->orientation =3D TYPEC_ORIENTATION_NORMAL;
>  	tca->sw =3D tca_blk_get_typec_switch(pdev, imx_phy);

[Severity: High]
This is a pre-existing issue, but does this code introduce a race
condition during probe?

When tca_blk_get_typec_switch() registers the switch, it is immediately
visible to consumers. However, imx_phy->tca has not been assigned yet.
It is only assigned after returning from imx95_usb_phy_get_tca() in
imx8mq_usb_phy_probe().

If a consumer concurrently finds the switch and calls typec_switch_set(),
tca_blk_typec_switch_set() will access imx_phy->tca->orientation,
dereferencing a NULL pointer.

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
This is a pre-existing issue, but could this devm cleanup lead to a
use-after-free during driver unbind?

The imx_phy and tca structures are allocated via devm_kzalloc(). During
unbind, this devres action will execute tca_blk_put_typec_switch(), which
calls typec_switch_unregister().

While typec_switch_unregister() unlinks the device, if a consumer still
holds a reference to the switch, the object itself will outlive the driver
unbind. Since devres immediately frees imx_phy and tca after the action
returns, any subsequent call to tca_blk_typec_switch_set() by the active
consumer will access freed memory.

> +	if (ret)
> +		return ERR_PTR(ret);
> =20
> -	tca_blk_put_typec_switch(tca->sw);
> +	return tca;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630-imx8mp-usb=
-phy-improvement-v5-0-25d616403844@nxp.com?part=3D1
