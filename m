Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE10D2BE7BA
	for <imx@lists.linux.dev>; Wed, 12 Nov 2025 22:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762986365; cv=none; b=qL9Ch7hBOHkhi/XlR11cOQKLmuWdUdB8QpNHSfRgdIp1BDtxsHjzx3kl6HOYvGT4aGK8pOFQG4LzzWnuRnnbxdvGqPZnld3L7STB3/nhWe7fSLvuJWcI9ADNXqQKyKueWc0nEuVEm48TziTljnqwP0Y6E49y/iGbJP1mom3gDo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762986365; c=relaxed/simple;
	bh=PS8sGnEMqi/E524B9pETv/HzJCvpAyFaN2txZ357aEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYvViPwy/F152d8TOy5mkMC7Onw4acuDfI71U9XtB3RCzj5+QwRrNYkyQphl8kZOuxu6jYjyAF0yim0QCoflhP8QUb2w9B7L8yFeNE2HJp1kpAlxvjoLi2LRWQferJlHDZerFNjtahVayKjr4Fu5PzHQ/fcYPE9Fvr2FX4IfB74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EbrY+Mpq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EbrY+Mpq"
Received: from pendragon.ideasonboard.com (82-203-161-95.bb.dnainternet.fi [82.203.161.95])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6B94450A;
	Wed, 12 Nov 2025 23:24:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762986240;
	bh=PS8sGnEMqi/E524B9pETv/HzJCvpAyFaN2txZ357aEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EbrY+MpqxgP0my+FG1nw9KYOLcsvUJ8X63WXyH4Q+dO0K1djc7/jt2IGx5PKGoDMD
	 VhTAA6tRqmLwhLpmPZUp4CfNRbvh0IC+FCwHjiSlD+zj2s+A/LL8MlRz54mrcJvxK3
	 WF0s3iTMKCckgyEMGmTbcMv4frBdzQH4U7YCXppg=
Date: Thu, 13 Nov 2025 00:25:51 +0200
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
Message-ID: <20251112222551.GB9135@pendragon.ideasonboard.com>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <aP-ML-A_h13pXY2d@shell.armlinux.org.uk>
 <20251027234648.GC24987@pendragon.ideasonboard.com>
 <aQAVE96NAD4Z4lgt@shell.armlinux.org.uk>
 <20251028071817.GX13023@pendragon.ideasonboard.com>
 <20251111235434.GA25874@pendragon.ideasonboard.com>
 <aRR3gVsZcr01zwzN@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aRR3gVsZcr01zwzN@shell.armlinux.org.uk>

On Wed, Nov 12, 2025 at 12:03:13PM +0000, Russell King (Oracle) wrote:
> On Wed, Nov 12, 2025 at 01:54:34AM +0200, Laurent Pinchart wrote:
> > On Tue, Oct 28, 2025 at 09:18:17AM +0200, Laurent Pinchart wrote:
> > > I didn't notice it at the time because my board was connected to a
> > > switch that didn't support EEE.
> > 
> > I can confirm that reverting that commit makes the issue disappear. So
> > we're dealing with an interrupt storm that occurs when all three of the
> > following conditions are true:
> > 
> > - cpu-pd-wait is enabled
> > - EEE is enabled
> > - the peer also supports EEE
> 
> Thanks - overall, please take the statistics and interrupt status bits
> with a pinch of salt - I suspect there are cases where the interrupt
> is not actually enabled, and the code doesn't take action to clear
> down a set status bit, but _does_ count it - so every interrupt that
> happens increments the counter.

True. To (partly) avoid that, I've dropped the line that discards
disabled bits in dwmac4_irq_status():

 	/* Discard disabled bits */
-	intr_status &= intr_enable;

to ensure that all bits are processed and cleared. I then didn't see any
high count of any of the GMAC_INT_STATUS interrupts. For
MTL_INTERRUPT_STATUS it's a bit different, as by default only one queue
is processed.

