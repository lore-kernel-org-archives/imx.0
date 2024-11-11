Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE91189BBB
	for <imx@lists.linux.dev>; Mon, 11 Nov 2024 11:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731323997; cv=none; b=IstqK9Yf0wd/zGFzuDoA7KOLfW1Pjfy4+oZBLjYy+Yk8WgT0SmDGeoFif8Cm5yEkiqLlXgn4m2497XiVpLU8KpRGylsrJ6IkJWxvLsqOYyMsmL+bKbGuR930reE/MwjtqiNaLIy8emUsl25fI/rUvEdwmLe3M6ZXGqMscKXJziM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731323997; c=relaxed/simple;
	bh=xXAvRj8AmLSKWPBTJCUUr8yNr91DS97PKpc1oBmJELU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DYl5SB7B/9ae6j4ota6z35tS5aFP/bKdIvdov6Jnd9RmaWts/4CtLtMAHkE1vfxtMRgnV3Hho418vgU5WFGYu7lFpnUFSxrbVAekKzgZ3zEEhtLL/nFsAHDSAXC68gApicASh64tV0B7XpjWxGWvrhVvkR6hmi3P8OmLT3mcEDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nslGSmyS; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nslGSmyS"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a99ebb390a5so1005311566b.1
        for <imx@lists.linux.dev>; Mon, 11 Nov 2024 03:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731323993; x=1731928793; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yq4v/gyj/fLO48IP0NaLXgCS56M3wS/277l+hJaYFIg=;
        b=nslGSmySak2yl14RwcMMlJCfugWhsrO3nHjORsFHeSI0bYZA4vuKsLUCkfbrX3dMIv
         4USv+Rcu6YSRjVr98TLdHW1RVtWqUx0Rw41E5+Ld/+/DQUN8HxTsk4Ywavx5S45/r1zP
         0qr46fGroi0rAWBj+6blEsSsD544t9OdeZ+94+lCgSYruha0OjgEzr1D7WcXJb91rqER
         ZaOKTgPvhIAw6Apak+2xaqTkH9vMbDPDYnt8Vr4C5/4DFaBkXei2gowfCfHc35yKT8DU
         +5+CABNG6WkSB9NSW1NIN6KVtbBF67LqD6m6xVrN6DMMG4WDbTbFF5KEosLX4lQxmXTe
         zhzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731323993; x=1731928793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yq4v/gyj/fLO48IP0NaLXgCS56M3wS/277l+hJaYFIg=;
        b=oqEexND9HwBvKwjg09kUNsRdMu3sVpMVZVhmusbCjEsRpOeSHNpXxembtPoZMwKcl+
         A279AwVS++dkZMeUv1JeDnY7lHy4KYGQ4d3zjFSMsfRWjO6Gg+mp8J621PxaV12NnKwR
         thp6zNs5lTqBBBvN/jbqvWZ70O/+BhdgMgrrRytDTtxPn4HGFyDzDwWKA/xewDyVWlNU
         P+A5gyxCaEF8m5Zj/gx/bcpGrgVrA7CVCMaM2yPCHf4z0ZdUQeafYW0hNLmK005L4g22
         7qmnuyqEhxI64s+c77tO2yyHzyYHzOwB6n/aCkqYm0rF5RPQpOpWZlt4WBuD5bQiEH4N
         CmlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZQ+JO4x6qofkgAO26YduFyuGGnqCffgtwjQoO6uQsF2hlk/8uNfClOCmAl538m3AqueY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGBGyJ2GSId2jXiJE1b1iPUBuE4pnyHDmXepNsAk7+eOxihdFe
	r2O2OI7FzLfK5j1v++P7apsGw037AsA30WSwhJ0hO+bDBWm7i8BrxmgGwLj9mLg=
X-Google-Smtp-Source: AGHT+IGuK2Mqhh/4a1qh5q0NmwjtNgZX29PbWEQEw3KvEot2jIrlM7uXsL6sEyoljZjEBiZjnawbgg==
X-Received: by 2002:a17:907:96aa:b0:a9e:b5d0:4714 with SMTP id a640c23a62f3a-a9eeff934b8mr1161128666b.21.1731323993471;
        Mon, 11 Nov 2024 03:19:53 -0800 (PST)
