Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A8D2C15A1
	for <imx@lists.linux.dev>; Fri, 13 Jun 2025 09:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749806970; cv=none; b=pVbGAej1/3z7W/aZFNajPEyb/Zom4Kt1hKgw8wzGk7BiO8SuOsR+/zx970/TKf3kUuH3UjCdonVCZwNTlpvLHPwalcEVB+0sERUx5OPc8G6ABe0klMRfxetkKGof2aKU7Rwu55NkI75nyWXFxCQig8ukx+MPgT0ljRz5DDalM/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749806970; c=relaxed/simple;
	bh=olRfOaHDgzZ8i+4C3kFg3nNnJTByQvbKuBFGHGjLU/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G2CL8VCmnLMuWWFwmH00skxe3na7AxkyNXBnp4Vg4+oKD/hnpN62TGfxSjSSUOIFQcXre5CASFisScxf23HdT/D/QnQDWj/+En/Tvj0RbKdvn51Z1h2K2tq5HWEzJXus/Nu0rYavUv4Mews2JdUo+S49wIHxj+NKJua1ZLmUjpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nzIibP8z; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nzIibP8z"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-453398e90e9so1972995e9.1
        for <imx@lists.linux.dev>; Fri, 13 Jun 2025 02:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749806967; x=1750411767; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VyHiR7U3e06QyZLuhEr1yr+WmILkiHQ+84NE+rNpfGI=;
        b=nzIibP8zaX3d4lTthonY68EbqQeZOAiLFmjJ6nODaz3jUB9iiEWyFcVuPlHC1qDjiL
         pvm4WYybYoZ2TXs7LtWgOA4eX5dNoc3NEcw0+Lx9/3NLeVSjukDoFbr7CpMsglcaJHcZ
         jTTJ/QmVeB2AdjnA4MvhewNabKu+zQbhTcnPFQJpSc37qkeIKdJFVY1SWFRJWFl3O4iD
         RPy6fviK+5TUGNSPZrVOW7I4+GqVKdSTJrDB6sPGc5LlXJ4RA2Woyir8Sj3kmwwZ+dLK
         wFklZ1hNn3B1CK63MP+ScGE5PexUshhwprOcZaxPfDFt1Rs6rP9nNFQ+NTqWBujmI8aB
         fHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749806967; x=1750411767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VyHiR7U3e06QyZLuhEr1yr+WmILkiHQ+84NE+rNpfGI=;
        b=aKWxk7F9eKgCgViH0dxW5MBRfIDod3J2FhsEjBLb0XqDmmGLwmvIgmxNFTTvYKN6gN
         tKU2TJdo5NkrY1IB3rT/yHqfMs/+XTZpHQFsBHIGp7ny9nkOkEdlRWVG4LadaPixuwSn
         4yIoYu6a11UUPBDQNnhhmoQhW3kjeSUn6xz6oKOTUKwNHX3zdkqiec2u9AmcSai5BuyQ
         JgnoBDWscbXa3TwJTuR2d42VY0HsQ6/FKcdx+ScDOER1n62YsWvFpJLjF2IHD0qAMHJP
         nZgazUY8ScH4GzDRJBypyRj+zsWXyBeVfdR+bgBOD3QNlGUyJ8CfnXBLNseqIeFLftNx
         9EWA==
X-Forwarded-Encrypted: i=1; AJvYcCV3I1NJjYHku0PPrhAm7QriXY0OjlDG/x2f+r38ATgJrblY+a2MOr9ipZNhp4YVFgqLjqs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwsF/fPRE5LNXDsOOPYQUwtSRM4quWIfmLZKfZMPrI56WHk/ui2
	aVYQ1P2KReGaCojak5GC90m7bTo9O3R8g2WUe5NjrgT5SD7jdhCSmxo5Ra3zZ5RM55M=
