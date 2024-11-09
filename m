Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43B2197A92
	for <imx@lists.linux.dev>; Sat,  9 Nov 2024 12:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731156289; cv=none; b=kLfNHmNlh5N9UtX7RwCTmN+N/De69kHD1zRlVyfC11esa0/dgzYj+ok1bAndt2SP+wbU52dLGmmKGTlUKm1qrYKHfXCPnLZMlfsPYbGXZWI3nCNwBvBYUdQELOzVwDgi9iInK2S0+gfuab1fWA0lYl4xBi7eTml1LLgd32ybzH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731156289; c=relaxed/simple;
	bh=mseh9WRqz5C4m+dJG3gKVqO4w2mq1wg/wZdf/mAK3Mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hG9C6OG39iMEqiFXlDWQ8ZX47dlutHAj2uhe6A54YotqlYU66loeVOhrp5+1XqGpFVzepRLlHjmK3/FN0HPjhLA6L1inG4K8bL/cFhM7QbzgDvwiaif0HDS52tGoOVBSlIgvprRrVJHNUq6hlw9EcW9NtGMPAeR/3MoZV3nOaGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gSndkIUQ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSndkIUQ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a99f646ff1bso449487566b.2
        for <imx@lists.linux.dev>; Sat, 09 Nov 2024 04:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731156286; x=1731761086; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6NYjmB31gxcjk36kydLhN1LaoAFU9bSgURFqpBpxQVM=;
        b=gSndkIUQQ6ybvSdfezIMBZQagkk/ZFkIrN07yAPSs4ekiyj2bOcuSVGhtVL8pkoB31
         rvFqOe94E3Tb+mm1n2uWVx6ato4o1A/T9Y2L4Elavfy/L21TeMFxOnikhA9wUk/UVA03
         jqYz8NiA092pSIjBKfEJf4CGH/DXVYtotQC3eQdI8HxrsllvCJm+zQlR49I/MaDFPjrs
         RlvI3ggyXUKwnJGbzmQrkpcSGR8hwerBKOz+fzMY1GLpSnG6+ow213+N4o1YCnHpYUMe
         ZhP2euDArl41JWqipAVWxUfZgGeFs3QB0Jcl8+nxbRF7Ne1L02SNnSQF5IfrPZSSljHD
         oahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731156286; x=1731761086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6NYjmB31gxcjk36kydLhN1LaoAFU9bSgURFqpBpxQVM=;
        b=GYaEbPYZ/hsakf3WGJhpm8z2/WIn44WC24LaoIks+/eJFPSYUXdXIsX9ZYDIu27Edb
         OFA6oILviu6wiDnP/MUP1F6Jm2TxJa2ft3NcElLIJjjXOokfKmpdJHjBzWy9EASN5AqU
         aeiaXB3VS0WvbVO49+59ceKTxXa7G6OnRUdp8QQHTQXh/oMpu7OYzHW9m7xNZLHxeGGX
         AacW7237xpvm4kRHENdzpqBgLP+I2ggBMJvxcStRumalFeLjMSjMOoJhSIaD1zHptcaR
         6zSj552BXdSWouBic7tm8ln7jjmzk47bty35OhQhlfBspf76vjzhCPmGCngorVKDHzLW
         EmjA==
X-Forwarded-Encrypted: i=1; AJvYcCV0KRrz0P3K2lyHGxnbXXSmlmdC4Xf1XGCLQch/0zDHtygHX9CJpXO2hcIABY+6+vB2LxU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/KtdrrcmTkHGtIPjTpoASKAsO5LjGcW3IWXeW4zTkDksoh+UB
	GiYQ8WHz8S3s6TOVsZsOrzAyYn/yqK7RuOR2GqvLA6BgaKibisEH
X-Google-Smtp-Source: AGHT+IHmuYr9plCibE5R6SWQvYCuz+uxGfvZMDTXTYfiyiiZ0cPupHyPtkL4o3yovyQ65WSVh8GayA==
X-Received: by 2002:a17:907:7d8e:b0:a99:f183:ea8a with SMTP id a640c23a62f3a-a9eeff40bb9mr643164866b.28.1731156286012;
        Sat, 09 Nov 2024 04:44:46 -0800 (PST)
Received: from [127.0.1.1] (leased-line-46-53-189-50.telecom.by. [46.53.189.50])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03b5d793sm2940166a12.17.2024.11.09.04.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:44:45 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Sat, 09 Nov 2024 15:44:34 +0300
Subject: [PATCH 2/4] power: supply: max17042: implement dts shared-irq
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-b4-max17042-v1-2-9e2b07e54e76@gmail.com>
References: <20241109-b4-max17042-v1-0-9e2b07e54e76@gmail.com>
In-Reply-To: <20241109-b4-max17042-v1-0-9e2b07e54e76@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731156277; l=1696;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=mseh9WRqz5C4m+dJG3gKVqO4w2mq1wg/wZdf/mAK3Mc=;
 b=p6RG8L2ppMseJHrGFGFXqKD0cvO/hmr64avCyPTMrXOmpbKJvR/L7yqOw+I7HkKgDykpfAaQc
 K5rjsIUntQwDRGn+xKnFPr/5z2IEZy24Orl7n7sVxJn+1/jtzpqtQCh
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

If shared-irq specified in device tree, request irq as shared.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 drivers/power/supply/max17042_battery.c | 3 ++-
 include/linux/power/max17042_battery.h  | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
index 496c3e1f2ee6..f3d89d4d5c42 100644
--- a/drivers/power/supply/max17042_battery.c
+++ b/drivers/power/supply/max17042_battery.c
@@ -933,6 +933,7 @@ max17042_get_of_pdata(struct max17042_chip *chip)
 		pdata->vmin = INT_MIN;
 	if (of_property_read_s32(np, "maxim,over-volt", &pdata->vmax))
 		pdata->vmax = INT_MAX;
+	pdata->is_irq_shared = of_property_read_bool(np, "shared-irq");
 
 	return pdata;
 }
@@ -1109,7 +1110,7 @@ static int max17042_probe(struct i2c_client *client)
 		 * On ACPI systems the IRQ may be handled by ACPI-event code,
 		 * so we need to share (if the ACPI code is willing to share).
 		 */
-		if (acpi_id)
+		if (acpi_id || chip->pdata->is_irq_shared)
 			flags |= IRQF_SHARED | IRQF_PROBE_SHARED;
 
 		ret = devm_request_threaded_irq(&client->dev, client->irq,
diff --git a/include/linux/power/max17042_battery.h b/include/linux/power/max17042_battery.h
index c417abd2ab70..1261dbaa5e8f 100644
--- a/include/linux/power/max17042_battery.h
+++ b/include/linux/power/max17042_battery.h
@@ -250,6 +250,7 @@ struct max17042_platform_data {
 	int num_init_data; /* Number of enties in init_data array */
 	bool enable_current_sense;
 	bool enable_por_init; /* Use POR init from Maxim appnote */
+	bool is_irq_shared;
 
 	/*
 	 * R_sns in micro-ohms.

-- 
2.39.2

