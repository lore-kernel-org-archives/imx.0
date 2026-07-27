Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC0B22126D;
	Mon, 27 Jul 2026 20:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785182837; cv=none; b=F40ev4bv4bUvx7L9hYRG743fJgQ7hRZwVNifE8m8NXua71snG+TFhO0K3q16eIVGasIB/NhbXsHWfGrgXQk6LhxC0xW03xQ23KNWS/FG94tAJxeplS63NgWPPcMDS0oAc5g0Mb3pzPZ2ROlsll3yo2o20VA2qOG131+0Hw3g46o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785182837; c=relaxed/simple;
	bh=Qnz8SMPUZ6MdQlPCqt9WXaRawu+zOqenWJO2E38hn74=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kKiz8t1c5A/Gcn+XBuDEWaIhJWay/PT64SCtCfaRupYPwoCPpa8es65f3t2gXMsyHGTDDTuhMIz8yvO00feafmenfMO/5sgKBIH1m00DK6iBIiDPTchdDrQfWvD1ArbBM/un1G5mToQkBfxAs3gU/jHJXNrFiUeyQoXmKA32/Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kwr0hquf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kwr0hquf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0031F000E9;
	Mon, 27 Jul 2026 20:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785182836;
	bh=0IhF6oSBGuyMTgVn5pKmn0D6Y7FfurywlD8KlgQm9Hw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kwr0hqufev4qIcQS2TpVrwT1lXdhJGr/S8GUR9sAgqOc6DblIs+STo2gWR9FLm8H9
	 szANISWy3t7qQZnzqYmrExRTsfVzd3LM76nRDveYamr3PWG4kFSSbcdjkwuWp0w4Uy
	 GkyaBAff4bEFE5ZPNTihKTh9s/HiZWXzrgh9f/wzhUivmHC01ncjQcltBmlroEL5zp
	 IktepxEGp7DLBoy2lqLRqx/zwMzZXRQHtqnkXKlRMPKbXRaOd9JcwzfS1UIhmAzBfp
	 Z3NPjlbI4vMo9bPW65mLku7NL3Pp/w6KXR+i+QEDpCl2XH2SfRfcP9AbB0kOF3ktdK
	 di0zclQSOhvNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/7] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for
 Data Modul i.MX8M Mini and Plus eDM SBC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727195244.78199-2-marex@nabladev.com>
References: <20260727195244.78199-1-marex@nabladev.com>
 <20260727195244.78199-2-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 20:07:15 +0000
Message-Id: <20260727200716.0A0031F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Hardcoded backlight `enable-gpios` in the shared panel overlay bre=
aks native LVDS backlight control on i.MX8MP for the G215HVN011 display.
- [Low] Orphaned `enable-active-high` property left in `reg_panel_vcc`.
- [Low] Mathematically inaccurate comment regarding the LVDS clock derivati=
on.
--

--- Patch [2]: [PATCH v6 2/7] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for=
 Data Modul i.MX8M Mini and Plus eDM SBC ---
commit 261fc4aa3222bc2beb75e81148227597b2b74f39
Author: Marek Vasut <marex@nabladev.com>
Subject: arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mi=
ni and Plus eDM SBC

This commit adds device tree overlays for the DSI-to-LVDS adapter populated
with a Lontium LT9211 bridge, supporting multiple panels on the eDM SBC. It
establishes base board DTS updates and panel-specific definitions.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-lvds-g215hvn011.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-=
edm-sbc-overlay-lvds-g215hvn011.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvd=
s-g215hvn011.dtsi

[ ... ]

> +&backlight {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_panel_backlight>;
> +	enable-gpios =3D <&gpio3 0 GPIO_ACTIVE_HIGH>;
> +	/* 6.5 POWER ON/OFF SEQUENCE, T6 >=3D 10 ms */
> +	post-pwm-on-delay-ms =3D <10>;
> +	/* 6.5 POWER ON/OFF SEQUENCE, T7 >=3D 0 ms */
> +	pwm-off-delay-ms =3D <10>;
> +	/* 5.2 BACKLIGHT UNIT 200Hz..20kHz, value below in ns */
> +	pwms =3D <&pwm1 0 66666 0>;	/* 15 kHz =3D 66666ns */
> +	status =3D "okay";
> +};

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-over=
lay-edm-sbc-imx8mp-lvds-g215hvn011.dtso b/arch/arm64/boot/dts/freescale/imx=
8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm=
-sbc-imx8mp-lvds-g215hvn011.dtso

[ ... ]

> +&backlight {
> +	power-supply =3D <&reg_panel_bl_supply>;
> +};

[Severity: High]
Will the display stay dark on the i.MX8MP native LVDS interface?

The shared panel definition imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn0=
11.dtsi
above hardcodes enable-gpios to &gpio3 0 and sets its associated pinctrl.

While that is the correct pin for the i.MX8MM DSI-to-LVDS adapter, the nati=
ve
LVDS interface on i.MX8MP uses &gpiowifi 0 instead. The i.MX8MP-specific
overlay sets power-supply here but fails to override the enable-gpios and
pinctrl-0 properties inherited from the shared dtsi.

Because the backlight driver will request the wrong GPIO, the backlight ena=
ble
pin will not be asserted correctly.

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts =
b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
> --- a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts

[ ... ]

> @@ -63,7 +63,6 @@ reg_panel_vcc: regulator-panel-vcc {
>  		regulator-name =3D "PANEL_VCC";
>  		regulator-min-microvolt =3D <5000000>;
>  		regulator-max-microvolt =3D <5000000>;
> -		gpio =3D <&gpio3 6 0>;
>  		enable-active-high;
>  		/* Disabled by default, unless display board plugged in. */
>  		status =3D "disabled";

[Severity: Low]
Does this leave an orphaned enable-active-high property?

The gpio assignment was removed, but enable-active-high remains.
It looks like this was cleaned up completely in the i.MX8MP baseboard dts.

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-over=
lay-edm-sbc-imx8mp-lvds-g156hce-l01.dtso b/arch/arm64/boot/dts/freescale/im=
x8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g156hce-l01.dtso
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm=
-sbc-imx8mp-lvds-g156hce-l01.dtso

[ ... ]

> +&media_blk_ctrl {
> +	/*
> +	 * The G156HCE-L01 panel requires 141.86 MHz LVDS clock.
> +	 * Set IMX8MP_VIDEO_PLL1 to 993.2 MHz , since 993.2 MHz / 7 =3D 141.86 =
MHz .
> +	 */

[Severity: Low]
This is a minor typo, but should 993.2 MHz be 993.02 MHz here?

993.2 / 7 does not equal 141.86, and the code below correctly configures
it to 993020000 (993.02 MHz).

> +	assigned-clock-rates =3D <500000000>, <200000000>,
> +			       <0>, <0>, <500000000>, <993020000>;
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727195244.7819=
9-1-marex@nabladev.com?part=3D2
