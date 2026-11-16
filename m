Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829002;
	b=fIx87xyqj3jMUZN05opIbL4vmxr1bs+PQUYBvTsUCu6W8DRve7MNzriQYgNwT2HJossl
	 ma4GPayucdU17UDrb52IND2V9rViD2CptuAHr050YyWEp/N/4K01eKoh+06pPl8ALGFeB
	 4MLm/fEN99xEpB7O6yCwB51MXaS7EYGiCfN6HHwcsZgYdP+SATLQ7zLpolfiIjVIM8kUj
	 iQPBvrvJB8KUCj66+eVDNqO0/3TplqAm1L5cplmc3N5aLmUBk7ywkeCyTPf0tvvP7U+1S
	 wwLJZXTQ+aMVzgf6Y3gpDjI4bmBNJwQJEoJPp6j1v1gLSKSq0NIlBTmYgpi6Jri62Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829002;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oZKP5Z/jwozKHx23Ts/K4LfZlrjoVt0E7Z94tJcPuoI=;
	b=FhkSel+qlFZLshvCJwzlrnVhdPh37+LGovtgLmBpVMGxsDdjOwNfHS0+n3jkp/jP0+9m
	 wTc6c6MmxcpMqta7nyyfFPelnwRu2xwS6RmL5a7iB4r5tSyKDzcMToi1B+0Q94+yYGi/T
	 Llj5b6+MTu4OWV4gflXwjdrEta9awlB4lh3JMn2366VfbPNnsEVkJRDcDeQR0tFHtqXP6
	 Lm7sJllds2HhrdsyKBUx0e7bsnjiTcep7W1ZO552KseAtJihZdQjVHEnk+qxODAfJgBM3
	 V96505auu5txG3P0qZkgMEG90xFwM3pkxVSYnslBHmnbLgIlOtVYjPY1xruALA1ZucQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D1BBYhjz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB65A606A329;
	Mon, 16 Nov 2026 11:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D1BBYhjz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 181981F000C4;
	Mon, 16 Nov 2026 11:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794829002;
	bh=oZKP5Z/jwozKHx23Ts/K4LfZlrjoVt0E7Z94tJcPuoI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D1BBYhjzmC0Gk+sR1OdNXa7fR/PxKAuT1/DjPnXXlFQTECGGHDtCDfpbGCP2Q6XSW
	 e4lMYGMEdZiDwlpkly2W5aVzzuuDD4Jf3mGzNmzPyi4QWreEKWHJFc3TIkE1OVi8Aq
	 dkRypcjaxww1BnSP0WkBxSi1cLpaPxN5gxlChxV29ubDp8XcJ6VLyyLGz69UKeXqjv
	 d/AvToznU+tQWPhc95Fh+KMrxB9oo3FUzxNLDkQxSMHr8O8DvyDuhydy6AeKUuI5Ei
	 YYt0dMHdOxxMPZLbFfRbgQ28PbUM7MrQqLvjvFeLZUVOMSbVGpoO+WxTDT8P8Cq3eW
	 Oumukn9/8zDSA==
Message-ID: <sashiko-outbox-216951@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: Add phyFLEX-Libra i.MX 8M Plus FPSC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yannic Moog" <y.moog@phytec.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261116-imx8mp-phyflex-v1-2-4adcf8b4d373@phytec.de>
References: <20261116-imx8mp-phyflex-v1-0-4adcf8b4d373@phytec.de>
 <20261116-imx8mp-phyflex-v1-2-4adcf8b4d373@phytec.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 11:36:41 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 9 potential
issues to consider:
- [High] arm64: dts: imx8mp-phyflex: missing cs-gpios on ecspi1 and
  ecspi2
- [Medium] arm64: dts: imx8mp-phyflex: duplicate UART2_RXD pinmux in
  pinctrl_ecspi3
- [Medium] arm64: dts: imx8mp-phyflex: misplaced pcie0 properties and
  clkreq conflict
- [Medium] arm64: dts: imx8mp-phyflex: wrong compatible on 32-byte ID
  page eeprom@58
- [Medium] arm64: dts: imx8mp-phyflex: pull-downs enabled on usdhc1 CMD
  and DATA pins
- [Medium] arm64: dts: imx8mp: missing OF graph ports in
  m2-key-e-connector
- [Low] arm64: dts: imx8mp: 32.768 MHz typo in m2_suspend_clk
  clock-frequency
- [Low] arm64: dts: imx8mp: invalid port@2 on hd3ss3220 and usb3_phy0
  switch
- [Low] arm64: dts: imx8mp: duplicate gpio-line-names on gpio5 in
  libra-rdk
--

commit 6df61ef89e5f051cd50d9b4d059d503e1d71d85f
Author: Yannic Moog <y.moog@phytec.de>

arm64: dts: Add phyFLEX-Libra i.MX 8M Plus FPSC

This commit adds the SoM and RDK carrier board device trees for the
PHYTEC phyFLEX-Libra i.MX 8M Plus FPSC platform.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyflex-fpsc-g-som.dtsi=
 b/arch/arm64/boot/dts/freescale/imx8mp-phyflex-fpsc-g-som.dtsi
