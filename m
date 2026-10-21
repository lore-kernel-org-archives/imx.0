Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792623299;
	b=TTcbF9B4J/OpjdMSqDYKp6CpMnnC3SUllNl/U2jNgv5XMFcHeV52MwG1LQreoH+BZwl3
	 7HjW2VzomdCNpgXXtIBfG368rNeeU9lAxRi99WKf252tzBuyzgyr8v3vrufkO2eShdAIi
	 l2edW8SIewzixPixkbAqqljPPT4d2+ocG3QDZsy6UROzcxtbYKokdp1HQPp1yZKnyRcZb
	 OnuGkKt15G2FGeEr8KWO8wAs94kW045gBadbcqt/ikipsJ28BS6UQazfhAsDFGK0najU4
	 2u9hB/Ozkt9aeSeuBDLhlJGjLGvWQhxNmhygfgvRQXKuCsVxG3K6p23CQ12DSlY/Log==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792623299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9tda7KCgHiHf7p60vP6BBaPr59gypHnjN4ebH49SPko=;
	b=n3xG2x75Pps08XPcFGUv68YIzyPRZiQE9FAJmBZoyJhz0fJcmbFHyOzBaFJOKXc9/L3v
	 Zi+joBuKQqO5NTRZHnjzQ3yCbTrDb0J6zDyELZ7x+BF3uZqA91tgmeaX+MU5oKtRPbEa7
	 q//BJyouxh3RojOlapRGsk4wudhAWYjZE4XpQlC/PXZoVU4BsjvH7eEmv5gzvHKJDMFw7
	 65R+V05OoPrai6vVHmt3RQ/dMpXMaD0Rnimh3lKcN8a8zoVJZOG1immk9v3tJia6AxEc7
	 4Nqx4ROpmJebxO3mQq9trRvEqnb7Riomr2SMYnGf4A4y4m02Zn/Q5zrSb8gwk2mik4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U1SVe8Fh;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54A7606A320
	for <imx@lists.linux.dev>; Wed, 21 Oct 2026 22:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D54A7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U1SVe8Fh
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3550c917fd3so1658888eec.0
        for <imx@lists.linux.dev>; Wed, 21 Oct 2026 15:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792623298; x=1793228098; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9tda7KCgHiHf7p60vP6BBaPr59gypHnjN4ebH49SPko=;
        b=U1SVe8FhU3Adg8eFQ9Go3yan5tgeWUM1elRkX6VF7oWdMWUpUlZ1R3FO34tdt5efJe
         pNXAYTKM0VEw37znA5iPHGGi413e8DU+6jX359nEslw3eI/H52n/QIWJWQb5M9uad4nv
         6Bz8niBD96Rb0af+l6bg2AQpblEvyvTqjo6rQIKoMWILI8HK+iFQrgF0sRGnuwMMidv6
         wTYFQOxAhcfoSGjU2q5zquqaUssNJFQ0PgQ6KHsGNee0ClV+o6nC2HUOBmcgxCDMFzDl
         A7crLVqpzg23T779JmxWvJNOQEdhxVeNjHfgUmmI6spP9o5BRTY1/RL6G9MTrDbUi8kd
         HH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792623298; x=1793228098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9tda7KCgHiHf7p60vP6BBaPr59gypHnjN4ebH49SPko=;
        b=A1p41ZN3V7W2Sh8O6ipi9yMQL/jyM8mtlWHqzecU1hdyD5Ar8WuwywZi7ZA+gqpOma
         ecLXvUyt13SeZAZSJHZbc94c6cHzuARrdz67qs82psJTCL3mLIRRabzBMQMbWa0N+I0Z
         aupcExPlZtaVmnvwNHFnRwuJGLzcORyuKtOt3yE2U6DwQJmvgQeups2jcRtRvxPRgfm0
         oWWy98NnysV+Qa6Vw9/9mx2GNJZOSpNakmSFoHautFQzRzef3D3MOgf5kDmGjJx+Fi5Y
         kt9+kIkFX2DG7aGheKhXHk/2rrTapcpyoyB1gBd/edqh39NKliHpbiYWLirg1iAi0vkj
         dsxQ==
X-Forwarded-Encrypted: i=1; AKwUvBywYkJbEozGgeEXRTWKR6+GC30Ot9mOkmlUwDBCaHp9lDG/ewJ5p+EiUlHbr8L5rWSTytA=@lists.linux.dev
X-Gm-Message-State: AFq9FYIMIL5AQIyN1V6dEp+wDAG+B39agH1j4R72RQ+kNJCAsw5Zn8Ka
	8jldiqBE7BTndiuEozb1jkG1NWKSv3wJwP0wIzqYNkSKLMlsjSgKl3FO
