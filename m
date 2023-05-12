Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3C339D;
	Fri, 12 May 2023 00:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5497BC433EF;
	Fri, 12 May 2023 00:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683852944;
	bh=hqORGTuFn34NPCgboOJIrkMoupu4sFw407EbC5EaQvE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=P/t7XsQE6C2iwFL92q8S3BwoVjW/bpJnxJCbKUDm2psz+EnRaR4ottamzangYgV/4
	 aPJ4t+q4Fcn1Yy14q0EIgVFR+oUi29GoGRi+1kyV6wtOwZjSzKLjFXUy4kqnvfjc/S
	 QTfSBbRnB+gURKB2jYfLk89h/Qo2IezfOeoR+BGFOaG8/mjUR/42cJQKVTPycgM9QN
	 i7FfiTcCPg78v4jt4jkEJQt4Hwg0v7qzXTOSVsv54dta73VaWjTrCEAcsWoWpzMhcg
	 6D3fsoADyRMYrNTrsmGyBvoYCMHDT0i9ts5+8x45oy60fJfv/PVG818ZTuVBy0x6nM
	 CiGcHh+cRj/6A==
Date: Thu, 11 May 2023 17:55:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Wei Fang <wei.fang@nxp.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Clark
 Wang <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend
 <john.fastabend@gmail.com>, Alexander Lobakin <alexandr.lobakin@intel.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 net 1/1] net: fec: using the standard return codes
 when xdp xmit errors
Message-ID: <20230511175542.0bf5b773@kernel.org>
In-Reply-To: <20230510200523.1352951-1-shenwei.wang@nxp.com>
References: <20230510200523.1352951-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 10 May 2023 15:05:23 -0500 Shenwei Wang wrote:
> -		xdp_return_frame(frame);

This line is a bug fix (double free).

I'm going to apply v2, it's good enough.
