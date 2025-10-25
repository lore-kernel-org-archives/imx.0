Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7671ACEAF
	for <imx@lists.linux.dev>; Sat, 25 Oct 2025 18:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761418105; cv=none; b=nwViDZtEQFgNXOdrSVfXfWlRVNAVm2/TgjcqUpGiIdSIhne7yQe4s8sIQyQhX7Gjva+pMyVKsKAeFKSXSDouIt3frNW7bN/5zSqy1XK3854sHDyaCkMwBttzx4QOuejlzhP12DC5H1aaBZstaw4qtGdpXo21v7WwaBQB8kjWwCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761418105; c=relaxed/simple;
	bh=lB4Dxkt0TRaUBnvTCUZDfEdUI4b45T5lSgIADYdoQt0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=AU9BoHvMWekFDGElc2RigE9/dpO6f09Ae1LofDucrR3WblppFcrqyV8uoGGmIunVz/JhKch66vSfF/Y4kIPYJlhVSXTGABS8g+CRrS7UePkC+5hvGXNqLlqdRrfuPLJc7zhiZYWFZVacJNi511GsJp9cJ3nJTfYIHn7U/3RKbcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XMz9Ir8T; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMz9Ir8T"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-427007b1fe5so2677947f8f.1
        for <imx@lists.linux.dev>; Sat, 25 Oct 2025 11:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761418102; x=1762022902; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4DEObF2TnlPKzUdiOnUGsTpjwM4e9ytvSs5bWLyvVw=;
        b=XMz9Ir8TRNJpv0NjUpx+OfFlzBA/cjIBxraWD7ciXzB081lAPBK+JQAJCquTuLgdAb
         XK0gXf72IOG2HKJNW0qBGmvkIcE0Q7V8xjyFzZB20KDAcA+h/tkwQ+baeFzQOlUMyA1X
         WH9OP4BzbGQY/eVSvCqUlMjppRg2cWfQl90/eTDgeE7KLkVVcb+PiQY1dKLMtwWhEKJT
         9Lvrb/5/ER7bUCMLJ34sgFybWsdxYYINOnkGyPWGOfF5u4rQhzPtBQhVSMD2L3RHU7ND
         AwQZ8nV8F3i/t6bePpNBbeiQMSJ60niUD+IUf5vpO4PChqC5zcDgM9cfM30mxjGCD/Cy
         xfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761418102; x=1762022902;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/4DEObF2TnlPKzUdiOnUGsTpjwM4e9ytvSs5bWLyvVw=;
        b=I4YnprLbewDCxwlmdAsC3hW9bcAIRGV95hPwJv9o/lJZW00oydafKVc0e14hu+Sc2P
         Nmb28Y4afvloigObITivN/dGvC0CBDJqbbcbcPMIafIkU510in7ACG6TdDAf5f/fDs2N
         3nC3j5zjLH33DSL2y5WEiA5NIpAkuPVIzfpbIT8dVDUmEAmRcxAMNJuxhobsZQUc4Ye/
         bpuN5/rOozhywNuoZR+ZODb+aaYya8/JtMkFwonR3gizKTHMrr6sVvcRt3qOKYeNwqBj
         8FwAxav7DI77YYxBJH3aRS7z3xSMgB8bxNwFmZSkyML0SyYhLQsCfmEQsGrR/cg5Dlaq
         Ujvw==
X-Forwarded-Encrypted: i=1; AJvYcCUTr2NvDycXW/yv3QL8AwWJvD1rZQMSqBUtcEK3eMvVAG6DMafmJNIkcjDK6VZg/ovdgiw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzrUYSomOpCIPukO5qW7c8f/rAdW+RA8W4h+BzX72kcpXt+zTMt
	QS2VSfSo637/uhjuvVKpP/L5uSOuv6NZBtbkgZALNcNXTQQQiAVAAYno
X-Gm-Gg: ASbGncudP9+5Jiewfu/rYd9HxXswnMD7B7P6YnhecMgn54pbw2xhIT9EllynztkiE7L
	POhHPdVY/Chvm2Qn5HytptwiD+3sFJVzczTimoucfuLWlNOOFOQa/Ek9ziNlQFnBfxSTKptIpfp
	C1XEypTwvLxGTzL2OlmutDBWmo7fytQUkYlDVYZrCW6euhVV1HFS1Qst3J8TAnFr1jZPQJzLeDE
	/vXYTlI/CRLcx3UVHigDLwklSVbYbfGhJUAO5R5ZLPbGmKcQJsPacbJBBvYWJwNSsjpqeNxKGHK
	hRmktpDu1QoNwpFV8YpUUN2Pqoij7sjm4D8iHnKw9/x8okc6EHNlZE7qypVqrDNF20YdBrFHuqY
	Pyd6kzIumu5VB5NNOvdgL/Z4jmUekO+Ds/cupC7zROU/qDXcENyn95+JDpYCuU3MO5gn0VlL45W
	hwngb2oC6Bfee+Fb6gxv311jn30lsVkta346TPTKRHEpXF2xhiKEAtxYgsF5cOgq2ex6aWQUn5X
	PklgoJcmsZLZF8vk1/XQelVy7ZMjZM52Pivtk6XXIoVC2ek8rRnug==
X-Google-Smtp-Source: AGHT+IHCcJrVSR0S/2bwLvXjTXNpPmTtljDkbM3kYmLozHWMGTFvMyAitKH80oZ9JGOJZmbETpzfsQ==
X-Received: by 2002:a05:6000:4310:b0:428:3f7c:bcf7 with SMTP id ffacd0b85a97d-4283f7cbf5fmr20516277f8f.62.1761418102292;
        Sat, 25 Oct 2025 11:48:22 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f39:8b00:d401:6211:9005:e76e? (p200300ea8f398b00d40162119005e76e.dip0.t-ipconnect.de. [2003:ea:8f39:8b00:d401:6211:9005:e76e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7a94sm5404597f8f.5.2025.10.25.11.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Oct 2025 11:48:21 -0700 (PDT)
Message-ID: <07fc63e8-53fd-46aa-853e-96187bba9d44@gmail.com>
Date: Sat, 25 Oct 2025 20:48:20 +0200
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
 <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 linux-omap@vger.kernel.org, imx@lists.linux.dev
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v3 net-next 0/4] net: phy: add iterator mdiobus_for_each_phy
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add and use an iterator for all PHY's on a MII bus, and phy_find_next()
as a prerequisite.

v2:
- rename iterator to mdiobus_for_each_phy
v3:
- add missing return value description for phy_find_next

Heiner Kallweit (4):
  net: phy: add iterator mdiobus_for_each_phy
  net: fec: use new iterator mdiobus_for_each_phy
  net: davinci_mdio: use new iterator mdiobus_for_each_phy
  net: phy: use new iterator mdiobus_for_each_phy in
    mdiobus_prevent_c45_scan

 drivers/net/ethernet/freescale/fec_main.c |  8 ++------
 drivers/net/ethernet/ti/davinci_mdio.c    | 14 +++++---------
 drivers/net/phy/mdio_bus_provider.c       | 13 ++++---------
 drivers/net/phy/phy_device.c              | 16 +++++++++-------
 include/linux/phy.h                       | 11 ++++++++++-
 5 files changed, 30 insertions(+), 32 deletions(-)

-- 
2.51.1

