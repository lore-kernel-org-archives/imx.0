Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCE6186617
	for <imx@lists.linux.dev>; Fri, 23 Aug 2024 12:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724417496; cv=none; b=rQaC8IDkPyzPdu4LIxBh/XNqyWEu9MpCdBLd6yPD3oLyj8PrttaramGn12Qz6yAN9nppGeB6Oqccw7sdlM9rREh0r+Of4668fzTG27bm+5TdnAHR5kmsAL4iVxDDbZNFYqv3/RU8fudi67663mnCG+eQW+0FhIQbve6DOKBDocE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724417496; c=relaxed/simple;
	bh=6qWKewqo7/bxcFlu9EkD12hoXBrxu7JPlLAdc+zUmSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AkwMMo/Ri7jKvx8U7HZLtdszT1fdixY7WuWIxJz/OWrhdQWQHvi0Z2MlrOzwAj4pGadTdetOo7SiMXhZISP833eRWiTKLPoOMOZSETyEAceWZPTA/QbeQmf7F7589wDeqGVoBGPHXwUYGr3WTz8mEyrcRrfVVlG7eHBfkb99n7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UkSfyHhp; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UkSfyHhp"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a86a2fb30aaso2719966b.3
        for <imx@lists.linux.dev>; Fri, 23 Aug 2024 05:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724417493; x=1725022293; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iRxioGT7mc7f/KyEL+IMNJTNgSsqnXXhip1lqUSU6yA=;
        b=UkSfyHhpNHSoEZUtBm8cRHHpZOykZB5E+YUqeMrpqO+LEy76z52caqbvl1eYJuxZsB
         9sDTPM94Sd7W+a6D5Y/c+qBbMP+XQPJkZ7klJ6lakj7b1Bi8m2KhPit1YyyyZxEDDoI0
         P4D0cDQIzB2zWEWMEpyFbKbyyTMv+cbdsn7kRc2w2Q5C1KHf3/TjrP+S1YkP2UcqJDzA
         B54YfxQEAYkno2MoSv46koQnyQADpIwGCBgvhqmcwc7DipWHINzATfqN/jrE4YboCny9
         JB+JZRPzlOeb4c8Uk/8j+s5rcXGzcEKclL9msrQgLA1P7wPBQnjgHJ7iS2t+SxQQPijF
         5TfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724417493; x=1725022293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRxioGT7mc7f/KyEL+IMNJTNgSsqnXXhip1lqUSU6yA=;
        b=SDNCZ+WlVoikJ5SD/+WidLOcio0tGfcOIK5MJ/MCJ2ewKMYHatwh/3xSJny13XiDTz
         +YvM5z/AsnJVh/yiKyWTw57GZIQlmI080a5KGEiUFVrAgIWIlTX0kKmsVbw6AW3ka74D
         iCpuS7LE2ucQUAPwtYT65ATFW7vGu6ClxiCdQdhKyR/K+cSGC4d8+WfbyA/SNvxC3wgQ
         Dywz4vFhgTjEweaWui3z9tpd6ll7qnBwsUWA63q0yUMYDK+e35wfhRz1wYo6Zy1gZaoP
         F6giKmtRjArDtaGD1btBXWmukT6YLAWoWzgwgQ1u8DeO3lWJCnJVsB04rpGJwcY1MO11
         t8Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXg4yGrwbsWIWVsi51IbhBntj7Ct6irGR+/468TN+ltxhFD2P6f4QzumWQFZdPXsfZiN1Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YzN/p9EvAa70nZA/SSIoeXXvQiQ5dvX/zWhcSbk+8oWQajD9VL5
	QsVbZnP+fD1LY+RX4fHkRMVN5GgyqNBshKptHF+rO1gotjfju3tVrqZxAu0Dj20=
X-Google-Smtp-Source: AGHT+IHMocKCRFEh+CWrcVL8T1z7ail94X2HtRLfeci96aOjLekKRRPWfihiPmUqT2nRTIvout3Lmw==
X-Received: by 2002:a17:907:7e95:b0:a7a:87b3:722f with SMTP id a640c23a62f3a-a86a52b15d1mr93167966b.3.1724417492678;
        Fri, 23 Aug 2024 05:51:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4f384bsm255931666b.192.2024.08.23.05.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 05:51:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 23 Aug 2024 14:51:07 +0200
