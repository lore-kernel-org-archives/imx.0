Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793987601;
	b=cTVXQdXO886saHrnR2/tnR0L6n7LqTcyptRy1AtD6/YENm45YDSOEgpvNInV9SU6cZmw
	 rADeZDccpJYUG6N4CqkZ8Ytbm3bGFvteGROAJsGdYAm6+y4+hSsE8tfDVpEhvoNY3dr1r
	 amtqN8RlhoyS0jpyIDqo6YP7TL/KdPsBZ44AHxK6XqctLI7WtUV2qdmz5OrIInyuBCgw5
	 A9yQfdm2WM1K2FMMkBp3odlCbwV6v1teKOqn52w72D4bBrrRT20/SE6rEL7R+cLXrV49g
	 BiE8CbN5WxrSzXQDX84kSHzwIilch2niXWY/RCsIWvJTeUymGQWSgJLMw6gySQZc9dQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5pDupBwR2/7t1JImpr59IJwI8nCk2i1PzTMP7JDf060=;
	b=EApHRIZ3U2j/vojcogVTw4u+fTKAIeMrkkLXyAyxQOQPsTJr/6zpVByfnEqYlr0fAYJM
	 /PwY34eeTIUbaOaCoRK8f2k/XNt0TZVmRBgWYfshHurvzMIZ6H2buj59PpdZU0QOxt5iZ
	 0Y5GHrX3x0+RkpCUhqmbk/MwOX0/k1vRI6oV5ewTmJuTNkWMiDGSi0EDzbhF3G/gYIuFa
	 uzwbtonXBQQrBtQGOCIEmcXGKdKPnvSqD4spUWL+Tz3z9Iwn58Cft42S0iIpdxP44OzjX
	 xQ5Cxg5xB7KcrSUV8bYhA0O0l6Ih4zodsIEzaHuZRy3dvi11pDg8/9GcumLNy38vKUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Th9hIdKD;
	arc=fail smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89575606A333
	for <imx@lists.linux.dev>; Fri,  6 Nov 2026 17:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89575606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Th9hIdKD
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b6966d9508so800a12.1
        for <imx@lists.linux.dev>; Fri, 06 Nov 2026 09:53:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793987599; cv=none;
        d=google.com; s=arc-20260327;
        b=WmwoEzU4XVVCheTZVh/uNJLyI02RnmkLfiDctJ9TXrmJip8ScsZjzqpb97BydkEumV
         gtWrE2u8vcECCji+wz83kYRwK0nr2zjMVcOy2Jn3VHFhNzy5lCG3iu9pyTFccR2vby7i
         eJac7uE5PQlkaOLwPFmEuUDWFrsRq40f12bEy3hnTW1Rjk2xvFNAJIkVedhhxAGkYTQf
         oFO9Fu+snMocotBPKB4qZX12+/MV6gMgBM5OMu3srs6zRhWg+Wo8UbA+QoED1nn547jL
         5lO9ls6YSdDa7KgihfqsRCnse9LCxx48Q5oNx3GX1kjCiRK0ATKNYqvS2EX/P2eEKkAH
         YOWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5pDupBwR2/7t1JImpr59IJwI8nCk2i1PzTMP7JDf060=;
        fh=nczKg21EhbjDnbszPgcmTU4I3qpO1tGjLt8+GvcuQ/A=;
        b=bGKXqs9+WMX5r9MJ2sUDbgeTc8y+O3NoMYBrxKOsi4T9uMoBh6zTd1cXN03/XuCkcX
         16mNaJvzq38fj9BqM94TOoJJr7Wc3RwwnD7GCtqPuriQMBJ6EGQlkXnfQHh/olzOus17
         FipA955BirFXJyIl113WRw+PgSgyO4wMMUXrUiMT8bMHgG1JA9lAvA9xx8Q2wdqN91wg
         vY5J8lYDl1QL4dGdBbg6lqjo8aOa5HHPhVHwkcMGGEnLAWr39MjpBuZzafGN+1OwDq/5
         m+VuvheggOvazuG4uK4dJSkmlbmdpe+bMeO9C3kgD9Zq3hKrIVMjYXSM5Wpzh3rL1MEp
         +AnA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793987599; x=1794592399; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5pDupBwR2/7t1JImpr59IJwI8nCk2i1PzTMP7JDf060=;
        b=Th9hIdKD+Pr+y2Leqf7USTebRE0FOTbhOHirWteGBscPnxhLlBfUzX+7zlHGi8fXbd
         0ep0SzZdSnuI+ACIiivcL2Efujs8z4MyJqLG78mCg/GX2HT4cR89G77MEZNtfDWy1Wqn
         1ntwJ7FMEn191DrfAm/KH1Qm1CTNoCqhO51mVhGzO1++h9nCjIxYwJypxl/W1R6Wn5Qx
         ULSz22e9FU0Nn/oxxHJTV1Eyzsv6Cau38h4FnZnGcYwwsu4OnufAEo0ieWfhyPdrEdgU
         gi+a7i5TfDjG+rWyuepnRwiavIdTJ2LvCUSEOB74KogL+DvALYRHWl5v/ZeuynEP+hHT
         XJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987599; x=1794592399;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5pDupBwR2/7t1JImpr59IJwI8nCk2i1PzTMP7JDf060=;
        b=QeByOLGlU7M0e9RjRSEOD83JIbQxlRj1pYllWFdWFQpv06jEqpoLlYevp44Ad5VBa6
         Xa7S9AX5+ifaUwZxtxLvazo5tyAtL7inEXXPaJCLu/uH/WOG8PsG1KoEBp2hi6TSaYI3
         We2VeJLKtj0y3GCm9iX0jW6apfUk7pgrDod9DOGuxyBnRdgQ5A/HTtmCxKiz41AdVARX
         tlitrs1sGk8tpl4xxO8l70i0hivkKhJY5vlmRfysQZy8QO4aDV2MMGGHo44xAutIgydx
         4F0ZbIAoSqUj8Bj4eNxXF1Cuwx8A17cKKr6uwU/TNSaz/yYSycR/YOc9EeGXT+1i5WKV
         mbDw==
