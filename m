Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07D028689C
	for <imx@lists.linux.dev>; Tue, 24 Jun 2025 10:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750761400; cv=none; b=Cp+OgdpoUat1gFGFuxdOJUHcpF0gdlQEC2SWayZub6UQltaKXK6So41i3Cj4VOZQ+K2LhCLE7WRQ+2enmoZosSF/KkZv8y7ppzXNgdjn1gb3RXykVIS2VnAmRXzLSsBTCiqnGkZM8ZCIEVYl5mh7s9ou4mph8lHTwK4y/t0cHdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750761400; c=relaxed/simple;
	bh=Bc44HUdFlRBGiPqYEyrxvW7lVxJh2JmM3ACL/8dmNuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZL85b/5z0+tYEQktiQLeafdiey9UPPV6BhydbTywNn2ZYmeXnJfrndx3czi2gJFg5zQNbIqTrX4FprpVFTQ3fD5dCwV25/glBtILSJmIFeqgslLAdmsVNGIoQZX7Ev6quCW7/SDHlirtC4Vg/YdeZchrHFd4ld+nOCIpqsZlGlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xqD4Z5Aq; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xqD4Z5Aq"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso4352057f8f.1
        for <imx@lists.linux.dev>; Tue, 24 Jun 2025 03:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750761396; x=1751366196; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WhsIPhnxdKWsYdEi1ghU1/oHIl+/WH0rhmItuuKdl/c=;
        b=xqD4Z5Aq8t8uKmYA+7vDfnPWJmuZPYKBnH3bhfEYT9Af7RdeNCJgTYPFytjzg4RWFW
         aafnRQ51kI7HmZedqOeOdU7xZyilxljDDuCBOUvEdEuMHkav9MT4xAeKfRVOeyAumnHo
         8QKYZN8ElOsbUoRiE9g3vQxycHZ9yFttxhirumPsJmfXYQDvS6iMOOum371CMsI9lYmD
         FbGxztXeWkQsn/4e+dMq/yTWcmH0iwTuwlVoxZhPZBZFoFYnIKrb1wcZb+YWkx6EZc6v
         HnTLRdoO+U+SYqWL5XODF145gJY5LqcPMJb/ORySXrq+F+wY5MFIFztJacrrcVjOr97W
         DFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750761396; x=1751366196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhsIPhnxdKWsYdEi1ghU1/oHIl+/WH0rhmItuuKdl/c=;
        b=J8sKQvFx6lFDUcsUxI1FVvPUePBNA2qKStGOc/vyStaI58ua9PmBAtVFBk0o7L4BTy
         3ODIbMCtOooFGHtKTTwzyuZHeOObfUqFN7pUMAV9WTfVZy0QYxXuiTQTddP9S9A+RtCt
         4lLIkTO39RS7Za14C0RHS0N0gtgOeQUj/Cdj8OM7Ye3V1VhPs9O+iH8vhAGW+rxEUYey
         4SNaf9+ETtJ4XtHuSyuz1SVv0B+j0YAONTdOHFEveVggtH7ExOGqeT0o0W7IORClv4wD
         DIHFsCVlPCwvCW2xu55MakEXs94TnrvgU5P2MFaTeASLSFrJw/DbBs/ZbeZoDMzeoRsu
         Z3rw==
X-Forwarded-Encrypted: i=1; AJvYcCUvjshwQ01MFRm+7CLRR6u6uc8EnLo1yuVpF1ZzofLEei0zQe5pkU8qtaV2LyzjuRMm8eI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZAYWOMpLzrWKdnlz2pK4gXHMTzDpjacZO5joVatm3ZdUmUaTx
	LoqGAfUUBtDDof5XPJ6IqbzRdrVhxgtoVIo+d/gTI/XQndyUsB9ebxVUOTdlTg2BcPM=
X-Gm-Gg: ASbGnct8xJoz/oyQ8nmV+QbxCayOERCzgK5Fr86U+QTwbOZQjw1sc4FpBCAD0a38PzC
	5azQM7lRnjhmpFS0+g2PVancPo8I+fXpFqzX7I0unlVeeQg14rzNk3kU0QQEYQdU60CgtitjT5M
	s8t5uOzMHMt2mJ3PQDOA64Q3VVdUNvVmi5zNVPY51xbcBoQH2SbBPnHIXW7CqJuzpRFzh9vuBlH
	qa2MWIACYPbDmJFXxFM5oo+eIngfPj1h2Qn6hY5OfoqR+pSiMYZ2pHB9UsgHrJT9tOKw3SRfLjJ
	qfW3g35M7x1vVd/BOSe99cgRaIWkdUH6AYH4yo8JooP78tJtoNlDGwAh02FdBVbOJ8TMnFI=
X-Google-Smtp-Source: AGHT+IGwIII2547BzKkspjqdAo45Jmh+wiE9tjt9HqPdqBs9RgITkmkDb4pqs/WiMRYtkkZacJt/KQ==
X-Received: by 2002:a05:6000:178a:b0:39c:30cd:352c with SMTP id ffacd0b85a97d-3a6d12c43e6mr12087710f8f.8.1750761396110;
        Tue, 24 Jun 2025 03:36:36 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb641sm143398245e9.3.2025.06.24.03.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 03:36:35 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 24 Jun 2025 11:35:33 +0100
Subject: [PATCH v3 3/6] spi: spi-fsl-dspi: Stub out DMA functions
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-james-nxp-spi-dma-v3-3-e7d574f5f62c@linaro.org>
References: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
In-Reply-To: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
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
 drivers/spi/spi-fsl-dspi.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index feb29bb92a77..8212c4193536 100644
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
@@ -489,6 +491,7 @@ static void dspi_push_rx(struct fsl_dspi *dspi, u32 rxdata)
 	dspi->dev_to_host(dspi, rxdata);
 }
 
+#if IS_ENABLED(CONFIG_HAS_DMA)
 static void dspi_tx_dma_callback(void *arg)
 {
 	struct fsl_dspi *dspi = arg;
@@ -589,8 +592,6 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 	return 0;
 }
 
-static void dspi_setup_accel(struct fsl_dspi *dspi);
-
 static void dspi_dma_xfer(struct fsl_dspi *dspi)
 {
 	struct spi_message *message = dspi->cur_msg;
@@ -722,6 +723,18 @@ static void dspi_release_dma(struct fsl_dspi *dspi)
 		dma_release_channel(dma->chan_rx);
 	}
 }
+#else
+static void dspi_dma_xfer(struct fsl_dspi *dspi)
+{
+	sdpi->cur_msg->status = -EINVAL;
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

