Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95859168497
	for <imx@lists.linux.dev>; Tue,  9 Jul 2024 13:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720530008; cv=none; b=WhHyNRE0z9E9IOTmT5pf77Di6Oi529hvVCuDANcNSFicRfrbxDQZC8iGgh7GhMBRqt7WjQdchruxneroBOpjeIBvLvYiQxFEbLXn7YWWo4TKvGQko9aImdn9abMyKymENijXdDvX0vjjZEreOcailJLBbskkeKYDwZ2ryX4wcuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720530008; c=relaxed/simple;
	bh=Q6+hCxLVHj6awAkKLZL/lFMRRO+jJnpOsXWYwuQTpws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oEKrmIBG8NMPKaXPfdQPOF5VPSxOpdozJ+thJrtSlUD3sRsXU36ROAoJT5Cwro8KRBGV0TlIF1dSxOY10qfpIyZlrExl8V03zyZF/9GWwgPZ/FS+p0U02BjXP6eoP1mi95/lQcjrRdK1uUG1T2FXM79Bx5XKZTRIE7UIXemEXDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uTP0Y2TW; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uTP0Y2TW"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a77cbb5e987so465066166b.3
        for <imx@lists.linux.dev>; Tue, 09 Jul 2024 06:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720530005; x=1721134805; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lpaXR5hesM6QQA2KpWYBxtlXYQSJSMhrc0LMERSNaQc=;
        b=uTP0Y2TWdMBGlCunYkcmtEbFSka/U7etFdjJ/3Au3OIStWWZLXVBypXmyr5AALRqG4
         j5bmFl39PjvLAxfcHLHFT5MEMZPXoY9xumzGEpRgt4Ohv6RteezKGl6lYd8u5RE3MdMr
         +l2GBOxUlCprcTjeVh4qeQ+vs6tOP4tbsplY582L/SdYQpaUkM3LaIMh/3oQI/EwukMm
         cBj/gjXKQZHMtIKZ0nxsYLQ/1UuUlPuNBsMHCckmMc6WIUm4Yp+0snORxVj1wyH7diGN
         zjm6w2PqYWyibZwA5gXHOkucpAp9gmpuV7aqLU0vTZNOjI+hjgd02xAyFs3WdvZ41XOV
         rsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720530005; x=1721134805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpaXR5hesM6QQA2KpWYBxtlXYQSJSMhrc0LMERSNaQc=;
        b=ke/A2rZLdd0h0iH4sSHiQLSK2jGv80mCRAh28Sv66qLJZHEcP3t7a5/6k2uXvykQFJ
         yuhv66EARLzpsMBXj5/vUCDX02Kl5CFLxyVc1xVtU1xQbjabo7VClyEQXEvTC1ktdeMz
         wh79ttAD1ms0mbrsHP/cVz+0Z/430wf8zPumx+D/W815cTrNQ94m1xmPUc8Zyx7/5bTE
         1lmOEX6Mv7ueuFhZgr4cs/lxglaymCnSqyXVu6jiOlfsNo9CLfoYqXxxOxqEBFXX1mux
         Da+vfUKT93DTUT/p8NJVvez0DHqJ/MwkUtN/L2myt4/ksgml9Ghmbub3pQnFqquGyuQL
         UKeA==
X-Forwarded-Encrypted: i=1; AJvYcCXNuaatcoJ7z5GPjwjXsfhJu0YI4g83b0HveiQMRgR2S3wH24Lvyoj29W/oGn6Lq47c+8g78VJm40aACpq508n5lXvm
X-Gm-Message-State: AOJu0Yy+m6+t2FQ+oAJm9Ybe1Z9WkSsjb7q1R5Ymzfm2DGK0yujClkac
	OnYGqZeEzkoFPua1sZFaeskumXafVNSG2DcC68nU9WLrhN7HkwBp7hgH6h+svVw=
