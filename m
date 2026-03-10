Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C8718DB1A
	for <imx@lists.linux.dev>; Tue, 10 Mar 2026 00:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773102436; cv=none; b=iIvktV5yTo6tQ1u5ew05YbAnRgtCwzcgJXJUlPoCj4+M5Xds9aJifzHN5ywU3DFcol4KNT/7iYzy3K7p1uBDwbcWLnQJF11Esbh0ZURIXX/b8Mv8T89/aKkUtC9skfX84+BMDZanXT5+54BgoUQarrxha4EMsJwyZlTE3+7pRSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773102436; c=relaxed/simple;
	bh=XJlz7TAx+3J7IJ76cfvjfM28sjsC5jwU+vA9iaG8HY8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n9PBotMeW5kIlX6TM4UWV+66E/H/hNCETvaCTfsJSmFmku3SEfafVUVT1H35F6/JX8fbOeDLAOHCSOtCm9s+UtjWV2qSuoFJeZLTF/gXp/9Ro/HhdOaobujp50fic63LDtopngeMFOsmkWrZ1IYraEXP2l6e1l8zp7XT6sI5/KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zlujzl6Q; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zlujzl6Q"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3599126be32so5184421a91.1
        for <imx@lists.linux.dev>; Mon, 09 Mar 2026 17:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773102434; x=1773707234; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kBSFBJjMJpbjZ3yrhCcXTD3ypyojE/o7DNoxI6+C6lg=;
        b=Zlujzl6QEW6uMZaLUHb0svIICPEaNfi90aOjb+4EmIxn7IOrrMeUVXPl6yBn/vKlzk
         g8nYwE5mgYh5mZnOfrz73AnsjiQDcTtRl++ds0i30uClc7aCpH/MvG/tphAJSQK6NQDZ
         /th5A9f+zmMSgDIedhMXF6yOP6lFhMTiGRpAS37Ivon3E36mna0qxptgpdoyLRhLDoJW
         Y/K+ECVIq5YWaUqg4qK257f6N/hvCx4FlkuGG+eGSkA37OML2xVINsQHP39+x75bUtLO
         zOGaTPGNLUpV0ttj8wq1+zef1yFQFqV3UrYrwPH3OCWrG2zka9UHgjvf/ioM7DUxPFI+
         eGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773102434; x=1773707234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBSFBJjMJpbjZ3yrhCcXTD3ypyojE/o7DNoxI6+C6lg=;
        b=w53arJv9+Hi51tnWVBCsQ/gYUgyYgUdYNVxTAwFTpW6m45qCJ7BXY/EyzuMTz6V+FX
         JIEKsLvUms+E+GZl3pkFvtPGnBItQNoUiSo4iGk77oWedOQDou4G6PlhOtK+EPpbg/X8
         wuTtd/kD1DPGDyGTyGND5AzHej3yyCmX5hiQ8ncsykbDjVvwmfOUR7ZLHaqZF4oRc5nL
         wmB1VW5FzoYZApeas4af6L9IEnBIuUTMgNSeI7pVCqpGHNQWfZucs34zL83aIkKFGjjS
         wXJyf0RXaMuh+yQ8o3+510qKfrqrAMJe1kcZSVAmO8PxfOw28fDm693/VRvCRSfe1sU4
         CrLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhW/+RDoLO2d0ItSQY3bIa2AC8OiLj4SzKqQrVhel320TqKo7xJK9o1593LjGUTkAIijE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPDN7hpZKM7MdQjyzjwvqiRYp1/HpObC2ylCjbuoN9yusEebfT
	QK1TPGqoVrRicjMsMnv/SM8zSjomVevSy6Q2J10LmK3Ryi8xJRFdXvWx
