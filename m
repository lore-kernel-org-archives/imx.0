Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919CE24F29
	for <imx@lists.linux.dev>; Tue, 15 Nov 2022 17:58:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1333C433C1;
	Tue, 15 Nov 2022 17:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668535080;
	bh=r+VsSBM+QYb6w/Ek8eu6bcQf54b1Y5QWvU3cDpX9LNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hj7bWcXJRCksnAEVm6gl+AfPsPKZ6ZVs14dsP9fI7w/2ybEI3hWNKJD/gS4gHN3IU
	 jWGDTVRj7pJWCej981ZPeSjwqr4U9eKrPeGao2c2Q+Fj0tW/5Wm6qbV/24AHy6Efpt
	 ru0mS0An2jobJPXQzcyx2WtIZMCW+ToO4tAcubU6/dOT978kG61pOq6hSIWbcZjdbU
	 l+ABBf96ki0vJwaYhm4Y3hKOK260YURrNSL30/sB8fhaNr0n6NlZeGnSqZ7BnpgYSs
	 Sudr26d9vT83DSJW9vhFS+brcvuC9WKDpGvHnEufWgkVS7KZCaYIwUYxLkHsgGfEMl
	 kZlUtPwhlvo2Q==
Date: Tue, 15 Nov 2022 09:57:55 -0800
From: Saeed Mahameed <saeed@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v4 0/2] net: fec: add xdp and page pool statistics
Message-ID: <Y3PTI/ma2JexAGff@x130.lan>
References: <20221115155744.193789-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20221115155744.193789-1-shenwei.wang@nxp.com>

On 15 Nov 09:57, Shenwei Wang wrote:
> Changes in V4:
> - Using u64 to record the XDP statistics
> - Changing strncpy to strscpy
> - Remove the "PAGE_POOL_STATS" select per Alexander's feedback
> - Export the page_pool_stats definition in the page_pool.h
>

Reviewed-by: Saeed Mahameed <saeed@kernel.org>

