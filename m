Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731742;
	b=C9SzCWRhlHZ1HAD7fjO+bIqL/uv/gSpXYhEpL/MEpr5+iNOWedlSZjBuDTJ+SRCBrW/m
	 OK1GcOrDzEGMwYgLPEKuPRA9ZFy52tY/NhlYWgymhCmUlMcxoZ023XvbqIaqKovPCtCmI
	 Nan7cPlAb/SUZncTFi5xLVxyPK5y03sEVcWQPZ1Ki2SXUIAq2xKdNjgLC8YvDN3azfTIi
	 mRtr2I29pieNfqxGuHMYYsm6l3/7s0JcHPjlbYwLLt5tzkOjPlR96PFoqB6AYnuonCdVL
	 bH0TGvRLDceEwkbDcje1QEGOt8aVgJ3bmT11J4KgwyGMUnKc5L0cIrKfmpYcYULKVQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gZOM3Lc0bVWMBjTHBnWLKucS3KUPQN4gjQNABudBe20=;
	b=aPKZZUNauP5pDh4UTaclklePUq2gPCyysm2kUsxDLtWIGVUTJOyiHqSEbGQHxQDJEh42
	 IBKUFBxscUsplr28QZJleIFdFgvzMiYQL1pr6Zzb9v1NPJV5KKJOGGBhAKw/8mMu/AWQ2
	 kAKrn+KF2IaC5vFNwL8Q4QGK9sIBxWjzMOgwWlTvPQ8CPcCIL4XILdVxhdgAOJO1cKM2V
	 Ooj7rodvvBPxfXfbmx41lBRVkCNyGuUDlS77e501hMOYCtUilAs9AufsJ7k7NUS9OKdeP
	 /SdjdsbeZDA5Oe8UDOtuxc467LYCoJGE2IqngFOkylwCOeBwda4cI4Bhk3LIzhVkXZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="ZSC/+Am2";
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605EA606A333
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 18:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 605EA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZSC/+Am2
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so3307604a91.0
        for <imx@lists.linux.dev>; Tue, 03 Nov 2026 10:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1793731741; x=1794336541; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gZOM3Lc0bVWMBjTHBnWLKucS3KUPQN4gjQNABudBe20=;
        b=ZSC/+Am2PT2UaTy6KZt3zJ9e61U4k/naFZdoVXWj0xuHNnRWBSedUkDoQbqUvdOhv/
         6oleIvoex9c0/0Uh3K2XKnqnEi9EQe509ofEH8YmIXuh1lanAjUmm+sZqpCVTP2lrxNl
         AT14ynO9V0W3+0JOwzI5n8wgp19X+EcseqXUEB1GX+8ZzeKQSuHDn1kHDQ2I+TFbEJsh
         pZ126t3Bwv2RkiKFhe+SRqXxUM3BMfCIIEGcRU/wmPwwKUOOIl4hoDyd0d7S3+U1+0d4
         NxsVy0kAsarqkeKXpWIJKl+CyIICNgbGHw5ohP719qRyb+dC0Tuqc6bVoFmhMsSdkFKr
         8cpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731741; x=1794336541;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gZOM3Lc0bVWMBjTHBnWLKucS3KUPQN4gjQNABudBe20=;
        b=jHWW1LAJVzOXuqRTGzhMEKRrtrFganFdztF3UEbTkI5a3w4IJ0uNiqWTbDhaS/njHe
         +iCw8J2ey2T70HlAwRLOXpfDR110GWYRHi3s6htxqr5zZY1fjRaT96FlbCOPcs1HqlLx
         C5/ahCYaVhod45KHECKrLhmMwuAgW2DQHFy6eu1Td/x2LP3aQIbUeg6TVUW/fT7IsSV1
         gT8PooHmb1vgpm5BeHdMlKqGDar3r5NpgVsSMvKJApuY1INAbbM38F2fGC02zuZWbFfu
         b6YoA4zy3Ek+fB00JtF1cQw+eghw+3ecStljmURvAXoG5/+2YbegCIVhFS+a2BF5wyE+
         FPQA==
X-Forwarded-Encrypted: i=1; AKwUvBzYcwNWDKRB8B2SVjJhbYlLG3Lz9ptM8nr+H7msAQXVWfx8VglTrnz3Mxdc0n+lKvOpT2c=@lists.linux.dev
X-Gm-Message-State: APuU4Z/8Gr5lJwkLXt+u/qBHVGPehcqsTUaiclqrrL1+RQYYMZfkFiwF
	/jwHSJcpyMvwmMmAXIYxn4Dy1iZWSSrlmgcNixlnM6z8V6VOfDnCGSeKO2IF0EoGtqM=
X-Gm-Gg: AYBFou0kRcLL/nkC4H2TnwTc4O84Rw/pglilmen07tPnaYyO1qjw/6L2/HZFLZr/VfA
	wPbEwyAeftLkdFw/tj92mjgSeczubrAbdYMeiow3lkj30a0z1EhCpnsz0lciP2jnUPXq8tablIN
	2qAhxukeCF/n1203VwQqOtrFJl+4rFLpz06VN0DD+9JtaSs2Ld8+9DL1+X+3L6LGn1zyCNUv3a3
	dVTMrgvNYYzYQH1dizLJaMRlHC3PqWQEx4XKuSaPxIzcBFygu4QIY8Z9KoWp+DwTgX0ytds26bH
	BCTWb2IscmHxu+jrsLYFbgRdN8eTkDwwKqqhEmFlcChmyuKHEZEtEqvXvWQwhv11l9AcAeLdkc3
	iT0R2XhjLwWLUjI4WlXDCDtpwqnmrtBqEhJzWuQYhqcJV0TBv4dQ2egoq1popHCI/rWs4e0VbCb
	g7ks6iimQymfLNDUbcQ1Psea42clqfZUDaK54YGxSfyIA34HAUr0KdxmOp9f6lAfRv11w08grkN
	B1MCMgmO0UcbFdWaLbZQmoNJOfM4rE69vwr+o0/mPNrBNCKGOr8XY3VTyiYgHp4fqpFSAUnvawP
	abx3/BLbDYyfRtY3QBlpC0Zo0/6z15XcWrX+giOPvA==
