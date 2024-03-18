Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA22381B8;
	Mon, 18 Mar 2024 12:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710766743; cv=none; b=KXs1hIzDoH9H/n1vqbOe3TqhSL3JWSCn0m6W+LW8nPDBqjJWQp0fnQlvc2h7RnZ8JKUgrPn8oOmqzs+SvydmA2H5y/hMepfjiryKOgXQh8LWVBZPYYC9zg3yFcUZg3McycR4H7YL/OLbC76oa/Fh6XzYYgTR61IVeA3kM7cXHrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710766743; c=relaxed/simple;
	bh=uj2riyiHOvWTN+mzs8Sp2CMAvOGhKFZrdiqq1Hd7P7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKjqAwbQBnHRLUEgFpRIU3HIRJCBQsO/vG+wy86KNKcF4yIyjwMc1xDsbRSeZKSvb7VT631VyeCHLxFp/GXgiR9gQ7CsgybTh9q9NIxK1A/ePRKnXl232yAGoXsHMSlV2ntzOl3DW7ECsOMxNeIBaqNLd+eewbbAN6fuGl9C9Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=juzlhEif; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="juzlhEif"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Hp9yMX9h2ueTcKW6d4TAYA6h9J7ajxbIROHaytm5A48=; b=juzlhEiflE8+UTbYnGbRjp29Hx
	CiKP9pD88mK2R0iS2/KMzBwZqr9O9leLeAR7GEU3VcJeu53xWtG0CmxIKLlsGv5QpkvITw3tVVJws
	hb4OI/NoMtWcOcMivz3S5oUfabWLIh/d0x1QMeseuYD2Na+DmPB3954pltOub6nZk3qI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rmCZs-00Abz9-PQ; Mon, 18 Mar 2024 13:58:56 +0100
Date: Mon, 18 Mar 2024 13:58:56 +0100
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
Message-ID: <be18ffcf-3157-4f8c-9bb1-10d6520900f5@lunn.ch>
References: <20240317164850.32708-1-laurent.pinchart@ideasonboard.com>
 <20240317164850.32708-3-laurent.pinchart@ideasonboard.com>
 <c5f5fd07-99e3-4a43-a92e-9e622932ea1b@lunn.ch>
 <20240317185722.GA24220@pendragon.ideasonboard.com>
 <7deaf04a-7433-4712-9fb8-1c89fc283346@lunn.ch>
 <20240317235030.GB18202@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240317235030.GB18202@pendragon.ideasonboard.com>

> I don't know if there are public errata about this issue. It is beyong
> my areas of expertise. I've found a relatively recent e-mail on the
> netdev mailing list that seems related ([1]), but there was no reply.
> 
> [1] https://lore.kernel.org/netdev/9c1c9408-88ac-4ade-b8ec-2ae5d8922cac@pengutronix.de/

Thanks for the link.

Has anybody tried setting STMMAC_FLAG_RX_CLK_RUNS_IN_LPI.

https://elixir.bootlin.com/linux/latest/source/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c#L816

The problem description makes it sound like the hardware does not like
the clock being turned off. Setting this flag might fix that.

	Andrew

