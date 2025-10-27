Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA8F2D948A
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 23:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761606520; cv=none; b=cTbUsoTV0KeY0qiXStHBYZXm8qWptWfTLE5KkLCLyKQ3N7Q9O/Wip0iAcLSHl+LubOnEHGfYq7zpa8os2VFKPB/PHZa9H7ZVrsuYlaMt+XOupd+4avY4b7WM0MeX95U5Ch8oTfqPWona84l5dhvndrdzMUQGAR02HsQpMzhyRBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761606520; c=relaxed/simple;
	bh=ELYpA/QT7AVDHwBCO8Rf3+oLxXv3ePZYdYKb8rWchmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cYTPfk+fyBROU6TvmBcdUShkv8yMnA0iOmtcPJ/27h12kH6GO/XCpc4+B+T+Zi7SJSIg54DNMbWwW7fWlnt/qfyVkYUBFf3cs1+tX4SaU3arKBW8DrdUCaY+wHygJ3i650y+G97Tbw9Tc5O2ZezMdsLeUITusY39yFQcowrCD0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bTKw6iE4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bTKw6iE4"
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id EF60C735;
	Tue, 28 Oct 2025 00:06:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761606407;
	bh=ELYpA/QT7AVDHwBCO8Rf3+oLxXv3ePZYdYKb8rWchmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bTKw6iE4ZpIJ68K2EMtJD4eOa0FMqjsAyfW3kDqU4MENQEZLXtIc4cAZD+Tb9KyH6
	 lbtGVjA6Xfupo32TB0uADmRVMbavdO5MmiiBBNzj+3D9Ex5w4VI6om/u+YUTz5hNaV
	 B5ooezfihbuElzN8wzvPgTEy5XsFGbai2Y28OopU=
Date: Tue, 28 Oct 2025 01:08:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
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
Message-ID: <20251027230821.GA24987@pendragon.ideasonboard.com>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <20251027072749.GA7811@pendragon.ideasonboard.com>
 <aP88KO8uVrEQlmMm@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aP88KO8uVrEQlmMm@shell.armlinux.org.uk>

On Mon, Oct 27, 2025 at 09:32:24AM +0000, Russell King (Oracle) wrote:
> On Mon, Oct 27, 2025 at 09:27:49AM +0200, Laurent Pinchart wrote:
> > I've tried to diagnose the issue by adding interrupt counters to
> > dwmac4_irq_status(), counting interrupts for each bit of GMAC_INT_STATUS
> > (0x00b0). Bit RGSMIIIS (0) is the only one that seems linked to the
> > interrupts storm, increasing at around 10k per second. However, the
> > corresponding bit in GMAC_INT_EN (0x00b4) is *not* set.
> 
> This is a change in the PCS series rather than the EEE series. It would
> be good to narrow down whehn this problem appeared for you.
> 
> The RGSMIIIS bit set without RGSMIIIM (0x00b4 bit 0) shouldn't result
> in an interrupt storm since the status will be masked. That doens't
> mean that RGSMIIIS won't be set. So, at this point I'm not worried
> about that.
> 
> Can you print the intr_status and intr_values in dwmac4_irq_status(),
> maybe something like this:
> 
> 	static int ctr = 0;
> 
> 	if (ctr++ >= 9996) {
> 		printk("stmmac: INTS=%08x INTE=%08x\n", intr_status,
> 			intr_enable);
> 
> 		if (ctr >= 10000)
> 			ctr = 0;
> 	}
> 
>         /* Discard disabled bits */
>         intr_status &= intr_enable;
> 
> which should avoid too much noise during "normal" operation. It'll
> print six consecutive interrupts every 10000.

I'm always getting the same values:

[   62.638187] stmmac: INTS=00000001 INTE=00001030

Now the funny part. I get about 20 of those messages printed to the
serial console every time I press enter, and rarely otherwise. Typing
other characters in the console do not trigger the messages.

> > I ould suspect that the LPI RX exit interrupt is the one that fires
> > constantly given its name, but I'm not sure how to test that.
> 
> You can check this because the LPI interrupts have statistic counter
> associated with them. ethtool -S should give these, look for
> lpi_mode_n.

# ethtool -S eth0 | grep lpi
     irq_tx_path_in_lpi_mode_n: 32
     irq_tx_path_exit_lpi_mode_n: 32
     irq_rx_path_in_lpi_mode_n: 2512
     irq_rx_path_exit_lpi_mode_n: 2508

That seems reasonable.

-- 
Regards,

Laurent Pinchart
