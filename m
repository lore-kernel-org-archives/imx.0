Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ED818892B
	for <imx@lists.linux.dev>; Fri, 23 Aug 2024 12:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724417504; cv=none; b=S69tMIikyLp1t1UrnEA3vMLQxo7EjVcdPIQy2p57pd0OOEJMJlGsVwXv7UohEnW6bkFO8YVoVMF4HlN6SomqhcxMz406rl/2iSHkdbpOrwrsdQlsdPaHuLjhgRo5IDiqzceUOqNvl4VMDhd3Qt/yerpxvDy8Ej83EubU/Twy7jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724417504; c=relaxed/simple;
	bh=y0QBIaJnf0/fSVbWVB0Xkg+ZYq4xy8XVXKh8rGpZrnE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vb7rArgQgsfQqr3T1i/LWqrQ9by9fBxHdlZI1bN9YAZPZ9gEvPJGgLED+FC/sAT3fgAi5SP0YZqvi6wfPAP9hQh8oxL+qFBpTUP+R49pRRWTRQ2v5nPKiaGG7OCGvSOXm0x/Kdog6raove6y6CGWtn8D+nCYWtGrLSc5mqgBf5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UMHx7xSo; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UMHx7xSo"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52efcbfacb9so376216e87.2
        for <imx@lists.linux.dev>; Fri, 23 Aug 2024 05:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724417500; x=1725022300; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPH0zYeEKEXW0yb0C0QcNli7uy5nXQcT3Asm3cghOnA=;
        b=UMHx7xSoah9MgQNNvFH+DxrAlZdCFdcLHjRmppIodoqKfFHPuN47JAO56jSuoWNP++
         CkZVNPz9Nop2iwNkq4ABkb+XGCsYhredOq8DYhZABA+C7lHJ+3VpXf5yJzyLfchSoB45
         tmpWol/tPwmeS9Xp5u2WwAmHDG88WVOZ+MZGT1CGR3UECoKmFPH29xryvQuBXyu//jwU
         5uDyx/ul6OsX+rys8y0/5M96uOLEw5mB+naYBc5Yod+kb7iW06FUQFRETUHkwNPviKpH
         p+pqOKkMv33wVSHh8SFAgpDLRHeziooYzJuoGok1pqXPEhvdoDDSmcr94lvrjBzpE9vy
         1tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724417500; x=1725022300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pPH0zYeEKEXW0yb0C0QcNli7uy5nXQcT3Asm3cghOnA=;
        b=bKceNwWusYDogt95YmAiJ54TL9e4mZc7XItaVD5fblDxwPtpSMKxpm6z2AVNhbpAX8
         DjR3YQvPO1TwV8GiqLZxquvtK8guM/eSC1LJGp1MHgTlUqU6HPtxC3n6QoGI/VyumbPJ
         tcdh+hOT4qJ2Tdn6Lrapj/znx5N8PfHRswksJrNUqgyk5tEvsCEGySTtVE5uwXffHpuX
         yDNV65QXTuqGh2hjZzS6GoAGDHzjpB33BL3IVaqls6aEEzGUpuEc4ZN5gudTDjnmHEt9
         rRDdNIWuZnMpwSYB+pfFZsGb0megPRv8KjFtFv05yxfvyhuaCdZfw9DiRJ//6wRoudiK
         UAxA==
X-Forwarded-Encrypted: i=1; AJvYcCVOrnu1tpGZ6E/H4dJDZMDNiFdsTHjTAK2+QK5oHueQIyEf20VY2fpEwSR0QiI60SLPrS4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx69IZmXacYLGb7XVNcyG+dOWBHTESkDEEK/NOC85oTyQ/ZDk7k
	jyYqeEoKWoy3LKypK2KegRBtqNkC1nCWkalPaRBhUsCk3ePuE54St5DFa/UW72E=
