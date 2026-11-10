Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324474;
	b=cr78omjL4CD7wMlebMmNJbNCqDrOjsWet6ZRvGGAQb9DPJZSC0heMdCAnbsG4KkWZ+o/
	 JLJKqdhqcGFl6vUfh4qqHyA8cLLUgl9Fr6FEt8nLyBypeZD4trcAvdxxGQG6F2lmKPa+n
	 L7NgilI36kdu/APZBTnl3DXLpZXWaKMd1SBgOwQNLTP/KyG+Oy8FIl4gDISS6GvWZyd/l
	 32xi+nbwgcBteIpycCKlEnkk0Ai2UJjZ5nrkQqTBI3/lY1SGyiLV3k+NwYQ0Y/TZt1XyV
	 srp/T11LNgKJ6gMLfc4s5ratF3pIkEnIUS59evkaTg26dI+R70D6zhBVfHkmAkJm07Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324474;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LLjq8kkWSwtU1FCYazl1WUTtOMw4z36xQzzMmhXmoKc=;
	b=2G7L8LHHxrcjyshWfKZ6NFirnb64+G11EjOq+U+T4/n5WRssATDa2cRhysaV+o1GRwln
	 caXVEdmOUXz/xZPK3GcdOnUIAzFziUUYu9wh9wKNelWTwx2jQqYh/5FF1dnXyqL8tYOHG
	 RXqAFKhLX8g+/bEnFp0epcRN8D8pkClfHFV0gtgWAUi9grbEK6xNSk8FvongkIUvwFovz
	 FdfSK5lsF3h48p4Iz1sNtD7Gqw98m7Lw2574QUYGSYHvAPrmIbb2+t8d3xuE6QBAmHweI
	 xUKu+5ujnttYNej5BCfSYnAor7meGmZTUEKZaXXxZ2cIBhhIHkiajgtc7dny7fOo1dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GjeuSyG1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85482606A321;
	Tue, 10 Nov 2026 15:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GjeuSyG1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC7D21F0089F;
	Tue, 10 Nov 2026 15:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794324474;
	bh=LLjq8kkWSwtU1FCYazl1WUTtOMw4z36xQzzMmhXmoKc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GjeuSyG1MFRuzacta/bgFzyNVQPs9czbkmcdGc6xidREzitccUgWdIJyrtdPi1Ui8
	 wJdw9O7UuQ/Tb9jQwtVD2UIa72Us64lAsQMOLsD+2XOvfCqDUpz8brnGluZXxDXuiT
	 Q7jYh3IuG/b5tm3CYuclhEuRCkUrUitCPj9TWTBo9ppuiVzYQP5+iR/WZmWrPD2AlY
	 mC9524RsNLKXvv22mile/8aTOUUKUhUYpiiUJBm3tj4CjxXhfb4tE1+oSQMCllWz+t
	 J+La186w6VPE1vy56/7Ar7Jay7ZgCDRRg+K8ZskfSkVUrnDgRF3WvUKQJfWvimFEQi
	 zR9uXIrcq8iZw==
Message-ID: <sashiko-outbox-207264@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: freescale: Add device tree definition for
 Cloos CBASE with i.MX8MM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lukasz Majewski" <lukma@nabladev.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261110150546.1535950-1-lukma@nabladev.com>
References: <20261110150546.1535950-1-lukma@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 15:27:53 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [High] arm64: dts: freescale: usdhc2 fails probe due to disabled
  reg_usdhc2_vqmmc
- [Medium] arm64: dts: freescale: missing Makefile entry for
  imx8mm-cbase.dtb
- [Medium] arm64: dts: freescale: lcdif enabled without mipi_dsi or
  display bridge
- [Medium] arm64: dts: freescale: undocumented compatibles and missing
  lm77 OF table
- [Low] arm64: dts: freescale: decimal unit-address port@10 for reg =3D
  <10>
- [Low] arm64: dts: freescale: flexspi left enabled after deleting
  flash0 node
--

commit ed8bce86f8c6ce432aef83c22f5cd48f6151d1c7
Author: Lukasz Majewski <lukma@nabladev.com>

arm64: dts: freescale: Add device tree definition for Cloos CBASE with i.MX=
8MM

