Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94031D5CE0
	for <imx@lists.linux.dev>; Tue, 17 Dec 2024 09:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734427217; cv=none; b=MnQlGCTD0dtYjZCyB9oBYpupJfARBMTwHF48W9JxSjQVpdLI2zY3ME9+MCwmTGmRb4a7vyTDrhULiaaZDZzO889czaEOu2iC3j03i7DTY/8YgWKRq1TN5aKWw5VuigKau3m25zxikDCeBFm5cDQmvKK7vsrPEd0I7pPzU+A7HjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734427217; c=relaxed/simple;
	bh=h49wb3/FMFiEkSL2cqaXQUDAqaoOthdH188do6RuISM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=maJDTApLB8uPVWPSrsiK0byUJm5Uut8LBAFnaU33tIwHT04o2Dov2420EHhGyQ1Y06ixqDUtGATWe3Guhja2he/h/KcVgWDTrL00NZSz2wzzgkEpQZykUj6RpBTp7Hi9/GL76+0hgjSnQs1DyC6HIAYAIJQ5iJdK6jbSchPCT3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BAyWgjPt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BAyWgjPt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734427214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ECFrhsJcD9yaPs9mZl15tYc8r1V+g7whohkb6M/rkZg=;
	b=BAyWgjPteW3eXadPGColjhX2qgmusFnUlU4wwE36vLHn0uRk9IE+u6zpCAEgA7eDc3JxY3
	vKKklECs+ZXdvEDogrZWW2nSs0BRheItoceQKc6C0idn8CBXz44qJVtxQvSYiIfT01Gk/d
	c1sVbp5kvRo0tSI496SFvcRtzXIvImA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-20asNvxsNOGVlKzIHBjj5A-1; Tue, 17 Dec 2024 04:20:13 -0500
X-MC-Unique: 20asNvxsNOGVlKzIHBjj5A-1
X-Mimecast-MFC-AGG-ID: 20asNvxsNOGVlKzIHBjj5A
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4361c040ba8so22118655e9.1
        for <imx@lists.linux.dev>; Tue, 17 Dec 2024 01:20:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734427212; x=1735032012;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ECFrhsJcD9yaPs9mZl15tYc8r1V+g7whohkb6M/rkZg=;
        b=LDhxKFiEkNZFDrtFpHShGhuwQRdAG5vJRFdEVOygcXg7u4TIk3q05b6G1xIylSZBhO
         /o+vsAhSVnNrmDoIv4ZkeAGo/97xIB0XnAZoPYO3ScWm7BMVNw+Zd8K+z6XgbrWISiRa
         cJq/+aFul8uwdm0qk1QWSoZJqBfWA/bK7LXFxREwAjr9R66UEQWmoVA78Do7KhYr7p6V
         H97jnISWftFAzfVZ5/fRjoGy/JOFY4vhXaxifcU8mqHcUtWKrIG0orMxkgG3np2Wxq0J
         +Iu2CqpecEh6BqN8qFo+YyRwFHkkr2OH7ufrj/CjIVQ0KFWLhGMgfZLX6NOinBJhtXtW
         5ydA==
X-Forwarded-Encrypted: i=1; AJvYcCXMaJRtWs7b8GZ93/FKZdZmZS9FfETplavw+CWtKfw9KY8/JLML+nacnZwPRaXriI4jcXY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSGmAd28p1bVSF4Nu8ThyaVN+iub0saHyT90ZMKF/OrlK7z4iu
	/lAI8wo2b53SfGWrs3MrRjT78J/NeuCi3PFNTZirKkOme82PQ/A7qMGc/tokn+Y03oNlxSEIWbM
	3YzFGaB2G5KNzLjsuIHCtaB6hh6sNnEG3yhDOfJ2CgZofHtY/Ag==
X-Gm-Gg: ASbGncvqDmT/PNTljQVTeuKUtFZpxRgvrPrlXXF5WGGLzr2kBOy/Nyg332F/MEoFBRO
	MBOmYEZ83nWzCIXumLziljpDd5vhF97TthMQhlhSbOVRT59wk/EDADOoy+4hsGT4IPCCnoGbyrY
	r4dlATjs2a55/gf20qHfOvmR0q6bGY1c2VoOmeedGX+gyPBVeeSWn2E1/14tAh5id1SrAFM6e4s
	w6a2DsJxLzeOtAtU2YIEGjn2aNlEuWT/vGeL+Or/B1LV+//A9XURjl2Ekycnt7Q5ffqZZiyaP22
	dodqZNiTXw==
