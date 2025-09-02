Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FC72D9ECE
	for <imx@lists.linux.dev>; Tue,  2 Sep 2025 12:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817175; cv=none; b=lYxAiFlIxX0XB6bApedWN0jAfgQ6UgfDSN/55y+hnBZ3RbCn/qqXJt2rdYTDVThwbgud+5j52M6fM1bAXS2l0hR/hJDMsErw8tedCRMUs0V2YuXxeyDeKk/RI4PbHD14uQTxqt8F20iWelwmolhC3v4uEm1oJQm6NPqtogw0GF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817175; c=relaxed/simple;
	bh=dLXhXmGBVUdjGWO7AanK630sMzav+5Mv4ke+Z75scWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rgFdzZ2SzqQAMjBUS7yV5t8ygEAoUtQRDjkv2A5FZMWTJBi2qui+k6hHMelRCHymXndMSGsPDPwXZ8eFe1LLSPUwm2jLTfmS7Nac280JUYnWZbjw305A/SjXYumNTGEvaw0bhMl5Jl51SwDmvxn5d+xhgbt8w39f8K9mRMfChhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JFbludCx; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JFbludCx"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3d19699240dso2185990f8f.1
        for <imx@lists.linux.dev>; Tue, 02 Sep 2025 05:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756817170; x=1757421970; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsDT6IfRm3W35zg8rWWkO4jVs26qP9v/JAyh479nlAw=;
        b=JFbludCxSGRN6wz14HkyNmVtGxZDVyORxPcjVnVIDGqUpv5EAjFZAljWwIp3inMBDG
         OaTjRqBaoiCZCBeXRPWhmEMcfxWZ0n/wxpMYOUbN6QPvH4X6ET0SSSBweXCfYUQ6mhXJ
         3ZK30QtNk0p6OuxZmQLaI0E9nKT8t9SoiR+fm76GF+a66qnY++uQ8oXhluLWvujDnuHg
         ONTLkG5DznVClrBUD6+5BZuPT0MXWJNphnb7yqdK0aWu0Zaaagp52lM7vykQD+4Iv830
         1EA7Umtao5XMiDejlXSaFKRw14FWJ/wgWfxxQNOPh4rTfpn3obilC3+5Gnq/aIvCwGj3
         oSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756817170; x=1757421970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsDT6IfRm3W35zg8rWWkO4jVs26qP9v/JAyh479nlAw=;
        b=ia5Obvn7oryk5VYo1y+XFAh6GVl6DlsfM1GYmX+njflzNcV3Iv0Cr1s1q4lvvf/shQ
         2zfvoQQMISY9vCZwTOufNz2c9UUhWvqwESHEXpPOKzknOgTkvJkp4f9jVPp30ouDenBk
         3t5y70KNWMf1p5dwTPyVunyhYRDy9cqKKqfKeiX0KDe4ccXSZUxxGO77HZVZfbBWzUYL
         Kfko42+vEzB9SDL/X1KZqFNBF5zmyserfr5r+vfJbOuNPXGHK/YoEnCyrysIU3HdvRkJ
         LA1o/6r/CO/4EZ40HI/6y/vCrCFIgAO+YLqMH3aYCS+swKOTO0UeDr5Ak6O26e8rweEH
         Nu2g==
X-Forwarded-Encrypted: i=1; AJvYcCULOno78b50HzON5NovNnp0+rMGiUwBsPw9H/F7h3KFc9gnweue6QK9jwjtIklVpe12QAU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpjAubWvSiP/hEDy928s3nDEZ00YV1dr80MhkCkwYa8i7E1u2z
	o1bDf0csuSLA53RDTh9o/1dqcsdIghtEk6Lfp88SSo3fq4o9vXEPorT/2ZmORGaASdM=
X-Gm-Gg: ASbGncuH2vXqlJBFPOzDjJMW6P6KGgVeP9p/1CUzgUHjCXTxlcPyPM34GIJRGqkr+IA
	xb0Vf09/wyikp1MH9tACgYBCksdLHlsAM7YknGdG8ZrhIIya4CqC3xZzgYWUVuWuxeE2wQuCp3o
	zOAr6n34lRpbC5fABcm2XVvbU66GBvw2vGtipCvFlxwC2fClsMPFpRb7OAAAgIe4WmpZ42yucmx
	8sGkU/hWFbWyYG4/GrLH5g8Htw7Vm8k73ekPqjAl5jZScVEOxrGtu0rsxKIc2BGGmhUyJrfd2nZ
	I2wH8mc4FTAu/MyOmRXwzTVaPtei55E+k5lKVp/1HMMLWzBsf2uiLdyUxShoAH4amTD0pi41ZOm
	wPqC1GhPIaiHxauzKd2nsTByQ0Bxppg3b0zubcI9jRw==
