Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05E21C36;
	Tue, 21 Jan 2025 16:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737475446; cv=none; b=KG2m5Ap4VmpwSNZqpu+814OL3ruGGH+aWR4u2VfbC9gKYi7Do1TcIg7fn+NqqFMynpjFfVqsAh7C9fy4TM9YkplRDFu01+mcP+caprVlXDePQKDX8wE5U66en1K1xxr5WfYz1Xs5dB4DjYJ8OtojWqxRBlp90h5rPLKkGq5HTn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737475446; c=relaxed/simple;
	bh=/XFx7CKrwdy60Saw0gL5MizADdAyJGZKGZNTwxZNpxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pC/OTkIfHtamZjVaRiu70A0EjcfME2cTrYkkT480EwsflHJznxDSP0oI36s1/Gq0Ae/D6fW1LNzrWJDEJJje3U+IP//4rA2YqUCNv/E5XkbIbUv0CASDnS5cIyiyenI04z0UtHT5GXZUEX8zT8Gx+5mM4OKH/vKRbJQ2XJjNfRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GEavxdbn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GEavxdbn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F6CC4CEDF;
	Tue, 21 Jan 2025 16:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737475446;
	bh=/XFx7CKrwdy60Saw0gL5MizADdAyJGZKGZNTwxZNpxQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GEavxdbnPVXicCizNfG4C9QVfS3+mTtx1uW1+amz5szj2myK8ZjP4/jh2Il6qMB/X
	 MXiOQ879jXOlR0/5P/HS8RafgQj3/lv8ZY75e9SctrRn9HdIvJ3XMulJInVxIm4K8V
	 f8WNL4xiwA3DTGP3dumYzBBMZJTUFo8TJizz8MR7hQ5D1B7zrkCHal0njRgOyLL+89
	 ZVXvTR6bbd9b6ZJfHa6n4Z8muW8x5oHM74hIXnky8NbEt+bLBB3q/ap/GZKXE87Iy1
	 SeKvAKEr2Mff9NsrIrwlkZ3UpYfeqg5J27N4iUUCWegHNh5y75GVdl1y8zW+WSUu6B
	 boPc1cHVEIzmg==
Message-ID: <56e74e80-8e90-4784-b284-bee1af35e37e@kernel.org>
Date: Tue, 21 Jan 2025 17:03:59 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ARM: dts: imx6ul: Add Variscite Concerto board
 support
To: Antonin Godard <antonin.godard@bootlin.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250121-varsom6ul-concerto-dts-v1-0-eb349acf0ac6@bootlin.com>
 <20250121-varsom6ul-concerto-dts-v1-3-eb349acf0ac6@bootlin.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250121-varsom6ul-concerto-dts-v1-3-eb349acf0ac6@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/01/2025 10:33, Antonin Godard wrote:
> This patch adds support for the Variscite Concerto Carrier Board.

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
> 
> This Carrier-Board has the following:
> - LVDS interface for the VLCD-CAP-GLD-LVDS 7" LCD 800 x 480 touch
>   display (not configured)
> - USB Host + USB OTG Connector
> - 10/100 Mbps Ethernet
> - miniPCI-Express slot
> - SD Card connector
> - Audio Headphone/Line In jack connectors
> - S-ATA
> - On-board DMIC
> 
> Product Page: https://www.variscite.com/product/single-board-computers/concerto-board
> 
> This file is based on the one provided by Variscite on their own kernel,
> but adapted for mainline.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  arch/arm/boot/dts/nxp/imx/Makefile                 |   1 +
>  .../boot/dts/nxp/imx/imx6ul-var-som-concerto.dts   | 331 +++++++++++++++++++++
>  2 files changed, 332 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
> index 39a153536d2a2b8f75b5fbe4332660f89442064a..94c9bc94cc8e2daa1fb3b5686b0b58db1f6678b6 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> @@ -329,6 +329,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
>  	imx6ul-tx6ul-0010.dtb \
>  	imx6ul-tx6ul-0011.dtb \
>  	imx6ul-tx6ul-mainboard.dtb \
> +	imx6ul-var-som-concerto.dtb \
>  	imx6ull-14x14-evk.dtb \
>  	imx6ull-colibri-aster.dtb \
>  	imx6ull-colibri-emmc-aster.dtb \
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..4289641d94c5a72ba985f339652039dbf13da40c
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
> @@ -0,0 +1,331 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Support for Variscite MX6 Concerto Carrier board with the VAR-SOM-MX6UL
> + * Variscite SoM mounted on it
> + *
> + * Copyright 2019 Variscite Ltd.
> + * Copyright 2025 Bootlin
> + */
> +
> +#include "imx6ul-var-som.dtsi"
> +
> +/ {
> +	model = "Variscite VAR-SOM-MX6UL Concerto Board";
> +	compatible = "variscite,mx6concerto", "variscite,var-som-imx6ul", "fsl,imx6ul";
> +
> +	backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pwm4 0 20000 0>;
> +		brightness-levels = <0 4 8 16 32 64 128 255>;
> +		default-brightness-level = <6>;
> +		status = "okay";

Which file disables it?

> +	};
> +
> +	chosen {
> +		stdout-path = &uart1;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_gpio_key_back>, <&pinctrl_gpio_key_wakeup>;
> +
> +		key-back {
> +			gpios = <&gpio4 14 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_BACK>;
> +		};
> +
> +		key-wakeup {
> +			gpios = <&gpio5 8 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_WAKEUP>;
> +			wakeup-source;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_gpio_leds>;
> +
> +		gpled2 {

led-0
led-1
led-2

Are there other leds here?


> +			gpios = <&gpio1 25 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";

Missing function and color

> +		};
> +	};
> +};
> +
> +&can1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan1>;
> +	status = "okay";
> +};
> +
> +&fec1 {
> +	status = "disabled";
> +};
> +
> +&fec2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_enet2>, <&pinctrl_enet2_gpio>, <&pinctrl_enet2_mdio>;
> +	phy-mode = "rmii";
> +	phy-handle = <&ethphy1>;
> +	phy-reset-gpios = <&gpio5 5 GPIO_ACTIVE_LOW>;
> +	phy-reset-duration = <100>;
> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy1: ethernet-phy@3 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			micrel,rmii-reference-clock-select-25-mhz = <1>;
> +			micrel,led-mode = <0>;
> +			clocks = <&rmii_ref_clk>;
> +			clock-names = "rmii-ref";
> +			reg = <3>;
> +		};
> +	};
> +};
> +
> +&i2c1 {
> +	clock-frequency = <100000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c1>;
> +	status = "okay";
> +
> +	/* DS1337 RTC module */

Drop comment, obvious. This cannot be anything else, because node name
and compatible told that.

> +	rtc@68 {
> +		/*
> +		 * To actually use this interrupt
> +		 * connect pins J14.8 & J14.10 on the Concerto-Board.
> +		 */
> +		compatible = "dallas,ds1337";
> +		reg = <0x68>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_rtc>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
> +	};
> +};


Best regards,
Krzysztof
