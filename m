Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A741B6D0D
	for <imx@lists.linux.dev>; Sun, 12 Jan 2025 13:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736688784; cv=none; b=rsctptfKlz//obFBAlHSLkn4uYbqBlN1baiaQpizd0uTM/+TiXynOg0EW64dLgKv9xlAJ/CVsbDCPFA0wKqa4jrkPhjfkllAhgCiiyi3gOQYLWwyupBYVXXPWF2o/0W35aaBALbfxXJYy9H3Tau12mxppmdYbiAymVY8kblk+Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736688784; c=relaxed/simple;
	bh=/XBAGwsAFpwFBBQSU961+beyZLkCUNZ5sGTLi9rt57I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u/itdNXMuxRMURY5cw7Gqr48+XShZfpNx2SwcRP/EjVXuV34HWu0qn+Yy55Wr3AH20cphUCUBjHFhsHkq0x/UX2SqlC24IAsdHufybLjj6ZVRkxYxq9ojvRLcrJueX09O4YDZZZJDnYE9TwoZXQX2x9CniambeFm6FEWAti3COk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f6jwv//K; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f6jwv//K"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3c0bd1cc4so553415a12.0
        for <imx@lists.linux.dev>; Sun, 12 Jan 2025 05:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736688780; x=1737293580; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRUu7xwt0GOb8hs+BKrBffaLbY4C8ptCLopKQNeTlgY=;
        b=f6jwv//Kj6lpMJtwm/ZAQo5mgjfO4aX0/8WcUg9I+4TdxIq39vioV/AEzC9RrOfuAS
         2mBljz+xOkQnlASBnEwV9YfwTopmzbPWVYDNSVFKJqjYSY/pM3l/9YWCBbfVraH+1MlC
         x3kl30Zxe31gr/uPxuJI/ZSjR8448x6K1h6S+ZGdcr8mEn7Ukjp482J1bEEXsO+evveo
         rFP+hoRiR4oTQGPW1wokcJQkPMEuAaxMKqxeGblo6QVHTG9N27FyZuXGDiGNJDTjcxQB
         LIRk6Id5T6x+7btPN79ywwo+/fW96JMYDjVRIN43a0jCcBLve2xpdZqASbNMLRLZ2elh
         ufxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736688780; x=1737293580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mRUu7xwt0GOb8hs+BKrBffaLbY4C8ptCLopKQNeTlgY=;
        b=WDtb9hkjn9SQfh2dxId25ggKeW5AQmTpadSPCef4ZM2frdFX8X2FWd8GzylQaBX3A4
         wYCLzMKTsEBs5zzd7Z9xbBg5egCUSDyfnmFr6y5XGlf+OZotN2TeWxz6LynePjCuz77z
         EhF2IB6mndRY11LcdMBoX6O/5uQvPFrwp0Vv6NIfpCpmmb9LWeIx9FKUNyTmfpfFSn1h
         hPMP9FuhSIYZdbccvojLIeGht2NmBE/nteflFzSifxr7p1vCMDV+X7Qw+frH83bYvEon
         wcLGi5mME73nlhDtT/PAXOyRUq7anEJVQyGteJGGyGuzv956kUAItvD9y8gEomxU2oM/
         31kg==
X-Forwarded-Encrypted: i=1; AJvYcCXlGWI4sgVKSYIlCIa0KoW3670zz4yHw2x4w4oBqYvqNdqS4vgmymxZztQLHtBtLEMgWdw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyI/VDr2dIDlR9z2yxvkQqnJskiOoyBEJKEBzOERmb3inpdX2iO
	QgbUvDg3tAQUw2eAh3LWzdFrBsSClIgvlc6ZjO3cLBfuKu2qSP+pFaMlT7o0rEZjhoM/hGvXHWB
	3
X-Gm-Gg: ASbGnct139I1BMSyzfsw1jwiQAVHUstfWwraUDMo2MmYZYoFBtAy8B8riqvW4qoC2tC
	00QGjke1vxwJ1Brb8Lnheai2hFCUTcVNVWrNgukfEzA/SlpVlz3ShyD3kHw6z1PS+McvnIjPVDh
	t3u/XOMrhUEOfn+YgJlJjOQhjLv9tpBWo9E0VhGYlhTg4NMQNt5471/0EsLUSrTCR3PURt5NFof
	qNZVkCAwpE1ZZWvmtiueGhPl2/ptgqIVs/yMbXy/epjkkA/KBI07J+akVrA4z0IzmskAeST
