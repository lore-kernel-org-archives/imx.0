Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891065;
	b=nRh4dvEl9SSaDzjrid12/9g8Ngdlnz8AgI+pQMCekWWICcwTZC7HQewi26zkptgmW48Y
	 A/E28HzW8Wi4C2pTk6kZG2dpqgrwsLvsC+7FAL+X1TrFltTQUZGax0/TVtyJPPn2S8lTn
	 yn1eVCGhFq2MMfh9rJY8lUyoJ0DOb2DejmMBtGTMPUPnUNprS6jNKsOgoD5kyI83lW3M4
	 FSzz3WeA1TKU+0GgIQT0Y3C39a0HlOaXj2zrGfnWJfp7g2sLWQYhtn0Upk/BogVvB/u/w
	 WxzdKsHFRcbucK9zG4xXpazVwHNFnz9h08FnBpFBu5AoE/Nd7ZcKxb5hxfC5qZ5VOSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891065;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6JpxKF69zra3KLEFXI7WNQ/Oicqi4O8hGXipJr7KSLw=;
	b=N3eyKG+KlrWR77NmJgifS4Y/EhB+l87/Rs0y81fCFXoex9WvgQUBS6bAoAaqcSYz3L8+
	 CYQoORPskmGzVG56rLkrrkLCQDL9mmdtvkqgdUpuZzXaNf8B5kg6HwtaYy3uxOOqmu2K6
	 71UlNzmVXFWpYLYTxj/GwNqbJZyCRrzln0nL/Urycku1u3c9CIiIemJeZ/Dqo5RV5DGAi
	 rWhhF5vd77xdwZxFCSJci/HrayVZhnRNLLWqgCNkCFEyDeP/KzOQBD5J5ghBWVCX9xkrC
	 UFpWxPr8j9lvGYazSupR35xqpITYdeeGZ0GpJVANLHii1b7RxwYi3lic/zwDQoALM3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RMVUSQ5I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D4F606A326
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 15:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RMVUSQ5I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 623F51F0093A
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 15:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793891065;
	bh=6JpxKF69zra3KLEFXI7WNQ/Oicqi4O8hGXipJr7KSLw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RMVUSQ5IfrgcGJMldSq/TbxxdAUx3pkhJFBKkO7IfBnRL/J42kuDv4suUTCHOyltF
	 aKPTg16cRtGFo7oNLoyxkSPZQATKQtxbmL6ToKXfJPSRfHoY56rCaxm8/17uLwpXEY
	 i9MkW3XKnCYz45oE+Dd7fsU+miRrEoB9jUqBfPxBKgqJPv2/Eqxd1zSneu5ijTRk4o
	 7E2UZaVD3QLtJ9J9ix31q1pp628Fi3f0cG2IKKhEPhiUENwbtpK3pdmJ6NZp4TRMFk
	 a4ekxirHrBdftTwfqSGW0QiDXsrTUUNn7pc5/Ym12Qtgcx99fe0t2jtmFUvmM2ORPj
	 QkYdUxiTrigCQ==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b4b7dee316so1047946a12.0
        for <imx@lists.linux.dev>; Thu, 05 Nov 2026 07:04:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByvXuxxsedjjdoKxnjH3cMPqekWvCaYBsKu3cH/rgFEW1zpxzO3I0ZJc1awvsyEG0raYEE=@lists.linux.dev
X-Gm-Message-State: APuU4Z8wWTNt8s8WsfRtiQes5ovyUqc4l9TmURgjAvcHYd/3GLKb5r+t
	ZQEi+JzgZfW+8bPmuBYpD9PD/MZWye4byXpfhrx/fOQcH/R1AuXSWdLRMr+dk19mVfDAjnItgSO
	gwmPudTENuzDyiIQAqU2sxOgjNK99KQ==
X-Received: by 2002:a05:6402:a512:20b0:6ac:b0fb:57b5 with SMTP id
 4fb4d7f45d1cf-6b4d4c74d91mr10007519a12.26.1793891064026; Thu, 05 Nov 2026
 07:04:24 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105144920.2796623-2-robh@kernel.org> <sashiko-outbox-199279@kernel.org>
