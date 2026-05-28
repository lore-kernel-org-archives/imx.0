Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5523F86EE
	for <imx@lists.linux.dev>; Thu, 28 May 2026 13:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779975423; cv=none; b=u/9kcc5jJPaXr4pBZEO+Ggm7jf3XQfRd50NPf67uOCy4P9ejqsgkxXZoKrnxQyQMUaq/qRcWq8pHDVvw6Y/7oEFosft0qf3qz+pOnS7TalBCeQJ6ifDcaS5KAoq/jtX0hVDj1M13xZVYr7sqr4CATEnMBSM2698upCzjdKm0xhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779975423; c=relaxed/simple;
	bh=vurN08ldMD5PGiITwUyxIe/EslL+gOu64WFiyfSA5jg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ODiBO5I4WhgHPwwp6XhQqRdBffd/IBkZrRtgo0bLhDxUTu0l6twqtkR4Ffl8W2u8gejqWi5BDWDMnJ++//r9torhonj5odX9YTw3Q7kvUN3X0jDdFGOArHWWgLHqwBaeN4BqVqwJXqxFIvevixf2WrXgfHO1d7lk3gEQLwCstTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D6nDT2RS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D6nDT2RS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779975421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/lfVZp7HWqHjRqZVVhy7Ez9cx3BFg0k+dK3nLg7M60A=;
	b=D6nDT2RSiIcjllQUb/LjFaCyeQ1os3intL9y+N5nbasvR4/cmMefy33Yo1sKG20FW6dbg4
	4KmlB5VcmrWDrpBqZlm6ezjHTa669T+jCz9pMFqUzzzBmBDcooe6MfV56yj7UnUKJgTxTm
	hVoPo0VAy9wfVFWvnfooRbU2kZcTiLM=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619--scVkY_XPh2kMWBXfBT3pw-1; Thu, 28 May 2026 09:36:58 -0400
X-MC-Unique: -scVkY_XPh2kMWBXfBT3pw-1
X-Mimecast-MFC-AGG-ID: -scVkY_XPh2kMWBXfBT3pw_1779975417
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5a3fe7e7c94so727653e87.3
        for <imx@lists.linux.dev>; Thu, 28 May 2026 06:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779975417; x=1780580217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/lfVZp7HWqHjRqZVVhy7Ez9cx3BFg0k+dK3nLg7M60A=;
        b=OFCyo2xFNxisPaD/NrSis/CeJev6tphDkFbzCNZXHIrtz0yYNaB3MeQJuVgqdUNRuU
         /DO97cCDda0iEkaHcetf7VjV1ffjIyjmQPJgRkv4FiGvx64imJGAnHCCR1ll26ckJxQf
         2I5X6BlVQSjfHGookdmDR9MpqCswqge4DOca7V3sIdVgd+8HLDSdNZQAPA9mMygIunUo
         26oaH9CIj7UMjZzfolddbm1ozKcGmwLgib9wYwh143Moj3qrWL35Qg81FkgKdb44UZT5
         XIcaq1fXDT7+1kWGcuA5G0ih5APjm5uvS/j3On8MRQVT9XTzST2aaNS18IrZ2BtuQRWR
         hJYA==
X-Forwarded-Encrypted: i=1; AFNElJ91eLfbvejg74vUeO+s+B2xQDGweOz0+Xk4LYwWocPNra6BKf3RyfQ/5ztaHwczOjn2SS8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz78QMHKFA6isFv9FGWyqAPCrLUrO+g5Ivk2lm/2kLVQf3+sdRX
	8yqoLSJlNrVj5Tgq9cJM8EcA4an7fl2qmccH+wXGqkpRzjuGrYwzn/hWrjI7Tr+Z2u/jeC3s7rZ
	5gmtyPur2j8mOxmg+qTyNmPo+54/seauOrKVXRmM4bWcw9/+H5JZuEhKjYHpCd4HHbNJe4swtI0
	6nkDXKPPAqqt0qvGKO1O77cUj94vZY
X-Gm-Gg: Acq92OFFZ8yBPo1RmRaNLGIsC+oOssMssReoZOS78mcW75I7Am1M7dfuhZt50V8kSDH
	E43MrYppiI+ICX3fxPkFPAOed9p8K3qW5tIUtqguphzeS1UGyr8/pD/NVJucI8LRo19aZJjrRiX
	inu78mw6T/VWuhiACi6ombDkkmLiBXxQYn/UYHstgOy5bikKeaF1OgvtUeqskkiTv9CppBal8ol
	kq9lErqaO5eNv0J
