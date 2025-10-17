Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4402550BA
	for <imx@lists.linux.dev>; Fri, 17 Oct 2025 20:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760733696; cv=none; b=JC8ziRx/dgaCBBWSz9PphnSptXkFAzuA6b9Ee1NLAWp7FCz6QJC0GgxAWPQHNvGhgh/8h9YFS+EopN2X1d5XbbqXV3APstKSxuh+bkW2/i2Pg0C8h7RRBRd8uk1QjD7MaPY1D8V1QZPZf3ZQyTXhoNzvT4ZnrozM/RuxJH3GJA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760733696; c=relaxed/simple;
	bh=BGiVnMLbtqlCCpk8Sdq/wy6wp1bxSfi30ih0VOLl6Co=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=QqaolAZhC/wV1dhE/srEZOdU18bUE6x4a1XLNFXJfBoamHUN736ayFrfmPpDGUiXuWF/kos2pzB3qGf8SuT5zwEx2iy+g7S+te+ya+qQAtfDq+DTkBAG8+oGYnLRLRXZk09Mq/sFx9KLvv+o7RQXv5DzJcS7wJxW7S++7XYiv5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YbOF1x/v; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YbOF1x/v"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so2030713f8f.3
        for <imx@lists.linux.dev>; Fri, 17 Oct 2025 13:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760733693; x=1761338493; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LpJhQhDADsZmTmFM++s6//8HsKHRIc9kPRXzu/W2/fQ=;
        b=YbOF1x/vqRs13onLvM48uQaN19uEuPtXKz1EpYbEhqzFqIImhcrthzj3CwekEvRfiO
         Vw2ybAC01p+rH/gf7U5RMZER5wgnccSbMDzXHgqog1r0ZSyHsimLw7TGWRVanxpFNN+J
         Q1mhIGoSivMaKQD8ZQrmKjGQG8GPXx5/KGXy5td8HvsrYhS/5Cj1B6LdV8SjlVL+I+yM
         RrCRdDDdHKZ1m3yVdC+PCQ983CYt/T9ZiwGqQV80AHuP24C1Xj369Trh6AZHfRdzK/xQ
         oN25uE+8dgUIAZEAUu6DBXM+x/5C9Qw7CnOugGXCcBkFAkB2Vx2PgaguIQSVH2iCf/bu
         TNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733693; x=1761338493;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LpJhQhDADsZmTmFM++s6//8HsKHRIc9kPRXzu/W2/fQ=;
        b=nonhh8uq72k/xVs8O/nyZFhXMBcWj0Bd3uGALrFLjWW4XimYhCBHN0JmaM59zbse3p
         REpxfSaaxPMdxaJSvyeEJIMU7BG6TC8EdYgqpIg1+nOKM4XfgiMEjqwf/0gpRwVh1yeJ
         titm2pjHjEykV55sew16JOyrYaY3IWqF52Xjnu197rPTuyzBgLAsqbefW5yFAZLkrgMs
         P3HV6Z7aK4HNXQLN4t2FtItJW5g6Ulk8PU9NpEe44o3hQkltrZ8wKHza3XSg3kHe1k/I
         Aai2DDqOMtPVp2xiKjjzHNsc4vSSCTX2gNEZvBAeG7iHabr7n1d9yULXEgG8AkEK//QJ
         EKcg==
X-Forwarded-Encrypted: i=1; AJvYcCWuFD39b5szcpeSSwvVmchFA8avshIfHbQSsCHyoJ8YOkY1CDiqHtwKNPac/jQlY+AuItI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGQaGQmgol3mtJr91kA11yDGz4MQJTbJXUbENp+E68VAd9eW8Y
	uiojVnBCHymPzVKJ5Z4eAvAIg1e24QC6goyTCryYnKW0ZVzqOWEsjnqd
X-Gm-Gg: ASbGncuG9WsO8ZjTSy5Kvaf1IY5zkGNI0n4GIxljINx5QUKXXTXkSrr+wsYTNwczGGy
	Gc0ntKkul1mbr+kjwTGPbwFD0rFqzB48Mblob2/lRPZYSPRz0Z7otv+GiGAgvBoYQHmmW6R4IGN
	v66DrFze+ZFgMyN7wNFqhOQmkJ/Hk4XSh9sap+A89L8J1M0NUAn3UioHH5zZh5FAH+G5NcmVPWk
	eRfxrtG6uOK2j/LyFF1swDzH9iZNbcfDQgNS/97p9SH/unA2EVU+R3xF54oxrM3wZrR66yvCxSb
	xN8BSVYtDPWyiQSLGjPZf4viRASUoOCe19Bqi1WQ/eU6YzTEzRqnO2IrTQ4hHNwNRL1FPCH+DfL
	nc7u+UElyAzk6vT4sb75ZYgE6xK3pQ3UuszMVgsVoPjzgV1pXUEQorkB+LlfoNGovC6QEaFwJRw
	F4DOjzEWP+m6oENHlnU/kV4JcUtLF8TZQVcreiW5mW4zWrl1tnXHUkqAJJ9ZwoM2J6c8NrNgGv6
	8DmeI6unMSPdsN5Qok234CDjUTN2anqUjtAZwLnxJxp8f0JsjA=
X-Google-Smtp-Source: AGHT+IHR40r25W7TuVEpMpyN+jZYzxcY0yZnooGo4wtoIODSkS2ymVjTUTayX3owebBrwLbPcCD9Wg==
X-Received: by 2002:a05:6000:4205:b0:401:70eb:eec7 with SMTP id ffacd0b85a97d-42704db8ccbmr3334249f8f.43.1760733693305;
        Fri, 17 Oct 2025 13:41:33 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f33:9c00:f581:27c5:5f61:b9b? (p200300ea8f339c00f58127c55f610b9b.dip0.t-ipconnect.de. [2003:ea:8f33:9c00:f581:27c5:5f61:b9b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-427f009a993sm1102757f8f.24.2025.10.17.13.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 13:41:31 -0700 (PDT)
Message-ID: <fff4a855-d7d4-4543-a11b-e3e1f6611196@gmail.com>
Date: Fri, 17 Oct 2025 22:41:53 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 2/4] net: fec: use new iterator phy_for_each
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

Use new iterator phy_for_each() to simplify the code.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/ethernet/freescale/fec_main.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 1edcfaee6..d7c39ef2d 100644
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
+	phy_for_each(fep->mii_bus, phydev)
+		phydev->mac_managed_pm = true;
 
 	mii_cnt++;
 
-- 
2.51.1.dirty


