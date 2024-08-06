Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A05FB65C
	for <imx@lists.linux.dev>; Tue,  6 Aug 2024 02:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722910144; cv=none; b=qoZgFHlR3ribyStWMD6JmeigbBUjhbGWbz5BpzX3YQ9+ROg7Oj0saAG25ULbNdoMf2W7ZzPZD0HIuDhd5oaBF+2h1vwgW62GxrJQERsyw/Ed2e8JJEKzqoJUHLQy0HiXtTkNQWwDhSyrk9Ed+2ln/hZH2hEJQBV06QWkbTYX3Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722910144; c=relaxed/simple;
	bh=Ca+d0ODx2xoiiM6ESfjF4cXQlY7wYJydrvzYpinB3Io=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ILahgbpbSwuYY+oRsnucztpmrm/X5RG1SR7r35MppXxvqBtzrWCdifLKjO5shbHVCAc/xsMeVOETeAELd8gWosg9UF5mgUtj3fc64RqCmjTCs34ZsZJhLsB5PWDaQb/5sK+UdwwOaOb6yHD5Ge6haNHvAU057ODb0eOSNAUOhf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MERNNg2D; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MERNNg2D"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70d2cd07869so74721b3a.0
        for <imx@lists.linux.dev>; Mon, 05 Aug 2024 19:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722910142; x=1723514942; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ITxmvtMqI6oEXAlVIFKQnzOzb4QRVO0KBmpIZf0cbRg=;
        b=MERNNg2DG1HCrpXFJmbjcrXHGyDLe7zHJQ123cW5ZM999yG3QdYrQUGPLJleQCVHEg
         eGxjk6nZ5BWCWbz3RU3AyWn9k35UDVq2ZZs0/dzEyYxnM/+R0RV8S8h0CuT4TBMsXNzu
         txWmSrxb2VrL609YBGaL+QBzHqE4NogIITb2D4bitout6gD72Dx8s087eT3sHkIQCwEz
         lOt8tgNoDvLgT4UD6WMvajp04ZhDruZX6ggxYG70xr/1VMajgA6zet0XLbyJqJDwqRKc
         vJy5cZQfwsvRU5cCWK4AbgNN6Umbu4gOT93X+JDywJqeeJp7hLNitzaV0/UrF5CGgcUx
         +fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722910142; x=1723514942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITxmvtMqI6oEXAlVIFKQnzOzb4QRVO0KBmpIZf0cbRg=;
        b=NcdZOwVFUt+BtXsviXgVnaykFj6BBjijwUYaMIBMYl2G/CLyCTOIeez6MJlycOoHEH
         l1Zfp8Zjg8bkNrSXOTHouWRwQMiv6A8wTAunRzYtu1AZiwI8Esn1rcR3Jq8q1myNKRn9
         eJ8fP+p6+LnwppoEFRHz9c4TCNHzGJBXEry1yluYCD8fMnA4G70BTd1NTvDHSCjZVlpO
         d4rbIv/brX/EFdnRxDXUVyfjD4C87lH0wqK6FeUVCk0mWR8Vvu+7x7ZvXaumAIJrXT9O
         TqHN0keeXwK1n0BMQnLA9d3j+U+Tn9s3rxv32lDf0JohmSKBEm/2G/u2qoRtBOi3EWOQ
         R62A==
X-Gm-Message-State: AOJu0Yz1FpWbB0KUxD/eC7HRZB66mujN5Dn5nFxQvNZ5mtAzsQHVVE4p
	tUn//VK3vDEprFNToIhH9RGeIR/BYdWRF3YjVWIeuNsl6aeMWWlq
X-Google-Smtp-Source: AGHT+IGm86BtUIgU/4uwcrMKoqg2zL00hi5XcphKLl3E77gl9tqQQi0vo/VbarUVUzbq3MWwHzxx1w==
X-Received: by 2002:a05:6a00:21ce:b0:70d:2c09:45ff with SMTP id d2e1a72fcca58-7106d0927eemr10616080b3a.4.1722910142369;
        Mon, 05 Aug 2024 19:09:02 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:3668:14ca:30e:638f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ecfc344sm6058092b3a.151.2024.08.05.19.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 19:09:01 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: vkoul@kernel.org
Cc: imx@lists.linux.dev,
	dmaengine@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] dmaengine: imx-dma: Remove i.MX21 support
Date: Mon,  5 Aug 2024 23:08:54 -0300
Message-Id: <20240806020854.2522412-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

i.MX21 support has been removed since commit 4b563a066611 ("ARM: imx:
Remove imx21 support").

Remove the i.MX21 support inside th imx-dma driver.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/dma/imx-dma.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index ebf7c115d553..e913f0db99da 100644
--- a/drivers/dma/imx-dma.c
+++ b/drivers/dma/imx-dma.c
@@ -167,7 +167,6 @@ struct imxdma_channel {
 
 enum imx_dma_type {
 	IMX1_DMA,
-	IMX21_DMA,
 	IMX27_DMA,
 };
 
@@ -194,8 +193,6 @@ struct imxdma_filter_data {
 static const struct of_device_id imx_dma_of_dev_id[] = {
 	{
 		.compatible = "fsl,imx1-dma", .data = (const void *)IMX1_DMA,
-	}, {
-		.compatible = "fsl,imx21-dma", .data = (const void *)IMX21_DMA,
 	}, {
 		.compatible = "fsl,imx27-dma", .data = (const void *)IMX27_DMA,
 	}, {
-- 
2.34.1

