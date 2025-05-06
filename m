Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891BA2798F2
	for <imx@lists.linux.dev>; Tue,  6 May 2025 11:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746530609; cv=none; b=cY/pkERAKfrnngQ6PPLQlYG7fn3kdjvzFwZvHSi5Y0oujsfc+A9V2KsNXQ8EIMgcbvEaQeAW1aqBuBsDxkS4FNy6XEYYlYL5mL8WeE2u2uahlcGVSkXujCkmQf0JKjWT61z16j8efHlkVFQnbZ9UIB2XjCr+Xhp3R86/C09IS8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746530609; c=relaxed/simple;
	bh=G+3WkQcpdcfeKfUTIqHj8xX8ZAGYDA7fG744ILMAolo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IEKlMqfVFJ9t609IH1zzCcfxFHBN2yVIHpjy/4IVtzYzQfMHNlE4iBrl5OnQ2TGQLdEN8oP+NMETVpxoGf4ygxmXJWO9iHF8u8QRpoikQqThygZsznEPTDNXou/JVEM3MjPE1Ohocqw5vjlhD5OgdaTflpq4kU9g6clJ2bmuz74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dltudh91; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dltudh91"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746530606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fBp4p4deqUzAG3SrieVeuIkuCgjpw2beSF6aI8YLfpc=;
	b=dltudh91B+x5OHPma7F7RqaTfhA5qEuZiNW0QRMOsj0OeWydV1aVfHzPhjyhHE+l+9iP5C
	PtWxgi8MfbNhHHUG01gTfN9eWfs91hdD2Czpb6jdnHcHHhX6DOogdbGgsFBxNHJ4Ra7TE8
	9shA/x4hxsWgHfLdbp/q/i5TSrPR5Jk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204--aRLrqZ4MLuQCfhEasW8sQ-1; Tue, 06 May 2025 07:23:25 -0400
X-MC-Unique: -aRLrqZ4MLuQCfhEasW8sQ-1
X-Mimecast-MFC-AGG-ID: -aRLrqZ4MLuQCfhEasW8sQ_1746530604
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so25384275e9.3
        for <imx@lists.linux.dev>; Tue, 06 May 2025 04:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746530604; x=1747135404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fBp4p4deqUzAG3SrieVeuIkuCgjpw2beSF6aI8YLfpc=;
        b=rekuUYg5nCTdVazMfoeRjRRGyPSrXeoYYhzDZ4/WQa+GT0YSY1sPBwVpaNhda2Y0q5
         Bram6g2v2pEqClrr5ZIY/JhjPd3xgUF5PgBE1kl3CIgVXRdx6QfZFYlkTbsC9zuewdsX
         McwX1wwvIOnOKeqdxiF4kwxThI/ZHGyMyBCIvsy+kGo73oertr/CTox6AwSd3GcZNvQt
         bGebQpIHLqcZCMA2s4ORm7ImSxSwRgxq78Ue2exTYIxcDvA8a2xQm4Ygcx5ZPmqMjjVt
         Uk0ohHkxP1FQGiG+EZ7ztyXIRs4cmfrlg7pOIaz33Om4skKwkGR7uF4eIsXh3T1+USSp
         AHOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXKQDxpkeoOqTI9Kx4fUN+2uyDg7R4nO7EK3h62HT/Ja7xb4ISfsW2UwHgB1Z41KzVI4c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5kACrqGxnRXimADGwvoziI2lOwuRL2N6m91OZdPEs11rzpX+B
	PJyipZzYSsiOYIeaQ+8laTONuptvXgI6JSxs6FBl6xuCRukDA1cFLCDTKn2oM6eO99KPOnWOvR6
	U2WoJhpfYy1VyeHthhF2si03YcIYGUZavxnS4xUmTBifI/hJVmw==
X-Gm-Gg: ASbGnctJMy0mVPsj5D9x9NOMUKDiiOuY0uDB2U4S8P4G3uDkYnbCUD97lgKifZLfhn5
	QbP+/4m2srKPQgEJr078jmrMH3j1vPcxNirEgUW25ZuIfgSki6GDj9fpPC0LLRZITq/Mg3zaAPN
	msYNHy9qSa7lyEHFeu8FNrOi/fKpbglpr0XvZx++pr3qgrw+3i7Xj17rukSbhzJteRI04DtstpZ
	lluuNL2BWhrPVymN9SSUFC17cqgAK+Y2VKafQ1u5aGyG//Qrs1a9LEbR/edJgPn340WOtob1SAu
	Zod1a25XfafJCi2LxJrRuzMDIW/SDid3Ui8Is+Yxmvoav4+Y5pm7EETbpxo=
