Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6FA14900E
	for <imx@lists.linux.dev>; Mon,  2 Sep 2024 07:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725263018; cv=none; b=dq2fWyyIwIAr/fTfNKFLTQs/mEc/CU1PRDjFcePmMqYCMONj2VFj6nzjt4Kmx2GY2MdPhtUSdbZtxu7Vfekvttw4YatyRnFGDecjcbVp+in4p7NnMMpsr+gTKcP9CZpLuxZ6vRgUTJ8i2lqcsdc7oiXsnMHB5+06vAExNE8HTFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725263018; c=relaxed/simple;
	bh=1+Y0JalHCoCU/LU0jqow3NhVDYD+bqfOX2pYtJtYgIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wp+LnQAwRtcN6qqyjrMI9+eL0k0BlO7WWs8bvmsqRQffhfsTB4WjPWOzlO9UFsK9zBo3IfZfbzipW5JnkmES1X8U/xYZb/cZmz+RYs2fqphYV6PNhpdYlc5UlIve13TCUdklvOQfoc8xZbufuMOOAPHFyIFNhjRfhRuTNVfLf2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BpS5gwjo; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BpS5gwjo"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5bede548f7cso3883650a12.2
        for <imx@lists.linux.dev>; Mon, 02 Sep 2024 00:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725263015; x=1725867815; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpFUa0HNPaA1/z3K1YQrq6JjQoT/x4qwWIkq9q1c5wM=;
        b=BpS5gwjoS+k1HRrk3yVeRaAdMXI1DNKoiI+1trH+v1U7MSpzqdRkWguApVdWJd/HPW
         7uzis5zJrybYpYsgWMqporu6rpYTgzomUbkrTfeyb+gBwtci8QsGRuvg+tFGYmNQJZpO
         fFUbZax5HPhQkJegr5o9vc9IsgR8hQdlrY83gnUmTT9jtGaNcbCT+Eh4zHvygwzslrPU
         bgwL+fPFEmVx8XgpA2eNdYux+OZjgnp3fF8mVLGhnp76nbuQYYcXakCulGnV+GL7sSdi
         4Ca3VMYRgH1/hmuDPrK8WAPhjcUZqIPdUMqvLcN8Y80cV/TUBGKm5alq4DvdKD4Lcy/v
         HzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725263015; x=1725867815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZpFUa0HNPaA1/z3K1YQrq6JjQoT/x4qwWIkq9q1c5wM=;
        b=Of8CW4ctUK7ifzC02cFwfVFtyRkkiM3ZvqxHZo8nkkPdZSVTCIcn0xHnOq7u2UAQ7Q
         EVH/6VVGObV6NBIs3vY6PvMkHl07KXKLWWOH5ZrtzfoCj4+8GqHTPsEbMS7oENRhMDfn
         27DItxQlGS++SNLvHaN48QT5z8W3G0kriRiNNxGyPK7/a4Krpwcf9dLPzFNBHPnmI8pg
         NZUqtKLZIJ8sV6kZ1kzwS5QSFl6AwSl/rpVsQCyhHGnM7AbmX9KnIP9GOsh0ucXxPc6Z
         64FBN/4EXdoKqdujX91vFE7eqKRgjNFAdMcqahhso5BvxPXoPuTkEbf+2xULRjdKfvej
         hjaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKcKjlnf7ZMXufSl8+yKFvESn8nnZz6uklpTcLHt+gDndrZ/AQRnAPdm39/603qGalAz8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzvI2PNtZskfodSCjA6mO/i7sU4Sm6ccW1JzNUrsm97rP66Ku1b
	/RcnGTma6PwoFxSh+DcegC0qiNV+cOmt8xGitwVfQc+i7+/Lnc82
X-Google-Smtp-Source: AGHT+IGXhpPe+w6G0FeAT/iHfSIhFVsjo1uLMmtN+ZLdNG28sLEI6fGLHqIbur3Zw3B584wVE2jslw==
X-Received: by 2002:a05:6402:5215:b0:5c2:5620:f7c with SMTP id 4fb4d7f45d1cf-5c256201165mr2046949a12.18.1725263015146;
        Mon, 02 Sep 2024 00:43:35 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:3786:cf07:4865:dc9f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c24ff04551sm1975931a12.35.2024.09.02.00.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 00:43:34 -0700 (PDT)
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
Subject: [PATCH v3 1/4] i2c: imx: only poll for bus busy in multi master mode
Date: Mon,  2 Sep 2024 09:42:01 +0200
Message-ID: <20240902074330.6349-2-eichest@gmail.com>
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

According to the i.MX8M Mini reference manual chapter "16.1.4.2
Generation of Start" it is only necessary to poll for bus busy and
arbitration lost in multi master mode. This helps to avoid rescheduling
while the i2c bus is busy and avoids SMBus devices to timeout.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
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

