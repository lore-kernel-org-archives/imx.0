Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0E720FAA9
	for <imx@lists.linux.dev>; Mon,  9 Jun 2025 15:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749483225; cv=none; b=DkuLqRXaoG2h4gpyvPPUhQ09vS1GqYWy5eMVgNUNiBCkqULg2PWf1a9MfG+5aLEpqvxVqLWzdc77v5sV/5EdEOkZT7cxhtd5v2RNn1hnTJo5A1JN+HQ6gdHIjkZssXD7hnvRebit4abcp4d6fQuwMsq6Sprxp4gJjoD1UWdHnkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749483225; c=relaxed/simple;
	bh=rSD3V0AZT5bLu6rMQRRnpLdBVVlg+XpF/h6tXK3/+rA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=otFF8y0H6unVZVl1TE6GlMcNBmPOgOap37tH2V31jwMss9tRC4NAqchTJL/CnqNko9jgoJRcN8LAJ9Hau62adUeIZdp45qw5IoT16JvMeu6pOJgYDjDtXCiak34P2ongdM1nsQlKGx2oV01PTgK2SGeBttMch4UVnKnuf5/w8x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dAI4QTHl; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dAI4QTHl"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a376ba6f08so2467702f8f.1
        for <imx@lists.linux.dev>; Mon, 09 Jun 2025 08:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749483221; x=1750088021; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T2evMSgmcTfKpLULhAcIQOum0d8EQihiDCpbd2Ef3t8=;
        b=dAI4QTHlttq+47ZQ5hoe6bO2S1kyOVDWRfDf7Hy/sYup9pL8ifm7riQJi1rPPgEQWB
         NRB8Kcocl09qlrWs2PJPblWPP+NijB8fr7It6B69DnRboqD9DBDb8l31TeNkfaNphELe
         WOSJz+xgtPtkNpV7uFzZUPSMbDzQcbxb99VWeigimgvyIGMuVoi4gDQ04abk4VxK/ja2
         AOKrDgc3e5CqFInkdfhZ1L/QoO+eie0gRib4C7AcO3vO2ziZKrnerN7SZwcn9l1dYn5V
         NMd1dL2sUFwseSIxn6bGpeCem8+j33rMKtnm8c7ugXlXIXx3z9Bi0vlCxcX0H+2DsK2s
         DFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749483221; x=1750088021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2evMSgmcTfKpLULhAcIQOum0d8EQihiDCpbd2Ef3t8=;
        b=mhyTfgpsjXKbgAhoV3KlzYrkiXhsnrAAI/ZQltkLDP94arbuoiwvv2/B+Bsh5lLKZV
         I0T3IL6ZhLSscyo0O9y+33vOrNowyNoNM997HYpjKyfUaup697rR19F45YSEOZ0ig8VB
         Pf4pV3m6gMnL5NT0XY/hdzDFLq6XxChoabnlHTh2MkrI4trWdEESCPWt4k4Tok7xuIR+
         wYrO2FZwlBKfzRespiu6LbZucofyqdkasaVFhc0pjcvu0fkvW5AKVVObby0o9aZiqDKm
         KcSoJr8kgYkuZwb7S0WFzLXg48jolv6QeRkIPZYEpd/0l/ffnTFcTHryPXdSG9d4CJMJ
         ZZ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUryddHWWLy5ouokVF1MkIjQoehCAmTGsSWMu7cBjYxJO44uzNserTNm1IXMxvw0xfB7os=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx296xbGX24zG/XOTmQpG4uSlq6ZV6LR1pli9OeVqpETdouOIaD
	+l+/KW+3X8661LXlKKaJ5FxFkFr4ETdh9ZCOcEJPMlXlIy/6n/wzO7Wk5U47ahoCumw=
X-Gm-Gg: ASbGncs9Pv8ST7sNNT6Pr5fi+vWIKhY4kSpk8ik9wSDCd5VKcx/LOhbqvXXG6yr5HWY
	uYb10Dc0pov3+92fqjMJFaBAqGJ/fXR6qrz65JMVFFWhkbrM83M73LQ2BbIHJV+DxLIQ9DfTQv0
	zkGUPDwT8pVGf7xmMildErjC0FXpAX2xy3hjX5MVEC0R6/4BgrvqS//2cvk5EFVVKaLW/WgJaOv
	um9nUqgrNdbSX30+DP7wUQphNEZtTWLOMVbhn0HnljuuTlbvCESPA1Dm03eSBgz0Y/TFKgzRp/c
	l6LgqusL9Py+GlCFHbfB4opeSvWjyY2S5DuMzE9xpwAU8r7iisMHNH3JKK0ewE6K76hfpyg=
