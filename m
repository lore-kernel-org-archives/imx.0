Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7529447798B;
	Fri,  2 Oct 2026 09:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932488; cv=none; b=VeJZ56EqMZiJYcjhYrazEDthu0Ihi3RFG2gqgs++/3dMi8BHnAZ0EeIIy8JZebf5HCDn8HnYhcPxOQNVN0Nz5+J8t1snmN2YlKW/M9svGqAQSvZExh/V0OxIYDiWmIenXooeZacHWR4gVrMaypKa/QQb+RJnG9AtMe7h5iZTYEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932488; c=relaxed/simple;
	bh=j3SZEJJTdWffDJ1Fv7QSwsipTPAR0NYJGOKFTP6wsWU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kIfdELk3V7fnOOLTKjifRAWXnJWMvwutLxMUMvY/Vy/5Cx20SRYZl0vg8lPWO+h9zgLj2Psmi/TcWArUTUPNib3TsXXjSNg4/7k9awrWGDRStFbQIBOHDW3W3+aLFPSVJ4pprbphjO1P1lIctDVkOoZj/L8gAW3769OVKInHp4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nd5gUnf/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nd5gUnf/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8F51F00899;
	Fri,  2 Oct 2026 09:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932487;
	bh=uqE41k3WoOozrY7e4V6jIdSC5TRMh7GJBe/zTNIpOoE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nd5gUnf/LPiAS9b9g4HxTBicoT9rgdmEkR++1Muy8XMTO4X3+eZnSH8AdQjRgJZwT
	 6hyhE5rrxRoGkelpYAOGqAMggQfwBBZRvROlesuvaJBx22jnbCUK6RiTNybkCSqjaA
	 waoyRqLhWjRuAr1XKnH3IEfazx25taR9bhkfMXkiLS720uatYnz0DDnuZh5UIlt2Rl
	 dItaCc/Kbg7K231knXgH6MOVp31wTZUFBh+Yqi+WQQ51c+LwPMav0MNzYt+/D+AsbY
	 NQnnt/q6aRa8lpgVOLeTGjLU3vvkOz83p1zIPEfAC93jNtXoyVcYyrjc+bgHgfWx4O
	 NsvIErfzF3Qbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/8] ARM: dts: imx6ul: Add LVDS DT overlay for TQMa6ULxL
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20261002081417.2092471-3-alexander.stein@ew.tq-group.com>
References: <20261002081417.2092471-1-alexander.stein@ew.tq-group.com>
 <20261002081417.2092471-3-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:14:46 +0000
Message-Id: <20261002091447.0E8F51F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] kbuild: wrong base DTB for imx6ul-tqma6ul2l-mba6ulx-lvds-tm070jvhg=
33
--

commit 008daca5167f9a5874f9d9c4e80bdfc8d57fb2cc
Author: Alexander Stein <alexander.stein@ew.tq-group.com>

ARM: dts: imx6ul: Add LVDS DT overlay for TQMa6ULxL

This commit adds the LVDS DT overlay for the TQMa6ULxL board, reusing
the overlay file from the TQMa6ULx board.

> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/i=
mx/Makefile
> index ea0799ba1893e..734d40b8d389c 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> @@ -421,8 +421,10 @@ dtb-$(CONFIG_SOC_IMX6UL) +=3D \
>  	imx6ulz-bsh-smm-m2.dtb
> =20
>  imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33-dtbs +=3D imx6ul-tqma6ul2-mba6u=
lx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
> +imx6ul-tqma6ul2l-mba6ulx-lvds-tm070jvhg33-dtbs +=3D imx6ul-tqma6ul2-mba6=
ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo

[Severity: High]
Should this use imx6ul-tqma6ul2l-mba6ulx.dtb as the base instead of
imx6ul-tqma6ul2-mba6ulx.dtb?

Using the non-L variant base DTB here for the TQMa6ULxL board might boot
the board with incorrect hardware definitions.

> =20
>  dtb-$(CONFIG_SOC_IMX6UL) +=3D 	imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.=
dtb
> +dtb-$(CONFIG_SOC_IMX6UL) +=3D 	imx6ul-tqma6ul2l-mba6ulx-lvds-tm070jvhg33=
.dtb

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002081417.2092=
471-1-alexander.stein@ew.tq-group.com?part=3D2
