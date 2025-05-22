Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DE328E5F4
	for <imx@lists.linux.dev>; Thu, 22 May 2025 14:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925578; cv=none; b=hDXtGtkDaD8qwuIbKmz3zESJZcPbAgooqSlk+scTRx49/DbQMIjQcHfv95/2p4vMUIjpyXl9Q3dA7TQS5Vw5hwMfnpexVJom29KCHRbBKMYY34ajq10mBiLYyvNryJInu5dL/mE4ozWCDODvNSwzZSwrI5ig9tGIsgjbQOD7Psg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925578; c=relaxed/simple;
	bh=elThI93HwB4PxLZjW2S1nGNED80rFcrhaDTiQgygkCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CKTlYswcLDANRpRRfKA3Cpg2WxvugDlNAvJjnhLeqPDs/vVmwvCfauzDYx4gk4uGapxYx5tDvtSemXLHoSScCAoH2iEcs8n0ahyvmYAQeUAH5E+UPEyhaQi70IK7Ti6aQ3fYxT9yXTjT8N9DjPmTYXWPGvC/3vzxKvYNnTKyK5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kqynkRLB; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kqynkRLB"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so52998425e9.0
        for <imx@lists.linux.dev>; Thu, 22 May 2025 07:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925574; x=1748530374; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQcMbg+mj75exB6fMqaj4+6mofUOuhQ1ONizqDxy1LQ=;
        b=kqynkRLBUq88sAi2Hdb8maSKtbvhpIOp0z5WGdkpTjR2n5Q1B1xlkOsS4uSxfv7+Ps
         5QLYNrbhDLM4Av8dIJue8DIUo/Wt5hOZ6wOX9tsgVZNNqpEq1q3tpNeB9Dq2PKKeOyrY
         zAQpz5sDBOPPTwEWI7I/5xA8l595Dk9hGIxR37GJ4RMdC7scB2ZPABNkXB1N3nemc8hF
         WE8EEtdNzLj6M2JcT8q6GeMyAC0k92PKugNuc5LTkO1HsGCGUYmwte/6TRDZ2DRWdxia
         HU4deLFFH8cUQQDcq6Ve1cgjSPZ/xMradFVH2vUqtbahhZpdZ9DXJj0yhfvVBO8kKwun
         UT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925574; x=1748530374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQcMbg+mj75exB6fMqaj4+6mofUOuhQ1ONizqDxy1LQ=;
        b=rO0h8HQw/Wdzp7c6gLY3VnhKIhx26Fps2Sd2gNGB6R32R6JopHKgIBKOOGrgjn+UfG
         4xuP63V5XN9/GUqwXq9P7DOVTsaS7iQD7M0g1xDAsKuz2KebIl3k7WWXqpWRGPeeZ+tQ
         Inswnf3wi7gM7jC6hURf8vZiCe7m2CiQ229flQVOoYOkAFQi/k2km8SxVQNmNkPP5YfT
         Uz28uX83HmAi2zpsF8VKJI3gWByYylq8STTFwzHx2OVcU25HPamLBdpgDFP/TpKH+uvC
         uMD48XWavYIVNCD9h27ytJX9e0v+4MVrtyNiuJukXZdv8Kf74OpiMufeVeQD7bc0juqW
         0mCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSzz1j0JrFPYRdmMkNKTQdcj06G87619Rhwa+vXyAbA8z8lpD95mZYihqrhKNfmQIHCvM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzF1EzTusU+AWvouQhy95GMZONdTje+GTIbwWUJdlSXTbWwwcu/
	wTyH2MT4batMnDrl/y6/dik2fbKLXMLDCIhI5TSmy4eCVK5TN2yaQskQrXGiI7J1gVM=
X-Gm-Gg: ASbGncthOnPHh/24oi1IUHtyJZmOr4bo8DGnWpx+yzVLsuiRqo/7d/O/E/kAtyRqgdu
	U8A/r/QYvXzKV4SjikPkvUotektZ5BSc2DvNW2bD+0ZpH6INOVI9zlWKZCJ6l73Ycl5LLfPuh10
	ZEww0nBvTEAdUneosbMBfDfuk7yY1mO+YLu8JYBhietGQniKSs8BbudpbLXcOl63DAxUytSA64+
	/azMBjV9Zr8VnuC1y8aimLaXMHdmmg7e+TZItCW4tLqO5Dt8wk2AWyOXDkFoXKYnlEgGvN8J1w/
	JHjV8XT9/VYhEPyRI/Zfmar5ot6rMSEq7GB6td4ZP3xeyGc34KgMKuD6oAK5Gwq6NyQr6eM=
