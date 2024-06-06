Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CED13AD30
	for <imx@lists.linux.dev>; Thu,  6 Jun 2024 22:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717713525; cv=none; b=B4B3HgRpjbveDmNXQJ0esZYcovpM8O7uHA2mqxLXe4iHa43xnAzW1O0i4TvYW89zBgenupjjC720EyWvdKK61uCOmddh4ZNKaaBdjIaQOrz260qVLzBd9Ur+oEpkNgZg3Ab8PkcixSqSxvZ9g0mdeENC/zFIOGiLYuW6IfGRloI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717713525; c=relaxed/simple;
	bh=Gjq64vQ8WY69yXWw/YJ1ZzWKeSu0VGkK9XvpL2r8tQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkKa/8f0pG58VSwNxwJq1c0RBkTzClC+5LDtiSuUw2+6/ZkwhDxFVoaVysHKcPxuCI+JZEr41fgw0BeehnwmbIXubeGAQV9sgCC2LrTSILlX6XQxyLcwz/6lgnYa7ru2FlZpkYGDae2F3xECSvcUGmdsCXHBWDlwXasqy6NDBVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nmHw5OVg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nmHw5OVg"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25E3E230;
	Fri,  7 Jun 2024 00:38:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717713513;
	bh=Gjq64vQ8WY69yXWw/YJ1ZzWKeSu0VGkK9XvpL2r8tQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nmHw5OVg7cE11PwWMDsXYvLxSZIl9y/+eISwW6z/LyslvA82nsAlc3IJPZSHaQTkm
	 4OsZVi2v5Ho21H764z9xMSi5hnx2/kA4hukJ/3TFYvo1UeoYgKdD9m4XcPBsagOlxq
	 vbM93YWOmD0SlKagOyIPcrwUkanFnHAqFfo2xg+Q=
Date: Fri, 7 Jun 2024 01:38:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andrew Lunn <andrew@lunn.ch>
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
Message-ID: <20240606223823.GA2245@pendragon.ideasonboard.com>
References: <20240317164850.32708-1-laurent.pinchart@ideasonboard.com>
 <20240317164850.32708-3-laurent.pinchart@ideasonboard.com>
 <c5f5fd07-99e3-4a43-a92e-9e622932ea1b@lunn.ch>
 <20240317185722.GA24220@pendragon.ideasonboard.com>
 <7deaf04a-7433-4712-9fb8-1c89fc283346@lunn.ch>
 <20240317235030.GB18202@pendragon.ideasonboard.com>
 <be18ffcf-3157-4f8c-9bb1-10d6520900f5@lunn.ch>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <be18ffcf-3157-4f8c-9bb1-10d6520900f5@lunn.ch>

Hi Andrew,

On Mon, Mar 18, 2024 at 01:58:56PM +0100, Andrew Lunn wrote:
> > I don't know if there are public errata about this issue. It is beyong
> > my areas of expertise. I've found a relatively recent e-mail on the
> > netdev mailing list that seems related ([1]), but there was no reply.
> > 
> > [1] https://lore.kernel.org/netdev/9c1c9408-88ac-4ade-b8ec-2ae5d8922cac@pengutronix.de/
> 
> Thanks for the link.
> 
> Has anybody tried setting STMMAC_FLAG_RX_CLK_RUNS_IN_LPI.
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c#L816
> 
> The problem description makes it sound like the hardware does not like
> the clock being turned off. Setting this flag might fix that.

How would you recommend proceeding with this patch ? I can drop the
eee-broken-1000t property as I didn't notice any issue, or keep with the
risk that it my be cargo-cult. This is beyond my area of expertise, so I
can perform tests if I get clear instructions, but I don't think I can
investigate alone at this point.

-- 
Regards,

Laurent Pinchart
