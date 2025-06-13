Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B163279DDE
	for <imx@lists.linux.dev>; Fri, 13 Jun 2025 09:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749806966; cv=none; b=WrGmXsB7kTWj6H/IMrri+NxyiVdB5vTxZObhPkrl5V2pwwTxA8WGObOHVtti2JKY2EvlBIdWrepRD1q/b0HkbmpFrjLkCr7C7EnyMu9Onm50suXRkv2wW1sBzgx4eMZSZ05PzKIai6nyIuhf9baghUUnylbtH+fk9y56oHkII6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749806966; c=relaxed/simple;
	bh=I6Uh0W1U/pEscoVd7miIYAu5wzDsffordzyPGY3jblE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EU+5D/2PUJ5OIrwrMf45zmp9HvMIbvi389AsQV6ibKkFc1Ha4lOHAyVTOg4jr+wC6aNj0SRog6FxCYYE5Nh4EdWH2QaDU4R7pDeMCf9sJDUU/BSNVej80faqP0K3kKsNjhmTY405ec+dqDnJsTkcQmVCW35nea+ScGOZqJrfJwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WnI1Yt72; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WnI1Yt72"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a5123c1533so1229757f8f.2
        for <imx@lists.linux.dev>; Fri, 13 Jun 2025 02:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749806963; x=1750411763; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jkMuSosV7oMRxRtp9yYE+2UdziIG4xoxewf16F9X2EY=;
        b=WnI1Yt72TzHzqA+2LSdwS9A0gSGpOlIQsMMPSvpdfQVMaNUn/R+hEiqckvq94zYNJ7
         MtFOG7Nw0qqBNK9JLufadkzY5yfDi41Z30b3cvZb5cfbC1ddYIH0IofmoVOz9iqpETEJ
         4TiyIWRbe8tAk3/kirxZrjgdkPDfgGG+ffZHsQnVzcPLRYg2hwOc4sm8oPe4qN1ZVQJj
         rNohM1tCVkpAmwoWbpTmZKFkJYMEZ320PsKMBqi7wIz9BXKEEqqoi65vjaZlXOQWGPER
         zxSYCNUF5CCP/DMsVeyP3oXdwesXDM2qSZs6hQkRaOzefIe06oZ0REbVvrci31uAbGX0
         1Y1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749806963; x=1750411763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jkMuSosV7oMRxRtp9yYE+2UdziIG4xoxewf16F9X2EY=;
        b=MBmpqQHxjsS/pz7PQWuzg05/qq+DeangUflZDNDW32B6flVUC7taqC3LXr6iPEIblL
         x7s1di6sPZgF9uaQdRbw8NyNaqMEnhbBGPMMgyquCO908Ul2eHXhwwJmLFvQcmBqgkc7
         tNOtRQESBHAX7GwiZTAcdeTg+SHDF0jTECI+RgAoviq/XVrzrEje2Aa9ReBaPvFXeMBV
         RDmwWsq6/4eQYGlA+9b1aGw7B7BZ3iiSQGBUZR8Af9ukt6c02ukWSgXB/FfUbDpwOVFy
         DyKZ0X3HS+ZyGAWvuX4qhKDWi/MGchT0QwRIbDKANFnjL3ncf77oJyMLBL7hf6uU5ap9
         tlrA==
X-Forwarded-Encrypted: i=1; AJvYcCVlFd1Z3e0cPoZz9MozMTmrsCqeA8Wg58qkkGztatFoEa6N1q7I6jL1nOpwSGzOAnD2eWA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6OEA3je06UArsneeiYpneaZbIhcwgeMGLQaI1hQLj6paniFfx
	+Myh82wl/Ak4ONv50l5robciDSszFnE1VHSKjusK+hoIZ1vlSzEMIcZZehVd28tMvmk=
X-Gm-Gg: ASbGncvNZgVNF/p14qnN5hHIyJjjlS0z5/DL2UqfjTxfHGGXPNgpkQpACINR9x2kdYN
	VoMw1P1NAbk4OW9a7sZxUGYRecbdd+YLICdlyw49z2naTGNTdyBrKRV+ZmuBWaHFpCBN08RSG3Q
	Bb7JO9T+CNOIuT0FPE4nrJ+n9Q0Sg6onGg55kZaH8cxkTBHhvXJWCk2rEVyaqBfmd7zoZ5ef2PZ
	JOAbmjuXc2kiFg+UGtINFm4W+Tyd1zg0MtpBwJaiCtVBmhqRITK0vV9J8EvInS4/x7Q66g8wXFI
	LvQ1XgZXCB5RFi160H6bFctLrOGUzrR7WBvcnvoMqiruRrnAVY4E/vrvM1StLsdg39FhnwA=
X-Google-Smtp-Source: AGHT+IEsyyMaonG3OncFCbaWDdIJZCvvUaIQLI58D11q65RDAUSxHg9lX/idRHq3zl5QhSt6SMknHQ==
X-Received: by 2002:a05:6000:230e:b0:3a5:276b:1ec0 with SMTP id ffacd0b85a97d-3a56870835emr1942312f8f.45.1749806962900;
        Fri, 13 Jun 2025 02:29:22 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08a2bsm1805946f8f.62.2025.06.13.02.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 02:29:22 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 13 Jun 2025 10:28:56 +0100
Subject: [PATCH v2 1/5] spi: spi-fsl-dspi: Clear completion counter before
 initiating transfer
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-james-nxp-spi-dma-v2-1-017eecf24aab@linaro.org>
References: <20250613-james-nxp-spi-dma-v2-0-017eecf24aab@linaro.org>
In-Reply-To: <20250613-james-nxp-spi-dma-v2-0-017eecf24aab@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Arnd Bergmann <arnd@arndb.de>, Larisa Grigore <larisa.grigore@nxp.com>, 
 Frank Li <Frank.li@nxp.com>, linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
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
 drivers/spi/spi-fsl-dspi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 04c88d090c4d..744dfc561db2 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1122,11 +1122,19 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 		if (dspi->devtype_data->trans_mode == DSPI_DMA_MODE) {
 			status = dspi_dma_xfer(dspi);
 		} else {
+			/*
+			 * Reset completion counter to clear any extra
+			 * complete()s from spurious interrupts that may have
+			 * happened after the last message's completion but
+			 * before the module was fully in stop mode.
+			 */
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

