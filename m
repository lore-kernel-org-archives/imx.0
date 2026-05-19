Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D273161BE
	for <imx@lists.linux.dev>; Tue, 19 May 2026 11:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779191161; cv=none; b=bmRy3wJJpmQ9fzERjJyBJ6j+QzitTzniC7IFVBqqBpFZ1BBw62/ylWUdwUVXb70iMbVRs8ZHZklQBUTUy9GqSmUlnWMP6SQ8fvhRhC/94v+lIvhAT6/IwQjuSjaVOg0tvx36prjF1cLr4bPG85+TUqxVWLZr2mwQIY2vn+0MUeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779191161; c=relaxed/simple;
	bh=A8+zKWqKk7YrwMcoc1LvkIW72eVnzUrlq3AoF3y+mTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OQaNgcbzVZq0cDt9HvyqRZttkAy+BcuDucaeqfGzERNU+0vPM43Uy0uQNZw3opNPxJ+mH0Xp08pwdSs/6TCXUDnfJE3jh4pfpmeLTi4/rjtUAWIheRKAzIluOMrsz3jz2SJjPV/S6p77Jjiy+uqdt0loOFMB/LGVVGe7QVrty14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R50bjz93; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R50bjz93"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779191159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nbjFHJj+U7uIM+Cg25ETbUEUNoe3mdFwTNg+mtbLNPk=;
	b=R50bjz93MXTU6plflSgP2w6VgriLo/zF2L8G/s8DMvVWGQ0m7MjaPwbLCRkqFB1w2TsC+q
	bOGC0lp9BkajXHsN+lzOm/K6zex55XUGKO6Z100nFoYXoZAleCNRR002TU03unZ3eWi6yW
	v/SVCndWj12PliMy8y8LoApaLqKlIJw=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-BsP5Nq7ANIqWqgvd2LEiCQ-1; Tue, 19 May 2026 07:45:57 -0400
X-MC-Unique: BsP5Nq7ANIqWqgvd2LEiCQ-1
X-Mimecast-MFC-AGG-ID: BsP5Nq7ANIqWqgvd2LEiCQ_1779191156
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5a870f93c99so321249e87.0
        for <imx@lists.linux.dev>; Tue, 19 May 2026 04:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779191156; x=1779795956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nbjFHJj+U7uIM+Cg25ETbUEUNoe3mdFwTNg+mtbLNPk=;
        b=BhVaoFlZx9vAwT4CjnbU0TYQ/5CFZAW282yM+W9iqG2QuyrNl7F8Hg3JiXZRtpUrMw
         achpi5ziq9LKI9nKUCLzcYO7YwfmXP3CinnSad6HbpOzuhYcy5aobIzkaoowZPe14SOy
         tQWMH97IjitK1Vo9sY/IT58YqZdUwaMX8z3b3g5ZNMU4/ES4l1VpSnoLruPQc6zi1iU1
         nH/KodyX1scG9U+jveKT0F+s7M1mtK7sIjPVkaf4rJCCf/I4nYmMop7h7FRs0oCxitNl
         vCBlMWZ/Jm2yJWhiEX+MSNhjygXB/jFAc19t6A3Jffx1S+1s3tNlIFiNhu5xsuNGjSaN
         Lh3w==
X-Forwarded-Encrypted: i=1; AFNElJ9L+/2fnPBc1Df1ufa+b9tBakUzXayNRkL3aV6i8XaWHM2ahVIH3mR5WhnpW1KEKsI8cTc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz77kxzvppm6a6mbGJT3uG1jzOGo8EA2Yp4JgECi/MkRWrglYaH
	7S1cCpUlXmb/wg0PEv2U2lb0DotQ+zzIVlmj6SfhXO1Csr1cMC/0XOzwKXKEl9xSaFU0cxOWIwv
	04KT/zKhDj5brvee6h9FVDxWkIT6rNQ7hpojPP+s3bgcVHduqBk4GvAyHco/GZeZGlE1wfDxnT2
	94De7qiO7CpNcFC1afAAUubZXgS9bD
