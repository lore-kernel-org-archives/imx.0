Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE122D0C97
	for <imx@lists.linux.dev>; Fri, 29 Aug 2025 11:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756468047; cv=none; b=QFbeoEc+imnRMjfIM6sns5M5CdMS9w/i49ILcMDB+YsAIbxLcKN12FliVSKJ26IFmHuYsDlVB2y2S2wI3CyquLG1LIl2+gfKi/PAvp5iP4ywY5pCtzJlQ3I9fcakCwvll2uOLFAQosaRy1wAdXBgOIFyRk9J3v2B6IZP1Wfs3Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756468047; c=relaxed/simple;
	bh=SJcfNlBFzk+a4oHyKnj5riOiYRcAEXt/WpJ/ZMOki4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dT27PWcMfG0Se0p89xB10NYt7NnmCQ7AV0kd8QfOgF8XxKvtz73eHmCpeo2are1GBl0PV/vjlCWl14woTTKa1JlcoaQTmo63vf4izbr5v1yl7SAoIvb6WveHn27TYi0UBHosKSZmWXZRVWqosjNe03HUTlCJkcbHp3vwL3c7iJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=siZLhJxN; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="siZLhJxN"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45b7e69570bso5970535e9.0
        for <imx@lists.linux.dev>; Fri, 29 Aug 2025 04:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756468044; x=1757072844; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xW+Oe2QcsURx3U6b3nBFCY8yPP0337LLQjhu7L4oQOg=;
        b=siZLhJxNd1A3fYrOi/mumaLPfdRIZXHUxfGtQoLYuyaLqdk9OY2JjDWrujDaNYlrBs
         zSg87j8/z/0Ehe2wEdc3BBAX5C3MfO/RJDrO3BIpN5GsEIk0xSt3sw6xRjhq4R/oLDKt
         bTGFZPrylq9kb0SNDVb0qL9qIbpjgLiqd9jU1GdXGULDRF7TBfqWand2t5z/CFdstVuQ
         BSCkBir9G6sTv7K+Pz911wyaL2VerDZ3zko4paEqglwxkwzNKpp9LWU09MCCYk1IS0l3
         HnyzdMmLWpt1Lz2Vk9qLDJvH34ICOoc/CaM/NFH9jfjTsvhdGAwHwq6p9wWuDhjrsI2Q
         taug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756468044; x=1757072844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xW+Oe2QcsURx3U6b3nBFCY8yPP0337LLQjhu7L4oQOg=;
        b=HXptGwb4fssDSj1vTbbv3+oJ/e0fvzorE+AspDq3+SrFJr03jCIGn3ggzS3qIcrJOf
         9O7OUkIhal6suQ+Ajeo22hJtyYyP+dSU9VLHtJqx6+DXZUT2ILoDvZP8rS79C/VhEl2Z
         dPihIx8KtudlFidBQo/PX7+yba5uZIJYENhoMxZGTLcnb81/QRsKRme5esu9fQvJorRp
         WBKGGgC8akMzI9H5lhpQuexTp46MSuoD1AgFKSFNqirM15EYRzCDRGex4RofKcs5aQnu
         PrVYjn9f7OgQtDjwjj0P+Xxdqxu4pALwVA8iakxgCKuisg0VfPu7EnDA0YSETegYIJV4
         bxVA==
X-Forwarded-Encrypted: i=1; AJvYcCWTW4v4IeeJfNsXHJdqUfs+20mvnKjTP8vGcVNrKUAx/D8aVeIrpn0iJmdnvl1UKTZTwaA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeiJ/CX1ATwOTELjTL+WJAHh9Zv29a/o1LuafGKAxuV+ElT8A6
	HPQfw0v0upuJ2jbY5dA0wGzj1IV9As0F3UzNS22hxBd3DUMKY6n+QLIiyI9YDxppK2k=
X-Gm-Gg: ASbGnctEkzvsB7ehqc2JvuMoawcG6cahsiLGPHZkLQ2SWK1N4gwODNxT76V86+UeV+4
	RlIN7BUJko9jn/8FMPWqiL3Qa+Ud4gTDzxLpVzRXCRDaxvMAUJOCE7gDdZzN0hO4iCm2kEg1wq6
	CzAOsnqA2c3GIvVdbmLZSuJcKoC94RHmSNZzaw9SeoxTIf0aUoDSW5mDS9cXBh5l7o/q2Vcbqxa
	JfMMXdlfMJAVxo3qVx3kGj9FmD7FlTKLFNoxLXg4398Ahn7kfF+a5GnNVIt62Nv3hxhQcgQs1mV
	3JYy60K3QIbaCsdsI1iL7vxx7FPEYSa+qUONmGbkScO/lH9KPMbq+9zZ5HxoqsC2BP1gOOQVldG
	h63PwulilCEtGFfliehx+t0snexSQNDI=
