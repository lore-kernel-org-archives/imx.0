Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24FF354AC2
	for <imx@lists.linux.dev>; Fri, 17 Oct 2025 20:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760733654; cv=none; b=Zs4Se2peAw5yWphzFg9me2oD8zHSIYcIVPkRVqpvYeOCyi+/ojYJ30o3xJ79HTML+n/Lr62zsWSDomrMOtwOWG8vOnh1ZfWpUlxCXRIf1u5/81A1A1uAT8gAT83SW71ZqbyJa6h2m1iYrlytJMgd9iuSKUyJnXlh7y7/FgU/pdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760733654; c=relaxed/simple;
	bh=8dhd1HXzFActeTedsUZUHugfOjaScZqGphRCS6J2J0w=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=tAgtob2pqHfFFBlBc73DWuWfHb5b+sKBfCFB3DNlTbbNt7hB2J6pU7LmgiEjJKjH1TMMgeYz8u3wM1EzL/w/7O4nBGu4TfgX5p4d57zDNjeeTCjfgsl+EIR4CU/IgjqaOPUqZU6UKUgHa/MdUMJJsB2AMeTgfrpUqP/uRXY+WzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AsPWMVoJ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsPWMVoJ"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so2602081f8f.3
        for <imx@lists.linux.dev>; Fri, 17 Oct 2025 13:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760733651; x=1761338451; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FbWi40dvkp8CFY0Wjk1kGU5vumCQD6DLglX3zNBQstg=;
        b=AsPWMVoJ3E8ESsVixxtqE+uDqlbONifvtqzHN+/WOBCZSHKkn0jTIm4Nx8sx8DVeEG
         PyowAPlFhG9vUOp008nDUVhNXCZMjeDscpE7Q4glQPH3Ux5GGBb8TBjtA/8Uf10e21PY
         DGpPHfb7LaeOLc5ps3SW93CbCu4oRD7GKLLFGuoHve1s17/nuLtjoMkCYs+jMxpowT5y
         Kau33guJO1tO1aqccekmK77tBsonmNvYnjBb9lWiNH0J9N82u6Vvfsl/ZqsgAT0L4Mi4
         RzWXZ3TkKqVG5Jz2ncqcP2U5JwM1rSitiTf3+X1w+p9MqR+wzoRz7cvc07lb4+JgrNz6
         EDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733651; x=1761338451;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FbWi40dvkp8CFY0Wjk1kGU5vumCQD6DLglX3zNBQstg=;
        b=RPKYIHe1vcNiCCPAHtel0aM8qPdXnU77jaDnWCcXT+JVoBrFHyywCV/jn6Cha8YF+K
         pZZaJQi/x3HaX7CUUYoJPf30m3SWot2phSdGUb11vUZIYIc7582paQfWbe3IoR52dzg+
         5jOaFFlII2WnHsquKgtz8AwVh58P6LJAsXDp+UqO66QYwLjor4DHGnoc2eJzOawr5Uws
         k+Hw1r01E8VbSXflSMVEnAA3Imkx4ww65d7cVkwYP7S9qHEXGwVkMTZgpOXpBhsxpK8B
         OB31ba+6CpBxtJFLN77u5nJhV1mN6Ov/SIVUsKAmytZIayW9Iu6/4wEaoMcopIyEXRle
         doxA==
X-Forwarded-Encrypted: i=1; AJvYcCU+YeKsjok22VZb8IbcCUCyVF4DxQuqiShI9FLkz858DhAn90lL9+IFnoD13OfxyS9rqaA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIJyzUT9xVfx+i0VX7DBDCfFeYEh353nqKyOJTNtzOW/7fkuw/
	fhXAqcJsULIaVPPgeaCioGy+Q/SYi1Ee8c+Ti6v+jSLfLB0/0ntDAnVB
X-Gm-Gg: ASbGncu7jyHMpinGc76k+OloQPzxOZVqFK/FrRGIA/QvR2XQ+uK2xfkEQR1oBjIkrF5
	PD+kc/jSKLKtMP1OAgKM5ZJx0BMwhnlHM4xgFi69KFr+RN6ktZNyuqOrlufMoEpRLCxKTGe9p4P
	BtUC7099zKnsL0L/J9yJzZ1m+xWScLDZ5g/+qy36FhhsFoFrMG7/Fzvq8CKPx9iFk0Wy5VhBBnc
	YGScl5ALexkhO9K5UwjbfApMaw3limD10m0edpoFKZA2xQoa2IZHqvSkJfeV4F4SqgvwKMVdxm8
	pORDeWM8EhS8GyTvfoWsMOUydczel8hyO+RcfhupyOPg+FxDgJvhr6aykywdblUph7BEMdP8Ey+
	OHz7SOg/6eIKZgjv+jXqqATr11abJZW9JPjy/R+eqP/lle2IZzi6vRiFSvOf3He43yaSO3ikZYB
	qHjwMzNKF0mYWTVwYBwY8jFZmy1TQVQYiJd9EKFYMA3tOZzq6/1VN76k0QBZE89L3UnrMWh7KRf
	uwoABxB51XS/902zMH312PedDmE4/iuFEaPhQj3hFr3Ygb0Gu8=
