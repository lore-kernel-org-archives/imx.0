Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF653603D7;
	Mon,  8 Jun 2026 11:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780918515; cv=none; b=ivkKOE+hXS04rJIsGbm7KYsDSf6iysNhD2SK3WQs6RjXclvZtc0DYdwJ+yMA3tlcQNI+yExepk+HDSYpa5PgZgKxEIprXoS59992NonprjiTYlQum+vEVf2dmcKbp6wc/Ru8z7R2iZBIPicYZ9yIWyrD5wflUPUo3DUuyAUUsFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780918515; c=relaxed/simple;
	bh=1uB+OqdvEqi2eXSNdwXOfBVJz1TxF1sdrUxynJnofBE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iVhK6DBlYQW3euCo+5vdlfAydldw6qCLQ7BoI1DrbZRh02ldQK4/86+73XEi30pJQy3aFGht8jNXmzQbBdWIiL5398IBDQfueQf86BNI5BR7GvfC2UNeb1bZjZ3ejA+1dmi7vPKRwlNL5mmdLnY+AU3McpL8MiaA9JHQdat8eh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJaOA5NY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJaOA5NY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423271F00893;
	Mon,  8 Jun 2026 11:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780918514;
	bh=f3hgjEA/HG6lpgpS/mo8C3IOkIBDQw6BSzBJ77loEeY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oJaOA5NYT9ZO+esaziK5lms6MR99inswrPoQb0lj7kH8MxcXQOiDR0xqQOgHL02rs
	 KDXRg6mR39s5/rfGLRmiA4txhm5T044iJkyP6XxuIjOqQZSDxSt6qOw5eAOQPYf2gS
	 wvNiCVWtU4mYbIS9sZAqhgh1/r2FHvd5oBg23A1OFXJWmI6F3YQYwMDmrQX4cKADtc
	 Sbq2rPOTxDlCxh0HDzGBOEvFm8HgCqNYaZ6SI0uuVh7+0MZgOlaObCcZONPOXcq246
	 Z++k4mj6Ds5C3yuHaE49SNnttk1RDyB18R5LKvsv7ygNOG5b1M1gtHgIHRf48rX8pF
	 aO5aUCrj+foOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 13/14] arm64: dts: imx8mp-var-som-symphony: add
 second Ethernet port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: conor+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <302638ba16d4684c5b0bf8660a42615dad67f3eb.1780912893.git.stefano.r@variscite.com>
References: <302638ba16d4684c5b0bf8660a42615dad67f3eb.1780912893.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 11:35:13 +0000
Message-Id: <20260608113514.423271F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The RGMII TX pads in `pinctrl_fec` are misconfigured with a value =
of `0x00`, resulting in a slow slew rate and minimal drive strength.
- [Low] The `reg_phy_vddio` node and label are redundantly redefined, which=
 will cause a Device Tree Compiler duplicate label error.
- [Low] Potential missing RGMII delay configuration and misleading comment =
due to a blindly copy-pasted `phy-mode`.
--

commit 6c050703eb451d931bc2a42a7966eecdf5e1949c
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: imx8mp-var-som-symphony: add second Ethernet port

This commit adds support for the second Ethernet interface on the Symphony
carrier board. It enables the FEC controller, configures the MaxLinear PHY
on the MDIO bus, and sets up the required RGMII pinctrl settings.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/=
arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> index 7ad57caa0f1c2..c5a38018d494b 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> @@ -66,6 +66,24 @@ pcie0_refclk: pcie0-refclk {
>  		clock-frequency =3D <100000000>;
>  	};
> =20
> +	reg_fec_phy: regulator-fec-phy {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "fec-phy";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +		regulator-enable-ramp-delay =3D <20000>;
> +		gpio =3D <&pca9534 7 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	reg_phy_vddio: regulator-phy-vddio {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vddio-1v8";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +	};

[Severity: Low]
Will this cause a Device Tree Compiler duplicate label error?

The reg_phy_vddio label and its node appear to already be defined at the ro=
ot
level in the included imx8mp-var-som.dtsi file. Redefining it directly here
in the symphony dts usually causes dtc to fail compilation.

[ ... ]
> @@ -106,6 +124,33 @@ &ecspi2 {
>  	status =3D "okay";
>  };
> =20
> +&eqos {
> +	mdio {
> +		ethphy1: ethernet-phy@5 {
> +			compatible =3D "ethernet-phy-ieee802.3-c22";
> +			reg =3D <5>;
> +			reset-gpios =3D <&pca9534 5 GPIO_ACTIVE_LOW>;
> +			reset-assert-us =3D <10000>;
> +			reset-deassert-us =3D <20000>;
> +			vddio-supply =3D <&reg_phy_vddio>;
> +		};
> +	};
> +};
> +
> +&fec {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_fec>;
> +	/*
> +	 * The required RGMII TX and RX 2ns delays are implemented directly
> +	 * in hardware via passive delay elements on the SOM PCB.
> +	 * No delay configuration is needed in software via PHY driver.
> +	 */
> +	phy-mode =3D "rgmii";

[Severity: Low]
Is this comment accurate for this interface, or was it copy-pasted from the
SOM eqos interface?

The comment states the delays are implemented via passive delay elements
on the SOM PCB, but this Ethernet PHY is located on the Symphony carrier
board.

If the carrier board lacks these passive delay elements, should phy-mode be
set to "rgmii-id" instead?

> +	phy-handle =3D <&ethphy1>;
> +	phy-supply =3D <&reg_fec_phy>;
> +	status =3D "okay";
> +};

[ ... ]
> @@ -363,6 +408,23 @@ MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
>  		>;
>  	};
> =20
> +	pinctrl_fec: fecgrp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_SAI1_RXD4__ENET1_RGMII_RD0				0x90
> +			MX8MP_IOMUXC_SAI1_RXD5__ENET1_RGMII_RD1				0x90
> +			MX8MP_IOMUXC_SAI1_RXD6__ENET1_RGMII_RD2				0x90
> +			MX8MP_IOMUXC_SAI1_RXD7__ENET1_RGMII_RD3				0x90
> +			MX8MP_IOMUXC_SAI1_TXC__ENET1_RGMII_RXC				0x90
> +			MX8MP_IOMUXC_SAI1_TXFS__ENET1_RGMII_RX_CTL			0x90
> +			MX8MP_IOMUXC_SAI1_TXD0__ENET1_RGMII_TD0				0x00
> +			MX8MP_IOMUXC_SAI1_TXD1__ENET1_RGMII_TD1				0x00
> +			MX8MP_IOMUXC_SAI1_TXD2__ENET1_RGMII_TD2				0x00
> +			MX8MP_IOMUXC_SAI1_TXD3__ENET1_RGMII_TD3				0x00
> +			MX8MP_IOMUXC_SAI1_TXD4__ENET1_RGMII_TX_CTL			0x00
> +			MX8MP_IOMUXC_SAI1_TXD5__ENET1_RGMII_TXC				0x00

[Severity: High]
Will configuring these RGMII TX pads with 0x00 degrade signal integrity?

In the i.MX8MP pad configuration, a value of 0x00 sets a Slow Slew Rate
(SRE=3D0) and the weakest Drive Strength (DSE=3DX1). RGMII interfaces run at
125 MHz DDR and typically require a fast slew rate and high drive strength
(such as 0x16 or 0x1f).

Does using 0x00 risk heavy distortion, TX packet loss, or a complete link
failure?

> +		>;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780912893.gi=
t.stefano.r@variscite.com?part=3D13
