Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77483403EB;
	Mon,  8 Jun 2026 11:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780916655; cv=none; b=JClkWG6Vq6VZY8xcYk2RJpieunKk6ZUEr2EvcNqitO6MehZRSFkwca9znSA/V2KhHRTzsKUL4ps81VWcaU/eQ3TcFSbxi6hrLnulIyiF8lhRHyV9mD5Aavk2ysl8oeVb1EgeoEp34WATZ8BCbDZ323syiOAzrTUr/eHSBCCteCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780916655; c=relaxed/simple;
	bh=GhUSZzbmExm9Io27WAaWLwobqfQH4g+MBmfNuw47hsU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JJ4fwqmZCUgbWMkBF5HDhlhyxOfFh0UFmHG+g7rEB4CYChdTiZdMg9jHfi+ReLsw7tXN+w7Ibe2coAp8h500b6pMYEebmD7sEKeUcZlUKTl8CuRkVTOx7c92GKgwENpj9Wy/xtA5l9T1dXTnqSfA9ZqMLKwYzuQBPb20qjjk5o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hr8Re3fR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hr8Re3fR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA4D71F00893;
	Mon,  8 Jun 2026 11:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780916654;
	bh=dVqb1rlW2dpL0v3lqIyBBqdAmHX6B8HPzYId3/mxlfI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hr8Re3fR41NoK2c45cNIfBjQIlEE1gtxe6Kjm/wcz9qQ4BIAqOmmZQ8M51hkhOqXt
	 j+Ew9FGYCznsV2dOqVAt9yrHc5VpJBboensuPA5FSLzhNNKz8cufa/4Y1MaC+Zqzzh
	 uS4qcdDvLcvuSBlyCA6lgji3DAifuclsrq6Y6mZv5NEGqscOA0uHAGwSm2DrErqhoy
	 x8Rf4Pf/tCZ36HqCW/mNw7f0LkhENUKMzIZe06R358xMOOv1HL2+Ua3kfNqMsYvOwN
	 zUdPAIB4NRdiOouJq/jDeoEg9e7l3/3f/EEVnqniysnlEPOkFotSpjQg2YMdwNU/q7
	 2QrY44kmAIYNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: freescale: Add support for Variscite
 DART-MX8M-PLUS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <109ba24e5d265b7b1764e051a48133ea6b0cde59.1780912513.git.stefano.r@variscite.com>
References: <109ba24e5d265b7b1764e051a48133ea6b0cde59.1780912513.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 11:04:12 +0000
Message-Id: <20260608110413.EA4D71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Orphaned pin configuration in `pinctrl_eqos` causes a pinctrl co=
nflict, and missing PHY interrupt configuration.
--

commit 073a9021771cdebbb374385137ac2962db9362f2
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS

Add device tree support for the Variscite DART-MX8MP system on module.
This SOM is designed to be used with various carrier boards.

Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8m-plus/dart-m=
x8m-plus/

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi b/arch/ar=
m64/boot/dts/freescale/imx8mp-var-dart.dtsi
> new file mode 100644
> index 0000000000000..a4563833ee8e0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi

[ ... ]

> +	mdio {
> +		compatible =3D "snps,dwmac-mdio";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		ethphy0: ethernet-phy@4 {
> +			compatible =3D "ethernet-phy-ieee802.3-c22";
> +			reg =3D <4>;
> +			reset-gpios =3D <&gpio2 11 GPIO_ACTIVE_LOW>;
> +			reset-assert-us =3D <10000>;
> +			reset-deassert-us =3D <100000>;
> +			vddio-supply =3D <&reg_phy_vddio>;
> +		};

[Severity: Medium]
Does this PHY configuration omit the interrupt configuration?

Without the interrupt-parent and interrupts properties, will the kernel fall
back to CPU-intensive polling instead of interrupt-driven operation?

> +	};
> +};

[ ... ]

> +	pinctrl_eqos: eqosgrp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2
> +			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO				0x2

[ ... ]

> +			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL			0x16
> +			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x16
> +			MX8MP_IOMUXC_SD2_WP__GPIO2_IO20					0x10

[Severity: Medium]
Is this pin erroneously claimed by the ethernet node?

This pin does not appear to be consumed by the Ethernet MAC or PHY in this
file. If a custom carrier board attempts to use SD2_WP for its standard
purpose or as a GPIO, will it fail with an -EBUSY pinctrl conflict because =
it
is locked here?

If this pin was originally intended to act as the PHY interrupt line, should
it be configured in the ethphy0 node instead?

> +			MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11				0x150
> +		>;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780912513.gi=
t.stefano.r@variscite.com?part=3D2
