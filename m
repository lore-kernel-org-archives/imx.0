Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10119204946
	for <imx@lists.linux.dev>; Tue, 29 Oct 2024 10:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730197368; cv=none; b=uc+e4T7Gd5a7MWNQs6sIyPG+eldkoaAqyiYXUbMOGvK6RAG5UuDjseLLPE/1YeXE1t3AIK1EvD6R21I/DUaz1fI9UwLcjY712eBn8sUPFnYT0ynfKwJ10+VJ1H9KYJi6RrPxVZ8jsnaynlzA8H11peRYsvjZMnCwqrc3W0QiHpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730197368; c=relaxed/simple;
	bh=LZjSpjIkQ/UIhxxD/94ZpTpj5VLNNB8ZWHzr8wWRiEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EYclt1NEBJ0x7z5OCwbVOrh2uzlHYjhCyiQ/B0u55xBRY848WzpdE0QofSANHlWQckWtJ2Miobme0BKRjsmW++DW/uUfWyN8r1W/6aOYOhWgW5l25aX0NiSal0Z709ZqYMpVlrWStUSl5VNrrMJBQTi1SZvYp2Wh+fgEMYaPLRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v/brMSi0; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v/brMSi0"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb51f39394so52023381fa.2
        for <imx@lists.linux.dev>; Tue, 29 Oct 2024 03:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730197364; x=1730802164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gevxWDiw1Joa8obRCekHXlX/q8pa3Bd8D6cgQBHwmVE=;
        b=v/brMSi0MjAas/cloPTD09PtXatFkb0hNhk8Yq8nTdLbIbviKyHzLZsTA5ohwHQ2Gu
         ie4F+S7ELoC/czOodRBY4eBOcJQ1xOEIrGDlfEgme+0+dD3W0D1DyhalH0fWKIqCQKn6
         s/I6rM96LN5G1nOHCaAG5h9gJNNJCc3Pt5YrprpgotWZbUNmEtydWFPAeYs6wlzUolUZ
         GafcYINUCrybfCsLmvsEKk/BU/D7tiLnzh0W/ICggQfeb07thvXDqLShtQc480lPmdDC
         HJed23g47f28rbHKsxFNGEuFw0jFCDQ3u6+Q+Z/XwyI+rxFN8fos4S9SQhP8AKTwHi0u
         0KZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730197364; x=1730802164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gevxWDiw1Joa8obRCekHXlX/q8pa3Bd8D6cgQBHwmVE=;
        b=VzeQVsd5LbXNQ4fyXJR2TyxJ6u4q9zxwg6rIbqV+Of0QVC2+cpgyVJP/eRaYOQhC0D
         tQiJClbG6PIq92q0yKPVM+BI7HpjCnah4ayzrWjScHF26Yvdp+uPqwqVCXzC80UxKqVa
         yr2DJwtyzEpZQ4h96AGx06j+qkCpytqaR1/lOp6/X2wc5zGGYpD1N5b//7+p/QAYEM1S
         BjFuDUWdivE08dQkWPriDN11srC794eVqz0h03vldvM7c/q6bZXPhwfcaLW/B3BBA2Yj
         A3FGQQDxVWl4ZfzM6l+K0vs8DJS/tP0rtIoiqj+gshfexrw1bamzC0EOWDT8IFbT/69q
         UKxg==
X-Forwarded-Encrypted: i=1; AJvYcCWUD+BflH6pCVYXVqOkSj0ULJNHIStcJYD3q7RetFUBQcruvsqYkXjRo6FSKamApB4AS1U=@lists.linux.dev
X-Gm-Message-State: AOJu0YzsPEzDbtYaRUBRe5lXB+INxQOeyMxe3tQChr0rh8JREQHiPnbN
	mYBy6FgfxlABMkU24KS2YppLMKITTwC06P4Ufe0zp00SlZLwKdZszcKo64N0Pkk=
X-Google-Smtp-Source: AGHT+IFpXeHjBYJ4bh6c/28VpHHP35QvCnNGUuPqWzvC/md0zxhyDDRH72iKNBCLUTiNRx10pm7VKw==
X-Received: by 2002:a05:651c:551:b0:2fa:e658:27a1 with SMTP id 38308e7fff4ca-2fcbdf68ff0mr50076231fa.5.1730197363921;
        Tue, 29 Oct 2024 03:22:43 -0700 (PDT)
Received: from tudordana.roam.corp.google.com ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b47a86sm12084498f8f.53.2024.10.29.03.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:22:43 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peng.fan@oss.nxp.com,
	m.felsch@pengutronix.de
Cc: pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [RESEND PATCH v4 2/2] mtd: spi-nor: support vcc-supply regulator
Date: Tue, 29 Oct 2024 10:22:38 +0000
Message-ID: <20241029102238.44673-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241029102238.44673-1-tudor.ambarus@linaro.org>
References: <20241029102238.44673-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peng Fan <peng.fan@nxp.com>

SPI NOR flashes needs power supply to work properly. The power supply
maybe software controllable per board design. So add the support
for an vcc-supply regulator.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
[ta: move devm_regulator_get_enable() to spi_nor_probe(). Add local dev
variable to avoid dereferences.]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v4:
- move devm_regulator_get_enable() to spi_nor_probe().
- add local dev variable to avoid dereferences.

 drivers/mtd/spi-nor/core.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index b6f374ded390..29441f2bab5d 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -17,6 +17,7 @@
 #include <linux/mtd/spi-nor.h>
 #include <linux/mutex.h>
 #include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
 #include <linux/sched/task_stack.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
@@ -3576,7 +3577,8 @@ static int spi_nor_create_write_dirmap(struct spi_nor *nor)
 static int spi_nor_probe(struct spi_mem *spimem)
 {
 	struct spi_device *spi = spimem->spi;
-	struct flash_platform_data *data = dev_get_platdata(&spi->dev);
+	struct device *dev = &spi->dev;
+	struct flash_platform_data *data = dev_get_platdata(dev);
 	struct spi_nor *nor;
 	/*
 	 * Enable all caps by default. The core will mask them after
@@ -3586,12 +3588,16 @@ static int spi_nor_probe(struct spi_mem *spimem)
 	char *flash_name;
 	int ret;
 
-	nor = devm_kzalloc(&spi->dev, sizeof(*nor), GFP_KERNEL);
+	ret = devm_regulator_get_enable(dev, "vcc");
+	if (ret)
+		return ret;
+
+	nor = devm_kzalloc(dev, sizeof(*nor), GFP_KERNEL);
 	if (!nor)
 		return -ENOMEM;
 
 	nor->spimem = spimem;
-	nor->dev = &spi->dev;
+	nor->dev = dev;
 	spi_nor_set_flash_node(nor, spi->dev.of_node);
 
 	spi_mem_set_drvdata(spimem, nor);
-- 
2.47.0.163.g1226f6d8fa-goog