X-Google-Smtp-Source: AGHT+IHjTYPZJL+g/HWuD/r0IbHdpjbAXn8TX9jhRHNkV2dhyqZ6ULzINTbC+hXeGu3b5YCOlCwWfg==
X-Received: by 2002:a5d:5f82:0:b0:426:fb28:7962 with SMTP id ffacd0b85a97d-42704dd3690mr3960957f8f.61.1760733651138;
        Fri, 17 Oct 2025 13:40:51 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f33:9c00:f581:27c5:5f61:b9b? (p200300ea8f339c00f58127c55f610b9b.dip0.t-ipconnect.de. [2003:ea:8f33:9c00:f581:27c5:5f61:b9b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-427f00ce678sm1228595f8f.51.2025.10.17.13.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 13:40:50 -0700 (PDT)
Message-ID: <7d33ee44-8558-40d9-b258-2942b2caf95f@gmail.com>
Date: Fri, 17 Oct 2025 22:41:12 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 1/4] net: phy: add iterator phy_for_each
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
References: <68a7779c-acc2-45fc-b262-14d52e929b01@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <68a7779c-acc2-45fc-b262-14d52e929b01@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add an iterator for all PHY's on a MII bus, and phy_find_next()
as a prerequisite.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/phy_device.c | 14 +++++++-------
 include/linux/phy.h          | 11 ++++++++++-
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 7a67c900e..72d58b38d 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1214,22 +1214,22 @@ int phy_get_c45_ids(struct phy_device *phydev)
 EXPORT_SYMBOL(phy_get_c45_ids);
 
 /**
- * phy_find_first - finds the first PHY device on the bus
+ * phy_find_next - finds the next PHY device on the bus
  * @bus: the target MII bus
+ * @pos: cursor
  */
-struct phy_device *phy_find_first(struct mii_bus *bus)
+struct phy_device *phy_find_next(struct mii_bus *bus, struct phy_device *pos)
 {
-	struct phy_device *phydev;
-	int addr;
+	for (int addr = pos ? pos->mdio.addr + 1 : 0;
+	     addr < PHY_MAX_ADDR; addr++) {
+		struct phy_device *phydev = mdiobus_get_phy(bus, addr);
 
-	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
-		phydev = mdiobus_get_phy(bus, addr);
 		if (phydev)
 			return phydev;
 	}
 	return NULL;
 }
-EXPORT_SYMBOL(phy_find_first);
+EXPORT_SYMBOL_GPL(phy_find_next);
 
 /**
  * phy_prepare_link - prepares the PHY layer to monitor link status
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 3c7634482..b0497f47b 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1848,7 +1848,7 @@ int phy_sfp_probe(struct phy_device *phydev,
 	          const struct sfp_upstream_ops *ops);
 struct phy_device *phy_attach(struct net_device *dev, const char *bus_id,
 			      phy_interface_t interface);
-struct phy_device *phy_find_first(struct mii_bus *bus);
+struct phy_device *phy_find_next(struct mii_bus *bus, struct phy_device *pos);
 int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 		      u32 flags, phy_interface_t interface);
 int phy_connect_direct(struct net_device *dev, struct phy_device *phydev,
@@ -1875,6 +1875,15 @@ bool phy_check_valid(int speed, int duplex, unsigned long *features);
 int phy_restart_aneg(struct phy_device *phydev);
 int phy_reset_after_clk_enable(struct phy_device *phydev);
 
+static inline struct phy_device *phy_find_first(struct mii_bus *bus)
+{
+	return phy_find_next(bus, NULL);
+}
+
+#define phy_for_each(_bus, _phydev)			\
+	for (_phydev = phy_find_first(_bus); _phydev;	\
+	     _phydev = phy_find_next(_bus, _phydev))
+
 #if IS_ENABLED(CONFIG_PHYLIB)
 int phy_start_cable_test(struct phy_device *phydev,
 			 struct netlink_ext_ack *extack);
-- 
2.51.1.dirty


