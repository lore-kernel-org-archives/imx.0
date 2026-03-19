Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BD62405ED;
	Thu, 19 Mar 2026 13:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773927042; cv=none; b=M1L8K14rJy1lJj4obMWMkcdE3QHVuNLeXYhIdw8yISORB7yWYAXq9dJGYPzQUQHiVKKsMxZRp5tlsutlnkFEgHcl/WEeI2MxiYiJ//pWhSNqYqvxfvP6cqThLNd7hvHM6hyQtEdmj3sIrDYk/gfVD4Gda8Xt7Z4dXlC+ZY1DADM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773927042; c=relaxed/simple;
	bh=3QlzWkuw61oY8s0uNHfKgjUBHUrFUa2f7wFH23ZCvqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tvTbv3LUzzzFv8O9TsOk5ia1jurc9Ch35gsJl1s0GnMlM0NV8tv3sX97zMOer2NeDlYpXiQmwR2hDHlTzJPiHuLfhJQdssbDSF8w7rVUAZcNx4hl/5/IIZYfVAF90Hdb5yOsVk+khciWwS34QdZiTNnrF0mqH3Q0ZZFNMV8nd0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=xWMwkOVA; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="xWMwkOVA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=ICmpwB6fh0A2b0UPMsVtdQowQ3NwvZk/ZYuBrQL7xLU=; b=xW
	MwkOVARasJTlAwliM6ZawizqVt4PFeUf14ARuA+C51I+kWFt0bZckt8s57fDBxNmUdtXzyPTSmm7q
	MJ4vDl34CMg6TQLbKllfsO6/jAVLYn0SnKtP7sGgIu2Ao5lZhrRJYrKCn6epW9PpKKQbPciFC18IJ
	P+Knr+mgYvtL6po=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w3DSJ-00COBb-6c; Thu, 19 Mar 2026 14:30:31 +0100
Date: Thu, 19 Mar 2026 14:30:31 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 2/3] arm64: dts: freescale: add initial device tree for
 TQMa93xx/MBa93xxLA-MINI
Message-ID: <16102fa9-4b6e-4e40-98b2-2f138ad75ecd@lunn.ch>
References: <20260317111704.1075938-1-alexander.stein@ew.tq-group.com>
 <20260317111704.1075938-3-alexander.stein@ew.tq-group.com>
 <d67fafc1-4261-4818-8b58-7f3a874613e4@lunn.ch>
 <2259293.irdbgypaU6@steina-w>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2259293.irdbgypaU6@steina-w>

On Thu, Mar 19, 2026 at 12:25:11PM +0100, Alexander Stein wrote:
> Hi Andrew,
> 
> Am Mittwoch, 18. März 2026, 15:49:38 CET schrieb Andrew Lunn:
> > On Tue, Mar 17, 2026 at 12:17:01PM +0100, Alexander Stein wrote:
> > > +	mdio {
> > > +		compatible = "snps,dwmac-mdio";
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > > +
> > > +		ethphy_eqos: ethernet-phy@0 {
> > > +			compatible = "ethernet-phy-ieee802.3-c22";
> > > +			reg = <0>;
> > > +			pinctrl-names = "default";
> > > +			pinctrl-0 = <&pinctrl_eqos_phy>;
> > > +			interrupt-parent = <&gpio3>;
> > > +			interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
> > 
> > Hi Alexander
> > 
> > Haven't we been here before? EDGE interrupts are generally wrong for
> > PHYs.
> 
> Whoops. Sorry, this slipped in from the downstream kernel. Will fix that.

You might want to fix your downstream as well, since this is not a
Mainline thing.

> > > +&fec {
> > > +	pinctrl-names = "default";
> > > +	pinctrl-0 = <&pinctrl_fec>;
> > > +	phy-mode = "rgmii-id";
> > > +	phy-handle = <&ethphy_fec>;
> > > +	fsl,magic-packet;
> > 
> > Has WoL been tested?
> 
> Yes, it works for both interfaces. &eqos doesn't need that property though.

Great. For the next year or two, i might be asking this all the time,
so maybe call it out in the commit message.

   Andrew
