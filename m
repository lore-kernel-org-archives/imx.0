Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB43E38CFED;
	Mon, 10 Aug 2026 18:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385493; cv=none; b=hYrRli+viT+iqYSgdRy3jAjmwXOPzQEOeeD3EciMigLcHCEqMiiFSHUn/0zVMemyfXGM9e63r9xwnSwHpc69pu5cLoie3i3poFc7bxRSeU3nKI+8PQaCu2sbguHOdGiTr9NAbgbxc+vohcw6wHMfgVctMyzkzyq6iYSQtZkYLAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385493; c=relaxed/simple;
	bh=heCtpCzkANyhlU5fizbsCab1SmgkihIwmwisItapitk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GFH/KnXoStrjMUyy1SCL/krEPrHPrddit1byA0sRmihUgAmu5zkwzahbptD+Hp42LHyas9zwmyPw9AyTuiBmxdhr9Vfu/aNNjyTieprOOw3tUR/xkLXKIkaBkTW24GXsKXdkjS+bbnXEry/pDw4OxbNRiFvPcFXCJjcukHgMYY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IUBvcIA1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IUBvcIA1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29A691F000E9;
	Mon, 10 Aug 2026 18:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786385491;
	bh=D6TX/9LyL1eS+5/jXDkAhG9bK+yYQ6SySzT1s0P1K9M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IUBvcIA13ucoJ91F1HZFQPyXNn3zm67cpxKfFkuqwc1M5DTKYgRMKm6+p0RbP9M5W
	 ORI/Z+TG78HBYuQCrY4HvXRZt+2NJsShXVlgSnb+hx5AuYHEzl20F/dxeEBZ8feOmC
	 ej9ydT3jDg0ur3UWsckLVSBLhI7OzmBuxl2VSvUcr4rstdiEglpICIsdUltyZ6tDFo
	 N7iUCINaBARl2c9VOML6K9eLxcis0HzFhzqOnxPQW7Ij3RGiowzpHrVDIhpez4Hglz
	 VuDfLJuvvtNwCJiaqYxI4yzErgPzIHQeimvAS9bwciiDPKGrLGH3/HBOTvPOtAz4Xe
	 ztoEvTmkUYhKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/7] ARM: dts: nxp: imx6qdl-wandboard: Replace
 clock-frequency in camera sensor node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Cc: imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260810180604.3034255-8-laurent.pinchart@ideasonboard.com>
References: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
 <20260810180604.3034255-8-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:11:30 +0000
Message-Id: <20260810181131.29A691F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch introduces a blank line in the device tree node, directly=
 contradicting the "Changes since v1" section of the commit message which s=
tates "- Drop added blank line".
--

--- Patch [7]: [PATCH v3 7/7] ARM: dts: nxp: imx6qdl-wandboard: Replace clo=
ck-frequency in camera sensor node ---
commit c2dd0680ebe87860961c5447228271fe2e5bfa7b
Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

ARM: dts: nxp: imx6qdl-wandboard: Replace clock-frequency in camera sensor =
node

This commit replaces the deprecated clock-frequency property with
assigned-clocks and assigned-clock-rates for the camera sensor node
in the device tree.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi b/arch/arm/=
boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
> index 26489eccd5fbe..f3aaca039953b 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
> @@ -137,7 +137,9 @@ camera@3c {
>  		pinctrl-0 =3D <&pinctrl_ov5645>;
>  		reg =3D <0x3c>;
>  		clocks =3D <&clks IMX6QDL_CLK_CKO2>;
> -		clock-frequency =3D <24000000>;
> +		assigned-clocks =3D <&clks IMX6QDL_CLK_CKO2>;
> +		assigned-clock-rates =3D <24000000>;
> +

[Severity: Low]
This isn't a bug, but the "Changes since v1" section of the commit message
states "- Drop added blank line". It looks like the blank line was still
accidentally included here in the camera@3c node. Should this line be remov=
ed
to match the changelog?

>  		vdddo-supply =3D <&reg_1p8v>;
>  		vdda-supply =3D <&reg_2p8v>;
>  		vddd-supply =3D <&reg_1p5v>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810180604.3034=
255-1-laurent.pinchart@ideasonboard.com?part=3D7
