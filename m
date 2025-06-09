Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79591FDE22
	for <imx@lists.linux.dev>; Mon,  9 Jun 2025 15:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749483222; cv=none; b=RySKEB8NFusmTbuZ5nP1UrSCS/MyRPxZ/Jian3ocy2t20UKOxmiG9t51LjhmhAV11AY2IIeIeHti7/816eyEzyGmw8uwmDOg5VxeYZGFGHoZUlgZacTR5HNMDQ6At4c1eXFT9e7TCXQCX4rJdF+C+EEP/7fEFGGYWfeubhaNuAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749483222; c=relaxed/simple;
	bh=GWTkTdANS3UrxTpYZoCpcwBtNSE2WMoiy/X9DGjxSlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SzGeg31xztNRmU9fsShdFQ4+jdLxr7tfE9jK6buomqekXe2F+gWfU2PeCdieUJIOEMkreVkiiSXTAEdXFuSiURYWvZA/FfAXO0Vz/2meP4WN8Mt+euBIzL5Pg/LMUrHzzqb8hob8gDXCtgvSkY3/VentePht5PmRiqzoMrStGPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bxGsKD5/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bxGsKD5/"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-442ea341570so29001665e9.1
        for <imx@lists.linux.dev>; Mon, 09 Jun 2025 08:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749483219; x=1750088019; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZK5F7C4/3QyMPlYogeS1FiaRgdwuH6v3hOpp6CFdSVg=;
        b=bxGsKD5/gdBj9pO7lHyCVkLWVikeKJtq9prT+MVtfsIYYst1T3DXH7997GkjnaI0ZT
         Gxm8eOhqRkr3/FubUov2sd5Ykq4CO7i+9shZU7Y4UmrteaXXO2CelaQ8+3VDxzDTiL/c
         oDwb39ETY6EtkCcrnXAp+LsEcFcxs2cuWeLJH1EWlSHuvQZ550bDstWKdFGIvgEUuFYT
         Y79CzDKDE7YWC/rxKM2bY2GPW2yVHT2LQXYreQZUGnXBKlRt1dc29LslnqcRzi0Ah9Cl
         /+vBn8qFgAc2NHA7MNs7om0Fad79kGMZCPTX8twCIxjyrm/+nEsHT+oVy0EIbWsjEO3e
         YS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749483219; x=1750088019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZK5F7C4/3QyMPlYogeS1FiaRgdwuH6v3hOpp6CFdSVg=;
        b=Zm3euybLqCKh+hib0uHVyiPEK0eNT+cOmt8f5dMq6PwCyl4reOYAssM+6QOPZzg2KA
         Oo5TDZytM867vMF0lRO5J83/tQGOjrW2WOcQtsZMR+54UwA/TgRY+zWxtF3DNJUIefYz
         iftUUbVQI+cac2/hirSKxSlw3fD9QrihYDC50FfEN6h3yS6SSQGP5G/75MrFac2faXgS
         XYJnKzTuLCu1ehekgorq+QBzXIBzBhpUL9WI4roDHH0QEtRcnIfeY2oN+gX6/vv48PSG
         LgekVQTFMKocA+S7maxmCIg68tfTpnojVrmijRmsUg5WovhsjMFbrvOkvr0/zQWMRYpN
         Z28g==
X-Forwarded-Encrypted: i=1; AJvYcCWCaWhdINJooNnTQfo0qD2q2vfKzqfnGdFbvlhGFb3iRxqoWQn7UFBkYqnWa4SR/CJzLto=@lists.linux.dev
X-Gm-Message-State: AOJu0YzvmwVPTzPDC/Zn/iuI1PpZojYLUEvT1A3kSKeWxRm/vAgdBdlY
	oKnZ81RCMu4aNrgmPSI93cZjLP2+1qmYe/rQE+xSSrd4gDMjNyLCqoJ3DFyRLXIdULY=
X-Gm-Gg: ASbGncusttaqBqaFaaMQLlBbeTImwQryE5Hukbd/5gpjjyXBxdXYe32A4Z7knyUZes1
	S1PxajJonbbvR4MDD/wNkz4IJx0ErmpFsGn4i5lIRG9vNEdSuijpXoPVv+ekYbvlbSSp0/NGZEa
	uUnDg9AKZj91SJvqTEMsNk1ntSTj8ChyW6VjBmFd80/HszdifuFGnrV6SeyxnnfKz456/w9Ljjr
	dOykjv/p7B3zAht7GMjgYo+b35FlBRP85JeP8vmAIO96lXoacwnBq+Ba+wNRgm+lKi4S/X/SGr5
	nN3am+0YJ+AOwfLJlxsNH+3GsNRP0iHQYIx4oRmMZhRWRzDo/cGll4PaFOQ2vUpQyNJl+9U=
