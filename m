Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C7B17D346
	for <imx@lists.linux.dev>; Mon, 30 Sep 2024 08:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727683790; cv=none; b=Erf7pHYIKQfTEnKH3XdPWwNuUI7N2G0QmE9mscXVXVk4ip6tbDUIkip+Ds4bPLcYjxEIxChlvlvcz61px3nyRaz6cVjQoH//D+nbqA8XwQ/ZIFkVNyNPp/2z4WnsfiXqhR2NQXD6BtmfaYDO96/EHRGTwDP+HvpvhYKnVBxmK1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727683790; c=relaxed/simple;
	bh=Xx414iMLuxALXKs+wO5vcFTmabes1w6H5Py+TNbMyPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qJ9Vd96RjmotMqvvimNO9Y8zyHmUpGmKGtB3l3SN7eIkw/fQNWE/aUVca+DBFbdeAq5Yv/utWUI10ZB2Ev3hgh0XgbD2g6TMwv5PCY0sPuGqTHCr6gdlya3AqgCYKnjz/33vZbrAYWh00n9XCUirVw8S/g2l7CGb5djkzi7RUT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t0wbgvhk; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t0wbgvhk"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20b0b2528d8so44438795ad.2
        for <imx@lists.linux.dev>; Mon, 30 Sep 2024 01:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727683788; x=1728288588; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xx414iMLuxALXKs+wO5vcFTmabes1w6H5Py+TNbMyPA=;
        b=t0wbgvhkhJoWHdLVP42zqIlKXchFVOpoVKtlevjLunRT/GLV5YkfllASjus8ncF9sU
         nx8rJVAJ9BICNPmMdIJ7SYNuP6XnCO2nELDqcjfq/u/fTqN1YY1ZCDWseH4EBlxCDlld
         TlC/zVXyh70sHUu+ArfFYFSBr3Fx4puvRh3X9YKkEEyjrr/uCWpAo5/eD+6ILHVZn79t
         ufe/GRNYvcn3/lSU8CFpDTTIpjbramzcmhBD1qsyAgr3uADig/se/4XOeyh6G1Bs0ZX4
         0gZH52TyHkUhC7qY8383dHqYVQOVVRJpTA6IxIbmcTNURYH63QHrePTG10R25QroOVRm
         38eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727683788; x=1728288588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xx414iMLuxALXKs+wO5vcFTmabes1w6H5Py+TNbMyPA=;
        b=PWYIZK4sA97Ioug4GUZxl9QUyJvnXIXmto51+dY8GH9KqGSYEhjB0ZgYk9OYiKztM9
         D2s/DQU9yuKNpEAXCwuUBgGhilfSYKXQgOFxaCKr4rxvv5+cElCV/qWbjcfFH+Ieu9kg
         46YVCvW4jyIC+jGpazV+CQ9uhSZBMxeJXJDGXQaBJlHKGwemnYDtmbNTTwiqR/u88N72
         UJn4yrzd/1MPXChNp8ThYZ4/n86ZoZ47l4JsRTD5zTnQST2JVPTAg+j4OQWn39pm2f2S
         9uoGviTTEFMHDyXFEBPyOzNMoyncByHP9X463vmKPxStEE5HFqKzGuSRoBhIIkXrb6tH
         yVVA==
X-Forwarded-Encrypted: i=1; AJvYcCWKkUY5bKla7W7ChIBWqrjKv3+a8PIzvtWPT1SzxZAWekDwYCa6Tt9rRWLmJA6xw4PkCxo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfgTiC9c3bLQQU6/6oEvlJpyBsTatPmQQmRLAiRq8z37EYO8/V
	w5MAJSf6YZROcAKbeC7ukhLe/yJWpaaF+/3fQyo7cI+kJ8J/But0A49/JUG91ECM6yvaaRKeMrY
	Dv/fuZjlmVORHOs5E21ISxa40os45tOiN6EP3ZA==
X-Google-Smtp-Source: AGHT+IHL79vWrV1UbQW2i+UC3FcnuUEn4RoHxDXgrgsEhFXFX4vbKat3GD+mMJkdcENWj5dVp6Y7ppyyQzgjgk1yEE8=
X-Received: by 2002:a17:902:ce91:b0:20b:6d8c:461 with SMTP id
 d9443c01a7336-20b6d8c0791mr75062715ad.5.1727683788157; Mon, 30 Sep 2024
 01:09:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925075707.3970187-1-linyunsheng@huawei.com>
 <20240925075707.3970187-3-linyunsheng@huawei.com> <CAHS8izOxugzWJDTc-4CWqaKABTj=J4OHs=Lcb=SE9r8gX0J+yg@mail.gmail.com>
 <842c8cc6-f716-437a-bc98-70bc26d6fd38@huawei.com> <CAC_iWjLgNOtsbhqrhvvEz2C3S668qB8KatL_W+tPHMSkDrNS=w@mail.gmail.com>
 <0ef315df-e8e9-41e8-9ba8-dcb69492c616@huawei.com> <CAC_iWjKeajwn3otjdEekE6VDLHGEvqmnQRwpN5R3yHj8UpEiDw@mail.gmail.com>
 <934d601f-be43-4e04-b126-dc86890a4bfa@huawei.com> <CAC_iWjL7m4ZL2W2OZM5F22dLvZhxU6fyCXV_xjyGf+W7UP43EQ@mail.gmail.com>
 <ac2eec69-8f44-4adb-8182-02c78625851d@huawei.com>
