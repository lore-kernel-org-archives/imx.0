Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C6630F923
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 22:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763159239; cv=none; b=WcOnnxNJhDtU9N3QjBEDnQYAfgc1xvxvcteNePLp2AMuSuCtvbJjk0rwBnGRHXczasCDroQsSAo79j4lS6wS6mJWiR3rWmcrA7Wep1Y1sm2O/uDmirgnk8yWta4sfQEGgDH9v2cnBeYJseee1/ZOeSyJIHz4yPWv5Y47Pr0S4CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763159239; c=relaxed/simple;
	bh=sBjpSk1PtD3sBAJ/TLzGB2sdGtKehGmiCvR7qTenyrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4Wg9fv/UlsRYGCW7KSLJhjodoAZp54VdbsSlWxryP9v9630KdvEF+sni7lCUt8izVTYh+yr3HzD8l9RCJXUMqBzrdOeIr+1W8Uuyx5bj91S0W9aww1NHtGpS+9l7OTUoaxUauXoG4cyBQ3eT0Ryxgr1RpCBq0fr5tEf7cZCowg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FMPVUdvi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FMPVUdvi"
Received: from pendragon.ideasonboard.com (82-203-165-222.bb.dnainternet.fi [82.203.165.222])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 32893161;
	Fri, 14 Nov 2025 23:25:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763159107;
	bh=sBjpSk1PtD3sBAJ/TLzGB2sdGtKehGmiCvR7qTenyrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FMPVUdvi7ua6hV9Vg/Gu4mGWZvy8tUnqx60rmJZ0h0ztIXDZZwmqc6x5ZFjSI17Tp
	 8oKBU1eblSIPqkOhdbSaNjesbhxndv2CiM2F0u5k6g8CKwneKE2N1xD5SBirmCUEvH
	 b7kW/MQVMnYWXCN3rI3vNDugD34k48VhoNa5EOCc=
Date: Sat, 15 Nov 2025 00:26:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
	Shawn Guo <shawnguo@kernel.org>, Fugang Duan <fugang.duan@nxp.com>,
	Joakim Zhang <qiangqing.zhang@nxp.com>, Wei Fang <wei.fang@nxp.com>,
	Yannick Vignon <yannick.vignon@nxp.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <20251114222654.GI30434@pendragon.ideasonboard.com>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <aP-ML-A_h13pXY2d@shell.armlinux.org.uk>
 <20251027234648.GC24987@pendragon.ideasonboard.com>
 <aQAVE96NAD4Z4lgt@shell.armlinux.org.uk>
 <20251028071817.GX13023@pendragon.ideasonboard.com>
 <20251111235434.GA25874@pendragon.ideasonboard.com>
 <aRR3gVsZcr01zwzN@shell.armlinux.org.uk>
 <20251112222551.GB9135@pendragon.ideasonboard.com>
 <20251113010627.GC9135@pendragon.ideasonboard.com>
 <aRW6CxvmIEqkMrfA@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aRW6CxvmIEqkMrfA@shell.armlinux.org.uk>

Dropping Catalin Popescu from CC as his e-mail address bounces, and
adding Fugang Duan, Joakim Zhang, Wei Fang and Yannick Vignong from NXP
who have worked on upstream i.MX8MP support in the driver.

Fugang, Joakim, Wei and Yannick, there's a question for you below.

