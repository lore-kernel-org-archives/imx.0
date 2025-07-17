Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3376433AC
	for <imx@lists.linux.dev>; Thu, 17 Jul 2025 09:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752743758; cv=none; b=J2enailtB7jMepwFjiCFi6a+xH/kAb0i77yeBB7T8St5pc6/t3sUF0HDWcqLWaGZmrNjtv7s983LI01uOjfB+ioBUcNrjt5e5H1wJso0TUyin7Lg57b+HPRn9dlJ5ADZCe67ObHw+cCUo8FOj8SQnr0PBpWguadvZy/6YTTHlcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752743758; c=relaxed/simple;
	bh=7xiU6lQp5gZes9PPa5o+K6K/0XTTIF97z1CduNvdwPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a8+pg/vR/beXdzLUNe+laAdvBjv2JlKl8wQnC+z8aWiJEnmxivniHkINg4231cQVDoQXibNL2fLWXenehnIi4PE/P/vbJ/xbNntjivT7rpqMXgmM27Gc9lJTRLLuKmyuxNSnklWXSuxW7YSkcD2fpYKURwp3oy8EpglopKPQnYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4Ch8CVQ; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4Ch8CVQ"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60780d74c85so1232613a12.2
        for <imx@lists.linux.dev>; Thu, 17 Jul 2025 02:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752743755; x=1753348555; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XuQuLev07eyWeKHWKCNdTOJWBDIr2mJkHs95ZW2/jJQ=;
        b=l4Ch8CVQt6Rkif5ZVd43mdOV+tcqFaos8JCZF9JUVrHglbqIcGt5a76eYWmBLl36fs
         WVsc5/yMbcLpZf1A0g5t+fHR1KKEg0Kvazcbzaj2+6lpUR3OTHQT1bHHFoNeRUeXJ7+E
         treIheO7+nmiBZTB3NmX1ECiHg/dD3UqInRliYb+vH+jlWSLpSAwkkbdSH326Vo354M9
         coy2oqME3ceyCodPLV6YNQToEUYwg3CIs0JP6K3DB7lLiPoMClyzDI/IVD5CVOAPsjBG
         2S2a3HqyCKVgOTr0fBXnYHHW7501dhQh2N+0JArmj4Vy078x+6fQ7OSETw4zcxnlh50H
         xgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752743755; x=1753348555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XuQuLev07eyWeKHWKCNdTOJWBDIr2mJkHs95ZW2/jJQ=;
        b=hoEQ0Jo/6Fo+boJeb96bOOBvNbW8fWYijp6vYVxOSCVzhRcuY/3mxs1hg7OboqRJJO
         99D3+69SdfBmwcX/FO1G2Xc5lDRloUzmhjfwz+BHaOfGuvfG+IIq6o9XYDYobQNG33az
         E6r3xs/1EhngVmymbF8NB2P8iYDO2dBmA/CC9Kq31MDlRDPYBbsybXMz/7yALcENLeXa
         fW9/DQmOfCgzV98RbJnqWzKPgOoc+aDQ5qB3AhDs8AL1nlonIhk1ZTg3WLEc8s9fkv21
         BjviE1OKfDbELFIT4/f+pY1kRDur8pTzdcl1fxvNidk+3FIN7ksNCqRTqthvR5M63h5q
         QEfw==
X-Forwarded-Encrypted: i=1; AJvYcCWB5rGoRoRvHK73cDbRy31VF+IpF/LXRwiM9xdXzzwonxAP0cKmnDssB25spZXCwtxdLjc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyqLKy/uE0BaCxvMs2qR6KlsPoq28YLDvTf0o/ISUMlyW+T2zT4
	R9VHNnpL+UoTGJ1pKlzg/yaBeRiHY+BWds6NRnulOYYgbq5xf+Upjom8
X-Gm-Gg: ASbGncuZxN0jFgjyGgGB8hnSTP12vCUyVrCjuOzoJ2+XYxivAKgVkBSJQN0dgQXWAmj
	aRpEpHuRwxran4uK6luHTUbPiVeQx0JK8tb2u3CCCCfhdn838yjctvRDcZaeNuhhe9nNTWzLhV3
	2ytFL2GKZuSn7TygUM13Mytwpv5HSkTJI31YNRxh3A3WbHEkRwz/sTQCkgTg9pdmZaJXOvTPhJe
	pNpBjrQecSTEoFVkcC/GSO2R1I4vZEYTF+b4u/R+/llyLUn47D2hMmbXNPG0ZNBUx9sQgZ1twGO
	R2ywtqM9/LV0j3xXJIkLY+hkF2p2jNH8Tdg/5NChQNm9nyOkXc7DmuthVfmubH7ARKDoMzmAWCG
	BKKxFXaDtD3V0AtRj/Ooa3onoZ2gYshPuT04=
X-Google-Smtp-Source: AGHT+IEBp5fKU5jFwU7T/e+ghWZTAi9JtfLyT40aPkuCdbIfMXgA11Q2utS7ZVnD76C8XR+vIqhT6w==
X-Received: by 2002:a17:907:c290:b0:ae9:876a:4f14 with SMTP id a640c23a62f3a-ae9c9ba50a9mr629028466b.59.1752743754656;
        Thu, 17 Jul 2025 02:15:54 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325::1ac? ([2620:10d:c092:600::1:72cc])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611f7365c7bsm8194693a12.62.2025.07.17.02.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 02:15:53 -0700 (PDT)
Message-ID: <6e4a4ae7-b84e-470d-81e9-a58ecf9c9157@gmail.com>
Date: Thu, 17 Jul 2025 10:17:17 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 02/12] netmem: use netmem_desc instead of
 page to access ->pp in __netmem_get_pp()
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
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izMK2JA4rGNMRMqQbZtJVEP8b_QPLXzoKNeVgQFzAmdv3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/16/25 20:41, Mina Almasry wrote:
...>> I will kill __netmem_get_pp() as you and I prefer.  However,
>> __netmem_get_pp() users e.i. libeth_xdp_return_va() and
>> libeth_xdp_tx_fill_buf() should be altered.  I will modify the code like:
>>
>> as is: __netmem_get_pp(netmem)
>> to be: __netmem_nmdesc(netmem)->pp
>>
>> Is it okay with you?
>>
> 
> When Pavel and I were saying 'remove __netmem_get_pp', I think we
> meant to remove the entire concept of unsafe netmem -> page
> conversions. I think we both don't like them. From this perspective,
> __netmem_nmdesc(netmem)->pp is just as bad as __netmem_get_pp(netmem).

Yes. It'd great to have all of them gone. IMHO it's much better
to let the caller do the casting so at least it's explicit and
assumptions are not hidden. E.g. instead of

pp = __netmem_nmdesc(netmem)->pp;

It'd be

struct page *page = __netmem_to_page(netmem);

page_to_nmdesc(page)->pp;
// or page_get_pp(page), or whatever the helper is

That might be easier as well.

-- 
Pavel Begunkov

