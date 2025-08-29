Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B463148AA
	for <imx@lists.linux.dev>; Fri, 29 Aug 2025 11:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756468050; cv=none; b=Q3vGEP6YFL59MY6hlMjnYvcbEVejpUiw9jFAuz9Qh5aadyirQiBS9iMVlP7sxGtEPA1O8Kb+s0SakA8KfAVYOrC0hbUyNRaqy0WZvij/zu1pPwl4d7UgWF2NXID+9Dr/9VOMZv3zWkXMLPGolw8EqMpjujGKYuuvysKdhUPnZ18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756468050; c=relaxed/simple;
	bh=ntK5L5T/QM76W3rTDaszRT95k+dCoyl1H2FWmC7FW6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m0PpstFZWNs06upCLzvzdttD39dBuJeX1bBH3mUDI8p96yA1p4IwlpvEcff6X9aFZuFBV8thVkUNWBG//2ljweHTVN13kmXE8eQ+aNkKyCSum5fA5VeFq4MbFrtnYsfVbFNKndIUjXDCbQvLCDF2JXT0R3/BJgW3Buq1A7qYV3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nzN3uL6D; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nzN3uL6D"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3cd59c5a953so1278461f8f.0
        for <imx@lists.linux.dev>; Fri, 29 Aug 2025 04:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756468047; x=1757072847; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKPM1NaI+rLr+WfS0ckt9fLMpS/+n3/5mziB0NSyT44=;
        b=nzN3uL6DHFioNcuncWHogPDW+RBu+Tfp9jAXeUlDNhewBZhfdwbP9y7+2yy5n8XLgF
         0M35uQGXCPAkeutsIET6D/rMc232ndV7I4Kqd4wfH/3SxjTn2ouPEJyJNks0We9Gw57A
         db5U8CFIBecUW0iYETF0MDxE+EZMZzHvK5SeuvjYS3Ki28IqhwMaL+ieQES/xkDQ8r9p
         /PWrcUzAWmszoBlPHa/IthmWnBGjOF3pvRStohnyvQ6aHJfBOU7+OtSXWImJPZ50u5mT
         7CGhc9EqyE88h0y5K68lhso2Q/TKTSd05FHHJKmC8nCV5RpsvdeX9OC9kGgKZBIkItg2
         TOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756468047; x=1757072847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKPM1NaI+rLr+WfS0ckt9fLMpS/+n3/5mziB0NSyT44=;
        b=iztCol+CFyV/QjdNwknlZwyt2nqm/PbWGpD7+xH48E43Gh0IsUDh35c/1Ccb3APED8
         qTPR1EKsmwt7y8UP0XUtZZ6Rj9IF3iXH6wUSLR07cH+qrMh6aeVtMC4M1EnQBqbzndtN
         JTqpH1JGgmdGOHLCc8Ni+yfnUtwuG/3gdqYSKUzp0/RpT7MmjLUko18alzgoGQgPhOAo
         /ZtZFUnybSgIVqhs8NrHyNbxGjLria3R7pH+pWg3f2nuSk7kmgXxTr2tycZi6yczOl+8
         6lwDlBpiBDhQ5+h268JsrTZl4ih55HBappAdMrbolvUyhzqXaqb89uo9VwhDRelUBaIZ
         G8Fw==
X-Forwarded-Encrypted: i=1; AJvYcCXu6jairOzjfb2RV4uB4DNburCwhWnkHdeDbY9xYU5H0wdD2LuTLL41AbIA5FBMNEL2w3I=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWhy5xIMRMDbX4LEY12igW9gKATWkcgQh4iYq2uOaDzok6huz4
	6sq+KdF8ssqEzjyCy5D7PEUYpEd2AtiVSUnkvm9XsjHjOYxnJ8rWQH46g14QvUcOPBI=
X-Gm-Gg: ASbGnctnZGX4inc+m0KJCEcUDEy/02sU1O2n8MkBcVbZJ02JqRDcX+HwBt4iPPP/kWV
	XyvC7y99T/ytFnG1q5n7rIyPCeeiHreGJvxz6J21ZWm4EAqQeJlMgPI+MwwvHfiz9ImeOzF3EQp
	d2jYmgcTyxdAsSZbrGyHbvApP182twakkhnpr59DDU9XSX9OInAHJlrQsYQpj7Zhkfbn2xfc9nx
	MLEs2ANQzJRiWYtfNrzCMvAeTpBKdpl1yF4gLZkGpB7M0vOcm/USaG9j1vKraR5OnCr0gHOAoiB
	GdYPzerEJSw/x1W8KsSWb72la8cPw/uNjC4q4LrgPQYfM16BeAAPhyicqfiyF1lZ4JGRwDIolL3
	9ssvgrvqbjRQrYXAXCrfCdEeS84h7BJrb+jO/gFG2PQ==
