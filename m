Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B564325701;
	Sun, 27 Sep 2026 11:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790507180; cv=none; b=dlnkUUYawIrhbz+MPZcT6SIV2abiRFt+Z5uLmVKd23sssux8uE6FJ66Xqiu3rePRwzEl1pkCDADLgdc9CB/AZ8CXT8H8IKdrgkbZ0PAsT8pfp7vlmVdlZQpD8vAs8iSRrvlrElezhKEF3bayjuTDL/IFyqi6s5u4vEQskg08dbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790507180; c=relaxed/simple;
	bh=cazbbgOYc/rBcZ3a2/iQa5yVmwbJmoagTEAkAFU6r14=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iZo2RVz7uOfanZn9bbPR+QAC8QqGLzhEQcJ835BtMffgViog3aLOiP6yPsF5sjlpjhqEG7UYRTDqLLjU9mH4AqXxlqVPIcgDyKm4P8sEZuNnongdDwMmwXMgwAnKLCTVT6rTOLptNhdchb8zasYy/+XoLsgXJGuVJ1JTvxlbV0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gpt+OgR0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gpt+OgR0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504F31F000FF;
	Sun, 27 Sep 2026 11:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790507178;
	bh=UU4Pq9lqQnglEZUtDrkT+Te836n5++9Wpjr4fr7ROmA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gpt+OgR0sVo93qySoR1bKb1TtozPvf9H6YlTg9K6kjg4V15q1zldHzBIc5ZQdphDA
	 RnfFi3bbQyNR4IfF7utk2/7BlJIsZtnDFVHN5RPA315PDXYR6pxqsIdlrGge7bkBuP
	 LfkPw0EAkZqB3BMMoJfxwdRbRI/WG5DoVhHYeeE7Xgt9WdB59osI3wGo88x1CzFSgG
	 bnx8SVa5aRJIQWGMgqVYANxYnvQdFPrqoZ3ZrY/2NyZqRPoUZ87DycWTOOaoyPpSWM
	 iUHzMInlmtU1AbZqMhoJEcsbsURiYrdSoHGfDpWRXEREoTEGrkgfHMeCXB1odThyXe
	 UMKpQqaZp8b0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/11] ARM: dts: imx6ul: Reuse Variscite DTSI files
 for Concerto
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <bc6048638221dcb21764d8336f9254a541087e0e.1790413032.git.stefano.r@variscite.com>
References: <cover.1790413032.git.stefano.r@variscite.com>
 <bc6048638221dcb21764d8336f9254a541087e0e.1790413032.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 11:06:17 +0000
Message-Id: <20260927110618.504F31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] mmc: missing non-removable property breaks SDIO Wi-Fi
- [High] clk: invalid audio clock rate for SAI2
- [Medium] dt: removal of hardware description for userspace policy
- [Medium] dt: invalid interrupt trigger type for touchscreen
--

commit 4652c48dc5d4a5447b97f46a89cbede055fb6211
Author: Stefano Radaelli <stefano.r@variscite.com>

ARM: dts: imx6ul: Reuse Variscite DTSI files for Concerto

This commit converts the existing i.MX6UL and i.MX6ULL Concerto boards
to use shared module, option, and carrier DTSI files. It also removes
the old kernel-managed Wi-Fi power sequence and Bluetooth nodes in
favor of user-space initialization.

> The old Wi-Fi power sequence and Bluetooth nodes modeled enable and
> reset control in the kernel. On these SoMs those controls are handled
> in userspace, so use the shared Broadcom Wi-Fi description without the
> old kernel-managed nodes.

[Severity: Medium]
Does this removal of hardware description to defer to userspace initializat=
ion
violate Devicetree principles?

The kernel will not automatically initialize the Bluetooth and Wi-Fi modules
natively. Devicetree principles require describing the physical hardware
regardless of the OS policy.=20

In arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wifi-brcm.dtsi:
        brcmf: wifi@1 {
                compatible =3D "brcm,bcm4329-fmac";
                reg =3D <1>;
        };

Without the mmc-pwrseq, how is the reset line physically released for the
Wi-Fi card when it was removed from the DT?

[ ... ]

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts b=
/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
> index 725f34d6b7ee9..5a3e3fb4c5a5b 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
> @@ -8,15 +8,16 @@
> =20
>  /dts-v1/;
> =20
> +#include "imx6ul.dtsi"
>  #include "imx6ul-var-som.dtsi"
> -#include "imx6ul-var-som-concerto-common.dtsi"
> -#include "imx6ul-var-som-wifi.dtsi"
> -#include "imx6ul-var-som-enet2.dtsi"
> -#include "imx6ul-var-som-enet1.dtsi"
> -#include "imx6ul-var-som-audio.dtsi"
> -#include "imx6ul-var-som-lvds-panel.dtsi"
> +#include "imx6ul-imx6ull-var-som-emmc.dtsi"
> +#include "imx6ul-imx6ull-var-som-wifi-brcm.dtsi"

[Severity: High]
Does this shared Wi-Fi configuration omit the non-removable property for a
hardwired SDIO Wi-Fi module?

The MMC subsystem will treat it as a removable slot and, lacking a card-det=
ect
signal, will fail to detect the module. The omission of no-1-8-v may also
cause erroneous UHS voltage switch attempts on a fixed 3.3V supply.

In arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wifi-brcm.dtsi:
&usdhc1 {
        #address-cells =3D <1>;
        #size-cells =3D <0>;
        pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
        pinctrl-0 =3D <&pinctrl_usdhc1>, <&pinctrl_32k_clk>, <&pinctrl_wifi=
>;
        ...
        keep-power-in-suspend;
        vmmc-supply =3D <&reg_sd1_vmmc>;
        status =3D "okay";

Can this cause a complete loss of Wi-Fi functionality when the MMC driver
probes the interface during boot?

> +#include "imx6ul-imx6ull-var-wm8904.dtsi"

[Severity: High]
Does this file assign a mathematically incorrect and non-standard audio clo=
ck
frequency to the SAI2 master clock?

In arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi:
&sai2 {
        assigned-clock-rates =3D <0>, <11565177>;
        ...

The SAI2 master clock is assigned to 11565177 Hz instead of the standard
12288000 Hz (which cleanly divides the 786432000 Hz PLL and provides exactly
256 * 48kHz). Can this cause audio playback or capture to be pitch-shifted,=
 or
make the codec reject the clock entirely?

> +#include "imx6ul-var-som-concerto-board.dtsi"

[Severity: Medium]
Does this specify an undefined interrupt trigger (0) for the external
touchscreen controller?

In arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-concerto-board.dtsi:
touchscreen@38 {
        ...
        interrupt-parent =3D <&gpio5>;
        interrupts =3D <9 0>;
        ...

This specifies an undefined interrupt trigger (0, IRQ_TYPE_NONE) for the
edt-ft5406 touchscreen, which is an anti-pattern. Can this cause the
touchscreen driver to fail to receive interrupts and silently drop them,
rendering the touchscreen non-functional if the bootloader hasn't
pre-configured the GPIO interrupt trigger type?

> =20
>  / {
>  	model =3D "Variscite VAR-SOM-6UL Concerto Board (6UL CPU)";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790413032.gi=
t.stefano.r@variscite.com?part=3D7
