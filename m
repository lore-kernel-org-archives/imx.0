Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E50E13E6BE
	for <imx@lists.linux.dev>; Thu, 28 Mar 2024 22:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711664014; cv=none; b=e3A5pQsBAj+65/tMqb333QdbbeAWkCZEGGNVVT0NIZGifofZoXLHIpoZwp1vkcLMPn7dl4mX5Hawz8ZarWxkL1W+MAHLdrovnnxIw4i0Rd7zyMyjdu7PIg8lRryG3CDjWFNej/797p9C4A7a3HnEXckFw2S9jrN/7FA6ws4aJTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711664014; c=relaxed/simple;
	bh=hNKwxlpIRMofjLKgvThjdMhRnTxXaAUQdW94byqwPUQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sPv6BVtj0KZhh+shIttcZtq/C2KTjNETY9cnsXGBp+CiuvvDNVQj9q1BDZQY7/xJMEHnPO0sGkAcojXMiBLr5/IOCO8CX/ma59nu6lUPYgcvzFik6DsrRnf17aVSbTe5TuTmIpc/yaxOfHHO3mUgBVnczUuYnjEfQwGqKTq+NNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3s83Paf; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3s83Paf"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4149746f80aso10021915e9.1
        for <imx@lists.linux.dev>; Thu, 28 Mar 2024 15:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711664010; x=1712268810; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOXglrUw9o7LU52nMs5DSblSu76XNxKwQCT3ejBLoqI=;
        b=T3s83PaffB7x2dR86Zv6TD5spWrhf2u+Fdjwx/c4e7czWzl2sGlCaICR8OfcbCY8dY
         lO7Ma1LdGeOYcqsmS/duWdOwytmNaQqWuwghljcpT2x2NefVI7o5dD+PRWOywyZTIJZ1
         sLQK03/4/8jkNmlHuJXxHjUJpB8przaRJpMKLcWycsDsOSffCQJNSaE+diRN5vT+BaZl
         F0yatKTpsRzLpIzI71DYz2p0+RHnI4pdwCdWUs4iGAzv8xBsN4CnjfhqWoPz92noH0z7
         ylLGDbTHZNpbyFyM07Qtq0ZHRqpTSAGBcqoUcR6DRsjc0YSLkDtSUXltDRosWOlmyh8o
         x+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711664010; x=1712268810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOXglrUw9o7LU52nMs5DSblSu76XNxKwQCT3ejBLoqI=;
        b=QL7mvyLE8Q/WwbTF2GnXlNPQWdYFUSYJxENBhUhEI9nNVZp+4gKGepx4TXKgVdr0R+
         m/dlMhvV6Rbzg2ycn1TUlyrOd2ug4kj9sDVbc9Y8P7cQqG6aPLnKx2gcAw3t8Y06yCmt
         45eHdoU6+RA11RA9fXObjdSMtC3CukYZ7ka6vBXMpvgQ0rvRwpPdTo8cmxnpLAnMEsq4
         7rISb8QRuNezhT3VikAErw7kZ3au3RJxi6cwFVnCtP+NN2urpbv64gyv1l2CVZdxPHV8
         buj6lPm88FAMuzDEaWHja2NT8F5hSgspeVrD+R6eKsFai8O9oRx4tSmm2vIZGK9td7zt
         IwRA==
X-Forwarded-Encrypted: i=1; AJvYcCV06c8r0IHa9LS4lKrdvtptzu0RQ8zgWxZtKTHXMzf8DCthUusK87plYgOJE8C89k0F985WFJKP1A/OIi8XUpHxXfkV
X-Gm-Message-State: AOJu0YyWQ9juiasjq6B9u64fXaMQ5zano7vm+4B5mvFgkbxu8cWOq2y5
	ReYqEAok8hkNTFJ2Hje4keimr7PVcBsryf3JQHz4z2WkFICpo8A7
X-Google-Smtp-Source: AGHT+IEJUhgfiOmN6ES+J7vKqXcRGgIgi8PdumL9xICNsiyilUOcjol7mAdrwxdau8gLwLk5m3TfJg==
X-Received: by 2002:a05:600c:1daa:b0:414:8869:1ef3 with SMTP id p42-20020a05600c1daa00b0041488691ef3mr443930wms.39.1711664010425;
        Thu, 28 Mar 2024 15:13:30 -0700 (PDT)