This commit adds the device tree source for the Cloos CBASE board based on
the i.MX8MM TQMa8MQML system-on-module.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-cbase.dts b/arch/arm64/=
boot/dts/freescale/imx8mm-cbase.dts
> new file mode 100644
> index 0000000000000..0bbd724f3aabc
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-cbase.dts
> @@ -0,0 +1,577 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2022 Fabio Estevam <festevam@denx.de>
> + * Copyright 2026 Lukasz Majewski <lukma@nabladev.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "imx8mm-tqma8mqml.dtsi"
> +
> +/ {
> +	model =3D "Cloos i.MX8MM CBASE board";
> +	compatible =3D "cloos,imx8mm-cbase", "tq,imx8mm-tqma8mqml", "fsl,imx8mm=
";

[Severity: Medium]
Should arch/arm64/boot/dts/freescale/Makefile also add
dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-cbase.dtb?  Without that entry, kbuild
never compiles imx8mm-cbase.dts during make dtbs or make dtbs_check.

[ ... ]

> +				port@9 {
> +					reg =3D <9>;
> +					label =3D "lan-sfp1";
> +					phy-mode =3D "sgmii";
> +					sfp =3D <&sfp_top>;
> +					managed =3D "in-band-status";
> +				};
> +
> +				port@10 {
> +					reg =3D <10>;
> +					label =3D "lan-sfp2";
> +					phy-mode =3D "sgmii";
> +					sfp =3D <&sfp_bot>;
> +					managed =3D "in-band-status";
> +				};

[Severity: Low]
Should port@10 be named port@a to match reg =3D <10>?  Unit-addresses in no=
de
names are hexadecimal, so port@10 triggers a dtc unit_address_vs_reg warning
and fails dtbs_check against ethernet-switch.yaml.

[ ... ]

> +&i2c2 {
> +	clock-frequency =3D <100000>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_i2c2>;
> +	status =3D "okay";
> +
> +	onewire@18 {
> +		compatible =3D "maxim,ds2484";
> +		reg =3D <0x18>;
> +	};
> +
> +	temp@49 {
> +		compatible =3D "national,lm77";
> +		reg =3D <0x49>;
> +	};
> +};

[Severity: Medium]
Will temp@49 fail module autoloading and schema validation?

drivers/hwmon/lm77.c only defines an i2c_device_id table and has no
of_device_id table, while i2c_device_uevent() emits an OF modalias for DT
nodes, so the lm77 module will not autoload when CONFIG_SENSORS_LM77=3Dm.
In addition, neither "national,lm77" (nor the node name temp@49 instead of
temperature-sensor@49) nor the board compatible "cloos,imx8mm-cbase" is
documented in the Devicetree bindings, which causes make dtbs_check to fail.

[ ... ]

> +&lcdif {
> +	status =3D "okay";
> +};

[Severity: Medium]
Why is lcdif enabled here when mipi_dsi remains disabled and no display
bridge or panel is defined?

In imx8mm.dtsi, lcdif's output endpoint connects to mipi_dsi, which defaults
to status =3D "disabled".  During boot, mxsfb_probe() -> mxsfb_load() ->
mxsfb_attach_bridge() fails to find an enabled remote bridge or panel and
aborts probe with -ENODEV ("Cannot connect bridge").

[ ... ]

> +&usdhc2 {
> +	assigned-clocks =3D <&clk IMX8MM_CLK_USDHC2>;
> +	assigned-clock-rates =3D <400000000>;
> +	assigned-clock-parents =3D <&clk IMX8MM_SYS_PLL1_400M>;
> +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 =3D <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 =3D <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 =3D <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&gpio2 12 GPIO_ACTIVE_LOW>;
> +	disable-wp;
> +	no-mmc;
> +	no-sdio;
> +	sd-uhs-sdr104;
> +	sd-uhs-ddr50;
> +	vmmc-supply =3D <&reg_usdhc2_vmmc>;
> +	status =3D "okay";
> +};

[Severity: High]
Does usdhc2 fail to probe because reg_usdhc2_vqmmc is left disabled?

imx8mm-tqma8mqml.dtsi sets vqmmc-supply =3D <&reg_usdhc2_vqmmc> on usdhc2,
where reg_usdhc2_vqmmc has status =3D "disabled":

arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi:
	reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
		compatible =3D "regulator-gpio";
		...
		vin-supply =3D <&ldo5_reg>;
		status =3D "disabled";
	};

Because imx8mm-cbase.dts does not enable reg_usdhc2_vqmmc,
sdhci_esdhc_imx_probe() -> mmc_regulator_get_supply() ->
of_regulator_dev_lookup() finds the disabled DT node with no registered
regulator device and returns -EPROBE_DEFER permanently, leaving the SD card
slot unusable.

[ ... ]

> +/* SPI-NOR memory is not mounted on the used SoM */
> +/delete-node/ &flash0;

[Severity: Low]
Should &flexspi be disabled instead of only deleting &flash0?

imx8mm-tqma8mqml.dtsi sets status =3D "okay" on &flexspi, so deleting only =
the
child flash0 node leaves the FlexSPI controller enabled to claim its QSPI
pins, IRQ, and clocks in nxp_fspi_probe() with no flash attached.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110150546.1535=
950-1-lukma@nabladev.com?part=3D1
