Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0227C
	for <imx@lists.linux.dev>; Mon, 31 Oct 2022 20:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=k76g8mPvFlEsezniA/wfzLnncWnwoBf8Gjp4kw6Bjfs=; b=gPhd/zBywntCe7Ln240c4GIlxd
	R5bz4c6omlPxFAvMBH0RerjVxsZHIqkzcpoo0otBjauOSEhJCrxSx6xnq1Qy1Tjo58NwOVIH5z9O7
	hYNrxQfWOmWnlSffTqerNBJGgpMf9TW+uAZEm2B7XskYuElv2Bf8Ok9xo8+iJv/fxovE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1opbDY-00137a-EL; Mon, 31 Oct 2022 21:17:08 +0100
Date: Mon, 31 Oct 2022 21:17:08 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	kernel test robot <lkp@intel.com>
Subject: Re: [EXT] Re: [PATCH v2 1/1] net: fec: add initial XDP support
Message-ID: <Y2AtRL8l1/kZrwx7@lunn.ch>
References: <20221031162200.1997788-1-shenwei.wang@nxp.com>
 <Y2ABb+G+ykcUd413@lunn.ch>
 <PAXPR04MB918581FFA58483608B3A7DCA89379@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB918581FFA58483608B3A7DCA89379@PAXPR04MB9185.eurprd04.prod.outlook.com>

> > > +                     cbd_base = rxq->bd.base;
> > > +                     if (bpf->prog)
> > > +                             rxq->bd.ring_size = XDP_RX_RING_SIZE;
> > > +                     else
> > > +                             rxq->bd.ring_size = RX_RING_SIZE;
> > > +                     size = dsize * rxq->bd.ring_size;
> > > +                     cbd_base = (struct bufdesc *)(((void *)cbd_base) + size);
> > > +                     rxq->bd.last = (struct bufdesc *)(((void
> > > + *)cbd_base) - dsize);
> > 
> > This does not look safe. netif_tx_disable(dev) will stop new transmissions, but
> > the hardware can be busy receiving, DMAing frames, using the descriptors, etc.
> > Modifying rxq->bd.last in particular seems risky. I think you need to disable the
> > receiver, wait for it to indicate it really has stopped, and only then make these
> > modifications.
> > 
> 
> Sounds reasonable. How about moving the codes of updating ring size to the place
> right after the enet reset inside the fec_restart? This should clear those risky corner
> cases.

That sounds reasonable. But please add some comments. The driver has
RX_RING_SIZE elements allocated, but you are only using a subset. This
needs to be clear for when somebody implements the ethtool --rings
option.

And i still think it would be good to implement that code. As your
numbers show, the ring size does affect performance, and it is hard to
know if your hard coded XDP_RX_RING_SIZE is the right value, depending
on what the eBPF program is doing. If the ethtool option was provided,
it allows users to benchmark different ring sizes for their workload.

   Andrew
