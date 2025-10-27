Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BEF2F5A33
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 10:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761559367; cv=none; b=S/l3PhluR3gt7FRU5GhBGKaH/Br5pLS3Be6+QeYwKer9RfgbhHOPR2ygoxjMSbLRCK6Cl/SqKoUACJmZmCC6HOAmIED9OjJ8Q1+cdThSGfC3VfTEznFFTIhiqZ2hDYvzbT5QoFoTRuCi0TqOzV16/EHQOgFKZob2YKyDd60+FZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761559367; c=relaxed/simple;
	bh=oK4MAK69sWkbk17ePUCVJkTmSfCbcfChTa3yzciFfCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GoyqnwZBhsiQYE7hKTNNy1pAy4VoH9ToJBeVapKBasLLmjyfvAfz2TpRh/FdYtupAa6Mwf2Bwqznh9H7j/1KtMtbKjFaoFHZKJSYT6vlvU8IVaMNhAQq44a514VUvik8jOTqcQ8LlnNzB3INryi775Kq06jl9AZucQTR801reX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gvZwhuMO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gvZwhuMO"
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 333831661;
	Mon, 27 Oct 2025 11:00:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761559255;
	bh=oK4MAK69sWkbk17ePUCVJkTmSfCbcfChTa3yzciFfCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gvZwhuMOZqzmB1g3j3ERKzn65qoVI2LnEaaIhmJCxS5l9MLEa7nDNA5PhOrw6B0xY
	 147oYuIZRQ/Fk4BWR0OplbvMWn5GQZFvuT175LT2qBY7sjl8FdEnHrhvzQ3rHdIIlX
	 1+Cn5HGek8rFHs0xxnZhLhwhJEJGNo963so3fo9o=
Date: Mon, 27 Oct 2025 12:02:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Russell King <rmk+kernel@armlinux.org.uk>,
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
Message-ID: <20251027100227.GE1544@pendragon.ideasonboard.com>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <aP83bMDWCre7-Sjw@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aP83bMDWCre7-Sjw@pengutronix.de>

Hi Oleksij,

On Mon, Oct 27, 2025 at 10:12:12AM +0100, Oleksij Rempel wrote:
> On Mon, Oct 27, 2025 at 04:08:42AM +0100, Andrew Lunn wrote:
> > Adding Russell King
> >
> > On Sun, Oct 26, 2025 at 02:29:04PM +0200, Laurent Pinchart wrote:
> > > Energy Efficient Ethernet (EEE) is broken at least for 1000T on the EQOS
> > > (DWMAC) interface. When connected to an EEE-enabled peer, the ethernet
> > > devices produces an interrupts storm. Disable EEE support to fix it.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > The exact reason for the interrupt storm is unknown, and my attempts to
> > > diagnose it was hindered by my lack of expertise with DWMAC. As far as I
> > > understand, the DWMAC implements EEE support, and so does the RTL8211E
> > > PHY according to its datasheet.
> >
> > I believe for DWMAC it is a synthesis option. However, there is a bit
> > indicating if the hardware supports it.
> >
> > The PHY should not be able to trigger an interrupt storm in the
> > MAC. So this is likely to be an DWMAC issue.
> >
> > Which interrupt bit is causing the storm?
> >
> > > What each side does exactly is unknown
> > > to me. One theory I've heard to explain the issue is that the two
> > > implementations conflict. There is no register in the RTL8211E PHY to
> > > disable EEE on the PHY side while still advertising its support to the
> > > peer and relying on the implementation in the DWMAC (if this even makes
> > > sense)
> >
> > It does not make sense. EEE is split into two major parts. The two
> > PHYs communicate with each other to negotiate the feature, if both
> > ends support it and both ends want to use it. The result of this
> > negotiation is then passed to the MACs.
> >
> > It is then the MAC who decides when to send a Low Power Indication to
> > the PHY to tell the PHY to enter low power mode. The MAC also wakes
> > the PHY when it has packets to send.
> >
> > A quick look at the data sheet for the RTL8211E suggests this is what
> > is supports.
> >
> > There are a few PHYs which implement SmartEEE, or some other similar
> > name. They operate differently, the PHY does it all, and the MAC is
> > not even aware EEE is happening. Such PHYs should really only be
> > paired with MACs which do not support EEE. An EEE capable MAC paired
> > with a SmartEEE PHY could have problems, but hopefully the EEE
> > abilities and negotiation registers in the PHY would be sufficient to
> > dissuade the MAC from doing EEE. But i would not expect a setup like
> > this to trigger an interrupt storm.
> 
> Please note, RTL8211E PHY do use undocumented SmartEEE mode by default.
> It ignores RGMII LPI opcodes and doing own thing. It can be confirmed by
> monitoring RGMII TX and MDI lines with oscilloscope and changing
> tx-timer configurations. I also confirmed this information from other
> source. To disable SmartEEE and use plain MAC based mode, NDA documentation
> is needed.

That's useful information, thank you. Would you by any chance to know if
such NDA would allow contributing the feature upstream ?

-- 
Regards,

Laurent Pinchart
