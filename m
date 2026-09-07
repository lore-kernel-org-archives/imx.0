Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E1830F80C;
	Mon,  7 Sep 2026 14:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788792060; cv=none; b=KjuWdlSDAR3hXfP7HsiTkIuXgDr3xkeCF3MRRnp+hQL+WMBG2c707AetlR0RRZGqApuZfxFTvayCr6O56SI52QrdEcXoQlQV4k6n5f2cR9rO6xwze+yNSyNNam1bl1tF8R6lZbS6S5lKREiGDhcswxiNSDxydtac1OK0KCITslo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788792060; c=relaxed/simple;
	bh=YJbsmxHIE9ctMRtCEgo/5nPyzDJiA4ry2ZQjawhCxMU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dfKBan4wGPP1N5BIvf6KfYyukaTR+x+2f53JWufRLnsQHVstTpD9zeKWTTZULjRqoeizbkUPRScsAbPfiOKqlH8YqsJHpphm4VUp95jN/JmDfRz24YQg7cTYqa6H7tg3zjdNuucrSeDvO8WATL7QKJBWf986cTI1kUHc4EggeHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YspaNAIR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YspaNAIR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20251F00A3A;
	Mon,  7 Sep 2026 14:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788792051;
	bh=XrnpVceRk1kf7n4qGzTpd16+vxYsutZuhYzZR3ZM/B4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YspaNAIRatACNEWG09hsXTSHIXqDQYkxpDhiExji4DdW9Bprh6ROtVda23gEDq3Th
	 P8f5vFvcPjXksYisj9ileXMh17wnuOnhhaY/qaCtfk+5iA5IkgJF8qcyfqz8Hy0LyA
	 nFqdeRxWEwFdjm8OFK5uef3L52X1Dvyyzyi7c8fcRx/DFNGVGqQaUPRne/HBCNZ5ak
	 Xo2TOg6ZFLPBK6mdIbO+hMhqjF1lw/JnCeLBdRK0gEKz40bWaqANFbjwHNRhhDRT+0
	 sXdl/3l9CjDvb/rX/D4kE2VvMegHR2mccqFsz01tPGTmQjgseF6HLPIhlC/mUCC0Gm
	 TYGfo19ErFcSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: freescale: add Nodebox v3 CPU Module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260907-for-upstream-nbxv3-dts-v1-3-f43fd0028b78@free.fr>
References: <20260907-for-upstream-nbxv3-dts-v1-0-f43fd0028b78@free.fr>
 <20260907-for-upstream-nbxv3-dts-v1-3-f43fd0028b78@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 14:40:50 +0000
Message-Id: <20260907144050.C20251F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] System-critical reset GPIOs (such as the ethernet switch reset) =
are incorrectly tied to the `fspi` peripheral's pinctrl lifecycle.
- [Low] Active-low GPIO signals are semantically defined with incorrect pol=
arity (GPIO_ACTIVE_HIGH).
- [Low] The new board compatible string 'freemobile,nbxv3' is missing from =
the dt-bindings documentation.
- [Low] The .dtb entry in the Makefile is inserted out of alphabetical orde=
r.
--

commit 8ec6719880bbc095a9e9249535f912cf432fd8e8
Author: Vincent Jardin <vjardin@free.fr>

arm64: dts: freescale: add Nodebox v3 CPU Module

This commit introduces the device tree and include files for the Nodebox v3,
a Free Mobile CPU module built around the NXP LX2160A. The same device
tree is intended to be shared between the Linux kernel and U-Boot.

> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts=
/freescale/Makefile
> index 95ae85ab4adf5..f67d0a53cdc34 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -59,6 +59,8 @@ DTC_FLAGS_fsl-lx2160a-qds :=3D -Wno-interrupt_map
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-lx2160a-qds.dtb
>  DTC_FLAGS_fsl-lx2160a-rdb :=3D -Wno-interrupt_map
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-lx2160a-rdb.dtb
> +DTC_FLAGS_fsl-lx2160a-nbxv3 :=3D -Wno-interrupt_map
> +dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-lx2160a-nbxv3.dtb
>  DTC_FLAGS_fsl-lx2162a-clearfog :=3D -Wno-interrupt_map

[Severity: Low]
Does this break the alphabetical ordering of the dtbs? It looks like
fsl-lx2160a-nbxv3.dtb is being inserted after fsl-lx2160a-rdb.dtb instead of
before fsl-lx2160a-qds.dtb.

> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts b/arch/a=
rm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts
> new file mode 100644
> index 0000000000000..ccc5855208a63
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts
[ ... ]
> +/ {
> +	model =3D "Free Mobile Nodebox v3 CPU Module (LX2160A)";
> +	compatible =3D "freemobile,nbxv3", "fsl,lx2160a";
> +};

[Severity: Low]
Is the "freemobile,nbxv3" compatible string documented in the device tree
bindings? Missing documentation here might trigger warnings during a
make dtbs_check run.

> +
> +&fspi {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&fspi_dqs_sck_cs10_pins>, <&fspi_data30_pins>,
> +		    <&gpio1_31_28_pins>;
> +};

[Severity: Medium]
Does assigning the pinctrl group for GPIOs 28-31 to the fspi device create
a conflict with the gpio-hogs defined in the gpio1 controller?

If the pinmux controller enforces strict muxing, the gpio-hog nodes for
the ethernet switch and flash resets will fail to claim the pins because
they have already been claimed by fspi's pinctrl here. Furthermore, tying
unrelated system resets to the fspi peripheral's pinctrl lifecycle means
that if the fspi driver fails to probe, or is unbound, these components
will lose their configuration.

> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi b/arch/=
arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
> new file mode 100644
> index 0000000000000..bd10eccac4fb4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
[ ... ]
> +&gpio1 {
> +	status =3D "okay";
[ ... ]
> +	/* Ethernet switch reset, released: electrical high */
> +	ethsw-reset-hog {
> +		gpio-hog;
> +		gpios =3D <31 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name =3D "ethsw-reset#";
> +	};
> +};

[Severity: Low]
Is this active-low hardware reset signal defined with the correct semantic
polarity? Defining an active-low reset as GPIO_ACTIVE_HIGH and manually
forcing the electrical state with output-high bypasses the device tree
coding standards, which expect the hardware's active state to be accurately
reflected in the bindings.

> +&gpio3 {
> +	status =3D "okay";
[ ... ]
> +	/* Low enables the carrier-side EMDIO2 level translator */
> +	ethsw-mdio-en-hog {
> +		gpio-hog;
> +		gpios =3D <25 GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name =3D "ethsw-mdio-en";
> +	};
> +};

[Severity: Low]
Similarly, this active-low enable signal is defined as GPIO_ACTIVE_HIGH
while using output-low to force the electrical low. Should this be defined
as GPIO_ACTIVE_LOW instead to reflect its true semantic polarity?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-for-upstre=
am-nbxv3-dts-v1-0-f43fd0028b78@free.fr?part=3D3