X-Gm-Gg: ATEYQzzHwpgedS1uWuB9KlaSZoeAHuNSCc1MteK9D+ShXCtk0drG5fRO2oxaCLaMYNi
	WNGXfXwGfxJGO33/EnTfinNKvIrAcUoXeJCkyEcAKXckgZHK7FUQ4OOX1vlP74B+1O2finTexBV
	8TRBm6poPJdHZMqlASBhGSZeIss7ghfBjm6UzOoD31Ynh54T9PFCOb2XEXZY5cvMDbgpDqRkrW7
	9lrTZ8Zc5H/4o+tWvWt1bBWZiWztnSbEHThHowhg9ZqlGIs4YUDBJT43OUyFeCNvpYHaSs/oTtd
	eTcFACDjzJjpc4lgiS4p8jYsYt8GnNthBwB9pVpZZqbZf8LHH46UOc0x4iutBi05vQrU3zKBUai
	ikecKwYeqzlnF8/IQu7NvSksz24HQh7BzDZ6XtpI425qUohq0rV9TNuSfxV7Bhdn6IWfwSrFIKm
	L/+GXN3IxukIF4YomY8XsYogR7T8idRznWabDY19KUMnbU67RUS6vwhdSHZ6VE/L3/CpvHAJuVn
	aqSAViJutspq3ec
X-Received: by 2002:a05:6a21:8885:b0:398:7fd2:5941 with SMTP id adf61e73a8af0-3987fd25c81mr5602489637.44.1773102434555;
        Mon, 09 Mar 2026 17:27:14 -0700 (PDT)
Received: from tower (c-73-37-64-97.hsd1.or.comcast.net. [73.37.64.97])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e183596sm10245803a12.27.2026.03.09.17.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:27:14 -0700 (PDT)
From: Mark Adamenko <marusik.adamenko@gmail.com>
To: linux-staging@lists.linux.dev
Cc: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Adamenko <marusik.adamenko@gmail.com>
Subject: [PATCH v3] staging: media: imx: fix parenthesis ending checks
Date: Mon,  9 Mar 2026 17:26:43 -0700
Message-ID: <20260310002643.27465-1-marusik.adamenko@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove 4 checks for ending with a parenthesis by removing unnecessary
line breaks, and forward declare a variable for a function call that
would otherwise remain over 80 columns.

Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
---
v3: fix commit message
---
---
 drivers/staging/media/imx/imx-ic-prpencvf.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 77360bfe081a..2339b59af7b0 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -315,8 +315,7 @@ static void prp_setup_vb2_buf(struct prp_priv *priv, dma_addr_t *phys)
 		buf = imx_media_capture_device_next_buf(vdev);
 		if (buf) {
 			priv->active_vb2_buf[i] = buf;
-			phys[i] = vb2_dma_contig_plane_dma_addr(
-				&buf->vbuf.vb2_buf, 0);
+			phys[i] = vb2_dma_contig_plane_dma_addr(&buf->vbuf.vb2_buf, 0);
 		} else {
 			priv->active_vb2_buf[i] = NULL;
 			phys[i] = priv->underrun_buf.phys;
@@ -704,11 +703,9 @@ static int prp_start(struct prp_priv *priv)
 	}
 
 	if (ipu_rot_mode_is_irt(priv->rot_mode))
-		priv->eof_irq = ipu_idmac_channel_irq(
-			ic_priv->ipu, priv->rot_out_ch, IPU_IRQ_EOF);
+		priv->eof_irq = ipu_idmac_channel_irq(ic_priv->ipu, priv->rot_out_ch, IPU_IRQ_EOF);
 	else
-		priv->eof_irq = ipu_idmac_channel_irq(
-			ic_priv->ipu, priv->out_ch, IPU_IRQ_EOF);
+		priv->eof_irq = ipu_idmac_channel_irq(ic_priv->ipu, priv->out_ch, IPU_IRQ_EOF);
 
 	ret = devm_request_irq(ic_priv->ipu_dev, priv->eof_irq,
 			       prp_eof_interrupt, 0,
@@ -750,7 +747,7 @@ static int prp_start(struct prp_priv *priv)
 static void prp_stop(struct prp_priv *priv)
 {
 	struct imx_ic_priv *ic_priv = priv->ic_priv;
-	unsigned long flags;
+	unsigned long flags, timeout_in_jiffies;
 	int ret;
 
 	/* mark next EOF interrupt as the last before stream off */
@@ -761,9 +758,8 @@ static void prp_stop(struct prp_priv *priv)
 	/*
 	 * and then wait for interrupt handler to mark completion.
 	 */
-	ret = wait_for_completion_timeout(
-		&priv->last_eof_comp,
-		msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
+	timeout_in_jiffies = msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT);
+	ret = wait_for_completion_timeout(&priv->last_eof_comp, timeout_in_jiffies);
 	if (ret == 0)
 		v4l2_warn(&ic_priv->sd, "wait last EOF timeout\n");
 
-- 
2.53.0