On Thu, Nov 13, 2025 at 10:59:23AM +0000, Russell King (Oracle) wrote:
> On Thu, Nov 13, 2025 at 03:06:27AM +0200, Laurent Pinchart wrote:
> > On Thu, Nov 13, 2025 at 12:25:52AM +0200, Laurent Pinchart wrote:
> > > On Wed, Nov 12, 2025 at 12:03:13PM +0000, Russell King (Oracle) wrote:
> > > > On Wed, Nov 12, 2025 at 01:54:34AM +0200, Laurent Pinchart wrote:
> > > > > On Tue, Oct 28, 2025 at 09:18:17AM +0200, Laurent Pinchart wrote:
> > > > > > I didn't notice it at the time because my board was connected to a
> > > > > > switch that didn't support EEE.
> > > > > 
> > > > > I can confirm that reverting that commit makes the issue disappear. So
> > > > > we're dealing with an interrupt storm that occurs when all three of the
> > > > > following conditions are true:
> > > > > 
> > > > > - cpu-pd-wait is enabled
> > > > > - EEE is enabled
> > > > > - the peer also supports EEE
> > > > 
> > > > Thanks - overall, please take the statistics and interrupt status bits
> > > > with a pinch of salt - I suspect there are cases where the interrupt
> > > > is not actually enabled, and the code doesn't take action to clear
> > > > down a set status bit, but _does_ count it - so every interrupt that
> > > > happens increments the counter.
> > > 
> > > True. To (partly) avoid that, I've dropped the line that discards
> > > disabled bits in dwmac4_irq_status():
> > > 
> > >  	/* Discard disabled bits */
> > > -	intr_status &= intr_enable;
> > > 
> > > to ensure that all bits are processed and cleared. I then didn't see any
> > > high count of any of the GMAC_INT_STATUS interrupts. For
> > > MTL_INTERRUPT_STATUS it's a bit different, as by default only one queue
> > > is processed.
> > > 
> > > > > Furthermore, I tried counting bits from all the interrupt status
> > > > > registers I could find. The count of MTL_INTERRUPT_STATUS Q0IS to Q4IS
> > > > > bits is very high, and so are the DMA_CH0_STATUS TBU and ETI bits.
> > > > 
> > > > TBU means that the transmitter found that the next buffer was owned by
> > > > the "application" rather than the hardware, which would be normal after
> > > > getting to the end of the queued packets.
> > > > 
> > > > ETI means that a packet has been transferred into MTL memory, and thus
> > > > would occur for every transmitted packet.
> > > > 
> > > > Having dug into the imx8m documentation and the driver this morning,
> > > > I don't think TBU and ETI are the source of the interrupt storm. Their
> > > > corresponding interrupt enable bits are DMA_CHAN_INTR_ENA_TBUE and
> > > > DMA_CHAN_INTR_ENA_ETE (driver names). Both of these only appear in a
> > > > header file - the code never enables these interrupts. So, TBU and ETI
> > > > should not be causing an interrupt storm.
> > > > 
> > > > As for QxIS, stmmac_common_interrupt() will iterate over the queues
> > > > in use, calling stmmac_host_mtl_irq_status() aka dwmac4_irq_mtl_status()
> > > > for each. Only if this happens will MTL_CHAN_INT_CTRL() be read which
> > > > clears the status bit. In other words, if e.g. Q1IS is set, but only
> > > > one queue is being used. dwmac4_irq_mtl_status() won't be called for
> > > > queue 1, and thus MTL_CHAN_INT_CTRL() won't be read to clear Q1IS.
> > > 
> > > That's why I tried to enable all 5 queues in DT, but alas, it didn't
> > > help. I'll try again and count all possible interrupts.
> > 
> > Here's my debug patch (not very pretty, sorry about that):
> 
> That's fine. Thanks for providing this and the raw data.
> 
> > Here are the corresponding stats captured right after booting to
> > userspace, with the 0 counts stripped off to keep the output readable:
> > 
> >      irq_gmac_0_n: 1
> 
> RSGMIIS, disabled, cleared by read of MAC_PHYIF_CONTROL_STATUS.
> 
> >      irq_gmac_5_n: 4047
> 
> LPIIS, enabled, cleared by read of LPI_CONTROL_STATUS which is done.
> 
> >      irq_gmac_18_n: 46
> 
> MDIOIS, disabled, clear on read of _this_ status register
> 
> >      irq_mtl0_n: 2244307
> 
> This will increment each time dwmac4_irq_mtl_status() is called for
> channel 0, which will be called each time stmmac_common_interrupt() is
> called. Thus, this indicates the total number of times the stmmac
> interrupt handler has been called.

Yes, my goal with the irq_mtlX_n counters was to check for which
channels/queues the dwmac4_irq_mtl_status() was called.

> >      irq_mtl_0_n: 2244307
> >      irq_mtl_1_n: 2244307
> >      irq_mtl_2_n: 2244307
> >      irq_mtl_3_n: 2244307
> >      irq_mtl_4_n: 2244307
> 
> These should be cleared by reading the corresponding queue interrupt
> control/status register, iow MTL_CHAN_INT_CTRL(). However, we do not
> write to MTL_CHAN_INT_CTRL() to enable any of the interrupts there, so
> this looks weird to me, so it would be an idea to look at what value
> this MTL_CHAN_INT_CTRL() register contains, it may provide something
> useful, but I actually suspect it's another red herring.

