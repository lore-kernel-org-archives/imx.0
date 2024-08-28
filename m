Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8A154656
	for <imx@lists.linux.dev>; Wed, 28 Aug 2024 02:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724812183; cv=none; b=uyjI0NEGD5xt+BKkHwt+bHLwnI9+ZnaHk7AE1vhBMlFmA16AQN8gzGNkAJxWgRxXeQpOasgUnvApm2WMWFAJiywPDzX4m2CnjvNIcaeMUWNmjktks0LcP9Hw8EK/5Kb57JMDnZyma5wZ2pFVFgA/EhjKou7OcOzP+Eufpt8SxJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724812183; c=relaxed/simple;
	bh=w9gKMUwtFMhXtaLOZKT94eoi54UxpaqmxQcBOIz4yLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tiwR3x0/WT5uxepWNA612sWgd2Tb1rz3EnB5Rhj8jAvEPkXI/Nn51jrFUXEuO3/dX2OsPxpgB7u1m8yxe2FlfXwqtJ2/J0HQDWxvBulgpKQPTrpckqS1GyRnnME4gAS8ZmRdGgBHs+6lGYBQapnAVkSSYcKRrxmDabjCPCBTrKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=CsOhvdJ5; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="CsOhvdJ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=BJK05Ul0TQ++UJk0M0jDApdVzd0KxnzQI04Ca6YRhoM=;
	b=CsOhvdJ5L6c2jKEq4i0gMa1TGrotzOerH0tXvhvLJheihULgT0EvDoEVP4htZW
	fTIU4mhgdcCOIj578xYMZalJHtjUniDmabMgFLPPy75Vds/zclIRUj04o9jih8wo
	eJqj0QP/Y/9qjOEFImSd7hp0MOD9THecMDlQUeWIDMv04=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDn__5vi85mpd4NAA--.24882S3;
	Wed, 28 Aug 2024 10:29:05 +0800 (CST)
Date: Wed, 28 Aug 2024 10:29:03 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frieder Schrempf <frieder@fris.de>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 3/4] arm64: dts: imx8mm-kontron: Add support for display
 bridges on BL i.MX8MM
Message-ID: <Zs6LbyOeGMZsxn2S@dragon>
References: <20240806133352.440922-1-frieder@fris.de>
 <20240806133352.440922-4-frieder@fris.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806133352.440922-4-frieder@fris.de>
X-CM-TRANSID:M88vCgDn__5vi85mpd4NAA--.24882S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxXw4DGF18JFW7try7Jr15CFg_yoWrKw4Dpr
	9xAws3Xr40qF4jya4DZr18Crn3C3ykGw4v9wnF9FyFyrZxu347tF45Krn5Wrs0kFWUZw4F
	vF4Fvry2grnYq3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j4ZXrUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiER9JZWbOG9TjXwABs4

