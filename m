Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD771586CF
	for <imx@lists.linux.dev>; Mon, 19 Aug 2024 07:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724052062; cv=none; b=K+iR87xFFBXg2So/s7cpMOiyQjd9WTjB2dRmsFtCuSviygUhbo+k2OjuPK0i0tWRSQXrxJbBvvthIKYx0b5NkCiavOBVyr7Hk3aeKofXtb94aKf8hQSIPpnE2BclZGbp04QqzXyfQejpQhHqHT4euN5bumi6lxxL0hYFExS2HGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724052062; c=relaxed/simple;
	bh=7EukbPFp9jYwNRKD9UsgVvXRecgMzl9o3py4Xy1umos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tKrFxvPhWzcEUzfkVljj+LSn0zrpLzH0xUQUanePG5GGKe/7puHymArLdXH/fMvEYzfwlic9kFsKjjQ4eXZbowqhxw7kzdwokXc5kbNHZ23Eh0/4v0Jgs/Co2L1vHxasgYeiB31UjgjVEKd9dzyD0ZhVbsUgj8pOC0Ogm2tMZ8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9PuABbT; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9PuABbT"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-371893dd249so2104327f8f.2
        for <imx@lists.linux.dev>; Mon, 19 Aug 2024 00:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724052058; x=1724656858; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GsPA5mclXdisvKKaTQ02gNCQ1XXrITHCNqT/Xgg4pnY=;
        b=G9PuABbTEZ1nSZsQTNgbt3wYAaq0WhBEqXmA04bAH8/vOLg7zhvA8JwP01lLPG4dXp
         LX6aqtm8LvGRvBFoIl91TFQLhoLjkodB9GvXf67Aq30/ppctrPq6ohj8wAF7zuZm5uxI
         eOFreSOgWHUACH42p5eOdbH2B//tRdGS/cvDtGor+nzNZCXoBgcfj2rDKnIcSkccLtKg
         s8ANRTOuQ/T2Dgbd/Lh0lSNQwYfMGE//+h+fo7Iki9ITdIHmlZFXStE3GyeZ1L60qEpf
         PlSgYvRnGF5afD+/jZCcd2DVKQ4tiqE6QGn0CKIIoZE50c+UCF3ODIhyooXBKcO/KtSp
         0UVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724052058; x=1724656858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GsPA5mclXdisvKKaTQ02gNCQ1XXrITHCNqT/Xgg4pnY=;
        b=gjKLClGivdknS88VxeAHoIlskNkz99L8zjjvukHA/F44Y3mnOIVBi/AFBzrbfPm15i
         I+9Ey3KKLOatnzDZBgXxui31zonBotQMuVScKwnmYWykDFh3MJLcP9YnCVBWzG9bMuyU
         BE+BCRj+eZKfddMwm9la0IvHuuDXcqqjfcF8Rrwb9clUOos5Usar5BLWgE3LaNfx7EBI
         XjX7C8aR/u1rScjrS+V3onibvm0CaoWViA9i5A+w1FpcoB6xAqehuItFXCekYqt/RHMM
         UCaBMB3qmjdBOfxy9vy+hwvQ/HIJTjK8NfcpeDasSS4IaEsE5jBMBociP1HwxwPnQ+zZ
         7IhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFXmDO4dkKOzK8JWGaGEv8/SptHdGWwOuL7dDhOQAgWIatfH94KxchNDU4w5Dqhyr/oLgPSC7EWSudxFhPTIqA0Ona
X-Gm-Message-State: AOJu0YwhWGUpXE8/XncRJeYByQZcXddY4BqmqB3of0lcJQRW7VemYfGf
	OnI6QvUk6IFo4vom0V62NDVmlBF5L35PSNJasmUP+HrnL9PD93H0
X-Google-Smtp-Source: AGHT+IEUwcTEkZfbBy8umdlK7hlL1JY0T3hwRz7NQ1Yzdd8B4npZGPeuvqx+Sh7ON7/mAc5VseEm9A==
X-Received: by 2002:adf:f5c4:0:b0:371:937a:3276 with SMTP id ffacd0b85a97d-371a747839bmr3485924f8f.57.1724052057345;
        Mon, 19 Aug 2024 00:20:57 -0700 (PDT)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:a64c:8731:e4fb:38f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189896a9csm9683734f8f.79.2024.08.19.00.20.56
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
Subject: [PATCH v2 1/4] i2c: imx: only poll for bus busy in multi master mode
Date: Mon, 19 Aug 2024 09:19:07 +0200
Message-ID: <20240819072052.8722-2-eichest@gmail.com>
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

According to the i.MX8M Mini reference manual chapter "16.1.4.2
Generation of Start" it is only necessary to poll for bus busy and
arbitration lost in multi master mode. This helps to avoid rescheduling
while the i2c bus is busy and avoids SMBus devices to timeout.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i2c/busses/i2c-imx.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 3842e527116b7..1add946e3bc20 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -216,6 +216,8 @@ struct imx_i2c_struct {
 	struct i2c_client	*slave;
 	enum i2c_slave_event last_slave_event;
 
+	bool			multi_master;
+
 	/* For checking slave events. */
 	spinlock_t     slave_lock;
 	struct hrtimer slave_timer;
@@ -481,6 +483,9 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, bool a
 	unsigned long orig_jiffies = jiffies;
 	unsigned int temp;
 
+	if (!i2c_imx->multi_master)
+		return 0;
+
 	while (1) {
 		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
 
@@ -540,8 +545,8 @@ static int i2c_imx_trx_complete(struct imx_i2c_struct *i2c_imx, bool atomic)
 		return -ETIMEDOUT;
 	}
 
-	/* check for arbitration lost */
-	if (i2c_imx->i2csr & I2SR_IAL) {
+	/* In multi-master mode check for arbitration lost */
+	if (i2c_imx->multi_master && (i2c_imx->i2csr & I2SR_IAL)) {
 		dev_dbg(&i2c_imx->adapter.dev, "<%s> Arbitration lost\n", __func__);
 		i2c_imx_clear_irq(i2c_imx, I2SR_IAL);
 
@@ -1468,6 +1473,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		goto rpm_disable;
 	}
 
+	i2c_imx->multi_master = of_property_read_bool(pdev->dev.of_node, "multi-master");
+
 	/* Set up clock divider */
 	i2c_imx->bitrate = I2C_MAX_STANDARD_MODE_FREQ;
 	ret = of_property_read_u32(pdev->dev.of_node,
-- 
2.43.0

