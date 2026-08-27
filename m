Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A97822FDE6;
	Thu, 27 Aug 2026 17:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787852528; cv=none; b=LPRQDvLBxgGgP23Ot5DuJz3J6SveL++oZNisPljaqBBDvrhtn0DoILPAxI09R4W9ncspX4PNgsf1pqWGHgc9fIRWWiZy0wHajG88tOhwtZvbGzMd4Jd5c+ohM/4OqXGxLLWW2/iBeOSoJmMGZJbLF4mHMlKGPEBqXUy9x9raVPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787852528; c=relaxed/simple;
	bh=LsWSyKxd9tkuMcXUyiQUR8ritphppIyMhIyx+/1rAq0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ErVFS+JNGP+j0ipLe5Z9kdy3kpfokSTwpCn+VMv799l3/5SHWJ3bOLvmTunpqeu0KBlyL2P1uBCgCl3mnvIGBgcBF+uKHjUa8B32308bTyGQx0nY0fhTlo0g2PBVEHBNdptvId/9CK5GJEwnZQ6ZOnFq5MaSkwFJUHlqKqhumS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=imXXYJBQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="imXXYJBQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4B61F000E9;
	Thu, 27 Aug 2026 17:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787852526;
	bh=+YKihiNIm/ilgl3vt3oQVW7UZ+/8NIePdoiVGL33LYo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=imXXYJBQ9eqNTgyipVmJKOpNUjv0Q5w+y+LhV6XNk89WDSlsZq1ReMr4fItxznLuC
	 d0GA8Q9c2yRotwUFiQoa2JL8kHrTfFTRPhCSkSgqgOXPm037MubbXRwm3sUCux3R20
	 y2Xc7cPDrkgXmkTXPtQ7fHoBXt88BZ90GWdCZ0Alqh27jfA235SPs4Q5gvCuRKB6Vf
	 eiZYxU5niFI0SvjL2+AqTdaNlH5eI2R4vtw5vaBwTSGR2mH/ljaE+HGYy29cyVRDf0
	 hXRaV7l80Z4xwU/B38FX2429YEwRo2JcKrsxEoP1ibdlHt8fnx652csvfP5OvZ30sH
	 QhymTNAxAPjjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <11592f9d727337fedf02fdb107a24e935f3ebce4.1787851637.git.stefano.r@variscite.com>
References: <cover.1787851637.git.stefano.r@variscite.com>
 <11592f9d727337fedf02fdb107a24e935f3ebce4.1787851637.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 17:42:06 +0000
Message-Id: <20260827174206.8A4B61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] WM8731 codec MCLK pin is left undriven due to the deletion of 'fsl=
,sai-mclk-direction-output' without an alternative clock output route.
- [Medium] Onboard Wi-Fi and Bluetooth power sequences are improperly deleg=
ated to user-space scripts instead of kernel device drivers.
--

commit 3caa578f0cdaf021ef9c9ff617d60ff3b372369e
Author: Stefano Radaelli <stefano.r@variscite.com>

ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
   =20
Add device tree support for the Variscite VAR-SOM-MX7 system on module.
This module is based on the NXP i.MX7Dual SoC and is available in multiple
configurations.
   =20
Link: https://variscite.com/system-on-module-som/i-mx-7/var-som-mx7/

> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi b/arch/a=
rm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
> new file mode 100644
> index 0000000000000..92dda8d36478e
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi

[ ... ]

> +&i2c2 {
> +	wm8731: audio-codec@1a {
> +		compatible =3D "wlf,wm8731";
> +		reg =3D <0x1a>;
> +		#sound-dai-cells =3D <0>;
> +		AVDD-supply =3D <&vgen6_reg>;
> +		DBVDD-supply =3D <&vgen6_reg>;
> +		DCVDD-supply =3D <&vgen6_reg>;
> +		HPVDD-supply =3D <&vgen6_reg>;
> +		clocks =3D <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>;
> +		clock-names =3D "mclk";

[ ... ]

> +&sai1 {
> +	assigned-clock-rates =3D <0>, <36864000>;
> +	/delete-property/ fsl,sai-mclk-direction-output;
> +};

[Severity: High]
Does removing the 'fsl,sai-mclk-direction-output' property break the master
clock for the WM8731 codec?

The wm8731 node configures the codec to expect an internal SoC master clock
by setting clocks =3D <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>.

By deleting the 'fsl,sai-mclk-direction-output' property from the sai1
node, the SAI1_MCLK pad is configured as an input instead of driving the
clock out to the codec.

Will this prevent the WM8731 codec from functioning on this board variant
because it never receives a clock?

> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi b/arch/arm/boot=
/dts/nxp/imx/imx7d-var-som.dtsi
> new file mode 100644
> index 0000000000000..158158afc3391
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi

[ ... ]

> +&iomuxc {
> +	/* GPIO Used in User Space init script */
> +	pinctrl_bt: btgrp {
> +		fsl,pins =3D <
> +			MX7D_PAD_GPIO1_IO14__GPIO1_IO14			0x80000000
> +		>;
> +	};

[Severity: Medium]
Are these Bluetooth power sequences improperly delegated to user-space
scripts instead of kernel device drivers?

The pinctrl_bt node defines the BT_REG_ON (GPIO1_IO14) pin strictly as a
pinctrl definition with no corresponding power sequencer or regulator
binding.

Since the comment explicitly notes it is used in a user space init script,
will this prevent the kernel from autonomously enumerating the UART Bluetoo=
th
device during boot?

[ ... ]

> +&iomuxc_lpsr {

[ ... ]

> +	/* GPIO Used in User Space init script */
> +	pinctrl_wlan: wlangrp {
> +		fsl,pins =3D <
> +			MX7D_PAD_LPSR_GPIO1_IO04__GPIO1_IO4		0x09
> +		>;
> +	};

[Severity: Medium]
Is this Wi-Fi power sequence improperly delegated to user-space scripts
instead of an MMC power sequence?

The pinctrl_wlan node defines the WL_REG_ON (GPIO1_IO4) pin strictly as a
pinctrl definition without a corresponding power sequencer or regulator
binding.

Will this prevent the kernel from autonomously enumerating the SDIO Wi-Fi
device during boot?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787851637.gi=
t.stefano.r@variscite.com?part=3D2
