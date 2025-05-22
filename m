Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA6528F507
	for <imx@lists.linux.dev>; Thu, 22 May 2025 14:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925584; cv=none; b=Y7kesgIDkVpwAPJNDbt9adETxaWbA9Y8+BW8crar+hbTMyZZ8yBm2wXXARhrR+FeH29Oh72ma4xcgcrjRK/Pdhrf7xhqOgeVzlq0chlEsEjP9/5Mmwp5rnFRjkNPPkNI67Ajhj5WeenGfsYSJ2C/OX4IuYDYz2VdqPmmY3KjagQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925584; c=relaxed/simple;
	bh=92hGTnTOgw+qrBuRhXzTVXcHw+H/usL3iGRcHSlTmfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JIGlWrRUJmjPKeHSAViLXWdIMbkk5ZY94Sh0uHp0SE0y7cLOcbWLwQ8SnnBYhIxOscB3RhhdO27M372QLUBnIsBG5gi/eCToYK8tvAWMYgL1f9rSbC9zIkNeX8ECjEKOaBNiPVFlK1R9p2s7YEaSpVG0NpoMkRzktzIxpN9MJw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gnG/+soX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gnG/+soX"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so62420585e9.1
        for <imx@lists.linux.dev>; Thu, 22 May 2025 07:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925580; x=1748530380; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJIIfru2scNsoUvLKp5rkkh2CkzNDRkWDJuYnMI9SSw=;
        b=gnG/+soXeCvEBcdyQ6LOm6n6jfrgpicAsTmY4Cb1PzEHeBZf+3D+G10QY5ZHpx/l4y
         AeJkte2UmI7KkoURC4aiypKTNY9rcB9I2CiakvhFFBacfJo/Lm6P5EAnbiOM01rN23hB
         Mydx7VggNIW+N6ob0SSNBHGtAtTKBrTppnZary/r5kLSdJc1BF2PktjiMbK0FderFuiS
         ImDYWd3xY1cJCOBRWDApsICsye4Efd/LcZey8R4pDQEzzu+ODiKSr9IzVF9akSA1TBoY
         2/ljFdHA5PwjvU4h1HauXH7/mIKZ4GShnwSP0WLROy8QBMVSaZPKmyYWAPQv05hO5Orp
         Z91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925580; x=1748530380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJIIfru2scNsoUvLKp5rkkh2CkzNDRkWDJuYnMI9SSw=;
        b=Y1vso1yoA0GEeHTtrTOxupjS+DdItQ2jw1F+er4r5cp6nwZZsEh6MybHVdy4rhdFOf
         ZNIbp6rtE9hjyMJ6B5xSOKS7ch1LkggqK1QleWAEH1VsT4Hle36eOBXm2bHork+RLFJB
         roILjHDABQoCu8wGiQdwcLRrNZvdBrhFCccPqOWzgePiykil/lT012tojZ4zyPxHGglG
         vTIhSK4wCQAey8Dayfpk4sGkyvQRv6gMlrYMHrqrhzDtUWyYXjT27zCCefwpr8/F45ZJ
         AdZEx8PpIQ/R2zY9PM+dEAidKF4dVTWHOvHOnlcSKK/94hkZ77eSADTHDj0cUo9oucWU
         SKQA==
X-Forwarded-Encrypted: i=1; AJvYcCW0SJlrnkU/UcM0sT2tWO2kYN+o1KE/VqdCaODElK2AwGUqTElLNhRfvsjU+6ptnV7KVYI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQQV8+EYWPjRAJZKtkRoLEn1AbDngPkIWaDnDj4QAuY3jWu6mA
	6tkUS3VvsOJvnoNYO72Cx7UqouJJOerTn8Ol4jjIN1rtmucoNZ9Zy73eYz9iECAbFYE=
X-Gm-Gg: ASbGncuYzSj10NwMcGDnAkyATJUQhNk0e59FuJEQpBTkAEmdp3zRgI6ZAE7ewBaswZB
	izbBGkn2Vzpwp2EmcSFHcrq23piNjWlBYo0l2VE/VWBH+maKBDt1pXaMOFBWAPm9sJy31kH7zXV
	uVO3VdDy1PNTa4UrsfWqmqBE8kDpwxgNyethLPLGpHs0sdLDdWEnh41GA/qMlQrIv00C/mmiotc
	lsNTQKvHGFNZznnru55ayX66jQUwrlAWlLrN6N9EwAXv8dhLOtWoPCFefq41Y7qScUNGJhIcm28
	/xv8EoQ6WalHHQjLNi2jeGjmZBecfNrbXHaUVu4I4sIRlJv2QDq03oBB0mbK
X-Google-Smtp-Source: AGHT+IGKSX/g08qT9uRPihxiVfgN5hqQC7JQm68hkcjFhtYvodzbfGfpy0Z0MOE5bK4aqE+Du9TaVA==
X-Received: by 2002:a05:600c:46c7:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-442fd93d0a1mr262843345e9.3.1747925580466;
        Thu, 22 May 2025 07:53:00 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:53:00 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:42 +0100
Subject: [PATCH v2 13/14] spi: spi-fsl-dspi: Enable support for S32G
 platforms
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-13-bea884630cfb@linaro.org>
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
 Ciprian Marian Costea <ciprianmarian.costea@nxp.com>, 
 Stoica Cosmin-Stefan <cosmin.stoica@nxp.com>, Dan Nica <dan.nica@nxp.com>, 
 Larisa Grigore <Larisa.Grigore@nxp.com>, 
 Stefan-Gabriel Mirea <stefan-gabriel.mirea@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

From: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>

Add compatible for S32G platforms, allowing DSPI to be used.

Add a depends for ARCH_NXP which can replace LAYERSCAPE and also
includes the new ARCH_S32 for S32G. Similarly, ARCH_MXC can replace
SOC_VF610 || SOC_LS1021A which should avoid updating this for every new
sub-platform in the future.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
Signed-off-by: Stoica Cosmin-Stefan <cosmin.stoica@nxp.com>
Signed-off-by: Dan Nica <dan.nica@nxp.com>
Signed-off-by: Larisa Grigore <Larisa.Grigore@nxp.com>
Signed-off-by: Stefan-Gabriel Mirea <stefan-gabriel.mirea@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/Kconfig        | 4 ++--
 drivers/spi/spi-fsl-dspi.c | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index ed38f6d41f47..ff26be07226b 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -647,10 +647,10 @@ config SPI_FSL_SPI
 config SPI_FSL_DSPI
 	tristate "Freescale DSPI controller"
 	select REGMAP_MMIO
-	depends on SOC_VF610 || SOC_LS1021A || ARCH_LAYERSCAPE || M5441x || COMPILE_TEST
+	depends on ARCH_MXC || ARCH_NXP || M54541x || COMPILE_TEST
 	help
 	  This enables support for the Freescale DSPI controller in master
-	  mode. VF610, LS1021A and ColdFire platforms uses the controller.
+	  mode. S32, VF610, LS1021A and ColdFire platforms uses the controller.
 
 config SPI_FSL_ESPI
 	tristate "Freescale eSPI controller"
diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 01af641fa757..04c88d090c4d 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1316,6 +1316,9 @@ static const struct of_device_id fsl_dspi_dt_ids[] = {
 	}, {
 		.compatible = "fsl,lx2160a-dspi",
 		.data = &devtype_data[LX2160A],
+	}, {
+		.compatible = "nxp,s32g2-dspi",
+		.data = &devtype_data[S32G],
 	},
 	{ /* sentinel */ }
 };

-- 
2.34.1

