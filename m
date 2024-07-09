Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0271816C842
	for <imx@lists.linux.dev>; Tue,  9 Jul 2024 13:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720530011; cv=none; b=BAJRwOog0Wm3ez9R5lpgtdnDSWKbCDhfbDQ2UZLGQMvtQs6t/GHFBLyOomDySlzwH1bRNr0z/dUccujWLESp7tegUwR4ZTzuzICRbMnvEYVEFVaZQO4QnsPArPeZlS9EjzUhtxxWXnqZsV8qc5gZ+blHM/An5HnTVCY+rJNixEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720530011; c=relaxed/simple;
	bh=tbr6PgVNmRzkFl13kOpzZaHhhH1RUnpU3lH7vfxTRvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r1m/PdFAKVhxblp486QjtXME3yjYv483wvbOtqxZ/CwoY5+CrCdtERiAebQQSoxMZyWsKBhTH0/H+cNuIpGgVDbK5D11W9XVymWdQNZ0aiZs+wmfWex9A/sQ/X/NO2UQVcCSW9zfiQvxp1rBi28KHl1Qf81BLGNftdqoicLWP3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ISMEpCDn; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ISMEpCDn"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a77c9d3e593so445034966b.0
        for <imx@lists.linux.dev>; Tue, 09 Jul 2024 06:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720530008; x=1721134808; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gd8VbJ3ePG1fDwdnkHZrN6+gKJ9mBLGNqM6Qogu2910=;
        b=ISMEpCDnkvQyP2CiwMpxC9LwUh9MzgR6KwI+svfUtTNYHf1Pal6sPAdklFW+uwk1iR
         sbhLZsHo8TEKRXYKeUt4hpTczxwkOeZ7YB3+5M/Ws+y5N+QeOeZ0vLjPAsXF6dPeoF0+
         E9fqQIWX9+Eaf7vsxCxsX6sclkSLMn/19PkvJlQCWYVV0kHVTHzq2bsMe00PQA1G6s6e
         16GbCQbl5KgGNiJBqhPH+DUSt9qP7ibQbB61bl4koMmOf5fCsHec+HUOgFqH1tXfw7bQ
         7oET85waUTV5YJgnq8xjn6vQulC5foENlS8ynS3/8oVi8UmD8lmjKjFCuUsilZ8e9d5A
         VKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720530008; x=1721134808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gd8VbJ3ePG1fDwdnkHZrN6+gKJ9mBLGNqM6Qogu2910=;
        b=R9CQKTCxqSX46RpaOPQoH6jemyDs9qM2pg3HQhXON70NRe8m9ylODfeSv/zpAf0GQe
         w/KhnmEnJcPRBV4XgfwOxXW7ZoofmPUPJqsOWpj6ejiIS3sszGDVhNP10N80q3LfIeKO
         OxXdYyX9pdN401Jpjeq8WpBA8PULG6qeqk/hI/lELfiMY7R3NwrFg4jQjr77rWDAGf/D
         DXE4j8WtdzsZne6Fo/hOcSahCxvDJ18TlzFSE7gsjHYOJiguOybNlBNkvYp81FdJam2m
         F0OQVLWnE+exmupXaS7oQHyndsikqkEjXPnDW32fI1cL2TGMqEi3MIOi2znU/Wzwot1E
         5jfw==
X-Forwarded-Encrypted: i=1; AJvYcCVHMWdy0hVDS6t4wQyOlTCSRo397QgSwt6CU38KGy900SkYR1jYMoQ7K4Ai8cUnZCQyXDzxKJswfj07UixXNP/4AK16
X-Gm-Message-State: AOJu0YzZ43G0but6n6MS145wV1laS6JJ1e1DIUP+qTeffaF6bt91Y0Lw
	+Xe82XyJUYu6H1PPAXsIXdI/McYxQrqTNFEMxMYXw2yU8GWQ/ZYP5o8nOwf/BtQ=
X-Google-Smtp-Source: AGHT+IEjW/UsJohNSfeBsSugxbsviw/3TGejetmmkt90XFqWU53RnQehbG4JwQcqefAPiYe5iS5BSw==
X-Received: by 2002:a17:906:4715:b0:a77:c525:5c70 with SMTP id a640c23a62f3a-a780b6b1901mr177894266b.32.1720530008418;
        Tue, 09 Jul 2024 06:00:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6e157bsm76643166b.80.2024.07.09.06.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 06:00:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 09 Jul 2024 14:59:38 +0200
Subject: [PATCH 08/12] thermal/drivers/imx: simplify with dev_err_probe()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-thermal-probe-v1-8-241644e2b6e0@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=860;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=tbr6PgVNmRzkFl13kOpzZaHhhH1RUnpU3lH7vfxTRvg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmjTRDz6ULAooyIR/nRlEWHSnnlmjdSZ27//W+I
 SA+eptt/ICJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZo00QwAKCRDBN2bmhouD
 18ObD/9y04bIJtYRViQ9nSmrQCT/Z+mpv9+By83hpVNivTpZFLo7X8j/m3es1Qyl47e1LALCIhR
 1PoBYYYc08ic70bYofzLn021hBdarIWbETDTWaUWnZEzYq7D5gVtaESAPW886+9QfegseTa/zfF
 Llw37q8hOvQLlfxBY3ev9Alwwq3MJDzWYUkVjy4G5kLChtPglSU/Uyjpr8wBkSTlhB5QRJT6pL1
 oUYaAh+6R/brIWgvGBO362D3FT4T8h4g9/0Nt5Od+UFbhKT3UIWyymmip8XpP4N+Gls5ncV69TN
 kDfJsQNrrbfHAZa9DyqdLMKaVWAWGMrKNsdHl2PAc6m6wH7xvDRbkFpstRhSgsprC+n/Ee5+znq
 UPkhh3bs+qdYtz8ClFuVjQu3CYcnwklAbf7bbUVticdukTNt2s3QUtu7gOyC/kjJAmnWfJtlJ42
 8752DAdOe/aDz8VZGjxLAKfRZSrPKPOJ+JU+AiwBx5Z4SdHPaf9DUuaKs32DKjPNpJ3nP88JGv0
 /Dyi2loHDCxJtagwisIoFgvNOOQfUWzJdLBa2S68arOgq8jfABTo7byEvx790PwTuWD5hxXkaV/
 fj/5iuQ9RFc4Her0dpjLSXHGxcrPWG8vDFxT+wIhyzSdDvTK+qPUe9SNAA4AQ/Ft4IU5ZSYijBI
 fi85lsTR8VGHGpQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Error handling in probe() can be a bit simpler with dev_err_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/imx_thermal.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
index 05c24be5343f..432d21cbd2b3 100644
--- a/drivers/thermal/imx_thermal.c
+++ b/drivers/thermal/imx_thermal.c
@@ -679,9 +679,7 @@ static int imx_thermal_probe(struct platform_device *pdev)
 
 	data->thermal_clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(data->thermal_clk)) {
-		ret = PTR_ERR(data->thermal_clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get thermal clk: %d\n", ret);
+		ret = dev_err_probe(dev, PTR_ERR(data->thermal_clk), "failed to get thermal clk\n");
 		goto legacy_cleanup;
 	}
 

-- 
2.43.0

