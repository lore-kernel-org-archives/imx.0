Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616332;
	b=QnrAb4jI/b4fsWpK70XXkXuJatp0/bdtQ80wDqkUFe7ymYfpdkrblcQUj5kn+Flh1qph
	 0B8E9ru2JzCWGjrkRJJ3RiOEJ0O6rPVmnsbOVaTwLbZXY4wnPurajIRO7OHph9nPK+Py0
	 uak4pSF7SoI97OtnFJAyIE1AhQ4MYUDGWm/2e2pGNOnD5Ux7BDjdw05H6H2WRZAo+aVRe
	 7DaldcQoZWiMC0Rc6sHVbSj3SH6xDY7FBioAxlomGrnrVBO9Q4sereNeqid7U/5UfXhxR
	 kvP1BNYNfJy8B+HXK1WR5KQ/pf4mByRWlmzJH2eLJsHZRZ07x4ojEVy/3Wi8w0sO5XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616332;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fog4LR3p+OJ/kl8N/W42B8zM5/EY7uGTOuhDml90xMw=;
	b=A7JPJb0gY1AOxqERLljY2mDbDKHt5YCEM6HjvihRcSySZ6wM1sanmHSePOIMdVLjkJ5e
	 NkTMKRJon+fyPgjrdvX71Fx2DNZ3tVt3fuoez6oEEUgnF2WtwwPg3ojNfWCCp3FDo15jo
	 2GeBvCmJMzKJNtZ9OfZ0VcG1lnv4aN6Dcm6z6KT9e1MBR1sgodz5ayIjID2onEqLdbCPY
	 UZimgvzCC+0bFSwUWcjykm1PnCqBPJi6MZi1BOZ1UrK9iMMxtPjzWK7uqJhzXQ9rkUJeK
	 7KsSOpuERp5ZE3aPdf7f0Fguger5z6OppKor3oJP+VWdjL39hMyGnkmM61MyggIKRgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I9AVhypi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30D1606A326;
	Mon,  2 Nov 2026 10:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I9AVhypi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CDAA1F00919;
	Mon,  2 Nov 2026 10:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793616331;
	bh=fog4LR3p+OJ/kl8N/W42B8zM5/EY7uGTOuhDml90xMw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I9AVhypiKJrp1d6RQIFmUXMUm4iNRNpRI6kVsA5vFyVRlyppLN0rTAPZXCBdyF4OV
	 FtX6PsZKigfuFSO7nTiD4DIplEjM7Z+nnvLQJtNk8VQ5h49Q761oFFwYvHZhnyKyBu
	 Ti7n9auHEbAnTvcHEq+w7JfWgJ5pWkBs2vz6mbsXo2Dat6XaEVaESE1Yj/5CFfLSS9
	 oDGpnbAwX6+0JLFi19VZuEVrmSfhJ/DuXw9UWXje5AHu+wh0oh8HXJDTil5ZPApoEJ
	 kBKClTQnYIfUbHgPWhYyMBDa7M3xOkw0GlDnQ7b3hS3Y1tOteFHUdVjv/8WnmOuJHI
	 CCJVJ3gUQ6UUw==
Message-ID: <sashiko-outbox-193273@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: imx95: Add ADLINK LEC-iMX95 board
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dinesh kumar v" <dineshkumarv85@gmail.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261102102653.272056-4-dinesh.v@adlinktech.com>
References: <20261102065645.121046-1-dinesh.v@adlinktech.com>
 <20261102102653.272056-1-dinesh.v@adlinktech.com>
 <20261102102653.272056-4-dinesh.v@adlinktech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 10:45:30 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Low] arm64: dts: imx95: on-module LEC-iMX95 components placed in carrier=
 board DTS
- [Low] arm64: dts: imx95: duplicate usb@4c100000 reference via usb3 and us=
b3_dwc3
- [Low] arm64: dts: imx95: imx95-lec-ipi-smarc.dtb not sorted alphabeticall=
y in Makefile
- [Low] arm64: dts: imx95: Author email does not match Signed-off-by email
- [Low] arm64: dts: imx95: duplicate USDHC pinctrl groups and 200MHz pad se=
ttings
--

commit 15a8ff538ba6c35961382a83a0abb8e1fea067e2
Author: Dinesh kumar v <dineshkumarv85@gmail.com>

