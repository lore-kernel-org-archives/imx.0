Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0F9208A4
	for <imx@lists.linux.dev>; Sun, 17 Mar 2024 23:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710719442; cv=none; b=kbwXv+xwTxQuWPF0Kk20N+fYY2BH2XuI9theaq4pkAdN84dQuXa3gbYPJaHRStA6TJhTTwH48XN441c/eeuwnFQkcLORgQnU+zrTbu9IpBc4Zk45umytTCPmufgNUlrRJtcsQDPXLhWUwEmAeW+PTTQWl3AGcUJJ+QRtc1bhvb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710719442; c=relaxed/simple;
	bh=YOjKq8HW7v1M8mIAe+3tv+hOvnJ43f/sjbf1jJKGQ+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SZygt6PJeoREFKo7aaalq+ZA6J/ZeFDRxsya1V87jEjlKo+8KnCevhHFY87N7GyV0En629RvAtxfIULCcqyuaXeQG76h+fRvm6m7qMnTh85zuVzooGtix4EeKrRGu4bMBZm4a8puoG26wqugDg8eW/bGIoo7ER+HkzWpv728oX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Awg5Jw8l; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Awg5Jw8l"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3DFE4CC;
	Mon, 18 Mar 2024 00:50:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710719407;
	bh=YOjKq8HW7v1M8mIAe+3tv+hOvnJ43f/sjbf1jJKGQ+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Awg5Jw8lxA+fhwot+Gv4i04CMFIF1hJzznO0eaGqLmIUcFK7fh557tnbpUM+vtlKm
	 g0o4cI3G4AeLrUB77l4DPHWWosb/l9Cve98wDM7vUbZrD5x8B60vUYayFWkZGxjyda
	 yWomNdLkR3ZO1GN23iHc3XnBq9tRzOLbb2x+3fMc=
Date: Mon, 18 Mar 2024 01:50:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-arm-kernel@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Johannes Zink <j.zink@pengutronix.de>
Subject: Re: [PATCH v2 2/5] arm64: dts: freescale: Add device tree for
 Compulab UCM-iMX8M-Plus
Message-ID: <20240317235030.GB18202@pendragon.ideasonboard.com>
References: <20240317164850.32708-1-laurent.pinchart@ideasonboard.com>
 <20240317164850.32708-3-laurent.pinchart@ideasonboard.com>
 <c5f5fd07-99e3-4a43-a92e-9e622932ea1b@lunn.ch>
 <20240317185722.GA24220@pendragon.ideasonboard.com>
 <7deaf04a-7433-4712-9fb8-1c89fc283346@lunn.ch>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7deaf04a-7433-4712-9fb8-1c89fc283346@lunn.ch>

(CC'ing Johannes)

On Sun, Mar 17, 2024 at 10:55:16PM +0100, Andrew Lunn wrote:
> On Sun, Mar 17, 2024 at 08:57:22PM +0200, Laurent Pinchart wrote:
> > On Sun, Mar 17, 2024 at 06:17:17PM +0100, Andrew Lunn wrote:
> > > > +&eqos {
> > > > +	pinctrl-names = "default";
> > > > +	pinctrl-0 = <&pinctrl_eqos>;
> > > > +	phy-mode = "rgmii-id";
> > > > +	phy-handle = <&ethphy0>;
> > > > +
> > > > +	mdio {
> > > > +		compatible = "snps,dwmac-mdio";
> > > > +		#address-cells = <1>;
> > > > +		#size-cells = <0>;
> > > > +
> > > > +		/* Atheros AR8033 on v1.0, Realtek RTL8211E on v1.1 */
> > > > +		ethphy0: ethernet-phy@0 {
> > > > +			compatible = "ethernet-phy-ieee802.3-c22";
> > > > +			reg = <0>;
> > > > +			eee-broken-1000t;
> > > > +		};
> > > 
> > > Hi Laurent
> > > 
> > > Do you happen to know what is broken with respect to EEE? It seems
> > > like a lot of IMX boards have this, so i suspect it is the MAC. Maybe
> > > we should be keying off the MAC compatible and disabling this in the
> > > ethernet driver rather than have every .dts file needing it?
> > 
> > I wonder if this could be cargo-cult. To be honest, I've copied it from
> > the BSP and haven't investigated it. I've tried dropping that and
> > haven't noticed any difference, but I'm not sure how I should test it
> > properly.
> 
> Maybe a better approach is to find the errata. It could be some older
> version of the eqos was broken, and it got fixed along the way? If
> that is so, moving it into the driver would be better, assuming there
> is some sort of hardware version register in the eqos.

I don't know if there are public errata about this issue. It is beyong
my areas of expertise. I've found a relatively recent e-mail on the
netdev mailing list that seems related ([1]), but there was no reply.

[1] https://lore.kernel.org/netdev/9c1c9408-88ac-4ade-b8ec-2ae5d8922cac@pengutronix.de/

-- 
Regards,

Laurent Pinchart
