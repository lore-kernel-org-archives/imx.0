Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECDD2DEA62
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 07:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761550089; cv=none; b=YAaIwqbaqtxTAzaX57bC2NRWyc6WScoEHyJU/ax7KKeRHoQkXEmgmrd3Lz6NsxgGTGdSQWwspu0RVrPgcZtuU2jhNZAD+Uk8mlQhGoRWyWaKrBsaeflQapknBLoipOH8NCbDJJxAYVfTwaMr2e1dExHa9A4eEkPAvNHVLUy53Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761550089; c=relaxed/simple;
	bh=nV6mjljtSiqp1HDPBtXcTVzwk2D3tvRV9nQU+7XBJ2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AtGTndPO30xc/KMJc+WIDVZLQS2gT08M/QMwxz7AncHF364qOk6ejRk009aOfbzLgx6vD93WaE1FqEal+PW3BQNvH+SvT3itN1/HUKY6xBTXX4krOOAtxQqzeRPLJRDNmkpLpHxRMPrRySU+GTK8BtOMcaKvvvtQ38K9QqSB6P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=i/ZdOlT5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="i/ZdOlT5"
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 962CE1122;
	Mon, 27 Oct 2025 08:26:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761549975;
	bh=nV6mjljtSiqp1HDPBtXcTVzwk2D3tvRV9nQU+7XBJ2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i/ZdOlT5pqjrSSr8mGMqlLVyFDVB8mvVJmQNs0n4GGcTLtszoJp1/WUvmltIeLksE
	 BZg1RRavIm2Q4tFIonaQil3eJqc7ui+MiSAry9TAM1N2RevWiGsNWNxioBhcMHqnJX
	 LP5ln83vjsBB3j31BV2BB5IRbp4lKG2jc6oZAL7Q=
Date: Mon, 27 Oct 2025 09:27:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Russell King <rmk+kernel@armlinux.org.uk>, devicetree@vger.kernel.org,
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
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <20251027072749.GA7811@pendragon.ideasonboard.com>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>

Hi Andrew,

Thank you for your quick reply.

On Mon, Oct 27, 2025 at 04:08:42AM +0100, Andrew Lunn wrote:
> Adding Russell King
> 
> On Sun, Oct 26, 2025 at 02:29:04PM +0200, Laurent Pinchart wrote:
> > Energy Efficient Ethernet (EEE) is broken at least for 1000T on the EQOS
> > (DWMAC) interface. When connected to an EEE-enabled peer, the ethernet
> > devices produces an interrupts storm. Disable EEE support to fix it.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > The exact reason for the interrupt storm is unknown, and my attempts to
> > diagnose it was hindered by my lack of expertise with DWMAC. As far as I
> > understand, the DWMAC implements EEE support, and so does the RTL8211E
> > PHY according to its datasheet.
> 
> I believe for DWMAC it is a synthesis option. However, there is a bit
> indicating if the hardware supports it.
> 
> The PHY should not be able to trigger an interrupt storm in the
> MAC. So this is likely to be an DWMAC issue.
> 
> Which interrupt bit is causing the storm?

That's where I hit my first wall :-)

I've tried to diagnose the issue by adding interrupt counters to
dwmac4_irq_status(), counting interrupts for each bit of GMAC_INT_STATUS
(0x00b0). Bit RGSMIIIS (0) is the only one that seems linked to the
interrupts storm, increasing at around 10k per second. However, the
corresponding bit in GMAC_INT_EN (0x00b4) is *not* set.

The ENET_EQOS interrupt on the i.MX8MP is an OR'ed signal that combines
four interrupt sources:

- ENET QOS TSN LPI RX exit Interrupt
- ENET QOS TSN Host System Interrupt
- ENET QOS TSN Host System RX Channel Interrupts
- ENET QOS TSN Host System TX Channel Interrupts

The last two interrupt sources are themselves local OR of channels[4:0].

I ould suspect that the LPI RX exit interrupt is the one that fires
constantly given its name, but I'm not sure how to test that.

> > What each side does exactly is unknown
> > to me. One theory I've heard to explain the issue is that the two
> > implementations conflict. There is no register in the RTL8211E PHY to
> > disable EEE on the PHY side while still advertising its support to the
> > peer and relying on the implementation in the DWMAC (if this even makes
> > sense)
> 
> It does not make sense. EEE is split into two major parts. The two
> PHYs communicate with each other to negotiate the feature, if both
> ends support it and both ends want to use it. The result of this
> negotiation is then passed to the MACs.
> 
> It is then the MAC who decides when to send a Low Power Indication to
> the PHY to tell the PHY to enter low power mode. The MAC also wakes
> the PHY when it has packets to send.
> 
> A quick look at the data sheet for the RTL8211E suggests this is what
> is supports.
> 
> There are a few PHYs which implement SmartEEE, or some other similar
> name. They operate differently, the PHY does it all, and the MAC is
> not even aware EEE is happening. Such PHYs should really only be
> paired with MACs which do not support EEE. An EEE capable MAC paired
> with a SmartEEE PHY could have problems, but hopefully the EEE
> abilities and negotiation registers in the PHY would be sufficient to
> dissuade the MAC from doing EEE. But i would not expect a setup like
> this to trigger an interrupt storm.

Thanks for the explanation, I read documents to try and figure out how
it worked and didn't find such a clear and concise high-level summary.

I'm not very experienced with ethernet, but I can easily test patches or
even rough ideas on hardware.

-- 
Regards,

Laurent Pinchart
