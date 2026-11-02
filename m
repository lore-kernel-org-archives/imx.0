Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662116;
	b=P/ffHCfQyadqvetqbekVKlp4RxQOT71OGoj5JEMdiyUBUi4SNz9M3p4/4etJs4xpK2wa
	 giaFsCu7WR/UqT1rj4w5mPQpTTeq85thmPkTNPpC1s5GbeNa3XAei0Rhzg1RRg6ayxmLI
	 o2wnyWg4D2CCYsS/IyJnpVWQdPmVcAJ/zWZ4pdBOoBzoNSNX99+xCexX1XDccMFJwIRHj
	 VAbU9MvHgZ10vXpwahY/LY6Ek26w+1R5t+8UU+LBIE2AZ3CPMoEN6C374c4l54UrVPVlR
	 vxuKbCIxwsdmib/fBbJOjWH4uKhDCXiPg2OVNsFg6Y2RSWPs+yIol/PqsMtqlxxVCmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZMaDJSQbb9QLkhHVRE64prZxAiTnxlvuwEcwQapvub8=;
	b=tOMPTLCXhD7LD52Ntom0F/ZkHm7vNB/LUMDKWwkOeQUi8hYSaqLNq/6Xgcwv7ALnQ+uj
	 cjMXCcYaI7uK4pBjIYY8Yx+hZUj7mLd8BCYwo6+Laupv3leQUJguMyJwKvBtEv7VtHATE
	 o1ZmE3wPGLARSWHUi8VmGdjTEQ3g6Chg4f1qYhXkefCtAMTZLTUwmGxk+ETjLtxR+gter
	 p2E8tw5Yvo877EQT52wmnt0uChOAejH0w4wldykhetbsyeWlbBfGryrdzjLOkkPJexydO
	 3OitNpaIj2q1Vbqt8cdkXQjviWplhflh89xjoubAskiIEIY9iLy+vRsynaLgqGd3YIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HorEtG0y;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527AC606A338
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 23:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 527AC606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HorEtG0y
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so2227697a91.1
        for <imx@lists.linux.dev>; Mon, 02 Nov 2026 15:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1793662114; x=1794266914; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZMaDJSQbb9QLkhHVRE64prZxAiTnxlvuwEcwQapvub8=;
        b=HorEtG0y8EdbAl97e9ZfENLBdAw2s0H+ippC/hCv5Usf0teegHMrdbF7QtGJmUcove
         7z+nqktL6P6bSxAMeEth4dzoJGX7SaZ0mlelCUecn8r03EpjWRfSo92HZ5PKJE8xeWQ5
         ZBGm/MpTBgUNF0h4O8V5tjehtiFHwCtPPJxK12VTqkdeuCF3k4920Rp5lopfw/UBh7g5
         2+rV5cuN+fVgZcRA3rhLUAkaRhVKLtO5debk4C4pLxZCf/+mCtDHujUTPZNZhjMO8tzR
         Wlwf7xO5ALXhI1YD9eZRXHV/HS1q9U/lqoCanj76NPVazHzhUopDYAO226NOjUTISQds
         Vhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793662114; x=1794266914;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZMaDJSQbb9QLkhHVRE64prZxAiTnxlvuwEcwQapvub8=;
        b=q1gdkOGKGydT83Q3RNw/i4kHwJxh6I/AkEBsTEgD9qwixOGw0H+B7mjktcMy5TBrdP
         gb3lqBwywMHSwVgTxRKspmSlGgjdQH2TB7FvWOCJsrDoS+VeetAjXXZusnejzLANcYyq
         LosyUOtSJL/lg/d3yXG5euF+/LYAvpZTKAC3saoDovQuLaTh7c3smvYevB8iqBW0yvxI
         7OmXEySxKAhvZJAmirkBs4Efh5EiHQd3r+aRurGoeZhiweAw0HrzriP0Weo85pnr4CTZ
         rMC1LhskJYXcXQn42sI7mhMswUq4cUKVS4yglqFp3hYzpY+5UwK/NpcSy38dxkGOiV9Z
         etwg==
X-Forwarded-Encrypted: i=1; AKwUvByDKVq+Vfo/rKgGJ8+N8dN8AP9OsxzRX0iqTQHlqYS75MowiigTgbrDcFXKupOCHV4H2n4=@lists.linux.dev
X-Gm-Message-State: APuU4Z/8DVfA37kQe78yQs8vh+NIQxkGQZtCti6arQ/M+3tOeWJg3Cnu
	5KqPV5JWEy75jCSvuonPo6EKiKkc14T3G/wcSNDkm/DVtEod9SoTHZJkDUJQQM3i38k=
