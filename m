Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31272D2391
	for <imx@lists.linux.dev>; Fri, 27 Jun 2025 10:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019739; cv=none; b=QHSl6xcsrjLeQRNyKPTSIGg7l5lG6nVzzpqgyMqQooQ+QN9RaPZJEN3Y1u5GiMsgaY+EwIX53/IUM7EsU1kncFhIt/gnBB+Y48UfwRe8Kj9c7yKH88qQgUYLVya1gNgbabdkyg8ENBxdl6PYjkARUm/bPSLwsEXGwhFziPU6yEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019739; c=relaxed/simple;
	bh=tnlV1BTcXX8TkRVCvUT7BEAqgsHtSlAw6diYlslpUgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uJ90C2o3fyOricwewg63wG8v5QqMvZ9WRM6mFZst6oN9oxNCc40hQKFkBL0xojFySryWv/T7csumWOGrAgB+M7IAQxMQob1Btwcflt8/Mpc3hgV4iUSon+dQdCPyra7bLuHE8qSxPF6paGmdsOSfHWaWBwaUa04E9AoA3qA/9LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jMG4UcAa; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jMG4UcAa"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-453647147c6so21911295e9.2
        for <imx@lists.linux.dev>; Fri, 27 Jun 2025 03:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751019735; x=1751624535; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iMKMNWSy8hAGvbCZFBJvEFBm5RGHszf1PCWsZo/9xEE=;
        b=jMG4UcAaVLWqicpv7q+TDTv5Qaj4/j9nQcWrYvcd1BcGlOmyjAiZ75+Xiq+ImRXbjB
         df3g32ewFjaLmQDQgWHmL1LBkFAYP9x36HaKn5e3mdOnZmh8qS1R/k2Oy/ZfveMpYaEl
         o5iHTqutmU4sBylHFoe+qZJo6msu82sjkpna1YEO6YEbSfqAXYREYR43LgKgewK9cs/O
         /T8bNnk9CBWnCl5OuRjvs3/cd8UzdfZo9aARLAjz1WJOVqnqyNaeDmiDK4N6TweKDAQb
         LB3XX/jW9Fs+KseFzV78Gceup0vkleATFUYE1nLCf/I/EyPtTO15uoGv2G2IRTqzS80G
         K87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019735; x=1751624535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMKMNWSy8hAGvbCZFBJvEFBm5RGHszf1PCWsZo/9xEE=;
        b=OZv9NPiQEMNm5puQflUDB1u2F3Prx9YuGiuMyXhEq2EPxsDKX/P5GnW/ULfuiRcBlB
         eK8zk4hqarRHYYIquev05PYqihSGMaXuau5i04Pk5+ZnJIJjzrzNjXqLxoJSRDpihe9D
         jlhWDJqM/ou2n8lNBwXFByXVUvPvo5RfxiKc8Kkpz5c8c7nFOYADuPhZLvj8WGZsJad3
         okNbefANMH1CtzQ0YuSXeqX7OGpD5na1gQfVAwGFMAs3x01YUeK2f7eOotxRR+PyS/4N
         DiJ14ekntFJ/PFOaRKGrgx//76HVmox0qIwHM8/Jndya4OYZM+iJXVmu1hZWI38pqnor
         nRpA==
X-Forwarded-Encrypted: i=1; AJvYcCVjT1Q4xmJ5kEK/SX6gK2rMPpE+SIQ1fzmZ+k1mb0CkQk2hByxPn46LgIB4qEs4rusutH4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzV16BseMSA7bKLQPQzCZKXzLIMK9iwAD1jTcedu51GuJFJDZr/
	s5twCceZqq8RqB4Gl/Y4HFR+pjmSGRavCxBlydLIDQB767q5TFeEYMW+kXHuadgDGs8=
