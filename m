Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DC321C9E1
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 14:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761576660; cv=none; b=bPR/acKu0eMM1FYvf2ftCT9R4Ft52lwkCSR8QN4ie0XRlkALSYxcJ+k5U2p22PC4Ynqiez4eLNDjsbOmzMQ8n7w1IyQRqCTkJyu0zb4hZiJZwVzu05xMkDha8xpXKH1nZG+O1srO78ga1IDT2hu2BUmSigRhs+fylFoaPZ+4euM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761576660; c=relaxed/simple;
	bh=YnYr+2uN9p8Wy5e6baDAXbycSnvRdc+rm4lMHQd2wCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fFSVA1riI2HYPdlPexroY+6dizsgOz3t7ws7E6aSRZgELOrTM2+EeBmuHwpzaalT14UjNvdbxiTdEb6TMgLYIE0hP3qvov4slufpCzgQWqob7s8i1/Eb0yf+D1KLCIPmB91RKZMKo1LOkMSP3AGazCuS+h25ZQkz/pGuYHJm2vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vDOYg-0003Tf-0O; Mon, 27 Oct 2025 15:50:54 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vDOYf-005j1D-1r;
	Mon, 27 Oct 2025 15:50:53 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vDOYf-003DTB-1K;
	Mon, 27 Oct 2025 15:50:53 +0100
Date: Mon, 27 Oct 2025 15:50:53 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	imx@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <aP-GzR_pVvXvCIn-@pengutronix.de>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <aP83bMDWCre7-Sjw@pengutronix.de>
 <20251027100227.GE1544@pendragon.ideasonboard.com>
 <aP9IB4y5_gyfJGMW@pengutronix.de>
 <20251027103107.GF1544@pendragon.ideasonboard.com>
 <aP9Kuyndws_dYFna@shell.armlinux.org.uk>
 <aP9NJHtbAEmsd89r@pengutronix.de>
 <aP9N9tCdlAbBgovC@shell.armlinux.org.uk>
 <f66d181d-7dd9-4955-bad5-478db2876e47@lunn.ch>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f66d181d-7dd9-4955-bad5-478db2876e47@lunn.ch>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On Mon, Oct 27, 2025 at 01:50:21PM +0100, Andrew Lunn wrote:
> > > Ack. With comment in the code, why we prefer this way, in case some one
> > > wont to spend time on making it work. Probably SmartEEE or some other
> > > word should be used.
> > 
> > So we have options.
> > 
> > However, we need to get to the bottom of what caused the change of
> > behaviour before we start throwing solutions at this.
> 
> It also seems like the PHY is FUBAR. If the standard 802.3 EEE
> registers are being used, a management plane is using them to
> negotiate EEE with the link partner, the PHY firmware should disable
> SmartEEE and only provide 802.3 EEE.
> 
> It sounds like this PHY is not 802.3 compatible.

I do not know better place to post it, so I add it here for archive.
At least, it explains a reason why EEE fails. Something like this is not
possible to handle on the MAC side. At same time it is hard to
diagnose:

In 100BASE-TX EEE mode, the link partner may drop link or loss packet
when the local MAC/PHY (device) starts to transmit the “Wake” signal
immediately following the “Sleep”/“Refresh” signal to exit Low-Power
Idle mode and return to Active mode.

Many EEE PHY link partners require a short “Quiet” (Tq) duration after
receiving the “Sleep”/“Refresh” signal. Without this short Tq wait time,
that is not specified in the IEEE 802.3az Standard, link drop or packet
loss can occur.

https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/ProductDocuments/Errata/80000708B.pdf

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
