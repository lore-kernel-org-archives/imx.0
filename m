Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D790817BB3A
	for <imx@lists.linux.dev>; Mon,  2 Sep 2024 07:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725263019; cv=none; b=e20Bulp70kM0QjXB+ZBWcM+5NCQJQh/KLXJ1Ild4A1Esnu0UpcalmDy2vge1AoAUSA237oN2tG0UJ2RCg0aFBFrHqPefMIDoIT2aFaOu+k1FUPpyPDl5R7MUdUxsz9uglJHBFfJ7BM3YzPka2DoTFJ1+V5bwcUb+0psyHxnQUtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725263019; c=relaxed/simple;
	bh=jCdQS2njW69Z61Z85AFkcNyViqbNZBaUT4KnGKlajIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IKa8NU4B2XdYxMb9F/EaszY+3tkTwCgafmPBRZ+c76/LeiC2LatPu1IgnKN5H33XX1DN+0riv+WQkl8AfnIYMYwYZcBEsy6mxrDD8x9KZ8PszeURFVE+YIARctIDidaWBW7Js4/jYRHXz7m3cpKvISXx8pLr/IhFdhBuOOp5Q7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1kHbmRl; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1kHbmRl"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5bec4e00978so3722204a12.0
        for <imx@lists.linux.dev>; Mon, 02 Sep 2024 00:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725263016; x=1725867816; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhXn8yzBmBetRaq5gwnzPTgSSOE3n3HbgWNjkP9ceck=;
        b=E1kHbmRlx+UBGL7gXUsLliTC6LKuSYkkisohuyryuH5/6vqDzCvnOUKxqSWg6sNRYX
         3vzJqbQqdnAGTxLwH+gpsWnXyiBQUVsjmg+BhSaXufEt6km0sCvWerbjdaKjhY9vJmdt
         RDzSKKUtXBiCeHQU4HScZCJyfjvgjtOpCocg1MY4oyzaevhrdJIsKVKTdxNIJb9HSRQj
         amE/+UGQELesyMwjAdcJyFd9NdRRvcPF2TCNtbp/qcmPd9gGywP7m5WHnKbj98UlLu16
         4r9O+TtArFIqd9f/x/uqUbi1JO9Yv0VzmfbnoBeCkMGHCr0ihmX4YlCdSbzJe8Rx+5i8
         KCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725263016; x=1725867816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhXn8yzBmBetRaq5gwnzPTgSSOE3n3HbgWNjkP9ceck=;
        b=CvRzVYFKKXMI1pniYaLulxTCwXbvAyhjwnTb6CM/pgX++69Z7bQ4fDZ8UFi9kycgIV
         WVmrNfdQ6gUGvTYbejga5VKSexpslXzKHi32Y3aE5WLw3J5P7uIj0T1WwkQd1xCv261w
         aQtGOoEAJEQqjWQQAL09z5IDwxjF41utRi1CRSPfK0/biDIyE+mX9NXWLrKvaogSzsYj
         MNzBiuIitPXHT6hH14nJLPONhOTOjUJ6LYXpHDVTVOE+04HrtNOzj+Ms9bxBP8XsV3zz
         /h4+V51X51i86cVarFO1rvNYLdXCZnhFA1nUCI3n0sWB1G3SqNPjuNcl9HWkS5slBHrb
         969A==
X-Forwarded-Encrypted: i=1; AJvYcCXz5uaTDWs8M1YlxfPuZq4tVT6iF2UANguneg/dbezOcSll2CQGIb7Mc4oFVXCaM9FYjTI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMKzALpO27j7JN3aZ3I2RPlg6ytdWLy19EXXoUvOh89Tg66OJf
	hlq6PHhr0/Il7iIpyJWjAhsqUKWvk/8GQUoJ4hExRMpU4fupIcfE
X-Google-Smtp-Source: AGHT+IHiDu66PFT4NbI9XCCDykJ+zbc3l+Z3gf+wyx1pxTHnxU/1Kf6dpoiZq5hhs53tpTHzDM/f6g==
X-Received: by 2002:a05:6402:4310:b0:5a2:2654:7fc4 with SMTP id 4fb4d7f45d1cf-5c25c3a717amr2166864a12.8.1725263015871;
        Mon, 02 Sep 2024 00:43:35 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:3786:cf07:4865:dc9f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c24ff04551sm1975931a12.35.2024.09.02.00.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 00:43:35 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	Frank.Li@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v3 2/4] i2c: imx: separate atomic, dma and non-dma use case
Date: Mon,  2 Sep 2024 09:42:02 +0200
Message-ID: <20240902074330.6349-3-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240902074330.6349-1-eichest@gmail.com>
References: <20240902074330.6349-1-eichest@gmail.com>
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
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/i2c/busses/i2c-imx.c | 107 +++++++++++++++++++++++------------
 1 file changed, 70 insertions(+), 37 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 1add946e3bc20..2e86d363e186d 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1011,6 +1011,43 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
 	return i2c_imx_acked(i2c_imx);
 }
 
+static int i2c_imx_prepare_read(struct imx_i2c_struct *i2c_imx,
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
 
+	result = i2c_imx_prepare_read(i2c_imx, msgs, false, true);
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
+	result = i2c_imx_prepare_read(i2c_imx, msgs, atomic, false);
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

