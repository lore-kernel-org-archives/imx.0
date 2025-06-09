Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227C21B4121
	for <imx@lists.linux.dev>; Mon,  9 Jun 2025 15:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481706; cv=none; b=K2e68dGTXFtEDl59vqWkBkqOZS6DaJeDenHm0xQYLuDpAjbuTQKcnv96GvHD+3MDXEVV872z3rMSshcNsLcWNJjBnPlCLSNG3kS9y43LEWBUcVc6JJYCOpQRoMbLnvcRb2MWOmFpgNEjR9MR6Ys7cS4Y7GRlXf5NWnb1ptqUBNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481706; c=relaxed/simple;
	bh=0Xe0eY9ltM9JA/g6k+HjMgjHmlrR1XxJ2AAtueBFYsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R4fKU9Jfg7nW5xsgdF3w1yB7ny+/24MoQOzWlkNvsB2zzvNZGHnW1MGnouyalAKaFYmuLgbke7tSfP0uIPCe5eR6l2K5geM1yjD0egiUzLGLqOifaBAurp8kGwO0XNSlLqbEBm/RM0f+1AZpjG92pZHAneNwRZVZKT+BUeMwSeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=T9cGg2G1; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="T9cGg2G1"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e81749142b3so3825364276.3
        for <imx@lists.linux.dev>; Mon, 09 Jun 2025 08:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749481704; x=1750086504; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+smXdzbnTzkipKZ/URNR/f2iTlhGoSY2Qlkjkw+Pk8=;
        b=T9cGg2G1yIuVvTnivfP0zAPKEmLM6oHeJKgTWsX3oy/kO692mmry+8SruAirjoApAX
         mR3RlUGQu8WFH56WQVNjbNRfj7lVXcvmZTFE+oBxNb1e40r/Nu5rveQCdveYYyEng/9R
         BuXCCDZDIpbJ5jjUcbQaXQ7r5RHDEDi1aT5LQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481704; x=1750086504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+smXdzbnTzkipKZ/URNR/f2iTlhGoSY2Qlkjkw+Pk8=;
        b=bhf1hdy514g2jjK4chVN+Tub+X1Xk+YyqLwOADj7kKwJknwLT0qZkJBZyKXpOXqXF4
         ByUCh2kfRGxFGYO968x1T27VBzToQK7Auu1XpUC6ohufvGNJmrQ6t4cvklnQgmE9eS4T
         iGcf37S/qK8xWzgkJshUNWVa7gfqKyMSR7BMTUPL2+xZ79GepRR/nkctuOwUIlrf3MpZ
         ki3CARRQrQl22IQJKOm4gKwtBg547HammE6qRpYYMWAfRGO6vjV5Cvx1ImzO2xlkHdqr
         tjUEDkQuHjWW+wkCtPqe7e5uYpnP6M3JBdBplGFuECx5dOtPEfZPrl+TPOiC+KpX13st
         LRaw==
X-Forwarded-Encrypted: i=1; AJvYcCWeVyfbM60aPDk+ZWkAIsZUVADUxutDbBTOLcjjRd01kcv9XrDAbVIXCqkG2IpCrZAiwtE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzm1G7Em+fKlVM9qvsIdI4OKodf4Y93JyBwH/LcIiBIC4Y9kE0T
	b48RUqBkmKDyl0lTJZsd4DH0ER02yTJZfSDMZZe8YbxjDtq+OWILXvhJUfZnyXXbb7VRwXRImmY
	Ik4U/ebOerZEaWL/PS2UBeO2KwMwTsjhNQiRHYVLntA==
X-Gm-Gg: ASbGncvi/WWE6zzzc7/zxdveA+B1eelzv3SlsUBdzFTC6AgB7oJpM92eA8UeTkk9iWF
	tycVSj4YMbuwd6szUwfB3uLpxqGeR8AMkMpFDPA0Hke47tBNiXuS0d/NoGzMHjqUYW4n7vCK2M9
	jQItozOaiTma+EMexsrxdnS+v4mumDTg==
X-Google-Smtp-Source: AGHT+IGWeHbdh3O/z4F1SRgYEltcGRfcEHSD7V4hOn6ole1VQ4KjcZtPvIWPOt0TiMXPWHw0tvG0AyUJrHsqEFKBpiA=
X-Received: by 2002:a05:6902:1546:b0:e7d:8eee:ae8f with SMTP id
 3f1490d57ef6-e81a22b0e19mr21079312276.19.1749481704110; Mon, 09 Jun 2025
 08:08:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com> <174948105106.2282643.172324663412189128.robh@kernel.org>
