Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C33436494C;
	Sat, 27 Jun 2026 14:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782572276; cv=none; b=KJ3tsRstUWh9U8yq9joJmLNfBsv6eYPp4J7i31iz0B2BwCaKO5yOOHj7+4Qf7/q5K8aYAfjqPUMQEqzLO853S1A0IB7biiH8ryjgjFdEARYLZlQd4M2z70WQuZHPUKkIP4n6jW4x1oxorRYbG5snETKyTXIdizwmZPub1y475DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782572276; c=relaxed/simple;
	bh=yFr6wxCqw5seMt+H4oMYuf5gn09pe+Jd2ZdjJicSShk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C58T0Wbq938fIY28pUwM/Ae+Svcx+AFdcf/k1gQeqAbCpydjwwal7xBtYh7pBFqjW8f/O4OeKCFz/W1aFVMUSoqNkgkFx+DE9rdrKCFzUvZNJUcMDsindLULD9AVKwj3rwylfS9hdcYVM14ufMzawkA8panSgzRAtFeJCsR0/oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kuj11tzj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kuj11tzj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 943BE1F000E9;
	Sat, 27 Jun 2026 14:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782572275;
	bh=CHB2iqnNEu0iUXRO17w0uk8EMx1t97/oBmMC6zokl5E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kuj11tzj14tAwBKOgjWrYO0NqNDwcUKJ2TIYQOue6r0k7Q5TnIUb9r8a/y9sI+oNT
	 7RRHAXKMH2ycBUrNLetQ62uvxe6/hInRJi2fsV03Hef2J8kl0ibEnE6g7u101Wi4B0
	 ER8ae9p4z4lfMbgBPg793tUHlKgYthsyPhjGHuCqvPuabt36HxobouAy4ppjO7uO6t
	 AnFXnmJODKqKjzE+o4i3XXzAHL3QNQ9ab4UBj/i+txKG8F6LIb49imjWtAFooa0Rje
	 6ExxXJBFL7+GM6hwVaJWXiK1jm0xeviXxAeOmGgG6yrDH+NzwM8ddOLWgFJFY+1CzK
	 vsOxu8PA9COKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: imx8mm-var-dart: Add support for
 Variscite Sonata board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <e7fa5dc7f6f29bfc3f1b7b7e55cbec3758c28f14.1782571383.git.stefano.r@variscite.com>
References: <cover.1782571383.git.stefano.r@variscite.com>
 <e7fa5dc7f6f29bfc3f1b7b7e55cbec3758c28f14.1782571383.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 27 Jun 2026 14:57:54 +0000
Message-Id: <20260627145754.943BE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The MCP251xFD CAN controller uses an active-low interrupt line tha=
t must be configured as level-triggered, but is configured as edge-triggere=
d (`IRQ_TYPE_EDGE_FALLING`).
- [Low] The ads7846 touchscreen node uses deprecated properties.
- [Low] The pinmux `MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22` is configured as a GP=
IO in `pinctrl_ecspi1` but `GPIO4_IO22` is never used by `ecspi1` or any of=
 its subnodes.
--

commit bb01573339283cd17f8253331852c339f7a84276
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: imx8mm-var-dart: Add support for Variscite Sonata board

Add device tree support for the Variscite Sonata carrier board with the
DART-MX8M-MINI system on module. This adds support for peripherals including
uSD Card, USB, UART, SPI, I2C, RTC, TPM, and CAN interfaces.

Link: https://variscite.com/carrier-boards/sonata-board/

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts b/a=
rch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
> new file mode 100644
> index 0000000000000..93b0076987b82
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
[ ... ]
> +	/* Resistive touch controller */
> +	ads7846: touchscreen@0 {
> +		compatible =3D "ti,ads7846";
> +		reg =3D <0>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_restouch>;
> +		interrupt-parent =3D <&gpio1>;
> +		interrupts =3D <3 IRQ_TYPE_EDGE_FALLING>;
> +		spi-max-frequency =3D <1500000>;
> +		pendown-gpio =3D <&gpio1 3 GPIO_ACTIVE_LOW>;
> +		ti,x-min =3D /bits/ 16 <125>;
> +		ti,x-max =3D /bits/ 16 <4008>;
> +		ti,y-min =3D /bits/ 16 <282>;
> +		ti,y-max =3D /bits/ 16 <3864>;
> +		ti,x-plate-ohms =3D /bits/ 16 <180>;
> +		ti,pressure-max =3D /bits/ 16 <255>;
> +		ti,debounce-max =3D /bits/ 16 <10>;

[Severity: Low]
Are these specific ti,ads7846 properties deprecated in favor of generic
touchscreen properties? Using the standard generic bindings might avoid
device tree validation warnings.

> +		ti,debounce-tol =3D /bits/ 16 <3>;
> +		ti,debounce-rep =3D /bits/ 16 <1>;
> +		ti,settle-delay-usec =3D /bits/ 16 <150>;
> +		ti,keep-vref-on;
> +		wakeup-source;
> +	};
> +
> +	can0: can@1 {
> +		compatible =3D "microchip,mcp251xfd";
> +		reg =3D <1>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_can>;
> +		clocks =3D <&clk40m>;
> +		interrupt-parent =3D <&gpio1>;
> +		interrupts =3D <6 IRQ_TYPE_EDGE_FALLING>;

[Severity: High]
Does the mcp251xfd CAN controller require a level-triggered interrupt rather
than edge-triggered? If the device holds the INT pin low while internal
interrupts are pending, an edge-triggered setup might miss subsequent
interrupts if the line does not transition high to low again, potentially
stalling CAN communication.

[ ... ]
> +	pinctrl_captouch: captouchgrp {
> +		fsl,pins =3D <
> +			MX8MM_IOMUXC_GPIO1_IO14_GPIO1_IO14		0x16
> +		>;
> +	};
> +
> +	pinctrl_ecspi1: ecspi1grp {
> +		fsl,pins =3D <
> +			MX8MM_IOMUXC_ECSPI1_SCLK_ECSPI1_SCLK		0x13
> +			MX8MM_IOMUXC_ECSPI1_MOSI_ECSPI1_MOSI		0x13
> +			MX8MM_IOMUXC_ECSPI1_MISO_ECSPI1_MISO		0x13
> +			MX8MM_IOMUXC_ECSPI1_SS0_GPIO5_IO9		0x13
> +			MX8MM_IOMUXC_GPIO1_IO12_GPIO1_IO12		0x13
> +			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22		0x13

[Severity: Low]
Is MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22 used by ecspi1 or its subnodes? It
appears to be included in the pinctrl_ecspi1 group without being referenced
by the SPI interface, which could unnecessarily claim the pad or cause
conflicts.

> +		>;
> +	};
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782571383.gi=
t.stefano.r@variscite.com?part=3D3
