Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8C51B983E
	for <imx@lists.linux.dev>; Sun, 12 Jan 2025 13:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736688786; cv=none; b=RMoXj9DDCO0z2QLddOzt/2PvD42B3qyTnZ462VNt5FcLtkkZUHOtaNCIwvBVwEan5U8KKJDOugE/Xx9fI8BTVpT8pzExVjgKq+74nOCl4mRG4RtakCHeCm+axfFE/PfkbBhi/aGuREoqKfoheKdhEEcmEAPbB5b3J2jOINUp+jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736688786; c=relaxed/simple;
	bh=9S7gVVHLbOOdhmOrgxdeq6yW9GeOcGb38tpUZkh03pU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZdPtF/qjcPqoZA5PozGwMp6szDZKpoCUHSdBuQk73GwxlmmvRZm2uyqocTTyAuwTW2s8StsWYvIqgfQeMihucE/PjUClNLylJ+P7WSm/1nrJrc0cTebb7AINP05072n9S0trXd9S3Z54lJBRhinoMhnrPP9tC6cPMmLXeqz6oYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PC/LMGfl; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PC/LMGfl"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d0bf4ec53fso632042a12.0
        for <imx@lists.linux.dev>; Sun, 12 Jan 2025 05:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736688782; x=1737293582; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BOVqy08C6GsLjB0sMrq2+YSaSxUnwU9JmLZUrKlTUz0=;
        b=PC/LMGflp+pClPe27NRhlVman8cFG9nhh0gXMTpKf5Fh4Hu3M3saNYPkA1WjoqXgmy
         ulxW5vxU/UAEFhzrkigPKoHpy26WhwZhBcknVLiUXonnkdm2u6ak5LhVXvCvCSzCfAi4
         cxGbH00tCBvcKFN4i1MC24SUXMXvxS/Wu1U9h3/qdHKrYjAxlQLP1v0sxrFnV4R8kOUJ
         vsofKBH+zBFld12QEcrkSft2oNt5GWSxX5m6Z/n7xYew8izykGTyvjfPFs6sEtlNsZmd
         5H00FEu/CCygSS4QxtvX0841xE/OKssLNuZUu89y9vXt1Wysz/6qqbIv5OnCVcTqMrS2
         PA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736688782; x=1737293582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BOVqy08C6GsLjB0sMrq2+YSaSxUnwU9JmLZUrKlTUz0=;
        b=ZJom2bne7hGNrPa3zYsUM3cSOc1XxIJe1IDWje3BV2mClqupP+0hjRHN3q5Atro0gT
         /ICAHxZJbVHy2Ho8GNCzyp5DlD8fwajQNZ6HFEyatG+yfP92Dxq6AWM9gpddqLloDBbL
         +If1ej42AQaL5YMMqHpDg+fGfxa/7AMxZWp7dZgwV+Gt6L15Urd9yOrq9+XiYvkmr7NP
         8qeucFR2nv3MasxoSFQYeZXKIy87/xPja1XInYfSAKLwAcRLG/gKTtnr0pEz0tbhke7M
         q+j9dMvtVUV2C432ysKx+3fqXdXRjQSs3SfNV80Tvj6lWpP1O1RIkU/9GW/j+QWT2Bup
         9DAg==
X-Forwarded-Encrypted: i=1; AJvYcCWMykDsusYCXOga75vhnZBP1HzgQnrDdcIWbgNTknjq0hKjJCh3Ugfo3SSSCD69fqcTPqE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzt8JzdwDvjX67knJ7e3gGWNIc40vL+Tk9u9/qO3FiScS7wpJ58
	78tjNNjF5/9NlTJ+JCFUDerQ2TNAvksJZhGhDkqi9b2ionCwCyPUQb2eX5pa2QZDOIeVKCu8YjX
	t
X-Gm-Gg: ASbGncsPoIEZrC4t/OYigAMVN8Dgp18U5Ry/hPgylO5RWKDwQYvgK9s5jZGzcmX6Ofc
	LUytOhg82mVgXNb/6ywITf670jg9eROxojjnfHCAXBa4nvbl9w700axsS0ZwDRr4A5jjwp7myp3
	DcZLJhisxkR3PNlLB/QIIQqXi9jWGW79Qc3XOA/NQLjH1D2DLgDDizLE0JkwGKCwZ0nXMvK07Ep
	aw9/7E7XxaDv6QrBaJWEElJp/iD7dLU9enOJ7z4jQzNllzc6maWlBhKnq0xNX2NRDV4jv8C
