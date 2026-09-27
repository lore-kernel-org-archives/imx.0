Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27D0325701;
	Sun, 27 Sep 2026 11:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790507182; cv=none; b=mdaPigdoGGLou8yGcfJlhduPI2HTIHkWSdjSIsPOGY68hYe5EbyGH34aZCxw9OiUxkDgUt/uFCRgx2SwSPkufiBijDrq2HwRXcUiaqGr5jBLfZg3Ug2xvr/+WP5C/VwumX2Vnjkl5rHBLxrmRdQ8ylmhGGuC4QITSu04X1+ldT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790507182; c=relaxed/simple;
	bh=+pVA1iXSHqs9q2ZHa7xQQFkUHymXZR7IMFn0p1242qM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W09lCwmaw/TG86NnHC3tSQ4jXCNOwnwou5GYblf00fXTKJuolgeW2mgPlCCfRfyPev9mHKoZU1JMZKvH5gIiD4r87YlcfCjyBaVDqOBHCgONU6Z5EKB/TEsGzw1b1NSbUs80s8bfKNeXUkJ2s9rvkWEo3WanWR+bvLzOQuZyArs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lh0RL92E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lh0RL92E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12DE81F00898;
	Sun, 27 Sep 2026 11:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790507180;
	bh=gQQK95yTGy1FLCZhb9mK4TT47ZmE9fHzg5a6Cs51I/Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lh0RL92E5KVOVxH7b8CvHXMCfX3xnhbisjfwqH3D0BzwXCA360YuAmsUBoSyaMx/h
	 DmAA53Za8/A5c0iA5kQ4PbbDNiboYuZFxYAg0qe3IXKgrGzQwAqmBc0gSSZ7BPg5/D
	 0wz3JeL4q/xBg3YRLugLmrg5O5EGUqsWAjYAFYS1ugxMedLwk9lQ5nNqW7mNI3/atG
	 MsUUKORRSAzg16LQvU92ZKB5rshlBtw6Xdzy7Aot3X/m3tlwp5JM13dietkU/YeJDO
	 SEbvszUJUEBt1038J/2c7xAbe/QeZKB1GYsXFCAZWsbakxZLFzqWpmt5IdaNsp/2Db
	 VqYr4Mi0qWS7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/11] ARM: dts: imx6ul: Add Variscite storage and
 wireless files
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <656354d10e3adb6ac84fdc0c6fa2043db7320805.1790413032.git.stefano.r@variscite.com>
References: <cover.1790413032.git.stefano.r@variscite.com>
 <656354d10e3adb6ac84fdc0c6fa2043db7320805.1790413032.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 11:06:19 +0000
Message-Id: <20260927110620.12DE81F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] dts: missing hardware power and reset sequence for Broadcom Wi-Fi
- [High] dts: missing 'non-removable' property for Broadcom Wi-Fi SDIO inte=
rface
- [Low] dt-bindings: unnecessary #address-cells and #size-cells properties
- [Low] dts: 100% code duplication for DART and SOM DTSI variants
- [Low] dts: missing <dt-bindings/gpio/gpio.h> for GPIO_ACTIVE_LOW macro
--

commit dbf0c01eccfce8f34ad42234d4e5fd0873a0158d
Author: Stefano Radaelli <stefano.r@variscite.com>

    ARM: dts: imx6ul: Add Variscite storage and wireless files
   =20
    Add reusable DTSI files for eMMC, NAND, Broadcom Wi-Fi and NXP IW61x
    options on VAR-SOM-6UL and DART-6UL modules.
   =20
    Keep the module options independent of the carrier board so each
    board DTS can select its assembled storage and wireless devices.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-emmc.dtsi =
b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-emmc.dtsi
> new file mode 100644
> index 0000000000000..26c8ca8f21a0c
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-emmc.dtsi
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0+

[Severity: Low]
Does this file need to be separate? It is a 100% exact duplicate of
imx6ul-imx6ull-var-som-emmc.dtsi.

Could these variants be extracted into a shared file like
imx6ul-imx6ull-var-common-emmc.dtsi to avoid duplication?

[ ... ]

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wifi-brcm.=
dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wifi-brcm.dtsi
> new file mode 100644
> index 0000000000000..d7952233a1ee9
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wifi-brcm.dtsi
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

[Severity: High]
Does this regulator need a gpio property to drive WIFI_PWR_EN?

Without asserting WIFI_PWR_EN and providing an mmc-pwrseq to release
WIFI_RESET, the SDIO interface might fail to detect the Broadcom hardware.

Also, is the bluetooth node intended to be omitted here compared to the
IW61X configurations?

[ ... ]

> +&usdhc1 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";

[Severity: High]
Should this node include the 'non-removable' property?

Since the Broadcom Wi-Fi chip is physically soldered onto the module, does
the SDIO host controller need this property to properly initialize without
falling back to spurious polling?

[ ... ]

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wifi-iw61x=
.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wifi-iw61x.dtsi
> new file mode 100644
> index 0000000000000..4d47cea982ec4
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wifi-iw61x.dtsi
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0+

[ ... ]

> +	iw61x_pwrseq: mmc-pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		post-power-on-delay-ms =3D <100>;
> +		power-off-delay-us =3D <10000>;
> +		reset-gpios =3D <&gpio5 6 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
> +			      <&gpio5 2 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
> +	};

[Severity: Low]
Does this file need to explicitly include <dt-bindings/gpio/gpio.h>?

Since the GPIO_ACTIVE_LOW macro is used here, missing the header might cause
dtc build failures if a parent file does not implicitly include it.

[ ... ]

> +&usdhc1 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;

[Severity: Low]
Are these properties necessary here?

Since there are no child nodes declared under usdhc1 for the iw61x variant,
having these properties might trigger the avoid_unnecessary_addr_size dtc
warning.

[ ... ]

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wifi-brcm.d=
tsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wifi-brcm.dtsi
> new file mode 100644
> index 0000000000000..d7952233a1ee9
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wifi-brcm.dtsi
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0+

[Severity: Low]
Does this file need to be separate? It is a 100% exact duplicate of
imx6ul-imx6ull-var-dart-wifi-brcm.dtsi.

Could these variants be extracted into a single shared file to avoid
code duplication?

[ ... ]

> +&usdhc1 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";

[Severity: High]
Should this node include the 'mmc-pwrseq' assignment to properly drive
WIFI_RESET, as well as the 'non-removable' property?

Since the Broadcom Wi-Fi chip is physically soldered onto the module,
omitting these might prevent proper initialization and hardware probing.

[ ... ]

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wifi-iw61x.=
dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wifi-iw61x.dtsi
> new file mode 100644
> index 0000000000000..4d47cea982ec4
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wifi-iw61x.dtsi
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0+

[ ... ]

> +&usdhc1 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;

[Severity: Low]
Are these properties needed?

Without child nodes under this usdhc1 block, this might generate an
avoid_unnecessary_addr_size dtc warning.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790413032.gi=
t.stefano.r@variscite.com?part=3D5
