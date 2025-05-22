Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBD723A57F
	for <imx@lists.linux.dev>; Thu, 22 May 2025 14:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925564; cv=none; b=kRCDlz3C/wJzMbOltfyc/g8BY59wWXXweLLEmNCbQ7Oo5YdxqbzUI2Oq/vzYdnS74baisgbjh2hLVNC0tyTDpzrUvq48utdCsbFUExMhTISaSX/Ejbbwh2N/vLC90nYYWGzrjoUsSFbvuNzz1DzI8CK5S/ZutuFhuAPNqH/RV1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925564; c=relaxed/simple;
	bh=yddrBEmi1RYqf8QMPGgBcWKQg/oZLwzcf2KAxCgTLyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cSCym6glQ93US04WCJ4HL9VFCdYIJkF9URUxVQ0g2rRF4YKRac3l5bnukcyd8Bv9U70E5nOFAlemfgxSbhXQzoYGP8V6/QK5j94FuleywcrHfEUnPm5A2DiCVN1GjoAUF3ZeBSd/lYwIVEC8eqVJzP3KJqkxGCVSgevi2YAxKHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UkePc7Jg; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UkePc7Jg"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-44b1f5b917fso1395295e9.3
        for <imx@lists.linux.dev>; Thu, 22 May 2025 07:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925560; x=1748530360; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bX8Np3nsOAVhGpGTczqX2XujPUCRtkdhb7ZQQUV9YcY=;
        b=UkePc7JgvMxUWn9UO4YHYCL5OdA5678IE56Im7ezIBTZc1zv9p84Eru5f5L2bsOnWE
         btl9N/FFKkGyej3XiSZMtbTojF0noA4J8HU1Jx3WZFJfyYALr0mq61YTN1VxZp7GEOtF
         /ioJM146d61T7hkX0iQ2ZAli51T97PX+nb4kuWhloAV0VLjT4PF4dqSD6FbgT3PEuyGi
         OoUJ2cIK4VHmmvGZTxl8BUFXMlghjcKo/4bv+LJmTizW52cpneEcc/fyRbEfhDmBuu9t
         ErqN8GO2lBSYO/w39pvltijgwDptGHYWubhEDl9Vp8KyGQCCg5QAp5G5GTggkW9vbAUI
         VixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925560; x=1748530360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bX8Np3nsOAVhGpGTczqX2XujPUCRtkdhb7ZQQUV9YcY=;
        b=GlLuJGIixfvVykVe+IC9X5BvWSUPH0Xlg9vwTepHuIa28W5mrYkboScLNMxpGZF5io
         viJNr32p1O2DW2x/6d2KYR5ubM2vZQoaATzyFCcr5O4e7bqkjvtYaleOK0ee+JhhMXFx
         wIjAvCtsf4uGTCXfSYiOEW0ex4DqD6CPh86EdE0YwL66zw+uqMvRRyt3+vmriI+SJKd0
         cql+/k37+8QyYgssrWOwkmHu4oUBg2hy+YA3thOioxWF/WmwINZ7Ly1EvKtMKm4KJiEX
         XoA25nx6QW2r+ywwl/npG9RUajYlPNAjrDNMKYNfWaUqiVhFzIe/kE9oD1orkNiYRZfr
         gBSA==
X-Forwarded-Encrypted: i=1; AJvYcCV9OAeryjKPip/tOaByhtww3l6yaJvRvDn0m7a7L7dzfvGAX4CAEaOmqOCEo9g92KR2RKU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzEodqF0gHR85m1fCGcu6CKLMwCrbppuMr4zXpWq4p+wkSB3enF
	QWB6heH/GPAc6CTH9MBVVCl0LVsxcbI4ALTZuImmj+nn/K8WzD0tQNE/CoX/TLucTkM=
X-Gm-Gg: ASbGnctQwSv0HMuMqTBaJYm4766EPyzvKd+7HMopsJSrjBTKeSgCGAO9X0IziQRmsev
	bycFS3E/rwZDf4xn5BqeDhrk4i2DR8kQBOOFfyp7V5rfxnDdPwCPZiP1muG0oA4Su2oVTDNOOoa
	U5P/5pn+GZpm9p4SIyyob85LiyUc91plooQ0nqPYlNyLCPgBpAyzobJNnKE4+Y3OslpzYTQ6w9s
	CfrbPCB5/cMxNejUjFo96+r+HHJdKL6gARqumpxDGWCbxydU7EeNSAvQqyYwQ3qwDhUxxxC+yxk
	09M6NZbt8yjwTWFSD4N3EuTbx86erSnH0mCjz2Zinhtj3fG8VPxSWbIMoYkT
