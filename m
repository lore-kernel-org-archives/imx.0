Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95206388873;
	Thu, 16 Jul 2026 06:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784182227; cv=none; b=lyvF/cF2AoG6yPivUyQysuWk5zk+2Suj2A6KxZ+rUlt8dY7qZCuAcR1IGn/UeyGxrJJu8BhYThsBOl4jNPkxBYjIdInz76eQsdsOVpopxn4VrQfsP/lOCIgwdI0Fe0M9ATT40ukKps8SwsOJp52PSZ2xGcjLgEMQsFX7yX4ZQcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784182227; c=relaxed/simple;
	bh=Uh6ABBfZPdPXWpURmFrvQMBPfZHc5wIrvXxd7jUZ69Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L1HkoNSuVGMubJuzmiOeJQnOlwqgRvCYUpaRQDNptwwRg029408ltIQdnJ9jiJ+ANMzm4QvWdui6lDQRcYqUPY++eFZLXVZyah6m6cfHxhCSd+oTrsM0mBs0XCc2kAE9lb5Cu1dNaqmnBXG1jScHHskl+cJKw/0j51RwOkMoo/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BE6Nz2QD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BE6Nz2QD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5BB61F000E9;
	Thu, 16 Jul 2026 06:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784182225;
	bh=U+9XFx9k+wgvnqOWHVT7g8LYfMgceZCCgTS/1XFdPII=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BE6Nz2QDpJYKqifD840lp/kfJZO1ZUTSbpBH4MRBzXVEj0pi3kFkavgY08mE4MnME
	 7Bn+AZF1g2vq7UkEwCP08qFR5oo0QmAUGM6SLCMMFaAVL1XD99J4oi7TCSI8LNMGTx
	 Q0Y8IZ8/QzYyh13bbzRhTJ3lQm8k7t3JIQcOLuDOoQzRURYGmxY7g2J5vteo3cNN87
	 yZKcSg72aFzC5SGsIjGSHIO6XccfnQau6r5V605CTlPmMh72gtyOyyPoSbMD/OLNkL
	 +wCA8uLIeF8BjA4UFCfQ8oBoT83CkH3+Pik9y3bGrfYqSfPf/evHDQrNpveelSRNMW
	 6WwqqIXYAw43Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/6] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for
 Data Modul i.MX8M Mini and Plus eDM SBC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260716055751.279033-1-marex@nabladev.com>
References: <20260716055751.279033-1-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 06:10:24 +0000
Message-Id: <20260716061024.B5BB61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] The backlight enable GPIO is hardcoded for the i.MX8MM adapter in =
the G215HVN011 panel overlay, breaking the backlight on the i.MX8MP native =
LVDS board.
- [Medium] Incorrect voltage mapping for state 0x3 in the AP63300 regulator=
 configuration, which could lead to severe overvoltage.
- [Medium] The common abstraction file contains an adapter-specific danglin=
g phandle reference to `&gpio_display`.
- [Low] The patch modifies a core SoC file (`imx8mp.dtsi`) to add the `spba=
5` label, which is undocumented in the commit message.
- [Low] The MP2328 voltage divider calculation comment is mathematically in=
correct for the specified resistors.
- [Low] The MIPI DSI burst-clock-frequency comment for the G215HVN01.1 pane=
l is incorrect.
--

--- Patch [1]: [PATCH v5 1/6] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for=
 Data Modul i.MX8M Mini and Plus eDM SBC ---
commit 0857188ec12e2f2c2c27ef0295f8548ec44a3213
Author: Marek Vasut <marex@nabladev.com>
arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Pl=
us eDM SBC

