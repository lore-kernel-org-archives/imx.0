Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7E322AE6B
	for <imx@lists.linux.dev>; Fri, 21 Mar 2025 12:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742560885; cv=none; b=dQjNLY28pBTW2SmqRwZlYMuJFfvMmt/mszxq/cpX4BtiZxPAFi7PpFmaTCgh3jXV5p7aeTEpl73W8WmHVzpMheKGKZBFzdBPRZ9bx7Ji6phjDmJ6fCE0AkY2uen9qoTmNfX3jj8gWBuB/UdMrg9m8JzIjEvdSV8pawcvmgM0BF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742560885; c=relaxed/simple;
	bh=BG95/kpH2T2XChYHmeVEkv+OFNTEZEMhajpahTEw5MA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ilupazpaQlJe/LOU3HJMP/Nbflk/clMs6aJhh0trX1FTcL7EhOxHeZOYGn35UNGhtyPaOLeZFrzBzBfin3d+duDqlfDXwRZBmV1GNh+rGbcszOQsBX3A4gBZd+Gn2NaZstxOitbtOLsGquJ5bTvssryYnstgvm31l3GTokoqUa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lOxJQ0mQ; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lOxJQ0mQ"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-30155bbbed9so2552950a91.1
        for <imx@lists.linux.dev>; Fri, 21 Mar 2025 05:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742560883; x=1743165683; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7wwN9Kvr/NKHQSZ1VFBzwzCVRSebNdFa88rDFhJwVuA=;
        b=lOxJQ0mQyRTwst98tEy1z1HPL0x7ds1n6TBiJcbQkwvhimsu7kF1CeshKWBUxb4lV6
         qqcJ/U5mRUVYA9e1QhELLn+KrjqbioBwpTc3/EW7oPg6W8iApNs8eXM0mznMRVdRN8yh
         kgIiTRQgCNQGgtyxg/F3bgl3K+n0nrDU86Z3YYa9vg8fUprD09EthFswmeH91Ccs17cE
         170krqFNlkYR4lebubbqWpm08+Nw++xCMgeKMkEiCcDKmQpp/k9R4Cyjb9lu1cJuij6k
         sZFSWiR0lVwLqHK0SWVsutHl3oJJXf8db5h21R0LQceJChpibmmNHEheMMhqJLCzSzEl
         vLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742560883; x=1743165683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7wwN9Kvr/NKHQSZ1VFBzwzCVRSebNdFa88rDFhJwVuA=;
        b=JgSBINP0hrjLliw38/H4PAEJJ+jCojirwZaxKzFxmZJ7oCiSzIsmskLuNQMU44Wc2h
         W4lSGhe4ikZR2jCYaHxgyGmOQkxcCZ1cxORJ+mscS9jxNd2pXsV75L/mfE4JXkn4lFY9
         DR8Zmads1583VqkbIQSfSTR2nXg6wC60YGKTkLjR/SxNpJGU6BW9YYHwKU2aOsb5y14e
         0HjWbuub9i5SVcftsDZKIcRHFgaPNuRBI2pDaraNR+mzv61KXFqNiNptGQBPQ1D02n8j
         TLsoDfXWIsgenIcPvyYliXUrQA5fq+XNsECOZuhlSW1fu37jAywtia87HjJJ5FGGDe6k
         V0jA==
X-Forwarded-Encrypted: i=1; AJvYcCUTfYSbqp1DbtgUybYkCiMywKaIjG9JVizFbk5Fj1sjYvfmjc/k4UdVSoMGjs1LiIpPJVE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwsTJE88hmbKx4GxfMMbCAHPq1sMXqCAAibLfEwozJG/UC3ia7f
	skm5gJS48+ZDgzxESmRLCiZj126COwT8KCDzdMx0KwHSeiFUHyEi
