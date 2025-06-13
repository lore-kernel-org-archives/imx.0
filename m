Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FCA291C15
	for <imx@lists.linux.dev>; Fri, 13 Jun 2025 09:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749806969; cv=none; b=Se8Wk6+qZxAq3narAaUylnoyhkfNJ6IqiFwLls1JHnP9EhmG54olOkeC0UjD6RkGGlK5tPeuIsanZr/W4LWwndcqubycbnffrsyn4dVdQCD0dM2LjWUDXj8QcFUoKnrfpcc21+CerkomXbII4QcwIbRUpYVy8c5OX7jTITZN9Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749806969; c=relaxed/simple;
	bh=IpiugmKeISWFulxh2X5eQ8UZ9sRsTCudX6TcsNfAcSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nb4KHe9fLfy257Vn3fG0ebwug3KbCyqW3GGQr5B3O+Fiz+ytmnYSZDJ/rrgjGMTbC7g+MELOMG+TKkaXiv5KD1ChVSMoFU0LU1XCy6jY7iLHKlHR4YsYB5HrlJaznBG3t6I/gKFK5qVJ8ZZXg24/CmVRa87qUkaj8IKfsHX3Jsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KwSlL3Ns; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KwSlL3Ns"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a54836cb7fso1199086f8f.2
        for <imx@lists.linux.dev>; Fri, 13 Jun 2025 02:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749806966; x=1750411766; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fn5/JVKHTwCL3l+YfCzsIlgtnvvih6BSTZZfVhworAw=;
        b=KwSlL3Ns3Vl7nvtvXm/CRuQ8VBxGaWsE3kuWt8DpXzSxk0kq50wH+Pt7OhAvh36B2P
         iKPQSXBioXDG8aKFiNccA9t46l/kwJPT2SYpJs2urFJQk9H+pkqy4NHwVALi9Hjjtu/M
         lZodj95mslR8aOassw53JK+VykpdKNFcqrO3d9g4n13kopW7Q5elinCMjeW6HPHKbvhh
         J0/Pf0qEgbfdW412XMDFeSJRAVV3N6tg4NKWh+WPenCwx4T4T7wJ/KLWwf4tTHvD69+C
         WvJaqdAuEA0bRH0vEmbE8MNzKo1sgzR4YKj63Z7qm47iIJMA9EUFZY/v0D5GU08Kdb1F
         PIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749806966; x=1750411766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fn5/JVKHTwCL3l+YfCzsIlgtnvvih6BSTZZfVhworAw=;
        b=K+HjgVoehKYqtokv9ujBq7DEMpNjDbFM2P9j2JxWYNlzZQSWiXr2d/rSqnoGmIEpBa
         VN5DzjiMBgsWncIDD30Oz1XngVTGJ3jPiDP4gPmr/bxrbDUSzvDRuCCkjQ+Z4QKePuzD
         cv3I/0CFw/YF3SUcoDoSLJVrLHYHvaDNhLoncjsg6fKGDA9/MMO73Bf8I+SIymiJC54m
         +jqM12h5y2epMavpGNhuESUMKucNXbHpynEnehkorWOQYIyOMxTMmWJbiuZ9U4kYv2u1
         jVEKjUDyzs70Sw2xPwiFQAGLmdy+E9Jl2PHPeUA9+/Z1/VDheirdlyXV+wqNxhzcjX6u
         eGyA==
X-Forwarded-Encrypted: i=1; AJvYcCWfrqBawAAIb0YB6QisCJE1BKSP7ScoJyOlW12ajErmxUKFKXVv3EsLdSfFCgYHXCj+DbY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn8AZ1uu0zP84X9NJ22PtCj/uwxB6RlPUuCKYwOVl05pRQfP/i
	WoMIDXNBT7qIDBtRLPurDHYTCl5AXb3RiQiaX8p4jSuC66xExS6BbxqaRF6kQ14m+hc=
X-Gm-Gg: ASbGncv/6LvxKRKbcx5hc2KlxQvZotdwzkWVPdGVEGMUhkHIG0pXEJ6EkCHRoJK4ULC
	nLGm79yvk5ss1S6eBIahQrFcR3itwbRuSYJOAiGsMIF4hWanBHt8H33YeUzl+GoT10L99aS7d5s
	vstcYxjWY8HEhXSfxsQG/+alZHrJXr9Rzj3Nz6KBtNZv6aAi04msRu7el+yNy2p6V0KkteE/Cfn
	yLXOfERFEa1/3Xy/3EgNv2NCTBMvnW0xEHp+NVRPzxg7Dsiwwob8lu0UHls90DeIzlqB8fpoD6e
	n/VRuTQvkZ9MV4LcLtwtbdPIi5TgV2mGsBnA4cRre5SQDKVsZiibIRiOg2l6WbQPslwG9I4J50h
	CYoL6DA==