X-Google-Smtp-Source: AGHT+IE9+qIKv+jkEpFOA36WurHcVsP6/n5G6O6yYPB6+PEgSMTfb3Bx/lwORRZac4tVlbkSsE5ilw==
X-Received: by 2002:a05:600c:4692:b0:456:1514:5b04 with SMTP id 5b1f17b1804b1-45b517b9636mr214898345e9.21.1756468044084;
        Fri, 29 Aug 2025 04:47:24 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7c461edasm29873255e9.9.2025.08.29.04.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 04:47:23 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 29 Aug 2025 12:46:43 +0100
Subject: [PATCH v5 1/7] spi: fsl-dspi: Avoid using -EINPROGRESS error code
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-james-nxp-spi-dma-v5-1-3246957a6ea9@linaro.org>
References: <20250829-james-nxp-spi-dma-v5-0-3246957a6ea9@linaro.org>
In-Reply-To: <20250829-james-nxp-spi-dma-v5-0-3246957a6ea9@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
 Larisa Grigore <larisa.grigore@nxp.com>, Frank Li <Frank.li@nxp.com>, 
 Christoph Hellwig <hch@lst.de>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Refactor dspi_rxtx() and dspi_poll() to not return -EINPROGRESS because
this isn't actually a status that is ever returned to the core layer but
some internal state. Use true/false return value on dspi_rxtx() for this
instead.

This will help separate internal vs external status for the later change
to store the external status directly in cur_msg->status.

No functional changes intended.

Signed-off-by: James Clark <james.clark@linaro.org>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/spi/spi-fsl-dspi.c | 41 ++++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 4bd4377551b5..654905a358e8 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -986,36 +986,45 @@ static void dspi_fifo_write(struct fsl_dspi *dspi)
 				dspi->progress, !dspi->irq);
 }
 
-static int dspi_rxtx(struct fsl_dspi *dspi)
+/*
+ * Read the previous transfer from the FIFO and transmit the next one.
+ *
+ * Returns false if the buffer to be transmitted is empty, and true if there is
+ * still data to transmit.
+ */
+static bool dspi_rxtx(struct fsl_dspi *dspi)
 {
 	dspi_fifo_read(dspi);
 
 	if (!dspi->len)
 		/* Success! */
-		return 0;
+		return false;
 
 	dspi_fifo_write(dspi);
 
-	return -EINPROGRESS;
+	return true;
 }
 
 static int dspi_poll(struct fsl_dspi *dspi)
 {
-	int tries = 1000;
+	int tries;
+	int err = 0;
 	u32 spi_sr;
 
 	do {
-		regmap_read(dspi->regmap, SPI_SR, &spi_sr);
-		regmap_write(dspi->regmap, SPI_SR, spi_sr);
-
-		if (spi_sr & SPI_SR_CMDTCF)
+		for (tries = 1000; tries > 0; --tries) {
+			regmap_read(dspi->regmap, SPI_SR, &spi_sr);
+			regmap_write(dspi->regmap, SPI_SR, spi_sr);
+			if (spi_sr & SPI_SR_CMDTCF)
+				break;
+		}
+		if (!tries) {
+			err = -ETIMEDOUT;
 			break;
-	} while (--tries);
-
-	if (!tries)
-		return -ETIMEDOUT;
+		}
+	} while (dspi_rxtx(dspi));
 
-	return dspi_rxtx(dspi);
+	return err;
 }
 
 static irqreturn_t dspi_interrupt(int irq, void *dev_id)
@@ -1029,7 +1038,7 @@ static irqreturn_t dspi_interrupt(int irq, void *dev_id)
 	if (!(spi_sr & SPI_SR_CMDTCF))
 		return IRQ_NONE;
 
-	if (dspi_rxtx(dspi) == 0)
+	if (dspi_rxtx(dspi) == false)
 		complete(&dspi->xfer_done);
 
 	return IRQ_HANDLED;
@@ -1137,9 +1146,7 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 			if (dspi->irq) {
 				wait_for_completion(&dspi->xfer_done);
 			} else {
-				do {
-					status = dspi_poll(dspi);
-				} while (status == -EINPROGRESS);
+				status = dspi_poll(dspi);
 			}
 		}
 		if (status)

-- 
2.34.1

