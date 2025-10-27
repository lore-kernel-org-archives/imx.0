Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CE2481B1
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 09:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761556345; cv=none; b=QfEoingNnXncfUb/5HRzvZTwjV7xNZ0Mnq6hHBrL/SjnSqNUxyc20qeFw3LtCwhNQPBM1TROlYYJkGaiMGTZDhxLqzIJZ5GLB4+355TVXt7ouJnPzI6HTG3hpCfG3Ydurmn2WYkZXUo6eK8VRhDwjDlTuYQMESTNaOHQyoQrxYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761556345; c=relaxed/simple;
	bh=7++QsH5bawr7XCDAbjJoXgzd3HDYqk6XSr6YwDduhrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=narjE1fxsUluEPdlL/IpK4XV97YytxGQ3hIYxWrI0pDfUIOV9EHIpMs8GR5VllNaohZaNKZbdvjG9UNX3LHK4ELhNM76AfMNDmUQ8ZwdsQJZ8rIcUmk7caVn4M4l9/ZKuooy9uNoi/z2K/Ac9aW+t20/RwV0uhN78SYVl2GrAyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vDJGu-0002bL-Sy; Mon, 27 Oct 2025 10:12:12 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vDJGu-005gDs-1z;
	Mon, 27 Oct 2025 10:12:12 +0100
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1vDJGu-00000003Szh-2FNl;
	Mon, 27 Oct 2025 10:12:12 +0100
Date: Mon, 27 Oct 2025 10:12:12 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
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
Message-ID: <aP83bMDWCre7-Sjw@pengutronix.de>
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
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

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
>
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

Please note, RTL8211E PHY do use undocumented SmartEEE mode by default.
It ignores RGMII LPI opcodes and doing own thing. It can be confirmed by
monitoring RGMII TX and MDI lines with oscilloscope and changing
tx-timer configurations. I also confirmed this information from other
source. To disable SmartEEE and use plain MAC based mode, NDA documentation
is needed.

Best Regards,
Oleksij