> new file mode 100644
> index 0000000000000..384a19743b15f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-phyflex-fpsc-g-som.dtsi

[ ... ]

> +	/* User EEPROM ID page */
> +	eeprom@58 {
> +		compatible =3D "atmel,24c32";
> +		reg =3D <0x58>;
> +		pagesize =3D <32>;
> +		vcc-supply =3D <&reg_vdd_io>;
> +	};

[Severity: Medium]
Should eeprom@58 use compatible =3D "atmel,24c32d-wl" instead of
"atmel,24c32"?

"atmel,24c32" registers a 4096-byte nvmem device instead of a 32-byte
identification page.  Reads past 32 bytes wrap around the page, and writes
to offsets >=3D 0x400 set address bit A10, which issues the hardware Lock ID
command on 24C32-D devices and permanently write-locks the identification
page.

[ ... ]

> +&iomuxc {
> +	pinctrl_ecspi1: ecspi1grp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_ECSPI1_SCLK__ECSPI1_SCLK   0x82    /* SPI1_SCLK */
> +			MX8MP_IOMUXC_ECSPI1_MOSI__ECSPI1_MOSI   0x82    /* SPI1_MOSI */
> +			MX8MP_IOMUXC_ECSPI1_MISO__ECSPI1_MISO   0x82    /* SPI1_MISO */
> +			MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09     0x106   /* SPI1_CS */
> +		>;
> +	};
> +
> +	pinctrl_ecspi2: ecspi2grp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK   0x82    /* SPI2_SCLK */
> +			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI   0x82    /* SPI2_MOSI */
> +			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO   0x82    /* SPI2_MISO */
> +			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13     0x106     /* SPI2_CS */
> +		>;
> +	};

[Severity: High]
Are cs-gpios missing on &ecspi1 and &ecspi2?

pinctrl_ecspi1 and pinctrl_ecspi2 mux the SS0 pads as GPIO5_IO09 and
GPIO5_IO13, but neither the SoM dtsi nor imx8mp-phyflex-libra-rdk.dts sets
cs-gpios on &ecspi1 or &ecspi2.  Without cs-gpios, spi-imx drives native
hardware SS0, which is disconnected from the pins, so chip-select is never
asserted for adc@0 on ecspi1 or tpm@0 on ecspi2.

> +
> +	pinctrl_ecspi3: ecspi3grp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_UART1_RXD__ECSPI3_SCLK     0x82    /* SPI3_SCLK */
> +			MX8MP_IOMUXC_UART1_TXD__ECSPI3_MOSI     0x82    /* SPI3_MOSI */
> +			MX8MP_IOMUXC_UART2_RXD__ECSPI3_MISO     0x82    /* SPI3_MISO */
> +			MX8MP_IOMUXC_UART2_RXD__GPIO5_IO24      0x106     /* SPI3_CS */
> +		>;
> +	};

[Severity: Medium]
Should the SPI3_CS pin in pinctrl_ecspi3 be
MX8MP_IOMUXC_UART2_TXD__GPIO5_IO25 instead of
MX8MP_IOMUXC_UART2_RXD__GPIO5_IO24?

Both entries configure the UART2_RXD pad, so the second entry overwrites
ECSPI3_MISO with GPIO5_IO24 and leaves the UART2_TXD pad unmuxed.  The
gpio-line-names property on &gpio5 also labels line 24 as "SPI3_CS"
instead of line 25.

[ ... ]

> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_GPIO1_IO07__USDHC1_WP	0x106	/* SDIO_WP */
> +			MX8MP_IOMUXC_GPIO1_IO06__USDHC1_CD_B	0x106	/* SDIO_CD */
> +			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x106	/* SDIO_CLK */
> +			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x106	/* SDIO_CLK */
> +			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x106	/* SDIO_DATA0 */
> +			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x106	/* SDIO_DATA1 */
> +			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x106	/* SDIO_DATA2 */
> +			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x106	/* SDIO_DATA3 */
> +		>;
> +	};

[Severity: Medium]
Does pad setting 0x106 enable internal pull-downs on the USDHC1 CMD and
DATA0..3 lines?

On i.MX8MP, 0x106 sets PE=3D1 with PUE=3D0 (pull-down), pulling the SDIO
command, data, and active-low DATA1 interrupt lines low when undriven
instead of pulling them high as 0x1d0 does on pinctrl_usdhc2 and
pinctrl_usdhc3.

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyflex-libra-rdk.dts b=
/arch/arm64/boot/dts/freescale/imx8mp-phyflex-libra-rdk.dts
> new file mode 100644
> index 0000000000000..7ebedbcba7c67
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-phyflex-libra-rdk.dts

[ ... ]

