Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8541D537
	for <imx@lists.linux.dev>; Sun, 17 Mar 2024 18:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710701848; cv=none; b=O/wm6bvNNRsqZNJJ4AzpInbuRyrEwWhSgeTzPNwnVBmf8zNu5XLfVKFJGAWvnE7+7I30DaroeaJPgL0wHB9TnVuCnb1j9uP2JDz+M4JtRiod9dp3xkuFZ3iTFQ3olwE/TdhYU1UGYDx7nHphavpd6aJR5UWRH+E6hn2HBWzpnDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710701848; c=relaxed/simple;
	bh=cDYCiCx7FpAXGD2XWaONu3BTMkgg0DGFlVS5Q73yTf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLq/nLUdloUVYqUjP4u5n2k9Ginqi2+XJCR83IDbKwS33YXxA8bWNb1PBOU2Yns30vAeHxPwyrzx8vdtH7HMQ6XKeoiiaZx0l9P9Ng5Gxs3EYe5gqRsmINGA4WtDeI6G97F4GAeRLbW+82vtNCqtXJgFP+5p1wVnXpFyZRBmGAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ILifDoXk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ILifDoXk"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6BFA863C;
	Sun, 17 Mar 2024 19:56:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710701819;
	bh=cDYCiCx7FpAXGD2XWaONu3BTMkgg0DGFlVS5Q73yTf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ILifDoXkFbj96Ka3bjtwYHUxepfxzzvP8G8KYWsl67+qlCtqNAg6fbFCJTNCd4gRx
	 wIc/Yv1LF8cSJuceZVPCNF7R37xLCDAKXI+6Ti61c/Ewut+uOKwVz1j4XR9v8CCDBv
	 wl+fZH8kUMx0nJ1Ntr7+8WpOghlKlu9ZFK2GQQYI=
Date: Sun, 17 Mar 2024 20:57:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-arm-kernel@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/5] arm64: dts: freescale: Add device tree for
 Compulab UCM-iMX8M-Plus
Message-ID: <20240317185722.GA24220@pendragon.ideasonboard.com>
References: <20240317164850.32708-1-laurent.pinchart@ideasonboard.com>
 <20240317164850.32708-3-laurent.pinchart@ideasonboard.com>
 <c5f5fd07-99e3-4a43-a92e-9e622932ea1b@lunn.ch>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c5f5fd07-99e3-4a43-a92e-9e622932ea1b@lunn.ch>

On Sun, Mar 17, 2024 at 06:17:17PM +0100, Andrew Lunn wrote:
> > +&eqos {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_eqos>;
> > +	phy-mode = "rgmii-id";
> > +	phy-handle = <&ethphy0>;
> > +
> > +	mdio {
> > +		compatible = "snps,dwmac-mdio";
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		/* Atheros AR8033 on v1.0, Realtek RTL8211E on v1.1 */
> > +		ethphy0: ethernet-phy@0 {
> > +			compatible = "ethernet-phy-ieee802.3-c22";
> > +			reg = <0>;
> > +			eee-broken-1000t;
> > +		};
> 
> Hi Laurent
> 
> Do you happen to know what is broken with respect to EEE? It seems
> like a lot of IMX boards have this, so i suspect it is the MAC. Maybe
> we should be keying off the MAC compatible and disabling this in the
> ethernet driver rather than have every .dts file needing it?

I wonder if this could be cargo-cult. To be honest, I've copied it from
the BSP and haven't investigated it. I've tried dropping that and
haven't noticed any difference, but I'm not sure how I should test it
properly.

-- 
Regards,

Laurent Pinchart
