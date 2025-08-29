Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E952D29BF
	for <imx@lists.linux.dev>; Fri, 29 Aug 2025 11:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756468055; cv=none; b=b8vYeeRYazTbtfZQo+B5BPyjWc+7Ga7660I9/Y3wZLxscvV+N/JvMhUrG97w5r/BlwosJt74In4Tp8+adNCMJZ2oLpOKt6Z9elKqXqMvGME0DFKjbduknmN6VNKF+hctJg82gLKrndR5GEdn/ki53qR9PhTgwdiOi084woC6bgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756468055; c=relaxed/simple;
	bh=bTUKpVXwp9125KIPPU8YBtuFfyyzlP1eFCD8gRj3p3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Elnzsw7Z5xePt52GK88z4rXbpqi7QDIWBFfKEF6UWvun18qV+6QVPi7FuGsVXhZaQb4h5zmOpp0Qqi6+EtkM9KEIC60WDzstgPiA9YTxMFDvgzGPmkYrz3RaIpkIZZom4i1pFC/9ytZeD9H6GbgtjhXVX4Chm49eFmWgLNpQriY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dc2LEd0N; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dc2LEd0N"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b7d87b90fso7806325e9.0
        for <imx@lists.linux.dev>; Fri, 29 Aug 2025 04:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756468050; x=1757072850; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Og+6Xc5xVCmdDpeujz/1JM5sB4nNH/Jrk3ZxlgxIXaM=;
        b=Dc2LEd0Njni6GFTYD1xc6qIKAnMN4RUfTwN0jYqxWvo/mpJhmv0y1z3d0QmHSjNMIS
         FCddLrLbu27IM4W/ow6gAmQEw1sD6eKm9EsAScRFPTEsH9XVx8isHqB/KyDXg0eY7u7h
         bbCOQgVbwcVJ496FUdITpdl2jvEvCa9pji6eeSfYh1owaTE7Aosyte57LdLs99S6I8xt
         gH0HyGhPoJMFM73Wm9ZeVlJcxy16JLMggsBOdWJ6bzoBBL0/Ge6hiRONhe7xAmoeEZAH
         U+oUFt3Baeb0CxsXPu8MnybpD7Qo7wzILNC4GhFpSWkLauQQ86BA/36nw8+wj8XsMFDv
         S9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756468050; x=1757072850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Og+6Xc5xVCmdDpeujz/1JM5sB4nNH/Jrk3ZxlgxIXaM=;
        b=eF2NHEIzEEFJbLnrQo6vMS1GvU+dp9/gXWM9dCeN8LOs25U3a1fkv/w1QPuZ+vAq7s
         U74knYIsOD0R9Uqc9Ig/3OkELg2cEt5dMDh79D4sqd3aTZWdMkd9HBdfiC5W7fvT5/zm
         vxDP/2qy0r3TGZwccVXhR0ocDVAlq78b0gfWD5f9Ma71K5WFGoq0b/piSh2v/vDLoHBa
         OIrPnyQAottpgRvWB1uGyGivJeEl3TIdtVjLsUTRBFIPn0Qx62TkO4K2mg6b5LJOAqfG
         3Wp62ZQPjxClKRAEBhlIp94PeRSYKLoaTa+1RNmk2S/fWFMtSca6YZV9e0VhYOWjtWcM
         uvvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRTGrHzASicB8W1XXQHzmAD+80XVBz5UjRaa0wkylCwabcIFo9l6XtLEKAI05uh8MMlO8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2yLhATwSQz+w+OMZGBT+eXUtaiZ4wMeG5U4kWoM6SXhPSKo9Y
	ItlzP+Q3bJsKD2a/qo4Aj73MhfeS6xAI7NIoEgituBQAuY+GMSFTNzjCPf3DquQowkQ=
X-Gm-Gg: ASbGnctghWaiGu16N15eYiPRGDhBFSHP6u6u/Y13qxYVap/6/LL3sqCj05FZDVvIjKr
	nGrupsDtyeynnnfEJ1LQt9f1IT7UuLYlck26UnCwNTeJvqajwogAoMiDxQ/6dil8RtYsKLLbYYv
	xEa1tsyf/sC225f2iCfAYfXTcTskNQmrazQhrGg3hsa3M8EspX3n8qTtnSVNSbPlCQjvigtByMM
	r62pyLcrPItZET6wa4uuwooPTop37dbH2jQu2WzISHMVmkyXtDSVojhq0ZGsfht0Xmy13WKViG8
	v+wvg6U58NwIEiYh8Ysnv/RxbPwp+Di8L20YILA/Abn5Q1KnbrMnVyQRPHahUeDJ0FYAkWeQHTX
	BqQmrIyC8HE+SirFTXIW4JWPUm2sc0PUKPTZwZJsJiw==
X-Google-Smtp-Source: AGHT+IH/phP73RQmSHEL2ORjRZUORQjGvA9s+Grw6jbwknB2ZMXwWIYweFFb5AdJvkfbItdXPSBBBQ==
X-Received: by 2002:a05:600c:4443:b0:459:e39e:e5a5 with SMTP id 5b1f17b1804b1-45b6870e392mr116803305e9.5.1756468050364;
        Fri, 29 Aug 2025 04:47:30 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7c461edasm29873255e9.9.2025.08.29.04.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 04:47:30 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 29 Aug 2025 12:46:48 +0100
Subject: [PATCH v5 6/7] spi: spi-fsl-dspi: Increase target mode DMA buffer
 size
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-james-nxp-spi-dma-v5-6-3246957a6ea9@linaro.org>
References: <20250829-james-nxp-spi-dma-v5-0-3246957a6ea9@linaro.org>
In-Reply-To: <20250829-james-nxp-spi-dma-v5-0-3246957a6ea9@linaro.org>
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
index 0e5f65d58342..3b652d744492 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -673,7 +673,18 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
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