> +	m2-key-e-connector {
> +		compatible =3D "pcie-m2-e-connector";
> +		clocks =3D <&rv3028>;
> +		i2c-parent =3D <&i2c3>;
> +		sdio-reset-gpios =3D <&gpio_expander2 6 GPIO_ACTIVE_LOW>;
> +		sdio-wake-gpios =3D <&gpio_expander2 5 GPIO_ACTIVE_LOW>;
> +		uart-wake-gpios =3D <&gpio_expander1 13 GPIO_ACTIVE_LOW>;
> +		vpcie3v3-supply =3D <&reg_vdd_3v3>;
> +		w-disable1-gpios =3D <&gpio_expander1 9 GPIO_ACTIVE_LOW>;
> +		w-disable2-gpios =3D <&gpio_expander1 10 GPIO_ACTIVE_LOW>;
> +	};

[Severity: Medium]
Is m2-key-e-connector missing its OF graph ports node?

pwrseq_pcie_m2_probe() requests w-disable1-gpios and w-disable2-gpios
asserted (GPIOD_OUT_HIGH), and only deasserts them or creates the
Bluetooth serdev when endpoints are matched via the connector's ports
node.  Without ports, M.2 Wi-Fi and Bluetooth cards remain permanently
disabled when CONFIG_PWRSEQ_PCIE_M2 is enabled.

> +
> +	/* RTC (rv3028) clock is used by default */
> +	m2_suspend_clk: oscillator-suspend {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <32768000>;
> +		status =3D "disabled";
> +	};

[Severity: Low]
Should clock-frequency in m2_suspend_clk be 32768 instead of 32768000?
The M.2 Key E suspend clock (SUSCLK) is 32.768 kHz, not 32.768 MHz.

[ ... ]

> +&gpio5 {
> +	gpio-line-names =3D "", "", "", "", "I2C5_SDA",
> +			  "GPIO1", "", "", "", "SPI1_CS",
> +			  "", "", "", "SPI2_CS", "I2C1_SCL",
> +			  "I2C1_SDA", "I2C2_SCL", "I2C2_SDA", "I2C3_SCL", "I2C3_SDA",
> +			  "", "GPIO2", "", "", "SPI3_CS",
> +			  "", "GPIO3";
> +};

[Severity: Low]
This isn't a bug, but &gpio5 duplicates the exact same gpio-line-names
array already defined in imx8mp-phyflex-fpsc-g-som.dtsi.

[ ... ]

> +	usb-typec@47 {
> +		compatible =3D "ti,hd3ss3220";
> +		reg =3D <0x47>;
> +		id-gpios =3D <&gpio1 10 GPIO_ACTIVE_HIGH>;
> +		interrupt-parent =3D <&gpio_expander1>;
> +		interrupts =3D <4 IRQ_TYPE_LEVEL_LOW>;
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@0 {
> +				reg =3D <0>;
> +
> +				hd3ss3220_in_ep: endpoint {
> +					remote-endpoint =3D <&ss_ep>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg =3D <1>;
> +
> +				hd3ss3220_out_ep: endpoint {
> +					remote-endpoint =3D <&usb3_role_switch>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg =3D <2>;
> +				hd3ss3220_orientation_switch: endpoint {
> +					remote-endpoint =3D <&usb_phy_orientation_switch>;
> +				};
> +			};
> +		};
> +	};

[Severity: Low]
Does usb-typec@47 allow port@2, and does usb3_phy0 support
orientation-switch on i.MX8MP?

ti,hd3ss3220.yaml only permits port@0 and port@1 because the HD3SS3220
integrates the SuperSpeed orientation mux internally and its driver never
requests a typec_switch, so port@2 fails dtbs_check.  Likewise,
phy-fsl-imx8mq-usb only registers a typec_switch when a second TCA register
region is present (on i.MX95), which fsl,imx8mp-usb-phy does not have.

[ ... ]

> +/* M.2 PCIe */
> +&pcie0 {
> +	external-facing;
> +	reset-gpio =3D <&gpio1 8 GPIO_ACTIVE_LOW>;
> +	supports-clkreq;
> +	vpcie-supply =3D <&reg_vdd_3v3>;
> +	wake-gpios =3D <&gpio_expander1 11 GPIO_ACTIVE_LOW>;
> +	status =3D "okay";
> +};
> +
> +&pcie_phy {
> +	clocks =3D <&hsio_blk_ctrl>;
> +	clock-names =3D "ref";
> +	fsl,clkreq-unsupported;
> +	fsl,refclk-pad-mode =3D <IMX8_PCIE_REFCLK_PAD_OUTPUT>;
> +	status =3D "okay";
> +};

[Severity: Medium]
Should external-facing and wake-gpios be placed on the Root Port node
(&pcie0_port0) rather than &pcie0, and why are both supports-clkreq and
fsl,clkreq-unsupported set?

pci_set_bus_of_node() and pci_configure_of_wake_gpio() only read
external-facing and wake-gpios from the Root Port pci_dev node, so both
properties are ignored on the host controller node and fail
fsl,imx6q-pcie.yaml validation.  In addition, supports-clkreq on &pcie0
and fsl,clkreq-unsupported on &pcie_phy configure IOMUXC_GPR14 with
conflicting CLKREQ# settings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-imx8mp-phy=
flex-v1-0-4adcf8b4d373@phytec.de?part=3D2
