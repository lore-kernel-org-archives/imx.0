Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0894427F80;
	Wed, 29 Jul 2026 22:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785363035; cv=none; b=ocSl9sMHInN7Y4X1Eo5IF0VuYwPT/JFYpYyEiG71Dedrx4hbPqp7/oqxcraaseaSAo/+e3j5mBHk5ZzBKh2pmVZ+LVOPSZ8SfFZjmo/DjXbIn+IQz4CglUouU03XMfSIDdA4SduUVaK+nkoxG9OxZ7hLyVykVlLIy91Xm5zj+cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785363035; c=relaxed/simple;
	bh=EBZfMyCQ8kWecGxcGO+ExKGWOKzuIHxbF9TlqbcEWq4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RwPb64ZBneSUHhwVA20t617LFOR8mk8xA6lyzSnBXcGb+RjnSA4N0mDtrTrHRTIVupXo17PKvjQUgmEqP2zHVnG1g46FnoOAHu7vqfrEXXSQpOFcrvYDkxTCo0omIUQb2s2bS3eCwuhMUam4P2zUX2c8e2S5kIEGFeamFCjRhTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OYGtOh8E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OYGtOh8E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CDB41F000E9;
	Wed, 29 Jul 2026 22:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785363033;
	bh=icv+WVFBfCtuo84Wk8yUTXBWPS3wgVZg1OiIJJigN6Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OYGtOh8EDATmyWbKJxJKnhA68cM9Q2CihbB8ClQtG7bqlEEZyqcgQ15l8EHJy1/12
	 9245xgtbF2ChwNc0hAeKPFZ6IEMnRSUcjVNL9y9BaV+uiS16Q17As6gTFRf6+f/7Im
	 2PMpp6uLiliNTNFmS7i5Gh0gn3M31pYejA/5iTxUymU31Sqml/87CN7f96mt1sZUxC
	 E75kSB5ksYcsUKpwmcKqLaU8k1cx3smw0oNUG652rVds2OY7vF+qAighlDWVgB0NcV
	 duZLo7drUl9Qhr2QNFoYWmZFbbp06kT1qveDPxQzGMs5NowgqNIp0A7RpghDUg6MhX
	 2M8fjj0R+a7/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 7/7] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs
 for Data Modul i.MX8M Mini and Plus eDM SBC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729214723.557461-7-marex@nabladev.com>
References: <20260729214723.557461-1-marex@nabladev.com>
 <20260729214723.557461-7-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 22:10:32 +0000
Message-Id: <20260729221033.3CDB41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Hardware Interrupt Routing Mismatch causes PCA9554 GPIO expander t=
o conflict with CAN1 on i.MX8MP.
- [High] The `fsl,sai-asynchronous` property breaks audio capture (and play=
back) on both i.MX8MM and i.MX8MP due to missing clock routing.
- [High] The i.MX8MP overlay fails to configure the clock parent and rate f=
or `sai5clk`, resulting in an invalid MCLK for the SGTL5000 codec.
- [High] Duplicate `unique_unit_address` causes devres memory region confli=
ct between `sai5clk` and `sai5` drivers.
- [High] The shared `.dtsi` unconditionally disables `uart4`, breaking onbo=
ard Bluetooth on the i.MX8MP SBC.
- [Low] Commit message inaccurately claims the overlay provides a "PWM Beep=
er" and "additional UARTs".
--

--- Patch [7]: [PATCH v7 7/7] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DT=
Os for Data Modul i.MX8M Mini and Plus eDM SBC ---
commit 43246870359af0cd7d3d40f8db5eaaff8fad43a1
Author: Marek Vasut <marex@nabladev.com>

arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs for Data Modul i.MX8M Mini =
and Plus eDM SBC

Add DT overlay for feature connector expansion module eDM-MOD-iMX8Mm-FIO1-A=
udio
providing additional UARTs, CAN, PWM Beeper, I2C, SPI, GPIO breakout and
SGTL5000 codec. This adapter can be optionally populated onto the eDM SBC.

> Add DT overlay for feature connector expansion module eDM-MOD-iMX8Mm-FIO1=
-Audio
> providing additional UARTs, CAN, PWM Beeper, I2C, SPI, GPIO breakout and
> SGTL5000 codec.

