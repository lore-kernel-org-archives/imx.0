Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48F33D0C07;
	Mon, 28 Sep 2026 12:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600258; cv=none; b=kv9bHwkzK4dVfgZS1VfAsJJRgeN1vQv/Gc439W29nctbP1EHv10vFA41HMgcLHaOfeGuM8WrO0bihkFFJyG5puv/7haCXZjr9XRQhxaRhVtjsCo/mU6kCFab5ACMF8zklTOHLkjp5OMmWZ8h2o7NezT7zjgqbcb2lvdIqT943WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600258; c=relaxed/simple;
	bh=GwJp5s33BSWFjLxZ0t3dacmz3ce0//7jodioq29cmK4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t1SSeyFOsLpcuZW2Eoa4QCXyDCxjcSD8tfZF6GApbgDJYObBEPqUoAlRVpnLm4c3yKs4FQLPMpc2e0ty529As6GWn7pJU+ea0LoOUawEq3CCDTyP6NRvzYBRqGB2pUEQWyIBluU2UqU44TTePPwtPh4dBRIO++Vdphs6Ht3i/ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nx7Mi/9p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nx7Mi/9p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B441F00893;
	Mon, 28 Sep 2026 12:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790600256;
	bh=rArBhLE7C0tapl72p2lAiMPHhi6GXKwYRGJvQYDbjHQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nx7Mi/9pOhnTOaoBG+h4yZ6kyy31/IH8Fve7CQ8MZmVjULJB1Ls6kmO4vT7yFjKO/
	 0CyAmLVMSw4pOvwV8w8go+/fC/2EJiBXYg4WU5O6EZYlXYm2D/C/t21fCKy/9qLlRl
	 461D9RZOnL86XQ8DtsqYRGfHnIcydSPf8EDgIh01E/I+mEFOucQ+07lxD2mGzeHjUk
	 3dhb626lBK9FftETb4odDGbls6/50tjN5c1wsgTmPXhQ1wkJ+aRltlOdVo+dV868Xn
	 roFUkp1cWf5XvnM6DExFkOwtm6lRYtiGd8oGMzGrb/om7IyhN8Q5I3bn8Nh/C2uOYl
	 2l5mt1FaM3ORw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/12] ARM: dts: imx6ul: Add Variscite carrier board
 files
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <a87ca06761243760783b1e95068c2a4fc5065db7.1790512621.git.stefano.r@variscite.com>
References: <cover.1790512621.git.stefano.r@variscite.com>
 <a87ca06761243760783b1e95068c2a4fc5065db7.1790512621.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 12:57:36 +0000
Message-Id: <20260928125736.89B441F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dts: imx6ul: use of deprecated label property in LEDs
- [Low] dts: imx6ul: unlinked reg_sd1_vmmc regulator for usdhc1
--

commit f6415b7b9ca2912b53356194bc60bb2501d16604
Author: Stefano Radaelli <stefano.r@variscite.com>

ARM: dts: imx6ul: Add Variscite carrier board files

This patch adds DTSI files for the Concerto-Board, Symphony-Board and
VAR-6ULCustomBoard carriers used with VAR-SOM-6UL and DART-6UL. It shares
common carrier wiring across the SoC variants and places SoC-specific
connections in separate wrapper files.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-6ulcustomb=
oard-sd-card.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-6ulcu=
stomboard-sd-card.dtsi
> new file mode 100644
> index 0000000000000..f6cec58f5a4e4
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-6ulcustomboard-sd=
-card.dtsi
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
> + */
> +
> +/ {
> +	reg_sd1_vmmc: regulator-sd1-vmmc {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VSD_3V3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +	};
> +};
> +
> +&usdhc1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
> +	cd-gpios =3D <&gpio4 19 GPIO_ACTIVE_LOW>;

[Severity: Low]
Does the &usdhc1 node need a vmmc-supply property linking the reg_sd1_vmmc
regulator, such as vmmc-supply =3D <&reg_sd1_vmmc>;? Without it, the MMC
controller initializes without knowing about this regulator.

> +	no-1-8-v;
> +	keep-power-in-suspend;
> +	wakeup-source;
> +	status =3D "okay";
> +};

[ ... ]

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-6ulcustomb=
oard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-6ulcustomboar=
d.dtsi
> new file mode 100644
> index 0000000000000..b0f0593c0618e
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-6ulcustomboard.dt=
si
> @@ -0,0 +1,321 @@

[ ... ]

> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_gpio_leds>;
> +
> +		led-d16 {
> +			gpios =3D <&gpio4 20 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Does this node omit both the color and function properties? Modern
userspace relies on these properties for standard sysfs LED identification
rather than node names alone.

> +			linux,default-trigger =3D "heartbeat";
> +		};
> +	};
> +};

[ ... ]

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-concerto-bo=
ard-sd-card.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-concert=
o-board-sd-card.dtsi
> new file mode 100644
> index 0000000000000..a6a3f417ca5e6
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-concerto-board-sd-=
card.dtsi
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
> + */
> +
> +/ {
> +	reg_sd1_vmmc: regulator-sd1-vmmc {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VSD_3V3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +	};
> +};
> +
> +&usdhc1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
> +	cd-gpios =3D <&gpio1 0 GPIO_ACTIVE_LOW>;

[Severity: Low]
Does this &usdhc1 node also need to link the reg_sd1_vmmc regulator via the
vmmc-supply property? The local regulator is defined but remains unused.

> +	no-1-8-v;
> +	keep-power-in-suspend;
> +	wakeup-source;
> +	status =3D "okay";
> +};

[ ... ]

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-concerto-bo=
ard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-concerto-board.=
dtsi
> new file mode 100644
> index 0000000000000..93c4d3730213f
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-concerto-board.dtsi
> @@ -0,0 +1,350 @@

[ ... ]

> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_gpio_leds>;
> +
> +		led-0 {
> +			function =3D LED_FUNCTION_STATUS;
> +			color =3D <LED_COLOR_ID_GREEN>;
> +			label =3D "gpled2";

[Severity: Low]
Is the deprecated label property necessary here? The color and function
properties are provided, but label overrides standard sysfs naming.

> +			gpios =3D <&gpio1 25 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +	};
> +};

[ ... ]

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-symphony-bo=
ard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-symphony-board.=
dtsi
> new file mode 100644
> index 0000000000000..199f2f0b86e34
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-symphony-board.dtsi
> @@ -0,0 +1,311 @@

[ ... ]

> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		led-heartbeat {
> +			label =3D "heartbeat";

[Severity: Low]
Does this node use the deprecated label property instead of the standard
color and function properties? The label property is deprecated in favor
of defining the exact color and function for consistent sysfs naming.

> +			gpios =3D <&pca9534 0 GPIO_ACTIVE_LOW>;
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790512621.gi=
t.stefano.r@variscite.com?part=3D7
