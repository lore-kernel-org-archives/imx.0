Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F72928DB48
	for <imx@lists.linux.dev>; Thu, 22 May 2025 14:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925569; cv=none; b=uN9pVr7KuT1iswSx6vw1We7BEElSlEinEL7qlJ6mSO41DjnhrtJo09yvniSyKkB7gYfzuRAH6tk8gZkFiS9bRgfu97d/Jfm1hXzNpBX2qsdpFjidfJaTDFDUNdafr03+I/ntFfMIk2xHyDbkHO9dsotiglKQNZmA0YLrhU0DpUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925569; c=relaxed/simple;
	bh=vEU6OoOW4QiG7DnelFnexzER5F3I/xGLtYoU/uX9NAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=famZH7yIUaYweWur5jDfnQ72mJwX0QLkO1msjVnd98Uf2CVS1HS9c5O8JH0Clt8ACtUst20J+FsLLcGRdwHMz+3M+FxSmPfAF0LgGNxXdkI22RTq+CuSaVUh8ZN9Cm8a9qTnpPqKqN5e9k6a2hnk6S18XakE+kOcgaR5eLNAZpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tzUxi4pJ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tzUxi4pJ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so85556575e9.1
        for <imx@lists.linux.dev>; Thu, 22 May 2025 07:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925565; x=1748530365; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5NSuSoLSh+LHiSs84RzlVPklfrqct9bYGikZDMbgQUs=;
        b=tzUxi4pJvs65S/ZibYMdQoX6EWWEXUvnIExAQlMfKyN1D6NEC2GSdkcAKMwMPrwRRZ
         wlcmi6kGSayacEQFv54LhZ8ehC4eS5PJ9CIhEiDNI7vFL6Zyg1Y+1mIrw9cr7g9nhVL5
         fulzza56eS291Rr/JDBymm+MeUhPqhO4I9atGrQaXaK9rJ5fdo2rm5fObPOzsV9B6DN+
         KWmPNSDe6PvRud7BByWZIinvKTglXoIZhSFtCwUIkUCxp+FO8VwWw9GeSCVBRBHVQH5P
         Z1apNkX4HZXVoRQamnBC/It++32G3yf8I8JYsOoCxCfQy/PgG0vglyEX3rDbECXnBALa
         njtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925565; x=1748530365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5NSuSoLSh+LHiSs84RzlVPklfrqct9bYGikZDMbgQUs=;
        b=TF705hYJDNyEYtqx0QrVrdo55PMzcAd9qXGwYK+KjbpOdNIWqWQAQ+4mzbMb1vsFfI
         nk+rtxofXkt8j2y2MaEgx+2zTXi1ijWGKt4VrmmQwEXmSh3P9OWlj3rM+9BkHnQkQbBc
         RwI2BKh1ffIbD6eRwCv3gyG1dVgHVMmhJcjFz3ogc1+Ye5StkB/eNnzmbDM/W0V+3j7w
         u6J02u9NVF6A+9mA4pYDSz2uYUw5tHKdI2lW+lJm+n73U8nX0XoX9rIt9Z233psxbpW1
         H02HfJac9Y4SH9V9o6xQb0/LIJXVlKkgBEnaOECbYiyaOHZRJk37/ncOow0NWVn4NA4V
         Z8zQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMBZY3Ue4YlDh8XJbx6DxvAZ0jk7TabVe8ob9+i1oUA1e2QFG0H32pi3SasJGiU8rRy1s=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWQRY7eY4uI3UQcxWERAFKtAIr2ikAlrpKYXcqaatmBzwbd0qK
	DtDvCYPIs42geOGlaw7X6ptRvR5q97Bsw2uWgc/DZPJAHJDyuowzAJBMw9Zk/+gIvgQ=
X-Gm-Gg: ASbGncvnLPxsTwIFTMlIADNz3OmSJgXwirp36uNHHcN8KXPsVjcKcP5rygnvievUZ1A
	zciewPyEo8COFM6hdvyFWvXvRKExvSofh9t6Wiwr/HogJp5qEceUuuPxMPYAkhiW0/X568V1slU
	06OWM9OKTz9pfNZpkpqnuLfr6V7RH6ZrD9/wISx6aKcVfmwNXN8UFVAiEoPRNG+ESh/ajA+0LVi
	uE2gV7PeqoxTBjyaGOl+8Yw1vjL4HPYpaOvhzqsdo2eaLY6lK3XxwQQZeVm0n6CcCDWrqjy+0l1
	ZzEKoKIB61fv4PIRdtJZA4l5HWuZUAEKBT0yY1uJUTNozYTPsHOkIyzoEz0W
X-Google-Smtp-Source: AGHT+IG7lHM8gO7TjtKSOgQg+mAp19Lx1pEqwgmpnkH4a719vOS4PONUqtAkN0R9pGn1dejyXRQUIQ==
X-Received: by 2002:a05:600c:870e:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-44b0c60f240mr12764035e9.17.1747925565562;
        Thu, 22 May 2025 07:52:45 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:45 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:33 +0100
Subject: [PATCH v2 04/14] spi: spi-fsl-dspi: Re-use one volatile regmap for
 both device types
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-4-bea884630cfb@linaro.org>
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
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

max_register overrides anything in the volatile ranges, so we can get
away with sharing the same one for both types. In a later commit we'll
add more devices so this avoids adding even more duplication. Also
replace the max_register magic numbers with their register definitions
so it's clearer what's going on.

No functional changes.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 863781ba6c16..09b2b25ed274 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1209,6 +1209,7 @@ static const struct regmap_range dspi_volatile_ranges[] = {
 	regmap_reg_range(SPI_MCR, SPI_TCR),
 	regmap_reg_range(SPI_SR, SPI_SR),
 	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
+	regmap_reg_range(SPI_SREX, SPI_SREX),
 };
 
 static const struct regmap_access_table dspi_volatile_table = {
@@ -1220,31 +1221,19 @@ static const struct regmap_config dspi_regmap_config = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
-	.max_register	= 0x88,
+	.max_register	= SPI_RXFR3,
 	.volatile_table	= &dspi_volatile_table,
 	.rd_table	= &dspi_access_table,
 	.wr_table	= &dspi_access_table,
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
 static const struct regmap_config dspi_xspi_regmap_config[] = {
 	{
 		.reg_bits	= 32,
 		.val_bits	= 32,
 		.reg_stride	= 4,
-		.max_register	= 0x13c,
-		.volatile_table	= &dspi_xspi_volatile_table,
+		.max_register	= SPI_SREX,
+		.volatile_table	= &dspi_volatile_table,
 		.rd_table	= &dspi_access_table,
 		.wr_table	= &dspi_access_table,
 	},

-- 
2.34.1

