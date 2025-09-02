Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15E92D3236
	for <imx@lists.linux.dev>; Tue,  2 Sep 2025 12:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817170; cv=none; b=kVdOLHts7EtI27n7rGoEE7Lx5tW49Gbs0DC+Pu3OW1iFmiV+u9uL2OMa4JDsTRDjWJkGRHooHUVbgwZA62evlkSwm8Jb6obCP1YW8q6BQQavQc2KLt8aXeHLMMW/bSLEiGGTwOK/S95rt3uZDUPmE2RT6fVpDGVdWW8Zg+8+cNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817170; c=relaxed/simple;
	bh=8/fgw25QdB1ZgzdAKtXHCLtofKXduBfFQhmuMPgookE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TBVG812EhkazQ7SmH1PYbQ6MPMG4TxylYb+/Dmqjt0BaYoaupR2zE7Hh8FRE943Zku3zGyK76bd4kyJflLTyYz7qGqMFZx5QGt5l/jjpkc6gcG1OaDIj0ifhHFT+G3lrdiVEaxT2wvtKoQST6mzjJXkUvdarNHF/tO5b9PB4/aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PNkTM3nm; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PNkTM3nm"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3cf991e8bb8so2488430f8f.2
        for <imx@lists.linux.dev>; Tue, 02 Sep 2025 05:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756817167; x=1757421967; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5r9IPHLuMKz/CQAQPk4+OYtt68jBsvmpWFMRP88G9KI=;
        b=PNkTM3nmS+CqfCOF6gpw6P2pFasHzQnnI7dd5g9YW44sOY05IBjEADCz5E/KD2QKZh
         KByeIEZ9tbt9Hgadwp2WDI5CukuBpBB0GRJQtHuNqFt6a39R3PKGncr/MPerlPDZzMUi
         jgF++h0JeNSSP0t9cBJi0YdLKGrvSBZGeFdcLdnzjZl6CPuhRupk18WK3+qdL4FQRd4u
         AOkNFN+lobYbONrnhokfHMMUwjLeK7+20pNtJzcp0hI86rMOirbkKkoc71Qlij1s8PYm
         mPT+IT5gf97H87QL+Fo7QGzZgNzZTbiTsU+3JHtLhdBi2HLaoHWlM2Wj84L+Bmphzxv9
         a8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756817167; x=1757421967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5r9IPHLuMKz/CQAQPk4+OYtt68jBsvmpWFMRP88G9KI=;
        b=n7dEAebmw8vQAY2knHXwNuOgk9ZJTAgFIrHF3jWif4bZKzCGOLjFgFfqmYB0N2+B36
         8U2Rk7mkblEMIjd1BdoQX7PZeFKKXZ/YBwH0/Qn53sz8OSWa/L6E7ktO4ljBgP5DLobh
         26pRu0jAWByiExb5LOFS5TYmAWOwHZxBwHc5TKK/KbLwf4RcaXgdJzZa5erpWN5DgDLA
         AOAKi83ShSqXFiu3DzN/wzs1BGqzB1EJ9hWaE1G0tjH8A49CVJuTj3H/8ou//ZclV86i
         6vh1zGm1A+m7SHLn5awHR+PcVkX8QAcApG/FgffJ01tWhnjvVD0BNClBvpqYJJZo/zXj
         8i2A==
X-Forwarded-Encrypted: i=1; AJvYcCXtIvS5bUePjpNzVcu68r1GhbsQy+tZDrd/iHerbc90Ooh5NvNxyRriDsNqdBQ0nUQ5ab4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYffF3jUPo3nUMw4huzzmmPO7ZaNsPqpg771eO2hykAAnQMFo3
	RKcneEpgc1PoxLn5xkz88u3hoP8Uk87Z3bd/99yyz+e5J4YMwkGPKCLCWNDjyRzYRIQ=
X-Gm-Gg: ASbGncvRYb6vmiYJoGM/yHTeOYdOgEf75GVv3nQD1XLndl5SKhFBjrxH+qg909mgsGW
	97bQBdm8VDmkfX0kqDF5U912SFkMm33V2Xba7+cI6g/uyEycOoUp6nZDUbESMhPWhqKSwi0yGsz
	vh755D8E0W1DcJ+QU/qIn1lyk1R9oHUHnbAPON+wMBGKCqVijbjYt+AXOrPsXXEOHxHc7iwJPYx
	uObmmUuskH6Wg0AE2qNoPWCJiGPBdhH9zrYUfXVjS+FmTlQyFgl3ih9Ok2hvJ9E5epuL5H93o/L
	TnRMME+Szzt1pzRLwxrVOhy5e2BhFjOCX8AY9Ice304ziixdQPM8Y+E7/gGe//IyjzxSksL2vyt
	uABcK1mUXFcG/DzeOMhKpwoUFDKAhwKc=
X-Google-Smtp-Source: AGHT+IFiBte5oIm9wgYp4QL6sXIclbo20jvsZNvWU5oy5exkamtVaSde2J41wTdC4z94mkJWGbNsYw==
X-Received: by 2002:a05:6000:3112:b0:3d1:42dc:c710 with SMTP id ffacd0b85a97d-3d1dcb76607mr9142347f8f.16.1756817167187;
        Tue, 02 Sep 2025 05:46:07 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf275d2717sm19589896f8f.15.2025.09.02.05.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:46:06 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 02 Sep 2025 13:44:53 +0100
Subject: [PATCH v6 1/7] spi: fsl-dspi: Avoid using -EINPROGRESS error code
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-james-nxp-spi-dma-v6-1-f7aa2c5e56e2@linaro.org>
References: <20250902-james-nxp-spi-dma-v6-0-f7aa2c5e56e2@linaro.org>
In-Reply-To: <20250902-james-nxp-spi-dma-v6-0-f7aa2c5e56e2@linaro.org>
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

Co-developed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
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

