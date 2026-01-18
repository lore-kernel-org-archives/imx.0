Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454112737F2
	for <imx@lists.linux.dev>; Sun, 18 Jan 2026 17:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768757295; cv=none; b=dTmFVHxPocNXVtLi0aTF9cvwRcYE6LDN1UCrc0uvak26ZM1A3VncYo/DeRSgs5RPhS2zZC4alH4Nj8w8fdxY/xE8ubm5pscyAcEk0eJJ57tLIcWqtgFKdc8aPWRnlMJ3bMq5ykbSAitOuL7OHdYo464yuzw+86ZfnOifJOB3FfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768757295; c=relaxed/simple;
	bh=2pOCP/XZa+KS/7p0TAfgnu0qUOHh5Ma56HrdY4piD/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctbhTqY518jJdw+R4o/hyJh+7jF8RLYAWb11qtdiJp6mxh2WzXabXOUfVPEHvcibz6b2nM404slA1FpOZuMiKcaaBkDCwe2481McuZ/VlaisehWWMgbiT5WLrxC/rbvzqpvag+OYNFPZq5pVx36tAn9LFR27c9dAdk7y43Lt5r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vhWZF-0007Tt-Tp; Sun, 18 Jan 2026 18:28:01 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vhWZG-001HJQ-0x;
	Sun, 18 Jan 2026 18:28:01 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vhWZF-001bID-1f;
	Sun, 18 Jan 2026 18:28:01 +0100
Date: Sun, 18 Jan 2026 18:28:01 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, devicetree@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Li Jun <jun.li@nxp.com>
Subject: Re: [PATCH v2 7/9] arm64: dts: imx8mn: add wakeup-source for usb phy
Message-ID: <20260118172801.igzv2626ourc4hge@pengutronix.de>
References: <20260117-misc_dts-v2-0-0f319c7e9b55@nxp.com>
 <20260117-misc_dts-v2-7-0f319c7e9b55@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117-misc_dts-v2-7-0f319c7e9b55@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 26-01-17, Frank Li wrote:
> From: Li Jun <jun.li@nxp.com>
> 
> USB phy can be wakeup source to support wakeup system from USB.

Hm.. since when does the base.dtsi provide decisions about wakeup
sources. I would rather keep it per board design.

Regards,
  Marco

> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mn.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
> index b98b3d0ddf25aa4b98f8320ecc7f44e22271178e..f65258aed3b72cf98e82432a59dce2acb001ad95 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
> @@ -1322,5 +1322,6 @@ usbphynop1: usbphynop1 {
>  		assigned-clock-parents = <&clk IMX8MN_SYS_PLL1_100M>;
>  		clock-names = "main_clk";
>  		power-domains = <&pgc_otg1>;
> +		wakeup-source;
>  	};
>  };
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
