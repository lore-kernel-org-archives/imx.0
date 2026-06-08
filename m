Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C5233E35F;
	Mon,  8 Jun 2026 15:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931804; cv=none; b=URXMLFNC63USi9hcIJ89QfcSzZ72pOYVgCT9KyDCARxk67Ybi5L30yFXfgI4l/iwx16LjXXQ9oxCVGDsTDrY13IkuZAsXquAVsKNkGFLfGpDajDmlvNjWDaeUv4uWfhuU1rgnTwGZW1UmyF3wUcS5WCoAj/0IjdHkqUBzCx10BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931804; c=relaxed/simple;
	bh=Yr6opTPfPazrtWqG3dtG5eVzeP/HsfJBScjCr+s1788=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=StEWsCibCffuw1BiU6acxC7a/h9+YQf3cP+4UE7zPKZM0sL8J3xZ1FeRcA5lrCX3MPBnJrfeDkqhOzG7bP3iZAyqRpJTDLPqTglFidqMQB0EpX0UAqS0ERH4N8/1MtShoTdsmLGSJ28+M9QzQStBMZOBhxC/l3IH/tjkG/a//cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kUbjSPFa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kUbjSPFa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5251F00893;
	Mon,  8 Jun 2026 15:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780931803;
	bh=JokEqc+/MUqTZL+P9au+Q/IVENCM5VC0ohcQst6fPp4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kUbjSPFaQdku5yf2nKVYFZ6wotefvOh/zFNsDChPf6ZU1zgigMn3fs2Lr2ee7wPnj
	 JmYH9onr3KfVeuE1mh+szisctJVOpA2K7Oc2hA/qGkXqQdoNYFT8IT9OQIywR4raSp
	 AYHeeG2gjy4uATRJyqKbeHZNaEgjuE6j4m9nVmBjJwZFHAuDJN9padAG40DuRovHHt
	 Wakt5CNHobFdcxLUiz6UJi4SA+pMOI3df3TBHZX22fyehiORIkozGznoRrQxflL12k
	 4dIMVSyAtyhBdC7kOAbe+EQSKZoBhB46ds3OtgVgZoUahQpNWuMlvUut4X3GxDlI6X
	 PPX8Y3c3DczgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 13/14] arm64: dts: imx8mp-var-som-symphony: add
 second Ethernet port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <7bcfeb748665154245f5dc3294b82ab79d96e4a1.1780929317.git.stefano.r@variscite.com>
References: <7bcfeb748665154245f5dc3294b82ab79d96e4a1.1780929317.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 15:16:42 +0000
Message-Id: <20260608151643.0E5251F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Cross-MAC PHY topology causes a probe failure because the PHY's po=
wer regulator is bound to the consumer MAC and defaults to off during MDIO =
bus scanning.
- [High] RGMII TX pads for `fec` are configured with a value of `0x00`, res=
ulting in weak drive strength and slow slew rate, which is inadequate for G=
igabit Ethernet.
- [High] The PHY hardware ID will be read before its `reset-gpios` is deass=
erted, causing MDIO detection to fail if the PHY boots in reset.
--

commit bda896d5d23f9f668ca3a45c2c3193d86201d161
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: imx8mp-var-som-symphony: add second Ethernet port
   =20
Add support for the second Ethernet interface available on the Symphony
carrier board. Enable the FEC controller, add the MaxLinear MXL86110
Gigabit Ethernet PHY on the MDIO bus, describe its reset and power
configuration, and add the required RGMII pinctrl settings.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/=
arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> index 93dee9ec0b9bd..e928a3d44b1d5 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
[ ... ]
> @@ -106,6 +116,33 @@ &ecspi2 {
>  	status =3D "okay";
>  };
> =20
> +&eqos {
> +	mdio {
> +		ethphy1: ethernet-phy@5 {
> +			compatible =3D "ethernet-phy-ieee802.3-c22";
> +			reg =3D <5>;
> +			reset-gpios =3D <&pca9534 5 GPIO_ACTIVE_LOW>;

[Severity: High]
Will the MDIO core be able to detect this PHY if it boots in reset?

Because the specific PHY ID isn't provided in the compatible string, the Li=
nux
MDIO core will attempt to read the hardware ID over the bus before creating
the PHY device structure.

However, the reset-gpios line is only acquired and deasserted later during
phy_device_register(). If the PHY powers up held in reset by the GPIO
expander, the initial MDIO read will fail.

Would it be better to specify the PHY ID in the compatible string
(e.g., ethernet-phy-idXXXX.YYYY) so the core knows to skip the ID read?

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
> +	phy-handle =3D <&ethphy1>;
> +	phy-supply =3D <&reg_fec_phy>;

[Severity: High]
Could there be a probe failure due to the PHY being unpowered during the MD=
IO
bus scan?

The ethphy1 node is attached to the &eqos MDIO bus, but its power regulator
reg_fec_phy is provided via phy-supply in the &fec MAC node.

Since the regulator lacks regulator-always-on, it defaults to off. When &eq=
os
probes and registers its MDIO bus, it will scan for ethphy1, but the PHY wi=
ll
be unpowered because the &fec MAC hasn't probed yet.

Should phy-supply be moved to the ethphy1 node instead?

> +	status =3D "okay";
> +};
[ ... ]
> @@ -363,6 +400,23 @@ MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
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
Does a pad value of 0x00 provide adequate signal integrity for Gigabit
Ethernet?

On the i.MX8MP pad controller, a value of 0x00 configures the Slew Rate to
slow and Drive Strength to its weakest setting.

Since Gigabit RGMII requires a 125 MHz clock with tight timing margins, cou=
ld
this weak drive strength and slow slew rate cause unpredictable packet loss=
 or
link failures?

> +		>;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780929317.gi=
t.stefano.r@variscite.com?part=3D13
