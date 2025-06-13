Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0DB279DDE
	for <imx@lists.linux.dev>; Fri, 13 Jun 2025 09:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749806970; cv=none; b=YH6vEE5pmceH6otJTwF+X1QZ7/L31Fl9TBiZMpdDvnnMdjBLa+QC6X5cZmkhzQRCeMh3vDiMxTPhZoTebfwbPs5myrQgvmxPqQ1Uyvte/6WoDzGGSIvrwTqpxraiyazNZIeatFcPl404Kn4OWwqZRtmD9dbB/uc9taR2tZbudVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749806970; c=relaxed/simple;
	bh=CVwoRk0GER0LYrtRwOuy/VUCpYDZks7f+rhuuxXoALQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h8TGgSbAAtS7c+J78qleZWk2BH4M9z7CoWJhox9gNIbiR+vBKgaU5TOTUvqSS2PuGW7cQ3nBsZ2bre75YOVfvjursf90HE3a1qZ379hC2/Vm8JYuiSaMpK5dnauFLcY+5L1S1NV55F+/KXPD1jmPsirud2bGU+yVApLrPWGq0mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wzhE+wjc; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wzhE+wjc"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so1100032f8f.3
        for <imx@lists.linux.dev>; Fri, 13 Jun 2025 02:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749806965; x=1750411765; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6yB3v1heJMNnrfSWRvq2YsjasUe3fnLxNvvV0vI7w6w=;
        b=wzhE+wjc6G1n3KrolhKb8XGtqbKaaplOFL/+RcT49VFiCYEzZa2OI5LIhh8GEIIKSL
         vS8ZQvmmndHL3FagnMqQSfSSkarY2MN+3fsz1xK9fLbOkbPVmnggsaLZUnOsTXlhdvoq
         kY8B52AxPJuAAjWaEOExLx9bUiX9czeoyL2cr6H8NMK1E9OmCPMzI6cHp7+NIx1Ps2FP
         D0PYkLFH3py27A8hXgn3LVHYaF9iNXeKIMry5vb4fscaIP0Tqmirdo2gVgxAYVXf4kcJ
         7Lu5hB5RZ7RRGHc0j/CnD78p+0OnSqv2PMljbqIzN2Ov9cUO1U4JQTR7VlwFoWnqI0sJ
         sxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749806965; x=1750411765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6yB3v1heJMNnrfSWRvq2YsjasUe3fnLxNvvV0vI7w6w=;
        b=i4S19wOqnmYWA84OBTWYlTD4G30pYPbYE4Jcofa+50/YGrq56zl51T16sFRMJuLsp2
         HdbI2BxPrZg0szlagb/5Agi2wu2EkNX7I3j6EDEBOkNcPCbysfFiwR5cTugepVFLZZVS
         JeNyP+9BhQZf+rjYpAJzWvMrPPRzVVTHC0MEbjuKsRJIG6RqX93vXIbXLuohKTv/yES4
         +biPSih86b4ak96bd9JavFXA6bGLRATUUz6J9RUzwf+9o1SifS1/uQOKXKFBE9yadPUk
         7NK2gy4rT6eEfvbFKEUNj+z7FdmKhXL//FGNL2UZ4Y9WoGkW2Qot6bL08+rpqmcb7NrW
         YrNg==
X-Forwarded-Encrypted: i=1; AJvYcCWDpd7HF5lct4nBls5IOWRFnlZuje7dVnPoajTfU6y2qE4CAwxnREVLnH+a6mxLvsBUhyM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzpvxIm5sOdY8WDiRXLhU2cs1vwHpO3YSFJPsXqI0b/rJdMHfJY
	tRs4U/YZyNR+JHr1T8HGE7UQcey7KQqacPTYLyjmgqvNWNW/Yzyz0bvil1cZq3Noiac=