All the MTL_CHAN_INT_CTRL() registers read as 0x00000002, so the
interrupts are not enabled.

> >      irq_chan0_n: 2244307
> 
> Similarly to irq_mtl0_n, this will increment each time
> dwmac4_dma_interrupt() is called for channel 0, which will be via
> stmmac_napi_check(), stmmac_dma_interrupt() and
> stmmac_common_interrupt(). Therefore, it is expected to have the same
> value as irq_mtl0_n.
> 
> >      irq_chan0_0_n: 333
> >      irq_chan0_2_n: 2244307
> >      irq_chan0_6_n: 2769
> >      irq_chan0_10_n: 2244307
> >      irq_chan0_11_n: 2799
> >      irq_chan0_15_n: 2701
> 
> Only interrupts 0, 6, 12, 14 and 15 are enabled. Status bits in this
> register require '1' to be written to clear them. As the value written
> back is the status that was read masked by the interrupt enable, if
> bits 2 or 10 are set, they will never be cleared, so will increment
> each and every time stmmac_common_interrupt() is called. Therefore,
> these values are not significant.

I've commented out the masking in dwmac4_dma_interrupt(), and the
counters show that bits 2 and 10 were indeed not significant:

     irq_gmac_0_n: 1
     irq_gmac_5_n: 3846
     irq_gmac_18_n: 59
     irq_mtl0_n: 2189598
     irq_mtl_0_n: 2189598
     irq_mtl_1_n: 2189598
     irq_mtl_2_n: 2189598
     irq_mtl_3_n: 2189598
     irq_mtl_4_n: 2189598
     irq_chan0_n: 2189598
     irq_chan0_0_n: 258
     irq_chan0_2_n: 2680
     irq_chan0_6_n: 2660
     irq_chan0_10_n: 2682
     irq_chan0_11_n: 1659
     irq_chan0_15_n: 2598
     irq_tx_path_in_lpi_mode_n: 6
     irq_tx_path_exit_lpi_mode_n: 6
     irq_rx_path_in_lpi_mode_n: 2012
     irq_rx_path_exit_lpi_mode_n: 2009
     irq_rgmii_n: 1
     rx_normal_irq_n: 2660
     tx_normal_irq_n: 258
     normal_irq_n: 4577
     q0_tx_irq_n: 258
     q0_rx_irq_n: 2660

There is still an interrupt storm, as shown by bits Q0IS to Q4IS in
MTL_INTERRUPT_STATUS. Those bits are documented in the i.MX8MP RM as

  Queue 0 Interrupt status

  This bit indicates that there is an interrupt from Queue 0. To reset
  this bit, the application must read Queue 0 Interrupt Control and
  Status register to get the exact cause of the interrupt and clear its
  source.

I've added counters for the MTL_CHAN_INT_CTRL() registers bits in
dwmac4_irq_mtl_status():

     irq_gmac_0_n: 1
     irq_gmac_5_n: 4088
     irq_gmac_18_n: 70
     irq_mtl0_n: 2279161
     irq_mtl_0_n: 2279161
     irq_mtl_1_n: 2279161
     irq_mtl_2_n: 2279161
     irq_mtl_3_n: 2279161
     irq_mtl_4_n: 2279161
     irq_mtl_chan0_1_n: 2279161
     irq_chan0_n: 2279161
     irq_chan0_0_n: 269
     irq_chan0_2_n: 2874
     irq_chan0_6_n: 2754
     irq_chan0_10_n: 2871
     irq_chan0_11_n: 1793
     irq_chan0_15_n: 2749
     irq_tx_path_in_lpi_mode_n: 13
     irq_tx_path_exit_lpi_mode_n: 13
     irq_rx_path_in_lpi_mode_n: 2112
     irq_rx_path_exit_lpi_mode_n: 2111
     irq_rgmii_n: 1
     rx_normal_irq_n: 2754
     tx_normal_irq_n: 269
     normal_irq_n: 4816
     q0_tx_irq_n: 269
     q0_rx_irq_n: 2754

