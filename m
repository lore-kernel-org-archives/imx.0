Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E739298CB5
	for <imx@lists.linux.dev>; Fri, 27 Jun 2025 10:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019739; cv=none; b=KH1QFqStwypFn6zEomceOlEMJ5U2drYCXymHbsnRr0nbVgc3kydRpxErbHKBdQ8PS2NJjFz5JCioWvMu2wsdT0NJbej8NOLKdt/vzrbSkJOmyDSINHLqT2oYec7cK7NKTLE5vaEQKYPijvJ/2PH+FZoBlote4tDrW4PrB6PyHE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019739; c=relaxed/simple;
	bh=W5RB8ofdrCpDCxp+XelolJjRKHlOwBuWzYdhjuY+18A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oKZvGNid5eEObQZP1c/hydyZUF4+2rqxWfNY44a3CdN5AikEMUuniCUWt0Dqqleru/XODOdXCyW163GvkEaA39mkhUdDhBBcNFpJTRWsUhQVFDSBP93WK5iCwNIzCDfrQnDhqrXfMDbRjzOC4fb8LbmhLA2O8zXjQFZB5LYCLMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wAATGgDf; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wAATGgDf"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45310223677so11900685e9.0
        for <imx@lists.linux.dev>; Fri, 27 Jun 2025 03:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751019732; x=1751624532; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q1FhM4WVr7ZEX7RFMvmUpdlE0FbKvEgU2ax6ATn6XZY=;
        b=wAATGgDfRJ4ktwc6q7x0cqytQWBYDUnbR3/65+OAXVL52fjeMb2Z451hN0grsIU7ob
         4p9pMQZ+XQLD0hXQhJuVsWMOlmmp9jrfIQ62C35RU5lWVLEiUJWzCRK9V+byT3nSb8x9
         Iu3x5LranF6DRDfgBYXk/S5vZ06xvWUFxSZbBHny8RTHGSZDbMfCHNM8eJX5CJCHQPE/
         LORO0ic9wo3kr/w2T6TSih7sMg8xomuRltNOMJ/q9ZlUbuswEXEv7XowZHiEX9ucC8Aa
         qe69zLZWp52zW51ha0Gxz92GbTIXjusUxiyuPmXNB3VEDe0FKwA0QsETdtiVRXe9k5FX
         8omg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019732; x=1751624532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q1FhM4WVr7ZEX7RFMvmUpdlE0FbKvEgU2ax6ATn6XZY=;
        b=V/kDjfTiclOERtUoq2n5h7V6oNs5xjlF1VffH4diteSfTP10dR28ggOd676Er9Ix19
         rjshmlBsXE59HP4Vgs8kDa3vT/9CSPguS/ZOLMn3djmTEhTbm94s26py7A3WNcAam1QH
         9RpiNlIKj1sJ2gj3lhI4bH8XMSVwbccKpmvm7FdEziHBBPY/NetmR5jqqJYevBSO/jHW
         AM3EAXlLdMLHMDsLDhufenuLcNbmsXTHWVLwk+D542KnR3BNIJNw6WVHXLjJhJDXepUl
         XwyDAifu6UkZINrAyO8uvWuhq5mtshe/91xxLrQWbSfts8Li4fEVXnHCpAFb8vooi335
         S6IA==
X-Forwarded-Encrypted: i=1; AJvYcCWlLT3c5JHf3ExW5Ll8HklOe7XDSrAfvtqCTngCF6rTANcmaXf3qSQOyrPgA6BZfBZi+dc=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywvsu6UirS2OyWuPmlPIzFf+TffMpmdxTQ/LURftcMpWiTN51rc
	BKoDbJlqQplSqroUWZzhutM8946oxzpQrgVTSrSsXKnj5l2xZv9pKdI4eGcpXsecBuQ=
X-Gm-Gg: ASbGncs5v11GfsLE+sbmXd1QuDhbhzkW46ckdMYmnQmzYOEqc0u28woVGyrC4j6uJrT
	dHNBOqUv1lfo9YhxGMhV8+AgISqk5/1sgxM11+dOjCWa6D4C9yif02kNmHaF/K5bFgXdl8XF3Uk
	W3xRq5Tvy+48vF7yYD4QTpooFtuQDrSeercKwu+LQsIMW1x2hTx7+Kl6mkxj7puggWgdnSe0foe
	zOsjfp1a2QF9KWhQu9wNDw/8y2VD1qrJbSIvK4wb/aTA2ghIJq+BBF1PGR/ogYEtNnDGUS4I6ea
	+3EuyjgFe4menRxdfsDc44wZ4G/QQtsjeTzWKXPUnKZEjcQwd+jpHwMQe8wWXRmxeGEW01A=