X-Google-Smtp-Source: AGHT+IEwUKz3nl2krF2wHyMlpvQhNKTtJiOLQm9e9D7oVD/bUvk+dX6eDVCzpUFwJ4wbqE7UxEr79w==
X-Received: by 2002:a05:6000:2212:b0:3b9:14f2:7edf with SMTP id ffacd0b85a97d-3d1af84bfd1mr7494714f8f.1.1756817170353;
        Tue, 02 Sep 2025 05:46:10 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf275d2717sm19589896f8f.15.2025.09.02.05.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:46:09 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 02 Sep 2025 13:44:56 +0100
Subject: [PATCH v6 4/7] spi: spi-fsl-dspi: Use non-coherent memory for DMA
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-james-nxp-spi-dma-v6-4-f7aa2c5e56e2@linaro.org>
References: <20250902-james-nxp-spi-dma-v6-0-f7aa2c5e56e2@linaro.org>
In-Reply-To: <20250902-james-nxp-spi-dma-v6-0-f7aa2c5e56e2@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
 Larisa Grigore <larisa.grigore@nxp.com>, Frank Li <Frank.li@nxp.com>, 
 Christoph Hellwig <hch@lst.de>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.0

Using coherent memory here isn't functionally necessary, we're only
either sending data to the device or reading from it. This means
explicit synchronizations are only required around those points and the
change is fairly trivial.

This gives us around a 10% increase in throughput for large DMA
transfers and no loss for small transfers.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 65 +++++++++++++++++++++++++++++-----------------
 1 file changed, 41 insertions(+), 24 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 0baf7e0608f2..81d1e4470f94 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -493,11 +493,19 @@ static u32 dspi_pop_tx_pushr(struct fsl_dspi *dspi)
 	return cmd << 16 | data;
 }
 
+static size_t dspi_dma_transfer_size(struct fsl_dspi *dspi)
+{
+	return dspi->words_in_flight * DMA_SLAVE_BUSWIDTH_4_BYTES;
+}
+
 static void dspi_tx_dma_callback(void *arg)
 {
 	struct fsl_dspi *dspi = arg;
 	struct fsl_dspi_dma *dma = dspi->dma;
+	struct device *dev = &dspi->pdev->dev;
 
+	dma_sync_single_for_cpu(dev, dma->tx_dma_phys,
+				dspi_dma_transfer_size(dspi), DMA_TO_DEVICE);
 	complete(&dma->cmd_tx_complete);
 }
 
