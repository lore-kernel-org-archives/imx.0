Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5F3287240
	for <imx@lists.linux.dev>; Tue, 15 Jul 2025 19:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752606412; cv=none; b=LemOMGUhBveLSsxhg0tSex8HemHgeoMCrXK6G0UylYLlPh9Upl/zb0xQxC6sE06wpx1H0WFPVSyGT+L4bbfJeNRRmATR/CqOdvAD+So5lI/5sjelyxA7irY0i5pv1WVfFpwHg5bXf2eTpUa+PJECBt5hTp23hEsFZ4++GiARp0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752606412; c=relaxed/simple;
	bh=sN4QN3SKsFD89oM64C8vf3kZbJolgxRcrqdfdWWS2SU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EX2f0uKBalyVsnpOSuP4Z5w0uJGFeUFW/TF67EprJ6KSIjfAAxq2Sv7+SgXwuocgAvO9UbpRLJgZfEh1/JokbtKmyWhCLrtpPGPKmaQIG4u3t/SNhpsWNFCdPf8zvQywhu5rHMtmJP+yxjRQJwHHGjt4ScS9LOckB8MQxorR/4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0ol4NV7t; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0ol4NV7t"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-237f18108d2so46195ad.0
        for <imx@lists.linux.dev>; Tue, 15 Jul 2025 12:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752606410; x=1753211210; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzQixld7pSKyZ/Q/HfBpbSkDP1wbVsZogbStCOaFhmk=;
        b=0ol4NV7tUUh+UuL4Z5nGGEyk24Tt6nMccsRZoMpWC4exOttuW0d8yxLo5hHzX0x1Sa
         Whl7He5puhodCuS2SFLPfJKNZBMGTuP9T7bnp3opmewmFBx9zkuHWuartYzMknEi1OLF
         GDxlc4amFq0u5R5OkEYwxjWl8c5Js2woC73UBzLhcDjIrFgK/zy5G0ut38fAUJsiFYH1
         KzZbl7BXLB4A/oXL9pomAkIZDZCc78rJ2wrKWAzvZJBXaEjWCbxknqeaFsHFAqFsdbcl
         zCDG5ZddBEO38ifWWMuRRx5E1BE5rE5XQ41IMjqcETFbEIjFjAygNGJj4PXMbENvLrjI
         o+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752606410; x=1753211210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YzQixld7pSKyZ/Q/HfBpbSkDP1wbVsZogbStCOaFhmk=;
        b=Ayv/tGsIn01AxlE8Io3h2qd823rgiSYGIzu8SjEdjFdpMj8xmv02Cdc1uatqCljgHa
         GfahYDa1qTKzekjnOJyQxOrfDO4jcsxfqT3vgiHPg2alcIRMxKtVmGq48LNcRWHcoSAn
         NzPyPteY8mOPSKEKzsp6LkqXBVnOSixgq4eM2ir3T/eBP4KcE1XaLV8Tm1h0cJdo3U81
         fy6J+Z81Jel4Q05EkbGSk2DhEr088oW211H5Qm4nfV8C1WJAW5OsyfTT6XadoemaUGAi
         qFW8SZzGXCiYd9pdnFD7Djovoi1xzeWpbgILKGzl+MKvehvLSQuSV6NamJGIE6y7NkiF
         liVQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6rJr1Dk7IcoN88PkqV1FSpAq4plA033eoOFYMX43itQL1onKuVbZZ5xXfyBSfIJeYRrs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5EIQrq3gTHipnxe88mtbysZKg7GJk8j38NqHo7KNNgnXHSnFM
	uJ49pyuZl/M7/TOdrYuKtjNY6516MqEHBWIkDv4R7V405ZgLea5R96WtILtjDxXw+edi0qXksng
	oO+CRO9mDTq8xfFPv7ucek3/gWA2lA6MuG5GKMHbW
X-Gm-Gg: ASbGncuuYLXdvQ07ktNKrxuLsJ3kV0KC/zz2u+XwBK/ZsEDfXIJ4wzCDtY6cqVhrvP6
	qOSThCAryfo7X8xfkrrYRoBqfElkr26hMz9u2lsAhipK+F1pVFm/GTKyJjdtELrXSSjx+SiDFyr
	7+fsMPygbBKnNa/5wJkNkCXq1eBDME4Lg6Ws3ddKvLL4RCbUNZCyThhaLp4pRgKvUSXPcrA20lM
	/drKYTQg126KwLXMjxU9vkuNTe0ytpdpkNSaA==