arm64: dts: imx95: Add ADLINK LEC-iMX95 board support

This commit adds the device tree description for the ADLINK LEC-iMX95 system
on module and the I-Pi SMARC Plus carrier board, along with the correspondi=
ng
Makefile entry.

>     arm64: dts: imx95: Add ADLINK LEC-iMX95 board support
>    =20
>     Add the common device tree description for the ADLINK LEC-iMX95
>     module and the I-Pi SMARC Plus carrier board.
>    =20
>     Describe the onboard peripherals and carrier-specific hardware
>     connections.
>    =20
>     Signed-off-by: Dinesh kumar v <dinesh.v@adlinktech.com>

[Severity: Low]
This isn't a bug, but the Author email address (dineshkumarv85@gmail.com) d=
oes
not match the Signed-off-by email address (dinesh.v@adlinktech.com). Should
these two addresses match?

> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts=
/freescale/Makefile
> index a80cccf34eb56..26b432127faa6 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -983,6 +983,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx95-verdin-wifi-ivy.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-verdin-wifi-mallow.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-verdin-wifi-yavia.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-verdin-wifi-zinnia.dtb
> +dtb-$(CONFIG_ARCH_MXC) +=3D imx95-lec-ipi-smarc.dtb

[Severity: Low]
This isn't a bug, but the imx95 targets in arch/arm64/boot/dts/freescale/Ma=
kefile
are sorted alphabetically. Should imx95-lec-ipi-smarc.dtb be placed between
imx95-aquila-dev.dtb and imx95-navq.dtb instead of at the end of the list?

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts b/arch=
/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts
> new file mode 100644
> index 0000000000000..9a77bff42b225
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts

[ ... ]

> +/* Ethernet SMARC GBE0 */
> +&enetc_port0 {
> +	pinctrl-0 =3D <&pinctrl_enetc0>;
> +	phy-handle =3D <&ethphy0>;
> +	pinctrl-names =3D "default";
> +	phy-mode =3D "rgmii-id";
> +
> +	status =3D "okay";
> +};
> +
> +/* Ethernet SMARC GBE1 */
> +&enetc_port1 {
> +	pinctrl-0 =3D <&pinctrl_enetc1>;
> +	phy-handle =3D <&ethphy1>;
> +	pinctrl-names =3D "default";
> +	phy-mode =3D "rgmii-id";
> +
> +	status =3D "okay";
> +};
> +
> +&lpi2c2 {
> +	clock-frequency =3D <100000>;
> +	pinctrl-0 =3D <&pinctrl_lpi2c2>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +
> +	/* U1000 SX1509BIULTRT_SEMTECH */
> +	i2c2_gpio_expander_71: pinctrl@71 {
> +		/*
> +		 * GPIO Expander Mapping:
> +		 * - 0: ENET1_RST_B_3V		=3D>		U2001
> +		 * - 1: ENET2_RST_B_3V		=3D>		U2101
> +		 * - 2: SERDES_RST#_3V		=3D>		SMARC S77 PCIE_C_RST
> +		 * - 3: RC210_EN_3V		=3D>		U1300, RC21008B001GND
> +		 * - 4: LT9611_RSTN_3V		=3D>		U1500
> +		 * - 5: HDMI_INT_3V		<=3D		U1500
> +		 * - 6: PCIEA_RST#_3V		=3D>		SMARC P75
> +		 * - 7: PCIEB_RST#_3V		=3D>		SMARC S76
> +		 * - 8: TPM_RST_N_1V8		=3D>		U2400
> +		 * - 9: LID#_1V8		<=3D	R1005	SMARC S148
> +		 * - 10: SLEEP#_1V8		<=3D	R1010	SMARC S149
> +		 * - 11: CHARGING#_1V8		<=3D	R1007	SMARC S151
> +		 * - 12: CHARGER_PRSNT#_1V8	<=3D	R1011	SMARC S152
> +		 * - 13: BATLOW#_1V8		<=3D	R1014	SMARC S156
> +		 * - 14: TEST#_1V8		<=3D	R1015	SMARC S157
> +		 * - 15: DSI0_TE_1V8		<=3D	R1087	SMARC S144
> +		 */
> +		compatible =3D "semtech,sx1509q";
> +		reg =3D <0x71>;
> +		#gpio-cells =3D <2>;
> +		gpio-controller;
> +		#interrupt-cells =3D <2>;
> +		interrupt-controller;
> +		interrupt-parent =3D <&gpio4>;
> +		interrupts =3D <15 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 =3D <&pinctrl_sx1509q>;
> +		pinctrl-names =3D "default";
> +		semtech,probe-reset;
> +
> +		status =3D "okay";
> +	};
> +};

