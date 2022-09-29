Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826D71C13
	for <imx@lists.linux.dev>; Thu, 29 Sep 2022 13:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0+1nUta2pVXe4Nepuxyz02WZlUvq7DHS9Z6e3kiv/no=; b=bEcj0OpKViIgw16wtP99ObezXR
	7ypjXPzngzdnT6Kau0fp0/7PShtnL+062fmnUA+gVXUlFxAwDi1VmgJCvZtFtceDMD3cUlNV6gLva
	RBFYj42lZONUA980PX9oUN/4OrH2iCnGxyLZYlSM7vRQvU9w3PiSW5aTnToMgnl30iM4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1odtUx-000cNT-Dt; Thu, 29 Sep 2022 15:22:43 +0200
Date: Thu, 29 Sep 2022 15:22:43 +0200
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
Message-ID: <YzWcI+U1WYJuZIdk@lunn.ch>
References: <20220928152509.141490-1-shenwei.wang@nxp.com>
 <YzT2An2J5afN1w3L@lunn.ch>
 <PAXPR04MB9185141B58499FD00C43BB6889579@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185141B58499FD00C43BB6889579@PAXPR04MB9185.eurprd04.prod.outlook.com>

> I actually did some compare testing regarding the page pool for
> normal traffic.  So far I don't see significant improvement in the
> current implementation. The performance for large packets improves a
> little, and the performance for small packets get a little worse.

What hardware was this for? imx51? imx6? imx7 Vybrid? These all use
the FEC.

By small packets, do you mean those under the copybreak limit?

Please provide some benchmark numbers with your next patchset.

       Andrew
