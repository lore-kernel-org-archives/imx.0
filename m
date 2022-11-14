Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3244C78
	for <imx@lists.linux.dev>; Mon, 14 Nov 2022 13:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=U9oy7hvSLoDb/PGzYgdlXap7ytc6wya+q+s4qktQNPU=; b=hWb8fO6odvOI3Mm8NrCk0pxEB9
	EcRxYXKOPbk3rTOm5gLARwe6U/aTvqYAL01wrywaOe0TZSWvpbv97dZO1EhE0AkywtYIAmen6HbXn
	oCXmVGBjSFY+Z7d8+ygAAd71q+Kz7zU6u3giyc13d+Vb3CVtwklDiVF3heQeYvEUYjuk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ouZrT-002LH8-0J; Mon, 14 Nov 2022 14:50:55 +0100
Date: Mon, 14 Nov 2022 14:50:54 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Alexander Lobakin <alexandr.lobakin@intel.com>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v2 RESEND 1/1] net: fec: add xdp and page pool statistics
Message-ID: <Y3JHvo4p10iC4QFH@lunn.ch>
References: <20221109023147.242904-1-shenwei.wang@nxp.com>
 <4349bc93a5f2130a95305287141fde369245f921.camel@redhat.com>
 <PAXPR04MB91853A6A1DDDBB06F33C975E89019@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <20221110164321.3534977-1-alexandr.lobakin@intel.com>
 <PAXPR04MB9185CDDD50250DFE5E492C7189019@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <20221114133502.696740-1-alexandr.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221114133502.696740-1-alexandr.lobakin@intel.com>

>    What is your machine and how fast your link is?

Some FEC implementations are Fast Ethernet. Others are 1G.

I expect Shenwei is testing on a fast 64 bit machine with 1G, but
there are slow 32bit machines with Fast ethernet or 1G.

     Andrew
