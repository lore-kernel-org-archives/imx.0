Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A1641D20E;
	Mon, 24 Aug 2026 15:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787585642; cv=none; b=TfOp161DFg9DTBatPCDvRnhI9tvz7QUiOfftoj1QL83h0Pue2dwQP7DO/YihHOLoUSpHHAe9i1FEXIgLUtNpLjexWDfyLv+tUBDz6Bu10ed375IPijg3qEZRAkdsbfK5K0n93XNyNSMG8pPOGzie3eqlnPLkrJmqy7mAK1e+xVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787585642; c=relaxed/simple;
	bh=Gslo8VlsRYGDdWtZBDxxR27dbA/71ErGRoFeewZ9nAA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e82B2SZIhd46t54vL1evzdkhHChxEPUdzhjm5rSFUJWk5MY/XejziBvoTZ7qdQglrjMThchC2iktWSkWjTwy27pSZJFV/lFt8W4bw6dFw+HXTSit/LVjkJdxUNcpAlP5+bSkvFoKczIJ4nbJ10TGL1t0ErT8pdzmiS+pGH2lMkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UMbq9C87; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UMbq9C87"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 119F61F000E9;
	Mon, 24 Aug 2026 15:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787585640;
	bh=OVr2jXr19TZYdfl67NKHEMq1SnD4DVj9k7QT1HR4rpM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UMbq9C87EjXHRFxFhyl8PMwNKob/NIToZDABilXEE2VicAjq41UtAazAV2FR4ksve
	 tJi+fzDZW1k3GKjp95/2dLeWbbtPgBLixYUjuKXttOJfTy20ZoqhCM3k4Atm3CRvnb
	 rhv90SK3YVT225vprK74aL86beG/T5QjPMHNZgn7y40xOEtdqHrtbB8JkKjprr94/o
	 MQB6tfOo5ac2nuZidFK7hah0YQ0F8AybsK78dRl5CEgYPdv9r+WRrymQnzlS/eK0cT
	 +ZBqLS6r0EtmGpkyriB+vphN3/UBDjnhRJQXy1xwvUT8wqD/D8zclyfvnyW2mIVZZO
	 z4APPuIJij8rw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <aa8af884a709961f155f855b8a480488ef4c47d1.1787583584.git.stefano.r@variscite.com>
References: <cover.1787583584.git.stefano.r@variscite.com>
 <aa8af884a709961f155f855b8a480488ef4c47d1.1787583584.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 15:33:59 +0000
Message-Id: <20260824153400.119F61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The ads7846 touchscreen specifies an active-high GPIO for pendown,=
 which conflicts with its active-low interrupt and breaks touch detection.
- [High] The V1 hardware WiFi regulator (`reg_vmmc_wl`) lacks a `gpio` prop=
erty and relies on a userspace script to enable WiFi power, breaking automa=
tic device probing.
- [Medium] The `wm8904` codec's `IN1L` pin is configured as a digital micro=
phone input but is simultaneously routed to an analog 'Microphone Jack' in =
the DAPM topology.
- [Low] Non-generic node names and invalid characters are used for the touc=
hscreen, audio codec devices, and regulators.
--

