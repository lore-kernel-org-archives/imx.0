Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2925317C2
	for <imx@lists.linux.dev>; Wed,  9 Nov 2022 01:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E03C433C1;
	Wed,  9 Nov 2022 01:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667959031;
	bh=+2JcQE94a/8EsId71nlhSR30hOQ8ew5MIRE2qTo94Pk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=n0dYlR5X4Ni3R/bOL9VbVN2xz+JUurgkUUvmim5MuThoeIowUqr5+0fG92+0upSnR
	 fgpUcy2dpWQO2q7mhzQzXog909iQajLKodlEBjPScMxcgCJIGys6baCqHEZicCC8kv
	 4CIctZbXwGs5rKjmP5ZOdsgBvyF+0qJQfcDEJGNaCvpR0TLbdC4kDC9AV6RnRkBahC
	 psHBYBpBIGVzy3CTlvhpdXqKsuJXfeLpmQ7copkK7VVpZ711l9sr47bLjGSJeibI0U
	 IW6vB4njT3ssgx3wEqovz1bGZd41UGMDhOEx33uyjqJB241sHNP8hAaayBYSyQBOsh
	 c0BbmIehNLbTw==
Date: Tue, 8 Nov 2022 17:57:10 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard
 Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 0/2] net: fec: optimization and statistics
Message-ID: <20221108175710.095a96e8@kernel.org>
In-Reply-To: <20221108172105.3760656-1-shenwei.wang@nxp.com>
References: <20221108172105.3760656-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  8 Nov 2022 11:21:03 -0600 Shenwei Wang wrote:
> As the patch to add XDP statistics is based on the previous optimization
> patch, I've put the two patches together. The link to the optimization
> is the following:
> 
> https://lore.kernel.org/imx/20221104024754.2756412-1-shenwei.wang@nxp.com/

This set doesn't apply to net-next, is it on top of some
not-yet-applied patches ?
