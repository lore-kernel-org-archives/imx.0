Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1885A2D6E44;
	Mon, 31 Aug 2026 13:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181508; cv=none; b=Nf/CGJ3TY7iUmIayeDPByY08YbfiLGIeeq2PxEWQpPx+JG0IpjerFSY2GmALrcf552ckDWYHbZ9sov2pcUL9f0YkHYi840QTvL6VHXHCnmyyY5GpeL0u4TRwFLQ8xVqfXBj8TiMkFdzim6FitzRXmN38aJUdVIFlPssyrqJb0mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181508; c=relaxed/simple;
	bh=8mP68XVv2SjU06KBOWgmZ+XjwN6O+TAjLU7vKX1U78w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VJXJTTkQ9yEPQ//LXvMkJh8VxyGfaScF8vuoHiwPU0LLSIqRo3D0cl0OMWWLjeN6Ervc3eQPmfuHhyL//4+fbQcpp0FBqnKzyY87kmsBOLxtsFbuJZ6eNJFKECi1aX1CEyPvWf9VSQtk7TP2b/Q2CMNcpwKR2gzaoC947lgoMVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n3ugy6rq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n3ugy6rq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94DB41F000E9;
	Mon, 31 Aug 2026 13:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788181506;
	bh=m8K/CtH7FJLmjG7PL1PDiV1ud8vw6m2xYu1WCDEYoUU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n3ugy6rqkX38impd7N8/4bIT4Y/3OD7kC0HJF0j78tHVuixMFxTyI/NhXJFTvpfAm
	 /MvXO93+kqaiZQLqcqNnJiUiybcCnY688RqYT4quJV5WSp2iclnDeN4U2OyXLKUSQr
	 /c6ONWdCRNRQpdOIfJLn30xKdTzl4mQyr+N66M0Me5L7FqzQ+6y2RbHsNKLemjgVeP
	 Hn60/5o6pC6M8W0MaKbmxQYbT/eEgx/tlkv7PyI75lhfYc3rBjf3BH9KODCV8JsTsS
	 ENOcxCebKqePUWpJWFHkt/SEbapAFryAjnXLKPUpPC3xa2zRT3ViGGC8p11UXI1wnj
	 tZOSlEXuXmAKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <c12693ab258171be75afa6cee783e5c3de21c1fb.1788180142.git.stefano.r@variscite.com>
References: <cover.1788180142.git.stefano.r@variscite.com>
 <c12693ab258171be75afa6cee783e5c3de21c1fb.1788180142.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 13:05:06 +0000
Message-Id: <20260831130506.94DB41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The VDD_ARM regulator (sw1a) max voltage constraint is dangerously=
 set to 3.3V.
- [High] MCLK audio clock routing is missing required direction properties =
and incorrectly assigned to the wrong CCF clock node.
- [Low] Misplaced header inclusion for LED macros creates brittle dependenc=
ies.
- [Low] The commit message fails to list support for the WM8904 audio codec.
--

commit 0f005e2caf9fb13eb2178194911af6c97acfe6fc
Author: Stefano Radaelli <stefano.r@variscite.com>

    ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support

    Add device tree support for the Variscite VAR-SOM-MX7 system on module.
   =20
    The module is based on the NXP i.MX7Dual SoC and is available in
    multiple configurations and hardware revisions.
   =20
    Add the common SoM description together with support for:
    - eMMC storage
    - NAND storage
    - WM8731 audio codec
    - VAR-SOM-MX7 V2 hardware revision

Link: https://variscite.com/system-on-module-som/i-mx-7/var-som-mx7/

>     Add the common SoM description together with support for:
>     - eMMC storage
>     - NAND storage
>     - WM8731 audio codec
>     - VAR-SOM-MX7 V2 hardware revision

[Severity: Low]
Does this list in the commit message omit the WM8904 audio codec, which is
also introduced by this patch?

> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi =
b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
> new file mode 100644
> index 0000000000000..d798b021f8e05
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi

[ ... ]

> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_gpio_leds>;
> +
> +		led-d10 {
> +			function =3D LED_FUNCTION_STATUS;
> +			color =3D <LED_COLOR_ID_GREEN>;

[Severity: Low]
Are the LED_FUNCTION_STATUS and LED_COLOR_ID_GREEN macros used here without
explicitly including the required <dt-bindings/leds/common.h> header? It
looks like the header was mistakenly included in imx7d-var-som.dtsi instead,
creating a brittle dependency based on implicit inclusions.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi b/arch/a=
rm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
> new file mode 100644
> index 0000000000000..ab05de43cc53a
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi

[ ... ]

> +&i2c2 {
> +	wm8731: audio-codec@1a {
> +		compatible =3D "wlf,wm8731";
> +		reg =3D <0x1a>;
> +		#sound-dai-cells =3D <0>;
> +		AVDD-supply =3D <&vgen6_reg>;
> +		DBVDD-supply =3D <&vgen6_reg>;
> +		DCVDD-supply =3D <&vgen6_reg>;
> +		HPVDD-supply =3D <&vgen6_reg>;
> +		clocks =3D <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>;

[Severity: High]
Does the codec driver incorrectly bind to IMX7D_AUDIO_MCLK_ROOT_DIV instead=
 of
the physical SAI1 root clock driving the pin, causing the ASoC driver to re=
ad
an incorrect frequency?

> +		clock-names =3D "mclk";
> +		assigned-clocks =3D <&clks IMX7D_AUDIO_MCLK_ROOT_SRC>,
> +				  <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>;
> +		assigned-clock-parents =3D <&clks IMX7D_PLL_AUDIO_POST_DIV>;
> +		assigned-clock-rates =3D <0>, <12288000>;
> +	};
> +};
> +
> +&sai1 {
> +	pinctrl-names =3D "default", "sleep";
> +	pinctrl-0 =3D <&pinctrl_sai1>, <&pinctrl_sai1_mclk>;
> +	pinctrl-1 =3D <&pinctrl_sai1_sleep>, <&pinctrl_sai1_mclk_sleep>;
> +	assigned-clocks =3D <&clks IMX7D_SAI1_ROOT_SRC>,
> +			  <&clks IMX7D_SAI1_ROOT_CLK>;
> +	assigned-clock-parents =3D <&clks IMX7D_PLL_AUDIO_POST_DIV>;
> +	assigned-clock-rates =3D <0>, <36864000>;
> +	status =3D "okay";
> +};

[Severity: High]
Is the sai1 node missing the fsl,sai-mclk-direction-output property, leaving
the codec's MCLK pin undriven?

> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8904.dtsi b/arch/a=
rm/boot/dts/nxp/imx/imx7d-var-som-wm8904.dtsi
> new file mode 100644
> index 0000000000000..b56f3680edcff
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8904.dtsi

[ ... ]

> +&i2c2 {
> +	wm8904: audio-codec@1a {
> +		compatible =3D "wlf,wm8904";
> +		reg =3D <0x1a>;
> +		#sound-dai-cells =3D <0>;
> +		clocks =3D <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>;

[Severity: High]
Similar to the wm8731 codec, does this codec driver also incorrectly bind to
IMX7D_AUDIO_MCLK_ROOT_DIV instead of the physical SAI1 root clock?

> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi b/arch/arm/boot=
/dts/nxp/imx/imx7d-var-som.dtsi
> new file mode 100644
> index 0000000000000..255cf44900771
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi
> @@ -0,0 +1,533 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Common dtsi for Variscite VAR-SOM-MX7
> + *
> + * Link: https://variscite.com/system-on-module-som/i-mx-7/var-som-mx7/
> + *
> + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
> + *
> + */
> +
> +#include <dt-bindings/leds/common.h>

[Severity: Low]
Is this header included but not used in this file? It appears the LED macros
are used in imx7d-var-som-mx7customboard.dtsi instead.

[ ... ]

> +&i2c1 {
> +	clock-frequency =3D <100000>;
> +	pinctrl-names =3D "default", "gpio";
> +	pinctrl-0 =3D <&pinctrl_i2c1>;
> +	pinctrl-1 =3D <&pinctrl_i2c1_gpio>;
> +	scl-gpios =3D <&gpio4 8 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios =3D <&gpio4 9 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status =3D "okay";
> +
> +	pfuze300: pmic@8 {
> +		compatible =3D "fsl,pfuze3000";
> +		reg =3D <0x08>;
> +
> +		regulators {
> +			sw1a_reg: sw1a {
> +				regulator-min-microvolt =3D <700000>;
> +				regulator-max-microvolt =3D <3300000>;

[Severity: High]
Is it safe to set regulator-max-microvolt to 3.3V for the VDD_ARM regulator?
Since this could allow the PMIC to supply up to 3.3V to the core, does this
exceed the i.MX7Dual hardware absolute maximum tolerances (around 1.3V)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788180142.gi=
t.stefano.r@variscite.com?part=3D2