Subject: [PATCH 03/10] pmdomain: imx: gpc: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-cleanup-h-guard-pm-domain-v1-3-8320722eaf39@linaro.org>
References: <20240823-cleanup-h-guard-pm-domain-v1-0-8320722eaf39@linaro.org>
In-Reply-To: <20240823-cleanup-h-guard-pm-domain-v1-0-8320722eaf39@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1900;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6qWKewqo7/bxcFlu9EkD12hoXBrxu7JPlLAdc+zUmSI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyIXGryEowWY/W/NRlv0M7ukHF8AYtODYM2+yB
 /lAA0KMckOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsiFxgAKCRDBN2bmhouD
 18Q2EACKdgYqni98KR6DjkFKNTDdlnmQiPfC/qbDuSnGBnEHXyalbvgwz/aMLrsZ3GSBujZsFhU
 r7C2rdmokdifJOlhbP2COkCyb4D2KLy+EMJbLpqxQck74O3r7gLnBLe/Mt0e8RstNveD9o04L8N
 IMeUE8J3ASsB+IDsZ3KaFzO5+0q3PzFNPLkU0//h6a1ecdI7hDQlzv3moQkVjP5c1pnpd6prkbD
 n4lXn80mN4rSPMzRgIau/BXt3rxEOk4raqNjnWfcnkYcTpmz1LsKkN/ELHKd4ocNArnEhMB8jNU
 c/7vsNUOZPwLCJftpXX3fIbEOD6gN6khFFtkDJprS5po4aAFbSTwgvdDXnpqz8PA9DTMXkCSs9U
 xgUaLY1eJcIqudLRYBSSUIpnn2MAQjNi0jPxfQAkXBuMKJoC2pBMs7sZPzOGkcECbGH6BLqG1cY
 26ZXqF9QACoOltgPRiNpO+mcx6ugDyvzoOF4kfXn2aN75iPIcbP+iJdJyyeYa9WoTo/juGjFdZC
 gq+M5hrVm68lUiJVb48Izn2LMSc8oAcXs2Kcu8XrNJcWzpnwYvk7cMQro4V/7xv0xTh9wQYodP5
 AtRTAd0er+83B7fur7r3B5K6piGdH50PPRVLIy36uZPybik94FX61eQrBhk5oNtnT673W6jg7L6
 eiFD4ui7kSmU3xA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pmdomain/imx/gpc.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
index 9517cce93d8a..80a4dcc77199 100644
--- a/drivers/pmdomain/imx/gpc.c
+++ b/drivers/pmdomain/imx/gpc.c
@@ -455,7 +455,6 @@ static int imx_gpc_probe(struct platform_device *pdev)
 	} else {
 		struct imx_pm_domain *domain;
 		struct platform_device *pd_pdev;
-		struct device_node *np;
 		struct clk *ipg_clk;
 		unsigned int ipg_rate_mhz;
 		int domain_index;
@@ -465,28 +464,24 @@ static int imx_gpc_probe(struct platform_device *pdev)
 			return PTR_ERR(ipg_clk);
 		ipg_rate_mhz = clk_get_rate(ipg_clk) / 1000000;
 
-		for_each_child_of_node(pgc_node, np) {
+		for_each_child_of_node_scoped(pgc_node, np) {
 			ret = of_property_read_u32(np, "reg", &domain_index);
-			if (ret) {
-				of_node_put(np);
+			if (ret)
 				return ret;
-			}
+
 			if (domain_index >= of_id_data->num_domains)
 				continue;
 
 			pd_pdev = platform_device_alloc("imx-pgc-power-domain",
 							domain_index);
-			if (!pd_pdev) {
-				of_node_put(np);
+			if (!pd_pdev)
 				return -ENOMEM;
-			}
 
 			ret = platform_device_add_data(pd_pdev,
 						       &imx_gpc_domains[domain_index],
 						       sizeof(imx_gpc_domains[domain_index]));
 			if (ret) {
 				platform_device_put(pd_pdev);
-				of_node_put(np);
 				return ret;
 			}
 			domain = pd_pdev->dev.platform_data;
@@ -500,7 +495,6 @@ static int imx_gpc_probe(struct platform_device *pdev)
 			ret = platform_device_add(pd_pdev);
 			if (ret) {
 				platform_device_put(pd_pdev);
-				of_node_put(np);
 				return ret;
 			}
 		}

-- 
2.43.0

