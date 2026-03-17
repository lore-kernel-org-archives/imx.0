Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68518343D83
	for <imx@lists.linux.dev>; Tue, 17 Mar 2026 19:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773775997; cv=none; b=SfVLzDv+SqnJlVRMc+rMDzrd2WSF+otWRt4F40z2xPUNhMCRpic36utqbp0u0rXrqz5pPXe/hdCXcwk5Quh/yh2JfjgyUirMFo4Veu9cMWcSoQ2UyrTnMhdNbrlsc2xwXmfpWgpYeot+JwDJed5YGt0ibADtTk0gMBBDgiAtmx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773775997; c=relaxed/simple;
	bh=0wrffe2ePvR9snVbGOn1yuDOZd87ewk/mhSsA9xTEEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Bu9IsF5uo0+JvoenNCVCaLNGUyJ9UhfU/EicI8GigY2K1z1WuIu8/NHK++UB1J3gKzMCcQ120AcRIQCglmRjkozFoP8BqXNQ+Ssm+6TupDosx+p67ptYKJb3m5i1GobqllSAVF9moc9XvsG1gLJJ+1NpF4HZHGbAUjO+xNIk57s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NG77m6we; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NG77m6we"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48628ce9ab5so14988175e9.2
        for <imx@lists.linux.dev>; Tue, 17 Mar 2026 12:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773775995; x=1774380795; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=utwObQp63pBMb8wBU24YfUsTgXDwwHCc0NNvyQURJJU=;
        b=NG77m6wexUwTBntKUTFNzVTr9Lg3Bm9cMtRa7F+G+KL/kXpKLxS2ABH+3tO/oRPlkM
         2bNLAbSAQpKF+10Vtnmj28ugQfVg0iuVHkrVAlQ0V2rQbK7pLxsgomTbaSvJmREZw8Ex
         n9Ql3X2AiVt0+G2XGRaP75Tw7NIXcIDOoZKShTWRGLhc5wmoDPCkXoHIB6siFarRMTZH
         76cleMY19CdoyrqBMR4Zu8oqaPmJafIWfgNMT7OdBpXkIy3NxVjz+t/+OxV/f30LSiqF
         ifeHfAuF922YpuTHmF+Ivaga4DexbxVd/kh5P0AiUkEMgUa4+XSxtndFzKfHThl4L4DR
         Cd1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773775995; x=1774380795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utwObQp63pBMb8wBU24YfUsTgXDwwHCc0NNvyQURJJU=;
        b=lFucc/kGKhLrBMP9OfKQV5AfhAPMI/oQZQwOXhfuCeE91FIoSwSKwQDR9lJVRvXz2k
         cHLrjItqMqDuXoO7fPRM+1475VcWrl1rk04O0tIjEpiqN7nqW5AQAnba1fu/vjhEI8mx
         FHOQ6QMAbZYkA31qLU5FnQmnEX9bE8afHk/zDXgZLuaZ1DY4HhPlZhKPA4kME8JYQciL
         mzQBObTNM43ipolNqdvy2naM65Jg0NjyUKR2PD1yDTFYBBXU6ULsGiPqA1aHtAkD6H8m
         pUowlR8FE9mSHcOsMUBsUzSDAKmu0Bjan7LA1QbFLhMsMQPVhh3OcKfU8lBu85mgCSTt
         BmNA==
X-Forwarded-Encrypted: i=1; AJvYcCU0fhuk/MaI8Xnv1sO95TDrhPyYpbrEqkLh/tPBmkNtvusX1jKNuWXc4PRE6yHVC2vhNFM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTLEwnjLHNHR5AWIpr+gB3xVuYM6CMJVdao4vSNRVE3ZUym/N7
	ecDPSIGdKu8db+XOUSOhRwlrmqsiFiW8w4Wlx4lnfJokn+brApkYVp6l
X-Gm-Gg: ATEYQzyEbxpAbBUK8ozJjIXicQ5S3ZLLL97qXPrQsb/yiq6tSDYrzTL//Dlx6bmSrYZ
	Lz/lb8UxsvE850w6Ch9aR8P+3JHu2Ar+8xO+Px7v4DjC8EeShfpqi89RErmhYHKrCpVstaz5ASr
	0PvvupB32z8Ey5tTFoRIC9MDQkDbNqsQ1gbn6W5XbkwXRFf6sea0hzyftcWMpnIDqhFcBErXEi4
	+JPiygYTNX5tbcqp3PNt/3zmUi3gixH4mSEOcEcRhL2w7pp3KpaTe+Ws6pSPIB7DJtfT8r0Gb+M
	V9MkG3A2e+LadTlc45woDqwo8Lerh1xVIdR83xVV45g9F2ZZ7jph2HmJF3I+weZ6w5Vw3nyB4lN
	2nDClAjzmBCt1F7yxSS8vW1seSxUWvzkC6XAHFDfIGiXyO1ZwT3vhXeh8svw5GQG0NMvriiUc54
	ii9e6B3cDXvHBj1TOtyEco4O6xP94ZTyoEaJicep987Ao0
X-Received: by 2002:a05:600c:314c:b0:485:7f02:afd5 with SMTP id 5b1f17b1804b1-486f443845dmr15339245e9.13.1773775994499;
        Tue, 17 Mar 2026 12:33:14 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f41d0c5bsm16762645e9.0.2026.03.17.12.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:33:14 -0700 (PDT)
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
Subject: [PATCH v4] mmc: sdhci-esdhc-imx: consolidate imx25/35 data
Date: Tue, 17 Mar 2026 20:33:09 +0100
Message-ID: <20260317193309.14091-1-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Consolidate esdhc_imx25 and esdhc_imx35 soc data into a single shared struct since they share the same flags. This reduces redundancy and simplifies data management for i.MX25 and i.MX35 SoCs.

Signed-off-by: Adrián García Casado <adriangarciacasado42@gmail.com>
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index a7a5df673..9cfa26722 100644
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
@@ -414,7 +410,7 @@ MODULE_DEVICE_TABLE(of, imx_esdhc_dt_ids);
 
 static inline int is_imx25_esdhc(struct pltfm_imx_data *data)
 {
-	return data->socdata == &esdhc_imx25_data;
+	return data->socdata == &esdhc_imx25_35_data;
 }
 
 static inline int is_imx53_esdhc(struct pltfm_imx_data *data)
-- 
2.47.3

