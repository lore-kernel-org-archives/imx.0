Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F42A186608
	for <imx@lists.linux.dev>; Fri, 23 Aug 2024 12:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724417509; cv=none; b=L+As7pkfdOdjXJpEgMG/QhbPWHdFN3dvAWZ/qn9DpM4eKs365x9qk+du7sfSYQ/lgmThkJE+rmfu41sRHEwhBGzJPDkSLwfskhSUn7QOgYGR6PDfHr0e/h4ZdVQgb6/N3Zi5Tci/XhmHx5lbDz46TD4STXJ/VL9nEY79Lu6wx9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724417509; c=relaxed/simple;
	bh=RaCHoWfcvN19DBMmkgIRc0NGUjytTpFgVMcU13mcxgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jmh/opzzE++/nj2LUlFEzbjkCYOIreSL3jjGf/0bSboMqx4LCRk+fnJFiywwyNwQpV2JU1PKgYqKFsYaUkib5Kqx6mflcbBjOi9YyCZQasuJMzL/iId9wbyPEfcQRbDRJgV+h0KnVD2MReshHS9PzJDHpOr17AyeiR0iLTBeS+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k5WpYSRo; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k5WpYSRo"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a86a07b2b2aso4693266b.1
        for <imx@lists.linux.dev>; Fri, 23 Aug 2024 05:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724417505; x=1725022305; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/rp37AUE8o1pDdOTGLdrCW8KtmisO6ANjwH8PgBb0ls=;
        b=k5WpYSRoEc18CunQrOsncFBOw7wuEHBf5IxFLlFWXaz3awuGC5H8fWrcz3N3/DVgSN
         5levasLXYIlSxPRBNkiR4rleLCB9wFPg8vaaW/8HAmY69Zld7Jn12e3C0RmKqBQzTnld
         L15vyB2UVQTKNf2FP7f2qZj5NOQmOd7b2e7l89NpA3GM/ONpdlgDZO0XMMvUuy+XIAvu
         yjs5TU4Yqy31qBzIItDHIYlBbkL2AxquiVlm4uMNrNIXv0eo2w+1OFKmtXq8QSJJ5CYZ
         qa174lhcYQialkwPQKPRoHb6PxE3oMPxh1D5th4E/WYJ56VkNo7rMXbJIeZ1co26aglh
         r3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724417505; x=1725022305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rp37AUE8o1pDdOTGLdrCW8KtmisO6ANjwH8PgBb0ls=;
        b=YpNMyiF9r9181pykGSYGnwPSulVP/tBE/LDgy221w9UkSIbuoIRIrrconz5JS/7RjG
         Szt14m4EF283F/kvtQagCqXIpk4lGEvWi1moDOk9Jjr7U50bsPq1b0XHGx1cdNDNudSo
         sIMRbstJOmhoMJqRxADqrJoz9fF9PwKrUvb9FFflzVWdBw0J9mJNTOKYM666I6+7R+2i
         I1PfBQymJTee7KpMjkmcQMM0Hr+gPSzRMTAhLOUhhnjQesaqXgIrDizUIx6K4scQzx4B
         YG7/WeKJXpPsEGtdXKLzJKJepcRNUMiRZlljumRK6MhWogwuOT/b8puvzubcoMdVdGow
         wmrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdwArmLVKIKfE2nZ1OZVqbVOXdiLJGmWE/H6dZHhokT8XQXT5ITA3/1xrdtrSUpqGRTrM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNyLL9aUy/5pgPfbhfsJpXyoApGUHcFPSZEGDNOZJr5PDM7zKG
	Ec/RzrNnU+MhhEzxXRAhwunkYH8pr2pNvfeu5B9Ydsfkqhb8NyoaQL07kycG7lc=
X-Google-Smtp-Source: AGHT+IE1+3Q98ogeUT94jLgiJMspBnSs1Bmg9/MGG8bMaWFikVo5szbklH8yaPLEJlsyUwI0svusGA==
X-Received: by 2002:a17:906:c355:b0:a86:a694:aaff with SMTP id a640c23a62f3a-a86a694abe2mr75972666b.1.1724417504852;
        Fri, 23 Aug 2024 05:51:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4f384bsm255931666b.192.2024.08.23.05.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 05:51:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 23 Aug 2024 14:51:14 +0200
