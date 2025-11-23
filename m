Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF011DE3DC
	for <imx@lists.linux.dev>; Sun, 23 Nov 2025 15:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763911466; cv=none; b=kYhEiOd42vbkTDeKOEiH1DYVI7plgOBuO1Pd6QWrKaXXrQT+NjLZALpVIESTA1f6hMCl5RaZT1NohlrWj6iUdSUmCMjnRRPdkOl4j2KB0P16kOGSBzr402L+M9QmCSNuX/sAjtiZgxkVVc4b9Xrcdj6T3CYKWqp6ErdnxmT/rao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763911466; c=relaxed/simple;
	bh=Bt4lvQ5tWEOJMSObtokBzF/TdUkPAMNtm/HTu/psEx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jMVPydXaTK8NOaSACcmyLsdY/uZOk9K0yPfW07bNjtaR0T5t/mVe4upzhJvr4CpwdYmsQdt4vuMle/mATRj4RqYAhuXLXX1JbnZUkWYyoEMu7JBO3+IsfYuR8UsTx4hFAYrorFTcSfrsYMdwmYSovAvzrdhXqBalFSkDzjluG1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EbflPeNF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EbflPeNF"
Received: from pendragon.ideasonboard.com (fs276ed015.tkyc509.ap.nuro.jp [39.110.208.21])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 14DAC606;
	Sun, 23 Nov 2025 16:22:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763911334;
	bh=Bt4lvQ5tWEOJMSObtokBzF/TdUkPAMNtm/HTu/psEx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EbflPeNFP+y3b2qf6OOI8rlkd4xuRtz3rnSvaLoxbJc7QwPSAj9g9f4RbBbvzsWYj
	 ywbEhANIfkrXp4Qlydvquw1AKvpUWP9AcF5yryvcgR/kNxeQyPsw45FgL5BQrsWs75
	 r3mIuS3NNd5uQeKwXr6D7jpRiiMmj2atu6ETuvag=
Date: Mon, 24 Nov 2025 00:23:56 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Message-ID: <20251123152356.GF15447@pendragon.ideasonboard.com>
References: <aRR3gVsZcr01zwzN@shell.armlinux.org.uk>
 <20251112222551.GB9135@pendragon.ideasonboard.com>
 <20251113010627.GC9135@pendragon.ideasonboard.com>
 <aRW6CxvmIEqkMrfA@shell.armlinux.org.uk>
 <20251114222654.GI30434@pendragon.ideasonboard.com>
 <PAXPR04MB8510E17B2B8C612DD02175CE88D6A@PAXPR04MB8510.eurprd04.prod.outlook.com>
 <20251122072246.GA16239@pendragon.ideasonboard.com>
 <aSGJHV9Sga2kBIBX@shell.armlinux.org.uk>
 <20251123053802.GA25329@pendragon.ideasonboard.com>
 <aSLLMMNkHnfwyO0y@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aSLLMMNkHnfwyO0y@shell.armlinux.org.uk>

On Sun, Nov 23, 2025 at 08:52:00AM +0000, Russell King (Oracle) wrote:
> On Sun, Nov 23, 2025 at 02:38:02PM +0900, Laurent Pinchart wrote:
> > On Sat, Nov 22, 2025 at 09:57:49AM +0000, Russell King (Oracle) wrote:
> > > On Sat, Nov 22, 2025 at 04:22:46PM +0900, Laurent Pinchart wrote:
> > > > Hello Wei,
> > > > 
> > > > On Tue, Nov 18, 2025 at 01:50:55AM +0000, Wei Fang wrote:
> > > > > Sorry, I only have a little experience with DWMac, add Clark to help look
> > > > > at this issue.
> > > > 
> > > > Thank you.
> > > > 
> > > > I think we're getting close to having a good understanding of the
> > > > problem. I've debugged it as far as I could based on the information
> > > > available publicly. Let's try to get to the bottom of this issue, it
> > > > impacts quite a lot of people and it would be very nice to fix it
> > > > properly in mainline.
> > > > 
> > > > The short summary is that I'm experiencing an interrupt storm on IRQ 135
> > > > when EEE is enabled with the EQOS interface.
> > > > 
> > > > My current theory is that
> > > > 
> > > > - The lpi_intr_o signal of the EQOS is OR'ed into IRQ 135.
> > > > - The issue is triggerted by the PHY exiting LPI mode
> > > > - When it exits LPI mode, the PHY restarts generating the RX clock
> > > >   (clk_rx_i).
> > > > - The MAC detects exit from LPI, and asserts lpi_intr_o.
> > > > - Before the CPU has time to process the interrupt, the PHY enters LPI
> > > >   mode again, and stops generating the RX clock.
> > > > - The CPU processes the interrupt and reads the GMAC4_LPI_CTRL_STATUS
> > > >   registers. This does not clear lpi_intr_o as there's no clk_rx_i.
> > > 
> > > Please try setting STMMAC_FLAG_RX_CLK_RUNS_IN_LPI in dwmac-imx.c and
> > > see whether that changes the behaviour.
> > 
> > I have tested that and it worked like a charm ! I have submitted
> > https://lore.kernel.org/r/20251123053518.8478-1-laurent.pinchart@ideasonboard.com
> > 
> > That was quite an adventure. Thank you so much for all your support, I'm
> > not sure I would have managed without you (or at least I would have
> > needed way more time). I really really appreciate it.
> > 
> > If the above patch gets accepted, we will probably be able to remove the
> > eee-broken-* properties from the i.MX8MP device tree files (and possibly
> > from i.MX8DXL and i.MX93 as well). I have mentioned that below the
> > commit message of the patch, with a test procedure as it should be
> > tested on each board.
> 
> As stated in reply to that patch, while this may reduce the severity of
> the storm, I don't think it'll completely eliminate it.
> 
> I made the suggestion to set the flag as a test to confirm whether the
> lpi_intr_o is indeed the problem by ensuring that the receive domain is
> always clocked, and thus ensuring that the signal clears within four
> clock cycles, rather than an indefinite period should the remote end
> re-enter LPI mode quicky.

You're right. I've checked replied to the patch with the following
numbers.

100TX link, eee-broken-* set: 7000 interrupts
1000T link, eee-broken-* set: 2711 interrupts
100TX link, eee-broken-* unset: 9450 interrupts
1000T link, eee-broken-* unset: 6066 interrupts

-- 
Regards,

Laurent Pinchart
