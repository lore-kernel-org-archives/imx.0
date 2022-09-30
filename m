Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873DF5A88
	for <imx@lists.linux.dev>; Fri, 30 Sep 2022 20:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3wBAxhax4uWBF7eHB1eqflHZ4cetLSZp3Uc2jtSpOag=; b=x3x61AMxA1kRtzrCpZ2242ZDAG
	0WlkEYPLDNmJ5oVUPtsBT4y6Sls/ZFbxLwJtC0OM5XIL5EwVfzJQ77XxST6Be81BU7LxKvA45qVO/
	KhE+SotUt+7uAZjOqQ8jM+9hPTMKqzDjS3EF5y0Bw1ch9s4ZH1mG7GFkP6784wM7YGcc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1oeMFo-000jtR-Kq; Fri, 30 Sep 2022 22:05:00 +0200
Date: Fri, 30 Sep 2022 22:05:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Wei Fang <wei.fang@nxp.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] net: fec: using page pool to manage RX buffers
Message-ID: <YzdL7EbnULEA75/s@lunn.ch>
References: <20220930193751.1249054-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930193751.1249054-1-shenwei.wang@nxp.com>

> -static bool fec_enet_copybreak(struct net_device *ndev, struct sk_buff **skb,
> -			       struct bufdesc *bdp, u32 length, bool swap)
> +static bool __maybe_unused
> +fec_enet_copybreak(struct net_device *ndev, struct sk_buff **skb,
> +		   struct bufdesc *bdp, u32 length, bool swap)
>  {

Why add __maybe_unused? If its not used, remove it. We don't leave
dead functions in the code.

     Andrew
