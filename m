Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0624D2D8364
	for <imx@lists.linux.dev>; Tue, 28 Oct 2025 08:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761639796; cv=none; b=Yd2NkiDfgBocxaOeT9Fesw8wwljbyg2oZgRoqnwBvA87DvcKBApt0lkAd90Q/mydbJDbquycviEdaGUyjnQj1RyXoHCEzDZCOOXFNqWqGAznT4npJtzDVrmdtWzfXuPgkIOo37hxfkTKK3QkDo5CEsxmA0maJTw9KJpG6Yx4YNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761639796; c=relaxed/simple;
	bh=VryWymEyQYFv7D2Zu/J+9UBUYXQJGOTKKyDXEDfPJII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lETr5bs87glA4nFHx0p8ePsSh+7V6yVsP4gRnFxcDVA5nT75ZczVxhSKNu0ZKsoZFkTedQPZEYc1UBIsyk80y/36oQSVttbVyZReLyvzJ3OkPn7c4pvoNzfMRL+MYKj+K/xH+Etq2af3QIpg8KGQ47IT2ziwLs28JfoEB/CiYXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/ULlL6W; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/ULlL6W"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b4f323cf89bso1339064166b.2
        for <imx@lists.linux.dev>; Tue, 28 Oct 2025 01:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761639792; x=1762244592; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uYkrsJvRY/M4MaFVJOdOGBIZ0zXWhOCmDqeRXw+U7YE=;
        b=Y/ULlL6WSSFCNr5ryCo87XXdc+kWPypGtTC8ja5q0SdwLifMLXOxX4wZ/FrU04+F17
         Esqg6yn+9Bja0Tkd9qKijeayXLt3b4Mws9TfZ/EKykDdCxxH4odnLqf1TZD6kaMUUuKX
         1PGxhCOKOggPPMp1kUAYNby4JDtNWdHz4ye9QpabtwvOAi06U4H6TxyAfzSD3L0PfV0H
         6d+mSqsVlU+4Gu0N3do7LQef206TpDqq8a+yIfsClso+8KnXAmtrssBxAu4kdcyJ+AI4
         FTdafuBeofXygbTEGuxbP5bh75NfL9726hdOHkWyH21pd4kGHbBxk89mDXKUOm5hPhDI
         wyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761639792; x=1762244592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYkrsJvRY/M4MaFVJOdOGBIZ0zXWhOCmDqeRXw+U7YE=;
        b=iUAsRq9+dyRRNcISVBJDNwse5uscSd2sHfF2iw1lHo3pgYSYdfUFiGyJayJUOm4aUq
         cRQNHmlN9e4ei1eUI9E1wF0zQZWZRY3pTrV4Y79qktrntaTveM92u7s/7wbKLUR+H/ET
         GLWoQuhg0CYn9SqAaLn9w6h0vPzmWdOGsiPaKNBhxS3B9tLvgPDzbWvqTPkwwOrQCap1
         xQyGnT0Cp+pMBfVEen5EKFNeQoYOJ2m98ITVo0xVxrdtozwBDu/hpQxcUDa2O3G7mgsZ
         PVlco5TbqWkXEAbf+fh49go+enE6hhI7RicibO4pnVhI0pBul6TvIKoADaHthKTYbWTA
         W06Q==
X-Forwarded-Encrypted: i=1; AJvYcCXSzAEae9BJqiExUr/ZkM7+M0c+FVPOsexFzjsH4xSYfIlNP96TwC38LyrgfEo+dM1XHdk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFHlrGjIf1cKwVxSHOSm1MReQnPHWMRfKCvrsJCc7ibdBm5bpy
	fESHb5040LpHShZsqiktIf5Dn+vutqkFh0ud+J0pYYK06fQ3MoBHXs5X
X-Gm-Gg: ASbGncuvoutY2lRwcUGrgRP+6ZUpJqinLWe9rCcqiY/pqxFbaPFk3UxPA6a44iJJlVn
	M3iHAI2z4vcDGc6KKSmoKM+VjswIe6L7fBp+dygtxOXsfNsNLKaMsNfA9lPvOvtO656+QgMHqWv
	LqkNKilc5cLy1XwotT8jFyYSZp6hmFHGG/fcaUtzzPvKEIUs9qBhAgNaJDThuB3gmpirjHI334B
	ADMFUTPkAzEf91SjRdRjI6r5CLTd3n2iaKOa0YW0/vkQBVdw5ErB1DBN9N/V7xH+JSYmWQVsgoB
	Q8LGiQUReIhjjlnIjX2hJZyoNdl/eA13D7FqukBif5I300RUfNgdfB85r6K6mkn63NV8QLO44S+
	uc66NDmULPZMzN0wFoN5a6elJlDPJpq/Fuu7U15oLoC7vvIDP9FL24zo/T3HpusBLEdkf13l8Uu
	yJpzHQRSUZJ8ZIFPc8cQUqaaCJ9VTl1DBFpvwb2RSF+Bv3h+3fzuxp/MxtaWOpgEVbwYlh3C9PC
	w==
X-Google-Smtp-Source: AGHT+IFRsX11i6ttykwzSTE1MX3XcVT7zdJoHg0PldYmpaU3ps1bn6uVFu1p5RX3UmY4D7yABarLgw==
X-Received: by 2002:a17:907:6ea9:b0:b41:c602:c746 with SMTP id a640c23a62f3a-b6dba48c5ddmr306520266b.20.1761639791192;
        Tue, 28 Oct 2025 01:23:11 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-81-118-90-13.business.telecomitalia.it. [81.118.90.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853077e8sm1024064566b.14.2025.10.28.01.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 01:23:10 -0700 (PDT)
Date: Tue, 28 Oct 2025 09:23:07 +0100
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Frank Li <Frank.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 1/2] arm64: dts: freescale: imx93-phyboard-nash: Add jtag
 overlay
