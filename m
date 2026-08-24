Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E138D403EB5;
	Mon, 24 Aug 2026 10:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787568103; cv=none; b=hBSJKdGobM5lfnVNmYZXK9mO2N66CXsCRmvG+SM4HtV988OIOOOmob5NeA4GA80zxV0GBHsQdWylzl+kyQpi1f6xm5OMDdeBybRMutM2AplXzEbxFHOes7KC2VvIWGqbu5TTKICD5aLf8MrNFpw1+49SBjqMcYF0N5bdsHqNZx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787568103; c=relaxed/simple;
	bh=8r9s+F1nkfnuBTeOhsbJo3G7SONGvu7RZGT6UyA8AoM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J6483Tj0SbUbbT0RWnebOH3f0GixXSz2mQnRnD8JHD1G0QovOT2OUa1eGwF9TvDqEMFBxS3ce0VDoZOEqzbTwfCAGH4B86PZMqocls7HqL1x0oPdRdxnB5/sG30LbVja03NDLC04S/oJYW/56hFuAcNtU70wcPY6ccSHInEQOqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRVmQUKL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRVmQUKL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247111F000E9;
	Mon, 24 Aug 2026 10:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787568101;
	bh=WqXBa68XEOMxy1e0r4MeC8FGsxkrC4ZQrO7h7ire268=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nRVmQUKLCtNSIW1Pooz9GZpqP0+elXmrJHsGQ+ldqds3vdPk5uce7sFGL+Z4kQ3gu
	 BRs3pFqthIOBEQoEDUnhxoF4nWEqjS/zczrC4jOrqicUB0vN0mjSuLFXkeczUh09Fi
	 wwKASnzC+X6PgkqrkTPn7b2XlTUTogbnsYJQ7vnsMZ5da04mJhoZGfYpv4Qzj2DraW
	 w95E4ZQCCkdBUgLeU2vWAnO13XqTlgbXH6EFM0P7Dy4Hzfrdlh5Jkc/4ujyi2F0ibJ
	 Oczky3ErO9V83yac1r9FIa/AavssmH77DKFNJQphSL+JNKMLRTCuS642Nimazy8cmL
	 ipf35sFTgjShw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <f54545f2a08a558977b0e76bd0f44b2cf1158783.1787566980.git.stefano.r@variscite.com>
References: <cover.1787566980.git.stefano.r@variscite.com>
 <f54545f2a08a558977b0e76bd0f44b2cf1158783.1787566980.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 10:41:40 +0000
Message-Id: <20260824104141.247111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Overriding `assigned-clocks` in `&sai1` drops essential `SAI1_ROOT=
_CLK` configuration, breaking audio.
- [Low] Missing device tree binding headers in `imx7d-var-som-mx7customboar=
d.dtsi` causing undefined macros.
- [Low] The SoM `.dtsi` file incorrectly includes a `/dts-v1/;` directive, =
leading to duplicate directives in `.dts` files.
- [Low] The `usdhc1` and `usdhc3` nodes specify `no-1-8-v` while defining u=
nreachable 100MHz/200MHz pinctrl states.
- [Low] Device Tree node names contain underscores, violating DT specificat=
ions.
--

