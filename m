Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54B6334681
	for <imx@lists.linux.dev>; Thu, 13 Nov 2025 10:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763031571; cv=none; b=vDNnvP9KjwBWduGGaOlzryqvdRDp0lmM4jfsNQaMkOUDgZ0Sjeek0YRDPJLin0BtU8SRH1BNKsuVR9LqZAhfGbjDllFZ43+sC9EepRnl6egM+ax1MP1+d8kVzEmL4fCPiyt43RETeWpKPVSPq1UXc0QOsRTrREVsxMVREP2HDFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763031571; c=relaxed/simple;
	bh=Ludw0lVw+NCqkO+gYIR/P40wGOIX716edDfNBOXG488=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6/6BvMJ7AhK6WN3h0F9AfoiPYwmtUN/K6EriQ9MQ6xSdzBF22XLeqafR5RV0izCnzNfqS0jSSlXkdbQ3A0k16tbtNPALnPIUFMRxSmjRlZIXRx872yIz02NNa0/l3aS8CyS0C+H+CxYx/Xe0otOZqvDiEWndfNQNaLXICFaAHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=yKV4hulO; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="yKV4hulO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/5WNpQnXexzvUnL0SZ99IdSXhXmMgcUViaTDBYNlqpc=; b=yKV4hulOarStJW8vTLYXGFp8YA
	rPoIOcXqdG4NMjw9GmU20MW0ESE5LKgb8jupmnv7SWYVMlRoVAiBEIpZdJOXz5E2BRHUqJl0I4szj
	20xFQK4HyPgyDNaxzZevSwX6Z041S+7a+AjiK1AAPYzVkayuivmVCKvYkCaEmvCiM0mZNH7IMxBsP
	/LgrL1DDv3AzBh3uR14PjP/9in40tvpo6RXZsU5mBUNy7nrfy8aj4+3X/GeocEKxEDTBj+s6VK8Lx
	NtSKPfzY1MDJEs12eqjvdu5VeRoWD26mZdyFIENjHQ2h2F+G1iulhoU0gErD1FEA4TkIT1wGjnC7Q
	WIOgBTpw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58100)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vJV2z-000000005JA-1Pjw;
	Thu, 13 Nov 2025 10:59:25 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vJV2x-000000004n0-0xU7;
	Thu, 13 Nov 2025 10:59:23 +0000
Date: Thu, 13 Nov 2025 10:59:23 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
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
	Shawn Guo <shawnguo@kernel.org>,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <aRW6CxvmIEqkMrfA@shell.armlinux.org.uk>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <aP-ML-A_h13pXY2d@shell.armlinux.org.uk>
 <20251027234648.GC24987@pendragon.ideasonboard.com>
 <aQAVE96NAD4Z4lgt@shell.armlinux.org.uk>
 <20251028071817.GX13023@pendragon.ideasonboard.com>
 <20251111235434.GA25874@pendragon.ideasonboard.com>
 <aRR3gVsZcr01zwzN@shell.armlinux.org.uk>
 <20251112222551.GB9135@pendragon.ideasonboard.com>
 <20251113010627.GC9135@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113010627.GC9135@pendragon.ideasonboard.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Nov 13, 2025 at 03:06:27AM +0200, Laurent Pinchart wrote:
