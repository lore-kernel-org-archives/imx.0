Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECD32550D7
	for <imx@lists.linux.dev>; Thu,  4 Dec 2025 08:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764838443; cv=none; b=e0dXqPMHgcC+jE8EYIC7ScIhU0wiiN3+Ah9e3lo2XdtT4W9VIP/DNPcULvNjUKcOu3UqFsm1aybJ1GD9mFamRibucEtvWFuWfhgiOYio+1qNuFUYPuCM8ADCWloAAefLYinG6S/Ka7OdQYGjji1j5LtqSJi1Wvx1JRNz7GOxD9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764838443; c=relaxed/simple;
	bh=Hnh7HF3toQOUTtMRZEW6IdEM1+kyGkkQr9xHVruOSFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HFAb6z+ZIP44XatimT7ylRljxh6A3B1tt64FxnTlzSgi+bLx3uF+A4H1yBq5mVA7LNlsvf+yjBMZIpLcBmPC6NZr7MrkgcWGDg6BStBtJMjeagjH2dtZ3eUc2zi1Qs6OVJOq7ww60vPP+oZPJNBL940WLXblnLhyJshDt/JqFlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XxvWxeW4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XxvWxeW4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764838440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m+RROGbd82iRnOs3Nzwo2Z6WPhdY3ptA/NeS0/WSLQA=;
	b=XxvWxeW4BSKUJCoo3Yjx95WAQX+tSzSRuv5CzeUUK5IvgJApPq6IWM8/kgYoNT/zIwPxW0
	8tNrm8ofPJX6wprZ5N+nSWNdOkD6nBBvrl/XIEp5WvgXqYzttufc9cWVG1qesvLGwgcb3g
	pQGVkzHj+MZl0galcSYapBAAKThwO5s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-7naDlnNyNuKk-ah0mgUEzw-1; Thu, 04 Dec 2025 03:53:58 -0500
X-MC-Unique: 7naDlnNyNuKk-ah0mgUEzw-1
X-Mimecast-MFC-AGG-ID: 7naDlnNyNuKk-ah0mgUEzw_1764838438
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-47904cdb9bbso14864565e9.1
        for <imx@lists.linux.dev>; Thu, 04 Dec 2025 00:53:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764838437; x=1765443237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+RROGbd82iRnOs3Nzwo2Z6WPhdY3ptA/NeS0/WSLQA=;
        b=SiA825iLMeG2Y+P4ypFTEIA161X2zxYE0Q4N+tNkK5ULqsAwYCJzB8nPJnO6XncPS/
         FOuHfK9Z/y7HJS7eFUXQvluZuqQf8WFrOpbec/qEWU0WyagenvXsbHSphep9JO5CXC5F
         8XoI4Rryo8L0mQmXAvRbqdbv2dZcElnDS5MPNcKhn/s4VwddQp1nLcTiWsuKAes6oD0t
         ThuVO/YCYrv65VREkBuuM06mCzREu7gwjutXtMbBivgJRtKaLAe65YB8WJUuZ9t97lvi
         39xVZnk4XUVvmH31JzwcZnxMLEbYcp4CgDc6+A3JDRMu/gNRLhPIVgrnGkMIFPS2S5ad
         nUVw==
X-Gm-Message-State: AOJu0YyvOYEBatSkCWtwup8pNuogzA+SncI8osKQOylPkb3no9PIlZnm
	Lv77LFubydQRbY2viSdmhMts6tglwR9SOAuz7P0Xqm/i6iZSCPMsGo80qH+invsAMxgoioGzK8L
	STf+lS7U76cFnrRKx54E6xFhJfmiVpm+H9uHZqPlBEz8pRdzJ8h6sfQ==
