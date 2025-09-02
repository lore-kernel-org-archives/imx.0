Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F002D9ECA
	for <imx@lists.linux.dev>; Tue,  2 Sep 2025 12:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817175; cv=none; b=sigRAnQi+Gya2gMV7ZLx9LLMQnuazl4kSfR9fjKlWZEhHo9qROCFHQcvLiOhPVtbjY/dFANka/fsYVEoEobHbDd7amGdodoE8Gz7W9GPXkR3GlyO6v/ibCEPujY0nc9SzHiTg3P7EW9NUY4GCTtwiNMeavCy+F9EKDIIGirHuyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817175; c=relaxed/simple;
	bh=v/uxCKJdP+2z/SZsRX7qf7nC3a/OLUNE6hFHvBrITqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eCDXfYZtiQkCrf0S3r5gNHkKmctoGpekHwugkIFnSpjwbXATGbu/DJyDgRaJ9yvxg2+7douhrtoM4IKWrOFeGw+05Y8w8zEhCo7ZbHjaILDGh6UtlnlIA2DWv6xmHafWOqPk3ZlK4FwDUZYgW2zy9SLcfPuOMrG+yJX+g582iMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v/pMS+MB; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v/pMS+MB"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3da9ad0c1f4so439352f8f.3
        for <imx@lists.linux.dev>; Tue, 02 Sep 2025 05:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756817171; x=1757421971; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zO3e10lREs9p/eEtCUsOWQlh8TKJIiFbHYmIoKfi80M=;
        b=v/pMS+MB9jSiNWZDLky+8dNXeNyAdCC6xHb1zWqudvl6jJu9XLD5gnwBGmI/zu5hBB
         xzrVFlZDcFlCrg16M8VgLqYHEiOz8UVwvAWh+AS73wQGTaHI7PJkUMh+cg0k7U53psot
         OVuL/rZR9V73msX1N6kR0GwYe9nqRCEdYMmT1S/mjsIx2Mf8+AdG6tZZ1JAcjsG6/LH1
         vctKVWr6F1sa/t6RQvMnxpo0j4ZXKVbWHywSuCcrjRe67eBSykvIhU/5PvZYTbwXyhZu
         K+wNGs9ypzeBWmEuY6Jm3nl9OVLXi7dPsQDR1xYfE7h+hG5bbU6CPqEtJ9rTfy99zHv1
         Jr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756817171; x=1757421971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zO3e10lREs9p/eEtCUsOWQlh8TKJIiFbHYmIoKfi80M=;
        b=Q1PTIAY2Xa9Vwp9BN0rQJ6fQrOYw512Xqy3s4mZZPt0EDC4ej7v6mfPEglGz03pPfW
         6bx2avrNO1fgWmb9hHDtwYFmRoniGSYspdOkQGA5w2IP3y9PO2UF74z87Vkg61UTbh2t
         9L9aUy6ihd2K9LGuJT3+iZzdcu+vdGWOxkSEaqda0te6oj03nFLs4efruIS66HEI2k0e
         H1/tWNCIUMpFg6uqlkWGi9GQxTGvISzdWeWB0he5bwmtBQ8/pxmL6d0BXhw2SzEHimPe
         6aOxPd72Ht5PsYr4LN2MHT7SPhcBt0jA9YgwXBDvARaMc6Zvve9x8rVK1AXCb3oxaSH3
         87ng==
X-Forwarded-Encrypted: i=1; AJvYcCU1U9PCggiT0xVEKHGB88dW+0bwko39XIpcx5K3AtWFIwZgfD9eUijTDYyNCcrj1cj2KRg=@lists.linux.dev
X-Gm-Message-State: AOJu0YytA7BR5N05wFlspCHt7nK08n1Gi+NQ9kDnwfn6t899ABw+NoM/
	PIUhFX5fUewdIVxwuSE2eqRV1ERsqrc5QdxN/WNXhQy9P3+OZnXPy9exULEAEfpo2Hk=