> On Thu, Nov 13, 2025 at 12:25:52AM +0200, Laurent Pinchart wrote:
> > On Wed, Nov 12, 2025 at 12:03:13PM +0000, Russell King (Oracle) wrote:
> > > On Wed, Nov 12, 2025 at 01:54:34AM +0200, Laurent Pinchart wrote:
> > > > On Tue, Oct 28, 2025 at 09:18:17AM +0200, Laurent Pinchart wrote:
> > > > > I didn't notice it at the time because my board was connected to a
> > > > > switch that didn't support EEE.
> > > > 
> > > > I can confirm that reverting that commit makes the issue disappear. So
> > > > we're dealing with an interrupt storm that occurs when all three of the
> > > > following conditions are true:
> > > > 
> > > > - cpu-pd-wait is enabled
> > > > - EEE is enabled
> > > > - the peer also supports EEE
> > > 
> > > Thanks - overall, please take the statistics and interrupt status bits
> > > with a pinch of salt - I suspect there are cases where the interrupt
> > > is not actually enabled, and the code doesn't take action to clear
> > > down a set status bit, but _does_ count it - so every interrupt that
> > > happens increments the counter.
> > 
> > True. To (partly) avoid that, I've dropped the line that discards
> > disabled bits in dwmac4_irq_status():
> > 
> >  	/* Discard disabled bits */
> > -	intr_status &= intr_enable;
> > 
> > to ensure that all bits are processed and cleared. I then didn't see any
> > high count of any of the GMAC_INT_STATUS interrupts. For
> > MTL_INTERRUPT_STATUS it's a bit different, as by default only one queue
> > is processed.
> > 
> > > > Furthermore, I tried counting bits from all the interrupt status
> > > > registers I could find. The count of MTL_INTERRUPT_STATUS Q0IS to Q4IS
> > > > bits is very high, and so are the DMA_CH0_STATUS TBU and ETI bits.
> > > 
> > > TBU means that the transmitter found that the next buffer was owned by
> > > the "application" rather than the hardware, which would be normal after
> > > getting to the end of the queued packets.
> > > 
> > > ETI means that a packet has been transferred into MTL memory, and thus
> > > would occur for every transmitted packet.
> > > 
> > > Having dug into the imx8m documentation and the driver this morning,
> > > I don't think TBU and ETI are the source of the interrupt storm. Their
> > > corresponding interrupt enable bits are DMA_CHAN_INTR_ENA_TBUE and
> > > DMA_CHAN_INTR_ENA_ETE (driver names). Both of these only appear in a
> > > header file - the code never enables these interrupts. So, TBU and ETI
> > > should not be causing an interrupt storm.
> > > 
> > > As for QxIS, stmmac_common_interrupt() will iterate over the queues
> > > in use, calling stmmac_host_mtl_irq_status() aka dwmac4_irq_mtl_status()
> > > for each. Only if this happens will MTL_CHAN_INT_CTRL() be read which
> > > clears the status bit. In other words, if e.g. Q1IS is set, but only
> > > one queue is being used. dwmac4_irq_mtl_status() won't be called for
> > > queue 1, and thus MTL_CHAN_INT_CTRL() won't be read to clear Q1IS.
> > 
> > That's why I tried to enable all 5 queues in DT, but alas, it didn't
> > help. I'll try again and count all possible interrupts.
> 
> Here's my debug patch (not very pretty, sorry about that):

That's fine. Thanks for providing this and the raw data.

> Here are the corresponding stats captured right after booting to
> userspace, with the 0 counts stripped off to keep the output readable:
> 
>      irq_gmac_0_n: 1

RSGMIIS, disabled, cleared by read of MAC_PHYIF_CONTROL_STATUS.

>      irq_gmac_5_n: 4047

LPIIS, enabled, cleared by read of LPI_CONTROL_STATUS which is done.

>      irq_gmac_18_n: 46

MDIOIS, disabled, clear on read of _this_ status register

>      irq_mtl0_n: 2244307

This will increment each time dwmac4_irq_mtl_status() is called for
channel 0, which will be called each time stmmac_common_interrupt() is
called. Thus, this indicates the total number of times the stmmac
interrupt handler has been called.

>      irq_mtl_0_n: 2244307
>      irq_mtl_1_n: 2244307
>      irq_mtl_2_n: 2244307
>      irq_mtl_3_n: 2244307
>      irq_mtl_4_n: 2244307

These should be cleared by reading the corresponding queue interrupt
control/status register, iow MTL_CHAN_INT_CTRL(). However, we do not
write to MTL_CHAN_INT_CTRL() to enable any of the interrupts there, so
this looks weird to me, so it would be an idea to look at what value
this MTL_CHAN_INT_CTRL() register contains, it may provide something
useful, but I actually suspect it's another red herring.

