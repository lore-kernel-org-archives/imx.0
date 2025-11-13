Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DF318E3F
	for <imx@lists.linux.dev>; Thu, 13 Nov 2025 01:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762996005; cv=none; b=tbjlRn2nnWNL1S4KInehBNSbcRHaPRUBJ/Qu5toYfkcT5vZGuzjU09vLGZfiS7SBDh+pWVwXsyEOTMVrJvip+VU3wWgSXPSGeCaALybq8Npz3/BcqPy95pIIUek0LPcTLCuyX3aakfSmcl5z4mXVKUARMBppnRebYKdy6CVBygM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762996005; c=relaxed/simple;
	bh=B+FDL24nj3s0v6ci3ABPL9haxpsJcIYDAoodEow92SM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jEByaPEtVxxV8mUNA4+vrcQ0ZplUdPpD37PZKvBAHKbkmSUq2yILmfetIM9ANGWKx/lAx48q0Z0h/Nu05NSJFPgLQqUP2w1L3ql1gIAjSP8m9fx/rBnyziGAARzPjVZWrBRerFxpa98Bg2LsNQBEtWO5hNG6fTbFR5nboWVEriQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=umVaNpYa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="umVaNpYa"
Received: from pendragon.ideasonboard.com (unknown [213.216.211.176])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 90B9E1E3;
	Thu, 13 Nov 2025 02:04:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762995878;
	bh=B+FDL24nj3s0v6ci3ABPL9haxpsJcIYDAoodEow92SM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=umVaNpYavBxrKwWIesPyZmEYnGIw3R1lB8JmFTOdbWJsOfkgJ2EHnRweZBLiZsO2r
	 1QGcAtXNLLR6739W/a+pISfQQNC9DBTrcvMPnVfwvVtJke4EyQwVaAS2tAa4JErdXH
	 9C12FQoCF9pIuzIoe84TZohNKqHFknzW39lPMc14=
Date: Thu, 13 Nov 2025 03:06:27 +0200
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
	Shawn Guo <shawnguo@kernel.org>,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <20251113010627.GC9135@pendragon.ideasonboard.com>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <aP-ML-A_h13pXY2d@shell.armlinux.org.uk>
 <20251027234648.GC24987@pendragon.ideasonboard.com>
 <aQAVE96NAD4Z4lgt@shell.armlinux.org.uk>
 <20251028071817.GX13023@pendragon.ideasonboard.com>
 <20251111235434.GA25874@pendragon.ideasonboard.com>
 <aRR3gVsZcr01zwzN@shell.armlinux.org.uk>
 <20251112222551.GB9135@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251112222551.GB9135@pendragon.ideasonboard.com>

On Thu, Nov 13, 2025 at 12:25:52AM +0200, Laurent Pinchart wrote:
> On Wed, Nov 12, 2025 at 12:03:13PM +0000, Russell King (Oracle) wrote:
> > On Wed, Nov 12, 2025 at 01:54:34AM +0200, Laurent Pinchart wrote:
> > > On Tue, Oct 28, 2025 at 09:18:17AM +0200, Laurent Pinchart wrote:
> > > > I didn't notice it at the time because my board was connected to a
> > > > switch that didn't support EEE.
> > > 
> > > I can confirm that reverting that commit makes the issue disappear. So
> > > we're dealing with an interrupt storm that occurs when all three of the
> > > following conditions are true:
> > > 
> > > - cpu-pd-wait is enabled
> > > - EEE is enabled
> > > - the peer also supports EEE
> > 
> > Thanks - overall, please take the statistics and interrupt status bits
> > with a pinch of salt - I suspect there are cases where the interrupt
> > is not actually enabled, and the code doesn't take action to clear
> > down a set status bit, but _does_ count it - so every interrupt that
> > happens increments the counter.
> 
> True. To (partly) avoid that, I've dropped the line that discards
> disabled bits in dwmac4_irq_status():
> 
>  	/* Discard disabled bits */
> -	intr_status &= intr_enable;
> 
> to ensure that all bits are processed and cleared. I then didn't see any
> high count of any of the GMAC_INT_STATUS interrupts. For
> MTL_INTERRUPT_STATUS it's a bit different, as by default only one queue
> is processed.
> 
> > > Furthermore, I tried counting bits from all the interrupt status
> > > registers I could find. The count of MTL_INTERRUPT_STATUS Q0IS to Q4IS
> > > bits is very high, and so are the DMA_CH0_STATUS TBU and ETI bits.
> > 
> > TBU means that the transmitter found that the next buffer was owned by
> > the "application" rather than the hardware, which would be normal after
> > getting to the end of the queued packets.
> > 
> > ETI means that a packet has been transferred into MTL memory, and thus
> > would occur for every transmitted packet.
> > 
> > Having dug into the imx8m documentation and the driver this morning,
> > I don't think TBU and ETI are the source of the interrupt storm. Their
> > corresponding interrupt enable bits are DMA_CHAN_INTR_ENA_TBUE and
> > DMA_CHAN_INTR_ENA_ETE (driver names). Both of these only appear in a
> > header file - the code never enables these interrupts. So, TBU and ETI
> > should not be causing an interrupt storm.
> > 
> > As for QxIS, stmmac_common_interrupt() will iterate over the queues
> > in use, calling stmmac_host_mtl_irq_status() aka dwmac4_irq_mtl_status()
> > for each. Only if this happens will MTL_CHAN_INT_CTRL() be read which
> > clears the status bit. In other words, if e.g. Q1IS is set, but only
> > one queue is being used. dwmac4_irq_mtl_status() won't be called for
> > queue 1, and thus MTL_CHAN_INT_CTRL() won't be read to clear Q1IS.
> 
> That's why I tried to enable all 5 queues in DT, but alas, it didn't
> help. I'll try again and count all possible interrupts.

