Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC93EA9
	for <imx@lists.linux.dev>; Thu, 29 Sep 2022 01:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=WgYp4kgX3yzN0Gagvg7OxRHJp7EnJoIu8HNLaefuSRI=; b=prISs92iTwutWRn1Fm3DmUw5Fu
	2U1o9LPTgITB8C9gSMMzmcb6DqZMsRADRVEJj4aFKKRt0R0FzPKI/zcCb+2NGvNLIt2Qx12R0YvsM
	2JRT1Oz+2pY/9iqN5VCfU5Qwg35TmA7I1TWmQUsBM25IdKKw2LAC0dkRxlFkQFQ3R0xU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1odiR0-000ZNQ-DM; Thu, 29 Sep 2022 03:33:54 +0200
Date: Thu, 29 Sep 2022 03:33:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Joakim Zhang <qiangqing.zhang@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] net: fec: add initial XDP support
Message-ID: <YzT2An2J5afN1w3L@lunn.ch>
References: <20220928152509.141490-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928152509.141490-1-shenwei.wang@nxp.com>

On Wed, Sep 28, 2022 at 10:25:09AM -0500, Shenwei Wang wrote:
> This patch adds the initial XDP support to Freescale driver. It supports
> XDP_PASS, XDP_DROP and XDP_REDIRECT actions. Upcoming patches will add
> support for XDP_TX and Zero Copy features.
> 
> This patch also optimizes the RX buffers by using the page pool, which
> uses one frame per page for easy management. In the future, it can be
> further improved to use two frames per page.

Please could you split this patch up. It is rather large and hard to
review. I think you can first add support for the page pool, and then
add XDP support, for example. 

I would be interesting to see how the page pool helps performance for
normal traffic, since that is what most people use it for. And for a
range of devices, since we need to make sure it does not cause any
regressions for older devices.

	    Andrew
