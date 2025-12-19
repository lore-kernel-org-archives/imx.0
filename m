Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23B53596E4;
	Fri, 19 Dec 2025 15:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159397; cv=none; b=Bo3iWkUBCOa12J1fZatTObP1ZosxPbgN1Dy9C15nWylg5VAym+FZ+A9ZycUO/NXe/IsDMoaigAsJSRmrxuUo/fXuGnlfDwGhxpvA42uhqg3ojB42ofJ+M5W50A5kUaqwI2Bi6LksCZV0IK+QY3O9ZG3+WI2p6EyOt23MCUnmEAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159397; c=relaxed/simple;
	bh=xWw3y3D3Kfxk4RcxIQO5+qJ0YQDWQxO8NCQq8WRdfSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4cmO+nXlagr6QG42mjS+f9VX1w03JE3vi0tomsq6h6x2dN5tsOgr+i8uSdnOgWTTsr1oHpQUWZLY3h/w6OT2xnA9S8hi2PecQDl90L8vSU8xZAH+HepQnVYZT6Wna4xNdKDwtGarQaTVBhDXBhaqsun14jBYxygfYfmnJABUIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=UU6FHl7M; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="UU6FHl7M"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Ld4vcRsaM1nAAmCLAGvTjncvtrY02tFpadBGKYaEmv8=; b=UU6FHl7MSDr1WS7pFS9p3ZNJ8q
	r484UfApXYkx+cRmgERONLIi9139sZFY1FHWlJxHrjUGQRGnLGYemJZZW5nkJYb7MO1jxJBYdDz4Z
	4wDbN5W6Ao5vcpzzse8gSx+PEhRsoQ5W87sTu4zuOc+2voAoCvu8LDTaneqCTmULTD5s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vWcjP-00HTzF-Fy; Fri, 19 Dec 2025 16:49:27 +0100
Date: Fri, 19 Dec 2025 16:49:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Liu Ying <victor.liu@nxp.com>,
	krzk+dt@kernel.org, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
Message-ID: <033450ab-f14d-4bf7-b7ee-aaffd014820d@lunn.ch>
References: <20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de>
 <20251202-v6-18-topic-imx93-parallel-display-v7-1-2cce31d64608@pengutronix.de>
 <705773fc-5aba-4bff-b05e-272e1cd0262c@nxp.com>
 <20251215161706.2ea3wtu3xlwcxxar@pengutronix.de>
 <7127040f-55ab-4bfa-8795-1df76085470c@kernel.org>
 <20251219153537.zgxcokyhcqerw4jp@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219153537.zgxcokyhcqerw4jp@pengutronix.de>

> We discussed the ranges/reg usage internally as well with the following
> outcome:
> 
> - Situation
> 
>   With i.MX8M SoCs NXP introduced MIX domains. Each domain has a so
>   called BLK-CTRL IP. There is no common register layout for the
>   BLK-CTRL IPs. In addition to this, the register fields within one
>   register may not related to the same IP. Please see my below example:
>   
>   The DISP_MUX register configures the DPI output routed to physical
>   SoC pads as well as the internal MIPI-DSI DPI behavior. This PDFC
>   bridge binding is only interested in the first part, not the 2nd.
> 
>   In other words, the BLK-CTRL IP can be seen as a bunch of loose
>   register fields.

Why do hardware engineers keep on insisting on doing this. And why
don't software engineers when asked to review the proposed registers
push back and say No?

I know this is out of you hands, but it is something we should
encourage software engineers at SoC vendors to do. Otherwise we will
have to continually live with such a mess.

     Andrew
