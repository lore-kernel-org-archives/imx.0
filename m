Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C8328DF2C
	for <imx@lists.linux.dev>; Thu, 22 May 2025 14:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925573; cv=none; b=Bgat2xPsoPeW1ntt9jCADWquK305YBB0GAf1NPBUMwvcXAvUpCfrxwjFK5hTxKXY6vmHqFLYMM1p7jFNyaCEqpi0QhvunFTJ9JKdm3eaJ8BJxf2JqGUmgJCqvroYJr4pEQRwhwJo7Nqc9X3mSWqevXuq2fWDCG9F7CGK55H6/Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925573; c=relaxed/simple;
	bh=1jgVYXcuSQUYEU1dVAp9lFPNyoIv4PIWXjFIMl5Vkvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AIbzlD5TwgnDNvP6fu3auDb/RV/hXltMJEw73sS1JoNf96hRyv5VLCjirhx4M6tObI+H8FwnE3SBkDph1K9gSgZ1bi7bngAEspP/CVlp2MCJxz4qTkxS+34GdzifLc3z1+04/IlT5qxu+ENzWNR19wRPHOjd7wNhbgF/1McT8UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IHgNeY92; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IHgNeY92"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-44b1f5b917fso1396305e9.3
        for <imx@lists.linux.dev>; Thu, 22 May 2025 07:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925569; x=1748530369; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0z6hcyVZAe0X+PJjkOMiFN3VGBYDX0qmANiIo/JWNSc=;
        b=IHgNeY92lxxrVY0m0g5BLox/4CC0iBSecs0wS+LoCHC0QUvmzC70d2NWTajnPmcvDg
         8gnVWgic6zFaEnYMxvnhfGEc0pvm0SzGZIcy2Aci2c9UryFmP+mjAaNmJ2IQM/rjJwiJ
         sQiZOtLMS44QUruw9j/XgoKNxekgZw7E83Z9qfdtPcT9fBwpzb0/hDSGfcax5bFy+Z2i
         9WZ2Kbq1sMRPm1twhQfK8yM7Kr+6PwyeCSJxTMCZ3PBM12beQ7tDzYlQS8BaDYZmMXDT
         2qRxmQnNz7NKumib6BGogJ7eXL0OjIKfDT58kp1qJ8Zsd+SqGYmZE8dMbVroesspexvC
         6vwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925569; x=1748530369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0z6hcyVZAe0X+PJjkOMiFN3VGBYDX0qmANiIo/JWNSc=;
        b=CO26GZGOSsJ2spjW4ZluSnubxFvOEWObfrvMMTvOkuYvzsD3/9GPIC+VtgqOyT3ws9
         NshYnWIcVsJ9lJITP7jqjJ5gaFU3nivBbhbmO5KWp8ziKH4/j4SB/rsqSB78Xm5YOLWL
         1JOve27V1OrVeM+SXV1RC1dZUEGGeXs7BZC91hLY2AeYogS43kjUXuisxlMdV5RDIlMp
         lonJgfbILED7anBmcI/rfKYeJRLI+8CH86WSsBH62oRWGkEr9LQpU1Lz0mWbXJgkLAY0
         RlF0jpdUTla0ogK6ONnp6q6RnutBhwCdMJmmKWMuK0PuzLLnGe7TzyifxRsnRIbxdwVs
         2jUg==
X-Forwarded-Encrypted: i=1; AJvYcCUobCaxIn/gU7rOBN5EC7Ffx2uHyIEqxRd3F148wVXQ2mo2KnLP2MTE8F473FUzeNnoAhY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUonVwlIhY3tWJ92P43aDaxe4vVlfOQPjuraX8AJBH6YfetxPq
	NG9quP0OgCwIMXoSfSmtOLRc2/q2MpCKzcU+2/SYNWrp0gcDGlhW+gqzwoIkdF4Pmb4=
X-Gm-Gg: ASbGncvEEcEiL11pEfWTqrfULnEu4onyTIShqf6gSoSyZ4eTk1hDijASA+/k3VQf/yE
	5AL3b1TR2uKAL6WvFtZy6uS7zoSzGIEHWGdoFQ4phC7IsBPVoNaKg7RlZVm+yQRPWzI9+1SacHY
	qAIlSfkrxjDtlAi/zTMf3d+em6Ko5gsMLJId46Cccz+Vp4y6GKVzHeSYSZU8roi7xIRiyR9x8og
	G4uvxyxDTyED3NNtBOs0oOs8+4RpU5IywOC/3YSVDrqJy3T1fjSRcHlO3IZpopW2wFioW9JiL2t
	5gcqV3u9MficuBI5c33OfbYMponeKkhglO547vHyeYyr+x3xWQeRdtQO+nV+9Tv9CkSW+Wo=
X-Google-Smtp-Source: AGHT+IHLLDacG6DJNXNgMnaF7nWhkFGvXH5XjtvmKDssa24rTSeprfh0E2gKpdqYxF8Xn+tcyTPTow==
X-Received: by 2002:a05:600c:c0d2:20b0:43c:f597:d589 with SMTP id 5b1f17b1804b1-442fda2e7d3mr147957455e9.27.1747925569155;
        Thu, 22 May 2025 07:52:49 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:48 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:35 +0100
