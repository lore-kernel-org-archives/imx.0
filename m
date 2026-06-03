Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F773D6691;
	Wed,  3 Jun 2026 15:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501897; cv=none; b=YSNBDrqQarNquvpfV5wJEybzHhpPkZJg3qoktnYxs0j05PIelHNedQW9pUb9qPU2dfpfYTZZMWUZQlCWa3N9fpwIqKDQZS4a2ShgzyZwbq/zIna+s2Dg7TRDwRJlMQY8UMr/QcNjfiyvKTpJMCkooHJLxlwMVS/CP7yuTK1E6P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501897; c=relaxed/simple;
	bh=klsOySXa4lDK2Vr0VzMCppv4g/ZmhbKolfxh1Shq5s8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IlPy6WVOoXLqRYYFwQLeG1rBEwigc8Dc+7JDTB4jaV+ieBFMoWgsMyigpJoPh/i5y8ASndL+miPEmzLO9MawdkLB0sAGlbNRY1cykUy/N+OZJ/WZ58LqBqCVlcInUNwIrm7mKJdk5HbiV7V1+ECJATveYTWKgP7E6lxyvRRcmQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJ11lgpk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJ11lgpk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDCCF1F00898;
	Wed,  3 Jun 2026 15:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780501896;
	bh=b8XnudztAscK6LS3FxhflALhLd0nZ6iloGyWTOvk+OE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iJ11lgpkvb6hP2uZtqDysYn4BbTZloWJF1mDewEXkmbgMwyBZ1tcNCiLxV+PAq8L1
	 qjdjgdZGSCP8RDTSFn/ZNKlc1Qk3HRI+PneaweFCpyOiJiIyWHyYmO190uq3OVMdtO
	 0fJ5K7DqRxvOvTlKVeqWTQjCgtcO/J7lUG0aBB3tUCWxwqwospMWitq2wGxFqs0lGp
	 /kSnxbdDYBMmeBb70/+lh5wDuK4Dvj15pK6LBYKynAyQ/Q/y4jJL9QjhmzIWkSOHPN
	 OgOtTEphmbhvJgassunGBzSFR9U2XfPCjLzEOHu6uPXe1FNFGs8gPXxnT0YUqNuV2c
	 c1KPkOjJLy2wQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 13/14] arm64: dts: imx8mp-var-som-symphony: add
 second Ethernet port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <57b48c65ec479641f3714292fc691ec8b70aa669.1780497188.git.stefano.r@variscite.com>
References: <57b48c65ec479641f3714292fc691ec8b70aa669.1780497188.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 15:51:35 +0000
Message-Id: <20260603155135.CDCCF1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] RGMII TX pads are configured with lowest drive strength and slow s=
lew rate, degrading the 125MHz Gigabit Ethernet transmission.
- [High] Race condition in PHY power initialization due to misplaced `phy-s=
upply`.
- [Medium] The `vddio-regulator` subnode inside `ethphy1` lacks a `compatib=
le` string and will be ignored by the regulator core.
--

commit fb47dd91efd03a99780078ebbf8ddbd840e641f1
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: imx8mp-var-som-symphony: add second Ethernet port

Add support for the second Ethernet interface available on the Symphony
carrier board. Enable the FEC controller, add the MaxLinear MXL86110 Gigabit
Ethernet PHY on the MDIO bus, describe its reset and power configuration, a=
nd
add the required RGMII pinctrl settings.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/=
arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> index 6b2aaf6bae071..f4926ce0aec7e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts

[ ... ]

> @@ -106,6 +117,38 @@ &ecspi2 {
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
> +			vddio-supply =3D <&vddio1>;
> +
> +			vddio1: vddio-regulator {
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +			};

[Severity: Medium]
Does this subnode need a compatible string?

Without a string like "regulator-fixed", the Linux regulator framework might
not instantiate a regulator device for this node, rendering the vddio-supply
reference dead.

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
> +	phy-handle =3D <&ethphy1>;
> +	phy-supply =3D <&reg_fec_phy>;

[Severity: High]
Can this cause a race condition during PHY power initialization?

Since the phy-supply is assigned to the fec MAC node while the PHY is on the
eqos MDIO bus, eqos could probe and scan the MDIO bus before reg_fec_phy
powers up the PHY. Should phy-supply be placed inside the ethphy1 node to
ensure proper probe ordering?

> +	status =3D "okay";
> +};

[ ... ]

> @@ -363,6 +406,23 @@ MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
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
Are these pad control values correct?

On the i.MX8MP, 0x00 maps to DSE_X1 (lowest drive strength) and FSEL=3D0 (s=
low
slew rate). For 125 MHz Gigabit Ethernet, could this cause severe signal ed=
ge
rounding and potential failure to negotiate a link?

> +		>;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780497188.gi=
t.stefano.r@variscite.com?part=3D13
