Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DC53BED11;
	Mon, 27 Jul 2026 20:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785182931; cv=none; b=uHGCfWXVvMq+2ddkQ3oeKJti4bjCpcYx8nM0d7T9jIbzC3xeA88qlmjFD06YtZxK2CHTVZPt6y0LSW/FVPJOqeOJJC/9F1cuwephDTmdLz//j586pzNfwgGJ0QhksJwMjGBaxaeTUjA75klXqY0tfNQ+TbY7G/PX0wZ9wiT1+pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785182931; c=relaxed/simple;
	bh=khJ+CAFv/+kkyzV/LIVxZLeLt13ZLe7pb6BsNpw4PJ8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s2/wUIfqv0useXaQ8VGpxuu4Qa7G7S3FRRs2TL+FDra3ckp4fSuNkSKcwz/x36OrVMRmGAayHZYp12NjkGRZdKSdEkz36JAEwcjoTijGPVMKM4fRLJz2bZ2CouauN0wn+YPRIPxntSVXnreiBa8CwOC85itF/FU6f2Gq+5FUR34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELwVz7Op; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELwVz7Op"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F151F000E9;
	Mon, 27 Jul 2026 20:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785182930;
	bh=n8qY5T0+A1KDf9hHWUtlLzoY1UhBkVsfKMTO2rpPCs4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ELwVz7Op4aP9l7kzGI0YavkX+LGCYina+0QZCepoOW4k7O5gUKYuL1KtNjE/1lBJ4
	 QpfDVXqcjUf2S2miCNPz0fQj1lYXjVILqR84jR5nv+ZY0/zMXzmKbU+4yseVptHtZz
	 mdPDaFc69E3dXtnyCAsD+NV6Dbdhrq8QS6LrELO3FjCX/IdeHJGL1zCxB9aFOEs/iz
	 kvWyH9e3woupb/ipZxksG7OmRlEyW/ZLFCABixFek6zlrHHWD/XlwGFzFTEOViZtjU
	 sCmKPgTUaB10qi6qzNHB4wgsqCsp8Y9Y1AaV6OxSOpy8UNf2jYSNkjPrXPTRbT3aMh
	 m3Olm4kcovQhw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/7] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs
 for Data Modul i.MX8M Mini and Plus eDM SBC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260727195244.78199-7-marex@nabladev.com>
References: <20260727195244.78199-1-marex@nabladev.com>
 <20260727195244.78199-7-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 20:08:49 +0000
Message-Id: <20260727200849.96F151F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] The i.MX8MP overlay fails to override the interrupt for the PCA9=
554 IO expander (`gpio_feature`), causing the driver to listen on an incorr=
ect SoC pin and silently drop interrupts.
- [Medium] The commit message claims the overlay provides 'additional UARTs=
' and a 'PWM Beeper', but these features are missing from the overlay imple=
mentation.
- [Medium] The `imx8mp` overlay fails to configure the parent clock and rat=
e for the SAI5 clock, potentially leaving the SGTL5000 codec's master clock=
 in an undefined state.
- [Low] The overlays introduce a new `clock-controller` node with the same =
unit address as the existing `sai` audio interface node, causing a duplicat=
e unit-address DTC warning.
--

--- Patch [7]: [PATCH v6 7/7] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DT=
Os for Data Modul i.MX8M Mini and Plus eDM SBC ---
commit cabe51dd814613d42f8b138a12dbbf1692edd096
Author: Marek Vasut <marex@nabladev.com>
Date:   Mon Jul 27 19:52:22 2026 +0000

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

[Severity: Medium]
Is the commit message accurate about providing "additional UARTs" and a "PWM
Beeper"? The included overlay explicitly disables uart4 and lacks any PWM
beeper configuration.

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

[Severity: Medium]
Since this .dtsi file is shared, will this hardcoded interrupt mapping to
gpio5 work for i.MX8MP? The i.MX8MP overlay does not override these
properties, which could cause the io-expander driver to listen on the wrong
SoC pin and drop interrupts.

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

> +&spba2 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	sai5clk: clock-controller@30050000 {	/* SAI5 */
> +		compatible =3D "fsl,imx8mm-sai-clock", "fsl,imx8mq-sai-clock";

[Severity: Low]
Does this create a duplicate node overlapping with the existing sai@30050000
node on i.MX8MM? Should this override the &sai5 label instead to avoid a DTC
unit-address warning?

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

> +&spba5 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	sai5clk: clock-controller@30c50000 {
> +		compatible =3D "fsl,imx8mp-sai-clock", "fsl,imx8mq-sai-clock";
> +		reg =3D <0x30c50000 0x10000>;
> +		#clock-cells =3D <1>;
> +		clocks =3D <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_IPG>,
> +			 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_MCLK1>;
> +		clock-names =3D "bus", "mclk1";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_codec_mclk>;
> +		status =3D "okay";
> +	};
> +};

[Severity: Low]
Does this create a duplicate node overlapping with the existing sai@30c50000
node on i.MX8MP? Should this override the &sai5 label instead to avoid a DTC
unit-address warning?

[Severity: Medium]
Will the SGTL5000 codec get a reliable master clock on i.MX8MP? The i.MX8MM
overlay sets assigned-clocks and assigned-clock-rates for sai5clk, but they
are missing here.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727195244.7819=
9-1-marex@nabladev.com?part=3D7