X-Google-Smtp-Source: AGHT+IHe7/2lTE7/Nj6QfvaBW+C/pcgDJDaV2DeHYFVEZqu1pr4HggBi1zI3dnd6icGke5g9aysmUg==
X-Received: by 2002:a05:6402:42ca:b0:5d0:eb6b:1a31 with SMTP id 4fb4d7f45d1cf-5d972e1eb67mr5915789a12.5.1736688780172;
        Sun, 12 Jan 2025 05:33:00 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c4477sm3584609a12.51.2025.01.12.05.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:32:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 12 Jan 2025 14:32:43 +0100
Subject: [PATCH net-next 1/5] net: ti: icssg-prueth: Do not print physical
 memory addresses
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250112-syscon-phandle-args-net-v1-1-3423889935f7@linaro.org>
References: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
In-Reply-To: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
To: MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 imx@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1232;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=/XBAGwsAFpwFBBQSU961+beyZLkCUNZ5sGTLi9rt57I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBng8SBqm1C6n54I2y3MlkXEqlfvD/rdrdWXja7l
 F8+5Is0j1KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4PEgQAKCRDBN2bmhouD
 17VVD/4qthD2/zGGxdy7/UvqcrbSUvelem2TFjP4otSbOQQWt2FoBYJM9pNa/ia4nDRzVPRxvWp
 AB684QLqy1jsKUV6CGPT3D+zER5yVvYN4twzngQrr02IRwqmYMGieUhT4C5lGveMXOBMmGa2mfU
 udJ4cuPGtlhH3fISl4u+3noNIZKMzIg3tNCkfvRsZDOAxAPyLpaePpjLMBYlgfahKqDSJJ3Ymly
 +xpGJ/hwDta2luGxIuxazAdQWU4lIeXdwHWgMBrdSensqJLq59XmNTDvSvGOYe6RhYYZEOGkBh+
 dowV/JQhEousq+sLQk8Vg6rJ20bAffXxCqMtmMMKK0iPtwmP7eeWQipA3SOUCyoWyqstPFDnJef
 WwaKd5jhJ6isWq6wImBLMXOke7etQoi8jD70/MBSBHYv5utAytgbAPEPSfrKdDyrDKanOHAS3Uw
 3qfAbOu3ld+3DGyNuxGR9gKUfogV69mX1twFMUXFg01h/7HOcmqFUu4qyW79JH9Fm5zJO/kIneA
 HbwYf3HvIrn7L1rWNCiZIli0eXsOgM6StdpoUZ9ty2Vp8tBg21cFVNlkY77/RG/d4ZAsx89Kw1p
 bp3xe0sin6kUFa1weHxNQaVneoV7PfrWRYHktdBkv66MzEVc9Yneu5Hxr8HS3MmFxNSjVv5cFp0
 Mqd3su6GpsWZLIQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Debugging messages should not reveal anything about memory addresses.
This also solves arm compile test warnings:

  drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c:1034:49: error:
    format specifies type 'unsigned long long' but the argument has type 'phys_addr_t' (aka 'unsigned int') [-Werror,-Wformat]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
index 3dc86397c367d2b195badcf1fcb5f1ef39ffabd6..64a19ff39562fa4a6ba6f7e9de903f689a3d5715 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
@@ -1031,8 +1031,6 @@ static int prueth_probe(struct platform_device *pdev)
 						   (unsigned long)prueth->msmcram.va);
 	prueth->msmcram.size = msmc_ram_size;
 	memset_io(prueth->msmcram.va, 0, msmc_ram_size);
-	dev_dbg(dev, "sram: pa %llx va %p size %zx\n", prueth->msmcram.pa,
-		prueth->msmcram.va, prueth->msmcram.size);
 
 	prueth->iep0 = icss_iep_get_idx(np, 0);
 	if (IS_ERR(prueth->iep0)) {

-- 
2.43.0

