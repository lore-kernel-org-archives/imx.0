Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAB1364953
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 20:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773950993; cv=none; b=cj3UPqIi+n09U+9E2g/WXQXkS2dg1uyp2z8t+nNGfnrtnXr47PWy9mn6Z+FwxgL2Qcikr70ApUTKGnIvABlWiwY8BvogwvXvOx/PX1SxZ0yMa+NihCu/XI67GboGZYuGv9ZwL9qC17tcM4DwfMU6H8iLc6FzODP36eX9HUNLNTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773950993; c=relaxed/simple;
	bh=aeThNmYclG663rSdCfTCLH9YRcXxpMqFylkpFWaIsu4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SCErEwPuqdg9rEXs9IJQ0TwzMlm7q23oUWX0P1PYQCpH9ZigDaalCx+/0ZZm6Q/kQ4WQAQjcBQ/Go1AuE3cFeoHSgeRXCynidgXMrcxFeraBx4vsqjU3wKN0QHNQDpaXnWsFO6MbyaRgJqP0SNDSX7QtS8nr1iQrU/aodbQzNXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+h/Oott; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+h/Oott"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso9988905e9.3
        for <imx@lists.linux.dev>; Thu, 19 Mar 2026 13:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773950991; x=1774555791; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Z+t3nij9duvH51q1jubZS0ZmVziEVK5rVexkb8LriA=;
        b=k+h/OottEi21Oojj/W+6XuvTLO1/2FMLV107cO5YTiN2+PDYdkB2KobyIGil0yFpxd
         NnAPJhhIgXFz/nxRw0lfzNNEoHdor6NIWBQebNWAVyTveOCSngPdL0PtkYmIlA65bZD9
         6PnLDBEFjpmw7GsxapwsDgsvUYkwd6P2iNmJ1jNsw4smkA/+VYc09BD9sOuWFjmCqrpG
         9NsBxC2SycT3sOHweKKDZds3ikAuTUVxUtwvirur3tVy33TEm5yCkc9CPMk79SVft+h9
         8BvOTSpDCS+513nPFo2gO3pqN7Ss8L01/RyeLoyJxRtsy8X4q9OvOAYyx1mf9N6tWjTW
         Judg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773950991; x=1774555791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Z+t3nij9duvH51q1jubZS0ZmVziEVK5rVexkb8LriA=;
        b=aYNuLpmp7VPy/SsGR9Moysr0ZM/AoefcMSW0PCiXbITnIEsfPzB8jkGhMfvWur8EO/
         FNVyRAixxxVmflAhO0YS+wQrchx2RkZHhwI1gnJBbQxueq02JofgH9G0e9kxeN9FN6L1
         UU82IAZpLEWDkYxeb4hxLo7b/84X2WQjUNvLnt2s4ZblNspA3lTySbDFph9a74O9wBwA
         EQJfUWKlV0n9Lcn57BcijYo42Zhwku4mLQQQr4l70w1D2m9DYTBrqBDDw6HW4lkygTqr
         DtftxNEp7+ic3ZEJVSz9vQ4CWO2UA2OmddxpOaZMe9trYYktQNg9/cgcWAnL4n08Uuy5
         A5Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVg+1MP3gi/0riKJeTHTdfGCAbfmB78zrx7BcegcCCfE3GKkNxckgKIQtL6Pe30gNGs0wU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLVCdrxlv5SxNfzPopM7LEPhO68ND7/xSIE+gQQ/nZM5Ef9ftC
	bQWTE8l6+Kuea5TWQP4gSYkxaBBpxNnFu+X5aPyXO8DCfAeFZ7JFI7+r
X-Gm-Gg: ATEYQzyXz7OZ2E18xUktPsR+eJPzAHGbtXjr/PgoyMOYoRzR1MtiaE7mVKVqPLBeNCA
	y676ULusI4Xm8C7HuyhNMMZMfW51prha3DIcbPwGvHpKfmwgX3wonACOGCnJmvPP/zELnoB1tOQ
	wB0P7510SZNZINRKgqhZ0ib9qZs/RPYehxO7mzecHXElK7GqfxJUHYQHckh03v5EaFZXuraBig1
	3EDLO1xEO1TZVA3okq+fPKslRBlWiEr4QF6tLRaa51kCnsiYe0vOQMI9DjdSsVsKikpdQgH2aS7
	lPjE+9SrIwXsCtVdQiRnjCMfkAaAjcst0u4+YLND9vdHGnKx/42WjvBpch5fagJIZazBeWRyPJx
	EYVPB7/Vmjg2PXlQGBfAncvLP5T2LF2c8+lvasSq3aMTY1Qe+2VSB4Ttri54IiMYwTelLhUNjPQ
	7iufJNvOtD1hFnXNsCcWMT7SrK0rz0bPNiBg==
X-Received: by 2002:a05:600c:a4a:b0:486:fe83:8621 with SMTP id 5b1f17b1804b1-486fee1ab20mr5793965e9.23.1773950990582;
        Thu, 19 Mar 2026 13:09:50 -0700 (PDT)
Received: from debian.lan ([171.22.85.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe967c64sm8991685e9.2.2026.03.19.13.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 13:09:50 -0700 (PDT)
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
Subject: [PATCH v8 3/3] mmc: sdhci-esdhc-imx: remove redundant mx25 handling and consolidate soc data
Date: Thu, 19 Mar 2026 21:09:45 +0100
Message-ID: <20260319200945.23333-1-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The is_imx25_esdhc check and redundant mx25-specific handling are no
longer necessary since the initial SoC data initialization covers
all relevant compatibility cases.

Remove the is_imx25_esdhc helper and its associated logic. Consolidate
the drive data structures for imx25 and imx35 to reduce code size
and improve maintainability.

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
-- 
2.47.3

