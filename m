Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A9C28A1E6
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 10:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761561282; cv=none; b=jgE1SHqo4vEUAs/kAVxdNisRORIscFqQsFc1rCCvQc+fUUnFmY6rGa/uN9RAPDooq9t71N6/eK1/yYxc18PokaUv04lGX9wJ+q4FLNLje4u6tGHePAYc9Al2s3aEfNd5b4eHFMiH3tv3uK0AsW8ft4jYMtkG4ruCCM0p4rUOCto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761561282; c=relaxed/simple;
	bh=I+Zzw7SEY9aWnPNX1KmXCsVQedweHR+1O6G10vwrA/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPy4BYNjlabls6iMbuPBqKKjFowB4hkr1ReLuIMOsZhYK6yOT53o8brLuoqoUNiWYysIAtfzZBLt76A9ZRjkWIdH0Lh+k2phjNbH4BVlWpAc3WBOTtxOJOuj40j9jz6A/77BXVo5/CHtADwWX8Wz1qYgbRmAVET+8WxVUW2WqNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=VkGJT2xM; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="VkGJT2xM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2pv8A1uaol1pXhXlEzwlZylOOOHmbfINSrfrlQpNBrE=; b=VkGJT2xMm4mV63P3Z5APqJBmUK
	5SmgKPNHcNUllwMtYaHt+EjjEgMiqbw4GlAYrlxrqCfzxEGd0NMdiPukDzUimg2i7aILfivL0PlaR
	h/XkraUjkU6K/IclhcD2TJ65YP9ap7KH2sSAcle4R7TTaX6iIg04PkrdjQBBcmdp/hrmYPGeuTxvD
	C737tp8IOQq961DZCwJlja9FaDlg7KRyIGEgrD5np6mE8svwmAwGo+wmDlU/GFBQ00YBsKJWseHKT
	2dktN116tmP5OSHvidk4IIZ5yLv/5Rie1scHImvxijZpAa+mg7DGvgYYxeCOJa7hAcYwwNFbcHYbM
	sQgZDm/A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54936)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vDKYf-000000001fT-20pN;
	Mon, 27 Oct 2025 10:34:37 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vDKYd-000000005VL-3cpb;
	Mon, 27 Oct 2025 10:34:35 +0000
Date: Mon, 27 Oct 2025 10:34:35 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <aP9Kuyndws_dYFna@shell.armlinux.org.uk>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <aP83bMDWCre7-Sjw@pengutronix.de>
 <20251027100227.GE1544@pendragon.ideasonboard.com>
 <aP9IB4y5_gyfJGMW@pengutronix.de>
 <20251027103107.GF1544@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027103107.GF1544@pendragon.ideasonboard.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Oct 27, 2025 at 12:31:07PM +0200, Laurent Pinchart wrote:
> On Mon, Oct 27, 2025 at 11:23:03AM +0100, Oleksij Rempel wrote:
> > On Mon, Oct 27, 2025 at 12:02:27PM +0200, Laurent Pinchart wrote:
> > > Hi Oleksij,
> > > > Please note, RTL8211E PHY do use undocumented SmartEEE mode by default.
> > > > It ignores RGMII LPI opcodes and doing own thing. It can be confirmed by
> > > > monitoring RGMII TX and MDI lines with oscilloscope and changing
> > > > tx-timer configurations. I also confirmed this information from other
> > > > source. To disable SmartEEE and use plain MAC based mode, NDA documentation
> > > > is needed.
> > > 
> > > That's useful information, thank you. Would you by any chance to know if
> > > such NDA would allow contributing the feature upstream ?
> > 
> > Good question, but the NDA process was actually aborted. We didn't move
> > forward due to a lack of time and ultimately, a lack of commercial
> > interest from any projects or customers for this PHY.
> 
> Fair enough. I've tried :-)
> 
> If we can't disable SmartEEE in the PHY, does it mean we need to somehow
> disable EEE in the MAC, but still program the PHY to advertise EEE to
> the link partner ?

Or maybe the PHY needs to have EEE capability disabled?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
