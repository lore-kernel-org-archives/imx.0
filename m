Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2D928D8ED
	for <imx@lists.linux.dev>; Thu, 22 May 2025 14:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925568; cv=none; b=ICFNWhL1qsUnYivaYFJ9FV0AlrjyfQJSn85Zf95qpPmiSZtq7D3BuMAcV6nee/6K/CPQ9UkcVoCOylMgc3tSZhyAoA6j7NL8jMpjspN0NqvICq5pLFVLKpy14aaLML9so9cEmne64363VrNTvMdJ+XNhGKYe/xwidICQsUunV6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925568; c=relaxed/simple;
	bh=9fyJpp5VN7ktj8kNm8ocfTEUoU4tl3GIpRNf4HxHppk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rEuGh7N1H5w+s6mTlT7bHtoTXU2QtfaWoG0rr2rdLcu2r7cZIUEcd+ain3hY/isXisfBHuBH2fLNOG/bCEBP3W9iobW0thuSIRGyWIw0AZ1hdQY28TtHrqi2FYa5HDbFWGIWoJwAf8hHlQ/MToFpocDzDoWm+bE55vkzcVlA9c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mcn1hLd7; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mcn1hLd7"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a376da332aso3390010f8f.3
        for <imx@lists.linux.dev>; Thu, 22 May 2025 07:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925564; x=1748530364; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dHewhTi8oRcJIXvkVA+zw1liGRuM2d0KooB3K/vBm40=;
        b=Mcn1hLd7bSveYuzohXjkoLtPM/OMuaN8Zsq5j9EBDB66pFng0z0K+Ph8NiTOOYU4sc
         tqg976ECNVj0+jVXSGnmEcNuV2kYKSttSmuYUy+pqV8Wt9jQK108apTbu6MHO3XH/cDm
         tixWptiEKiyKellP+wweEhyVAEFoQjoiy/HPtXXGPDjg2hDqAU8nJWGvIQDNIjvvobs3
         cPNpAN+a9Mdo+l5LFdsxBL6HaQyS2Ki6E5aCkztRfuvSQW2AZPm6kNro1zABAkd6ZGzE
         hdUpqmvSgw7fakW0fS64cG+NP56CIi3VlXYpWfEMhuOGm3IaybwaKIdLTDUmxjvkC5jM
         2FSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925564; x=1748530364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dHewhTi8oRcJIXvkVA+zw1liGRuM2d0KooB3K/vBm40=;
        b=Qqo8Q+nUMgo1j3yUpdG6k3oQbmvZouIWZGD7dWOw1NtpaKs1FvJ3Njhvty2i3uymKU
         CmN6IW8h8aKcT0td9sMgdmVX2hITmHZXCVL86VOEwEDS4s3zZJanJyuCWzZIsvg3/e/m
         q12n2f3fIJ/saiC9ubO6WYFvnhDsxjUbG44GqQOu1FP/X0a+FxViNtcLJ9Izn1XbbI95
         Sa0Yn3ynDr1F3JoxYUR1BfRPmBvqIHfXT+D9fitNJvQjTyEGsleQAqk7OBBEB/qn5Gaw
         ec9tVXn6Ok0aEvxYMElkWQva2/h2ZhiOdJ/u3MVboflqdL7rm78R6ATyzAYPHQjo0ED2
         FXEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu8cslOJEH9lwfL9GakYeVQsz91dmo9IepRINwLXl2e8QkwMwFblupHoQ9XqFC+c3EVnQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyHtWNjgHPlsXDy/4uv4toBtXwAF6MTgNlyVvQqDYARJxrLd2+C
	qvDyI169xi+2NS16ycw0vmkoKEKRAcvzuiC1hzTZUrdIcxkDnEOsro0Zx74u09j0j24=
X-Gm-Gg: ASbGncu30K+WdEgLsy9x2BnpNzfR+cJy1wSl+sjYwgbd9YJAo4ntKVUsuZl//IUQ10n
	DVmZKCMXkjgTPcqAFr/kib/Ge96YWp0Kw197Tulh9/pjqO2sPU/vjK94tVi06tAk5NZAnJ0ofKP
	Q1abb3PGhYYIaqZix4l9qf+thIttS1lz1K7bNKPEJLY9xQmzXfE2wsiNVWfxsukWtBoiiWqCE3s
	/DYNAkEzElnV41TlGj5WLhkVTzoGkp7VSd8iXCVoioyRPLu53hiN0CBtoz2aJIynZ8wIwi3GZIH
	RWM+jRTrFUkhG1JNMyukyQkdotZi/JAthH8RN/VNO8I8fziYPzcle6vLxBBm
X-Google-Smtp-Source: AGHT+IGiCydEoZVMLu1W3WpDgmtDjO4iw8qiIAhfOUPDYq6buhqSWh3dCUK+1dZ+ss9slz1KiN0zOw==
X-Received: by 2002:a5d:5888:0:b0:3a3:760c:81b7 with SMTP id ffacd0b85a97d-3a3760c82c6mr14137962f8f.57.1747925564162;
        Thu, 22 May 2025 07:52:44 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:43 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:32 +0100
Subject: [PATCH v2 03/14] spi: spi-fsl-dspi: Reset SR flags before sending
 a new message
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-3-bea884630cfb@linaro.org>
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
 Larisa Grigore <larisa.grigore@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

From: Larisa Grigore <larisa.grigore@nxp.com>

If, in a previous transfer, the controller sends more data than expected
by the DSPI target, SR.RFDF (RX FIFO is not empty) will remain asserted.
When flushing the FIFOs at the beginning of a new transfer (writing 1
into MCR.CLR_TXF and MCR.CLR_RXF), SR.RFDF should also be cleared.
Otherwise, when running in target mode with DMA, if SR.RFDF remains
asserted, the DMA callback will be fired before the controller sends any
data.

Take this opportunity to reset all Status Register fields.

Fixes: 5ce3cc567471 ("spi: spi-fsl-dspi: Provide support for DSPI slave mode operation (Vybryd vf610)")
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 1fa96e8189cf..863781ba6c16 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -975,6 +975,8 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 				   SPI_MCR_CLR_TXF | SPI_MCR_CLR_RXF,
 				   SPI_MCR_CLR_TXF | SPI_MCR_CLR_RXF);
 
+		regmap_write(dspi->regmap, SPI_SR, SPI_SR_CLEAR);
+
 		spi_take_timestamp_pre(dspi->ctlr, dspi->cur_transfer,
 				       dspi->progress, !dspi->irq);
 

-- 
2.34.1

