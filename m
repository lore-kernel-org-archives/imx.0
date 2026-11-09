Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243425;
	b=GUettrtZTVW7Mb6jUA4u9fEqrH0MNnn8LA25Eptw7YFD/sHMx0dlNC/QsgqbZaMT5i5f
	 Hh+aPMfrLR49uLr4XAwLjEqVqe0IDB3QoP398JixYD7kUh3WBU8x2VvPdNASqVZXYwFhm
	 Rjoe3V9S6aCNefZ93xc7mVWXobJOpUT3Dx8YcK+dRpW0fUI52mI6K/1Ftjei9oJGyCDjO
	 p2ehIl+iI0XnAyNo7IBv/rIOavGkmPUWC3XO7wNcE8WPv7FX8UOrhSkUxwlez+LjEkSgP
	 Yu6PPcoB9lm3/ZoqYO53w4DlNw8/OPiQWKx343oKDMIi+++/IcavviRj1BhQlo58XqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243425;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=urZYeWhibdtU/Zlp2oYCc0mLuov/V5TOYLzLDDHdsnc=;
	b=YWOHNiUKWXx8teDGVkyAdJsS/D8gOggyFuY9ZzHKxCOCLd/6gab3myQhZNxDm/5QHCsh
	 xZojThwX/M9UvAmXwC0qmRoKB/DydxoKM7aZdhqbAYOag2nyz88gqnEKgmH6W4gy3+YrG
	 kKykSLyUvO3Mgn9Rr1P8NClkg5ntT8dv1cQf5MKE57McSQ9/m3w70ioQolQRLdlx/8iR8
	 5a9ge8bCE2Yy/FByfScE06TGqh7UkoKE208w2U6SRzKtN4+odaKVww5e+q1OBZcJwuaOG
	 ub0DwwqmLQSUNEakMfFMNdB5kmdf18tWWh2fP7jjStoGZPwDLZjiVNjUcuGGU7LadFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IwolJh2y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F432606A33C
	for <imx@lists.linux.dev>; Mon,  9 Nov 2026 16:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IwolJh2y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 857931F008A2
	for <imx@lists.linux.dev>; Mon,  9 Nov 2026 16:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794243423;
	bh=urZYeWhibdtU/Zlp2oYCc0mLuov/V5TOYLzLDDHdsnc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IwolJh2yBbzb9ttEyaLXZsHmVdoj1UmISMMxmTj5K4898I4Up+SxG4VmKiIqNbtmx
	 ukvlBxj/NQfWSI2PoFOiWGlGLwUEGRVKDQbpQxQulVC3trqXptb71t/jmUIo8cPPRQ
	 oNmUJbptOozfgc6Gzs8mtd2RKJCJp0NBT+RHdIBzOqbPCEMBN0PWuc2N4Pr0dxqNYW
	 7nwivTY8kP5bYLsud+PzZ7yneqq8VbV+3yosDmR2hKijX2eDE2+pqWKDn6LjGpORsw
	 J5MXm+SXtjkrSLbQqkcFx5o3I05ZXa0nmspcXNh8zjhpBt72djkGqfudJ4EVUpLb+D
	 qVb/yjHfO78uQ==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4395d31228so149939566b.1
        for <imx@lists.linux.dev>; Mon, 09 Nov 2026 08:57:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGDnhd3ckCiGq1OhIPHzmz3KorEQpB+dQIawqYlr/wMyDmEJ39I4WIn+6NekdBxKJzoyaY=@lists.linux.dev
X-Gm-Message-State: APuU4Z98vrHeMMcozJu/3jHbMUuOuThDH5VpF8ugGpQ69WDX5m+ZHVtY
	zXtqeJ60q/ypHxei16BtMCe22j+3wavcjlXZHqUDuNsKyKxFQuKu9XpDvAUjVNrEvFUFTwsrqJ+
	4Fa7poOsShgaUisKxtVuZPcWErmEHFg==
X-Received: by 2002:a17:907:d8e:b0:c32:110d:682f with SMTP id
 a640c23a62f3a-c4d6db1ee0cmr361581266b.18.1794243422197; Mon, 09 Nov 2026
 08:57:02 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261109161812.3629546-1-robh@kernel.org> <sashiko-outbox-205230@kernel.org>