X-Google-Smtp-Source: AGHT+IEx9QTBZ6Ig4dC6hFm6sSZWyp2NrZPz8Q5OQ6LiyVq1B5Hos95uvD5/wXcqZMFiFAQUCs44Kw==
X-Received: by 2002:a05:6512:ea8:b0:52f:cf7e:b1bc with SMTP id 2adb3069b0e04-5343876c2a6mr830569e87.1.1724417499775;
        Fri, 23 Aug 2024 05:51:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4f384bsm255931666b.192.2024.08.23.05.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 05:51:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 23 Aug 2024 14:51:11 +0200
Subject: [PATCH 07/10] pmdomain: qcom: rpmhpd: Simplify locking with
 guard()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-cleanup-h-guard-pm-domain-v1-7-8320722eaf39@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=y0QBIaJnf0/fSVbWVB0Xkg+ZYq4xy8XVXKh8rGpZrnE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyIXK0zZ4ZGoxkalISx0Oa0HQbALLrTngWax7j
 L5WXrBsTjyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsiFygAKCRDBN2bmhouD
 1xawD/4+ne9u+0w9Ge4yGMtpLBPqws51qJWUNwZocPNFdFCwDtnWIBM/MFNMy6G7mVaitbYRu8S
 NufmqYkj3DXtJ2sKLwHYQ+wbGJkH2CKegDUkrberoehE5ecSQYeq+L8IeWTDwZ9t/8rORPyEAn3
 0x+pkG6t7Pup4fVh2PrYBqNBLimMVjnwPz/u3f9Da+qwY2cQzBoPcqDso2D9mBwsquclFCwEpQR
 RWeucQ/vUYJtFQqNxObOMA/GEDW+JSHCT4mD2CN1z1T2ASa0Co/ordw0ZJc4WuU4KjCZk9xq9Dj
 5GPBqEWzwt5f9DxLtaELBbhsyGQLEa13QryylbpEhT4Ax9ArnWkugphkF+OWJ5ewm8g5uB5xEqR
 KoLcKhf8VO506EI2bhmXkAW8+vnZmUMVyHnFQzvkDEeI7IjHYozxMcG8iYb+/3HEhwyZOL68qBx
 32uk1Gw5Yu5BWFddNZeihHUePRt4KK8NHdUfvtPQiHYylFkpEFwViCU4s3Gwuz1A8vDyFBVWvfZ
 KzAVDDXyVLMfYt/VO5iVeN4dwHtmPf9xQzkIIwd0gDwPKgC062VVJVqdTysn95/R+LPN6zp8qej
 cO2gtpfnk+e8mUL7UlFd3ZonuKOUmlacOqS2E1+zGdH5umSfmjMv+B2cyoGRXy7d/2Gac7Miz36
 HqfXODj1mLYdYeA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simplify error handling (less gotos) over locks with guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pmdomain/qcom/rpmhpd.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index d2cb4271a1ca..65505e1e2219 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (c) 2018, The Linux Foundation. All rights reserved.*/
 
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -775,9 +776,9 @@ static int rpmhpd_set_performance_state(struct generic_pm_domain *domain,
 					unsigned int level)
 {
 	struct rpmhpd *pd = domain_to_rpmhpd(domain);
-	int ret = 0, i;
+	int ret, i;
 
-	mutex_lock(&rpmhpd_lock);
+	guard(mutex)(&rpmhpd_lock);
 
 	for (i = 0; i < pd->level_count; i++)
 		if (level <= pd->level[i])
@@ -797,14 +798,12 @@ static int rpmhpd_set_performance_state(struct generic_pm_domain *domain,
 
 		ret = rpmhpd_aggregate_corner(pd, i);
 		if (ret)
-			goto out;
+			return ret;
 	}
 
 	pd->corner = i;
-out:
-	mutex_unlock(&rpmhpd_lock);
 
-	return ret;
+	return 0;
 }
 
 static int rpmhpd_update_level_mapping(struct rpmhpd *rpmhpd)

-- 
2.43.0