I've then modified dwmac4_irq_mtl_status() to write back the status
value to MTL_CHAN_INT_CTRL() unconditionally:

     irq_gmac_0_n: 1
     irq_gmac_5_n: 4429
     irq_gmac_18_n: 96
     irq_mtl0_n: 5165861
     irq_mtl_0_n: 5212
     irq_mtl_1_n: 5165861
     irq_mtl_2_n: 5165861
     irq_mtl_3_n: 5165861
     irq_mtl_4_n: 5165861
     irq_mtl_chan0_1_n: 5212
     irq_chan0_n: 5165861
     irq_chan0_0_n: 274
     irq_chan0_2_n: 2965
     irq_chan0_6_n: 2858
     irq_chan0_10_n: 2965
     irq_chan0_11_n: 1899
     irq_chan0_15_n: 2838
     irq_tx_path_in_lpi_mode_n: 6
     irq_tx_path_exit_lpi_mode_n: 6
     irq_rx_path_in_lpi_mode_n: 2364
     irq_rx_path_exit_lpi_mode_n: 2363
     irq_rgmii_n: 1
     rx_normal_irq_n: 2858
     tx_normal_irq_n: 274
     normal_irq_n: 5031
     q0_tx_irq_n: 274
     q0_rx_irq_n: 2858

As expected, that clears the interrupt source for Q01S, so
irq_mtl_chan0_1_n and irq_mtl_0_n are now under control.Enabling support
for 5 channels in DT:

     irq_gmac_0_n: 1
     irq_gmac_5_n: 4993
     irq_gmac_18_n: 74
     irq_mtl0_n: 3084994
     irq_mtl1_n: 3084994
     irq_mtl2_n: 3084994
     irq_mtl3_n: 3084994
     irq_mtl4_n: 3084994
     irq_mtl_0_n: 5433
     irq_mtl_1_n: 9272
     irq_mtl_2_n: 13218
     irq_mtl_3_n: 17084
     irq_mtl_4_n: 21010
     irq_mtl_chan0_0_n: 1
     irq_mtl_chan0_1_n: 4401
     irq_mtl_chan0_16_n: 1
     irq_mtl_chan1_1_n: 4401
     irq_mtl_chan2_1_n: 4401
     irq_mtl_chan3_1_n: 4401
     irq_mtl_chan4_1_n: 4401
     irq_chan0_n: 3084994
     irq_chan1_n: 3084994
     irq_chan2_n: 3084994
     irq_chan3_n: 3084994
     irq_chan4_n: 3084994
     irq_chan0_0_n: 266
     irq_chan0_2_n: 2923
     irq_chan0_6_n: 2809
     irq_chan0_10_n: 2925
     irq_chan0_11_n: 2203
     irq_chan0_15_n: 2738
     irq_chan1_2_n: 3
     irq_chan1_10_n: 3
     irq_chan2_2_n: 1
     irq_chan2_10_n: 1
     irq_chan3_2_n: 8
     irq_chan3_10_n: 8
     irq_chan4_2_n: 2
     irq_chan4_10_n: 2
     irq_tx_path_in_lpi_mode_n: 6
     irq_tx_path_exit_lpi_mode_n: 6
     irq_rx_path_in_lpi_mode_n: 2633
     irq_rx_path_exit_lpi_mode_n: 2632
     irq_rgmii_n: 1
     rx_normal_irq_n: 2809
     tx_normal_irq_n: 266
     normal_irq_n: 5278
     q0_tx_irq_n: 266
     q0_rx_irq_n: 2809

There are no more storms in interrupt bit counters. The only counters
that are out of control are irq_mtlX_n and irq_chanX_n, as expected, as
they simply count the number of times the IRQ handling functions are
called.

Unless we're missing some interrupt sources in other registers, I think
this indicates that the storm is not caused by the sbd_intr_o or
sbd_perch_[rt]x_intr_o signals. lpi_intr_o seems the most likely culprit
at this point (more on that below).

