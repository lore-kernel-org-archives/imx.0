Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A504314A81
	for <imx@lists.linux.dev>; Fri, 29 Aug 2025 11:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756468052; cv=none; b=criI1gCbl+qStXEE6G9naMXFcc3d5YogbxD9jQlb45WFjYbNVTDXn3SI5pUZ1nVxd7aimdb3KbUDScFYfOq7RX6jue16TL64Plsh6dUS8oZrXKmYQvowo/8CcDG6mKHBf5VWCVJq7H3ZflQ6zfFDEfSKxiYEKBKYikGnt4tFEGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756468052; c=relaxed/simple;
	bh=Y91ohFlywuuOqzu3Tlam2ze85WKTB7vkK2PK+gGBXyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g9M6RZUp7XCh6WSIgNqQC4V61Wvn7mKlQoz4CvLzkn9w3aI2MlV1LMfy1k6o67xjrljHgvAr+E9UYVG6tgzJgVLXapx1mJA8Bv++GVTcZUJ4NPSK0tFSmP8zcYKBAxiGvCY7y+kjpzpTZHhHcx8zqWiLffneFhnxuYf4d/C6aMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HuB+iuF8; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HuB+iuF8"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so13324835e9.1
        for <imx@lists.linux.dev>; Fri, 29 Aug 2025 04:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756468048; x=1757072848; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eQp6NWY2QTc4ozrR/xRG6ASSI6SHhnIsdKywX21k0ZQ=;
        b=HuB+iuF8A1vGEottVDbPbFbom9qW+21NsVMhnMtAhwSl8/BuAKSQi0zbuA7FM2l+I5
         hlpU+wXkNLLw79RoWJUZZ0aMW+c4BysFIEs0lcNCvA42xXUlqQ/lCOZmfDqqaqJY5+VL
         WTS1dYRQXcJ5YqH0YsWZOkP+VnnOlkzelm/kdy/E3W8jXfOEzxzQWaX+bidSbJkbXhMN
         hSaExYplkizmOfqsldVkWuFK4tTHxuC3CdYKWmWpxWfJ/cPIibW5ZhqVSKdWjMsJ0BLE
         xNkEMvFw4ow+lZ84fuRekrRTft84bt3jfBNnEiEN27sQqcFgR47qlF+wpvNeeiOiNRqp
         /xKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756468048; x=1757072848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQp6NWY2QTc4ozrR/xRG6ASSI6SHhnIsdKywX21k0ZQ=;
        b=TR8rJuGf5C5wL/shD+Ujww8N8f3hE3jDIxK1AV0V1lfCviasgpeEI0mmp2YIPWL/Z7
         FCAGiA5LIhICYLmpyUaM057qRdYPYzmolD3s2NIxnA1t5DWuz7fZFVIeUQ8+5ZHAi/4k
         uB3TStiJezuPdwcxhj/aj+9mucczFUkymHFDunfuFt8V42V2+5/klCjSR/8p4uhJKkp1
         Kgw/wH5FM2EOWXYhHmA//0oToIp8/itVvRh1aJum2mgcdN+CiVJQleP5fm6+Hkr3EGz8
         7Q43ugWhvx8kaZ3e8lWf4aY/T+eTs6BofYNYz/6LTiMOM1K2MKFGwNbN0u3zmOb5phTj
         Ja4w==
X-Forwarded-Encrypted: i=1; AJvYcCUChFN5wy3fhfqJIc6kpTJkmzxow4Y+db/yTraBN7q/59/2o56u5Xf8ROmTVaLJvdsHaPE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxB5gFxk4o9Dfw0OaKb9WigmO3nYndUKZ2IsE35t2bSKjK0eo8K
	GIx0pqvAQV19rT1XDSMtK27W0J8L4L1JcFwnevLDzg9z0Qo1OObXlxgxF701FZcP/Jw=
X-Gm-Gg: ASbGncsf/UMdULNimspTdbLljP8f8EfpxWS7cPDpn2BU1WFqkt1CkZtcTXEIYyebGNh
	m8nAXvcwLm6/82Rx3r+Kf+qHUVrXwn8fKhR03vyu7/lASasGRaBycK+ZkrywQny9hIGhrOlfPSk
	g6jCYRXWe09rezmWZIhFEcFgREKqaWPtwUsFXW0iqtRFd6KsfrKyYAoh+5TTnFDYHCQPqXsLufM
	85sZN855Gg1fsNx1v5UzH0gM/eLT7UGE2QpMuIqT0I7ik3oDmRit9H7RQ+ctQqLNywwKnMTRXBi
	hCs9enf2mU7oE91Rss/5n7yXs37kPGhWrO2yJrxT/XIZYOE76n8elfC4cbCFsZd6gbb+ds4C/5Z
	NyaZQXfD7FI/W1pH9ftTY7fWh2TXKbLX4VpB1HZqjSQ==
X-Google-Smtp-Source: AGHT+IH8KwfZBQ4nBA66UTh9TpCQ7FkF2eS86H/0NZMW3Kuh37xGLb484Nqj8yF/tw4ZGsIRDLeCUA==
X-Received: by 2002:a05:600c:19cd:b0:458:be62:dcd3 with SMTP id 5b1f17b1804b1-45b517c2fc0mr284031215e9.17.1756468048262;
        Fri, 29 Aug 2025 04:47:28 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7c461edasm29873255e9.9.2025.08.29.04.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 04:47:27 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 29 Aug 2025 12:46:46 +0100
Subject: [PATCH v5 4/7] spi: spi-fsl-dspi: Use non-coherent memory for DMA
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-james-nxp-spi-dma-v5-4-3246957a6ea9@linaro.org>
References: <20250829-james-nxp-spi-dma-v5-0-3246957a6ea9@linaro.org>
In-Reply-To: <20250829-james-nxp-spi-dma-v5-0-3246957a6ea9@linaro.org>
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
 drivers/spi/spi-fsl-dspi.c | 55 +++++++++++++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 20 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 0baf7e0608f2..17a29fde5f2d 100644
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
@@ -525,10 +538,9 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
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
@@ -543,10 +555,10 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
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
@@ -643,17 +655,17 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
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
@@ -688,11 +700,12 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
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
@@ -713,14 +726,16 @@ static void dspi_release_dma(struct fsl_dspi *dspi)
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

