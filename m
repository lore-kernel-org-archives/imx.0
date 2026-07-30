Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805083C4562;
	Thu, 30 Jul 2026 23:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785452451; cv=none; b=PjzAbwGzHVvDaaXczlO8YnF2t1MpfmDVH3XQZ8oRRaR31PXmTdUolwDMq+wRxHguOYvYALnFplGoupN9syLvgC7PbCLAi+cOPI1uJtNy6iJD1f7odl+pUqMaLfkL2set/NNukajhhdCz74qjMoS9ZsOmVM2qqMh+ce+Hk7U8BWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785452451; c=relaxed/simple;
	bh=v4Q7fiY4y12+P8q8kBDi8Dj0MXAAtUUuXBjHe4owcb0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PNK6J5Xm6ojGBpoXHAKeBjyUlFIGCp5ZSYXd092gGgic/MCXHrL0oIDy3lvFtc1B18IxwnLXb2cEDbUzXN/m+CUyu/ie4XLZjmy5l8GU6QJKE+IAT7akm9rTJ0ITeJNmnLiwHt6YI0o/r2LteQgbgkFHKtaQOX10G7OpuDnRuig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhEJggqz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhEJggqz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB9C1F000E9;
	Thu, 30 Jul 2026 23:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785452450;
	bh=VYOByWDgVi2rnXvPzdBk2dvDZvksdmOVKJF8YsRq21o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bhEJggqzP0TTatZqy+pp3uw1OOJg4iSUogcp6k47cyzPyItbkB9lDHxL6z/PBEXvL
	 0X/f5yQeyzug792scA0TcxpZwgwE0YviBCrm1QBKWrBNk2lQbW/ZToyMKVRCesY5z6
	 UX9/VhMzk3GjuRPbFSCheNwQC8AuwxFBwFrtIJJuj1V3LIoUu6QAwak7Dlihx5/3gF
	 Q3aRAAKON4ww2TtAVACvfbTn2QggjsjgdfBoOdFtsCeh/c9beFA5+FrykPcVbQ2F2/
	 vI+Fn5c3FrpeRicjUjcik2ZSKefw2iyn+7slLjpcRWjlev/XZq1g0rZKxVqbCq4r4q
	 FucDJJlwAQV7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 7/7] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs
 for Data Modul i.MX8M Mini and Plus eDM SBC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260730224351.95006-7-marex@nabladev.com>
References: <20260730224351.95006-1-marex@nabladev.com>
 <20260730224351.95006-7-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 23:00:49 +0000
Message-Id: <20260730230049.AEB9C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The `sai5clk` clock provider uses the `bus` clock instead of the i=
ntended 24MHz root clock to generate MCLK, which will break the SGTL5000 au=
dio codec.
- [High] The shared `.dtsi` file applies i.MX8MM-specific UART overrides to=
 the i.MX8MP baseboard, breaking onboard Bluetooth.
- [Medium] The overlays create a new `clock-controller` node at the same un=
it address as the existing `sai` node, violating Device Tree uniqueness rul=
es.
- [Low] The commit message inaccurately claims the overlay provides a PWM B=
eeper, but the beeper node and PWM configuration are missing.
- [Low] Dead pinctrl code and inaccurate commit message regarding 'addition=
al UARTs'.
--

--- Patch [7]: [PATCH v8 7/7] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DT=
Os for Data Modul i.MX8M Mini and Plus eDM SBC ---
commit ffa908f72aa972e17c5f27427f835a5125cba175
Author: Marek Vasut <marex@nabladev.com>
Subject: arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs for Data Modul i.M=
X8M Mini and Plus eDM SBC

Add DT overlay for feature connector expansion module eDM-MOD-iMX8Mm-FIO1-A=
udio providing additional UARTs, CAN, PWM Beeper, I2C, SPI, GPIO breakout a=
nd SGTL5000 codec. This adapter can be optionally populated onto the eDM SB=
C.

> Add DT overlay for feature connector expansion module eDM-MOD-iMX8Mm-FIO1=
-Audio
> providing additional UARTs, CAN, PWM Beeper, I2C, SPI, GPIO breakout and
> SGTL5000 codec. This adapter can be optionally populated onto the eDM SBC.

[Severity: Low]
Does this overlay actually provide a PWM Beeper and multiple additional UAR=
Ts?

Looking at the implementation below, uart1 is never enabled, leaving only
uart2 as the single additional UART. Additionally, the pin typically used
for the PWM Beeper is explicitly repurposed as a GPIO hog, and no PWM nodes
are instantiated in the audio variant.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-edm-mod-imx8mm-fio1-audio.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-d=
ata-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi
> new file mode 100644
> index 0000000000000..8b38b5c228e0a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm=
-mod-imx8mm-fio1-audio.dtsi

