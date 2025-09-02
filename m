Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFA42853E0
	for <imx@lists.linux.dev>; Tue,  2 Sep 2025 12:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817173; cv=none; b=HNbVJZv2DHwyPiuWSj8aUeHYmNSc71+VreGW99ZBkHkhOfw1H5Q5Km+BV0ppqDiEFijKBer8rtF3IWWwdFwA8EgvzHBIMcLqHF0bFlvN7dlyj0T5Vi8McU9ARvBIOdlNIKEE7iuovHAeOjGcyyWSrn7EHUGOAjHLzDfkSrQlJCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817173; c=relaxed/simple;
	bh=HlSzFDl3cBqzMzO8EjTfysWzT0vHCTcl2hNct32AEQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ltgyNTi+/pqg3NIs4XbCkfKSDoeWzUjCF9hld6v+NN1nLuaR6uNYNYeoBNZjeHN3DyiCD2O8gsy3ITiY8uHmGAaWddesUk6eiHKRP0jXEhC47SKgaBSgIDWiKkErYFPkbi/xQj0NeG06p3JbzYPbuzyJW7grSmJTeExAfN6nDc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EDCA82Z1; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EDCA82Z1"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3cf991e8c82so2825613f8f.3
        for <imx@lists.linux.dev>; Tue, 02 Sep 2025 05:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756817169; x=1757421969; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8MLNcN+jIwemVKrw3ojUSNaEqKQ1kS6kcZrlQ+5OTVU=;
        b=EDCA82Z1Dp70ttLyFn8hu11wvss45T5FkbhhcnGO+3tYB5J4Ly8v7yDN8azwvS3P/q
         6yZX8itby4Wp/AM+bV93tkmWCi+f95WKFnpcOcr7Vj39rqVPGWZYHUU7ABkJHfbp8ZTL
         l6RctMpEc89cw+X5ClhiJ/lnnVBcAjeBMhrpp0Jx4rs6pewX9dRp0T4hrZH+XsGd1w4W
         +HWQSqqzsjOx7b3DHVokeOlmDZdIGXWDoz0MnZol9l4HCTyKsxfYO0AKy5Gq3ehu0GWj
         7j6cXwcQIO5jG9Y3xqFuhiz3gBGT2d/qY+28zOP2tvQCu2ARrV8zRS+T+ndI/AdMX4G6
         HEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756817169; x=1757421969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8MLNcN+jIwemVKrw3ojUSNaEqKQ1kS6kcZrlQ+5OTVU=;
        b=Y7G/g94Q8vKPFSAkIN/SLfVqY3T8b3E5W5bOaapX91Uh0ZK0pg7MN9Dv0OOhBa22Jb
         8GJhgRi3jvnWfgtO3MTAj7pMbMRdduBW8h7WTH+37Xg5CSQZEZME8mc+slmuG+iVZIGO
         u1+cbb50TDTLcMSYbLTfX1peCe/p5En3i+bUFlce2iWjza3LoCOGZ027onhdjmN6vtxE
         Obc5EdAqiJKmbe26FMseaoiJ7cI4yXMvWkbit3DjATUsuoZy4IOmehQuZVrhBVI5n7n8
         8KM2alHZY9IxliPyzDUe9I8HNAAml5PuWtZeJUSQnSdPRJs/omwmVQfQXzmDvqzORdvP
         JIcw==
X-Forwarded-Encrypted: i=1; AJvYcCV3HU+TQnSfHjz/G6MVxI8u0783Aus905kYG/0qVZmCF6PkEnpXqeHd9DaPFHD5iE7s77E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzq0FMC/JG1szI5OrMotgBstdnj/X6SQOVfBj2SeJwG2L1+EGH1
	vcwU7PkbkIHsS0KpjpuTtFxHsBmLRekuMmePt5lq6QGYl4Aov5OjxaI8UFcDo7OyQiI=
X-Gm-Gg: ASbGncsPkbA13Ep9ucRnacz2oWhR09NMH5eI1cpqwazD2h6tNoParupxxctXCo+QESb
	pz8PvDdmNvYh4HAlRphjuhu1sRbkF3Ilr2Pr9KC4B8eMVStGjev5IhEQAqdrRYP9FPO6/RyGwW5
	56mkFlu/z4gJ0XEZEAT5szmsJWwEeocQErycmTBouBzDozGTEYPNdDOZw3p4lU29SEdyALI46wK
	I3wWl/IJgEIJ/zS6naM8F+13mq8f1eE5IO4bdNn1pEyrdETq5WwEpcvJkiaRLdUuRlWfV2uc8pK
	4LCElt+BWgCsHZtklDq0LLY2MQhMyZvGdSNNIfPlcxZK9I7PA7EDBudrJ108eZgdGA/d6fC/e27
	5jnUYK6WYsF1BoI8NLoaQeC34HLr0l0Y=
X-Google-Smtp-Source: AGHT+IHRohpxYfReD2iQh67pxQ7xf/UxQzUzPqez9/ZzutPlA0iGuE6EAUDKZAfe7C8t7lupU0kMpw==
X-Received: by 2002:a05:6000:268a:b0:3d4:2f8c:1d37 with SMTP id ffacd0b85a97d-3d42f8c2014mr8211307f8f.26.1756817169281;
        Tue, 02 Sep 2025 05:46:09 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf275d2717sm19589896f8f.15.2025.09.02.05.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:46:08 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 02 Sep 2025 13:44:55 +0100
Subject: [PATCH v6 3/7] spi: spi-fsl-dspi: Stub out DMA functions
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-james-nxp-spi-dma-v6-3-f7aa2c5e56e2@linaro.org>
References: <20250902-james-nxp-spi-dma-v6-0-f7aa2c5e56e2@linaro.org>
In-Reply-To: <20250902-james-nxp-spi-dma-v6-0-f7aa2c5e56e2@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
 Larisa Grigore <larisa.grigore@nxp.com>, Frank Li <Frank.li@nxp.com>, 
 Christoph Hellwig <hch@lst.de>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

In a later commit we'll use dma_alloc_noncoherent() which isn't
stubbed out for builds without CONFIG_DMA_ENGINE and results in the
following build error:

  spi-fsl-dspi.c:(.text+0x644): undefined reference to `dma_free_pages'
  m68k-linux-ld: spi-fsl-dspi.c:(.text+0x67a): undefined reference to `dma_free_pages'

To continue to support devices that only need XSPI mode and so that
randconfig builds work, stub out DMA functionality in the DSPI driver.

Although older parts of the DMA API have their own stubs, it's
intentional that newer parts don't follow the same pattern. Therefore
individual drivers should not compile in calls unless CONFIG_DMA_ENGINE
is set.

Link: https://lore.kernel.org/oe-kbuild-all/202506160036.t9VDxF6p-lkp@intel.com/
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 48054932d517..0baf7e0608f2 100644
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

