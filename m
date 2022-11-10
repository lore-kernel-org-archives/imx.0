Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F0C107A2
	for <imx@lists.linux.dev>; Thu, 10 Nov 2022 16:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668098852; x=1699634852;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sLTSISWzUr5ww4UVTAKQbU1w81C51YBDl84qwQHSgtI=;
  b=bi59roZrDo7Z5ODRBbtlKQ98CTS+ESRw2bsQHUu69v/nd8iaIO1b3xXQ
   OYfQbQ6wIRSz0semWlKK4tmDg1gUD4Ek5/lRAIELNKWDni9cpjL6OoiDs
   pVs/BEDct0rtB1HYRWsdBQOcfV7mKxCVwbOFwMjHyvPd8ItwWNkRIiAW8
   QY80jM3mpaqqu7IHLYaLUuU+H9K8ZVllzUi374CnCSAFbeL/5//7xZNq2
   /czahdJTe6oUjywokZeZqmxPoUV081spr+Z/4x8VWDwnUdfUP5Uukz0/1
   /4er5Sm32KsHIWSnvRlutQ2JdYQg7iU0y1R6ElkEkMNBgrv2YrR96yc6r
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="397658257"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; 
   d="scan'208";a="397658257"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2022 08:46:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="882418907"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; 
   d="scan'208";a="882418907"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by fmsmga006.fm.intel.com with ESMTP; 10 Nov 2022 08:46:38 -0800
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com [10.102.20.203])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 2AAGkbeC023491;
	Thu, 10 Nov 2022 16:46:37 GMT
From: Alexander Lobakin <alexandr.lobakin@intel.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Alexander Lobakin <alexandr.lobakin@intel.com>,
        Paolo Abeni <pabeni@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v2 RESEND 1/1] net: fec: add xdp and page pool statistics
Date: Thu, 10 Nov 2022 17:43:21 +0100
Message-Id: <20221110164321.3534977-1-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <PAXPR04MB91853A6A1DDDBB06F33C975E89019@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20221109023147.242904-1-shenwei.wang@nxp.com> <4349bc93a5f2130a95305287141fde369245f921.camel@redhat.com> <PAXPR04MB91853A6A1DDDBB06F33C975E89019@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit

From: Shenwei Wang <shenwei.wang@nxp.com>
Date: Thu, 10 Nov 2022 13:29:56 +0000

> > -----Original Message-----
> > From: Paolo Abeni <pabeni@redhat.com>
> > Sent: Thursday, November 10, 2022 5:54 AM
> > To: Shenwei Wang <shenwei.wang@nxp.com>; David S. Miller
> > <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jakub
> > Kicinski <kuba@kernel.org>
> > >       case ETH_SS_STATS:
> > > -             for (i = 0; i < ARRAY_SIZE(fec_stats); i++)
> > > -                     memcpy(data + i * ETH_GSTRING_LEN,
> > > -                             fec_stats[i].name, ETH_GSTRING_LEN);
> > > +             for (i = 0; i < ARRAY_SIZE(fec_stats); i++) {
> > > +                     memcpy(data, fec_stats[i].name, ETH_GSTRING_LEN);
> > > +                     data += ETH_GSTRING_LEN;
> > > +             }
> > > +             for (i = 0; i < ARRAY_SIZE(fec_xdp_stat_strs); i++) {
> > > +                     memcpy(data, fec_xdp_stat_strs[i], ETH_GSTRING_LEN);
> > > +                     data += ETH_GSTRING_LEN;
> >
> > The above triggers a warning:
> >
> > In function 'fortify_memcpy_chk',
> >     inlined from 'fec_enet_get_strings'
> > at ../drivers/net/ethernet/freescale/fec_main.c:2788:4:
> > ../include/linux/fortify-string.h:413:25: warning: call to '__read_overflow2_field'
> > declared with attribute warning: detected read beyond size of field (2nd
> > parameter); maybe use struct_group()? [-Wattribute-warning]
> >   413 |                         __read_overflow2_field(q_size_field, size);
> >       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > I think you can address it changing fec_xdp_stat_strs definition to:
> >
> > static const char fec_xdp_stat_strs[XDP_STATS_TOTAL][ETH_GSTRING_LEN] =
> 
> That does a problem. How about just change the memcpy to strncpy?

Don't use a static char array, it would consume more memory than the
current code. Just replace memcpy()s with strscpy().

Why u32 for the stats tho? It will overflow sooner or later. "To
keep it simple and compatible" you can use u64_stats API :)

> 
> Regards,
> Shenwei
> 
> > { // ...
> >
> > Cheers,
> >
> > Paolo

Thanks,
Olek