X-Gm-Gg: ASbGnctVC30gSTACoGR4p0LTqYLnNg4b9f17Uf+CzYEm6rtHbkiqsnRCTD6xKyJB44H
	yIaAdd55vT7+kFCykOYip83LNGvlGcTcLycQYqk42gBTW4Z5xy+YM3Pgpvgb+TDWQEaapmy6rX7
	3cFYKvoEWMVCT4cF6vqbQmolarZMeTZGq5KNw4Jm5UuYtEZjAXXcYzRxO4yF4IrspPLDROLrA+c
	OaccUyCGVVjtVgDc+N4w1qAlVD/RCrH0pwYd9E5ZElp6dIYFfh/U/XJI1lStYEwEroKuU1XK2M4
	TCO5X60WfqjZpmwB8qPkl8r6JyJEIUzI883nNf48jA1LwhhVWfokdrDB
X-Google-Smtp-Source: AGHT+IHKoofb89gkg69CyAvY7SuA69KooT8+07mHaCKF1Sl6zFIL6xNY6g4HTxlAOxSKosmFiBX+8g==
X-Received: by 2002:a17:90b:280b:b0:2ee:d824:b559 with SMTP id 98e67ed59e1d1-3030fef09b9mr4797264a91.28.1742560883477;
        Fri, 21 Mar 2025 05:41:23 -0700 (PDT)
Received: from localhost.localdomain ([147.11.105.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf635929sm6424975a91.40.2025.03.21.05.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 05:41:22 -0700 (PDT)
From: Kevin Hao <haokexin@gmail.com>
Date: Fri, 21 Mar 2025 20:40:22 +0800
Subject: [PATCH 2/2] spi: fsl-qspi: Explicitly unregister SPI host in
 remove()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-spi-v1-2-b9939baa64b6@gmail.com>
References: <20250321-spi-v1-0-b9939baa64b6@gmail.com>
In-Reply-To: <20250321-spi-v1-0-b9939baa64b6@gmail.com>
To: linux-spi@vger.kernel.org
Cc: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Volker Haspel <volker.haspel@linutronix.de>, 
 John Ogness <john.ogness@linutronix.de>, imx@lists.linux.dev, 
 stable@vger.kernel.org, Kevin Hao <haokexin@gmail.com>
X-Mailer: b4 0.14.2

Currently, the SPI host is registered using a managed API, which
automatically unregisters it when the device is detached from its driver.
However, this unregistration occurs after the driver's remove() callback.

Since the host is already disabled inside the remove(), any pending IO
from child devices can easily corrupt the kernel.

For example, the following steps on an imx8mq-evk board can trigger a
kernel panic:
  while true; do cat /dev/mtd0 >/dev/null; done &
  echo 30bb0000.spi >/sys/bus/platform/drivers/fsl-quadspi/unbind

To fix this, explicitly call spi_unregister_controller() in the
remove() callback. This ensures that all child devices are properly
removed before the host is disabled.

Cc: stable@vger.kernel.org
Fixes: 8fcb830a00f0 ("spi: spi-fsl-qspi: use devm_spi_register_controller")
Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 drivers/spi/spi-fsl-qspi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index efd87f44c63a5b12b76538aa459ca8eb203b9dcd..4767d2085510c2f231476ba75e46f83271c4c645 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -272,6 +272,7 @@ struct fsl_qspi {
 	struct device *dev;
 	int selected;
 	u32 memmap_phy;
+	struct spi_controller *host;
 };
 
 static inline int needs_swap_endian(struct fsl_qspi *q)
@@ -862,6 +863,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 
 	q = spi_controller_get_devdata(ctlr);
 	q->dev = dev;
+	q->host = ctlr;
 	q->devtype_data = of_device_get_match_data(dev);
 	if (!q->devtype_data) {
 		ret = -ENODEV;
@@ -934,7 +936,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 
 	ctlr->dev.of_node = np;
 
-	ret = devm_spi_register_controller(dev, ctlr);
+	ret = spi_register_controller(ctlr);
 	if (ret)
 		goto err_destroy_mutex;
 
@@ -957,6 +959,8 @@ static void fsl_qspi_remove(struct platform_device *pdev)
 {
 	struct fsl_qspi *q = platform_get_drvdata(pdev);
 
+	spi_unregister_controller(q->host);
+
 	/* disable the hardware */
 	qspi_writel(q, QUADSPI_MCR_MDIS_MASK, q->iobase + QUADSPI_MCR);
 	qspi_writel(q, 0x0, q->iobase + QUADSPI_RSER);

-- 
2.48.1

