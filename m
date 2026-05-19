Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D492140963D
	for <imx@lists.linux.dev>; Tue, 19 May 2026 13:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779197303; cv=none; b=BfDgb5GCob2clR5Av/gqfgcm+pRjXtVXSeFR/S6JAoKnxyswxR0T2CidPLxftrlT2XQ8u5pE2Wc4qUM+226TWpXEkX3NaKxljR3VehD3pdqyNHoClhlnfFJVJ+oQyKAnhlTJrOW1ByIaXwZ8GA918/yLW9ZQwWIUI+2iqB94Hto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779197303; c=relaxed/simple;
	bh=AJDpfP9UZspHTC3+uZ4OkTygJiOxBWBP3cwoWE7gENs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pu8RotRp7pwEK+YDgfr1mW6aIjlKyqYc5ucJvLuRVTFh1hGmzq3l6GMgoriB6esecoPFVjRtijZxfVsQ3pfmlU+ju/ZC12ssDhUWh2PgP8HAlkh0Jzz72mjBGpc2edJE3UIqo3IeYDXeEWxRhPBK6IQgp9aNkTzx1DTp2Egw76o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dm7scVGy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dm7scVGy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779197290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u5YvULhhts6qX2IWUm0kkAdZMFsRNKK4rnVt+gyCyWw=;
	b=dm7scVGyFAG63mmKHJxzVmU9fqvQzvsbgilTjBFchj+hgjN/KZg2RdzJKvtfaFoTsxolYH
	gcVL/16Plz87oBhhbM51GTHUaWk1wICyO/UMIgfBgBFxosQf7AwxxZHlT91PZUuoV0zCu9
	d0ppYZYiyj9QFahVabaL0Z3zfKjevr4=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-Y4GrAxDWPtyfv9DgLL44_A-1; Tue, 19 May 2026 09:28:09 -0400
X-MC-Unique: Y4GrAxDWPtyfv9DgLL44_A-1
X-Mimecast-MFC-AGG-ID: Y4GrAxDWPtyfv9DgLL44_A_1779197288
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5a86b49dfc9so256271e87.3
        for <imx@lists.linux.dev>; Tue, 19 May 2026 06:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779197288; x=1779802088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u5YvULhhts6qX2IWUm0kkAdZMFsRNKK4rnVt+gyCyWw=;
        b=qW6VYojXERO2sROAXxgX/TFkDvRxnoCZV7r1e4wd+nAsvNKvfOhZzCpEDfTmc3mup3
         puwtoQ1FR8B7xqS2Z+Kzg5SEwu9uKfeuhHvmCiu/mav7+cx7FqFY+29TmVPAOGzjH5w/
         cmb63rHsK6j/sdbD0XZNi3lDnyqyEfcb9a94DBXNi3NXSvroXwT+/Fy0TLSFsK92Veh5
         ZEMxUSl3+20CdHi25V4UYdP/EeVMoY5GR29gNF+JWzFPafsrUp6UXwccbzDGmNYA87Ql
         7haJpxa/aHOxXPpcpqLw64wk35BKQrlq9ADW5IRO42h+S2akMCWtRF16u+Jni8DpsUvf
         xf5g==
X-Forwarded-Encrypted: i=1; AFNElJ+DP34GW0/MGxcD6HBKMBPgCMYfFX5qxlYIopE6cb1Mnsu13rDww200iWBwnFi8qcrY+7U=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMcen0MU94LVtXxz7/64itFU3mZy9BowiYo0jN5Rnk4NXWUhFz
	rrVb9mO030zzJ+Oaux0gXXfzuV3mvc+D/p9r+BIaa1LKFX93LURbdbko1xnSQkcYlUUIbAD5jjn
	ezMa5bsVs/U3E3rDDXMkNMdEUvaqk6nRLh4xgDE4Q74j1XFVGcD0L4V0dk8vACKtHuKSqRIMuOZ
	SFapGZDZy9fJ6ft22ixjYMT23YlhCw
X-Gm-Gg: Acq92OFH3vimhmD1G13+/ExHf6Q2YuZaEapYMjVpwamPkR43PF1rpCQ25Fb6zGRkYYM
	poSvFZr9ZcmqPbXjAMZ1lnckYS7pjlNl8uqzTE5h67MoEQij5IysjCm7gbl8mzj2hwLusRiCmr5
	yQgBfRhKyiIzrXkLKubcBkwZNy88F0OjMjWe1e11FvJFBcELOZbABcGiSWYe+i20xrsXtXZc0Mj
	VxtKQ==
X-Received: by 2002:a05:6512:3409:b0:5a8:7396:63e3 with SMTP id 2adb3069b0e04-5aa0e74a2cdmr2307645e87.5.1779197287923;
        Tue, 19 May 2026 06:28:07 -0700 (PDT)
