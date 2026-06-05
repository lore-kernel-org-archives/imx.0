Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309A12EEE95
	for <imx@lists.linux.dev>; Fri,  5 Jun 2026 08:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780649961; cv=none; b=rH5dRqcojBpSbKb0LhlpN81ypVMt783BAe9mtAmvJizI21qM5i1SncLGzUtnfdV92Ty/qkclAYPWpIjuk2nV5nLyRS9jixXd18SwuUBUrzngOagfG2G8ojATNQi+dnzjYDaJQ+kpFuFCR7UZNTVvBmSNnmVZUn49YqsTQtgrcMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780649961; c=relaxed/simple;
	bh=LMUn8d9dUrhCqw3CZhZMtT5jf2FP/joi4N83ANL1h8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ugebhHsQIInb7vyaZVdlnWQ5V/Bg+QFTS/qS7CUdsSXr3oAy8qLATVYqzjakbL/MvkEHIH3wx4mqsxaWQe5UifLRDPj2rk2pCcVUtunpj5edvJnnc72Ut/vdGKhUG5TU0eUrOLv14wXIEr2wvq3ri3s11gwVr+yotZBHrkzJH+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A162A1A1A7F;
	Fri,  5 Jun 2026 10:59:12 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6B2421A1A01;
	Fri,  5 Jun 2026 10:59:12 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 0EBBC1800071;
	Fri,  5 Jun 2026 16:59:09 +0800 (+08)
Date: Fri, 5 Jun 2026 17:59:08 +0900
From: Joseph Guo <qijian.guo@nxp.com>
To: Francesco Valla <francesco@valla.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, steven.yang@nxp.com
Subject: Re: [PATCH] arm64: dts: imx93-11x11-frdm: enable additional devices
Message-ID: <aiKP3EgdrCbqtUH0@lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com>
References: <20260115-imx93_devices-v1-1-b2c840cafa2e@valla.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-imx93_devices-v1-1-b2c840cafa2e@valla.it>
X-Virus-Scanned: ClamAV using ClamSMTP

