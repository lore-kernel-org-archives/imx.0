Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9DF253931
	for <imx@lists.linux.dev>; Tue, 27 May 2025 10:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748342128; cv=none; b=LQHJjvg2JX2lLlJ96PPJO3xjxXgYFwsGF2bX0ygbwvNe/EU9L1rRXFNU70JO9xor4DF8TV4LWOVcGyNg8I75AAFjCFImZ81fYMMH6GpHBo4PwiDt3o83/xL7hny2LNFNmuHNjQuafAOsUjHl4AqGsxl9cLaRz67qd16lcDggCoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748342128; c=relaxed/simple;
	bh=/juqogzjOcrqZPt0Oi4j+kx+mXvLgxBGp3NXPvo6jfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NocxXAjDOwNcD2c6lHzWXF21myAaF5nWfTxUdDVAnbM82vWjuLlUAKdJQw8EWC+1FATbZeKcgcfCSOXmLBCG9FfUaJ5QPnfeHord/Cwa7vf9JUcHD5T8y01jNHsVmxWCmiOymHCkkd1VAxwHsUpXo2Q09a+G+t+cQ2PM/VtwdyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=itLh3ljC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="itLh3ljC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748342125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hWu2mrsEBIWGkWqeUeYJyw5B2ia475IvzX8OU4kWUv4=;
	b=itLh3ljCWwbgPS2cHmP3Fg0NZDlJ5dX5aog/jHgT6O1Dp8kvE1P9OcZ1y3dyKIqtJP/5b8
	V4ZHH0RxRD16Eqn+twIEe+c5c9hozWiX6IKXeVltirAfhSK50f2J7eZ1U9vy7lmrTZ3OAO
	0G0ZZjNELjSrf02FpGM32DxoN8ELig4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-elxVNO_nMB21RWmS5HITng-1; Tue, 27 May 2025 06:35:24 -0400
X-MC-Unique: elxVNO_nMB21RWmS5HITng-1
X-Mimecast-MFC-AGG-ID: elxVNO_nMB21RWmS5HITng_1748342123
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a3696a0d3aso1269620f8f.2
        for <imx@lists.linux.dev>; Tue, 27 May 2025 03:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748342123; x=1748946923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hWu2mrsEBIWGkWqeUeYJyw5B2ia475IvzX8OU4kWUv4=;
        b=XRGfAy0odiwLIDgrhmJW7USkxhg7JNQW3lpmccZQQuEreieTSJWQXY/gmXF1n81ZV4
         AFh7w3e7rO7LXKILw3eYYqn/qcJdBSr2uRD3ev7ul+T99H7MJIU9B184t4+MVaiB+ttt
         SgLDFNc3QUHGP1j1cyq2hLEjq2Ikr3TAu3HNytWZrGk8ZUbHNt7Pw1siS1owd1ZS5chl
         4uiSi1c9flWvsmETUc7FH5X9VBA3AFoEmef6uw0R+Rb76vWc1SeikKx5Swr1BQ/8GGXO
         AFD09mwPG02xBgOrgG/R/j175e3jRlDoEbfgtyj0JhFDDjRGGtWT8pDVsyph7rdM9LrB
         m47A==
X-Forwarded-Encrypted: i=1; AJvYcCXWns8q5UUiL2Q4Ns8yQeaSO20QvJIaYTUttTLR3vp79cRkHmCZ1ezjmCt0h4JPfZWN3YQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZcNiTsgYpb6/9BKsxnQN53Bmtec1zTSExClJDiPI4cKPpH9RU
	vKzego8T87/p3AQqoZzfPscYY17r02o4Yn3AwaL0rzVCgxL+F9zTzUEUDulcMZiB0f/kGZ5XGGT
	Gtn4a4zQotP6MRtfkr8Ht7/uePIWVO00KUqrvNsvzPMPLNI5Vl1zMJA==
X-Gm-Gg: ASbGnctHYTZFtt+/GCuIECLoBHojJFP0+06Sg51DA6dCfrIPLGueDRpiiZv7wLrGC9w
	3Qn/OqRJGbCNGw70eYzep4NXxqXlZyLsT1jepTdrQQfrsZY5TKuttPyDnb7/IiEbdQQnxamtd5w
	xK+9/sIZ1Wako3qIDkNuEcjz1nrHmxFrsTUEZJuQd3MZsZAuDkBBObUlPJ80alAwlkvA6BvjGhy
	mLeXaNnMxtVS6TORgjj/s/LfJ8imFkr4e66615lx5zMbX+2s0pR5iKt6WVkV8FYXeqMHgEEFAkN
	bOu5Ql6SLFLr42+HYWE=
X-Received: by 2002:a5d:6e5d:0:b0:3a4:cc6a:4707 with SMTP id ffacd0b85a97d-3a4cc6a47afmr8067276f8f.48.1748342122844;
        Tue, 27 May 2025 03:35:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/Z0+wYgjwb+KMEhoIXQs6NQqsPmlcJox8t+LPqcLdWR6Idrt6pQtkHSyvpeUNQ/WjbvgQNg==
X-Received: by 2002:a5d:6e5d:0:b0:3a4:cc6a:4707 with SMTP id ffacd0b85a97d-3a4cc6a47afmr8067256f8f.48.1748342122498;
        Tue, 27 May 2025 03:35:22 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2728:e810::f39? ([2a0d:3344:2728:e810::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef0ab8sm262443105e9.13.2025.05.27.03.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 03:35:22 -0700 (PDT)
Message-ID: <ec6487a8-277f-474b-b9ef-273a7f160604@redhat.com>
Date: Tue, 27 May 2025 12:35:19 +0200
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
 <20250513073109.485fec95@wsk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250513073109.485fec95@wsk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qTGPQAL36pGKMabBZ_nN0qbAp5g9ZTKcoCMXf3hECxs_1748342123
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/13/25 7:31 AM, Lukasz Majewski wrote:
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
> 
> I've double check it - the code seems to be correct.
> 
> This code is a part of mtip_switch_rx() function, which handles
> receiving data.
> 
> First, on probe, the initial dma memory is mapped for MTIP received
> data.
> 
> When we receive data, it is processed and afterwards it is "pushed" up
> to the network stack.
> 
> As a last step we do map memory for next, incoming data and leave the
> function.
> 
> Hence, IMHO, the order is OK and this part shall be left as is.

First thing first, I'm sorry for lagging behind. This fell outside my
radar. Let's keep the conversation on the new patch version, it should
help me to avoid repeating this mistake.

/P

