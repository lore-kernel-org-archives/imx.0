Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0F82D3A7B;
	Thu, 19 Mar 2026 14:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773930037; cv=none; b=RpxiZRFNObxyCNcO68eilN0kfKMlFP5qjPGEy5MpE/jvW+FD4PrQCpAN1xMj9oW9jAh+B4DkvBHZpo35dr32pb0teVgTo5oH6Q47p/xeIYWm/yNk6GaZ35WAIzLc9knJh36Fv9FUf9wFtnyO+l5TZbBan8Lyod6qVc0b15CTGzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773930037; c=relaxed/simple;
	bh=w88v2VO5ayVrX5gO3MAH7nCH3FWbKYvhdU8ZOyrg+80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AcTkg9+mjlz6Cq9QOsQ6SVYVD7+O7Skg66PgOdDpTLDPvNbeozzLWd71PbqBvVxVe95+9R1t22HivEiJbmhvXF5r2+SJVWxki36H7ySChpaqkAMotef2JLZdB44o4lyRX9dvu69TaDJZW+OyMdUu+edWz4LypveRJStIJFwJFSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=L8fbSiPM; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="L8fbSiPM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=9zbIkdZUSUoz2HVSSofaTugNgWTQwbpc2FIQImWyR7c=; b=L8fbSiPM2Jov016cbMfpOEAhac
	QDP8kDJpT8E9KQ1dKpCUKnhWvu+oLDXOtxigwV1T2vqIqFbHU+uq40i+yQPgaheAZUrMK+NGhO3Rf
	G5mfS4Qj9864Hb5Txk+kVgtIAI3qjpGnQY9GH7BBPLHbM3EG9r1iFtleCz1vRTHDSmrCdEwOYMtQL
	CCMBE7D6lnQvZrmwh8NWOHicS4DK0zkEBc6Cv6uUYD7rxxf/QHWZ3Xka0P55RezH1RBYyg+QWRJt/
	2+TSMD3IUJ60n+sLA6HKXxyzW60euP4QduczP43SIHv8XgPMfOfVMQbA2jABL/tjIeukJKgZhZKkk
	Ouabim1g==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w3EEh-0003GL-26;
	Thu, 19 Mar 2026 15:20:31 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w3EEg-0003Bn-2U;
	Thu, 19 Mar 2026 15:20:31 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Martin Schmiedel <Martin.Schmiedel@tq-group.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject:
 Re: [PATCH 2/3] arm64: dts: freescale: add initial device tree for
 TQMa93xx/MBa93xxLA-MINI
Date: Thu, 19 Mar 2026 15:20:30 +0100
Message-ID: <3410122.44csPzL39Z@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <abwBoB29cns28PWl@lizhi-Precision-Tower-5810>
References:
 <20260317111704.1075938-1-alexander.stein@ew.tq-group.com>
 <20260317111704.1075938-3-alexander.stein@ew.tq-group.com>
 <abwBoB29cns28PWl@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart8658583.T7Z3S40VBb";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27945/Thu Mar 19 07:24:38 2026)

--nextPart8658583.T7Z3S40VBb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Date: Thu, 19 Mar 2026 15:20:30 +0100
Message-ID: <3410122.44csPzL39Z@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <abwBoB29cns28PWl@lizhi-Precision-Tower-5810>
MIME-Version: 1.0

Am Donnerstag, 19. M=E4rz 2026, 15:01:04 CET schrieb Frank Li:
> On Tue, Mar 17, 2026 at 12:17:01PM +0100, Alexander Stein wrote:
> > From: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
> >
> > This adds support for TQMa93xx module attached to MBa93xxLA-MINI board.
>=20
> Just said "Add support ..."

Yup, already fixed in v2.

>=20
> > TQMa93xx is a SOM series using i.MX93 SOC.
>=20
> Need extra empty line between two paragraph.

This one I missed. Thanks.

>=20
> > The MBa93xxLA-MINI has a small form factor and is designed with
> > WLAN, Bluetooth and WWAN applications in mind.
> >
> > Signed-off-by: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile        |   1 +
> >  .../imx93-tqma9352-mba93xxla-mini.dts         | 637 ++++++++++++++++++
>=20
> New dts, please run dt-format. iomux is not necessary at last one.

Sorry, running dt-format on imx93-tqma9352-mba93xxla-mini.dts segfaults.

AFAIK iomux being the last node is/was a common pattern for imx based platf=
orms.

Best regards,
Alexander

