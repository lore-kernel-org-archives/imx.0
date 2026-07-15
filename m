Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1AB42FCDF;
	Wed, 15 Jul 2026 19:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784143864; cv=none; b=WBNWBLfRreGSOLmXwXUfv6QrQsX5GjU1FAWiqom74zXIwkWZ3FFLZvMPwoaFR2F1qh8M9KZtn7Hv+iuY5h6UF/0dhB1YcFvYI8v751LPcENEI2r2P/Sx1RCX8ywZIUtPHlnv2Ru86d9AvAhT+zfJJ9SaEYeYyLuMycquuqwWq80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784143864; c=relaxed/simple;
	bh=S74BMXboSmhL990KaoXfjtsSEdbuGY/AK1Q4jDeBHVQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WzD1mszhXFgN28sCeJ/C9D5i2c3ZYMibWt19lesE2i1C5vvtGvLN71SU8rKDBWQupdZkFERtdlgefpycVI+px8SjQ0EjeSNDEMiwgkXcGFeiBBQyj1QU1x0Ix2bLGPhll1Vb8mNadaJ51eM+O9i6V2FvKTccaJVUUh9QAaCj98M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dcfg56xK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dcfg56xK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8357D1F000E9;
	Wed, 15 Jul 2026 19:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784143861;
	bh=U+QSIKVOSwes8HHbAYFznucJMugZslchoiirUZ3Dev8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dcfg56xKGVgx/ajJb3bVseaVrMhGqkwb2x7w5gJqwI5MmeMIdio7V28k/1hvWx5Xl
	 oxs09yExsezW6Pq49vm0clEzHBWd28ufgrl1RtbbfxOp8Gas/lX60y9Z0IXQTmniq9
	 DGcXdzFxS0H2Pj/ldtQWjBMjEORly5x5DVDUOctNImp3Jae9dE0eqCwxlvI5ZWOuz6
	 zt7Zdw7un4AI9A/C/W65Z2C/IjM5W84yB/KiAf2KaVlxsw3LUAmQruGd1vjZgPKmh5
	 gITpPjeAe8f//4aMVEuhx080t4KHWShH/ZWkHZ3oCk+NM7/3heOQdmHjk3+puZnYOG
	 h/NRFxtqbA2rw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: imx8qm-var-som: Add support for
 Variscite Symphony board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <354dc61e75c935f6a7adea7b8c64fc324651d63b.1784142385.git.stefano.r@variscite.com>
References: <cover.1784142385.git.stefano.r@variscite.com>
 <354dc61e75c935f6a7adea7b8c64fc324651d63b.1784142385.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 19:31:01 +0000
Message-Id: <20260715193101.8357D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Ethernet PHY ethphy1 is reset while its power supply is off, leavi=
ng it un-reset after power-up.
--

--- Patch [3]: [PATCH v5 3/3] arm64: dts: imx8qm-var-som: Add support for V=
ariscite Symphony board ---
commit ed29f608ccf1d279621863c6ecef72b6e1b3be60
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: imx8qm-var-som: Add support for Variscite Symphony board

This commit adds device tree support for the Variscite Symphony carrier boa=
rd
equipped with the VAR-SOM-MX8 QuadMax system on module. It defines nodes and
pinmuxing for various peripherals including USB, Ethernet, SD card, I2C, and
PCIe.

Link: https://variscite.com/carrier-boards/symphony-board/

> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts b/=
arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
> new file mode 100644
> index 0000000000000..7c7fc8958efc0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts

[ ... ]

> +&fec1 {
> +	mdio {
> +		ethphy1: ethernet-phy@5 {
> +			compatible =3D "ethernet-phy-ieee802.3-c22";
> +			reg =3D <5>;
> +			vddio-supply =3D <&reg_phy_vddio>;
> +			reset-gpios =3D <&pca9534 5 GPIO_ACTIVE_LOW>;
> +			reset-assert-us =3D <10000>;
> +			reset-deassert-us =3D <100000>;

[Severity: High]
Does this sequence cause the PHY to be reset while its power is still off?

When fec1 probes and registers the MDIO bus, the MDIO core toggles the
reset-gpios for this PHY. However, the main power supply (reg_fec_phy) might
not be turned on yet because it's assigned to fec2 below.

[ ... ]

> +&fec2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_fec2>;
> +	/*
> +	 * The required RGMII TX and RX 2ns delays are implemented directly
> +	 * in hardware via passive delay elements on the SOM PCB.
> +	 * No delay configuration is needed in software via PHY driver.
> +	 */
> +	phy-mode =3D "rgmii";
> +	phy-handle =3D <&ethphy1>;
> +	phy-supply =3D <&reg_fec_phy>;

[Severity: High]
Should phy-supply be placed in the ethphy1 node rather than the fec2 node?

If phy-supply is here in the MAC node, power is only turned on when fec2
probes. This leaves the PHY un-reset after power-up, because the MDIO reset
already happened earlier during the fec1 probe.

This usually prevents the PHY from communicating over MDIO or establishing a
link.

> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784142385.gi=
t.stefano.r@variscite.com?part=3D3
