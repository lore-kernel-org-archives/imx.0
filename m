Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F731442F2
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 17:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113838; cv=none; b=FwSF3VoAw+ZMA6ieZ0g3arTzou8JztJ+Tcw/xlXlHi6P/aiqpEpARfmKRU+W6mTh4wF00wIHJv8Pe7dOmZTQr9XxtGf7quEzZ6LISOZ8wLXmapbkA/jMuNRrVXA/snB5kBr7wWcLA6wnQDJyOLLj/Un5QVqU2k6WViPTKubYoLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113838; c=relaxed/simple;
	bh=1m/pxOteRlGgMNCyaHexY3JgCLjPsEUnIURObz8tXYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bvGL36WAHh0wi22KY/76vvhocJqKFgekIL2Lq2OU7QQtfuKbhZIjB/EnGKLZzb3FcrRX8Jr0/wFZiWhwDwKEthXO/Lt/WUQohxg7ynFkg/1KB+QSXUUis1aRVkTfzUd7XM/s1CtCQ6HPfef+hO/vxt6rCJk0+63EUqHr/pYdnC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mip/bOVx; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mip/bOVx"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2eaafda3b5cso8132841fa.3
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 10:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113835; x=1720718635; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bgu8mPTxD6LTopVNnBQAINmTzhDmwR9bV7xd7+3+F9Y=;
        b=mip/bOVxTAftskqtqx3PfP88yksS/2hIFtAF+sqF8EUBr1rxqsqD/ZYvcmtZTbnzOq
         w2827ofCkRxOnfzQLIwtQYkKyjayiPOcXRj4p+IgZkq7FiM1HUQQ5TgtRPVAQSbn12a1
         v6JcXxR7QfpnDuckOnt3GM9zI4f5FxTRGNGdXpWz7g+cwvXs/ggLqBMFM8NNUtsO340B
         nSsYb5jC9vIkLDiH4vAvkOFQGQ87xQV1bQvVxEVMk09Q3wdvjZJW7c8tRXCtJFZvqw9X
         IYIEyB66vHev5+gisnOT4+ZdDwoxq2frT7pOPxM7QJyT1YrvExGEXkT4aYlG+QcdD35V
         az2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113835; x=1720718635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgu8mPTxD6LTopVNnBQAINmTzhDmwR9bV7xd7+3+F9Y=;
        b=pYdj+3wzbnrtdKdNo3gNoa1GT0gDreIghGX/G8LZjp6L8c4fjEJZxG4ztPlvQMK2SM
         bw+QXTB+i35APdR01a0jqaN+U8FWfE9yakFxbdvWPU3LMqfAv/nxS+2zXabjStNR6qMK
         boN8LInUVSTK3/eo47seL4sBHjS2s35TAHxJSNP3MoPQl3Ms2g0g9uzMRh/K0POwfa0A
         Dt8bTTJOJvkp+JiISgcaVLHNu3vz3B6xrakLFO2wDg5UsUJbOzVECv2CXI8RsJAQemjR
         IF56oVSswkF4WEbgcuO7oiovfwuYCT2pALCaeatoGjfq+KHpV3jFdJ9S5ubcDJFelpV1
         duhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVct1KHyssX6PxrfDSWZYWWy4EZoirXTn+lPhJAOLG7PxCGfJQXOmGHQQdgaSOcAkD+ItpTw6MXGstlfWFl9bnsDxEU
X-Gm-Message-State: AOJu0YyXU6tkXGgkUep+fVDB8L/qr2varpJr7HK98pRMtZB6afnj3hr2
	FwPRukARBz65JJV3h3+PSS8ry06kngZA7ErFpVQvp3ZD3hMphxPL
X-Google-Smtp-Source: AGHT+IGTTDUX5xEcXehpK5p7DL1hZ7A+1Za2oYq7PQX8dR6i9vB1itup3bf4lD+UiyWYmRXXB4CwXQ==
X-Received: by 2002:a2e:8455:0:b0:2ec:1cf1:b74c with SMTP id 38308e7fff4ca-2ee8edffccdmr15048801fa.32.1720113834597;
        Thu, 04 Jul 2024 10:23:54 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:54 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:26 +0200
Subject: [PATCH v2 16/24] mfd: tps65090: Constify struct regmap_irq_chip
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-16-0c8785b1331d@gmail.com>
References: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
In-Reply-To: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, Xu Yilun <yilun.xu@intel.com>, 
 Tom Rix <trix@redhat.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Tim Harvey <tharvey@gateworks.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-omap@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=731;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=1m/pxOteRlGgMNCyaHexY3JgCLjPsEUnIURObz8tXYU=;
 b=6ZjF4CCDond7ROCsSHValBcFRwhWsXcos339NS2RkS8I9EiCixqiHyaPBI0Ln/RAHlHfcBeG5
 v+XNd5JP/0oD7MeDVFDT4TV8qnHm97Yw1kKEqLrkTbM/ycLko33gOVq
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`tps65090_irq_chip` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/tps65090.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps65090.c b/drivers/mfd/tps65090.c
index b82cd484ac85..24f42175a9b4 100644
--- a/drivers/mfd/tps65090.c
+++ b/drivers/mfd/tps65090.c
@@ -120,7 +120,7 @@ static const struct regmap_irq tps65090_irqs[] = {
 	},
 };
 
-static struct regmap_irq_chip tps65090_irq_chip = {
+static const struct regmap_irq_chip tps65090_irq_chip = {
 	.name = "tps65090",
 	.irqs = tps65090_irqs,
 	.num_irqs = ARRAY_SIZE(tps65090_irqs),

-- 
2.40.1

