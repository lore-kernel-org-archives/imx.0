Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AABD1FE451
	for <imx@lists.linux.dev>; Mon, 14 Jul 2025 19:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752521884; cv=none; b=B8s34EJjGCEHQ8XceD4jVWJHTk+8NqwgOVgMhd3LRxsKw/2b2fnNfJvMJSafm8xkMnLK+kBM07mIn9NT2OKcp6/Rvbgx3q71jIVTD6Bk27wDTmK2dx8x6P/NMENWLVflt4ZmSZ1WtvksL50Q3cHZkSFpdID3txdYQC9AOElTQX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752521884; c=relaxed/simple;
	bh=RuizpW+k5+vTtumJYCWKYy5gPaN3AKaoyO7UTkvu0eY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GlWX7q4o6JwCf6B4nAHLWjSrTzv/nnSZsza6LbOTRzG/1Lyiu1PHmo4vIZOAYWrSqZrEK9qGILohoLaeJtqQPJhE1FPlFYrd/QPKJ7pjoLYwUZYsSDgnQKCfV44HhgkA/GnWz9O7b7XqVK0oYz2MNKX6w3vYfpXf5WJmrDHRvO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lpmx70LX; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lpmx70LX"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2357c61cda7so2575ad.1
        for <imx@lists.linux.dev>; Mon, 14 Jul 2025 12:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752521882; x=1753126682; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yry2upj+ByeYrrNjZKRJ8sVD88C6f2FVJf/Y5Atdgbc=;
        b=Lpmx70LXWRdUaM29H7YBOE0GIVjRl9ByWaVJBGOLrAzSDbA5fFqFviIBov29lOcvcl
         OFqZK9sTgIoRE6aa3MJ08eLNXUD/px22Jd+H22edQAxQrkbFOHhQvpn/7NZppb57JVAC
         6k/Vn1rNItA3v4YABOvVKqBpF8iEtcmdJzsisjOSFGes7REF9emVprbXAghYkt/lWDC2
         75y8uylutY+yVW5TFJrD4UrfmfiXGwynPeNfetuZzGlCag7Q4D0f6LZhORrLQfyUf7i3
         XBkr9DA5wsr1UVXXPKFQh64xj/j2JoTjFbN7CoCGqsU0VuYhhArR5kxvBLoqF3Ex7BAh
         xSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752521882; x=1753126682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yry2upj+ByeYrrNjZKRJ8sVD88C6f2FVJf/Y5Atdgbc=;
        b=AESdRb7QcFe5zc/oh/nD0ZsoVTx4kPSAODZQpdRYrqJijIm08OmU/rlIsd3m7GP2iK
         jxf6J/b/XjpmxKfbhPNkOndfyMaj0oIcLqLhwZAFBL7GbbslnMYos2yDCZTgXt9yP7+g
         /IiPMu0sw1Uj8ROB7zgU5cQ7j2XAP0p8q/tcAP1TIRA95SrgY9DVTthIJySxM2BJBOKq
         20OUqe9gmbfileLSz0P/OmrJ6vuWowzxV4LKLxd69PI2owmQWszoVQq/c7S2AdAraIn/
         jhMyzFtqh4RU6MPQ++slnbeoukfCv4sBMecvAy1wrjkPuQkqpactpEXojgJ6iMa7ve47
         7fow==
X-Forwarded-Encrypted: i=1; AJvYcCWaNKMzSzpVucSdhmqjiTgECjSS7fsQlzRBfIFPDA9CrxdHcYf1qSvjJoKGbjp8rT8++7w=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCy67tlOef4DyI7UyW1tsv0wLuAkSrAGNqkRuv1N2+31/LiEP2
	HnscNzzEsXCb7o9oI8zZJBbsxR8oCJVODlvEiKYifiAbpDMlMy4V43oMzGUhMzyULNsHX+V86O/
	H4gVtdFxSsF4c506CE+5xhojwuWGe7oX08Cb3tLZ1
X-Gm-Gg: ASbGncsuGPS8Lw6N/WbBUhKZJ4sBXTrKAz0FiAM0g9h9ET00fKrb79cucRBDcc7dhsS
	9g5dBIvd1dvxC7H0UNxpChFTZHQjX8bsMH6p9GF8UOFHpB3Lr5vPPIsC8kB8UP5eQctaVxuKPvM
	zVmF9iUlie+XKs+JJelTNOc0xw/dOPvEAZV3GOCj+Im8z0CoaVk/iYyhpmkQx/xRRsVBXHTEyeM
	VhA6Lk8nzIYT2+x6laRK4RXI8D4qhx3GRJ4/g==
X-Google-Smtp-Source: AGHT+IHZoWQ8pLUOjiCQlGlcYIPNmYT9TX3giO0kqF0O3T+xtLnHFh+M02Pq+s3+TLFDvQ9elFBdwtzpJc9HYJVxyEM=
X-Received: by 2002:a17:903:2484:b0:234:b2bf:e67e with SMTP id
 d9443c01a7336-23e1ac4613fmr298445ad.13.1752521881303; Mon, 14 Jul 2025
 12:38:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714120047.35901-1-byungchul@sk.com> <20250714120047.35901-3-byungchul@sk.com>