> > Here are the stats after enabling five queues in DT, also captured right
> > after booting to userspace:
> > 
> >      irq_gmac_0_n: 1
> >      irq_gmac_5_n: 4020
> >      irq_gmac_18_n: 41
> >      irq_mtl0_n: 1286469
> >      irq_mtl1_n: 1286469
> >      irq_mtl2_n: 1286469
> >      irq_mtl3_n: 1286469
> >      irq_mtl4_n: 1286469
> >      irq_mtl_0_n: 6432345
> >      irq_mtl_1_n: 6432345
> >      irq_mtl_2_n: 6432345
> >      irq_mtl_3_n: 6432345
> >      irq_mtl_4_n: 6432345
> 
> These values are the sum of irq_mtl[0-4]_n, so would be expected given
> the other numbers.
> 
> >      irq_chan0_n: 1286469
> >      irq_chan1_n: 1286469
> >      irq_chan2_n: 1286469
> >      irq_chan3_n: 1286469
> >      irq_chan4_n: 1286469
> >      irq_chan0_0_n: 416
> >      irq_chan0_2_n: 1286466
> >      irq_chan0_6_n: 3470
> >      irq_chan0_10_n: 1286466
> >      irq_chan0_11_n: 2740
> >      irq_chan0_15_n: 2686
> >      irq_chan1_2_n: 1286469
> >      irq_chan1_10_n: 1286469
> >      irq_chan2_2_n: 1286467
> >      irq_chan2_10_n: 1286467
> >      irq_chan4_2_n: 1286469
> >      irq_chan4_10_n: 1286469
> 
> It's slightly interesting that irq_chanX_2_n and irq_chanX_10_n don't
> match their corresponding irq_chanX_n values, which implies that they
> have been clear. It's likely given that we're talking about 0, 2 or 3
> times that's due to the first few packets and these bits hadn't been
> set. So again, I don't think TBU and ETI are significant.
> 
> > Setting eee-broken-1000t, with a single queue:
> > 
> >      irq_gmac_0_n: 1
> >      irq_gmac_18_n: 6
> >      irq_mtl0_n: 2548
> >      irq_mtl_0_n: 2548
> >      irq_mtl_1_n: 2548
> >      irq_mtl_2_n: 2548
> >      irq_mtl_3_n: 2548
> >      irq_mtl_4_n: 2548
> >      irq_chan0_n: 2548
> >      irq_chan0_0_n: 282
> >      irq_chan0_2_n: 2548
> >      irq_chan0_6_n: 2324
> >      irq_chan0_10_n: 2548
> >      irq_chan0_11_n: 29
> >      irq_chan0_15_n: 2548
> 
> These counts suggest that the interrupt handler was entered 2548 times
> at the point they were captured, which corresponds to "normal"
> interrupts for channel 0.
> 
> > 
> > And eee-broken-1000t with 5 queues:
> > 
> >      irq_gmac_0_n: 1
> >      irq_gmac_18_n: 8
> >      irq_mtl0_n: 2672
> >      irq_mtl1_n: 2672
> >      irq_mtl2_n: 2672
> >      irq_mtl3_n: 2672
> >      irq_mtl4_n: 2672
> >      irq_mtl_0_n: 13360
> >      irq_mtl_1_n: 13360
> >      irq_mtl_2_n: 13360
> >      irq_mtl_3_n: 13360
> >      irq_mtl_4_n: 13360
> >      irq_chan0_n: 2672
> >      irq_chan1_n: 2672
> >      irq_chan2_n: 2672
> >      irq_chan3_n: 2672
> >      irq_chan4_n: 2672
> >      irq_chan0_0_n: 283
> >      irq_chan0_2_n: 2672
> >      irq_chan0_6_n: 2439
> >      irq_chan0_10_n: 2672
> >      irq_chan0_11_n: 46
> >      irq_chan0_15_n: 2672
> >      irq_chan2_2_n: 2670
> >      irq_chan2_10_n: 2670
> >      irq_chan3_2_n: 2672
> >      irq_chan3_10_n: 2672
> 
> So channel 0 responsible for 2672 normal interrupts. Again, this
> reinforces that the other values with 2672 are likely not significant.
> 
> > Given the enabled interrupts, I agree that the counters are misleading,
> > as none of the interrupt bits with high counts are enabled. I'm however
> > not entirely sure about the MTL interrupt status register, it's not
> > clear to me if it is wired to the EQOS IRQ line as I don't see a
> > corresponding interrupt enable register.
> > 
> > If we rule out the main EQOS IRQ line and the per-channel RX and TX IRQ
> > lines as the source of the interrupt storm, the last possible culprit
> > according to section 7.1.2 (A53 Interrupts) of the i.MX8MP reference
> > manual would be the "ENET QOS TSN LPI RX exit Interrupt" that is OR'ed
> > into IRQ 135. As that's related to EEE, it's a probable culprit, but I
> > don't know how what controls that IRQ line.
> 
> As you have several interrupt signals which presumably show up in
> /proc/interrupts, do the values in your IRQ counters correspond with
> those interrupt sources? Are any of these interrupts shared with
> anything else?