Received: from 1.. ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0e2e922sm582530866b.193.2024.11.11.03.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 03:19:52 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peng.fan@oss.nxp.com,
	m.felsch@pengutronix.de
Cc: pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v5 2/3] mtd: spi-nor: use local variable for struct device
Date: Mon, 11 Nov 2024 13:19:45 +0200
Message-Id: <20241111111946.9048-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241111111946.9048-1-tudor.ambarus@linaro.org>
References: <20241111111946.9048-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1819; i=tudor.ambarus@linaro.org; h=from:subject; bh=xXAvRj8AmLSKWPBTJCUUr8yNr91DS97PKpc1oBmJELU=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBnMehS9ebdJFKcsy5atBuVMxdS3C7109r1J/woe qFiYPTIviuJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZzHoUgAKCRBLVU9HpY0U 6ZjVB/0WO+cX4vsaTdpLFXuKZKYDOuInLaBWEUgEPPZ/8cU4SDjiZKvr8yqh0UtViU1djsAGxrU lbbkvJAMmNKkIx66H4M55b1h6KMzypC7Gh2btvdMNc0kajfHClQULdOw/bmIgmUvlEGyMUaesei wMP4FzWZrVtgS990dISZi7Pb49XLFqGXQ+Ljbjhjh52HD0NDBRYPAY0GoVz2WfswymhIVH58lLn qM4IX/9b2evCs9iyAkAnuO6ihfSpfUSuoisuuY3nW3tEB9ewWucFstc9YWOmEQD/QN9wZiBRnk3 kFup7CWm/XBWyReXdRdjHbbjrhiBuF8zQinlnQoUIb61MhR1
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
Content-Transfer-Encoding: 8bit

Use a local variable for the struct device pointers to avoid
dereferencing.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v5: new patch

 drivers/mtd/spi-nor/core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index b6f374ded390..2a329084505c 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3576,7 +3576,8 @@ static int spi_nor_create_write_dirmap(struct spi_nor *nor)
 static int spi_nor_probe(struct spi_mem *spimem)
 {
 	struct spi_device *spi = spimem->spi;
-	struct flash_platform_data *data = dev_get_platdata(&spi->dev);
+	struct device *dev = &spi->dev;
+	struct flash_platform_data *data = dev_get_platdata(dev);
 	struct spi_nor *nor;
 	/*
 	 * Enable all caps by default. The core will mask them after
@@ -3586,13 +3587,13 @@ static int spi_nor_probe(struct spi_mem *spimem)
 	char *flash_name;
 	int ret;
 
-	nor = devm_kzalloc(&spi->dev, sizeof(*nor), GFP_KERNEL);
+	nor = devm_kzalloc(dev, sizeof(*nor), GFP_KERNEL);
 	if (!nor)
 		return -ENOMEM;
 
 	nor->spimem = spimem;
-	nor->dev = &spi->dev;
-	spi_nor_set_flash_node(nor, spi->dev.of_node);
+	nor->dev = dev;
+	spi_nor_set_flash_node(nor, dev->of_node);
 
 	spi_mem_set_drvdata(spimem, nor);
 
@@ -3628,9 +3629,8 @@ static int spi_nor_probe(struct spi_mem *spimem)
 	 */
 	if (nor->params->page_size > PAGE_SIZE) {
 		nor->bouncebuf_size = nor->params->page_size;
-		devm_kfree(nor->dev, nor->bouncebuf);
-		nor->bouncebuf = devm_kmalloc(nor->dev,
-					      nor->bouncebuf_size,
+		devm_kfree(dev, nor->bouncebuf);
+		nor->bouncebuf = devm_kmalloc(dev, nor->bouncebuf_size,
 					      GFP_KERNEL);
 		if (!nor->bouncebuf)
 			return -ENOMEM;
-- 
2.34.1

