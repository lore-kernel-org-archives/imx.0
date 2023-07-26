Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3F1AD5A
	for <imx@lists.linux.dev>; Wed, 26 Jul 2023 08:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=DVKYdVDWQpK5ELmAAq7qfDDuRr67/RTt9VHAA/B+NYk=; b=zIYZlmI+20RfYNSNHiAdSUsa1W
	NxTqQLz1VrJIBJelddkipCtPBanAzQ9rvnuw9DG/g5nwJtgjedaPtCDd1xBY4MjeGrjPmc7jZuMZm
	rNuikip9Wmb/RgyCErHyn0XMc/oe/X+9DUVJNQDnZPvQVu8kXNLH+IY0Vfu4rx6t+DME=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qOZw8-002L2e-JT; Wed, 26 Jul 2023 10:32:00 +0200
Date: Wed, 26 Jul 2023 10:32:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
	Russell King <linux@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Frank Li <frank.li@nxp.com>
Subject: Re: [PATCH] net: stmmac: dwmac-imx: pause the TXC clock in fixed-link
Message-ID: <93ffd7a5-2479-4726-b26a-aab10ac09d14@lunn.ch>
References: <20230725194931.1989102-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725194931.1989102-1-shenwei.wang@nxp.com>

On Tue, Jul 25, 2023 at 02:49:31PM -0500, Shenwei Wang wrote:
> When using a fixed-link setup, certain devices like the SJA1105 require a
> small pause in the TXC clock line to enable their internal tunable
> delay line (TDL).

The SJA1105 has the problem, so i would expect it to be involved in
the solution. Otherwise, how is this going to work for other MAC
drivers?

Maybe you need to expose a common clock framework clock for the TXC
clock line, which the SJA1105 can disable/enable? That then makes it
clear what other MAC drivers need to do.

      Andrew
