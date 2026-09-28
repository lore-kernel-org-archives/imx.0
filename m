Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB223D3CF2;
	Mon, 28 Sep 2026 12:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600261; cv=none; b=P895FrAwaLagNc0lu5Knw/IT5TRUKlDWaO6DV/JbIsSwH1E8R+u3Tk/WK8C7V7nvRQf+6C20ewWLzwjjO1GaBczRdx3lJGaaTrvGVcOIYY9xfw0RjXZZtcCXYZrmUt3PfGn2WxhZCEMw0goiWCx3mo3dgnBBACD0U1k5/eldR+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600261; c=relaxed/simple;
	bh=OF0MJGctt86QaPd90bGx/r8ro69aMqarXi1CSp8f+lI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ToWpf9XAUIv/iTNimnOK5Tcpi2P5mqfJ66Sio2yrKNIwjz8QiV+f/jwjaSRIkydQ9xDVF1gyBzrgv9e+CBVOwi+2g2uhUwOajF4/Q/MsaWO2LCnPIolYGkQjwlCXokXXfKpCx0HQVheN5G/e//1ByFQ9jyGU0vSSD1n259pw+Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cqNfOboT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cqNfOboT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2BAD1F000FF;
	Mon, 28 Sep 2026 12:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790600259;
	bh=kyz/LptDC/Oxey+tPdG5EwApY4LA2xEpjySSvEOhKSQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cqNfOboTszRYNsuzONIYu1/QcHPi0HZetyj9iAvOK2vv8eG8jmujhvGYx90bmcjFM
	 vngYSjUWbsUP0ReIZvENBUjqVOaFHt3pZL35v1yEvMzxza76an04hF3SwULp5td4Ze
	 Khipjn3hfZFNBQ6E9JC73wks1Pu1PWSq0EmGoRptW/TOLo3AGnUNwr1E58/Pa/3foe
	 13VDtdEu0CkjfzvwZsK/3nmLKPV1L9dgzDrNPQ9gNqnmXUkRIhJefVrmcPI7gS9s6B
	 w3Aav4DdnnrIhbzWGi8Zo3OPPQhtfU8aEq1F8MRdtd5Rr3YqOCz+eUGv88Ufp9HPIn
	 1AwFiAwStY0cw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/12] ARM: dts: imx6ul: Reuse Variscite DTSI files
 for Concerto
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <35b648b7e2b8440ddb9454bd33a441934a88e426.1790512621.git.stefano.r@variscite.com>
References: <cover.1790512621.git.stefano.r@variscite.com>
 <35b648b7e2b8440ddb9454bd33a441934a88e426.1790512621.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 12:57:38 +0000
Message-Id: <20260928125738.E2BAD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] mmc: missing non-removable and no-1-8-v in SDIO Wi-Fi node
- [Medium] dt-bindings: removing Wi-Fi/BT hardware description for user-spa=
ce management
- [Medium] mmc: missing high-speed pinctrl states for eMMC and SD card
- [Medium] ASoC: missing DAPM audio routing for the Microphone Jack
--

commit fe65cbeab7096b23be45d7585ae539a72bae3505
Author: Stefano Radaelli <stefano.r@variscite.com>

ARM: dts: imx6ul: Reuse Variscite DTSI files for Concerto

This commit converts the existing i.MX6UL and i.MX6ULL Concerto boards to
use shared module, option, and carrier DTSI files while maintaining the
existing DTB names and compatible strings. It replaces former components
with updated LCDIF display timings, userspace-managed Broadcom Wi-Fi
descriptions, and folds common resources into the shared configurations.

> The old Wi-Fi power sequence and Bluetooth nodes modeled enable and
> reset control in the kernel. On these SoMs those controls are handled
> in userspace, so use the shared Broadcom Wi-Fi description without the
> old kernel-managed nodes.

[Severity: Medium]
Device Tree is generally meant to describe the physical hardware topology
rather than software policy.

If these pins are physically wired to the enable lines, does removing the
physical Device Tree hardware description for the Wi-Fi reset
(usdhc1_pwrseq), power (reg_sd1_vmmc), and Bluetooth (shutdown-gpios)
break backward compatibility for older kernel versions expecting to
initialize the hardware?

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi b/arch/=
arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> deleted file mode 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> +++ /dev/null
[ ... ]
> -&usdhc2 {
> -	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> -	pinctrl-0 =3D <&pinctrl_usdhc2>;
> -	pinctrl-1 =3D <&pinctrl_usdhc2_100mhz>;
> -	pinctrl-2 =3D <&pinctrl_usdhc2_200mhz>;

[Severity: Medium]
The original configuration files explicitly defined state_100mhz and
state_200mhz for the eMMC and SD card interfaces.

The i.MX ESDHC driver typically requires these states to adjust pin drive
strength and timing for higher-speed bus modes.

Does the newly introduced imx6ul-imx6ull-var-emmc.dtsi truncate the
pinctrl-names to just "default", which might artificially limit the SD and
eMMC performance to standard speeds?

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts b=
/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
[ ... ]
> -#include "imx6ul-var-som-audio.dtsi"
> -#include "imx6ul-var-som-lvds-panel.dtsi"
> +#include "imx6ul-imx6ull-var-emmc.dtsi"
> +#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
> +#include "imx6ul-imx6ull-var-wm8904.dtsi"
> +#include "imx6ul-var-som-concerto-board.dtsi"

[Severity: Medium]
The newly included imx6ul-imx6ull-var-wm8904.dtsi defines a
simple-audio-card that lists "Microphone Jack" in its widgets.

Without a logical route connecting the Microphone Jack to the WM8904
codec's input pins, ALSA DAPM might not power up the microphone bias or
the ADC path, rendering the microphone input unusable on these boards.

Is the "Microphone Jack" missing from the simple-audio-card,routing list?

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi b/arch/ar=
m/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
> deleted file mode 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
> +++ /dev/null
[ ... ]
> -&usdhc1 {
> -	#address-cells =3D <1>;
> -	#size-cells =3D <0>;
> -	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> -	pinctrl-0 =3D <&pinctrl_usdhc1>, <&pinctrl_32k_clk>;
> -	pinctrl-1 =3D <&pinctrl_usdhc1_100mhz>, <&pinctrl_32k_clk>;
> -	pinctrl-2 =3D <&pinctrl_usdhc1_200mhz>, <&pinctrl_32k_clk>;
> -	no-1-8-v;
> -	non-removable;

[Severity: High]
Without non-removable and cd-gpios, the MMC core might wait for a card
detect state change and fail to probe the SDIO Wi-Fi device.

Furthermore, without no-1-8-v, the MMC core might attempt a 1.8V UHS
voltage switch on a 3.3V-only bus and cause communication errors.

By switching to the shared imx6ul-imx6ull-var-wifi-brcm.dtsi, does the new
SDIO Wi-Fi node omit the non-removable and no-1-8-v properties that were
present here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790512621.gi=
t.stefano.r@variscite.com?part=3D8
