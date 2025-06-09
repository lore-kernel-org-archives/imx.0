Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B41A1D5CD1
	for <imx@lists.linux.dev>; Mon,  9 Jun 2025 15:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749483223; cv=none; b=g9SMJP7KNB3u++V3fGGvnDlg7PaVzEtyftxw4CNRL+KMMmg4RUkOrg2FLJKH7+k3tlRYLNmb9qm2wDjwQyriYeaHMI0aSDAZSrvKwI1V8FHIf4vkZ7P7pi07Hn/tvybgbqsLn1Optijo3j/4ukLx7g1HpYyO5PVMahef787th2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749483223; c=relaxed/simple;
	bh=F6E6vLhtiApLAfH7jVShsvhhng5Af5yfJYjmbaQ+dgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R1U6GF+NT7c3IPcX5pG7RO9w/xUNbiqmo6+yB4crr9zZZML1NnFEPq2WoRu4A43YACU2HfTukdzjkqBCCNyfNI/3tM6R6aBwf30UgdIAQ73Sq+fHCyh5Y7jPwjEBgtth/5n/8NPShnzpn2XNtIPqETuizoIlhrWN4YcV5i6ccLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FK9rrtVm; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FK9rrtVm"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450ce671a08so28062935e9.3
        for <imx@lists.linux.dev>; Mon, 09 Jun 2025 08:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749483220; x=1750088020; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VaezEOtMadWK56N6XyEFNb8rQwc+F+EkQ0Z25AB3jZ0=;
        b=FK9rrtVmMnAeQbH8Vrb/7lN70Mck4XXo8Dv722F67JYp0Q1kSDy/09Ja+le5sKEJbi
         VtVqllOF3zrzaS7X7DLV7NxCaBi7le1le8kvN7VqfJDMbmZ6azQyV8LBecEguF9SMDLk
         ypF8KAdS7tdi50vRkF/FsSvxJQOTO22OhVCrWW6dfySd/w2IpPig7+E1NFtKxJIMoQfH
         8CKPPgsqHUBv8eDZKDOAQkG0TZC/0lkYtznv4LKFznirolAUpATNWxWfIbCMnWdkoQ9x
         mp3K6/ht1k6ZYSqE6VxUhcQXJBruokE2wqnJ2mNvU9UaWNUC4EEFpcOfF4VUz6IOdjia
         5sCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749483220; x=1750088020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VaezEOtMadWK56N6XyEFNb8rQwc+F+EkQ0Z25AB3jZ0=;
        b=OstlyuD9f77Vh2z1kD7LuZZjbITpJcTVRPgDGrQE98hulVMtQ3btdhImbhGA3DWGS9
         ZboJn/YK7vdOfoTmlj7Tyg+M+Immb0RtV56EYMr65sgEwLUdpzHysvEiWGDbZEl2xoGF
         PoR7IkrSNLuKHyxB5Xk8x7K/zhy4F0JjO7wHJ8E1MMLsn87US8Qo//goHad2FlT5Z3G+
         ++kdP5bDRq8cwkxZ5hvmcwV0PhQZeGuwwPj1geGcfE/1hpEz2KUxqNOf+OE5jjZY1x3a
         YWLlr36kZd+xM1V/E0reO7SHOz3D9RLZMEQ8y99vv/QSo/gGi1Rw7v5CNrLI4NeJ9Fct
         2KEw==
X-Forwarded-Encrypted: i=1; AJvYcCXhV8WQQX3dBQP3wIvjWzC2B29gaeqNvt3rp3Y409CfqUNWt+uG2TaLL4qb8E5IENGfen4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwcUUXeDLiNHG+RxmCapteZ0D4mmUS4TbuP1tSSuUHa0+dp2Kru
	uUA3i7LyyeylWBnR8uYdBoxJ7G+x6lw/eXS/owYAYRNslVir19crd//Kojw07ai/tVc=
X-Gm-Gg: ASbGncvBrlZLC6Fp22OSSVjDVnMZD1yY5KO3UnVXd88y63HwDndFWQHAI2WRhqdLLMO
	sq7WuIQIl60YLJn9hLTavB621lyP2it+i1cdri/XzFJeGlSNYQg1SInwB9SjKkRp+SLPPO/l4nj
	elxa1q4cdRI0+9BKjKNgo5QOTPKRwhBQ13Em+eZ9qLlAaVwLgrARZNOWQN8v+YJzvjwQE5kVL9g
	JeK1rZlokcAtoiCTbh7mFe0RSV39zFyoFVhun8iSYm48ZhPmn+rY+F6mJhtjOlUHlPH/U5QgEZf
	LuJEfmtBXQx+n9RGi/oaKqGsTrH+3lv+GuCVrrs2qhm8qwY6NdgyTLeHZdQ5
