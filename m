Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A6D28D8CB
	for <imx@lists.linux.dev>; Thu, 22 May 2025 14:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925566; cv=none; b=IJE7ULa2b5X+C0WvRLpnDUbWTSkEX7FXy0Bt9GlMRVJ/J9G+3ruVs4DAmDPFuPEkcZVHaISX/kVXSEZMY/k0ReaxhiZc5p4m/FALRKo78VQZmia8uyl0HFP3ok3oyZKD66QfDGqACpMAgl6p+5Mh70tj81tYPRlv46GaKU240RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925566; c=relaxed/simple;
	bh=Gr3cboO2VgYqQP244ZhA1hFWwPu7MtqcNmqMsKaVD4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l0zyOg/PPnX19788tYgU7fv1H9iuYk8NGFJVMS6huyDpnSa9eKSx+bdEZFAEAwnRSX1wNjaPSdCnXg9rQ82rBljr+R+1oYkvfpVkjC06MkxwW549hj9dYZJ+oYQnElGPGZwp96uWIjFQm8qrB+2VJowvVssv8RSEtaDXZfeDqng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rMIbfoRi; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rMIbfoRi"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf848528aso74011115e9.2
        for <imx@lists.linux.dev>; Thu, 22 May 2025 07:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925563; x=1748530363; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WnsHBRMSS57g5A6Zsxv5fUehUSBOq6hPCzrwmSugvPA=;
        b=rMIbfoRiKTd05H1W6M0aSzSpHCaGNeAQq09A8y53pufWWWUyuZFhAB0kx0RwjMixEz
         GsLRucgod9I6YZ77cpaHPfFdgdNq0TCZKZQICy/sZfyCew5gdAPgKf2X0AE0RZdo3EtE
         0IJeVV7Je/JYRqnIZize8oWfEwQEunN+lEuVdxy4AsjQfzGaxL213cn29xZCLFZ80fnE
         MroGXOgCXvwbDQZcud8vqo2TkWK9hdAg5M8s3hswga4IbOwIjoH8AARt66rnGD814i8g
         ShpKj9MR3zIpmIzCrhB1K4a0WKFDFaqtH8VQAYZxJugHKKYiyOO3f9xgwKWdzapJiXzP
         jVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925563; x=1748530363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WnsHBRMSS57g5A6Zsxv5fUehUSBOq6hPCzrwmSugvPA=;
        b=ubYr3SKZvC3tnsI6FmQw4VGRyRDqgIZo/MSxI0fzupO8Z4gLUbd3ytnqayPurtIS2f
         w/NJF4k+HGsNq+Ntf5628pv3/v7t40Tf9eU7UiCUB0OAfcdhO4W0z+iIOSSumQ0Lw+AE
         kyq+7DB2XWg/PXy4cByjfJ6SSoIychnVDmtogKXbgM2jgnuJalGqBJYh9PKEnUCAPatl
         gm1/PFdiAvjAQpmqXGe88Ft8F7l5fvhc0hmHX4jiT0+JnO/LYMZpvpt2SMYBLVqc0Q/i
         hF9nohAS3rjoSVK+S3hI/R/D4/xz6t5MxjQz2wBB/6rRxwJJToUQIXhb1OHJ0eJ8tXh2
         wHFw==
X-Forwarded-Encrypted: i=1; AJvYcCUbKfxDWoMDDXtJF54kFi+sLrOn3rDzQDILaKFNm864ET6My1ayuLriPyiKJfkHoWmp3LA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDmYmxSq6T3+BzGltoLBQv6csJXDgoE1qV9QsLgqPJWaKxJBtM
	VFUk0GpzG9c9yoyfLXJ3uKszvGbL05g/IiNJMbuzykAeZB+r/JiH2TPKxRP289khn9U=
X-Gm-Gg: ASbGncsuM8YCtm+VIXqNBW4U6LiuDUNT3JPoe+Lxa9jyQZHY9xIhaZOzwsBwoQhBJRo
	NWbrJIwJeojVW+zODt2WYOtbfMnepQiIg1cPjp8XDuXTUybibCO/zKGClx+iaXXnfRJHyGw0z0n
	irbBlGnNfKEulxzJoDeK3r3DWrda4qxSN20Nu3eaUqLutlqV0EKJSt1q/hWJapTQA4xn6GguETt
	rQmknNsxq0UaHJ1rJiP4p8WIhHBoC68qpW2fv8cqABpDDbAgErb8j7Sn2XV9wKPKXyk9dJ6W7GK
	9wxXRlUZ5nDWBnuWSiftsly6dqGkStDaqCrNLuLd79GHArSPEcrOdv7PnnLN
