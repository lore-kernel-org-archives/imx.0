Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8032874F7
	for <imx@lists.linux.dev>; Tue, 24 Jun 2025 10:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750761401; cv=none; b=JO51k6fgzd6UXBnrsBIxjIDIh5PXbhE6HTYlE9HTY+WPzW86JKZIe4soRHXqASBnUn2a2tj+Mu6poHFbm6Z004M6bFjJU9Jeujf3PO1QMVvkjQY87/u6Ur/KXemIIxdYWIDNcjc3ySOVGMzjGmRBIzWtTVn3XxpPwaLEdIjnJws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750761401; c=relaxed/simple;
	bh=EIo8UQEK9JJZo6Yr7HcjRb0uvfHj1dsrPEXzaMvaVcY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HFl1MPBSbJVF8W2fLr4Jl3W6V37n0ZZkzRhhe+iWjQanXEkCejUcoTb44POTubMrYdudnwH60w0bQTpn7RJV47IKuyX3ostaGjDmZ/bZ10buizXws7bY8oml1Q6P9nt0Jg82H2x87v7OdTpynRHU85YyHVOlZUHvuxSleLCkYH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lWZZQM/u; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lWZZQM/u"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451d7b50815so40761385e9.2
        for <imx@lists.linux.dev>; Tue, 24 Jun 2025 03:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750761397; x=1751366197; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yByveb+QWwpdlj6fZIGqjtAddBVVjLr6cg6k7hq9bAI=;
        b=lWZZQM/u2xqYFp2ftp2+IvLhCE9h53CwBo9+d/YdWtvUoxiwaA2NS17dx9IxYUT71K
         PA3X2Ul8O3N29PeOmGSS0LPD67xWzY8DodD994IsuobxM5bTO2Z3rFgQ3mdlVM1UQtwC
         7DbLLxDN2X5F5wPyc0Abef0YJMBMDxjoRqf8aq208BSSzWD3g8g0hoIumd+HKZczpZsE
         EdXPpPBQwE5t1js06B8QHr2VNRnZGrjrxsU0g6dmI4xPv6CPxAZGMYfEupAveZ8+XfM0
         LyckuNEyjTpFztn0q0FgrlWJUWu7JL2pjJc1xBxp+VkCxNBye6IwjXkO+DsoLe+PfoxN
         oBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750761397; x=1751366197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yByveb+QWwpdlj6fZIGqjtAddBVVjLr6cg6k7hq9bAI=;
        b=MaYdBkfGcBeFA30JRWeftjarMzGTaBJXbcs/tFAif/R1YXkasfSfe3/FkzFj9mz1sR
         HXO0whGdFTOBDZOKC3h7bNTLY4gKp6A1Gwrj8jUdCs0aqmrnWVHo35/blEjtfEsKtgxF
         Vg5zXX6suOmoeCzkMxK3+a54nFWb3ziiuF1sYz/V3MVihy4wknYAwa3kxcgvCt+j8Pfm
         BNiBaC2PI6jl8Ty+Xxj6no+NWJZwaB24/F2Dknohak3pzBJ6PRZo5Ej7HLyTh1Xh015D
         PK+T2HvwO3XGyV80G8VWGI49bUi+UxCuwE+5yMltmi1TL03Av6KuZ5nSeTTCQyOIKqAh
         u6uA==
X-Forwarded-Encrypted: i=1; AJvYcCUjp54mpCjd0dZ6FkBYmhz9pNqfl2js8xeFPPvhTHWZynvTxAI5O7rZ3DPLFUg0AXGezp0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1XMUCEYQKzpjbQ58pvgCzV6kv0izUkE0TCHureX8sexAbnlVg
	5PXG6HR2cXxFBJv+sqBfqYYtkrpLOL+aPKJnbcb96HYux74D2gLC6aElH6GWojmkNT1O9zrMbzX
	z8Ilg
X-Gm-Gg: ASbGncsmSQjkoucws2yV1QKylvRG09HZqW1ODdogBlzNpLqy79qBLvz4fRgrUdRd/ZA
	EENO8sOI3A1updtz8arfts9IOKA6Eu5TeYdAoyQMArhqgId85zSuv3dISn9zma3jTO1Uyl7YHYM
	j+PUJNr1sSBHX2weoXkmKMQGYnZOf5FZr0nrUB/ggduBtokaPALWQm/5ZsZXlQyPcdIpUXWAaEx
	Ic0AoYcWtH9tEUx1VX2FZk/TUdk/acunFHePoItxyVAWWn3st2chVz25m/wFAx1cjx2Q2Ctqmyi
	fFZjg2llAATzA7+Tmg90gbsDDaUsjy3RihRioU7uJAIXgHonGlbm4CPpiHXVDrlON3Otljs=
X-Google-Smtp-Source: AGHT+IGqtZC+OMEg/cbcuU0+L6AZE/rEDM43V21E/KLrSJ/Lz2QOXzGgEBVldY6JiMoNuXeRqoNsUw==
X-Received: by 2002:a05:6000:2308:b0:3a5:88cf:479c with SMTP id ffacd0b85a97d-3a6d12d52c5mr11376772f8f.30.1750761397115;
        Tue, 24 Jun 2025 03:36:37 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb641sm143398245e9.3.2025.06.24.03.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 03:36:36 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 24 Jun 2025 11:35:34 +0100
Subject: [PATCH v3 4/6] spi: spi-fsl-dspi: Use non-coherent memory for DMA
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-james-nxp-spi-dma-v3-4-e7d574f5f62c@linaro.org>
References: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
In-Reply-To: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
 Larisa Grigore <larisa.grigore@nxp.com>, Frank Li <Frank.li@nxp.com>, 
 Christoph Hellwig <hch@lst.de>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Using coherent memory here isn't functionally necessary. Because the
change to use non-coherent memory isn't overly complex and only a few
synchronization points are required, we might as well do it while fixing
up some other DMA issues.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 56 +++++++++++++++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 20 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 8212c4193536..172eb9929de1 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -492,11 +492,20 @@ static void dspi_push_rx(struct fsl_dspi *dspi, u32 rxdata)
 }
 
 #if IS_ENABLED(CONFIG_HAS_DMA)
+
+static int dspi_dma_transfer_size(struct fsl_dspi *dspi)
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
 
@@ -504,9 +513,13 @@ static void dspi_rx_dma_callback(void *arg)
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
@@ -516,6 +529,7 @@ static void dspi_rx_dma_callback(void *arg)
 
 static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 {
+	size_t size = dspi_dma_transfer_size(dspi);
 	struct device *dev = &dspi->pdev->dev;
 	struct fsl_dspi_dma *dma = dspi->dma;
 	int time_left;
@@ -524,10 +538,9 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
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
@@ -542,10 +555,10 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
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
@@ -642,17 +655,17 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
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
@@ -687,11 +700,12 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
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
@@ -712,14 +726,16 @@ static void dspi_release_dma(struct fsl_dspi *dspi)
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

