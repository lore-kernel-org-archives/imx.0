Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BC0314B82
	for <imx@lists.linux.dev>; Fri, 29 Aug 2025 11:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756468056; cv=none; b=phReYWuZw8i0kwVLKc0zAUOiMY9Js5nbZTtnVSiPV77KNvx3hX/xAKA6pgcJMWIJyZ1bq6vTqxPCMltlz1rgqu90wIi6AXrV4SULhOpTpPJ5LQj4GhQcR7TeNX3V/xxmGxls0YShv5LfZy/a6vNaiBvtCo1W03FyUNqq694zD4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756468056; c=relaxed/simple;
	bh=S7x0ebfCt523Ls93oeQmD3KMYniINwdLaICZrUxIvQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HwqHm5DHn9g6/T2K7HE8p9M91wmU+UI7JhMdlMifOSMwTUxlIIGYIn7+yfhu+xTF6WyGMC4xlVQ+U36YBSBwfqcs+te321fT1Q6ejZb3Y6X5BU6OQ9NlVAv331ysBTGNpJtVkCKESDl1LhOMOivyKe1OgxHIi2IDxb5RW34MQHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tKQm1NFl; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tKQm1NFl"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b7e69570bso5971385e9.0
        for <imx@lists.linux.dev>; Fri, 29 Aug 2025 04:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756468051; x=1757072851; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+8Ff52Eurd3Sg0Fy6ii66kdfUaNx9pjdVhD8AWVlFlc=;
        b=tKQm1NFlRyhvtoLMszg4sQXao0VJgmFnmu30lCQjKDVhS5u747BwshIkuQZrNRVnjC
         L7GJmio8K52S/s3Bp8EfkXEtTyTeFlzp38PLzHMw0S71mSZ3V884knCxZByIViFuiHSK
         xmF250nUXrrAb7SQnVFjGAXUZnm/iBcXQ2IRDjitpo1Er+XONjquQ4I2LYCCT4bixcfc
         kk/IKlghu9oyNbwks9GI42KSfUPud+KnO5UBlYZ8kaLMxLrUxsB0g0G+8GHDFhBDMRKr
         1WjNMiY+Kj34KHd6ITuf//0dzplx2SpitcxIWG+Ku88Tmxc8kIiBuueiQiwwgjP5gNZs
         g/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756468051; x=1757072851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+8Ff52Eurd3Sg0Fy6ii66kdfUaNx9pjdVhD8AWVlFlc=;
        b=jSHT73ywysSTADtu2kMawIN2G2JGUBVlK7j8kPVpZWkcxEiFezvmetfoJvSjeh8Yqo
         AqzGyxRogtT4dTqtyjpxxiOX9l0filq/JMENsX0hAZXLWVjL/74ILDU9ExtvtLd7q8ry
         dZhKODfrCNY0iV1nLhDj/5seuas8LamDNJoS5tTReEAUZxcPZY2YCgwMptWTfRq1Wfrd
         1qthGHRwAEPPT8+QbZUDL+RtzM8LAY1FNWgiZGTlCeiqAXzJCJ7owPSwHc89fE6JkHb8
         HIpuFAbYB8RvzVjU8dyN/ajH1BM0DS34gxWU6jOLoUu65wf23QVrmYskgGrK6mU/lTm8
         lBrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC0Cvci/orAynHjujYwxKAmS4/2d4Sd0miZh6rERlmEXTQVe34ZKaLfujFhudxCIGTkRI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQpQzCmiPEy6Q7FkLSGI6Ys8cMULfWrv/ms55bO/n7PhIUgf1D
	G2n/oDPnkDuC/fChPHzSYWEUXsgeBVihGl1XLywr56ssSZGBmhrKP/DCrMa3QzbIp/A=
X-Gm-Gg: ASbGncvN5PA7mI1AKmL8xJf96UdoovrZNYbPI9MkUPBx+8yLQN7DyCDM/nI6pARuEk5
	mBaI2/WK3Ast4q8VI4bdeeVso6Ec8rfpCjVhLS+Gi2fVHXRGGT/zGQIHtagQFR/LLvmHFRFsWrq
	B8nb8tJm8l56xVD4ZkCSiM4CQV0twkWrG0AerqLKsIWrTlL7yT66uDQM6sMtx4qUxCZs+ObFcgs
	Pu1FWDxL1BbZEqRCuu9rIhwUN/6nUiJKzbWi5QnFRCqry++B4trPXpt3Az8KKMhzUJlMsD2r73D
	+X6hHFzCydU2yHVAW/UQ6+G+UavmyVCuu+ou97oM6cheN/gQTcbjHQpWqv4qmNBO3FE1EmERw28
	ljIvjKgyW2gW23vrfu/q8ybPuFL105jf/k8h8D26b8EmVOSP1/ltD