Message-ID: <aQB9azDkYN4RLU6+@alb3rt0-ThinkPad-P15-Gen-1>
References: <20251007084028.1125185-1-primoz.fiser@norik.com>
 <aPt/d9svTeUIRljW@lizhi-Precision-Tower-5810>
 <aPuO+FCeeIFv3bQm@alb3rt0-ThinkPad-P15-Gen-1>
 <aPuvYwwG5N84MwGA@lizhi-Precision-Tower-5810>
 <658fa62e-cc80-436a-9812-c67b0dc8de03@norik.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <658fa62e-cc80-436a-9812-c67b0dc8de03@norik.com>

On Tue, Oct 28, 2025 at 07:23:57AM +0100, Primoz Fiser wrote:
> Hi both,
> 
> On 24. 10. 25 18:54, Frank Li wrote:
> > On Fri, Oct 24, 2025 at 04:36:40PM +0200, Alberto Merciai wrote:
> >> On Fri, Oct 24, 2025 at 09:30:31AM -0400, Frank Li wrote:
> >>> On Tue, Oct 07, 2025 at 10:40:27AM +0200, Primoz Fiser wrote:
> >>>> Add overlay to enable JTAG pins on the board's JTAG (X41) connector.
> >>>>
> >>>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> >>>> ---
> >>>>  arch/arm64/boot/dts/freescale/Makefile        |  2 ++
> >>>>  .../freescale/imx93-phyboard-nash-jtag.dtso   | 26 +++++++++++++++++++
> >>>>  2 files changed, 28 insertions(+)
> >>>>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtso
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> >>>> index 525ef180481d..c72a6fdc5412 100644
> >>>> --- a/arch/arm64/boot/dts/freescale/Makefile
> >>>> +++ b/arch/arm64/boot/dts/freescale/Makefile
> >>>> @@ -356,10 +356,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
> >>>>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
> >>>>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
> >>>>
> >>>> +imx93-phyboard-nash-jtag-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-jtag.dtbo
> >>>>  imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
> >>>>  imx93-phyboard-segin-peb-eval-01-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-eval-01.dtbo
> >>>>  imx93-phyboard-segin-peb-wlbt-05-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-wlbt-05.dtbo
> >>>>  imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
> >>>> +dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-jtag.dtb
> >>>>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-peb-wlbt-07.dtb
> >>>>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-eval-01.dtb
> >>>>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-wlbt-05.dtb
> >>>> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtso b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtso
> >>>> new file mode 100644
> >>>> index 000000000000..4744eabf95f3
> >>>> --- /dev/null
> >>>> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtso
> >>>> @@ -0,0 +1,26 @@
> >>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> >>>> +/*
> >>>> + * Copyright (C) 2025 PHYTEC Messtechnik GmbH
> >>>> + * Author: Primoz Fiser <primoz.fiser@norik.com>
> >>>> + */
> >>>> +
> >>>> +#include "imx93-pinfunc.h"
> >>>> +
> >>>> +/dts-v1/;
> >>>> +/plugin/;
> >>>> +
> >>>> +&gpio2 {
> >>>> +	pinctrl-names = "default";
> >>>> +	pinctrl-0 = <&pinctrl_jtag>;
> >>>> +};
> >>>
> >>> Use gpio to set pinctrl to no-gpio mode is strange. I am not sure if there
> >>> are better method, but at need comments here to show why have to do that.
> >>>
> >>
> >> In old imx6 platform we use pinctrl_hog for that purpose, is not?
> > 
> > It'd better than gpio, but I am not sure if pinctrl_hog still be supported
> > because I have not seen it for the long time.
> > 
> 
> I am OK with both suggestions:
> 
> 1) adding an explanation comment
> 2) Using pinctrl_hog method
> 
> Personally however, I would prefer method 1) since it would be better in
> this case because base customer dts can already contain default
> pinctrl_hog which would be overwritten by this overlay.

Good point, that is true.

> 
> Not that common, but can still happen.
> 
> What do you suggest for v2? 

I would say 1, IMO explaining that with a comments is the most
explicit way to do that.

BR,
Alberto

> 
> BR,
> Primoz
> 
> > Frank
> >>
> >>> Frank
> >>>> +
> >>>> +&iomuxc {
> >>>> +	pinctrl_jtag: jtaggrp {
> >>>> +		fsl,pins = <
> >>>> +			MX93_PAD_GPIO_IO24__JTAG_MUX_TDO	0x31e
> >>>> +			MX93_PAD_GPIO_IO25__JTAG_MUX_TCK	0x31e
> >>>> +			MX93_PAD_GPIO_IO26__JTAG_MUX_TDI	0x31e
> >>>> +			MX93_PAD_GPIO_IO27__JTAG_MUX_TMS	0x31e
> >>>> +		>;
> >>>> +	};
> >>>> +};
> >>>> --
> >>>> 2.34.1
> >>>>
> >>>
> 
> -- 
> Primoz Fiser
> phone: +386-41-390-545
> email: primoz.fiser@norik.com
> --
> Norik systems d.o.o.
> Your embedded software partner
> Slovenia, EU
> phone: +386-41-540-545
> email: info@norik.com
> 