X-Google-Smtp-Source: AGHT+IFpuXSVDfR9zcYD6UEE6dUM0zQ38CBB1md2Ad0sjVV+v+MC1CRRqx3iEirLTHQ2eq8mi1TqYA==
X-Received: by 2002:a17:906:fb96:b0:a77:c26c:a56e with SMTP id a640c23a62f3a-a780b7053cfmr141321866b.45.1720530005087;
        Tue, 09 Jul 2024 06:00:05 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6e157bsm76643166b.80.2024.07.09.06.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 06:00:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 09 Jul 2024 14:59:36 +0200
Subject: [PATCH 06/12] thermal/drivers/hisi: simplify with dev_err_probe()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-thermal-probe-v1-6-241644e2b6e0@linaro.org>
References: <20240709-thermal-probe-v1-0-241644e2b6e0@linaro.org>
In-Reply-To: <20240709-thermal-probe-v1-0-241644e2b6e0@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1065;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Q6+hCxLVHj6awAkKLZL/lFMRRO+jJnpOsXWYwuQTpws=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmjTRBwaAjkvl6lx45yY9/ImDeEubME5uwgWFGE
 i+bNA0kPUGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZo00QQAKCRDBN2bmhouD
 11BuD/4vPwK3V9A2LjND5Im9CSALekgwK8+81reARKO6RvGE9eBpawhpL5BznjBw1QsJ6n5wEDW
 u4HfkL6X73SnVpVPx3wBkV55taP5y2WeYsDyuiSHFVYjPy+iGBCstOTmi+I2w9ep99Qoi+C4f0S
 saeTt6RowTWLn+n8PNcDYWh0bl6kkVTt25vdxaIEkifGnPnDCOUPrcA9eG0BzgEk4B1pXdyxQun
 xnzdYByJAnsbHiozgVSObIsmTDQfpk5guaL10G+OlcAWbN8L1i1pAukfDqQvcgRJGuAKviAWrkg
 EX+bMPSx0PZi2MtGkX53wq5+BHeGXMTuLFGuYXqXKE3i2FhBwAjY5wJp8+ay7pr3PVITVz4/5pD
 7bf+V8ig7bAjt2E7vXkYTf79XHF+bZZnmyyyOZfANe/PGCcn7TAS+WTz9KBuN2zDgnYHcpcnIZG
 il2JHZSSkpyLmdulaW1Zw9To9yd7c6+A3okG8069epEysKAZ90Jy+Vg7xOjiLCe0q5/n27wcgFv
 oh6z4UgCqokMVSzGM/BdzM5D1DhOqbjQ99uxdOBtm7s3jSZHxnXnl/4v2XW0SNCdrgze9x9ttdu
 /+Kw/YJn0iYsTK/MqqjfXF/gOCBGincfblbkRGlpqnqB25c0g8opnegbeXBSaEu0tf3nGxYLLZN
 Hj6BN/VzrNndFyw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Error handling in probe() can be a bit simpler with dev_err_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/hisi_thermal.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/hisi_thermal.c b/drivers/thermal/hisi_thermal.c
index dd751ae63608..0eb657db62e4 100644
--- a/drivers/thermal/hisi_thermal.c
+++ b/drivers/thermal/hisi_thermal.c
@@ -388,15 +388,10 @@ static int hi6220_thermal_probe(struct hisi_thermal_data *data)
 {
 	struct platform_device *pdev = data->pdev;
 	struct device *dev = &pdev->dev;
-	int ret;
 
 	data->clk = devm_clk_get(dev, "thermal_clk");
-	if (IS_ERR(data->clk)) {
-		ret = PTR_ERR(data->clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get thermal clk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(data->clk))
+		return dev_err_probe(dev, PTR_ERR(data->clk), "failed to get thermal clk\n");
 
 	data->sensor = devm_kzalloc(dev, sizeof(*data->sensor), GFP_KERNEL);
 	if (!data->sensor)

-- 
2.43.0

