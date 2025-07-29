Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9EE262FC8
	for <imx@lists.linux.dev>; Tue, 29 Jul 2025 07:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753772963; cv=none; b=tS1PCfGrT1Cvm6A/oA6CpP2Vh7DocbwIEI4puwBS4jUwKsPLKXNIxOTrL+gnTAKG+ft1vUoR+6n9HgfeE0scWe/2dgUTA3qcCfVwbjSQJlb6RUYQbhcAr567lbFPGPQe2k4/JoqO6jx8jif5LFgDIoL/QqLqNxRYGV5pmDmzss8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753772963; c=relaxed/simple;
	bh=ttp2pg2E0G3O80bmEVNhTPN71XGz8PyVEn/p3TKXl4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f26FY86CVoA6YV0Pur8kWeVmHMu5EDKHczOS+N0D09ftLuRh+w8LXQWb5gkDn7qQV6HUaDxdRB8nQRuzeE9/6tmPcNyMQeJP7whpdNUhDYnKdr7z8PVNGb8mWbL1E33K8AFCFIkDYlhEvlMrkPSxRJOQKvlr+njLw/UFO7/8sCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwy6irSe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwy6irSe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D278C4CEEF;
	Tue, 29 Jul 2025 07:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753772963;
	bh=ttp2pg2E0G3O80bmEVNhTPN71XGz8PyVEn/p3TKXl4g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nwy6irSehLHGu5rfkzfkd4HLD5YioRJZDrqnkuzzSYI2M2fUOejevx4XKpReThkH0
	 OZcJF9A1ee+YCWH9/vfAu6srb4Eco0e0HfmAiBUb5ObcF/y9YzgMQ+umtHO0aAElrI
	 Avczupp7E0D+PdBDbxobFoVIdpfUsKEqrbzjXzPdCr1AQvZ19wxL//tKaxoJSFwdox
	 lbzLRD8PIMbG9jx9MQZubXe7lAupAPiezZ7OsemHZMYQqUPFGnpWYhYjFcEtbtMz0g
	 H1y1TKzk3zx/JYccH70Wt7wucZfZJJt+Q2/SzP5G4drr15uI1AiFKBG/uy1pHJfHZH
	 AFyd1NqB4smVw==
Message-ID: <4beb3a10-79c8-493e-bd28-80172a8e87b7@kernel.org>
Date: Tue, 29 Jul 2025 09:09:19 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 staging] staging: debix-model-a: update DTS for debix
 model a
To: WangErQian <WangErQianY@icloud.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
References: <20250729030448.3872138-1-WangErQianY@icloud.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250729030448.3872138-1-WangErQianY@icloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/07/2025 05:04, WangErQian wrote:
> Update the device tree for Debix Model A
> 
> Signed-off-by: WangErQian <WangErQianY@icloud.com>

You ned to use real name.

> ---
>  .../dts/freescale/imx8mp-debix-model-a.dts    | 871 +++++++++++++++---
>  1 file changed, 752 insertions(+), 119 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> index af02af9e5334..c398be341ff8 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/usb/pd.h>
> +#include <dt-bindings/phy/phy-imx8-pcie.h>
>  
>  #include "imx8mp.dtsi"
>  
> @@ -20,13 +21,22 @@ chosen {
>  		stdout-path = &uart2;
>  	};
>  
> +	bt_rfkill {

Please follow DTS coding style closely.

...

> +&ecspi1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	fsl,spi-num-chipselects = <1>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_ecspi1 &pinctrl_ecspi1_cs>;
> +	cs-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +	spidev1: spi@0 {
> +		reg = <0>;
> +		compatible = "rohm,dh2228fv";

No, it is not true. You do not have such thing there.

> +		spi-max-frequency = <20000000>;
> +	};
> +};
> +
> +&ecspi2 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	fsl,spi-num-chipselects = <1>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_ecspi2 &pinctrl_ecspi2_cs>;
> +	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +
> +	spidev2: spi@0 {
> +		reg = <0>;
> +		compatible = "rohm,dh2228fv";

No, not true. Drop entire node.

> +		spi-max-frequency = <20000000>;
> +	};
> +};
> +


..

>  
> +&flexcan1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan1>;
> +	//xceiver-supply = <&reg_can1_stby>;

Why are you adding dead code?

