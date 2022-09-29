Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C25A1C13
	for <imx@lists.linux.dev>; Thu, 29 Sep 2022 13:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=GFmE0LoqXWikNphWZFYNpMrFo7yy2CuxJ2DWoSYNxVY=; b=MSKKijugu/O/kh0yv74PpZNETo
	FF4caSWlOapcQmrDnXO9pL5Dd/CiQUrf6+NSvST1Ok5dnXEFDp6uU00URC6befQVI+aQrqRbcOsBH
	Usf0YCKdxjk7EEKxrH4rGE5AWcqFU/T2q5euWd2SidkiRa6XNQAacj6tYNGd05C+OfDY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1odtWI-000cOg-9e; Thu, 29 Sep 2022 15:24:06 +0200
Date: Thu, 29 Sep 2022 15:24:06 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Joakim Zhang <qiangqing.zhang@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [EXT] Re: [PATCH 1/1] net: fec: add initial XDP support
Message-ID: <YzWcdsGkq4x8VWbY@lunn.ch>
References: <20220928152509.141490-1-shenwei.wang@nxp.com>
 <YzT59R+zx4dA5G5Q@lunn.ch>
 <PAXPR04MB91859C7C1F1C4FE94611D5A789579@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB91859C7C1F1C4FE94611D5A789579@PAXPR04MB9185.eurprd04.prod.outlook.com>

> > > +struct fec_enet_xdp_stats {
> > > +     u64     xdp_pass;
> > > +     u64     xdp_drop;
> > > +     u64     xdp_xmit;
> > > +     u64     xdp_redirect;
> > > +     u64     xdp_xmit_err;
> > > +     u64     xdp_tx;
> > > +     u64     xdp_tx_err;
> > > +};
> > > +
> > > +     switch (act) {
> > > +     case XDP_PASS:
> > > +             rxq->stats.xdp_pass++;
> > 
> > Since the stats are u64, and most machines using the FEC are 32 bit, you cannot
> > just do an increment. Took a look at u64_stats_sync.h.
> > 
> 

> As this increment is only executed under the NAPI kthread context,
> is the protection still required?

Are the statistics values read by ethtool under NAPI kthread context?

    Andrew