On Tue, Aug 06, 2024 at 03:33:01PM +0200, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> The Kontron Electronics BL i.MX8MM has oboard disply bridges for
> DSI->HDMI and DSI->LVDS conversion. The DSI interface is muxed by
> a GPIO-controlled switch to one of these two bridges.
> 
> By default the HDMI bridge is enabled. The LVDS bridge can be
> selected by loading an additional (panel-specific) overlay.
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  .../boot/dts/freescale/imx8mm-kontron-bl.dts  | 146 ++++++++++++++++++
>  1 file changed, 146 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
> index aab8e24216501..2b344206dfd16 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
> @@ -25,6 +25,17 @@ osc_can: clock-osc-can {
>  		clock-output-names = "osc-can";
>  	};
>  
> +	hdmi-out {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_in_conn: endpoint {
> +				remote-endpoint = <&bridge_out_conn>;
> +			};
> +		};
> +	};
> +
>  	leds {
>  		compatible = "gpio-leds";
>  		pinctrl-names = "default";
> @@ -132,6 +143,90 @@ ethphy: ethernet-phy@0 {
>  	};
>  };
>  
> +&gpio4 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_gpio4>;
> +
> +	dsi_mux_sel_hdmi: dsi-mux-sel-hdmi-hog {
> +		gpio-hog;
> +		gpios = <14 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "dsi-mux-sel";
> +	};
> +
> +	dsi_mux_sel_lvds: dsi-mux-sel-lvds-hog {
> +		gpio-hog;
> +		gpios = <14 GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name = "dsi-mux-sel";
> +		status = "disabled";
> +	};
> +
> +	dsi-mux-oe-hog {
> +		gpio-hog;
> +		gpios = <15 GPIO_ACTIVE_LOW>;
> +		output-high;
> +		line-name = "dsi-mux-oe";
> +	};
> +};
> +
> +&i2c3 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c3>;
> +	status = "okay";
> +
> +	hdmi: hdmi@39 {
> +		compatible = "adi,adv7535";
> +		reg = <0x39>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_adv7535>;
> +
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
> +
> +		adi,dsi-lanes = <4>;
> +

Can we drop these newlines in the middle of property list?

> +		a2vdd-supply = <&reg_vdd_1v8>;
> +		avdd-supply = <&reg_vdd_1v8>;
> +		dvdd-supply = <&reg_vdd_1v8>;
> +		pvdd-supply = <&reg_vdd_1v8>;
> +		v1p2-supply = <&reg_vdd_1v8>;
> +		v3p3-supply = <&reg_vdd_3v3>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				bridge_in_dsi_hdmi: endpoint {
> +					remote-endpoint = <&dsi_out_bridge>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				bridge_out_conn: endpoint {
> +					remote-endpoint = <&hdmi_in_conn>;
> +				};
> +			};
> +		};
> +	};
> +
> +	lvds: bridge@2c {

Sort I2C devices in unit-address.

Shawn

> +		compatible = "ti,sn65dsi84";
> +		reg = <0x2c>;
> +		enable-gpios = <&gpio4 26 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_sn65dsi84>;
> +		status = "disabled";
> +	};
> +};
> +
>  &i2c4 {
>  	clock-frequency = <100000>;
>  	pinctrl-names = "default";
> @@ -144,6 +239,30 @@ rx8900: rtc@32 {
>  	};
>  };
>  
> +&lcdif {
> +	status = "okay";
> +};
> +
> +&mipi_dsi {
> +	samsung,esc-clock-frequency = <54000000>;
> +	/*
> +	 * Let the driver calculate an appropriate clock rate based on the pixel
> +	 * clock instead of using the fixed value from imx8mm.dtsi.
> +	 */
> +	/delete-property/ samsung,pll-clock-frequency;
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			reg = <1>;
> +
> +			dsi_out_bridge: endpoint {
> +				remote-endpoint = <&bridge_in_dsi_hdmi>;
> +			};
> +		};
> +	};
> +};
> +
>  &pwm2 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_pwm2>;
> @@ -207,6 +326,12 @@ &iomuxc {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_gpio>;
>  
> +	pinctrl_adv7535: adv7535grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SAI1_TXD4_GPIO4_IO16		0x19
> +		>;
> +	};
> +
>  	pinctrl_can: cangrp {
>  		fsl,pins = <
>  			MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28		0x19
> @@ -277,6 +402,20 @@ MX8MM_IOMUXC_SAI3_MCLK_GPIO5_IO2		0x19
>  		>;
>  	};
>  
> +	pinctrl_gpio4: gpio4grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SAI1_TXD2_GPIO4_IO14		0x19
> +			MX8MM_IOMUXC_SAI1_TXD3_GPIO4_IO15		0x19
> +		>;
> +	};
> +
> +	pinctrl_i2c3: i2c3grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL			0x40000083
> +			MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA			0x40000083
> +		>;
> +	};
> +
>  	pinctrl_i2c4: i2c4grp {
>  		fsl,pins = <
>  			MX8MM_IOMUXC_I2C4_SCL_I2C4_SCL			0x40000083
> @@ -290,6 +429,13 @@ MX8MM_IOMUXC_SPDIF_RX_PWM2_OUT			0x19
>  		>;
>  	};
>  
> +	pinctrl_sn65dsi84: sn65dsi84grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SAI2_TXD0_GPIO4_IO26		0x19
> +			MX8MM_IOMUXC_SD2_WP_GPIO2_IO20			0x19
> +		>;
> +	};
> +
>  	pinctrl_uart1: uart1grp {
>  		fsl,pins = <
>  			MX8MM_IOMUXC_SAI2_RXC_UART1_DCE_RX		0x0
> -- 
> 2.45.2
> 

