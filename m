Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986934C78
	for <imx@lists.linux.dev>; Mon, 14 Nov 2022 13:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668434263; x=1699970263;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c1LEAEBS/B4yllpfBP/rAur6bhGZbpLPwsGMq5eUpUI=;
  b=N+kYNlklz/cFE2HGjk/oTZg8m1xIQpd0NkxVPlkQnpDlR/dCzZp4IFkp
   oU85O8KbuiKfkI0K+h7UxlW0t4y8HrG73/L4soTqnvfCngiAWtfD8n+4D
   B/FBYp/2a8boHVk5gbfNzQaBMKtR0j/K2OrOthTv5Q3IliEkU0IE24mgo
   wSC06J1XDK3ePeigyRCN3UE+tf5DXjvPw7e7EegDeSFawzx277TTSUDeH
   oxu98gUgDBmUUgzVVRyomjJmcZ9nr1f2LTuzY3puBK6R3mm+1BEFiTLva
   k1h7RR7dSssz4MeJxqcZ7Vqqv8v4iSgqNYkEAk5aKrDgDjiXAey8KEPJR
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="292369669"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="292369669"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 05:57:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="763489172"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="763489172"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by orsmga004.jf.intel.com with ESMTP; 14 Nov 2022 05:57:39 -0800
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com [10.102.20.203])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 2AEDvbk2008805;
	Mon, 14 Nov 2022 13:57:38 GMT
From: Alexander Lobakin <alexandr.lobakin@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexander Lobakin <alexandr.lobakin@intel.com>,
        Shenwei Wang <shenwei.wang@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
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
Date: Mon, 14 Nov 2022 14:57:26 +0100
Message-Id: <20221114135726.698089-1-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <Y3JHvo4p10iC4QFH@lunn.ch>
References: <20221109023147.242904-1-shenwei.wang@nxp.com> <4349bc93a5f2130a95305287141fde369245f921.camel@redhat.com> <PAXPR04MB91853A6A1DDDBB06F33C975E89019@PAXPR04MB9185.eurprd04.prod.outlook.com> <20221110164321.3534977-1-alexandr.lobakin@intel.com> <PAXPR04MB9185CDDD50250DFE5E492C7189019@PAXPR04MB9185.eurprd04.prod.outlook.com> <20221114133502.696740-1-alexandr.lobakin@intel.com> <Y3JHvo4p10iC4QFH@lunn.ch>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

From: Andrew Lunn <andrew@lunn.ch>
Date: Mon, 14 Nov 2022 14:50:54 +0100

> >    What is your machine and how fast your link is?
> 
> Some FEC implementations are Fast Ethernet. Others are 1G.
> 
> I expect Shenwei is testing on a fast 64 bit machine with 1G, but
> there are slow 32bit machines with Fast ethernet or 1G.

Okay. I can say I have link speed on 1G on MIPS32, even on those
which are 1-core 600 MHz. And when I was adding more driver stats,
all based on u64_stats_t, I couldn't spot any visible regression.
100-150 Kbps maybe?

> 
>      Andrew

Thanks,
Olek