>      irq_chan0_n: 2244307

Similarly to irq_mtl0_n, this will increment each time
dwmac4_dma_interrupt() is called for channel 0, which will be via
stmmac_napi_check(), stmmac_dma_interrupt() and
stmmac_common_interrupt(). Therefore, it is expected to have the same
value as irq_mtl0_n.

>      irq_chan0_0_n: 333
>      irq_chan0_2_n: 2244307
>      irq_chan0_6_n: 2769
>      irq_chan0_10_n: 2244307
>      irq_chan0_11_n: 2799
>      irq_chan0_15_n: 2701

Only interrupts 0, 6, 12, 14 and 15 are enabled. Status bits in this
register require '1' to be written to clear them. As the value written
back is the status that was read masked by the interrupt enable, if
bits 2 or 10 are set, they will never be cleared, so will increment
each and every time stmmac_common_interrupt() is called. Therefore,
these values are not significant.

> 
> Here are the stats after enabling five queues in DT, also captured right
> after booting to userspace:
> 
>      irq_gmac_0_n: 1
>      irq_gmac_5_n: 4020
>      irq_gmac_18_n: 41
>      irq_mtl0_n: 1286469
>      irq_mtl1_n: 1286469
>      irq_mtl2_n: 1286469
>      irq_mtl3_n: 1286469
>      irq_mtl4_n: 1286469
>      irq_mtl_0_n: 6432345
>      irq_mtl_1_n: 6432345
>      irq_mtl_2_n: 6432345
>      irq_mtl_3_n: 6432345
>      irq_mtl_4_n: 6432345

These values are the sum of irq_mtl[0-4]_n, so would be expected given
the other numbers.

>      irq_chan0_n: 1286469
>      irq_chan1_n: 1286469
>      irq_chan2_n: 1286469
>      irq_chan3_n: 1286469
>      irq_chan4_n: 1286469
>      irq_chan0_0_n: 416
>      irq_chan0_2_n: 1286466
>      irq_chan0_6_n: 3470
>      irq_chan0_10_n: 1286466
>      irq_chan0_11_n: 2740
>      irq_chan0_15_n: 2686
>      irq_chan1_2_n: 1286469
>      irq_chan1_10_n: 1286469
>      irq_chan2_2_n: 1286467
>      irq_chan2_10_n: 1286467
>      irq_chan4_2_n: 1286469
>      irq_chan4_10_n: 1286469

It's slightly interesting that irq_chanX_2_n and irq_chanX_10_n don't
match their corresponding irq_chanX_n values, which implies that they
have been clear. It's likely given that we're talking about 0, 2 or 3
times that's due to the first few packets and these bits hadn't been
set. So again, I don't think TBU and ETI are significant.

> Setting eee-broken-1000t, with a single queue:
> 
>      irq_gmac_0_n: 1
>      irq_gmac_18_n: 6
>      irq_mtl0_n: 2548
>      irq_mtl_0_n: 2548
>      irq_mtl_1_n: 2548
>      irq_mtl_2_n: 2548
>      irq_mtl_3_n: 2548
>      irq_mtl_4_n: 2548
>      irq_chan0_n: 2548
>      irq_chan0_0_n: 282
>      irq_chan0_2_n: 2548
>      irq_chan0_6_n: 2324
>      irq_chan0_10_n: 2548
>      irq_chan0_11_n: 29
>      irq_chan0_15_n: 2548

These counts suggest that the interrupt handler was entered 2548 times
at the point they were captured, which corresponds to "normal"
interrupts for channel 0.