X-Google-Smtp-Source: AGHT+IFz+p3bq6EKzPmfcfC5PMXg5Zav7B1eRrwjjM0k5SgBpuL4bFJbKjkKmesw/qpW53whi0+p4w==
X-Received: by 2002:a5d:64ea:0:b0:3ce:663a:c91f with SMTP id ffacd0b85a97d-3ce663accb0mr3601184f8f.42.1756468051335;
        Fri, 29 Aug 2025 04:47:31 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7c461edasm29873255e9.9.2025.08.29.04.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 04:47:30 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 29 Aug 2025 12:46:49 +0100
Subject: [PATCH v5 7/7] spi: spi-fsl-dspi: Report FIFO overflows as errors
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-james-nxp-spi-dma-v5-7-3246957a6ea9@linaro.org>
References: <20250829-james-nxp-spi-dma-v5-0-3246957a6ea9@linaro.org>
In-Reply-To: <20250829-james-nxp-spi-dma-v5-0-3246957a6ea9@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
 Larisa Grigore <larisa.grigore@nxp.com>, Frank Li <Frank.li@nxp.com>, 
 Christoph Hellwig <hch@lst.de>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

In target mode, the host sending more data than can be consumed would be
a common problem for any message exceeding the FIFO or DMA buffer size.
Cancel the whole message as soon as this condition is hit as the message
will be corrupted.

Only do this for target mode in a DMA transfer, it's not likely these
flags will be set in host mode so it's not worth adding extra checks. In
IRQ and polling modes we use the same transfer functions for hosts and
targets so the error flags always get checked. This is slightly
inconsistent but it's not worth doing the check conditionally because it
may catch some host programming errors in the future.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 3b652d744492..8dcfd5ea4216 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -480,6 +480,17 @@ static void dspi_push_rx(struct fsl_dspi *dspi, u32 rxdata)
 	dspi->dev_to_host(dspi, rxdata);
 }
 
+static int dspi_fifo_error(struct fsl_dspi *dspi, u32 spi_sr)
+{
+	if (spi_sr & (SPI_SR_TFUF | SPI_SR_RFOF)) {
+		dev_err_ratelimited(&dspi->pdev->dev, "FIFO errors:%s%s\n",
+				    spi_sr & SPI_SR_TFUF ? " TX underflow," : "",
+				    spi_sr & SPI_SR_RFOF ? " RX overflow," : "");
+		return -EIO;
+	}
+	return 0;
+}
+
 #if IS_ENABLED(CONFIG_DMA_ENGINE)
 
 /* Prepare one TX FIFO entry (txdata plus cmd) */
@@ -553,6 +564,7 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 	struct device *dev = &dspi->pdev->dev;
 	struct fsl_dspi_dma *dma = dspi->dma;
 	int time_left;
+	u32 spi_sr;
 	int i;
 
 	for (i = 0; i < dspi->words_in_flight; i++)
@@ -601,7 +613,8 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 
 	if (spi_controller_is_target(dspi->ctlr)) {
 		wait_for_completion_interruptible(&dspi->dma->cmd_rx_complete);
-		return 0;
+		regmap_read(dspi->regmap, SPI_SR, &spi_sr);
+		return dspi_fifo_error(dspi, spi_sr);
 	}
 
 	time_left = wait_for_completion_timeout(&dspi->dma->cmd_tx_complete,
@@ -1071,6 +1084,10 @@ static void dspi_poll(struct fsl_dspi *dspi)
 		for (tries = 1000; tries > 0; --tries) {
 			regmap_read(dspi->regmap, SPI_SR, &spi_sr);
 			regmap_write(dspi->regmap, SPI_SR, spi_sr);
+
+			dspi->cur_msg->status = dspi_fifo_error(dspi, spi_sr);
+			if (dspi->cur_msg->status)
+				return;
 			if (spi_sr & SPI_SR_CMDTCF)
 				break;
 		}
@@ -1086,6 +1103,7 @@ static void dspi_poll(struct fsl_dspi *dspi)
 static irqreturn_t dspi_interrupt(int irq, void *dev_id)
 {
 	struct fsl_dspi *dspi = (struct fsl_dspi *)dev_id;
+	int status;
 	u32 spi_sr;
 
 	regmap_read(dspi->regmap, SPI_SR, &spi_sr);
@@ -1094,6 +1112,14 @@ static irqreturn_t dspi_interrupt(int irq, void *dev_id)
 	if (!(spi_sr & SPI_SR_CMDTCF))
 		return IRQ_NONE;
 
+	status = dspi_fifo_error(dspi, spi_sr);
+	if (status) {
+		if (dspi->cur_msg)
+			WRITE_ONCE(dspi->cur_msg->status, status);
+		complete(&dspi->xfer_done);
+		return IRQ_HANDLED;
+	}
+
 	if (dspi_rxtx(dspi) == false) {
 		if (dspi->cur_msg)
 			WRITE_ONCE(dspi->cur_msg->status, 0);

-- 
2.34.1

