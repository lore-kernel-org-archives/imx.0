Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038BE330B30;
	Mon,  8 Jun 2026 09:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780911184; cv=none; b=h9HIBsuE9kCjC9aDM5sVgEAK+v6mw53RaeDvnK/smQRCuUFV42KTvE7DvLFj2RXQKyrUOAAjSeGFjQ/FByADoz3aextamhxHujifKPY7KjpMpKJyxFufH47+b0Q/xUMuy92jdktpA37UBPSIGIQ269ndPTFTZODDXApoQqrP3VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780911184; c=relaxed/simple;
	bh=eNyqi0/a6iUQOyuKOjD+6zcmZDEoFKNiOkFmarsP9eU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=adiytLFrFgplDKgAq9HR4bGMsrpEXeX1XHf5JBTB/9NVrt/OsJVHcRJz5vS8JyXMJdN4Axy9wqzefimTDR1pUNyJAI6vr4PXDAos/ldFPQKJWNdHTelsYQpQvuC9ioGGvVW1Ns0k4vgqwZMruTYEC6V/6PfxK62/Ql1szel0xYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzDAnbFc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bzDAnbFc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC3D1F00893;
	Mon,  8 Jun 2026 09:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780911182;
	bh=CvgFneWx/MqlvFbhzZx1aEyCd8+cfGhXUdLwmBfpwOc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bzDAnbFck3Z7eSrDlHkjh2MFStbF9H2GRTsJfS30GQBRHCT77Kh+x6LqYpwte4qGF
	 86xCQjIMGOmuJeRI7OSVCTmq1W7Jc1sGissRsikcCUANGeVHCtMX7qrWfFZLigR5Fq
	 WgMeNL8m+PNoCjfT5s/o3R4Os4whbqlvodsTt/hxhu+9sA97g9XcbPjOF6iJzNsJXA
	 Bpy9MoFEdB5AJ62pgZ+dAjj4iZFjqhPex9tQHKUqs1hKEqZxGhqidZEYoAyAerPpB4
	 qCUyVqXSiBW4hOcM2g2ir3DVpvzXRBUS/aeAWisweaQEejwJ1HqnGTJ0dhDWyv0c4M
	 bDCpMPp91c6xA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/3] arm64: dts: freescale: Add support for Variscite
 DART-MX8M-PLUS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <6cd28e3a2411d3610f68f35cfa9d16bf94507d80.1780910435.git.stefano.r@variscite.com>
References: <6cd28e3a2411d3610f68f35cfa9d16bf94507d80.1780910435.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 09:33:01 +0000
Message-Id: <20260608093302.4DC3D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The simple-audio-card node incorrectly references the unconfigur=
ed `sai1` interface as the CPU DAI instead of the fully configured `sai3` i=
nterface.
- [Medium] The Ethernet PHY reset GPIO (`gpio2 11`) lacks a corresponding p=
inmux configuration, while extraneous unused pins are incorrectly multiplex=
ed.
--

commit 5f202b305a857831f4ff4ee2299d611123bb808b
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS

Add device tree support for the Variscite DART-MX8MP system on module.
This SOM is designed to be used with various carrier boards.

Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8m-plus/dart-m=
x8m-plus/

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi b/arch/ar=
m64/boot/dts/freescale/imx8mp-var-dart.dtsi
> new file mode 100644
> index 0000000000000..2223493339ed5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi
> @@ -0,0 +1,476 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Common dtsi for Variscite DART-MX8M-PLUS
> + *
> + * Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8m-plus/=
dart-mx8m-plus/
> + *
> + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
> + *
> + */
> +
> +/dts-v1/;
> +
> +#include "imx8mp.dtsi"
> +
> +/ {
> +	model =3D "Variscite DART-MX8M-PLUS Module";
> +	compatible =3D "variscite,var-dart-mx8mp", "fsl,imx8mp";
> +

[ ... ]

> +	sound-wm8904 {
> +		compatible =3D "simple-audio-card";
> +		simple-audio-card,bitclock-master =3D <&codec_dai>;
> +		simple-audio-card,format =3D "i2s";
> +		simple-audio-card,frame-master =3D <&codec_dai>;
> +		simple-audio-card,mclk-fs =3D <256>;
> +		simple-audio-card,name =3D "wm8904-audio";
> +		simple-audio-card,routing =3D
> +			"Headphone Jack", "HPOUTL",
> +			"Headphone Jack", "HPOUTR",
> +			"IN2L", "Line In Jack",
> +			"IN2R", "Line In Jack",
> +			"IN1L", "Microphone Jack",
> +			"IN1R", "Microphone Jack";
> +		simple-audio-card,widgets =3D
> +			"Microphone", "Microphone Jack",
> +			"Headphone", "Headphone Jack",
> +			"Line", "Line In Jack";
> +
> +		codec_dai: simple-audio-card,codec {
> +			sound-dai =3D <&wm8904>;
> +		};
> +
> +		simple-audio-card,cpu {
> +			sound-dai =3D <&sai1>;
> +		};
> +	};

[Severity: Medium]
Does this correctly link the CPU DAI to the configured interface? The
simple-audio-card node references the unconfigured sai1 interface as the
CPU DAI instead of the fully configured sai3 interface.

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
> +	};
> +};

[ ... ]

> +&iomuxc {
> +	pinctrl_bt: btgrp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06				0xc0
> +			MX8MP_IOMUXC_SD1_DATA7__GPIO2_IO09				0xc0
> +		>;
> +	};
> +
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
> +			MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10				0x150
> +		>;
> +	};

[Severity: Medium]
Will the PHY reset line be routed properly? The ethphy0 node declares
reset-gpios =3D <&gpio2 11 GPIO_ACTIVE_LOW>, but the pinctrl_eqos group does
not configure GPIO2_IO11. Instead, it seems to include configurations for
MX8MP_IOMUXC_SD2_WP__GPIO2_IO20 and MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10,
which appear to be extraneous and unrelated to the Ethernet setup.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780910435.gi=
t.stefano.r@variscite.com?part=3D2