Here's my debug patch (not very pretty, sorry about that):

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 8f34c9ad457f..52810c45c635 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -139,6 +139,253 @@ struct stmmac_extra_stats {
 	unsigned long rx_vlan;
 	unsigned long rx_split_hdr_pkt_n;
 	/* Tx/Rx IRQ error info */
+	unsigned long irq_down_n;
+	unsigned long irq_fpe_n;
+	unsigned long irq_sfty_n;
+
+	unsigned long irq_gmac_0_n;
+	unsigned long irq_gmac_1_n;
+	unsigned long irq_gmac_2_n;
+	unsigned long irq_gmac_3_n;
+	unsigned long irq_gmac_4_n;
+	unsigned long irq_gmac_5_n;
+	unsigned long irq_gmac_6_n;
+	unsigned long irq_gmac_7_n;
+	unsigned long irq_gmac_8_n;
+	unsigned long irq_gmac_9_n;
+	unsigned long irq_gmac_10_n;
+	unsigned long irq_gmac_11_n;
+	unsigned long irq_gmac_12_n;
+	unsigned long irq_gmac_13_n;
+	unsigned long irq_gmac_14_n;
+	unsigned long irq_gmac_15_n;
+	unsigned long irq_gmac_16_n;
+	unsigned long irq_gmac_17_n;
+	unsigned long irq_gmac_18_n;
+	unsigned long irq_gmac_19_n;
+	unsigned long irq_gmac_20_n;
+	unsigned long irq_gmac_21_n;
+	unsigned long irq_gmac_22_n;
+	unsigned long irq_gmac_23_n;
+	unsigned long irq_gmac_24_n;
+	unsigned long irq_gmac_25_n;
+	unsigned long irq_gmac_26_n;
+	unsigned long irq_gmac_27_n;
+	unsigned long irq_gmac_28_n;
+	unsigned long irq_gmac_29_n;
+	unsigned long irq_gmac_30_n;
+	unsigned long irq_gmac_31_n;
+
+	unsigned long irq_mtl0_n;
+	unsigned long irq_mtl1_n;
+	unsigned long irq_mtl2_n;
+	unsigned long irq_mtl3_n;
+	unsigned long irq_mtl4_n;
+
+	unsigned long irq_mtl_0_n;
+	unsigned long irq_mtl_1_n;
+	unsigned long irq_mtl_2_n;
+	unsigned long irq_mtl_3_n;
+	unsigned long irq_mtl_4_n;
+	unsigned long irq_mtl_5_n;
+	unsigned long irq_mtl_6_n;
+	unsigned long irq_mtl_7_n;
+	unsigned long irq_mtl_8_n;
+	unsigned long irq_mtl_9_n;
+	unsigned long irq_mtl_10_n;
+	unsigned long irq_mtl_11_n;
+	unsigned long irq_mtl_12_n;
+	unsigned long irq_mtl_13_n;
+	unsigned long irq_mtl_14_n;
+	unsigned long irq_mtl_15_n;
+	unsigned long irq_mtl_16_n;
+	unsigned long irq_mtl_17_n;
+	unsigned long irq_mtl_18_n;
+	unsigned long irq_mtl_19_n;
+	unsigned long irq_mtl_20_n;
+	unsigned long irq_mtl_21_n;
+	unsigned long irq_mtl_22_n;
+	unsigned long irq_mtl_23_n;
+	unsigned long irq_mtl_24_n;
+	unsigned long irq_mtl_25_n;
+	unsigned long irq_mtl_26_n;
+	unsigned long irq_mtl_27_n;
+	unsigned long irq_mtl_28_n;
+	unsigned long irq_mtl_29_n;
+	unsigned long irq_mtl_30_n;
+	unsigned long irq_mtl_31_n;
+
+	unsigned long irq_chan0_n;
+	unsigned long irq_chan1_n;
+	unsigned long irq_chan2_n;
+	unsigned long irq_chan3_n;
+	unsigned long irq_chan4_n;
+
+	unsigned long irq_chan0_0_n;
+	unsigned long irq_chan0_1_n;
+	unsigned long irq_chan0_2_n;
+	unsigned long irq_chan0_3_n;
+	unsigned long irq_chan0_4_n;
+	unsigned long irq_chan0_5_n;
+	unsigned long irq_chan0_6_n;
+	unsigned long irq_chan0_7_n;
+	unsigned long irq_chan0_8_n;
+	unsigned long irq_chan0_9_n;
+	unsigned long irq_chan0_10_n;
+	unsigned long irq_chan0_11_n;
+	unsigned long irq_chan0_12_n;
+	unsigned long irq_chan0_13_n;
+	unsigned long irq_chan0_14_n;
+	unsigned long irq_chan0_15_n;
+	unsigned long irq_chan0_16_n;
+	unsigned long irq_chan0_17_n;
+	unsigned long irq_chan0_18_n;
+	unsigned long irq_chan0_19_n;
+	unsigned long irq_chan0_20_n;
+	unsigned long irq_chan0_21_n;
+	unsigned long irq_chan0_22_n;
+	unsigned long irq_chan0_23_n;
+	unsigned long irq_chan0_24_n;
+	unsigned long irq_chan0_25_n;
+	unsigned long irq_chan0_26_n;
+	unsigned long irq_chan0_27_n;
+	unsigned long irq_chan0_28_n;
+	unsigned long irq_chan0_29_n;
+	unsigned long irq_chan0_30_n;
+	unsigned long irq_chan0_31_n;
+
+	unsigned long irq_chan1_0_n;
+	unsigned long irq_chan1_1_n;
+	unsigned long irq_chan1_2_n;
+	unsigned long irq_chan1_3_n;
+	unsigned long irq_chan1_4_n;
+	unsigned long irq_chan1_5_n;
+	unsigned long irq_chan1_6_n;
+	unsigned long irq_chan1_7_n;
+	unsigned long irq_chan1_8_n;
+	unsigned long irq_chan1_9_n;
+	unsigned long irq_chan1_10_n;
+	unsigned long irq_chan1_11_n;
+	unsigned long irq_chan1_12_n;
+	unsigned long irq_chan1_13_n;
+	unsigned long irq_chan1_14_n;
+	unsigned long irq_chan1_15_n;
+	unsigned long irq_chan1_16_n;
+	unsigned long irq_chan1_17_n;
+	unsigned long irq_chan1_18_n;
+	unsigned long irq_chan1_19_n;
+	unsigned long irq_chan1_20_n;
+	unsigned long irq_chan1_21_n;
+	unsigned long irq_chan1_22_n;
+	unsigned long irq_chan1_23_n;
+	unsigned long irq_chan1_24_n;
+	unsigned long irq_chan1_25_n;
+	unsigned long irq_chan1_26_n;
+	unsigned long irq_chan1_27_n;
+	unsigned long irq_chan1_28_n;
+	unsigned long irq_chan1_29_n;
+	unsigned long irq_chan1_30_n;
+	unsigned long irq_chan1_31_n;
+
+	unsigned long irq_chan2_0_n;
+	unsigned long irq_chan2_1_n;
+	unsigned long irq_chan2_2_n;
+	unsigned long irq_chan2_3_n;
+	unsigned long irq_chan2_4_n;
+	unsigned long irq_chan2_5_n;
+	unsigned long irq_chan2_6_n;
+	unsigned long irq_chan2_7_n;
+	unsigned long irq_chan2_8_n;
+	unsigned long irq_chan2_9_n;
+	unsigned long irq_chan2_10_n;
+	unsigned long irq_chan2_11_n;
+	unsigned long irq_chan2_12_n;
+	unsigned long irq_chan2_13_n;
+	unsigned long irq_chan2_14_n;
+	unsigned long irq_chan2_15_n;
+	unsigned long irq_chan2_16_n;
+	unsigned long irq_chan2_17_n;
+	unsigned long irq_chan2_18_n;
+	unsigned long irq_chan2_19_n;
+	unsigned long irq_chan2_20_n;
+	unsigned long irq_chan2_21_n;
+	unsigned long irq_chan2_22_n;
+	unsigned long irq_chan2_23_n;
+	unsigned long irq_chan2_24_n;
+	unsigned long irq_chan2_25_n;
+	unsigned long irq_chan2_26_n;
+	unsigned long irq_chan2_27_n;
+	unsigned long irq_chan2_28_n;
+	unsigned long irq_chan2_29_n;
+	unsigned long irq_chan2_30_n;
+	unsigned long irq_chan2_31_n;
+
+	unsigned long irq_chan3_0_n;
+	unsigned long irq_chan3_1_n;
+	unsigned long irq_chan3_2_n;
+	unsigned long irq_chan3_3_n;
+	unsigned long irq_chan3_4_n;
+	unsigned long irq_chan3_5_n;
+	unsigned long irq_chan3_6_n;
+	unsigned long irq_chan3_7_n;
+	unsigned long irq_chan3_8_n;
+	unsigned long irq_chan3_9_n;
+	unsigned long irq_chan3_10_n;
+	unsigned long irq_chan3_11_n;
+	unsigned long irq_chan3_12_n;
+	unsigned long irq_chan3_13_n;
+	unsigned long irq_chan3_14_n;
+	unsigned long irq_chan3_15_n;
+	unsigned long irq_chan3_16_n;
+	unsigned long irq_chan3_17_n;
+	unsigned long irq_chan3_18_n;
+	unsigned long irq_chan3_19_n;
+	unsigned long irq_chan3_20_n;
+	unsigned long irq_chan3_21_n;
+	unsigned long irq_chan3_22_n;
+	unsigned long irq_chan3_23_n;
+	unsigned long irq_chan3_24_n;
+	unsigned long irq_chan3_25_n;
+	unsigned long irq_chan3_26_n;
+	unsigned long irq_chan3_27_n;
+	unsigned long irq_chan3_28_n;
+	unsigned long irq_chan3_29_n;
+	unsigned long irq_chan3_30_n;
+	unsigned long irq_chan3_31_n;
+
+	unsigned long irq_chan4_0_n;
+	unsigned long irq_chan4_1_n;
+	unsigned long irq_chan4_2_n;
+	unsigned long irq_chan4_3_n;
+	unsigned long irq_chan4_4_n;
+	unsigned long irq_chan4_5_n;
+	unsigned long irq_chan4_6_n;
+	unsigned long irq_chan4_7_n;
+	unsigned long irq_chan4_8_n;
+	unsigned long irq_chan4_9_n;
+	unsigned long irq_chan4_10_n;
+	unsigned long irq_chan4_11_n;
+	unsigned long irq_chan4_12_n;
+	unsigned long irq_chan4_13_n;
+	unsigned long irq_chan4_14_n;
+	unsigned long irq_chan4_15_n;
+	unsigned long irq_chan4_16_n;
+	unsigned long irq_chan4_17_n;
+	unsigned long irq_chan4_18_n;
+	unsigned long irq_chan4_19_n;
+	unsigned long irq_chan4_20_n;
+	unsigned long irq_chan4_21_n;
+	unsigned long irq_chan4_22_n;
+	unsigned long irq_chan4_23_n;
+	unsigned long irq_chan4_24_n;
+	unsigned long irq_chan4_25_n;
+	unsigned long irq_chan4_26_n;
+	unsigned long irq_chan4_27_n;
+	unsigned long irq_chan4_28_n;
+	unsigned long irq_chan4_29_n;
+	unsigned long irq_chan4_30_n;
+	unsigned long irq_chan4_31_n;
+
 	unsigned long tx_undeflow_irq;
 	unsigned long tx_process_stopped_irq;
 	unsigned long tx_jabber_irq;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index d85bc0bb5c3c..b1a6416ce9e1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -630,8 +630,16 @@ static int dwmac4_irq_mtl_status(struct stmmac_priv *priv,
 	u32 mtl_int_qx_status;
 	int ret = 0;
 
+	if (!WARN_ON(chan >= 5))
+		(&priv->xstats.irq_mtl0_n)[chan]++;
+
 	mtl_int_qx_status = readl(ioaddr + MTL_INT_STATUS);
 
+	for (unsigned int i = 0; i < 32; ++i) {
+		if (mtl_int_qx_status & BIT(i))
+			(&priv->xstats.irq_mtl_0_n)[i]++;
+	}
+
 	/* Check MTL Interrupt */
 	if (mtl_int_qx_status & MTL_INT_QX(chan)) {
 		/* read Queue x Interrupt status */
@@ -654,11 +662,16 @@ static int dwmac4_irq_status(struct mac_device_info *hw,
 {
 	void __iomem *ioaddr = hw->pcsr;
 	u32 intr_status = readl(ioaddr + GMAC_INT_STATUS);
-	u32 intr_enable = readl(ioaddr + GMAC_INT_EN);
+//	u32 intr_enable = readl(ioaddr + GMAC_INT_EN);
 	int ret = 0;
 
+	for (unsigned int i = 0; i < 32; ++i) {
+		if (intr_status & BIT(i))
+			(&x->irq_gmac_0_n)[i]++;
+	}
+
 	/* Discard disabled bits */
-	intr_status &= intr_enable;
+//	intr_status &= intr_enable;
 
 	/* Not used events (e.g. MMC interrupts) are not handled. */
 	if ((intr_status & mmc_tx_irq))
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
index 57c03d491774..106a59afc96c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
@@ -179,6 +179,15 @@ int dwmac4_dma_interrupt(struct stmmac_priv *priv, void __iomem *ioaddr,
 	else if (dir == DMA_DIR_TX)
 		intr_status &= DMA_CHAN_STATUS_MSK_TX;
 
+	if (!WARN_ON(chan >= 5)) {
+		(&x->irq_chan0_n)[chan]++;
+
+		for (unsigned int i = 0; i < 32; ++i) {
+			if (intr_status & BIT(i))
+				(&priv->xstats.irq_chan0_0_n)[32*chan + i]++;
+		}
+	}
+
 	/* ABNORMAL interrupts */
 	if (unlikely(intr_status & DMA_CHAN_STATUS_AIS)) {
 		if (unlikely(intr_status & DMA_CHAN_STATUS_RBU))
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 39fa1ec92f82..492d65314e51 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -78,6 +78,252 @@ static const struct stmmac_stats stmmac_gstrings_stats[] = {
 	STMMAC_STAT(rx_vlan),
 	STMMAC_STAT(rx_split_hdr_pkt_n),
 	/* Tx/Rx IRQ error info */
+	STMMAC_STAT(irq_down_n),
+	STMMAC_STAT(irq_fpe_n),
+	STMMAC_STAT(irq_sfty_n),
+
+	STMMAC_STAT(irq_gmac_0_n),
+	STMMAC_STAT(irq_gmac_1_n),
+	STMMAC_STAT(irq_gmac_2_n),
+	STMMAC_STAT(irq_gmac_3_n),
+	STMMAC_STAT(irq_gmac_4_n),
+	STMMAC_STAT(irq_gmac_5_n),
+	STMMAC_STAT(irq_gmac_6_n),
+	STMMAC_STAT(irq_gmac_7_n),
+	STMMAC_STAT(irq_gmac_8_n),
+	STMMAC_STAT(irq_gmac_9_n),
+	STMMAC_STAT(irq_gmac_10_n),
+	STMMAC_STAT(irq_gmac_11_n),
+	STMMAC_STAT(irq_gmac_12_n),
+	STMMAC_STAT(irq_gmac_13_n),
+	STMMAC_STAT(irq_gmac_14_n),
+	STMMAC_STAT(irq_gmac_15_n),
+	STMMAC_STAT(irq_gmac_16_n),
+	STMMAC_STAT(irq_gmac_17_n),
+	STMMAC_STAT(irq_gmac_18_n),
+	STMMAC_STAT(irq_gmac_19_n),
+	STMMAC_STAT(irq_gmac_20_n),
+	STMMAC_STAT(irq_gmac_21_n),
+	STMMAC_STAT(irq_gmac_22_n),
+	STMMAC_STAT(irq_gmac_23_n),
+	STMMAC_STAT(irq_gmac_24_n),
+	STMMAC_STAT(irq_gmac_25_n),
+	STMMAC_STAT(irq_gmac_26_n),
+	STMMAC_STAT(irq_gmac_27_n),
+	STMMAC_STAT(irq_gmac_28_n),
+	STMMAC_STAT(irq_gmac_29_n),
+	STMMAC_STAT(irq_gmac_30_n),
+	STMMAC_STAT(irq_gmac_31_n),
+
+	STMMAC_STAT(irq_mtl0_n),
+	STMMAC_STAT(irq_mtl1_n),
+	STMMAC_STAT(irq_mtl2_n),
+	STMMAC_STAT(irq_mtl3_n),
+	STMMAC_STAT(irq_mtl4_n),
+	STMMAC_STAT(irq_mtl_0_n),
+	STMMAC_STAT(irq_mtl_1_n),
+	STMMAC_STAT(irq_mtl_2_n),
+	STMMAC_STAT(irq_mtl_3_n),
+	STMMAC_STAT(irq_mtl_4_n),
+	STMMAC_STAT(irq_mtl_5_n),
+	STMMAC_STAT(irq_mtl_6_n),
+	STMMAC_STAT(irq_mtl_7_n),
+	STMMAC_STAT(irq_mtl_8_n),
+	STMMAC_STAT(irq_mtl_9_n),
+	STMMAC_STAT(irq_mtl_10_n),
+	STMMAC_STAT(irq_mtl_11_n),
+	STMMAC_STAT(irq_mtl_12_n),
+	STMMAC_STAT(irq_mtl_13_n),
+	STMMAC_STAT(irq_mtl_14_n),
+	STMMAC_STAT(irq_mtl_15_n),
+	STMMAC_STAT(irq_mtl_16_n),
+	STMMAC_STAT(irq_mtl_17_n),
+	STMMAC_STAT(irq_mtl_18_n),
+	STMMAC_STAT(irq_mtl_19_n),
+	STMMAC_STAT(irq_mtl_20_n),
+	STMMAC_STAT(irq_mtl_21_n),
+	STMMAC_STAT(irq_mtl_22_n),
+	STMMAC_STAT(irq_mtl_23_n),
+	STMMAC_STAT(irq_mtl_24_n),
+	STMMAC_STAT(irq_mtl_25_n),
+	STMMAC_STAT(irq_mtl_26_n),
+	STMMAC_STAT(irq_mtl_27_n),
+	STMMAC_STAT(irq_mtl_28_n),
+	STMMAC_STAT(irq_mtl_29_n),
+	STMMAC_STAT(irq_mtl_30_n),
+	STMMAC_STAT(irq_mtl_31_n),
+
+	STMMAC_STAT(irq_chan0_n),
+	STMMAC_STAT(irq_chan1_n),
+	STMMAC_STAT(irq_chan2_n),
+	STMMAC_STAT(irq_chan3_n),
+	STMMAC_STAT(irq_chan4_n),
+
+	STMMAC_STAT(irq_chan0_0_n),
+	STMMAC_STAT(irq_chan0_1_n),
+	STMMAC_STAT(irq_chan0_2_n),
+	STMMAC_STAT(irq_chan0_3_n),
+	STMMAC_STAT(irq_chan0_4_n),
+	STMMAC_STAT(irq_chan0_5_n),
+	STMMAC_STAT(irq_chan0_6_n),
+	STMMAC_STAT(irq_chan0_7_n),
+	STMMAC_STAT(irq_chan0_8_n),
+	STMMAC_STAT(irq_chan0_9_n),
+	STMMAC_STAT(irq_chan0_10_n),
+	STMMAC_STAT(irq_chan0_11_n),
+	STMMAC_STAT(irq_chan0_12_n),
+	STMMAC_STAT(irq_chan0_13_n),
+	STMMAC_STAT(irq_chan0_14_n),
+	STMMAC_STAT(irq_chan0_15_n),
+	STMMAC_STAT(irq_chan0_16_n),
+	STMMAC_STAT(irq_chan0_17_n),
+	STMMAC_STAT(irq_chan0_18_n),
+	STMMAC_STAT(irq_chan0_19_n),
+	STMMAC_STAT(irq_chan0_20_n),
+	STMMAC_STAT(irq_chan0_21_n),
+	STMMAC_STAT(irq_chan0_22_n),
+	STMMAC_STAT(irq_chan0_23_n),
+	STMMAC_STAT(irq_chan0_24_n),
+	STMMAC_STAT(irq_chan0_25_n),
+	STMMAC_STAT(irq_chan0_26_n),
+	STMMAC_STAT(irq_chan0_27_n),
+	STMMAC_STAT(irq_chan0_28_n),
+	STMMAC_STAT(irq_chan0_29_n),
+	STMMAC_STAT(irq_chan0_30_n),
+	STMMAC_STAT(irq_chan0_31_n),
+
+	STMMAC_STAT(irq_chan1_0_n),
+	STMMAC_STAT(irq_chan1_1_n),
+	STMMAC_STAT(irq_chan1_2_n),
+	STMMAC_STAT(irq_chan1_3_n),
+	STMMAC_STAT(irq_chan1_4_n),
+	STMMAC_STAT(irq_chan1_5_n),
+	STMMAC_STAT(irq_chan1_6_n),
+	STMMAC_STAT(irq_chan1_7_n),
+	STMMAC_STAT(irq_chan1_8_n),
+	STMMAC_STAT(irq_chan1_9_n),
+	STMMAC_STAT(irq_chan1_10_n),
+	STMMAC_STAT(irq_chan1_11_n),
+	STMMAC_STAT(irq_chan1_12_n),
+	STMMAC_STAT(irq_chan1_13_n),
+	STMMAC_STAT(irq_chan1_14_n),
+	STMMAC_STAT(irq_chan1_15_n),
+	STMMAC_STAT(irq_chan1_16_n),
+	STMMAC_STAT(irq_chan1_17_n),
+	STMMAC_STAT(irq_chan1_18_n),
+	STMMAC_STAT(irq_chan1_19_n),
+	STMMAC_STAT(irq_chan1_20_n),
+	STMMAC_STAT(irq_chan1_21_n),
+	STMMAC_STAT(irq_chan1_22_n),
+	STMMAC_STAT(irq_chan1_23_n),
+	STMMAC_STAT(irq_chan1_24_n),
+	STMMAC_STAT(irq_chan1_25_n),
+	STMMAC_STAT(irq_chan1_26_n),
+	STMMAC_STAT(irq_chan1_27_n),
+	STMMAC_STAT(irq_chan1_28_n),
+	STMMAC_STAT(irq_chan1_29_n),
+	STMMAC_STAT(irq_chan1_30_n),
+	STMMAC_STAT(irq_chan1_31_n),
+
+	STMMAC_STAT(irq_chan2_0_n),
+	STMMAC_STAT(irq_chan2_1_n),
+	STMMAC_STAT(irq_chan2_2_n),
+	STMMAC_STAT(irq_chan2_3_n),
+	STMMAC_STAT(irq_chan2_4_n),
+	STMMAC_STAT(irq_chan2_5_n),
+	STMMAC_STAT(irq_chan2_6_n),
+	STMMAC_STAT(irq_chan2_7_n),
+	STMMAC_STAT(irq_chan2_8_n),
+	STMMAC_STAT(irq_chan2_9_n),
+	STMMAC_STAT(irq_chan2_10_n),
+	STMMAC_STAT(irq_chan2_11_n),
+	STMMAC_STAT(irq_chan2_12_n),
+	STMMAC_STAT(irq_chan2_13_n),
+	STMMAC_STAT(irq_chan2_14_n),
+	STMMAC_STAT(irq_chan2_15_n),
+	STMMAC_STAT(irq_chan2_16_n),
+	STMMAC_STAT(irq_chan2_17_n),
+	STMMAC_STAT(irq_chan2_18_n),
+	STMMAC_STAT(irq_chan2_19_n),
+	STMMAC_STAT(irq_chan2_20_n),
+	STMMAC_STAT(irq_chan2_21_n),
+	STMMAC_STAT(irq_chan2_22_n),
+	STMMAC_STAT(irq_chan2_23_n),
+	STMMAC_STAT(irq_chan2_24_n),
+	STMMAC_STAT(irq_chan2_25_n),
+	STMMAC_STAT(irq_chan2_26_n),
+	STMMAC_STAT(irq_chan2_27_n),
+	STMMAC_STAT(irq_chan2_28_n),
+	STMMAC_STAT(irq_chan2_29_n),
+	STMMAC_STAT(irq_chan2_30_n),
+	STMMAC_STAT(irq_chan2_31_n),
+
+	STMMAC_STAT(irq_chan3_0_n),
+	STMMAC_STAT(irq_chan3_1_n),
+	STMMAC_STAT(irq_chan3_2_n),
+	STMMAC_STAT(irq_chan3_3_n),
+	STMMAC_STAT(irq_chan3_4_n),
+	STMMAC_STAT(irq_chan3_5_n),
+	STMMAC_STAT(irq_chan3_6_n),
+	STMMAC_STAT(irq_chan3_7_n),
+	STMMAC_STAT(irq_chan3_8_n),
+	STMMAC_STAT(irq_chan3_9_n),
+	STMMAC_STAT(irq_chan3_10_n),
+	STMMAC_STAT(irq_chan3_11_n),
+	STMMAC_STAT(irq_chan3_12_n),
+	STMMAC_STAT(irq_chan3_13_n),
+	STMMAC_STAT(irq_chan3_14_n),
+	STMMAC_STAT(irq_chan3_15_n),
+	STMMAC_STAT(irq_chan3_16_n),
+	STMMAC_STAT(irq_chan3_17_n),
+	STMMAC_STAT(irq_chan3_18_n),
+	STMMAC_STAT(irq_chan3_19_n),
+	STMMAC_STAT(irq_chan3_20_n),
+	STMMAC_STAT(irq_chan3_21_n),
+	STMMAC_STAT(irq_chan3_22_n),
+	STMMAC_STAT(irq_chan3_23_n),
+	STMMAC_STAT(irq_chan3_24_n),
+	STMMAC_STAT(irq_chan3_25_n),
+	STMMAC_STAT(irq_chan3_26_n),
+	STMMAC_STAT(irq_chan3_27_n),
+	STMMAC_STAT(irq_chan3_28_n),
+	STMMAC_STAT(irq_chan3_29_n),
+	STMMAC_STAT(irq_chan3_30_n),
+	STMMAC_STAT(irq_chan3_31_n),
+
+	STMMAC_STAT(irq_chan4_0_n),
+	STMMAC_STAT(irq_chan4_1_n),
+	STMMAC_STAT(irq_chan4_2_n),
+	STMMAC_STAT(irq_chan4_3_n),
+	STMMAC_STAT(irq_chan4_4_n),
+	STMMAC_STAT(irq_chan4_5_n),
+	STMMAC_STAT(irq_chan4_6_n),
+	STMMAC_STAT(irq_chan4_7_n),
+	STMMAC_STAT(irq_chan4_8_n),
+	STMMAC_STAT(irq_chan4_9_n),
+	STMMAC_STAT(irq_chan4_10_n),
+	STMMAC_STAT(irq_chan4_11_n),
+	STMMAC_STAT(irq_chan4_12_n),
+	STMMAC_STAT(irq_chan4_13_n),
+	STMMAC_STAT(irq_chan4_14_n),
+	STMMAC_STAT(irq_chan4_15_n),
+	STMMAC_STAT(irq_chan4_16_n),
+	STMMAC_STAT(irq_chan4_17_n),
+	STMMAC_STAT(irq_chan4_18_n),
+	STMMAC_STAT(irq_chan4_19_n),
+	STMMAC_STAT(irq_chan4_20_n),
+	STMMAC_STAT(irq_chan4_21_n),
+	STMMAC_STAT(irq_chan4_22_n),
+	STMMAC_STAT(irq_chan4_23_n),
+	STMMAC_STAT(irq_chan4_24_n),
+	STMMAC_STAT(irq_chan4_25_n),
+	STMMAC_STAT(irq_chan4_26_n),
+	STMMAC_STAT(irq_chan4_27_n),
+	STMMAC_STAT(irq_chan4_28_n),
+	STMMAC_STAT(irq_chan4_29_n),
+	STMMAC_STAT(irq_chan4_30_n),
+	STMMAC_STAT(irq_chan4_31_n),
+
 	STMMAC_STAT(tx_undeflow_irq),
 	STMMAC_STAT(tx_process_stopped_irq),
 	STMMAC_STAT(tx_jabber_irq),
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index 75b470ee621a..32a2b440fc46 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -141,6 +141,8 @@ void stmmac_fpe_irq_status(struct stmmac_priv *priv)
 	 * here, since the status flags of MAC_FPE_CTRL_STS are "clear on read"
 	 */
 	value = readl(ioaddr + reg->mac_fpe_reg);
+	if (value)
+		priv->xstats.irq_fpe_n++;
 
 	if (value & STMMAC_MAC_FPE_CTRL_STS_TRSP) {
 		status |= FPE_EVENT_TRSP;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 650d75b73e0b..cbc748380dda 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3771,6 +3771,7 @@ static int stmmac_request_irq_single(struct net_device *dev)
 	enum request_irq_err irq_err;
 	int ret;
 
+	netdev_info(dev, "%s: requesting main IRQ\n", __func__);
 	ret = request_irq(dev->irq, stmmac_interrupt,
 			  IRQF_SHARED, dev->name, dev);
 	if (unlikely(ret < 0)) {
@@ -3785,6 +3786,7 @@ static int stmmac_request_irq_single(struct net_device *dev)
 	 * is used for WoL
 	 */
 	if (priv->wol_irq > 0 && priv->wol_irq != dev->irq) {
+		netdev_info(dev, "%s: requesting WOL IRQ\n", __func__);
 		ret = request_irq(priv->wol_irq, stmmac_interrupt,
 				  IRQF_SHARED, dev->name, dev);
 		if (unlikely(ret < 0)) {
@@ -3798,6 +3800,7 @@ static int stmmac_request_irq_single(struct net_device *dev)
 
 	/* Request the IRQ lines */
 	if (priv->lpi_irq > 0 && priv->lpi_irq != dev->irq) {
+		netdev_info(dev, "%s: requesting LPI IRQ\n", __func__);
 		ret = request_irq(priv->lpi_irq, stmmac_interrupt,
 				  IRQF_SHARED, dev->name, dev);
 		if (unlikely(ret < 0)) {
@@ -3813,6 +3816,7 @@ static int stmmac_request_irq_single(struct net_device *dev)
 	 * Error line in case of another line is used
 	 */
 	if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq) {
+		netdev_info(dev, "%s: requesting safety IRQ\n", __func__);
 		ret = request_irq(priv->sfty_irq, stmmac_safety_interrupt,
 				  IRQF_SHARED, dev->name, dev);
 		if (unlikely(ret < 0)) {
@@ -6030,12 +6034,16 @@ static irqreturn_t stmmac_interrupt(int irq, void *dev_id)
 	struct stmmac_priv *priv = netdev_priv(dev);
 
 	/* Check if adapter is up */
-	if (test_bit(STMMAC_DOWN, &priv->state))
+	if (test_bit(STMMAC_DOWN, &priv->state)) {
+		priv->xstats.irq_down_n++;
 		return IRQ_HANDLED;
+	}
 
 	/* Check ASP error if it isn't delivered via an individual IRQ */
-	if (priv->sfty_irq <= 0 && stmmac_safety_feat_interrupt(priv))
+	if (priv->sfty_irq <= 0 && stmmac_safety_feat_interrupt(priv)) {
+		priv->xstats.irq_sfty_n++;
 		return IRQ_HANDLED;
+	}
 
 	/* To handle Common interrupts */
 	stmmac_common_interrupt(priv);


Here are the corresponding stats captured right after booting to
userspace, with the 0 counts stripped off to keep the output readable:

     irq_gmac_0_n: 1
     irq_gmac_5_n: 4047
     irq_gmac_18_n: 46
     irq_mtl0_n: 2244307
     irq_mtl_0_n: 2244307
     irq_mtl_1_n: 2244307
     irq_mtl_2_n: 2244307
     irq_mtl_3_n: 2244307
     irq_mtl_4_n: 2244307
     irq_chan0_n: 2244307
     irq_chan0_0_n: 333
     irq_chan0_2_n: 2244307
     irq_chan0_6_n: 2769
     irq_chan0_10_n: 2244307
     irq_chan0_11_n: 2799
     irq_chan0_15_n: 2701

Here are the stats after enabling five queues in DT, also captured right
after booting to userspace:

     irq_gmac_0_n: 1
     irq_gmac_5_n: 4020
     irq_gmac_18_n: 41
     irq_mtl0_n: 1286469
     irq_mtl1_n: 1286469
     irq_mtl2_n: 1286469
     irq_mtl3_n: 1286469
     irq_mtl4_n: 1286469
     irq_mtl_0_n: 6432345
     irq_mtl_1_n: 6432345
     irq_mtl_2_n: 6432345
     irq_mtl_3_n: 6432345
     irq_mtl_4_n: 6432345
     irq_chan0_n: 1286469
     irq_chan1_n: 1286469
     irq_chan2_n: 1286469
     irq_chan3_n: 1286469
     irq_chan4_n: 1286469
     irq_chan0_0_n: 416
     irq_chan0_2_n: 1286466
     irq_chan0_6_n: 3470
     irq_chan0_10_n: 1286466
     irq_chan0_11_n: 2740
     irq_chan0_15_n: 2686
     irq_chan1_2_n: 1286469
     irq_chan1_10_n: 1286469
     irq_chan2_2_n: 1286467
     irq_chan2_10_n: 1286467
     irq_chan4_2_n: 1286469
     irq_chan4_10_n: 1286469

Setting eee-broken-1000t, with a single queue:

     irq_gmac_0_n: 1
     irq_gmac_18_n: 6
     irq_mtl0_n: 2548
     irq_mtl_0_n: 2548
     irq_mtl_1_n: 2548
     irq_mtl_2_n: 2548
     irq_mtl_3_n: 2548
     irq_mtl_4_n: 2548
     irq_chan0_n: 2548
     irq_chan0_0_n: 282
     irq_chan0_2_n: 2548
     irq_chan0_6_n: 2324
     irq_chan0_10_n: 2548
     irq_chan0_11_n: 29
     irq_chan0_15_n: 2548

And eee-broken-1000t with 5 queues:

     irq_gmac_0_n: 1
     irq_gmac_18_n: 8
     irq_mtl0_n: 2672
     irq_mtl1_n: 2672
     irq_mtl2_n: 2672
     irq_mtl3_n: 2672
     irq_mtl4_n: 2672
     irq_mtl_0_n: 13360
     irq_mtl_1_n: 13360
     irq_mtl_2_n: 13360
     irq_mtl_3_n: 13360
     irq_mtl_4_n: 13360
     irq_chan0_n: 2672
     irq_chan1_n: 2672
     irq_chan2_n: 2672
     irq_chan3_n: 2672
     irq_chan4_n: 2672
     irq_chan0_0_n: 283
     irq_chan0_2_n: 2672
     irq_chan0_6_n: 2439
     irq_chan0_10_n: 2672
     irq_chan0_11_n: 46
     irq_chan0_15_n: 2672
     irq_chan2_2_n: 2670
     irq_chan2_10_n: 2670
     irq_chan3_2_n: 2672
     irq_chan3_10_n: 2672

I've also printed the value of the interrupt enable registers. With one
queue,

MAC_INTERRUPT_ENABLE 0x00001030
DMA_CH0_INTERRUPT_ENABLE 0x0000d041
DMA_CH1_INTERRUPT_ENABLE 0x00000000
DMA_CH2_INTERRUPT_ENABLE 0x00000000
DMA_CH3_INTERRUPT_ENABLE 0x00000000
DMA_CH4_INTERRUPT_ENABLE 0x00000000

And with 4 queues,

MAC_INTERRUPT_ENABLE 0x00001030
DMA_CH0_INTERRUPT_ENABLE 0x0000d041
DMA_CH1_INTERRUPT_ENABLE 0x0000d041
DMA_CH2_INTERRUPT_ENABLE 0x0000d041
DMA_CH3_INTERRUPT_ENABLE 0x0000d041
DMA_CH4_INTERRUPT_ENABLE 0x0000d041

(bit 0 of the DMA interrupt enable registers is sometimes not set, which
I understand is normal)

Given the enabled interrupts, I agree that the counters are misleading,
as none of the interrupt bits with high counts are enabled. I'm however
not entirely sure about the MTL interrupt status register, it's not
clear to me if it is wired to the EQOS IRQ line as I don't see a
corresponding interrupt enable register.

If we rule out the main EQOS IRQ line and the per-channel RX and TX IRQ
lines as the source of the interrupt storm, the last possible culprit
according to section 7.1.2 (A53 Interrupts) of the i.MX8MP reference
manual would be the "ENET QOS TSN LPI RX exit Interrupt" that is OR'ed
into IRQ 135. As that's related to EEE, it's a probable culprit, but I
don't know how what controls that IRQ line. The LPI interrupt status bit
is set in MAC_INTERRUPT_STATUS with a reasonable count, and we clear the
LPI interrupt sources when that happens. Just to be sure, I modified
dwmac4_irq_status() to read and process the GMAC4_LPI_CTRL_STATUS
register regardless of the LPIIS bit status, and that doesn't help. The
corresponding stats seem reasonable:

     irq_tx_path_in_lpi_mode_n: 4
     irq_tx_path_exit_lpi_mode_n: 4
     irq_rx_path_in_lpi_mode_n: 2537
     irq_rx_path_exit_lpi_mode_n: 2535

I also checked the MAC_MMC_RX_INTERRUPT and MAC_MMC_TX_INTERRUPT
registers as they contain LPI-related bits, but the corresponding mask
registers have all bits set:

MAC_MMC_RX_INTERRUPT      0x00000000
MAC_MMC_TX_INTERRUPT      0x00000000
MAC_MMC_RX_INTERRUPT_MASK 0x0fffffff
MAC_MMC_TX_INTERRUPT_MASK 0x0fffffff

According to the reference manual, this masks all corresponding
interrupts.

I'm really puzzled by the "ENET QOS TSN LPI RX exit Interrupt" IRQ line.
Based on its name I would assume it would be linked to bit RLPIEX in the
MAC_LPI_CONTROL_STATUS register, but that seems quite pointless as
that's available as an interrupt source through
MAC_INTERRUPT_STATUS.LPIIS. The shortcut doesn't seem necessary. Are we
missing something, or chasing the wrong suspect ?

> > > The debix board's DT doesn't specify a multi-queue setup, so only
> > > channel 0 gets processed in stmmac_dma_interrupt(). I thought that could
> > > explain why Q1IS to Q4IS stay set (but not why Q0IS also has a high
> > > count, or why Q1IS to Q4IS are set in the first place), and enabled
> > > multi-queue support in DT by copying the imx8mp-evk configuration. I
> > > then see lots of non-zero DMA_CH1_STATUS, DMA_CH2_STATUS and
> > > DMA_CH4_STATUS values (but DMA_CH3_STATUS stays 0 all the time), but
> > > sadly this doesn't fix the interrupt storm.
> > 
> > Now, a queue will only be enabled if stmmac_dma_rx_mode() /
> > stmmac_dma_tx_mode() is called, which only happens for queues that are
> > going ot be used. So, I think QxIS where x >= 1 is set is a red
> > herring.
> > 
> > Given that the driver does a software reset which clears out all the
> > registers, any stale configuration for queues e.g. from a boot loader
> > can't be preserved.
> 
> I agree that it seems really weird. And why this would be related to
> cpuidle and EEE is also a mystery.
> 
> > > I don't think I can debug this further and figure out the root cause
> > > unassisted in a reasonable amount of time, so I'd like to merge
> > > disabling EEE as a workaround for the time being, unless someone has any
> > > idea of what I could test next. I'll submit a v2 of this patch with an
> > > updated commit message.
> > 
> > I'm also not fully conversant with dwmac hardware, especially not the
> > v5.10 hardware that is in imx8m. All the above is stuff I've pieced
> > together this morning from reading the driver code and the imx8m
> > manual. I'm putting in effort here to try and get to the bottom of
> > your problem without hardware... it would be helpful if others could
> > do the same rather than throwing their hands up.
> 
> More help would certainly be welcome. And I really appreciate your
> support Russell.
> 
> > The driver is really crappy, and part of the reason its crappy is
> > because of this kind of "patch in a workaround because we can't be
> > bothered to do the research and fix problems properly" attitude.
> > 
> > I'm saying enough is enough. I'm saying no, not going to merge a
> > workaround for this problem. I want to see stmmac improve. I've
> > put in considerable effort over the last year or so sorting out
> > fundamental issues that others just can't be bothered to solve
> > properly (like the DMA reset failures on resume that has plagued
> > this driver which no one seems _capable_ of fixing, yet I, with no
> > experience of stmmac, was able to analyse the issue, read the
> > availble documentation, and fix the problem properly once and for
> > all.) Either I'm bloody good at what I do and everyone else is
> > useless, or it's laziness by others. It pisses me off that I seem
> > to be one of the few who is willing to put the effort in to stuff
> > in the kernel to see _improvement_. I don't _have_ to work on stmmac,
> > but me working on stmmac benefits a lot of people.
> > 
> > What I'm saying is, we need more people willing to put effort in
> > and less bodging.
> 
> While I would like to merge a workaround and move on, I also understand
> your position, having had the exact same stance in other kernel areas
> and pushing for problems to be fixed correctly instead of worked around.
> The only argument I have to defend the workaround approach is that I'm
> putting a lot of hours trying to do the right things in other
> subsystems, and I can hardly scale that to networking. It's not a great
> argument though.

-- 
Regards,

Laurent Pinchart
