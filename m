Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C041B28F524
	for <imx@lists.linux.dev>; Fri,  9 May 2025 11:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788819; cv=none; b=CzW1enAm7lWYk0gaBzJA1uZ6gdaN/ePo/f/5E5jwA/N3dEavvZBmozvrPOnX8mnQJv71XB8CPUzd4sGnCH34/tjGE7ce14ohyD4QTJzUO6ZIOPr65Lp6ekhEDtJLw9Jvvuz14zAq8ce65T8wVSRWCBI7ToCBsgsySdd59mPwJxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788819; c=relaxed/simple;
	bh=2Me3n9aaBCtjK+qaTkwH9V1pF/7QGlCrjR9j27nmWwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HKJ6IuY4Jfe6RC2GFc43TTvH5vIE/yMfRB4Uafa5mJ83JC8VJG098cYpsOFDlQGHiViyBuk7xOIbX0ErWDAH3CT2/bwXYYfM1ZZJ5+JEVRimA60951NN+HJo5bpi1wt059mr07qC+RRmMxwSBIo3xFso+X89u1ElsGw+BxoSl60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WJgCmMf6; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WJgCmMf6"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a1d8c0966fso847195f8f.1
        for <imx@lists.linux.dev>; Fri, 09 May 2025 04:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788816; x=1747393616; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SUoeaJOnz98LhxzrB2OQnuTIO89rQsZt/lwrASJetuQ=;
        b=WJgCmMf6yaoPgNP3on/VclZbOTG6X7G0LTvIOfEtoKUj4Xp7W1saKUpOC60XwtQHRU
         MlJnqj0HP5gsIwG84XnFYK/Iy+34g5NOrMUWI5jrRKt4Ru+u/PZu6tqRSvS2dZXf2J/6
         kJKlSi9PjHjYtUjXNYAN02+rlqxT5WsdIJ2nf54sbEog6NkjJxpB/VTEWqKqoyharlfU
         ejq/N+ndGMi/6XkyNPP7WGhyjyxPCuGTC9HfXHz+H1nMOTziPS5E1nqwm8PzyVLKpL/D
         LVUl+g+iFbr4jpIgGV9dM3z1HDkSYyhTTLtjeaYahvZPNkFjsav/EGp7KJEbSKF0xNbC
         TI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788816; x=1747393616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUoeaJOnz98LhxzrB2OQnuTIO89rQsZt/lwrASJetuQ=;
        b=sWkv9UXdBijmhcgr7RBUNWaOyag/DdteQo0bmnPnn1Be94M4XkeLKSs4x+8ghrmm5p
         h+HBOxLhd73V8pXbxTeS06W5Jtqoe2pANc+/zjolV/VoXOyEmmeb8Gd0C1aHMFyH9RAs
         zpO96IJ33q19CYAxnEC7ZqGBnV1oeXfc3ERGRzsnCOhniUBvPAo8PqweCl1OUfT2koBl
         u7R6CbERniyHtyPnZPRDQiRx+sOBbyzZs+tRW1li1/Tw/hWYwN8cvHHOSc8ZKIfCWsrs
         P79xdU5rY936c8MW9+jWqX23Bm4Qxo311UGq9gJ2E3Ku9wB0gAK/4hxJRGqDjeegEgze
         J8jw==
X-Forwarded-Encrypted: i=1; AJvYcCVU0QZDrmVRqvQcuXuCHcJ3hSC8IMed6tPgoZDcVmgVjDqT0jsCEiIqhnjHEsz3AggeG8Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzdVWldceNvqA14ZpFU4t+YTmekaJZ4B+s77eWyRPRWKPbctM/
	XxQufRcabfPGMAzObyh15XqAVg1/LXVTvJkEQu/iV//1l0BviqpV5wLQ00dQw58=
X-Gm-Gg: ASbGnctlvLgZazUxXu/gqZoJz5W8ZaNyjzeS1NUGd/jNWcjbmP4po5M1kRsU5RKGACj
	bWAFknWwv09Y7sE11neU4VgDxAL0Xo0HVqR97I5RNzwHemy5s/SBLhbB2GP3IlkvBTRsPpMz2hI
	46bQg1a4lJb3EnB2ngtNEPef1WUy+0UIyImSDTBAPMZrPrtaAldSmdVXX3ob4qOnvaiQGEYVZuF
	yNnwJt0b4rvtAFyIhzZybsIbHrvRPnhljUSD6BZJtCH/MeqIyBBwzhLNeb6spCPH0qsA0MhIzL6
	qYx70dir7nRZQWiduPkw4MP678+3w9unZrUDqUwyWB2aFfI=
