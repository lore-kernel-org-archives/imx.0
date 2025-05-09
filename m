Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD7B29188F
	for <imx@lists.linux.dev>; Fri,  9 May 2025 11:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788834; cv=none; b=SssxyrJYuP3iKH3Os+kYRk2ec/zj8aaJmzc4k6mjSasecT9WZSpAQsr7MR6EGqxs9zDtDX1VBNKDCzRg1gaAR/Ir32TIDLa92OwubY7ygzCKL1NwtnPc8n8Eg+/kZ1bYmMcphrISUyQSTluR5rxI9z596izPGWAmNWuo8jYkrZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788834; c=relaxed/simple;
	bh=gdl/1A2tWVRhxiGr8HNdkp2uLbfVXUsZjNQ28NMiOx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QIlwO4PGkESq/ccQ+bFMQJba+ibiGTaO5rvUPm503LwEYsBWuUtmYHfm5r6qwfSiDnxZUVxdd8/+txvzaSYFlB9t/vGJ6Cya46LanDE/EKq81c45oQpa3AMsODKxZC6JnHrfUsmC7LVnP2ouH8u1NnFxsFAej05JFWDZpIBcsoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zFEHrA4W; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zFEHrA4W"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442d146a1aaso18539645e9.1
        for <imx@lists.linux.dev>; Fri, 09 May 2025 04:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788830; x=1747393630; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vT4KOWN4uTm3QxGCYySEGWVVZs5ryN1meRZIg3C7iIY=;
        b=zFEHrA4WpeXhukdiqi/1za/8NlL74gf0OnrH4bQBySVsPdbZfLaNF0RHanb2BB9s1J
         XVvSnwCzmYsz9A1VXtaaJhH+t+POBsbGtbHv/cu2omBJV1Ve111DeCJJWTJD/mdYV9HP
         Xkw38tRndSWAMUQek9r56FvNmqaAq14nFAOLOcom6lG4JhRSa9bm6fYlxIC4TBCZZMQE
         IURr90mn868itzgRLvtPHnk4xrunqtVgHEIYy6ym8ZUt+Twg60n1nWgJInMKbwYiFRV6
         sC94RQRgimZIYGvDSO0iZHqzJkmh84XUnuBLaf/5p52eAIHC4ldddHSw2GwOOduzjpzF
         QAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788830; x=1747393630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vT4KOWN4uTm3QxGCYySEGWVVZs5ryN1meRZIg3C7iIY=;
        b=K5QCjx4v6oqM2sFhQV+DO9Xi6vDcgFDI+IT00dIYW+8kKjM8UzVrptA1wZBXUF7MW1
         AQPZpNjD4NgbEpaQKAmWYeUKT/9fUaHhZGvi5ZLIkFBFwNFRSUva7DpK2mQc1+LqXVda
         XTJNj+81k6Jt8yZLbfBBJ8OhRsilv6i9bOGXFIliOCcbGYhXLSb06cJQ/0RBnp4P2UMC
         rPENsBu9yONew1RII6cBSrOz/o2wC9t/FcuICcbeWiiWFZaSfSJbMSL4Y32KLY4mpmsu
         gvYprQon5TJMMvjSIezBjzj+7aO6gzbncN2cyOZolHGSfqtK8Oab5Lly4loaEV05C5ei
         kHFw==
X-Forwarded-Encrypted: i=1; AJvYcCXeWLOtKC0aI79dVWrLCm3M8LY7m7B6/003q1jdiPqtBBn2w19ynBbypt22mB2ZVGfhIkM=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywkf5iitRjw33Ckz/QoF+mgo3UE8OPcRLB7Ab2ZWZQ4Fm4d1edV
	Dj7CwXEy1SGqhE7W6r4b4GQHviGcMRw5KJ/SOzdyMXxDE/O2qREr4iYtCcjfprA=
X-Gm-Gg: ASbGncsDKBpkJ1EQP8zivqFxYV6GSdVVuU3g9zYo7nq/ce3xUr8ulOSsYAYebaGETgo
	dvn+CoqPdJ9Frg7FAlCWbcp+Q1dy0kPHH+HQnossuAj4F1ZLj2kdog0/voIONqMxgHA2WnDURtQ
	bf18afpNxTc6w4ue1sj9c9Q8iWXi7yPXCx2I5ViWgkQPqi0C6fm/xTvAdxuoKk5oYntW7xb8jev
	ZNEn5guiy6/XkEaOZYuHt72jpce1WSHoKMxHoyP2HzVp6JtdoWJia9JxY0TcoBQkKT4FvUw3WmN
	hLjl9i3OpGjXTLHLjmx/xoNmylF5MIsJb7BYN9sCjgeQUW8=
X-Google-Smtp-Source: AGHT+IGGXkJ58sLQbmi3wU/ta+YdLpsygJwEMpejLEliNzR91iBPwbbisuUDIlnG+jy75pghXWkjdg==
X-Received: by 2002:a05:6000:1ac5:b0:39a:cb5b:78fe with SMTP id ffacd0b85a97d-3a1f647a5b5mr2514501f8f.34.1746788829944;
        Fri, 09 May 2025 04:07:09 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:07:09 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:05:58 +0100
Subject: [PATCH 11/14] spi: spi-fsl-dspi: Halt the module after a new
 message transfer
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-11-32bfcd2fea11@linaro.org>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
In-Reply-To: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com, arnd@linaro.org, 
 andrei.stefanescu@nxp.com, dan.carpenter@linaro.org
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>, 
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

Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 31521dac1580..db921ee6305f 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -64,6 +64,7 @@
 #define SPI_SR_TFIWF			BIT(18)
 #define SPI_SR_RFDF			BIT(17)
 #define SPI_SR_CMDFFF			BIT(16)
+#define SPI_SR_TXRXS			BIT(30)
 #define SPI_SR_CLEAR			(SPI_SR_TCFQF | \
 					SPI_SR_TFUF | SPI_SR_TFFF | \
 					SPI_SR_CMDTCF | SPI_SR_SPEF | \
@@ -1056,9 +1057,20 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
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
@@ -1088,6 +1100,7 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 				dspi->tx_cmd |= SPI_PUSHR_CMD_CONT;
 		}
 
+		cs_change = transfer->cs_change;
 		dspi->tx = transfer->tx_buf;
 		dspi->rx = transfer->rx_buf;
 		dspi->len = transfer->len;
@@ -1125,6 +1138,15 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
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
 
@@ -1306,6 +1328,8 @@ static int dspi_init(struct fsl_dspi *dspi)
 	if (!spi_controller_is_target(dspi->ctlr))
 		mcr |= SPI_MCR_HOST;
 
+	mcr |= SPI_MCR_HALT;
+
 	regmap_write(dspi->regmap, SPI_MCR, mcr);
 	regmap_write(dspi->regmap, SPI_SR, SPI_SR_CLEAR);
 

-- 
2.34.1

