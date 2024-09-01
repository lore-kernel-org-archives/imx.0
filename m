Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A204CDE0
	for <imx@lists.linux.dev>; Sun,  1 Sep 2024 08:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725180900; cv=none; b=HIapMiGSwriw9pW/XIHNZhbu916HIWLcttzfHsOIVUCi1jALN2JfaE2t/PJ21uGmdJEentkpjQfMa0chp3V4FFF2t2oA0WCeXdrTmuo4enbllTm/ovJtE7nxKteo5VFBAJRtLb1kyfFlnuOD7gpc0wZdeXgpkamLP/VDM9xyv8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725180900; c=relaxed/simple;
	bh=9B0dx6QzXe/WbkNamti9BfZY9NXtY5ZG1h9ESGCq/9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNQQi6wvveyjAkMLGhToM8ycRAT9UNwE1iyOCJV2Ilp8gWdjVxD06g4HBsCFm1zI4fSGLwD+kSnj8pwxdZqw1Ov3GwEGjGD5m0BeQVtOpK5M5mAuhmiZpwqpwGPjWizjs/F0lQ2eXim9RQUjAQIrjUs+scH2CIycWonAOxOVUtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=jEOqepz6; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="jEOqepz6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=DwmaDeFGxVT3LGj8Okf1GlUPv+mg0vHPAzThLCoAjoM=;
	b=jEOqepz6ioNeTy3xf7N5ZLCtbI8k3biUWOuhGvQ+YxY8QfGQK9Lft4jsrZLuiN
	Bun7BAlppwH6JVnqkO1VNygm/mcAotNH6EPwQeHAmS6bCwDVFwIi2ivPhluvjAZF
	fg1hlbVyrwmTi0N32Duwp+aONtzv5Rg3p9eyHgPP8x0gk=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3z+LHK9RmbUFDAA--.33375S3;
	Sun, 01 Sep 2024 16:54:33 +0800 (CST)
Date: Sun, 1 Sep 2024 16:54:31 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1 04/10] arm64: dts: colibri-imx8x: Add sound card
Message-ID: <ZtQrxzTNJTQd7zHK@dragon>
References: <20240826215922.13225-1-francesco@dolcini.it>
 <20240826215922.13225-5-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240826215922.13225-5-francesco@dolcini.it>
X-CM-TRANSID:M88vCgD3z+LHK9RmbUFDAA--.33375S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxGry5Xr4UAFW5WFW8Xw45GFg_yoW5Aw4kp3
	97urZ3CrWFvryIy3WFq3s7WrZ5W398KFWv9r13G3y8Crs2yFnrJF17Jw15uF18Jrs7Zw4a
	qFyDZryxKF98t3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jIhFxUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRNNZWbUDFlF4AAAsw

On Mon, Aug 26, 2024 at 11:59:16PM +0200, Francesco Dolcini wrote:
> From: João Paulo Gonçalves <joao.goncalves@toradex.com>
> 
> Add audio support for Colibri-iMX8X sound card.
> 
> Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  .../boot/dts/freescale/imx8x-colibri.dtsi     | 47 ++++++++++++++++++-
>  1 file changed, 46 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
> index aa9c45c290b9..1d22002103c4 100644
> --- a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
> @@ -38,6 +38,13 @@ reg_module_3v3: regulator-module-3v3 {
>  		regulator-max-microvolt = <3300000>;
>  	};
>  
> +	reg_module_3v3_avdd: regulator-module-3v3-avdd {
> +		compatible = "regulator-fixed";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "+V3.3_AVDD_AUDIO";
> +	};
> +
>  	reg_module_vref_1v8: regulator-module-vref-1v8 {
>  		compatible = "regulator-fixed";
>  		regulator-max-microvolt = <1800000>;
> @@ -55,6 +62,23 @@ reg_usbh_vbus: regulator-usbh-vbus {
>  		regulator-min-microvolt = <5000000>;
>  		regulator-name = "usbh_vbus";
>  	};
> +
> +	sound-card {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,bitclock-master = <&dailink_master>;
> +		simple-audio-card,format = "i2s";
> +		simple-audio-card,frame-master = <&dailink_master>;
> +		simple-audio-card,name = "colibri-imx8x";
> +
> +		dailink_master: simple-audio-card,codec {
> +			clocks = <&mclkout0_lpcg IMX_LPCG_CLK_0>;
> +			sound-dai = <&sgtl5000_a>;
> +		};
> +
> +		simple-audio-card,cpu {
> +			sound-dai = <&sai0>;
> +		};
> +	};
>  };
>  
>  /* Colibri Analogue Inputs */
> @@ -109,6 +133,21 @@ touchscreen@2c {
>  		status = "disabled";
>  	};
>  
> +	sgtl5000_a: audio-codec@a {

Please sort I2C device nodes in slave address.

Shawn

> +		compatible = "fsl,sgtl5000";
> +		reg = <0xa>;
> +		#sound-dai-cells = <0>;
> +		assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
> +				  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
> +				  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> +				  <&mclkout0_lpcg IMX_LPCG_CLK_0>;
> +		assigned-clock-rates = <786432000>, <49152000>, <12000000>, <12000000>;
> +		clocks = <&mclkout0_lpcg IMX_LPCG_CLK_0>;
> +		VDDA-supply = <&reg_module_3v3_avdd>;
> +		VDDD-supply = <&reg_module_vref_1v8>;
> +		VDDIO-supply = <&reg_module_3v3>;
> +	};
> +
>  	gpio_expander_43: gpio@43 {
>  		compatible = "fcs,fxl6408";
>  		reg = <0x43>;
> @@ -373,7 +412,13 @@ &lsio_pwm2 {
>  
>  /* TODO on-module PCIe for Wi-Fi */
>  
> -/* TODO On-module i2s / Audio */
> +/* On-module I2S */
> +&sai0 {
> +	#sound-dai-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sai0>;
> +	status = "okay";
> +};
>  
>  &usbotg1 {
>  	adp-disable;
> -- 
> 2.39.2
> 