X-Gm-Gg: ASbGncvn80faG4iof6C2h5Pc/YxYOT0Fzrt5I3eXau/qsfYsaUhv+X1d9nemtP4gJ/b
	vFDu1nuA3F4apO3oMUluJntGPeF6aJczUME8Te62ny8DRaspVLArtN+NkZAIs7bfnx3qoxzP8V2
	BcX5pDaKtffDERKATM6z2oZpMeY99xRW+cOkYdbVvmmmoIqNmCFkCL5oAdCDzKzpGfbtL6ODQOm
	HsCdoAxrK64QKnqSFBO2QBIV91/F61yZ1pBkb0o9ZQc6y1WaDlQTNrgRh0iJdYGyMwPWEidkTr7
	OCV4CiIkjvAO534E0J8YmElB1e86UYhdb6wFf6opUMJTwAm4PhoQflk3x/kLvd6LUr2MHxA=
X-Google-Smtp-Source: AGHT+IHVoRas9OADbI1CexwPchRHvmKk79BDFD51FrhgWuPNDtOHfG14Xc4l+6ijC1aURbgK4Ow2vA==
X-Received: by 2002:a05:6000:310d:b0:3a4:f6bc:d6f1 with SMTP id ffacd0b85a97d-3a56866f804mr2073879f8f.14.1749806964790;
        Fri, 13 Jun 2025 02:29:24 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08a2bsm1805946f8f.62.2025.06.13.02.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 02:29:24 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 13 Jun 2025 10:28:58 +0100
Subject: [PATCH v2 3/5] spi: spi-fsl-dspi: Increase DMA buffer size
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-james-nxp-spi-dma-v2-3-017eecf24aab@linaro.org>
References: <20250613-james-nxp-spi-dma-v2-0-017eecf24aab@linaro.org>
In-Reply-To: <20250613-james-nxp-spi-dma-v2-0-017eecf24aab@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Arnd Bergmann <arnd@arndb.de>, Larisa Grigore <larisa.grigore@nxp.com>, 
 Frank Li <Frank.li@nxp.com>, linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
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
index f19404e10c92..48c2ebefcd4a 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -384,6 +384,39 @@ static int dspi_dma_transfer_size(struct fsl_dspi *dspi)
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
@@ -606,6 +639,7 @@ static void dspi_setup_accel(struct fsl_dspi *dspi);
 static int dspi_dma_xfer(struct fsl_dspi *dspi)
 {
 	struct spi_message *message = dspi->cur_msg;
+	int max_words = dspi_dma_max_datawords(dspi);
 	struct device *dev = &dspi->pdev->dev;
 	int ret = 0;
 
@@ -618,8 +652,8 @@ static int dspi_dma_xfer(struct fsl_dspi *dspi)
 		dspi_setup_accel(dspi);
 
 		dspi->words_in_flight = dspi->len / dspi->oper_word_size;
-		if (dspi->words_in_flight > dspi->devtype_data->fifo_size)
-			dspi->words_in_flight = dspi->devtype_data->fifo_size;
+		if (dspi->words_in_flight > max_words)
+			dspi->words_in_flight = max_words;
 
 		message->actual_length += dspi->words_in_flight *
 					  dspi->oper_word_size;
@@ -636,7 +670,7 @@ static int dspi_dma_xfer(struct fsl_dspi *dspi)
 
 static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
 {
-	int dma_bufsize = dspi->devtype_data->fifo_size * 2;
+	int dma_bufsize = dspi_dma_bufsize(dspi);
 	struct device *dev = &dspi->pdev->dev;
 	struct dma_slave_config cfg;
 	struct fsl_dspi_dma *dma;
@@ -720,7 +754,7 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
 
 static void dspi_release_dma(struct fsl_dspi *dspi)
 {
-	int dma_bufsize = dspi->devtype_data->fifo_size * 2;
+	int dma_bufsize = dspi_dma_bufsize(dspi);
 	struct fsl_dspi_dma *dma = dspi->dma;
 
 	if (!dma)

-- 
2.34.1