Received: from lmc-playground.localdomain ([188.25.208.244])
        by smtp.gmail.com with ESMTPSA id m28-20020a05600c3b1c00b00414688af147sm6666778wms.20.2024.03.28.15.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 15:13:30 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	daniel.baluta@nxp.com,
	iuliana.prodan@nxp.com,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	laurentiu.mihalcea@nxp.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: SOF: imx: drop usage of the imx8_*_clocks API
Date: Fri, 29 Mar 2024 00:12:00 +0200
Message-Id: <20240328221201.24722-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328221201.24722-1-laurentiumihalcea111@gmail.com>
References: <20240328221201.24722-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Currently, the driver has to keep track of all the clocks
it uses via an array of "struct clk_bulk_data", which doesn't
scale well and is unnecessary. As such, replace the usage of
the imx8_*_clocks with "devm_clk_bulk_get_all()" and friends.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/imx/imx8.c    | 41 +++++++++++++++---------------------
 sound/soc/sof/imx/imx8m.c   | 40 +++++++++++++++--------------------
 sound/soc/sof/imx/imx8ulp.c | 42 +++++++++++++++++--------------------
 3 files changed, 53 insertions(+), 70 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 07f51489d6c9..d65e09a927f6 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -41,13 +41,6 @@
 #define MBOX_OFFSET	0x800000
 #define MBOX_SIZE	0x1000
 
