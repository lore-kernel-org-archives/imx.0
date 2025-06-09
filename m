Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC211F37DA
	for <imx@lists.linux.dev>; Mon,  9 Jun 2025 15:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749483221; cv=none; b=kP8AroZRQ4uZYIClRo5ohNoe1hC8AK8/XidIrwzzCupr/8WNmFcYY9EE5soQQir7ptkA56/56cbzAWuqZ29ECiI1+xWM9p3PwWhsDlFggd34O7ReovBNgB5A6xNCM3EYrK3Ue2jmWgHuqEMQOS4G2r3BwpXGGF7kMHWTY/53gVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749483221; c=relaxed/simple;
	bh=4LtVV7NunJznOE+EaQyuaoEsQbLFTKYk/hWx//k49f4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VJmmPIM+RtDM2lMSImDzf44yQwE0ltSyw5XxShzxTEGeWKN2EnEkvJMNvPrqlz4T3S22IA4rz4HL7Z9f4/JeLAsF1bWRPDdLtYHL3zxSygf1dUEly9m69MBkjvPnWxdXGgj0sCMd1F9pNFTJJSfhMLiZNuNmbfDlnj4qhvdVLJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tgJMHfoC; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tgJMHfoC"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45300c82c1cso5976675e9.3
        for <imx@lists.linux.dev>; Mon, 09 Jun 2025 08:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749483218; x=1750088018; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w76Nia4/b18xDXgyG3usj9/ef74AF078cya8aFseaFQ=;
        b=tgJMHfoC4mFWJWLO2oew6xlJ6JIHU6C9+nEtSSaYehO7O6qR5re+8feH+gvDiMg0ng
         vR12doQGBaTtHbSgXiHE2GF0PRy+GYBap+VddZhDOVmCrVII0rPWjaFA8TWR+5g+T+Bo
         TEnLZXa263zv07XegDC00vUO3kqp7FCYmcTLF0gc6yeKFTWbFTnyLyj+rrLT03IT03HH
         brSM/GEf9XJQigyBbnJaui18RSmmB8OrU3/MUzu+UeIPHRl5Od67l1+kPnInYN3ACRwZ
         0gpN508xC8ZhYo8Mi8niznnbTW7hXOMDZwFKgUNmS3v+2vbnkRfBnrM6S6fkVLRql3RU
         8GUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749483218; x=1750088018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w76Nia4/b18xDXgyG3usj9/ef74AF078cya8aFseaFQ=;
        b=S5Eh+c62JacGCrwnIxZBymK8B1hD7XE2LHBWTddTAvqH0DZ3fZzVZOWkfUFf5yOanz
         RHklrqlrO+vpM+nQcaEp3e+PojbN8KLIEwqrb+rIgRC60vB2wHj3vvadvYuZglLgHm5S
         iGAGvujgLoSIOWYg5Fgjgcy1mRxPFt9/IDXS2xJGGJoJ8S2owkZwDkGEcumBKlvLa5hS
         2CmN1OV7ohre9cOyC6BQ/vlcyevGyByW5P8vOzvOgB3uP1db5dm/s6SEPafSv8Jm4u6G
         hPgZNRzNvBQ82gVaFVNBqM1fioP5XLvbJGnyCRKk5csr68FlPCeXTParQFxuMO/sEMhv
         XH/g==
X-Forwarded-Encrypted: i=1; AJvYcCWhKRWQlZqBl6OqGhISNtd1MglPSfX0Vpve9ZVP9/MUm62jsfvS9j33TPhBU4mgh7QbfmA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUyA9SmaPC9OQgINcNLZFICHW0yymo1SQYjOJlFplf3c8TGfRb
	bykssLZ2sV1oqme1wbpN0FXSS1vS/RWxZs0STuvf8ER8Idv5Vtw1xWGbObqsv4o8esk=
X-Gm-Gg: ASbGncutMBBEuRPkb8gNkogV+XQPGPA7kwjH7t+4y7R/VTy7JaoCkjZUkMXf/EEHbzI
	1xcvRR/1r1ZVHyQ4gz/RzhzJa131gjb9+6LoLwZDbtqHNZPILL96tmkUl7LXS83b0vc2/OdbP6A
	Fyi6QhtgIu8gsYHNgGdbNVqe02CWgOpben9snyJkUp9mGdwb8j600gHExkSu61htucXyb7hy9e0
	kRbNq8thKfxlMMfBpmnP9dd1GAcfX0srGj6RS04X5h7OqftJeox/IZpS+FDtAA8NKQH5dvEOHD5
	kkA1aPFXzd8JYKBA6GO7tfUGSdLhzvYf5N4dJoFgs224Z7MPUxLO02DmCEcN
X-Google-Smtp-Source: AGHT+IHTutHePoysGpxZsOPgKbbegSZRp1NNHCZCZ3DEAcLjya2vTKpfVY2DnsnGhoEdBoFuhmwPoA==
X-Received: by 2002:a5d:64ed:0:b0:3a3:6a9a:5ebf with SMTP id ffacd0b85a97d-3a531cabb5cmr10875439f8f.20.1749483218204;
        Mon, 09 Jun 2025 08:33:38 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452137277basm115728695e9.32.2025.06.09.08.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:33:37 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 09 Jun 2025 16:32:38 +0100
Subject: [PATCH 1/4] spi: spi-fsl-dspi: Clear completion counter before
 initiating transfer
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-james-nxp-spi-dma-v1-1-2b831e714be2@linaro.org>
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
In-Reply-To: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-spi@vger.kernel.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

In target mode, extra interrupts can be received between the end of a
transfer and halting the module if the host continues sending more data.
If the interrupt from this occurs after the reinit_completion() then the
completion counter is left at a non-zero value. The next unrelated
transfer initiated by userspace will then complete immediately without
waiting for the interrupt or writing to the RX buffer.

Fix it by resetting the counter before the transfer so that lingering
values are cleared. This is done after clearing the FIFOs and the
status register but before the transfer is initiated, so no interrupts
should be received at this point resulting in other race conditions.

Fixes: 4f5ee75ea171 ("spi: spi-fsl-dspi: Replace interruptible wait queue with a simple completion")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 863781ba6c16..386a17871e79 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -983,11 +983,13 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 		if (dspi->devtype_data->trans_mode == DSPI_DMA_MODE) {
 			status = dspi_dma_xfer(dspi);
 		} else {
+			if (dspi->irq)
+				reinit_completion(&dspi->xfer_done);
+
 			dspi_fifo_write(dspi);
 
 			if (dspi->irq) {
 				wait_for_completion(&dspi->xfer_done);
-				reinit_completion(&dspi->xfer_done);
 			} else {
 				do {
 					status = dspi_poll(dspi);

-- 
2.34.1

