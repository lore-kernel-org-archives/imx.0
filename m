Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0172D1C3C08
	for <imx@lists.linux.dev>; Thu, 14 Aug 2025 06:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755154114; cv=none; b=ftYUd6K1aNa65M9MYMRj0EjC0Pzq88JWSepU7cbWriZEdbMJmt4KR4DN3iOg/NhMaVltkCzlfzDr0fR7mSe5MoBtpuLDT8G8sYoLJZVDub8GlHVJQr+gGSFgkL+u5A/qnVBdjWrmtTOCv7t4ufyBecsvBgFb9bOYnoX5A9y+cbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755154114; c=relaxed/simple;
	bh=/UtVnKTqYerqYS5xnl0q0rPTv3I8d4qynMpBxd8rmz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=le5KB51Hi9XHpXdFx0jn/Nio8N0z4JVSfCjDadeRxf2UTJYTyhb1n4Nc+Z12zR6yD0Vdh0+EjwI4NA27HMD0+mh76z6U3hpCPU+wObc0dw67LbOw5k4PEDsT6flVrHH8I41u15TqGQISGRpF6K9HaOg0z4T0KXjO1/PCRjIovgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1umRl2-0002cS-Q3; Thu, 14 Aug 2025 08:48:16 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1umRl0-000DC9-1R;
	Thu, 14 Aug 2025 08:48:14 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1umRl0-00B3B7-13;
	Thu, 14 Aug 2025 08:48:14 +0200
Date: Thu, 14 Aug 2025 08:48:14 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, max.schulze@online.de,
	khalasa@piap.pl, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v2] net: usb: asix_devices: add phy_mask for ax88772 mdio
 bus
Message-ID: <aJ2GrsiISQqbkZsF@pengutronix.de>
References: <20250811092931.860333-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250811092931.860333-1-xu.yang_2@nxp.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On Mon, Aug 11, 2025 at 05:29:31PM +0800, Xu Yang wrote:
> Without setting phy_mask for ax88772 mdio bus, current driver may create
> at most 32 mdio phy devices with phy address range from 0x00 ~ 0x1f.
> DLink DUB-E100 H/W Ver B1 is such a device. However, only one main phy
> device will bind to net phy driver. This is creating issue during system
> suspend/resume since phy_polling_mode() in phy_state_machine() will
> directly deference member of phydev->drv for non-main phy devices. Then
> NULL pointer dereference issue will occur. Due to only external phy or
> internal phy is necessary, add phy_mask for ax88772 mdio bus to workarnoud
> the issue.
> 
> Closes: https://lore.kernel.org/netdev/20250806082931.3289134-1-xu.yang_2@nxp.com
> Fixes: e532a096be0e ("net: usb: asix: ax88772: add phylib support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Tested-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>

Thank you! 
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
