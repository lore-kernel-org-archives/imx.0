Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E639298CAB
	for <imx@lists.linux.dev>; Fri, 27 Jun 2025 10:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019736; cv=none; b=B+19xYpMTRXaMFd6tAkpftfV5dwErBbVKnkqxxwLYNqC89J6k1a7wZROAUrEgYtWRSw6uLYUvwrld7/FnXGSESJTNFKXJWX49qv9N0DfkDbeqw45inSCjuV/GzgVnZVxkntBoGhR4z78NuO5sqxBDWCniGaKl5y3b0DVVcsPt9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019736; c=relaxed/simple;
	bh=A0AE7vMjvLEfs1Y6oPJLVtlkIxVVKUGc/kFuse+plRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mJP7g9WnBXYexam6f16kgPIri19tXshn23EISSxyQoFCgWCVKfYIajVNuv6D/g8ay/zhYUaTHJ6YefrcvD7xn0jeX7EqPDkP/OF/N+Rj3cByYGabqjhw79HFhHu2GP3V4MJU11qoYHIXOsR3RsAbkYXqLr3TiAAqT+hsKgQ35Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VJ7FL8vK; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VJ7FL8vK"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450cfb79177so10899635e9.0
        for <imx@lists.linux.dev>; Fri, 27 Jun 2025 03:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751019732; x=1751624532; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KzTUwfC3xNjPw5feWhh4vjqhcP0iCwezFStPDEpH0fM=;
        b=VJ7FL8vKhe5THLF6ELzOB0YvhD1tIOW5lxM+asn7W5c7LxnGortuFZOTm/uCdk0VOd
         G6Hzlux/lnjIZ+GRBk4irnVnmf2lss32a1Jk69N5HHHpHoR6uTWS9MdhdQPGvxN4jdpN
         INpPrIe64hIkWp9VHQOm2hiyrZZeToN0nBcOdg7fRKVslxKskVUQsqEOjBIug2S8V6z9
         z+gfshO/0FqImgJZWKgjKmO7VDrUWyJ4WI6bwBZywtevme5L8vRMy/T+Q/jeZtV2VeOp
         kLSLctx73Q+3zSf7eUUS84o8ZKLiiTVxpWdwMZyR9L9wlB+cjXmIZMvOylNOaar6qqZE
         y4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019732; x=1751624532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KzTUwfC3xNjPw5feWhh4vjqhcP0iCwezFStPDEpH0fM=;
        b=Hvu3hwiFNUnvFYpaHySwdojKOoFAueL7byZhFh28CVgkqvtMXeyD/gnfzpsHS5HeDa
         eIBCskBkggghqLL5QaGU23CsJTdM+aWodXD6/5HqFUW3/BghtlNcfFs5FjlOP+tjYGZC
         Emq+0Ml4tcDFOe7DWfDZ3BGY2ZpiJdlI0EcvU5fvcTLnPJselI7jqv4v4W9ru639uR2D
         9F92zgF/GuJkstDhf4Spcc1wOJYUMeBk8WoqbbZdB/pRUQLHr312pd3Jd1/eWDkjA9xO
         XGhrPeUsRli8aXlIMrygF2KW2S45OF8Kmpr6ueUw04po2PcdDEbh6lGkixvnw4cytO/9
         q+xw==
X-Forwarded-Encrypted: i=1; AJvYcCU5uwUsSVr9ELicn5EVNptNrqL/PvsAJzSr0xkrznky505mMnWsscBrOm3zdj2XqZo8X4Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOtkv5dKM7G3ppYYvsb2L2J03EKAxBB88/6fd/3rHNb4pRGwk3
	4WDlCXMfxeyCqkojZ4k9MCRxAtCnQy58EwolVERLlaclHeF50hYg8gKFOxUrVZ/sOwerXFLnveZ
	+26ar
X-Gm-Gg: ASbGnctpDxbJ9UTOo9L9Ld1Sig8dYnCX96B5GjIXctGOt/lif93U00ofnCIFHjke1XG
	cFjwwvV0hB+iZqahGimEZpGV4tU0xc/Gc7f8Z7WoQsgYCajQ1+dtmUIkQD2U8Y2TuklyKYYEuCU
	gTYN8VqY60tIEbORB2/hYZHvc+S+uv+SzhAf9IQzEPleQw3vCwStb/nfwPvrhCYS2S/HowA2W0W
	EtlEqvTt11res6wqQqjQu4n1krZymwtdmSXElnfqYIBFtdI7mzOW2K6uQBClmQ7r+1zGu8vtwVA
	6tixsMkAjVK6mms1W1NQs0TLpr0fEqMM+4rzGTq0FKELe4wrknBYEy474VJOr2ob9EdchQ0=
X-Google-Smtp-Source: AGHT+IFUDK62yhJ0rt2DuWwPnjIXpTSxvzqvb1fP76J3ZPniobq8nM9uTfBlDj2J/p+KBtN2CEHUkw==
X-Received: by 2002:a05:600c:458b:b0:450:b9c0:c7d2 with SMTP id 5b1f17b1804b1-45391b6b96dmr12054215e9.11.1751019731517;
        Fri, 27 Jun 2025 03:22:11 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a5599sm47250955e9.13.2025.06.27.03.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:22:11 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 27 Jun 2025 11:21:38 +0100
Subject: [PATCH v4 2/6] spi: spi-fsl-dspi: Store status directly in
 cur_msg->status
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-james-nxp-spi-dma-v4-2-178dba20c120@linaro.org>
References: <20250627-james-nxp-spi-dma-v4-0-178dba20c120@linaro.org>
In-Reply-To: <20250627-james-nxp-spi-dma-v4-0-178dba20c120@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
 Larisa Grigore <larisa.grigore@nxp.com>, Frank Li <Frank.li@nxp.com>, 
 Christoph Hellwig <hch@lst.de>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

