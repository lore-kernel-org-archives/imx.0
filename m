Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353A917C2
	for <imx@lists.linux.dev>; Wed,  9 Nov 2022 02:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58320C433D6;
	Wed,  9 Nov 2022 02:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667960417;
	bh=9UD9mS0AlmvSB+RXBHnYiAss0eAbPtXExNTzwxSaC0w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hRsd0VqGogz/wiuMi+6gyh4G2OnAklp5GxPyiF9ZBTj5o3ghQyBwcQxRw2t0OjqPO
	 5U3imFA/FvIV4GAu+ZjAa1TN+Y0TSB2SNt54xPmGToouKP7D4NFE+H6Aw557QzVEtq
	 kLB2nzFeQxHave+BJznMMQvKgv7dol2TDosZ36rYaGQTC42arivgB71ZxU9ut0Xo84
	 misUFz3MyqfvbBRxIA7/7RUuGvmOZQQcQIRCg9ixG7Pe+wN09g+k4k9W1RBQTkVdPR
	 X9xcBGA30Mau7DCYAgSa6UThkKT3q05SjVya0N355GaLn2pbwCd9MCxySY4ep13BML
	 prs2I5RtMqbyA==
Date: Tue, 8 Nov 2022 18:20:16 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard
 Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [EXT] Re: [PATCH v2 0/2] net: fec: optimization and statistics
Message-ID: <20221108182016.59e27158@kernel.org>
In-Reply-To: <PAXPR04MB918598BE192BEF2B5E7CF678893E9@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20221108172105.3760656-1-shenwei.wang@nxp.com>
	<20221108175710.095a96e8@kernel.org>
	<PAXPR04MB918598BE192BEF2B5E7CF678893E9@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Nov 2022 02:15:28 +0000 Shenwei Wang wrote:
> > This set doesn't apply to net-next, is it on top of some not-yet-applied patches ?  
> 
> I saw the first patch " net: fec: simplify the code logic of quirks" had already been
> applied a day ago. May only need to apply the second one: " net: fec: add xdp and page pool statistics".

Oh, I see. You can wait for reviews a bit longer, but you'll have 
to repost just the parts that can be applied separately.
It's fairly tricky to skip the first patch when applying,
and the build bot will definitely not be able to cope.