X-Google-Smtp-Source: AGHT+IFcpjDviXjWNB7+EBIbhpiq2tpPR7sQlo7rFyrWtoBHLAjxGUQNW2PIVbs7fj19J7u5oXlJ7g==
X-Received: by 2002:a05:600c:a40a:b0:43b:c592:7e16 with SMTP id 5b1f17b1804b1-442f84c2092mr260241495e9.3.1747925573711;
        Thu, 22 May 2025 07:52:53 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:53 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:38 +0100
Subject: [PATCH v2 09/14] spi: spi-fsl-dspi: Use DMA for S32G controller in
 target mode
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-9-bea884630cfb@linaro.org>
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
 Ciprian Marian Costea <ciprianmarian.costea@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

From: Larisa Grigore <larisa.grigore@nxp.com>

Switch to DMA for target mode otherwise the controller is too slow to
feed TX FIFO and UNDERFLOW occurs frequently. DMA can work only with 8
and 16 bits per word. 32bits per word is not supported, this is a
hardware limitation, so we keep the controller mode in TCFQ mode.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 24a51267cb4d..db5a2ed66f68 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -139,6 +139,7 @@ enum {
 	MCF5441X,
 	VF610,
 	S32G,
+	S32G_TARGET,
 };
 
 static const struct regmap_range dspi_yes_ranges[] = {
@@ -183,6 +184,7 @@ static const struct regmap_access_table dspi_volatile_table = {
 
 enum {
 	DSPI_REGMAP,
+	S32G_DSPI_REGMAP,
 	DSPI_XSPI_REGMAP,
 	S32G_DSPI_XSPI_REGMAP,
 	DSPI_PUSHR,
@@ -198,6 +200,15 @@ static const struct regmap_config dspi_regmap_config[] = {
 		.rd_table	= &dspi_access_table,
 		.wr_table	= &dspi_access_table,
 	},
+	[S32G_DSPI_REGMAP] = {
+		.reg_bits	= 32,
+		.val_bits	= 32,
+		.reg_stride	= 4,
+		.max_register	= SPI_RXFR4,
+		.volatile_table	= &dspi_volatile_table,
+		.wr_table	= &s32g_dspi_access_table,
+		.rd_table	= &s32g_dspi_access_table,
+	},
 	[DSPI_XSPI_REGMAP] = {
 		.reg_bits	= 32,
 		.val_bits	= 32,
@@ -296,6 +307,12 @@ static const struct fsl_dspi_devtype_data devtype_data[] = {
 		.fifo_size	  = 5,
 		.regmap		  = &dspi_regmap_config[S32G_DSPI_XSPI_REGMAP],
 	},
+	[S32G_TARGET] = {
+		.trans_mode	  = DSPI_DMA_MODE,
+		.max_clock_factor = 1,
+		.fifo_size	  = 5,
+		.regmap		  = &dspi_regmap_config[S32G_DSPI_REGMAP],
+	},
 };
 
 struct fsl_dspi_dma {
@@ -351,6 +368,12 @@ struct fsl_dspi {
 	void (*dev_to_host)(struct fsl_dspi *dspi, u32 rxdata);
 };
 
+static bool is_s32g_dspi(struct fsl_dspi *data)
+{
+	return data->devtype_data == &devtype_data[S32G] ||
+	       data->devtype_data == &devtype_data[S32G_TARGET];
+}
+
 static void dspi_native_host_to_dev(struct fsl_dspi *dspi, u32 *txdata)
 {
 	switch (dspi->oper_word_size) {
@@ -1426,6 +1449,9 @@ static int dspi_probe(struct platform_device *pdev)
 		dspi->pushr_tx = 0;
 	}
 
+	if (spi_controller_is_target(ctlr) && is_s32g_dspi(dspi))
+		dspi->devtype_data = &devtype_data[S32G_TARGET];
+
 	if (dspi->devtype_data->trans_mode == DSPI_XSPI_MODE)
 		ctlr->bits_per_word_mask = SPI_BPW_RANGE_MASK(4, 32);
 	else

-- 
2.34.1