X-Google-Smtp-Source: AGHT+IHTciO5qAtRfmmfRqhZoob18Wulxbnle++H7sYpmrlbCjBtBvPBK8JLtufPhbTAKQK+IlGULA==
X-Received: by 2002:a05:6000:26d3:b0:3a4:e393:11e2 with SMTP id ffacd0b85a97d-3a56875776bmr2282133f8f.34.1749806965768;
        Fri, 13 Jun 2025 02:29:25 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08a2bsm1805946f8f.62.2025.06.13.02.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 02:29:25 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 13 Jun 2025 10:28:59 +0100
Subject: [PATCH v2 4/5] spi: spi-fsl-dspi: Store status directly in
 cur_msg->status
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-james-nxp-spi-dma-v2-4-017eecf24aab@linaro.org>
References: <20250613-james-nxp-spi-dma-v2-0-017eecf24aab@linaro.org>
In-Reply-To: <20250613-james-nxp-spi-dma-v2-0-017eecf24aab@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Arnd Bergmann <arnd@arndb.de>, Larisa Grigore <larisa.grigore@nxp.com>, 
 Frank Li <Frank.li@nxp.com>, linux-spi@vger.kernel.org, imx@lists.linux.dev, 
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
 drivers/spi/spi-fsl-dspi.c | 68 ++++++++++++++++++++++++----------------------
 1 file changed, 35 insertions(+), 33 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 48c2ebefcd4a..31432d533dea 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -636,12 +636,11 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 
 static void dspi_setup_accel(struct fsl_dspi *dspi);
 
-static int dspi_dma_xfer(struct fsl_dspi *dspi)
+static void dspi_dma_xfer(struct fsl_dspi *dspi)
 {
 	struct spi_message *message = dspi->cur_msg;
 	int max_words = dspi_dma_max_datawords(dspi);
 	struct device *dev = &dspi->pdev->dev;
-	int ret = 0;
 
 	/*
 	 * dspi->len gets decremented by dspi_pop_tx_pushr in
@@ -658,14 +657,12 @@ static int dspi_dma_xfer(struct fsl_dspi *dspi)
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
@@ -1035,36 +1032,40 @@ static void dspi_fifo_write(struct fsl_dspi *dspi)
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
 	int tries = 1000;
 	u32 spi_sr;
 
-	do {
-		regmap_read(dspi->regmap, SPI_SR, &spi_sr);
-		regmap_write(dspi->regmap, SPI_SR, spi_sr);
+	while (dspi->len) {
+		do {
+			regmap_read(dspi->regmap, SPI_SR, &spi_sr);
+			regmap_write(dspi->regmap, SPI_SR, spi_sr);
 
-		if (spi_sr & SPI_SR_CMDTCF)
-			break;
-	} while (--tries);
+			if (spi_sr & SPI_SR_CMDTCF)
+				break;
+		} while (--tries);
 
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
@@ -1078,8 +1079,13 @@ static irqreturn_t dspi_interrupt(int irq, void *dev_id)
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
@@ -1109,7 +1115,6 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 	struct spi_device *spi = message->spi;
 	struct spi_transfer *transfer;
 	bool cs = false;
-	int status = 0;
 	u32 val = 0;
 	bool cs_change = false;
 
@@ -1169,7 +1174,7 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 				       dspi->progress, !dspi->irq);
 
 		if (dspi->devtype_data->trans_mode == DSPI_DMA_MODE) {
-			status = dspi_dma_xfer(dspi);
+			dspi_dma_xfer(dspi);
 		} else {
 			/*
 			 * Reset completion counter to clear any extra
@@ -1182,15 +1187,12 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 
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
@@ -1199,7 +1201,8 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 			dspi_deassert_cs(spi, &cs);
 	}
 
-	if (status || !cs_change) {
+	dspi->cur_msg = NULL;
+	if (message->status || !cs_change) {
 		/* Put DSPI in stop mode */
 		regmap_update_bits(dspi->regmap, SPI_MCR,
 				   SPI_MCR_HALT, SPI_MCR_HALT);
@@ -1208,10 +1211,9 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
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

