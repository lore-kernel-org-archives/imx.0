Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78322EF64C
	for <imx@lists.linux.dev>; Fri, 24 Oct 2025 20:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761337207; cv=none; b=kYrG12w9yo99e8UnzUFnhGuVG3+dRRZD2kJDGtY34n7GXEcy3HetCjCVJLSc+Hi0JjxloAoQGBWM9H07gQ/OuVU5/hGeRwbDNvBEJo6x7GS4k12gkEEm51jMkHCyrhLDRfcoEBZKOAlLN67Hq52uqq6mfohjexAtEsACGNBlV+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761337207; c=relaxed/simple;
	bh=k5tU3T43p95wD4ZxBY159klzDKkJYzTtwU4h2HolU08=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=AD3ZsKcbTune+c6eF/c63UldTjDg7uvzcokCfYdbpV8vamE4n3zR6ouiLO+TVNKy80MbGfF1WeTLL+g4/2BPuseOFWxt1hFENiIbCCwlxFUJYiXbHwKAPs6TN28BCZYiRMg8q5dDd86c4/Jd0PoEg0PeXzc5WK41fPgFr0Pwrfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9ehix4m; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9ehix4m"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-475dc6029b6so576655e9.0
        for <imx@lists.linux.dev>; Fri, 24 Oct 2025 13:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761337203; x=1761942003; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89cTnVVRD/y4pnuvzSBknWngxyxloYfQfIWpcoSurb4=;
        b=c9ehix4mLD2zWV40mCx4unNpql1Oha/HWgNsswwLFBd7xS2eJM1u1w3cVuimhV31Vp
         6LR7eUrBgMioqiIrpKPobUmdOtph51RNDr4darsJFgHq8kvx+tH2pJFi7bt76eLG6ljP
         wSowNtpmpDuB1YWi7E3BIVN/NTFD6vrbqf+1ly6WVprH6sXbVN89wkCxFmS9x5kOOPq+
         9tH8/u83Pkutd++8Y5FgbXSElaODmGHDCcoF/LsNwvpNq9i7OfDfiv+rXPRsc6IQl5xT
         uaENlDUgIxtLeuspyl8bYBlRCYi7zXfutUbvPN3QJLURXy1HOhcZo6YJYR0Mg8Ak4Nrx
         K1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761337203; x=1761942003;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=89cTnVVRD/y4pnuvzSBknWngxyxloYfQfIWpcoSurb4=;
        b=EeFaJxvb6QpjH8CXKdg8sYCIPdWhlcadIo0FdduNv/JLm12AzHsTCSmdQD3b0daMuT
         W7xFPPCkfAW8Ii1yyQTy+DXK4mSETLufZyAVngdm8HIpDrEKan2vfLuWOXaNbWWXAQq6
         M+GUS3wef4RbExo9Ifr7IKUM0B2c89D8n+7MVANCPt/Sayz0+xIvh0kZ6ekMRNi1PYtu
         8zu8Mh4nwq0SOMUQuCShC8FhmHY0NEEE+cuovEWdRd+rFiBMtoILo0Sg2uKXcfWgRmVS
         70Wr/Si+liq4OIi4+1EhAOlZjgzaPPB52Zd5kvPR0eSwxJcSCX27FwUoBR2IIl3vfQmj
         fztA==
X-Forwarded-Encrypted: i=1; AJvYcCVwusJWGLQC+zKlm0iRpNwseMcjGgm4qIDrFtR7oLC9dN+W1noywYB0UWRi/B7qkS5SMaE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzL3gxkfGXcLvRouX1o26rUTpRpLqhyfvCfi5Yaz9Kd5aMNl++e
	w9cDN8gKwcivsP788zjFsIKcTdQQbxXnfW1ZhSNe35EiJDPFvJdGYb25
X-Gm-Gg: ASbGncsvyneRPjn5ifnJ1HuvWenGUwvxmBY0DdSw/bC+bq3BfHfmIyskmGZ8GHkP9WZ
	mIdWNyIsOfjvsNF167LBaPZ/MVtpb9dvHj6xhVec8laNGIiTB/da+eeewZs5yu+0jbu2l7uQY88
	bF7VJja+hucnoLcVq5FhSez+TDpztkIzQ6CGKAhB14K2D+Og/BpAB8eqtKM7Rob0NDKjvaHjggm
	WO6pGXJ3IQ1wPyr69blxB1QYdg70TeeagdslvpHV39JHX84KlSAuUA5+SlYm5gf136sanSlE67d
	L7R1DLoKRxV0FHzs8Jb0sJnMAvBtc+Dj1nHMfTngjUSgMBwbYzXhP9E1S223LwWvd3G/bs5Cf81
	hyUYnCcU+XxGyi5p9peE0RCbpc7c9mIlhAqAxH0k/CXOLpEN0ZQFOCNfmOZyDJzOWrHWL7JbJck
	DWAQOlwDkJZ9eMQYYYWkiTcj6OkQKI1mA9hL8CAFnqKo+ZxqgxvjotRIRZFPNSpSSITQJTM7w5q
	W5JoswT6xdowDSAk79WOJY9NlZa6OsWMlf8fSrS/KU=
X-Google-Smtp-Source: AGHT+IF2t1PUIrYokqkaMcPoc81FuEECKHfpaMWlqxlZWlCT+8fXzPcvUctzrRkg6V5vZBUt6VjHVw==
X-Received: by 2002:a05:600c:4e48:b0:475:dba3:9ca with SMTP id 5b1f17b1804b1-475dba30c74mr3620735e9.39.1761337202833;
        Fri, 24 Oct 2025 13:20:02 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f20:af00:7cba:4f15:bb68:cf78? (p200300ea8f20af007cba4f15bb68cf78.dip0.t-ipconnect.de. [2003:ea:8f20:af00:7cba:4f15:bb68:cf78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dcbb41c0sm292835e9.1.2025.10.24.13.20.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 13:20:02 -0700 (PDT)
Message-ID: <9c6aeec5-f651-4cf0-8cca-d2455048e89e@gmail.com>
Date: Fri, 24 Oct 2025 22:20:12 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 net-next 0/4] net: phy: add iterator mdiobus_for_each_phy
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add and use an iterator for all PHY's on a MII bus, and phy_find_next()
as a prerequisite.

v2:
- rename iterator to mdiobus_for_each_phy

Heiner Kallweit (4):
  net: phy: add iterator mdiobus_for_each_phy
  net: fec: use new iterator mdiobus_for_each_phy
  net: davinci_mdio: use new iterator mdiobus_for_each_phy
  net: phy: use new iterator mdiobus_for_each_phy in
    mdiobus_prevent_c45_scan

 drivers/net/ethernet/freescale/fec_main.c |  8 ++------
 drivers/net/ethernet/ti/davinci_mdio.c    | 14 +++++---------
 drivers/net/phy/mdio_bus_provider.c       | 13 ++++---------
 drivers/net/phy/phy_device.c              | 14 +++++++-------
 include/linux/phy.h                       | 11 ++++++++++-
 5 files changed, 28 insertions(+), 32 deletions(-)

-- 
2.51.1