X-Gm-Gg: ASbGnctQ9nr3IcMd1xETT6zgppvCiQNJ+E54bs1vkbtQ5Gsz2UcnfNXNk2gBbvbc80a
	7QFgdVH7OnQxVuabvOW2zSaFSWm8+hbmBr1bA97KavwyWRBtiWw6E+cfhaTEdqEFeodN1/D+TPC
	/wq1GlXmatuow3CEG8X5Cx5NUGL1agaPYSeR/I5EuAZwEktlyTsrt9lT1PEbL5Wwp1c/qSDkXlh
	AD0qxrl8kMCOqTR84GsWYCr55EUy6Fw+fyCz/yEgXeN/i2mVe4NQr9ajksiAg7ecMTnG5fKqKZl
	nIMVxwscAr+PRs+0+gRkZYl8arO7mSs13fInObN4ai318CW6WpjjdxBa4JuyJE8TPHhk/m2eqFj
	9DIcsBl3BDHgi
X-Received: by 2002:a05:600c:3151:b0:479:255f:8805 with SMTP id 5b1f17b1804b1-4792eb10e97mr24490175e9.4.1764838437607;
        Thu, 04 Dec 2025 00:53:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdoOoX89LYoqg9vGC/S46dUkmd/JqxNYom3WUE3CEBjnMhlYwrZPQ9lVJw/8DiVw0VpIa8aA==
X-Received: by 2002:a05:600c:3151:b0:479:255f:8805 with SMTP id 5b1f17b1804b1-4792eb10e97mr24489965e9.4.1764838437222;
        Thu, 04 Dec 2025 00:53:57 -0800 (PST)
Received: from [192.168.88.32] ([212.105.153.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4793093a9dcsm23134795e9.7.2025.12.04.00.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 00:53:56 -0800 (PST)
Message-ID: <cfc92b7c-b376-4de0-83a7-f7080c6f24d9@redhat.com>
Date: Thu, 4 Dec 2025 09:53:55 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: fec: ERR007885 Workaround for XDP TX path
To: Wei Fang <wei.fang@nxp.com>, shenwei.wang@nxp.com, xiaoning.wang@nxp.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org
Cc: imx@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251128025915.2486943-1-wei.fang@nxp.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251128025915.2486943-1-wei.fang@nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7S3iBnLsTJsu6iWTI86e_oPYXk74dYCJ-h0qpijDuCU_1764838438
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/28/25 3:59 AM, Wei Fang wrote:
> The ERR007885 will lead to a TDAR race condition for mutliQ when the
> driver sets TDAR and the UDMA clears TDAR simultaneously or in a small
> window (2-4 cycles). And it will cause the udma_tx and udma_tx_arbiter
> state machines to hang. Therefore, the commit 53bb20d1faba ("net: fec:
> add variable reg_desc_active to speed things up") and the commit
> a179aad12bad ("net: fec: ERR007885 Workaround for conventional TX") have
> added the workaround to fix the potential issue for the conventional TX
> path. Similarly, the XDP TX path should also have the potential hang
> issue, so add the workaround for XDP TX path.
> 
> Fixes: 6d6b39f180b8 ("net: fec: add initial XDP support")
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  drivers/net/ethernet/freescale/fec_main.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
> index 3222359ac15b..e2b75d1970ae 100644
> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
> @@ -3948,7 +3948,12 @@ static int fec_enet_txq_xmit_frame(struct fec_enet_private *fep,
>  	txq->bd.cur = bdp;
>  
>  	/* Trigger transmission start */
> -	writel(0, txq->bd.reg_desc_active);
> +	if (!(fep->quirks & FEC_QUIRK_ERR007885) ||
> +	    !readl(txq->bd.reg_desc_active) ||
> +	    !readl(txq->bd.reg_desc_active) ||
> +	    !readl(txq->bd.reg_desc_active) ||
> +	    !readl(txq->bd.reg_desc_active))
> +		writel(0, txq->bd.reg_desc_active);
>  
>  	return 0;
>  }

LGTM!

Side note for a net-next follow-up: please consider moving this logic in
a reusable helper, since you already have a few potentials call sites.

/P

