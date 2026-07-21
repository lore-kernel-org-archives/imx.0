Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7534F42D750;
	Tue, 21 Jul 2026 09:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625966; cv=none; b=mXrMiiWmnTCfao+Lc9+xZBWVUEv9dFcMLQF2n6VA3VbsCNnCTrsoi890t+GbG7Xd5o5C1OomiwIHiQPe2w3+RQPic5iycEW7e3Vl8hqgNDti3Cg6EAWUGQb6ow8lWZssN9nEkluUYWW+n6bCmuElybD+3pN2RiuOQX9bQvOvlig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625966; c=relaxed/simple;
	bh=eqw7g09hPKNYRdKS1Fku7qVQ8Eh+wXwmiYXrqZfCSEs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TcKtbrHo34o8Itz4lQBMr102mUOKEpQ8tV8fGRHNcFMCVDjCYlXj9PFQ9pWgco/xKFCOwty2XrAgRLsvzrMAxy42Al/NEHuVgi3jy0LlsR8d3PtKamI80/PqfX716RqxnizRKxr5BAU7/zs1h5dTRieejMlOLTlihnQyBiEQ6Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jGfASbJ6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jGfASbJ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16FD41F00A3A;
	Tue, 21 Jul 2026 09:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784625965;
	bh=fXLG2YX580lqBehxCNaw2qWzwIi+bOW0ZBOk+41UPus=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jGfASbJ655HHeFPEIXDyAUCDlg3vpkbmnVdiGgpaB0PNg5aLCMfo1aQixUASjzFu3
	 9rj5wJbK2DPfnxcKmaxjhe7r20kyOJymZ2eUoqjUUBUrldtDmuLu5aKVlXXnbMKewd
	 SSos8ATAYhRusa7Rb5yLk3+RPp/UhNTRV92KhGT0XVfflxJ/r0VDXQ3/KhqPHfUhnc
	 dA2m0Nudt499e/RKegl6EaHyO5gPvt84sriClC6WtAT1wRD5A7R6J5MG5sgvJjFGXs
	 jkvGOcZNE74BGGN16b6As387P/DV7AraxFzS2UKYHQRxqw2Yq3TVkeMRpBnsui4MTt
	 7dQ0vavnbKq4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/8] net: bcmgenet: use platform_device_set_fwnode()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: lee@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, mfd@lists.linux.dev
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-4-2dee93f42c54@oss.qualcomm.com>
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
 <20260720-pdev-set-fwnode-instead-of-of-node-v1-4-2dee93f42c54@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 09:26:03 +0000
Message-Id: <20260721092605.16FD41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The static function `bcmgenet_mii_of_find_mdio()` becomes completel=
y unreferenced and triggers a compiler warning (`-Wunused-function`) when `=
CONFIG_OF` is disabled.
--

--- Patch [4]: [PATCH 4/8] net: bcmgenet: use platform_device_set_fwnode() =
---
commit 91caf438269ceae68bf14d692c72b6702b3b3004
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

net: bcmgenet: use platform_device_set_fwnode()

This patch changes dynamically allocated platform devices to use the
higher-level platform_device_set_fwnode() rather than the OF-specific
platform_device_set_of_node().

> diff --git a/drivers/net/ethernet/broadcom/genet/bcmmii.c b/drivers/net/e=
thernet/broadcom/genet/bcmmii.c
> index 0f0dbabfaabbc..6f471723bd53f 100644
> --- a/drivers/net/ethernet/broadcom/genet/bcmmii.c
> +++ b/drivers/net/ethernet/broadcom/genet/bcmmii.c
[ ... ]
> @@ -492,7 +492,8 @@ static int bcmgenet_mii_register(struct bcmgenet_priv=
 *priv)
>  	ppdev->dev.parent =3D &pdev->dev;
> =20
>  	if (dn)
> -		platform_device_set_of_node(ppdev, bcmgenet_mii_of_find_mdio(priv));
> +		platform_device_set_fwnode(ppdev,
> +					   of_fwnode_handle(bcmgenet_mii_of_find_mdio(priv)));

[Severity: Low]
Will this cause a -Wunused-function warning for bcmgenet_mii_of_find_mdio()
when CONFIG_OF is disabled?

When CONFIG_OF is not set, include/linux/of.h defines of_fwnode_handle(node)
as just NULL. Because the macro discards its argument during preprocessing,
the call to bcmgenet_mii_of_find_mdio() is completely dropped, leaving the
static function unreferenced in this configuration.

Should bcmgenet_mii_of_find_mdio() be marked with __maybe_unused to prevent
build failures on setups using -Werror?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-pdev-set-f=
wnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com?part=3D4