X-Google-Smtp-Source: AGHT+IHv+Gaestx0qRxtBdc4nmSi3ic1F/o/Ny/4cEGuBY1B1TJaPYSMMe0sdfWbsW9bjcLeH/F+Ow==
X-Received: by 2002:a05:6000:290f:b0:3d0:b3cc:c1ff with SMTP id ffacd0b85a97d-3d0b3ccc6bdmr1514886f8f.39.1756468047268;
        Fri, 29 Aug 2025 04:47:27 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7c461edasm29873255e9.9.2025.08.29.04.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 04:47:26 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 29 Aug 2025 12:46:45 +0100
Subject: [PATCH v5 3/7] spi: spi-fsl-dspi: Stub out DMA functions
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-james-nxp-spi-dma-v5-3-3246957a6ea9@linaro.org>
References: <20250829-james-nxp-spi-dma-v5-0-3246957a6ea9@linaro.org>
In-Reply-To: <20250829-james-nxp-spi-dma-v5-0-3246957a6ea9@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
 Larisa Grigore <larisa.grigore@nxp.com>, Frank Li <Frank.li@nxp.com>, 
 Christoph Hellwig <hch@lst.de>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

This will allow the build to succeed with !CONFIG_DMA_ENGINE, either due
to a randconfig build test or when the target only uses one of the
non-DMA transfer modes which this driver supports.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 48054932d517..0baf7e0608f2 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -373,6 +373,8 @@ struct fsl_dspi {
 	void (*dev_to_host)(struct fsl_dspi *dspi, u32 rxdata);
 };
 
+static void dspi_setup_accel(struct fsl_dspi *dspi);
+
 static bool is_s32g_dspi(struct fsl_dspi *data)
 {
 	return data->devtype_data == &devtype_data[S32G] ||
@@ -468,6 +470,16 @@ static u32 dspi_pop_tx(struct fsl_dspi *dspi)
 	return txdata;
 }
 
+/* Push one word to the RX buffer from the POPR register (RX FIFO) */
+static void dspi_push_rx(struct fsl_dspi *dspi, u32 rxdata)
+{
+	if (!dspi->rx)
+		return;
+	dspi->dev_to_host(dspi, rxdata);
+}
+
+#if IS_ENABLED(CONFIG_DMA_ENGINE)
+
 /* Prepare one TX FIFO entry (txdata plus cmd) */
 static u32 dspi_pop_tx_pushr(struct fsl_dspi *dspi)
 {
@@ -481,14 +493,6 @@ static u32 dspi_pop_tx_pushr(struct fsl_dspi *dspi)
 	return cmd << 16 | data;
 }
 
-/* Push one word to the RX buffer from the POPR register (RX FIFO) */
-static void dspi_push_rx(struct fsl_dspi *dspi, u32 rxdata)
-{
-	if (!dspi->rx)
-		return;
-	dspi->dev_to_host(dspi, rxdata);
-}
-
 static void dspi_tx_dma_callback(void *arg)
 {
 	struct fsl_dspi *dspi = arg;
@@ -589,8 +593,6 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 	return 0;
 }
 
-static void dspi_setup_accel(struct fsl_dspi *dspi);
-
 static void dspi_dma_xfer(struct fsl_dspi *dspi)
 {
 	struct spi_message *message = dspi->cur_msg;
@@ -722,6 +724,18 @@ static void dspi_release_dma(struct fsl_dspi *dspi)
 		dma_release_channel(dma->chan_rx);
 	}
 }
+#else
+static void dspi_dma_xfer(struct fsl_dspi *dspi)
+{
+	dspi->cur_msg->status = -EINVAL;
+}
+static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
+{
+	dev_err(&dspi->pdev->dev, "DMA support not enabled in kernel\n");
+	return -EINVAL;
+}
+static void dspi_release_dma(struct fsl_dspi *dspi) {}
+#endif
 
 static void hz_to_spi_baud(char *pbr, char *br, int speed_hz,
 			   unsigned long clkrate, bool mtf_enabled)

-- 
2.34.1