X-Google-Smtp-Source: AGHT+IHlOyXervQn+haGiBOZ0vl0FJLTAGumJfi3y5HJSPxa1Q9XBHEO6HL8VaKj5iB0Ic1H05DlqQ==
X-Received: by 2002:a05:600c:608a:b0:43c:ee3f:2c3 with SMTP id 5b1f17b1804b1-4538ee4f7c2mr28086715e9.7.1751019732480;
        Fri, 27 Jun 2025 03:22:12 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a5599sm47250955e9.13.2025.06.27.03.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:22:12 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 27 Jun 2025 11:21:39 +0100
Subject: [PATCH v4 3/6] spi: spi-fsl-dspi: Stub out DMA functions
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-james-nxp-spi-dma-v4-3-178dba20c120@linaro.org>
References: <20250627-james-nxp-spi-dma-v4-0-178dba20c120@linaro.org>
In-Reply-To: <20250627-james-nxp-spi-dma-v4-0-178dba20c120@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
 Larisa Grigore <larisa.grigore@nxp.com>, Frank Li <Frank.li@nxp.com>, 
 Christoph Hellwig <hch@lst.de>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

This will allow the build to succeed with !CONFIG_HAS_DMA, either due to
a randconfig build test or when the target only uses one of the non-DMA
transfer modes which this driver supports.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 65567745fe9a..feff475dddfc 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -373,6 +373,8 @@ struct fsl_dspi {
 	void (*dev_to_host)(struct fsl_dspi *dspi, u32 rxdata);
 };
 
+static void dspi_setup_accel(struct fsl_dspi *dspi);
+
 static bool is_s32g_dspi(struct fsl_dspi *data)
 {
 	return data->devtype_data == &devtype_data[S32G] ||
@@ -468,6 +470,16 @@ static u32 dspi_pop_tx(struct fsl_dspi *dspi)
 	return txdata;
 }
 
+/* Push one word to the RX buffer from the POPR register (RX FIFO) */
+static void dspi_push_rx(struct fsl_dspi *dspi, u32 rxdata)
+{
+	if (!dspi->rx)
+		return;
+	dspi->dev_to_host(dspi, rxdata);
+}
+
+#if IS_ENABLED(CONFIG_DMA_ENGINE)
+
 /* Prepare one TX FIFO entry (txdata plus cmd) */
 static u32 dspi_pop_tx_pushr(struct fsl_dspi *dspi)
 {
@@ -481,14 +493,6 @@ static u32 dspi_pop_tx_pushr(struct fsl_dspi *dspi)
 	return cmd << 16 | data;
 }
 
-/* Push one word to the RX buffer from the POPR register (RX FIFO) */
-static void dspi_push_rx(struct fsl_dspi *dspi, u32 rxdata)
-{
-	if (!dspi->rx)
-		return;
-	dspi->dev_to_host(dspi, rxdata);
-}
-
 static void dspi_tx_dma_callback(void *arg)
 {
 	struct fsl_dspi *dspi = arg;
@@ -589,8 +593,6 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 	return 0;
 }
 
-static void dspi_setup_accel(struct fsl_dspi *dspi);
-
 static void dspi_dma_xfer(struct fsl_dspi *dspi)
 {
 	struct spi_message *message = dspi->cur_msg;
@@ -722,6 +724,18 @@ static void dspi_release_dma(struct fsl_dspi *dspi)
 		dma_release_channel(dma->chan_rx);
 	}
 }
+#else
+static void dspi_dma_xfer(struct fsl_dspi *dspi)
+{
+	dspi->cur_msg->status = -EINVAL;
+}
+static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
+{
+	dev_err(&dspi->pdev->dev, "DMA support not enabled in kernel\n");
+	return -EINVAL;
+}
+static void dspi_release_dma(struct fsl_dspi *dspi) {}
+#endif
 
 static void hz_to_spi_baud(char *pbr, char *br, int speed_hz,
 			   unsigned long clkrate, bool mtf_enabled)

-- 
2.34.1

