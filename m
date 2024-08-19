Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A33F158558
	for <imx@lists.linux.dev>; Mon, 19 Aug 2024 07:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724052062; cv=none; b=LmUVsb528TzENbAhWrSb/yw5k3oVxNhrK0N4qIyHaa/08zjkG9OhTn8FPTJa3pxrutbUvBYo9OOOP4likke4Djv5Hnq5mnkPjAEwkmuvpi2us/HqdDm1ry0GEheCnaWXeesQwYZ8B00SbM+R0NESchMo18eW5nCTjpaZddGP9Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724052062; c=relaxed/simple;
	bh=nSrZeZN/fR2/m4a6bRZSAbO7udU6fTJi7sh/UKoG9uE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wxbr6RqySjpgEYgKzJUIAjUqGmmkBXtA6yvFeqq9jvP07CVkV8fOGOA2WIuBFWTLMbLkw8INttyl5jCYAgFgbgTMZQCTe3jqlR9zfoU54kswjxNAA4ewSx0fyZ+Sfc3592imnbKCswqkspvONuTmZNo4hV+s/0GvY3BrYZ1elKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZA7JMEN; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZA7JMEN"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-371a92d8c90so998432f8f.3
        for <imx@lists.linux.dev>; Mon, 19 Aug 2024 00:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724052058; x=1724656858; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQnKQ+l2pVXsLw/eD+VtVGslh2B+H1j9MwPdEcxHBHY=;
        b=SZA7JMENvu2NMOxaRkdCYVs7Cth+eXhHkXdu/HAzU9pfGtLcwmf8hBf5PHwMzalRNt
         H50LxHWsc4aqmW2gllg7kXLN4E/cY4f+APVKVZBG6q/R/Mb9RU23MUcYOXB+azwX9oCg
         s+SyJnI+Gbgt9Mr5ikARZJXsDz09gkm4sZPZ6/FPaLpDglhM9H4uPg0ObGspwN4RdJnn
         WxGA2xijVdZCvCEEOTcmytLSGZBsf3/5p2dXZRA8TMWZhqN/nGokOcnbNxN/b9gOT8FD
         RpZnT4I0mVUO/ypDOamiFWYw+nKd9DwEt/vhPmBV7N39VYgYishWZ/4ere9q1nT7547Q
         Qiig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724052058; x=1724656858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQnKQ+l2pVXsLw/eD+VtVGslh2B+H1j9MwPdEcxHBHY=;
        b=xB/rP6T1HzqZzYyB23vje0KwiMn2jGX4M4Q89nY5j65Ya2ATKBItFb+cu9fNLjy9IB
         aqCwOeQyvvXBbe2+JIjVRiOfyaK4mFw77OQiMVKYNTWTO5MmNfzcNEp9btzvcCNU4Mwh
         j/sLTqLTlyIO54OH2qX8FModV8+nlFK9uNAUXLSSjYbR2l8ChoBOGeKTBDoaNKA4WBKe
         5qxfWhzQUi1YR62l5fEhx4gnnw78CSJbTfndPzJIxPOnXgidJ1OIP5OmmIlE8jlFWaWz
         n/MmcG0x+zgwTiIthNGiic0ySpd5n8JvjLWm6MEzmP6OOXG32dVnLQkuBzYnvioOLuVU
         sxzw==
X-Forwarded-Encrypted: i=1; AJvYcCVRQYcLsUdHFPTAWO+gE9naq/uaMLgInChgCZq1oq3oi+qRvp4JdD7A/Bh2QB2MHySSNcLmroRtG5wEJJ/OeKtrjEwI
X-Gm-Message-State: AOJu0YyxKedtrNBG8fb3n7FLhHLPGyvrV+/I/pzX41Qq7+l/N5Vpt+tD
	BNrPSQgJjzdi2jiwPegMUdrVEUcuEBMbooANoEb3mJ9o0E1q2Bv7
X-Google-Smtp-Source: AGHT+IGDEu7I+erglH98yvQkzoSXGnOGuaqRI1Si7hVeW6tE8rDS+NOXyjyxisJ1IAlZjBb4/19Oaw==
X-Received: by 2002:adf:e905:0:b0:367:8fc3:a25b with SMTP id ffacd0b85a97d-371946a32f1mr6679543f8f.42.1724052058284;
        Mon, 19 Aug 2024 00:20:58 -0700 (PDT)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:a64c:8731:e4fb:38f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189896a9csm9683734f8f.79.2024.08.19.00.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 00:20:57 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	francesco.dolcini@toradex.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v2 2/4] i2c: imx: separate atomic, dma and non-dma use case
Date: Mon, 19 Aug 2024 09:19:08 +0200
Message-ID: <20240819072052.8722-3-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240819072052.8722-1-eichest@gmail.com>
References: <20240819072052.8722-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Separate the atomic, dma and non-dma use case as a preparation step for
moving the non-dma use case to the isr to avoid rescheduling while a
transfer is in progress.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i2c/busses/i2c-imx.c | 107 +++++++++++++++++++++++------------
 1 file changed, 70 insertions(+), 37 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 1add946e3bc20..e242166cb6638 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1011,6 +1011,43 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
 	return i2c_imx_acked(i2c_imx);
 }
 
