Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5DA156C5
	for <imx@lists.linux.dev>; Fri, 28 Jul 2023 16:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=K70CKmBBT3LezttIHw7dBV6di1pK5wjt+ZfncAAM8eg=; b=J3bK/oJe/QpSNDl0GX966l3Us7
	YkS8XKvV7D8VdgjitBaRQq2hKvL2FQwAkphg38AhqKsHoNdJVyfgQvCYpWdDfHY04x9cSUzJjbKBG
	K5z8CYpU6oWOSnulwS1LYhlwNY6I0uGyM36CplcmklP4kLb3zMelQdHRUKPMq8x/+EFI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qPQkg-002Xp3-R6; Fri, 28 Jul 2023 18:55:42 +0200
Date: Fri, 28 Jul 2023 18:55:42 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	dl-linux-imx <linux-imx@nxp.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Simon Horman <simon.horman@corigine.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Wong Vee Khee <veekhee@apple.com>,
	Revanth Kumar Uppala <ruppala@nvidia.com>,
	Jochen Henneberg <jh@henneberg-systemdesign.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	Frank Li <frank.li@nxp.com>
Subject: Re: [EXT] Re: [PATCH v2 net 2/2] net: stmmac: dwmac-imx: pause the
 TXC clock in fixed-link
Message-ID: <f6c78350-e668-455f-bae5-731dbef633de@lunn.ch>
References: <20230727152503.2199550-1-shenwei.wang@nxp.com>
 <20230727152503.2199550-3-shenwei.wang@nxp.com>
 <CAOMZO5ANQmVbk_jy7qdVtzs3716FisT2c72W+3WZyu7FoAochw@mail.gmail.com>
 <PAXPR04MB9185945F7E5B1A36ADF4F3E28906A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185945F7E5B1A36ADF4F3E28906A@PAXPR04MB9185.eurprd04.prod.outlook.com>

> > Andrew Lunn gave the following feedback in v1:
> > 
> > "The SJA1105 has the problem, so i would expect it to be involved in the solution.
> > Otherwise, how is this going to work for other MAC drivers?
> > 
> > Maybe you need to expose a common clock framework clock for the TXC clock
> > line, which the SJA1105 can disable/enable? That then makes it clear what other
> > MAC drivers need to do."
> 
> I have been considering this plan for some time. The idea should be implemented 
> across all i.mx8/9 platforms. I am going to start to work on it in the following month, 
> and it will take some time to implement it.

So you don't think anybody will use anything else for driving this
switch? Vybrid?

It does not really matter what you implement it for, so long is at is
a clear example for others to follow who might be using the switch
with other SoCs.

	Andrew