X-Gm-Gg: Acq92OGWhKoaW9AGI+vP7IfS6+VR1USaRMw2err/pws175klYB4YFPz1vnT+QFNNqzz
	IevT1Lh7vzi+7nDNIVIr+fNZ/U2+7FWkfK7rrHUlx6tZ5izEf7QayNK21BGMAUGCUDyE3qtqhzJ
	b1vWZ8DjjA/5Lks5YnDjCX+EULT/+aZh8xNpongrpKFXA0wTE/uUWT3Sr50V0OziNyWgEII8y5s
	AYmMA==
X-Received: by 2002:a05:651c:548:b0:393:9110:fbac with SMTP id 38308e7fff4ca-39561d12c2cmr26805771fa.1.1779191156011;
        Tue, 19 May 2026 04:45:56 -0700 (PDT)
X-Received: by 2002:a05:651c:548:b0:393:9110:fbac with SMTP id
 38308e7fff4ca-39561d12c2cmr26805691fa.1.1779191155534; Tue, 19 May 2026
 04:45:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518061522.2884441-1-khristineandreea.barbulescu@oss.nxp.com> <20260518061522.2884441-2-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260518061522.2884441-2-khristineandreea.barbulescu@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Tue, 19 May 2026 13:45:44 +0200
X-Gm-Features: AVHnY4IsU7fSSnNgUDdmrpcWXb8rpRp3nIWviV63aNNWwk4kg6ZdkU34h4HNbeA
Message-ID: <CALE0LRtt8w6cAoCqKt-9YCuvjbVE95NdQPq3gXqRg-jhxKO4HA@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: Add usbphynop and usbotg pinctrl for S32G platforms
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 84Cr6fiNT_F1vxONQ_x8FYL_a4TdXwgLLp0cIL7yAYs_1779191156
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thank you for the patch.

On Mon, May 18, 2026 at 8:15=E2=80=AFAM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:
>
> Add the usbphynop node and the usbotg pinctrl
> support for the S32G2 and S32G3 SoCs.
>
> This enables the USB controller to reference the
> generic PHY and use the required pinmux for USB OTG ops.
>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>
> ---
>  .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 53 ++++++++++++++++++-
>  .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 53 ++++++++++++++++++-
>  2 files changed, 104 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64=
/boot/dts/freescale/s32gxxxa-evb.dtsi
> index 803ff4531077..d096744cdb0f 100644
> --- a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> @@ -1,12 +1,19 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * Copyright 2024 NXP
> + * Copyright 2024, 2026 NXP
>   *
>   * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>   *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
>   *          Larisa Grigore <larisa.grigore@nxp.com>
>   */
>
> +/ {
> +       usbphynop: usbphynop {
> +               compatible =3D "usb-nop-xceiv";
> +               #phy-cells =3D <0>;
> +       };
> +};

I'm wondering if it it would be more appropriate in the SoC-level dtsi
(s32g2.dtsi/s32g3.dtsi), similar to other Freescale boards,it doesn't
represent any board-specific hardware but a virtual NOP transceiver
used by the SoC.