In-Reply-To: <sashiko-outbox-199279@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 5 Nov 2026 09:04:12 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+U2RUjj1SQ8F5=3R30GBqXDzgBSFgqLbO1KRei=Xiv0w@mail.gmail.com>
X-Gm-Features: AclHuK-unT37pbZokmeKAjXq4HeyOtONEklLF2wD-ifUxqMj98lciCWNNlqIGF4
Message-ID: <CAL_Jsq+U2RUjj1SQ8F5=3R30GBqXDzgBSFgqLbO1KRei=Xiv0w@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: nxp/imx6: Drop unused .dtsi
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, 
	Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 8:59=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] ARM: dts: imx6: Deleting Dwarf and Nymph .dtsi omitted by copy=
-paste in .dts
> --
>
> commit 22f4920daa7995325841819b6b25c37d2efd2b30
> Author: Rob Herring (Arm) <robh@kernel.org>
>
> ARM: dts: nxp/imx6: Drop unused .dtsi
>
> This commit removes four i.MX6 device tree include files that are not
> currently included by any in-tree device tree sources.
>
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi b/arch/a=
rm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
> > deleted file mode 100644
> > index 3a968782e854b..0000000000000
> > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
> > +++ /dev/null
> > @@ -1,45 +0,0 @@
> > -// SPDX-License-Identifier: GPL-2.0+ OR MIT
> > -//
> > -// Copyright 2017 NXP
> > -
> > -#include "imx6qdl-pico.dtsi"
>
> [ ... ]
>
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi b/arch/a=
rm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
> > deleted file mode 100644
> > index 3d56a42164482..0000000000000
> > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
> > +++ /dev/null
> > @@ -1,54 +0,0 @@
> > -// SPDX-License-Identifier: GPL-2.0+ OR MIT
> > -
> > -#include "imx6qdl-pico.dtsi"
>
> [Severity: Medium]
> Should imx6qdl-pico-dwarf.dtsi and imx6qdl-pico-nymph.dtsi be wired up to
> their existing board device trees instead of being deleted?
>
> Unlike the Kontron files, the corresponding board files for Dwarf and Nym=
ph
> already exist in the tree and are built by arch/arm/boot/dts/nxp/imx/Make=
file
> (imx6dl-pico-dwarf.dts, imx6q-pico-dwarf.dts, imx6dl-pico-nymph.dts, and
> imx6q-pico-nymph.dts).
>
> When commit 98670a0bb0ef ("ARM: dts: imx6qdl: Add imx6qdl-pico support")
> added support for the Dwarf, Hobbit, Nymph, and Pi baseboards, a copy-pas=
te
> error left the Dwarf and Nymph .dts files including imx6qdl-pico-pi.dtsi:
>
> arch/arm/boot/dts/nxp/imx/imx6dl-pico-dwarf.dts:
>     #include "imx6dl.dtsi"
>     #include "imx6qdl-pico-pi.dtsi"
>
>     / {
>             model =3D "TechNexion PICO-IMX6 DualLite/Solo Board and Dwarf=
 baseboard";
>             compatible =3D "technexion,imx6dl-pico-dwarf", "fsl,imx6dl";
>     };
>
> arch/arm/boot/dts/nxp/imx/imx6dl-pico-nymph.dts:
>     #include "imx6dl.dtsi"
>     #include "imx6qdl-pico-pi.dtsi"
>
>     / {
>             model =3D "TechNexion PICO-IMX6 DualLite/Solo Board and Nymph=
 baseboard";
>             compatible =3D "technexion,imx6dl-pico-nymph", "fsl,imx6dl";
>     };
>
> (and similarly in imx6q-pico-dwarf.dts and imx6q-pico-nymph.dts).
>
> As a result, the Dwarf and Nymph board DTBs are currently built with the =
Pi
> baseboard description (which disables HDMI and routes the LED to GPIO5_IO=
18)
> rather than their own baseboard descriptions in imx6qdl-pico-dwarf.dtsi
> (GPIO5_IO31 LED, mpl3115@60 on i2c1, and pca9554 io-expander@25 on i2c2) =
and
> imx6qdl-pico-nymph.dtsi (GPIO5_IO31 LED, adc@52 on i2c1, pca9554
> io-expander@25 on i2c2, ds1337 rtc@68 on i2c3, and PCIe enabled).
>
> Would it make sense to keep imx6qdl-pico-dwarf.dtsi and
> imx6qdl-pico-nymph.dtsi and update the four Dwarf and Nymph .dts files to
> include them?

Seems like the correct analysis. If someone cares about those
platforms, then they can send a fix. If not, we should delete them
too.

Rob
