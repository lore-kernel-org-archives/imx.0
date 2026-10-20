Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792537450;
	b=qB0nuJ2Ri76IXSpa412UwZS17/E0sue7eFOJVUm77uezN3tYirFwSivguWPt3/d7sIsL
	 ozHnsikpdaTVWZsMbW22CEMzPbFFgxwsvj9qNXkCSY5RBjn9wjZa3zw4I0Rsmaf96XN3E
	 H/AorXzKXFJLwqny4UcEPA1SFURNRNZro1J9RkquLujpXAsvp4+Rq77ntsSpQWxSW8/Db
	 YO1aW1O/GTqq2ig4rVba7tEZZGO4naPW4O241DrOfHY6mN2uQZhV31MkZbfakVUA5+YC6
	 kKHYfOwdIkytp4v6O3FPj4/bsSwY1pKV0L13nB5ue6a0NqkRwE1qQw8uAn5HxCh8XMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792537450;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=H7wFHZnciW9Pf28TVKxrZFY03mYFgE43S37eCBdMlpY=;
	b=uNDDSzFqbYAa945TEAiuis4WP8Rf30HohHjneTBqTEcCjDKy5zFS5i8S+c59LO0HWzbb
	 me7gFVDT2kbLlJLndm6oQs4hinO7qowqGch1TNaNtlL2DVcUEYIZgkq5goKXdGq6E93DO
	 ex7AFPtdu+CNNXL9Ju3Jye+qarnDCThVOJfb/21rvqdUwwYhdZ5hyfYWjIzpd49qngRKJ
	 vaRJO0Up02mcjsXEnzQJ76Qdf5G/Bb5iElWn66akVedcDdbK9pOEJ/ZU3xTeUypbrCE+I
	 M2NHMCZH4ELJe/It5Hh3weDCbVudFojsHVl4pm1cd2O/fk392lfoblHgcClIG4riRww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ITqedP9f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A10606A319;
	Tue, 20 Oct 2026 23:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ITqedP9f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAC451F000C9;
	Tue, 20 Oct 2026 23:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792537449;
	bh=H7wFHZnciW9Pf28TVKxrZFY03mYFgE43S37eCBdMlpY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ITqedP9fPRTEDVupCS4ICjQ90O3eRM8wd0qNFb1pPZiPabdt9btbfb4swKMHEwi/v
	 AomYgVuYO1hobt+TG26xhQvNnSq0Y6c6hNy+ZB91TTleIIUWbZfkvUhJAqpQ7Pzemp
	 7XV46E8o0GjM/5Ma86aBY15IWaR+c8GlbHcH4tKKoZgYiISEsf+QsuTSX5QdOkgEJm
	 Qsay+T0UJLbHK/3iJQK77XXnCCWrSBjZ71vnaVprH+DRPdUkWZUCYIGKfgttTFn5su
	 r1dHVyHKc/DUqkPxPWh8oHVL3DlPaF9T9jOqnmdjQdJWwdNe5kmXssyDmhNYzTvt9q
	 BaOOTqV6/na2g==
Message-ID: <sashiko-outbox-179591@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/7] arm64: dts: imx8dxl-evk: Add onboard GPIO mux
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261020-dxl_lcdif-v3-5-adc944659e14@nxp.com>
References: <20261020-dxl_lcdif-v3-0-adc944659e14@nxp.com>
 <20261020-dxl_lcdif-v3-5-adc944659e14@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 23:04:08 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64: dts: imx8dxl-evk: spi0_mux and m4_debug_mux driven low on p=
robe
--

commit a3a65e29ad3fd8c46c72a9be8f8c719076ef18d5
Author: Frank Li <Frank.Li@nxp.com>

arm64: dts: imx8dxl-evk: Add onboard GPIO mux controller

This commit adds four gpio-mux controllers and a pinctrl-multiplexer node
to describe the onboard signal multiplexer on imx8dxl-evk, and removes the
regulator-m2uart1sel node.

> diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/b=
oot/dts/freescale/imx8dxl-evk.dts
> index 0ede0c7ed422c..0ee2a028ebff6 100644
> --- a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
> @@ -97,14 +97,68 @@ vdevbuffer: memory-vdevbuffer@90400000 {
>  		};
>  	};
> =20
> -	m2_uart1_sel: regulator-m2uart1sel {
> -		compatible =3D "regulator-fixed";
> -		regulator-min-microvolt =3D <3300000>;
> -		regulator-max-microvolt =3D <3300000>;
> -		regulator-name =3D "m2_uart1_sel";
> -		gpio =3D <&pca6416_1 6 GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -		regulator-always-on;
> +	m4_debug_mux: mux-controller-0 {
> +		compatible =3D "gpio-mux";
> +		#mux-control-cells =3D <0>;
> +		#mux-state-cells =3D <1>;
> +		mux-gpios =3D <&pca6416_1 3 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	spi3_mux: mux-controller-1 {
> +		compatible =3D "gpio-mux";
> +		#mux-control-cells =3D <0>;
> +		#mux-state-cells =3D <1>;
> +		mux-gpios =3D <&pca6416_1 4 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	uart1_mux: mux-controller-2 {
> +		compatible =3D "gpio-mux";
> +		#mux-control-cells =3D <0>;
> +		#mux-state-cells =3D <1>;
> +		mux-gpios =3D <&pca6416_1 6 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	spi0_mux: mux-controller-3 {
> +		compatible =3D "gpio-mux";
> +		#mux-control-cells =3D <0>;
> +		#mux-state-cells =3D <1>;
> +		mux-gpios =3D <&pca6416_1 7 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	pinctrl-gpiomux {
> +		compatible =3D "pinctrl-multiplexer";
> +
> +		m4_debug_fun: cm4-uart-grp {
> +			mux-states =3D <&m4_debug_mux 1>;
> +		};
> +
> +		spi0_fun: spi0-grp {
> +			mux-states =3D <&spi0_mux 1>;
> +		};
> +
> +		spi3_fun: spi3-grp {
> +			mux-states =3D <&spi3_mux 1>;
> +		};
> +
> +		uart1_fun: uart1-grp {
> +			mux-states =3D <&uart1_mux 1>;
> +		};
> +
> +		lcd_0_fun: lcd0-grp {
> +			mux-states =3D <&spi0_mux 0>;
> +		};
> +
> +		lcd_1_fun: lcd1-grp {
> +			mux-states =3D <&spi3_mux 0>;
> +		};
> +
> +		lcd_2_fun: lcd2-grp {
> +			mux-states =3D <&uart1_mux 0>;
> +		};
> +
> +		lcd_3_fun: lcd3-grp {
> +			mux-states =3D <&m4_debug_mux 0>;
> +		};
>  	};
> =20
>  	mux3_en: regulator-0 {

[ ... ]

> @@ -658,7 +712,7 @@ &cm40_intmux {
> =20
>  &cm40_lpuart {
>  	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&pinctrl_cm40_lpuart>;
> +	pinctrl-0 =3D <&pinctrl_cm40_lpuart>, <&m4_debug_fun>;
>  	status =3D "disabled";
>  };
> =20

[Severity: High]
Does adding spi0_mux and m4_debug_mux without an active consumer or
idle-state =3D <1> cause those muxes to be driven low (state 0, lcd_0_fun
and lcd_3_fun) at boot instead of keeping the hardware pull-up default
(state 1)?

When mux_gpio_probe() in drivers/mux/gpio.c probes each gpio-mux node, it
requests the mux gpios as outputs initialized low (state 0):

drivers/mux/gpio.c:mux_gpio_probe() {
	...
	mux_gpio->gpios =3D devm_gpiod_get_array(dev, "mux", GPIOD_OUT_LOW);
	...
}

Because neither spi0_mux nor m4_debug_mux specifies idle-state =3D <1>, both
lines remain driven low unless an enabled device selects spi0_fun or
m4_debug_fun:

1. In arch/arm64/boot/dts/freescale/imx8dxl-evk.dts, spi0_fun is defined in
pinctrl-gpiomux, but has no consumer. Meanwhile, &sai0 is enabled (used by
sound-bt-sco) and muxes its signals onto the spi0 pads via pinctrl_sai0
without referencing spi0_fun:

	&sai0 {
		pinctrl-names =3D "default";
		pinctrl-0 =3D <&pinctrl_sai0>;
		...
		status =3D "okay";
	};

	pinctrl_sai0: sai0grp {
		fsl,pins =3D <
			IMX8DXL_SPI0_CS0_ADMA_SAI0_RXD		0x06000060
			IMX8DXL_SPI0_CS1_ADMA_SAI0_RXC		0x06000040
			IMX8DXL_SPI0_SCK_ADMA_SAI0_TXC		0x06000060
			IMX8DXL_SPI0_SDI_ADMA_SAI0_TXD		0x06000060
			IMX8DXL_SPI0_SDO_ADMA_SAI0_TXFS		0x06000040
		>;
	};

2. For m4_debug_mux, m4_debug_fun is only attached to &cm40_lpuart, which h=
as
status =3D "disabled", while &adc0 and imx8dxl-cm4 are enabled and share the
pads controlled by m4_debug_mux (&pca6416_1 3).

Should &sai0 include <&spi0_fun> in pinctrl-0, and should the mux controlle=
rs
specify idle-state =3D <1> (or have m4_debug_fun selected by an enabled
consumer) so that sai0 and the m4 / adc0 signals are not disconnected on
probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-dxl_lcdif-=
v3-0-adc944659e14@nxp.com?part=3D5
