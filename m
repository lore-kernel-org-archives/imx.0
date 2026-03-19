Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DC53939CE
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 17:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773941926; cv=none; b=PBkSbSIml9sxMWIcwT/oY4TsRNtrKzoIcRftaHILHRIQ/aoUX3f+eJX9XntLjYsMNw4Ph9ACEa51kzXjVh596qX1/q/V7E8A+/5myxgD0U+nBrVJIx/1FPX5+CSCLzV01PBoW3mz7DFU+VE0JKQtFv4UeJO7EOVqammsLU++XXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773941926; c=relaxed/simple;
	bh=wtcwSax+dOymKeDwOFVuIu38JkEr2pWeDdK1+wJVZU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WTDVilZE5FNJVQsxhI43GsAw/JP4q34dyGPqxzChXI893wVh9v8SYsjBMzJNtJjv3X1obyXG28joCliv3RtudSXfAKZlUL5VbKs0ZnfJkY3gAUqso3uIaRahmBb0O4J9HwpP++BsqV3MxIGLbWBw9QI8mBRg0aZTu8Y4vztRsIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lhbaimGa; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhbaimGa"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-482f454be5bso22874095e9.0
        for <imx@lists.linux.dev>; Thu, 19 Mar 2026 10:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773941918; x=1774546718; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2dck90428BvoqEpkmWusaTQb8k98b4TyQG0pbU+HYgI=;
        b=lhbaimGaMrhMDXXB3axA7/+iUxZF0TlHG+d+lhxZHyp+HDZVdHbgwrNgJH77d9IEU+
         hRs/SfxT6U2s1cs137G6X+jxID/jKUi/Oke7N6LjWbcvpD/Bwu8BGDkBa3GS5pE4ES7l
         eJu9K6QyK4mzUKNorQARWCiX1RBwXrqTOlN5RpJQXXRvzIDajocuBJQBYN03LxQykkl9
         gSMxdTASm8gkqCzGDM8Cwqvjr15ja33BjUkf47GGhLPma9SlFrk6CLuqMkyG4lJtiGH2
         9nV63tIqQW1x1AeCaVkwZW/by+VGmIQWl/gWFHJ5DpovlJbFA+9pQOVXwbN1xP8KQFJA
         25sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773941918; x=1774546718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dck90428BvoqEpkmWusaTQb8k98b4TyQG0pbU+HYgI=;
        b=pEduGCkECjsOnZnAa9nguQ0g2wvU25PtbKfZTom42QmzH2+foUtVw5AYZvVBPRGPun
         VguPH7Q2rqrGZzSyuNX1NJ3oTy0BZFr4fFvTnJjpsQELzJ+/vaz2ktkASaDEYSsbmE6h
         yz0slWfim0U3LJu3PUDgXOFda0anjVel58PCtbNKLOadEW8HYtldMfHvZ/CRwKmw6Pmp
         qPUTWIDt11z+9hb+9Efxz/2zZsYNqis0nIjikxq2QtW80uK32G69g/0T0eHz9XZumJvn
         OVKs8A2PizVuc3zQlGS2zWa8rf25Ou+iHzKB7R6x/0wTzXS1jaArdiTKzpqsfO6Mvobk
         k58g==
X-Forwarded-Encrypted: i=1; AJvYcCUOyORhuT2y7d2VRlec3LHXfS3QTR/WFw6yJD/4igsAVJ7l90Gf42O0TI/Z6ygX5qwr47I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzdt41iueE2DsbwsHwNToc7/wVxSZwbQgmbCK13wOfh21RBesCH
	jWrkk8AJuhCAGsDUWcV/QSzA8uq77u/aImV7XIdgQ80P/BnW4F897uRa
X-Gm-Gg: ATEYQzw95q0Lt08qiY7Kyvpgfwa7ClDYaxnx0B9sGDDlQ9nwkf965/abWczWi1VhJna
	Ai3MvaCxFJUjCS4t3r14mdXmb0blPFI6G463BiaWt5OX9qAu2otKU5/8jzYikHEBrELfH38rgFr
	ft7aO4T7u+N8LtyRD/63OIRnIcfhlRUEJ1zT+ChOtNquKBlWLLTPyFdzxV86F2ZJhluqeZBls9u
	YZpMxYvBGLPCXNCY2YJ3xww8D+ey6DZQNtrmDG7Gprij3lRmcmUBYfgDab2iWsIAIm7818eeXx2
	XqOhjXwt57ocNypfENYUs6rKGqWqr0glYx3OyAHGoViPC1zgicm+WFtfZpFegtllT2FMNnwBGyT
	ZpdjkVdWmNtQHi+atbo4Kn7fNZyq1CXpt6moXNMuf5O9l2/Ej5smLPchedMSq6f8vMg4m2rCaRt
	2clXAiP/rCdWHrXn0/7LDLXwRrWZfn74T69w==