Subject: [PATCH v2 06/14] spi: spi-fsl-dspi: Add config and regmaps for
 S32G platforms
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-6-bea884630cfb@linaro.org>
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
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

From: Larisa Grigore <larisa.grigore@nxp.com>

S32G adds SPI_{T,R}XFR4 and extends SPI_CTAR registers to 5. Add the
new regmaps, configs and bits.

dspi_volatile_ranges gets SPI_{T,R}XFR4 added which affects all
platforms, however they are further limited by dspi_yes_ranges.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 39 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 437a8db9fa2b..10e511ba1cd8 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -35,7 +35,7 @@
 #define SPI_TCR				0x08
 #define SPI_TCR_GET_TCNT(x)		(((x) & GENMASK(31, 16)) >> 16)
 
-#define SPI_CTAR(x)			(0x0c + (((x) & GENMASK(1, 0)) * 4))
+#define SPI_CTAR(x)			(0x0c + (((x) & GENMASK(2, 0)) * 4))
 #define SPI_CTAR_FMSZ(x)		(((x) << 27) & GENMASK(30, 27))
 #define SPI_CTAR_CPOL			BIT(26)
 #define SPI_CTAR_CPHA			BIT(25)
@@ -93,12 +93,14 @@
 #define SPI_TXFR1			0x40
 #define SPI_TXFR2			0x44
 #define SPI_TXFR3			0x48
+#define SPI_TXFR4			0x4C
 #define SPI_RXFR0			0x7c
 #define SPI_RXFR1			0x80
 #define SPI_RXFR2			0x84
 #define SPI_RXFR3			0x88
+#define SPI_RXFR4			0x8C
 
-#define SPI_CTARE(x)			(0x11c + (((x) & GENMASK(1, 0)) * 4))
+#define SPI_CTARE(x)			(0x11c + (((x) & GENMASK(2, 0)) * 4))
 #define SPI_CTARE_FMSZE(x)		(((x) & 0x1) << 16)
 #define SPI_CTARE_DTCP(x)		((x) & 0x7ff)
 
@@ -136,6 +138,7 @@ enum {
 	LX2160A,
 	MCF5441X,
 	VF610,
+	S32G,
 };
 
 static const struct regmap_range dspi_yes_ranges[] = {
@@ -147,15 +150,29 @@ static const struct regmap_range dspi_yes_ranges[] = {
 	regmap_reg_range(SPI_SREX, SPI_SREX),
 };
 
+static const struct regmap_range s32g_dspi_yes_ranges[] = {
+	regmap_reg_range(SPI_MCR, SPI_MCR),
+	regmap_reg_range(SPI_TCR, SPI_CTAR(5)),
+	regmap_reg_range(SPI_SR, SPI_TXFR4),
+	regmap_reg_range(SPI_RXFR0, SPI_RXFR4),
+	regmap_reg_range(SPI_CTARE(0), SPI_CTARE(5)),
+	regmap_reg_range(SPI_SREX, SPI_SREX),
+};
+
 static const struct regmap_access_table dspi_access_table = {
 	.yes_ranges	= dspi_yes_ranges,
 	.n_yes_ranges	= ARRAY_SIZE(dspi_yes_ranges),
 };
 
+static const struct regmap_access_table s32g_dspi_access_table = {
+	.yes_ranges	= s32g_dspi_yes_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(s32g_dspi_yes_ranges),
+};
+
 static const struct regmap_range dspi_volatile_ranges[] = {
 	regmap_reg_range(SPI_MCR, SPI_TCR),
 	regmap_reg_range(SPI_SR, SPI_SR),
-	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
+	regmap_reg_range(SPI_PUSHR, SPI_RXFR4),
 	regmap_reg_range(SPI_SREX, SPI_SREX),
 };
 
@@ -167,6 +184,7 @@ static const struct regmap_access_table dspi_volatile_table = {
 enum {
 	DSPI_REGMAP,
 	DSPI_XSPI_REGMAP,
+	S32G_DSPI_XSPI_REGMAP,
 	DSPI_PUSHR,
 };
 
@@ -189,6 +207,15 @@ static const struct regmap_config dspi_regmap_config[] = {
 		.rd_table	= &dspi_access_table,
 		.wr_table	= &dspi_access_table,
 	},
+	[S32G_DSPI_XSPI_REGMAP] = {
+		.reg_bits	= 32,
+		.val_bits	= 32,
+		.reg_stride	= 4,
+		.max_register	= SPI_SREX,
+		.volatile_table	= &dspi_volatile_table,
+		.wr_table	= &s32g_dspi_access_table,
+		.rd_table	= &s32g_dspi_access_table,
+	},
 	[DSPI_PUSHR] = {
 		.name		= "pushr",
 		.reg_bits	= 16,
@@ -263,6 +290,12 @@ static const struct fsl_dspi_devtype_data devtype_data[] = {
 		.fifo_size		= 16,
 		.regmap			= &dspi_regmap_config[DSPI_REGMAP],
 	},
+	[S32G] = {
+		.trans_mode	  = DSPI_XSPI_MODE,
+		.max_clock_factor = 1,
+		.fifo_size	  = 5,
+		.regmap		  = &dspi_regmap_config[S32G_DSPI_XSPI_REGMAP],
+	},
 };
 
 struct fsl_dspi_dma {

-- 
2.34.1

