Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E129431E82A;
	Mon,  2 Mar 2026 21:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772486162; cv=none; b=JpTwCN03RlrKrhnMRBsz8PmtCrjTLB3hAfHt9oQTWbhzzRUczUUiznVPLZQL706bj53v3QDbJ9Y4DGmh6xSMV3b3o/yCL7dLaqAAx8KxyTiHcH6bC9aeuQ5/n+LkEqvrKL57kviP/oiO8MgBPsA8kaHXIJCokm94UJD5Fw3hgEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772486162; c=relaxed/simple;
	bh=0rK6vtKHZo2nxf2/jXwUeO0ksom/lAN5I6kyFy++RZI=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=Ns8akY4CTkkMpF0Emx8X/XQNUvm2biBkF77GX8SKNpHr/neMrGBvKw5auBBs1e68/uOT16l1yu1e2Ec+Qy17EdS58/yil0uQ7S+14VAPJul5Oek/DuVcuNlKDtTUl4Q92l1DhXIMvlG8OZNYyCcynP5ihfKlmyXmAiuuNwXo1Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=uvv5ft+7; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="uvv5ft+7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=NnJ8pv/fOL8GSKK5hN49M8Ny5MsaLE7zYWAtl179zfM=; b=uvv5ft+7aehu5i17DBQoMd/vkq
	EEOy9hjnpHHy5eRL0mIOZNx+XYLH8ppqd9PBO1H/lq0oVjfs7YWFFKvIdFyI00S3e2TsqT5fLYLb4
	JpOpLBKgxJ7DssHRipUkhgGLMH4xfNe2ZqzfbvNUOH4p1d23ODHWIgWLm75pooi7fLBc=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:40712 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vxAcE-0004ca-C0; Mon, 02 Mar 2026 16:15:47 -0500
Date: Mon, 2 Mar 2026 16:15:45 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Frank Li <Frank.li@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 shawnguo@kernel.org, laurent.pinchart+renesas@ideasonboard.com,
 antonin.godard@bootlin.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>
Message-Id: <20260302161545.f6b76209400e8fbe35cd51a0@hugovil.com>
In-Reply-To: <aaX5E7-3xvkaVV-o@lizhi-Precision-Tower-5810>
References: <20260302190953.669325-1-hugo@hugovil.com>
	<20260302190953.669325-9-hugo@hugovil.com>
	<aaX5E7-3xvkaVV-o@lizhi-Precision-Tower-5810>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.0 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH 08/14] ARM: dts: imx6ul-var-som: factor out SD card
 support
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

Hi Frank,

On Mon, 2 Mar 2026 15:54:43 -0500
Frank Li <Frank.li@nxp.com> wrote:

> On Mon, Mar 02, 2026 at 02:03:44PM -0500, Hugo Villeneuve wrote:
> > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> >
> > Move SD support to a separate include, since it cannot be used at the
> 
> s/include/dtsi/

Ok. I will also change it in all the other commit messages.

 
> > same time as the Wifi/BT module.
> 
> what's relation ship between wifi/bt? you just move sd related part to a
> dtsi file.

As stated in commit message, the SD card interface cannot be used if
the Wifi/BT module is in use.

Sd card is not mandatory, for example on our board we do not have it,
so we need to have it disabled.

Hugo.