# cat /proc/interrupts 
           CPU0       CPU1       CPU2       CPU3       
  9:          0          0          0          0    GICv3  25 Level     vgic
 11:       4587       5251       5038       5230    GICv3  30 Level     arch_timer
 12:          0          0          0          0    GICv3  27 Level     kvm guest vtimer
 14:       3953       7210       6374       5861    GICv3  79 Level     timer@306a0000
 15:          0          0          0          0    GICv3  60 Level     30880000.serial
 16:        173          0          0          0    GICv3  59 Level     30890000.serial
 17:          0          0          0          0    GICv3  61 Level     30a60000.serial
 18:          0          0          0          0    GICv3  36 Level     30370000.snvs:snvs-powerkey
 19:          0          0          0          0    GICv3  51 Level     rtc alarm
 20:          0          0          0          0    GICv3 110 Level     30280000.watchdog
 21:         52          0          0          0    GICv3  56 Level     mmc2
 23:          0          0          0          0    GICv3  23 Level     arm-pmu
 24:          0          0          0          0    GICv3 130 Level     imx8_ddr_perf_pmu
 30:          0          0          0          0 gpio-mxc   3 Edge      pca9450-irq
 72:          0          0          0          0 gpio-mxc  11 Edge      hym8563
 73:          0          0          0          0 gpio-mxc  12 Edge      30b50000.mmc cd
195:        810          0          0          0    GICv3  67 Level     30a20000.i2c
196:        140          0          0          0    GICv3  68 Level     30a30000.i2c
197:          0          0          0          0    GICv3  69 Level     30a40000.i2c
198:         35          0          0          0    GICv3  70 Level     30a50000.i2c
199:          0          0          0          0    GICv3 109 Level     30ae0000.i2c
200:    5930706          0          0          0    GICv3 167 Level     eth0
201:          0          0          0          0    GICv3 166 Level     eth0
202:        370          0          0          0    GICv3  55 Level     mmc1
203:          0          0          0          0    GICv3 181 Level     32f10108.usb
205:         81          0          0          0    GICv3  73 Level     xhci-hcd:usb1
206:          0          0          0          0    GICv3  34 Level     30bd0000.dma-controller
207:          0          0          0          0    GICv3  49 Level     32e40000.csi
208:          0          0          0          0    GICv3  35 Level     38000000.gpu
209:          0          0          0          0    GICv3  66 Level     30e00000.dma-controller
210:          0          0          0          0    GICv3  57 Level     38008000.gpu
211:          0          0          0          0    GICv3  45 Level     38500000.npu
212:          0          0          0          0    GICv3 132 Level     32e30000.dwe
213:          0          0          0          0 irqsteer   0 Level     32fd8000.hdmi
214:          0          0          0          0    GICv3 135 Level     30e10000.dma-controller
215:          0          0          0          0    GICv3 106 Level     rkisp1
216:          0          0          0          0 irqsteer   8 Level     imx-lcdif
217:          0          0          0          0    GICv3  39 Level     38300000.video-codec
218:          0          0          0          0    GICv3  40 Level     38310000.video-codec
IPI0:       587        430        859        896       Rescheduling interrupts
IPI1:      5548       7530       6814       7366       Function call interrupts
IPI2:         0          0          0          0       CPU stop interrupts
IPI3:         0          0          0          0       CPU stop NMIs
IPI4:      2410       3635       3487       3707       Timer broadcast interrupts
IPI5:      3554       4650       3986       3762       IRQ work interrupts
IPI6:         0          0          0          0       CPU backtrace interrupts
IPI7:         0          0          0          0       KGDB roundup interrupts
Err:          0

