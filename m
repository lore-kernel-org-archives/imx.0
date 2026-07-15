Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482633B8939;
	Wed, 15 Jul 2026 19:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784143194; cv=none; b=onS5zSi1oZrJyePoGKc5lyG1BTUx0wTiVBXrDyBNhchx5saXbXgxHE8Fr7LV5N7P19DUydJZ1t61AmVPDJ+V4n3r80asSPXqmdoeAOtk0qzPxfYH7bJ3rxD4KRF6YrK5fNMLS8u/v4VOrAgtxr5BBfiF+aMGANjL6XLBcUXTBzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784143194; c=relaxed/simple;
	bh=11rAngJJuF5zb0hMQIxjA6jLR+Jg2CSuzRhnrpzl47M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NDW89M3fJ5/iKTZtx9Tum4frj13FU0zxuYcYDhCrwTNNT4IZqahWAJ1lrJyuEju1QyZh8TwgKnJwJZBGFDzj8nHEtFPIl11SB9zP/F1okcoplnLEARDN2Yr5rmRJFhWQACBL/rQnXBnA3WAhhXS3xedAWnWQsTGBEi8S9YE5F3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JBsWnSwh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JBsWnSwh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1281F000E9;
	Wed, 15 Jul 2026 19:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784143188;
	bh=LV4KiCr98vyYbmX2BOTe+goz8+ntsRbpB7ogofgrxjk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JBsWnSwhf84B1euVOkLJVtliuwD8z3CTeXCsY8byjZP1DfT4PwYBYtFfsUwP6u4Ry
	 wt7Yl4VPRDNOljtWQqm/kzyzFawNVYVOG2Hx3+PJbKFXviS5lFp9sHjeinXq8BXClc
	 SyuO+bcoKmwSdf6LzUFzCHwHgQSXxsuDzmFJL8o7n7L2vdRSeWBWgoEbrbVkqmqU1C
	 1g7pFmU5N37uOHGgldn9wp6yw8wYdV7TxcHQbc+IlG1KGRrLNqf6iLkfj/k+i7wCe7
	 5iLk5zA9zgnXYnQYUtmwhYzG+MkNnlcm1criBqM4AOWsDKXwRk0wEO2MuU2EZmVrO6
	 +Sdl7k96KMm+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] arm64: dts: freescale: Add support for Variscite
 VAR-SOM-MX8 QuadMax
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <0dab340bd29e1f4b1fab05a29532cad3177abc7f.1784142385.git.stefano.r@variscite.com>
References: <cover.1784142385.git.stefano.r@variscite.com>
 <0dab340bd29e1f4b1fab05a29532cad3177abc7f.1784142385.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 19:19:47 +0000
Message-Id: <20260715191947.DB1281F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `usdhc3` WiFi SDIO host is marked `non-removable` but assigns =
user-space WiFi initialization GPIOs to its pinctrl state, breaking initial=
ization.
- [Medium] The statically defined `memory` node declares 1GB of RAM, but th=
e `linux,cma` region is placed strictly outside this memory range.
- [Low] The audio regulator node is named `regulator-3p3v` but configured f=
or 1.8V.
--

--- Patch [2]: [PATCH v5 2/3] arm64: dts: freescale: Add support for Varisc=
ite VAR-SOM-MX8 QuadMax ---
commit e6616ac5ca38d036f01cf07cc3cd9713d0d5a5cc
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax

Add device tree support for the Variscite VAR-SOM-MX8 QuadMax system
on module. The module includes an i.MX8 QuadMax processor, LPDDR4 memory,
eMMC, Ethernet, audio codec, and WiFi/Bluetooth connectivity.

Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8-quadmax-quad=
plus/var-som-mx8/

> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi b/arch/arm=
64/boot/dts/freescale/imx8qm-var-som.dtsi
> new file mode 100644
> index 0000000000000..28964de3b080a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
> @@ -0,0 +1,531 @@
[ ... ]
> +	memory@80000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x00000000 0x80000000 0 0x40000000>;
> +	};
> +
> +	reg_audio_supply: regulator-3p3v {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "wm8904-supply";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;

[Severity: Low]
This isn't a bug, but the node name specifies 3.3V while the configured
voltage is explicitly 1.8V. Should this node be named regulator-1p8v
instead?

> +		regulator-always-on;
> +	};
[ ... ]
> +		/* global autoconfigured region for contiguous allocations */
> +		linux,cma {
> +			compatible =3D "shared-dma-pool";
> +			/* VAR-SOM-MX8QM doesn't have 1GB variant */
> +			alloc-ranges =3D <0 0xc0000000 0 0x3c000000>;

[Severity: Medium]
Does this CMA allocation succeed if the bootloader doesn't dynamically patch
the memory size?

The memory@80000000 node declares 1GB of RAM (ending at 0xBFFFFFFF), but
this CMA region is hardcoded to start at 0xC0000000, which falls outside
that default 1GB range.

> +			size =3D <0 0x3c000000>;
> +			linux,cma-default;
> +			reusable;
> +		};
> +	};
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

[Severity: High]
Will this configuration prevent the WiFi module from initializing?

Since usdhc3 is marked non-removable, the MMC driver will attempt to probe
the SDIO bus immediately during boot. Because the pinctrl_wifi group
(containing the initialization GPIOs) is bound to the MMC driver here, user
space cannot claim or toggle these pins to power up the WiFi chip.

The probe may fail permanently since the chip is unpowered during the kernel
probe. Could this be modeled using mmc-pwrseq-simple so the kernel handles
the power sequence automatically before probing?

> +	status =3D "okay";
> +
> +	brcmf: wifi@1 {
> +		compatible =3D "brcm,bcm4329-fmac";
> +		reg =3D <1>;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784142385.gi=
t.stefano.r@variscite.com?part=3D2