+static int i2c_imx_start_read(struct imx_i2c_struct *i2c_imx,
+			       struct i2c_msg *msgs, bool atomic,
+			       bool use_dma)
+{
+	int result;
+	unsigned int temp = 0;
+
+	/* write slave address */
+	imx_i2c_write_reg(i2c_8bit_addr_from_msg(msgs), i2c_imx, IMX_I2C_I2DR);
+	result = i2c_imx_trx_complete(i2c_imx, atomic);
+	if (result)
+		return result;
+	result = i2c_imx_acked(i2c_imx);
+	if (result)
+		return result;
+
+	dev_dbg(&i2c_imx->adapter.dev, "<%s> setup bus\n", __func__);
+
+	/* setup bus to read data */
+	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+	temp &= ~I2CR_MTX;
+
+	/*
+	 * Reset the I2CR_TXAK flag initially for SMBus block read since the
+	 * length is unknown
+	 */
+	if (msgs->len - 1)
+		temp &= ~I2CR_TXAK;
+	if (use_dma)
+		temp |= I2CR_DMAEN;
+
+	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+	imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR); /* dummy read */
+
+	return 0;
+}
+
 static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
 			struct i2c_msg *msgs, bool is_lastmsg)
 {
@@ -1021,6 +1058,11 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
 	struct imx_i2c_dma *dma = i2c_imx->dma;
 	struct device *dev = &i2c_imx->adapter.dev;
 
+	result = i2c_imx_start_read(i2c_imx, msgs, false, true);
+	if (result)
+		return result;
+
+	dev_dbg(&i2c_imx->adapter.dev, "<%s> read data\n", __func__);
 
 	dma->chan_using = dma->chan_rx;
 	dma->dma_transfer_dir = DMA_DEV_TO_MEM;
@@ -1131,50 +1173,24 @@ static int i2c_imx_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 	return 0;
 }
 
+static int i2c_imx_atomic_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs)
+{
+	return i2c_imx_write(i2c_imx, msgs, true);
+}
+
 static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 			bool is_lastmsg, bool atomic)
 {
 	int i, result;
 	unsigned int temp;
 	int block_data = msgs->flags & I2C_M_RECV_LEN;
-	int use_dma = i2c_imx->dma && msgs->flags & I2C_M_DMA_SAFE &&
-		msgs->len >= DMA_THRESHOLD && !block_data;
 
-	dev_dbg(&i2c_imx->adapter.dev,
-		"<%s> write slave address: addr=0x%x\n",
-		__func__, i2c_8bit_addr_from_msg(msgs));
-
-	/* write slave address */
-	imx_i2c_write_reg(i2c_8bit_addr_from_msg(msgs), i2c_imx, IMX_I2C_I2DR);
-	result = i2c_imx_trx_complete(i2c_imx, atomic);
+	result = i2c_imx_start_read(i2c_imx, msgs, atomic, false);
 	if (result)
 		return result;
-	result = i2c_imx_acked(i2c_imx);
-	if (result)
-		return result;
-
-	dev_dbg(&i2c_imx->adapter.dev, "<%s> setup bus\n", __func__);
-
-	/* setup bus to read data */
-	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
-	temp &= ~I2CR_MTX;
-
-	/*
-	 * Reset the I2CR_TXAK flag initially for SMBus block read since the
-	 * length is unknown
-	 */
-	if ((msgs->len - 1) || block_data)
-		temp &= ~I2CR_TXAK;
-	if (use_dma)
-		temp |= I2CR_DMAEN;
-	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
-	imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR); /* dummy read */
 
 	dev_dbg(&i2c_imx->adapter.dev, "<%s> read data\n", __func__);
 
-	if (use_dma)
-		return i2c_imx_dma_read(i2c_imx, msgs, is_lastmsg);
-
 	/* read data */
 	for (i = 0; i < msgs->len; i++) {
 		u8 len = 0;
@@ -1241,6 +1257,12 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 	return 0;
 }
 
+static int i2c_imx_atomic_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
+			bool is_lastmsg)
+{
+	return i2c_imx_read(i2c_imx, msgs, is_lastmsg, true);
+}
+
 static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
 			       struct i2c_msg *msgs, int num, bool atomic)
 {
@@ -1248,6 +1270,7 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
 	int result;
 	bool is_lastmsg = false;
 	struct imx_i2c_struct *i2c_imx = i2c_get_adapdata(adapter);
+	int use_dma = 0;
 
 	/* Start I2C transfer */
 	result = i2c_imx_start(i2c_imx, atomic);
@@ -1300,15 +1323,25 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
 			(temp & I2SR_SRW ? 1 : 0), (temp & I2SR_IIF ? 1 : 0),
 			(temp & I2SR_RXAK ? 1 : 0));
 #endif
+
+		use_dma = i2c_imx->dma && msgs[i].len >= DMA_THRESHOLD &&
+			msgs[i].flags & I2C_M_DMA_SAFE;
 		if (msgs[i].flags & I2C_M_RD) {
-			result = i2c_imx_read(i2c_imx, &msgs[i], is_lastmsg, atomic);
+			int block_data = msgs->flags & I2C_M_RECV_LEN;
+
+			if (atomic)
+				result = i2c_imx_atomic_read(i2c_imx, &msgs[i], is_lastmsg);
+			else if (use_dma && !block_data)
+				result = i2c_imx_dma_read(i2c_imx, &msgs[i], is_lastmsg);
+			else
+				result = i2c_imx_read(i2c_imx, &msgs[i], is_lastmsg, false);
 		} else {
-			if (!atomic &&
-			    i2c_imx->dma && msgs[i].len >= DMA_THRESHOLD &&
-				msgs[i].flags & I2C_M_DMA_SAFE)
+			if (atomic)
+				result = i2c_imx_atomic_write(i2c_imx, &msgs[i]);
+			else if (use_dma)
 				result = i2c_imx_dma_write(i2c_imx, &msgs[i]);
 			else
-				result = i2c_imx_write(i2c_imx, &msgs[i], atomic);
+				result = i2c_imx_write(i2c_imx, &msgs[i], false);
 		}
 		if (result)
 			goto fail0;
-- 
2.43.0

