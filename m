Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE0C2D0C9D
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 21:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761860790; cv=none; b=OhV8xLjj1EoTAmNx8MsABLxUHePRhhADh33KF6g5xUv+Z5NK6hU0fU+AXyBPvk3clgMUFCSc2R/N78XB/aa//zkin361EWHRbHie1yz9xZVryt7FNBr5MxfJMbl1AKRQx6jSapf4hreNZhpXOnlcAXGtGajkulMbDBF4WBxqfSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761860790; c=relaxed/simple;
	bh=ogoAOc8noYnRP40EX7FiNgpoMABPPHmz1IvTtOqk89A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qOlY40DYA4z5KyYOsZqYa/g4eQM/3h3BYFfwlp8DxJqG5n0jiiLj3OvGpuR0EhN6Vricxzb869aYo4ov1581iTTxGJpi299+DVmEZKED3ZRNPoBWn4utOf1bjybiTIOv7GdR/WmwHztoAKFzd9yAuEqyiWofJf/cIJhlin0qfWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wk30upAO; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wk30upAO"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b6d3340dc2aso435921466b.0
        for <imx@lists.linux.dev>; Thu, 30 Oct 2025 14:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761860787; x=1762465587; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e2bmKsWX27KxcoODJGcbcMlZnZNIE40/bwILX8cp33g=;
        b=Wk30upAOaeWkCUPWsICdcI2aJ4ZgpA+LyApp1K/IQ435PVpgaloQ4mwxS9tS2I5nYx
         F/tmRk++ka8lhm4h/7L+yGm3ex6a9bCReMOIK/6qtwMoGWTKCh50DF4oVqm3MoggNGeM
         hOyXKuWmrTgiJQDQ/3e43TTefvB2Ds5IY+s8hd4wKvLQe1+zfYSunV3MJhTuCEsv8ZK8
         +0+uqwNEoMW+fFHpAAOsYdWhml0XE//ERUkl8asc3mz47Hdh19qvAWpDe4jFyg6Q6H43
         mmk9we3BgwXJyNQ+YNG8ePM/urkRlMBtb5O8fjXhmqkLnmFHiHRC1+m9QM6YuXKAV6fg
         yWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761860787; x=1762465587;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e2bmKsWX27KxcoODJGcbcMlZnZNIE40/bwILX8cp33g=;
        b=RqGyhlmSlo+Y3N/Do7td1bHkmpSgj8qVIkg0cB5UcJKVkQjcLK+baXhx25t6opDiKe
         RZuwkEB0OnH447sSbUmzNPEaUCqBdWbZI0QKnFwdJyLgM0Mqhhl77/wOQgVoPR2y1Bgg
         QdmzW1Yb1M30k58aJ4jVhrKRgRF62eCWNLt57kj4ukOjWXq9CMj7UU2/eQPzCIXDP/TQ
         suroVVLZaAOG/FTpCQiIADUaHQjZMIi+Z67kHp+HCLt3AgaJk7BvjS3Shaw+79Czkv7l
         N2Q/sLlCcV0FLJqMokC8kwY2tsjgC9YMtwXh8uzBY68xySL1gmk8wUKcjRDScsZO6Q4u
         7N0A==
X-Forwarded-Encrypted: i=1; AJvYcCVsx2oHd+BJpvquZdUVDWx4CLkbSGkJZ6SqsvEmLrqkNIm0KBNJKCNj/BLKJ2vxhTnBgfw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyM1sjcVIlcjhG6lG1do/YfNV7QPgL3cLBdGLP3+q5Z/uJIg4K0
	MAwqM767QWyLg9KmqyVYzAZ0tcNI319/INGvBe/HAA0riSPUoFyCozbT
X-Gm-Gg: ASbGncuRnNXRJZUJoZmtYxUYMq4oaUKAs1sEFxmWNwapgcDXvqEdc4444Z6Tm9hzlOj
	S5loz30CWMjsVRe0BE2hpsh4Eu9BYJS0e1WKiDQoOnxwU0+k8sReioSWEEqeehcQoAf24wr8vYt
	WkaR5uoCSvgk63oJFk4/U5n6ajq0cWxySzXL9wEHrfNzgzWv76eAX4JCGhcIvn5NVrCblmnsDFv
	uCrPa496fn24cdNAcIQUDHrs+hEzqZvuso30X0gEVBwKjdSndDm4Ts0YVwr1UCi730CxSosbAzs
	eD5Hh76K+wnLW1LrYGshPECXItyHx1NCZd4vPAHDipDtWVIh7VloG575+STqqQuldDlbsxQzJuk
	CwO8OXfTVz+Kxy5hS07JBs0i848txLEzywnlTox8b/ytY9eGyBMeGf0rORfdcgUfeWYg50NHotc
	wgXzjs/vb/OEhuh+6MOGPsffO22cJMJyADql7AyoSRmoQtUhhmxaQqEU1GerxJ5UZwh7iUrQ0a8
	K6XqJn0D/tTg20G1lCuhlXDbOVm2O2EmVDG1CrmF0agdR0Ckcdffw==
