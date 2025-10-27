Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4A42F6561
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 10:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761561898; cv=none; b=SNZTyrnzV2lr2lmu2DWCVxfScqC/RkeJJGyN2GPKiAjms6kV7RarMQ70s4zy7wTmOwgsCBjSKR8nBA7AMXblIKmc9MSN/vAdDG4ZzjFYOrMfQazuhp/cPyy2+SXXSKBCzWpJn8oyDk3RsUoFzyJH5OJNCmwgol57prC37KrG7Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761561898; c=relaxed/simple;
	bh=Ubcj3waXWImVhuNpCT/SGdfySsuwAGjNz/1ztlKhhZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AF/mn94FJABYXycwQze2JCzlUQ8/kH3KlYEtTzXn87GHl+Ip5pGFLpTLbIJg4ptYGJ66OBtTIo9c5urzjMqqr44XCWT4z07DhwXPVnzgvIX0MVluVlVnMhFsRvlsZLbSZ9QjosN7NeQqAr7Bz6zyMXeSgJuw+uykUKC34g3bBdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vDKia-0006rM-Tt; Mon, 27 Oct 2025 11:44:52 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vDKia-005gp8-28;
	Mon, 27 Oct 2025 11:44:52 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vDKia-0039Jo-1h;
	Mon, 27 Oct 2025 11:44:52 +0100
Date: Mon, 27 Oct 2025 11:44:52 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	imx@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <aP9NJHtbAEmsd89r@pengutronix.de>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <aP83bMDWCre7-Sjw@pengutronix.de>
 <20251027100227.GE1544@pendragon.ideasonboard.com>
 <aP9IB4y5_gyfJGMW@pengutronix.de>
 <20251027103107.GF1544@pendragon.ideasonboard.com>
 <aP9Kuyndws_dYFna@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aP9Kuyndws_dYFna@shell.armlinux.org.uk>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On Mon, Oct 27, 2025 at 10:34:35AM +0000, Russell King (Oracle) wrote:
> On Mon, Oct 27, 2025 at 12:31:07PM +0200, Laurent Pinchart wrote:
> > On Mon, Oct 27, 2025 at 11:23:03AM +0100, Oleksij Rempel wrote:
> > > On Mon, Oct 27, 2025 at 12:02:27PM +0200, Laurent Pinchart wrote:
> > > > Hi Oleksij,
> > > > > Please note, RTL8211E PHY do use undocumented SmartEEE mode by default.
> > > > > It ignores RGMII LPI opcodes and doing own thing. It can be confirmed by
> > > > > monitoring RGMII TX and MDI lines with oscilloscope and changing
> > > > > tx-timer configurations. I also confirmed this information from other
> > > > > source. To disable SmartEEE and use plain MAC based mode, NDA documentation
> > > > > is needed.
> > > > 
> > > > That's useful information, thank you. Would you by any chance to know if
> > > > such NDA would allow contributing the feature upstream ?
> > > 
> > > Good question, but the NDA process was actually aborted. We didn't move
> > > forward due to a lack of time and ultimately, a lack of commercial
> > > interest from any projects or customers for this PHY.
> > 
> > Fair enough. I've tried :-)
> > 
> > If we can't disable SmartEEE in the PHY, does it mean we need to somehow
> > disable EEE in the MAC, but still program the PHY to advertise EEE to
> > the link partner ?
> 
> Or maybe the PHY needs to have EEE capability disabled?

Ack. With comment in the code, why we prefer this way, in case some one
wont to spend time on making it work. Probably SmartEEE or some other
word should be used.

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