[Severity: Low]
Is this description accurate? The commit message mentions a PWM Beeper and
additional UARTs, but the code below disables uart4 and repurposes the
SPDIF_TX pin used for the beeper as a GPIO instead.

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-edm-mod-imx8mm-fio1-audio.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-d=
ata-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi
> new file mode 100644
> index 0000000000000..01cf5c89dbff4
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

[Severity: High]
Does this interrupt routing conflict on the i.MX8MP baseboard?

The shared overlay hardcodes the PCA9554 interrupt to GPIO5_IO04, which is
correct for i.MX8MM. However, on i.MX8MP, this pad (SPDIF_RX) is physically
routed and configured for CAN1_RX.

Could this cause the GPIO expander interrupts to fail and CAN traffic to
trigger spurious GPIO interrupts when loaded on the i.MX8MP? Would it be
better to override this interrupt in the i.MX8MP overlay?

[ ... ]
> +&sai2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_sai2>;
> +	assigned-clock-rates =3D <24576000>;
> +	fsl,sai-asynchronous;

[Severity: High]
Could this fsl,sai-asynchronous property break audio capture?

It forces the SAI block to use independent clocks for TX and RX. However, t=
he
pinmux routing on i.MX8MM only provides RX_BCLK and TX_SYNC, meaning RX
lacks a SYNC clock. On i.MX8MP, only TX clocks are routed, leaving RX witho=
ut
both BCLK and SYNC clocks.

[ ... ]
> +/* UART4 is blocked by RDC and used as CM4 console UART */
> +&uart4 {	/* UART to 1-Wire J5 */
> +	status =3D "disabled";
> +};

[Severity: High]
Will disabling uart4 here break the onboard Bluetooth on the i.MX8MP SBC?

This file is shared between the i.MX8MM and i.MX8MP overlays, but on the
i.MX8MP SBC, uart4 is actively used for the infineon,cyw55572-bt module.

[ ... ]
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-edm-mod-imx8mm-fio1-audio.dtso b/arch/arm64/boot/dts/freescale/imx8mm-d=
ata-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
> new file mode 100644
> index 0000000000000..4a02bd026ac16
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm=
-mod-imx8mm-fio1-audio.dtso
[ ... ]
> +	sai5clk: clock-controller@30050000 {	/* SAI5 */
> +		compatible =3D "fsl,imx8mm-sai-clock", "fsl,imx8mq-sai-clock";
> +		reg =3D <0x30050000 0x10000>;

[Severity: High]
Can this cause a devres memory region conflict during driver probe?

This overlay adds a new clock-controller node with the exact same unit addr=
ess
and register range as the existing sai@30050000 audio node.

Since both drivers will use devm_platform_ioremap_resource() to request the
region exclusively, whichever probes second might receive -EBUSY and fail.

[ ... ]
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-over=
lay-edm-mod-imx8mm-fio1-audio.dtso b/arch/arm64/boot/dts/freescale/imx8mp-d=
ata-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
> new file mode 100644
> index 0000000000000..90c2dd1e67248
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm=
-mod-imx8mm-fio1-audio.dtso
[ ... ]
> +	sai5clk: clock-controller@30c50000 {
> +		compatible =3D "fsl,imx8mp-sai-clock", "fsl,imx8mq-sai-clock";
> +		reg =3D <0x30c50000 0x10000>;

[Severity: High]
Similar to the i.MX8MM overlay, can this cause a memory region conflict with
the existing sai@30c50000 audio node?

[ ... ]
> +		#clock-cells =3D <1>;
> +		clocks =3D <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_IPG>,
> +			 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_MCLK1>;
> +		clock-names =3D "bus", "mclk1";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_codec_mclk>;
> +		status =3D "okay";
> +	};
> +};

[Severity: High]
Does this node also need assigned-clocks and assigned-clock-rates configure=
d?

Unlike the i.MX8MM variant, this node leaves the MCLK unconfigured. The
SGTL5000 driver and simple-audio-card do not dynamically set this clock rate
via clk_set_rate() unless mclk-fs is defined.

Could this leave the clock at 0 Hz and prevent the codec from functioning on
the i.MX8MP?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729214723.5574=
61-1-marex@nabladev.com?part=3D7
