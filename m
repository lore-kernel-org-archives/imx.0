Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80D24A3E
	for <imx@lists.linux.dev>; Mon, 14 Oct 2024 13:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728911806; cv=none; b=PUE42mWg+BWxEfcgvbYh7lkUn5aQJOe0GzsNom34hgxGCOFTmHu7hNF2MZzBWyC3sbs9+DB48aNeKcc/S3RztMd59iwx8oXF6aGQqtkA6BL5B5RS2F+XSc7aYzWvF/f2y3Z2eOR+T1Jx5+2hq6s16CMgC0h0luCfgT1IRo+TRog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728911806; c=relaxed/simple;
	bh=FGh1USeWntWI8ZQEGAaLSFGyBkAiHg39jlIcF0HR9O4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9fnz2cl+lwGbUdEGaHzo2JecuweqJ2V7/lJyRS30qyXPp48bDmp1/THGSV0da4v8L/YET2FFXsRXu8zxPnlE/mO00ElmUo4RQIkaQeiTiIOoPkujZs9OhRHw6RKJyYqMjwIuvaedKdu93WGAnYS+HWnLXwTTNn0Ee2Vd6wuAo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxkJqpSD; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxkJqpSD"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43056d99a5aso34089545e9.0
        for <imx@lists.linux.dev>; Mon, 14 Oct 2024 06:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728911802; x=1729516602; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUH25x79k8EHQsto7o4HWXcz+cLM47kx/MicJivdg7g=;
        b=fxkJqpSDo3yJm44Jw0QjzgJr14N5gKPqjjsQTjjnHOUTiAjEesyRyvmc7zE5rM+zrE
         FH6Z0Op2KT8/RVcGt9+7P4oPj5Jrg7ow5lERj9rFNDJSyCLcwXpayrZS7Jw+KCKEcVjC
         8kpOKCpvv76Dk/B1pS3IIWxkGEnqH7gCWhsgcwkWzAhFed16TCZsAU7xagKUt4X0nY7u
         Aj8M/POVvYibHtxQtcm6ZLo15fgbdHqo8qaQ9PDWQXD7dhTtwFaKU1sctSj/gaBzMoXG
         KiYVEzYjCf+jwg9o85GZ4Lig6V4vsFcHxuSZ6maDpItIn28dx0rxkfVm0I65ecriChY2
         jIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728911802; x=1729516602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FUH25x79k8EHQsto7o4HWXcz+cLM47kx/MicJivdg7g=;
        b=LP6Qq1ofW0g9wtS5Wkt7Raw74enheZea2isaTnyw4uJFzBBpkIEvlnr1K9zvKLHPwJ
         MnCwk+rv2ut6yw13aDqDTiZcMxQB0J5D7xZi2ia1dfg5BI/v3mvvYa5y28fxP5q77BSU
         6oI13I/Y3e9fHoYj+qIjopqZJGkfmchh7ZdC6BM6gNdc2XTCHWIc7ERNHCa7qFk46UNR
         Os/MwlhN0AOEN5OODYtuMn1M+M4WzmMi2nhf62wWb+zNgUP0XTqQQ6/s9tCVyBB9399I
         YJVbbspDJiaJsfhwhlI2SsjXR5Dv6NeN1Z5aSk5mnUJa3LHhK+9ARBdlngNzmnkDdGZE
         9C1A==
X-Forwarded-Encrypted: i=1; AJvYcCWvpd7yEUE5GrAL1kcwQA6QEIBmvHe0Advt+yp5/R+Lynbrlc4WFm/f2gCGRE5s+EY0nn0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwffyfoRjKcmCsU7fjTMxw8di1pMEst92uKXTj41b54C6UJWhnD
	ho6lh5MMLgylLQSE8iSXhMa4R+YRsGl5bujG9jPxTGvl3p7N0xp2
X-Google-Smtp-Source: AGHT+IHFCOhkWsbSszMYyapdJCiM6wV55PCzOwhLCTtrrsuvQ5Od0oVlQ1v7sPpCFmpXOlc0aIrgWA==
X-Received: by 2002:a05:600c:3106:b0:431:136b:8bef with SMTP id 5b1f17b1804b1-43115aa52a6mr133830585e9.7.1728911802065;
        Mon, 14 Oct 2024 06:16:42 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:d130:f8ef:c6c1:55ee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430d748d42fsm153420425e9.43.2024.10.14.06.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 06:16:41 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	l.stach@pengutronix.de,
	arnd@arndb.de,
	Frank.Li@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v5 1/3] i2c: imx: do not poll for bus busy in single master mode
Date: Mon, 14 Oct 2024 15:15:12 +0200
Message-ID: <20241014131635.205489-2-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241014131635.205489-1-eichest@gmail.com>
References: <20241014131635.205489-1-eichest@gmail.com>
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
while the i2c bus is busy and avoids SMBus devices to timeout. For
backward compatibility, the single-master property needs to be
explicitly set to disable the bus busy polling.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
@Frank and Oleksij: I kept your tags even though I made multi-master the
new default. Let me know if you have any objections.

 drivers/i2c/busses/i2c-imx.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 98539313cbc97..d697abd2459d4 100644
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
 
@@ -1468,6 +1473,12 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		goto rpm_disable;
 	}
 
+	/*
+	 * We use the single-master property for backward compatibility.
+	 * By default multi master mode is enabled.
+	 */
+	i2c_imx->multi_master = !of_property_read_bool(pdev->dev.of_node, "single-master");
+
 	/* Set up clock divider */
 	i2c_imx->bitrate = I2C_MAX_STANDARD_MODE_FREQ;
 	ret = of_property_read_u32(pdev->dev.of_node,
-- 
2.43.0

