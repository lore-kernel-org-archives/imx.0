Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACC12D47F2
	for <imx@lists.linux.dev>; Tue,  2 Sep 2025 12:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817171; cv=none; b=YvHeW1Mq7ddpVG2QPoARF35mBE3De384o/mEBxUQtATLrUtIu0OJh6iOVLOUTmijjMP1MmNgttfm6WQTclrjB3pYwdC3Icy2Fxtksxczf6zp6vV6HjTNtQ/7cyy9grPiUMPGswa40nwC+ELsXB+EyemS/vOkkOIUzs5X3L4qaz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817171; c=relaxed/simple;
	bh=C9oJkV3mHs12c4uHbbNxH2PTvvxlVuP9ivdk16TivuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t7kmDVtpRFLxOe5OaqzK9RSe0vrLGlqMzZLUrPDH47v2iF8pjfkQZ/QO+CeCa6NjwMhSINAt9OtlGnE7z/1eFVXRST4gQ/yxFgDpcYAUtsvsYbNJd8gYfTN/OkfIVeU26OVuIKItfoEn907WB+AvFM3WeD2bQXXzvljJDN82JxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AQXl0Qm/; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AQXl0Qm/"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3da4c14a5f9so397871f8f.0
        for <imx@lists.linux.dev>; Tue, 02 Sep 2025 05:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756817168; x=1757421968; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kn8pqlkvI8BkvlrFlfSozqitc0dmKXQH5rpgTQNMM/U=;
        b=AQXl0Qm/0n2rgKlK6C6921TAiZl1gMVdA8bV05FVd3qF/NZFbH4X4Z1Ghs0H0QVZ7X
         x0ixQNCLFXPzX42RFpsqaUx9j82YPfcz7MGeusnYzTo6i6GbNH86ISPWtmfbvwvkIh+7
         5z9+oJT/MDLKjhaOOIqqWqZ6Xfn1rFfPfCrP9Kf4ipgPCzpNgEJ5mXebosZFLVtc3vkC
         8Fr4SY87e5Wul8z18rz70w9cfrgbOvZO39FeWSAPxqK6/i03cOAwdEh3jzbRs/RKcveM
         ACcRc6DYMZzuHi0FKFrSwHxG3Pz7Wvh0sa9aTO9GezbJQGe+1BO6y9U3k6jW+xpk80Py
         ZVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756817168; x=1757421968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kn8pqlkvI8BkvlrFlfSozqitc0dmKXQH5rpgTQNMM/U=;
        b=OFH9Z08/kGduRhPPWrHEHiuBPMvxA8z1x5vo5mlIqJF7oTyDQ52Q2TEkJOq5umfJPA
         VOjGjb2WuDb9ba5aQbQtNZj2xZ70JGDVWz/EEAaECcXJsHLwwe/CYHwP+FcXjjR/rw29
         v27ju6eX1AEHjO40JOJHT+dfTec4ZQN179H+GXvnRV4YNGWL8tjeYgH6meMlrCSoEcVq
         ymIqyt+BuRxE+0qI6+xwIfY6lVYQbWXJzjUMkGg5QduIbCvPIDuL04CEaU/wNCQyde1t
         dgnvygKyyWbj7XSidj3bOBlGApTG5WcOgiBAI0Uqf2HxH09kmDJXcqgMvmN/NdNipMwB
         J0BQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6pU2hukqhrHfrQKQ3CY1T8XQzCiR2JcGbiXeIalszu1k1dpt7ZG/MCwTH9hrGWGJqRwE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ8gxV7YRjx4v5gO3O+7Hr0kSttyDQqJylHP32Ti6oHQBW0f8B
	tpZDbknTlkKTSlQ+ZL+lZQd8uRVu48LyhBEM40wRjnNnlldk4AfsYCdcrFbQ6dn8erk=
X-Gm-Gg: ASbGnctR/sG/kjZNMwBaz3CztJBTm1ova0/x6Pma5GhIv+3YV65o0w2LOVzGKyUj3U9
	6LcXRLlQCCGXv+KYTqhopYVZvVBb+w1Tx8lpqJp6MofobWL3q3II4wCOHC2m7AKdmIUatPmIrHf
	TKP1XW76XdMH/6aRTh0tsGAsAPqyJ7U2LKddzQZtUIcsGrDzJ+aCfWze8uQ1gIkeJ8dBvatvQyY
	yBPB9Dvvpt2oYvZHgv7tDNRFDQuDlXmbIIYvgM5YsZzvsTfA0yLEOUOwX2B0LS0uBMB1WcQJxB8
	64OF0Y8xtJ0GHgpK61VUsN7RVEKGZnPyeMoRsfCRhUQ2D7Qg/6ZqSpql3fq/vx2fmzTnnMFLMh8
	SMVrkm2FhPePQN2mZCIe9CyLWbIdpA4I=
