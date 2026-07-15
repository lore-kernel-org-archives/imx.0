Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D589543634A;
	Wed, 15 Jul 2026 11:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784114954; cv=none; b=pSX4VvpKzsX/Wk4WdXrWlNfsI90Zv/jGDhf3CF0TBQ96K/aT6Ae19w8qBIj/67EucB47KzyOms1KuEf/UWL7ciD4RLEEcgH95tR/HUtog/zvQ/t7ui6fhJNJccN18GQYtN/uVWPVn9/DDyiz5HSnGIGOWXk49/BV2LXb+0J6+tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784114954; c=relaxed/simple;
	bh=P0KgsAiIWqtvoxl+fTEvn65eGdALLQxvSCSle/IjIFo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WR+5zV9kgPy4Kch3pAN4t2LuYCrEnfDjn6aYo+dV4pqsPqSk2N6Z1kMHmo1i6Y8R+yt1f484oOS8WLSwhOLbdHMdK1yRRE/s/vhZwuEjYtT+cSXGDPmzwm64mFJTskMftx/xSFx2yvOJpeee8Zv4XUztQjH0JPLLQer3T0PKRL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E88oUNY1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E88oUNY1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A3D71F000E9;
	Wed, 15 Jul 2026 11:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784114953;
	bh=2fBvhl0zTG5Yc1yvbwT/b8GyPit0HqW4bIIk8xv4HCE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E88oUNY1hE9CZ8KEU/lxeEt/rN/a7yUh+nx+jjp/jTyDDPsck14RlbmmKOnUr9xXh
	 D5xt88NXYWF/c5Ik923T8n7tOydr+gSsyJb99b+y0akEJmJD7R76M3tkVqr5Gi05v8
	 StJ8rC0pSeNUQaMBGnQgpdqjAnUBbjy/lNgRachtE7RFjzS9DFI48IDcKgLztZlnVd
	 UpV6PgFc6WOSG91ygaTU4rAD9viJJB9nqdNGOFcnuFrPXkAyMF296BtAVgdirUYNQ8
	 1zeQ13myywGOmjHkkkQ6LsGmbgybZx7+BeKmfD5Z4FFNkKc2J5fdcqSZZzkwK6vfeM
	 CvT5zvt8f3Gxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: imx8qm-var-som: Add support for
 Variscite Symphony board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org
In-Reply-To: <2480c0b11fff83d57826d6519410c1ecc1d89bb8.1784113547.git.stefano.r@variscite.com>
References: <cover.1784113547.git.stefano.r@variscite.com>
 <2480c0b11fff83d57826d6519410c1ecc1d89bb8.1784113547.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 11:29:12 +0000
Message-Id: <20260715112913.3A3D71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Ethernet PHY is unpowered during MDIO bus scan due to decoupled ph=
y-supply and MDIO parent
--

--- Patch [3]: [PATCH v3 3/3] arm64: dts: imx8qm-var-som: Add support for V=
ariscite Symphony board ---
commit ac21a70e1bd0bf7f486143508c499cc45337cbf8
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: imx8qm-var-som: Add support for Variscite Symphony board

This commit adds device tree support for the Variscite Symphony carrier
board equipped with the VAR-SOM-MX8 QuadMax system on module. It defines
various peripherals including uSD Card, USB, Gigabit Ethernet, UART, SPI,
I2C interfaces, and PCIe.

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
Will this PHY fail to probe because it is unpowered during the MDIO bus sca=
n?

Since ethphy1 is defined as a child of the fec1 MDIO bus, fec1 initiates
the PHY probe. However, its power supply (reg_fec_phy) is coupled to fec2 h=
ere.

When fec1 probes and registers its MDIO bus, it scans for PHYs. Because fec2
has not successfully probed yet (or deferred due to the missing PHY),
reg_fec_phy will be OFF.=20

The MDIO core will fail to read the PHY ID of the unpowered ethphy1 and
silently skip registering it. When fec2 eventually probes and enables the
regulator, it will likely fail to connect because ethphy1 was never registe=
red.

Does phy-supply need to be moved to the MDIO node or ethphy1 directly so
it gets powered on before the MDIO bus is scanned?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784113547.gi=
t.stefano.r@variscite.com?part=3D3