GICv3 167 is interrupt 135 from section 7.1.2.

> Hmm, looking at 7.1.2, and the mention of "ENET QOS TSN LPI RX exit
> Interrupt" I'm wondering whether Freescale have wired the lpi_intr_o
> signal of the GMAC to their OR4 gate. This is the LPI RX exit
> interrupt output, and it is cleared when reading the LPI control/
> status register. However, its deassertion is synchronous to the RX
> clock domain, so it will take time to clear.

I think we're getting somewhere... All the data above confirm this
hypothesis in my opinion (or at least they rule out all the other
hypotheses I had).

Fugang, Joakim, Wei, Yannick, would you be able to check is the
lpi_intr_o signal is indeed OR'ed into interrupt 137 ? Are you aware of
the issue investigated in this mail thread ?

> The purpose of this signal is to trigger to external hardware (to the
> GMAC) to restore the application clock to the MAC. I'm not sure that
> this was meant to be wired to an actual CPU interrupt. The only clue
> is the name which suggests it is, but there's nothing that states
> there's a way to disable it being asserted which makes me more
> suspicious that it's not meant to be a CPU interrupt.

I've modified dwmac4_irq_status() to read GMAC4_LPI_CTRL_STATUS
unconditionally, and the problem persists. This could be explained by
the fact that lpi_intr_o takes time to clear as you mentioned.

Now I'm exploring unknown territory, this may be a stupid hypothesis,
but what if:

- The PHY exits LPI mode, and restarts generating the RX clock (clk_rx_i).
- The MAC detects exit from LPI, and asserts lpi_intr_o.
- Before the CPU has time to process the interrupt, the PHY enters LPI
  mode again, and stops generating the RX clock.
- The CPU processes the interrupt and reads the GMAC4_LPI_CTRL_STATUS
  registers. This does not clear lpi_intr_o as there's no clk_rx_i.

> So, maybe this is the cause of the interrupt storm. Maybe Kieran isn't
> seeing the storm because his receive path is not entering LPI.

Kieran told me he will perform more tests, but ran out of time this
week.

> I think a useful check for this would be if you could either disable
> LPI entry at the link partner, or hook it up to another system which
> can have tx_lpi disabled, and see how the iMX8 system behaves.

I tried that with my RTL8153 USB-ethernet adapter, but I don't think I
can really trust the result. The device doesn't respond to `ethtool
--set-eee` in an expected way, it got stuck with LPI completely disabled
and I had to disconnect and reconnect it to recover from that.

I have another USB-ethernet adapter doesn't support EEE, and no second
i.MX8MP system I could use for testing right now. I'll see if I can find
suitable hardware, but it may take a while (I'm about to go on a trip
abroad).

> If preventing the iMX8 receive path entering LPI fixes the problem,
> then I think this is likely the culpret.
> 
> However, I'd be worred about this - if we "disable LPI" by way of
> the advertisement at the local end, there is the possibility that a
> remote system could override the negotiation and force its transmit
> link into LPI mode, which would cause the iMX8MP receive side to see
> LPI entry and exit, triggering this interrupt. If this is correct,
> that gives an attacker a way to manipulate the iMX8MP system,
> potentially causing all sorts of problems.
> 
> Hmm. Not sure I like this look of that.

I'm sure I don't like it :-/

> If this hypothesis is correct, then yes, disabling EEE is the only
> way forward for this, but I would suggest going further - ensuring
> that SmartEEE is enabled on the PHY but with the advertisement
> cleared (so EEE negotiation indicates not supported) to block the
> receive side LPI getting to the EQOS.

I'm not sure how that should be implemented, I'd appreciate guidance. In
particular, the RTL8211E appears to support SmartEEE (based on the
information provided in this mail thread), but the registers to control
it are not documented. Maybe we can just rely on the fact it will be
enabled as a reset default at boot time.

> This also means that 100M EEE would also be affected, so just
> disabling 1G EEE in DT is insufficient.

Agreed. I've just tested forcing 100BaseT with EEE enabled, and the
issue persists.

> Andrew - if we need to go down this path, I think we need a flag in
> the PHY flags to indicate that we want SmartEEE enabled.

-- 
Regards,

Laurent Pinchart
