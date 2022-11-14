Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71334539B
	for <imx@lists.linux.dev>; Mon, 14 Nov 2022 15:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668439672; x=1699975672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CeP8y2+ZHtojspOJP0iBEQbFRPuMHMLTBfjgk9VQkng=;
  b=OOZ4GxX84igEiriw92E2CuZcwlYMTFqlFQqJ0zjekbPAhXS7KxwE6l9H
   Qcu/D2KJUQWwIMR7VL6UZgR+ZSOm3a84sbAVwpveFkbif6fjl05ioRt1U
   Wjph6LOWACfif7azDR4NmD2ha5j7letCactn8QXTsx3nkMwtN57noffW3
   rIw7/IGQKTK+W/zJbwl7S4mevi/l2+JOOnCdQW6f78oKzfaA/FjQA++PS
   QAQFnSPpUeu2mVzDSYoe8n/QELhb28N+TKUUI8JlMlMhLChwbI17oasIz
   +lYpIFNqqLQnmhmqIUGTAPmXRK7t9dNQEotvagefSxVCXklopKb2g3rMn
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="299516820"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="299516820"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 07:27:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="967608289"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="967608289"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by fmsmga005.fm.intel.com with ESMTP; 14 Nov 2022 07:27:48 -0800
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com [10.102.20.203])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 2AEFRlhn028426;
	Mon, 14 Nov 2022 15:27:47 GMT
From: Alexander Lobakin <alexandr.lobakin@intel.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Alexander Lobakin <alexandr.lobakin@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        "John Fastabend" <john.fastabend@gmail.com>,
        Wei Fang <wei.fang@nxp.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 1/1] net: fec: add xdp and page pool statistics
Date: Mon, 14 Nov 2022 16:27:36 +0100
Message-Id: <20221114152736.702858-1-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <PAXPR04MB918591AA3C3A41AE794DB41489059@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20221111153505.434398-1-shenwei.wang@nxp.com> <20221114134542.697174-1-alexandr.lobakin@intel.com> <PAXPR04MB918591AA3C3A41AE794DB41489059@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit

From: Shenwei Wang <shenwei.wang@nxp.com>
Date: Mon, 14 Nov 2022 14:53:00 +0000

> > -----Original Message-----
> > From: Alexander Lobakin <alexandr.lobakin@intel.com>
> > Sent: Monday, November 14, 2022 7:46 AM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Alexander Lobakin <alexandr.lobakin@intel.com>; David S. Miller
> > <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jakub
> > Kicinski <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; Alexei
> > Starovoitov <ast@kernel.org>; Daniel Borkmann <daniel@iogearbox.net>;
> >> @@ -29,6 +29,7 @@ config FEC
> >>       select CRC32
> >>       select PHYLIB
> >>       select PAGE_POOL
> >> +     select PAGE_POOL_STATS
> >
> > Drivers should never select PAGE_POOL_STATS. This Kconfig option was made to
> > allow user to choose whether he wants stats or better performance on slower
> > systems. It's pure user choice, if something doesn't build or link, it must be
> > guarded with IS_ENABLED(CONFIG_PAGE_POOL_STATS).
> 
> As the PAGE_POOL_STATS is becoming the infrastructure codes for many drivers, it is
> redundant for every driver to implement the stub function in case it is not selected. These
> stub functions should be provided by PAGE_POOL_STATS itself if the option is not selected.

Correct, but I think you added 'select PAGE_POOL_STATS' due to some
build issues on PPC64, or not? So if there are any when
!PAGE_POOL_STATS, it's always better to handle this at the Page Pool
API level in a separate patch.

> 
> >
> >>       imply NET_SELFTESTS
> >>       help
> >>         Say Y here if you want to use the built-in 10/100 Fast

Thanks,
Olek
