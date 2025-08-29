Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F71314A96
	for <imx@lists.linux.dev>; Fri, 29 Aug 2025 11:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756468053; cv=none; b=NhbygN8DXfUgYP7z9H863He+YAq8D4vW/0YVkzLJKPBExEr4mXN9K9veE/+WPCEJ9oUx9JjGjrDXRhydu+NAZsFZnu4oDwwmJ56hkRwOkHPRdswkYJp12xu49Irf+Q3tef57UgO3zwmYyev28qLTtfzWy/Kp3OkDq3sM7owEQIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756468053; c=relaxed/simple;
	bh=DgsXUQfNQQ8H+1qKFk5FOqTs661FVobzz59TKt1pgdE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kvcngkAPgTFWkKyzBq3+wS2tnjZwm6nLRGM9gdJdSHthc57ZulXvlv5gkmoxTWMWM8okGSvhGlQBaL4sZQPwD4Zu/dMJ3rNW0bFYK/XzqiWe8RQuNBflejULgu6Z1dCD8jCMBDlTkd3AqJhMW/csltsdRKI7W5P/RaFemGoUQlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PQIcqByZ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PQIcqByZ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45a1b0c8867so17432375e9.3
        for <imx@lists.linux.dev>; Fri, 29 Aug 2025 04:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756468049; x=1757072849; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8OejD1btu1PABc+C65VmRFefF/pm146gBHhoS9D7UZE=;
        b=PQIcqByZhU2aQQIaLU6NtQpKIrkjinKLb36fRJzHGv598XvTfwKYdX96AVBrYnyWlK
         8MYX3gz07ztiIfzu3bHkAGXRQCe8Usn+nfAI48Yb2eNR0kfHJI9DBv5DTYg5GSkH9mbg
         4CjDLywsMJ4VTjVR9WoxrdQWdbuppIIJzlNtcLSj4HIox2rarMHy3O51tvreXnVTAYBR
         MQZg4Qm0stzuliKUqiRw/5f58Jm4uep0kkKoNSkYajSdfXkCoBY80hkpFDaV69/wwUZC
         cVzgNnLC4uqciXqM7xaxzzrQ+K9LS+vGgLrSgQESH00BGSbNqoHafCniYg/SrkRdvxkE
         01EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756468049; x=1757072849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8OejD1btu1PABc+C65VmRFefF/pm146gBHhoS9D7UZE=;
        b=maR2zAHdfgtpmuyub0RkEOU3txswSOGimCT2IePv+NFcmYoQ+oMVsqAJeSxispLPTA
         IARGFFDSWw+vP34P8ExVayoMV1Le8jR/ZjCr/VsZls0z4I0/k2bL62y5wD+q5hnCzvC2
         cOwNIirjshTckAEMRXOPjOQ3EtKjEVVCTgbqtP9gigXlnrM5t6zVY0/KYdxEtPMEmQA0
         w0UH1w/EIW5jyXW9nxdLtc/EmxE3myYn2Oj0XqpKnbDuu8gYY1m6a77q0rH0vFxQzIW8
         uj0RKeLPDJr2jFvIuxPrLNUBtXkYhKWkvD5FZPTtRJsa1h7tYL4qH8klzZJq6qtixUVP
         eWZA==
X-Forwarded-Encrypted: i=1; AJvYcCWT2A0kPyoZSIiO0dySSJmZUsh+/z0EOZSCXFgLKn0UGYyn4niWg5Nq//axLRe9lctpQHg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUbRWpjpHBeQU2RS8QIIGGGujcGmHUytZ83wo99ergR4d4Nwmf
	AcdMbZMOSTO9Oo/3U34Cq0rAIl7pigyo+U9Yn9ZLS1owYJjo8Fx3CFI26EFAnkCdEJM=
X-Gm-Gg: ASbGnct4+hCdUHKmEWZsqcu18yl6rDxckPQzBrgOvqnHfdgXq63B+LVmmPWiFGBg7wG
	Yhumk/1d03hPw1bHf6d7shzqWeOyfLjhu8+YqeqvCk76TIqTqYKtwDqmH4lm2EG8nFaKB+hQxq+
	9QCsCodiTIrmzaaCg92x5q9md7ad716IaMasiYNhbwD8VqZ3/LIsFkJd07orG5UnC802n0bQcvP
	amAqNnhrBVDzkt9L8RacmGwaesm1E1K2K2RmDu5ELM3gIAYptvI0G9NN9Chi6A48nuuG2fny84h
	SiqUjfFLbF3SlS9j9HaLMSMANZcEF948ScsXQ8IMz/IFoZYQX26vB4WKSPzhZdoqORdKtE/MyJu
	1Fmqxokj3db9i0zg4ssYRrVm85mBqUhtxfFQw6W+TUrr/a266qbAF
X-Google-Smtp-Source: AGHT+IGv3mKOogBfMIHLrJFf2PhjPggF9Nmps05p5PyCIOhszPit62W4D+H4HB3jJoTbneYXzEZDLg==
X-Received: by 2002:a05:600c:4a22:b0:45b:7580:6f29 with SMTP id 5b1f17b1804b1-45b75807bd4mr41966635e9.4.1756468049350;
        Fri, 29 Aug 2025 04:47:29 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7c461edasm29873255e9.9.2025.08.29.04.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 04:47:28 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 29 Aug 2025 12:46:47 +0100
Subject: [PATCH v5 5/7] spi: spi-fsl-dspi: Use whole page for DMA buffers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-james-nxp-spi-dma-v5-5-3246957a6ea9@linaro.org>
References: <20250829-james-nxp-spi-dma-v5-0-3246957a6ea9@linaro.org>
In-Reply-To: <20250829-james-nxp-spi-dma-v5-0-3246957a6ea9@linaro.org>
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
index 17a29fde5f2d..0e5f65d58342 100644
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
@@ -618,9 +638,8 @@ static void dspi_dma_xfer(struct fsl_dspi *dspi)
 		/* Figure out operational bits-per-word for this chunk */
 		dspi_setup_accel(dspi);
 
-		dspi->words_in_flight = dspi->len / dspi->oper_word_size;
-		if (dspi->words_in_flight > dspi->devtype_data->fifo_size)
-			dspi->words_in_flight = dspi->devtype_data->fifo_size;
+		dspi->words_in_flight = min(dspi->len / dspi->oper_word_size,
+					    dspi_dma_max_datawords(dspi));
 
 		message->actual_length += dspi->words_in_flight *
 					  dspi->oper_word_size;
@@ -635,7 +654,6 @@ static void dspi_dma_xfer(struct fsl_dspi *dspi)
 
 static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
 {
-	int dma_bufsize = dspi->devtype_data->fifo_size * 2;
 	struct device *dev = &dspi->pdev->dev;
 	struct dma_slave_config cfg;
 	struct fsl_dspi_dma *dma;
@@ -655,8 +673,10 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
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
@@ -664,7 +684,7 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
 	}
 
 	dma->rx_dma_buf = dma_alloc_noncoherent(dma->chan_rx->device->dev,
-						dma_bufsize, &dma->rx_dma_phys,
+						dma->bufsize, &dma->rx_dma_phys,
 						DMA_FROM_DEVICE, GFP_KERNEL);
 	if (!dma->rx_dma_buf) {
 		ret = -ENOMEM;
@@ -700,11 +720,11 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
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
@@ -719,21 +739,20 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
 
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

