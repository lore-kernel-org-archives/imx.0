Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3968E30C363
	for <imx@lists.linux.dev>; Fri, 24 Oct 2025 14:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761316608; cv=none; b=YT05nBc+4PSSEsgtoYkx0N09tnKRpXvlvID76Fr5yZ2RDv1JTVA4ZOwdn8besr3a56kCr1uePsA1JBSub35yKTZbF3T+aMvUOBAXliIPaGJ5XpY/h7EbTeIq21GLpVI16HCDvYxNnr1ZhUjy6Bw0zxjWMzU5CjiUYBf0gNva+oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761316608; c=relaxed/simple;
	bh=SyHsbHHPTi2vMHuPhkK3EIkxbANttu0bB9QFrV5V42A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=migEB5E1NG9QB9RmxyLX6DURKKqN2Tdl/nQo1pKze6wgtWnzt/OB6Kduc+ObZ9RXzfZtm4MRtD4Y7rZuwku+kTNA029Zi8X2bXpgg9KFGfpUCYBcFluDrMQ8C6dphKkjG1qCII9+U2M3i/Gaqj6q4o3Sy4oQIllVL7xZAhSfdMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RvRy7e1c; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RvRy7e1c"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so480428766b.3
        for <imx@lists.linux.dev>; Fri, 24 Oct 2025 07:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761316604; x=1761921404; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vhvZambXhJUe9NXP8fPYlMTJocXdYHeRZkXktKu8p/w=;
        b=RvRy7e1cnMiMGDtUC71xZP36GAb7g5pbXxRs+/UYh26DgGYGOu49EHl1Zj+/oA+ZG7
         7LsAtzzuOBu8GgGXjDWf85neVmTBVTsF06DwK5xFfW6TtKxMtcI+W3zkwrJ/DJacnGZc
         tHKFwm4DRYT4EYwW97NM6gkk4OhYDcHbD2aU8FASRfcQqYdl6Qi6YcaZS9KwxjxScnAT
         oOPHCr5UxNT5tEjXwNexAZmGyKnBYwLK4zNAZLGLpr6GmV3T1CFzDeDKGce7wUhI9wN/
         0O7v8UAMPYqS8tiZXuc2gA6hmrOBTsyZvalRVHT0HPh34/Nv3DbyJpkOhpqDWJtajDzX
         Cs0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761316604; x=1761921404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhvZambXhJUe9NXP8fPYlMTJocXdYHeRZkXktKu8p/w=;
        b=q8gp4jhKu7lIJ5gWF2akS4KtVaVaEDWTT8jpS9rB+Z6EcWoUjDagvxLh9R2D/UBL+M
         q4T0bqS1yPebv9Q8/5jxs/5meFGomjpcQIiiumjdjT2kbLT8gKZRQlcqmJmmIrZ8ej4P
         ODi5oQ0H/SaUkFy/PaOu2cAHo67+abq5aE2AbAGvxl41MnZkkuKTKVFB0pTlTBwiIeu0
         IWLavP0z0AK0FdfwCswmJzZF85f2iLQd/kazekSAxsFi5wroj7pNVhBhaEywnl+/DN4t
         dN0RJJvuVjqfVDp4G+E9QVuEi0xoalCEWBMQmiTYz8Re/+PCaIwwMgcrQ2XpHML/oHUJ
         n6JQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCDXT3IQ4P8WBy0WnzTKS0ugO7jjEM4TmUVN7R/MLRmq4aTjXp6kiudgvV+wAUta7+WZ4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6lDRUHqCB8dmJ4UyYq4KboFanqfiYD6vJZ1QBE3gU8N4u2HYj
	iGsBE4H3SeaURXSG2nQiRA0Yh9MRQyv3Hiv2Zq03c0ZcxJ3+CNG3Ufw/
