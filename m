Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F302F8BF3
	for <imx@lists.linux.dev>; Fri, 24 Oct 2025 10:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761301517; cv=none; b=mDkjPfh3HPo/ikidtihDvS7o1JWxO+o02AGOWtEbnJLzJZH/Ns2Rn4ke+ENXB2eR0AF+ZlEFEx2/t8qz21cavLO6dJABYoI9kg+2lppnvhPyaFE5GJBeJwXuBTykXyh9NiZMx7ey+N6IFToUdXvMAjM3c6tL3ZwDnypTRnxcSq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761301517; c=relaxed/simple;
	bh=AAPNzwvfIyboDX9+wzPPjQ4GD1ao/bEZQIRpSO49rII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kXbIZ4P9u3fwDLi6jOByS2Q48BTRO7WDS0yHvGuacKvez4a7/U0z0lWnQDYVi150YGG0+gVEAl9s0qnkR7pnMTB7SM5EyAzgcAT7l0KfMbu4FqiTQciqNOOmDp6r1gXzcPHazPsETOY3PoBmif24X7j02qLnwD0N7/3FRoOGbVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtELKXye; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtELKXye"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-63e11cfb4a9so3363422a12.2
        for <imx@lists.linux.dev>; Fri, 24 Oct 2025 03:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761301512; x=1761906312; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X6t96NTq7vBJvnV/QSRlBuWO2dHEvhujwQJZIc/2QTo=;
        b=OtELKXye7slGDuRpKuHaXNYTTxZiOOpwxbzVJa1FS/UMnd7D//hKyVGE/jXmEmluOX
         fwZHXLrRoGgNxi1Z/n8br/rZLpajpo6BBYpKKab1w+69hQZkYBjIeRPAIJq3SFA3AXy4
         iEAQNIGo7/wx+Z5IF8vquO3SoGMS71S/sJNd8v3k/A4E/0iCXRQy109a18qZFKscGuu6
         vK/WmY3r9e/+QnM1Qn3NxNyhYr4OMSM9ZGPRI8mJHyQEeFzWAManOBfzutDn7HVAAtlQ
         H+0J1pFTrMM9xlwINjUCLF1z/9+PScOTJiuMLM9XYKNvA74VhjrAMk10jyj1CM9aOFPP
         padQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761301512; x=1761906312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6t96NTq7vBJvnV/QSRlBuWO2dHEvhujwQJZIc/2QTo=;
        b=vP1t3BKwhkvYUICOcuUBueE8AQL7PK2NyyLkatcx7Nja+2TYpSw35FQIuU5ZhdbxpE
         zTRqmIaVNwsbC6AdltEQn1T2CQDjg/bDFUcZtEsYwnRzWI/K+CT4ho9TRLajkdPnBzep
         3Y97FNNUGf1LCRkp/8juL349Z4ybQb9ypHShNODfJaQ6InhkKRLsQDKn1uIairZ8KkNa
         kTHnUXrkBC7Hra6TSvq8EiDcX6Pg5Ss+t6EZeFsxq5Fvgwx1cgHsk9p5dJwpuPN0MJKv
         UKVDAw+nbg/Hd2fmEwv3vj6U/34T4s0anVU9mcLOG2c3KhNJp7xKV67AQ2pEco/foCAC
         Q3QA==
X-Forwarded-Encrypted: i=1; AJvYcCWXgQKjeRh7FbTiwci9ZHPORwA5WPEB38slt/fK+awzVie2wtIUA04LTm5gmFTI4id0+Qs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyW0YqoHwjv+Te157nxEkz5LqttjEoy2reZJ0u3/kVxYdq9wGac
	vIXR9zP8CaFXoWRfdVvyVKRbT0sLGL/qRaB215a80w7gJbLEXz5zJ/ID
X-Gm-Gg: ASbGncvgMjHdmZdQvNM6iaKVN7pfKfFDUixJPyBgd/mHQ60V3WxDEgYnp0yP/LPRLdH
	qlu3cwY4smOxF/DAF2v/C3fLqONzoT/n4gfoncFgdH5A02R8oA1+WN1dplG40sg1ttZLoUHcsy/
	/ss8ZO2YCQlHbbFmC+DALuIY8Viv+7BTbHYoN1tAGXmbC/0AGbtVbKfUDD5za7sbZxHsFFM6IZ/
	xdzhnAat/iqszFLVHN6BWDosQtFS3V9SBdlkiu23IAIWcRsC7PzWqB4nbNkcqJbbB3dOWburYka
	XhWCrNEV39I/auBGYOwmdfR41Wx7WsSlsmSepODGDhr/olibj02II80sX+H5QJj39njXjYqHohn
	s0eA8zWC0v3q7ysWLGt9ZYChDE15/fl+Up0dtcggDmU6Hr+g81Y4/tWXdm0s5z3WkhVuUZ9+1eq
	WdlT21oFabYGMZqQlITqCoYYzd91zHzHbFBVw6yARKgIPUFpwjoo7oXFhGOad3RaYf3BhH3SXvJ
	UrceWJTzxSn
