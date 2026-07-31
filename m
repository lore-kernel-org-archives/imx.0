Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76362EC086
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 08:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785486083; cv=none; b=HUeZgXuY9DOn5VkeVfw6UTX5fi252/Ul87CbiVmy7iRYbbrxDswV2BdVPSXE5bxPVmmiO5tSyjLbjeZsntHlBLVgVnm6KtWAUorZ3kkY2oBg6ItrhQU+peimfRZA/aPc7LCdUWqdMyrkZMDgFNcqhtDimAfbPh3ESsHXFsLJ+ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785486083; c=relaxed/simple;
	bh=n7XcWZLi+N6xwdW9qyEpVL95OUSAEHLQUWD/V1XCOjY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ThgtjVA+UDTXV4HCRuNcNTCCVS4enPi8OoM9qAknOyUFAVhwS0pSyYVygJKkSSDOl5Kc2skIl4XSaSC9Luz9w1uLQ2oBOvLsjFnMg7TOtEcw5TjUBcV6JtSApqMQe2G6qTmamNXJy0/K5zIw5zV80PXqMBHJWOjpq6we4wnns9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fg4VVrE3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fg4VVrE3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3892A1F000E9;
	Fri, 31 Jul 2026 08:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785486081;
	bh=qHC477qArOlNm/AcMHN7rx8NH6hAu2Xu9sljZQvxWog=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fg4VVrE39ljF+A+PKTJ1JY4PER3iY5qvsYglZ9FpCiW831AwUNUDM+iiCEE5AfL3M
	 ub0wE8BhvYtT1SjQnSiOqT/rDRD5GAClUhV17eCIoihqINr5RilDVy0yv23Pq17Gxb
	 TJxKY6mocIECAqM/uWo3o//1koYXdHqMXCKENObQm0ez8uc/Rgixjk4SzL/xkkut6U
	 fi963OeYCfdKAOZajFsPCPiSlztA+RbCezz/00c4XbA+CQulczEDbj7Ry3NV8sB1do
	 LGKFv3KfqGh8qbIkdNQFbqqa9iH+P0PHU51kQWJJVAg+ZKL3SXXJG0wTXyyCFQE9P9
	 JGaBkPsogMQlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/6] phy: fsl-imx8mq-usb: add runtime PM support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: vkoul@kernel.org, olteanv@gmail.com, imx@lists.linux.dev, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260731-imx8mp-usb-phy-improvement-v8-3-2ec8d6b3854d@nxp.com>
References: <20260731-imx8mp-usb-phy-improvement-v8-0-2ec8d6b3854d@nxp.com>
 <20260731-imx8mp-usb-phy-improvement-v8-3-2ec8d6b3854d@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 08:21:20 +0000
Message-Id: <20260731082121.3892A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] TOCTOU race in tca_blk_typec_switch_set() and tca_blk_init() cau=
ses hardware orientation desynchronization.
--

--- Patch [3]: [PATCH v8 3/6] phy: fsl-imx8mq-usb: add runtime PM support -=
--
commit 2932b088ad1c6fda6302f9ed3f5778ccb0da73b9
Author: Xu Yang <xu.yang_2@nxp.com>

phy: fsl-imx8mq-usb: add runtime PM support

This commit adds runtime PM support to ensure the PHY clocks are properly=20
gated when the PHY is not in use, reducing power consumption. Clock
management is shifted from the power_on and power_off callbacks into the
new runtime PM callbacks.

> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/fre=
escale/phy-fsl-imx8mq-usb.c
> index 3a5788c609e1b..42de2cff4d5f3 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
[ ... ]
> @@ -136,17 +137,15 @@ static int tca_blk_typec_switch_set(struct typec_sw=
itch_dev *sw,
>  {
>  	struct imx8mq_usb_phy *imx_phy =3D typec_switch_get_drvdata(sw);
>  	struct tca_blk *tca =3D imx_phy->tca;
> -	int ret;
> =20
>  	if (tca->orientation =3D=3D orientation)
>  		return 0;

[Severity: Medium]
This is a pre-existing issue, but I noticed a potential race condition here.

Does this lockless equality check risk short-circuiting the orientation
switch update if it races with a concurrent initialization?

For instance, if tca_blk_init() is called concurrently during driver probe
or resume, it evaluates tca->orientation locklessly and passes it by value:

tca_blk_init()
    ...
    tca_blk_orientation_set(tca, tca->orientation);

Could tca_blk_typec_switch_set() return 0 here, returning success to the
Type-C core, while the hardware is simultaneously overwritten with a stale
state by tca_blk_init()? This might cause the hardware orientation to become
desynchronized from the Type-C subsystem's expected state, potentially
misrouting USB 3.0 data lines.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-imx8mp-usb=
-phy-improvement-v8-0-2ec8d6b3854d@nxp.com?part=3D3