X-Received: by 2002:a05:6512:3409:b0:5a8:7396:63e3 with SMTP id
 2adb3069b0e04-5aa0e74a2cdmr2307625e87.5.1779197287356; Tue, 19 May 2026
 06:28:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260514082639.1181240-1-khristineandreea.barbulescu@oss.nxp.com> <20260514082639.1181240-2-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260514082639.1181240-2-khristineandreea.barbulescu@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Tue, 19 May 2026 15:27:55 +0200
X-Gm-Features: AVHnY4JqE7oGhtd31y_8FQnK1agHYemkPRFMHImGIc2hHQQvFQ7fi52Nv9jZBbM
Message-ID: <CALE0LRuk2J-BHNytia52xuKm-SU4ukCiP-Ow2rU9bRMfdhh4kg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: s32g: add SAR ADC support for s32g2
 and s32g3
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yjfmCzqmcjcHnP_G4DT-5CEMr4Hj-AvSBsGmRWcPe7c_1779197288
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 14, 2026 at 10:26=E2=80=AFAM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:
>
> Add ADC0 and ADC1 for S32G2 and S32G3 SoCs.
>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>

Reviewed-by: Enric Balletbo i Serra <eballetb@redhat.com>

Thanks,
   Enric

> ---
>  arch/arm64/boot/dts/freescale/s32g2.dtsi | 22 +++++++++++++++++++++-
>  arch/arm64/boot/dts/freescale/s32g3.dtsi | 22 +++++++++++++++++++++-
>  2 files changed, 42 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g2.dtsi
> index 51d00dac12de..6f1952fbbcfe 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -3,7 +3,7 @@
>   * NXP S32G2 SoC family
>   *
>   * Copyright (c) 2021 SUSE LLC
> - * Copyright 2017-2021, 2024-2025 NXP
> + * Copyright 2017-2021, 2024-2026 NXP
>   */
>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -554,6 +554,16 @@ i2c2: i2c@401ec000 {
>                         status =3D "disabled";
>                 };
>
> +               adc0: adc@401f8000 {
> +                       compatible =3D "nxp,s32g2-sar-adc";
> +                       reg =3D <0x401f8000 0x1000>;
> +                       interrupts =3D <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&clks 0x41>;
> +                       dmas =3D <&edma0 0 32>;
> +                       dma-names =3D "rx";
> +                       status =3D "disabled";
> +               };
> +
>                 swt4: watchdog@40200000 {
>                         compatible =3D "nxp,s32g2-swt";
>                         reg =3D <0x40200000 0x1000>;
> @@ -717,6 +727,16 @@ i2c4: i2c@402dc000 {
>                         status =3D "disabled";
>                 };
>
> +               adc1: adc@402e8000 {
> +                       compatible =3D "nxp,s32g2-sar-adc";
> +                       reg =3D <0x402e8000 0x1000>;
> +                       interrupts =3D <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&clks 0x41>;
> +                       dmas =3D <&edma1 1 32>;
> +                       dma-names =3D "rx";
> +                       status =3D "disabled";
> +               };
> +
>                 usdhc0: mmc@402f0000 {
>                         compatible =3D "nxp,s32g2-usdhc";
>                         reg =3D <0x402f0000 0x1000>;
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g3.dtsi
> index e314f3c7d61d..5cfb37c1216a 100644
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
> @@ -617,6 +617,16 @@ i2c2: i2c@401ec000 {
>                         status =3D "disabled";
>                 };
>
> +               adc0: adc@401f8000 {
> +                       compatible =3D "nxp,s32g3-sar-adc", "nxp,s32g2-sa=
r-adc";
> +                       reg =3D <0x401f8000 0x1000>;
> +                       interrupts =3D <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&clks 0x41>;
> +                       dmas =3D <&edma0 0 32>;
> +                       dma-names =3D "rx";
> +                       status =3D "disabled";
> +               };
> +
>                 swt4: watchdog@40200000 {
>                         compatible =3D "nxp,s32g3-swt", "nxp,s32g2-swt";
>                         reg =3D <0x40200000 0x1000>;
> @@ -792,6 +802,16 @@ i2c4: i2c@402dc000 {
>                         status =3D "disabled";
>                 };
>
> +               adc1: adc@402e8000 {
> +                       compatible =3D "nxp,s32g3-sar-adc", "nxp,s32g2-sa=
r-adc";
> +                       reg =3D <0x402e8000 0x1000>;
> +                       interrupts =3D <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&clks 0x41>;
> +                       dmas =3D <&edma1 1 32>;
> +                       dma-names =3D "rx";
> +                       status =3D "disabled";
> +               };
> +
>                 usdhc0: mmc@402f0000 {
>                         compatible =3D "nxp,s32g3-usdhc",
>                                      "nxp,s32g2-usdhc";
> --
> 2.34.1
>

