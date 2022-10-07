Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF916468F
	for <imx@lists.linux.dev>; Fri,  7 Oct 2022 15:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TnjiivLWuAMHzCv9ZVQ9h2zG0byjOFI8qW50tsvce2A=; b=DByVMYxE0soXBvn+RVUQ4a/dYF
	7NaQD0uH9p3Lo3mmJPvFCr2yHnVWpB0ilov1fWiXNXhVgnTGlw3N4oolapWe8J7Yq/cAZPmfEaD3K
	O4akwy+ptjKbFIcinxQ76aPCyKnK/paz8rnw6teTphBcjYT+GSf5GhPiSwTp5XLGKOhoBsMFoLUTx
	F8oFtDCnUQNoMF9ncEnMqFg8VNsMtib6kxstqH+hCt/xZ3g3w7jOC0cZnJMXfDUzTXuDvBiL55Njb
	inU2SIPCXFT68MALo89/JrTFQQotn3KAnG6wijaH+XFAOvl7WSapDg3YbTiOef/9xXRjpE28/fZBB
	7sFTsSDQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34624)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ogovt-0002Wg-L6; Fri, 07 Oct 2022 16:06:37 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ogovr-0007UU-7Q; Fri, 07 Oct 2022 16:06:35 +0100
Date: Fri, 7 Oct 2022 16:06:35 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] net: phylink: add phylink_set_mac_pm() helper
Message-ID: <Y0BAe1dVwJaDTPB+@shell.armlinux.org.uk>
References: <20221007144111.786748-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221007144111.786748-1-shenwei.wang@nxp.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, Oct 07, 2022 at 09:41:11AM -0500, Shenwei Wang wrote:
> +/**
> + * phylink_set_mac_pm() - set phydev->mac_managed_pm to true
> + * @pl: a pointer to a &struct phylink returned from phylink_create()
> + *
> + * Set the phydev->mac_managed_pm, which is under the phylink instance
> + * specified by @pl, to true. This is to indicate that the MAC driver is
> + * responsible for PHY PM.
> + *
> + * The function can be called in the net_device_ops ndo_open() method.

I think this needs to be a bit clearer - a driver author may well ask
"before or after the PHY is connected?" and this really ought to state
this detail.

Otherwise, the patch is fine.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