-/* DSP clocks */
-static struct clk_bulk_data imx8_dsp_clks[] = {
-	{ .id = "ipg" },
-	{ .id = "ocram" },
-	{ .id = "core" },
-};
-
 struct imx8_priv {
 	struct device *dev;
 	struct snd_sof_dev *sdev;
@@ -64,7 +57,8 @@ struct imx8_priv {
 	struct device **pd_dev;
 	struct device_link **link;
 
-	struct imx_clocks *clks;
+	struct clk_bulk_data *clks;
+	int clk_num;
 };
 
 static int imx8_get_mailbox_offset(struct snd_sof_dev *sdev)
@@ -196,10 +190,6 @@ static int imx8_probe(struct snd_sof_dev *sdev)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->clks = devm_kzalloc(&pdev->dev, sizeof(*priv->clks), GFP_KERNEL);
-	if (!priv->clks)
-		return -ENOMEM;
-
 	sdev->num_cores = 1;
 	sdev->pdata->hw_pdata = priv;
 	priv->dev = sdev->dev;
@@ -313,17 +303,18 @@ static int imx8_probe(struct snd_sof_dev *sdev)
 	/* set default mailbox offset for FW ready message */
 	sdev->dsp_box.offset = MBOX_OFFSET;
 
-	/* init clocks info */
-	priv->clks->dsp_clks = imx8_dsp_clks;
-	priv->clks->num_dsp_clks = ARRAY_SIZE(imx8_dsp_clks);
-
-	ret = imx8_parse_clocks(sdev, priv->clks);
-	if (ret < 0)
+	ret = devm_clk_bulk_get_all(sdev->dev, &priv->clks);
+	if (ret < 0) {
+		dev_err(sdev->dev, "failed to fetch clocks: %d\n", ret);
 		goto exit_pdev_unregister;
+	}
+	priv->clk_num = ret;
 
-	ret = imx8_enable_clocks(sdev, priv->clks);
-	if (ret < 0)
+	ret = clk_bulk_prepare_enable(priv->clk_num, priv->clks);
+	if (ret < 0) {
+		dev_err(sdev->dev, "failed to enable clocks: %d\n", ret);
 		goto exit_pdev_unregister;
+	}
 
 	return 0;
 
@@ -343,7 +334,7 @@ static void imx8_remove(struct snd_sof_dev *sdev)
 	struct imx8_priv *priv = sdev->pdata->hw_pdata;
 	int i;
 
-	imx8_disable_clocks(sdev, priv->clks);
+	clk_bulk_disable_unprepare(priv->clk_num, priv->clks);
 	platform_device_unregister(priv->ipc_dev);
 
 	for (i = 0; i < priv->num_domains; i++) {
@@ -373,7 +364,7 @@ static void imx8_suspend(struct snd_sof_dev *sdev)
 	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
 		imx_dsp_free_channel(priv->dsp_ipc, i);
 
-	imx8_disable_clocks(sdev, priv->clks);
+	clk_bulk_disable_unprepare(priv->clk_num, priv->clks);
 }
 
 static int imx8_resume(struct snd_sof_dev *sdev)
@@ -382,9 +373,11 @@ static int imx8_resume(struct snd_sof_dev *sdev)
 	int ret;
 	int i;
 
-	ret = imx8_enable_clocks(sdev, priv->clks);
-	if (ret < 0)
+	ret = clk_bulk_prepare_enable(priv->clk_num, priv->clks);
+	if (ret < 0) {
+		dev_err(sdev->dev, "failed to enable clocks: %d\n", ret);
 		return ret;
+	}
 
 	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
 		imx_dsp_request_channel(priv->dsp_ipc, i);
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index 222cd1467da6..3e0b88002b4f 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -26,12 +26,6 @@
 #define MBOX_OFFSET	0x800000
 #define MBOX_SIZE	0x1000
 
-static struct clk_bulk_data imx8m_dsp_clks[] = {
-	{ .id = "ipg" },
-	{ .id = "ocram" },
-	{ .id = "core" },
-};
-
 /* DAP registers */
 #define IMX8M_DAP_DEBUG                0x28800000
 #define IMX8M_DAP_DEBUG_SIZE   (64 * 1024)
@@ -54,7 +48,8 @@ struct imx8m_priv {
 	struct imx_dsp_ipc *dsp_ipc;
 	struct platform_device *ipc_dev;
 
-	struct imx_clocks *clks;
+	struct clk_bulk_data *clks;
+	int clk_num;
 
 	void __iomem *dap;
 	struct regmap *regmap;
@@ -163,10 +158,6 @@ static int imx8m_probe(struct snd_sof_dev *sdev)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->clks = devm_kzalloc(&pdev->dev, sizeof(*priv->clks), GFP_KERNEL);
-	if (!priv->clks)
-		return -ENOMEM;
-
 	sdev->num_cores = 1;
 	sdev->pdata->hw_pdata = priv;
 	priv->dev = sdev->dev;
@@ -250,17 +241,18 @@ static int imx8m_probe(struct snd_sof_dev *sdev)
 		goto exit_pdev_unregister;
 	}
 
-	/* init clocks info */
-	priv->clks->dsp_clks = imx8m_dsp_clks;
-	priv->clks->num_dsp_clks = ARRAY_SIZE(imx8m_dsp_clks);
-
-	ret = imx8_parse_clocks(sdev, priv->clks);
-	if (ret < 0)
+	ret = devm_clk_bulk_get_all(sdev->dev, &priv->clks);
+	if (ret < 0) {
+		dev_err(sdev->dev, "failed to fetch clocks: %d\n", ret);
 		goto exit_pdev_unregister;
+	}
+	priv->clk_num = ret;
 
-	ret = imx8_enable_clocks(sdev, priv->clks);
-	if (ret < 0)
+	ret = clk_bulk_prepare_enable(priv->clk_num, priv->clks);
+	if (ret < 0) {
+		dev_err(sdev->dev, "failed to enable clocks: %d\n", ret);
 		goto exit_pdev_unregister;
+	}
 
 	return 0;
 
@@ -273,7 +265,7 @@ static void imx8m_remove(struct snd_sof_dev *sdev)
 {
 	struct imx8m_priv *priv = sdev->pdata->hw_pdata;
 
-	imx8_disable_clocks(sdev, priv->clks);
+	clk_bulk_disable_unprepare(priv->clk_num, priv->clks);
 	platform_device_unregister(priv->ipc_dev);
 }
 
@@ -336,9 +328,11 @@ static int imx8m_resume(struct snd_sof_dev *sdev)
 	int ret;
 	int i;
 
-	ret = imx8_enable_clocks(sdev, priv->clks);
-	if (ret < 0)
+	ret = clk_bulk_prepare_enable(priv->clk_num, priv->clks);
+	if (ret < 0) {
+		dev_err(sdev->dev, "failed to enable clocks: %d\n", ret);
 		return ret;
+	}
 
 	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
 		imx_dsp_request_channel(priv->dsp_ipc, i);
@@ -354,7 +348,7 @@ static void imx8m_suspend(struct snd_sof_dev *sdev)
 	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
 		imx_dsp_free_channel(priv->dsp_ipc, i);
 
-	imx8_disable_clocks(sdev, priv->clks);
+	clk_bulk_disable_unprepare(priv->clk_num, priv->clks);
 }
 
 static int imx8m_dsp_runtime_resume(struct snd_sof_dev *sdev)
