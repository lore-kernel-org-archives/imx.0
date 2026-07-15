Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E8A189F43;
	Wed, 15 Jul 2026 17:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134809; cv=none; b=TfT6IjbYz3qnWVxof2R3ysRT6S5fYgzFd+Ol2nEuHYSdoEmv7cAVrIN5jBbNX0lleXXFfjD3RLn88MG+AmV0lWDasDuWVQfn79EqhCoAXcY9rSevksfOlfkDnPzA1IjkjlGZ7h5nlNc5H4Tw0CK9IJ7qZor6kjs9c7b/gTXf2Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134809; c=relaxed/simple;
	bh=jlEmx1cUqAQJMcLDf0Ij7+0iFRi0f4OpMc2+e/n55ro=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TY3t4shWv5cumGOEBX/csLnwL3G/aBfKhDocVcU4KYyi9oQkba7kQmMNcZc0F4C5q40kHUsOc1u3d6IaBAG9dSMEGY1oHrCLCmKIzisqHHHqIzi9qUtmHhA2yUbOdm2XESsdEZBvBGOxo4nZYgG4lk/EYUZvxWt/QNjE274JkaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kFxNMRpm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kFxNMRpm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B8D1F00A3A;
	Wed, 15 Jul 2026 17:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784134807;
	bh=7UqIQL4muGvHCksA8ErHFmJKp05TCdFLaTRJ1TsOnp4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kFxNMRpmqcLSf6rzvECbJVv+GEHdzxlMwMpGdd8QOx9S7ZibfByR3+sF/zez4yQrd
	 y5Gk1eZbP4jAh002BHdYM7YuItf+ujYjmQ35FRm6TWCfRO4+drh13RMNF22F6FhaqD
	 HJxhqCwmjdSiPkrdZfV33o1VYt5ysOURLF8oSc79TgvJrzvl9pK8JMhVJIpxEeTpBS
	 OcoIns3jqFpD2xaz4/+8QUK1e1SIfwbndi30rl/0OlC44gXX+qBJwhsgtrvlTJRu1x
	 O6AWiecURnjRBCej2kNIlbODq1iG3kyY11z2emvkVBuE+/QpjSiS1V6TWbqrO9siKr
	 E3yR/ojtlJKUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] arm64: dts: freescale: Add support for Variscite
 VAR-SOM-MX8 QuadMax
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <41ef8c2a7c390ae5703c212e8b51fdd20ba9237c.1784133402.git.stefano.r@variscite.com>
References: <cover.1784133402.git.stefano.r@variscite.com>
 <41ef8c2a7c390ae5703c212e8b51fdd20ba9237c.1784133402.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 17:00:06 +0000
Message-Id: <20260715170007.63B8D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The CMA allocation range starting at 0xC0000000 falls entirely out=
side the statically defined 1GB memory node bounds.
- [High] Assigning a 3.3V regulator to the 1.8V WM8904 codec supply pins vi=
olates absolute maximum hardware ratings.
- [Medium] Delegating WiFi/Bluetooth hardware initialization to user space =
scripts bypasses kernel power management and is a known DT anti-pattern.
- [Medium] sai7 targets the wrong LPCG clock index (IPG clock instead of MC=
LK) for its assigned clocks, leading to incorrect audio clock configuration.
--

--- Patch [2]: [PATCH v4 2/3] arm64: dts: freescale: Add support for Varisc=
ite VAR-SOM-MX8 QuadMax ---
commit 62ffa3edc88c7bf11df029d0ed1df55635d9355b
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax

This adds device tree support for the Variscite VAR-SOM-MX8 QuadMax system
on module. It enables module-specific peripherals like the i.MX8 QuadMax MP=
U,
LPDDR4 memory, eMMC, Ethernet, WM8904 codec audio, and WIFI6/Bluetooth.
Carrier board interfaces are left disabled by default.

Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8-quadmax-quad=
plus/var-som-mx8/

> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi b/arch/arm=
64/boot/dts/freescale/imx8qm-var-som.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
> @@ -0,0 +1,531 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
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
> +			/* VAR-SOM-MX8QM doesn't have 1GB variant */
> +			alloc-ranges =3D <0 0xc0000000 0 0x3c000000>;

[Severity: High]
Does this CMA allocation range fall entirely outside the statically defined
system RAM?

The memory@80000000 node defined earlier establishes 1GB of memory starting
at 0x80000000 and ending at 0xC0000000. However, this alloc-ranges property
starts exactly at 0xC0000000. If the bootloader does not dynamically patch
the memory node, could this cause CMA initialization to fail or trigger
panics?

> +			size =3D <0 0x3c000000>;
> +			linux,cma-default;
> +			reusable;
> +		};
> +	};
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
[ ... ]
> +		AVDD-supply =3D <&reg_audio_supply>;
> +		CPVDD-supply =3D <&reg_audio_supply>;
> +		DBVDD-supply =3D <&reg_audio_supply>;
> +		DCVDD-supply =3D <&reg_audio_supply>;

[Severity: High]
Does assigning the 3.3V reg_audio_supply to these 1.8V WM8904 domains viola=
te
the absolute maximum hardware ratings?

The reg_audio_supply is defined as a fixed 3.3V regulator, but the maximum
voltage for WM8904 AVDD/CPVDD is 2.0V and DCVDD is 1.98V. Does this hardware
description misrepresent the physical setup, or is the hardware actually
supplied with 3.3V on these pins?

> +		MICVDD-supply =3D <&reg_audio_supply>;
[ ... ]
> +&sai7 {
> +	assigned-clocks =3D <&acm IMX_ADMA_ACM_SAI7_MCLK_SEL>,
> +			<&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>,
> +			<&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_BUS>,
> +			<&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_BUS>,
> +			<&sai7_lpcg 0>;

[Severity: Medium]
Is sai7 targeting the wrong LPCG clock index here?

This assigns a parent to <&sai7_lpcg 0> (the IPG clock, IMX_LPCG_CLK_0)
instead of the MCLK (IMX_LPCG_CLK_4). The sai6 node correctly uses
IMX_LPCG_CLK_4 for reparenting. Does this break the MCLK configuration
for sai7?

> +	assigned-clock-parents =3D <&aud_pll_div1_lpcg 0>;
> +	assigned-clock-rates =3D <0>, <786432000>, <98304000>, <24576000>, <983=
04000>;
> +	fsl,sai-asynchronous;
> +	status =3D "okay";
> +};
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

[Severity: Medium]
Does delegating the WiFi and Bluetooth hardware initialization to user space
scripts bypass kernel power management?

This pinctrl group explicitly reserves pins to be toggled from user space.
Should the power sequence be modeled in the device tree via mmc-pwrseq-simp=
le
or fixed regulators so the kernel can manage power sequencing autonomously
instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784133402.gi=
t.stefano.r@variscite.com?part=3D2
