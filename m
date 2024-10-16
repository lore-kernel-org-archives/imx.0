Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061EE199948
	for <imx@lists.linux.dev>; Wed, 16 Oct 2024 07:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729062672; cv=none; b=Lv33w4eYh41UxZe72x8lFVX6dQJfIR5h3A3n/noOw6R58fRZLnRnQAjfpVePLeWaZpoJyTkkybGJ6yrKsk8J6Ybf3MAgkAwBiF7Un/9BUu/qblT0Q7/8FF+jJI3/Mtkv4lXFQmULBPn5XmVcPpZtr8sMzhVVRY9X7zc5OwPwazc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729062672; c=relaxed/simple;
	bh=ZFHpXI/7ozZfKVxYQ6zxlkaask+JfvqtFzlZ1xJus3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PcWH+W5fIfD/9zaUYDwanrr7+gmmwaswbRmwhGsotc+uU6bnf/Nk3IAOh6G7KmXlnW+uyieLL7suOR0NITA3fZuv68BurOM7eullQ/XBk2Txut1UEUGUnHR2azo/HLvJ6iBbVEZ9oserAB5hfvCa5MiRKmbMydHZxzZ+HgHOw74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=hlJZF52v; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="hlJZF52v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=+XnIY4ZVXC+5LY+pa8gVUeF82l8myqDrbd98ErqrQtM=;
	b=hlJZF52vsQEaY7+MC+/bqE80M9vXmf5KJxSreanh7UFu1IRNcMdQxesCbgwdPm
	6N5V8HaHby5JM/fevQIZtusvvdZ2JaTdKqQpOFT0fm4qwmTdyEegB7OmbyLS2ec+
	vnBPQgTaeRXKxhxPy9TFcCs/v4EDoAwP4gBRAgGuvbHsA=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBHCuLpZg9nFLEYAA--.368S3;
	Wed, 16 Oct 2024 15:10:35 +0800 (CST)
Date: Wed, 16 Oct 2024 15:10:33 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Li Yang <leoyang.li@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: imx8m*-venice-gw75xx: add Accelerometer
 device
Message-ID: <Zw9m6dhNFdptZN/l@dragon>
References: <20240909215009.779368-1-tharvey@gateworks.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909215009.779368-1-tharvey@gateworks.com>
X-CM-TRANSID:Mc8vCgBHCuLpZg9nFLEYAA--.368S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF45JF15WF4kAFy3uw15urg_yoW5Xw47pF
	1xCan0gF1fWF42va4aqF18G3s8Ca95GFZ09wnFkFy0yr43uF90qayFkFn3ur4qqFWrZw45
	ZF48ZryxWr1aqw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jmBT5UUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhZ6ZWcPYsUORAAAse

On Mon, Sep 09, 2024 at 02:50:09PM -0700, Tim Harvey wrote:
> The GW75xx has a LIS2DE12TR 3-axis accelerometer on the I2C bus with an
> interrupt pin. Add it to the device-tree.
> 
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> ----
> v2: 
>  - make sure compatible is on top and vendor specific props are at the end per:
>    https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
>  - fix typo in commit message
> ---
>  .../boot/dts/freescale/imx8mm-venice-gw75xx.dtsi | 16 ++++++++++++++++
>  .../boot/dts/freescale/imx8mp-venice-gw75xx.dtsi | 16 ++++++++++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi
> index 5eb92005195c..d17e1f375be4 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi
> @@ -116,6 +116,16 @@ &i2c2 {
>  	pinctrl-0 = <&pinctrl_i2c2>;
>  	status = "okay";
>  
> +	accelerometer@19 {
> +		compatible = "st,lis2de12";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_accel>;
> +		reg = <0x19>;

Could you have 'reg' after 'compatible'?

Shawn

> +		interrupt-parent = <&gpio5>;
> +		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
> +		st,drdy-int-pin = <1>;
> +	};
> +
>  	eeprom@52 {
>  		compatible = "atmel,24c32";
>  		reg = <0x52>;
> @@ -198,6 +208,12 @@ MX8MM_IOMUXC_SPDIF_RX_GPIO5_IO4		0x40000040 /* GPIOC */
>  		>;
>  	};
>  
> +	pinctrl_accel: accelgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_ECSPI1_MISO_GPIO5_IO8	0x159
> +		>;
> +	};
> +
>  	pinctrl_gpio_leds: gpioledgrp {
>  		fsl,pins = <
>  			MX8MM_IOMUXC_SAI1_RXFS_GPIO4_IO0	0x6	/* LEDG */
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx.dtsi
> index 0d40cb0f05f6..c9934cf98942 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx.dtsi
> @@ -104,6 +104,16 @@ &i2c2 {
>  	pinctrl-0 = <&pinctrl_i2c2>;
>  	status = "okay";
>  
> +	accelerometer@19 {
> +		compatible = "st,lis2de12";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_accel>;
> +		reg = <0x19>;
> +		interrupt-parent = <&gpio5>;
> +		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
> +		st,drdy-int-pin = <1>;
> +	};
> +
>  	eeprom@52 {
>  		compatible = "atmel,24c32";
>  		reg = <0x52>;
> @@ -204,6 +214,12 @@ MX8MP_IOMUXC_SAI3_RXFS__GPIO4_IO28	0x40000106 /* PCI_WDIS# */
>  		>;
>  	};
>  
> +	pinctrl_accel: accelgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI1_MISO__GPIO5_IO08	0x159
> +		>;
> +	};
> +
>  	pinctrl_gpio_leds: gpioledgrp {
>  		fsl,pins = <
>  			MX8MP_IOMUXC_SAI2_RXC__GPIO4_IO22	0x6	/* LEDG */
> -- 
> 2.25.1
> 