In-Reply-To: <20250714120047.35901-3-byungchul@sk.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 14 Jul 2025 12:37:48 -0700
X-Gm-Features: Ac12FXwrdXtLbiJlmPY9vk8GjB7CqgoZsH_hsU8OuZVjZ5CbRybhtkUh-Kkp2jg
Message-ID: <CAHS8izO393X_BDJxnX2d-auhTwrUZK5wYdoAh_tJc0GBf0AqcQ@mail.gmail.com>
Subject: Re: [PATCH net-next v10 02/12] netmem: use netmem_desc instead of
 page to access ->pp in __netmem_get_pp()
To: Byungchul Park <byungchul@sk.com>
Cc: willy@infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kernel_team@skhynix.com, ilias.apalodimas@linaro.org, 
	harry.yoo@oracle.com, akpm@linux-foundation.org, andrew+netdev@lunn.ch, 
	asml.silence@gmail.com, toke@redhat.com, david@redhat.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, linux-rdma@vger.kernel.org, bpf@vger.kernel.org, 
	vishal.moola@gmail.com, hannes@cmpxchg.org, ziy@nvidia.com, 
	jackmanb@google.com, wei.fang@nxp.com, shenwei.wang@nxp.com, 
	xiaoning.wang@nxp.com, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, anthony.l.nguyen@intel.com, 
	przemyslaw.kitszel@intel.com, sgoutham@marvell.com, gakula@marvell.com, 
	sbhatta@marvell.com, hkelam@marvell.com, bbhushan2@marvell.com, 
	tariqt@nvidia.com, ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org, 
	john.fastabend@gmail.com, sdf@fomichev.me, saeedm@nvidia.com, leon@kernel.org, 
	mbloch@nvidia.com, danishanwar@ti.com, rogerq@kernel.org, nbd@nbd.name, 
	lorenzo@kernel.org, ryder.lee@mediatek.com, shayne.chen@mediatek.com, 
	sean.wang@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, aleksander.lobakin@intel.com, 
	horms@kernel.org, m-malladi@ti.com, krzysztof.kozlowski@linaro.org, 
	matthias.schiffer@ew.tq-group.com, robh@kernel.org, imx@lists.linux.dev, 
	intel-wired-lan@lists.osuosl.org, linux-arm-kernel@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 5:01=E2=80=AFAM Byungchul Park <byungchul@sk.com> w=
rote:
>
> To eliminate the use of the page pool fields in struct page, the page
> pool code should use netmem descriptor and APIs instead.
>
> However, __netmem_get_pp() still accesses ->pp via struct page.  So
> change it to use struct netmem_desc instead, since ->pp no longer will
> be available in struct page.
>
> While at it, add a helper, pp_page_to_nmdesc(), that can be used to
> extract netmem_desc from page only if it's pp page.  For now that
> netmem_desc overlays on page, it can be achieved by just casting.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>
> ---
>  include/net/netmem.h | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/include/net/netmem.h b/include/net/netmem.h
> index 535cf17b9134..2b8a7b51ac99 100644
> --- a/include/net/netmem.h
> +++ b/include/net/netmem.h
> @@ -267,6 +267,17 @@ static inline struct net_iov *__netmem_clear_lsb(net=
mem_ref netmem)
>         return (struct net_iov *)((__force unsigned long)netmem & ~NET_IO=
V);
>  }
>
> +static inline struct netmem_desc *pp_page_to_nmdesc(struct page *page)
> +{
> +       DEBUG_NET_WARN_ON_ONCE(!page_pool_page_is_pp(page));
> +
> +       /* XXX: How to extract netmem_desc from page must be changed,
> +        * once netmem_desc no longer overlays on page and will be
> +        * allocated through slab.
> +        */
> +       return (struct netmem_desc *)page;
> +}
> +

Same thing. Do not create a generic looking pp_page_to_nmdesc helper
which does not check that the page is the correct type. The
DEBUG_NET... is not good enough.

You don't need to add a generic helper here. There is only one call
site. Open code this in the callsite. The one callsite is marked as
unsafe, only called by code that knows that the netmem is specifically
a pp page. Open code this in the unsafe callsite, instead of creating
a generic looking unsafe helper and not even documenting it's unsafe.

>  /**
>   * __netmem_get_pp - unsafely get pointer to the &page_pool backing @net=
mem
>   * @netmem: netmem reference to get the pointer from
> @@ -280,7 +291,7 @@ static inline struct net_iov *__netmem_clear_lsb(netm=
em_ref netmem)
>   */
>  static inline struct page_pool *__netmem_get_pp(netmem_ref netmem)
>  {
> -       return __netmem_to_page(netmem)->pp;
> +       return pp_page_to_nmdesc(__netmem_to_page(netmem))->pp;
>  }

This makes me very sad. Casting from netmem -> page -> nmdesc...

Instead, we should be able to go from netmem directly to nmdesc. I
would suggest rename __netmem_clear_lsb to netmem_to_nmdesc and have
it return netmem_desc instead of net_iov. Then use it here.

We could have an unsafe version of netmem_to_nmdesc which converts the
netmem to netmem_desc without clearing the lsb and mark it unsafe.

--=20
Thanks,
Mina
