Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F36C28F937
	for <imx@lists.linux.dev>; Fri,  9 May 2025 11:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788829; cv=none; b=j2+Qaklo0rHcKRVd29ilhHq5HgLs6tji2dxSisRGyTngfmAMi6F+RwiJskDWk12BXl/rwfL8EFkgJGv9FTh7UNj10fJABvray/SxLoIFIbgadBbFMkyDsABMmA00vUrvRsq12ag5SdIpQE/3afGsk3kBHmO2Ox0+SgHcRYgMgMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788829; c=relaxed/simple;
	bh=Wzbi1SX9mtAF2E7Mjcw8XjP0xTVKnkUioAGI/9ufBe8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f5ImUw+L92EtBtq4UYwHdcN/6XOUEvcuq+fuOdHRJsP7CvJBsYfSfLiUP8T2FoS9RPg/zD+cW5G7daVgYKBxzoxoQ7z7CoSx+TdOCDc/yIpPgrHALv3CtrEmQefaq1pFo0FZ1ycaSAEecdPmYrWOPNCsoxpGntIO2KgnAnf/NvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DHq8k/hI; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DHq8k/hI"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3995ff6b066so1099115f8f.3
        for <imx@lists.linux.dev>; Fri, 09 May 2025 04:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788826; x=1747393626; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X9YN8+8rnHDsp/b09Y/xOR9H3TlYqB2jpDQsHdPnIdk=;
        b=DHq8k/hIHQnOqRtCNAskx/UhOaJprRaZ4X6tfTl8GIA/oPPPQsM2owyGh4JeFoKcd/
         DVtB6fpU1eEDmYuniwecFZpShemxfet/ce841U9vMObXsuf+NN8d+/5n9M40V4Akw4Ru
         PN044Wa47Gx6v15Z/mCGELqSYm94DsatP1AnKFcciA9/99oZ/iF7hy4DnI1YNX0qpTFK
         nsd6utM3cUGLXUQH0tGxwdueq6cBCNd+Y1Noglp1LWFc40shW5aGs3Dj5pap/qmlz7v0
         9Y+HnvDlD7I44i/eicvG3PVuftIi4l7fUoLOZJd4ohi0MMZ7hv5BAYRVLp8YLhACyESr
         w2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788826; x=1747393626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X9YN8+8rnHDsp/b09Y/xOR9H3TlYqB2jpDQsHdPnIdk=;
        b=qlr0jUeVSbw5fcZIed2R5WMa8FRWSmPE5W6yNvzgdRKkr78i1HrBJWS7xeGB8Ad1hL
         fEzL9ngg4Aqq+BjJNDHE3c17R/NWM1dhQ1uLT2EWfLtghE2hZq2U4BE87CWQy1XJK6d6
         M0AKueQp1sxVbdYE4ScLNBvKg0Jblh2eOZFD1f1l5tk6Cx5Ty/yliEMZxFsY954ZCSjN
         DCjggQaz+P25zN4ORpflCdJ80iEBWS+kzx68CectZ/hPONyTTorz+sesU2BGNsy1mCjO
         6DhlH+XG7dSfjEpXeSg7eO4D7uTJHVqlqGlb9CGqOEUfK0lqoCe9cz14wgcKzefJwtlp
         Fpwg==
X-Forwarded-Encrypted: i=1; AJvYcCXHN6tO/v9DA2b54q3ODWKGPD+HgSifEkcoM2nPc2mi6eXCd4ioWOX5N61nOro1bC2UZI8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxevRkE+96npObCbgWLnSMfmtqi3F3TqvnxQbjJb4fp78VFVXN1
	HhorJ9fUcB8r5pULLS9q9qLOlgM0Rg0y/qakrv9MD+KC8MkRdl7fIdOXlfH+DAs=
X-Gm-Gg: ASbGncuooSu02bkaixiQE1wlDwZ8P9HEP9J4xCAwdi0zH3jUToW8gherWL3C8AUtbWd
	0ZKxw3s4xYWi0+CT6nZo0tN6HSlwh2//R94CgZBPxqfOZrIOX3rzLPIzfF6zjkNLq8UgkeErqTm
	l4Y6uq+3M3wpQVIOGwhKRoBzONxP/47HVOMGvTvuDxYva2nZSNVSyZ4TPIQQCUvFOF+KJYWuBjt
	ynu/r+6RQZ3Fy7qe76CX0qqyCtCewTtQdM8A5JfDm/fIKdfsvOh1iGWS5MvB0V28vwl4T0RoqzP
	o+ItC4ExxHBudmad/2cKbz52asT0WJqF8YPmm1Y/yJjrT4A=
X-Google-Smtp-Source: AGHT+IGTcDbYuLQC5gOTqBLxhDeYoC8oTLnNT0OALiU2xxGu34CRv1e+8uSkOAx/4GXBO/mVq1Dayg==
X-Received: by 2002:a5d:584b:0:b0:3a1:f635:1136 with SMTP id ffacd0b85a97d-3a1f6487d80mr2603233f8f.28.1746788825706;
        Fri, 09 May 2025 04:07:05 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:07:05 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:05:55 +0100
Subject: [PATCH 08/14] spi: spi-fsl-dspi: Use DMA for S32G controller in
 target mode
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-8-32bfcd2fea11@linaro.org>
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
 linux-arm-kernel@lists.infradead.org, 
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
 drivers/spi/spi-fsl-dspi.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index b7363cfc649d..50cec3b94322 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -137,7 +137,8 @@ enum {
 	LX2160A,
 	MCF5441X,
 	VF610,
-	S32G
+	S32G,
+	S32G_TARGET
 };
 
 static const struct regmap_range dspi_yes_ranges[] = {
@@ -182,6 +183,7 @@ static const struct regmap_access_table dspi_volatile_table = {
 
 enum {
 	DSPI_REGMAP,
+	S32G_DSPI_REGMAP,
 	DSPI_XSPI_REGMAP,
 	S32G_DSPI_XSPI_REGMAP,
 	DSPI_PUSHR
@@ -197,6 +199,15 @@ static const struct regmap_config dspi_regmap_config[] = {
 		.wr_table	= &dspi_access_table,
 		.rd_table	= &dspi_access_table
 	},
+	[S32G_DSPI_REGMAP] = {
+		.reg_bits	= 32,
+		.val_bits	= 32,
+		.reg_stride	= 4,
+		.max_register	= 0x8C,
+		.volatile_table	= &dspi_volatile_table,
+		.wr_table	= &s32g_dspi_access_table,
+		.rd_table	= &s32g_dspi_access_table,
+	},
 	[DSPI_XSPI_REGMAP] = {
 		.reg_bits	= 32,
 		.val_bits	= 32,
@@ -294,6 +305,12 @@ static const struct fsl_dspi_devtype_data devtype_data[] = {
 		.max_clock_factor	= 1,
 		.fifo_size		= 5,
 		.regmap			= &dspi_regmap_config[S32G_DSPI_XSPI_REGMAP]
+	},
+	[S32G_TARGET] = {
+		.trans_mode		= DSPI_DMA_MODE,
+		.max_clock_factor	= 1,
+		.fifo_size		= 5,
+		.regmap			= &dspi_regmap_config[S32G_DSPI_REGMAP]
 	}
 };
 
@@ -350,6 +367,12 @@ struct fsl_dspi {
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
@@ -1398,6 +1421,9 @@ static int dspi_probe(struct platform_device *pdev)
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

