Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794241785;
	b=rNuVN5CZwvXhbX1OfD83BQsOVWXeM6ewboYFKDLwkVdUsDd6OiV3xAkqb5PW/lyONuNt
	 Tu2LxTVO3GQVGvEE/T/B2c2DY30TqLZd4xNZ9y+CEaMKG+SY4xDZr6n9/7Xf5/DWpKa1A
	 bWrqpip/iekRV8HhCeLAQbyYBaiZ0mvBvG81sYxRLAeEVVOUwuWJmxrRVQWk+zKfkCHZ3
	 k2DAGDllo4opcAcJiVUvAvhaD11OwqBXGK6GC4MvXpxfSJIPAF/JuKat8ARPLIv21FGC8
	 AcZYWySYb9bt8jrTIpqdiTHN4ZNp/FnXxJvlGHmsUAdcBBLyycMD/rj0RjciIBvIfUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241785;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=r4d7OyBXnGvPNnBlX0wd7R8ip1I6qe36+Ws70bLtTCw=;
	b=Khpsa29msFCDJO6KLLIytXC9qxXYPXBTuMuncjvUJwrFWFQZGBoD9ViZFgW6tmeJtOsG
	 H0o390F+G5Uqj4+HKGT0EBkjvF9M/HX7k6JMatWhWBRaz1LK7m3eqzYMAyyzs5VhPdQ//
	 by9p14JjKvYbjdBpxBsG2vm6qrqdmvWJC0mE6nTuI0H28an0OXYQRbYSwyJ9EpVuLVsCF
	 Oz1Ddls08MT9ok+TgRjq+YPNmw6S4jz4M2p4JCIXjyt/0yT55ERih0mANokp9diiG7P/M
	 i6h0dqv9R+qTTzhW1OihlUxTedEridhV3pw+gv6gOj2XyMTb+lHUsQr69w/tCWpryCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nT811PDk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A0A606A331;
	Mon,  9 Nov 2026 16:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nT811PDk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7713E1F008A2;
	Mon,  9 Nov 2026 16:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794241784;
	bh=r4d7OyBXnGvPNnBlX0wd7R8ip1I6qe36+Ws70bLtTCw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nT811PDktyKv69Q0FZhJPUDvVFlYI5CSfGmEaX+SOevdn8rVDOpeoLQ6j6PnArsRX
	 uU9tFqEGDuNX4nSrEbY2SZTqqQaP4WBG2H9xGBUt1nBfMjXrHWSYF6mwMVaP66M9qZ
	 MiN/mi8zUZupA80r2rUcyqsyaXlcXyMmvcM0ibnOHth98LJgRJWdD6WpNViTUY+g1E
	 mlJPkCDT8Uo/gYRUMn9ut2RCIdcX/8NGRSOD1QCSUlYhMRsdabTzofO5ac3fguk4rv
	 84lUfarQzHwzTRxzgAsXoJD3PWfZzM1zqIL7x82U/6Ghs4RIHE8zy4d+/0goojwzXD
	 M9H+13wG/7sag==
Message-ID: <sashiko-outbox-205230@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ARM: dts: nxp/imx6: Fix imx6qdl pico dwarf and nymph
 includes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261109161812.3629546-1-robh@kernel.org>
References: <20261109161812.3629546-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 16:29:44 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] ARM: dts: imx6: pinmux hog and GPIO conflicts on pico-dwarf
  and pico-nymph
--

commit 92feeab6397394da98e778808f51f6d2369101e3
Author: Rob Herring (Arm) <robh@kernel.org>

ARM: dts: nxp/imx6: Fix imx6qdl pico dwarf and nymph includes

This commit updates the imx6dl and imx6q pico-dwarf and pico-nymph board
device trees to include their respective baseboard .dtsi files instead of
imx6qdl-pico-pi.dtsi, and adds missing properties to satisfy DT schema
checks.

Link: https://lore.kernel.org/all/sashiko-outbox-199279@kernel.org

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-pico-dwarf.dts b/arch/arm/b=
oot/dts/nxp/imx/imx6dl-pico-dwarf.dts
> index d85b15a8c1272..dd8ce2df876c0 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6dl-pico-dwarf.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6dl-pico-dwarf.dts
> @@ -9,7 +9,7 @@
>  /dts-v1/;
> =20
>  #include "imx6dl.dtsi"
> -#include "imx6qdl-pico-pi.dtsi"
> +#include "imx6qdl-pico-dwarf.dtsi"
> =20
>  / {
>  	model =3D "TechNexion PICO-IMX6 DualLite/Solo Board and Dwarf baseboard=
";
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-pico-nymph.dts b/arch/arm/b=
oot/dts/nxp/imx/imx6dl-pico-nymph.dts
> index 32ccfc5d41cee..4ce0d0d0756c4 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6dl-pico-nymph.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6dl-pico-nymph.dts
> @@ -9,7 +9,7 @@
>  /dts-v1/;
> =20
>  #include "imx6dl.dtsi"
> -#include "imx6qdl-pico-pi.dtsi"
> +#include "imx6qdl-pico-nymph.dtsi"
> =20
>  / {
>  	model =3D "TechNexion PICO-IMX6 DualLite/Solo Board and Nymph baseboard=
";

[Severity: Medium]
Does including imx6qdl-pico-dwarf.dtsi and imx6qdl-pico-nymph.dtsi cause
pinctrl and GPIO conflicts with imx6qdl-pico.dtsi for /leds, &pcie, and
touchscreen@38?

In arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi, &iomuxc hogs both
MX6QDL_PAD_CSI0_VSYNC__GPIO5_IO21 and MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31
via pinctrl-0 =3D <&pinctrl_hog>:

arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi:&iomuxc {
	pinctrl-names =3D "default";
	pinctrl-0 =3D <&pinctrl_hog>;

	pinctrl_hog: hoggrp {
		fsl,pins =3D <
			...
			MX6QDL_PAD_CSI0_VSYNC__GPIO5_IO21	0x4001b0b5 /* PICO_P26 */
			...
			MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31	0x4001b0b5 /* PICO_P44 */
		>;
	};
};

However, both imx6qdl-pico-dwarf.dtsi and imx6qdl-pico-nymph.dtsi define a
/leds node with pinctrl-0 =3D <&pinctrl_gpio_leds> claiming
MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31, and imx6qdl-pico-nymph.dtsi enables
&pcie whose pinctrl-0 =3D <&pinctrl_pcie_reset> claims
MX6QDL_PAD_CSI0_VSYNC__GPIO5_IO21. Because imx_pmx_ops does not set
.function_is_gpio, pin_request() rejects a second device claiming a pin
already owned by iomuxc, causing pinctrl_bind_pins() to fail with -EINVAL
when probing /leds on Dwarf and Nymph and &pcie on Nymph.

In addition, /leds in both baseboard files requests <&gpio5 31
GPIO_ACTIVE_HIGH> as an output, while touchscreen@38 in
imx6qdl-pico.dtsi uses that same GPIO5_IO31 line as its interrupt input
(interrupt-parent =3D <&gpio5>; interrupts =3D <31 IRQ_TYPE_EDGE_FALLING>;).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109161812.3629=
546-1-robh@kernel.org?part=3D1