X-Received: by 2002:a5d:6daa:0:b0:385:e38f:8dd with SMTP id ffacd0b85a97d-3888e0b8e56mr14402495f8f.46.1734427212442;
        Tue, 17 Dec 2024 01:20:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFT45Ia9tcjRNm5HiAwicXMmieHdb6en5L8TLMBtkb6z8PazXLW14+YCs65EkY3Hnh0oRocUQ==
X-Received: by 2002:a5d:6daa:0:b0:385:e38f:8dd with SMTP id ffacd0b85a97d-3888e0b8e56mr14402465f8f.46.1734427212064;
        Tue, 17 Dec 2024 01:20:12 -0800 (PST)
Received: from [192.168.88.24] (146-241-69-227.dyn.eolo.it. [146.241.69.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8016bdfsm10656780f8f.43.2024.12.17.01.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 01:20:11 -0800 (PST)
Message-ID: <118bbd72-b1fb-4da2-b1bd-5a66ecfe7322@redhat.com>
Date: Tue, 17 Dec 2024 10:20:10 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 net-next 3/4] net: enetc: add LSO support for i.MX95
 ENETC PF
To: Wei Fang <wei.fang@nxp.com>, claudiu.manoil@nxp.com,
 vladimir.oltean@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, frank.li@nxp.com,
 horms@kernel.org, idosch@idosch.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev
References: <20241213021731.1157535-1-wei.fang@nxp.com>
 <20241213021731.1157535-4-wei.fang@nxp.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241213021731.1157535-4-wei.fang@nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y7RuIx76lemkrQi9gnG6-YmSJqz1ofyurbYC81aDs8s_1734427212
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/13/24 03:17, Wei Fang wrote:
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
> index 09ca4223ff9d..41a3798c7564 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc.c
> @@ -533,6 +533,224 @@ static void enetc_tso_complete_csum(struct enetc_bdr *tx_ring, struct tso_t *tso
>  	}
>  }
>  
> +static inline int enetc_lso_count_descs(const struct sk_buff *skb)

Please, don't use inline in c files

> +{
> +	/* 4 BDs: 1 BD for LSO header + 1 BD for extended BD + 1 BD
> +	 * for linear area data but not include LSO header, namely
> +	 * skb_headlen(skb) - lso_hdr_len. And 1 BD for gap.
> +	 */
> +	return skb_shinfo(skb)->nr_frags + 4;
> +}
> +static int enetc_lso_hw_offload(struct enetc_bdr *tx_ring, struct sk_buff *skb)
> +{
> +	struct enetc_tx_swbd *tx_swbd;
> +	struct enetc_lso_t lso = {0};
> +	int err, i, count = 0;
> +
> +	/* Initialize the LSO handler */
> +	enetc_lso_start(skb, &lso);
> +	i = tx_ring->next_to_use;
> +
> +	enetc_lso_map_hdr(tx_ring, skb, &i, &lso);
> +	/* First BD and an extend BD */
> +	count += 2;
> +
> +	err = enetc_lso_map_data(tx_ring, skb, &i, &lso, &count);
> +	if (err)
> +		goto dma_err;
> +
> +	/* Go to the next BD */
> +	enetc_bdr_idx_inc(tx_ring, &i);
> +	tx_ring->next_to_use = i;
> +	enetc_update_tx_ring_tail(tx_ring);
> +
> +	return count;
> +
> +dma_err:
> +	do {
> +		tx_swbd = &tx_ring->tx_swbd[i];
> +		enetc_free_tx_frame(tx_ring, tx_swbd);
> +		if (i == 0)
> +			i = tx_ring->bd_count;
> +		i--;
> +	} while (count--);
> +
> +	return 0;
> +}

I'm sorry for not catching the issue early, but apparently there is an
off-by-one in the above loop: if 'count' bds have been used, it will
attempt to free 'count + 1' of them.

The minimal fix should be using:

	} while (--count);

/P