> +
>  &pinctrl {
>         can0_pins: can0-pins {
>                 can0-grp0 {
> @@ -245,6 +252,39 @@ dspi5-grp4 {
>                         bias-pull-up;
>                 };
>         };
> +
> +       usbotg_pins: usbotg_pins {
> +               usbotg_grp0 {

The label can remain usbotg_pins but node names should use hyphens

usbotg_pins: usbotg-pins {
    usbotg-grp0 {

You can run this to catch this kind of issues:

make W=3D1 CHECK_DTBS=3Dy ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu-
freescale/s32g399a-rdb3.dtb


> +                       pinmux =3D <0x3802>, <0x3812>,
> +                               <0x3822>, <0x3832>,
> +                               <0x3842>, <0x3852>,
> +                               <0x3862>, <0x3872>,
> +                               <0x37f2>, <0x3882>,
> +                               <0x3892>;
> +               };
> +
> +               usbotg_grp1 {
> +                       pinmux =3D <0x3e1>, <0x3f1>,
> +                               <0x401>, <0x411>,
> +                               <0xbc1>, <0xbd1>,
> +                               <0xbe1>, <0x701>;
> +                       output-enable;
> +                       input-enable;
> +                       slew-rate =3D <208>;
> +               };
> +
> +               usbotg_grp2 {
> +                       pinmux =3D <0xb80>, <0xb90>, <0xbb0>;
> +                       input-enable;
> +                       slew-rate =3D <208>;
> +               };
> +
> +               usbotg_grp3 {
> +                       pinmux =3D <0xba1>;
> +                       output-enable;
> +                       slew-rate =3D <208>;
> +               };
> +       };
>  };
>
>  &can0 {
> @@ -304,3 +344,14 @@ &spi5 {
>         pinctrl-names =3D "default";
>         status =3D "okay";
>  };
> +
> +&usbmisc {
> +       status =3D "okay";
> +};
> +
> +&usbotg {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&usbotg_pins>;
> +       fsl,usbphy =3D <&usbphynop>;

According to the binding this option is deprecated. Could you use
"phys" instead?

> +       status =3D "okay";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi b/arch/arm64=
/boot/dts/freescale/s32gxxxa-rdb.dtsi
> index 979868f6d2c5..b756bcf6469d 100644
> --- a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
> @@ -1,12 +1,19 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * Copyright 2024 NXP
> + * Copyright 2024, 2026 NXP
>   *
>   * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>   *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
>   *          Larisa Grigore <larisa.grigore@nxp.com>
>   */
>
> +/ {
> +       usbphynop: usbphynop {
> +               compatible =3D "usb-nop-xceiv";
> +               #phy-cells =3D <0>;
> +       };
> +};
> +
>  &pinctrl {
>         can0_pins: can0-pins {
>                 can0-grp0 {
> @@ -199,6 +206,39 @@ dspi5-grp4 {
>                         bias-pull-up;
>                 };
>         };
> +
> +       usbotg_pins: usbotg_pins {
> +               usbotg_grp0 {

ditto

> +                       pinmux =3D <0x3802>, <0x3812>,
> +                               <0x3822>, <0x3832>,
> +                               <0x3842>, <0x3852>,
> +                               <0x3862>, <0x3872>,
> +                               <0x37f2>, <0x3882>,
> +                               <0x3892>;
> +               };
> +
> +               usbotg_grp1 {
> +                       pinmux =3D <0x3e1>, <0x3f1>,
> +                               <0x401>, <0x411>,
> +                               <0xbc1>, <0xbd1>,
> +                               <0xbe1>, <0x701>;
> +                       output-enable;
> +                       input-enable;
> +                       slew-rate =3D <208>;
> +               };
> +
> +               usbotg_grp2 {
> +                       pinmux =3D <0xb80>, <0xb90>, <0xbb0>;
> +                       input-enable;
> +                       slew-rate =3D <208>;
> +               };
> +
> +               usbotg_grp3 {
> +                       pinmux =3D <0xba1>;
> +                       output-enable;
> +                       slew-rate =3D <208>;
> +               };
> +       };
>  };
>
>  &can0 {
> @@ -257,3 +297,14 @@ &i2c4 {
>         pinctrl-1 =3D <&i2c4_gpio_pins>;
>         status =3D "okay";
>  };
> +
> +&usbmisc {
> +       status =3D "okay";
> +};
> +
> +&usbotg {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&usbotg_pins>;
> +       fsl,usbphy =3D <&usbphynop>;

ditto

> +       status =3D "okay";
> +};
> --
> 2.34.1
>