X-Google-Smtp-Source: AGHT+IGepX0ZeTm1oK5PJISBe8xztrPlaGG53R1SqnZP9IkWg7qUfIiTimmLJeMPuicniaung+m3Wg==
X-Received: by 2002:a05:600c:45cf:b0:450:d5bf:6720 with SMTP id 5b1f17b1804b1-4520136edc0mr142853995e9.3.1749483219912;
        Mon, 09 Jun 2025 08:33:39 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452137277basm115728695e9.32.2025.06.09.08.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:33:39 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 09 Jun 2025 16:32:40 +0100
Subject: [PATCH 3/4] spi: spi-fsl-dspi: Increase DMA buffer size
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-james-nxp-spi-dma-v1-3-2b831e714be2@linaro.org>
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
In-Reply-To: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-spi@vger.kernel.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, 
 Larisa Grigore <larisa.grigore@nxp.com>
X-Mailer: b4 0.14.0

From: Larisa Grigore <larisa.grigore@nxp.com>

When the device is configured as a target, the host won't stop sending
data while we're draining the buffer which leads to FIFO underflows
and corruption.

Increase the DMA buffer size to the maximum words that edma can
transfer once to reduce the chance of this happening.

While we're here, also change the buffer size for host mode back to a
page as it was before commit a957499bd437 ("spi: spi-fsl-dspi: Fix
bits-per-word acceleration in DMA mode"). dma_alloc_noncoherent()
allocations are backed by a full page anyway, so we might as well use it
all.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 42 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 567632042f8f..e211e44e977f 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -252,6 +252,39 @@ static int dspi_dma_transfer_size(struct fsl_dspi *dspi)
 	return dspi->words_in_flight * DMA_SLAVE_BUSWIDTH_4_BYTES;
 }
 
+static int dspi_dma_bufsize(struct fsl_dspi *dspi)
+{
+	if (spi_controller_is_target(dspi->ctlr)) {
+		/*
+		 * In target mode we have to be ready to receive the maximum
+		 * that can possibly be transferred at once by EDMA without any
+		 * FIFO underflows. This is CITER * SSIZE, where SSIZE is a max
+		 * of 4 when transferring to a peripheral.
+		 */
+		return GENMASK(14, 0) * DMA_SLAVE_BUSWIDTH_4_BYTES;
+	}
+
+	return PAGE_SIZE;
+}
+
+static int dspi_dma_max_datawords(struct fsl_dspi *dspi)
+{
+	/*
+	 * Transfers look like this so we always use a full DMA word regardless
+	 * of SPI word size:
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
+	return dspi_dma_bufsize(dspi) / DMA_SLAVE_BUSWIDTH_4_BYTES;
+}
+
 static void dspi_native_host_to_dev(struct fsl_dspi *dspi, u32 *txdata)
 {
 	switch (dspi->oper_word_size) {
@@ -474,6 +507,7 @@ static void dspi_setup_accel(struct fsl_dspi *dspi);
 static int dspi_dma_xfer(struct fsl_dspi *dspi)
 {
 	struct spi_message *message = dspi->cur_msg;
+	int max_words = dspi_dma_max_datawords(dspi);
 	struct device *dev = &dspi->pdev->dev;
 	int ret = 0;
 
@@ -486,8 +520,8 @@ static int dspi_dma_xfer(struct fsl_dspi *dspi)
 		dspi_setup_accel(dspi);
 
 		dspi->words_in_flight = dspi->len / dspi->oper_word_size;
-		if (dspi->words_in_flight > dspi->devtype_data->fifo_size)
-			dspi->words_in_flight = dspi->devtype_data->fifo_size;
+		if (dspi->words_in_flight > max_words)
+			dspi->words_in_flight = max_words;
 
 		message->actual_length += dspi->words_in_flight *
 					  dspi->oper_word_size;
@@ -504,7 +538,7 @@ static int dspi_dma_xfer(struct fsl_dspi *dspi)
 
 static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
 {
-	int dma_bufsize = dspi->devtype_data->fifo_size * 2;
+	int dma_bufsize = dspi_dma_bufsize(dspi);
 	struct device *dev = &dspi->pdev->dev;
 	struct dma_slave_config cfg;
 	struct fsl_dspi_dma *dma;
@@ -588,7 +622,7 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
 
 static void dspi_release_dma(struct fsl_dspi *dspi)
 {
-	int dma_bufsize = dspi->devtype_data->fifo_size * 2;
+	int dma_bufsize = dspi_dma_bufsize(dspi);
 	struct fsl_dspi_dma *dma = dspi->dma;
 
 	if (!dma)

-- 
2.34.1

