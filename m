Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DA22D6406
	for <imx@lists.linux.dev>; Tue, 15 Jul 2025 10:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752575782; cv=none; b=jK6fbGGagwylEEuzEaghVB/3yAxix5HZPUEuEhZqtIWcwr2/j2mHYkvHJaBvrK0frgPk5iou7GL+PhpB2u7MldDN8JKQ4JPEX00EkqCTy1yqRWbfga9t+FghvOO9Ywm41t9qm7fye9sBBPtOTmcyeQDDnYh4ABC4oCftWBPzMeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752575782; c=relaxed/simple;
	bh=F+tYOXJ8hjiy2s7ICd+QbNKS1sdyZsQBpGzRhNcc6jw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VvS0HmwWN4rpr06EATS+0a/HqWTKmvT4x5yFePkxdrl2HasSO2Z1jdkjF6KfTt2U4dA6KftBGeX3hlIo9UIZ1HXt+Hfa5Kx684lAadfTM8jdr8Il40Q6S4cYVB3j+P/g6uLfm2z1rSF99TxZWoY9m8g+2kGawystLagAClQJuVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WqYMdsmb; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WqYMdsmb"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae3ec622d2fso923816766b.1
        for <imx@lists.linux.dev>; Tue, 15 Jul 2025 03:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752575779; x=1753180579; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RwJj2XW0Xtg7vWbGRjw0IzVQ1p4FfGBNG+AO9cOWVHY=;
        b=WqYMdsmbhLoX0KmBKiHz7IB8VDTDpHzptYNYgssjoHDWS1k7fgKQlHDefKDaI94KZo
         ho5GWE1MBKlWZZA3OauoLHqrZjLk9/bZ6V8CmbSLRjcSdk8+oFl4aToXIvoHbCZMa0Qm
         jkL8Tn0HSShWt/CgWZbUDebQqa3jn0qcKdblgt3LPQI4jyTqIiE/pnz4c3DEQkW3qqur
         2f9tugrrR4dK+VtslXH05P8YeP3YX5x+HdrUlXVxUWs5DElB2yabcWcOJvggAAYRJu0d
         MWYJ6G0QVqg2UZ1ZkiDqJ6O0d1S33/UxOdynzHXAgQhxpXQbRVBTqPqoBBuOqCBt62g0
         uV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752575779; x=1753180579;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RwJj2XW0Xtg7vWbGRjw0IzVQ1p4FfGBNG+AO9cOWVHY=;
        b=oKIodg4qLv6gmIh9HRdve3czj2BQvwJYvBc5APPMr7r0XKMl6LBg0vahG54uVHzW0K
         wP/LgoFlTZbhyVszIQFkkOW66/e++ALCFeUMRhiLVWdXOCKWFyz5xwl/GTyNzJEmayae
         XcdzstjLpEqKHUDblfyb0R8F7kIsOBVgJsHwg9QjYYzFKyRjCFVBM7AZGzlZ+6KAU/Fa
         lTdWLCvWWWzcBmNJr+MqYdt2dnemiOxNSVO5hsZ9uaj6vHvZWtpTKfZIeKDHYAQC4QTI
         AVibz1R/o3WcFWLgD4kapf6DSJr4750auyFv5o3J6ZFxjWUzIC2Ok4hVAnGFDv+RIbYs
         uURg==
X-Forwarded-Encrypted: i=1; AJvYcCW9NJeR0tl0Wm8jEfM/4kZ3tHjA0BTIvNKx2i5eKNl+bkg1eGqQ7MoLoVP/p9wA0NlkP8Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YxX0XKyN8NaWI7pjF9kc7J2Vl6+YbY3XvqFd9ZJPvF3iyate5dK
	eocXXSwrXiqRHXNO3GYxUu3N8MRACZTb4PAo40lXWbhX6FB06UcdzUng
X-Gm-Gg: ASbGncvoaCSW5GBvJ83Qp313hPb3/4fmaf6hiMvfDSxt1kwiptcuS7fjxkfxFtfrctw
	OHdYj2BurZDWr1zFJlS4XD+2JR38Lu5RdUYLAhGb5LuUsoKnGXmvL8WYjDLx/KAAY8i5q4H82P/
	ucGUFnaQX9CP9eM4Zmhc/ktxMl3VAydAzc9m+ZM+DtrLuaFNibmhUqsq7Z2kUk8vHuQ1hdIuG5l
	luA26Kq1A/85cioCxeeJ23VcBIpYNry5yuAP3A7HWDNESYdlNPafmpv7KSZ7KSsLXjYzMS53yDl
	bSQogPofew80pIRuHlvob/RQwueEGT3J+owxEhdWl6GLtl1FOvuIclIqJtcrcJ20OA1rsPxY9xl
	HlDIA8zssctsd53HMVzh0cIB8dq5wf/tBpVH5HCvmCIuDHg==
