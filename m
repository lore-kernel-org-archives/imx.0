Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F52329A9FA;
	Mon, 27 Oct 2025 03:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761534526; cv=none; b=YVqLbYt4wHjyzm0VTGKqp3jkCGfJ0tWXJTD5tV91fzHJrJBN90QV/4L7qBscnqweWchN1xlwKxryQqu8/fYr9wqJ+6dRjbbPUF1QBjaLmZdoN9TYBBAiUfHGjsWz3WR/h5idRAuv7tf6MTW3xYOCLdZ1/8fBvpKRO3VYaf3U4kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761534526; c=relaxed/simple;
	bh=eEJQuTavtw2bgfWhBmMH+2ATJHPuR2FmDII+GPXFcZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMuAKZp/r2BM8mKAaJLucXHKdBPLPJyAvwrsa/V2veXfMPLHNZ5ayMnrrexrDXQ1PqTTasDSVejQkqeLivCNPXn98rhPX55u8v48bpOHv7lGLgVeM5tjIxc/LxyW7bi878QlLz2j/KeTBKowRX6hzoS88eQC2+xlzwpTr/6gZNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=vwHQJ2So; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="vwHQJ2So"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=GAeOHfgUT6r3fiFo8cNAJVc1VqoNbWb3MuAwo4bKF7o=; b=vwHQJ2Sow6ozOIG3NRmCoT3bQe
	kL1rU1HzVMODq/Poeh6tfjRENi4Cu1dLqft2bED6DT8SCsksDMUGMHE+PrC3pd6tjDuHyz1yxNIcj
	7nm1nbn2oAIusdRxdt3JNol5btUtk49BffMeeScg6S/hr8+Ws6jLZtZh7SdZ+c6qkvDw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vDDb8-00C9V7-Qu; Mon, 27 Oct 2025 04:08:42 +0100
Date: Mon, 27 Oct 2025 04:08:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Russell King <rmk+kernel@armlinux.org.uk>
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
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>

Adding Russell King

On Sun, Oct 26, 2025 at 02:29:04PM +0200, Laurent Pinchart wrote:
> Energy Efficient Ethernet (EEE) is broken at least for 1000T on the EQOS
> (DWMAC) interface. When connected to an EEE-enabled peer, the ethernet
> devices produces an interrupts storm. Disable EEE support to fix it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> The exact reason for the interrupt storm is unknown, and my attempts to
> diagnose it was hindered by my lack of expertise with DWMAC. As far as I
> understand, the DWMAC implements EEE support, and so does the RTL8211E
> PHY according to its datasheet.

I believe for DWMAC it is a synthesis option. However, there is a bit
indicating if the hardware supports it.

The PHY should not be able to trigger an interrupt storm in the
MAC. So this is likely to be an DWMAC issue.

Which interrupt bit is causing the storm?

> What each side does exactly is unknown
> to me. One theory I've heard to explain the issue is that the two
> implementations conflict. There is no register in the RTL8211E PHY to
> disable EEE on the PHY side while still advertising its support to the
> peer and relying on the implementation in the DWMAC (if this even makes
> sense)

It does not make sense. EEE is split into two major parts. The two
PHYs communicate with each other to negotiate the feature, if both
ends support it and both ends want to use it. The result of this
negotiation is then passed to the MACs.

It is then the MAC who decides when to send a Low Power Indication to
the PHY to tell the PHY to enter low power mode. The MAC also wakes
the PHY when it has packets to send.

A quick look at the data sheet for the RTL8211E suggests this is what
is supports.

There are a few PHYs which implement SmartEEE, or some other similar
name. They operate differently, the PHY does it all, and the MAC is
not even aware EEE is happening. Such PHYs should really only be
paired with MACs which do not support EEE. An EEE capable MAC paired
with a SmartEEE PHY could have problems, but hopefully the EEE
abilities and negotiation registers in the PHY would be sufficient to
dissuade the MAC from doing EEE. But i would not expect a setup like
this to trigger an interrupt storm.

	Andrew
