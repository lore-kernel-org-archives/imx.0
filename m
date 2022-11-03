Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B826A7C
	for <imx@lists.linux.dev>; Thu,  3 Nov 2022 02:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC81BC433D7;
	Thu,  3 Nov 2022 02:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667442776;
	bh=chLCZ4O5F8L5nLqWIjg2FNqEgzk68hIq5LLfsxgk5kE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=j3IMlGLi4p/ue9t+XSptU3IIF0xzvLodD8JWWFLXzOf/lmYDPF56KPu0fq/KQClct
	 5g2WA9GAQrJjTh7ZNDhJTCmYlWxnHpe3QVi5hOh31h/O0N3TRiJcFTx3bkPoxrBCUM
	 eZnM7Ze+KqqsRvDU9xlDD8+a+dLT1MEe5XqWrCegjeXa2ep3fdaob7Gh/LD/43W1KK
	 HsFvRwoTajxlvpGGjYtj1aIHOpFqoh8Qm5o3uqGZn3EUwYU9wMhjnvtBjDEyHUNpUm
	 ugozH7ejAHrh70cu/5bcBNy6UnIdjMbzyU1EEJcs3a0V7ZM93dCO+mo3G44nP3p/zY
	 7/JIDEI0qbxxQ==
Date: Wed, 2 Nov 2022 19:32:53 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard
 Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>, kernel test robot
 <lkp@intel.com>
Subject: Re: [PATCH v3 1/1] net: fec: add initial XDP support
Message-ID: <20221102193253.3c51a4ec@kernel.org>
In-Reply-To: <PAXPR04MB9185320671668838B48B575389389@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20221031185350.2045675-1-shenwei.wang@nxp.com>
	<PAXPR04MB9185320671668838B48B575389389@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 3 Nov 2022 02:07:19 +0000 Shenwei Wang wrote:
> A kind ping. =F0=9F=98=8A

Pong.

Don't top post.
