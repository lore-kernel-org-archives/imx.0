Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9792E7631;
	Sat, 12 Sep 2026 13:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789220659; cv=none; b=O2t0XGpNBGo3jYwqUWZ+AKsO43V0KasaJ4ykGqyaNudcgSdVsGBcrX/Hq8rZO3utMRsEJCuaUvcenbe/mebnVgsLodcfczKMmLUF5QcBt0LyxiWofa8GuJpOTsxh29YVsM8VvMPxD4A/udW4kmzlrmD8s+bTE8rkqIbe97YTIF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789220659; c=relaxed/simple;
	bh=raYOzNJNftyNcGK5NFUzBqq9joPnkbHyVpKlg+MYvoo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G3Cc+ie52oBvl6mumlFTmtoEhqp/jV5EDXsdXkUiaxDjUSHmSeGz8FwBPxxg5mov+JX0smT63JtEtjvKbUiTnD62787H5RpdWJpYX3AnFuRXXINVRQre8QRnDDe9ehu5jlRiPB5mSTxU1Faj0V+gn5zD5KQq6931Rn3lC/yhXGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ql9fbDPu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ql9fbDPu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E8E1F00893;
	Sat, 12 Sep 2026 13:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789220658;
	bh=viHVWO0CCV9KxpqbJIg6gFw+p2CcGWuaCFW/13N12aY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ql9fbDPu//5uGXebc1/VdSowcY+MAwSutdOplCMGl1IvxazODY9gJLLx5a6xVsQBs
	 eUge7fKiasGpvg8FmbSKmILdxS/cOwoDHMJKl/Ev+UKLRNXJn+KF9Amzel3Z75ITr1
	 r63XKm6OTx7idB2K+2zou5OXv//CftKEqaPLFslTMKdkvTdLJemu0Q7DuPaF73hI9D
	 uaVXKW21K0eZL4GITto9d2EN2sizuTaUK78NCvjlB/1//d8qu1ZHxoRJ5HPX7yBlZL
	 wK0bkNBEUPr1fP8rIl3rt0xIHw2G5lE7BaIfPOn+Y9meGR9fxQJ28BooPi+mKgIpt6
	 E/4ifp72WjQAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: freescale: add Nodebox v3 CPU Module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260912-for-upstream-nbxv3-dts-v5-3-ead604dba61b@free.fr>
References: <20260912-for-upstream-nbxv3-dts-v5-0-ead604dba61b@free.fr>
 <20260912-for-upstream-nbxv3-dts-v5-3-ead604dba61b@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 13:44:17 +0000
Message-Id: <20260912134417.C9E8E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Ethernet PHY nodes are missing hardware interrupt and reset prop=
erties despite the hardware lines being explicitly routed and documented.
--

commit 15177a59c196f0e48927f297cc2ef90524059103
Author: Vincent Jardin <vjardin@free.fr>

arm64: dts: freescale: add Nodebox v3 CPU Module

This commit introduces device tree support for the Free Mobile Nodebox v3 C=
PU
module. The module is built around the NXP LX2160A SoC and includes support
for various interfaces including Ethernet, I2C, and PCI.

> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi b/arch/=
arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
> new file mode 100644
> index 0000000000000..ca4fb5329c0b2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
[ ... ]
> +&emdio1 {
> +	status =3D "okay";
> +
> +	/* Microchip LAN8023 dual 10G PCS/retimer, Clause 45 only, one address =
per slice */
> +	lan8023_phy_s0: ethernet-phy@2 {
> +		compatible =3D "ethernet-phy-ieee802.3-c45";
> +		reg =3D <2>;
> +	};
> +
> +	lan8023_phy_s1: ethernet-phy@3 {
> +		compatible =3D "ethernet-phy-ieee802.3-c45";
> +		reg =3D <3>;
> +	};
> +
> +	rtl8211fd: ethernet-phy@6 {
> +		compatible =3D "ethernet-phy-id001c.c916";
> +		reg =3D <6>;
> +	};
> +};

[Severity: Medium]
Should these Ethernet PHY nodes include hardware interrupt and reset
properties?

Without the interrupts property, the kernel PHY state machine will fall back
to a 1-second polling interval, which increases latency and wastes CPU cycl=
es.
Missing reset-gpios prevents the kernel from resetting the PHYs during prob=
e,
leaving initialization reliant on the bootloader.

The hardware lines appear to be explicitly routed and documented below in t=
he
gpio-line-names arrays.

[ ... ]
> +&gpio2 {
> +	gpio-line-names =3D
> +		"lan8023-mdint",
> +		"i2c2-alert#", "i2c4-alert#", "i2c6-alert#",
> +		"u800-tca9539-int#",
> +		"spi3-alert#",
> +		"wake0", "wake1",
> +		"carrier-hot#",
> +		"u1300-rtl8211fd-int#",
[ ... ]
> +	u800: gpio@75 {
> +		compatible =3D "ti,tca9539";
> +		reg =3D <0x75>;
> +		#gpio-cells =3D <2>;
> +		#interrupt-cells =3D <2>;
> +		gpio-controller;
> +		gpio-line-names =3D
> +			"carrier-gpio0", "carrier-gpio1",
> +			"carrier-gpio2", "carrier-gpio3",
> +			"carrier-gpio4", "carrier-gpio5",
> +			"carrier-gpio6", "carrier-gpio7",
> +			"carrier-gpio8", "carrier-gpio9",
> +			"carrier-gpio10", "carrier-gpio11",
> +			"", "", "",
> +			"lan8023-rst";

Is it intentional that lan8023-mdint and u1300-rtl8211fd-int# are defined
in &gpio2, and lan8023-rst is defined in u800, but they aren't linked to
their respective PHY nodes in &emdio1?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912-for-upstre=
am-nbxv3-dts-v5-0-ead604dba61b@free.fr?part=3D3