On Thu, Jan 15, 2026 at 06:11:34PM +0100, Francesco Valla wrote:
> Enable additional devices on the i.MX93 FRDM board:
> 
>   - CAN port and associated transceiver
>   - Bluetooth portion of the IW612 chipset
>   - WiFi SDIO port
>   - user buttons
> 
> The WiFi portion of the on-board IW612 chipset is still not supported
> upstream, but since SDIO is a discoverable bus it will be probed once it
> is.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
> Applies on top of [0].
> 
> WiFi was tested using the nxpwifi driver proposed in [1].
> 
> [0] https://lore.kernel.org/all/20260113075002.561453-1-daniel.baluta@nxp.com/
> [1] https://lore.kernel.org/all/20251205065545.3325032-1-jeff.chen_1@nxp.com/
> 
> Reagrds,
> Francesco
> ---
>  arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 152 +++++++++++++++++++++
>  1 file changed, 152 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> index 5bb6ae0d154a655283295b6902fc29bf6f744d5c..bd14ba28690c081817111aaabef12fb56a7c56a4 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> @@ -9,6 +9,7 @@ / {
>  	model = "NXP i.MX93 11X11 FRDM board";
>  
>  	aliases {
> +		can0 = &flexcan2;
>  		ethernet0 = &fec;
>  		ethernet1 = &eqos;
>  		i2c0 = &lpi2c1;
> @@ -18,12 +19,40 @@ aliases {
>  		mmc1 = &usdhc2; /* uSD */
>  		rtc0 = &pcf2131;
>  		serial0 = &lpuart1;
> +		serial4 = &lpuart5;
>  	};
>  
>  	chosen {
>  		stdout-path = &lpuart1;
>  	};
>  
> +	flexcan2_phy: can-phy {
> +		compatible = "nxp,tja1051";
> +		#phy-cells = <0>;
> +		max-bitrate = <5000000>;
> +		silent-gpios = <&pcal6524 23 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		button-k2 {
> +			label = "Button K2";
> +			linux,code = <BTN_1>;
> +			gpios = <&pcal6524 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			interrupt-parent = <&pcal6524>;
> +			interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
> +		};
> +
> +		button-k3 {
> +			label = "Button K3";
> +			linux,code = <BTN_2>;
> +			gpios = <&pcal6524 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			interrupt-parent = <&pcal6524>;
> +			interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
> +		};
> +	};
> +
>  	reg_usdhc2_vmmc: regulator-usdhc2 {
>  		compatible = "regulator-fixed";
>  		off-on-delay-us = <12000>;
> @@ -37,6 +66,16 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
>  		enable-active-high;
>  	};
>  
> +	reg_usdhc3_vmmc: regulator-usdhc3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VPCIe_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		startup-delay-us = <20000>;
> +		gpio = <&pcal6524 13 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
>  	reserved-memory {
>  		ranges;
>  		#address-cells = <2>;
> @@ -88,6 +127,11 @@ sound-mqs {
>  		audio-cpu = <&sai1>;
>  		audio-codec = <&mqs1>;
>  	};
> +
> +	usdhc3_pwrseq: mmc-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
> +	};
>  };
>  
>  &adc1 {
> @@ -157,11 +201,27 @@ ethphy2: ethernet-phy@2 {
>  	};
>  };
>  
> +&flexcan2 {
> +	phys = <&flexcan2_phy>;
> +	pinctrl-0 = <&pinctrl_flexcan2>;
> +	pinctrl-1 = <&pinctrl_flexcan2_sleep>;
> +	pinctrl-names = "default", "sleep";
> +	status = "okay";
> +};
> +
>  &lpi2c1 {
>  	clock-frequency = <400000>;
>  	pinctrl-0 = <&pinctrl_lpi2c1>;
>  	pinctrl-names = "default";
>  	status = "okay";
> +
> +	pcal6408: gpio@20 {
> +		compatible = "nxp,pcal6408";
> +		reg = <0x20>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		reset-gpios = <&pcal6524 20 GPIO_ACTIVE_LOW>;
> +	};
>  };
>  
>  &lpi2c2 {
> @@ -322,6 +382,21 @@ &lpuart1 { /* console */
>  	status = "okay";
>  };
>  
> +&lpuart5 {
> +	pinctrl-0 = <&pinctrl_uart5>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	uart-has-rtscts;
> +
> +	bluetooth {
> +		compatible = "nxp,88w8987-bt";
> +		device-wakeup-gpios = <&pcal6408 3 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&pcal6524 19 GPIO_ACTIVE_LOW>;
> +		vcc-supply = <&reg_usdhc3_vmmc>;
> +	};
> +};
Hi Francesco,

Do you ever tried bluetooth feature? The bluetooth failed to scan with 'device-wakeup-gpios' property.

Regards,
Joseph

> +
>  &mqs1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_mqs1>;
> @@ -394,6 +469,20 @@ &usdhc2 {
>  	status = "okay";
>  };
>  
> +&usdhc3 {
> +	bus-width = <4>;
> +	keep-power-in-suspend;
> +	mmc-pwrseq = <&usdhc3_pwrseq>;
> +	non-removable;
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> +	pinctrl-3 = <&pinctrl_usdhc3_sleep>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	vmmc-supply = <&reg_usdhc3_vmmc>;
> +	status = "okay";
> +};
> +
>  &wdog3 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_wdog>;
> @@ -486,6 +575,13 @@ MX93_PAD_GPIO_IO27__CAN2_RX			0x139e
>  		>;
>  	};
>  
> +	pinctrl_flexcan2_sleep: flexcan2sleepgrp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO25__GPIO2_IO25			0x31e
> +			MX93_PAD_GPIO_IO27__GPIO2_IO27			0x31e
> +		>;
> +	};
> +
>  	pinctrl_lpi2c1: lpi2c1grp {
>  		fsl,pins = <
>  			MX93_PAD_I2C1_SCL__LPI2C1_SCL			0x40000b9e
> @@ -533,6 +629,15 @@ MX93_PAD_UART1_TXD__LPUART1_TX			0x31e
>  		>;
>  	};
>  
> +	pinctrl_uart5: uart5grp {
> +		fsl,pins = <
> +			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX		0x31e
> +			MX93_PAD_DAP_TDI__LPUART5_RX			0x31e
> +			MX93_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B		0x31e
> +			MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B		0x31e
> +		>;
> +	};
> +
>  	/* need to config the SION for data and cmd pad, refer to ERR052021 */
>  	pinctrl_usdhc1: usdhc1grp {
>  		fsl,pins = <
> @@ -647,6 +752,53 @@ MX93_PAD_SD2_VSELECT__GPIO3_IO19	0x51e
>  		>;
>  	};
>  
> +		/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins = <
> +			MX93_PAD_SD3_CLK__USDHC3_CLK		0x1582
> +			MX93_PAD_SD3_CMD__USDHC3_CMD		0x40001382
> +			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x40001382
> +			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x40001382
> +			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x40001382
> +			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x40001382
> +		>;
> +	};
> +
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD3_CLK__USDHC3_CLK		0x158e
> +			MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000138e
> +			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x4000138e
> +			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x4000138e
> +			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x4000138e
> +			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x4000138e
> +		>;
> +	};
> +
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD3_CLK__USDHC3_CLK		0x15fe
> +			MX93_PAD_SD3_CMD__USDHC3_CMD		0x400013fe
> +			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe
> +			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe
> +			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe
> +			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_sleep: usdhc3grpsleepgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD3_CLK__GPIO3_IO20		0x31e
> +			MX93_PAD_SD3_CMD__GPIO3_IO21		0x31e
> +			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x31e
> +			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x31e
> +			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x31e
> +			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
> +		>;
> +	};
> +
>  	pinctrl_wdog: wdoggrp {
>  		fsl,pins = <
>  			MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY	0x31e
> 
> ---
> base-commit: 8ce368ca61310f425012fea4549d2b6ad0c5c54c
> change-id: 20260114-imx93_devices-a98e116463b3
> 
> Best regards,
> -- 
> Francesco Valla <francesco@valla.it>
> 