@@ -505,9 +513,13 @@ static void dspi_rx_dma_callback(void *arg)
 {
 	struct fsl_dspi *dspi = arg;
 	struct fsl_dspi_dma *dma = dspi->dma;
+	struct device *dev = &dspi->pdev->dev;
 	int i;
 
 	if (dspi->rx) {
+		dma_sync_single_for_cpu(dev, dma->rx_dma_phys,
+					dspi_dma_transfer_size(dspi),
+					DMA_FROM_DEVICE);
 		for (i = 0; i < dspi->words_in_flight; i++)
 			dspi_push_rx(dspi, dspi->dma->rx_dma_buf[i]);
 	}
@@ -517,6 +529,7 @@ static void dspi_rx_dma_callback(void *arg)
 
 static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 {
+	size_t size = dspi_dma_transfer_size(dspi);
 	struct device *dev = &dspi->pdev->dev;
 	struct fsl_dspi_dma *dma = dspi->dma;
 	int time_left;
@@ -525,12 +538,12 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 	for (i = 0; i < dspi->words_in_flight; i++)
 		dspi->dma->tx_dma_buf[i] = dspi_pop_tx_pushr(dspi);
 
+	dma_sync_single_for_device(dev, dma->tx_dma_phys, size, DMA_TO_DEVICE);
 	dma->tx_desc = dmaengine_prep_slave_single(dma->chan_tx,
-					dma->tx_dma_phys,
-					dspi->words_in_flight *
-					DMA_SLAVE_BUSWIDTH_4_BYTES,
-					DMA_MEM_TO_DEV,
-					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+						   dma->tx_dma_phys, size,
+						   DMA_MEM_TO_DEV,
+						   DMA_PREP_INTERRUPT |
+						   DMA_CTRL_ACK);
 	if (!dma->tx_desc) {
 		dev_err(dev, "Not able to get desc for DMA xfer\n");
 		return -EIO;
@@ -543,12 +556,13 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 		return -EINVAL;
 	}
 
+	dma_sync_single_for_device(dev, dma->rx_dma_phys, size,
+				   DMA_FROM_DEVICE);
 	dma->rx_desc = dmaengine_prep_slave_single(dma->chan_rx,
-					dma->rx_dma_phys,
-					dspi->words_in_flight *
-					DMA_SLAVE_BUSWIDTH_4_BYTES,
-					DMA_DEV_TO_MEM,
-					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+						   dma->rx_dma_phys, size,
+						   DMA_DEV_TO_MEM,
+						   DMA_PREP_INTERRUPT |
+						   DMA_CTRL_ACK);
 	if (!dma->rx_desc) {
 		dev_err(dev, "Not able to get desc for DMA xfer\n");
 		return -EIO;
@@ -643,17 +657,17 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
 		goto err_tx_channel;
 	}
 
-	dma->tx_dma_buf = dma_alloc_coherent(dma->chan_tx->device->dev,
-					     dma_bufsize, &dma->tx_dma_phys,
-					     GFP_KERNEL);
+	dma->tx_dma_buf = dma_alloc_noncoherent(dma->chan_tx->device->dev,
+						dma_bufsize, &dma->tx_dma_phys,
+						DMA_TO_DEVICE, GFP_KERNEL);
 	if (!dma->tx_dma_buf) {
 		ret = -ENOMEM;
 		goto err_tx_dma_buf;
 	}
 
-	dma->rx_dma_buf = dma_alloc_coherent(dma->chan_rx->device->dev,
-					     dma_bufsize, &dma->rx_dma_phys,
-					     GFP_KERNEL);
+	dma->rx_dma_buf = dma_alloc_noncoherent(dma->chan_rx->device->dev,
+						dma_bufsize, &dma->rx_dma_phys,
+						DMA_FROM_DEVICE, GFP_KERNEL);
 	if (!dma->rx_dma_buf) {
 		ret = -ENOMEM;
 		goto err_rx_dma_buf;
@@ -688,11 +702,12 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
 	return 0;
 
 err_slave_config:
-	dma_free_coherent(dma->chan_rx->device->dev,
-			  dma_bufsize, dma->rx_dma_buf, dma->rx_dma_phys);
+	dma_free_noncoherent(dma->chan_rx->device->dev, dma_bufsize,
+			     dma->rx_dma_buf, dma->rx_dma_phys,
+			     DMA_FROM_DEVICE);
 err_rx_dma_buf:
-	dma_free_coherent(dma->chan_tx->device->dev,
-			  dma_bufsize, dma->tx_dma_buf, dma->tx_dma_phys);
+	dma_free_noncoherent(dma->chan_tx->device->dev, dma_bufsize,
+			     dma->tx_dma_buf, dma->tx_dma_phys, DMA_TO_DEVICE);
 err_tx_dma_buf:
 	dma_release_channel(dma->chan_tx);
 err_tx_channel:
@@ -713,14 +728,16 @@ static void dspi_release_dma(struct fsl_dspi *dspi)
 		return;
 
 	if (dma->chan_tx) {
-		dma_free_coherent(dma->chan_tx->device->dev, dma_bufsize,
-				  dma->tx_dma_buf, dma->tx_dma_phys);
+		dma_free_noncoherent(dma->chan_tx->device->dev, dma_bufsize,
+				     dma->tx_dma_buf, dma->tx_dma_phys,
+				     DMA_TO_DEVICE);
 		dma_release_channel(dma->chan_tx);
 	}
 
 	if (dma->chan_rx) {
-		dma_free_coherent(dma->chan_rx->device->dev, dma_bufsize,
-				  dma->rx_dma_buf, dma->rx_dma_phys);
+		dma_free_noncoherent(dma->chan_rx->device->dev, dma_bufsize,
+				     dma->rx_dma_buf, dma->rx_dma_phys,
+				     DMA_FROM_DEVICE);
 		dma_release_channel(dma->chan_rx);
 	}
 }

-- 
2.34.1