X-Gm-Gg: AYBFou1ZV+RQxeOWbRzR307Mgn3qOTRdIOgnkKBKGnHrBDdV5XWQOCxGYGVm5oEwVLu
	OZ7SCEYkzhRbA9MwMR8WLVUuWPsZNC89fn2iU/FFNSdni0W5Wpc4P3amIQlSXBDnvW4MF4Now/z
	A/dbKjw1CZcxwCKij/HLTaOGKoBmEu5cy2eELatweEZFoCKYnVDAbB184Lug3wqtN/w1vu9b6J0
	5iVmBO5DFV3w8mMM/FHt1VsUS9SpoAFxvr2E2E4ko1HjgCnmI/QjTOtVp0q6ilwRrrKiVhshVep
	VChZNyoYzs56Ny2AytEvRu8oEIWOW8xGDYiyCQ8dZeiDIiWStqrC9kcd2aYg9NlP4j3KWumhuKE
	kKLAcBFZV17q3rOBEXJKeza+5J4hieEE+OOTn5dxmWxST1fT21HNxdSHAGAewj5R8bVgkoHFO75
	Wc/j5P/HNmIrDJDJ+h+rShcza/T9QQM8k92kIw84oyIDqVPp90n3GFufVZ5jMxRVbWG0gfF8zLx
	p7UF2adxyHggwS+EPjmcZAB/gOlfrWTsIFF5VOLXog2YfNg9DSh/pp1hrva0Wn9yEBOPpHA9e4U
	rzN/9S9nA8x8wf1t8oJkUVbnE9ftaNWwkzWvooyrtZosP3nzqQ5zFMp0v7aQO2c=
X-Received: by 2002:a17:90b:580d:b0:3ad:25f6:1dd0 with SMTP id 98e67ed59e1d1-3ae8970e5e9mr8946634a91.11.1793662114604;
        Mon, 02 Nov 2026 15:28:34 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:8::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6271ccsm1233086a91.7.2026.11.02.15.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:28:34 -0800 (PST)
Date: Mon, 2 Nov 2026 15:28:33 -0800
From: Joe Damato <joe@dama.to>
To: Frank.Li@oss.nxp.com
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
Message-ID: <aukcoWLVvSorX5a9@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, Frank.Li@oss.nxp.com,
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
In-Reply-To: <20261102191922.4044912-1-Frank.Li@oss.nxp.com>

On Mon, Nov 02, 2026 at 02:19:16PM -0500, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across net drivers.
> 
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/net/ethernet/allwinner/sun4i-emac.c       |  3 +--
>  drivers/net/ethernet/micrel/ks8842.c              |  6 ++----
>  drivers/net/ethernet/xilinx/xilinx_axienet_main.c |  6 ++----
>  drivers/net/wwan/qcom_bam_dmux.c                  | 10 ++++------
>  4 files changed, 9 insertions(+), 16 deletions(-)

[...]

> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
> index cc6ace8d64371..1479f8362e04e 100644
> --- a/drivers/net/wwan/qcom_bam_dmux.c
> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> @@ -195,9 +195,8 @@ static bool bam_dmux_skb_dma_submit_tx(struct bam_dmux_skb_dma *skb_dma)
>  		return false;
>  	}
>  
> -	desc->callback = bam_dmux_tx_callback;
> -	desc->callback_param = skb_dma;
> -	desc->cookie = dmaengine_submit(desc);
> +	dmaengine_desc_set_callback(desc, bam_dmux_tx_callback, NULL, skb_dma);
> +	dmaengine_submit(desc);
>  	return true;
>  }
>  
> @@ -477,9 +476,8 @@ static bool bam_dmux_skb_dma_submit_rx(struct bam_dmux_skb_dma *skb_dma)
>  		return false;
>  	}
>  
> -	desc->callback = bam_dmux_rx_callback;
> -	desc->callback_param = skb_dma;
> -	desc->cookie = dmaengine_submit(desc);
> +	dmaengine_desc_set_callback(desc, bam_dmux_rx_callback, NULL, skb_dma);
> +	dmaengine_submit(desc);

I noticed in the above that the return value of dmaengine_submit is discarded
instead of stored.

Is that intentional? I suppose it might be because AFAICT cookie is never
used and the commit message says "no functional change intended".

Reviewed-by: Joe Damato <joe@dama.to>
