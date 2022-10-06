Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02FA33CF
	for <imx@lists.linux.dev>; Thu,  6 Oct 2022 19:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=y6tf/FtjgfbCe9jqIXN3yx9CuCEhSGqRMK4/HanfozY=; b=lqxq1Z9Zy6D93E27E2fIh6BGPl
	MX2TbVZsdokgzOvfxSadudG5S9ON8nTlFszf4P4Az/eNfDAl3eJqcwB/Mvkg5Q0QE7PL33TACcGO+
	8Ta51IiaFIZ1JYaqR+pC+KEZYC3wk47LuQX7aJwC3rKhIDtJXAKByNAtZDN16/vWEt+82CLidZUeW
	HNjn+VczAgLPUfa6RoTqUpm6Y0Y5bBb/cC3k25NLtLod7+2v7NrpITdbcxoO0+kVsSlmEHQjoLG9D
	EJlD3D8u/oZ/Wu0R961wijh4sOQQNb1uhtCmkS6Waglkc+5g5CPAl/B6JtuaLKcaDMSVdSffkKCCW
	X9TQlidQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34612)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ogWTe-0001sV-3e; Thu, 06 Oct 2022 20:24:14 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ogWTa-0006YI-Fv; Thu, 06 Oct 2022 20:24:10 +0100
Date: Thu, 6 Oct 2022 20:24:10 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] net: phylink: add phylink_set_mac_pm() helper
Message-ID: <Yz8rWoYlF8sjbkBz@shell.armlinux.org.uk>
References: <20221006170237.784639-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221006170237.784639-1-shenwei.wang@nxp.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Oct 06, 2022 at 12:02:37PM -0500, Shenwei Wang wrote:
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index e9d62f9598f9..a741c4bb5dd5 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -1722,6 +1722,15 @@ void phylink_stop(struct phylink *pl)
>  }
>  EXPORT_SYMBOL_GPL(phylink_stop);
>  
> +void phylink_set_mac_pm(struct phylink *pl)

This needs documenting. The documentation for the function needs to
mention when this should be called - so users are guided towards
calling it at the right place in their drivers, rather than leaving
them trying to figure it out and possibly get it wrong.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