Subject: [PATCH 10/10] pmdomain: renesas: rcar-sysc: Use scoped device node
 handling to simplify error paths
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-cleanup-h-guard-pm-domain-v1-10-8320722eaf39@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3056;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=RaCHoWfcvN19DBMmkgIRc0NGUjytTpFgVMcU13mcxgo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyIXNR2zayhDCmXFhzQ1RKmq8aC4JQfASOX82l
 qQyhlx44UOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsiFzQAKCRDBN2bmhouD
 1xL8D/9RUFSYlgRZQEabYs+Zlod9oIJejL78n+4Ll7xzEa+aucx3mi/5XlXocpJxNV+gOzHmnL5
 pTAKjf9vr2rrSCFpdxWqcebEDpOfdp3FhZVpBNUc1h/OP5bjr184cjhi7i9TuCDo/iVdB0pUXdN
 M76MCTdDAD/bgYmwRgVMQpXF1J769uZTGjSJmi58B0VRQhOhJgjmrSLchp8/NAEnWPwerPXMCkm
 eB714yX5DLHHI+JfhnayFx/N2/E534xyEO1HvsBvfioJrdNphfVPfe4xI/qOHupvYmd5t+/9Ghd
 in1T0ooZnRBOqqF/8HZO+fb5oZPBETF2hHD6X7fMDmFhHDfW6lReeoDHG+ru1B6TG9NLvU0x98u
 wrOOoAXHWLuo2AT/cJjkItEh9Q4T0t0HZ4GscFMohXEJ+GKyoOgFKiAgIBfVgaeJ9bfTpT6teuW
 zljMa7caswrosPMTvLgRiWDI6NIuUAP1HdpDhMSMerJwDdR3mM18CodSRTqDknlhCH8Tff/UyzE
 YQqB1Shvtr1g7dD8+6Ajdjhu72i65o1lOBEcq/i6nT6QV3efKKqIzTcF1WoXBmdjq5ZQQyxC71v
 yN682xplaXESoBHsCxOVmTmEK5SdClLG2XTLvLhB2ErFuaqOK91wtibYaqRUCEPcNvHLuNxW/fR
 7csJsV6ahkbU4zA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pmdomain/renesas/rcar-sysc.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/pmdomain/renesas/rcar-sysc.c b/drivers/pmdomain/renesas/rcar-sysc.c
index b99326917330..da169eed638c 100644
--- a/drivers/pmdomain/renesas/rcar-sysc.c
+++ b/drivers/pmdomain/renesas/rcar-sysc.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2015-2017 Glider bvba
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk/renesas.h>
 #include <linux/delay.h>
 #include <linux/err.h>
@@ -348,12 +349,12 @@ static int __init rcar_sysc_pd_init(void)
 	const struct rcar_sysc_info *info;
 	const struct of_device_id *match;
 	struct rcar_pm_domains *domains;
-	struct device_node *np;
 	void __iomem *base;
 	unsigned int i;
 	int error;
 
-	np = of_find_matching_node_and_match(NULL, rcar_sysc_matches, &match);
+	struct device_node *np __free(device_node) =
+		of_find_matching_node_and_match(NULL, rcar_sysc_matches, &match);
 	if (!np)
 		return -ENODEV;
 
@@ -362,7 +363,7 @@ static int __init rcar_sysc_pd_init(void)
 	if (info->init) {
 		error = info->init();
 		if (error)
-			goto out_put;
+			return error;
 	}
 
 	has_cpg_mstp = of_find_compatible_node(NULL, NULL,
@@ -371,8 +372,7 @@ static int __init rcar_sysc_pd_init(void)
 	base = of_iomap(np, 0);
 	if (!base) {
 		pr_warn("%pOF: Cannot map regs\n", np);
-		error = -ENOMEM;
-		goto out_put;
+		return -ENOMEM;
 	}
 
 	rcar_sysc_base = base;
@@ -382,10 +382,8 @@ static int __init rcar_sysc_pd_init(void)
 	rcar_sysc_extmask_val = info->extmask_val;
 
 	domains = kzalloc(sizeof(*domains), GFP_KERNEL);
-	if (!domains) {
-		error = -ENOMEM;
-		goto out_put;
-	}
+	if (!domains)
+		return -ENOMEM;
 
 	domains->onecell_data.domains = domains->domains;
 	domains->onecell_data.num_domains = ARRAY_SIZE(domains->domains);
@@ -403,10 +401,8 @@ static int __init rcar_sysc_pd_init(void)
 
 		n = strlen(area->name) + 1;
 		pd = kzalloc(sizeof(*pd) + n, GFP_KERNEL);
-		if (!pd) {
-			error = -ENOMEM;
-			goto out_put;
-		}
+		if (!pd)
+			return -ENOMEM;
 
 		memcpy(pd->name, area->name, n);
 		pd->genpd.name = pd->name;
@@ -417,7 +413,7 @@ static int __init rcar_sysc_pd_init(void)
 
 		error = rcar_sysc_pd_setup(pd);
 		if (error)
-			goto out_put;
+			return error;
 
 		domains->domains[area->isr_bit] = &pd->genpd;
 
@@ -429,7 +425,7 @@ static int __init rcar_sysc_pd_init(void)
 		if (error) {
 			pr_warn("Failed to add PM subdomain %s to parent %u\n",
 				area->name, area->parent);
-			goto out_put;
+			return error;
 		}
 	}
 
@@ -437,8 +433,6 @@ static int __init rcar_sysc_pd_init(void)
 	if (!error)
 		fwnode_dev_initialized(of_fwnode_handle(np), true);
 
-out_put:
-	of_node_put(np);
 	return error;
 }
 early_initcall(rcar_sysc_pd_init);

-- 
2.43.0

