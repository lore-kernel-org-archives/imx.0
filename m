Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B84158538
	for <imx@lists.linux.dev>; Sat, 25 Oct 2025 18:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761417809; cv=none; b=gfY+kwgjAiTxocIvyPONm1KswaMCyRAMdEwtgAYW/rBJTQdlfGiq7dhrxpX8hMP72YTmQkYVE7lumf8Fwd9aYz+XhHQxMi9xMBH37Wm2BXNb4gmJbKvvFSB8ti67mFkRVG1JruUgAhsXO3buh9TYoSdMq2jJmdDE0PiwlnR5CNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761417809; c=relaxed/simple;
	bh=dxk8GxWYmXoS/kR/2B6MJ5d695nLp/wTtHjmfAoCuxk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VBqE3XoExPD7hdbdYRrXNi6kv0aqmEfxSeEETjR5asGwskCEF8Toiudcy5wiXmuh15lboW9KsbNJB1eQPOi78YVkWjFUwU+yhJmkw4fazZTUlJ4SeBRxdMMPL5raUKUGQxE6T4eSNRPBIdJQC8h9o55IOBAN8MzYnThLHHGO6Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGlaLEDX; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGlaLEDX"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47117f92e32so28815635e9.1
        for <imx@lists.linux.dev>; Sat, 25 Oct 2025 11:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761417807; x=1762022607; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CWNok4IQiL53qK04RvlXuFVO8RcguXVZm8vK7lpoxs4=;
        b=DGlaLEDX5abxFG+aILSrPSSBC9kowlKWQc6I4oiDYgJKYAi6JGuiOYGB0bqs0pvVIo
         vTbW9uJ8zfcaGIfMEHv4GdTiBxcMItM5LtAeLGtquuDdm3NS1eQ4utRrz3w3N1YbNY3P
         v9mSU6q7iF0M9KpdNjXum9Zx6r8ubsyk/qmKbOr+ARzkqn6pm53giLTh2Gjta/c+Q2Yu
         2fomDUbmzbk4V9KsJicca9FuHngHbyE/DxbZcDwbs6ghISNQnAIHVSqTTPJ0aTagB7AR
         muo7FAeVW7DlVDC2hW5Q3MEuWzK4GEJWIORg6V65PpQUin+phiNyF8jR/VF1tNVEpTho
         729g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761417807; x=1762022607;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CWNok4IQiL53qK04RvlXuFVO8RcguXVZm8vK7lpoxs4=;
        b=IM8zrk2kw28XXJMCw+1Qq8GmoeF8VlhCBkMPqdxh4hV5Au1BumoePIXlf2D2VVnmh5
         c2zCNdIsBrKYVOsWbWGk7u96yLzoXv5WCvboAPF5WCQWRubViqOF2ySEHzpAveXvJZ7x
         uW3MxydQvx07riplSYCR2b/K3/Ocpu9MEkPItmYcu/TcLqkCCb0eCzchQqMYjR/nS1qn
         PSh+tRx/jBo93bS8cqDour5bTzansO6l4rpYVNGKMSjI6gY2JT1fHzxbA44YgeKOYOid
         SGcMaZMdsjvTx6AZ65CEobtAu618Mj0ssb1gcEobzuzQS8U2e1ihPSbXgsxi4FhdXMrb
         gQuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtlbkLyel8/r/DTRrVMFj2RebAG5W2GCtLVQKL5p15DRerCdghfY+707mhpskMos7ZiEg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRxnIaBHoGztjBA8HedPknWHNBuW4PaYIjXcl1Wesp5QxKNJgn
	6P6FWabFewSPpR+SlzBxycbKXv6wr3abytRyklKZUGCZURWOrTGXwyin
X-Gm-Gg: ASbGncvqlTM9X1f9EuY3LfL3LmgfqaDfEhFcPE0InjzurFSAr8zIXdjBrEk3jyMCUyv
	VvTA759j7ZWjbPIbSvB0V98TNsloWkHQ9LPxQ2D3miYXyRQZIW5HBaQDI+ca0Jeo+WXB5JC6xol
	XSs0I0MTApHcBRbBv3EdPjUX4ZKSY99NOXxE0iPU9bxxqcJJMuC48Z2Y6RrK3dcwB8J/SjXUj0j
	rOX9NIcHJR8NM8pHqiDwGSUHWnpj0Jc7Dazr6HC5f04fkBdpU21wCj5LR0In9+KjC6SQoGgo4NR
	WAwtw77AUCqnm4IfjsHZKjrcPfF6PjqQynHgFNiwGSm3l5yibGNBS/zNnnn0N8DSoGNuGSOhc/5
	OXSCS+fxHTaEhaqjVCPSbjPfXGJyRQd5jBSQMa8ARACfcGQ3OZuiHG8v+ko25eDKdnIrg0iM1Jy
	f47Ao8p1LANjAbMjTr1i1+JrVSUPk9lOoxWU99pCezfW7MtKJvMeCvdQN4S9VF59ljLd78jNe8o
	pDCFWvAU6cAAplFHI+kOkaYv/fCrOgOT7EhnrDWZZNp1XY+mbaCNw==
X-Google-Smtp-Source: AGHT+IFk7dWmaGE9WDxnUoXGPQ/MaTOVi43Jwup+53sRtb28ew+/Wwb+XiqmvooubqMbrhcWmLx9dA==
X-Received: by 2002:a05:6000:645:b0:429:8b94:b8d6 with SMTP id ffacd0b85a97d-4298b94bd76mr6021211f8f.57.1761417806671;
        Sat, 25 Oct 2025 11:43:26 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f39:8b00:d401:6211:9005:e76e? (p200300ea8f398b00d40162119005e76e.dip0.t-ipconnect.de. [2003:ea:8f39:8b00:d401:6211:9005:e76e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952de5f9sm5006487f8f.38.2025.10.25.11.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Oct 2025 11:43:25 -0700 (PDT)
Message-ID: <7eb1a046-aa14-4874-b03c-361ac6f8ffa7@gmail.com>
Date: Sat, 25 Oct 2025 20:43:24 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 0/4] net: phy: add iterator
 mdiobus_for_each_phy
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>
References: <9c6aeec5-f651-4cf0-8cca-d2455048e89e@gmail.com>
Content-Language: en-US
In-Reply-To: <9c6aeec5-f651-4cf0-8cca-d2455048e89e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/2025 10:20 PM, Heiner Kallweit wrote:
> Add and use an iterator for all PHY's on a MII bus, and phy_find_next()
> as a prerequisite.
> 
> v2:
> - rename iterator to mdiobus_for_each_phy
> 
> Heiner Kallweit (4):
>   net: phy: add iterator mdiobus_for_each_phy
>   net: fec: use new iterator mdiobus_for_each_phy
>   net: davinci_mdio: use new iterator mdiobus_for_each_phy
>   net: phy: use new iterator mdiobus_for_each_phy in
>     mdiobus_prevent_c45_scan
> 
>  drivers/net/ethernet/freescale/fec_main.c |  8 ++------
>  drivers/net/ethernet/ti/davinci_mdio.c    | 14 +++++---------
>  drivers/net/phy/mdio_bus_provider.c       | 13 ++++---------
>  drivers/net/phy/phy_device.c              | 14 +++++++-------
>  include/linux/phy.h                       | 11 ++++++++++-
>  5 files changed, 28 insertions(+), 32 deletions(-)
> 
CI complains about a missing return value description in kdoc.
I'll send a v3.