--- Patch [2]: [PATCH v3 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 su=
pport ---
commit b9c1c689cb3179b0139172b9a6b0fd1126434165
Author: Stefano Radaelli <stefano.r@variscite.com>
Subject: ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support

This commit adds device tree support for the Variscite VAR-SOM-MX7 system
on module based on the NXP i.MX7Dual SoC. It includes the common SoM
description along with support for eMMC, NAND, WM8731 audio codec, and the
V2 hardware revision.

Link: https://variscite.com/system-on-module-som/i-mx-7/var-som-mx7/

> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi =
b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
> @@ -0,0 +1,382 @@
[ ... ]
> +	reg_hsic_hub_connect: regulator_hsic_hub_connect {

[Severity: Low]
Are there invalid characters in this node name? The Devicetree Specification
prohibits the use of underscores in node names, which should use hyphens
instead.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi b/arch/a=
rm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
> @@ -0,0 +1,65 @@
[ ... ]
> +&i2c2 {
> +	wm8731: wm8731@1a {

[Severity: Low]
Does this node name follow the Devicetree Specification? Node names should =
be
generic and reflect the function of the device rather than its precise part
number. Should this be named audio-codec@1a instead?

> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi b/arch/arm/boot=
/dts/nxp/imx/imx7d-var-som.dtsi
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi
> @@ -0,0 +1,635 @@
[ ... ]
> +	codec_wm8904: sound {
> +		compatible =3D "simple-audio-card";
> +		simple-audio-card,bitclock-master =3D <&dailink_master>;
> +		simple-audio-card,format =3D "i2s";
> +		simple-audio-card,frame-master =3D <&dailink_master>;
> +		simple-audio-card,name =3D "wm8904-audio";
> +		simple-audio-card,routing =3D
> +			"Headphone Jack", "HPOUTL",
> +			"Headphone Jack", "HPOUTR",
> +			"IN2L", "Line In Jack",
> +			"IN2R", "Line In Jack",
> +			"IN1L", "Microphone Jack",
> +			"IN1R", "Microphone Jack",
[ ... ]
> +	wm8904: audio-codec@1a {
> +		compatible =3D "wlf,wm8904";
> +		reg =3D <0x1a>;
[ ... ]
> +		/* DMIC is connected to IN1L */
> +		wlf,in1l-as-dmicdat1;
> +	};

[Severity: Medium]
Is this DAPM routing correct? This maps IN1L to an analog "Microphone Jack",
but later in the wm8904 node, wlf,in1l-as-dmicdat1 explicitly configures it
as a digital microphone input.

Can this topological contradiction cause the DAPM subsystem to incorrectly
power up analog components for a digital microphone, or present invalid ana=
log
paths to userspace?

[ ... ]
> +	/* Resistive touch controller */
> +	ads7846_ts: ads7846@0 {

[Severity: Low]
Should this node use a generic name like touchscreen@0 instead of the
specific part number to align with Devicetree Specification requirements?

> +		reg =3D <0>;
> +		compatible =3D "ti,ads7846";
> +		pinctrl-names =3D"default";
> +		pinctrl-0 =3D <&pinctrl_restouch>;
> +		interrupt-parent =3D <&gpio1>;
> +		interrupts =3D <9 IRQ_TYPE_EDGE_FALLING>;
> +		spi-max-frequency =3D <1500000>;
> +		pendown-gpio =3D <&gpio1 9 0>;

[Severity: High]
Does this configuration break touch detection? The interrupt is defined as
active-low (IRQ_TYPE_EDGE_FALLING), but the GPIO flag here is 0 (active-hig=
h).

When the interrupt handler fires, it will read the physical low signal as
a logical false, causing it to immediately abort without processing the eve=
nt.
Should this use GPIO_ACTIVE_LOW instead?

[ ... ]
> +	reg_vmmc_wl: regulator-vmmc-wl {
> +		compatible =3D "regulator-fixed";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-name =3D "wlreg_on";
> +	};
[ ... ]
> +&usdhc2 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz","sleep";
> +	pinctrl-0 =3D <&pinctrl_usdhc2>, <&pinctrl_wlan>;
> +	pinctrl-1 =3D <&pinctrl_usdhc2_100mhz>, <&pinctrl_wlan>;
> +	pinctrl-2 =3D <&pinctrl_usdhc2_200mhz>, <&pinctrl_wlan>;
> +	pinctrl-3 =3D <&pinctrl_usdhc2_sleep>, <&pinctrl_wlan_sleep>;
> +	keep-power-in-suspend;
> +	non-removable;
> +	vmmc-supply =3D <&reg_vmmc_wl>;
> +	status =3D "okay";
[ ... ]
> +	/* GPIO Used in User Space init script */
> +	pinctrl_wlan: wlangrp {
> +		fsl,pins =3D <
> +			MX7D_PAD_LPSR_GPIO1_IO04__GPIO1_IO4		0x09
> +		>;
> +	};

[Severity: High]
Will this cause the SDIO bus probe to fail permanently during boot?

The usdhc2 node is marked non-removable and bound to reg_vmmc_wl. Because
this regulator lacks a gpio property to physically power the chip, the MMC
core will attempt to enumerate the bus while the WiFi chip is unpowered.

Since the bus is non-removable, it will not retry when the userspace
script later toggles the GPIO via pinctrl_wlan. Should the gpio property
be moved to the regulator-fixed node so the kernel can properly probe it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787583584.gi=
t.stefano.r@variscite.com?part=3D2
