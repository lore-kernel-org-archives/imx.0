Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB463218ABA
	for <imx@lists.linux.dev>; Tue, 24 Jun 2025 10:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750761398; cv=none; b=LkhZNMcAAFbW2VqAoK5bBAKHhfdIGPZ48Tkpw80xDzessdefpQjuUsYACV17VnqUiWbh1lPaoEtB3tPue5+ASoi/J/+HwLxMfO4kZ3STZPccSyWBloQLPU3neBL2ePpmAv5C0F8BYhNp/najZgIdSaAWBnvH1De7f0mrbO9Dq2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750761398; c=relaxed/simple;
	bh=I6Uh0W1U/pEscoVd7miIYAu5wzDsffordzyPGY3jblE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rj/6iAwT+yy7QltfOh1Pu9m762fqrpHGP30MbPU41nCjxn2h9QHtUPDnaVZ6ki6H2hqb90tXBQxuUtZB/pMyGq3GczYqEwEEV9eFmY0/iNknp35xTAw6KSXD/TnJd+mt/laPsMZe/wSaq5CUUtSw0XXm6k8wHk50NKPhD9vBMv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YtsS8Ih3; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YtsS8Ih3"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450cf214200so46626385e9.1
        for <imx@lists.linux.dev>; Tue, 24 Jun 2025 03:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750761394; x=1751366194; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jkMuSosV7oMRxRtp9yYE+2UdziIG4xoxewf16F9X2EY=;
        b=YtsS8Ih37yEPYhGzkCpBt4ll5ZpCuP2QpGO6jJGyHaImGX4xMCqWxUUnwkxf9Vt37n
         aTxJDdDkcy7Jk/c98nlSlSlgKbaK0Qyzej3ANnCTPvIAFq3txEQ+hwWa5lXT0HSMbB0p
         uZcCfpA3ZAS3dO6/Mab77XGJBERF4+r8LTngyWIfgweMku6VUilvFIHIB7sR8oJ/yAiQ
         32eKBzW6JgEwOXhF+r0Afe/6Euhc3kxki/q6kSbDj/SNDcgzUDe7uYYEW7jXb5F3aOD9
         T825EuHgUcBiTvbkgG+ZYOjPx9I1cBwsl5VvpoAE4cvlkcZTLbwIk1VrtL12zL9H3QDe
         NuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750761394; x=1751366194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jkMuSosV7oMRxRtp9yYE+2UdziIG4xoxewf16F9X2EY=;
        b=TXvBoOiRAOqxId4wgPDktA9lYEkBfAmZzpmEPeMLp7EwAD3Xf4OCJALz8yq5j45rlj
         E6cYntt+tpp2Lx4xVMQHlKsdn/BwmIM+kZSPmiLXrv3+/NGdlraF4WAHHXnNrJOS15m3
         10JGTi4BwWtnPBDdxX07rGaRIsZIqWec63XdQ3rOYNrq1TfYhlEfO+5NIDKgDCDvqdCK
         C4cADynA/v6rh9ticaVok+n1YnayDBM/Pt+nZr9dBkl1LL1oI21ZyWWOWIAWSjs9Mi0B
         kFaFoZXD+h4eEZlK7vCzRNbb3xKDTWznKJzZwdgsuP62r8gmVKT2e50ELKJgpysTe0NS
         zOjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH8spcDcgoh3h/aLBF3RxM9anFBpTfti09KXiSZu+1f30/W/alCRvY+ODImsorGXxbnbg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1ZMXPpkWUhwbJfOuuvaa85vwYEeuyUIC1muS3MLGAmy8uEEBE
	56cvUuk2SpUeCl70TZKESdE1woAOoIKvrLRycy1AaswIuighrFKCcKhl/cncjRh+59I=
X-Gm-Gg: ASbGncsl6jqdLdCDyZI7Z5HmbU+da4cMMVb73nbfX3h2R3W82x+/N4jjxN/5f/QSawv
	tFQxVquc0/9X8J5hZi72LbXhsxF0Ou2gXXS41IRqL6upcb8MUlhfzEpruF9GXZD+IG2mqLu+v/z
	WTVY+XcjaoCxvwjphwrh8/DYQpuh4z2lfaaepvfhB0zkuib7kYVLNDnTDiyFixtJoOL8cF9QqAs
	v7MG3ivHVxjd5MaDPAc+ktlsQIBOggUts1Qs7+nivdV2x0VHAr7qGVtOs4ePXy9YXMmT2mrIOFK
	Npt44t7YN7KwGNOiLGU/GvtPjERgweqPq3SOYloNqIINI7cjkxLHvEe81zEVfptBJYX1XeU=
X-Google-Smtp-Source: AGHT+IE1yzuJW1JyGG/GLYl2/Ucg2KNK2xeS+Q9P5XhB9Map8hlfvdK3p5oXRvu10nUbdGxDztsgdQ==
X-Received: by 2002:a05:600c:8b14:b0:453:a88:d509 with SMTP id 5b1f17b1804b1-453659ca92cmr182600865e9.10.1750761393938;
        Tue, 24 Jun 2025 03:36:33 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb641sm143398245e9.3.2025.06.24.03.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 03:36:33 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 24 Jun 2025 11:35:31 +0100
Subject: [PATCH v3 1/6] spi: spi-fsl-dspi: Clear completion counter before
 initiating transfer
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-james-nxp-spi-dma-v3-1-e7d574f5f62c@linaro.org>
References: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
In-Reply-To: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
 Larisa Grigore <larisa.grigore@nxp.com>, Frank Li <Frank.li@nxp.com>, 
 Christoph Hellwig <hch@lst.de>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
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