X-Gm-Gg: ASbGncu5M32k9h9PwDSw7Fhs11qz9jiljefwiTC+BdDVJoaMdH8l0h8Zn89Jbch3GB3
	FWglUzgNZgnDJYHfQsT/pCo46VuR2nP/PHhfocvPjSGJGsPRknxFbEF7pqboclgd8qMPs0ycu4l
	8qXRIp5qIwcxQ9dBJL0t4GDnEEN688248Snlrd16b1vC85E1wYEta8XrFfFMxTqOpUFxwwPWe5C
	moBhOVwx+6lB2hGeMJZyTZ4dytcKD2gBpCq6EaRUa3MMg0k7OIiHZdIaVkFTTSejWqw7FLi45sa
	eYiEx6bDDFT4Ve+ciXHoDVddAoefM+8CYFG9mupa4nYjkd14Et2qScxAV1MFlmOR1J73xtGzw2v
	2aN37eGUEA6U4ybxqmrkE3CFjKZ3T63u56EEXcfyfRA==
X-Google-Smtp-Source: AGHT+IFBOztEmu3TQb+b78WlUZhWND4Jix1WfelrhLf0L9O3+fhi7YgD88/+Eg01QZasQk34F4HsBA==
X-Received: by 2002:a05:6000:2112:b0:3d2:6129:5505 with SMTP id ffacd0b85a97d-3d261295a85mr7852150f8f.36.1756817171365;
        Tue, 02 Sep 2025 05:46:11 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf275d2717sm19589896f8f.15.2025.09.02.05.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:46:10 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 02 Sep 2025 13:44:57 +0100
Subject: [PATCH v6 5/7] spi: spi-fsl-dspi: Use whole page for DMA buffers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-james-nxp-spi-dma-v6-5-f7aa2c5e56e2@linaro.org>
References: <20250902-james-nxp-spi-dma-v6-0-f7aa2c5e56e2@linaro.org>
In-Reply-To: <20250902-james-nxp-spi-dma-v6-0-f7aa2c5e56e2@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
 Larisa Grigore <larisa.grigore@nxp.com>, Frank Li <Frank.li@nxp.com>, 
 Christoph Hellwig <hch@lst.de>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

dma_alloc_noncoherent() allocations are backed by a full page anyway, so
use it all.

VF610 devices used to use the full page before commit a957499bd437
("spi: spi-fsl-dspi: Fix bits-per-word acceleration in DMA mode"), but
others still used the FIFO size. After that commit, all devices used the
FIFO size. Now all devices use the full page.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 41 ++++++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 81d1e4470f94..6bf87ef01c13 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -331,6 +331,8 @@ struct fsl_dspi_dma {
 	dma_addr_t				rx_dma_phys;
 	struct completion			cmd_rx_complete;
 	struct dma_async_tx_descriptor		*rx_desc;
+
+	size_t					bufsize;
 };
 
 struct fsl_dspi {
@@ -493,6 +495,24 @@ static u32 dspi_pop_tx_pushr(struct fsl_dspi *dspi)
 	return cmd << 16 | data;
 }
 