X-Google-Smtp-Source: AGHT+IHkwaJ6gHJgvWiPzVxDv2dV6i3HHkhWCA1c5/mCAe/0o4MB5fUJzCgJeRD5hGESr2V3uBRYRg==
X-Received: by 2002:a05:600c:4ed2:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-442fd67504emr191953925e9.28.1747925560426;
        Thu, 22 May 2025 07:52:40 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:39 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:30 +0100
Subject: [PATCH v2 01/14] spi: spi-fsl-dspi: restrict register range for
 regmap access
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-1-bea884630cfb@linaro.org>
References: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
In-Reply-To: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chao Fu <B44548@freescale.com>, 
 Xiubo Li <Li.Xiubo@freescale.com>, Lukasz Majewski <lukma@denx.de>, 
 linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Larisa Grigore <larisa.grigore@nxp.com>, 
 Xulin Sun <xulin.sun@windriver.com>, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

From: Larisa Grigore <larisa.grigore@nxp.com>

DSPI registers are NOT continuous, some registers are reserved and
accessing them from userspace will trigger external abort, add regmap
register access table to avoid below abort.

  For example on S32G:

  # cat /sys/kernel/debug/regmap/401d8000.spi/registers

  Internal error: synchronous external abort: 96000210 1 PREEMPT SMP
  ...
  Call trace:
  regmap_mmio_read32le+0x24/0x48
  regmap_mmio_read+0x48/0x70
  _regmap_bus_reg_read+0x38/0x48
  _regmap_read+0x68/0x1b0
  regmap_read+0x50/0x78
  regmap_read_debugfs+0x120/0x338

Fixes: 1acbdeb92c87 ("spi/fsl-dspi: Convert to use regmap and add big-endian support")
Co-developed-by: Xulin Sun <xulin.sun@windriver.com>
Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 067c954cb6ea..effb460d436d 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 //
 // Copyright 2013 Freescale Semiconductor, Inc.
-// Copyright 2020 NXP
+// Copyright 2020-2025 NXP
 //
 // Freescale DSPI driver
 // This file contains a driver for the Freescale DSPI
@@ -1167,6 +1167,20 @@ static int dspi_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(dspi_pm, dspi_suspend, dspi_resume);
 
+static const struct regmap_range dspi_yes_ranges[] = {
+	regmap_reg_range(SPI_MCR, SPI_MCR),
+	regmap_reg_range(SPI_TCR, SPI_CTAR(3)),
+	regmap_reg_range(SPI_SR, SPI_TXFR3),
+	regmap_reg_range(SPI_RXFR0, SPI_RXFR3),
+	regmap_reg_range(SPI_CTARE(0), SPI_CTARE(3)),
+	regmap_reg_range(SPI_SREX, SPI_SREX),
+};
+
+static const struct regmap_access_table dspi_access_table = {
+	.yes_ranges	= dspi_yes_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(dspi_yes_ranges),
+};
+
 static const struct regmap_range dspi_volatile_ranges[] = {
 	regmap_reg_range(SPI_MCR, SPI_TCR),
 	regmap_reg_range(SPI_SR, SPI_SR),
@@ -1184,6 +1198,8 @@ static const struct regmap_config dspi_regmap_config = {
 	.reg_stride	= 4,
 	.max_register	= 0x88,
 	.volatile_table	= &dspi_volatile_table,
+	.rd_table	= &dspi_access_table,
+	.wr_table	= &dspi_access_table,
 };
 
 static const struct regmap_range dspi_xspi_volatile_ranges[] = {
@@ -1205,6 +1221,8 @@ static const struct regmap_config dspi_xspi_regmap_config[] = {
 		.reg_stride	= 4,
 		.max_register	= 0x13c,
 		.volatile_table	= &dspi_xspi_volatile_table,
+		.rd_table	= &dspi_access_table,
+		.wr_table	= &dspi_access_table,
 	},
 	{
 		.name		= "pushr",

-- 
2.34.1