In-Reply-To: <sashiko-outbox-205230@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 9 Nov 2026 10:56:50 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+2GYF6YOjT4PcEA3sFXZ9nBWGfTFbJtMaxHOMD2pSweA@mail.gmail.com>
X-Gm-Features: AclHuK-sQPk6w1BbAKz5ufpcVmOX4WI72SXQ6mekCEPL_UO_W0K8T6-3I822OgA
Message-ID: <CAL_Jsq+2GYF6YOjT4PcEA3sFXZ9nBWGfTFbJtMaxHOMD2pSweA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nxp/imx6: Fix imx6qdl pico dwarf and nymph includes
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, 
	Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 10:29=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] ARM: dts: imx6: pinmux hog and GPIO conflicts on pico-dwarf
>   and pico-nymph
> --
>
> commit 92feeab6397394da98e778808f51f6d2369101e3
> Author: Rob Herring (Arm) <robh@kernel.org>
>
> ARM: dts: nxp/imx6: Fix imx6qdl pico dwarf and nymph includes
>
> This commit updates the imx6dl and imx6q pico-dwarf and pico-nymph board
> device trees to include their respective baseboard .dtsi files instead of
> imx6qdl-pico-pi.dtsi, and adds missing properties to satisfy DT schema
> checks.
>
> Link: https://lore.kernel.org/all/sashiko-outbox-199279@kernel.org
>
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-pico-dwarf.dts b/arch/arm=
/boot/dts/nxp/imx/imx6dl-pico-dwarf.dts
> > index d85b15a8c1272..dd8ce2df876c0 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6dl-pico-dwarf.dts
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6dl-pico-dwarf.dts
> > @@ -9,7 +9,7 @@
> >  /dts-v1/;
> >
> >  #include "imx6dl.dtsi"
> > -#include "imx6qdl-pico-pi.dtsi"
> > +#include "imx6qdl-pico-dwarf.dtsi"
> >
> >  / {
> >       model =3D "TechNexion PICO-IMX6 DualLite/Solo Board and Dwarf bas=
eboard";
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-pico-nymph.dts b/arch/arm=
/boot/dts/nxp/imx/imx6dl-pico-nymph.dts
> > index 32ccfc5d41cee..4ce0d0d0756c4 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6dl-pico-nymph.dts
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6dl-pico-nymph.dts
> > @@ -9,7 +9,7 @@
> >  /dts-v1/;
> >
> >  #include "imx6dl.dtsi"
> > -#include "imx6qdl-pico-pi.dtsi"
> > +#include "imx6qdl-pico-nymph.dtsi"
> >
> >  / {
> >       model =3D "TechNexion PICO-IMX6 DualLite/Solo Board and Nymph bas=
eboard";
>
> [Severity: Medium]
> Does including imx6qdl-pico-dwarf.dtsi and imx6qdl-pico-nymph.dtsi cause
> pinctrl and GPIO conflicts with imx6qdl-pico.dtsi for /leds, &pcie, and
> touchscreen@38?
>
> In arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi, &iomuxc hogs both
> MX6QDL_PAD_CSI0_VSYNC__GPIO5_IO21 and MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31
> via pinctrl-0 =3D <&pinctrl_hog>:
>
> arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi:&iomuxc {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_hog>;
>
>         pinctrl_hog: hoggrp {
>                 fsl,pins =3D <
>                         ...
>                         MX6QDL_PAD_CSI0_VSYNC__GPIO5_IO21       0x4001b0b=
5 /* PICO_P26 */
>                         ...
>                         MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31       0x4001b0b=
5 /* PICO_P44 */
>                 >;
>         };
> };
>
> However, both imx6qdl-pico-dwarf.dtsi and imx6qdl-pico-nymph.dtsi define =
a
> /leds node with pinctrl-0 =3D <&pinctrl_gpio_leds> claiming
> MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31, and imx6qdl-pico-nymph.dtsi enables
> &pcie whose pinctrl-0 =3D <&pinctrl_pcie_reset> claims
> MX6QDL_PAD_CSI0_VSYNC__GPIO5_IO21. Because imx_pmx_ops does not set
> .function_is_gpio, pin_request() rejects a second device claiming a pin
> already owned by iomuxc, causing pinctrl_bind_pins() to fail with -EINVAL
> when probing /leds on Dwarf and Nymph and &pcie on Nymph.
>
> In addition, /leds in both baseboard files requests <&gpio5 31
> GPIO_ACTIVE_HIGH> as an output, while touchscreen@38 in
> imx6qdl-pico.dtsi uses that same GPIO5_IO31 line as its interrupt input
> (interrupt-parent =3D <&gpio5>; interrupts =3D <31 IRQ_TYPE_EDGE_FALLING>=
;).

I give up...

Rob
