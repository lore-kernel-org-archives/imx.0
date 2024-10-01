Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E551C4603
	for <imx@lists.linux.dev>; Tue,  1 Oct 2024 13:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789565; cv=none; b=YBCMWMqcLcbJ2gdMJ9zs1ririXG1OOBWIw27Hgq+OQKe4AYDNDAn6CcVijqf3BhLF0Nzx2isHNw980AEpposye+XmECcYbBEa3egG0RYYX2YHKf5mU5mprGPGR5YjjoedLbXOGVtMyswlR1UvOySymPxwm/tkIlJTUDvMG1rDog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789565; c=relaxed/simple;
	bh=PKF8ZVEo8AmNwMLcEwYXeCfaLkhMxlQpxXFFSPA6ZXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kkZZGdikKnXfdwarXeMkMTA9jK4gLVFFIsv4Vd9JHypuy3FhRQf17nIfQgK1Fe3zg+dAfflH80DAL0mNPDD9oHipbZcSolMU3ayUQxwzvEBlGpnjhojtfTwglEC/c/8Sj2fdXhemN/eIGdunRNh8Ca2MAWBecPyPKsA5zWPxRf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HrBze1Gb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HrBze1Gb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727789562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iojT1xfY/iXMYZ4HclXjt5wJyv9eCNn2RMRvon4kbuU=;
	b=HrBze1GbWGerJ3MzoYlZf1DLe1zT1DbV2wjXksXzfpZcyd5AvF6yrn+952hv0lzJDIqDF9
	fGKX9EVmSFEuELgJHrayqAHFVLEfc5lEQjttwgFVF4yl/HCl0EtnTpK9nUaa6MfUczAsxc
	PXesMLZFFTdwS4hAI7P+FVqRakyxJeQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-6-HUQjHJOu2IueT2xs3shA-1; Tue, 01 Oct 2024 09:32:40 -0400
X-MC-Unique: 6-HUQjHJOu2IueT2xs3shA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42cc4345561so31538155e9.1
        for <imx@lists.linux.dev>; Tue, 01 Oct 2024 06:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727789559; x=1728394359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iojT1xfY/iXMYZ4HclXjt5wJyv9eCNn2RMRvon4kbuU=;
        b=odZ5kViyiAjOaPd4nF7/KY5iMdRNJZnOhtlBJBQo5vYQHwCSFM9BvIRuSl2X5/pAiH
         F+NuOHXifE4K/OLGFS6OhTry/lpzNjbqHBZB59InNPNf5vd9RWjpe5LI8NXE31oNvuB6
         ZQTnzZq5/wYlfGJFPsN7kTGSFwMwzv+KVcWdeZDQ8bH96e1ZtNl7PIuqfN1FOiAMvtWm
         g1qydvJAh9fHLYwvEAdBUj0aPajh87D/J8o/WiZrzvHz8Oa0oF2E507Qw3Wdx32pEUem
         d9KsIsmu/O5hYDfMEcjoCbGVx0irLO5TEPxQwA1GhlO9PtrZnjS1eziQyR2SGV/1zDXB
         SMpA==
X-Forwarded-Encrypted: i=1; AJvYcCWx4N7sjVT8814aYCaqznQcL6ZewdJP7G+jGax+3HedUEYzW36jAT8/8qfHqvCFamUyH+Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzeczo4OW0rK5KBS5mIBLvrXnqpqWKxp5a0tFN+GTqCr9jaPa2h
	ED89x1faHgZqIcCV82qqZe4EVu4y9nelWoJBsKOv6QJf+CxxdFQjIx6epSt6ve5gF7QU0nsxgk4
	2ynkAwn3nRUSo+rfvTZVDzYcFIzWoVtkSNONWHAgtha2gHHUhSA==
X-Received: by 2002:a05:600c:a02:b0:426:66e9:b844 with SMTP id 5b1f17b1804b1-42f584339aemr130160545e9.8.1727789559109;
        Tue, 01 Oct 2024 06:32:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDiutjjZjFmvjKmZCcGrKni3t0abnQlYsETvEbcK9G6gugyRexKg3WBxo9lrKH5Dul5fJhqA==
X-Received: by 2002:a05:600c:a02:b0:426:66e9:b844 with SMTP id 5b1f17b1804b1-42f584339aemr130159935e9.8.1727789558576;
        Tue, 01 Oct 2024 06:32:38 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:b088:b810::f71? ([2a0d:3341:b088:b810::f71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57e13a1dsm136324005e9.32.2024.10.01.06.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 06:32:37 -0700 (PDT)
Message-ID: <4968c2ec-5584-4a98-9782-143605117315@redhat.com>
Date: Tue, 1 Oct 2024 15:32:34 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/2] page_pool: fix IOMMU crash when driver has
 already unbound
To: Yunsheng Lin <linyunsheng@huawei.com>, davem@davemloft.net,
 kuba@kernel.org
Cc: liuyonglong@huawei.com, fanghaiqing@huawei.com, zhangkun09@huawei.com,
 Robin Murphy <robin.murphy@arm.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, IOMMU <iommu@lists.linux.dev>,
 Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Saeed Mahameed
 <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, imx@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, bpf@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-mm@kvack.org
References: <20240925075707.3970187-1-linyunsheng@huawei.com>
 <20240925075707.3970187-3-linyunsheng@huawei.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20240925075707.3970187-3-linyunsheng@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/24 09:57, Yunsheng Lin wrote:
> Networking driver with page_pool support may hand over page
> still with dma mapping to network stack and try to reuse that
> page after network stack is done with it and passes it back
> to page_pool to avoid the penalty of dma mapping/unmapping.
> With all the caching in the network stack, some pages may be
> held in the network stack without returning to the page_pool
> soon enough, and with VF disable causing the driver unbound,
> the page_pool does not stop the driver from doing it's
> unbounding work, instead page_pool uses workqueue to check
> if there is some pages coming back from the network stack
> periodically, if there is any, it will do the dma unmmapping
> related cleanup work.
> 
> As mentioned in [1], attempting DMA unmaps after the driver
> has already unbound may leak resources or at worst corrupt
> memory. Fundamentally, the page pool code cannot allow DMA
> mappings to outlive the driver they belong to.
> 
> Currently it seems there are at least two cases that the page
> is not released fast enough causing dma unmmapping done after
> driver has already unbound:
> 1. ipv4 packet defragmentation timeout: this seems to cause
>     delay up to 30 secs.
> 2. skb_defer_free_flush(): this may cause infinite delay if
>     there is no triggering for net_rx_action().
> 
> In order not to do the dma unmmapping after driver has already
> unbound and stall the unloading of the networking driver, add
> the pool->items array to record all the pages including the ones
> which are handed over to network stack, so the page_pool can
> do the dma unmmapping for those pages when page_pool_destroy()
> is called. As the pool->items need to be large enough to avoid
> performance degradation, add a 'item_full' stat to indicate the
> allocation failure due to unavailability of pool->items.

This looks really invasive, with room for potentially large performance 
regressions or worse. At very least it does not look suitable for net.

Is the problem only tied to VFs drivers? It's a pity all the page_pool 
users will have to pay a bill for it...

/P

