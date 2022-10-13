Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B0E33C5
	for <imx@lists.linux.dev>; Thu, 13 Oct 2022 16:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=u/jFRmv5OzNBmCUqUIzeZilfpc0VoRr0v+bxhF3GJN4=; b=zww8JpHlPT5u82kZvtw8bDzdNx
	yfFgh08TI0AgJWbcC9K82AsflxUc8VoAZ3Nm7/HJR43/hzxCsvf6AX9p26ys55Vsg0Q3mO5+zIJve
	xcTwbfnx9uiNiB9/3tPLIKpuiT9325z7WSJuXivBcQXU2B7GB9g6c8im/ZRBbULBWvM8gwIXL+jhL
	9fUxSdFdS5qTpHPr//kK8xJwonNeLdarSpsKmiM8s7U7/1vldzacebFoNM8sQSGb2P8le1gexyYAc
	7ALcTi/u/GwxtceeImMliJwL0/lkbuoRODSUwX89gxqWLHggl1MxzhCasAIwk4/eAzRBmwFqj04+w
	BSKE6/tw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34708)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1oj0jz-0008WP-6C; Thu, 13 Oct 2022 17:07:23 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1oj0jt-0004t0-SQ; Thu, 13 Oct 2022 17:07:17 +0100
Date: Thu, 13 Oct 2022 17:07:17 +0100
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
Subject: Re: [PATCH v5 0/2] net: phylink: add phylink_set_mac_pm() helper
Message-ID: <Y0g3tW26qDDaxYPP@shell.armlinux.org.uk>
References: <20221013133904.978802-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013133904.978802-1-shenwei.wang@nxp.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Oct 13, 2022 at 08:39:02AM -0500, Shenwei Wang wrote:
> Per Russell's suggestion, the implementation is changed from the helper
> function to add an extra property in phylink_config structure because this
> change can easily cover SFP usecase too.

Which tree are you aiming this for - net-next or net?

You should use [PATCH net ...] or [PATCH net-next ...] to indicate which
tree you're aiming these patches for.

Please don't repost due to this unless you want it to go into the net
tree, as net-next is currently closed.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
