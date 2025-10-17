Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1B12701C4
	for <imx@lists.linux.dev>; Fri, 17 Oct 2025 20:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760733748; cv=none; b=IZIrLbgYKuBLepT6BzVkwBuhXfkW6pzNoY2GTpsZNLd4g//LJnTdVn1KUQThxOpsJ3I8V1E8s06/BOHv8dtVTzN28+9L5wmxc0teTQ5xh9ENl8H/rohujST+Noo62p6EjcW2g69Lvo0YBaFs7q/kAKDjecoaHD9WRlbjclBX+K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760733748; c=relaxed/simple;
	bh=GNbYkbPL792EGmOZRY7pg+sIboyxZAVprviE/2tGcWI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XsQFYotvqemERmCi5Ct+2I7cldGmo2ddBf5/Fi3BU9MABEd84IwTOsVo+IkCoowB3XUx9sVSwWG1tSKEa3Rep4gvSEk7pa6TzCc20neMJe0ESAsPZy8e7/UysRRiZgIaVHNLoMsyHNnWVnB6RiZGLZq8h+iiLQW4mPWJpg+1ZVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XaJbWIEe; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XaJbWIEe"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-426f1574a14so1392404f8f.3
        for <imx@lists.linux.dev>; Fri, 17 Oct 2025 13:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760733745; x=1761338545; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ualtxB2O28jzudNoRoOE1P84pY1sc3kAjYIjYso2m58=;
        b=XaJbWIEevw2aqxwjbBuRL6HqzlPl0uALKOtV98BW7/XpJr61Ge2my/NSb06HeVpqHg
         SRXwpbxY0v7Q5KUnwWa5cR9wWJIx8siMfE6WgE6/fauM+6RBNzVLVySZqm2zDWLdDAkc
         g99DBEL/8bwirKiW6ADon621h/lU1whCeaqbSnmRmBhNWyAzjqDM7tdtO/138w/6McCv
         63x2xyq4vhZkZehhv180AkKIa4c6ohq68Vk5XJAnC/Q4Pzm3tuYfzJztbH1th+nzLely
         +FsA5bzDjYrAf7eAmdUyKggl+ttYxqIQ+WT/b7b0BdllD9LtdT6rJnJzkTfv++xl8xbj
         63jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733745; x=1761338545;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ualtxB2O28jzudNoRoOE1P84pY1sc3kAjYIjYso2m58=;
        b=EUWXWOeB8cR0dsnB3R3OWGadPGeSDccHh/wSxuQGnQ+ZgeT2PVxI0pc6UX8+M3/P3M
         Cgz23AxL6kiAN7c+raYKLWt5InRm0nFlmLNqoL9egd/nrhV72H3GgsF/Zvn1XLMIk3Pf
         rD6kQFIfu947wz+UvUv/JoTWqH3uXNbqBMeNvbIdjJXVqdqfW4+KlhESOUsBf5Jz793T
         9Bktmwvs+GKsa0XKB1hEGM8xX9toRdD8o+3MDxIJtOZAhc8KkGxiVucjH0p+6EvqVPs8
         ClckMMDiYvSpHMEjJ1Rz9EH96euH23MHxyr/I2LxCgmXjZFwHrKDNLpfsrLK/+e3rrNf
         vhkg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ9tuRjBvZ0gbzkP4U/T/GaqcmFgv+b6wp7Ypa39PNYYnb93gfuT8GabISbNq+x+yrRZo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0a1cpwkcReObbraHcYTmsalgcLoWJko8iqb9KD7NfodMv6rG5
	yE18P1BoaANJIHrbHh78EkTiJ5UMU6qUvmK3bMjSwQRpflRxpQ9ZljjS
X-Gm-Gg: ASbGncvu5hEYJmZyKg9Rv5u/cyMU4hGrouFYKWLp4QSNjcvcbdw4quan5pkGEeUAS+T
	Q58oc68bRgsVmoc/GYrI2ur9zN86kqCIcbnPaCb1bW4ajjt/rJ3R+u7OOzR6sWTa04HIXR1OxHP
	HVEyzCcjEDsz53gGcAFVGdIcs1Exs04irwb6Hv91H43DRyYc2/LZ/xAtRQm/WHO1CnB16JkBRHr
	Z538kWmc6OOMSzPI+q9sRTUaenFZKFr2zBmgxUqdw4/IFJvTpK1UocYFppdjr+AzKDNfWVbTZrH
	r4By6lzCNEhVyAB1PJOZfAIBt6/ksR2qqddArJbH574oq0BxAQrwUOzQqhvfl0ScTJ/uBMIoxtB
	uyLHwBGo4se6U6DtZlnHYw+nkkvl7CVN9Wru4htadEHoDr+4v/N0iCWNyhFqu/OtlhndjIPyy0c
	TBO//DCXlVcEcFaCmXJLG34PbL/SR9kk8sioIwHgU1/kMHcTQd1dEYCGnTdd9WFxQrgH7vcEqQb
	0Z6CiCbW8KdPZxSOvePFdjHtNeYfov9hd7wGebHomLyVrUvwWRXuwmPAhs+Zw==
X-Google-Smtp-Source: AGHT+IFvlc1ShJsWqbJ1BtdB6Ir+Wa8EBfL0X4sqLWutJC0rfRNM8Fz6yTk6lbjD3YJeDaC3tC8sUg==
X-Received: by 2002:a05:600c:3513:b0:46f:b340:75e7 with SMTP id 5b1f17b1804b1-471178748a9mr39583095e9.8.1760733744752;
        Fri, 17 Oct 2025 13:42:24 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f33:9c00:f581:27c5:5f61:b9b? (p200300ea8f339c00f58127c55f610b9b.dip0.t-ipconnect.de. [2003:ea:8f33:9c00:f581:27c5:5f61:b9b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-427f00cdf6csm1064834f8f.43.2025.10.17.13.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 13:42:23 -0700 (PDT)
Message-ID: <73ee007f-ba94-47c4-8d78-698cffcbacc2@gmail.com>
Date: Fri, 17 Oct 2025 22:42:44 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 3/4] net: davinci_mdio: use new iterator phy_for_each
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
 drivers/net/ethernet/ti/davinci_mdio.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/ti/davinci_mdio.c b/drivers/net/ethernet/ti/davinci_mdio.c
index 68507126b..5a7ed5ebf 100644
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
+	phy_for_each(data->bus, phy)
+		dev_info(dev, "phy[%d]: device %s, driver %s\n",
+			 phy->mdio.addr, phydev_name(phy),
+			 phy->drv ? phy->drv->name : "unknown");
 
 	return 0;
 
-- 
2.51.1.dirty


