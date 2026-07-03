Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D87277007;
	Fri,  3 Jul 2026 15:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093301; cv=none; b=YCFlSp2cp4O20I63U+UBJdVnqnRZv4E5+5IVwKxzeYFPP3uwZ+S/c9gjpjpe6UjSNnVpamarfLwEE4pkPE9fla8+XzKrgxqNzvuMI05auKEYc8kQk6v27/XSZbmvhXQ5NFyWyiq8kXHHy2Hncx3m/4vH/diP7EfibzUXRLxvi7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093301; c=relaxed/simple;
	bh=Fjo3cuWbsbC2T9TQ0UvPaekvgFSg1eYre8uhD4+fErg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=exzibRY8QV/aSWrgpDKH0dPSL6j2KnmoK1WStvmn7ux4TnupDuM4meRuxEfC2Hta6ZZT7muuR/KHM86DGoBqXelecNahvxEaYp9wibT66d0U8vMS1ypUL7dH/Afzz3RbnEuPVz2c3Et7+VgK15OEV3gggK+iZAkh9dHtCQecDLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e2/MAfq6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e2/MAfq6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF511F000E9;
	Fri,  3 Jul 2026 15:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783093299;
	bh=/qI+sP7d0y35kQBQDwCk76FmL/JdgN+0O6MrtOfev9E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e2/MAfq6t3WGKI/fZ/7c6eoNSqm53IfGpyI6djtlUjgfmxjx8gRv377mq9dG54HQF
	 iY6Na8CYwZV2xwRrtabwSBE2vcTeJLpouUZDvFSHxr9g6cEZsVkMZd1zzRHK617UQn
	 ks8kaKcr0PD1PuucvImns0n70wwOvuzNG6svppM9UYHyP3wh8Qcdp/C29zjAfo6x3d
	 DFyegwpE/VZDfIRg/Ws5VvGFYVJIaC18zFc85jSasK4bRICc1sRGCppyS3Db+Et5G/
	 kzV+8E+m1M/Zp/Y0vXXqYajKio/cUDl/9/Sn9B4lv1wDMg6IlYtP7dq7DSlQdz/eNk
	 bs+3W/+/bSotw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: imx9-var-dart-sonata: fix
 Ethernet PHY configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, robh@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260703152731.236793-1-stefano.r@variscite.com>
References: <20260703152731.236793-1-stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 15:41:38 +0000
Message-Id: <20260703154139.8AF511F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Removing the explicitly linked `reset-gpios` property from the PHY=
 nodes without adding a corresponding `-supply` reference breaks `fw_devlin=
k` dependency ordering, creating a probe race condition.
- [Medium] Replacing the PHY reset configuration with a fixed regulator red=
uces the post-enable delay from 100ms to 10ms, which may violate the PHY's =
initialization timing requirements.
--

commit aa29283e1adc330c15b9cab63314f0eec59e0b65
Author: Stefano Radaelli <stefano.r@variscite.com>
arm64: dts: freescale: imx9-var-dart-sonata: fix Ethernet PHY configuration

This commit corrects the Ethernet PHY description on DART-MX9 Sonata boards=
 by
modeling the PHY reset line as a fixed regulator instead. It removes the
reset-gpios property from the PHY nodes and asserts the enable signal during
boot to ensure initialization completes successfully.

> diff --git a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts b/ar=
ch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
> index 3f0fd321d95f0..f7e32f9375f50 100644
> --- a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
> +++ b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
[ ... ]
> +	reg_phy1_supply: regulator-phy1 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "SUPPLY_PHY1";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&pca6408_2 0 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		startup-delay-us =3D <10000>;

[Severity: Medium]
Could reducing the post-enable delay from 100ms (originally in
reset-deassert-us) to 10ms violate the PHY's initialization timing
requirements?

> +		regulator-always-on;
> +	};
[ ... ]
> @@ -139,9 +150,6 @@ mdio {
>  		ethphy1: ethernet-phy@1 {
>  			compatible =3D "ethernet-phy-ieee802.3-c22";
>  			reg =3D <1>;

[Severity: High]
Since the explicitly linked reset-gpios property was removed below, shouldn=
't
there be a corresponding phy-supply =3D <&reg_phy1_supply>; link here to ma=
intain
the device link dependency?

Without this link, fw_devlink no longer sees any dependency between the
Ethernet subsystem and the GPIO expander. Could the MAC driver probe and sc=
an
the MDIO bus before the I2C GPIO expander (pca6408_2) and the new always-on
regulator are initialized, resulting in get_phy_device() failing with -ENOD=
EV?

> -			reset-gpios =3D <&pca6408_2 0 GPIO_ACTIVE_LOW>;
> -			reset-assert-us =3D <15000>;
> -			reset-deassert-us =3D <100000>;
> =20
>  			leds {
>  				#address-cells =3D <1>;
[ ... ]
> diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts b/ar=
ch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
> index 5513d3b148a2f..1ca3ec8330d07 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
[ ... ]
> +	reg_phy1_supply: regulator-phy1 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "SUPPLY_PHY1";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&pca6408_2 0 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		startup-delay-us =3D <10000>;

[Severity: Medium]
Does this same reduction to a 10ms startup delay also risk initialization
failure here?

> +		regulator-always-on;
> +	};
[ ... ]
> @@ -180,9 +191,6 @@ mdio {
>  		ethphy1: ethernet-phy@1 {
>  			compatible =3D "ethernet-phy-ieee802.3-c22";
>  			reg =3D <1>;

[Severity: High]
Does this node also need a phy-supply =3D <&reg_phy1_supply>; property to p=
revent
the probe race condition described above?

> -			reset-assert-us =3D <15000>;
> -			reset-deassert-us =3D <100000>;
> -			reset-gpios =3D <&pca6408_2 0 GPIO_ACTIVE_LOW>;
> =20
>  			leds {
>  				#address-cells =3D <1>;
[ ... ]
> diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/ar=
ch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
> index 7a58ad38ffb46..ccf7e77016e48 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
[ ... ]
> @@ -346,9 +346,6 @@ &netc_emdio {
>  	ethphy1: ethernet-phy@1 {
>  		compatible =3D "ethernet-phy-ieee802.3-c22";
>  		reg =3D <1>;

[Severity: High]
Does this PHY node also require a phy-supply property to maintain its
dependency ordering after the reset-gpios removal?

> -		reset-gpios =3D <&pca6408_2 0 GPIO_ACTIVE_LOW>;
> -		reset-assert-us =3D <10000>;
> -		reset-deassert-us =3D <100000>;
> =20
>  		leds {
>  			#address-cells =3D <1>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703152731.2367=
93-1-stefano.r@variscite.com?part=3D1
