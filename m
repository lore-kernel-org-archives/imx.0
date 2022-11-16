Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EF73209
	for <imx@lists.linux.dev>; Wed, 16 Nov 2022 14:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668609256; x=1700145256;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=38d+7I+PSJp7fiCJLjk7YV/W8ID1c2SPGRtRx9IT9ps=;
  b=ZN0SApkSTfbJFfXHYbAlRtayMHrtXoBmoNk7FyQQ66CDlZPOX0EYfHQb
   l1bPB4IYri8pdF6C3EZuJDw6FXKRxwJE75DD6I5NUkJPSZsyTUidw7O1z
   OCcFTZnqnXdK0CjA24ztK/r9/OQm2Evtm9HUHwhzLITJ0PSrEh0U2dbm6
   k7/jfAX4bsAYYFU1DzQvH9EuvLJ1IRrTR+4o36T5s0n1R6Ptt08q6r2Yy
   xm0AWTe90ZAAC8VHPQeCdfqqBlr7AUZOR/nMEqIAJK2fDxOY69ZIhS2c5
   HX5XsEy6KPFCC5sQ0xkzv52VSeS0PX5zISuonOi25NLKM9SF6uEhtuENy
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="312563190"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="312563190"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 06:34:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="670519005"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="670519005"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by orsmga008.jf.intel.com with ESMTP; 16 Nov 2022 06:34:11 -0800
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com [10.102.20.203])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 2AGEYAhv017898;
	Wed, 16 Nov 2022 14:34:10 GMT
From: Alexander Lobakin <alexandr.lobakin@intel.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Alexander Lobakin <alexandr.lobakin@intel.com>,
        Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        "Paolo Abeni" <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
        "Daniel Borkmann" <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>, Wei Fang <wei.fang@nxp.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 1/1] net: fec: add xdp and page pool statistics
Date: Wed, 16 Nov 2022 15:33:36 +0100
Message-Id: <20221116143336.3385874-1-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <PAXPR04MB918589D35F8B10307D4D430E89059@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20221111153505.434398-1-shenwei.wang@nxp.com> <20221114134542.697174-1-alexandr.lobakin@intel.com> <Y3JLz1niXbdVbRH9@lunn.ch> <PAXPR04MB91853D935E363E8A7E3ED7BF89059@PAXPR04MB9185.eurprd04.prod.outlook.com> <20221114152327.702592-1-alexandr.lobakin@intel.com> <PAXPR04MB918589D35F8B10307D4D430E89059@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shenwei Wang <shenwei.wang@nxp.com>
Date: Mon, 14 Nov 2022 21:17:48 +0000

> > -----Original Message-----
> > From: Alexander Lobakin <alexandr.lobakin@intel.com>
> > Sent: Monday, November 14, 2022 9:23 AM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Alexander Lobakin <alexandr.lobakin@intel.com>; Andrew Lunn
> > <andrew@lunn.ch>; David S. Miller <davem@davemloft.net>; Eric Dumazet
> > <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni
> > <pabeni@redhat.com>; Alexei Starovoitov <ast@kernel.org>; Daniel Borkmann
> > <daniel@iogearbox.net>; Jesper Dangaard Brouer <hawk@kernel.org>; John
> > Fastabend <john.fastabend@gmail.com>; Wei Fang <wei.fang@nxp.com>;
> > netdev@vger.kernel.org; linux-kernel@vger.kernel.org; imx@lists.linux.dev;
> > kernel test robot <lkp@intel.com>
> > Subject: [EXT] Re: [PATCH v3 1/1] net: fec: add xdp and page pool statistics

[...]

> Did some testing with the atomic64_t counter, with the following codes to update
> the u64 counter in the end of every NAPI poll cycle.
> 
> @@ -1764,7 +1768,13 @@ fec_enet_rx_queue(struct net_device *ndev, int budget, u16 queue_id)
>  
>         if (xdp_result & FEC_ENET_XDP_REDIR)
>                 xdp_do_flush_map();
> +#if 1
> +       if (xdp_prog) {
> +               int i;
> +               for(i = 0; i < XDP_STATS_TOTAL; i++)
> +                       atomic64_add(xdp_stats[i], &rxq->stats[i]);
> +       }
> +#endif
>         return pkt_received;
>  }
> 
> With the codes above, the testing result is below:
> root@imx8qxpc0mek:~/bpf# ./xdpsock -i eth0
>  sock0@eth0:0 rxdrop xdp-drv
>                    pps            pkts           1.00
> rx                 349399         1035008
> tx                 0              0
> 
>  sock0@eth0:0 rxdrop xdp-drv
>                    pps            pkts           1.00
> rx                 349407         1384640
> tx                 0              0
> 
> Without  the atomic_add codes above, the testing result is below:
> root@imx8qxpc0mek:~/bpf# ./xdpsock -i eth0
>  sock0@eth0:0 rxdrop xdp-drv
>                    pps            pkts           1.00
> rx                 350109         1989130
> tx                 0              0
> 
>  sock0@eth0:0 rxdrop xdp-drv
>                    pps            pkts           1.00
> rx                 350425         2339786
> tx                 0              0
> 
> And regarding the u32 counter solution, the testing result is below:
>    root@imx8qxpc0mek:~/bpf# ./xdpsock -i eth0
>      sock0@eth0:0 rxdrop xdp-drv
>                        pps            pkts           1.00
>     rx                 361347         2637796
>     tx                 0              0
> 
> There are about 10K pkts/s difference here. Do we really want the u64 counters?

Where did those atomic64_t come from? u64_stats_t use either plain
u64 for 32-bit platforms or local64_t for 64-bit ones. Take a look
at [0] for the example of how x86_64 does this, it is far from
atomic64_t.

> 
> Regards,
> Shenwei
> 
> >>
> >> Thanks,
> >> Shenwei
> >>
> >>>
> >>>        Andrew
> >
> > Thanks,
> > Olek

[0] https://elixir.bootlin.com/linux/v6.1-rc5/source/arch/x86/include/asm/local.h#L31

Thanks,
Olek
