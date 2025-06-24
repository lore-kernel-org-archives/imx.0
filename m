Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BE2288CB4
	for <imx@lists.linux.dev>; Tue, 24 Jun 2025 10:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750761403; cv=none; b=iu4nRK3WIb6QphUDuIoM/NQf/tnSy8Px4M6iN7Y4tMQ/nQlwZiH3fgwtW1zdxPFoomSpZ0bNPWYqRC6hkhrNNoi/d8F3pune++ZfyYkLUEbjO2B01O/AlKRFxVGLr+8vYip8Hm7gHFKJ7buylhlh0bYErf9Bp6ye8aN5l1T/+QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750761403; c=relaxed/simple;
	bh=X4TMFyCSx8+go3pfcWGphm0X5j2rswwDLDyFMqRvmhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SvWtHGou/NIV9XkfCvYTsh0g8GSl+yWGrFtFeDy2EuMscY36nrrtaAISDl3sjEO1kB3SNIpTQTjydy2LXs0afkEkwfur2AG2i0dmMswRZJWIhatqY8VhHoMPeRYF/rXSD7oikUJ2qZ3ePZogMqLXCJLDojK+3EaXXoYKgkIwCWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZZUpXOvb; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZZUpXOvb"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so1990865e9.1
        for <imx@lists.linux.dev>; Tue, 24 Jun 2025 03:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750761399; x=1751366199; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WfaJB4wgBJF9kKkXQUfWPFPPVgluIefucU17tIlexuI=;
        b=ZZUpXOvbF+Cu5cCPPwx+OhR7EV7Znj0wdFZg+m87nqtWUvufu1bVmMzWDbeMl16Xcd
         tS9ytwEOzg+ftLO2LLhJiJJrXjlpDRT19dW7wRe+1yVtwnTawwvp2oAW8SxYyGYJzoRA
         U44Qzv2iLANYWmls884igF5+mEs2GljUtII5gQGipJC8QInZWolKa6h5HRk4sYkFBsaK
         tDzKqDYEWt9xawVNGUJohwHT3Llb9Zvuj1DFbNgbGgLLoSAAmMrVpJduqRfCd2reLBpq
         eiTDGwlkvDlfdo/JQSWWOQL8efPUXwG52iPIVYIF3yTIdeVp5Cv+J3RkFSdx1A35FEGG
         KioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750761399; x=1751366199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WfaJB4wgBJF9kKkXQUfWPFPPVgluIefucU17tIlexuI=;
        b=nyvF5ub6IIEIwjEE2qeMOls3180754Z7ZXqeTcCeRBlIttq99DJ8G7egUxhMrfO0QX
         6lUgMryyBWxnVyltVi5R85bsUR8LUomr70K7eE0Qsb3u1a325OpA4+SDzkW+2dNEQK+q
         VaPOB20qWp+u3354djKWlBMsaPUynm52HU6zBXQC1ci8uPT9gC6+/u1/YCq4lv10inl2
         PnZUMjeO4OkDdVF+AiUL6wUebQKNt9VaJDxvtIP2rI/1QvBJvP3loMg9Ou5zO1HalN4i
         e1U2yJYY326xtZESLl+VPBeIUg7YYpsWY+rBzrzutK9PIZsGUQ71p5Q63UTHyRiKBJjj
         LMnA==
X-Forwarded-Encrypted: i=1; AJvYcCWuYoNz6fl1DMDFBFuIwn9+gpFLMm2wtPtvkzaT7WZXGweDWxaqdJAYmh/jFWPBDb4vESM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwjrbcvwImOzRk+XNXBrXG7ygj7NaQPAE2/CB9gEVJX0KMCG7Cc
	5JJwkkpPsbN3FhpGmnhyY8IxKYIWhZLgDgvsUeoAXx3SJ4/L5B2D60LdUNaWRLUCiCL8qXYiEWN
	n9x3j
X-Gm-Gg: ASbGnctk7n1gXbI7cPO8yzQXRCa8lXQ07LAOTlSKQ5XQOE1KzWCVVRMrWAMohEy/Q6G
	MVtciVjaXI3w9RCk2VsjF9XJcnx1908TN/iXVTZe6mOdMoMzGtHDG/fe6kMv8KN1N+7O8luQXjt
	xWuBW1wMWSlNBq1/+P37IRSs+TZLLa1bZnhZgi0+vfiprCPlR5ySOa0V4UyufgyMhkxUFCW2jfa
	vSwu1lZ6QSMNp6EF5vQvbUNslrJpjTiiHS7Vju4G26Wfrkka5Ua4IszXylpBJl0yNS1HTDrfInT
	GXTBgRREDR4FyW+0gsfgBHN/mXGJSzuUigC8CvXXqhVjGGDIdF92OU5rjlnEnKvkkEeLzLE=
X-Google-Smtp-Source: AGHT+IFjHGQ/H+wHW0syoZB/rCcGbth7MceBuzjub/X3klVhpmcprnqWAMJ0DPRZSe/+ArGUdMIdMg==
X-Received: by 2002:a05:600c:5250:b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-453653925f1mr135996935e9.6.1750761399129;
        Tue, 24 Jun 2025 03:36:39 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb641sm143398245e9.3.2025.06.24.03.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 03:36:38 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 24 Jun 2025 11:35:36 +0100
Subject: [PATCH v3 6/6] spi: spi-fsl-dspi: Report FIFO overflows as errors
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-james-nxp-spi-dma-v3-6-e7d574f5f62c@linaro.org>
References: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
In-Reply-To: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
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

Only do this for target mode in a DMA transfer because we need to add a
register read. In IRQ and polling modes always do it because SPI_SR was
already read and it might catch some host mode programming/buffer
management errors too.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 58881911e74a..16a9769f518d 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -560,12 +560,24 @@ static void dspi_rx_dma_callback(void *arg)
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
@@ -614,7 +626,8 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 
 	if (spi_controller_is_target(dspi->ctlr)) {
 		wait_for_completion_interruptible(&dspi->dma->cmd_rx_complete);
-		return 0;
+		regmap_read(dspi->regmap, SPI_SR, &spi_sr);
+		return dspi_fifo_error(dspi, spi_sr);
 	}
 
 	time_left = wait_for_completion_timeout(&dspi->dma->cmd_tx_complete,
@@ -1069,6 +1082,10 @@ static void dspi_poll(struct fsl_dspi *dspi)
 
 			if (spi_sr & SPI_SR_CMDTCF)
 				break;
+
+			dspi->cur_msg->status = dspi_fifo_error(dspi, spi_sr);
+			if (dspi->cur_msg->status)
+				return;
 		} while (--tries);
 
 		if (!tries) {
@@ -1085,6 +1102,7 @@ static void dspi_poll(struct fsl_dspi *dspi)
 static irqreturn_t dspi_interrupt(int irq, void *dev_id)
 {
 	struct fsl_dspi *dspi = (struct fsl_dspi *)dev_id;
+	int status;
 	u32 spi_sr;
 
 	regmap_read(dspi->regmap, SPI_SR, &spi_sr);
@@ -1093,6 +1111,14 @@ static irqreturn_t dspi_interrupt(int irq, void *dev_id)
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

