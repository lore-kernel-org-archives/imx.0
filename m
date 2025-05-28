Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6846D269D09
	for <imx@lists.linux.dev>; Wed, 28 May 2025 08:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748421439; cv=none; b=WkK6JT6IcuVxELqsP+O+hrRSS6Ch7jZpGv+0zkNQwxKBKv8SHKe0HHvR0peTuLbYkTRoC0z+6gE7EPCKsSsMxgQNHkxMtvamCVjegHMZ0r82oYn0C7u9KVABUe1+/d51mxbspRZBmGH/50DieSWAvktiFTmo2Ase2+j6rXti6+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748421439; c=relaxed/simple;
	bh=n8L8hSbrqamAiukg5nHCiSPxIBvhPJ1OR8imom1GXko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5VBmkbEMogbERMs/5fzZJgSc2xMbYC0Ua6L0HbVdEqcFX38bcEKFF2kpRiZtPGXyITK4mZlTvMSPiyP9qQTJw52ccyB/XBVYlO9UERVVbVYjXzObk6ZUs7CdlycS/GhNsPMYTaj22Q4XaD7bBQnL7ghFJISEV/3Ix3rzng9aPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKCHY-0000EX-Uw; Wed, 28 May 2025 10:37:04 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKCHY-000Yat-1t;
	Wed, 28 May 2025 10:37:04 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKCHY-00ER6A-1T;
	Wed, 28 May 2025 10:37:04 +0200
Date: Wed, 28 May 2025 10:37:04 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, carlos.song@nxp.com
Subject: Re: [PATCH v2 4/6] arm64: dts: imx943-evk: add sound-wm8962 support
Message-ID: <20250528083704.ne6wyoj6vcmy7azq@pengutronix.de>
References: <20250528015837.488376-1-shengjiu.wang@nxp.com>
 <20250528015837.488376-5-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528015837.488376-5-shengjiu.wang@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi,

On 25-05-28, Shengjiu Wang wrote:
> Add WM8962 codec connected to SAI1 interface.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx943-evk.dts | 79 ++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> index ff6e9ac5477f..da08aaa95904 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -36,6 +36,15 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
>  		enable-active-high;
>  	};
>  
> +	reg_audio_pwr: regulator-wm8962-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "audio-pwr";
> +		gpio = <&pcal6416_i2c3_u171 12 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
>  	reserved-memory {
>  		ranges;
>  		#address-cells = <2>;
> @@ -50,6 +59,21 @@ linux,cma {
>  		};
>  	};
>  
> +	sound-wm8962 {
> +		compatible = "fsl,imx-audio-wm8962";

Out of curiosity did you considered making use of "audio-graph-card2"?

The "fsl,imx-audio-wm8962" seems like a pretty simple sound card which
could be added via the "audio-graph-card2" as well. Don't get me wrong,
it's not wrong what you're doing here but making use of the generic
sound card would be nice because it's very common to just copy'n'paste
the audio integration from the corresponding evk.dts file.

Regards,
  Marco

> +		audio-codec = <&wm8962>;
> +		audio-cpu = <&sai1>;
> +		audio-routing = "Headphone Jack", "HPOUTL",
> +			"Headphone Jack", "HPOUTR",
> +			"Ext Spk", "SPKOUTL",
> +			"Ext Spk", "SPKOUTR",
> +			"AMIC", "MICBIAS",
> +			"IN3R", "AMIC",
> +			"IN1R", "AMIC";
> +		hp-det-gpio = <&pcal6416_i2c3_u48 14 GPIO_ACTIVE_HIGH>;
> +		model = "wm8962-audio";
> +	};
> +
>  	memory@80000000 {
>  		reg = <0x0 0x80000000 0x0 0x80000000>;
>  		device_type = "memory";
> @@ -103,6 +127,28 @@ i2c@4 {
>  			reg = <4>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> +
> +			wm8962: codec@1a {
> +				compatible = "wlf,wm8962";
> +				reg = <0x1a>;
> +				clocks = <&scmi_clk IMX94_CLK_SAI1>;
> +				AVDD-supply = <&reg_audio_pwr>;
> +				CPVDD-supply = <&reg_audio_pwr>;
> +				DBVDD-supply = <&reg_audio_pwr>;
> +				DCVDD-supply = <&reg_audio_pwr>;
> +				gpio-cfg = <
> +					0x0000 /* 0:Default */
> +					0x0000 /* 1:Default */
> +					0x0000 /* 2:FN_DMICCLK */
> +					0x0000 /* 3:Default */
> +					0x0000 /* 4:FN_DMICCDAT */
> +					0x0000 /* 5:Default */
> +				>;
> +				MICVDD-supply = <&reg_audio_pwr>;
> +				PLLVDD-supply = <&reg_audio_pwr>;
> +				SPKVDD1-supply = <&reg_audio_pwr>;
> +				SPKVDD2-supply = <&reg_audio_pwr>;
> +			};
>  		};
>  
>  		i2c@5 {
> @@ -128,6 +174,12 @@ pcal6416_i2c3_u171: gpio@21 {
>  				reg = <0x21>;
>  				#gpio-cells = <2>;
>  				gpio-controller;
> +
> +				audio-pwren-hog {
> +					gpios = <12 GPIO_ACTIVE_HIGH>;
> +					gpio-hog;
> +					output-high;
> +				};
>  			};
>  		};
>  
> @@ -262,6 +314,23 @@ &lpuart1 {
>  	status = "okay";
>  };
>  
> +&sai1 {
> +	assigned-clocks = <&scmi_clk IMX94_CLK_AUDIOPLL1_VCO>,
> +			  <&scmi_clk IMX94_CLK_AUDIOPLL2_VCO>,
> +			  <&scmi_clk IMX94_CLK_AUDIOPLL1>,
> +			  <&scmi_clk IMX94_CLK_AUDIOPLL2>,
> +			  <&scmi_clk IMX94_CLK_SAI1>;
> +	assigned-clock-parents = <0>, <0>, <0>, <0>,
> +				 <&scmi_clk IMX94_CLK_AUDIOPLL1>;
> +	assigned-clock-rates = <3932160000>,
> +			       <3612672000>, <393216000>,
> +			       <361267200>, <12288000>;
> +	pinctrl-0 = <&pinctrl_sai1>;
> +	pinctrl-names = "default";
> +	fsl,sai-mclk-direction-output;
> +	status = "okay";
> +};
> +
>  &scmi_iomuxc {
>  
>  	pinctrl_ioexpander_int2: ioexpanderint2grp {
> @@ -297,6 +366,16 @@ IMX94_PAD_GPIO_IO28__LPI2C6_SCL		0x40000b9e
>  		>;
>  	};
>  
> +	pinctrl_sai1: sai1grp {
> +		fsl,pins = <
> +			IMX94_PAD_SAI1_TXFS__SAI1_TX_SYNC	0x31e
> +			IMX94_PAD_SAI1_TXC__SAI1_TX_BCLK	0x31e
> +			IMX94_PAD_SAI1_TXD0__SAI1_TX_DATA0	0x31e
> +			IMX94_PAD_SAI1_RXD0__SAI1_RX_DATA0	0x31e
> +			IMX94_PAD_I2C2_SDA__SAI1_MCLK		0x31e
> +		>;
> +	};
> +
>  	pinctrl_uart1: uart1grp {
>  		fsl,pins = <
>  			IMX94_PAD_UART1_TXD__LPUART1_TX		0x31e
> -- 
> 2.34.1
> 
> 
> 
