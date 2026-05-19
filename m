Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BCD409612
	for <imx@lists.linux.dev>; Tue, 19 May 2026 13:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779197007; cv=none; b=DB1cRCJ6MAZ5FELVHsnQKqWRZxULhpyylUlh1bu3TKHYSeWHPRqWsQ9oGyiAtdZTABq3SfXNyqKV6oztvdEyZQ2+BRzen6I+fc14DvOe0ivGNoTySX+V1RtPKBnMrXKimdGjg7AED8aURJY3nlJ94aiRw1tUjjJu5dPjUBIJVP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779197007; c=relaxed/simple;
	bh=P0R1xOsfpQqki1vEBgvaHmTz6ftpxthYcxHuok2B86M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r+0jmAO936tPlZbK6Gg7iwPE1d+iFd5A+vE1HDpfjpuz1OoGUyVTqY/OBtnwFhw2YprTPfdB2twXy6hpNLE/SCiRj8vwXPJ0EN/2xS3/w8ttgJKdsCEyzeHH7pH30DKG7q1srH8vYgUUUmrtKPUTc17u7KyIH4mPbdazNf/lcas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TmV1RHfh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TmV1RHfh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779197005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vSZwixHkv2muy60wUJhbvc6cwMeXT0Usg6Pp1th8RbU=;
	b=TmV1RHfhOxRgdlJZe2p9hfrbHYw9qYCC9nTMf5G+wQ24zzh8fsgQglTVbq48C0UtchdbWr
	I+19+EKVfWZdj4/Rs1VLSdiPoZLmwch6XbsYaNab/UcBp7oMOmn5+Jxa6SohzUzIjUyrfH
	tWZqWAZAaSV7OGQEPENo9FBQ/exwHN0=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-mMQpNyyUO8i93tJM6w18-w-1; Tue, 19 May 2026 09:23:22 -0400
X-MC-Unique: mMQpNyyUO8i93tJM6w18-w-1
X-Mimecast-MFC-AGG-ID: mMQpNyyUO8i93tJM6w18-w_1779197001
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5a8d72e2f0aso260021e87.2
        for <imx@lists.linux.dev>; Tue, 19 May 2026 06:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779197000; x=1779801800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vSZwixHkv2muy60wUJhbvc6cwMeXT0Usg6Pp1th8RbU=;
        b=TcbqltcWtVszSmc8mbx8HWoqXCeuCqV6i7mZetprAlgPA1XP1GYldBZrLFpfJqUX5r
         ajoZb44G7NBKhfw1J9L9SSKn0U1IOmwWHYNZ5yt85jGg+eOcfzuWao/btKWyhAqQ2BIz
         MA48tFbPKxTOrBNf7WFBx/A5twkbIt/j3IYNQC9bp7US8bu9zxmFnalwr0qCDI1x3zhd
         ReH4sehVzV2wpxnCq3yiuGKOn9CeHwY6d9F9VNSYzvr0hXsiaRpY/co2M4aEB988QsfA
         tnZX0iRg4xCDBYgnFX/tjp5WXvMbcgWxFbJoDG538KqXIdaNCw+6zprd8C6byCrSkNyK
         xWig==
X-Forwarded-Encrypted: i=1; AFNElJ+N/2JWwz7mqt6Xo8/Bi7GEyttcHgmh3pSqFpXPjwrFT4VSMDBbp4b8OTh0OMpMw5yxaXk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx67I6djTaCmXBF1DEcJ3GOg8uvHwt8xKHRIVcHimWvUh5dz51Q
	5ibiSXrX07uJs3AzdUDzFiSaCjIOuXnwFgEPZ1rH2nVzk1jLNEZp5c4kfirqyfknkq1Qwntl25C
	TDDNA+SFTY0CyevWb98uW+FKikObhpaCISaXtEfxeIz9w7UW+eK9E9NkUkasFpavY+c4xPDxZT2
	X5RsXRy14h/1okk5UqdbHHsPYTOeZ5
X-Gm-Gg: Acq92OH+jg7GxjxDN+S1cXUUszxgbiYAuFapASEr5kDHqY8lj8fFsxxzW75L1PMSN/D
	vmybCxDFGy/ikChGUUccm7omePyAg+7nsKNRevp+2s3FvjIiTAr6/7P/zoYS1NLHe2m1HkS/P8s
	YuryE+uvIfma49IdrM6zIlEMr4dn3TzAnUHSj0rSan/NZT3yRDLae+/M80Nq7o4UZEwSVv6pqsE
	2Uu3w==
