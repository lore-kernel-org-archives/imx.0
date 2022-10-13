Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9AE17C9
	for <imx@lists.linux.dev>; Thu, 13 Oct 2022 10:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pjTVS6JgzB6zbGzEkQkKcJrhDL5WkDfSJ6POZrFZYqY=; b=uPZGwmNuGuyLdzIHAd82SN+ocC
	o4UYoIIKS588es2kSmcF7ck4YzNwcm/fJq3zXWgOOLpmOIgPzkyMmVboMmP7o3bi/IkPrHNhjOIyl
	t7TWygHwzN66azmOjnFGwwTlYnMb9I0W390SFZcAvx4bs2c3r1OhvvBj306lw4waLJ3fOqiFuPEtv
	ELlMdEjVGepbbLRVzU8KX8tka7PHX2hlu0mPEh6enjT+i8HIei+zsnIqIJylkCbEaZy4jpGJLuwAF
	OtYjH3tOrVGtWza26/kjjxKdZnGqYKEUwmyVWXVyoKWagT9yff8aUzxtyZevKXTz+CM4FSzJNmFQo
	L+wn9hfw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34702)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1oivgO-0008F4-GX; Thu, 13 Oct 2022 11:43:20 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1oivgI-0004hr-0y; Thu, 13 Oct 2022 11:43:14 +0100
Date: Thu, 13 Oct 2022 11:43:13 +0100
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
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v4 1/2] net: phylink: add mac_managed_pm in
 phylink_config structure
Message-ID: <Y0frwcu/SxHwatch@shell.armlinux.org.uk>
References: <20221010204827.153296-1-shenwei.wang@nxp.com>
 <20221010204827.153296-2-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010204827.153296-2-shenwei.wang@nxp.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Oct 10, 2022 at 03:48:26PM -0500, Shenwei Wang wrote:
> The recent commit
> 
> 'commit 47ac7b2f6a1f ("net: phy: Warn about incorrect
> mdio_bus_phy_resume() state")'
> 
> requires the MAC driver explicitly tell the phy driver who is
> managing the PM, otherwise you will see warning during resume
> stage.
> 
> Add a boolean property in the phylink_config structure so that
> the MAC driver can use it to tell the PHY driver if it wants to
> manage the PM.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>

Perfect, thank you!

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
