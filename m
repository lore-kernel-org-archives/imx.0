Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B227C44682F;
	Wed, 15 Jul 2026 11:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784114477; cv=none; b=FwfnDSWwKT/JMU3HjPZYevgAC9eDji/kriM6zyfp7ORV+wwy+uHXc4vCdGalxkwVQnccvTrDGdhVKz0O9zfsFIVIDjIMOTIuphBA729Bt6lrto4NVQwG00Hd8xMvDd9DLSMmLazjjFgUwQ9L0iEei36VPrwp+tZY99YDCA7Olww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784114477; c=relaxed/simple;
	bh=egs9qInQPNcOXLyt5bwd4naPKMJoAQcmYZBNIp1FnRY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UBJCoeQokrDBTJkNpB/sjvuSj7oNYGkjLNooC6MmHcETC7nFH0V/IFOZiGrWj6fDUw63klosU0F1XcjdpFLag08C5GRochRJ7TU4tb/FA7NPvKVnpADNBSqHLtMBBFLDSYjMNIwUIJstLJVIgiTq15y6gusygc66hUrfDhyJyW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MROGCOx1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MROGCOx1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC7F1F000E9;
	Wed, 15 Jul 2026 11:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784114471;
	bh=OrCE9Vlt7LXKR0Z9W5Jn0xJx22isPu4uOAiXYuvpcR4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MROGCOx1OB7XHpUUmzanAW3n7hS0U609NzNf5dQNNPoKvTulJh8QsAoS1+LqM8d5j
	 C1AbSCO3tXufiya2tK4qJHv2oW4rRrKn2HXEITqWLzyuwTbJI7etBew+TJJRDUVyGy
	 KYdLkRqUl3W9Js4CsiG41NRUa9e1QHzVlO5+cnYew35g9nNnFHWvR0Q9QiZ9aHCXrM
	 DGtGyTJlhhtpPMzs9GdZ78zD3zsV+936pex7SD2ZN3Dpx2gOSI+Q0vwe/paiUydncC
	 8UhsmnOytq4z1FS2TooWEgHtSZmjsr5n/ExWnSO5dk6QxaGPVOyHYxlzN51nrAI0OY
	 2MQlwsP8PqYtw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: freescale: Add support for Variscite
 VAR-SOM-MX8 QuadMax
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <6d163bb501669d004431acda73e2dab07c0ff8f8.1784113547.git.stefano.r@variscite.com>
References: <cover.1784113547.git.stefano.r@variscite.com>
 <6d163bb501669d004431acda73e2dab07c0ff8f8.1784113547.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 11:21:10 +0000
Message-Id: <20260715112110.EFC7F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Audio master clocks (MCLK) are left unconfigured, and audio baud r=
ates are erroneously applied to peripheral bus clocks (IPG) due to incorrec=
t LPCG clock indices.
- [High] Conflicting assigned clock rates for shared audio PLL MST_BUS.
- [High] Codec MCLK pinmux connects to ESAI0 high-frequency clock instead o=
f the configured LPCG clock.
- [High] The Continuous Memory Allocator (CMA) pool allocation range is str=
ictly out-of-bounds relative to the default declared system memory, breakin=
g CMA initialization on 1GB SOM variants.
- [High] The PMIC thermal mitigation map ignores the high-power Cortex-A72 =
cores, defeating effective thermal throttling.
- [Medium] WiFi and Bluetooth enable/power sequencing is explicitly deferre=
d to user space instead of being structurally modeled in the device tree.
--

--- Patch [2]: [PATCH v3 2/3] arm64: dts: freescale: Add support for Varisc=
ite VAR-SOM-MX8 QuadMax ---
commit e14b5ef256af728dc56444b803ea5575d3814182
Author: Stefano Radaelli <stefano.r@variscite.com>
Date:   Wed Jul 15 11:08:11 2026 +0000

    arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax
   =20
    Add device tree support for the Variscite VAR-SOM-MX8 QuadMax
    system on module. This SOM is designed to be used with various carrier
    boards.
   =20
    Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8-quadmax-=
quadplus/var-som-mx8/

> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi b/arch/arm=
64/boot/dts/freescale/imx8qm-var-som.dtsi
> new file mode 100644
> index 0000000000000..08b02173b780c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
> @@ -0,0 +1,530 @@
[ ... ]
> +	memory@80000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x00000000 0x80000000 0 0x40000000>;
> +	};
[ ... ]
> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
[ ... ]
> +		/* global autoconfigured region for contiguous allocations */
> +		linux,cma {
> +			compatible =3D "shared-dma-pool";
> +			alloc-ranges =3D <0 0xc0000000 0 0x3c000000>;

[Severity: High]
Does this alloc-ranges declaration break the Continuous Memory Allocator (C=
MA)
initialization on 1GB SOM variants?=20

The declared 1GB system memory ends at 0xc0000000, while this alloc-ranges
property forces CMA to find memory strictly starting at 0xc0000000, which=20
would sit completely outside physical RAM on a 1GB board.

> +			size =3D <0 0x3c000000>;
> +			linux,cma-default;
> +			reusable;
> +		};
> +	};
[ ... ]
> +&esai0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_esai0>;
> +	#sound-dai-cells =3D <0>;
> +	assigned-clocks =3D <&acm IMX_ADMA_ACM_ESAI0_MCLK_SEL>,
> +			<&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
> +			<&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
> +			<&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> +			<&esai0_lpcg 0>;
> +	assigned-clock-parents =3D <&aud_pll_div0_lpcg 0>;
> +	assigned-clock-rates =3D <0>, <786432000>, <49152000>, <24576000>, <491=
52000>;

[Severity: High]
Does this configuration incorrectly alter the IPG clock instead of the MCLK?

The assigned-clocks list uses <&esai0_lpcg 0>, which is IMX_LPCG_CLK_0=20
(the peripheral bus IPG clock). The master clock (MCLK) would normally be
at index 16 (IMX_LPCG_CLK_4).=20

Additionally, is it safe to assign 24.576 MHz to IMX_SC_PM_CLK_MST_BUS here?
Later in the file, the wm8904 codec driver assigns 12.288 MHz to this exact
same shared audio PLL MST_BUS clock. Whichever device probes last will=20
overwrite the other's frequency, likely causing audio distortion or failure.