> 
> And eee-broken-1000t with 5 queues:
> 
>      irq_gmac_0_n: 1
>      irq_gmac_18_n: 8
>      irq_mtl0_n: 2672
>      irq_mtl1_n: 2672
>      irq_mtl2_n: 2672
>      irq_mtl3_n: 2672
>      irq_mtl4_n: 2672
>      irq_mtl_0_n: 13360
>      irq_mtl_1_n: 13360
>      irq_mtl_2_n: 13360
>      irq_mtl_3_n: 13360
>      irq_mtl_4_n: 13360
>      irq_chan0_n: 2672
>      irq_chan1_n: 2672
>      irq_chan2_n: 2672
>      irq_chan3_n: 2672
>      irq_chan4_n: 2672
>      irq_chan0_0_n: 283
>      irq_chan0_2_n: 2672
>      irq_chan0_6_n: 2439
>      irq_chan0_10_n: 2672
>      irq_chan0_11_n: 46
>      irq_chan0_15_n: 2672
>      irq_chan2_2_n: 2670
>      irq_chan2_10_n: 2670
>      irq_chan3_2_n: 2672
>      irq_chan3_10_n: 2672

So channel 0 responsible for 2672 normal interrupts. Again, this
reinforces that the other values with 2672 are likely not significant.

> Given the enabled interrupts, I agree that the counters are misleading,
> as none of the interrupt bits with high counts are enabled. I'm however
> not entirely sure about the MTL interrupt status register, it's not
> clear to me if it is wired to the EQOS IRQ line as I don't see a
> corresponding interrupt enable register.
> 
> If we rule out the main EQOS IRQ line and the per-channel RX and TX IRQ
> lines as the source of the interrupt storm, the last possible culprit
> according to section 7.1.2 (A53 Interrupts) of the i.MX8MP reference
> manual would be the "ENET QOS TSN LPI RX exit Interrupt" that is OR'ed
> into IRQ 135. As that's related to EEE, it's a probable culprit, but I
> don't know how what controls that IRQ line.

As you have several interrupt signals which presumably show up in
/proc/interrupts, do the values in your IRQ counters correspond with
those interrupt sources? Are any of these interrupts shared with
anything else?

Hmm, looking at 7.1.2, and the mention of "ENET QOS TSN LPI RX exit
Interrupt" I'm wondering whether Freescale have wired the lpi_intr_o
signal of the GMAC to their OR4 gate. This is the LPI RX exit
interrupt output, and it is cleared when reading the LPI control/
status register. However, its deassertion is synchronous to the RX
clock domain, so it will take time to clear.

The purpose of this signal is to trigger to external hardware (to the
GMAC) to restore the application clock to the MAC. I'm not sure that
this was meant to be wired to an actual CPU interrupt. The only clue
is the name which suggests it is, but there's nothing that states
there's a way to disable it being asserted which makes me more
suspicious that it's not meant to be a CPU interrupt.

So, maybe this is the cause of the interrupt storm. Maybe Kieran isn't
seeing the storm because his receive path is not entering LPI.

I think a useful check for this would be if you could either disable
LPI entry at the link partner, or hook it up to another system which
can have tx_lpi disabled, and see how the iMX8 system behaves.

If preventing the iMX8 receive path entering LPI fixes the problem,
then I think this is likely the culpret.

However, I'd be worred about this - if we "disable LPI" by way of
the advertisement at the local end, there is the possibility that a
remote system could override the negotiation and force its transmit
link into LPI mode, which would cause the iMX8MP receive side to see
LPI entry and exit, triggering this interrupt. If this is correct,
that gives an attacker a way to manipulate the iMX8MP system,
potentially causing all sorts of problems.

Hmm. Not sure I like this look of that.

If this hypothesis is correct, then yes, disabling EEE is the only
way forward for this, but I would suggest going further - ensuring
that SmartEEE is enabled on the PHY but with the advertisement
cleared (so EEE negotiation indicates not supported) to block the
receive side LPI getting to the EQOS.

This also means that 100M EEE would also be affected, so just
disabling 1G EEE in DT is insufficient.

Andrew - if we need to go down this path, I think we need a flag in
the PHY flags to indicate that we want SmartEEE enabled.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