X-Gm-Gg: ASbGncvaKVBY2JIsfI3xy88XzFFaKWFr7skZNelw49NAcQE2gvw5w0Kq8gfYJ+PviX3
	Jm49YYF7makg3dAMkKXphsDpjmGBPDblTvUh0yBUVqerpMNz9Don4oijvSSauuursfFJcKIpNjH
	mqzJC3IJ+mSP8v+XFcJkX36H55p/NmO5TKilxeg2kMkO614QvD5Trk5Yy+WN12OY9jfKv3IIafJ
	hyt74mtqu+UpDWrEMtqVj6Y1V9/R6HpuhqUtUkdc4VemwsMjC1FQF3N2rltKrxapjX0JOn/0LZP
	d5lSBY83dlN/yrp2UsdvD6Uez2NTkafu2n3u4/+Nsy2sIgV2cIIcNkZZRqUmKa2XnmkAUWY=
X-Google-Smtp-Source: AGHT+IFsKSW3JYeHrMvdSGefKS0adTCUH7itGRvgFnkdhGDlbVeAt6e7x+C9SF55foHinQ7yjVA6ng==
X-Received: by 2002:a05:600c:4752:b0:453:a95:f07d with SMTP id 5b1f17b1804b1-4538ee27811mr36353175e9.10.1751019735290;
        Fri, 27 Jun 2025 03:22:15 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a5599sm47250955e9.13.2025.06.27.03.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:22:14 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 27 Jun 2025 11:21:42 +0100
Subject: [PATCH v4 6/6] spi: spi-fsl-dspi: Report FIFO overflows as errors
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-james-nxp-spi-dma-v4-6-178dba20c120@linaro.org>
References: <20250627-james-nxp-spi-dma-v4-0-178dba20c120@linaro.org>
In-Reply-To: <20250627-james-nxp-spi-dma-v4-0-178dba20c120@linaro.org>
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
 drivers/spi/spi-fsl-dspi.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 46d3cae9efed..2c2a263c5276 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -478,6 +478,17 @@ static void dspi_push_rx(struct fsl_dspi *dspi, u32 rxdata)
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
@@ -566,6 +577,7 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 	struct device *dev = &dspi->pdev->dev;
 	struct fsl_dspi_dma *dma = dspi->dma;
 	int time_left;
+	u32 spi_sr;
 	int i;
 
 	for (i = 0; i < dspi->words_in_flight; i++)
@@ -614,7 +626,8 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 
 	if (spi_controller_is_target(dspi->ctlr)) {
 		wait_for_completion_interruptible(&dspi->dma->cmd_rx_complete);
-		return 0;
+		regmap_read(dspi->regmap, SPI_SR, &spi_sr);
+		return dspi_fifo_error(dspi, spi_sr);
 	}
 
 	time_left = wait_for_completion_timeout(&dspi->dma->cmd_tx_complete,
@@ -1067,6 +1080,9 @@ static void dspi_poll(struct fsl_dspi *dspi)
 			regmap_read(dspi->regmap, SPI_SR, &spi_sr);
 			regmap_write(dspi->regmap, SPI_SR, spi_sr);
 
+			dspi->cur_msg->status = dspi_fifo_error(dspi, spi_sr);
+			if (dspi->cur_msg->status)
+				return;
 			if (spi_sr & SPI_SR_CMDTCF)
 				break;
 		}
@@ -1085,6 +1101,7 @@ static void dspi_poll(struct fsl_dspi *dspi)
 static irqreturn_t dspi_interrupt(int irq, void *dev_id)
 {
 	struct fsl_dspi *dspi = (struct fsl_dspi *)dev_id;
+	int status;
 	u32 spi_sr;
 
 	regmap_read(dspi->regmap, SPI_SR, &spi_sr);
@@ -1093,6 +1110,14 @@ static irqreturn_t dspi_interrupt(int irq, void *dev_id)
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
 	dspi_rxtx(dspi);
 
 	if (!dspi->len) {

-- 
2.34.1