X-Google-Smtp-Source: AGHT+IFdtM4/TLGwP6fe/R2gAZvK0+s/idu1aQn5sBDOWhmpmHH0V56Svb4t3Yx0WsS/OmGQzPbJ4w==
X-Received: by 2002:a05:6000:1786:b0:3d0:e221:892e with SMTP id ffacd0b85a97d-3d1df633bedmr8952104f8f.27.1756817168257;
        Tue, 02 Sep 2025 05:46:08 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf275d2717sm19589896f8f.15.2025.09.02.05.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:46:07 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 02 Sep 2025 13:44:54 +0100
Subject: [PATCH v6 2/7] spi: fsl-dspi: Store status directly in
 cur_msg->status
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-james-nxp-spi-dma-v6-2-f7aa2c5e56e2@linaro.org>
References: <20250902-james-nxp-spi-dma-v6-0-f7aa2c5e56e2@linaro.org>
In-Reply-To: <20250902-james-nxp-spi-dma-v6-0-f7aa2c5e56e2@linaro.org>
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

No functional changes intended.

Signed-off-by: James Clark <james.clark@linaro.org>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/spi/spi-fsl-dspi.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 654905a358e8..48054932d517 100644
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
@@ -1005,7 +1002,7 @@ static bool dspi_rxtx(struct fsl_dspi *dspi)
 	return true;
 }
 
-static int dspi_poll(struct fsl_dspi *dspi)
+static void dspi_poll(struct fsl_dspi *dspi)
 {
 	int tries;
 	int err = 0;
@@ -1024,7 +1021,7 @@ static int dspi_poll(struct fsl_dspi *dspi)
 		}
 	} while (dspi_rxtx(dspi));
 
-	return err;
+	dspi->cur_msg->status = err;
 }
 
 static irqreturn_t dspi_interrupt(int irq, void *dev_id)
@@ -1038,8 +1035,11 @@ static irqreturn_t dspi_interrupt(int irq, void *dev_id)
 	if (!(spi_sr & SPI_SR_CMDTCF))
 		return IRQ_NONE;
 
-	if (dspi_rxtx(dspi) == false)
+	if (dspi_rxtx(dspi) == false) {
+		if (dspi->cur_msg)
+			WRITE_ONCE(dspi->cur_msg->status, 0);
 		complete(&dspi->xfer_done);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -1069,7 +1069,6 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 	struct spi_device *spi = message->spi;
 	struct spi_transfer *transfer;
 	bool cs = false;
-	int status = 0;
 	u32 val = 0;
 	bool cs_change = false;
 
@@ -1129,7 +1128,7 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 				       dspi->progress, !dspi->irq);
 
 		if (dspi->devtype_data->trans_mode == DSPI_DMA_MODE) {
-			status = dspi_dma_xfer(dspi);
+			dspi_dma_xfer(dspi);
 		} else {
 			/*
 			 * Reinitialize the completion before transferring data
@@ -1143,13 +1142,12 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 
 			dspi_fifo_write(dspi);
 
-			if (dspi->irq) {
+			if (dspi->irq)
 				wait_for_completion(&dspi->xfer_done);
-			} else {
-				status = dspi_poll(dspi);
-			}
+			else
+				dspi_poll(dspi);
 		}
-		if (status)
+		if (READ_ONCE(message->status))
 			break;
 
 		spi_transfer_delay_exec(transfer);
@@ -1158,7 +1156,8 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 			dspi_deassert_cs(spi, &cs);
 	}
 
-	if (status || !cs_change) {
+	dspi->cur_msg = NULL;
+	if (message->status || !cs_change) {
 		/* Put DSPI in stop mode */
 		regmap_update_bits(dspi->regmap, SPI_MCR,
 				   SPI_MCR_HALT, SPI_MCR_HALT);
@@ -1167,10 +1166,9 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
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