X-Forwarded-Encrypted: i=1; AL+hErGzaRzi6eRSv6K1jxWW1lqHAk1NXYgqzkXL5pUwFnb05+b1dbED89jXkxt/5VqijvcvycY=@lists.linux.dev
X-Gm-Message-State: APuU4Z8U4Xn7K+UYXRcIm7mCnL49VN7s54Xc6LDLp58ksUbvdfAt6HXL
	7L9b29YeaeDzcoeYp2wYSbUwS0M4cuHiGJapihA8TKs/UQb2+49YtVkVwSUHSp9q058qrq+Zhpx
	xaGW+nWY4fH55i9LwZZShU60IyW+ILSOMhku2waqD
X-Gm-Gg: AYBFou2BixAEDX2qNq6NZa4VVO/rJ0Jt1L4duY69AKHnNt5X/+bDp9kSIKXTa3rWm6I
	1pCN/ykRoxnPOosFGVH/iDjF0wdg5dNZmbKEFoI8GKnrXrqEIhYitsawRJoMjOYsPOaDuP0HIM9
	wicPZlhAc+WPxtADTKQBQSNtLGak0sahYlrcvlTGMZR5DlDsX01pUpYoQLAbQN0/+gk7DGBH2u/
	fhwl+Ms7s6IQAr3p/VvdsqBRUwY5szWXt8mzBY8rEOGpS0rKXv8tjlxCb2WM7uIQwFiVCfaLcNm
	g0OeeyK9T+Nm9L6Or+QY5eXoE/4Z5wPzCbWDnfOM+KtcarEUlp4H6s3fWL0l3vIAmREDFMZS4BW
	UjrAImKvuexjdch8s/XxkRyRpsL6usftPGnUwYM4LiuGMi9xH57AIXoKMyi8RjF+sDiI=
X-Received: by 2002:a05:6402:20d2:10b0:6af:97c0:ce51 with SMTP id
 4fb4d7f45d1cf-6b6f84514ccmr6722a12.13.1793987598073; Fri, 06 Nov 2026
 09:53:18 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103211424.127627-1-almasrymina@google.com> <cf2e3292-d591-42a4-bf6e-76f4567604c6@kernel.org>
