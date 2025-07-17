Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7677A28934D
	for <imx@lists.linux.dev>; Thu, 17 Jul 2025 09:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752744126; cv=none; b=aMdaTgAX6e4s7Z/7mobkq49XB5Newwi4Tj1qaYM8Rls/FLOE2ECp9XsSay5pwT/MVfbUnG/d0XJHE9TCPFjmHh2ECG8aRJQicbmCGMPPyvkIx/v7H+Z57d1N1S+Z6PWclRwYnaBHcui5Z+xlmuaVcoGJ8pZkDP1fyZ+SzL8vTfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752744126; c=relaxed/simple;
	bh=Y8vcLPseK/UXuwRNAw+Cg504FHOBMlHLrWxVdz5/NHU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ioArmCaanBXW2hyH1ItYtstux/sqKmho5370mh8CfRTbcaUSRMQtPkhIwfneJBGVdjMikyKkpRSpWhPt2spn4dMMZRsUOOB2zgFRV1r4w3uRkh5TvYrzW5yp+OpzvklUGv5JjmbZsR0/8hC0LJh1SLLoZacEoQac3EQk46N9SNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQL8SGGG; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQL8SGGG"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a169bso1192320a12.1
        for <imx@lists.linux.dev>; Thu, 17 Jul 2025 02:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752744123; x=1753348923; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i00DCL7LArMdrcvWGazqRQUXotNFwoxDDFzCPluiP0Y=;
        b=hQL8SGGGJOHAXFgB9ofHg2Qh0QBCuLyXacXlFwuugPkm8PcboTwFWSPdTfXR4mzGEH
         IdkkgIrfbuCmb3BOiZBIxXwRBs8TVJ1wq2FCY4j5S3PMqeheSt9Eg6Dekh+M2K4gVs8q
         LemFe2+StnRSQbKLByZwMRn39Zf0J5hI6uQ+Qo8h93IK7f5QgXm5FR8m4cyxLkHHWz3F
         b0lGSnD5jr76WCu8SvFoD62N3dj380Wx7wwLConUcJZs/WanfqSp+lwlt81NXLw5ci+x
         2zrizeqvoXW8gXalMOnp0TCj3C7NFgBzLOScVx7lSsnFB1lsD32u6w4jMQBQshA+ALcu
         RNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752744123; x=1753348923;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i00DCL7LArMdrcvWGazqRQUXotNFwoxDDFzCPluiP0Y=;
        b=kl+SqHaHKPyBYH5aKY9LN7cPzUTQcvCF8gsVmH09Vpk0SuITCjOjgwgzJlN68J6Qvq
         FeaBiydNE2v84nL4CfwAAdmiEKF4uSOn8oiEcS5ylOATgVB/9a7UBEQp5qhkAXkb0tpQ
         tPnITZciJyE3YFmER4krM/3m1Zf8Q767m4kTbJMBe9l5oTj+V7Kbj0EWGUmMV2I5vk2K
         +emdIc10AJ3kl3ENQy9s7cAtijIGwTLi3qeVLSS+Fo5T7OmEOWKhFW54xNmwRBxuUJdU
         LvWkEZQnT78Kwbg3uxNbZRdzcTTvxkM1riwSX9962DLUrGCav1hMn8jQHGxpIEfgxu0/
         HvPg==
X-Forwarded-Encrypted: i=1; AJvYcCXioAj7txkvIrkRWaRTFUiOGb+JHkmRaPKjMh0ucwdPtyXzRtMVuHtzjRCYL7UlhBFAReY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxO+6hoXmjefn1zZFSotOlfGodFmdGjHW1+QMBgi8NJSyKLs7j0
	qa/qsXnsbQN2c9HQLu6bU9KVXFDDrOGQBNYG+Qfc/FKWDxz8TRcEB4LW
X-Gm-Gg: ASbGnctymyWFxZFpEDliMzVfgxinoi1L9DBbsG9c1jdJrRzSMIb6+s+gXmP/QFbh4pK
	XZ2vH5r2XOnKmnXBXB849KF+LCZce5D/WENvBbUjiCrjJyRE9+yZLkgd953Ae+3U847dJgit55I
	gycb0jAeM+2zt5OkC+1FutKeW4VFLijY9GCBGZtKVdVN9BZuOHRM+yn7h/+dnsQsodEtgk/T21h
	hg/hk2HSonp3b52ajlRYj+/ntIMzjp09qieSWtuTDYK81BSlP3HxWd3yQ5HuzAmb+ecJ/dRr96B
	Q+CFcmkddt3IdSm+qUbnIVydqSoI6VHdIUB6mWuFwpKuKGm46vsplrmZQxuKZBpyuYK9UFi9Gfk
	K2/HEq2+HyQBzs+TZFpqqYkHnvTE4r9crTwFVbbVxAr70kQ==
