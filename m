Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0694A23E229
	for <imx@lists.linux.dev>; Sun, 23 Nov 2025 08:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763887928; cv=none; b=aTHK1MoV3RwxSvs+YoPE2dg1XZe6q0Op0BthTJd/DVl+31nBs64S3ThO62c+7XGA8Q3W+e9+fCpMjqgcuG5KXzs9qiYvj+71f4xmemNopvBRfjw0RiM+PtbwgUhjrvC4x7oqbmrIyZwhtf1ZEzBjPss/639exXgeFrz0WNznc7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763887928; c=relaxed/simple;
	bh=02Bz10I4K+HR8jFtuKmfG+Qa2AqlnQ5w82L+cQeF5+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R8s2ULGgrDwSKkvHzdDMDT+xzvyyC81v+/ZF36eCpJYQ1lqO7XsFHFisx+/wU9PxwbB7alJ3APBP0VqKngLHaP3EjeEnfdhELFiJqccOrKZ5YHMSK6zNzk8Z+XPIq0FRiqFiI/jAT4pEXnuS89ASDneiUhf950eQHk1Ao1xhCGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=pnoeNTFY; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="pnoeNTFY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=08g22nr12SGt1AMC1UScMdDYRZ8GFxl1IyYsNJMcbEk=; b=pnoeNTFYDtS4uizYE1TPiZFfYv
	f/u0SWkdsnAHZna7A23UyrlfRXJRjv6Q2IK2g5/GARBjf4u1HCd0eiAXa7oe+snQ1Y6Q/mahtaWAe
	/StrZ1wKMjb14xjrDzbpE39PDymsGs16AfmM8iZa29roKUYUBvO069lcj/pYBlrSEHHqC90dbjOs3
	/FuULFhUVnRYTfSOAVDKkZgcScHJOhtsAsYEKcJeGByNUCUCeGfr0m8YmqR20WiXsGLD0E2Zsoajd
	MJIol+qkPpJsTFgFaABOQvVW65sSYowJHUUhayEBORwiIclZqu2SjT4yECkONn2Sp5FBsdalkGmbp
	M/tIOwhg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51102)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vN5pC-000000000la-0TJi;
	Sun, 23 Nov 2025 08:52:02 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vN5pA-0000000079L-2FWx;
	Sun, 23 Nov 2025 08:52:00 +0000
Date: Sun, 23 Nov 2025 08:52:00 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Wei Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
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
Message-ID: <aSLLMMNkHnfwyO0y@shell.armlinux.org.uk>
References: <20251111235434.GA25874@pendragon.ideasonboard.com>
 <aRR3gVsZcr01zwzN@shell.armlinux.org.uk>
 <20251112222551.GB9135@pendragon.ideasonboard.com>
 <20251113010627.GC9135@pendragon.ideasonboard.com>
 <aRW6CxvmIEqkMrfA@shell.armlinux.org.uk>
 <20251114222654.GI30434@pendragon.ideasonboard.com>
 <PAXPR04MB8510E17B2B8C612DD02175CE88D6A@PAXPR04MB8510.eurprd04.prod.outlook.com>
 <20251122072246.GA16239@pendragon.ideasonboard.com>
 <aSGJHV9Sga2kBIBX@shell.armlinux.org.uk>
 <20251123053802.GA25329@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251123053802.GA25329@pendragon.ideasonboard.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Sun, Nov 23, 2025 at 02:38:02PM +0900, Laurent Pinchart wrote:
> Hi Russell,
> 
> On Sat, Nov 22, 2025 at 09:57:49AM +0000, Russell King (Oracle) wrote:
> > On Sat, Nov 22, 2025 at 04:22:46PM +0900, Laurent Pinchart wrote:
> > > Hello Wei,
> > > 
> > > On Tue, Nov 18, 2025 at 01:50:55AM +0000, Wei Fang wrote:
> > > > Sorry, I only have a little experience with DWMac, add Clark to help look
> > > > at this issue.
> > > 
> > > Thank you.
> > > 
> > > I think we're getting close to having a good understanding of the
> > > problem. I've debugged it as far as I could based on the information
> > > available publicly. Let's try to get to the bottom of this issue, it
> > > impacts quite a lot of people and it would be very nice to fix it
> > > properly in mainline.
> > > 
> > > The short summary is that I'm experiencing an interrupt storm on IRQ 135
> > > when EEE is enabled with the EQOS interface.
> > > 
> > > My current theory is that
> > > 
> > > - The lpi_intr_o signal of the EQOS is OR'ed into IRQ 135.
> > > - The issue is triggerted by the PHY exiting LPI mode
> > > - When it exits LPI mode, the PHY restarts generating the RX clock
> > >   (clk_rx_i).
> > > - The MAC detects exit from LPI, and asserts lpi_intr_o.
> > > - Before the CPU has time to process the interrupt, the PHY enters LPI
> > >   mode again, and stops generating the RX clock.
> > > - The CPU processes the interrupt and reads the GMAC4_LPI_CTRL_STATUS
> > >   registers. This does not clear lpi_intr_o as there's no clk_rx_i.
> > 
> > Please try setting STMMAC_FLAG_RX_CLK_RUNS_IN_LPI in dwmac-imx.c and
> > see whether that changes the behaviour.
> 
> I have tested that and it worked like a charm ! I have submitted
> https://lore.kernel.org/r/20251123053518.8478-1-laurent.pinchart@ideasonboard.com
> 
> That was quite an adventure. Thank you so much for all your support, I'm
> not sure I would have managed without you (or at least I would have
> needed way more time). I really really appreciate it.
> 
> If the above patch gets accepted, we will probably be able to remove the
> eee-broken-* properties from the i.MX8MP device tree files (and possibly
> from i.MX8DXL and i.MX93 as well). I have mentioned that below the
> commit message of the patch, with a test procedure as it should be
> tested on each board.

As stated in reply to that patch, while this may reduce the severity of
the storm, I don't think it'll completely eliminate it.

I made the suggestion to set the flag as a test to confirm whether the
lpi_intr_o is indeed the problem by ensuring that the receive domain is
always clocked, and thus ensuring that the signal clears within four
clock cycles, rather than an indefinite period should the remote end
re-enter LPI mode quicky.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