In-Reply-To: <cf2e3292-d591-42a4-bf6e-76f4567604c6@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 6 Nov 2026 09:53:06 -0800
X-Gm-Features: AclHuK9NbTvBEPfZwCm6iqd7sXh-jqNYXp8FMPv7QJO9bGGBVmf4WllHJrUhzyo
Message-ID: <CAHS8izO7QmD1qp=QfUsCq-R+p7OuOVUtqPJZh1k+u7H1J3KnoQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 0/5] net: deprecate skb->pp_recycle and skb_mark_for_recycle()
To: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-doc@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, imx@lists.linux.dev, 
	linux-rdma@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-omap@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Willem de Bruijn <willemb@google.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Pavel Begunkov <asml.silence@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Johannes Berg <johannes@sipsolutions.net>, 
	Byungchul Park <byungchul@sk.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Wen Gu <guwen@linux.alibaba.com>, 
	Philo Lu <lulie@linux.alibaba.com>, Justin Chen <justin.chen@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Vikas Gupta <vikas.gupta@broadcom.com>, 
	Michael Chan <michael.chan@broadcom.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>, 
	Doug Berger <opendmb@gmail.com>, Nicolai Buchwitz <nb@tipi-net.de>, Satish Kharat <satishkh@cisco.com>, 
	Wei Fang <wei.fang@nxp.com>, Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Jijie Shao <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>, 
	Fan Gong <gongfan1@huawei.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Marcin Wojtas <marcin.s.wojtas@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Sunil Goutham <sgoutham@marvell.com>, 
	Geetha sowjanya <gakula@marvell.com>, Ratheesh Kannoth <rkannoth@marvell.com>, 
	Subbaraya Sundeep <sbhatta@marvell.com>, Bharat Bhushan <bbhushan2@marvell.com>, 
	Felix Fietkau <nbd@nbd.name>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, UNGLinuxDriver@microchip.com, 
	Daniel Machon <daniel.machon@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Yibo Dong <dong100@mucse.com>, 
	Brett Creeley <brett.creeley@amd.com>, Justin Lai <justinlai0215@realtek.com>, 
	Larry Chiu <larry.chiu@realtek.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Paul Barker <paul@pbarker.dev>, Masahisa Kojima <kojima.masahisa@socionext.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	MD Danish Anwar <danishanwar@ti.com>, Jiawen Wu <jiawenwu@trustnetic.com>, 
	Mengyuan Lou <mengyuanlou@net-swift.com>, Ronak Doshi <ronak.doshi@broadcom.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Jordan Rhee <jordanrhee@google.com>, 
	Ankit Garg <nktgrg@google.com>, Tim Hostetler <thostet@google.com>, 
	Erni Sri Satya Vennela <ernis@linux.microsoft.com>, Eric Joyner <eric.joyner@amd.com>, 
	Mohammad Heib <mheib@redhat.com>, Prabu Thayalan <prabu.ponrajthayalan@amd.com>, 
	Chintan Vankar <c-vankar@ti.com>, Nora Schiffer <nora.schiffer@ew.tq-group.com>, 
	Alexander Sverdlin <alex@sverdlin.org>, Kevin Hao <haokexin@gmail.com>, 
	Karl Mehltretter <kmehltretter@gmail.com>, 
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Meghana Malladi <m-malladi@ti.com>, 
	Jacob Keller <jacob.e.keller@intel.com>, StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 8:36=E2=80=AFAM Jesper Dangaard Brouer <hawk@kernel.=
org> wrote:
>
>
>
> On 11/3/26 22:14, Mina Almasry wrote:
> > Remove the per-SKB skb->pp_recycle bitfield and skb_mark_for_recycle()
> > helper, and reference-count netmems directly by their underlying type
> > via netmem_is_pp() inside netmem_inc_ref() and netmem_dec_ref().
> >
> > This series simplifies SKB and netmem reference counting:
> > - Reclaims 1 bit from struct sk_buff (skb->pp_recycle).
> > - Unifies reference counting of SKB fragment netmems and regular netmem=
s
> >    under netmem_inc_ref() and netmem_dec_ref(), eliminating the separat=
e
> >    skb_netmem_ref(), skb_netmem_unref(), and skb_mark_for_recycle() API=
s.
>
> Part of the performance gain from page_pool was to completely avoid the
> atomic refcnt operation, when we can see that page refcnt=3D=3D1.
> Are you removing this?
>

I am not, and this is a very sharp observation, because retaining that
optimization was one of the things I struggled with my LLM to come up
with a way to retain that optimization without pp_recycle. Patch 4
includes verification from pp-bench that the fast path remains just as
fast:

   - no-softirq-page_pool01 (fast path): 37 cycles (18.7 ns) baseline
vs      36-37 cycles (18.5 ns) patched.
   - no-softirq-page_pool02 (ptr_ring): 77-78 cycles (38.9 ns)
baseline vs      76-77 cycles (38.4 ns) patched.

But the sashiko comments indicates there is at least 1 race related to
this we missed. It looks like a smp_rmb() after checking the page is
exclusively owned may fix it. Let me see if that works.

--=20
Thanks,
Mina
