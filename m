Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AE4291157
	for <imx@lists.linux.dev>; Fri,  9 May 2025 11:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788831; cv=none; b=m58oJWCx5CdV90NVwVyBIVqorOXotByr/tTGUnjikk0zDciXihVfzfpCgOJ5i6mpCSZPjLoMlhkPopYtjcjKifKfPJtYO8gOs7KO+K7hU8FsyknVm4pd7J2ihCvoa8co4gmDtqyaxV9HXpHuQUEH9eGph4BinGlqhZPVhesZexc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788831; c=relaxed/simple;
	bh=S/bLVRCZo0bzcqIxKXf/hzh5QW5OR0CMl07vRP4K15U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L4bq2vece91K+obNO3oSccAJUmLB3kJ4H14QuBlj7w4f3jTVL36LY+KnsBoyYD2Ws7N6m5E4XLx46td+qzVnLiJLCkry1veSKQT9o7riCyyoVj03lsUoy4fUfxCVBoO+n+wceOxRlYXNnA6V9Q2BW89aRIjBvLJVzKJNg88Jzuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I7pY1mDK; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I7pY1mDK"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a0b9af89f2so1154852f8f.3
        for <imx@lists.linux.dev>; Fri, 09 May 2025 04:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788827; x=1747393627; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEyehrM+Fx4o61r/yR0u4BgsTY9lmtx/SKx/NBJ8aCc=;
        b=I7pY1mDKp/kLPCjkBkGr5PMY4Vm7bL+4ztaX5JnjaBhlp0qEgYBX2YmyZZMzbm1t0p
         fpd3R/0aXwf0Pdg6V/JEWCAng+PHrnCrtPqBIZNOYDTO154054ZtnJes/G7qOGChUpMI
         GPFsekAJUYOlvqk4hH7eds+3XCH53Ix+dL1MPlIVnel92snXc5k06ocG0tl4euvKekyT
         6ayV2NhcDuiDOr6Kn8G52d66NQVCcX23vNFsr/DpO6qEElUg2X2obJnbNXy8fVWM39cf
         SxbCNga/py0MRE63dMPjN20Civ68/52QQv2MgJV41LX2QFd3yJWJIW/EHpRzZko32wew
         Xoaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788827; x=1747393627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEyehrM+Fx4o61r/yR0u4BgsTY9lmtx/SKx/NBJ8aCc=;
        b=T2HtmkND4iGdvVoLCC/4aoTWV2HEwit6knq3vnryav/ttSobLyDiIr2qLKEitN14+o
         4ZOEpc65dyr6S2TRmX+ON+xU+zWSpivVVnsCVIHS6PlhNzd3J9kY1CyNnfUzrW8BU/1s
         Lisqncwhj1bkUAGB9REDHc5wmOKdR24v463ze9Uk/zTDyBGfB0SyvkiBmMamWkiswxtK
         TxAsT02SrJqwz4csqqyj7etE4zjQJ5hbA/7bpGsSNIYGKkwrPaZ40GWTBJYk4R5MfNWQ
         BXW6YCbTNG9yWoy7wAokaM2tX2MMNpqkcZ6ewJH0vTB1awk0Xzmq/QHS83h+raJXd1q/
         D7Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWC5vw11NdoCDmEZ1nFeaCnVg81bK0s9DAWUHaa3Ceexxq3g2L9L6+U+1RtESrOolIgvHU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy93BrQkg35KgjsyAIooqRbIIN1sTj769PDAb+K783KB4DWxCp+
	l46wQRd6c7f54NE11im15eVHeiRvxltiywoaKEqgTtqSer51F0J5H4mfQiZRAfY=
X-Gm-Gg: ASbGncsXl3Af6eJvCxqY0UdGJd6RaNCpfUpXG+GIqjMLYnyEu6+hHdBBhhKci7fNxbO
	xLeZwr3jOArSGBR5x1gwAu7s/zoppGOxgSSte3Z9w4W8mU5Iq/15y2GNmDuSGRn8oKB+i+9tr2w
	kO5U0jtpT3DAKptIsO+TPtiK2Tdr2Dj0kdtQmNh9ypMz9BO5M5v61EIZcjlmp0GtjeBNrZ6H4Iy
	P2AcJdO01wd+EXGOekGhGVTYlfnXmD6Ok7dlp/qFZtWbou2wXhaf2+QdLuP0TZIopdDvzwYDjF0
	gc2ONZ/xX+zG9zPfBiQpVlFWMf3tt/Jlvy32vDfmsc3jD5E=
