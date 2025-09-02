Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF2D2DAFCC
	for <imx@lists.linux.dev>; Tue,  2 Sep 2025 12:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817178; cv=none; b=dKfl1PrRsZyh+wU8uEaLmwILnc8oaI8pZaQ7+XquAwUEJRM8eLqaFG11KYWOVmu/QzdvgMhKegw3Cbie07KPU/sfsKSuyDssJ6bCXdQfYUC9VbFxSMguztcFKHiXVIif93CmVdluhLgqaYfMSC1UV42DKpa6ZOM2x6CH39/n7yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817178; c=relaxed/simple;
	bh=fDy13d0jadoNgDpWip0eDAJ9ZTQEC7MeqwnmLrMOq3g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GK3gxXgv5vdVT7NYUGRrxRVJxJea+B1ApbCn4rsa1ejAYm+uP9N4wBCAg4vEFUv0ZGD6e8aunqp8ja+4s6YTeqGGtNdaDVRdqYBsNaY8EUOw0nF06De20SuaEmhwcPYJ1hqqkbol1WOyNN1hzY5POEtOBaT1oKbNjUk6IpuiiHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iMTpxa8p; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iMTpxa8p"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3d1bf79d7acso1840412f8f.0
        for <imx@lists.linux.dev>; Tue, 02 Sep 2025 05:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756817173; x=1757421973; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/upoONcJkK6CJjYHWkLIMw2CILsxwp/wVjDokkLyWs=;
        b=iMTpxa8pXp3P7ahrLts0VxzDuzZbGzBqmn9sMZ4qt8IACMHilLSgndyosF3w30kVIB
         tbXqVDggow3hFXK0c2Pai2D4JRftT3iwerJr5RPIeNAiIoIepzMY/998wCLa3xUq+Vaw
         aUYtwUsxxr9gsspHUw54QaJ2K4mV+l34E3ZoJamuul3y8/BpVC86HtD6OUKD/rUXEfhF
         Hgq47pJTulGLWzSUMdSw6Zr9QXILkIqnhFqdSw+gXWhp9L7dafFPEfb0B9cyNhiCjUlv
         1h964NLD7sUJxqSUwLTL4BlwiSDv+ImF0ahtFiqzWXZMnp7yfva9t7L3IZczJKCC9wgl
         8dQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756817173; x=1757421973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/upoONcJkK6CJjYHWkLIMw2CILsxwp/wVjDokkLyWs=;
        b=im2/dvxjYbkjjJcJdXa5Esa/AVfGgC6m/zupYKrzASm1QvBJHUiNBkGZ9vURL8G/wY
         6AGsfrYtRP5YeSeV/S+XpHNOoQlvHWGNvJaEOzKMUzUa8aqG8+3Lho5oMDHO8AbuCg4I
         yJs01NT4iBtvExR96SFeVx+hx8X2bcP34ib4RkX9lGwm9ZgY32tgX7Zah9BWx/KOKqsW
         4a64AnE8StZsFn4Z7f3R7Rr2ax0/ng1KwoVcWBsj2CVX5uTaklOleb2mNFIHrBv9FjUh
         +/u1wxQ779v99MMCg1zEqbRLnUCEy2MOvY4QkgSZyl0ClPhnIwHO4Xw2WUaxJouzDmiC
         MUBA==
X-Forwarded-Encrypted: i=1; AJvYcCXF8Y4OYE2e+VQ6RoN+E1+0uSX05/XZnz0+kgjNzxMgp11AzVC6Zd3u1NcKHTBhJj/R9v0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxuZoFq4EgFIP9QG/S7W51Euvzd5NELFzluiF39tlM/y2o6kxqA
	lzQEwXNlraI99TeH7H1Re536qFB6S/Dy2GT78yTCHmXH9F65dLLgBuGRhWKY2Ob8Cj8=
X-Gm-Gg: ASbGncsUT0qXNEn+c+9DJhAWFUdUy4bt9ssZ0/Kdv4QZtpEVDwvrD1zP+Q+vEaXxyD6
	oxkz1GmEWjYZUnayjvYOK96YE89dK+5+sXW6GHx9EvdQgJytGul/+mZtKUuyFhDwPbZ1Y4Xp/Z7
	n29INT6BY6Zk2yXjeES/AetkLrGndb4n5ev3P7JhYxofbaWyG9x6fNoi1+b+LrK7y846iD3U446
	PGx04JELObYqh4d6saxCUjpqGfGNsTuOo1+srV9+64rt/hhRWNIbfK9GSKIIcVjDqcmMhkcrAkV
	0kIEqJz7p02JHw8dQHaW6rn+npj09DHxNjEa7zG8aUwvzx76y4jMRTvzu/LYFpq6ccZRcDCNjz9
	mJxRJ/qgvsFAGmBx/5DG8RO1NV5HQ8CQDgSrO7RnW8Q==
X-Google-Smtp-Source: AGHT+IG6jUoitTgiFTXdSrwMTL/OoQio/BlhVxzRStwKd/kUGsgb2XZinkbeZSLm7z/B6IiziT0tBQ==
X-Received: by 2002:a05:6000:1883:b0:3c0:7e30:a95f with SMTP id ffacd0b85a97d-3d1e0a94fbfmr9044471f8f.60.1756817173362;
        Tue, 02 Sep 2025 05:46:13 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf275d2717sm19589896f8f.15.2025.09.02.05.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:46:12 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 02 Sep 2025 13:44:59 +0100
Subject: [PATCH v6 7/7] spi: spi-fsl-dspi: Report FIFO overflows as errors
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-james-nxp-spi-dma-v6-7-f7aa2c5e56e2@linaro.org>
References: <20250902-james-nxp-spi-dma-v6-0-f7aa2c5e56e2@linaro.org>
In-Reply-To: <20250902-james-nxp-spi-dma-v6-0-f7aa2c5e56e2@linaro.org>
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
index 3d29285c772c..83ea296597e9 100644
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
@@ -603,7 +615,8 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 
 	if (spi_controller_is_target(dspi->ctlr)) {
 		wait_for_completion_interruptible(&dspi->dma->cmd_rx_complete);
-		return 0;
+		regmap_read(dspi->regmap, SPI_SR, &spi_sr);
+		return dspi_fifo_error(dspi, spi_sr);
 	}
 
 	time_left = wait_for_completion_timeout(&dspi->dma->cmd_tx_complete,
@@ -1073,6 +1086,10 @@ static void dspi_poll(struct fsl_dspi *dspi)
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
@@ -1088,6 +1105,7 @@ static void dspi_poll(struct fsl_dspi *dspi)
 static irqreturn_t dspi_interrupt(int irq, void *dev_id)
 {
 	struct fsl_dspi *dspi = (struct fsl_dspi *)dev_id;
+	int status;
 	u32 spi_sr;
 
 	regmap_read(dspi->regmap, SPI_SR, &spi_sr);
@@ -1096,6 +1114,14 @@ static irqreturn_t dspi_interrupt(int irq, void *dev_id)
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

