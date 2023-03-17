Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A987475
	for <imx@lists.linux.dev>; Fri, 17 Mar 2023 17:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iHnR6VsoXLRrgo7RdT0e2Sj6OaG0kttlCIL24iJ+R/E=; b=f57Rqgoj74FE0JtuFHgjAPzlUC
	YkZquQYr1QP8+06LtLlZgr8Muz+A/OqU0kSmuZAAwyNcbcPFlxP+QJULHWbXjmLWLIV0rT2xExFz3
	1OnuzugNDXfryvu/f+H79S0rVBW6053hsmkGT620nYfTY3Jr/RVIrKICS8Umy0G8biNGvaw8flKT7
	KTupK78KTRZGXMD0eBLhLWDMpE+OEoBnZQAwMlubLi2trR2nWfuwmt2tWD3MMEKFFSHI0TGp6brUl
	eHmvfC/zgCjdespr5BxCPchEp03MrJ8wEv3fcUzOflYSWlXr51TucXysEQRTR25r7uVoKbHmrYULY
	dBwMN6EQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34204)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pdE2i-0003A5-F5; Fri, 17 Mar 2023 17:39:04 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pdE2d-0003dP-5d; Fri, 17 Mar 2023 17:38:59 +0000
Date: Fri, 17 Mar 2023 17:38:59 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Shenwei Wang <shenwei.wang@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] net: stmmac: start PHY early in __stmmac_open
Message-ID: <ZBSlsyv+qcd30hBg@shell.armlinux.org.uk>
References: <20230316205449.1659395-1-shenwei.wang@nxp.com>
 <ZBOQecR6q5Xgr75F@shell.armlinux.org.uk>
 <f348ece4-90ef-4368-893a-73de37410fd2@lunn.ch>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f348ece4-90ef-4368-893a-73de37410fd2@lunn.ch>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, Mar 17, 2023 at 06:34:13PM +0100, Andrew Lunn wrote:
> > NAK. A patch similar to this has already been sent.
> > 
> > The problem with just moving this is that phylink can call the
> > mac_link_up() method *before* phylink_start() has returned - and as
> > this driver has not completed the setup, it doesn't expect the link
> > to come up at that point.
> > 
> > There are several issues with this driver wanting the PHY clock early,
> > and there have been two people working on addressing this previously,
> > proposing two different changes to phylink.
> > 
> > I sent them away to talk to each other and come back with a unified
> > solution. Shock horror, they never came back.
> > 
> > Now we seem to be starting again from the beginning.
> > 
> > stmmac folk really need to get a handle on this so reviewers are not
> > having to NAK similar patches time and time again, resulting in the
> > problem not being solved.
> 
> And just adding to that, Developers should also get into the habit of
> searching to see if somebody has already tried and failed to solve the
> problem.
> 
> “Those Who Do Not Learn History Are Doomed To Repeat It.”
> 
> Try avoiding wasting everybody's times by learning a bit of history.

+1,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000!

(Yes, factorial too! :) )

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