X-Gm-Gg: AYBFou1L7Z85PmAYN096/onuada9VqVqCwMPKmz1pDmR1AmI3vKq7z/z9pQkhtxHwMD
	d6OOGFXs3FBBZfh0azYt8OvMpOadF6deWcKktHCJpOpPn/biKDAzCQUX/wOcSutLRB3LP+67GHX
	PvxcHhYkFTJpfxL9DGYexYZJ3En/znb0R6RpAqzFbSyMOz9XTr+TBp+GM9VxBmrbevM5BwELqcu
	jm4gB82VD+uQQKlMDQWJCIwh7CAEBcy1UBTIODhok1ZESgfffHNhS+BJX4uIThZ5PsMLeCgmdOQ
	O3cmmyz61xTMzuE1tq0YY4xr2LiW6UlOdxqcz7inGu5T9w26Hh2Gclg5liEcw1BtO2i/KYJx2K5
	Ib94J+ayOA2CLgQPvU+YOEWXdBpptuHnNHyX2cEONCg1fmoqT2Z3m5ZpoqOffL9vmOaW/X3W/M8
	WOG6potzKc98cZvTrJXV3Xg1N50NZay3PWNipPgjoKpAe3NiGw6nSA35HPP41cNpLeKD4/U3ru7
	9WJrbrjlsj0h53oVXTx96+6W0EA8OC86Uv8xlM2XcDBuuoC55dEo6oGmqvFyeIMEe+tRBiz+aOn
	bPfj3/LZFP35nULkEAABe/Rro1sju0cGd65aT9mFQPt0Ph8dTUKZy+gG5UGCP4ZhfyWx9/bu2iK
	p0lAxYSUneO0=
X-Received: by 2002:a05:7300:d212:b0:328:7033:9b8c with SMTP id 5a478bee46e88-3674c43c208mr4277149eec.6.1792623297862;
        Wed, 21 Oct 2026 15:54:57 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-368ee692656sm442943eec.28.2026.10.21.15.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 15:54:57 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Arnav Kapoor <kapoorarnav43@gmail.com>,
	linux-iio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iio: adc: fsl-imx25-gcq: check the return value of the
Date: Thu, 22 Oct 2026 04:24:45 +0530
Message-ID: <20261021225450.628499-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver ignores the return value of all the regmap accesses. If one
of them fails, e.g. because the memory mapped registers can't be
accessed, the driver just continues with an undefined state.

The most severe case is the read of the FIFO in
mx25_gcq_get_raw_value(): the destination variable is not initialized,
so a failed read leaks uninitialized stack memory to userspace.

Check the return value of all the register accesses and propagate the
errors to the caller. In the interrupt handler, where there is not much
that can be done about a failed access, just don't use the content of
the status register if it can't be read.

Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/adc/fsl-imx25-gcq.c | 82 ++++++++++++++++++++++++---------
 1 file changed, 60 insertions(+), 22 deletions(-)

diff --git a/drivers/iio/adc/fsl-imx25-gcq.c b/drivers/iio/adc/fsl-imx25-gcq.c
index dc310ed616a1..b6c1ed867177 100644
--- a/drivers/iio/adc/fsl-imx25-gcq.c
+++ b/drivers/iio/adc/fsl-imx25-gcq.c
@@ -83,7 +83,13 @@ static irqreturn_t mx25_gcq_irq(int irq, void *data)
 	struct mx25_gcq_priv *priv = data;
 	u32 stats;
 
