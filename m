Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5E72D9484
	for <imx@lists.linux.dev>; Sat, 25 Oct 2025 18:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761418248; cv=none; b=Vc3jJwj2lH1uyWO1BB8+qw8u99/ZQdGvYuEVwOoPWQsqv7+xa3ftEOMUjY83axJSfQ+cTWbGO+ku8QJhXYmcvGhPkF20GTAGhnTuWBAcZExLcH3ra848rffNfzpE7TsutVz768KY4RbrmqD7KiNoI5a2f9Fb9xmTeiAdIdTwYFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761418248; c=relaxed/simple;
	bh=r+DKdsODkadGXvvNZ/S8XJoz2FiQFDPW4f1v2XCikQ0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=uL/kYFs9CM06q6C/uWxwjH7Xn0irhW5q8Ztqd/QUZFtYk9Z5S9wdz9OWvwOIWxZmOP4Vku3sQcX24JQp/rOb+RSzVKJ9o0KOekkbSqxvHTBHoht8tY3pSBVUtN8JmNIYxn+Ahhuug4K5IE3em1tV4jmiYtEJWxCbfqoNgF8xErU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S9h8Hg76; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9h8Hg76"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso2254101f8f.0
        for <imx@lists.linux.dev>; Sat, 25 Oct 2025 11:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761418243; x=1762023043; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=98yfEBiDPGFeXKIHXMIyU3z8Qaq+Qc8MiRUCJmNKTJo=;
        b=S9h8Hg76MPpJO2ltVSdylZ6M0VCG8//4WvioPXH3F1LudVfF/jOOeGzY84wbzAX/VC
         GYNHKBKXdAbbhmcCgf/y9Ku3EsCexceuG40hVQMoEOHE8CjiBq1cSf3cC+56ogUKM+4H
         xB+iKr7DJXHZu9+oVQsJj0jBUFVgPwlb9SN4pS1bH17lB3iznZFUdIVZy5aoVg9MTlFu
         miy6FgFAiaKjM2Nt9JXrLA3JSyIrE/Q4eK7H0yvWKo3oG9MDiS2BDEXMTbXZE+fxuVDN
         HmwLcVn+93bzzdcpkY9+HKihy7Mk7dQ+ApayOgBYTqZfa1hYOwLd+Ko293lOgCaRgGn0
         zHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761418243; x=1762023043;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=98yfEBiDPGFeXKIHXMIyU3z8Qaq+Qc8MiRUCJmNKTJo=;
        b=Tj57ZqXQUhY9jvzFwvpQMGLiesUxqDlfHUF73eWxz7KSJ7ywHD9yhiEhUJC8Bvz7LF
         peAFKzslYsH/qE+0mzwmElMElpGSfYHJCR8YVZJ0SOpBW614MbLbvCZfqVntCLoTnxzk
         qCJDeOYQSOdbKkq45nEdApNwbE7PQlDhljOpTB4a6zhSN1qaylPHi1A0bkB117ztS2C/
         M7+mj4ORnOgyZLc9JVfOjz3TBEj8/7mRo8HVmh1Xnxik3+Ii1Tu+mlbSDqSBQub98j7k
         ImLd8C43QszC3V+Pz/RqY6IWRPsB4a7MLcmZhkwHg8/qtPQwr17Hjh8qMpmbTYyhbk8Y
         32tA==
X-Forwarded-Encrypted: i=1; AJvYcCVN+aiOVyP/8LwK2Dm2lqTqTKqeB4SN+tUwN99Kih2ljHhGVA/sN/Dj2JtOn3t06iA5BRA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxR6k1zrO010LTPgS9IHiPtvXBmSYL8i13xgWhI7itZNbTLa3yL
	AoDUCLgOdP6CVRzMn8XHBOIz9QgTnqqkN7UmER7PMizAH0JMPrVLRj0R
X-Gm-Gg: ASbGncvkTBhWGLzgxEfcCKgomDarzfTXGaVdbFwIwxgQTJYXrIa9skVZVy9ZvoRpZwx
	Udh1adgGuXs8rKf43xWGAVIFfjjWBu9uhLbSqv3iiUtWw0ykusY04zuUhOpRRiFv5smxX4jeVeB
	Y8m8M16zsz5LCqgt9ILAopQC5mzpqEF7L/UPYaszBv2fVE0Px/JlmQrScuQjERecc+pX9AZ31sB
	GXWOUm1mAgauAgTSh9rJ8UJTYqrkvHFU3KfYlxdFV6CozZb92hVN7cUnxiLZ3KNQzBtD1Te6G19
	qXoiKeWDnS51ov/lh1htW8xdTP4kUKGEXqcjKlePk/TnCTZ/wuMH4NvsmhK27KnoL1O1nrMlqe9
	c2WQLEzwOWd9OZoIBxVBjIvU3GE0W24/axheZ3WEFrKpiQMI2ntcV3OkeWhgragyG+JYKZEoxl3
	ocTgDTkyIw9YW64khhrFg+V4l1E/PA+333mBxmlL1UH/EcOmL7coT03kVIPkHwJ7ua6pRAUJi97
	FQ8eZb/fa1gYqKBtEpi2QCReDeAKrAQoIbXRI3Typ8hEG+aDDkNJA==
X-Google-Smtp-Source: AGHT+IFr5ewN20AMLA9nfDxm/iJ4PC3aoQ2jPi+BAKHx+DPN5+GH/t/L6cIO//luoXtmLREO5RcziA==
X-Received: by 2002:a5d:64c5:0:b0:427:55e:9a5c with SMTP id ffacd0b85a97d-4298a04e8f8mr6979655f8f.23.1761418243388;
        Sat, 25 Oct 2025 11:50:43 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f39:8b00:d401:6211:9005:e76e? (p200300ea8f398b00d40162119005e76e.dip0.t-ipconnect.de. [2003:ea:8f39:8b00:d401:6211:9005:e76e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d3532sm5118118f8f.20.2025.10.25.11.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Oct 2025 11:50:43 -0700 (PDT)
Message-ID: <65eb9490-5666-4b4a-8d26-3fca738b1315@gmail.com>
Date: Sat, 25 Oct 2025 20:50:41 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 net-next 2/4] net: fec: use new iterator
 mdiobus_for_each_phy
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 linux-omap@vger.kernel.org, imx@lists.linux.dev
References: <07fc63e8-53fd-46aa-853e-96187bba9d44@gmail.com>
Content-Language: en-US
In-Reply-To: <07fc63e8-53fd-46aa-853e-96187bba9d44@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use new iterator mdiobus_for_each_phy() to simplify the code.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/ethernet/freescale/fec_main.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 1edcfaee6..c60ed8bac 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -2552,7 +2552,6 @@ static int fec_enet_mii_init(struct platform_device *pdev)
 	int err = -ENXIO;
 	u32 mii_speed, holdtime;
 	u32 bus_freq;
-	int addr;
 
 	/*
 	 * The i.MX28 dual fec interfaces are not equal.
@@ -2667,11 +2666,8 @@ static int fec_enet_mii_init(struct platform_device *pdev)
 	of_node_put(node);
 
 	/* find all the PHY devices on the bus and set mac_managed_pm to true */
-	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
-		phydev = mdiobus_get_phy(fep->mii_bus, addr);
-		if (phydev)
-			phydev->mac_managed_pm = true;
-	}
+	mdiobus_for_each_phy(fep->mii_bus, phydev)
+		phydev->mac_managed_pm = true;
 
 	mii_cnt++;
 
-- 
2.51.1



