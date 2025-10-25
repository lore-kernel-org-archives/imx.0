Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6CB2FCBED
	for <imx@lists.linux.dev>; Sat, 25 Oct 2025 18:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761418334; cv=none; b=DFKD/uG0z+OC5vy7gP5atGyQ/RXNtWYtljSmsEiI2lAAZYWU3nxxkglLSyGuj8TGMfjbCGMB89RMKFIYsxPx+goCFneuWY0NSltf9pA4aL7p8/vM/fQ4fA7Lyja5AAyXd6xKHXBIdKdI+hw1OuDoT/X4CZIRYsIvENc8U1K52JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761418334; c=relaxed/simple;
	bh=DjzMNMITkdHrQn+TK/Lp9x4kSBfLr/Q4TTfQSfBhlXg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=p2ocR6OUa8nDi7SOMvYpXKL7NVagU0MkME/ltCGe+ZPAy0WYMnOBy2yPo1mJ84wRgOFM8HAJR6wUlXb7Icme6P7dTO9bMZHe2PLkLEusUymLJgG8MN5Ct+gBKZ14XmasUKP+BeT+IxemNYI4YU5zEXpwzUkz1iQ+7M59eZlr0yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SicboSd+; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SicboSd+"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42421b1514fso2149072f8f.2
        for <imx@lists.linux.dev>; Sat, 25 Oct 2025 11:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761418331; x=1762023131; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ReDAp/8LpQ3zDb8wx9z+hWL5nB06qpMyYSjY/XtFYNM=;
        b=SicboSd+7LwkqgLpm/sUOXan3aNBixvmE10heWJr9uppn9DgXZR1ZJi1uWX4azJ12G
         sq9bA3ERgot5DTjI5uw/DjepHLPBNobroKQ9lL/eW4Z/Q+/+wXBX6Lshco1yOya/ouk6
         K22Vd5zDIm7Tt3CaG/BYBpcmVlPJJVKqlZ0W3/W5MMghrDk6Z3FiaQcUZneUdIsjR8SK
         x7BBOky4AoAL+j5RsbFrMKM4j2gTnV4y/OeMrTtuqyn124alDVjj6wo3glULS1CsI7sp
         EPteW8armOEixvxo672VZ822NUmjGpZ5Kk8Fg4owl+WcsXFh474H4U4nYkrNyFD+8m0M
         A/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761418331; x=1762023131;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ReDAp/8LpQ3zDb8wx9z+hWL5nB06qpMyYSjY/XtFYNM=;
        b=PUeb3pBaMLQ0A4XHhF+UQYrIgqUsWieEaPt9EJ9NsQalPS6u136QZ8OYKEaECAZfKp
         61My9Ibq6eVj2iRm/IOAj458jt5iCnaZ6sbfyqaplWGiBNLVxwWidE6WC4DNcMqXc9y7
         4frseKJtNZxzgtSzD8txMO4Z3p4TrHlZIKpNb0KrqrjMu3q7Rgq616D+yRK0P58/Q/Se
         CvxK8HoZIvapXOZSnADS1bXdpLY4T3QU292tPd9KwkUrjnmwqxgGURaL8gJitK9+N2yK
         KC6VqV+3uxIEehB0dv3VwO0LYnK5a0KNquJItEAgpWKqWvoxKB92DD4a6GcGeIvwD2Rn
         YRWg==
X-Forwarded-Encrypted: i=1; AJvYcCUCo49tp99zNXGPHPizHOuTNh50+vzqZ51edu22hxu53496YvHKH00wpF4Hi/yaE6v+C34=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0mLFkAcxTliVvnZj55fUW7psxGnEld5Ht39vDflxfbgW9h1ot
	8N8CGMwIVFjgfja8VWY3Uu+oseFfSBppiqYVmC+3YIDrdzJDTkYztMYp
X-Gm-Gg: ASbGncusqwUKJBL0qtaHQ46WIOtVAq4g9/ht/5P49K8sMXvMYGOr+qP9IGQVZh3qLTm
	o8k0cnlmQhAoyDg8tvxvcbVPCKaWVHGpshnb9tNL8SV7MthQzM5ZtwXNnzmAdfgI/vRzCfB1rn5
	Uyx6wI759xVRUhOkeqyryXkreWtydGlXMd3morGdQg3oRPAW/zQbf+D23N4yCJtolmEh0vZqPPZ
	Tvhiz+TsGdPrxfwQP8+9kPh6rnp21MTja3CuZu8Cp2eisbRmHsZvMY1QPPf64H0GIViRZWmVZUD
	lUj3tIo2dWsiSps2UiUrM91J2t1uAE825DM9tsBF29lKzDEbJhkZJ/CrRWiPd2IKm3lOlh2ueXX
	l06V3EMkgOgdO85xI/XBHHS0Z53qygaYfCtFcg6tZjQ3tL+0+IUeRr+1SHyA9TAW6h0rpBYbCnB
	lcqN2wcWTTBJdU4pekJj/7XSVi+Vti7zCkNkB9XPVgQq0+QSswhJDakYuM0NYquQU9PMaH5QVlX
	BQA/8m5IRSpSv/hrew09JYAhS3PxiwJez6M5Fdlt3E=
X-Google-Smtp-Source: AGHT+IHCy6CuHWreuhY0kzq3aXI1LYVdpD3LbDxQTXXB3GVcd1wp3XcWvi9HhxFTqvcu//8jL+NjOQ==
X-Received: by 2002:a05:6000:2411:b0:405:3028:1bf2 with SMTP id ffacd0b85a97d-42990753148mr5404740f8f.62.1761418331081;
        Sat, 25 Oct 2025 11:52:11 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f39:8b00:d401:6211:9005:e76e? (p200300ea8f398b00d40162119005e76e.dip0.t-ipconnect.de. [2003:ea:8f39:8b00:d401:6211:9005:e76e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952cbc16sm4853730f8f.15.2025.10.25.11.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Oct 2025 11:52:10 -0700 (PDT)
Message-ID: <326d1337-2c22-42e3-a152-046ac5c43095@gmail.com>
Date: Sat, 25 Oct 2025 20:52:09 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 net-next 3/4] net: davinci_mdio: use new iterator
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

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/ethernet/ti/davinci_mdio.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/ti/davinci_mdio.c b/drivers/net/ethernet/ti/davinci_mdio.c
index 68507126b..713ed4ef6 100644
--- a/drivers/net/ethernet/ti/davinci_mdio.c
+++ b/drivers/net/ethernet/ti/davinci_mdio.c
@@ -548,8 +548,8 @@ static int davinci_mdio_probe(struct platform_device *pdev)
 	struct davinci_mdio_data *data;
 	struct resource *res;
 	struct phy_device *phy;
-	int ret, addr;
 	int autosuspend_delay_ms = -1;
+	int ret;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -652,14 +652,10 @@ static int davinci_mdio_probe(struct platform_device *pdev)
 		goto bail_out;
 
 	/* scan and dump the bus */
-	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
-		phy = mdiobus_get_phy(data->bus, addr);
-		if (phy) {
-			dev_info(dev, "phy[%d]: device %s, driver %s\n",
-				 phy->mdio.addr, phydev_name(phy),
-				 phy->drv ? phy->drv->name : "unknown");
-		}
-	}
+	mdiobus_for_each_phy(data->bus, phy)
+		dev_info(dev, "phy[%d]: device %s, driver %s\n",
+			 phy->mdio.addr, phydev_name(phy),
+			 phy->drv ? phy->drv->name : "unknown");
 
 	return 0;
 
-- 
2.51.1