X-Received: by 2002:a05:651c:210b:b0:393:5904:7411 with SMTP id 38308e7fff4ca-3963aeeaf73mr5032821fa.3.1779975416767;
        Thu, 28 May 2026 06:36:56 -0700 (PDT)
X-Received: by 2002:a05:651c:210b:b0:393:5904:7411 with SMTP id
 38308e7fff4ca-3963aeeaf73mr5032791fa.3.1779975416222; Thu, 28 May 2026
 06:36:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260528083213.1399401-1-khristineandreea.barbulescu@oss.nxp.com> <20260528083213.1399401-2-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260528083213.1399401-2-khristineandreea.barbulescu@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Thu, 28 May 2026 15:36:43 +0200
X-Gm-Features: AVHnY4JWVlWlJ0EWffurf2OBWBeheI9s2tuuUOn2kqYHXaCLBerPUHpYRJVoR8U
Message-ID: <CALE0LRs_8oT+sagUm95uXhfdf28iHO+f-Wwo0DrBp8DK_PaiJA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: s32g: add PWM support for s32g2 and s32g3
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y3VO7At5fbeq2TiT-4O-61nFbyonliPKOohEyjnNywg_1779975417
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khristine,

Thank you for the patch.

On Thu, May 28, 2026 at 10:32=E2=80=AFAM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:
>
> Add PWM0 and PWM1 for S32G2 and S32G3 SoCs
>
> Issue: ALBSP-1959

You must remove the vendor-internal issue tracker reference before
submitting upstream.

> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/s32g2.dtsi      | 28 ++++++-
>  arch/arm64/boot/dts/freescale/s32g3.dtsi      | 30 ++++++-
>  .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 78 ++++++++++++++++++-
>  3 files changed, 133 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g2.dtsi
> index 51d00dac12de..907cf74e61f3 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -3,7 +3,7 @@
>   * NXP S32G2 SoC family
>   *
>   * Copyright (c) 2021 SUSE LLC
> - * Copyright 2017-2021, 2024-2025 NXP
> + * Copyright 2017-2021, 2024-2026 NXP

I see this is updated on every patch you recently submitted. While
this trivial conflict is easy to fix, it can be annoying. I suggest
creating a series with all the recent device-tree changes submitted
lately to facilitate the maintainers' work.

Other than the first comment I made, once that's fixed, you can add my:

Reviewed-by: Enric Balletbo i Serra <eballetb@redhat.com>

Thanks,
  Enric


