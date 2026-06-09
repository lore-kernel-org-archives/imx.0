Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEC33101BC;
	Tue,  9 Jun 2026 09:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995974; cv=none; b=NDJ8o7a8sxpxd5+CtE/CkVsme4gpdsINeiqu1BALxSPhLm4aHBagQKGOD/rOhCJeF7bSr2RTFc3LyCMJ90hKtHlFAIY8WgJ4A4a2+ServP4RARDluqUKYQ+DLc/HTENsdfn6gStw80FHYGuEkvLZO2e6yKifqMsza0I3CQ4oqjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995974; c=relaxed/simple;
	bh=Qbb4rjAIomvVbgZ/M4h141Uqkrd0TLsF8Vr+BK46Icc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gmIhGhIw8MGasfjw7HJmXdNVWvM5jsl4v5eY1fOuMiwZ7RneFteStI+RnIMYjlbAvkDHArt1L1QKv4QCJOLi27RalLh7/6jGoEi4KxQJoGLZYhyCw1go4v0fADIoxaZDj7Isl77jrg7Ra9/f7+4TjrnBSqDdGlhvQgfXPtdd1Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aReuL1nI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aReuL1nI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E01401F00893;
	Tue,  9 Jun 2026 09:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780995973;
	bh=dQDz6m5OW2BTYLWFJoUnXfgZADrjv2c8CLFjM9rxA/s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aReuL1nIwUTVhj6BcbVkCELme6p/gYnFWKJ3D8qZxi2ZIPrpfStTcMNE3ke5rVjc1
	 39InIkplzrvs3LNd0xB42322VL7h4nvf+hF5yHDG8lOtcCoPV5v2A7Eu2j8akrO9gC
	 nmXaXQ9nUXcR4a1eqsNn445lInQYve/PWe9ZhwOEX7tuaaL3QkVkV1YpzXt+qZLPZK
	 iN0PSQ4hHvwNed6a9y+BMW3HBPj9pOaehHhn6CdAKLD0YvanVcnDngy2yR+ZQ58UDj
	 ZieY6X0fbsjd+1owZYmaFVia0mspLH3xXW9ldpskHt0GjDWTa1KsNj1iQJkiWgOwiz
	 kz5ptcr5WMadg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: freescale: Add support for Variscite
 DART-MX8M-PLUS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <85af11e85dbb7cf5097d7c0ee567272ff6e87ec5.1780995368.git.stefano.r@variscite.com>
References: <85af11e85dbb7cf5097d7c0ee567272ff6e87ec5.1780995368.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 09:06:12 +0000
Message-Id: <20260609090612.E01401F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The Ethernet PHY is missing its interrupt configuration, forcing=
 inefficient polling mode.
--

commit 6c61266b8d072ce2626b1bdfa603f3df1b562809
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS

Add device tree support for the Variscite DART-MX8MP system on module.
This SOM is designed to be used with various carrier boards. Only
SOM-specific peripherals are enabled by default.

Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8m-plus/dart-m=
x8m-plus/

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi b/arch/ar=
m64/boot/dts/freescale/imx8mp-var-dart.dtsi
> new file mode 100644
> index 0000000000000..a647a2e0ab94b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi
> @@ -0,0 +1,476 @@

[ ... ]

> +	mdio {
> +		compatible =3D "snps,dwmac-mdio";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		ethphy0: ethernet-phy@0 {
> +			compatible =3D "ethernet-phy-ieee802.3-c22";
> +			reg =3D <0>;
> +			reset-gpios =3D <&gpio2 11 GPIO_ACTIVE_LOW>;
> +			reset-assert-us =3D <10000>;
> +			reset-deassert-us =3D <100000>;
> +			vddio-supply =3D <&reg_phy_vddio>;
> +		};

[Severity: Medium]
Is the Ethernet PHY missing its interrupt configuration?

The ethphy0 node does not define the interrupts and interrupt-parent proper=
ties,
which forces the Ethernet PHY driver to fall back to polling the PHY status
registers periodically. This is less efficient, increases CPU overhead, and
causes higher latency in link state detection compared to using hardware
interrupts.

[ ... ]

> +	pinctrl_eqos: eqosgrp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2
> +			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO				0x2
> +			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0			0x90
> +			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1			0x90
> +			MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2			0x90
> +			MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3			0x90
> +			MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x90
> +			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL			0x90
> +			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0			0x16
> +			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1			0x16
> +			MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2			0x16
> +			MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3			0x16
> +			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL			0x16
> +			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x16
> +			MX8MP_IOMUXC_SD2_WP__GPIO2_IO20					0x10

[Severity: Medium]
Could this pin be intended for the PHY interrupt?

It is explicitly configured with a pull-up in the ethernet group, strongly
indicating it is wired as the PHY interrupt on this SOM. However, no device
claims it as an IRQ source since ethphy0 lacks the interrupt properties, le=
aving
the configured GPIO completely unused.

> +			MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11				0x150
> +		>;
> +	};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780995368.gi=
t.stefano.r@variscite.com?part=3D2