X-Received: by 2002:a05:651c:881:b0:395:9f86:b433 with SMTP id 38308e7fff4ca-3959f86b5bamr7821371fa.6.1779197000480;
        Tue, 19 May 2026 06:23:20 -0700 (PDT)
X-Received: by 2002:a05:651c:881:b0:395:9f86:b433 with SMTP id
 38308e7fff4ca-3959f86b5bamr7821311fa.6.1779196999921; Tue, 19 May 2026
 06:23:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518063547.2890353-1-khristineandreea.barbulescu@oss.nxp.com> <20260518063547.2890353-2-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260518063547.2890353-2-khristineandreea.barbulescu@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Tue, 19 May 2026 15:23:08 +0200
X-Gm-Features: AVHnY4Ku0WK3_tTMCuY00U13A1ewKmhxwVXJEJLHH0cS_8oPrxB1SflVfjvcxDY
Message-ID: <CALE0LRss3eXM-+sA9VzpvKnv-UsHh0X_SWBRBYKDP3-1i=svsw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: s32g: add PIT support for s32g2 and s32g3
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E5mkU9bttdOjti5maQ55R4zMxwODXAxzZqk7fj4XF6I_1779197001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Somewhat related I'd appreciate a review to:

https://lore.kernel.org/all/20260514-fix-nxp-timer-v3-1-a3e68fdb505e@redhat=
.com/

The changes looks good to me, so

On Mon, May 18, 2026 at 8:36=E2=80=AFAM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:
>
> Add PIT0 and PIT1 for S32G2 and S32G3 SoCs
>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>

Reviewed-by: Enric Balletbo i Serra <eballetb@redhat.com>

Thanks,
   Enric

> ---
>  arch/arm64/boot/dts/freescale/s32g2.dtsi | 20 +++++++++++++++++++-
>  arch/arm64/boot/dts/freescale/s32g3.dtsi | 20 +++++++++++++++++++-
>  2 files changed, 38 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g2.dtsi
> index 51d00dac12de..57ff97e44507 100644
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
> @@ -417,6 +417,15 @@ edma0: dma-controller@40144000 {
>                         clock-names =3D "dmamux0", "dmamux1";
>                 };
>
> +               pit0: pit@40188000 {
> +                       compatible =3D "nxp,s32g2-pit";
> +                       reg =3D <0x40188000 0x3000>;
> +                       interrupts =3D <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&clks 61>;
> +                       clock-names =3D "pit";
> +                       status =3D "disabled";
> +               };
> +
>                 can0: can@401b4000 {
>                         compatible =3D "nxp,s32g2-flexcan";
>                         reg =3D <0x401b4000 0xa000>;
> @@ -622,6 +631,15 @@ edma1: dma-controller@40244000 {
>                         clock-names =3D "dmamux0", "dmamux1";
>                 };
>
> +               pit1: pit@40288000 {
> +                       compatible =3D "nxp,s32g2-pit";
> +                       reg =3D <0x40288000 0x3000>;
> +                       interrupts =3D <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&clks 61>;
> +                       clock-names =3D "pit";
> +                       status =3D "disabled";
> +               };
> +
>                 can2: can@402a8000 {
>                         compatible =3D "nxp,s32g2-flexcan";
>                         reg =3D <0x402a8000 0xa000>;
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g3.dtsi
> index e314f3c7d61d..efe5398e1240 100644
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
> @@ -475,6 +475,15 @@ edma0: dma-controller@40144000 {
>                         clock-names =3D "dmamux0", "dmamux1";
>                 };
>
> +               pit0: pit@40188000 {
> +                       compatible =3D "nxp,s32g3-pit", "nxp,s32g2-pit";
> +                       reg =3D <0x40188000 0x3000>;
> +                       interrupts =3D <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&clks 61>;
> +                       clock-names =3D "pit";
> +                       status =3D "disabled";
> +               };
> +
>                 can0: can@401b4000 {
>                         compatible =3D "nxp,s32g3-flexcan",
>                                            "nxp,s32g2-flexcan";
> @@ -693,6 +702,15 @@ edma1: dma-controller@40244000 {
>                         clock-names =3D "dmamux0", "dmamux1";
>                 };
>
> +               pit1: pit@40288000 {
> +                       compatible =3D "nxp,s32g3-pit", "nxp,s32g2-pit";
> +                       reg =3D <0x40288000 0x3000>;
> +                       interrupts =3D <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&clks 61>;
> +                       clock-names =3D "pit";
> +                       status =3D "disabled";
> +               };
> +
>                 can2: can@402a8000 {
>                         compatible =3D "nxp,s32g3-flexcan",
>                                            "nxp,s32g2-flexcan";
> --
> 2.34.1
>

