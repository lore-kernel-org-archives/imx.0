Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E81288C2D
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 18:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773944986; cv=none; b=SU4Z63G7lrZs5eQIthcb5yc2h/c5j74xX8gCb3xAECs3HtBysFJVutn343VUO3+HE0ySVZS6MZ7UrkqUSBIzP9064xueJEahfs0bKkB0ECdd0P8Cz3D7jxEi+ljZQetlveHbBwPtGL1wYytWFfzHoQ5EvamU7Kevg64s1e5lF/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773944986; c=relaxed/simple;
	bh=C0/zMw1u46TGrFTphNU3BBBRGGtXVXv8VI/g4Mo90iI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UlHuPDeyMUAu3hbnXOF5WzLbnJdu8/GraOfx8f84VU2ir1KEDQ4iZSdlF/z/s6MhtbhnPh/6pAWyElXYL9QP5kBUJ2Gk5EBiDZ9jXB/CxOLK1hqFW/dNQnJgTwZjLyK9eej1zZxVUr1Kb61JeGACaqk4kIV6TzOw2taX88N7rXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZV95vhVc; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZV95vhVc"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486b96760easo13950155e9.2
        for <imx@lists.linux.dev>; Thu, 19 Mar 2026 11:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773944984; x=1774549784; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J98G/61sc667kDXVS1HdzK2h40Uy+YIn7bV3QsVznPU=;
        b=ZV95vhVcrx804RgkzP3tXonimISgpjxOBjemQEZmwHEqbZCnAQYDni+gCvjYdCj17U
         RmGfQrO0kL+Tfy8M+Ls0nJEPeUJQ+P0HVBJD5Ooi+WrO4zKa0hjzP6UdpuESfxmX8fOO
         mHVA6YY6iwt1vB260+4vZbzKJ+RiEuWpeykCnEZxvgagkf3F6BIYvWisCuiCCItu9QxN
         vif2hbyEs6ZAXckQ6bvYkZN/2cnKsEdsN422Wd4q13oid/ozO5+3Dn9vk/c7Ffi/FMOh
         Jw0mT+7YUp6FvqfVitD3Eoi0/fJescJNdxnX0COqYhuBs/MRi4huxtamPZ5+V8+kX6dD
         rENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773944984; x=1774549784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J98G/61sc667kDXVS1HdzK2h40Uy+YIn7bV3QsVznPU=;
        b=oBsJ+c5Zm3X5OLd7V6b3Pkc5tKlrIguLEhfe4ThR7gDIRmluXGi2eX6Zl7qrHB9lAV
         bXwKbdir3tnbPoxQBmKib8HphbYToEKEMOsv5ZLMfTKZmIHHuwfZz6OVILe1WvIxS0cF
         mt9/D5uiTwHdNWkHiuB0z1MUS9tk8ie093xZlt5wu3yjTHEl1wg/KNAJDAmTArHe7nOc
         GVRjVIQDW1DvaVg6wN7iBT+G0lCQLs6+WIKFaoGWviqAUzXQgMCEbsInGY3987GYV6bO
         An5spOXrXw6ZZdzZ82+yfXrB+ta7Roz5tjFoxQSXuqRkxGMYpjaL5G+1qCtzSRrGYsyf
         7HuA==
X-Forwarded-Encrypted: i=1; AJvYcCVb9Ws5CyXhUdH6Lpc0LQrmGh+0gQ3ISJ195qxUHM6a7z5aXfubNod1OdOF9LzMcrBkAcg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwthL93SbSIAgfrZm5afhjvSyHpxPdhDzWq+fcdP9wNh5PPGARh
	DW9uU13870/s0a1cO3DCzVp6Bhrd26fh1oQkztX9OFo/7XbSzSJXJhfoOhVgFVnH/VJBKTX5
X-Gm-Gg: ATEYQzzZOiKrYqy31RxdhjBNlsrHW2/zx0cCKACSNmdwOrOpYFEL43mVx2Ai/YdvNBn
	L3WJzP7+HIfH19+MT5cJlFL9CCtGJtjQ0YnEa1V786GLX92+HHXVevY0XuIYfBnSrnpQRnX5+LN
	Kstg+0l10fKCrr50mgiUt9fkRZi4ueQTmvf4ogRkI+jYWgXnrjv8S5CqKRf9lLy4CFczetrwdQA
	P5M7IRF/exiETRW2SGSSrHOzxVRGL0jyfObcsnsHUtCQ1TzDY0OpfRXfR2FkB47JW9OsSCvkFJK
	gM9IL6pca8N5FkFEakEwILVpQlrwPUkS0elQT1U1yMcIjllPO0IHgO9rUoMpdf6abqrHtoIFAL/
	H9UWkAqKMBifuuilwh2svj63GU5Izb8rEWN9vq4DmKlqAgPVv8ccUJzQr9XA2txneBEiupl6nSy
	9Uy/5S0I8lK+jYduMCoUaCnP3rQaSuAAR5qY0C4G4Rd2vE
X-Received: by 2002:a05:600c:c493:b0:485:4388:3492 with SMTP id 5b1f17b1804b1-486fedbd0b0mr2311045e9.11.1773944983675;
        Thu, 19 Mar 2026 11:29:43 -0700 (PDT)
Received: from debian.lan ([171.22.85.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b949e1sm142204505e9.9.2026.03.19.11.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:29:43 -0700 (PDT)
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
Subject: [PATCH v7 3/3] mmc: sdhci-esdhc-imx: remove redundant mx25 handling and consolidate soc data
Date: Thu, 19 Mar 2026 19:29:38 +0100
Message-ID: <20260319182938.19525-1-adriangarciacasado42@gmail.com>
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
-- 
2.47.3

