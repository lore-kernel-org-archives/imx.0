Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161482D541B
	for <imx@lists.linux.dev>; Tue,  2 Sep 2025 12:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817176; cv=none; b=J7+SvVgputArIJg6YLuNp8BP3x8Ooddg8emG/o/L+7iFmP9EF0ynOZB4q90YA9TE/g+D4h5Dr4ixGqHL1OUOfa+FDDeEPhB16VRvLrFrvaWIMAgEeqA2P/QpO0EoLt146oABrA1gdocu4iNerBfFrEE9/Jeb2/2pegiHuvN0WEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817176; c=relaxed/simple;
	bh=xSF+c1quUfEBbfl25vLH7FmwBetOvWPbpnPjJk15kZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LjNeOF6AxEG6TlnsS1Cx4x1tk8Ro2PrIjPfR+almAAJa29QSiQDOA6U5oWNCg8e7EV3IFGrBjMmNzDPBO6jCNfvedDdN9nh6NZHoANFus2Z9G3NnisWYeQxEM909KTZnPuEGlZBsaNu7iuQpeht3al9KIm38cUrjJWX9Gppu4YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QhQNrX9m; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QhQNrX9m"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso4580265f8f.3
        for <imx@lists.linux.dev>; Tue, 02 Sep 2025 05:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756817172; x=1757421972; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMvtg5Mq6C/ZSIJ0uJaRfjqxGAaFFsi0SLuwvNPDC3w=;
        b=QhQNrX9mLa+z/45FdNXIKSSyIVGzuo4kxVRAA1+iQ3QrR6eckKJPqxQNX4Hd9kgd+k
         Vwa/NCNeJXXKSTLtjOU0it6s0FD4Zt8qFIidHSLfdkxpLx2+1SI/ZniqRyxXhYJJ/YBq
         ufGzyr3CGZH4DHipkoozzUxnvKyW84oFtvR5rE40cIdLjIjrZprFgltMlIt+VHkF+Ply
         JPw/AOa3Q5zpeTdOLiYcqWbL2SGYMLvefqMyIP+Vg5aYaQXURoRAMvX7cCVnWRl4r1z2
         uUN4HUFjQC6vJhhE/o+0hQQhwkTWTVh3PjFiO+ALhjnb9O254W8t5/rePEzL6Ma00HGB
         1+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756817172; x=1757421972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMvtg5Mq6C/ZSIJ0uJaRfjqxGAaFFsi0SLuwvNPDC3w=;
        b=Ej5q6n0OqM7+AAZvQuZY9jMpH+3O2a6fvS7BT4CKTVfhGHRpLE4Mx8ytppNLqF5ctt
         gZA6H3qaEdmRlQ3RtRl1xKH7r1LDo8/wDT4flyA3tbWnv6MIHq1se5z5Sp0MWVbydpo9
         8ui0LqWWP+xUukHyqtoS2+OHJ6a6JHn6meCr6ybDVJoTxxeB/5jAFfq/+9vOeeRErRdh
         Od4ra8X/UJKgQXs9dway7AI7osBFUhsoNGs4Ihmd71zentdLPhELWZNGVxg67rIaFFd8
         /s3nUI7WUGbjoRMPzne9ag1EVfaSF4MnqdNf6EjbnYZEiSb7oH/jtct4tnTO/eZDYVFI
         qWcA==
X-Forwarded-Encrypted: i=1; AJvYcCWZdy6+Abm+1XhNk72hRIK6nOily/J2Nce2ZlvGk69L1alwKq03QPWICGxmxcANquqvvjM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8rO0Qluiq/h7G4dk6vvluYOntz0X5DNp1hlORvcknMVERDzfG
	gCSDkvnNoo37BIj4YwDZImHPVidCA6z1I0OqTl2mPVNbVWKHwIpTrwFGFOvb3ayQPUg=
X-Gm-Gg: ASbGncuUbWXZUw9/BeHXZLCyYCUIRYVzVm5vETPbCn6GSjvSzS/dSypMoofN405AKsL
	T4BVp/BrbkhKW3ySfkscuSqWo/IAcIdV01+Cj77oc4BYOmsPgPy3iczK4hwDfEZMb6iTXqtb/BA
	D6xmatZjuK0nEf+Qq2w7BB4gBb4RFtiSDFVdfJ/x+4tm1hJtvPaatqsPIyWNRF8gN/R+58YGAK8
	myiyPm9k1ajHvm/QPKM1oqcQT4k2zgLojtQdvcoi0APp36V8mr5SOrdIlWrVMrRF4fau+gPQhdC
	xLDpZwaq/Rsuzbzjfvj0MaszA9I5xbqiI/4CvOkMi2TjBqQfIurUillqqkJp1H5pczPmlazLIJg
	CJbmLdGiDbUppn1aR7eDb3GupdtOSSAs=
X-Google-Smtp-Source: AGHT+IHHnLIfKXefUkGxa5EfKnESKjlVPeyNiNsifBpBQEufQVD811lASeZ0fiPvah3xuHy5ugya8g==
X-Received: by 2002:a05:6000:3110:b0:3d0:b3cc:c1ff with SMTP id ffacd0b85a97d-3d1de4bc2e1mr9092247f8f.39.1756817172368;
        Tue, 02 Sep 2025 05:46:12 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf275d2717sm19589896f8f.15.2025.09.02.05.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:46:11 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 02 Sep 2025 13:44:58 +0100
Subject: [PATCH v6 6/7] spi: spi-fsl-dspi: Increase target mode DMA buffer
 size
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-james-nxp-spi-dma-v6-6-f7aa2c5e56e2@linaro.org>
References: <20250902-james-nxp-spi-dma-v6-0-f7aa2c5e56e2@linaro.org>
In-Reply-To: <20250902-james-nxp-spi-dma-v6-0-f7aa2c5e56e2@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
 Larisa Grigore <larisa.grigore@nxp.com>, Frank Li <Frank.li@nxp.com>, 
 Christoph Hellwig <hch@lst.de>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

When the device is configured as a target, the host won't stop sending
data while we're draining the buffer which leads to FIFO underflows
and corruption.

Increase the DMA buffer size to the maximum words that edma can
transfer once to reduce the chance of this happening.

In host mode, the driver is able to split up a transfer into smaller
chunks so we don't need to increase the size. While in target mode, the
length of the transfer is determined by the remote host and can be
larger than whatever default buffer size we pick. Keeping the buffer
small in host mode avoids wasting memory, but allocating the largest
possible in target mode gives the lowest possible chance of dropping any
data from the host.

While we could allocate per-transfer using the exact size of the
transfer, 128K is quite a large allocation and there is a chance it
could fail due to memory fragmentation unless it's allocated once at
init time.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 6bf87ef01c13..3d29285c772c 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -675,7 +675,18 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
 		goto err_tx_channel;
 	}
 
-	dma->bufsize = PAGE_SIZE;
+	if (spi_controller_is_target(dspi->ctlr)) {
+		/*
+		 * In target mode we have to be ready to receive the maximum
+		 * that can possibly be transferred at once by EDMA without any
+		 * FIFO underflows.
+		 */
+		dma->bufsize = min(dma_get_max_seg_size(dma->chan_rx->device->dev),
+				   dma_get_max_seg_size(dma->chan_tx->device->dev)) *
+			       DMA_SLAVE_BUSWIDTH_4_BYTES;
+	} else {
+		dma->bufsize = PAGE_SIZE;
+	}
 
 	dma->tx_dma_buf = dma_alloc_noncoherent(dma->chan_tx->device->dev,
 						dma->bufsize, &dma->tx_dma_phys,

-- 
2.34.1