X-Gm-Gg: ASbGncvEufb3108WptHXQpbsVsE6229yV4an9cXbdkGBry6gRIhYD1afLTLenRoWxUf
	RSpl3mEmgAlNuf4pLxiy3fpaNlNFPbpbyPAlh9n0Xbj4T1ijsAjT2s2Sp3XoNdiK0OmMluHzodY
	C8b5H0sSxTLzb0xBqcUUBRy2dkIIzM9/cjPUB3KGXVRpsPeDS+nyYjbK3NG3Ub5Qpr/e8CKp8QT
	LxGMPOVQT3CjRDvr1DetE9F/3evPDv97f5ln0lk5nInOrzU99Bm9f+B4rS+sAz9Ggrl5VMookxw
	eXq2LQx6nZBh0gWNRGsbM88I3Kt0H5Xv9rVh2pY+JMJKXMm2h5kRyFO1pJY/LtPP+52xvpug+Gk
	dVILNL2i6yY4/88q7xBlIZ/MYPgH/75b4XVA49LZWQl7XCh1phFf7rpyuDHPHUJ2LwdKIbOveRv
	x42FP32uKnZVoF7o16n8o0uHXxB4EPyOoi/i/o10f1O17YEjkHNMQiZoneJxbvRowbdsWv76GhG
	g==
X-Google-Smtp-Source: AGHT+IFWzk1i+CerdLmqkWlqmK1WwF08rParHoWAXsc4qXFYfSSN7IC++HtkBe/tPf9ihHXuOS5S/Q==
X-Received: by 2002:a17:907:1c8b:b0:b45:27e0:7f35 with SMTP id a640c23a62f3a-b6d6ffe1b10mr309334466b.46.1761316602897;
        Fri, 24 Oct 2025 07:36:42 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-81-118-90-13.business.telecomitalia.it. [81.118.90.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d514172besm545726366b.46.2025.10.24.07.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 07:36:42 -0700 (PDT)
Date: Fri, 24 Oct 2025 16:36:40 +0200
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Primoz Fiser <primoz.fiser@norik.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 1/2] arm64: dts: freescale: imx93-phyboard-nash: Add jtag
 overlay
Message-ID: <aPuO+FCeeIFv3bQm@alb3rt0-ThinkPad-P15-Gen-1>
References: <20251007084028.1125185-1-primoz.fiser@norik.com>
 <aPt/d9svTeUIRljW@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPt/d9svTeUIRljW@lizhi-Precision-Tower-5810>

On Fri, Oct 24, 2025 at 09:30:31AM -0400, Frank Li wrote:
> On Tue, Oct 07, 2025 at 10:40:27AM +0200, Primoz Fiser wrote:
> > Add overlay to enable JTAG pins on the board's JTAG (X41) connector.
> >
> > Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile        |  2 ++
> >  .../freescale/imx93-phyboard-nash-jtag.dtso   | 26 +++++++++++++++++++
> >  2 files changed, 28 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtso
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> > index 525ef180481d..c72a6fdc5412 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -356,10 +356,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
> >
> > +imx93-phyboard-nash-jtag-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-jtag.dtbo
> >  imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
> >  imx93-phyboard-segin-peb-eval-01-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-eval-01.dtbo
> >  imx93-phyboard-segin-peb-wlbt-05-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-wlbt-05.dtbo
> >  imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
> > +dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-jtag.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-peb-wlbt-07.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-eval-01.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-wlbt-05.dtb
> > diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtso b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtso
> > new file mode 100644
> > index 000000000000..4744eabf95f3
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtso
> > @@ -0,0 +1,26 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (C) 2025 PHYTEC Messtechnik GmbH
> > + * Author: Primoz Fiser <primoz.fiser@norik.com>
> > + */
> > +
> > +#include "imx93-pinfunc.h"
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +&gpio2 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_jtag>;
> > +};
> 
> Use gpio to set pinctrl to no-gpio mode is strange. I am not sure if there
> are better method, but at need comments here to show why have to do that.
> 

In old imx6 platform we use pinctrl_hog for that purpose, is not?

> Frank
> > +
> > +&iomuxc {
> > +	pinctrl_jtag: jtaggrp {
> > +		fsl,pins = <
> > +			MX93_PAD_GPIO_IO24__JTAG_MUX_TDO	0x31e
> > +			MX93_PAD_GPIO_IO25__JTAG_MUX_TCK	0x31e
> > +			MX93_PAD_GPIO_IO26__JTAG_MUX_TDI	0x31e
> > +			MX93_PAD_GPIO_IO27__JTAG_MUX_TMS	0x31e
> > +		>;
> > +	};
> > +};
> > --
> > 2.34.1
> >
> 