>=20
> Frank
>=20
> >  2 files changed, 638 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93x=
xla-mini.dts
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/d=
ts/freescale/Makefile
> > index 31bc80586c682..db536522600ac 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -461,6 +461,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx93-phycore-rpmsg.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-tqma9352-mba91xxca.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-tqma9352-mba93xxca.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-tqma9352-mba93xxla.dtb
> > +dtb-$(CONFIG_ARCH_MXC) +=3D imx93-tqma9352-mba93xxla-mini.dtb
> >
> >  imx93-tqma9352-mba91xxca-lvds-tm070jvhg33-dtbs :=3D imx93-tqma9352-mba=
91xxca.dtb imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtbo
> >  imx93-tqma9352-mba91xxca-rgb-cdtech-dc44-dtbs :=3D imx93-tqma9352-mba9=
1xxca.dtb imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtbo
> > diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-min=
i.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dts
> > new file mode 100644
> > index 0000000000000..97693aa5e904d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dts
> > @@ -0,0 +1,637 @@
> > +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> > +/*
> > + * Copyright (c) 2025-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
> > + * D-82229 Seefeld, Germany.
> > + * Author: Martin Schmiedel
> > + */
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/leds/common.h>
> > +#include <dt-bindings/net/ti-dp83867.h>
> > +#include <dt-bindings/pwm/pwm.h>
> > +#include <dt-bindings/usb/pd.h>
> > +#include "imx93-tqma9352.dtsi"
> > +
> > +/{
> > +	model =3D "TQ-Systems i.MX93 TQMa93xxLA on MBa93xxLA-MINI SBC";
> > +	compatible =3D "tq,imx93-tqma9352-mba93xxla-mini",
> > +		     "tq,imx93-tqma9352", "fsl,imx93";
> > +	chassis-type =3D "embedded";
> > +
> > +	chosen {
> > +		stdout-path =3D &lpuart1;
> > +	};
> > +
> > +	aliases {
> > +		eeprom0 =3D &eeprom0;
> > +		ethernet0 =3D &eqos;
> > +		ethernet1 =3D &fec;
> > +		gpio0 =3D &gpio1;
> > +		gpio1 =3D &gpio2;
> > +		gpio2 =3D &gpio3;
> > +		gpio3 =3D &gpio4;
> > +		i2c0 =3D &lpi2c1;
> > +		i2c1 =3D &lpi2c2;
> > +		i2c2 =3D &lpi2c3;
> > +		i2c3 =3D &lpi2c4;
> > +		i2c4 =3D &lpi2c5;
> > +		mmc0 =3D &usdhc1;
> > +		mmc1 =3D &usdhc2;
> > +		mmc2 =3D &usdhc3;
> > +		rtc0 =3D &pcf85063;
> > +		rtc1 =3D &bbnsm_rtc;
> > +		serial0 =3D &lpuart1;
> > +		serial1 =3D &lpuart2;
> > +		serial2 =3D &lpuart3;
> > +		serial3 =3D &lpuart4;
> > +		serial4 =3D &lpuart5;
> > +		serial5 =3D &lpuart6;
> > +		serial6 =3D &lpuart7;
> > +		serial7 =3D &lpuart8;
> > +		spi0 =3D &lpspi1;
> > +		spi1 =3D &lpspi2;
> > +		spi2 =3D &lpspi3;
> > +		spi3 =3D &lpspi4;
> > +		spi4 =3D &lpspi5;
> > +		spi5 =3D &lpspi6;
> > +	};
> > +
> > +	backlight_lvds: backlight {
> > +		compatible =3D "pwm-backlight";
> > +		pwms =3D <&tpm5 0 5000000 0>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_backlight>;
> > +		brightness-levels =3D <0 4 8 16 32 64 128 255>;
> > +		default-brightness-level =3D <7>;
> > +		power-supply =3D <&reg_12v0>;
> > +		enable-gpios =3D <&gpio2 5 GPIO_ACTIVE_HIGH>;
> > +		status =3D "disabled";
> > +	};
> > +
> > +	display: display {
> > +		/*
> > +		 * Display is not fixed, so compatible has to be added from
> > +		 * DT overlay
> > +		 */
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_display>;
> > +		power-supply =3D <&reg_3v3>;
> > +		enable-gpios =3D <&gpio2 7 GPIO_ACTIVE_HIGH>;
> > +		backlight =3D <&backlight_lvds>;
> > +		status =3D "disabled";
> > +
> > +		port {
> > +			panel_in_lvds0: endpoint {
> > +			};
> > +		};
> > +	};
> > +
> > +	iio-hwmon {
> > +		compatible =3D "iio-hwmon";
> > +		io-channels =3D <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>;
> > +	};
> > +
> > +	reg_3v3: regulator-3v3 {
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "V_3V3_MB";
> > +		regulator-min-microvolt =3D <3300000>;
> > +		regulator-max-microvolt =3D <3300000>;
> > +	};
> > +
> > +	reg_5v0_usb: regulator-5v0-usb {
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "V_5V0_HUB";
> > +		regulator-min-microvolt =3D <5000000>;
> > +		regulator-max-microvolt =3D <5000000>;
> > +		gpio =3D <&expander1 0 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +	};
> > +
> > +	reg_12v0: regulator-12v0 {
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "V_12V";
> > +		regulator-min-microvolt =3D <12000000>;
> > +		regulator-max-microvolt =3D <12000000>;
> > +		gpio =3D <&expander0 7 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +	};
> > +};
> > +
> > +&adc1 {
> > +	status =3D "okay";
> > +};
> > +
> > +&eqos {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_eqos>;
> > +	phy-mode =3D "rgmii-id";
> > +	phy-handle =3D <&ethphy_eqos>;
> > +	status =3D "okay";
> > +
> > +	mdio {
> > +		compatible =3D "snps,dwmac-mdio";
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		ethphy_eqos: ethernet-phy@0 {
> > +			compatible =3D "ethernet-phy-ieee802.3-c22";
> > +			reg =3D <0>;
> > +			pinctrl-names =3D "default";
> > +			pinctrl-0 =3D <&pinctrl_eqos_phy>;
> > +			interrupt-parent =3D <&gpio3>;
> > +			interrupts =3D <26 IRQ_TYPE_EDGE_FALLING>;
> > +			reset-gpios =3D <&expander0 0 GPIO_ACTIVE_LOW>;
> > +			reset-assert-us =3D <500000>;
> > +			reset-deassert-us =3D <50000>;
> > +			enet-phy-lane-no-swap;
> > +			ti,rx-internal-delay =3D <DP83867_RGMIIDCTL_2_25_NS>;
> > +			ti,tx-internal-delay =3D <DP83867_RGMIIDCTL_2_25_NS>;
> > +			ti,fifo-depth =3D <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> > +			ti,dp83867-rxctrl-strap-quirk;
> > +			ti,clk-output-sel =3D <DP83867_CLK_O_SEL_OFF>;
> > +		};
> > +	};
> > +};
> > +
> > +&fec {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_fec>;
> > +	phy-mode =3D "rgmii-id";
> > +	phy-handle =3D <&ethphy_fec>;
> > +	fsl,magic-packet;
> > +	status =3D "okay";
> > +
> > +	mdio {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		clock-frequency =3D <5000000>;
> > +
> > +		ethphy_fec: ethernet-phy@0 {
> > +			compatible =3D "ethernet-phy-ieee802.3-c22";
> > +			reg =3D <0>;
> > +			pinctrl-names =3D "default";
> > +			pinctrl-0 =3D <&pinctrl_fec_phy>;
> > +			interrupt-parent =3D <&gpio3>;
> > +			interrupts =3D <27 IRQ_TYPE_EDGE_FALLING>;
> > +			reset-gpios =3D <&expander0 1 GPIO_ACTIVE_LOW>;
> > +			reset-assert-us =3D <500000>;
> > +			reset-deassert-us =3D <50000>;
> > +			enet-phy-lane-no-swap;
> > +			ti,rx-internal-delay =3D <DP83867_RGMIIDCTL_2_25_NS>;
> > +			ti,tx-internal-delay =3D <DP83867_RGMIIDCTL_2_25_NS>;
> > +			ti,fifo-depth =3D <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> > +			ti,dp83867-rxctrl-strap-quirk;
> > +			ti,clk-output-sel =3D <DP83867_CLK_O_SEL_OFF>;
> > +		};
> > +	};
> > +};
> > +
> > +&flexcan1 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_flexcan1>;
> > +	status =3D "okay";
> > +};
> > +
> > +&flexcan2 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_flexcan2>;
> > +	status =3D "okay";
> > +};
> > +
> > +/* deactivated because pins are used for SDIO */
> > +&flexspi1 {
> > +	status =3D "disabled";
> > +};
> > +
> > +&gpio1 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_m2_key_b>, <&pinctrl_m2_key_e>;
> > +
> > +	gpio-line-names =3D
> > +		/* 00 */ "", "", "M2_KEYE_ALERT#", "",
> > +		/* 04 */ "", "", "M2_KEYE_UART_WAKE#", "BM1_M2_KEYE_SDIO_WAKE#",
> > +		/* 08 */ "", "", "", "BM2_M2_KEYE_SDIO_RST#",
> > +		/* 12 */ "M2_KEYB_WOWWAN#", "BM3_M2_KEYB_PEWAKE#", "", "",
> > +		/* 16 */ "", "", "", "",
> > +		/* 20 */ "", "", "", "",
> > +		/* 24 */ "", "", "", "",
> > +		/* 28 */ "", "", "", "";
> > +};
> > +
> > +&gpio2 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_gpio2>;
> > +
> > +	gpio-line-names =3D
> > +		/* 00 */ "", "", "", "",
> > +		/* 04 */ "LVDS_RESET#", "LVDS_BLT_EN", "", "LVDS_PWR_EN",
> > +		/* 08 */ "", "", "", "",
> > +		/* 12 */ "", "", "", "",
> > +		/* 16 */ "X1_9", "X1_19", "X1_15", "X1_11",
> > +		/* 20 */ "X1_13", "X1_7", "", "CAM_TRIGGER",
> > +		/* 24 */ "CAM_SYNC", "", "X1_5", "",
> > +		/* 28 */ "", "", "", "";
> > +};
> > +
> > +&gpio4 {
> > +	gpio-line-names =3D
> > +		/* 00 */ "", "", "", "",
> > +		/* 04 */ "", "", "", "",
> > +		/* 08 */ "", "", "", "",
> > +		/* 12 */ "", "", "", "",
> > +		/* 16 */ "", "", "", "",
> > +		/* 20 */ "", "", "", "",
> > +		/* 24 */ "", "", "", "",
> > +		/* 28 */ "", "DSI_GPIO", "", "";
> > +};
> > +
> > +&lpi2c3 {
> > +	#address-cells =3D <1>;
> > +	#size-cells =3D <0>;
> > +	clock-frequency =3D <400000>;
> > +	pinctrl-names =3D "default", "gpio";
> > +	pinctrl-0 =3D <&pinctrl_lpi2c3>;
> > +	pinctrl-1 =3D <&pinctrl_lpi2c3_gpio>;
> > +	scl-gpios =3D <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +	sda-gpios =3D <&gpio2 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +	status =3D "okay";
> > +
> > +	expander0: gpio@70 {
> > +		compatible =3D "nxp,pca9538";
> > +		reg =3D <0x70>;
> > +		gpio-controller;
> > +		#gpio-cells =3D <2>;
> > +		vcc-supply =3D <&reg_3v3>;
> > +		gpio-line-names =3D "ENET1_RESET#", "ENET2_RESET#",
> > +				  "M2_KEYE_PERST#", "M2_KEYB_PERST#",
> > +				  "M2_KEYE_W_DISABLE1#", "M2_KEYE_W_DISABLE2#",
> > +				  "M2_KEYA_W_DISABLE1#", "12V_EN";
> > +	};
> > +
> > +	expander1: gpio@71 {
> > +		compatible =3D "nxp,pca9538";
> > +		reg =3D <0x71>;
> > +		gpio-controller;
> > +		#gpio-cells =3D <2>;
> > +		vcc-supply =3D <&reg_3v3>;
> > +		gpio-line-names =3D "USB_HUB_PWR", "DSI_RST#",
> > +				  "CAM_PWR#", "CAMRST#",
> > +				  "M2_KEYB_FULL_CARD_PWR_OFF#", "M2_KEYB_W_DISABLE2#",
> > +				  "M2_KEYB_RST#", "M2_KEYB_DPR";
> > +
> > +		/*
> > +		 * Controls the LTE card FULL_CARD_PWR_OFF pin which is low active
> > +		 * as power down signal. The output-low states, the signal
> > +		 * is inactive, e.g. not power down
> > +		 */
> > +		full-card-power-off-hog {
> > +			gpio-hog;
> > +			gpios =3D <4 GPIO_ACTIVE_LOW>;
> > +			output-low;
> > +			line-name =3D "M2_KEYB_FULL_CARD_PWR_OFF#";
> > +		};
> > +
> > +		/*
> > +		 * Controls the LTE card reset pin which is low active
> > +		 * as reset signal. The output-low states, the signal
> > +		 * is inactive, e.g. not in reset
> > +		 */
> > +		wlan-perst-hog {
> > +			gpio-hog;
> > +			gpios =3D <6 GPIO_ACTIVE_LOW>;
> > +			output-low;
> > +			line-name =3D "M2_KEYB_RST#";
> > +		};
> > +	};
> > +};
> > +
> > +&lpspi6 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_lpspi6>, <&pinctrl_lpspi6_cs>;
> > +	cs-gpios =3D <&gpio2 0 GPIO_ACTIVE_LOW>;
> > +	status =3D "okay";
> > +};
> > +
> > +&lpuart1 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_uart1>;
> > +	status =3D "okay";
> > +};
> > +
> > +/* disabled per default, console for M33 */
> > +&lpuart3 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_uart3>;
> > +	status =3D "disabled";
> > +};
> > +
> > +/* disabled per default, used for bluetooth on M.2 slot */
> > +&lpuart7 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_uart7>;
> > +	uart-has-rtscts;
> > +	status =3D "disabled";
> > +};
> > +
> > +&lpuart8 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_uart8>;
> > +	status =3D "okay";
> > +};
> > +
> > +&pcf85063 {
> > +	/* RTC_EVENT# from SoM is connected on mainboard */
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_pcf85063>;
> > +	interrupt-parent =3D <&gpio1>;
> > +	interrupts =3D <14 IRQ_TYPE_EDGE_FALLING>;
> > +};
> > +
> > +&tpm5 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_tpm5>;
> > +};
> > +
> > +&usbotg1 {
> > +	disable-over-current;
> > +	dr_mode =3D "peripheral";
> > +	samsung,picophy-pre-emp-curr-control =3D <3>;
> > +	samsung,picophy-dc-vol-level-adjust =3D <7>;
> > +	status =3D "okay";
> > +};
> > +
> > +&usbotg2 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_usbhub>;
> > +	#address-cells =3D <1>;
> > +	#size-cells =3D <0>;
> > +	disable-over-current;
> > +	dr_mode =3D "host";
> > +	vbus-supply =3D <&reg_5v0_usb>;
> > +	samsung,picophy-pre-emp-curr-control =3D <3>;
> > +	samsung,picophy-dc-vol-level-adjust =3D <7>;
> > +	status =3D "okay";
> > +
> > +	hub_2_0: usb-hub@1 {
> > +		compatible =3D "usb424,2517";
> > +		reg =3D <1>;
> > +		reset-gpios =3D <&gpio2 22 GPIO_ACTIVE_LOW>;
> > +		vdd-supply =3D <&reg_3v3>;
> > +	};
> > +};
> > +
> > +&usdhc2 {
> > +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> > +	pinctrl-0 =3D <&pinctrl_usdhc2_hs>, <&pinctrl_usdhc2_gpio>;
> > +	pinctrl-1 =3D <&pinctrl_usdhc2_uhs>, <&pinctrl_usdhc2_gpio>;
> > +	pinctrl-2 =3D <&pinctrl_usdhc2_uhs>, <&pinctrl_usdhc2_gpio>;
> > +	bus-width =3D <4>;
> > +	cd-gpios =3D <&gpio3 0 GPIO_ACTIVE_LOW>;
> > +	disable-wp;
> > +	no-sdio;
> > +	no-mmc;
> > +	vmmc-supply =3D <&reg_usdhc2_vmmc>;
> > +	status =3D "okay";
> > +};
> > +
> > +&usdhc3 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_usdhc3>;
> > +	bus-width =3D <4>;
> > +	non-removable;
> > +	vmmc-supply =3D <&reg_3v3>;
> > +};
> > +
> > +&iomuxc {
> > +	pinctrl_backlight: backlightgrp {
> > +		fsl,pins =3D /* HYS | PD | FSEL_2 | DSE X4 */
> > +			   <MX93_PAD_GPIO_IO05__GPIO2_IO05			0x011e>;
> > +	};
> > +
> > +	pinctrl_display: displaygrp {
> > +		fsl,pins =3D /* HYS | PD | FSEL_2 | DSE X4 */
> > +			   <MX93_PAD_GPIO_IO07__GPIO2_IO07			0x011e>;
> > +	};
> > +
> > +	pinctrl_eqos: eqosgrp {
> > +		fsl,pins =3D /* PD | FSEL_2 | DSE X4 */
> > +			   <MX93_PAD_ENET1_MDC__ENET_QOS_MDC				0x51e>,
> > +			   /* SION | HYS | FSEL_2 | DSE X4 */
> > +			   <MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO				0x4000111e>,
> > +			   /* HYS | FSEL_0 | DSE no drive */
> > +			   <MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x1000>,
> > +			   <MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x1000>,
> > +			   <MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x1000>,
> > +			   <MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x1000>,
> > +			   <MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x1000>,
> > +			   /* HYS | PD | FSEL_0 | DSE no drive */
> > +			   <MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x1400>,
> > +			   /* PD | FSEL_2 | DSE X5 */
> > +			   <MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x53e>,
> > +			   <MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1			0x53e>,
> > +			   <MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x53e>,
> > +			   <MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x53e>,
> > +			   <MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x53e>,
> > +			   /* PD | FSEL_3 | DSE X4 */
> > +			   <MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x59e>;
> > +	};
> > +
> > +	pinctrl_eqos_phy: eqosphygrp {
> > +		fsl,pins =3D /* HYS | FSEL_0 | DSE no drive */
> > +			   <MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x1000>;
> > +	};
> > +
> > +	pinctrl_fec: fecgrp {
> > +		fsl,pins =3D /* PD | FSEL_2 | DSE X4 */
> > +			   <MX93_PAD_ENET2_MDC__ENET1_MDC		0x51e>,
> > +			   /* SION | HYS | FSEL_2 | DSE X4 */
> > +			   <MX93_PAD_ENET2_MDIO__ENET1_MDIO		0x4000111e>,
> > +			   /* HYS | FSEL_0 | DSE no drive */
> > +			   <MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x1000>,
> > +			   <MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x1000>,
> > +			   <MX93_PAD_ENET2_RD2__ENET1_RGMII_RD2		0x1000>,
> > +			   <MX93_PAD_ENET2_RD3__ENET1_RGMII_RD3		0x1000>,
> > +			   <MX93_PAD_ENET2_RX_CTL__ENET1_RGMII_RX_CTL	0x1000>,
> > +			   /* HYS | PD | FSEL_0 | DSE no drive */
> > +			   <MX93_PAD_ENET2_RXC__ENET1_RGMII_RXC		0x1400>,
> > +			   /* PD | FSEL_2 | DSE X5 */
> > +			   <MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0		0x53e>,
> > +			   <MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1		0x53e>,
> > +			   <MX93_PAD_ENET2_TD2__ENET1_RGMII_TD2		0x53e>,
> > +			   <MX93_PAD_ENET2_TD3__ENET1_RGMII_TD3		0x53e>,
> > +			   <MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL	0x53e>,
> > +			   /* PD | FSEL_3 | DSE X4 */
> > +			   <MX93_PAD_ENET2_TXC__ENET1_RGMII_TXC		0x59e>;
> > +	};
> > +
> > +	pinctrl_fec_phy: fecphygrp {
> > +		fsl,pins =3D /* HYS | FSEL_0 | DSE no drive */
> > +			   <MX93_PAD_CCM_CLKO2__GPIO3_IO27		0x1000>;
> > +	};
> > +
> > +	pinctrl_flexcan1: flexcan1grp {
> > +		fsl,pins =3D /* HYS | PU | FSEL_0 | DSE no drive */
> > +			   <MX93_PAD_PDM_BIT_STREAM0__CAN1_RX		0x1200>,
> > +			   /* PU | FSEL_3 | DSE X4 */
> > +			   <MX93_PAD_PDM_CLK__CAN1_TX			0x039e>;
> > +	};
> > +
> > +	pinctrl_flexcan2: flexcan2grp {
> > +		fsl,pins =3D /* HYS | PU | FSEL_0 | DSE no drive */
> > +			   <MX93_PAD_GPIO_IO27__CAN2_RX			0x1200>,
> > +			   /* PU | FSEL_3 | DSE X4 */
> > +			   <MX93_PAD_GPIO_IO25__CAN2_TX			0x039e>;
> > +	};
> > +
> > +	pinctrl_gpio2: gpio2grp {
> > +		fsl,pins =3D /* HYS | PD | FSEL_2 | DSE X4 */
> > +			   <MX93_PAD_GPIO_IO16__GPIO2_IO16		0x151e>,
> > +			   <MX93_PAD_GPIO_IO17__GPIO2_IO17		0x151e>,
> > +			   <MX93_PAD_GPIO_IO18__GPIO2_IO18		0x151e>,
> > +			   <MX93_PAD_GPIO_IO19__GPIO2_IO19		0x151e>,
> > +			   <MX93_PAD_GPIO_IO20__GPIO2_IO20		0x151e>,
> > +			   <MX93_PAD_GPIO_IO21__GPIO2_IO21		0x151e>,
> > +			   <MX93_PAD_GPIO_IO26__GPIO2_IO26		0x151e>;
> > +	};
> > +
> > +	pinctrl_jtag: jtaggrp {
> > +		fsl,pins =3D <MX93_PAD_DAP_TCLK_SWCLK__JTAG_MUX_TCK	0x051e>,
> > +			   <MX93_PAD_DAP_TDI__JTAG_MUX_TDI		0x1200>,
> > +			   <MX93_PAD_DAP_TDO_TRACESWO__JTAG_MUX_TDO	0x031e>,
> > +			   <MX93_PAD_DAP_TMS_SWDIO__JTAG_MUX_TMS	0x1200>;
> > +	};
> > +
> > +	pinctrl_lpi2c3: lpi2c3grp {
> > +		fsl,pins =3D /* SION | HYS | OD | FSEL_3 | DSE X4 */
> > +			   <MX93_PAD_GPIO_IO28__LPI2C3_SDA		0x4000199e>,
> > +			   <MX93_PAD_GPIO_IO29__LPI2C3_SCL		0x4000199e>;
> > +	};
> > +
> > +	pinctrl_lpi2c3_gpio: lpi2c3-gpiogrp {
> > +		fsl,pins =3D /* SION | HYS | OD | FSEL_3 | DSE X4 */
> > +			   <MX93_PAD_GPIO_IO28__GPIO2_IO28		0x4000199e>,
> > +			   <MX93_PAD_GPIO_IO29__GPIO2_IO29		0x4000199e>;
> > +	};
> > +
> > +	pinctrl_lpspi6: lpspi6grp {
> > +		fsl,pins =3D /* HYS | PD | FSEL_0 | DSE no drive */
> > +			   <MX93_PAD_GPIO_IO01__LPSPI6_SIN		0x1400>,
> > +			   /* PD | FSEL_2 | DSE X4 */
> > +			   <MX93_PAD_GPIO_IO02__LPSPI6_SOUT		0x051e>,
> > +			   <MX93_PAD_GPIO_IO03__LPSPI6_SCK		0x051e>;
> > +	};
> > +
> > +	pinctrl_lpspi6_cs: lpspi6csgrp {
> > +		fsl,pins =3D /* FSEL_2 | DSE X4 */
> > +			   <MX93_PAD_GPIO_IO00__GPIO2_IO00		0x011e>;
> > +	};
> > +
> > +	pinctrl_m2_key_b: m2keybgrp {
> > +		fsl,pins =3D <MX93_PAD_SAI1_TXC__GPIO1_IO12		0x00001000>,
> > +			   <MX93_PAD_SAI1_TXD0__GPIO1_IO13		0x00001000>;
> > +	};
> > +
> > +	pinctrl_m2_key_e: m2keyegrp {
> > +		fsl,pins =3D <MX93_PAD_I2C2_SCL__GPIO1_IO02		0x00001000>,
> > +			   <MX93_PAD_UART2_RXD__GPIO1_IO06		0x00001000>,
> > +			   <MX93_PAD_UART2_TXD__GPIO1_IO07		0x00001000>,
> > +			   <MX93_PAD_SAI1_TXFS__GPIO1_IO11		0x00001000>;
> > +	};
> > +
> > +	/*CAM_MCLK, DSI_GPIO, CAM_TRIGGER, CAM_SYNC*/
> > +	pinctrl_mipi_csi_dsi: mipi_csi_dsigrp {
> > +		fsl,pins =3D <MX93_PAD_CCM_CLKO3__CCMSRCGPCMIX_CLKO3     0x0000011e>,
> > +			   <MX93_PAD_CCM_CLKO4__GPIO4_IO29             0x0000011e>,
> > +			   <MX93_PAD_GPIO_IO23__GPIO2_IO23             0x0000011e>,
> > +			   <MX93_PAD_GPIO_IO24__GPIO2_IO24             0x0000111e>;
> > +	};
> > +
> > +	pinctrl_pcf85063: pcf85063grp {
> > +		fsl,pins =3D /* HYS | FSEL_0 | No DSE */
> > +			   <MX93_PAD_SAI1_RXD0__GPIO1_IO14		0x1000>;
> > +	};
> > +
> > +	pinctrl_tpm5: tpm5grp {
> > +		fsl,pins =3D <MX93_PAD_GPIO_IO06__TPM5_CH0		0x57e>;
> > +	};
> > +
> > +	pinctrl_uart1: uart1grp {
> > +		fsl,pins =3D /* HYS | FSEL_0 | No DSE */
> > +			   <MX93_PAD_UART1_RXD__LPUART1_RX		0x1000>,
> > +			   /* FSEL_2 | DSE X4 */
> > +			   <MX93_PAD_UART1_TXD__LPUART1_TX		0x011e>;
> > +	};
> > +
> > +	pinctrl_uart3: uart3grp {
> > +		fsl,pins =3D /* HYS | FSEL_0 | No DSE */
> > +			   <MX93_PAD_GPIO_IO15__LPUART3_RX		0x1000>,
> > +			   /* FSEL_2 | DSE X4 */
> > +			   <MX93_PAD_GPIO_IO14__LPUART3_TX		0x011e>;
> > +	};
> > +
> > +	pinctrl_uart7: uart7grp {
> > +		fsl,pins =3D <MX93_PAD_GPIO_IO08__LPUART7_TX             0x031e>,
> > +			   <MX93_PAD_GPIO_IO09__LPUART7_RX             0x031e>,
> > +			   <MX93_PAD_GPIO_IO10__LPUART7_CTS_B          0x031e>,
> > +			   <MX93_PAD_GPIO_IO11__LPUART7_RTS_B          0x031e>;
> > +	};
> > +
> > +	pinctrl_uart8: uart8grp {
> > +		fsl,pins =3D /* HYS | FSEL_0 | No DSE */
> > +			   <MX93_PAD_GPIO_IO13__LPUART8_RX		0x1000>,
> > +			   /* FSEL_2 | DSE X4 */
> > +			   <MX93_PAD_GPIO_IO12__LPUART8_TX		0x011e>;
> > +	};
> > +
> > +	pinctrl_usbhub: usbhubgrp {
> > +		fsl,pins =3D /* HYS | PD | FSEL_2 | DSE X4 */
> > +			   <MX93_PAD_GPIO_IO22__GPIO2_IO22		0x151e>;
> > +	};
> > +
> > +	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> > +		fsl,pins =3D /* HYS | FSEL_0 | No DSE */
> > +			   <MX93_PAD_SD2_CD_B__GPIO3_IO00		0x1000>;
> > +	};
> > +
> > +	/* enable SION for data and cmd pad due to ERR052021 */
> > +	pinctrl_usdhc2_hs: usdhc2hsgrp {
> > +		fsl,pins =3D /* PD | FSEL_3 | DSE X5 */
> > +			   <MX93_PAD_SD2_CLK__USDHC2_CLK		0x05be>,
> > +			   /* HYS | PU | FSEL_3 | DSE X4 */
> > +			   <MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e>,
> > +			   /* HYS | PU | FSEL_3 | DSE X3 */
> > +			   <MX93_PAD_SD2_DATA0__USDHC2_DATA0		0x4000138e>,
> > +			   <MX93_PAD_SD2_DATA1__USDHC2_DATA1		0x4000138e>,
> > +			   <MX93_PAD_SD2_DATA2__USDHC2_DATA2		0x4000138e>,
> > +			   <MX93_PAD_SD2_DATA3__USDHC2_DATA3		0x4000138e>,
> > +			   /* FSEL_2 | DSE X3 */
> > +			   <MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x010e>;
> > +	};
> > +
> > +	/* enable SION for data and cmd pad due to ERR052021 */
> > +	pinctrl_usdhc2_uhs: usdhc2uhsgrp {
> > +		fsl,pins =3D /* PD | FSEL_3 | DSE X6 */
> > +			   <MX93_PAD_SD2_CLK__USDHC2_CLK		0x05fe>,
> > +			   /* HYS | PU | FSEL_3 | DSE X4 */
> > +			   <MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e>,
> > +			   <MX93_PAD_SD2_DATA0__USDHC2_DATA0		0x4000139e>,
> > +			   <MX93_PAD_SD2_DATA1__USDHC2_DATA1		0x4000139e>,
> > +			   <MX93_PAD_SD2_DATA2__USDHC2_DATA2		0x4000139e>,
> > +			   <MX93_PAD_SD2_DATA3__USDHC2_DATA3		0x4000139e>,
> > +			   /* FSEL_2 | DSE X3 */
> > +			   <MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x010e>;
> > +	};
> > +
> > +	/* enable SION for data and cmd pad due to ERR052021 */
> > +	pinctrl_usdhc3: usdhc3grp {
> > +		fsl,pins =3D /* PD | FSEL_3 | DSE X6 */
> > +			   <MX93_PAD_SD3_CLK__USDHC3_CLK		0x05fe>,
> > +			   /* HYS | PU | FSEL_3 | DSE X4 */
> > +			   <MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000139e>,
> > +			   <MX93_PAD_SD3_DATA0__USDHC3_DATA0		0x4000139e>,
> > +			   <MX93_PAD_SD3_DATA1__USDHC3_DATA1		0x4000139e>,
> > +			   <MX93_PAD_SD3_DATA2__USDHC3_DATA2		0x4000139e>,
> > +			   <MX93_PAD_SD3_DATA3__USDHC3_DATA3		0x4000139e>;
> > +	};
> > +};
> > --
> > 2.43.0
> >
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart8658583.T7Z3S40VBb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmm8Bi4ACgkQaS+g2M0Z
/iV6yAf/d+ryq1TzVZxbxUcT+8qLIwO7C0YsoLeLa+GX5xaiDlk29vRakeDswVKo
/qG9dkGK1qKdELu/F6kj6rGeY1cmW+E/O1dfzJh2UX2TRbskj+N09+TKHMo2wfrI
6WyeXzTp6vcknpqoYTymvx1qxz7XDiEXXsFB6GmnZg4S/A2AoigswI8REzhtf1W3
4EO2yTIkhSZi0EenoyLlCusxQ7jvwNDNmuSQI2sc1fZ0knfjjZ2H/6fydum/CxBK
GdYqoG4L9L4xgOn/+oYqB9yxje9SiWbpQrs/VO+fl+sFT7CvU0kw6VP9dDwBujU+
V790c7Gs4NPLQ3ji8DfIQrSPkV+/QA==
=7jTw
-----END PGP SIGNATURE-----

--nextPart8658583.T7Z3S40VBb--



