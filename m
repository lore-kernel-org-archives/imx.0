Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4062E62CF
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 09:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761558359; cv=none; b=KnEga/nb+D77lUwsUEtHjkSOBH5vWJj3xTteSKjSHEZRmGgKQhifNbYZXTSOOpdWRKLh+D0CP3bAMMPxGhx8zljlLYJfnhflsohqi9nkc/v67seSzSt6jbovQ0Unxl66tRaQhY0vmCZ1bbCOHi/Qot+yowjx/rxk1Ah6sPg9lJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761558359; c=relaxed/simple;
	bh=ftSUN3i0A4AKZy9QZQGbnqI1IJrNS2SGMXKdUYQOXUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YvQo3/ImUnCBj3uFeCQIwMhVBM2nfuJGrjiFsx7dvkYqnMfp4RnFmdIi3mDUIm4uABHiFMS709ksODTCOqRGF6rX8qmiRhzKkbrkVLQJXdE8SAHeL2MyafgA8pqDCkEvyCDyh4OMEjrVkTM9i0J2pIW33jLijRBHOvYP9xsEkyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=s3AjK7vO; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="s3AjK7vO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dOijxY4yU1FSMyaDhxn4I+Okufrw4ljdJUN2JDfS9Dc=; b=s3AjK7vOVdO9yapjAJKe+t7cO5
	hKRBh4UX2ixS+KVr3oM7uZ0w9zIVqT5eyfWWO3eQjkuxxlmAp9vI44Jor5doPNB73OPp+AINp9q3A
	/8WKoJxjH9kW5Mqg5xWaNXtJs/5rwSBJuLlN7cUrV7MM3sj8zSqSAVWGramQB6uYWuAgdr682h5gT
	F+9Uzl0fs3nmDEXGrCRn68gNtT/H9ytgtrpvdugyeNyerBu3vkX4sRCcMIBfAJUn0F5o07V+HlO+m
	Au7krtZJ4v+r2Y1/Xk9CpoWAkV5kVymx98KEtfdib8QA/7QlsLcQmfJh6qsCKnI8t0209n/QIXtV7
	FNz6hYtg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56120)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vDJnX-000000001bf-3JsR;
	Mon, 27 Oct 2025 09:45:55 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vDJnW-000000005UD-1dSd;
	Mon, 27 Oct 2025 09:45:54 +0000
Date: Mon, 27 Oct 2025 09:45:54 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
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
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <aP8_UjqvCHbrP3lH@shell.armlinux.org.uk>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <aP82VEjNDgrNAZzy@shell.armlinux.org.uk>
 <20251027093346.GB1544@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027093346.GB1544@pendragon.ideasonboard.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Oct 27, 2025 at 11:33:46AM +0200, Laurent Pinchart wrote:
> Hi Russell,
> 
> On Mon, Oct 27, 2025 at 09:07:32AM +0000, Russell King (Oracle) wrote:
> > On Sun, Oct 26, 2025 at 02:29:04PM +0200, Laurent Pinchart wrote:
> > > Energy Efficient Ethernet (EEE) is broken at least for 1000T on the EQOS
> > > (DWMAC) interface. When connected to an EEE-enabled peer, the ethernet
> > > devices produces an interrupts storm. Disable EEE support to fix it.
> > 
> > As this is the second problem that has been reported recently, please
> > bisect the conversion of stmmac to phylink managed EEE support and see
> > whether there is anything in that which is causing this.
> 
> Emanuele Ghidoli has bisected this to commit 2c81f3357136 ("net: stmmac:
> convert to phylink PCS support"), as reported in [1]. I can test that
> commit and the commit just before tonight.
> 
> [1] https://lore.kernel.org/all/341f56de-9dde-4c44-9542-b523e1917dcb@gmail.com/

As you will notice in that thread, I have responded to it last week, so
I am well aware of it. I am also well aware of the claims Emanuele made
in his commit description are demonstrably false.

That's not to say the commit isn't a problem, but the explanation of
why it's a problem doesn't make sense right now, and thus what needs to
be done to fix it is unknown.

I don't think going around disabling EEE on individual platforms is the
right approach.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
