Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916F36FC1
	for <imx@lists.linux.dev>; Mon, 14 Nov 2022 16:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ImH4lvZLozTPy50vqHvYVMudhu4Vtv7Vs2NSA/JQDyA=; b=VPGtGPpKWlHYhdkg0u0i+IDW1o
	o77KQGmUJVTSh+73Z0Tnj53UgHyxWniR8PTM5ioGX021i1qISqXhT2cRFIy/Xwzp7BZylGyXE657S
	UmPcDa8edIQIkE1bl2TAviVAOMbuJXu0KTvS0vWcgbclpIoDOekjPS6ARiQFxKUOGojo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1oucJ8-002MLG-NM; Mon, 14 Nov 2022 17:27:38 +0100
Date: Mon, 14 Nov 2022 17:27:38 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Alexander Lobakin <alexandr.lobakin@intel.com>,
	Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [EXT] Re: [PATCH v2 RESEND 1/1] net: fec: add xdp and page pool
 statistics
Message-ID: <Y3Jsenmh9dbAauQS@lunn.ch>
References: <20221109023147.242904-1-shenwei.wang@nxp.com>
 <4349bc93a5f2130a95305287141fde369245f921.camel@redhat.com>
 <PAXPR04MB91853A6A1DDDBB06F33C975E89019@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <20221110164321.3534977-1-alexandr.lobakin@intel.com>
 <PAXPR04MB9185CDDD50250DFE5E492C7189019@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <20221114133502.696740-1-alexandr.lobakin@intel.com>
 <Y3JHvo4p10iC4QFH@lunn.ch>
 <20221114135726.698089-1-alexandr.lobakin@intel.com>
 <PAXPR04MB91850496D46660D3B8394B7F89059@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB91850496D46660D3B8394B7F89059@PAXPR04MB9185.eurprd04.prod.outlook.com>

> I did implement a quick version of u64_stats_t counters, and the performance impact
> was about 1~3Mbps on the i.MX8QXP which is 1.2GHz ARM64 Dual Core platform, which
> is about 1.5% performance decrease.

Please post your code.

Which driver did you copy? Maybe you picked a bad example?

      Andrew