X-Received: by 2002:a17:90b:1d03:b0:3a8:49f2:8ddb with SMTP id 98e67ed59e1d1-3ae8984de33mr11985967a91.60.1793731740597;
        Tue, 03 Nov 2026 10:49:00 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:49::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0944bd88bsm210133a91.12.2026.11.03.10.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:49:00 -0800 (PST)
Date: Tue, 3 Nov 2026 10:48:59 -0800
From: Joe Damato <joe@dama.to>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Frank Li <Frank.Li@nxp.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Li Youhong <liyouhong@kylinos.cn>, Arnd Bergmann <arnd@arndb.de>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Yicong Hui <yiconghui@gmail.com>, Simon Horman <horms@kernel.org>,
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
	imx@lists.linux.dev, vkoul@kernel.org
Subject: Re: [PATCH] net: dma: use dmaengine_desc_set_callback()
Message-ID: <auosm8mCULyafyny@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, Frank Li <Frank.li@oss.nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Frank Li <Frank.Li@nxp.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Li Youhong <liyouhong@kylinos.cn>, Arnd Bergmann <arnd@arndb.de>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Yicong Hui <yiconghui@gmail.com>, Simon Horman <horms@kernel.org>,
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
	imx@lists.linux.dev, vkoul@kernel.org
References: <20261102191922.4044912-1-Frank.Li@oss.nxp.com>
 <aukcoWLVvSorX5a9@devvm20253.cco0.facebook.com>
 <aun4W3dvmfWRDFeQ@SMW015318>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aun4W3dvmfWRDFeQ@SMW015318>

On Tue, Nov 03, 2026 at 09:06:03AM -0600, Frank Li wrote:
> On Mon, Nov 02, 2026 at 03:28:33PM -0800, Joe Damato wrote:
> > On Mon, Nov 02, 2026 at 02:19:16PM -0500, Frank.Li@oss.nxp.com wrote:
> > > From: Frank Li <Frank.Li@nxp.com>
> > >
> > > Replace open-coded assignments to callback and callback_param fields
> > > of struct dma_async_tx_descriptor with calls to the
> > > dmaengine_desc_set_callback() helper across net drivers.
> > >
> > > No functional change intended. Prepare to make struct
> > > dma_async_tx_descriptor private to the DMA engine.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  drivers/net/ethernet/allwinner/sun4i-emac.c       |  3 +--
> > >  drivers/net/ethernet/micrel/ks8842.c              |  6 ++----
> > >  drivers/net/ethernet/xilinx/xilinx_axienet_main.c |  6 ++----
> > >  drivers/net/wwan/qcom_bam_dmux.c                  | 10 ++++------
> > >  4 files changed, 9 insertions(+), 16 deletions(-)
> >
> > [...]
> >
> > > diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
> > > index cc6ace8d64371..1479f8362e04e 100644
> > > --- a/drivers/net/wwan/qcom_bam_dmux.c
> > > +++ b/drivers/net/wwan/qcom_bam_dmux.c
> > > @@ -195,9 +195,8 @@ static bool bam_dmux_skb_dma_submit_tx(struct bam_dmux_skb_dma *skb_dma)
> > >  		return false;
> > >  	}
> > >
> > > -	desc->callback = bam_dmux_tx_callback;
> > > -	desc->callback_param = skb_dma;
> > > -	desc->cookie = dmaengine_submit(desc);
> > > +	dmaengine_desc_set_callback(desc, bam_dmux_tx_callback, NULL, skb_dma);
> > > +	dmaengine_submit(desc);
> > >  	return true;
> > >  }
> > >
> > > @@ -477,9 +476,8 @@ static bool bam_dmux_skb_dma_submit_rx(struct bam_dmux_skb_dma *skb_dma)
> > >  		return false;
> > >  	}
> > >
> > > -	desc->callback = bam_dmux_rx_callback;
> > > -	desc->callback_param = skb_dma;
> > > -	desc->cookie = dmaengine_submit(desc);
> > > +	dmaengine_desc_set_callback(desc, bam_dmux_rx_callback, NULL, skb_dma);
> > > +	dmaengine_submit(desc);
> >
> > I noticed in the above that the return value of dmaengine_submit is discarded
> > instead of stored.
> >
> > Is that intentional? I suppose it might be because AFAICT cookie is never
> > used and the commit message says "no functional change intended".
> 
> dma_cookie_assign() already set desc->cookie in dmaengine_submit(). Of couse
> it is not obvious. Do you need me update commit message to descript it.

Ah, I see it now. In the tx_submit callback it looks like dma drivers set the
cookie.

So removing it here really is a no-op since it was getting set, as you said,
during submit.

My mistake. I don't think it's worth respinning just to fix the commit
message just because I didn't dig deep enough :)