In-Reply-To: <ac2eec69-8f44-4adb-8182-02c78625851d@huawei.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Mon, 30 Sep 2024 11:09:11 +0300
Message-ID: <CAC_iWj+Shb6buVf+wZaWe-NZ+UVxmW9DYqsTiL27U+V_Ko_65w@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] page_pool: fix IOMMU crash when driver has
 already unbound
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: Mina Almasry <almasrymina@google.com>, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, liuyonglong@huawei.com, fanghaiqing@huawei.com, 
	zhangkun09@huawei.com, Robin Murphy <robin.murphy@arm.com>, 
	Alexander Duyck <alexander.duyck@gmail.com>, IOMMU <iommu@lists.linux.dev>, 
	Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Clark Wang <xiaoning.wang@nxp.com>, Eric Dumazet <edumazet@google.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andrew Morton <akpm@linux-foundation.org>, imx@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	bpf@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 29 Sept 2024 at 05:44, Yunsheng Lin <linyunsheng@huawei.com> wrote:
>
> On 2024/9/28 15:34, Ilias Apalodimas wrote:
>
> ...
>
> >
> > Yes, that wasn't very clear indeed, apologies for any confusion. I was
> > trying to ask on a linked list that only lives in struct page_pool.
> > But I now realize this was a bad idea since the lookup would be way
> > slower.
> >
> >> If I understand question correctly, the single/doubly linked list
> >> is more costly than array as the page_pool case as my understanding.
> >>
> >> For single linked list, it doesn't allow deleting a specific entry but
> >> only support deleting the first entry and all the entries. It does support
> >> lockless operation using llist, but have limitation as below:
> >> https://elixir.bootlin.com/linux/v6.7-rc8/source/include/linux/llist.h#L13
> >>
> >> For doubly linked list, it needs two pointer to support deleting a specific
> >> entry and it does not support lockless operation.
> >
> > I didn't look at the patch too carefully at first. Looking a bit
> > closer now, the array is indeed better, since the lookup is faster.
> > You just need the stored index in struct page to find the page we need
> > to unmap. Do you remember if we can reduce the atomic pp_ref_count to
> > 32bits? If so we can reuse that space for the index. Looking at it
>
> For 64 bits system, yes, we can reuse that.
> But for 32 bits system, we may have only 16 bits for each of them, and it
> seems that there is no atomic operation for variable that is less than 32
> bits.
>
> > requires a bit more work in netmem, but that's mostly swapping all the
> > atomic64 calls to atomic ones.
> >
> >>
> >> For pool->items, as the alloc side is protected by NAPI context, and the
> >> free side use item->pp_idx to ensure there is only one producer for each
> >> item, which means for each item in pool->items, there is only one consumer
> >> and one producer, which seems much like the case when the page is not
> >> recyclable in __page_pool_put_page, we don't need a lock protection when
> >> calling page_pool_return_page(), the 'struct page' is also one consumer
> >> and one producer as the pool->items[item->pp_idx] does:
> >> https://elixir.bootlin.com/linux/v6.7-rc8/source/net/core/page_pool.c#L645
> >>
> >> We only need a lock protection when page_pool_destroy() is called to
> >> check if there is inflight page to be unmapped as a consumer, and the
> >> __page_pool_put_page() may also called to unmapped the inflight page as
> >> another consumer,
> >
> > Thanks for the explanation. On the locking side, page_pool_destroy is
> > called once from the driver and then it's either the workqueue for
> > inflight packets or an SKB that got freed and tried to recycle right?
> > But do we still need to do all the unmapping etc from the delayed
> > work? Since the new function will unmap all packets in
> > page_pool_destroy, we can just skip unmapping when the delayed work
> > runs
>
> Yes, the pool->dma_map is clear in page_pool_item_uninit() after it does
> the unmapping for all inflight pages with the protection of pool->destroy_lock,
> so that the unmapping is skipped in page_pool_return_page() when those inflight
> pages are returned back to page_pool.

Ah yes, the entire destruction path is protected which seems correct.
Instead of that WARN_ONCE in page_pool_item_uninit() can we instead
check the number of inflight packets vs what we just unmapped? IOW
check 'mask' against what page_pool_inflight() gives you and warn if
those aren't equal.


Thanks
/Ilias
>
> >
