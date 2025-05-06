Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BE41474B8
	for <imx@lists.linux.dev>; Tue,  6 May 2025 10:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746527827; cv=none; b=b44J85vCFYc/Oh9JlGPkkMKWq2L6zFPT15nGamdlKYbK2RQQ8L1m5VL02NYI8NA27+5B+Cr9Ra0qdB186M+qrkvYJJLEc29Y1/BjSUIYImIFcfbgDYVd4Pe9qn/Je4xfA1IEKQgHRnj3g8+Ikc0Rkpg8rrL72S0jwvmWEJJRLMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746527827; c=relaxed/simple;
	bh=bGLHeOo/UPh/FsvGzBipG1630hXDqTjfzmZD/hU1dOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KyniloRJ7saG4iQQuXcpLSf/aj1duFPCqMAnY/iwG7+wspbmoyfDlv02ial73PUD8WrtWNmJy27VkRmXOUt0Qm7tj6d/XqSOGGKTb4djSHyx4UBy6/UnzepOe3ZjRaq6rNLIYbdTOPGqkg0Ff7I0Zve8l+h3OujWBT0wdOZ8B5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DlUkXv8E; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DlUkXv8E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746527824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aqJrxIoT0NsSUqxGw8G610oIR60/B2YKtR0eMCHfHoU=;
	b=DlUkXv8EfCo0ILG0N+pgQwQDvZLnRgWggoAG98Zk1MD3C4kDF4br+PBJ/MvkgrQj6YfY9Z
	JLoVW5YRxK757Zd9j3UXOzBTS7eXskM/1XpJpqPPTSpgTjC0fkPpCgZIYAnx3jTaIrpWZu
	QaJWgrHunTrmhCYnbTRMmP37nm+CP/E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-Sfwd5xawOeK5Uh6O_Yvqeg-1; Tue, 06 May 2025 06:37:03 -0400
X-MC-Unique: Sfwd5xawOeK5Uh6O_Yvqeg-1
X-Mimecast-MFC-AGG-ID: Sfwd5xawOeK5Uh6O_Yvqeg_1746527822
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39c2da64df9so2424822f8f.0
        for <imx@lists.linux.dev>; Tue, 06 May 2025 03:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746527822; x=1747132622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aqJrxIoT0NsSUqxGw8G610oIR60/B2YKtR0eMCHfHoU=;
        b=wT3lCmPyAbN9esJogKm3Nm+Dgbt7OSOVJ7++xhSbSBwKqjwmKcg82uEm35N5e6VgUW
         LLua2zZDdU11+7/5tXIrbGaTimWBqHWdmIuwsirt6hyPjiT5vICmJNKCuK8fxt48+aJ7
         hvlZb7K2iSCwVg/z7RGxkOXMLKi1e7hOqx9uquM6W8gFu385rWDc8ynvVWGY+w4Exiwv
         NpP7pIp011QtkMlyq2mS0pMfLDbphXhP1mMiwPuycpu5okZo51XksS71wbf162BVMKg3
         TlPLT7HkW2Px4x8Pt7npRyFSqyUA/9KmPiSpckkp8rJFJ+M+1AU7bNo/HxQxN8Yn/1GV
         RlXg==
X-Forwarded-Encrypted: i=1; AJvYcCUVTVZDpb2fF9Q4P0By5GifsBRCEgMVeZB8bmbZF+jcB4+Xjv8ZWespyxU3Hkfw6k7lzyQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzshznkPotf1e8HsvjFU2Ed1DpAyi6Pqt7KHvXCOLue1zrHwytA
	eB4pbKoDfPCFvpjLAAo27BcU4FKzu/msM166AKY2Yopz65JBxBlx/NyLDv7kSShM4RBmz22aAr7
	GScmJBqMflzYtm7HMgOSMQJ22FLsrQupzd2WVYcgbtmScYEiYUQ==
X-Gm-Gg: ASbGncv5bwfbiPaDbu5pm+8kci779bX9AQ4VHW85Qpxye/EZvn4XNSoJUo8I5Rlv63N
	zI8LLX8Pt1CduDfgBMlMTFEbHwkJpgO8xOevhqU88CFwrrRLS98yKLzqny0WG3P32lQTWwblbGC
	YDCaFXYbIMVp1A2ykxB6TQjQptBSXNnqShdKbUEaFw4v12l8QEZW/bqvlgmEkvH+iAsZQ4+9XZP
	P/qtxN63Mvu0dudkcAjCWxNCNuyREtnNxBZ1w8gkNpDt1WpIEkSVsyH/YahG1HIC9UxEuY2aVxd
	tqkM9kC01GkDzViDio59tZ3fR2HPQsFrG3gDzF90mFBMRwv3a88H6yybnNU=