X-Google-Smtp-Source: AGHT+IHIHUkukvAK71jFJiez1/GpgB6tOVcdw0g6KJbi705z+mYm3XxoZlZVO0uZvMC3Kr5+0Y/yQw==
X-Received: by 2002:a05:600c:4e4f:b0:44a:b9e4:4e6f with SMTP id 5b1f17b1804b1-452013ac461mr127453165e9.16.1749483219072;
        Mon, 09 Jun 2025 08:33:39 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452137277basm115728695e9.32.2025.06.09.08.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:33:38 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 09 Jun 2025 16:32:39 +0100
Subject: [PATCH 2/4] spi: spi-fsl-dspi: Use non-coherent memory for DMA
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-james-nxp-spi-dma-v1-2-2b831e714be2@linaro.org>
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
In-Reply-To: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-spi@vger.kernel.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, Arnd Bergmann <arnd@arndb.de>
X-Mailer: b4 0.14.0

Using coherent memory here isn't functionally necessary. Because the
change to use non-coherent memory isn't overly complex and only a few
synchronization points are required, we might as well do it while fixing
up some other DMA issues.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 55 +++++++++++++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 20 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 386a17871e79..567632042f8f 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -247,6 +247,11 @@ struct fsl_dspi {
 	void (*dev_to_host)(struct fsl_dspi *dspi, u32 rxdata);
 };
 
+static int dspi_dma_transfer_size(struct fsl_dspi *dspi)
+{
+	return dspi->words_in_flight * DMA_SLAVE_BUSWIDTH_4_BYTES;
+}
+
 static void dspi_native_host_to_dev(struct fsl_dspi *dspi, u32 *txdata)
 {
 	switch (dspi->oper_word_size) {
@@ -361,7 +366,10 @@ static void dspi_tx_dma_callback(void *arg)
 {
 	struct fsl_dspi *dspi = arg;
 	struct fsl_dspi_dma *dma = dspi->dma;
+	struct device *dev = &dspi->pdev->dev;
 
+	dma_sync_single_for_cpu(dev, dma->tx_dma_phys,
+				dspi_dma_transfer_size(dspi), DMA_TO_DEVICE);
 	complete(&dma->cmd_tx_complete);
 }
 
@@ -369,9 +377,13 @@ static void dspi_rx_dma_callback(void *arg)
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
@@ -381,6 +393,7 @@ static void dspi_rx_dma_callback(void *arg)
 
 static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 {
+	size_t size = dspi_dma_transfer_size(dspi);
 	struct device *dev = &dspi->pdev->dev;
 	struct fsl_dspi_dma *dma = dspi->dma;
 	int time_left;
@@ -389,10 +402,9 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 	for (i = 0; i < dspi->words_in_flight; i++)
 		dspi->dma->tx_dma_buf[i] = dspi_pop_tx_pushr(dspi);
 
+	dma_sync_single_for_device(dev, dma->tx_dma_phys, size, DMA_TO_DEVICE);
 	dma->tx_desc = dmaengine_prep_slave_single(dma->chan_tx,
-					dma->tx_dma_phys,
-					dspi->words_in_flight *
-					DMA_SLAVE_BUSWIDTH_4_BYTES,
+					dma->tx_dma_phys, size,
 					DMA_MEM_TO_DEV,
 					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 	if (!dma->tx_desc) {
@@ -407,10 +419,10 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 		return -EINVAL;
 	}
 
+	dma_sync_single_for_device(dev, dma->rx_dma_phys, size,
+				   DMA_FROM_DEVICE);
 	dma->rx_desc = dmaengine_prep_slave_single(dma->chan_rx,
-					dma->rx_dma_phys,
-					dspi->words_in_flight *
-					DMA_SLAVE_BUSWIDTH_4_BYTES,
+					dma->rx_dma_phys, size,
 					DMA_DEV_TO_MEM,
 					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 	if (!dma->rx_desc) {
@@ -512,17 +524,17 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
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
@@ -557,11 +569,12 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
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
@@ -582,14 +595,16 @@ static void dspi_release_dma(struct fsl_dspi *dspi)
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

