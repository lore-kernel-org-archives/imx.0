Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052E01DA3F
	for <imx@lists.linux.dev>; Wed, 26 Jul 2023 15:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BjrSQ5IKcciLqpEbqlMKfz6FUHHN3vwxCeK/ewwtna4=; b=TaPWC+C+4uIwdrOzp/Om38TvyX
	raBlxmx3U4JM1EKRP62aTIA1WVTSZdRD18lH/V1yY/xY7jMr13RRK3lU+nUNUZqHy/oZ0KOSGytzD
	pmtarKSR3aIEIKRDw3c5C6OpS706E6iqL0vJo4D4KFPjKzLukKaiBapDikz1cL5cbGVan+dhQMQkt
	SLp08qTpwplSvChhladPL2mnySpOyVYqMtjWyUBUVCsfwfLtA1eclUxJSSZxFv/brgGgy2G5GldBM
	A40IAwnQxmtz/xyC9Nv1BF18QHAPq2lr1UKzhUpHVAFLPlA/r2qe4gJ8kmt89Oo9R5AGCLZrATBjO
	XLulJ8fg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40774)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qOgS6-0004dh-2x;
	Wed, 26 Jul 2023 16:29:26 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qOgS5-0002yX-BF; Wed, 26 Jul 2023 16:29:25 +0100
Date: Wed, 26 Jul 2023 16:29:25 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	Frank Li <frank.li@nxp.com>
Subject: Re: [EXT] Re: [PATCH] net: stmmac: dwmac-imx: pause the TXC clock in
 fixed-link
Message-ID: <ZME71epmSHYIB4DZ@shell.armlinux.org.uk>
References: <20230725194931.1989102-1-shenwei.wang@nxp.com>
 <20230726004338.6i354ue576hb35of@skbuf>
 <PAXPR04MB9185C1A95E101AC2E08639B78900A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185C1A95E101AC2E08639B78900A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Jul 26, 2023 at 03:10:19PM +0000, Shenwei Wang wrote:
> > if (of_phy_is_fixed_link(dwmac->dev->of_node)) {
> > 
> 
> This does not help in this case. What I need to determine is if the PHY currently in use is a fixed-link.
> The dwmac DTS node may have multiple PHY nodes defined, including both fixed-link and real PHYs.

... and this makes me wonder what DT node structure you think would
describe a fixed-link.

A valid ethernet device node would be:

	dwmac-node {
		phy-handle = <&phy1>;
	};

In this case:
	dwmac->dev->of_node points at "dwmac-node"
	plat->phylink_node points at "dwmac-node"
	plat->phy_node points at "phy1"
	Your "dn" is NULL.
	Therefore, your imx_dwmac_is_fixed_link() returns false.

	dwmac-node {
		fixed-link {
			speed = <...>;
			full-duplex;
		};
	};

In this case:
	dwmac->dev->of_node points at "dwmac-node"
	plat->phylink_node points at "dwmac-node"
	plat->phy_node is NULL
	Your "dn" points at the "fixed-link" node.
	Therefore, your imx_dwmac_is_fixed_link() also returns false.

Now, as far as your comment "What I need to determine is if the PHY
currently in use is a fixed-link." I'm just going "Eh? What?" at that,
because it makes zero sense to me.

stmmac uses phylink. phylink doesn't use a PHY for fixed-links, unlike
the old phylib-based fixed-link implementation that software-emulated
a clause-22 PHY. With phylink, when fixed-link is specified, there is
_no_ PHY.

There is no need to do any of this poking about to determine if the
link that is being brought up is a fixed-link or not, because phylink's
callbacks into the MAC driver already contain this information in the
"mode" argument. However, that is not passed to the driver's internal
priv->plat->fix_mac_speed() method - but this is the information you
need.

There is no need to write code to try and second-guess this, phylink
tells drivers what mode it is operating under.

stmmac really needs to be cleaned up - and really doesn't need more
complexity when the information is already being provided to the
driver.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