[ ... ]

> +&netc_emdio {
> +	pinctrl-0 =3D <&pinctrl_emdio>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +
> +	ethphy0: ethernet-phy@1 {
> +		compatible =3D "ethernet-phy-id001c.c916";
> +		reg =3D <1>;
> +		eee-broken-1000t;
> +		realtek,clkout-disable;
> +	};
> +
> +	ethphy1: ethernet-phy@4 {
> +		compatible =3D "ethernet-phy-id001c.c916";
> +		reg =3D <4>;
> +		eee-broken-1000t;
> +		realtek,clkout-disable;
> +	};
> +};

[ ... ]

> +&usb3 {
> +	status =3D "okay";
> +};
> +
> +&usb3_dwc3 {
> +	dr_mode =3D "host";
> +	snps,dis-u1-entry-quirk;
> +	snps,dis-u2-entry-quirk;
> +
> +	status =3D "okay";
> +};

[Severity: Low]
In arch/arm64/boot/dts/freescale/imx95.dtsi, usb3 and usb3_dwc3 are labels =
on
the same flattened usb@4c100000 node:

    usb3: usb3_dwc3: usb@4c100000 {

Should &usb3 and &usb3_dwc3 in arch/arm64/boot/dts/freescale/imx95-lec-ipi-=
smarc.dts
be merged into a single node reference so status =3D "okay" is not set twic=
e on
the same node?

> +
> +&usb3_phy {
> +	status =3D "okay";
> +};
> +
> +&usdhc1 {
> +	status =3D "okay";
> +};

[Severity: Low]
Several on-module components and module pinmux bindings are placed here in
arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts rather than in
arch/arm64/boot/dts/freescale/imx95-lec.dtsi:

- i2c2_gpio_expander_71 under lpi2c2 is on the module (its interrupt pin is
  named and muxed via pinctrl_sx1509q in imx95-lec.dtsi, and its pins contr=
ol
  on-module devices as well as SMARC signals).
- ethphy0 and ethphy1 under netc_emdio, along with the RGMII/MDIO pinctrl-0
  and phy-mode properties on enetc_port0, enetc_port1, and netc_emdio, are =
part
  of the SMARC module's GBE0/GBE1 implementation.
- usdhc1 is configured as the non-removable on-module storage in
  imx95-lec.dtsi, but status =3D "okay" is only set in the carrier board fi=
le.
- The pinctrl-0 and pinctrl-names properties referencing the pinctrl_* grou=
ps
  defined in imx95-lec.dtsi are only attached to the peripheral nodes in
  imx95-lec-ipi-smarc.dts.

Should these on-module definitions and pinctrl properties be moved into
imx95-lec.dtsi so that other carrier board device trees including
imx95-lec.dtsi do not have to duplicate them?

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx95-lec.dtsi b/arch/arm64/bo=
ot/dts/freescale/imx95-lec.dtsi
> new file mode 100644
> index 0000000000000..60d68c146ae46
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-lec.dtsi

[ ... ]

> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> +		bootph-pre-ram;
> +		fsl,pins =3D <IMX95_PAD_SD1_CLK__USDHC1_CLK			0x158e>,
> +			   <IMX95_PAD_SD1_CMD__USDHC1_CMD			0x138e>,
> +			   <IMX95_PAD_SD1_DATA0__USDHC1_DATA0			0x138e>,
> +			   <IMX95_PAD_SD1_DATA1__USDHC1_DATA1			0x138e>,
> +			   <IMX95_PAD_SD1_DATA2__USDHC1_DATA2			0x138e>,
> +			   <IMX95_PAD_SD1_DATA3__USDHC1_DATA3			0x138e>,
> +			   <IMX95_PAD_SD1_DATA4__USDHC1_DATA4			0x138e>,
> +			   <IMX95_PAD_SD1_DATA5__USDHC1_DATA5			0x138e>,
> +			   <IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x138e>,
> +			   <IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x138e>,
> +			   <IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x158e>;
> +	};
> +
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +		bootph-pre-ram;
> +		fsl,pins =3D <IMX95_PAD_SD1_CLK__USDHC1_CLK			0x15fe>,
> +			   <IMX95_PAD_SD1_CMD__USDHC1_CMD			0x13fe>,
> +			   <IMX95_PAD_SD1_DATA0__USDHC1_DATA0			0x13fe>,
> +			   <IMX95_PAD_SD1_DATA1__USDHC1_DATA1			0x13fe>,
> +			   <IMX95_PAD_SD1_DATA2__USDHC1_DATA2			0x13fe>,
> +			   <IMX95_PAD_SD1_DATA3__USDHC1_DATA3			0x13fe>,
> +			   <IMX95_PAD_SD1_DATA4__USDHC1_DATA4			0x13fe>,
> +			   <IMX95_PAD_SD1_DATA5__USDHC1_DATA5			0x13fe>,
> +			   <IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x13fe>,
> +			   <IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x13fe>,
> +			   <IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x15fe>;
> +	};
> +
> +	pinctrl_usdhc1: usdhc1grp {
> +		bootph-pre-ram;
> +		fsl,pins =3D <IMX95_PAD_SD1_CLK__USDHC1_CLK			0x158e>,
> +			   <IMX95_PAD_SD1_CMD__USDHC1_CMD			0x138e>,
> +			   <IMX95_PAD_SD1_DATA0__USDHC1_DATA0			0x138e>,
> +			   <IMX95_PAD_SD1_DATA1__USDHC1_DATA1			0x138e>,
> +			   <IMX95_PAD_SD1_DATA2__USDHC1_DATA2			0x138e>,
> +			   <IMX95_PAD_SD1_DATA3__USDHC1_DATA3			0x138e>,
> +			   <IMX95_PAD_SD1_DATA4__USDHC1_DATA4			0x138e>,
> +			   <IMX95_PAD_SD1_DATA5__USDHC1_DATA5			0x138e>,
> +			   <IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x138e>,
> +			   <IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x138e>,
> +			   <IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x158e>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> +		bootph-pre-ram;
> +		fsl,pins =3D <IMX95_PAD_SD2_CLK__USDHC2_CLK			0x158e>,
> +			   <IMX95_PAD_SD2_CMD__USDHC2_CMD			0x138e>,
> +			   <IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x138e>,
> +			   <IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x138e>,
> +			   <IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e>,
> +			   <IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e>,
> +			   <IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		bootph-pre-ram;
> +		fsl,pins =3D <IMX95_PAD_SD2_CLK__USDHC2_CLK			0x158e>,
> +			   <IMX95_PAD_SD2_CMD__USDHC2_CMD			0x138e>,
> +			   <IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x138e>,
> +			   <IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x138e>,
> +			   <IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e>,
> +			   <IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e>,
> +			   <IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e>;
> +	};
> +
> +	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> +		bootph-pre-ram;
> +		fsl,pins =3D <IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0		0x31e>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2grp {
> +		bootph-pre-ram;
> +		fsl,pins =3D <IMX95_PAD_SD2_CLK__USDHC2_CLK			0x158e>,
> +			   <IMX95_PAD_SD2_CMD__USDHC2_CMD			0x138e>,
> +			   <IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x138e>,
> +			   <IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x138e>,
> +			   <IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e>,
> +			   <IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e>,
> +			   <IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e>;
> +	};

[Severity: Low]
In scmi_iomuxc in arch/arm64/boot/dts/freescale/imx95-lec.dtsi,
pinctrl_usdhc2_200mhz uses the same 0x158e and 0x138e pad configuration val=
ues
as pinctrl_usdhc2_100mhz and pinctrl_usdhc2, whereas pinctrl_usdhc1_200mhz =
uses
0x15fe and 0x13fe. In addition, pinctrl_usdhc1_100mhz is identical to
pinctrl_usdhc1, and pinctrl_usdhc2_100mhz is identical to pinctrl_usdhc2.

Should pinctrl_usdhc2_200mhz use 0x15fe/0x13fe for 200MHz operation, or if =
all
states intentionally use the same pad settings, can the duplicate pinctrl
groups be dropped in favor of reusing pinctrl_usdhc1 and pinctrl_usdhc2?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102102653.2720=
56-1-dinesh.v@adlinktech.com?part=3D3