X-Google-Smtp-Source: AGHT+IEQntKAHHe5FBbl7TvKgw8FWGCOZDWYXdtRsViQGulRTo3e/GMO/aV0MJn1nNmDeMFHI32nUQ==
X-Received: by 2002:a05:6000:2506:b0:3a0:a0e5:d28b with SMTP id ffacd0b85a97d-3a1f6421ecemr2453655f8f.3.1746788827070;
        Fri, 09 May 2025 04:07:07 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:07:06 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:05:56 +0100
Subject: [PATCH 09/14] spi: spi-fsl-dspi: Reinitialize DSPI regs after
 resuming for S32G
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-9-32bfcd2fea11@linaro.org>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
In-Reply-To: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com, arnd@linaro.org, 
 andrei.stefanescu@nxp.com, dan.carpenter@linaro.org
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

From: Larisa Grigore <larisa.grigore@nxp.com>

After resuming, DSPI registers (MCR and SR) need to be reinitialized for
S32G platforms.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 73 +++++++++++++++++++++++++---------------------
 1 file changed, 40 insertions(+), 33 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 50cec3b94322..0613642d769d 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1258,6 +1258,39 @@ static const struct of_device_id fsl_dspi_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, fsl_dspi_dt_ids);
 
+static int dspi_init(struct fsl_dspi *dspi)
+{
+	unsigned int mcr;
+
+	/* Set idle states for all chip select signals to high */
+	mcr = SPI_MCR_PCSIS(GENMASK(dspi->ctlr->max_native_cs - 1, 0));
+
+	if (dspi->devtype_data->trans_mode == DSPI_XSPI_MODE)
+		mcr |= SPI_MCR_XSPI;
+	if (!spi_controller_is_target(dspi->ctlr))
+		mcr |= SPI_MCR_HOST;
+
+	regmap_write(dspi->regmap, SPI_MCR, mcr);
+	regmap_write(dspi->regmap, SPI_SR, SPI_SR_CLEAR);
+
+	switch (dspi->devtype_data->trans_mode) {
+	case DSPI_XSPI_MODE:
+		regmap_write(dspi->regmap, SPI_RSER, SPI_RSER_CMDTCFE);
+		break;
+	case DSPI_DMA_MODE:
+		regmap_write(dspi->regmap, SPI_RSER,
+			     SPI_RSER_TFFFE | SPI_RSER_TFFFD |
+			     SPI_RSER_RFDFE | SPI_RSER_RFDFD);
+		break;
+	default:
+		dev_err(&dspi->pdev->dev, "unsupported trans_mode %u\n",
+			dspi->devtype_data->trans_mode);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int dspi_suspend(struct device *dev)
 {
@@ -1284,6 +1317,13 @@ static int dspi_resume(struct device *dev)
 	if (ret)
 		return ret;
 	spi_controller_resume(dspi->ctlr);
+
+	ret = dspi_init(dspi);
+	if (ret) {
+		dev_err(dev, "failed to initialize dspi during resume\n");
+		return ret;
+	}
+
 	if (dspi->irq)
 		enable_irq(dspi->irq);
 
@@ -1293,39 +1333,6 @@ static int dspi_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(dspi_pm, dspi_suspend, dspi_resume);
 
-static int dspi_init(struct fsl_dspi *dspi)
-{
-	unsigned int mcr;
-
-	/* Set idle states for all chip select signals to high */
-	mcr = SPI_MCR_PCSIS(GENMASK(dspi->ctlr->max_native_cs - 1, 0));
-
-	if (dspi->devtype_data->trans_mode == DSPI_XSPI_MODE)
-		mcr |= SPI_MCR_XSPI;
-	if (!spi_controller_is_target(dspi->ctlr))
-		mcr |= SPI_MCR_HOST;
-
-	regmap_write(dspi->regmap, SPI_MCR, mcr);
-	regmap_write(dspi->regmap, SPI_SR, SPI_SR_CLEAR);
-
-	switch (dspi->devtype_data->trans_mode) {
-	case DSPI_XSPI_MODE:
-		regmap_write(dspi->regmap, SPI_RSER, SPI_RSER_CMDTCFE);
-		break;
-	case DSPI_DMA_MODE:
-		regmap_write(dspi->regmap, SPI_RSER,
-			     SPI_RSER_TFFFE | SPI_RSER_TFFFD |
-			     SPI_RSER_RFDFE | SPI_RSER_RFDFD);
-		break;
-	default:
-		dev_err(&dspi->pdev->dev, "unsupported trans_mode %u\n",
-			dspi->devtype_data->trans_mode);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 static int dspi_target_abort(struct spi_controller *host)
 {
 	struct fsl_dspi *dspi = spi_controller_get_devdata(host);

-- 
2.34.1

