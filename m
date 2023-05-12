Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B1539D;
	Fri, 12 May 2023 00:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5282CC433D2;
	Fri, 12 May 2023 00:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683853087;
	bh=Na7tNUvEVf6ByVUC4k87U3onJNIuQV7IWaT3nOoxrPA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ap1p4ygC9tf7kD886uOAEwUgJVinAxtgj6i8xx+YbFmZllbUDXazxNaM5rPdydFTo
	 9qtNJO5RVcIybs+Z13CIck/ETTTsOxKoNh5mFhGFOd2c7tLmfip5Yv6mAWDn3NLJt3
	 14ddehiK2OMAn5laRsPWu4WfW7FUi6naMMhvSNX4dk5/taJV5qHjhhtZT195R2msb8
	 v4LHG/1cdnfeOppwShDTLotMgoLA4s3fYTuAOSLZ3FciDrogG8D9T96NsyHyX7hEqb
	 Sb16m7V/SXK81T7BuyOl+IgfLiNBBSEJDiaDnc8mNtBzMA3BUs4yXLofvdfWsMGu2I
	 l85908kduF9pg==
Date: Thu, 11 May 2023 17:58:06 -0700
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
Message-ID: <20230511175806.4b1f84f6@kernel.org>
In-Reply-To: <20230511175542.0bf5b773@kernel.org>
References: <20230510200523.1352951-1-shenwei.wang@nxp.com>
	<20230511175542.0bf5b773@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 11 May 2023 17:55:42 -0700 Jakub Kicinski wrote:
> On Wed, 10 May 2023 15:05:23 -0500 Shenwei Wang wrote:
> > -		xdp_return_frame(frame);  
> 
> This line is a bug fix (double free).
> 
> I'm going to apply v2, it's good enough.

Let me take that back, I'll reply to v2.