X-Google-Smtp-Source: AGHT+IHAPDDqI1itoMeCFKalJTN43D2b88pk2KL4TDUxwjUyr+2n3z7I5NTnbvxsw1RUzD8twrEPcg==
X-Received: by 2002:a05:6402:5206:b0:5d3:d747:6496 with SMTP id 4fb4d7f45d1cf-5d972e801dfmr6260298a12.10.1736688781780;
        Sun, 12 Jan 2025 05:33:01 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c4477sm3584609a12.51.2025.01.12.05.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:33:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 12 Jan 2025 14:32:44 +0100
Subject: [PATCH net-next 2/5] net: ti: icssg-prueth: Use
 syscon_regmap_lookup_by_phandle_args
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250112-syscon-phandle-args-net-v1-2-3423889935f7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1430;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=9S7gVVHLbOOdhmOrgxdeq6yW9GeOcGb38tpUZkh03pU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBng8SCCW0MlfjlA9K1TjLeHUu3QGRRtM/WgAZoC
 WMtHJkHeVGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4PEggAKCRDBN2bmhouD
 10+YD/9A02R/3MQQubS4ahQZTK/vIgEnDoLeLOZ2z6ur0SaSsl8P8g2c7riLLdYF92lSsgr7uRd
 jmeT9wLRxCkXUvDb6BlQcaqDWHzdA8yCfatXJo3i/2gmM28IQU0DZHciCQ9Er059Bd1mWk1TZDp
 LNC55whGCCGmpzxIn2wGaL7HylIHDR0oWZ2JQ+IBGe4+Iw2oTVS4tPErPl7ysAZCJbqOl8oHjI4
 ijfACgxQuzSwv72lLqmbXddZZ5BsAbYIfA0ql2sUIVsXx7/dcdo+J+1922mAUQcDtuQ3L8YdsK1
 nrT2AECb9AT2yQFJUWCFgml36SGT/AAGcCDFhEGrSm5sqmRhO+pbePafGg1SzeB/ykFZP8pbtmI
 kYyHMLG58LuLSM9wBwV7e230On5UeKDGtoQB2lhdPZqpTAypo/lNglE9T0jBII67mTOsel8rhNY
 8eWLdF/Ir8VjBmMK66BDKbEGh5NscM7qzw602iC1Zf4w/xVnMqR/P6ukm9kumXSAueVzXvGHj4P
 /9tyS3lSciwxAHxVcbKlC5/9XPgtg7i/7Ij3eN0jCdXqwbClXlaRNEYPaQ6bGPpOj4Ozpq7FzLc
 BDYupKiqx9fiH26x/CdTVFDC0seiQ9ZBJW9cttHi/2Pr2k57jYb1KWuMCQeroyLpY+MEyUYCjfb
 o98tiqTnTayP/uQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 5465bf872734a3fb9e7e481d556eaec3cce30e0e..68f1136e3db725eba239b10f337786ac735030ca 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -2559,20 +2559,15 @@ static int am65_cpsw_am654_get_efuse_macid(struct device_node *of_node,
 {
 	u32 mac_lo, mac_hi, offset;
 	struct regmap *syscon;
-	int ret;
 
-	syscon = syscon_regmap_lookup_by_phandle(of_node, "ti,syscon-efuse");
+	syscon = syscon_regmap_lookup_by_phandle_args(of_node, "ti,syscon-efuse",
+						      1, &offset);
 	if (IS_ERR(syscon)) {
 		if (PTR_ERR(syscon) == -ENODEV)
 			return 0;
 		return PTR_ERR(syscon);
 	}
 
-	ret = of_property_read_u32_index(of_node, "ti,syscon-efuse", 1,
-					 &offset);
-	if (ret)
-		return ret;
-
 	regmap_read(syscon, offset, &mac_lo);
 	regmap_read(syscon, offset + 4, &mac_hi);
 

-- 
2.43.0

