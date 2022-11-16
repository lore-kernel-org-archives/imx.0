Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3749B15B0
	for <imx@lists.linux.dev>; Wed, 16 Nov 2022 16:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 635BFC433C1;
	Wed, 16 Nov 2022 16:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668617230;
	bh=Ma1zaxWQ8C5IEvymQzwpG86FF0hqFrdFIAMGPNWoyfc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nNZkd+9c+i31Y+eNwKIMECW6q0wcNHKvGcyMv95cUwC5EJDsNdUznGA3K3/DVYYCV
	 7qpwF8TAk+YTswLasgXAQKFwnqeNU4WtiXNP68eS08xsufAVDhYjEVglr2+VoUczPk
	 pyzhA/WigMJeaUAOl5R57ivD1uSsq384w00nADSRExImk1XsCMZCNpoMhdylF83uui
	 /z39QOTw7FM4UlO0RtgR/t+z4hDIIo32XZbXaN2+USyQvp6tV6PM9n6+HwzMYhK5/P
	 O+JK8Xt+tGBq/RbUtnetnsMKZt4FDIbkCtHkkP5SQU+0a9lgTqx4GssTdwTFpeHeyZ
	 7MXLEY+v6IKRw==
Date: Wed, 16 Nov 2022 08:47:09 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Jesper Dangaard
 Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v5 0/3] net: fec: add xdp and page pool statistics
Message-ID: <20221116084709.6b7eeaea@kernel.org>
In-Reply-To: <20221115204951.370217-1-shenwei.wang@nxp.com>
References: <20221115204951.370217-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Nov 2022 14:49:48 -0600 Shenwei Wang wrote:
> Changes in V5:
>  - split the patch into two: one for xdp statistics and one for page
>    pool
>  - fix the bug to zero xdp_stats array
>  - use empty 'page_pool_stats' when CONFIG_PAGE_POOL_STATS is disabled.

Hi, IIUC there was a previous revision of this set which got applied
too hastily. Unfortunately that means you need to rebase on top of
what's already applied, or add a revert to your series. Otherwise
the patches won't apply cleanly.