> +	status = "okay";
> +};
> +
> +&flexcan2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan2>;
> +	//xceiver-supply = <&reg_can2_stby>;
> +	//pinctrl-assert-gpios = <&pca6416 3 GPIO_ACTIVE_HIGH>;
> +	status = "okay";/* can2 pin conflict with pdm */
> +};
> +
> +&flexspi {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexspi0>;
> +	status = "disabled";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <80000000>;
> +		spi-tx-bus-width = <1>;
> +		spi-rx-bus-width = <4>;
> +	};
> +};
> +
> +&hdmi_blk_ctrl {
> +	status = "okay";
> +};
> +
>  &hdmi_pvi {
>  	status = "okay";
>  };
> @@ -114,11 +353,11 @@ &hdmi_tx {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_hdmi>;
>  	status = "okay";
> -
>  	ports {
>  		port@1 {
> +			reg = <1>;
>  			hdmi_tx_out: endpoint {
> -				remote-endpoint = <&hdmi_connector_in>;
> +				remote-endpoint = <&hdmi_connector_out>;
>  			};
>  		};
>  	};
> @@ -128,6 +367,10 @@ &hdmi_tx_phy {
>  	status = "okay";
>  };
>  
> +&irqsteer_hdmi {
> +	status = "okay";
> +};
> +
>  &i2c1 {
>  	clock-frequency = <400000>;
>  	pinctrl-names = "default";
> @@ -140,7 +383,7 @@ pmic@25 {
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&pinctrl_pmic>;
>  		interrupt-parent = <&gpio1>;
> -		interrupts = <3 IRQ_TYPE_EDGE_RISING>;
> +		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
>  
>  		regulators {
>  			buck1: BUCK1 {
> @@ -163,7 +406,7 @@ buck2: BUCK2 {
>  				nxp,dvs-standby-voltage = <850000>;
>  			};
>  
> -			buck4: BUCK4 {
> +			buck4: BUCK4{
>  				regulator-name = "BUCK4";
>  				regulator-min-microvolt = <600000>;
>  				regulator-max-microvolt = <3400000>;
> @@ -171,7 +414,7 @@ buck4: BUCK4 {
>  				regulator-always-on;
>  			};
>  
> -			buck5: BUCK5 {
> +			buck5: BUCK5{
>  				regulator-name = "BUCK5";
>  				regulator-min-microvolt = <600000>;
>  				regulator-max-microvolt = <3400000>;
> @@ -231,8 +474,10 @@ ldo5: LDO5 {
>  };
>  
>  &i2c2 {
> +	clock-frequency = <400000>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_i2c2>;
> +	status = "okay";
>  };
>  
>  &i2c3 {
> @@ -240,30 +485,72 @@ &i2c3 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_i2c3>;
>  	status = "okay";
> +
> +	codec: es8316@10 {
> +		compatible = "everest,es8316";
> +		reg = <0x10>;
> +		clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>;
> +		clock-names = "mclk";
> +	};
>  };
>  
>  &i2c4 {
> -	clock-frequency = <100000>;
> +	clock-frequency = <50000>;

Why one patch is making so many changes?

Nothing in the commit msg explains that. Read carefully submitting
patches - it explains what you should do.


>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_i2c4>;
>  	status = "okay";
>  
> -	eeprom@50 {
> +	eeprom1: eeprom@50 {
>  		compatible = "atmel,24c02";
>  		reg = <0x50>;
>  		pagesize = <16>;
>  	};
>  
> -	rtc@51 {
> +	hym8563: hym8563@51 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation



>  		compatible = "haoyu,hym8563";
>  		reg = <0x51>;
>  		#clock-cells = <0>;
> +		clock-frequency = <32768>;
>  		clock-output-names = "xin32k";
> +		init_date="2022/04/12";
>  		interrupt-parent = <&gpio2>;
>  		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
> +
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&pinctrl_rtc_int>;
>  	};
> +	ads1115: ads1115@48 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation



> +		compatible = "ti,ads1115";
> +		status = "okay";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x48>;
> +		channel@4 {
> +		 reg = <4>;
> +		 ti,gain = <1>;
> +		 ti,datarate = <4>;
> +		};
> +		channel@5 {
> +		 reg = <5>;
> +		 ti,gain = <1>;
> +		 ti,datarate = <4>;
> +		};
> +		channel@3 {
> +		 reg = <3>;
> +		 ti,gain = <1>;
> +		 ti,datarate = <4>;
> +		};
> +		channel@6 {
> +		 reg = <6>;
> +		 ti,gain = <1>;
> +		 ti,datarate = <4>;
> +		};
> +		channel@7 {
> +		 reg = <7>;
> +		 ti,gain = <1>;
> +		 ti,datarate = <4>;
> +		};
> +	};
>  };
>  
>  &i2c6 {
> @@ -273,14 +560,85 @@ &i2c6 {
>  	status = "okay";
>  };
>  
> +&lcdif1 {
> +	status = "okay";
> +};
> +
> +&lcdif2 {
> +	status = "okay";
> +};
> +
>  &lcdif3 {
>  	status = "okay";
> +
> +	thres-low  = <1 2>;
> +	thres-high = <3 4>;
> +};
> +
> +&lvds_bridge {
> +	status = "disabled";
> +};
> +
> +&media_blk_ctrl {
> +	status = "disabled";
> +};
> +
> +&mipi_dsi {
> +	status = "disabled";
> +};
> +
> +&pcie {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pcie0>;
> +	reset-gpio = <&gpio4 27 GPIO_ACTIVE_LOW>;
> +	vpcie-supply = <&reg_pcie0>;
> +	status = "disabled";
> +};
> +
> +&pcie_phy {
> +	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
> +	clocks = <&pcie0_refclk>;
> +	clock-names = "ref";
> +	status = "disabled";
> +};
> +
> +&pwm2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm2>;
> +	status = "disabled";
> +};
> +
> +&sai3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sai3>;
> +	assigned-clocks = <&clk IMX8MP_CLK_SAI3>;
> +	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
> +	assigned-clock-rates = <12288000>;
> +	clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_IPG>, <&clk IMX8MP_CLK_DUMMY>,
> +		 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>, <&clk IMX8MP_CLK_DUMMY>,
> +		 <&clk IMX8MP_CLK_DUMMY>;
> +	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> +	fsl,sai-mclk-direction-output;
> +	status = "okay";
> +};
> +
> +&sdma2 {
> +	status = "okay";
>  };
>  
>  &snvs_pwrkey {
>  	status = "okay";
>  };
>  
> +&uart1 { /* BT */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	assigned-clocks = <&clk IMX8MP_CLK_UART1>;
> +	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
> +	uart-has-rtscts;
> +	status = "okay";
> +};
> +
>  &uart2 {
>  	/* console */
>  	pinctrl-names = "default";
> @@ -300,7 +658,28 @@ &uart4 {
>  	status = "okay";
>  };
>  
> +&usb3_phy0 {
> +	status = "okay";
> +};
> +
> +&usb3_0 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3_0 {
> +	dr_mode = "otg";
> +	hnp-disable;
> +	srp-disable;
> +	adp-disable;
> +	usb-role-switch;
> +	snps,dis-u1-entry-quirk;
> +	snps,dis-u2-entry-quirk;
> +	status = "okay";
> +};
> +
>  &usb3_phy1 {
> +	fsl,phy-tx-preemp-amp-tune = <3>;
> +	fsl,phy-tx-vref-tune = <0xb>;
>  	status = "okay";
>  };
>  
> @@ -309,32 +688,45 @@ &usb3_1 {
>  };
>  
>  &usb_dwc3_1 {
> -	#address-cells = <1>;
> -	#size-cells = <0>;
>  	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_usb1>;
> +	pinctrl-0 = <&pinctrl_usb1_vbus>;
> +	hub-pwd-gpio = <&gpio4 26 GPIO_ACTIVE_LOW>;
> +	hub-reset-gpio = <&gpio4 25 GPIO_ACTIVE_LOW>;
>  	dr_mode = "host";
>  	status = "okay";
> +};
>  
> -	/* 2.x hub on port 1 */
> -	usb_hub_2_x: hub@1 {
> -		compatible = "usbbda,5411";
> -		reg = <1>;
> -		vdd-supply = <&reg_usb_hub>;
> -		peer-hub = <&usb_hub_3_x>;
> -	};
> +/*WIFI */
> +&usdhc1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_wlan_wake_host>;
> +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_wlan_wake_host>;
> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_wlan_wake_host>;
> +	bus-width = <4>;
> +	pm-ignore-notify;
> +	keep-power-in-suspend;
> +	non-removable;
> +	cap-power-off-card;
> +	/delete-property/ vmmc-supply;
> +	mmc-pwrseq = <&usdhc1_pwrseq>;
> +	status = "okay";
> +	max-frequency = <100000000>;
>  
> -	/* 3.x hub on port 2 */
> -	usb_hub_3_x: hub@2 {
> -		compatible = "usbbda,411";
> -		reg = <2>;
> -		vdd-supply = <&reg_usb_hub>;
> -		peer-hub = <&usb_hub_2_x>;
> +	brcmf: bcrmf@1 {
> +		reg = <1>;
> +		compatible = "brcm,bcm4329-fmac";
> +		interrupt-parent = <&gpio2>;
> +		interrupts = <9 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "host-wake";
>  	};
>  };
>  
>  /* SD Card */
>  &usdhc2 {
> +	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
> +	assigned-clock-rates = <400000000>;
>  	pinctrl-names = "default", "state_100mhz", "state_200mhz";
>  	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
>  	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> @@ -366,25 +758,108 @@ &wdog1 {
>  };
>  
>  &iomuxc {
> +	pinctrl_bt_ctrl: btctrlgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06        0x41
> +			MX8MP_IOMUXC_SD1_DATA5__GPIO2_IO07        0x41
> +			MX8MP_IOMUXC_SD1_DATA6__GPIO2_IO08        0x16
> +		>;
> +	};
> +
> +	pinctrl_ecspi1: ecspi1grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI1_SCLK__ECSPI1_SCLK		0x82
> +			MX8MP_IOMUXC_ECSPI1_MOSI__ECSPI1_MOSI		0x82
> +			MX8MP_IOMUXC_ECSPI1_MISO__ECSPI1_MISO		0x82
> +		>;
> +	};
> +
> +	pinctrl_ecspi1_cs: ecspi1cs {

Looks never tested.


Also:

<form letter>
Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument, so you will
not CC people just because they made one commit years ago). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline) or work on fork of kernel
(don't, instead use mainline). Just use b4 and everything should be
fine, although remember about `b4 prep --auto-to-cc` if you added new
patches to the patchset.
</form letter>


Best regards,
Krzysztof