This will allow us to return a status from the interrupt handler in a
later commit and avoids copying it at the end of
dspi_transfer_one_message(). For consistency make polling and DMA modes
use the same mechanism.

Refactor dspi_rxtx() and dspi_poll() to not return -EINPROGRESS because
this isn't actually a status that was ever returned to the core layer
but some internal state. Wherever that was used we can look at dspi->len
instead.

No functional changes intended.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 70 ++++++++++++++++++++++++----------------------
 1 file changed, 36 insertions(+), 34 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 4bd4377551b5..65567745fe9a 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -591,11 +591,10 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 
 static void dspi_setup_accel(struct fsl_dspi *dspi);
 
-static int dspi_dma_xfer(struct fsl_dspi *dspi)
+static void dspi_dma_xfer(struct fsl_dspi *dspi)
 {
 	struct spi_message *message = dspi->cur_msg;
 	struct device *dev = &dspi->pdev->dev;
-	int ret = 0;
 
 	/*
 	 * dspi->len gets decremented by dspi_pop_tx_pushr in
@@ -612,14 +611,12 @@ static int dspi_dma_xfer(struct fsl_dspi *dspi)
 		message->actual_length += dspi->words_in_flight *
 					  dspi->oper_word_size;
 
-		ret = dspi_next_xfer_dma_submit(dspi);
-		if (ret) {
+		message->status = dspi_next_xfer_dma_submit(dspi);
+		if (message->status) {
 			dev_err(dev, "DMA transfer failed\n");
 			break;
 		}
 	}
-
-	return ret;
 }
 
 static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
@@ -986,36 +983,40 @@ static void dspi_fifo_write(struct fsl_dspi *dspi)
 				dspi->progress, !dspi->irq);
 }
 
-static int dspi_rxtx(struct fsl_dspi *dspi)
+static void dspi_rxtx(struct fsl_dspi *dspi)
 {
 	dspi_fifo_read(dspi);
 
 	if (!dspi->len)
 		/* Success! */
-		return 0;
+		return;
 
 	dspi_fifo_write(dspi);
-
-	return -EINPROGRESS;
 }
 
-static int dspi_poll(struct fsl_dspi *dspi)
+static void dspi_poll(struct fsl_dspi *dspi)
 {
-	int tries = 1000;
+	int tries;
 	u32 spi_sr;
 
-	do {
-		regmap_read(dspi->regmap, SPI_SR, &spi_sr);
-		regmap_write(dspi->regmap, SPI_SR, spi_sr);
+	while (dspi->len) {
+		for (tries = 1000; tries > 0; --tries) {
+			regmap_read(dspi->regmap, SPI_SR, &spi_sr);
+			regmap_write(dspi->regmap, SPI_SR, spi_sr);
 
-		if (spi_sr & SPI_SR_CMDTCF)
-			break;
-	} while (--tries);
+			if (spi_sr & SPI_SR_CMDTCF)
+				break;
+		}
 
-	if (!tries)
-		return -ETIMEDOUT;
+		if (!tries) {
+			dspi->cur_msg->status = -ETIMEDOUT;
+			return;
+		}
 
-	return dspi_rxtx(dspi);
+		dspi_rxtx(dspi);
+	}
+
+	dspi->cur_msg->status = 0;
 }
 
 static irqreturn_t dspi_interrupt(int irq, void *dev_id)
@@ -1029,8 +1030,13 @@ static irqreturn_t dspi_interrupt(int irq, void *dev_id)
 	if (!(spi_sr & SPI_SR_CMDTCF))
 		return IRQ_NONE;
 
-	if (dspi_rxtx(dspi) == 0)
+	dspi_rxtx(dspi);
+
+	if (!dspi->len) {
+		if (dspi->cur_msg)
+			WRITE_ONCE(dspi->cur_msg->status, 0);
 		complete(&dspi->xfer_done);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -1060,7 +1066,6 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 	struct spi_device *spi = message->spi;
 	struct spi_transfer *transfer;
 	bool cs = false;
-	int status = 0;
 	u32 val = 0;
 	bool cs_change = false;
 
@@ -1120,7 +1125,7 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 				       dspi->progress, !dspi->irq);
 
 		if (dspi->devtype_data->trans_mode == DSPI_DMA_MODE) {
-			status = dspi_dma_xfer(dspi);
+			dspi_dma_xfer(dspi);
 		} else {
 			/*
 			 * Reinitialize the completion before transferring data
@@ -1134,15 +1139,12 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 
 			dspi_fifo_write(dspi);
 
-			if (dspi->irq) {
+			if (dspi->irq)
 				wait_for_completion(&dspi->xfer_done);
-			} else {
-				do {
-					status = dspi_poll(dspi);
-				} while (status == -EINPROGRESS);
-			}
+			else
+				dspi_poll(dspi);
 		}
-		if (status)
+		if (READ_ONCE(message->status))
 			break;
 
 		spi_transfer_delay_exec(transfer);
@@ -1151,7 +1153,8 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 			dspi_deassert_cs(spi, &cs);
 	}
 
-	if (status || !cs_change) {
+	dspi->cur_msg = NULL;
+	if (message->status || !cs_change) {
 		/* Put DSPI in stop mode */
 		regmap_update_bits(dspi->regmap, SPI_MCR,
 				   SPI_MCR_HALT, SPI_MCR_HALT);
@@ -1160,10 +1163,9 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 			;
 	}
 
-	message->status = status;
 	spi_finalize_current_message(ctlr);
 
-	return status;
+	return message->status;
 }
 
 static int dspi_set_mtf(struct fsl_dspi *dspi)

-- 
2.34.1

