Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9881451FCBA;
	Mon,  7 Sep 2026 17:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788802019; cv=none; b=gVxLAH/Ou99XEaeySJpwgQI4FL6bXK5WedyCsgMkaUnz/1zbTarX9sSKGPlsf8m2tFSc9j6o709sCNbaFwswTDqm3X7KPujlxXbWZj/Yi7mT5VwoYnAcHoxiQawsmGXjQDJeUN4uU8CaqWvG1jp3s6epJ0DYuoKjo0tKljgaiWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788802019; c=relaxed/simple;
	bh=z704cOnJfD8PujNywLO/RxGNAuF96RmWdB9T+yFHSJw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rC7U4N/4jeGwXWUvgxBqsyLH4ZOxYEpmWt1MRTg2QQvXiy7y5qoK5HVdYHZtG3dOlsw9Torxe8QQsl3FqrkNKSnx1wZN+rfFSd6xiOEB9DtmRwkX+EF6TLJYyhrPYg/sNV20EAeg7zYXPxL5pTxEZ/BKPLZu/7I84PJlcQ68pzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNXwnQe7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNXwnQe7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D72AE1F00A3A;
	Mon,  7 Sep 2026 17:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788802018;
	bh=I/O1xcjB+YXcnQx+3gmXIMjWBkL0R87rv+FKat5OeBE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZNXwnQe7zg3BgLtmNmhPsSZYDUUUJViMSijcBOL1s6/PfEcgJWgZvgTlSoIwI5/xA
	 9hGnbNZU4wmOxFmzQ1R9ZX83GuVPRfafOp7NmMUpJJeHvIIWGJHqq5+kQMMD2iMPZm
	 UXEOTzjtXc/y5fARqq8pmlV/e3rhQKo5BdJo0A02a+hdKYS+8bX12xglCmJ+qhKZtr
	 xwLjw9OhV2ou5IG4peLuyUE1/7lcHkBEpLsRb+1CsgJU01TWKvjfrcD4JQRZtSsihv
	 MhoaZBwcyvmpBNX4LhvLahk4f2CcfVHukFpRb7tjc1pX9v6WPdhvB3G9DXt8GKE8Vh
	 mv3EWlY0GshQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: freescale: add Nodebox v3 CPU Module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260907-for-upstream-nbxv3-dts-v2-3-6b4afd36180b@free.fr>
References: <20260907-for-upstream-nbxv3-dts-v2-0-6b4afd36180b@free.fr>
 <20260907-for-upstream-nbxv3-dts-v2-3-6b4afd36180b@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 17:26:57 +0000
Message-Id: <20260907172657.D72AE1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] GPIO hog 'thermtrip-hog' on gpio1 pin 23 structurally conflicts wi=
th the FSPI pin multiplexer configuration.
- [Medium] The FSPI flash is artificially restricted to 1-bit bus width des=
pite the hardware being wired for 4-bit Quad SPI.
- [Medium] Ethernet PHYs are missing their hardware interrupt assignments, =
forcing the kernel into inefficient polling mode.
- [Medium] The LAN8023 PHY nodes are missing the `reset-gpios` property, le=
aving the PHY unreset during initialization.
--

commit 7aa7c67b7fab76be5b6b8b173d9fb60dc30944d9
Author: Vincent Jardin <vjardin@free.fr>
Subject: arm64: dts: freescale: add Nodebox v3 CPU Module

This commit introduces the device tree files for the Free Mobile Nodebox v3=
 CPU
Module based on the NXP LX2160A SoC. It configures the SPI, MDIO, Ethernet,=
 and
GPIO controllers for the board.

> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts b/arch/a=
rm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts

[ ... ]

> +&fspi {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&fspi_dqs_sck_cs10_pins>, <&fspi_data30_pins>;
> +};

[Severity: High]
Does this pinmux configuration conflict with the thermtrip-hog defined on g=
pio1
pin 23?

During boot, the pin controller configures the RCWPMUXCR0 register (via
fspi_dqs_sck_cs10_pins) to route pins 20-23 to the FSPI (XSPI1) controller =
en
masse. Concurrently, the GPIO driver applies the thermtrip-hog to pin 23 in
fsl-lx2160a-nbxv3.dtsi, attempting to drive it low as a GPIO.

Because the pin multiplexer strictly routes pin 23 to FSPI instead of the G=
PIO
controller, the GPIO hog will fail to control the physical pad. Furthermore,
the FSPI controller will actively drive pin 23 during SPI accesses, which c=
an
inadvertently toggle the thermal trip line and cause unexpected hardware
shutdowns.

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi b/arch/=
arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
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

[Severity: Medium]
Will this force the kernel into an inefficient polling mode for the Ethernet
PHYs?

The hardware possesses dedicated interrupt lines for the PHYs, as the gpio2
node explicitly defines the line names 'lan8023-mdint' and
'u1300-rtl8211fd-int#'. Without interrupts and interrupt-parent properties =
in
the PHY nodes (lan8023_phy_s0, lan8023_phy_s1, and rtl8211fd), the PHY driv=
er
will fall back to periodically polling the MDIO bus to check for link state
changes.

[Severity: Medium]
Should this node also include a reset-gpios property to ensure the PHY is
properly initialized?

The u800 I2C GPIO expander explicitly defines line 15 as 'lan8023-rst'.
Without claiming this GPIO (e.g., reset-gpios =3D <&u800 15 GPIO_ACTIVE_LOW=
>),
the Ethernet driver will not execute a hardware reset sequence during probi=
ng,
leaving the hardware dependent on the state the bootloader left it in and
potentially failing to recover from a suspended state.

[ ... ]

> +&fspi {
> +	status =3D "okay";
> +
> +	/* GigaDevice GD55LB02GF, 256 MiB boot NOR */
> +	flash@0 {
> +		compatible =3D "jedec,spi-nor";
> +		reg =3D <0>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		spi-max-frequency =3D <150000000>;
> +		spi-rx-bus-width =3D <1>;
> +		spi-tx-bus-width =3D <1>;
> +	};
> +};

[Severity: Medium]
Does this artificially restrict the FSPI flash to a 1-bit bus width despite=
 the
hardware being wired for 4-bit Quad SPI?

The pinctrl-0 property in the .dts file includes <&fspi_data30_pins>, which
configures four data lines (DATA[3:0]) for the FSPI controller. However, th=
is
flash@0 node sets the spi-rx-bus-width and spi-tx-bus-width to 1. This mism=
atch
forces the SPI NOR flash driver to operate in single-bit mode rather than
quad mode, needlessly degrading I/O performance.

[ ... ]

> +&gpio1 {
> +	status =3D "okay";

[ ... ]

> +	thermtrip-hog {
> +		gpio-hog;
> +		gpios =3D <23 GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name =3D "thermtrip";
> +	};

[Severity: High]
Does this GPIO hog structurally conflict with the FSPI pin multiplexer
configuration in the .dts file?

As mentioned earlier, the fspi node routes pin 23 to the FSPI controller,
meaning the GPIO controller is disconnected from the physical pad. Attempti=
ng
to hog it here will fail and may allow the SPI controller to inadvertently
trigger the thermal trip line during accesses.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-for-upstre=
am-nbxv3-dts-v2-0-6b4afd36180b@free.fr?part=3D3
