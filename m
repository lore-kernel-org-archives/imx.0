Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB583357D18;
	Sun,  5 Jul 2026 20:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783282944; cv=none; b=K6G5l6T26EbUey4YERukdXOrIXlMPMmOah0Zud/SQUVhm9GuObCaKXV1CuzuQBsdH82bHiEprFxq7WUHinqmOcz6YUq9Xumbth5Me/3kZ7H4HYV6cz2J4nafaVOrPTUCGfOPG3JA9hMUtN4bKTjUSeiRQnS2ZoQ/RMKf8uq5GWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783282944; c=relaxed/simple;
	bh=KPcswdAT6xxiqzZcUL3YkIDAE0SrN+3k0wou8Qy81SE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aZnTapOJoxbbLoxAR57hfqR4HXTYb76o4/rpF/qdkVLzPFRiLnGew2mORIdmY78YcaqjJZpayaVFEdokb9464BSj8VPaKK3e9Rh2Tnwi8XS9C33jYqd96qMQfSYAKd62ytW7w2GiOy+1iJwGh1DC69JyN3J3imcIDHDHeTEXgiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDbx/0x9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDbx/0x9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99291F000E9;
	Sun,  5 Jul 2026 20:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783282942;
	bh=XAzsab/vD/9egwFYP+IMJFjNeQROW6XgrVyPG0fS5Mc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HDbx/0x9AB/XwtitRkgPhnBlpJE3DiAIRepBrTYzwkcXKV/WfhdEQ3AAbxtDjweNO
	 eAqYjlOnmcXAhYY5qhCnIumqLWkTIZC/kuWozI60SPJbAqc7gbI2w9/ySa2SuUeChy
	 GVjgDKvE2tt/pzCQqKzlqIX/I+FqTdi838YuUD6kKpM9afXzUs+VCgtxxX2VUh4wBS
	 tjz2oVj+1RT77ZBp7QDkf0w2fx20Ofbn/htq7BHCbyWtdxAh5P3SunsMXZSsREc5Nf
	 k634O5FQXdv6TsbMDoSNOPOnt/V7VgsoZaLefEohWKNN6hUK2pKvFvS6f+PQBjXFer
	 k8eaBtNMtb4sg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/6] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs
 for Data Modul i.MX8M Mini and Plus eDM SBC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260705200534.151803-6-marex@nabladev.com>
References: <20260705200534.151803-1-marex@nabladev.com>
 <20260705200534.151803-6-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 20:22:21 +0000
Message-Id: <20260705202221.E99291F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The SAI2 interface is incorrectly configured with `fsl,sai-asynchr=
onous` and an invalid `fsl,sai-bit-clock-swap` property, leading to audio c=
apture and playback failure.
- [Medium] The overlays instantiate new `clock-controller` nodes at the exa=
ct same unit addresses as the existing `sai5` nodes, causing DTC warnings a=
nd resource conflicts.
- [Medium] Missing interrupt override for the PCA9554 GPIO expander in the =
i.MX8MP overlay causes the device to listen on a dead interrupt line.
- [Medium] The commit message claims features that are not implemented in t=
he patch.
--

commit 1e6ee57031100e82b436dac299b0eed194860d5b
Author: Marek Vasut <marex@nabladev.com>

arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs for Data Modul i.MX8M Mini =
and Plus eDM SBC

This commit adds device tree overlays for the eDM-MOD-iMX8Mm-FIO1-Audio
feature connector expansion module. It provides support for the SGTL5000
codec, CAN, I2C, SPI, and other peripherals on the i.MX8M Mini and Plus
boards.

> Add DT overlay for feature connector expansion module eDM-MOD-iMX8Mm-FIO1=
-Audio
> providing additional UARTs, CAN, PWM Beeper, I2C, SPI, GPIO breakout and
> SGTL5000 codec. This adapter can be optionally populated onto the eDM SBC.

[Severity: Medium]
Is the commit message accurate regarding the features provided?=20

The FIO1-Audio overlay only seems to enable a single UART (uart2, while uar=
t4
is disabled) and doesn't contain a pwm-beeper node or PWM pin configuration.

Could the commit message be updated to reflect only the features actually=20
implemented in this variant?

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-edm-mod-imx8mm-fio1-audio.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-d=
ata-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm=
-mod-imx8mm-fio1-audio.dtsi
[ ... ]
> +	gpio_feature: io-expander@20 {
> +		compatible =3D "nxp,pca9554";
> +		reg =3D <0x20>;
> +		#gpio-cells =3D <2>;
> +		gpio-controller;
> +		#interrupt-cells =3D <2>;
> +		interrupt-controller;
> +		interrupt-parent =3D <&gpio5>;
> +		interrupts =3D <4 IRQ_TYPE_LEVEL_LOW>;

[Severity: Medium]
Since this file is shared between i.MX8MM and i.MX8MP overlays, does the
interrupt configuration need to be overridden for i.MX8MP?

On the i.MX8MP baseboard, this feature connector signal seems to be physica=
lly
routed to GPIO1_IO08 instead of GPIO5_IO04. The i.MX8MP overlay doesn't
currently override these properties for gpio_feature, which might cause the
expander to listen on a dead interrupt line.

[ ... ]
> +&sai2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_sai2>;
> +	assigned-clock-rates =3D <24576000>;
> +	fsl,sai-asynchronous;

[Severity: High]
Does disabling internal synchronization between the TX and RX halves of the
SAI block break audio?

The SGTL5000 codec only has a single set of I2S clocks, and the pinmux
settings only route one clock pair. This leaves the other half of the SAI
physically disconnected from any clock source.

[ ... ]
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-edm-mod-imx8mm-fio1-audio.dtso b/arch/arm64/boot/dts/freescale/imx8mm-d=
ata-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
[ ... ]
> +&sai2 {
> +	assigned-clocks =3D <&clk IMX8MM_CLK_SAI2>;
> +	assigned-clock-parents =3D <&clk IMX8MM_AUDIO_PLL1_OUT>;
> +	fsl,sai-bit-clock-swap;

[Severity: High]
Is fsl,sai-bit-clock-swap intended to fix the asynchronous clocking issue?

This property is a downstream vendor leftover that does not exist in
mainline device tree bindings and is ignored by the upstream fsl_sai.c
driver. Should fsl,sai-asynchronous be removed from the shared .dtsi
instead so the SAI can operate in synchronous mode?

[ ... ]
> +&spba2 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	sai5clk: clock-controller@30050000 {	/* SAI5 */

[Severity: Medium]
Does declaring a new node here cause a duplicate unit-address warning and
potential resource conflicts?

The base SoC .dtsi files already define sai5: sai@30050000 at this exact
address. Because the node names differ (clock-controller vs sai), DTC will
create two distinct sibling nodes rather than merging them.

If the baseboard enables the existing &sai5 node, both drivers could attempt
to map the identical physical MMIO region using devm_platform_ioremap_resou=
rce,
causing a -EBUSY error. Should this overlay reference the existing &sai5 no=
de
by label instead?

[ ... ]
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-over=
lay-edm-mod-imx8mm-fio1-audio.dtso b/arch/arm64/boot/dts/freescale/imx8mp-d=
ata-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
[ ... ]
> +&spba5 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	sai5clk: clock-controller@30c50000 {

[Severity: Medium]
Similarly, does this cause a duplicate unit-address warning on i.MX8MP?=20

The base SoC defines sai5: sai@30c50000. It seems the overlay should
reference the existing &sai5 node by label here as well.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705200534.1518=
03-1-marex@nabladev.com?part=3D6
