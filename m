Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872024C78
	for <imx@lists.linux.dev>; Mon, 14 Nov 2022 14:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HEWn0hHxqLUr4VDhw38qxu5BAlhd0x0tpVrhUvGq4fs=; b=wysAvnRg1cgDEeYikw+59ARoyh
	V1D3pIJLLBVigmA9Nk+jFtQh4xlet9hkFJR7qI3SVuN3fFuA5Nv9wc8JdSumUhOzg+gIjVO9p56Pr
	RqvNyM7EXT57XYGzQ9gcj0CWAKbLCKwvaUab2IpXbNULd4LB62oq9BrZ0ksEOZZRU0hU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1oua8F-002LO8-9s; Mon, 14 Nov 2022 15:08:15 +0100
Date: Mon, 14 Nov 2022 15:08:15 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Alexander Lobakin <alexandr.lobakin@intel.com>
Cc: Shenwei Wang <shenwei.wang@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Wei Fang <wei.fang@nxp.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 1/1] net: fec: add xdp and page pool statistics
Message-ID: <Y3JLz1niXbdVbRH9@lunn.ch>
References: <20221111153505.434398-1-shenwei.wang@nxp.com>
 <20221114134542.697174-1-alexandr.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221114134542.697174-1-alexandr.lobakin@intel.com>

> Drivers should never select PAGE_POOL_STATS. This Kconfig option was
> made to allow user to choose whether he wants stats or better
> performance on slower systems. It's pure user choice, if something
> doesn't build or link, it must be guarded with
> IS_ENABLED(CONFIG_PAGE_POOL_STATS).

Given how simple the API is, and the stubs for when
CONFIG_PAGE_POOL_STATS is disabled, i doubt there is any need for the
driver to do anything.

> >  	struct page_pool *page_pool;
> >  	struct xdp_rxq_info xdp_rxq;
> > +	u32 stats[XDP_STATS_TOTAL];
> 
> Still not convinced it is okay to deliberately provoke overflows
> here, maybe we need some more reviewers to help us agree on what is
> better?

You will find that many embedded drivers only have 32 bit hardware
stats and do wrap around. And the hardware does not have atomic read
and clear so you can accumulate into a u64. The FEC is from the times
of MIB 2 ifTable, which only requires 32 bit counters. ifXtable is
modern compared to the FEC.

Software counters like this are a different matter. The overhead of a
u64 on a 32 bit system is probably in the noise, so i think there is
strong argument for using u64.

       Andrew