-	regmap_read(priv->regs, MX25_ADCQ_SR, &stats);
+	/*
+	 * If the status can't be read we don't know whether the conversion
+	 * has finished. The interrupt is still acknowledged below, so just
+	 * skip the completion and let the reader time out.
+	 */
+	if (regmap_read(priv->regs, MX25_ADCQ_SR, &stats))
+		stats = 0;
 
 	if (stats & MX25_ADCQ_SR_EOQ) {
 		regmap_set_bits(priv->regs, MX25_ADCQ_MR,
@@ -109,15 +115,29 @@ static int mx25_gcq_get_raw_value(struct device *dev,
 {
 	long time_left;
 	u32 data;
+	int ret;
 
 	/* Setup the configuration we want to use */
-	regmap_write(priv->regs, MX25_ADCQ_ITEM_7_0,
-		     MX25_ADCQ_ITEM(0, chan->channel));
+	ret = regmap_write(priv->regs, MX25_ADCQ_ITEM_7_0,
+			   MX25_ADCQ_ITEM(0, chan->channel));
+	if (ret) {
+		dev_err(dev, "Failed to setup the queue item: %d\n", ret);
+		return ret;
+	}
 
-	regmap_clear_bits(priv->regs, MX25_ADCQ_MR, MX25_ADCQ_MR_EOQ_IRQ);
+	ret = regmap_clear_bits(priv->regs, MX25_ADCQ_MR,
+				MX25_ADCQ_MR_EOQ_IRQ);
+	if (ret) {
+		dev_err(dev, "Failed to clear the EoQ interrupt: %d\n", ret);
+		return ret;
+	}
 
 	/* Trigger queue for one run */
-	regmap_set_bits(priv->regs, MX25_ADCQ_CR, MX25_ADCQ_CR_FQS);
+	ret = regmap_set_bits(priv->regs, MX25_ADCQ_CR, MX25_ADCQ_CR_FQS);
+	if (ret) {
+		dev_err(dev, "Failed to trigger the queue: %d\n", ret);
+		return ret;
+	}
 
 	time_left = wait_for_completion_interruptible_timeout(
 		&priv->completed, MX25_GCQ_TIMEOUT);
@@ -129,7 +149,11 @@ static int mx25_gcq_get_raw_value(struct device *dev,
 		return -ETIMEDOUT;
 	}
 
-	regmap_read(priv->regs, MX25_ADCQ_FIFO, &data);
+	ret = regmap_read(priv->regs, MX25_ADCQ_FIFO, &data);
+	if (ret) {
+		dev_err(dev, "Failed to read the FIFO: %d\n", ret);
+		return ret;
+	}
 
 	*val = MX25_ADCQ_FIFO_DATA(data);
 
@@ -204,14 +228,18 @@ static int mx25_gcq_setup_cfgs(struct platform_device *pdev,
 	 * Setup all configurations registers with a default conversion
 	 * configuration for each input
 	 */
-	for (i = 0; i < MX25_NUM_CFGS; ++i)
-		regmap_write(priv->regs, MX25_ADCQ_CFG(i),
-			     MX25_ADCQ_CFG_YPLL_OFF |
-			     MX25_ADCQ_CFG_XNUR_OFF |
-			     MX25_ADCQ_CFG_XPUL_OFF |
-			     MX25_ADCQ_CFG_REFP_INT |
-			     MX25_ADCQ_CFG_IN(i) |
-			     MX25_ADCQ_CFG_REFN_NGND2);
+	for (i = 0; i < MX25_NUM_CFGS; ++i) {
+		ret = regmap_write(priv->regs, MX25_ADCQ_CFG(i),
+				   MX25_ADCQ_CFG_YPLL_OFF |
+				   MX25_ADCQ_CFG_XNUR_OFF |
+				   MX25_ADCQ_CFG_XPUL_OFF |
+				   MX25_ADCQ_CFG_REFP_INT |
+				   MX25_ADCQ_CFG_IN(i) |
+				   MX25_ADCQ_CFG_REFN_NGND2);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to write the configuration register\n");
+	}
 
 	device_for_each_child_node_scoped(dev, child) {
 		u32 reg;
@@ -265,16 +293,26 @@ static int mx25_gcq_setup_cfgs(struct platform_device *pdev,
 			return dev_err_probe(dev, -EINVAL,
 					     "Invalid fsl,adc-refn property value\n");
 
-		regmap_update_bits(priv->regs, MX25_ADCQ_CFG(reg),
-				   MX25_ADCQ_CFG_REFP_MASK |
-				   MX25_ADCQ_CFG_REFN_MASK,
-				   refp | refn);
+		ret = regmap_update_bits(priv->regs, MX25_ADCQ_CFG(reg),
+					 MX25_ADCQ_CFG_REFP_MASK |
+					 MX25_ADCQ_CFG_REFN_MASK,
+					 refp | refn);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to update the configuration register\n");
 	}
-	regmap_set_bits(priv->regs, MX25_ADCQ_CR,
-			MX25_ADCQ_CR_FRST | MX25_ADCQ_CR_QRST);
 
-	regmap_write(priv->regs, MX25_ADCQ_CR,
-		     MX25_ADCQ_CR_PDMSK | MX25_ADCQ_CR_QSM_FQS);
+	ret = regmap_set_bits(priv->regs, MX25_ADCQ_CR,
+			      MX25_ADCQ_CR_FRST | MX25_ADCQ_CR_QRST);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to reset the conversion queue\n");
+
+	ret = regmap_write(priv->regs, MX25_ADCQ_CR,
+			    MX25_ADCQ_CR_PDMSK | MX25_ADCQ_CR_QSM_FQS);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to configure the conversion queue\n");
 
 	return 0;
 }
