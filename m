Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BB47E
	for <imx@lists.linux.dev>; Thu,  5 Oct 2023 03:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="I3bUDcNv"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=POQt14miUY9FOD6uKlKlWtDFJK8h+2insygX+sUhCuM=; b=I3bUDcNvyhEtxetKZCLrB79lEj
	ZV9GKL34uhMhAuaP9oR1YyeRkedZAQIlvg/pH3OkTtkAcIqpcFWrncI3ndxoFjiG3DR1slC8cImio
	U9zDn0lk4Km2cM8MB+lv2wTQdHjh+Vboi1MBCUONMqhR/qtGproDIUwTmK9V1P+g/UCs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qoEjy-008IHz-4u; Thu, 05 Oct 2023 05:09:30 +0200
Date: Thu, 5 Oct 2023 05:09:30 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev,
	Mario Castaneda <mario.ignacio.castaneda.lopez@nxp.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-imx: request high frequency mode
Message-ID: <164e5e28-6a56-480f-81dd-8a31ee7e5285@lunn.ch>
References: <20231004195442.414766-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004195442.414766-1-shenwei.wang@nxp.com>

On Wed, Oct 04, 2023 at 02:54:42PM -0500, Shenwei Wang wrote:
> Some i.MX SoCs like the i.mx8mq support adjusting the frequency of the
> DDR, AHB, and AXI buses based on system loading. If the dwmac interface
> in the driver does not request a HIGH frequency, it can significantly
> degrade performance when the system switches to a lower frequency to
> conserve power.
> 
> For example, on an i.MX8MQ EVK board, the throughput dropped to around
> 100Mbit/s on a 1Gbit connection:
> 
>     [ ID] Interval           Transfer     Bitrate
>     [  5]   0.00-10.00  sec   117 MBytes  97.9 Mbits/sec
> 
> However, throughput can return to expected levels after its driver requests
> the high frequency mode. Requesting high frequency in the dwmac driver is
> essential to maintain full throughput when the i.MX SoC adjusts bus speeds
> for power savings.

Isn't this going to cause a power regression? I expect there are
applications which expect this behaviour and are happy with
100Mbps. And you are going to change it so their battery goes flatter
faster, or they need to run their fan more often. So maybe you need a
DT property to always forcing high speed.

And as Florian pointed out, maybe you should look at the negotiated
speed, and if you have a 10 or 100Mbps link, the MAC does not need
high frequency, so why not allow it to be low and safe some power.

     Andrew