diff --git a/sound/soc/sof/imx/imx8ulp.c b/sound/soc/sof/imx/imx8ulp.c
index 7b527ffde488..296fbf11f6d0 100644
--- a/sound/soc/sof/imx/imx8ulp.c
+++ b/sound/soc/sof/imx/imx8ulp.c
@@ -40,13 +40,6 @@
 #define MBOX_OFFSET		0x800000
 #define MBOX_SIZE		0x1000
 
-static struct clk_bulk_data imx8ulp_dsp_clks[] = {
-	{ .id = "core" },
-	{ .id = "ipg" },
-	{ .id = "ocram" },
-	{ .id = "mu" },
-};
-
 struct imx8ulp_priv {
 	struct device *dev;
 	struct snd_sof_dev *sdev;
@@ -56,7 +49,8 @@ struct imx8ulp_priv {
 	struct platform_device *ipc_dev;
 
 	struct regmap *regmap;
-	struct imx_clocks *clks;
+	struct clk_bulk_data *clks;
+	int clk_num;
 };
 
 static void imx8ulp_sim_lpav_start(struct imx8ulp_priv *priv)
@@ -175,10 +169,6 @@ static int imx8ulp_probe(struct snd_sof_dev *sdev)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->clks = devm_kzalloc(&pdev->dev, sizeof(*priv->clks), GFP_KERNEL);
-	if (!priv->clks)
-		return -ENOMEM;
-
 	sdev->num_cores = 1;
 	sdev->pdata->hw_pdata = priv;
 	priv->dev = sdev->dev;
@@ -259,16 +249,18 @@ static int imx8ulp_probe(struct snd_sof_dev *sdev)
 		goto exit_pdev_unregister;
 	}
 
-	priv->clks->dsp_clks = imx8ulp_dsp_clks;
-	priv->clks->num_dsp_clks = ARRAY_SIZE(imx8ulp_dsp_clks);
-
-	ret = imx8_parse_clocks(sdev, priv->clks);
-	if (ret < 0)
+	ret = devm_clk_bulk_get_all(sdev->dev, &priv->clks);
+	if (ret < 0) {
+		dev_err(sdev->dev, "failed to fetch clocks: %d\n", ret);
 		goto exit_pdev_unregister;
+	}
+	priv->clk_num = ret;
 
-	ret = imx8_enable_clocks(sdev, priv->clks);
-	if (ret < 0)
+	ret = clk_bulk_prepare_enable(priv->clk_num, priv->clks);
+	if (ret < 0) {
+		dev_err(sdev->dev, "failed to enable clocks: %d\n", ret);
 		goto exit_pdev_unregister;
+	}
 
 	return 0;
 
@@ -282,7 +274,7 @@ static void imx8ulp_remove(struct snd_sof_dev *sdev)
 {
 	struct imx8ulp_priv *priv = sdev->pdata->hw_pdata;
 
-	imx8_disable_clocks(sdev, priv->clks);
+	clk_bulk_disable_unprepare(priv->clk_num, priv->clks);
 	platform_device_unregister(priv->ipc_dev);
 }
 
@@ -303,7 +295,7 @@ static int imx8ulp_suspend(struct snd_sof_dev *sdev)
 	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
 		imx_dsp_free_channel(priv->dsp_ipc, i);
 
-	imx8_disable_clocks(sdev, priv->clks);
+	clk_bulk_disable_unprepare(priv->clk_num, priv->clks);
 
 	return 0;
 }
@@ -311,9 +303,13 @@ static int imx8ulp_suspend(struct snd_sof_dev *sdev)
 static int imx8ulp_resume(struct snd_sof_dev *sdev)
 {
 	struct imx8ulp_priv *priv = (struct imx8ulp_priv *)sdev->pdata->hw_pdata;
-	int i;
+	int i, ret;
 
-	imx8_enable_clocks(sdev, priv->clks);
+	ret = clk_bulk_prepare_enable(priv->clk_num, priv->clks);
+	if (ret < 0) {
+		dev_err(sdev->dev, "failed to enable clocks: %d\n", ret);
+		return ret;
+	}
 
 	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
 		imx_dsp_request_channel(priv->dsp_ipc, i);
-- 
2.34.1

