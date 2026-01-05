Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5AD335063
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 11:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767611711; cv=none; b=pN42wrnGLueYRkZKVcHRrUFHG2MT+HOcLtd0xmMCkO3fWSzY6OvNiFXTLy255Wu1+aqhASXv9yIM3waKhBmQIsZPm2Lv52TkaRp/Hox1tkeXa5iW+9KpwQ6+Y2ork69VXesfFbH9neLlwo8gU5c4QZL7lucgZdfHIqCkfJfLMA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767611711; c=relaxed/simple;
	bh=3TiAhp9+bFrltt5FUytvkR8rwwCQaS9SxQuRjEvWYqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0g8OFboBTkmDV6bjqwnENK5U7XMhevN4B91IPDHa6aZL6a3U7pjaL6dNTYnkS0XXS3RhP1tQpw/NymVzuGEErLxouu0VXEvyuz170T8tUMxgWCKbn51xgKOvgAEa2tDilv+8HJ/ZeHj6+FpiwC0eGtkQsOk6KDisyASGmM5hOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vciXx-0004Q0-Gn; Mon, 05 Jan 2026 12:14:49 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vciXx-0099sn-02;
	Mon, 05 Jan 2026 12:14:49 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vciXw-00CR1k-2s;
	Mon, 05 Jan 2026 12:14:48 +0100
Date: Mon, 5 Jan 2026 12:14:48 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Message-ID: <20260105111448.slm2yqiwivx2t3vh@pengutronix.de>
References: <20251229165127.4006134-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229165127.4006134-1-Frank.Li@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi Frank,

On 25-12-29, Frank Li wrote:
> Add pinctrl-name 'reset' to fix below CHECK_DTB warnings:
>   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: switch@5f (microchip,ksz9893): pinctrl-names: ['default'] is too short
> 	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
> 
> The commit (e469b87e0fb0d dt-bindings: net: dsa: microchip: Add strap
> description to set SPI mode" force use two pinctrl-name 'default' and
> 'reset'. switch@5f doesn't use SPI, so it is safe to use the same pinctrl
> setting for both.

please see:
- https://lore.kernel.org/all/20251112084717.ea7fchu7jcz6dzsi@pengutronix.de/

I stumbled over the same warning, but came to the conclusion, that the
dt-bindings should be fixed instead of workaround broken bindings within
the dtb.

Regards,
  Marco

> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
> index 020f20c8ce667..7d2fc5fdd3bd1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
> @@ -373,8 +373,8 @@ &i2c4 {
>  
>  	switch: switch@5f {
>  		compatible = "microchip,ksz9893";
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_switch>;
> +		pinctrl-names = "default", "reset";
> +		pinctrl-0 = <&pinctrl_switch>, <&pinctrl_switch>;
>  		reset-gpios = <&gpio5 1 GPIO_ACTIVE_LOW>;
>  		reg = <0x5f>;
>  
> -- 
> 2.34.1
> 
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