X-Received: by 2002:a05:600c:1d1f:b0:43d:24d:bbe2 with SMTP id 5b1f17b1804b1-441d1014fcfmr16249985e9.28.1746530604238;
        Tue, 06 May 2025 04:23:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeYO2F4emx5hXi1uWB9URVLSGX9o9e7D7vvbT0onpTpSIZrGfufwgIJiasWRhRjn91m92mTQ==
X-Received: by 2002:a05:600c:1d1f:b0:43d:24d:bbe2 with SMTP id 5b1f17b1804b1-441d1014fcfmr16249785e9.28.1746530603759;
        Tue, 06 May 2025 04:23:23 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2706:e010:b099:aac6:4e70:6198? ([2a0d:3344:2706:e010:b099:aac6:4e70:6198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ad7ab1sm212836775e9.4.2025.05.06.04.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 04:23:23 -0700 (PDT)
Message-ID: <3e91e070-24a2-4dab-bca5-157fea921bf0@redhat.com>
Date: Tue, 6 May 2025 13:23:21 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v11 4/7] net: mtip: The L2 switch driver for imx287
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Stefan Wahren <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>
References: <20250504145538.3881294-1-lukma@denx.de>
 <20250504145538.3881294-5-lukma@denx.de>
 <61ebe754-d895-47cb-a4b2-bb2650b9ff7b@redhat.com>
 <20250506130438.149c137e@wsk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250506130438.149c137e@wsk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _2IjCcZojdU92Ly64ayhlqAi9tAxhLMMjv7yhTE3kr4_1746530604
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/6/25 1:04 PM, Lukasz Majewski wrote:
>> On 5/4/25 4:55 PM, Lukasz Majewski wrote:
>>> +		/* This does 16 byte alignment, exactly what we
>>> need.
>>> +		 * The packet length includes FCS, but we don't
>>> want to
>>> +		 * include that when passing upstream as it messes
>>> up
>>> +		 * bridging applications.
>>> +		 */
>>> +		skb = netdev_alloc_skb(pndev, pkt_len +
>>> NET_IP_ALIGN);
>>> +		if (unlikely(!skb)) {
>>> +			dev_dbg(&fep->pdev->dev,
>>> +				"%s: Memory squeeze, dropping
>>> packet.\n",
>>> +				pndev->name);
>>> +			pndev->stats.rx_dropped++;
>>> +			goto err_mem;
>>> +		} else {
>>> +			skb_reserve(skb, NET_IP_ALIGN);
>>> +			skb_put(skb, pkt_len);      /* Make room */
>>> +			skb_copy_to_linear_data(skb, data,
>>> pkt_len);
>>> +			skb->protocol = eth_type_trans(skb, pndev);
>>> +			napi_gro_receive(&fep->napi, skb);
>>> +		}
>>> +
>>> +		bdp->cbd_bufaddr = dma_map_single(&fep->pdev->dev,
>>> data,
>>> +						  bdp->cbd_datlen,
>>> +						  DMA_FROM_DEVICE);
>>> +		if (unlikely(dma_mapping_error(&fep->pdev->dev,
>>> +					       bdp->cbd_bufaddr)))
>>> {
>>> +			dev_err(&fep->pdev->dev,
>>> +				"Failed to map descriptor rx
>>> buffer\n");
>>> +			pndev->stats.rx_errors++;
>>> +			pndev->stats.rx_dropped++;
>>> +			dev_kfree_skb_any(skb);
>>> +			goto err_mem;
>>> +		}  
>>
>> This is doing the mapping and ev. dropping the skb _after_ pushing the
>> skb up the stack, you must attempt the mapping first.
>>
>>> +static void mtip_free_buffers(struct net_device *dev)
>>> +{
>>> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
>>> +	struct switch_enet_private *fep = priv->fep;
>>> +	struct sk_buff *skb;
>>> +	struct cbd_t *bdp;
>>> +	int i;
>>> +
>>> +	bdp = fep->rx_bd_base;
>>> +	for (i = 0; i < RX_RING_SIZE; i++) {
>>> +		skb = fep->rx_skbuff[i];
>>> +
>>> +		if (bdp->cbd_bufaddr)
>>> +			dma_unmap_single(&fep->pdev->dev,
>>> bdp->cbd_bufaddr,
>>> +					 MTIP_SWITCH_RX_FRSIZE,
>>> +					 DMA_FROM_DEVICE);
>>> +		if (skb)
>>> +			dev_kfree_skb(skb);  
>>
>> I suspect that on error paths mtip_free_buffers() can be invoked
>> multiple consecutive times with any successful allocation in between:
>> skb will be freed twice. Likely you need to clear fep->rx_skbuff[i]
>> here.
> 
> I don't know what I shall say now.... really... 

I suspect my email was not clear. AFAICS the current code contains at
least 2 serious issues, possibly more not yet discovered due to the
patch size. You need to submit (at least) a new revision coping with the
provided feedback.

Thanks,

Paolo

