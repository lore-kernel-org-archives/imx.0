Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAE08F42
	for <imx@lists.linux.dev>; Wed, 16 Nov 2022 16:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668614638; x=1700150638;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lW3NzBq/Ii+Agn3S+Dz3HjWB+SGRuGzzSqo90mBPD+E=;
  b=jSynFzAFtSQcsnfH4ui01ogIIiW98TEawI9D56tVoNGoyfTTeRdX4yLw
   QsP1CrCgfQdJee7eI6mOoG40Hni7xRVoovzdAwyw+yRhOUR6IHCkkHtbp
   MaEILwCVQGz5wzUo2rBSza4Nk7JyA/h1GghVSno5laVgF8enxnYS836ol
   jZKkZM3eynarIt7dokj/7Guv82rxBS1Z0WJXP/Tt0N2FnZh35xLf+ITVj
   eDYo22A4qdOjXR0sahAUnN8tkBPhDSJDXLq6G1FKbljUfPcY15DkY8TG+
   DezRDXO4GtojYRjeEIDntK9l27WPmODcBD1H3J7gNY0jJE5pxopb9lV0H
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="300109265"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="300109265"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 08:02:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="633673629"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="633673629"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by orsmga007.jf.intel.com with ESMTP; 16 Nov 2022 08:02:36 -0800
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com [10.102.20.203])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 2AGG2YS1001458;
	Wed, 16 Nov 2022 16:02:34 GMT
From: Alexander Lobakin <alexandr.lobakin@intel.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Alexander Lobakin <alexandr.lobakin@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        John Fastabend <john.fastabend@gmail.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5 2/3] net: fec: add xdp statistics
Date: Wed, 16 Nov 2022 17:02:15 +0100
Message-Id: <20221116160215.3391284-1-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221115204951.370217-3-shenwei.wang@nxp.com>
References: <20221115204951.370217-1-shenwei.wang@nxp.com> <20221115204951.370217-3-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

From: Shenwei Wang <shenwei.wang@nxp.com>
Date: Tue, 15 Nov 2022 14:49:50 -0600

> Add xdp statistics for ethtool stats and using u64 to record the xdp counters.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> Reported-by: kernel test robot <lkp@intel.com>

Nit: would be nice if you Cc me for the next submissions as I was
commenting on the previous ones. Just to make sure reviewers won't
miss anything.

> ---
>  drivers/net/ethernet/freescale/fec.h      | 15 +++++
>  drivers/net/ethernet/freescale/fec_main.c | 74 +++++++++++++++++++++--
>  2 files changed, 83 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/fec.h b/drivers/net/ethernet/freescale/fec.h
> index 61e847b18343..adbe661552be 100644
> --- a/drivers/net/ethernet/freescale/fec.h
> +++ b/drivers/net/ethernet/freescale/fec.h
> @@ -526,6 +526,19 @@ struct fec_enet_priv_txrx_info {
>  	struct  sk_buff *skb;
>  };
>  
> +enum {
> +	RX_XDP_REDIRECT = 0,
> +	RX_XDP_PASS,
> +	RX_XDP_DROP,
> +	RX_XDP_TX,
> +	RX_XDP_TX_ERRORS,
> +	TX_XDP_XMIT,
> +	TX_XDP_XMIT_ERRORS,
> +
> +	/* The following must be the last one */
> +	XDP_STATS_TOTAL,
> +};
> +
>  struct fec_enet_priv_tx_q {
>  	struct bufdesc_prop bd;
>  	unsigned char *tx_bounce[TX_RING_SIZE];
> @@ -546,6 +559,8 @@ struct fec_enet_priv_rx_q {
>  	/* page_pool */
>  	struct page_pool *page_pool;
>  	struct xdp_rxq_info xdp_rxq;
> +	struct u64_stats_sync syncp;
> +	u64 stats[XDP_STATS_TOTAL];

Why `u64`? u64_stats infra declares `u64_stat_t` type and a bunch of
helpers like u64_stats_add(), u64_stats_read() and so on, they will
be solved then by the compiler to the most appropriate ops for the
architecture. So they're more "generic" if you prefer.
Sure, if you show some numbers where `u64_stat_t` is slower than
`u64` on your machine, then okay, but otherwise...

>  
>  	/* rx queue number, in the range 0-7 */
>  	u8 id;

[...]

> -- 
> 2.34.1

Thanks,
Olek