>   */
>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -554,6 +554,19 @@ i2c2: i2c@401ec000 {
>                         status =3D "disabled";
>                 };
>
> +               pwm0: pwm@401f4000 {
> +                       compatible =3D "nxp,s32g2-ftm-pwm";
> +                       reg =3D <0x401f4000 0x1000>;
> +                       #pwm-cells =3D <3>;
> +                       clocks =3D <&clks 5>,
> +                                <&clks 6>,
> +                                <&clks 5>,
> +                                <&clks 5>;
> +                       clock-names =3D "ftm_sys", "ftm_ext",
> +                                     "ftm_fix", "ftm_cnt_clk_en";
> +                       status =3D "disabled";
> +               };
> +
>                 swt4: watchdog@40200000 {
>                         compatible =3D "nxp,s32g2-swt";
>                         reg =3D <0x40200000 0x1000>;
> @@ -717,6 +730,19 @@ i2c4: i2c@402dc000 {
>                         status =3D "disabled";
>                 };
>
> +               pwm1: pwm@402e4000 {
> +                       compatible =3D "nxp,s32g2-ftm-pwm";
> +                       reg =3D <0x402e4000 0x1000>;
> +                       #pwm-cells =3D <3>;
> +                       clocks =3D <&clks 7>,
> +                                <&clks 8>,
> +                                <&clks 7>,
> +                                <&clks 7>;
> +                       clock-names =3D "ftm_sys", "ftm_ext",
> +                                     "ftm_fix", "ftm_cnt_clk_en";
> +                       status =3D "disabled";
> +               };
> +
>                 usdhc0: mmc@402f0000 {
>                         compatible =3D "nxp,s32g2-usdhc";
>                         reg =3D <0x402f0000 0x1000>;
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g3.dtsi
> index e314f3c7d61d..a4a9e21d1361 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * Copyright 2021-2025 NXP
> + * Copyright 2021-2026 NXP
>   *
>   * Authors: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>   *          Ciprian Costea <ciprianmarian.costea@nxp.com>
> @@ -617,6 +617,20 @@ i2c2: i2c@401ec000 {
>                         status =3D "disabled";
>                 };
>
> +               pwm0: pwm@401f4000 {
> +                       compatible =3D "nxp,s32g3-ftm-pwm",
> +                                    "nxp,s32g2-ftm-pwm";
> +                       reg =3D <0x401f4000 0x1000>;
> +                       #pwm-cells =3D <3>;
> +                       clocks =3D <&clks 5>,
> +                                <&clks 6>,
> +                                <&clks 5>,
> +                                <&clks 5>;
> +                       clock-names =3D "ftm_sys", "ftm_ext",
> +                                     "ftm_fix", "ftm_cnt_clk_en";
> +                       status =3D "disabled";
> +               };
> +
>                 swt4: watchdog@40200000 {
>                         compatible =3D "nxp,s32g3-swt", "nxp,s32g2-swt";
>                         reg =3D <0x40200000 0x1000>;
> @@ -792,6 +806,20 @@ i2c4: i2c@402dc000 {
>                         status =3D "disabled";
>                 };
>
> +               pwm1: pwm@402e4000 {
> +                       compatible =3D "nxp,s32g3-ftm-pwm",
> +                                    "nxp,s32g2-ftm-pwm";
> +                       reg =3D <0x402e4000 0x1000>;
> +                       #pwm-cells =3D <3>;
> +                       clocks =3D <&clks 7>,
> +                                <&clks 8>,
> +                                <&clks 7>,
> +                                <&clks 7>;
> +                       clock-names =3D "ftm_sys", "ftm_ext",
> +                                     "ftm_fix", "ftm_cnt_clk_en";
> +                       status =3D "disabled";
> +               };
> +
>                 usdhc0: mmc@402f0000 {
>                         compatible =3D "nxp,s32g3-usdhc",
>                                      "nxp,s32g2-usdhc";
> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64=
/boot/dts/freescale/s32gxxxa-evb.dtsi
> index 803ff4531077..be7b645afa2d 100644
> --- a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * Copyright 2024 NXP
> + * Copyright 2024, 2026 NXP
>   *
>   * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>   *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> @@ -245,6 +245,70 @@ dspi5-grp4 {
>                         bias-pull-up;
>                 };
>         };
> +
> +       ftm0_pins: ftm0-pins {
> +               ftm0-grp0 {
> +                       pinmux =3D <0x2912>;
> +               };
> +
> +               ftm0-grp1 {
> +                       pinmux =3D <0x122>,
> +                                <0xb42>;
> +                       output-enable;
> +                       input-enable;
> +               };
> +
> +               ftm0-grp2 {
> +                       pinmux =3D <0xb13>,
> +                                <0xb53>;
> +                       output-enable;
> +                       input-enable;
> +               };
> +
> +               ftm0-grp3 {
> +                       pinmux =3D <0x2904>;
> +               };
> +
> +               ftm0-grp4 {
> +                       pinmux =3D <0x2925>;
> +               };
> +
> +               ftm0-grp5 {
> +                       pinmux =3D <0x2936>;
> +               };
> +       };
> +
> +       ftm1_pins: ftm1-pins {
> +               ftm1-grp0 {
> +                       pinmux =3D <0x1d3>;
> +                       output-enable;
> +                       input-enable;
> +               };
> +
> +               ftm1-grp1 {
> +                       pinmux =3D <0x29b4>;
> +               };
> +
> +               ftm1-grp2 {
> +                       pinmux =3D <0x29c3>;
> +               };
> +
> +               ftm1-grp3 {
> +                       pinmux =3D <0x1f4>;
> +                       output-enable;
> +                       input-enable;
> +               };
> +
> +               ftm1-grp4 {
> +                       pinmux =3D <0x202>;
> +                       output-enable;
> +                       input-enable;
> +               };
> +
> +               ftm1-grp5 {
> +                       pinmux =3D <0x29d2>;
> +               };
> +       };
>  };
>
>  &can0 {
> @@ -293,6 +357,18 @@ &i2c4 {
>         status =3D "okay";
>  };
>
> +&pwm0 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&ftm0_pins>;
> +       status =3D "okay";
> +};
> +
> +&pwm1 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&ftm1_pins>;
> +       status =3D "okay";
> +};
> +
>  &spi1 {
>         pinctrl-0 =3D <&dspi1_pins>;
>         pinctrl-names =3D "default";
> --
> 2.34.1
>

