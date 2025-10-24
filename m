Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD732EDD78
	for <imx@lists.linux.dev>; Fri, 24 Oct 2025 20:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761337471; cv=none; b=on3GMWPPxXRaIEoT4uecAGIQ98MwtUelxBEqKmEwu0tlhm8BpTKr6+fx38v26mPEs94BRU8cYUJtVNU544CS90smB6OBSqy1w9cmv3nmDb/ycsP3HXzmXS/fReHf8WSMG8jHovL9kDsDuyEhur4o3CavwfnjWotkU0Eq4agxr7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761337471; c=relaxed/simple;
	bh=++qhl4KSNWgMDQx7EKaOxJp4oYwDNeFiiI+BE3om2D0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=CZ/d+GlcoINyaAs1cLdt0xyzyTZMDTcvyMdYx3HjeSVOumv92mcr9n0+r2QinCNMCPUV7msof0xPaywaOSwu2lF1n91iw9GU8V0HmlMCZ3PUS+HpjUz1LiKPVSQZfJoNPrIJtd8CclLhDc91Ug89DiRTH39GdoPRrBZ1mQxH+QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFAzHgGT; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFAzHgGT"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47117f92e32so23119195e9.1
        for <imx@lists.linux.dev>; Fri, 24 Oct 2025 13:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761337468; x=1761942268; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rioMXLIytYS2vDdWj/lGi+EnzevNN/0HrVqMOMW5YCw=;
        b=UFAzHgGTPyca0EvLxLuNVmQsj+0/pIio07CxUt45ceaz+7auwvTJzj8qgr6xl5CY+Q
         H43GYzgMVHZNGMJ9uwyfHdIXuVQpfjnH2dvAjR6YDf5CV5ScoBgwxJAfUbkn6WVfx9gN
         AWvuKx2/vvhDjTyJw2OyHxaDNML4mdvsw2Ob3AxlZkVukQ72N/JmvA/+2rNdh3x+tggq
         db3do08BU7uhUQs1dRhU58e84RDvmOCDVykbpfUWk4EhPvZSvcPLSyhrWjvtPy4STEYg
         LmruNWbwf+4YRDj0//KbaNrx3yETKV2nXcoCMxOAUEB0rLaqkDEcNct9zMierIevl2D8
         C47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761337468; x=1761942268;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rioMXLIytYS2vDdWj/lGi+EnzevNN/0HrVqMOMW5YCw=;
        b=uUymL61gEHc/mvQSqczWFSqAf39C1dlEr8UkxXBnerwN4BtNjIYQ+o24o9ma2GkYr+
         fOErdDV4W+WJrWvwXibeRqJD8iUWPMrbJGYNG4KvHg9LfszO0M48o6SHtykrCS5TEZMI
         mUAqcsD3O8wEUGQ8JbnXVFcelPIHvUIKDF6JDt4HYaieRUBWU9+rJDwMEGYo/Nqz5zUA
         VfOb9PP3XdPdDKHti+/6J+6+bYydXiBbhRLzv6biAHNSvY/lc4IHhJmdIe0PFZP8w6xA
         HtiC0Z65ECF1fSfdeIQL3269J9Q5ws0WrwL7iKNpa5a7+rjFbQPiupnJ0TDDKIMXQT/O
         fzrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEJYwIoALw4EngR59Tk3okiz4rPvAhOUA1Cz+fYIY/p5qg1/zkjBq/lgHMIwLGT5xdrWg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyv/+9U8isYbZIP5IiqrdcBrIRQjAatfy3LAODw30GZ5Ox+xQwX
	p0Ip5WijPkCOCE4QAQ/eolIc2YuFZPLnhOGwuaT65s1W1Q+JkGciil4P
X-Gm-Gg: ASbGncukQSZmpq+kj8YfZME6HCMMKypC/so6l4cmHvavXjifP0Ji8jwb9VUZR+q7E+A
	gr/wf3bqItmOJSpY4vmPF3tYJX3dLW54B1TXKmdkGr1IssTPLe5F8JhCHdAh0FMNn3JSjinpkfS
	pLt0nAmhpyrETuhhUnfpiKGn2wp9rARqjT7GdK7Cr1Q48X6bLFJeobAL5SJjyq9rQ/5Zp4pxhRh
	UUe+yLeX+K+JP63RrskGZpIhiGMKtoo5RaqZ7z7o0UwRJDqeWC1qaWrvHYZdxRahj5ii69RsIpo
	3jOhpKa4yDmTrfB0CWaT/TwCDDCF07tnV4QbWd6ZaPVaJ+iSpYi0HWE0UtUHr2SlmuNAtftaFkH
	+jKCY+nyKAeIo211zPlvP9J6OGZ2pk/cE0Y5E8ItuHD3AoWzJrGREMqWPXbHPZ149aDyP+2SOqR
	+VwnhRoNBTYS22yKuckfQmutopc9XIonHSXZLpaihkWI6dVdWIoKMTpgpiFsCXYdEB+ft+8XNhO
	Rx3C9I+E0Uy3lw5mnW7HQwYyCvnPsGvQUL1Dgz6o3ztLuDJ8q+W5g==
X-Google-Smtp-Source: AGHT+IFvkMy9ImiLMjxrS/vtOqh/phODRx7SpqbTlevH9/NaywagA6Pk9+aMessugMQEw6aFP7tbog==
X-Received: by 2002:a05:600c:870b:b0:46e:3709:d88a with SMTP id 5b1f17b1804b1-4711791cb7amr244732645e9.33.1761337468408;
        Fri, 24 Oct 2025 13:24:28 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f20:af00:7cba:4f15:bb68:cf78? (p200300ea8f20af007cba4f15bb68cf78.dip0.t-ipconnect.de. [2003:ea:8f20:af00:7cba:4f15:bb68:cf78])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-475dd035dc2sm317515e9.5.2025.10.24.13.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 13:24:27 -0700 (PDT)
Message-ID: <39ea8bae-e9d0-42f0-be4f-cc3f75e4b2a1@gmail.com>
Date: Fri, 24 Oct 2025 22:24:38 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 net-next 4/4] net: phy: use new iterator
 mdiobus_for_each_phy in mdiobus_prevent_c45_scan
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
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <9c6aeec5-f651-4cf0-8cca-d2455048e89e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use new iterator mdiobus_for_each_phy() to simplify the code.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/mdio_bus_provider.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/mdio_bus_provider.c b/drivers/net/phy/mdio_bus_provider.c
index a2391d4b7..4b0637405 100644
--- a/drivers/net/phy/mdio_bus_provider.c
+++ b/drivers/net/phy/mdio_bus_provider.c
@@ -249,20 +249,15 @@ static int mdiobus_scan_bus_c45(struct mii_bus *bus)
  */
 static bool mdiobus_prevent_c45_scan(struct mii_bus *bus)
 {
-	int i;
+	struct phy_device *phydev;
 
-	for (i = 0; i < PHY_MAX_ADDR; i++) {
-		struct phy_device *phydev;
-		u32 oui;
-
-		phydev = mdiobus_get_phy(bus, i);
-		if (!phydev)
-			continue;
-		oui = phydev->phy_id >> 10;
+	mdiobus_for_each_phy(bus, phydev) {
+		u32 oui = phydev->phy_id >> 10;
 
 		if (oui == MICREL_OUI)
 			return true;
 	}
+
 	return false;
 }
 
-- 
2.51.1