X-Google-Smtp-Source: AGHT+IEm/CZVfnHKhdEovv47xnxQCwkLFXlL7R6Fz8Q/9sjCF0i+Wwcn8Nmka6MicAHPOBghKdtX1Q==
X-Received: by 2002:a17:907:3e9c:b0:ae3:c968:370 with SMTP id a640c23a62f3a-ae9ce1e8c11mr471633566b.59.1752744122539;
        Thu, 17 Jul 2025 02:22:02 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325::1ac? ([2620:10d:c092:600::1:72cc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7eec2a0sm1338371766b.67.2025.07.17.02.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 02:22:01 -0700 (PDT)
Message-ID: <325c6297-b47f-43ad-8d2f-276cf70f3d57@gmail.com>
Date: Thu, 17 Jul 2025 10:23:25 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 02/12] netmem: use netmem_desc instead of
 page to access ->pp in __netmem_get_pp()
From: Pavel Begunkov <asml.silence@gmail.com>
To: Mina Almasry <almasrymina@google.com>, Byungchul Park <byungchul@sk.com>,
 "Lobakin, Aleksander" <aleksander.lobakin@intel.com>
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
 angelogioacchino.delregno@collabora.com, horms@kernel.org, m-malladi@ti.com,
 krzysztof.kozlowski@linaro.org, matthias.schiffer@ew.tq-group.com,
 robh@kernel.org, imx@lists.linux.dev, intel-wired-lan@lists.osuosl.org,
 linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20250714120047.35901-1-byungchul@sk.com>
 <20250714120047.35901-3-byungchul@sk.com>
 <CAHS8izO393X_BDJxnX2d-auhTwrUZK5wYdoAh_tJc0GBf0AqcQ@mail.gmail.com>
 <CAHS8izNh7aCJOb1WKTx7CXNDPv_UBqFyq2XEHHhqHH=5JPmJCQ@mail.gmail.com>
 <20250715013626.GA49874@system.software.com>
 <CAHS8izNgfrN-MimH1uv349AqNudvQJoeOsyHpoBT_QokF3Zv=w@mail.gmail.com>
 <20250716045124.GB12760@system.software.com>
 <CAHS8izMK2JA4rGNMRMqQbZtJVEP8b_QPLXzoKNeVgQFzAmdv3g@mail.gmail.com>
 <6e4a4ae7-b84e-470d-81e9-a58ecf9c9157@gmail.com>
Content-Language: en-US
In-Reply-To: <6e4a4ae7-b84e-470d-81e9-a58ecf9c9157@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/17/25 10:17, Pavel Begunkov wrote:
> On 7/16/25 20:41, Mina Almasry wrote:
> ...>> I will kill __netmem_get_pp() as you and I prefer.  However,
>>> __netmem_get_pp() users e.i. libeth_xdp_return_va() and
>>> libeth_xdp_tx_fill_buf() should be altered.  I will modify the code like:
>>>
>>> as is: __netmem_get_pp(netmem)
>>> to be: __netmem_nmdesc(netmem)->pp
>>>
>>> Is it okay with you?
>>>
>>
>> When Pavel and I were saying 'remove __netmem_get_pp', I think we
>> meant to remove the entire concept of unsafe netmem -> page
>> conversions. I think we both don't like them. From this perspective,
>> __netmem_nmdesc(netmem)->pp is just as bad as __netmem_get_pp(netmem).
> 
> Yes. It'd great to have all of them gone. IMHO it's much better
> to let the caller do the casting so at least it's explicit and
> assumptions are not hidden. E.g. instead of
> 
> pp = __netmem_nmdesc(netmem)->pp;
> 
> It'd be
> 
> struct page *page = __netmem_to_page(netmem);
> 
> page_to_nmdesc(page)->pp;
> // or page_get_pp(page), or whatever the helper is
> 
> That might be easier as well.

FWIW, no need to respin a v12 for that

-- 
Pavel Begunkov