X-Received: by 2002:a05:6000:4383:b0:390:e1e0:1300 with SMTP id ffacd0b85a97d-3a0ac0ec4a6mr1662156f8f.33.1746527822107;
        Tue, 06 May 2025 03:37:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIqkSxt+T1Y7TtJsOmByWaD3BgViww9S8kLQLobpWHpxjPJOZvKt1Y7bskuQM3nS0/SlP2Zw==
X-Received: by 2002:a05:6000:4383:b0:390:e1e0:1300 with SMTP id ffacd0b85a97d-3a0ac0ec4a6mr1662118f8f.33.1746527821579;
        Tue, 06 May 2025 03:37:01 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2706:e010:b099:aac6:4e70:6198? ([2a0d:3344:2706:e010:b099:aac6:4e70:6198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a2874asm162916855e9.26.2025.05.06.03.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 03:37:01 -0700 (PDT)
Message-ID: <61ebe754-d895-47cb-a4b2-bb2650b9ff7b@redhat.com>
Date: Tue, 6 May 2025 12:36:57 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v11 4/7] net: mtip: The L2 switch driver for imx287
To: Lukasz Majewski <lukma@denx.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Stefan Wahren <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>
References: <20250504145538.3881294-1-lukma@denx.de>
 <20250504145538.3881294-5-lukma@denx.de>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250504145538.3881294-5-lukma@denx.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uguQWUOmXdGMghG64vlg4NBr81DdJ0RHMT_KE6RXxWg_1746527822
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/4/25 4:55 PM, Lukasz Majewski wrote:
> +		/* This does 16 byte alignment, exactly what we need.
> +		 * The packet length includes FCS, but we don't want to
> +		 * include that when passing upstream as it messes up
> +		 * bridging applications.
> +		 */
> +		skb = netdev_alloc_skb(pndev, pkt_len + NET_IP_ALIGN);
> +		if (unlikely(!skb)) {
> +			dev_dbg(&fep->pdev->dev,
> +				"%s: Memory squeeze, dropping packet.\n",
> +				pndev->name);
> +			pndev->stats.rx_dropped++;
> +			goto err_mem;
> +		} else {
> +			skb_reserve(skb, NET_IP_ALIGN);
> +			skb_put(skb, pkt_len);      /* Make room */
> +			skb_copy_to_linear_data(skb, data, pkt_len);
> +			skb->protocol = eth_type_trans(skb, pndev);
> +			napi_gro_receive(&fep->napi, skb);
> +		}
> +
> +		bdp->cbd_bufaddr = dma_map_single(&fep->pdev->dev, data,
> +						  bdp->cbd_datlen,
> +						  DMA_FROM_DEVICE);
> +		if (unlikely(dma_mapping_error(&fep->pdev->dev,
> +					       bdp->cbd_bufaddr))) {
> +			dev_err(&fep->pdev->dev,
> +				"Failed to map descriptor rx buffer\n");
> +			pndev->stats.rx_errors++;
> +			pndev->stats.rx_dropped++;
> +			dev_kfree_skb_any(skb);
> +			goto err_mem;
> +		}

This is doing the mapping and ev. dropping the skb _after_ pushing the
skb up the stack, you must attempt the mapping first.

> +static void mtip_free_buffers(struct net_device *dev)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	struct sk_buff *skb;
> +	struct cbd_t *bdp;
> +	int i;
> +
> +	bdp = fep->rx_bd_base;
> +	for (i = 0; i < RX_RING_SIZE; i++) {
> +		skb = fep->rx_skbuff[i];
> +
> +		if (bdp->cbd_bufaddr)
> +			dma_unmap_single(&fep->pdev->dev, bdp->cbd_bufaddr,
> +					 MTIP_SWITCH_RX_FRSIZE,
> +					 DMA_FROM_DEVICE);
> +		if (skb)
> +			dev_kfree_skb(skb);

I suspect that on error paths mtip_free_buffers() can be invoked
multiple consecutive times with any successful allocation in between:
skb will be freed twice. Likely you need to clear fep->rx_skbuff[i] here.

Side note: this patch is way too big for a proper review: you need to
break it in multiple smaller ones, introducing the basic features
separately.

Cheers,

Paolo

