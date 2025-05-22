Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B22628E58A
	for <imx@lists.linux.dev>; Thu, 22 May 2025 14:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925576; cv=none; b=C7ZLCIhS3GZHXJiibJXpUHOeHZO9RmLOaOPmGGSwL2MSvynVAgtLo3L9T7m05l6ydY4wnwYwC1gCFUodX6aczONVhEJiZiAQssPiP/m+ERcIJ1XxRvfokartNL0tuak2cQDodzEm9awh896cJWqKmU8Tx2ayRFwB5qxY4E9XNyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925576; c=relaxed/simple;
	bh=B3dXYhnsY4/0kljLpB/bLo4GhIKCEopk2hHBZ0Y/nJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RZ8NasJAcqH0diZ7LXp66Y2byc0BFJuFEZWd8LWlpieHiaOwT6hdr2IydCK8TQuG/3aa42kdjVS9rNnAks62yqjTefKCoouvIbMIerzcdwLixzAvJb78KNaE/Na1ez5qb89khJLu4cRDNTI2YnzE4FZEjwQ2UpqutyRmmGyG4qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GIk9unSq; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GIk9unSq"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so88841645e9.1
        for <imx@lists.linux.dev>; Thu, 22 May 2025 07:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925572; x=1748530372; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3kblZ/H5EWoCAOqhxMxQVEOgjozeVyetn7b4EPGEonA=;
        b=GIk9unSqPyMo8jfS4qQyxeB4sMxsFuulg9xz+GgfjGRllANxj+xVVv6RcPypnyYLYs
         TUdneA0i2YNE/57jsfJJ/djW/vjgr3xstW23LEf+jKcXzK39CHVHz4bILOP+DUEmNEZ/
         XBfCAXXkd6645JFKvuUEkHwsTwznijjXXCaLGLIFRbzImkcpi71jz3TJFtPmWAqdXCYz
         SvBERQXZtCa0aa8LrJP7sNN33hUyF4xyByGn2tJz8VttcMBQHT/YW7f1DssFguQV0PRa
         WOLXidaqdWM81V+jCrQzzPiW1HrnMUUiTRL0NaQBumtHggjy0ObLz/yYm36eRf73IfD7
         HhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925572; x=1748530372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kblZ/H5EWoCAOqhxMxQVEOgjozeVyetn7b4EPGEonA=;
        b=gshu+C0RBBRUvUskEpAllL0nRB+C2ixPWeKO7jb92SFkMm1ktgmpRsVKJrT9aIpygX
         wFamUxnZkEnwdQLKpGfpLTpw8R0/6zTnMSfLe9XtUnehEBBQFuTasyjesNWASPvynWgP
         br8L7wQ75w2malJrEXw2w7stFFaFgqBifF3ptk3segRXJcM+xXin7GZ/pKkl82872Zor
         PgWV0yC2NJwXvAuLelnxwYq3IbBPTj5bsgqfQPg3Vnb5ew5TH7iiKF/qOi918yUAbo5z
         H1eDQDfrj8CmpOyYvGtaTaTR/0ZAUbagap9yOk3BQyz/9zwYGS3G+T516/S7VXS85EQP
         Mi9g==
X-Forwarded-Encrypted: i=1; AJvYcCVyzR+13eL9N49cr3F/q04bpoRFjuFyf+bTl938Pmy0Xm7Q2pNDv/llQ7nIiJUldgcsQfE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzh59d4jYjh/hHd0mxdl/AMIBl056RXvSKL/qjC9WNSMykIWts/
	O19OoJRwxu8uydG3q9VEF9goc5pLm1Jq86xQs9onQ6krNN7aaIXJaPw/90dBUzrvU/E=
X-Gm-Gg: ASbGncsjnGV0Ofy2O7w1XcHk3CHC3Frklq77lfmuNQ89xN/zfV+q3Q4WuKPngFy7Q+r
	MoiKtjggyqQCYkIgKp0IxX6ObjzXgqwx24ae8JrEBw2otGYzQR98T22YjheHMkAYaX1KHkg/+gJ
	C0aPiI/lJrd4DMHexaTKWZM3yhS7Au4PBDrdqcjxB/pUVlPyGhSK9wSMx4q7+rcbAyy5koK2nof
	LhPBS+orwTLE517Wa5pXRTKpOFBeqWEZOoB9Yu+0OixvK1soIcW9nN7yrTWeH+SwYxnWGCyP5l0
	lp2hTcRy9la8jAMcq3O2CpiSHg2G3xZlq96O9BaDdvbZ7Z99rDPAdT2AvjDW
X-Google-Smtp-Source: AGHT+IFXkX4C/vZh8avS6z8fsiCozz6p4hPupyXcDJ2YtFvJ/AEXd7sGhYG628mq6mJY77AcpW4q9A==
X-Received: by 2002:a05:600c:1e1c:b0:442:c98f:d8cf with SMTP id 5b1f17b1804b1-44302934f7bmr251165455e9.16.1747925572152;
        Thu, 22 May 2025 07:52:52 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:51 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:37 +0100
Subject: [PATCH v2 08/14] spi: spi-fsl-dspi: Avoid setup_accel logic for
 DMA transfers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-8-bea884630cfb@linaro.org>
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

Repacking multiple smaller words into larger ones to make use of the
full FIFO doesn't save anything in DMA mode, so don't bother doing it.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 814a92b8064e..24a51267cb4d 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -850,8 +850,12 @@ static void dspi_setup_accel(struct fsl_dspi *dspi)
 	struct spi_transfer *xfer = dspi->cur_transfer;
 	bool odd = !!(dspi->len & 1);
 
-	/* No accel for frames not multiple of 8 bits at the moment */
-	if (xfer->bits_per_word % 8)
+	/*
+	 * No accel for DMA transfers or frames not multiples of 8 bits at the
+	 * moment.
+	 */
+	if (dspi->devtype_data->trans_mode == DSPI_DMA_MODE ||
+	    xfer->bits_per_word % 8)
 		goto no_accel;
 
 	if (!odd && dspi->len <= dspi->devtype_data->fifo_size * 2) {
@@ -860,10 +864,7 @@ static void dspi_setup_accel(struct fsl_dspi *dspi)
 		dspi->oper_bits_per_word = 8;
 	} else {
 		/* Start off with maximum supported by hardware */
-		if (dspi->devtype_data->trans_mode == DSPI_XSPI_MODE)
-			dspi->oper_bits_per_word = 32;
-		else
-			dspi->oper_bits_per_word = 16;
+		dspi->oper_bits_per_word = 32;
 
 		/*
 		 * And go down only if the buffer can't be sent with

-- 
2.34.1

