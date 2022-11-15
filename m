Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD87B24F29
	for <imx@lists.linux.dev>; Tue, 15 Nov 2022 17:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MghNhBLFepqKOQwkGUfSW1GJuxjMVRFJVMazuOGss7w=; b=MbrntDhCaie5kamEI+pFVXWgke
	exlodypGNSNS2Bt5dkI3GpEVxZYAaiaV3mJPLkpBIxHKje72LT2DeBlTHmHl/y8CwM3B1edq/n/UG
	28bJfK45ZR/yOf4v/ZSiibDhGapmDiwCxpbY1TxB8BiAPiozjuQjh7ZkiaKJ13z+7HT4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ouzjj-002Tth-P3; Tue, 15 Nov 2022 18:28:39 +0100
Date: Tue, 15 Nov 2022 18:28:39 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 2/2] net: fec: add xdp and page pool statistics
Message-ID: <Y3PMRwstfJkUiYwl@lunn.ch>
References: <20221115155744.193789-1-shenwei.wang@nxp.com>
 <20221115155744.193789-3-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221115155744.193789-3-shenwei.wang@nxp.com>

> @@ -1582,6 +1586,7 @@ fec_enet_rx_queue(struct net_device *ndev, int budget, u16 queue_id)
>  	struct bpf_prog *xdp_prog = READ_ONCE(fep->xdp_prog);
>  	u32 ret, xdp_result = FEC_ENET_XDP_PASS;
>  	u32 data_start = FEC_ENET_XDP_HEADROOM;
> +	u32 xdp_stats[XDP_STATS_TOTAL];
>  	struct xdp_buff xdp;
>  	struct page *page;
>  	u32 sub_len = 4;
> @@ -1656,11 +1661,13 @@ fec_enet_rx_queue(struct net_device *ndev, int budget, u16 queue_id)
>  		fec_enet_update_cbd(rxq, bdp, index);
>  
>  		if (xdp_prog) {
> +			memset(xdp_stats, 0, sizeof(xdp_stats));
>  			xdp_buff_clear_frags_flag(&xdp);
>  			/* subtract 16bit shift and FCS */
>  			xdp_prepare_buff(&xdp, page_address(page),
>  					 data_start, pkt_len - sub_len, false);
> -			ret = fec_enet_run_xdp(fep, xdp_prog, &xdp, rxq, index);
> +			ret = fec_enet_run_xdp(fep, xdp_prog, &xdp, rxq,
> +					       xdp_stats, index);
>  			xdp_result |= ret;
>  			if (ret != FEC_ENET_XDP_PASS)
>  				goto rx_processing_done;
> @@ -1762,6 +1769,15 @@ fec_enet_rx_queue(struct net_device *ndev, int budget, u16 queue_id)
>  	if (xdp_result & FEC_ENET_XDP_REDIR)
>  		xdp_do_flush_map();
>  
> +	if (xdp_prog) {
> +		int i;
> +
> +		u64_stats_update_begin(&rxq->syncp);
> +		for (i = 0; i < XDP_STATS_TOTAL; i++)
> +			rxq->stats[i] += xdp_stats[i];
> +		u64_stats_update_end(&rxq->syncp);
> +	}
> +

This looks wrong. You are processing upto the napi budget, 64 frames,
in a loop. The memset to 0 happens inside the loop, but you do the
accumulation outside the loop?

This patch is getting pretty big. Please break it up, at least into
one patch for XDP stats and one for page pool stats.

    Andrew