This commit adds device tree overlays for the DSI-to-LVDS adapter=20
eDM-MOD-iMX8Mm-LVDS populated with Lontium LT9211 bridge. It provides=20
support for multiple panels and is intended for use with both the=20
i.MX8M Mini and i.MX8M Plus eDM SBCs.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-edm-mod-imx8mm-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-=
modul-edm-sbc-overlay-edm-mod-imx8mm-common.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm=
-mod-imx8mm-common.dtsi
[ ... ]
> +	reg_backlight_pwm_level: regulator-backlight-pwm-level {
> +		compatible =3D "regulator-gpio";
> +		regulator-name =3D "Backlight_SEL_PWM";
> +		regulator-type =3D "voltage";
> +		gpios =3D <&gpio_display 2 GPIO_ACTIVE_HIGH>; /* SEL_PWM */

[Severity: Medium]
Does this create a dangling phandle reference when included by the native=20
i.MX8MP adapter overlay? It looks like gpio_display is undefined in that=20
context, which might inject a leaky abstraction into the common file.

[ ... ]
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-edm-mod-imx8mm-lvds-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-=
data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-common.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm=
-mod-imx8mm-lvds-common.dtsi
[ ... ]
> +&reg_panel_vcc {
> +	/*
> +	 * AP63300 voltage divider settings:
> +	 *   R1=3D16k2
> +	 *   R2=3D5k23 with optional series Rs=3D7k68 (5V) or Rt=3D1k5 (12V)
> +	 *
> +	 * 1 / Rx =3D (1 / R2) [ + (1 / Rs)][ + (1 / Rt)]
> +	 * Vout =3D 0.8 * ((R1 / Rx) + 1)
> +	 */
> +	gpios =3D <&gpio_display 1 GPIO_ACTIVE_HIGH>,	/* 5V */
> +		<&gpio_display 0 GPIO_ACTIVE_HIGH>;	/* 12V */
> +	states =3D <3300000 0x0>,
> +		 <5000000 0x1>,
> +		 <12000000 0x2>,
> +		 <3900000 0x3>;

[Severity: Medium]
Is the state mapping for 0x3 safe to leave at 3900000? Based on the=20
hardware calculations, it appears this state would actually output around=20
13.6V. Could this lead to severe overvoltage and hardware damage if a=20
future panel requests 3.9V and the regulator framework switches to this=20
state?

> +};

[ ... ]
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-edm-mod-imx8mm-lvds-g215hvn011.dtsi b/arch/arm64/boot/dts/freescale/imx=
8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm=
-mod-imx8mm-lvds-g215hvn011.dtsi
[ ... ]
> +&mipi_dsi {
> +	samsung,burst-clock-frequency =3D <864000000>;	/* RX ByteClock ~27 MHz =
*/

[Severity: Low]
Is the comment regarding the RX ByteClock frequency accurate here? An=20
864 MHz burst clock usually yields a byte clock of 108 MHz rather than=20
27 MHz.

[ ... ]
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-lvds-g215hvn011.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-=
edm-sbc-overlay-lvds-g215hvn011.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvd=
s-g215hvn011.dtsi
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2022-2026 Marek Vasut
> + */
> +
> +#include "imx8mm-data-modul-edm-sbc-overlay-lvds-5v0.dtsi"
> +#include "imx8mm-data-modul-edm-sbc-overlay-lvds-dual.dtsi"
> +
> +&backlight {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_panel_backlight>;
> +	enable-gpios =3D <&gpio3 0 GPIO_ACTIVE_HIGH>;

[Severity: High]
Does hardcoding this i.MX8MM-specific GPIO break the backlight when this=20
overlay is used on the native i.MX8MP LVDS board? It seems this bypasses=20
the abstract reg_panel_bl regulator. When the i.MX8MP overlay includes=20
this file, it overrides the power supply but does not override this=20
enable-gpios property, potentially causing it to toggle the wrong pin.

[ ... ]
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-over=
lay-edm-sbc-imx8mp-lvds-g215hvn011.dtso b/arch/arm64/boot/dts/freescale/imx=
8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm=
-sbc-imx8mp-lvds-g215hvn011.dtso
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2023-2026 Marek Vasut
> + */
> +
> +#include "imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi"
> +#include "imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi"
> +
> +&backlight {
> +	power-supply =3D <&reg_panel_bl_supply>;
> +};

[Severity: High]
(Related to the previous point) Should this also override enable-gpios to=20
prevent the i.MX8MM specific pin from being inherited?

[ ... ]
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-over=
lay-edm-sbc-imx8mp-lvds.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-data-mo=
dul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm=
-sbc-imx8mp-lvds.dtsi
[ ... ]
> +&{/} {
> +	reg_panel_bl_supply: regulator-panel-bl-supply {
> +		compatible =3D "regulator-gpio";
> +		regulator-type =3D "voltage";
> +		regulator-name =3D "PANEL_BL_SUPPLY";
> +		enable-gpios =3D <&gpiolvds 0 0>;
> +		enable-active-high;
> +		status =3D "okay";
> +
> +		/*
> +		 * MP2328 voltage divider settings:
> +		 *   R1=3D51k1
> +		 *   R2=3D5k62 with optional series Rs=3D2k21 (12V)
> +		 *
> +		 * 1 / Rx =3D (1 / R2) [ + (1 / Rs)][ + (1 / Rt)]
> +		 * Vout =3D 0.5 + ((R1 / Rx) * 0.5)
> +		 */

[Severity: Low]
Is the mathematical formula in this comment accurate for this circuit?
If the resistors were placed in parallel, the formula=20
1 / Rx =3D (1 / R2) + (1 / Rs) with R1=3D51.1k, R2=3D5.62k, and Rs=3D2.21k =
would=20
yield 16.6V instead of 12V. Does the hardware actually switch between the=20
resistors rather than placing them in parallel?

[ ... ]
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index 90d7bb8f5619e..42a3216daed44 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1437,7 +1437,7 @@ aips5: bus@30df0000 {
>  			#access-controller-cells =3D <3>;
>  			ranges =3D <0x30c00000 0x30c00000 0x400000>;
> =20
> -			spba-bus@30c00000 {
> +			spba5: spba-bus@30c00000 {
>  				compatible =3D "fsl,spba-bus", "simple-bus";
>  				reg =3D <0x30c00000 0x100000>;
>  				#address-cells =3D <1>;

[Severity: Low]
Could this core SoC DTSI modification be split into a separate patch?
Adding the spba5 label here modifies a common architectural file silently=20
during a board-level overlay patch, and it does not appear to be=20
mentioned in the commit message.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716055751.2790=
33-1-marex@nabladev.com?part=3D1
