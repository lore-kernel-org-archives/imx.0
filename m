Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0532FF644
	for <imx@lists.linux.dev>; Sat, 25 Oct 2025 18:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761418196; cv=none; b=n09hY1n5De2chWN9yqeUIiBUUvjAJ935zLTRPygEGuu3unP7iZruv9T8I/ZqrbZgHjfMmR3lKhFEtbgceOgJrsrGLkaEKyZcHzYXgfI7pg1hET6RNoP4Jh1PO224pj34rDLjAdF1Wpz+GePIaHHXZ5AzZ9K3lWpBdGiqzk0xzy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761418196; c=relaxed/simple;
	bh=1c8VwZwCLQgKitT09IMgpoLdbo8O8tL2/Cjsynfmiis=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=eB6f35umjog3S1NvycuzdLdJCWwHOBy4aDRXQKDZeS9j8azTrB55n7HJs+6a3a+6Kel43hiJtbW3DgxP8oC04dxwub5rzlg8GOOcPxRcad/83bDUqJXYZ5xytQechoYOWUFrur4qHunegCcUd6h50ZcYCo+VMFz9IKX80bUAhSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfObF+9O; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfObF+9O"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47114a40161so34358095e9.3
        for <imx@lists.linux.dev>; Sat, 25 Oct 2025 11:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761418193; x=1762022993; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YOP1Dq47ETt740QI5S9S9RVh1nYdnTXk8kdvsRVfgJc=;
        b=LfObF+9Ogsbybz/L33f+2etTsnl1/uX6tq5SMrePqmwoOUp7z9uu7TFt3GZhUpQmY/
         mer/MDqwwmR3N2xzR5zUguN+5fXW+j5iXlvjDS6VRnepbevRMHpMhIrSR/K6wfeG4nEv
         mirl+EmBIxlFQtcsudu4hO3qpB1w8BS/5j9g0kJQFzJp2E/PvuscmUN1VPWYjpBFwMlL
         SYRc7zdL0cT7DGz8AdFK4tuon+Au7yiuhyVllFTnVZpnIKNzNPs6uvmoQho27lqfsvkZ
         L6nRs7EI+aILd/az+sAFuAePkhlTB0klKIseUz/PGOpFsyUpzwYNs9XXIah5itSPQYq7
         bXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761418193; x=1762022993;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YOP1Dq47ETt740QI5S9S9RVh1nYdnTXk8kdvsRVfgJc=;
        b=u57uSqFi0FUY0C6rrPWcMJX/8Or3RuwFktfMi8Xv0izYqmXDe92FdcHViZBi33RQWu
         tteyh5ZXINUHtsVj/9eOwF/ANPucICffpzvrXrrrnydlg6d4M6gWr6sNpUz+NxFs7F0/
         DTJN95VmbD9cA2CQ6U42RaxgUXk5zxtl/c0VyOaDwQQ59EJmwh/6drq8Wu4qePmL48vO
         /mMQ906Adids5GOFLUpFptQ1wQxDy9naCKWTxGVIbUJTqjLnon+Lw/pjXttmHNxFXVnN
         bAjDC5TMyNi1MaqUUR8esYwaiO2x2XqFXun00FLcS4aOPpkj4e/IB4m0gppVl9bUUoo4
         7hpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXht21iU0El+WouQ82Kmp/dKOsCjgGWwxeNUbZAkW1eiVGl+xNKZJDtyGIITacJUyLe7yA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCsIXqNsrjPLZEatOUjfZuWx4X5M9h0heJ9wfjb6LMIlK8mINF
	rszsc3EMBq2lesUYPQWM9DXarnZQI7EpfDFmUAdna9DYU9/ofC3yIhRa
X-Gm-Gg: ASbGncsbcKJUi7ntroJ7FJn9jFZ+ioJeB3tH5GqavNEj02MLzlS+EWFABA3smi0219r
	81pGo6zcoT1oYwdSMdyhY7vZPgG/WzYlzW0/N01SUdaMhKmA2L0EOeGvjmx3+zb1ws2+AqP7O80
	LzPNz5YPo7pcdRw1NAsJXZPpsqPlTvqd/GuOL9y8dU5k5SJltxkaImRv8Gi2iIBc/3X1EdIkSEU
	Mz0i6ddjO3qhLJjr625x99bT0beJBhcfWv2HS0Q9wy5KWq0Snn37nm1q7W9dQsneYn4mxNsBTeA
	WVH0YumxQKa9G7w3fkCIAJtwPqCXG3saTRxIA2YnuO5xhViHdVa3DnJndWT6XQe6A7jN7B8+FFp
	Q4PzQbviFt7kQOGh2gXUa/3ePPgJPpXvYG5EnSEe16XLQMsrdBgBJMLulGqTeu4ky5NDqXWcoZM
	wHkTKnJdYK5K7E1CX/NS76qXKfOWTV7pfIydoQxuLouyFgXyjF8gU9X5Sd1io+tjnoIPPzyhpnw
	h9D0vD47pD33KFDsOyVRf5sEjl/P6OVZzcC8GEZ1DdoCcwy74cSzQ==
X-Google-Smtp-Source: AGHT+IGg1HBIr268jUp/OkiHLu7m8BYHJzQgps2UOW+w9yzyN2Jc6WgsG9eUuNap4D78HMtAusreFQ==
X-Received: by 2002:a05:600c:4f09:b0:475:de14:db25 with SMTP id 5b1f17b1804b1-475de14dc59mr17418675e9.28.1761418192733;
        Sat, 25 Oct 2025 11:49:52 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f39:8b00:d401:6211:9005:e76e? (p200300ea8f398b00d40162119005e76e.dip0.t-ipconnect.de. [2003:ea:8f39:8b00:d401:6211:9005:e76e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b22sm4903790f8f.9.2025.10.25.11.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Oct 2025 11:49:52 -0700 (PDT)
Message-ID: <cd112f15-401a-43d9-8525-9ff0965a68cd@gmail.com>
Date: Sat, 25 Oct 2025 20:49:50 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 net-next 1/4] net: phy: add iterator mdiobus_for_each_phy
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

Add an iterator for all PHY's on a MII bus, and phy_find_next()
as a prerequisite.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v3:
- add missing return value description for phy_find_next
---
 drivers/net/phy/phy_device.c | 16 +++++++++-------
 include/linux/phy.h          | 11 ++++++++++-
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 7a67c900e..c4fbacbc3 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1214,22 +1214,24 @@ int phy_get_c45_ids(struct phy_device *phydev)
 EXPORT_SYMBOL(phy_get_c45_ids);
 
 /**
- * phy_find_first - finds the first PHY device on the bus
+ * phy_find_next - finds the next PHY device on the bus
  * @bus: the target MII bus
+ * @pos: cursor
+ *
+ * Return: next phy_device on the bus, or NULL
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
index 3c7634482..3809ca705 100644
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
+#define mdiobus_for_each_phy(_bus, _phydev)		\
+	for (_phydev = phy_find_first(_bus); _phydev;	\
+	     _phydev = phy_find_next(_bus, _phydev))
+
 #if IS_ENABLED(CONFIG_PHYLIB)
 int phy_start_cable_test(struct phy_device *phydev,
 			 struct netlink_ext_ack *extack);
-- 
2.51.1


