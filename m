Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D6228F935
	for <imx@lists.linux.dev>; Fri,  9 May 2025 11:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788820; cv=none; b=eqW38e4EMYBN+pZoKQWanmd4FMvmDd1WLpnIKjqMmhVz2Hrf5LSYoah66Op92oRYGu3KvIb+tNzdtSby85MmlB/LKbESMVHhj+O2XfHTq2exLpHgRRJJocTG2v6rohq+iSyX58OXmUsWS7VfLUCy44LPW8kYT8J9HK54Zcg+FRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788820; c=relaxed/simple;
	bh=lNzAOm2fsnFGf82dcqxl1YBX/mz6uR9h5/TJgWh82NI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kSgqgBde2vwpZFdOjccS9ihMjU7NDdRI0ZN7pKPhWajSntSj2wEZF17YqBGfz2X7SCBs3M6ydokG1431HhVe4lwqNxQKYutDvWSAkeNehiuLpfLi8EY1uM/5uPiFkQDCQGGndSivifWHJkneFKJAkIrJ4PdQ8bMADhsnyY8/v2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=glbatd3T; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="glbatd3T"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a0b9e2d640so1726562f8f.2
        for <imx@lists.linux.dev>; Fri, 09 May 2025 04:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788817; x=1747393617; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+3jb/fX+IugayjdNWEytVWeF5yooMmRjS6ouVsYvEU=;
        b=glbatd3TVXE9HvmcTnLqwgR4fgG//jfL7fGO2Wxf+hP5acnuvvYWdQSnLZfdhObj/L
         wGJxDY11+2EzTp9ZQdeuU+MLZpitvO08VKgTbLFifck6Y8JZh3XFDmIDKPCslre/6OKq
         l1lRiaH5lBsd8y3Ns0OdDeXEigj9fDtEwEJAFKPVrpusgJ7Ga3R+jck94afzQikCVQH8
         Hva2RTmR30cP4H1a5lekIJ2U0ANNKhvpBYx6SfwYHFLaYrqP+nrkKYWqwiSVF8rrI0nK
         qFr1KJ4xG0mqQn43YBj/sWvjB+ONCgq5+ru9HbOAFIkphSm213C9cKeELAxUN5+11C19
         eTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788817; x=1747393617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+3jb/fX+IugayjdNWEytVWeF5yooMmRjS6ouVsYvEU=;
        b=rQgDXyC7qv0ha1KJHuUuVOBTuZ4u8HlfGO5jPUuBnJB+n7MeJdCkrQupnEmVDLfOQw
         sIBUW/750uHqvTORiVX1O+U0bxJmhl/0iblsEZOkZqoZVvYp1p/hjo3QdxV5cD9IpjgF
         bf6cZCUcWXJEqY8oN5ceGKrVtsPbOoaMSURrEOsm/vW0NoIjryeYhED1GZBOpTn7CSz0
         KTMdKwFX8ahNoR659K1wG5qcfYPYiCdCXxmFqkv3jVabG0uxRS1261Bn6oi7tmp2ML8I
         y96wfnij7sr32rNZp6airhDFUo7RvJVVdb0tfl0sTCgyaXgteyir7EDz1iFVOJCWWWhq
         f7SQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6tS3+5OW0HUnA22iRiEyYDMLHp90rgZW8cI1gB1hTN36//w9D8BQlJ2XMOT6JcPWgNfs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4MJll66eeCycgWyMfmNAGrtI0sRCgmIdsDIuG2HMGjLRlKTIa
	PKHsInB+zeDN1ssbSZ1jw2JNOSkmdEKbNHdlthdDHoPZO/p5VwFsLmEoP+XOJio=
X-Gm-Gg: ASbGnctMiSavn41I06azOoyUwDB0G+oOWgI8OMHGuNggleib7RCxnvx7wWCh7cZ3niy
	UsbpNJd0/7Z4gCvO/2gV1Oc4suimr+o/EXmLfT4A8G4EvkF4CtmSJ92gDAbKrH7rxhPYSZiOOFj
	dnG7iUfN0I1GunO3hlRm03dMyqyVa3LfQ0T55YQRN7Ue1slWeCNk9hy5DaSnJS+DLH1oQHwvcZD
	7zVHY55pV/lFf2YaGp3WTww4FWucYsKc6JI5gdQ4CjvYgSmO7TC/742NPpqAyUuJsv3PnEFbd0E
	xF7VKxzfyNNWfH6GB+6VxvS/plRuMI7Cr55pzkQI7dJp+VAo0mPPU2HB4w==
X-Google-Smtp-Source: AGHT+IFC6m07o95wlBL8z66ZHFQZFey0yAwlkLMNz025uhOiNU0gJ9upByEMU9FvrvfyyVzrnKIsgw==
X-Received: by 2002:a05:6000:4287:b0:3a0:8c45:d41b with SMTP id ffacd0b85a97d-3a1f6457726mr2691256f8f.20.1746788817253;
        Fri, 09 May 2025 04:06:57 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:06:56 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:05:49 +0100
Subject: [PATCH 02/14] spi: spi-fsl-dspi: Re-use one volatile regmap for
 both device types
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-2-32bfcd2fea11@linaro.org>
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
 linux-arm-kernel@lists.infradead.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

max_register overrides anything in the volatile ranges, so we can get
away with sharing the same one for both types. In a later commit we'll
add more devices and also read/write ranges which also override volatile
ranges so this avoids adding even more duplication.

No functional changes.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 31ea8ce81e98..cb0e55a49eea 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -141,6 +141,7 @@ static const struct regmap_range dspi_volatile_ranges[] = {
 	regmap_reg_range(SPI_MCR, SPI_TCR),
 	regmap_reg_range(SPI_SR, SPI_SR),
 	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
+	regmap_reg_range(SPI_SREX, SPI_SREX)
 };
 
 static const struct regmap_access_table dspi_volatile_table = {
@@ -148,18 +149,6 @@ static const struct regmap_access_table dspi_volatile_table = {
 	.n_yes_ranges	= ARRAY_SIZE(dspi_volatile_ranges),
 };
 
-static const struct regmap_range dspi_xspi_volatile_ranges[] = {
-	regmap_reg_range(SPI_MCR, SPI_TCR),
-	regmap_reg_range(SPI_SR, SPI_SR),
-	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
-	regmap_reg_range(SPI_SREX, SPI_SREX),
-};
-
-static const struct regmap_access_table dspi_xspi_volatile_table = {
-	.yes_ranges	= dspi_xspi_volatile_ranges,
-	.n_yes_ranges	= ARRAY_SIZE(dspi_xspi_volatile_ranges),
-};
-
 enum {
 	DSPI_REGMAP,
 	DSPI_XSPI_REGMAP,
@@ -179,7 +168,7 @@ static const struct regmap_config dspi_regmap_config[] = {
 		.val_bits	= 32,
 		.reg_stride	= 4,
 		.max_register	= 0x13c,
-		.volatile_table	= &dspi_xspi_volatile_table
+		.volatile_table	= &dspi_volatile_table
 	},
 	[DSPI_PUSHR] = {
 		.name		= "pushr",

-- 
2.34.1

