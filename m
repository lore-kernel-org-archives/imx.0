Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0B533D2;
	Sun, 17 Mar 2024 21:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710712523; cv=none; b=DY735N0shM69DeCyt13wkNl753uO7aK43lV90zsxsd/JvAUjYZ2fFNRpYy0GnpZuVhCd4MyW75h4oYIDCWWCNsUHOgFLscnhoYSUBhSw4ncEPMHRlqQmgf3g2dqj6u+XuAbEquOGtX3TEzwgNH7uzBpJhEFctf2uMpQYyW4Bm/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710712523; c=relaxed/simple;
	bh=LdCOHZGgIYI10pCmc0IuEcjL0JjNxn/om9ZRlrmKUl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dyF/Er9Few0Yw+UQjdahqGa4FGac8YhYBG6XohHQO6YfTRkPEaX8gxWcOUCW0rCLcHh5CPL1nC8CqyycMdAHzbQ7ZG8QIIDxOS1PaVlKGqWuREUCgYvsQU2EaH/Et09Z1UhKZT76UVFGhxJbEfQftEfFXnzicnpZaa0p2a4fWDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=2vw12zOD; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="2vw12zOD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=pN0bzku6yBp9j/Jm2B9blZZAXSNi2pDcupFt+4JMi2c=; b=2vw12zODkcrJ5is64Je8BustAa
	BiGlq191eovjWip5/EaN/kkJPF6j7N1egjAy7xEP2XMeWTwML7VJ9fRcJPMD5qeUXZI/sahaQP2ft
	PQisD+dbD38p6EolRbxiUAwHSgNGnU55Zp4YSdK6d2ar7WNs1tqAMQDLizl6zsUEGb5M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rlyTM-00AZ0U-Np; Sun, 17 Mar 2024 22:55:16 +0100
Date: Sun, 17 Mar 2024 22:55:16 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-arm-kernel@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/5] arm64: dts: freescale: Add device tree for
 Compulab UCM-iMX8M-Plus
Message-ID: <7deaf04a-7433-4712-9fb8-1c89fc283346@lunn.ch>
References: <20240317164850.32708-1-laurent.pinchart@ideasonboard.com>
 <20240317164850.32708-3-laurent.pinchart@ideasonboard.com>
 <c5f5fd07-99e3-4a43-a92e-9e622932ea1b@lunn.ch>
 <20240317185722.GA24220@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240317185722.GA24220@pendragon.ideasonboard.com>

On Sun, Mar 17, 2024 at 08:57:22PM +0200, Laurent Pinchart wrote:
> On Sun, Mar 17, 2024 at 06:17:17PM +0100, Andrew Lunn wrote:
> > > +&eqos {
> > > +	pinctrl-names = "default";
> > > +	pinctrl-0 = <&pinctrl_eqos>;
> > > +	phy-mode = "rgmii-id";
> > > +	phy-handle = <&ethphy0>;
> > > +
> > > +	mdio {
> > > +		compatible = "snps,dwmac-mdio";
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > > +
> > > +		/* Atheros AR8033 on v1.0, Realtek RTL8211E on v1.1 */
> > > +		ethphy0: ethernet-phy@0 {
> > > +			compatible = "ethernet-phy-ieee802.3-c22";
> > > +			reg = <0>;
> > > +			eee-broken-1000t;
> > > +		};
> > 
> > Hi Laurent
> > 
> > Do you happen to know what is broken with respect to EEE? It seems
> > like a lot of IMX boards have this, so i suspect it is the MAC. Maybe
> > we should be keying off the MAC compatible and disabling this in the
> > ethernet driver rather than have every .dts file needing it?
> 
> I wonder if this could be cargo-cult. To be honest, I've copied it from
> the BSP and haven't investigated it. I've tried dropping that and
> haven't noticed any difference, but I'm not sure how I should test it
> properly.

Maybe a better approach is to find the errata. It could be some older
version of the eqos was broken, and it got fixed along the way? If
that is so, moving it into the driver would be better, assuming there
is some sort of hardware version register in the eqos.

	Andrew