X-Google-Smtp-Source: AGHT+IEm/t82lB7n4D+jawYNq22d+sbqAeLEow+7pvP2Bzn0+lqXr94xgdIsdIfmG8+O8swf/6lS3g==
X-Received: by 2002:a05:600c:3112:b0:43b:c0fa:f9cd with SMTP id 5b1f17b1804b1-442fd606b99mr238110635e9.7.1747925562768;
        Thu, 22 May 2025 07:52:42 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:41 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:31 +0100
Subject: [PATCH v2 02/14] spi: spi-fsl-dspi: Halt the module after a new
 message transfer
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-2-bea884630cfb@linaro.org>
References: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
In-Reply-To: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chao Fu <B44548@freescale.com>, 
 Xiubo Li <Li.Xiubo@freescale.com>, Lukasz Majewski <lukma@denx.de>, 
 linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>, 
 Larisa Grigore <larisa.grigore@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

From: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>

The XSPI mode implementation in this driver still uses the EOQ flag to
signal the last word in a transmission and deassert the PCS signal.
However, at speeds lower than ~200kHZ, the PCS signal seems to remain
asserted even when SR[EOQF] = 1 indicates the end of a transmission.
This is a problem for target devices which require the deassertation of
the PCS signal between transfers.

Hence, this commit 'forces' the deassertation of the PCS by stopping the
module through MCR[HALT] after completing a new transfer. According to
the reference manual, the module stops or transitions from the Running
state to the Stopped state after the current frame, when any one of the
following conditions exist:
- The value of SR[EOQF] = 1.
- The chip is in Debug mode and the value of MCR[FRZ] = 1.
- The value of MCR[HALT] = 1.

This shouldn't be done if the last transfer in the message has cs_change
set.

Fixes: ea93ed4c181b ("spi: spi-fsl-dspi: Use EOQ for last word in buffer even for XSPI mode")
Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index effb460d436d..1fa96e8189cf 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -62,6 +62,7 @@
 #define SPI_SR_TFIWF			BIT(18)
 #define SPI_SR_RFDF			BIT(17)
 #define SPI_SR_CMDFFF			BIT(16)
+#define SPI_SR_TXRXS			BIT(30)
 #define SPI_SR_CLEAR			(SPI_SR_TCFQF | \
 					SPI_SR_TFUF | SPI_SR_TFFF | \
 					SPI_SR_CMDTCF | SPI_SR_SPEF | \
@@ -921,9 +922,20 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 	struct spi_transfer *transfer;
 	bool cs = false;
 	int status = 0;
+	u32 val = 0;
+	bool cs_change = false;
 
 	message->actual_length = 0;
 
+	/* Put DSPI in running mode if halted. */
+	regmap_read(dspi->regmap, SPI_MCR, &val);
+	if (val & SPI_MCR_HALT) {
+		regmap_update_bits(dspi->regmap, SPI_MCR, SPI_MCR_HALT, 0);
+		while (regmap_read(dspi->regmap, SPI_SR, &val) >= 0 &&
+		       !(val & SPI_SR_TXRXS))
+			;
+	}
+
 	list_for_each_entry(transfer, &message->transfers, transfer_list) {
 		dspi->cur_transfer = transfer;
 		dspi->cur_msg = message;
@@ -953,6 +965,7 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 				dspi->tx_cmd |= SPI_PUSHR_CMD_CONT;
 		}
 
+		cs_change = transfer->cs_change;
 		dspi->tx = transfer->tx_buf;
 		dspi->rx = transfer->rx_buf;
 		dspi->len = transfer->len;
@@ -988,6 +1001,15 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 			dspi_deassert_cs(spi, &cs);
 	}
 
+	if (status || !cs_change) {
+		/* Put DSPI in stop mode */
+		regmap_update_bits(dspi->regmap, SPI_MCR,
+				   SPI_MCR_HALT, SPI_MCR_HALT);
+		while (regmap_read(dspi->regmap, SPI_SR, &val) >= 0 &&
+		       val & SPI_SR_TXRXS)
+			;
+	}
+
 	message->status = status;
 	spi_finalize_current_message(ctlr);
 
@@ -1245,6 +1267,8 @@ static int dspi_init(struct fsl_dspi *dspi)
 	if (!spi_controller_is_target(dspi->ctlr))
 		mcr |= SPI_MCR_HOST;
 
+	mcr |= SPI_MCR_HALT;
+
 	regmap_write(dspi->regmap, SPI_MCR, mcr);
 	regmap_write(dspi->regmap, SPI_SR, SPI_SR_CLEAR);
 

-- 
2.34.1

