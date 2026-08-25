Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EEA184524;
	Tue, 25 Aug 2026 07:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787642210; cv=none; b=WCWU3cvuMCh2k2OUgEt3Qoupulazs+EaPAXbNEPzGu4qFBMJS5M9lkd2hpLZ3dbXNCZmBb3B3+zrYfjxLFTZ+YuAcy04AEA7EA6n7f5DiuJHodMqYlsOH35WOzCLICODrGHLwyZl/1v4jCtP2SqdOSaF/D9NKY6WVGThZupXov0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787642210; c=relaxed/simple;
	bh=l2A4Q4fWn0G6O1zLjnfbmmSmbbaWhg7JC/yaTYCnxgU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pgNuAcBHMZwW9v0i2d0vhS9IbLLrXEP6lUB9rQY9s7Lpn2JM/MqTxya7DD56Xt/hLTY8n0SAWFqjaIxCKrexr36vG4qVSEAGMq7nG0fFDp4OgCRgIo6iqy25CHv4azINalyQ6+fEev2rJcRxjeTaBnziCRtiYe2oN6f1TXSDNE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TDnTY3eu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TDnTY3eu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B547C1F000E9;
	Tue, 25 Aug 2026 07:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787642209;
	bh=AT3dvNSm8bdMfrFcqv8ffidb/RGxThAxqf4nG5NbF+c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TDnTY3euL5+pAh4V/NwVTk9JXJXILrD12KWu9IXqq7MWiSqL6UPQ7yE6R5ejYAVN7
	 hVJpjo74obnvyR+rISfTcatY8hHxYH8mP8KSWZaLrbXeNquSaM/6eQ4qVgWXVO1JUp
	 79FiVSCIbPMgjqptulDqVT5benGQ8QFYJbq6IV20nEq4Ri0Auw9F7biLpKaS19wH21
	 6RZYXPZq+N3G0UAjYiHz3rsyySfZmtBixj0+2ImDrp7nhPtL/KotLg9iVHu/tLv8s7
	 I6Lo8rN97Gg2TvMo9lgIsCsCUyWRgEbEMgIVULrl/UuhNS4sY2neN9ZbnnGcbaNzrg
	 lTAD2zSXnBe1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <2b7fabe6b1c4d08e58d2542742492564b67c4c32.1787586961.git.stefano.r@variscite.com>
References: <cover.1787586961.git.stefano.r@variscite.com>
 <2b7fabe6b1c4d08e58d2542742492564b67c4c32.1787586961.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 07:16:48 +0000
Message-Id: <20260825071648.B547C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `sw1a` regulator maximum voltage is set to 3.3V, which violate=
s the i.MX7D core voltage limits (typically 1.0V, max 1.15V) and the PFUZE3=
000 SW1A hardware limit for this design (max 1.475V).
- [High] Deleting `fsl,sai-mclk-direction-output` prevents the SoC from out=
putting the required Master Clock (MCLK) to the WM8731 audio codec.
- [Medium] The `sd3-pwr-hog` GPIO hog on `gpio6 11` directly conflicts with=
 the native `usdhc3` pinctrl configuration for `SD3_RESET_B`.
--

--- Patch [2]: [PATCH v4 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 su=
pport ---
commit a699faaceb07c2b3521d089b94e7deba5e25dd8b
Author: Stefano Radaelli <stefano.r@variscite.com>

ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support

Add device tree support for the Variscite VAR-SOM-MX7 system on module.
The module is based on the NXP i.MX7Dual SoC.

Link: https://variscite.com/system-on-module-som/i-mx-7/var-som-mx7/

> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi b/arch/arm=
/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi
[ ... ]
> +&gpio6 {
> +	sd3-pwr-hog {
> +		gpio-hog;
> +		gpios =3D <11 0>;
> +		output-low;
> +		line-name =3D "sd3_pwr";
> +	};
> +};
[ ... ]
> +&iomuxc {
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins =3D <
> +			MX7D_PAD_SD3_RESET_B__SD3_RESET_B	0x59

[Severity: Medium]
Does this GPIO hog conflict with the native usdhc3 pinctrl configuration
for SD3_RESET_B?

The sd3-pwr-hog statically claims gpio6 11, which corresponds to
MX7D_PAD_SD3_RESET_B. The pinctrl_usdhc3 later claims the exact same pad as
SD3_RESET_B in its native mode.

Could this cause a device tree resource conflict over the pad, and
potentially spuriously reset the eMMC during sleep transitions if the
pin reverts to the driven-low GPIO state?

> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi b/arch/a=
rm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
[ ... ]
> +&sai1 {
> +	assigned-clock-rates =3D <0>, <36864000>;
> +	/delete-property/ fsl,sai-mclk-direction-output;
> +};

[Severity: High]
Does deleting the fsl,sai-mclk-direction-output property prevent the SoC
from outputting the required master clock to the WM8731 audio codec?

The WM8731 codec requires an MCLK to function. By removing this direction
property, the SAI block might configure the pad as an input, which would le=
ave
the codec without a master clock from the SoC.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi b/arch/arm/boot=
/dts/nxp/imx/imx7d-var-som.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi
[ ... ]
> +&i2c1 {
[ ... ]
> +	pfuze300: pmic@8 {
> +		compatible =3D "fsl,pfuze3000";
> +		reg =3D <0x08>;
> +
> +		regulators {
> +			sw1a_reg: sw1a {
> +				regulator-min-microvolt =3D <700000>;
> +				regulator-max-microvolt =3D <3300000>;

[Severity: High]
Does setting the sw1a maximum voltage to 3.3V violate the hardware limits
for the i.MX7D core voltage?

The sw1a regulator supplies the cpu0 and cpu1 cores. The PFUZE3000 SW1A lim=
it
for this design is typically around 1.475V, and the absolute maximum rating
for the i.MX7D ARM cores is usually around 1.15V.

If a driver scales the core voltage up to 3.3V based on these boundaries,
could this result in hardware damage?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787586961.gi=
t.stefano.r@variscite.com?part=3D2
