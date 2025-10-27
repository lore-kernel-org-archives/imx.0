Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232FD2DE6ED;
	Mon, 27 Oct 2025 19:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761594771; cv=none; b=i7rmyN5KNzWe0Cq9LUPMx0uAfTTx0PtKoHEJM5fYFLgot4yviaa576AgAMi2dkfupuXgWzt7APbp/MCHuM3nMYnXlgwpWpA8XEsleqXelbrc82k5lnc1qQZSDSUS1zpvAHIVaHYsF1jP+u+Xx0A2A2jdG+DaeFG63hfTj/wIBug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761594771; c=relaxed/simple;
	bh=/GduWPPjZdYq73zu0l+bcxFOIFWfLkmfeoxY9K5DE9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lz15mX80IqEBoYe7RRbBsqOoOQTBISiVtynQFiIJvyNtN5oz9Pp2Za4Xsb9GL+YJf/l1du/NlJekG336ym2FWd/Y/wqHxTBoVA9Sg0lAD4zP8fk5YBjv22t6gxncBgiao7DYKvmlrmNtZZqTfsG1IQdqNDASH12ZhAZBgI0JgrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Hmvr1wH8; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Hmvr1wH8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=TEVZQ7umfQ/e8KFlENApvsOj36JwyAfdhPSR2FTrVk0=; b=Hmvr1wH8kgdIYIEL18y3IH+31c
	hBa/CfiSGqy8VWgsi9/0Y1DeYon5eQFbOf5f9D0zno9gGUUa0PW/xmu4+kO31q3meia0nYmUj0h1W
	DFImuXA7GA7nXo4aKsV0yNsgFiSIzKr21IPCLMEJPcE9x2ZymNCxeEiM6e0EKXTjFxxE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vDTGp-00CEGj-AO; Mon, 27 Oct 2025 20:52:47 +0100
Date: Mon, 27 Oct 2025 20:52:47 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
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
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <1b25edfc-5f8c-4530-8b0f-a0f247c0b2ba@lunn.ch>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <aP-ML-A_h13pXY2d@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP-ML-A_h13pXY2d@shell.armlinux.org.uk>

> If we decide that EEE should be enabled by default, then we'll need
> to revert this change. However, given Oleksij's recent input, I'm
> wondering whether EEE should default to disabled given the issues
> with Tq. The suggestion there is that many PHYs get it wrong and thus
> are incompatible with each other when EEE is enabled.

I would probably default to leaving the hardware alone, take over its
configuration. If the reset default or strapping has EEE enabled, its
probably been reasonable well tested. If the reset default or
strapping is EEE is disabled, it probably is not so well tested, so
maybe dangerous to enable by default.

      Andrew