X-Google-Smtp-Source: AGHT+IHTHgs0pyWlo13qBQS26Rgr3vhTfFmMcTIQ+wdzXkyhuEnAqbnnt4Ad2dnb5X5EuPrAo4MDig==
X-Received: by 2002:a05:6402:2708:b0:634:5db4:8fab with SMTP id 4fb4d7f45d1cf-63e6008435cmr1888460a12.6.1761301511996;
        Fri, 24 Oct 2025 03:25:11 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-81-118-90-13.business.telecomitalia.it. [81.118.90.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e3f324275sm3877742a12.33.2025.10.24.03.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 03:25:11 -0700 (PDT)
Date: Fri, 24 Oct 2025 12:25:08 +0200
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 2/2] arm64: dts: freescale: imx93-phyboard-nash: Add
 pwm-fan overlay
Message-ID: <aPtUBGowNkBB5DRR@alb3rt0-ThinkPad-P15-Gen-1>
References: <20251007084028.1125185-1-primoz.fiser@norik.com>
 <20251007084028.1125185-2-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007084028.1125185-2-primoz.fiser@norik.com>

On Tue, Oct 07, 2025 at 10:40:28AM +0200, Primoz Fiser wrote:
> Add overlay to support PWM fan on the phyBOARD-Nash-i.MX93 board. Fan
> can be connected to the FAN (X48) connector on the board and will be
> controlled according to the following CPU temperature trips table:
> 
>  - bellow 50 degrees - fan is off (<1% duty cycle)
>  - between 50 and 58 degrees - low fan speed (~35% duty cycle)
>  - between 58 and 65 degrees - fan medium speed (~60% duty cycle)
>  - above 65 degrees - fan at full speed (>99% duty cycle)
> 
> The output frequency of PWM signal is set to 25 kHz.
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |  2 +
>  .../imx93-phyboard-nash-pwm-fan.dtso          | 75 +++++++++++++++++++
>  2 files changed, 77 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtso
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index c72a6fdc5412..9807eb878916 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -358,11 +358,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
>  
>  imx93-phyboard-nash-jtag-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-jtag.dtbo
>  imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
> +imx93-phyboard-nash-pwm-fan-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-pwm-fan.dtbo
>  imx93-phyboard-segin-peb-eval-01-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-eval-01.dtbo
>  imx93-phyboard-segin-peb-wlbt-05-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-wlbt-05.dtbo
>  imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-jtag.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-peb-wlbt-07.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-pwm-fan.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-eval-01.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-wlbt-05.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phycore-rpmsg.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtso b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtso
> new file mode 100644
> index 000000000000..d1adf04d56d9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtso
> @@ -0,0 +1,75 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2025 PHYTEC Messtechnik GmbH
> + * Author: Primoz Fiser <primoz.fiser@norik.com>
> + */
> +
> +#include <dt-bindings/pwm/pwm.h>
> +#include "imx93-pinfunc.h"
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	fan0: pwm-fan {
> +		compatible = "pwm-fan";
> +		#cooling-cells = <2>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_fan>;
> +		cooling-levels = <1 90 150 200 255>;
> +		pwms = <&tpm6 1 40000 PWM_POLARITY_INVERTED>;
> +	};
> +
> +	thermal-zones {
> +		cpu-thermal {
> +			trips {
> +				cpu_low: cpu-low {
> +					hysteresis = <3000>;
> +					temperature = <50000>;
> +					type = "active";
> +				};
> +
> +				cpu_med: cpu-med {
> +					hysteresis = <3000>;
> +					temperature = <58000>;
> +					type = "active";
> +				};
> +
> +				cpu_high: cpu-high {
> +					hysteresis = <3000>;
> +					temperature = <65000>;
> +					type = "active";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map1 {
> +					cooling-device = <&fan0 1 1>;
> +					trip = <&cpu_low>;
> +				};
> +
> +				map2 {
> +					cooling-device = <&fan0 2 2>;
> +					trip = <&cpu_med>;
> +				};
> +
> +				map3 {
> +					cooling-device = <&fan0 4 4>;
> +					trip = <&cpu_high>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&tpm6 {
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_fan: fangrp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO23__TPM6_CH1	0x31e
> +		>;
> +	};
> +};
> -- 
> 2.34.1
> 
> 
Reviewed-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
