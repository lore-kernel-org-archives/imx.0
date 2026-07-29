Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799BA43C7C3;
	Wed, 29 Jul 2026 22:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785362806; cv=none; b=QNPsTwd2vJjSweC+nVSHHrwQe+qgKbYImlQWbMTmZwhWn3ZP2tIxEJ2ylW9e3ejS/EiUh6qCRbVi4Y1MOMykqEWsBwmjkBzFYtgRzuxvXjsGPihqjY7CgNxQgKOuGWmITxG8bLhRp/QJ6WkfPJ9fYM1Kwd01LITb6dTcT7l4zzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785362806; c=relaxed/simple;
	bh=ZIjZpQaDkHJQFQ0Jj02qiSlwPPUj2tUXHh2nU8+XW24=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ay7WXVDXELKoAyHBzybylLVfka8nHV8TVeR22xGrHFgB0P2XanpoCPZZXpdLPwo/j/vCrnX05pAnM7vQBFuUgXCaXbFYWIupnzcN7TFGbnZxTOG3Tlp8HbpREopBezL1sgCkbzGwVSi7yR50nGbzyeWk4p0+Mm11l9tuj5pHzX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NR+LlCyM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NR+LlCyM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AEC31F000E9;
	Wed, 29 Jul 2026 22:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785362795;
	bh=s1yVBj90xwhF0mjXk/9IVq12UtERshwZJrpGalNdZ2s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NR+LlCyMWEY3+RfQG50i3Hso+FJLS8pmN2k2ADGd1HpasZlIUNx+nMZRL+hs3HVCJ
	 sQ4CcZGQdOU/wOISPsoflGK/Y62vPqkuvnOEUns0XGe1qle56gLdvMMRn6uP8q3pnl
	 PLDfRcovQTqJnSQ4Ppbi/qvwOUJrlPq29oknic8CaGuOsFLNdFUoFt3G/ROONcUzjf
	 PFhvWxn9bo6WFEZfo+Swwm+epIpmdTMqpOZ+qlV2+Niz9STvJWy9YVtn0+x0U5IsEl
	 h2Lhim7IMAHPASMH9D355vi5T27630mArt92FUSec7/xZZPUIvgVd6Db2OLGhNvkQK
	 kLc7hIvIw6Zig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/7] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for
 Data Modul i.MX8M Mini and Plus eDM SBC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260729214723.557461-2-marex@nabladev.com>
References: <20260729214723.557461-1-marex@nabladev.com>
 <20260729214723.557461-2-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 22:06:34 +0000
Message-Id: <20260729220634.9AEC31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Incorrect backlight enable GPIO and pinctrl applied for the g215=
hvn011 panel on the native i.MX8MP LVDS interface.
- [Medium] The `assigned-clock-rates` property in `&media_blk_ctrl` lacks t=
he required `assigned-clocks` property, causing the LVDS panel clock config=
uration to be silently ignored.
--

--- Patch [2]: [PATCH v7 2/7] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for=
 Data Modul i.MX8M Mini and Plus eDM SBC ---
commit 57ce2b382e55c1c98951209e8e0a8f4ea3f2c65c
Author: Marek Vasut <marex@nabladev.com>

arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Pl=
us eDM SBC

This patch adds DT overlays for the DSI-to-LVDS adapter populated with a
Lontium LT9211 bridge on Data Modul i.MX8M Mini and Plus eDM SBCs. It
supports multiple panels for both the bridge and native i.MX8MP LVDS
interfaces.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-lvds-g215hvn011.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-=
edm-sbc-overlay-lvds-g215hvn011.dtsi
> new file mode 100644
> index 0000000000000..3585170bd59dd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvd=
s-g215hvn011.dtsi
> @@ -0,0 +1,30 @@
[ ... ]
> +&backlight {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_panel_backlight>;
> +	enable-gpios =3D <&gpio3 0 GPIO_ACTIVE_HIGH>;
> +	/* 6.5 POWER ON/OFF SEQUENCE, T6 >=3D 10 ms */

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-over=
lay-edm-sbc-imx8mp-lvds-g215hvn011.dtso b/arch/arm64/boot/dts/freescale/imx=
8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso
> new file mode 100644
> index 0000000000000..a6d13c3609796
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm=
-sbc-imx8mp-lvds-g215hvn011.dtso
> @@ -0,0 +1,36 @@
[ ... ]
> +&backlight {
> +	power-supply =3D <&reg_panel_bl_supply>;
> +};

[Severity: Medium]
Will this result in the wrong GPIO being toggled for the native i.MX8MP LVDS
interface?

The shared imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi file hard=
codes
enable-gpios to &gpio3 0 and defines a pinctrl. However, the native i.MX8MP
LVDS interface uses the IO expander's &gpiowifi 0 (via reg_panel_bl in
edm-sbc-imx8mp-lvds.dtsi).=20

Since this overlay only overrides power-supply and does not remove the
inapplicable pinctrl or override enable-gpios, won't the backlight driver
toggle the incorrect baseboard adapter GPIO pin instead of the intended one?

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-over=
lay-edm-sbc-imx8mp-lvds-g101ice-l01.dtso b/arch/arm64/boot/dts/freescale/im=
x8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g101ice-l01.dtso
> new file mode 100644
> index 0000000000000..817d4ec62d0e8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm=
-sbc-imx8mp-lvds-g101ice-l01.dtso
> @@ -0,0 +1,24 @@
[ ... ]
> +&media_blk_ctrl {
> +	/*
> +	 * The G101ICE-L01 panel requires 71.1 MHz LVDS clock.
> +	 * Set IMX8MP_VIDEO_PLL1 to 497.7 MHz , since 497.7 MHz / 7 =3D 71.1 MH=
z .
> +	 */
> +	assigned-clock-rates =3D <500000000>, <200000000>,
> +			       <0>, <0>, <500000000>, <497700000>;
> +};

[Severity: Medium]
Will this clock configuration be silently ignored by the clock framework?

This overlay (and several others for the native LVDS interface) defines
assigned-clock-rates without providing or inheriting an accompanying
assigned-clocks array.

The base board file imx8mp-data-modul-edm-sbc.dts does not include
imx8mp-nominal.dtsi, where the assigned-clocks array is typically defined.=
=20

When assigned-clocks is missing, of_parse_phandle_with_args() returns -ENOE=
NT,
and __set_clk_rates() silently skips setting the rates. Should assigned-clo=
cks
be explicitly defined here so the panel clock frequency is correctly set?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729214723.5574=
61-1-marex@nabladev.com?part=3D2
