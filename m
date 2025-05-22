Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E1C28E566
	for <imx@lists.linux.dev>; Thu, 22 May 2025 14:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925574; cv=none; b=uHS5KFTHYZecSWlDTU1Ql3+lgIudhBrjkBLHoYCNZ/DBxRA+ut5PbhH1mZWb08sW0ov9p34yxG0uustObWPplyt2m7ThbX4e6kO7krgoJxdz9+iz/FU6Yysny0fz9N1lvR1UB3Q9bWgxgm4nlVhUJXqLHIIG+iwsWLEhmSwf3fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925574; c=relaxed/simple;
	bh=0e0G7GONBUQeocyCnkkONaSF+xI1QoW7NjnPoRRusIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B8BJ9Zg4E7ZQ1u+HyCtOTfBjWTeASnPYwesPUfA7moXZ9Rtc8nLzmi0OYPhBRkAOyQ8E9m5GBLZIufPwjdbnnHgGrtnsCkrJN10znTeNkLncWgkNPVlcoYjoPHuzFTGtpXBV4BS7pBp9Y36lzWce8pgPQlmZHJXy42QxjFLcJXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l5Vd/gmW; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l5Vd/gmW"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-440685d6afcso86312345e9.0
        for <imx@lists.linux.dev>; Thu, 22 May 2025 07:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925571; x=1748530371; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N4sEJM+871Hq7BueZc9qSjjVinOO/X+0tYY6aaq4Jkg=;
        b=l5Vd/gmW04zM1Y9CW3w3ETX3SEsA/qo/MU3tHajzwY+7MIrKDlB6HN4WLrb3sDnpaK
         r0kYQr55nlsbIZwzz+PblrvgE27Nv4Le7JociiK21cCWpoi3Z8gB697Ks12l5+69p8tC
         LExuoNiFkqhZoWOgelISyKcKStiRbAVl+hspT1Nh4BM385HqVuXLgmZ01uvSgV6IDKpz
         ++z7qmmjyl5ibSqyxgw8c/ZzLKPAoRIIJlFghFSbRQQ6+yBcLvxpjWH6rZzfqKqngxEI
         e2yfbXXU/hO78Q3ywwWgE+Hj44+APwivRwFQeYU5vevtk9cILI2/ePW+38KIN2UJdef/
         kTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925571; x=1748530371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N4sEJM+871Hq7BueZc9qSjjVinOO/X+0tYY6aaq4Jkg=;
        b=BXuEk7SAXcp3IDeqHcgczye27TE/z4zXtNTt9rIG10TVOb3+DaYmUfM8CAEPVVLVxh
         nfXhp3IBZuQXDasehCgGmRwmxrlyqs9Z0/ZzI7k0r2O9oDp4JRg+ewcWl06DpDcpTELX
         brLY+jktGtqn5x8xPLbO48AJ7ZN2fTlrMIjyGEbJBquxjn4BXFVyq1QH4DRs4u+x1Pdw
         /pzlt5wAG20yeD8iQe+8HyMTQhrosRY6tBXmracvvpjzt/2QHi9qBfQJEHnP/TtC8Ka8
         IXxbhtR2SBMsnFuRW9fChJ46lU9nkd0tkNAhYB+OhlYIA+5ILj82txETaDiYdAXLCrRw
         Cm4A==
X-Forwarded-Encrypted: i=1; AJvYcCWx2pCuEcLjAjzFGG8dfaTlcojocLBuY12lF6xNzhcqjpyFmmrBW4G8Vw7heo3wbqazs0o=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKkedaM7w/FaV77GiOqMVkvVqxzrR7Y2lH9tCWFreM/S/N155g
	ryBU4ROJz6d27Owq6lLGnNqRDO+8AKaAa6WpngwspHItG4ygdJnyvocfr7Kh2+3v4eI=
X-Gm-Gg: ASbGnctgr/mSx3ok++WWwHu7lgN91ZT8tJj3ZQaTZ7p9oBtrqEm75eRVybv6Jk6tenp
	dNF9UUxtcw8iZG0IUKTyEHWuut0IAcuagn0LuDHqWoKcjyFUwIy5izBN6ijxCnxvzqH+rZ+aE5a
	xsRJMIQdmcw7pM4MomlvpWnA7lgvoMbbSF/dD+p9ljXqOljkZFZg5emUnuruEDdUHj8Zt5ZBisa
	d0nY0fyVE+BxkZgUhHpq71Kacth/DAWqAn1eeQxS6NsoZDunBxjjcXRvkt/gbmbXcLBygyophHg
	KKJ5epI4ylSL16idptpOHF8QBLkaLggRie93v9Li6xKhEUya81KVMuRhZ38G
X-Google-Smtp-Source: AGHT+IF7HwvFx4mEXB3EyW4Q7v2VjPs8dvE+4oPy+CvCTPqUtNiIogBefTp2+DWncfUrub+h4prcpg==
X-Received: by 2002:a05:600c:3d8e:b0:43c:f87c:24ce with SMTP id 5b1f17b1804b1-442ff031845mr220598755e9.21.1747925570681;
        Thu, 22 May 2025 07:52:50 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:50 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:36 +0100
Subject: [PATCH v2 07/14] spi: spi-fsl-dspi: Use spi_alloc_target for
 target
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-7-bea884630cfb@linaro.org>
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
 Marius Trifu <marius.trifu@nxp.com>, 
 Larisa Grigore <larisa.grigore@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

From: Marius Trifu <marius.trifu@nxp.com>

spi_alloc_target should be used for target devices. This also sets
ctlr->target automatically so delete that line.

Signed-off-by: Marius Trifu <marius.trifu@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 10e511ba1cd8..814a92b8064e 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1366,7 +1366,10 @@ static int dspi_probe(struct platform_device *pdev)
 	if (!dspi)
 		return -ENOMEM;
 
-	ctlr = spi_alloc_host(&pdev->dev, 0);
+	if (of_property_read_bool(np, "spi-slave"))
+		ctlr = spi_alloc_target(&pdev->dev, 0);
+	else
+		ctlr = spi_alloc_host(&pdev->dev, 0);
 	if (!ctlr)
 		return -ENOMEM;
 
@@ -1405,9 +1408,6 @@ static int dspi_probe(struct platform_device *pdev)
 		of_property_read_u32(np, "bus-num", &bus_num);
 		ctlr->bus_num = bus_num;
 
-		if (of_property_read_bool(np, "spi-slave"))
-			ctlr->target = true;
-
 		dspi->devtype_data = of_device_get_match_data(&pdev->dev);
 		if (!dspi->devtype_data) {
 			dev_err(&pdev->dev, "can't get devtype_data\n");

-- 
2.34.1