X-Received: by 2002:a05:600c:55d7:b0:485:4f11:aabc with SMTP id 5b1f17b1804b1-486f8b80e07mr59487305e9.15.1773941917725;
        Thu, 19 Mar 2026 10:38:37 -0700 (PDT)
Received: from debian.lan ([171.22.85.208])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b646b0d3dsm212845f8f.16.2026.03.19.10.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 10:38:37 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Haibo Chen <haibo.chen@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-mmc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
Subject: [PATCH v6] mmc: sdhci-esdhc-imx: remove redundant mx25 handling and consolidate soc data
Date: Thu, 19 Mar 2026 18:38:32 +0100
Message-ID: <20260319173832.15543-1-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the is_imx25_esdhc check and redundant mx25-specific handling as it's no longer necessary since the new_soc initialization. Consolidate the drive data structs for imx25/35.

Signed-off-by: Adrián García Casado <adriangarciacasado42@gmail.com>
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index a7a5df673b0f6..3dc43f1e517aa 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -256,11 +256,7 @@ struct esdhc_soc_data {
 	u32 quirks;
 };
 
-static const struct esdhc_soc_data esdhc_imx25_data = {
-	.flags = ESDHC_FLAG_ERR004536,
-};
-
-static const struct esdhc_soc_data esdhc_imx35_data = {
+static const struct esdhc_soc_data esdhc_imx25_35_data = {
 	.flags = ESDHC_FLAG_ERR004536,
 };
 
@@ -391,8 +387,8 @@ struct pltfm_imx_data {
 };
 
 static const struct of_device_id imx_esdhc_dt_ids[] = {
-	{ .compatible = "fsl,imx25-esdhc", .data = &esdhc_imx25_data, },
-	{ .compatible = "fsl,imx35-esdhc", .data = &esdhc_imx35_data, },
+	{ .compatible = "fsl,imx25-esdhc", .data = &esdhc_imx25_35_data, },
+	{ .compatible = "fsl,imx35-esdhc", .data = &esdhc_imx25_35_data, },
 	{ .compatible = "fsl,imx51-esdhc", .data = &esdhc_imx51_data, },
 	{ .compatible = "fsl,imx53-esdhc", .data = &esdhc_imx53_data, },
 	{ .compatible = "fsl,imx6sx-usdhc", .data = &usdhc_imx6sx_data, },
@@ -412,10 +408,6 @@ static const struct of_device_id imx_esdhc_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, imx_esdhc_dt_ids);
 
-static inline int is_imx25_esdhc(struct pltfm_imx_data *data)
-{
-	return data->socdata == &esdhc_imx25_data;
-}
 
 static inline int is_imx53_esdhc(struct pltfm_imx_data *data)
 {
@@ -873,11 +865,8 @@ static void esdhc_writeb_le(struct sdhci_host *host, u8 val, int reg)
 		new_val = val & SDHCI_CTRL_LED;
 		/* ensure the endianness */
 		new_val |= ESDHC_HOST_CONTROL_LE;
-		/* bits 8&9 are reserved on mx25 */
-		if (!is_imx25_esdhc(imx_data)) {
-			/* DMA mode bits are shifted */
-			new_val |= (val & SDHCI_CTRL_DMA_MASK) << 5;
-		}
+		/* DMA mode bits are shifted */
+		new_val |= (val & SDHCI_CTRL_DMA_MASK) << 5;
 
 		/*
 		 * Do not touch buswidth bits here. This is done in

base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
prerequisite-patch-id: bf56dcdce62cb97741b7aa11b04c7a9648fb2d6a
prerequisite-patch-id: bb57e0fd9cad8c81bcf7a6389f3cb294bbe1eb52
-- 
2.47.3

