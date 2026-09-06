Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3B83932C6
	for <imx@lists.linux.dev>; Sun,  6 Sep 2026 06:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788675521; cv=none; b=jCDi5RWBq6yTHz0o6yfC5zoXDFdOODNfzIRMzRjE1W8767XaDrhyOHPSxgGMLT6rN2dR08Q+0LN3fcYIzw0t1Xre/HCqy/hmc3WWIiCl+nVOdnWC0rhhHydSCiWMahHAxxZ6u015XY0X9oOLR64OmGQYZsHCIrZLDHx4LosOrXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788675521; c=relaxed/simple;
	bh=8n3mEnNKovFjnBAX/ZxC1AAlOybpUSBUOYFHeJFtLpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YY1uTOs5KqkAkRAMicwM04vleo4sHt0sm1AldxvM1oYLCoXLUxYb2iJqr8Om1VbIv9a6ApjsovbvifZMCw1hVeuA88P9zG9zbUZKXZZdCEvZqRUI7mrhNqRdiBRNuvuDjiRAI7RcC2idPD7XzEzsbcZW9yeMZFbtTIwXsqbN6MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IsKGANWA; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsKGANWA"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ce98cb8165so24877795ad.1
        for <imx@lists.linux.dev>; Sat, 05 Sep 2026 23:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788675519; x=1789280319; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hstsV69fzA6quKQkqDKfuqXm3E+lvYW6BhdgjeUuEU8=;
        b=IsKGANWAgC/1uG2ic28MdSuLTZ482U0B/l0o51nJjybE7mzzhy/RXL1py99ZIwx7Vg
         6UHZB/6NxxFzOMDssIkMV9OJE6jP/WiLBn9UA/2pBqurHX+59qMnugpvUPchVw59Q4Fe
         CZ0yV8o315/Y1+UvOTmv3WAAERE0xxBPt9OtA7vrBGJlhl731qdDnbqdP3NG747nTwu9
         PRL2Rwr/Ol27xeU41JGZIavWlIwJl6SoKGK0yir+2xoIghsE193IHDWVY7OGMgm8ufXi
         BWuePa9n45ZQ3Cl9Rmw2F8MmgjRzF6pOICZQTRWy3OPSGXYh31sjlRwB5mIQKuSe4DSz
         HdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788675519; x=1789280319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hstsV69fzA6quKQkqDKfuqXm3E+lvYW6BhdgjeUuEU8=;
        b=OvBJjnyhhRS9TgM4BZWowMQ9ZmHgUhu3Xgl0kY67NU0dU63xM43leKn5lhqGaiXxeC
         puwdvZvg8CjIY5KOfn2ShyBrbmjD2j4Ax6eXuWYArkksHN8qt23U1EwXEcOOJRcJEsMd
         4fjxrABF3AEh9v4Z8sI5yCNzEFMe+q/5bOjnpILQNX6p0mtb9fkSQh27VplwyRSvhSP3
         x/VSQpzPo9QFZGn9adpe03+gHd5WMXwn76O+RwTA+wquiIWospoqX2UOS58LQsw2RnhY
         pongEtQ2rhnGF40YbZHSdupQB5queM2Yj4xI93qBykXqtuuzQQqqd03vVPzZy2+VBfMW
         9U3A==
X-Forwarded-Encrypted: i=1; AKwUvByn/ODBC4Zn2UrgawndCmrN3phjkOcspsH0ny9DKfp+so1hCAGqTqnqC0LiLTJjHSenuvY=@lists.linux.dev
X-Gm-Message-State: AFuF++kCgH1d+SHk65PaEKC1IAczw/qNozdCtlWCg1NoLIWPNXPRcmJ/
	bWANezdNwQQfwgZQ7TtTb2o1yejc6ufb6JhfI7RcdpoexrNtgtSsxeXF
X-Gm-Gg: AYBFou1HU30VPQV9SmMYyloYcZNslZCtsYH6nwUvouuzrExGM0A3EfI9S3Je/tQMtDk
	ShYhfmWq/GG49lLpHkudB8xR+puYDaWfs/p8gwQx+RseeAD1GNmEVNky+D1QTLyXoosc767eRgM
	iwIo0fTnxY2zaFGaYMe9Gkda89TbaYDgzbnB9Jh9EFEQvm5AeOmyQVn15vWdfYPXi4flddUGidA
	d8STEodp7Sk1s9VeMrpqzr1vBj/89lyrYrn0lkZQB+hlIf4AfMDdUBeyw4tgFiVAhhL24WzrMFa
	H0HWfTUmoy8t0X6F2XZOkjHdlEScnVnb5ItZt8n3vDIf8dJNECmvDD/3iVgLlZegBtejEF/JuMs
	uyTb1Tj+E8E6jerZI9eAoN8hkxmL7daR3ZjyCO7xFbVnAOhDCHE53A34td/NSWF9xedADC7QpIf
	+hxo0KTl/806mca3iF46HUKS/yPdQDD/UuLWvDla6cOAdJ0Aiup1y61wXKqQE=