X-Gm-Gg: ASbGnctj8GUEp2aooi0/+xrLAVa4K0vEiQW5Nh8+W7UiDf19f+Gd00Sj5jpzE79dEoI
	VTtw+G464UMlJv+O1KGRIY/A267eYwd7lmlI8zDe/4R/gCs4y1spXNu1FzGzYehy8Kvfcx33wGX
	VPo6yqKQ+fCle+bJWLSoa6JH5+6kJJAnV8XtwqNBXTno1qCU6YS/FmPGYBwaJZVwMQ8HYrW8dx2
	8KLLcYvqCcAeTf7LNyuKrSD2209DoDZBJVAe4WgTpG1wFk6GhWH/TqZIkfkEzzTljJkEcKCT2As
	l7Uw6XGpMw0kESASMgnZhB3dhQXXFKu+6dG3NY+OqGxsje9CvTi18RfjkrsTX1eOLA73SF4=
X-Google-Smtp-Source: AGHT+IFGL5ebfXnS6+SsaO2dpfkoeJy4mYNicoKfeWryjtieYLtsaUUUpvT+btcO05B9ZGq86PLAnw==
X-Received: by 2002:a05:600c:8b08:b0:450:ceb2:67dd with SMTP id 5b1f17b1804b1-45334b80acemr20305265e9.33.1749806966724;
        Fri, 13 Jun 2025 02:29:26 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08a2bsm1805946f8f.62.2025.06.13.02.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 02:29:26 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 13 Jun 2025 10:29:00 +0100
Subject: [PATCH v2 5/5] spi: spi-fsl-dspi: Report FIFO overflows as errors
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-james-nxp-spi-dma-v2-5-017eecf24aab@linaro.org>
References: <20250613-james-nxp-spi-dma-v2-0-017eecf24aab@linaro.org>
In-Reply-To: <20250613-james-nxp-spi-dma-v2-0-017eecf24aab@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Arnd Bergmann <arnd@arndb.de>, Larisa Grigore <larisa.grigore@nxp.com>, 
 Frank Li <Frank.li@nxp.com>, linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
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
 drivers/spi/spi-fsl-dspi.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 31432d533dea..f62f99f272b2 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -556,12 +556,24 @@ static void dspi_rx_dma_callback(void *arg)
 	complete(&dma->cmd_rx_complete);
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
 static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 {
 	size_t size = dspi_dma_transfer_size(dspi);
 	struct device *dev = &dspi->pdev->dev;
 	struct fsl_dspi_dma *dma = dspi->dma;
 	int time_left;
+	u32 spi_sr;
 	int i;
 
 	for (i = 0; i < dspi->words_in_flight; i++)
@@ -610,7 +622,8 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 
 	if (spi_controller_is_target(dspi->ctlr)) {
 		wait_for_completion_interruptible(&dspi->dma->cmd_rx_complete);
-		return 0;
+		regmap_read(dspi->regmap, SPI_SR, &spi_sr);
+		return dspi_fifo_error(dspi, spi_sr);
 	}
 
 	time_left = wait_for_completion_timeout(&dspi->dma->cmd_tx_complete,
@@ -1055,6 +1068,10 @@ static void dspi_poll(struct fsl_dspi *dspi)
 
 			if (spi_sr & SPI_SR_CMDTCF)
 				break;
+
+			dspi->cur_msg->status = dspi_fifo_error(dspi, spi_sr);
+			if (dspi->cur_msg->status)
+				return;
 		} while (--tries);
 
 		if (!tries) {
@@ -1071,6 +1088,7 @@ static void dspi_poll(struct fsl_dspi *dspi)
 static irqreturn_t dspi_interrupt(int irq, void *dev_id)
 {
 	struct fsl_dspi *dspi = (struct fsl_dspi *)dev_id;
+	int status;
 	u32 spi_sr;
 
 	regmap_read(dspi->regmap, SPI_SR, &spi_sr);
@@ -1079,6 +1097,14 @@ static irqreturn_t dspi_interrupt(int irq, void *dev_id)
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

