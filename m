Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E253C7DF5;
	Mon, 28 Sep 2026 12:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600258; cv=none; b=eued1JHf6m0qCNyLICA3sX2tV5yBHoF/45BEIPMh8iO+0RrAFovWI4aBD5lhDzPZKAqBr93qjVYkZ4A48vp8yDMagsGB7jCYmjOfRNqBAximgwOJUctn3RTQgYMcuYnhoIt1YCFAI3Qiyay42JPtmT8rAVCDY5nz+xxRRFobt2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600258; c=relaxed/simple;
	bh=yArXh0BoeMjlRjX+13KONdZhOafhvWT/9S2MFfcLBM8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FiQ7xZRPUWIGc72j5gmB1kaPVk+LK4qSIAZsXY7mqv5U2+ByfOseCc7F3Z2tHdhE3Ym90KbtFjfxAoSfCON6k9Dg5RdCgGMMi4Eee/h+SYxlBL0Dkyg5xoGqyas/TSDv1dzjGZ8PL1XKTA64lSVk/VENJ7tBhXnEiqy5N+Fsd1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RPclGIyE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RPclGIyE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9BB61F000FF;
	Mon, 28 Sep 2026 12:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790600256;
	bh=POAmT5VbWBcT8EVy+B34poLm4yNeDTHDxXbefO+EIHE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RPclGIyElmP9EhBnt/Wu2uMNy3r3enAiHKDI0qx3th+iTjfi8htRgmq9RMwMgw5a0
	 2HsCA8TMsnMN8g8oJb3NEKyQ+ZzAmCk2lzv8WtKSpOwQ8jKg+/o8d8QkrkKlqeXabK
	 oUNMLajFIuw4wMBTr6i8NqqnixVM6wd+S3MDCeYZHzBeC1HXACY7vSc92ZICMu11gx
	 utLvEH7sI4+1wgR48imoZkZ90zLWvT5un3qHRBCBzTdfe2cJxFz7DubudxGAyhcO8R
	 y89MiQTqLQxAlOY6NIlIYgcc6h91TTpLoreazmISPk3hfZpW3mxLYzDWFyMvWBrBV3
	 Z+KsIdCr7koqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/12] ARM: dts: imx6ul: Add Variscite storage and
 wireless files
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <335592bb96129d875cf77bd87cabb77f1f9476da.1790512621.git.stefano.r@variscite.com>
References: <cover.1790512621.git.stefano.r@variscite.com>
 <335592bb96129d875cf77bd87cabb77f1f9476da.1790512621.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 12:57:35 +0000
Message-Id: <20260928125735.B9BB61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] mmc: pwrseq: simultaneous toggle of power and reset violates hardw=
are sequencing
- [High] dts: brcm: missing power and reset GPIO configuration for Broadcom=
 Wi-Fi
- [High] dts: brcm: completely missing Bluetooth UART node
- [Medium] mmc: missing non-removable property for soldered Broadcom Wi-Fi
- [Low] mtd: nand: partitions defined directly under controller violate mod=
ern bindings
--

commit a94c06d13e6360d597e48c190a6a4d8c2a016ddb
Author: Stefano Radaelli <stefano.r@variscite.com>

    ARM: dts: imx6ul: Add Variscite storage and wireless files
   =20
    Add shared DTSI files for eMMC, NAND, Broadcom Wi-Fi and NXP
    IW61x options on VAR-SOM-6UL and DART-6UL. These options have the
    same descriptions on both modules, so use one file for each.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-nand.dtsi b/arc=
h/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-nand.dtsi
> new file mode 100644
> index 0000000000000..1522b5d7e0924
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-nand.dtsi
> @@ -0,0 +1,63 @@
[ ... ]
> +&gpmi {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_gpmi_nand_1>;
> +	status =3D "okay";
> +
> +	partitions {
> +		compatible =3D "fixed-partitions";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;

[Severity: Low]
Should these partitions be placed under a NAND chip subnode (e.g., nand@0)
representing the physical chip, rather than directly under the NAND
controller (&gpmi)?

Modern NAND bindings (nand-controller.yaml) require this, and defining them
here might cause devicetree validation warnings and relies on deprecated
legacy behavior.

[ ... ]
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-brcm.dtsi =
b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-brcm.dtsi
> new file mode 100644
> index 0000000000000..d7952233a1ee9
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-brcm.dtsi
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
> + */
> +
> +/ {
> +	reg_sd1_vmmc: regulator-sd1-vmmc {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VSD_3V3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +	};

[Severity: High]
Is the gpio property missing from this regulator?

The Broadcom Wi-Fi module requires its power enable and reset GPIOs to be
driven to function, but there is no gpio property here and the file
completely lacks an mmc-pwrseq node to release the reset. Will the chip
remain permanently powered off and in reset?

> +};
> +
> +&tsc {
> +	status =3D "disabled";
> +};
> +
> +&usdhc1 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 =3D <&pinctrl_usdhc1>, <&pinctrl_32k_clk>, <&pinctrl_wifi>;
> +	pinctrl-1 =3D <&pinctrl_usdhc1_100mhz>, <&pinctrl_32k_clk>, <&pinctrl_w=
ifi>;
> +	pinctrl-2 =3D <&pinctrl_usdhc1_200mhz>, <&pinctrl_32k_clk>, <&pinctrl_w=
ifi>;
> +	keep-power-in-suspend;
> +	vmmc-supply =3D <&reg_sd1_vmmc>;
> +	status =3D "okay";

[Severity: Medium]
Is the non-removable property missing from this node?

Without it, the MMC core incorrectly treats the hard-wired SDIO Wi-Fi chip
as removable, which can cause inefficient polling or failed probing if no
Card Detect (CD) GPIO is present. The companion var-wifi-iw61x.dtsi correct=
ly
sets this property.

> +
> +	brcmf: wifi@1 {
> +		compatible =3D "brcm,bcm4329-fmac";
> +		reg =3D <1>;
> +	};
> +};
> +

[Severity: High]
Is an &uart2 node missing from this file?

The Broadcom combo module requires a Bluetooth child node under its UART
(e.g., compatible =3D "brcm,bcm43438-bt") to initialize the BT functionalit=
y.
Will the Bluetooth portion remain uninitialized and unusable without it?

[ ... ]
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi=
 b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi
> new file mode 100644
> index 0000000000000..d2f116bc8d70f
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi
> @@ -0,0 +1,43 @@
[ ... ]
> +/ {
> +	reg_sd1_vmmc: regulator-sd1-vmmc {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VSD_3V3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +	};
> +
> +	iw61x_pwrseq: mmc-pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		post-power-on-delay-ms =3D <100>;
> +		power-off-delay-us =3D <10000>;
> +		reset-gpios =3D <&gpio5 6 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
> +			      <&gpio5 2 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */

[Severity: High]
Does placing both the power enable (WIFI_PWR_EN) and reset (WIFI_RESET) pins
in this reset-gpios array cause them to transition state at the exact same
instant?

The mmc_pwrseq_simple driver toggles all pins in this array simultaneously
using gpiod_multi_set_value_cansleep() in drivers/mmc/core/pwrseq_simple.c,
which violates the hardware requirement that power must be stable before the
reset line is released. Could this lead to unreliable or failed Wi-Fi
initialization?

> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790512621.gi=
t.stefano.r@variscite.com?part=3D6
