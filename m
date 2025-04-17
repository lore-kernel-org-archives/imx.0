Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B222184E
	for <imx@lists.linux.dev>; Thu, 17 Apr 2025 01:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744852656; cv=none; b=AXLFZkW/xIclj6EO6C5J//4bBs8mvnukvsQDcz/G0WKauwMRVeLMU9Prig1UCEaRO3la4ZrOP7W5/KipLPnysWZS9/jg77pWKgT5Tm+QmDRmagcEgGSO5G91LWrZDQh8hFRNOoOpjaZVqFh3cMmknSeEw7hAg5lnFpSmiuvJlE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744852656; c=relaxed/simple;
	bh=tAGrv9Y+ISX56kVJ642r8N1Gzi55R5eePdaHPLoZ/VA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Csu0q/KyaoBHFukScoU1g2cenN8fr2kTemq1lUZWw4yjbGdcWfRj3bI2DsqbN33J/nKks/RwmGJmAYrmxhD3Ub+YjUPy2Ahu6VkYk0CkB0FmFmBjapuNpMRbNbT/zCYjq9dS6Q3mliHTJbWUPPI8erighSs3uMYWfQbXKOVYuVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=inbyRyKr; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="inbyRyKr"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-af93cd64ef3so140095a12.2
        for <imx@lists.linux.dev>; Wed, 16 Apr 2025 18:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744852654; x=1745457454; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X6kZCUyOGMeKdwk9Rr6GjPnU39uDn4efBFP4mrDY4n8=;
        b=inbyRyKrX5DKmWodHlf8wGwid4VOzHKQY7SVhO9VRnyFQCqh8gl1Cg0sEd4fEWrU/O
         Lq0uRpjJsimldIlsxcMwYI2SMee4PHblbnSAA5WrfPZiv67UFMTbcAFqUUBKm/S6Imfv
         Ec4s8rhBqShI7rrTjzU1qQO8BpHZLT99ctWRlE7dtdZqxeC4jaX/K+NWMmQ43PakWaA8
         aOHGopGCaTKojD9oqXFHCmPuibvAuhhWdHsUytyyOV53BRhtYNG/kyyL4QDdctHuYM8x
         xnDqdmBTkk/GLv8bRE2+Hs0SuU7cBlkQmzz1hauejSKjH3ylsWaneGpPSANSjNriFp35
         w/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744852654; x=1745457454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X6kZCUyOGMeKdwk9Rr6GjPnU39uDn4efBFP4mrDY4n8=;
        b=qS2TlyvR+dgDfHZecwH3vagaJ2z7avwldpHyfP1r6/Rq0C6LaKYrgqRhXd5+iU7PbH
         3/khQe+OVBJFdeAJEKqJh5+G1D+3x5UAZLTJphqLkDWcpyNNxgirQhbuLTYNZChxhEEb
         A5VMvfORyb32Qwmm0KPpmJnDsTlqhV0rWCj6iOAPY56wP6mpMTa6Eeqqx5kmm8H3xlQ0
         T3emQKbOZLYoBiWj7uByKVMD7SzeOgTa4zIqyCExKffLrPa8VkfyOludGDDFDygOsV/+
         Twkc7wOnXk0sKJJWXGKJ057HnJV95LWOeeJSRcnAkO7qNRNgfNE+mnRxmd+WCsayYjTm
         dYLw==
X-Forwarded-Encrypted: i=1; AJvYcCX2yIqv4SIVt78K+D5z2wACJbS86CZPUGj+7kATdRMV9J4HmAD2cY7Qb2EaIRGz/gLJd6I=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFoG965TOxbOxEUSyyTJUez68SunzpCvwyS8z4KM2+zjQbKktI
	Zq27Eh3Wy7Yf+qmtwOxMor7WmVO1+mo4xk0Xqyql4NE9cPHZNPiB
X-Gm-Gg: ASbGncthb8UwOpSth1EGbqos+GqVc/2k5alSabXtiEG9nbo/YqKT02zcfEt3qXwnsw1
	x0NW+5Gt8WwVgU+oHn5To0mcJLYkVw2WY5BkaUCQaMh4ZhPY5PrKcK/8TqWRKev+SX19bwjwUOy
	6WLRPhuDmT7H2bkZir4WXKWDvvn5/fEhzMMgBurY0V3LXpncLi3WpEAMKLLuAlpGo6I0wiP+2cY
	WJNwWSOVCtkByZbJnz9lXhKgHl1kHbwG1fHHz88au+dWCtAnrdPjqoyAIt+6h5tJpbutvYdAI1/
	sEnL8WOf5+Z1pUZZvQppmrcISGzPfdcKcR7XAGNUUJnEYbVQnFTKyXv5Y9jXpFh4RpLQaROEqhy
	EXJo3
X-Google-Smtp-Source: AGHT+IFdCxEx27NH3yIHMAmLL3SGYxxHjyXgNtoivLisYP2O66x59yWDou7m+l9nKLM43nZ0EotW4Q==
X-Received: by 2002:a17:902:f60f:b0:221:85:f384 with SMTP id d9443c01a7336-22c358db3demr62326835ad.16.1744852654324;
        Wed, 16 Apr 2025 18:17:34 -0700 (PDT)
Received: from delphinus (p4007-ipbfpfx02osakakita.osaka.ocn.ne.jp. [60.40.45.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3086104dfd8sm2365860a91.0.2025.04.16.18.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 18:17:33 -0700 (PDT)
From: Tamura Dai <kirinode0@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tamura Dai <kirinode0@gmail.com>
Subject: [PATCH] spi: spi-imx: Add check for spi_imx_setupxfer()
Date: Thu, 17 Apr 2025 10:16:05 +0900
Message-ID: <20250417011700.14436-1-kirinode0@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check for the return value of spi_imx_setupxfer().
spi_imx->rx and spi_imx->tx function pointer can be NULL when
spi_imx_setupxfer() return error, and make NULL pointer dereference.

 Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
 Call trace:
  0x0
  spi_imx_pio_transfer+0x50/0xd8
  spi_imx_transfer_one+0x18c/0x858
  spi_transfer_one_message+0x43c/0x790
  __spi_pump_transfer_message+0x238/0x5d4
  __spi_sync+0x2b0/0x454
  spi_write_then_read+0x11c/0x200

Signed-off-by: Tamura Dai <kirinode0@gmail.com>
---
 drivers/spi/spi-imx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index 832d6e9009eb..c93d80a4d734 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -1695,9 +1695,12 @@ static int spi_imx_transfer_one(struct spi_controller *controller,
 				struct spi_device *spi,
 				struct spi_transfer *transfer)
 {
+	int ret;
 	struct spi_imx_data *spi_imx = spi_controller_get_devdata(spi->controller);
 
-	spi_imx_setupxfer(spi, transfer);
+	ret = spi_imx_setupxfer(spi, transfer);
+	if (ret < 0)
+		return ret;
 	transfer->effective_speed_hz = spi_imx->spi_bus_clk;
 
 	/* flush rxfifo before transfer */
-- 
2.47.2