X-Google-Smtp-Source: AGHT+IERW8BNAcLICEi0xDHHwbh6I9mZCyIk3Mt306+jQnPwqHCieheEaqBVCmnvb9hqZyStUnuqxe9DuyWkdC9x3QM=
X-Received: by 2002:a17:902:cec3:b0:235:f298:cbbb with SMTP id
 d9443c01a7336-23e24c6e119mr315625ad.26.1752606409905; Tue, 15 Jul 2025
 12:06:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714120047.35901-1-byungchul@sk.com> <20250714120047.35901-3-byungchul@sk.com>
 <CAHS8izO393X_BDJxnX2d-auhTwrUZK5wYdoAh_tJc0GBf0AqcQ@mail.gmail.com> <9bed2f6e-6251-4d0c-ad1e-f1b8625a0a10@gmail.com>
In-Reply-To: <9bed2f6e-6251-4d0c-ad1e-f1b8625a0a10@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 15 Jul 2025 12:06:36 -0700
X-Gm-Features: Ac12FXwyUUoU8xGdECWjpzai5Qr9bPwFw8HDcAUKWZbO5pnAVYeauYEt5y8_8Qs
Message-ID: <CAHS8izMYLw3JfonoQ7n4ZaWivdBVKqZejgyRiAku5j1rx7gBPQ@mail.gmail.com>
Subject: Re: [PATCH net-next v10 02/12] netmem: use netmem_desc instead of
 page to access ->pp in __netmem_get_pp()
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: Byungchul Park <byungchul@sk.com>, willy@infradead.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, kernel_team@skhynix.com, 
	ilias.apalodimas@linaro.org, harry.yoo@oracle.com, akpm@linux-foundation.org, 
	andrew+netdev@lunn.ch, toke@redhat.com, david@redhat.com, 
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

On Tue, Jul 15, 2025 at 3:36=E2=80=AFAM Pavel Begunkov <asml.silence@gmail.=
com> wrote:
>
> On 7/14/25 20:37, Mina Almasry wrote:
> > On Mon, Jul 14, 2025 at 5:01=E2=80=AFAM Byungchul Park <byungchul@sk.co=
m> wrote:
> ...>> +static inline struct netmem_desc *pp_page_to_nmdesc(struct page *p=
age)
> >> +{
> >> +       DEBUG_NET_WARN_ON_ONCE(!page_pool_page_is_pp(page));
> >> +
> >> +       /* XXX: How to extract netmem_desc from page must be changed,
> >> +        * once netmem_desc no longer overlays on page and will be
> >> +        * allocated through slab.
> >> +        */
> >> +       return (struct netmem_desc *)page;
> >> +}
> >> +
> >
> > Same thing. Do not create a generic looking pp_page_to_nmdesc helper
> > which does not check that the page is the correct type. The
> > DEBUG_NET... is not good enough.
> >
> > You don't need to add a generic helper here. There is only one call
> > site. Open code this in the callsite. The one callsite is marked as
> > unsafe, only called by code that knows that the netmem is specifically
> > a pp page. Open code this in the unsafe callsite, instead of creating
> > a generic looking unsafe helper and not even documenting it's unsafe.
> >
> >>   /**
> >>    * __netmem_get_pp - unsafely get pointer to the &page_pool backing =
@netmem
> >>    * @netmem: netmem reference to get the pointer from
> >> @@ -280,7 +291,7 @@ static inline struct net_iov *__netmem_clear_lsb(n=
etmem_ref netmem)
> >>    */
> >>   static inline struct page_pool *__netmem_get_pp(netmem_ref netmem)
> >>   {
> >> -       return __netmem_to_page(netmem)->pp;
> >> +       return pp_page_to_nmdesc(__netmem_to_page(netmem))->pp;
> >>   }
> >
> > This makes me very sad. Casting from netmem -> page -> nmdesc...
>
> The function is not used, and I don't think the series adds any
> new users? It can be killed then. It's a horrible function anyway,
> would be much better to have a variant taking struct page * if
> necessary.
>
> > Instead, we should be able to go from netmem directly to nmdesc. I
> > would suggest rename __netmem_clear_lsb to netmem_to_nmdesc and have
> > it return netmem_desc instead of net_iov. Then use it here.
>
> Glad you liked the diff I suggested :) In either case, seems
> like it's not strictly necessary for this iteration as
> __netmem_get_pp() should be killed, and the rest of patches work
> directly with pages.

Good catch, in that case lets just delete __netmem_get_pp and there is
no need to add a netmem_nmdesc unless we find some other call site
that needs it.

--=20
Thanks,
Mina