X-Google-Smtp-Source: AGHT+IGaK5G3wNkKd0FQXTFLEb3wcMNGQ8G+9vcipY4gHF5O0bM0XfRnvGt5TQBO6UmtOz1kGEnKVw==
X-Received: by 2002:a17:907:930c:b0:ae6:a8c1:c633 with SMTP id a640c23a62f3a-ae6fc1fae79mr1633481566b.34.1752575779007;
        Tue, 15 Jul 2025 03:36:19 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325::1ac? ([2620:10d:c092:600::1:a4c1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82dedd3sm976790966b.150.2025.07.15.03.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 03:36:18 -0700 (PDT)
Message-ID: <9bed2f6e-6251-4d0c-ad1e-f1b8625a0a10@gmail.com>
Date: Tue, 15 Jul 2025 11:37:45 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 02/12] netmem: use netmem_desc instead of
 page to access ->pp in __netmem_get_pp()
To: Mina Almasry <almasrymina@google.com>, Byungchul Park <byungchul@sk.com>
Cc: willy@infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, kernel_team@skhynix.com,
 ilias.apalodimas@linaro.org, harry.yoo@oracle.com,
 akpm@linux-foundation.org, andrew+netdev@lunn.ch, toke@redhat.com,
 david@redhat.com, Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, linux-rdma@vger.kernel.org,
 bpf@vger.kernel.org, vishal.moola@gmail.com, hannes@cmpxchg.org,
 ziy@nvidia.com, jackmanb@google.com, wei.fang@nxp.com, shenwei.wang@nxp.com,
 xiaoning.wang@nxp.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, anthony.l.nguyen@intel.com,
 przemyslaw.kitszel@intel.com, sgoutham@marvell.com, gakula@marvell.com,
 sbhatta@marvell.com, hkelam@marvell.com, bbhushan2@marvell.com,
 tariqt@nvidia.com, ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
 john.fastabend@gmail.com, sdf@fomichev.me, saeedm@nvidia.com,
 leon@kernel.org, mbloch@nvidia.com, danishanwar@ti.com, rogerq@kernel.org,
 nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com,
 shayne.chen@mediatek.com, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, aleksander.lobakin@intel.com,
 horms@kernel.org, m-malladi@ti.com, krzysztof.kozlowski@linaro.org,
 matthias.schiffer@ew.tq-group.com, robh@kernel.org, imx@lists.linux.dev,
 intel-wired-lan@lists.osuosl.org, linux-arm-kernel@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20250714120047.35901-1-byungchul@sk.com>
 <20250714120047.35901-3-byungchul@sk.com>
 <CAHS8izO393X_BDJxnX2d-auhTwrUZK5wYdoAh_tJc0GBf0AqcQ@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izO393X_BDJxnX2d-auhTwrUZK5wYdoAh_tJc0GBf0AqcQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/14/25 20:37, Mina Almasry wrote:
> On Mon, Jul 14, 2025 at 5:01 AM Byungchul Park <byungchul@sk.com> wrote:
...>> +static inline struct netmem_desc *pp_page_to_nmdesc(struct page *page)
>> +{
>> +       DEBUG_NET_WARN_ON_ONCE(!page_pool_page_is_pp(page));
>> +
>> +       /* XXX: How to extract netmem_desc from page must be changed,
>> +        * once netmem_desc no longer overlays on page and will be
>> +        * allocated through slab.
>> +        */
>> +       return (struct netmem_desc *)page;
>> +}
>> +
> 
> Same thing. Do not create a generic looking pp_page_to_nmdesc helper
> which does not check that the page is the correct type. The
> DEBUG_NET... is not good enough.
> 
> You don't need to add a generic helper here. There is only one call
> site. Open code this in the callsite. The one callsite is marked as
> unsafe, only called by code that knows that the netmem is specifically
> a pp page. Open code this in the unsafe callsite, instead of creating
> a generic looking unsafe helper and not even documenting it's unsafe.
> 
>>   /**
>>    * __netmem_get_pp - unsafely get pointer to the &page_pool backing @netmem
>>    * @netmem: netmem reference to get the pointer from
>> @@ -280,7 +291,7 @@ static inline struct net_iov *__netmem_clear_lsb(netmem_ref netmem)
>>    */
>>   static inline struct page_pool *__netmem_get_pp(netmem_ref netmem)
>>   {
>> -       return __netmem_to_page(netmem)->pp;
>> +       return pp_page_to_nmdesc(__netmem_to_page(netmem))->pp;
>>   }
> 
> This makes me very sad. Casting from netmem -> page -> nmdesc...

The function is not used, and I don't think the series adds any
new users? It can be killed then. It's a horrible function anyway,
would be much better to have a variant taking struct page * if
necessary.

> Instead, we should be able to go from netmem directly to nmdesc. I
> would suggest rename __netmem_clear_lsb to netmem_to_nmdesc and have
> it return netmem_desc instead of net_iov. Then use it here.

Glad you liked the diff I suggested :) In either case, seems
like it's not strictly necessary for this iteration as
__netmem_get_pp() should be killed, and the rest of patches work
directly with pages.

  
> We could have an unsafe version of netmem_to_nmdesc which converts the
> netmem to netmem_desc without clearing the lsb and mark it unsafe.
> 

-- 
Pavel Begunkov