> > Furthermore, I tried counting bits from all the interrupt status
> > registers I could find. The count of MTL_INTERRUPT_STATUS Q0IS to Q4IS
> > bits is very high, and so are the DMA_CH0_STATUS TBU and ETI bits.
> 
> TBU means that the transmitter found that the next buffer was owned by
> the "application" rather than the hardware, which would be normal after
> getting to the end of the queued packets.
> 
> ETI means that a packet has been transferred into MTL memory, and thus
> would occur for every transmitted packet.
> 
> Having dug into the imx8m documentation and the driver this morning,
> I don't think TBU and ETI are the source of the interrupt storm. Their
> corresponding interrupt enable bits are DMA_CHAN_INTR_ENA_TBUE and
> DMA_CHAN_INTR_ENA_ETE (driver names). Both of these only appear in a
> header file - the code never enables these interrupts. So, TBU and ETI
> should not be causing an interrupt storm.
> 
> As for QxIS, stmmac_common_interrupt() will iterate over the queues
> in use, calling stmmac_host_mtl_irq_status() aka dwmac4_irq_mtl_status()
> for each. Only if this happens will MTL_CHAN_INT_CTRL() be read which
> clears the status bit. In other words, if e.g. Q1IS is set, but only
> one queue is being used. dwmac4_irq_mtl_status() won't be called for
> queue 1, and thus MTL_CHAN_INT_CTRL() won't be read to clear Q1IS.

That's why I tried to enable all 5 queues in DT, but alas, it didn't
help. I'll try again and count all possible interrupts.

> > The debix board's DT doesn't specify a multi-queue setup, so only
> > channel 0 gets processed in stmmac_dma_interrupt(). I thought that could
> > explain why Q1IS to Q4IS stay set (but not why Q0IS also has a high
> > count, or why Q1IS to Q4IS are set in the first place), and enabled
> > multi-queue support in DT by copying the imx8mp-evk configuration. I
> > then see lots of non-zero DMA_CH1_STATUS, DMA_CH2_STATUS and
> > DMA_CH4_STATUS values (but DMA_CH3_STATUS stays 0 all the time), but
> > sadly this doesn't fix the interrupt storm.
> 
> Now, a queue will only be enabled if stmmac_dma_rx_mode() /
> stmmac_dma_tx_mode() is called, which only happens for queues that are
> going ot be used. So, I think QxIS where x >= 1 is set is a red
> herring.
> 
> Given that the driver does a software reset which clears out all the
> registers, any stale configuration for queues e.g. from a boot loader
> can't be preserved.

I agree that it seems really weird. And why this would be related to
cpuidle and EEE is also a mystery.

> > I don't think I can debug this further and figure out the root cause
> > unassisted in a reasonable amount of time, so I'd like to merge
> > disabling EEE as a workaround for the time being, unless someone has any
> > idea of what I could test next. I'll submit a v2 of this patch with an
> > updated commit message.
> 
> I'm also not fully conversant with dwmac hardware, especially not the
> v5.10 hardware that is in imx8m. All the above is stuff I've pieced
> together this morning from reading the driver code and the imx8m
> manual. I'm putting in effort here to try and get to the bottom of
> your problem without hardware... it would be helpful if others could
> do the same rather than throwing their hands up.

More help would certainly be welcome. And I really appreciate your
support Russell.

> The driver is really crappy, and part of the reason its crappy is
> because of this kind of "patch in a workaround because we can't be
> bothered to do the research and fix problems properly" attitude.
> 
> I'm saying enough is enough. I'm saying no, not going to merge a
> workaround for this problem. I want to see stmmac improve. I've
> put in considerable effort over the last year or so sorting out
> fundamental issues that others just can't be bothered to solve
> properly (like the DMA reset failures on resume that has plagued
> this driver which no one seems _capable_ of fixing, yet I, with no
> experience of stmmac, was able to analyse the issue, read the
> availble documentation, and fix the problem properly once and for
> all.) Either I'm bloody good at what I do and everyone else is
> useless, or it's laziness by others. It pisses me off that I seem
> to be one of the few who is willing to put the effort in to stuff
> in the kernel to see _improvement_. I don't _have_ to work on stmmac,
> but me working on stmmac benefits a lot of people.
> 
> What I'm saying is, we need more people willing to put effort in
> and less bodging.

While I would like to merge a workaround and move on, I also understand
your position, having had the exact same stance in other kernel areas
and pushing for problems to be fixed correctly instead of worked around.
The only argument I have to defend the workaround approach is that I'm
putting a lot of hours trying to do the right things in other
subsystems, and I can hardly scale that to networking. It's not a great
argument though.

-- 
Regards,

Laurent Pinchart
