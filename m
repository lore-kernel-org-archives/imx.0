Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC751DE2AD
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 14:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767708863; cv=none; b=gLU5H5t56hlQ3aIWiZ5O8kpqH8NYZxNh12q8k6cXIYBzE3X+zUMc2u4WXG8/0rM6wZSTrvbcpPfbA0Bxk4L/vQmxorjAZ0YbuE44idzIp6xVxPI5cbIsQADfrANploynwXEWNcsh36J9diRRkAi4rNJCTlAZplH+lDM6JYH3H20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767708863; c=relaxed/simple;
	bh=J5D3AxYk/KGiW51uGhMznr9BjtqXn7rl5KAiX9QfyT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DbVxsIyPvA4NghP1W4wdGRTStof+pkz8yRKw/uHypd0989iE7N2dvmJKX7nlmrIUNKu/wVYmR4aRSpzAQGfRuiUo8yyghXfK3ozU61y3xSnSpLk5ggVcjJhm9E1JfK5b+k0npu/Md61bjL0c6bbPhPZnrhY9+WI6VR5sYEfpXQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vd7or-0004tZ-MH; Tue, 06 Jan 2026 15:13:57 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vd7or-009ML8-0u;
	Tue, 06 Jan 2026 15:13:57 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vd7or-00EKca-0X;
	Tue, 06 Jan 2026 15:13:57 +0100
Date: Tue, 6 Jan 2026 15:13:57 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp-skov: add pinctrl-name 'reset' to
 fix CHECK_DTB warning
Message-ID: <20260106141357.a7jsmligapumcfau@pengutronix.de>
References: <20251229165127.4006134-1-Frank.Li@nxp.com>
 <20260105111448.slm2yqiwivx2t3vh@pengutronix.de>
 <aVzhhH4BRFC7XlAL@shlinux89>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVzhhH4BRFC7XlAL@shlinux89>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi Peng,

On 26-01-06, Peng Fan wrote:
> Hi Marco,
> 
> On Mon, Jan 05, 2026 at 12:14:48PM +0100, Marco Felsch wrote:
> >Hi Frank,
> >
> >On 25-12-29, Frank Li wrote:
> >> Add pinctrl-name 'reset' to fix below CHECK_DTB warnings:
> >>   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: switch@5f (microchip,ksz9893): pinctrl-names: ['default'] is too short
> >> 	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
> >> 
> >> The commit (e469b87e0fb0d dt-bindings: net: dsa: microchip: Add strap
> >> description to set SPI mode" force use two pinctrl-name 'default' and
> >> 'reset'. switch@5f doesn't use SPI, so it is safe to use the same pinctrl
> >> setting for both.
> >
> >please see:
> >- https://lore.kernel.org/all/20251112084717.ea7fchu7jcz6dzsi@pengutronix.de/
> >
> >I stumbled over the same warning, but came to the conclusion, that the
> >dt-bindings should be fixed instead of workaround broken bindings within
> >the dtb.
> 
> If reset is optional, the dt-bindings should include "minItems:1" per my
> understanding.

Not sure, since the pinctrl-names is just an enum list. That beeing
said, I don't see it as required since the strapping may not be required
for systems which do already has correct ext. strapping options.
Therefore the binding should be always optional and the driver should be
adapted.

> But..
> 
> >
> >> -		pinctrl-names = "default";
> >> -		pinctrl-0 = <&pinctrl_switch>;
> >> +		pinctrl-names = "default", "reset";
> >> +		pinctrl-0 = <&pinctrl_switch>, <&pinctrl_switch>;
> 
> Per checking
> https://elixir.bootlin.com/linux/v6.18.3/source/drivers/net/dsa/microchip/ksz_common.c#L5372
> 
> seems "reset" is required in driver.

For the ksz8463 but not for the ksz9893 which is used by the
imx8mp-skov-reva.dtsi (here).

Regards,
  Marco




> 
> Regards
> Peng
> 
> >>  		reset-gpios = <&gpio5 1 GPIO_ACTIVE_LOW>;
> >>  		reg = <0x5f>;
> >>  
> >> -- 
> >> 2.34.1
> >> 
> >> 
> >> 
> >
> >-- 
> >#gernperDu 
> >#CallMeByMyFirstName
> >
> >Pengutronix e.K.                           |                             |
> >Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
> >31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> >Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