In-Reply-To: <174948105106.2282643.172324663412189128.robh@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 9 Jun 2025 17:08:12 +0200
X-Gm-Features: AX0GCFu7PzsfDvF842eUkzXyordNhd1acsYRKIzmAppp3qtvrKjzob8AA4_bZEY
Message-ID: <CABGWkvpv-0QjAgz_j3QMJvSO0gpzxY07GpkT0SWL1zEY0Y_ufg@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] Support Engicam MicroGEA boards
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, 
	Peng Fan <peng.fan@nxp.com>, Russell King <linux@armlinux.org.uk>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Marek Vasut <marex@denx.de>, 
	Dmitry Baryshkov <lumag@kernel.org>, Stefan Eichenberger <stefan.eichenberger@toradex.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Eric Biggers <ebiggers@google.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Fabio Estevam <festevam@denx.de>, 
	Matteo Lisi <matteo.lisi@engicam.com>, 
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>, 
	Primoz Fiser <primoz.fiser@norik.com>, Max Merchel <Max.Merchel@ew.tq-group.com>, 
	Michael Walle <mwalle@kernel.org>, Tim Harvey <tharvey@gateworks.com>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	Markus Niebel <Markus.Niebel@tq-group.com>, linux-amarula@amarulasolutions.com, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Francesco Dolcini <francesco.dolcini@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Mon, Jun 9, 2025 at 5:01=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
>
> On Mon, 09 Jun 2025 12:15:33 +0200, Dario Binacchi wrote:
> > The series adds support for Engicam MicroGEA boards:
> >
> > - BMM
> > - RMM
> > - GTW
> >
> > based on MicroGEA-MX6UL SoM.
> >
> > Changes in v2:
> > - Change local-mac-address to 00 00 00 00 00 00. The actual value will
> >   be set by the bootloader. The previous one was assigned to Freescale
> >   Semiconductor.
> > - Move iomuxc and iomuxc_snvs nodes to the end of the DTS files.
> > - Drop an extra blank line from the DTS file.
> >
> > Dario Binacchi (10):
> >   dt-bindings: arm: fsl: support Engicam MicroGEA BMM board
> >   ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
> >   ARM: dts: imx6ul: support Engicam MicroGEA BMM board
> >   ARM: imx_v6_v7_defconfig: cleanup mxs_defconfig
> >   ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
> >   dt-bindings: arm: fsl: support Engicam MicroGEA RMM board
> >   ARM: dts: imx6ul: support Engicam MicroGEA RMM board
> >   dt-bindings: arm: fsl: support Engicam MicroGEA GTW board
> >   ARM: dts: imx6ul: support Engicam MicroGEA GTW board
> >   ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503
> >
> >  .../devicetree/bindings/arm/fsl.yaml          |   9 +
> >  arch/arm/boot/dts/nxp/imx/Makefile            |   3 +
> >  .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  | 305 +++++++++++++++
> >  .../nxp/imx/imx6ull-engicam-microgea-gtw.dts  | 163 ++++++++
> >  .../nxp/imx/imx6ull-engicam-microgea-rmm.dts  | 362 ++++++++++++++++++
> >  .../dts/nxp/imx/imx6ull-engicam-microgea.dtsi |  96 +++++
> >  arch/arm/configs/imx_v6_v7_defconfig          |  27 +-
> >  7 files changed, 944 insertions(+), 21 deletions(-)
> >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-=
bmm.dts
> >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-=
gtw.dts
> >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-=
rmm.dts
> >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.=
dtsi
> >
> > --
> > 2.43.0
> >
> > base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> > branch: imx6ull-engicam-microgea
> >
> >
>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi.

Yes, these warnings are generated by included .dtsi files and also appear i=
n
other boards that have already been merged into mainline.
IMHO I have already addressed and fixed the warnings introduced by my board=
s
during the tests executed before submitting the series.

Thanks and regards,
Dario

> Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>   pip3 install dtschema --upgrade
>
>
> This patch series was applied (using b4) to base:
>  Base: using specified base-commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94
>
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm/boot/dts/nxp/' for=
 20250609101637.2322809-1-dario.binacchi@amarulasolutions.com:
>
> arch/arm/boot/dts/nxp/imx/imx6ull-colibri-aster.dtb: cpu@0 (arm,cortex-a7=
): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc=
-supply' were unexpected)
>         from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dtb: cpu@0 (arm,co=
rtex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points=
', 'soc-supply' were unexpected)
>         from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dtb: nand-controll=
er@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('=
nand-ecc-mode', 'nand-ecc-step-size', 'nand-ecc-strength', 'nand-on-flash-b=
bt' were unexpected)
>         from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml=
#
> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dtb: cpu@0 (arm,co=
rtex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points=
', 'soc-supply' were unexpected)
>         from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dtb: nand-controll=
er@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('=
nand-ecc-mode', 'nand-ecc-step-size', 'nand-ecc-strength', 'nand-on-flash-b=
bt' were unexpected)
>         from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml=
#
> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dtb: cpu@0 (arm,co=
rtex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points=
', 'soc-supply' were unexpected)
>         from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dtb: nand-controll=
er@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('=
nand-ecc-mode', 'nand-ecc-step-size', 'nand-ecc-strength', 'nand-on-flash-b=
bt' were unexpected)
>         from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml=
#
>
>
>
>
>


--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
