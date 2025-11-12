Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665E62749C7
	for <imx@lists.linux.dev>; Wed, 12 Nov 2025 12:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762949002; cv=none; b=tQfocErnyQYoHTkTZH6UC7+oa6LjNAhfFynLBg+XqNdJkENarI+s9tdBL12w848f4U39BQBHlLwDZBC39xjZDXNRciLakS5sTfFhqPbu8sEt6Qq/SEi8vR5wDWjBtjmaIDoJUeKExzMK31z+6q3SuMRiIhY72ZY5eQv1kD7fhzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762949002; c=relaxed/simple;
	bh=L/I/Gq6ZPIUD98iAjDq7DCpI+IDFdfZv9DIu4GTAE0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q96js0ZDBTHpw6NdSuRS/8dYIXiaKsOxJNMUf/UlWLU8dNyr/UAYu3YxCWmKMsb1Rzszx9otGpzfJoQW9A/jfEatnRTFZJaNJMZjWGi1elA5w87jJEVZfzFpU3kEiCHXFq2cKVA32JIjrCUo2QEj1U9d2KP7xv65j0ddbop/EfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=N/WrlRce; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="N/WrlRce"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Xoz7YPL/y6lIQdCJL39HKVWLjaRqC5V0hYZHrB4eFLI=; b=N/WrlRce8BD9pwqOiWiGcSC5Ud
	ngXCivkY/u7oM63Lt0K79/8+MQ+4O3mtOorWXfrj1ihNnJ5Hf4dl8aikp5F12LKKM0BKiCqo7VILF
	7aCmlV2Gru5W99VItBAa8Rjbu7SMM8OFaodm664dwEWjytKQdksJJb0uOI+01t5pw2/aK+4WO/vAV
	WHjdVNJ6Uz5BMmRMsMY/MSp+L1Ole5a2CR3IcW0PH87vXdTXvgJvXxsNq3Q//xSjibazIBMZOChCL
	K/ZxVTsds16rvUuUaFugEfYPFpaUMek9ytaJ/zDUWHtlXbGNyX5+1G8nYuEc0bB7K08bnZBcGWYFH
	F+Gje5Jw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43456)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vJ9ZE-000000003r2-1MGx;
	Wed, 12 Nov 2025 12:03:16 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vJ9ZC-000000003rC-0AOi;
	Wed, 12 Nov 2025 12:03:14 +0000
Date: Wed, 12 Nov 2025 12:03:13 +0000
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
Message-ID: <aRR3gVsZcr01zwzN@shell.armlinux.org.uk>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <aP-ML-A_h13pXY2d@shell.armlinux.org.uk>
 <20251027234648.GC24987@pendragon.ideasonboard.com>
 <aQAVE96NAD4Z4lgt@shell.armlinux.org.uk>
 <20251028071817.GX13023@pendragon.ideasonboard.com>
 <20251111235434.GA25874@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111235434.GA25874@pendragon.ideasonboard.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Nov 12, 2025 at 01:54:34AM +0200, Laurent Pinchart wrote:
> On Tue, Oct 28, 2025 at 09:18:17AM +0200, Laurent Pinchart wrote:
> > I didn't notice it at the time because my board was connected to a
> > switch that didn't support EEE.
> 
> I can confirm that reverting that commit makes the issue disappear. So
> we're dealing with an interrupt storm that occurs when all three of the
> following conditions are true:
> 
> - cpu-pd-wait is enabled
> - EEE is enabled
> - the peer also supports EEE

Thanks - overall, please take the statistics and interrupt status bits
with a pinch of salt - I suspect there are cases where the interrupt
is not actually enabled, and the code doesn't take action to clear
down a set status bit, but _does_ count it - so every interrupt that
happens increments the counter.

> 
> Furthermore, I tried counting bits from all the interrupt status
> registers I could find. The count of MTL_INTERRUPT_STATUS Q0IS to Q4IS
> bits is very high, and so are the DMA_CH0_STATUS TBU and ETI bits.

TBU means that the transmitter found that the next buffer was owned by
the "application" rather than the hardware, which would be normal after
getting to the end of the queued packets.

ETI means that a packet has been transferred into MTL memory, and thus
would occur for every transmitted packet.

Having dug into the imx8m documentation and the driver this morning,
I don't think TBU and ETI are the source of the interrupt storm. Their
corresponding interrupt enable bits are DMA_CHAN_INTR_ENA_TBUE and
DMA_CHAN_INTR_ENA_ETE (driver names). Both of these only appear in a
header file - the code never enables these interrupts. So, TBU and ETI
should not be causing an interrupt storm.

As for QxIS, stmmac_common_interrupt() will iterate over the queues
in use, calling stmmac_host_mtl_irq_status() aka dwmac4_irq_mtl_status()
for each. Only if this happens will MTL_CHAN_INT_CTRL() be read which
clears the status bit. In other words, if e.g. Q1IS is set, but only
one queue is being used. dwmac4_irq_mtl_status() won't be called for
queue 1, and thus MTL_CHAN_INT_CTRL() won't be read to clear Q1IS.

> The debix board's DT doesn't specify a multi-queue setup, so only
> channel 0 gets processed in stmmac_dma_interrupt(). I thought that could
> explain why Q1IS to Q4IS stay set (but not why Q0IS also has a high
> count, or why Q1IS to Q4IS are set in the first place), and enabled
> multi-queue support in DT by copying the imx8mp-evk configuration. I
> then see lots of non-zero DMA_CH1_STATUS, DMA_CH2_STATUS and
> DMA_CH4_STATUS values (but DMA_CH3_STATUS stays 0 all the time), but
> sadly this doesn't fix the interrupt storm.

Now, a queue will only be enabled if stmmac_dma_rx_mode() /
stmmac_dma_tx_mode() is called, which only happens for queues that are
going ot be used. So, I think QxIS where x >= 1 is set is a red
herring.

Given that the driver does a software reset which clears out all the
registers, any stale configuration for queues e.g. from a boot loader
can't be preserved.

> I don't think I can debug this further and figure out the root cause
> unassisted in a reasonable amount of time, so I'd like to merge
> disabling EEE as a workaround for the time being, unless someone has any
> idea of what I could test next. I'll submit a v2 of this patch with an
> updated commit message.

I'm also not fully conversant with dwmac hardware, especially not the
v5.10 hardware that is in imx8m. All the above is stuff I've pieced
together this morning from reading the driver code and the imx8m
manual. I'm putting in effort here to try and get to the bottom of
your problem without hardware... it would be helpful if others could
do the same rather than throwing their hands up.

The driver is really crappy, and part of the reason its crappy is
because of this kind of "patch in a workaround because we can't be
bothered to do the research and fix problems properly" attitude.

I'm saying enough is enough. I'm saying no, not going to merge a
workaround for this problem. I want to see stmmac improve. I've
put in considerable effort over the last year or so sorting out
fundamental issues that others just can't be bothered to solve
properly (like the DMA reset failures on resume that has plagued
this driver which no one seems _capable_ of fixing, yet I, with no
experience of stmmac, was able to analyse the issue, read the
availble documentation, and fix the problem properly once and for
all.) Either I'm bloody good at what I do and everyone else is
useless, or it's laziness by others. It pisses me off that I seem
to be one of the few who is willing to put the effort in to stuff
in the kernel to see _improvement_. I don't _have_ to work on stmmac,
but me working on stmmac benefits a lot of people.

What I'm saying is, we need more people willing to put effort in
and less bodging.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
