Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA2D9456
	for <imx@lists.linux.dev>; Tue,  2 May 2023 23:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2l5Uv2F7D/BM238Fz1afWDTU9gd8SlLHR7GBsDFXHNE=; b=ua8uarLFqpT95yGaNxhsDrN2JU
	QFWtZOol6DrBowgnIS3dd8eKz7LG4JvB1lhRFBmTqffhCcvDpiMcpsuqawuIRJnDd5/s0LQgIB//a
	plFw9s8e8QFQl2QGajvptVWH8abV36oJwIyjecgR4M8SUas4JkWogD8w1SK6NVO1qnJ0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ptzGY-00Blwb-VN; Wed, 03 May 2023 01:18:38 +0200
Date: Wed, 3 May 2023 01:18:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Wei Fang <wei.fang@nxp.com>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Alexander Lobakin <alexandr.lobakin@intel.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 net 2/2] net: fec: restructuring the functions to
 avoid forward declarations
Message-ID: <6dff0a5b-c74b-4516-8461-26fcd5d615f3@lunn.ch>
References: <20230502220818.691444-1-shenwei.wang@nxp.com>
 <20230502220818.691444-2-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230502220818.691444-2-shenwei.wang@nxp.com>

On Tue, May 02, 2023 at 05:08:18PM -0500, Shenwei Wang wrote:
> The patch reorganizes functions related to XDP frame transmission, moving
> them above the fec_enet_run_xdp implementation. This eliminates the need
> for forward declarations of these functions.

I'm confused. Are these two patches in the wrong order?

The reason that i asked you to fix the forward declaration in net-next
is that it makes your fix two patches. Sometimes that is not obvious
to people back porting patches, and one gets lost, causing build
problems. So it is better to have a single patch which is maybe not
100% best practice merged to stable, and then a cleanup patch merged
to the head of development.

   Andrew
