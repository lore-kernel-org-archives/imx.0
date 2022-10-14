Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F037163A
	for <imx@lists.linux.dev>; Fri, 14 Oct 2022 10:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2M67E4exov3pIudJ8dLX9p/62WDBS+2cAltVv6T03AA=; b=sfHm+VkQDbGDSCIPpuYyvJu4Op
	HByYBFDrqYxmiUy0/ltP/mwZ3fBqsuUWp7JPlrmTRBoCgYnK1wQiD+eDogKbjvWQ3kguf0JhNtHWX
	pOjaspaz6RlSgqzEmyP7gBjF92JKKgCDaaZgfxlJYxvrbVcfEWC9xTdua4i6ay06rx29OkrPaTXqG
	GEuhXjDZZohqo7F3SOuBbOfqSvxHm4/uYevqnlFP+Pij7rZoWZXGHWrk9PB6P8ZxkCUo60wNfzYDS
	68cv7b2cqjtta56EjRarN4kcSCuVwdBRWlHnd4ijQkF+Kc/VXG1Sw2cfxGqKkWNevhoXHK/C1Kilv
	84epCK8w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34718)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ojHlV-0000hC-CG; Fri, 14 Oct 2022 11:18:06 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ojHlO-0005eU-FA; Fri, 14 Oct 2022 11:17:58 +0100
Date: Fri, 14 Oct 2022 11:17:58 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [EXT] Re: [PATCH v5 0/2] net: phylink: add phylink_set_mac_pm()
 helper
Message-ID: <Y0k3VqK4oOLOEljJ@shell.armlinux.org.uk>
References: <20221013133904.978802-1-shenwei.wang@nxp.com>
 <Y0g3tW26qDDaxYPP@shell.armlinux.org.uk>
 <PAXPR04MB9185777624723D0FE11C6E4689259@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185777624723D0FE11C6E4689259@PAXPR04MB9185.eurprd04.prod.outlook.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Oct 13, 2022 at 07:24:02PM +0000, Shenwei Wang wrote:
> > -----Original Message-----
> > From: Russell King <linux@armlinux.org.uk>
> > Sent: Thursday, October 13, 2022 11:07 AM
> > On Thu, Oct 13, 2022 at 08:39:02AM -0500, Shenwei Wang wrote:
> > > Per Russell's suggestion, the implementation is changed from the
> > > helper function to add an extra property in phylink_config structure
> > > because this change can easily cover SFP usecase too.
> > 
> > Which tree are you aiming this for - net-next or net?
> 
> The patch can be applied to both trees.  You can select the one which is easy to
> go ahead.

That may be the case at the moment, because the net-next tree has been
merged into mainline and the net tree recently updated to mainline, but
that is not always the case.

The purpose of the tag in the subject line is to tell the various
maintainers on the netdev mailing list what _your_ expectation is for
the patch and where _you_ intend it to be applied.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