> 
> Frank
> >
> > Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > ---
> >  .../dts/nxp/imx/imx6ul-var-som-common.dtsi    | 33 ++++++++++++
> >  .../imx/imx6ul-var-som-concerto-common.dtsi   | 51 -------------------
> >  .../dts/nxp/imx/imx6ul-var-som-concerto.dts   |  1 +
> >  .../boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi   | 27 ++++++++++
> >  .../dts/nxp/imx/imx6ull-var-som-concerto.dts  |  1 +
> >  5 files changed, 62 insertions(+), 51 deletions(-)
> >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi
> >
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> > index 22b0c4e0725a5..dd4ecff1eb786 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> > @@ -139,6 +139,39 @@ MX6UL_PAD_UART2_RTS_B__UART2_DCE_RTS	0x1b0b1
> >  		>;
> >  	};
> >
> > +	pinctrl_usdhc1: usdhc1grp {
> > +		fsl,pins = <
> > +			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
> > +			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x17059
> > +			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
> > +			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
> > +			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
> > +			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> > +		fsl,pins = <
> > +			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170b9
> > +			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100b9
> > +			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170b9
> > +			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170b9
> > +			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170b9
> > +			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170b9
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> > +		fsl,pins = <
> > +			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170f9
> > +			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100f9
> > +			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170f9
> > +			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170f9
> > +			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170f9
> > +			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170f9
> > +		>;
> > +	};
> > +
> >  	pinctrl_usdhc2: usdhc2grp {
> >  		fsl,pins = <
> >  			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x10069
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
> > index 10a23ae104359..ea8d9905ce6e7 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
> > @@ -186,45 +186,6 @@ MX6UL_PAD_UART3_TX_DATA__ANATOP_OTG1_ID	0x17059
> >  		>;
> >  	};
> >
> > -	pinctrl_usdhc1: usdhc1grp {
> > -		fsl,pins = <
> > -			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
> > -			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x17059
> > -			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
> > -			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
> > -			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
> > -			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
> > -		>;
> > -	};
> > -
> > -	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> > -		fsl,pins = <
> > -			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170b9
> > -			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100b9
> > -			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170b9
> > -			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170b9
> > -			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170b9
> > -			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170b9
> > -		>;
> > -	};
> > -
> > -	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> > -		fsl,pins = <
> > -			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170f9
> > -			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100f9
> > -			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170f9
> > -			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170f9
> > -			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170f9
> > -			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170f9
> > -		>;
> > -	};
> > -
> > -	pinctrl_usdhc1_gpio: usdhc1-gpiogrp {
> > -		fsl,pins = <
> > -			MX6UL_PAD_GPIO1_IO00__GPIO1_IO00	0x1b0b1 /* CD */
> > -		>;
> > -	};
> > -
> >  	pinctrl_wdog: wdoggrp {
> >  		fsl,pins = <
> >  			MX6UL_PAD_GPIO1_IO01__WDOG1_WDOG_B	0x78b0
> > @@ -286,18 +247,6 @@ &usbotg2 {
> >  	status = "okay";
> >  };
> >
> > -&usdhc1 {
> > -	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> > -	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
> > -	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_usdhc1_gpio>;
> > -	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_usdhc1_gpio>;
> > -	cd-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
> > -	no-1-8-v;
> > -	keep-power-in-suspend;
> > -	wakeup-source;
> > -	status = "okay";
> > -};
> > -
> >  &wdog1 {
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&pinctrl_wdog>;
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
> > index 11b45f105b7ad..85ebac30d7bed 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
> > @@ -11,6 +11,7 @@
> >
> >  #include "imx6ul-var-som.dtsi"
> >  #include "imx6ul-var-som-concerto-common.dtsi"
> > +#include "imx6ul-var-som-sd.dtsi"
> >
> >  / {
> >  	model = "Variscite VAR-SOM-6UL Concerto Board (6UL CPU)";
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi
> > new file mode 100644
> > index 0000000000000..0e6d9b945eb4a
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi
> > @@ -0,0 +1,27 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Support optional SD card interface on Variscite VAR-SOM-6UL module.
> > + *
> > + * Copyright 2019-2024 Variscite Ltd.
> > + * Copyright 2026 Dimonoff
> > + */
> > +
> > +&iomuxc {
> > +	pinctrl_usdhc1_gpio: usdhc1-gpiogrp {
> > +		fsl,pins = <
> > +			MX6UL_PAD_GPIO1_IO00__GPIO1_IO00	0x1b0b1 /* CD */
> > +		>;
> > +	};
> > +};
> > +
> > +&usdhc1 {
> > +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> > +	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
> > +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_usdhc1_gpio>;
> > +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_usdhc1_gpio>;
> > +	cd-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
> > +	no-1-8-v;
> > +	keep-power-in-suspend;
> > +	wakeup-source;
> > +	status = "okay";
> > +};
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
> > index 7c601af2657d7..ebf88c3e1addc 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
> > @@ -10,6 +10,7 @@
> >
> >  #include "imx6ull-var-som.dtsi"
> >  #include "imx6ul-var-som-concerto-common.dtsi"
> > +#include "imx6ul-var-som-sd.dtsi"
> >
> >  / {
> >  	model = "Variscite VAR-SOM-6UL Concerto Board (6ULL CPU)";
> > --
> > 2.47.3
> >
> 


-- 
Hugo Villeneuve