X-Google-Smtp-Source: AGHT+IHBXdZ7nRsdTP/ieOD8Dsk48GSLcaI+CHSrivHzqKwnQ4+fdPwvoxNtjRK48GGMl4ok4emrhw==
X-Received: by 2002:a05:6000:2411:b0:3a4:dfaa:df8d with SMTP id ffacd0b85a97d-3a53168448amr10210931f8f.9.1749483220742;
        Mon, 09 Jun 2025 08:33:40 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452137277basm115728695e9.32.2025.06.09.08.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:33:40 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 09 Jun 2025 16:32:41 +0100
Subject: [PATCH 4/4] spi: spi-fsl-dspi: Report FIFO overflows as errors
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-james-nxp-spi-dma-v1-4-2b831e714be2@linaro.org>
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
In-Reply-To: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-spi@vger.kernel.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

In target mode, the host sending more data than can be consumed would be
a common problem for any message exceeding the FIFO or DMA buffer size.
Cancel the whole message as soon as this condition is hit as the message
will be corrupted.

Only do this for target mode in a DMA transfer because we need to add a
register read. In IRQ and polling modes always do it because SPI_SR was
already read and it might catch some host mode programming/buffer
management errors too.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index e211e44e977f..75767d756496 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -228,6 +228,7 @@ struct fsl_dspi {
 	const struct fsl_dspi_devtype_data	*devtype_data;
 
 	struct completion			xfer_done;
+	int                                     xfer_status;
 
 	struct fsl_dspi_dma			*dma;
 
@@ -504,12 +505,22 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 
 static void dspi_setup_accel(struct fsl_dspi *dspi);
 
+static bool dspi_is_fifo_overflow(struct fsl_dspi *dspi, u32 spi_sr)
+{
+	if (spi_sr & (SPI_SR_TFUF | SPI_SR_RFOF)) {
+		dev_err(&dspi->pdev->dev, "FIFO under/overflow");
+		return true;
+	}
+	return false;
+}
+
 static int dspi_dma_xfer(struct fsl_dspi *dspi)
 {
 	struct spi_message *message = dspi->cur_msg;
 	int max_words = dspi_dma_max_datawords(dspi);
 	struct device *dev = &dspi->pdev->dev;
 	int ret = 0;
+	u32 spi_sr;
 
 	/*
 	 * dspi->len gets decremented by dspi_pop_tx_pushr in
@@ -531,6 +542,12 @@ static int dspi_dma_xfer(struct fsl_dspi *dspi)
 			dev_err(dev, "DMA transfer failed\n");
 			break;
 		}
+
+		if (spi_controller_is_target(dspi->ctlr)) {
+			regmap_read(dspi->regmap, SPI_SR, &spi_sr);
+			if (dspi_is_fifo_overflow(dspi, spi_sr))
+				return -EIO;
+		}
 	}
 
 	return ret;
@@ -918,6 +935,8 @@ static int dspi_poll(struct fsl_dspi *dspi)
 		regmap_read(dspi->regmap, SPI_SR, &spi_sr);
 		regmap_write(dspi->regmap, SPI_SR, spi_sr);
 
+		if (dspi_is_fifo_overflow(dspi, spi_sr))
+			return -EIO;
 		if (spi_sr & SPI_SR_CMDTCF)
 			break;
 	} while (--tries);
@@ -939,8 +958,12 @@ static irqreturn_t dspi_interrupt(int irq, void *dev_id)
 	if (!(spi_sr & SPI_SR_CMDTCF))
 		return IRQ_NONE;
 
-	if (dspi_rxtx(dspi) == 0)
+	if (dspi_is_fifo_overflow(dspi, spi_sr)) {
+		WRITE_ONCE(dspi->xfer_status, -EIO);
+		complete(&dspi->xfer_done);
+	} else if (dspi_rxtx(dspi) == 0) {
 		complete(&dspi->xfer_done);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -1032,13 +1055,15 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 		if (dspi->devtype_data->trans_mode == DSPI_DMA_MODE) {
 			status = dspi_dma_xfer(dspi);
 		} else {
-			if (dspi->irq)
+			if (dspi->irq) {
+				WRITE_ONCE(dspi->xfer_status, 0);
 				reinit_completion(&dspi->xfer_done);
-
+			}
 			dspi_fifo_write(dspi);
 
 			if (dspi->irq) {
 				wait_for_completion(&dspi->xfer_done);
+				status = READ_ONCE(dspi->xfer_status);
 			} else {
 				do {
 					status = dspi_poll(dspi);

-- 
2.34.1

