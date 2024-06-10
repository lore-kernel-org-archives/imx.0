Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06CD77F2F;
	Mon, 10 Jun 2024 17:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718039769; cv=none; b=AenOK3gkdlSWaRQklXyuYTVd+SptnxuLydFVnbVn97xtfZncY3zR7iJ2+J5M88+iLuq7qSrrPDSvm9nRWjNLnbQS/kJn0OApOi6xpEL41MPm6O0O3Phol7KJHwjoILDsK1fpVctXrN11BgnUp/dFoKqpXyyNeuFsMl8Dvo6iGAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718039769; c=relaxed/simple;
	bh=HinoY02p1LpLPOjaaEHb1JVXGrzq+rrnxJRiEJ48xlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZYnzr2V2jflIGly7o4Xvt9V0kcdioNBHmen0s+Ta9zq5nZaCAxO+fzTNDzzI5AhZNumUh2E1fw5CG0uKtUF92vigltgqXROi9WM8psgXni5776HUTmI9f/Odn8P49qC0ZJngoBqt/XEUBUouKAItvDz9y92BZj2ADY4AVuun6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=AZcN0L1s; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="AZcN0L1s"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rwMOeMtIESGwI5KegBNglkXRUu/oEgFYhH+CJMDK8wM=; b=AZcN0L1s1aXflwtaQLdqmXEwhR
	l0YTaETKG2vL5RvkAJkkf5zPiawQ0Wg3ApdT954vOH+8N3GZOFHHXC+k8yZDh9uEQztQq/pmK5mjg
	qeAFGIy4dMEthS7CeV9R2Lh8NV1AIbmY6TsibUF3Va98myxlVlrhKeF+OikoBUzKzdEs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sGick-00HJnh-QN; Mon, 10 Jun 2024 19:16:02 +0200
Date: Mon, 10 Jun 2024 19:16:02 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-arm-kernel@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Johannes Zink <j.zink@pengutronix.de>
Subject: Re: [PATCH v2 2/5] arm64: dts: freescale: Add device tree for
 Compulab UCM-iMX8M-Plus
Message-ID: <92d20188-d1e5-4983-ae70-14ef2f5a2342@lunn.ch>
References: <20240317164850.32708-1-laurent.pinchart@ideasonboard.com>
 <20240317164850.32708-3-laurent.pinchart@ideasonboard.com>
 <c5f5fd07-99e3-4a43-a92e-9e622932ea1b@lunn.ch>
 <20240317185722.GA24220@pendragon.ideasonboard.com>
 <7deaf04a-7433-4712-9fb8-1c89fc283346@lunn.ch>
 <20240317235030.GB18202@pendragon.ideasonboard.com>
 <be18ffcf-3157-4f8c-9bb1-10d6520900f5@lunn.ch>
 <20240606223823.GA2245@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606223823.GA2245@pendragon.ideasonboard.com>

On Fri, Jun 07, 2024 at 01:38:23AM +0300, Laurent Pinchart wrote:
> Hi Andrew,
> 
> On Mon, Mar 18, 2024 at 01:58:56PM +0100, Andrew Lunn wrote:
> > > I don't know if there are public errata about this issue. It is beyong
> > > my areas of expertise. I've found a relatively recent e-mail on the
> > > netdev mailing list that seems related ([1]), but there was no reply.
> > > 
> > > [1] https://lore.kernel.org/netdev/9c1c9408-88ac-4ade-b8ec-2ae5d8922cac@pengutronix.de/
> > 
> > Thanks for the link.
> > 
> > Has anybody tried setting STMMAC_FLAG_RX_CLK_RUNS_IN_LPI.
> > 
> > https://elixir.bootlin.com/linux/latest/source/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c#L816
> > 
> > The problem description makes it sound like the hardware does not like
> > the clock being turned off. Setting this flag might fix that.
> 
> How would you recommend proceeding with this patch ? I can drop the
> eee-broken-1000t property as I didn't notice any issue, or keep with the
> risk that it my be cargo-cult.

If you have not noticed any issues, drop it. This thread should
hopefully pop up in a search engine if anybody runs into problems.

	  Andrew
