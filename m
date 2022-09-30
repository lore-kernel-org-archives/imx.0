Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EDE5A88
	for <imx@lists.linux.dev>; Fri, 30 Sep 2022 20:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HVFeev+r4ciAxUb+L8nvnXlf+hUS/MMkb8+sfY/tSPg=; b=WT0DH79vR5MYl3Pz2SmQjXQDMU
	243BGW/7yFek7ee8PqwJLil1W6xgSFwtSa03yP+uBB4hVWovfuQQaTO6l7oe166HLrx2HCPYaQ68I
	lfBSKzQQGhMLUjLFbtsYuVrHSqJLPJ3yBfal0iwS0OOTMDV96kc9C4wHwn8No+5zAea0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1oeMUa-000k1l-46; Fri, 30 Sep 2022 22:20:16 +0200
Date: Fri, 30 Sep 2022 22:20:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Wei Fang <wei.fang@nxp.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [EXT] Re: [PATCH 1/1] net: fec: using page pool to manage RX
 buffers
Message-ID: <YzdPgL1ghbyp3ypv@lunn.ch>
References: <20220930193751.1249054-1-shenwei.wang@nxp.com>
 <YzdL7EbnULEA75/s@lunn.ch>
 <PAXPR04MB91850A034871650CB6C4F86D89569@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB91850A034871650CB6C4F86D89569@PAXPR04MB9185.eurprd04.prod.outlook.com>

On Fri, Sep 30, 2022 at 08:07:55PM +0000, Shenwei Wang wrote:
> 
> 
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: Friday, September 30, 2022 3:05 PM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: David S . Miller <davem@davemloft.net>; Eric Dumazet
> > <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni
> > <pabeni@redhat.com>; Alexei Starovoitov <ast@kernel.org>; Daniel Borkmann
> > <daniel@iogearbox.net>; Jesper Dangaard Brouer <hawk@kernel.org>; John
> > Fastabend <john.fastabend@gmail.com>; Wei Fang <wei.fang@nxp.com>;
> > netdev@vger.kernel.org; linux-kernel@vger.kernel.org; imx@lists.linux.dev
> > Subject: [EXT] Re: [PATCH 1/1] net: fec: using page pool to manage RX buffers
> > 
> > Caution: EXT Email
> > 
> > > -static bool fec_enet_copybreak(struct net_device *ndev, struct sk_buff **skb,
> > > -                            struct bufdesc *bdp, u32 length, bool swap)
> > > +static bool __maybe_unused
> > > +fec_enet_copybreak(struct net_device *ndev, struct sk_buff **skb,
> > > +                struct bufdesc *bdp, u32 length, bool swap)
> > >  {
> > 
> > Why add __maybe_unused? If its not used, remove it. We don't leave dead
> > functions in the code.
> > 
> 
> I was thinking to remove them by a separate patch once the page pool solution is accepted.

Then say that in the commit message. The commit message is how you
answer questions the Maintainers might have, without them having to
ask.

What is small packet performance like on the imx6? If you provide some
numbers as to how small the reduction in performance is, we can decide
if the reduction in complexity is worth it.

   Andrew
