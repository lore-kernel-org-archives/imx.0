Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09E521257A
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 09:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761555677; cv=none; b=BvpzD2A13/+0Za+Yy7YelS2xWLKb+GwT/E6KYWX09zi2hvsJY1whuqm/RJES46ak7BOgpJU5HUxQN/TNcxfTbdzMfitNN1gboMAY+xleguhNjbUFtHdz7qUT2jf/lB/u70pb74bf9LvPo8rPCPCmWiDlwarbUhr5KX1Lz0tqUGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761555677; c=relaxed/simple;
	bh=93zcWOubBpJOVvcSXAcork7vO8x4roxCUclQHFzT1/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HWLEHmkvbnrCARh3wLB+diRb76ie5mUrE73CjUcugTg2jTm9MTzhf6Pd5mqhuEw8ckmBFHwYue+ya5GD5avGbqPjsOldCg1LPRPiGrC/mCWyv6PS5DcmX22khMaqmSiJYZioGi/VaG3FzuBBVDJ/VamVLgfkMI/HX0h++NLbi+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=LGlhgsEk; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="LGlhgsEk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uBCPH9CNd9XXGstm2iZeSKIMmzZ0uQVoStCqibfPm8U=; b=LGlhgsEkGUp0jzQbHm3t/o8klI
	Ljmz0CzEbwP49R2wtfn//7YiceltUggkega9dF/FoaqnVxyoY5QiZwzmUy5EfSpSLpRJ2XcJKa6X3
	I7XVKRTL4GU1AvwDaDjPaSZvzVXqnWj89NxIXZ9kS0oGLr259AVZUfn18mcHohf0mdgLR3cuqdV4X
	03gwoGX7FLRFTqTCeCuHc1fTkThP7iQLmPkjnz1cj0JsCnPy82readQtz10/RuXti5KlepyvnGiQJ
	4RdN9QGpl7ES2UYkS+xgF+4l54SK8f1vHV3tLy6ThNlwD0cvaaM5YZ8JfIpfq1meEx+hNeZKQOyfH
	uJD48C1w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54262)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vDJ65-000000001WV-3dDE;
	Mon, 27 Oct 2025 09:01:01 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vDJ63-000000005Ri-2hLJ;
	Mon, 27 Oct 2025 09:00:59 +0000
Date: Mon, 27 Oct 2025 09:00:59 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <aP80y6hQmCnxDoeC@shell.armlinux.org.uk>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <20251027072749.GA7811@pendragon.ideasonboard.com>
 <341f56de-9dde-4c44-9542-b523e1917dcb@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <341f56de-9dde-4c44-9542-b523e1917dcb@gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Oct 27, 2025 at 09:47:53AM +0100, Emanuele Ghidoli wrote:
> On 27/10/2025 08:27, Laurent Pinchart wrote:
> > Hi Andrew,
> > 
> > Thank you for your quick reply.
> > 
> > On Mon, Oct 27, 2025 at 04:08:42AM +0100, Andrew Lunn wrote:
> >> Adding Russell King
> >>
> >> On Sun, Oct 26, 2025 at 02:29:04PM +0200, Laurent Pinchart wrote:
> >>> Energy Efficient Ethernet (EEE) is broken at least for 1000T on the EQOS
> >>> (DWMAC) interface. When connected to an EEE-enabled peer, the ethernet
> >>> devices produces an interrupts storm. Disable EEE support to fix it.
> >>>
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> ---
> >>> The exact reason for the interrupt storm is unknown, and my attempts to
> >>> diagnose it was hindered by my lack of expertise with DWMAC. As far as I
> >>> understand, the DWMAC implements EEE support, and so does the RTL8211E
> >>> PHY according to its datasheet.
> >>
> >> I believe for DWMAC it is a synthesis option. However, there is a bit
> >> indicating if the hardware supports it.
> >>
> >> The PHY should not be able to trigger an interrupt storm in the
> >> MAC. So this is likely to be an DWMAC issue.
> >>
> >> Which interrupt bit is causing the storm?
> > 
> > That's where I hit my first wall :-)
> > 
> > I've tried to diagnose the issue by adding interrupt counters to
> > dwmac4_irq_status(), counting interrupts for each bit of GMAC_INT_STATUS
> > (0x00b0). Bit RGSMIIIS (0) is the only one that seems linked to the
> > interrupts storm, increasing at around 10k per second. However, the
> > corresponding bit in GMAC_INT_EN (0x00b4) is *not* set.
> > 
> > The ENET_EQOS interrupt on the i.MX8MP is an OR'ed signal that combines
> > four interrupt sources:
> > 
> > - ENET QOS TSN LPI RX exit Interrupt
> > - ENET QOS TSN Host System Interrupt
> > - ENET QOS TSN Host System RX Channel Interrupts
> > - ENET QOS TSN Host System TX Channel Interrupts
> > 
> > The last two interrupt sources are themselves local OR of channels[4:0].
> > 
> > I ould suspect that the LPI RX exit interrupt is the one that fires
> > constantly given its name, but I'm not sure how to test that.
> > 
> >>> What each side does exactly is unknown
> >>> to me. One theory I've heard to explain the issue is that the two
> >>> implementations conflict. There is no register in the RTL8211E PHY to
> >>> disable EEE on the PHY side while still advertising its support to the
> >>> peer and relying on the implementation in the DWMAC (if this even makes
> >>> sense)
> >>
> >> It does not make sense. EEE is split into two major parts. The two
> >> PHYs communicate with each other to negotiate the feature, if both
> >> ends support it and both ends want to use it. The result of this
> >> negotiation is then passed to the MACs.
> >>
> >> It is then the MAC who decides when to send a Low Power Indication to
> >> the PHY to tell the PHY to enter low power mode. The MAC also wakes
> >> the PHY when it has packets to send.
> >>
> >> A quick look at the data sheet for the RTL8211E suggests this is what
> >> is supports.
> >>
> >> There are a few PHYs which implement SmartEEE, or some other similar
> >> name. They operate differently, the PHY does it all, and the MAC is
> >> not even aware EEE is happening. Such PHYs should really only be
> >> paired with MACs which do not support EEE. An EEE capable MAC paired
> >> with a SmartEEE PHY could have problems, but hopefully the EEE
> >> abilities and negotiation registers in the PHY would be sufficient to
> >> dissuade the MAC from doing EEE. But i would not expect a setup like
> >> this to trigger an interrupt storm.
> > 
> > Thanks for the explanation, I read documents to try and figure out how
> > it worked and didn't find such a clear and concise high-level summary.
> > 
> > I'm not very experienced with ethernet, but I can easily test patches or
> > even rough ideas on hardware.
> > 
> 
> Hi Laurent,
> I had the same problem, interrupt storm plus link instability with dwmac.

You never said that in your patch description. You said "it causes
link instability and communication failures." Have you investigated
what the cause of the interrupt storm is?

> I found out that 2c81f3357136 ("net: stmmac: convert to phylink PCS support")
> commit is the one causing the problem to me.

You claim this commit enables EEE by default. It does. However, stmmac
_before_ this commit enables EEE by default as I've already explained,
quoting the old code which effects this. I've asked you to test
further. So far, I've heard nothing back.

What has changed is that we no longer do anything with the RGSMIIS
status, and in theory keep the mask/enable for this disabled. Howeer,
that is a subsequent commit.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