--- Patch [2]: [PATCH v2 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 su=
pport ---
commit f0d7c3577a1db2d9fa7ddee6134d561982409054
Author: Stefano Radaelli <stefano.r@variscite.com>

ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support

Add device tree support for the Variscite VAR-SOM-MX7 system on module.
The module is based on the NXP i.MX7Dual SoC and is available in
multiple configurations and hardware revisions.

Link: https://variscite.com/system-on-module-som/i-mx-7/var-som-mx7/

> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi b/arch/arm=
/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi
> new file mode 100644
> index 0000000000000..2f8185f8c526e
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi
> @@ -0,0 +1,99 @@
[ ... ]
> +&usdhc3 {
> +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz", "sleep";
> +	pinctrl-0 =3D <&pinctrl_usdhc3>;
> +	pinctrl-1 =3D <&pinctrl_usdhc3_100mhz>;
> +	pinctrl-2 =3D <&pinctrl_usdhc3_200mhz>;
> +	pinctrl-3 =3D <&pinctrl_usdhc3_sleep>;
> +	vmmc-supply =3D <&vgen3_reg>;
> +	assigned-clocks =3D <&clks IMX7D_USDHC3_ROOT_CLK>;
> +	assigned-clock-rates =3D <400000000>;
> +	no-1-8-v;

[Severity: Low]
Does this no-1-8-v property conflict with the 100MHz and 200MHz pinctrl sta=
tes
defined above it?

By forcing the MMC core to stay at 3.3V, UHS-I and high-speed modes that
require 1.8V might be disabled, making those pinctrl states unreachable dead
code.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi =
b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
> new file mode 100644
> index 0000000000000..ecd4601c12bfb
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
> @@ -0,0 +1,382 @@
[ ... ]
> +	gpio-keys {
> +		compatible =3D "gpio-keys";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_gpio_keys>;
> +
> +		key-back {
> +			label =3D "Back";
> +			gpios =3D <&gpio1 11 GPIO_ACTIVE_LOW>;
> +			linux,code =3D <KEY_BACK>;

[Severity: Low]
Are the KEY_BACK, KEY_MENU, and KEY_HOME macros undefined here?

It looks like the dt-bindings/input/input.h header is missing from the
includes, which could cause a dtc compilation failure.

[ ... ]
> +	reg_hsic_hub_connect: regulator_hsic_hub_connect {
> +		compatible =3D "regulator-fixed";

[Severity: Low]
Could this node name and regulator_hsic_hub_pwr_on below use hyphens instead
of underscores?

Using underscores in node names violates the device tree specification and
triggers node_name_chars_strict compiler warnings.

[ ... ]
> +&usdhc1 {
> +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 =3D <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
> +	pinctrl-1 =3D <&pinctrl_usdhc1_100mhz>, <&pinctrl_usdhc1_gpio>;
> +	pinctrl-2 =3D <&pinctrl_usdhc1_200mhz>, <&pinctrl_usdhc1_gpio>;
> +	cd-gpios =3D <&gpio5 0 GPIO_ACTIVE_LOW>;
> +	no-1-8-v;

[Severity: Low]
Does this no-1-8-v property similarly prevent the high-speed pinctrl states
from being used on this interface?

> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi b/arch/a=
rm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
> new file mode 100644
> index 0000000000000..af5dd6d459ad2
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
> @@ -0,0 +1,64 @@
[ ... ]
> +&sai1 {
> +	assigned-clocks =3D <&clks IMX7D_AUDIO_MCLK_ROOT_SRC>,
> +			  <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>;
> +	assigned-clock-parents =3D <&clks IMX7D_PLL_AUDIO_POST_DIV>;
> +	assigned-clock-rates =3D <0>, <36864000>;
> +	/delete-property/ fsl,sai-mclk-direction-output;
> +};

[Severity: High]
Does overriding the assigned-clocks here silently drop the required SAI1 ro=
ot
clock configuration defined in the base dtsi?

In imx7d-var-som.dtsi, the assigned-clocks property sets IMX7D_SAI1_ROOT_SRC
and IMX7D_SAI1_ROOT_CLK. By overriding it without retaining the original
assignments, the SAI1 block might lose its required clock configuration, and
deleting fsl,sai-mclk-direction-output forces the pad to become an input,
which could break the audio interface entirely.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi b/arch/arm/boot=
/dts/nxp/imx/imx7d-var-som.dtsi
> new file mode 100644
> index 0000000000000..486e9360dea52
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi
> @@ -0,0 +1,637 @@
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
> +/dts-v1/;

[Severity: Low]
Will this /dts-v1/; directive cause a duplicate version directive syntax er=
ror?

When this dtsi file is included by carrier board dts files that also declare
/dts-v1/;, the expanded source will contain duplicate version directives.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787566980.gi=
t.stefano.r@variscite.com?part=3D2