X-Google-Smtp-Source: AGHT+IHttdY4o9D7grpTruZsKEHKhDpt1ULxInoDSp8EgrLjir/7gRBnIDXS9Eo/IhcDhnQCnC8tcQ==
X-Received: by 2002:a17:907:2d25:b0:b4b:dd7e:65eb with SMTP id a640c23a62f3a-b706e5833c5mr157151366b.25.1761860786678;
        Thu, 30 Oct 2025 14:46:26 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f48:be00:f474:dcfc:be2f:4938? (p200300ea8f48be00f474dcfcbe2f4938.dip0.t-ipconnect.de. [2003:ea:8f48:be00:f474:dcfc:be2f:4938])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85359687sm1864847366b.23.2025.10.30.14.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 14:46:26 -0700 (PDT)
Message-ID: <bee046a1-1e77-4057-8b04-fdb2a1bbbd08@gmail.com>
Date: Thu, 30 Oct 2025 22:46:32 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 6/6] net: phy: fixed_phy: remove fixed_phy_add
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Hauke Mehrtens
 <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Chan <michael.chan@broadcom.com>, Wei Fang <wei.fang@nxp.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <0285fcb0-0fb5-4f6f-823c-7b6e85e28ba3@gmail.com>
Content-Language: en-US
In-Reply-To: <0285fcb0-0fb5-4f6f-823c-7b6e85e28ba3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

fixed_phy_add() has a number of problems/disadvantages:
- It uses phy address 0 w/o checking whether a fixed phy with this
  address exists already.
- A subsequent call to fixed_phy_register() would also use phy address 0,
  because fixed_phy_add() doesn't mark it as used.
- fixed_phy_add() is used from platform code, therefore requires that
  fixed_phy code is built-in.

Now that for the only two users (coldfire/5272 and bcm47xx) fixed_phy
creation has been moved to the respective ethernet driver (fec, b44),
we can remove fixed_phy_add().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/fixed_phy.c | 6 ------
 include/linux/phy_fixed.h   | 2 --
 2 files changed, 8 deletions(-)

diff --git a/drivers/net/phy/fixed_phy.c b/drivers/net/phy/fixed_phy.c
index bdc3a4bff..d498d8a9b 100644
--- a/drivers/net/phy/fixed_phy.c
+++ b/drivers/net/phy/fixed_phy.c
@@ -131,12 +131,6 @@ static int __fixed_phy_add(int phy_addr,
 	return 0;
 }
 
-void fixed_phy_add(const struct fixed_phy_status *status)
-{
-	__fixed_phy_add(0, status);
-}
-EXPORT_SYMBOL_GPL(fixed_phy_add);
-
 static DEFINE_IDA(phy_fixed_ida);
 
 static void fixed_phy_del(int phy_addr)
diff --git a/include/linux/phy_fixed.h b/include/linux/phy_fixed.h
index 08275ef64..8bade9998 100644
--- a/include/linux/phy_fixed.h
+++ b/include/linux/phy_fixed.h
@@ -17,7 +17,6 @@ struct net_device;
 
 #if IS_ENABLED(CONFIG_FIXED_PHY)
 extern int fixed_phy_change_carrier(struct net_device *dev, bool new_carrier);
-void fixed_phy_add(const struct fixed_phy_status *status);
 struct phy_device *fixed_phy_register(const struct fixed_phy_status *status,
 				      struct device_node *np);
 struct phy_device *fixed_phy_register_100fd(void);
@@ -27,7 +26,6 @@ extern int fixed_phy_set_link_update(struct phy_device *phydev,
 			int (*link_update)(struct net_device *,
 					   struct fixed_phy_status *));
 #else
-static inline void fixed_phy_add(const struct fixed_phy_status *status) {}
 static inline struct phy_device *
 fixed_phy_register(const struct fixed_phy_status *status,
 		   struct device_node *np)
-- 
2.51.1