X-Google-Smtp-Source: AGHT+IFJQRyVMr2U93vokfpSUulnWLDfNfE0bAch8J9y68HcjUDSO608e30Saz1ZNqv66Dvdty+TYw==
X-Received: by 2002:a05:6000:2ab:b0:39f:c05:c220 with SMTP id ffacd0b85a97d-3a0b9941e27mr6449970f8f.22.1746788815916;
        Fri, 09 May 2025 04:06:55 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:06:55 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:05:48 +0100
Subject: [PATCH 01/14] spi: spi-fsl-dspi: Define regmaps per device
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-1-32bfcd2fea11@linaro.org>
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

Refactor the regmaps so they can be defined per device rather than
programmatically. This will allow us to add two new regmaps for S32G in
a later commit.

No functional changes.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 121 ++++++++++++++++++++++++---------------------
 1 file changed, 66 insertions(+), 55 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 067c954cb6ea..31ea8ce81e98 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -121,6 +121,7 @@ struct fsl_dspi_devtype_data {
 	enum dspi_trans_mode	trans_mode;
 	u8			max_clock_factor;
 	int			fifo_size;
+	const struct regmap_config *regmap;
 };
 
 enum {
@@ -136,60 +137,123 @@ enum {
 	VF610,
 };
 
+static const struct regmap_range dspi_volatile_ranges[] = {
+	regmap_reg_range(SPI_MCR, SPI_TCR),
+	regmap_reg_range(SPI_SR, SPI_SR),
+	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
+};
+
+static const struct regmap_access_table dspi_volatile_table = {
+	.yes_ranges	= dspi_volatile_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(dspi_volatile_ranges),
+};
+
+static const struct regmap_range dspi_xspi_volatile_ranges[] = {
+	regmap_reg_range(SPI_MCR, SPI_TCR),
+	regmap_reg_range(SPI_SR, SPI_SR),
+	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
+	regmap_reg_range(SPI_SREX, SPI_SREX),
+};
+
+static const struct regmap_access_table dspi_xspi_volatile_table = {
+	.yes_ranges	= dspi_xspi_volatile_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(dspi_xspi_volatile_ranges),
+};
+
+enum {
+	DSPI_REGMAP,
+	DSPI_XSPI_REGMAP,
+	DSPI_PUSHR
+};
+
+static const struct regmap_config dspi_regmap_config[] = {
+	[DSPI_REGMAP] = {
+		.reg_bits	= 32,
+		.val_bits	= 32,
+		.reg_stride	= 4,
+		.max_register	= 0x88,
+		.volatile_table	= &dspi_volatile_table
+	},
+	[DSPI_XSPI_REGMAP] = {
+		.reg_bits	= 32,
+		.val_bits	= 32,
+		.reg_stride	= 4,
+		.max_register	= 0x13c,
+		.volatile_table	= &dspi_xspi_volatile_table
+	},
+	[DSPI_PUSHR] = {
+		.name		= "pushr",
+		.reg_bits	= 16,
+		.val_bits	= 16,
+		.reg_stride	= 2,
+		.max_register	= 0x2
+	}
+};
+
 static const struct fsl_dspi_devtype_data devtype_data[] = {
 	[VF610] = {
 		.trans_mode		= DSPI_DMA_MODE,
 		.max_clock_factor	= 2,
 		.fifo_size		= 4,
+		.regmap			= &dspi_regmap_config[DSPI_REGMAP]
 	},
 	[LS1021A] = {
 		/* Has A-011218 DMA erratum */
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 4,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
 	},
 	[LS1012A] = {
 		/* Has A-011218 DMA erratum */
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 16,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
 	},
 	[LS1028A] = {
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 4,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
 	},
 	[LS1043A] = {
 		/* Has A-011218 DMA erratum */
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 16,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
 	},
 	[LS1046A] = {
 		/* Has A-011218 DMA erratum */
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 16,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
 	},
 	[LS2080A] = {
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 4,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
 	},
 	[LS2085A] = {
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 4,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
 	},
 	[LX2160A] = {
 		.trans_mode		= DSPI_XSPI_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 4,
+		.regmap			= &dspi_regmap_config[DSPI_XSPI_REGMAP]
 	},
 	[MCF5441X] = {
 		.trans_mode		= DSPI_DMA_MODE,
 		.max_clock_factor	= 8,
 		.fifo_size		= 16,
+		.regmap			= &dspi_regmap_config[DSPI_REGMAP]
 	},
 };
 
@@ -1167,54 +1231,6 @@ static int dspi_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(dspi_pm, dspi_suspend, dspi_resume);
 
-static const struct regmap_range dspi_volatile_ranges[] = {
-	regmap_reg_range(SPI_MCR, SPI_TCR),
-	regmap_reg_range(SPI_SR, SPI_SR),
-	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
-};
-
-static const struct regmap_access_table dspi_volatile_table = {
-	.yes_ranges	= dspi_volatile_ranges,
-	.n_yes_ranges	= ARRAY_SIZE(dspi_volatile_ranges),
-};
-
-static const struct regmap_config dspi_regmap_config = {
-	.reg_bits	= 32,
-	.val_bits	= 32,
-	.reg_stride	= 4,
-	.max_register	= 0x88,
-	.volatile_table	= &dspi_volatile_table,
-};
-
-static const struct regmap_range dspi_xspi_volatile_ranges[] = {
-	regmap_reg_range(SPI_MCR, SPI_TCR),
-	regmap_reg_range(SPI_SR, SPI_SR),
-	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
-	regmap_reg_range(SPI_SREX, SPI_SREX),
-};
-
-static const struct regmap_access_table dspi_xspi_volatile_table = {
-	.yes_ranges	= dspi_xspi_volatile_ranges,
-	.n_yes_ranges	= ARRAY_SIZE(dspi_xspi_volatile_ranges),
-};
-
-static const struct regmap_config dspi_xspi_regmap_config[] = {
-	{
-		.reg_bits	= 32,
-		.val_bits	= 32,
-		.reg_stride	= 4,
-		.max_register	= 0x13c,
-		.volatile_table	= &dspi_xspi_volatile_table,
-	},
-	{
-		.name		= "pushr",
-		.reg_bits	= 16,
-		.val_bits	= 16,
-		.reg_stride	= 2,
-		.max_register	= 0x2,
-	},
-};
-
 static int dspi_init(struct fsl_dspi *dspi)
 {
 	unsigned int mcr;
@@ -1272,7 +1288,6 @@ static int dspi_target_abort(struct spi_controller *host)
 static int dspi_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	const struct regmap_config *regmap_config;
 	struct fsl_dspi_platform_data *pdata;
 	struct spi_controller *ctlr;
 	int ret, cs_num, bus_num = -1;
@@ -1355,11 +1370,7 @@ static int dspi_probe(struct platform_device *pdev)
 		goto out_ctlr_put;
 	}
 
-	if (dspi->devtype_data->trans_mode == DSPI_XSPI_MODE)
-		regmap_config = &dspi_xspi_regmap_config[0];
-	else
-		regmap_config = &dspi_regmap_config;
-	dspi->regmap = devm_regmap_init_mmio(&pdev->dev, base, regmap_config);
+	dspi->regmap = devm_regmap_init_mmio(&pdev->dev, base, dspi->devtype_data->regmap);
 	if (IS_ERR(dspi->regmap)) {
 		dev_err(&pdev->dev, "failed to init regmap: %ld\n",
 				PTR_ERR(dspi->regmap));
@@ -1370,7 +1381,7 @@ static int dspi_probe(struct platform_device *pdev)
 	if (dspi->devtype_data->trans_mode == DSPI_XSPI_MODE) {
 		dspi->regmap_pushr = devm_regmap_init_mmio(
 			&pdev->dev, base + SPI_PUSHR,
-			&dspi_xspi_regmap_config[1]);
+			&dspi_regmap_config[DSPI_PUSHR]);
 		if (IS_ERR(dspi->regmap_pushr)) {
 			dev_err(&pdev->dev,
 				"failed to init pushr regmap: %ld\n",

-- 
2.34.1