X-Received: by 2002:a17:903:1247:b0:2d8:d4d2:d137 with SMTP id d9443c01a7336-2dafb136bd7mr193207445ad.19.1788675518720;
        Sat, 05 Sep 2026 23:18:38 -0700 (PDT)
Received: from gmail.com ([58.84.62.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm18280405eec.12.2026.09.05.23.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 23:18:38 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	krzk@kernel.org,
	peter.griffin@linaro.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sven@kernel.org,
	j@jannau.net,
	marcan@marcan.st,
	casey.connolly@linaro.org,
	sre@kernel.org,
	wens@kernel.org,
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH 2/5] thermal: Use %pe to print error pointers symbolically
Date: Sun,  6 Sep 2026 11:47:51 +0530
Message-ID: <20260906061755.5103-3-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260906061755.5103-1-sumeet4linux@gmail.com>
References: <20260906061755.5103-1-sumeet4linux@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
to pr_err() and dev_err(). The %pe format specifier prints a symbolic error
name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it
falls back gracefully and prints the raw integer value. This makes messages
more readable without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/thermal/cpufreq_cooling.c        | 4 ++--
 drivers/thermal/devfreq_cooling.c        | 4 ++--
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 4 ++--
 drivers/thermal/thermal_mmio.c           | 3 +--
 drivers/thermal/uniphier_thermal.c       | 3 +--
 5 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_cooling.c
index 768859a7aed0..856d619370db 100644
--- a/drivers/thermal/cpufreq_cooling.c
+++ b/drivers/thermal/cpufreq_cooling.c
@@ -661,8 +661,8 @@ of_cpufreq_cooling_register(struct cpufreq_policy *policy)
 
 		cdev = __cpufreq_cooling_register(np, policy, em);
 		if (IS_ERR(cdev)) {
-			pr_err("cpufreq_cooling: cpu%d failed to register as cooling device: %ld\n",
-			       policy->cpu, PTR_ERR(cdev));
+			pr_err("cpufreq_cooling: cpu%d failed to register as cooling device: %pe\n",
+			       policy->cpu, cdev);
 			cdev = NULL;
 		}
 	}
diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_cooling.c
index 0330a8112832..9ada52cbf7dd 100644
--- a/drivers/thermal/devfreq_cooling.c
+++ b/drivers/thermal/devfreq_cooling.c
@@ -156,8 +156,8 @@ static unsigned long get_voltage(struct devfreq *df, unsigned long freq)
 		opp = dev_pm_opp_find_freq_exact(dev, freq, false);
 
 	if (IS_ERR(opp)) {
-		dev_err_ratelimited(dev, "Failed to find OPP for frequency %lu: %ld\n",
-				    freq, PTR_ERR(opp));
+		dev_err_ratelimited(dev, "Failed to find OPP for frequency %lu: %pe\n",
+				    freq, opp);
 		return 0;
 	}
 
diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
index af72db6299cd..4554a6fa55d1 100644
--- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
+++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
@@ -680,8 +680,8 @@ static int adc_tm5_register_tzd(struct adc_tm5_chip *adc_tm)
 				continue;
 			}
 
-			dev_err(adc_tm->dev, "Error registering TZ zone for channel %d: %ld\n",
-				adc_tm->channels[i].channel, PTR_ERR(tzd));
+			dev_err(adc_tm->dev, "Error registering TZ zone for channel %d: %pe\n",
+				adc_tm->channels[i].channel, tzd);
 			return PTR_ERR(tzd);
 		}
 		adc_tm->channels[i].tzd = tzd;
diff --git a/drivers/thermal/thermal_mmio.c b/drivers/thermal/thermal_mmio.c
index 6845756ad5e7..b34e70991d3d 100644
--- a/drivers/thermal/thermal_mmio.c
+++ b/drivers/thermal/thermal_mmio.c
@@ -71,8 +71,7 @@ static int thermal_mmio_probe(struct platform_device *pdev)
 						     &thermal_mmio_ops);
 	if (IS_ERR(thermal_zone)) {
 		dev_err(&pdev->dev,
-			"failed to register sensor (%ld)\n",
-			PTR_ERR(thermal_zone));
+			"failed to register sensor (%pe)\n", thermal_zone);
 		return PTR_ERR(thermal_zone);
 	}
 
diff --git a/drivers/thermal/uniphier_thermal.c b/drivers/thermal/uniphier_thermal.c
index 1a04294effea..e451674d9709 100644
--- a/drivers/thermal/uniphier_thermal.c
+++ b/drivers/thermal/uniphier_thermal.c
@@ -286,8 +286,7 @@ static int uniphier_tm_probe(struct platform_device *pdev)
 	regmap = syscon_node_to_regmap(parent);
 	of_node_put(parent);
 	if (IS_ERR(regmap)) {
-		dev_err(dev, "failed to get regmap (error %ld)\n",
-			PTR_ERR(regmap));
+		dev_err(dev, "failed to get regmap (error %pe)\n", regmap);
 		return PTR_ERR(regmap);
 	}
 	tdev->regmap = regmap;
-- 
2.43.0