> +	status =3D "okay";
> +};
[ ... ]
> +&i2c0 {
> +	clock-frequency =3D <100000>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_i2c0>;
> +	status =3D "okay";
> +
> +	wm8904: codec@1a {
> +		compatible =3D "wlf,wm8904";
> +		reg =3D <0x1a>;
> +		#sound-dai-cells =3D <0>;
> +		clocks =3D <&mclkout0_lpcg 0>;
> +		clock-names =3D "mclk";
> +		assigned-clocks =3D <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
> +				<&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
> +				<&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> +				<&mclkout0_lpcg 0>;
> +		assigned-clock-rates =3D <786432000>, <49152000>, <12288000>, <1228800=
0>;

[Severity: High]
This assigns 12.288 MHz to IMX_SC_PM_CLK_MST_BUS, which conflicts with the
24.576 MHz assigned in &esai0.

Also, the codec driver expects to control its clock via <&mclkout0_lpcg 0>.
However, looking down at pinctrl_esai0, the physical pin is muxed to=20
AUD_ESAI0_TX_HF_CLK (ESAI0's internal clock) instead of AUD_ACM_MCLK_OUT0.
Will this leave the codec without the expected master clock source?

> +		AVDD-supply =3D <&reg_audio_supply>;
[ ... ]
> +/* Bluetooth */
> +&lpuart1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_lpuart1>;
> +	uart-has-rtscts;
> +	status =3D "okay";
> +};

[Severity: Medium]
Since this UART is used for Bluetooth, does it need a 'bluetooth' child node
to properly describe power and enable dependencies?=20

Without it, kernel-level power management (like suspend/resume and rfkill)
will not be able to power down the module.

[ ... ]
> +&sai6 {
> +	assigned-clocks =3D <&acm IMX_ADMA_ACM_SAI6_MCLK_SEL>,
> +			<&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>,
> +			<&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_BUS>,
> +			<&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_BUS>,
> +			<&sai6_lpcg 0>;
> +	assigned-clock-parents =3D <&aud_pll_div1_lpcg 0>;
> +	assigned-clock-rates =3D <0>, <786432000>, <98304000>, <24576000>, <983=
04000>;

[Severity: High]
Similar to the esai0 node, this assigns the audio baud rate to clock index =
0=20
(IPG clock) instead of index 16 (MCLK). Could this cause bus instability?

> +	fsl,sai-asynchronous;
> +	status =3D "okay";
> +};
> +
> +&sai7 {
> +	assigned-clocks =3D <&acm IMX_ADMA_ACM_SAI7_MCLK_SEL>,
> +			<&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>,
> +			<&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_BUS>,
> +			<&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_BUS>,
> +			<&sai7_lpcg 0>;
> +	assigned-clock-parents =3D <&aud_pll_div1_lpcg 0>;
> +	assigned-clock-rates =3D <0>, <786432000>, <98304000>, <24576000>, <983=
04000>;

[Severity: High]
As with esai0 and sai6, this applies the 98.304 MHz rate to <&sai7_lpcg 0>=
=20
(IPG clock) instead of index 16.=20

> +	fsl,sai-asynchronous;
> +	status =3D "okay";
> +};
> +
> +&thermal_zones {
> +	pmic-thermal {
> +		polling-delay-passive =3D <250>;
> +		polling-delay =3D <2000>;
> +		thermal-sensors =3D <&tsens IMX_SC_R_PMIC_0>;
> +		trips {
> +			pmic_alert0: trip0 {
> +				temperature =3D <110000>;
> +				hysteresis =3D <2000>;
> +				type =3D "passive";
> +			};
> +			pmic_crit0: trip1 {
> +				temperature =3D <125000>;
> +				hysteresis =3D <2000>;
> +				type =3D "critical";
> +			};
> +		};
> +		cooling-maps {
> +			map0 {
> +				trip =3D <&pmic_alert0>;
> +				cooling-device =3D <&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;

[Severity: High]
Should the high-power Cortex-A72 cores (A72_0 and A72_1) be included in this
cooling map?=20

If the A72 cores are omitted, they will remain unthrottled during a PMIC
thermal event. Throttling only the low-power A53 cores might fail to reduce=
=20
current draw sufficiently to prevent a hardware thermal shutdown.

> +			};
> +		};
> +	};
> +};
[ ... ]
> +/* WIFI */
> +&usdhc3 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 =3D <&pinctrl_usdhc3>, <&pinctrl_wifi>;
> +	pinctrl-1 =3D <&pinctrl_usdhc3_100mhz>, <&pinctrl_wifi>;
> +	pinctrl-2 =3D <&pinctrl_usdhc3_200mhz>, <&pinctrl_wifi>;
> +	bus-width =3D <4>;
> +	non-removable;
> +	status =3D "okay";
> +
> +	brcmf: wifi@1 {
> +		compatible =3D "brcm,bcm4329-fmac";
> +		reg =3D <1>;
> +	};
> +};

[Severity: Medium]
Is it intended to leave this Wi-Fi SDIO bus without a vmmc-supply or=20
mmc-pwrseq regulator?

By leaving this out and explicitly reserving the enable GPIOs for user-spac=
e=20
control (as seen below in pinctrl_wifi), kernel-level power management is=20
bypassed. This will break suspend/resume and rfkill functionality because t=
he
MMC/SDIO core cannot power down or up the module itself.

[ ... ]
> +	pinctrl_esai0: esai0grp {
> +		fsl,pins =3D <
> +			IMX8QM_ESAI0_FSR_AUD_ESAI0_FSR				0xc6000040
> +			IMX8QM_ESAI0_FST_AUD_ESAI0_FST				0xc6000040
> +			IMX8QM_ESAI0_SCKR_AUD_ESAI0_SCKR			0xc6000040
> +			IMX8QM_ESAI0_SCKT_AUD_ESAI0_SCKT			0xc6000040
> +			IMX8QM_ESAI0_TX0_AUD_ESAI0_TX0				0xc6000040
> +			IMX8QM_ESAI0_TX5_RX0_AUD_ESAI0_TX5_RX0			0xc6000040
> +			IMX8QM_MCLK_OUT0_AUD_ESAI0_TX_HF_CLK			0xc600004c

[Severity: High]
As mentioned earlier, the wm8904 codec driver configures <&mclkout0_lpcg 0>
for its clock. However, this pinmux connects the pin to AUD_ESAI0_TX_HF_CLK=
=20
rather than AUD_ACM_MCLK_OUT0, meaning the codec will likely receive the
wrong clock source.

> +		>;
> +	};
[ ... ]
> +	pinctrl_wifi: wifigrp {
> +		fsl,pins =3D <
> +			/* GPIOs used by user space WiFi init */
> +			IMX8QM_SCU_GPIO0_07_SCU_DSC_RTC_CLOCK_OUTPUT_32K	0xc600004c
> +			IMX8QM_SCU_GPIO0_03_LSIO_GPIO0_IO31			0x06000021
> +			IMX8QM_SCU_GPIO0_02_LSIO_GPIO0_IO30			0x00000021
> +			IMX8QM_QSPI1A_DATA0_LSIO_GPIO4_IO26			0x00000021
> +		>;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784113547.gi=
t.stefano.r@variscite.com?part=3D2