[ ... ]

> +&uart2 {	/* RS422 J12 */
> +	linux,rs485-enabled-at-boot-time;
> +	uart-has-rtscts;
> +	status =3D "okay";
> +};
> +
> +/* UART4 is blocked by RDC and used as CM4 console UART */
> +&uart4 {	/* UART to 1-Wire J5 */
> +	status =3D "disabled";
> +};

[Severity: High]
Will this unconditionally disable onboard Bluetooth when this overlay is
applied to the i.MX8MP baseboard?

Since this shared dtsi file is also included by the i.MX8MP overlay, disabl=
ing
uart4 here conflicts with the i.MX8MP baseboard, which actively uses uart4 =
for
the onboard Infineon CYW55572 Bluetooth chip.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-edm-mod-imx8mm-fio1-audio.dtso b/arch/arm64/boot/dts/freescale/imx8mm-d=
ata-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
> new file mode 100644
> index 0000000000000..88fa705ac2b67
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm=
-mod-imx8mm-fio1-audio.dtso

[ ... ]

> +&spba2 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	sai5clk: clock-controller@30050000 {	/* SAI5 */

[Severity: Medium]
Does this create an overlapping duplicate node at the 30050000 unit address?

The base i.MX8MM devicetree already defines sai5: sai@30050000. Declaring
a new clock-controller@30050000 node under spba2 instead of extending the
existing node with &sai5 violates the Devicetree specification requiring
unique unit addresses for sibling nodes.

> +		compatible =3D "fsl,imx8mm-sai-clock", "fsl,imx8mq-sai-clock";
> +		reg =3D <0x30050000 0x10000>;
> +		#clock-cells =3D <1>;
> +		clocks =3D <&clk IMX8MM_CLK_SAI5_IPG>,
> +			 <&clk IMX8MM_CLK_SAI5_ROOT>;

[Severity: High]
Will this derive the MCLK from the bus clock instead of the intended 24MHz
root clock?

The clock driver at drivers/clk/clk-fsl-sai.c hardcodes index 0 as the pare=
nt
for generated clocks. Because the bus clock (IPG) is listed at index 0 here,
the Common Clock Framework will use it as the parent. Since the bus clock
typically runs around 133MHz, the SGTL5000 codec will receive an out-of-spec
MCLK (it strictly requires 8-27 MHz) and audio playback will fail to initia=
lize.

> +		clock-names =3D "bus", "mclk1";

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-over=
lay-edm-mod-imx8mm-fio1-audio.dtso b/arch/arm64/boot/dts/freescale/imx8mp-d=
ata-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
> new file mode 100644
> index 0000000000000..4e2112355350f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm=
-mod-imx8mm-fio1-audio.dtso

[ ... ]

> +	uart1-grp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_SD1_CLK__UART1_DCE_TX		0x49
> +			MX8MP_IOMUXC_SD1_CMD__UART1_DCE_RX		0x49
> +			MX8MP_IOMUXC_SD1_DATA1__UART1_DCE_CTS		0x49
> +		>;
> +	};
> +};

[Severity: Low]
Is this pinctrl group dead code?

The uart1-grp is defined here, but the uart1 node is never enabled or
referenced in this overlay or the shared dtsi.

> +&sai2 {
> +	assigned-clocks =3D <&clk IMX8MP_CLK_SAI2>;
> +	assigned-clock-parents =3D <&clk IMX8MP_AUDIO_PLL2_OUT>;
> +};
> +
> +&spba5 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	sai5clk: clock-controller@30c50000 {

[Severity: Medium]
Does this create a duplicate node at the 30c50000 unit address?

Similar to the i.MX8MM overlay, the i.MX8MP base devicetree already defines
sai5: sai@30c50000. Extending it via &sai5 would avoid overlapping unit
addresses.

> +		compatible =3D "fsl,imx8mp-sai-clock", "fsl,imx8mq-sai-clock";
> +		reg =3D <0x30c50000 0x10000>;
> +		#clock-cells =3D <1>;
> +		clocks =3D <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_IPG>,
> +			 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_MCLK1>;

[Severity: High]
Does listing the IPG clock at index 0 cause the MCLK to be generated from t=
he
bus clock instead of the MCLK1 root clock, as mentioned for the i.MX8MM ove=
rlay?

> +		clock-names =3D "bus", "mclk1";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730224351.9500=
6-1-marex@nabladev.com?part=3D7