+static size_t dspi_dma_max_datawords(struct fsl_dspi *dspi)
+{
+	/*
+	 * Transfers look like one of these, so we always use a full DMA word
+	 * regardless of SPI word size:
+	 *
+	 * 31              16 15                   0
+	 * -----------------------------------------
+	 * |   CONTROL WORD  |     16-bit DATA     |
+	 * -----------------------------------------
+	 * or
+	 * -----------------------------------------
+	 * |   CONTROL WORD  | UNUSED | 8-bit DATA |
+	 * -----------------------------------------
+	 */
+	return dspi->dma->bufsize / DMA_SLAVE_BUSWIDTH_4_BYTES;
+}
+
 static size_t dspi_dma_transfer_size(struct fsl_dspi *dspi)
 {
 	return dspi->words_in_flight * DMA_SLAVE_BUSWIDTH_4_BYTES;
@@ -620,9 +640,8 @@ static void dspi_dma_xfer(struct fsl_dspi *dspi)
 		/* Figure out operational bits-per-word for this chunk */
 		dspi_setup_accel(dspi);
 
-		dspi->words_in_flight = dspi->len / dspi->oper_word_size;
-		if (dspi->words_in_flight > dspi->devtype_data->fifo_size)
-			dspi->words_in_flight = dspi->devtype_data->fifo_size;
+		dspi->words_in_flight = min(dspi->len / dspi->oper_word_size,
+					    dspi_dma_max_datawords(dspi));
 
 		message->actual_length += dspi->words_in_flight *
 					  dspi->oper_word_size;
@@ -637,7 +656,6 @@ static void dspi_dma_xfer(struct fsl_dspi *dspi)
 
 static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
 {
-	int dma_bufsize = dspi->devtype_data->fifo_size * 2;
 	struct device *dev = &dspi->pdev->dev;
 	struct dma_slave_config cfg;
 	struct fsl_dspi_dma *dma;
@@ -657,8 +675,10 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
 		goto err_tx_channel;
 	}
 
+	dma->bufsize = PAGE_SIZE;
+
 	dma->tx_dma_buf = dma_alloc_noncoherent(dma->chan_tx->device->dev,
-						dma_bufsize, &dma->tx_dma_phys,
+						dma->bufsize, &dma->tx_dma_phys,
 						DMA_TO_DEVICE, GFP_KERNEL);
 	if (!dma->tx_dma_buf) {
 		ret = -ENOMEM;
@@ -666,7 +686,7 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
 	}
 
 	dma->rx_dma_buf = dma_alloc_noncoherent(dma->chan_rx->device->dev,
-						dma_bufsize, &dma->rx_dma_phys,
+						dma->bufsize, &dma->rx_dma_phys,
 						DMA_FROM_DEVICE, GFP_KERNEL);
 	if (!dma->rx_dma_buf) {
 		ret = -ENOMEM;
@@ -702,11 +722,11 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
 	return 0;
 
 err_slave_config:
-	dma_free_noncoherent(dma->chan_rx->device->dev, dma_bufsize,
+	dma_free_noncoherent(dma->chan_rx->device->dev, dma->bufsize,
 			     dma->rx_dma_buf, dma->rx_dma_phys,
 			     DMA_FROM_DEVICE);
 err_rx_dma_buf:
-	dma_free_noncoherent(dma->chan_tx->device->dev, dma_bufsize,
+	dma_free_noncoherent(dma->chan_tx->device->dev, dma->bufsize,
 			     dma->tx_dma_buf, dma->tx_dma_phys, DMA_TO_DEVICE);
 err_tx_dma_buf:
 	dma_release_channel(dma->chan_tx);
@@ -721,21 +741,20 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
 
 static void dspi_release_dma(struct fsl_dspi *dspi)
 {
-	int dma_bufsize = dspi->devtype_data->fifo_size * 2;
 	struct fsl_dspi_dma *dma = dspi->dma;
 
 	if (!dma)
 		return;
 
 	if (dma->chan_tx) {
-		dma_free_noncoherent(dma->chan_tx->device->dev, dma_bufsize,
+		dma_free_noncoherent(dma->chan_tx->device->dev, dma->bufsize,
 				     dma->tx_dma_buf, dma->tx_dma_phys,
 				     DMA_TO_DEVICE);
 		dma_release_channel(dma->chan_tx);
 	}
 
 	if (dma->chan_rx) {
-		dma_free_noncoherent(dma->chan_rx->device->dev, dma_bufsize,
+		dma_free_noncoherent(dma->chan_rx->device->dev, dma->bufsize,
 				     dma->rx_dma_buf, dma->rx_dma_phys,
 				     DMA_FROM_DEVICE);
 		dma_release_channel(dma->chan_rx);

-- 
2.34.1

