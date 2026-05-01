Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ED03BFE47
	for <imx@lists.linux.dev>; Fri,  1 May 2026 14:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777644006; cv=none; b=O7KcTVx54EQIRTFYzZj/Uq6afPqsyPkdLjXgJhKtJwJu5oNXpLWQxXewQ9pEbojI+a2dmMOcJjZd/hkLO/kLkCuz5RfaIHBk1iHGYW/MCoZpswXmlRcaXUULC77V9B2NJj6OLhaf7lmJf/gmoje5FchDE7MuDs82eaerN43qn/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777644006; c=relaxed/simple;
	bh=FPDrMq+XXIYVnA2vxX/dXx8+DI8MvzMK7n/I8l8+h0g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rCQJJ6z+fjLXVKdw5NePzqF6saputqd6OlUDUdFhoA+RahPp6CYQV9AOo3600QHPmj+IJDCfc2uL9TZerB9NxRg65EzG4iR+Oo18Aw3/1B1YV3a6ZkUV23Mbcz5dYYGAx1o+k1A3bk6Mm1zH0E2oRnUVkbh8jNMGpAG/XUxEdWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oEEqODIQ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oEEqODIQ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4891b0786beso13302125e9.1
        for <imx@lists.linux.dev>; Fri, 01 May 2026 07:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777644001; x=1778248801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wV29etHKmeXpNOvM6Yg7tazjewCc3IV5UL8KyxdRZok=;
        b=oEEqODIQMhIs3ZLOX27Q/c12GKVe3ll/ZKGxdprigNRa6Y2iBCcRuHRZDkAZ84rAbs
         fK2yzs0C6wAlrLhJpLTrKLLrto0SB3tQFWlfAc7z1/XVSQpmwI0toUHGrZqofNTvXWMo
         5ZF0lrnKk7Mf+GYvlIdClGITjoSgO5E9ISIyUaPpQpMGF/DL3xTHo7zsNiSWxRtEPAjv
         dI7P0Czl7Lb8uM7yiTTWkDKaiBTOnyByF7uX3H5OhBhTxM5zGcUdSIdIq94lhH4s9BYV
         9Cv7hWmS9DGDZfN2BZtPKn12isLddUGmOt5F+8BvQLeJVKpXL1TQsh5OFLBotfJGIoTf
         NNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777644001; x=1778248801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wV29etHKmeXpNOvM6Yg7tazjewCc3IV5UL8KyxdRZok=;
        b=I3OwAqwnSrMTFbdL8lhEs+plidGIkPUjF0PY7iM62D0U2/GuMgNqrpdH++Y8SQ6Qfu
         UHXru4Dn+MhAnLtaiJkwuCL5EDHrfL5B9I+sP04VUgslB5wkqcJGT0EQXNAYZJzk7q1W
         wkt/B9wqjaQkHCpEuD0iwhpIH/cxzbi/Sdr/2ANujWJxV0WDpRJPEKMD0S0FrD7jQbbz
         BEZv6244gxlrT6VaydZIpoRg+eKLIod78QwzAYf8nDDOwoSfNL140vbCGH97Qvd+Swo5
         FH7Rf4jL3yIhoqC0dqusRKIJgISxA9JwzlnhwnyOayxey90K5ar3s0X1MaZXbIWlJAkB
         PxHA==
X-Forwarded-Encrypted: i=1; AFNElJ+qtjIfQ+V5Lp1V5Zb4jcWTHxEi0WgibEP+D3sX3yv52aRc8AEID9ESywgNibC81dzN7PY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFrjiejjQeJuI6FY3dG/rUmX//pEcFzYBlzM6FcQQNCvqUZrs4
	xy/Qq7+8YL6HOPjFlqJIGO7+dYk29z9WlD5GTj+AhQLuyDdYDfWdwHep
X-Gm-Gg: AeBDieuRBfh4nBwcn3hgrqoNw0WY8HppL3oxUrtv35s8b+96NWDaH6JW2+8fryIxcL5
	C3v9Do4S1dFAZMbx2WpjHpY0SUQ1WTnRQOcH51jHnld+ye1D7fvzKJqdBPeMYQf71t16jS6Cvnn
	3W98pxKz9NNtF+cG434hxo5cmdbxhQKWh7HsFotQOxX3qkeKacDFy2i0ZQb4sFv6n9+I+MiHOSY
	lwoVQ/LXbIwFLhtPJNBx13ekkSTYTVmGri4IJQoEmq76xlqnY1D4AHn8cGh7z8qHWv75M+l95AX
	emwEsTty56NgEnzCsXRQPe34eEETZux0CXVnznXsYx0SzP7krep0td3QcUifPxbBdFcKVeeJLhb
	snMX7Qu+d7B49H8BXKKBeKHr9dU8Klr9y9WOI2cbrgKq1hIxDFjfHkVtU/9WB3g8X4JiHgVaFw/
	VCygJ8DtEIsJgfVtnUE3B+vqO4RaktV0v21HF76Mf/2Xo+ETgt3RAgIs1GtVlfXxOrqqnaOhPfC
	RQW
X-Received: by 2002:a05:600c:a401:b0:489:1c1f:35df with SMTP id 5b1f17b1804b1-48a84452161mr92478485e9.10.1777644001371;
        Fri, 01 May 2026 07:00:01 -0700 (PDT)
Received: from localhost.localdomain (ns31537009.ip-141-94-163.eu. [141.94.163.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b768fdsm4823539f8f.33.2026.05.01.07.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 07:00:00 -0700 (PDT)
From: John Madieu <john.madieu@gmail.com>
To: broonie@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	carlos.song@nxp.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu@gmail.com>
Subject: [PATCH 1/3] spi: imx: Fix precedence bug in spi_imx_dma_max_wml_find()
Date: Fri,  1 May 2026 13:59:49 +0000
Message-Id: <20260501135951.2416527-2-john.madieu@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260501135951.2416527-1-john.madieu@gmail.com>
References: <20260501135951.2416527-1-john.madieu@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The watermark search in spi_imx_dma_max_wml_find() reads:

	if (!dma_data->dma_len % (i * bytes_per_word))
		break;

The unary ! binds tighter than %, so this parses as:

	if ((!dma_data->dma_len) % (i * bytes_per_word))
		break;

!dma_data->dma_len is 0 or 1, and `0 % x == 0` for any x; `1 % x` is
0 unless x == 1. The condition is therefore false in every case
except dma_len != 0 with i * bytes_per_word == 1, i.e. i == 1 and
bytes_per_word == 1.

The loop almost always falls through to its end, leaving i == 0,
which the post-loop fallback rewrites to 1:

	if (i == 0)
		i = 1;

So spi_imx->wml ends up at 1 for essentially every DMA transfer,
defeating the entire purpose of the function. The DMA engine then
requests service after every single FIFO word instead of using
multi-word bursts, hurting throughput on every DMA-capable variant.

Add the missing parentheses so the modulo is computed first, then
negated:

	if (!(dma_data->dma_len % (i * bytes_per_word)))
		break;

Fixes: faa8e404ad8e ("spi: imx: support dynamic burst length for ECSPI DMA mode")
Signed-off-by: John Madieu <john.madieu@gmail.com>
---
 drivers/spi/spi-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index e5c907c45b87..7ae8078c10ef 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -1836,7 +1836,7 @@ static void spi_imx_dma_max_wml_find(struct spi_imx_data *spi_imx,
 	unsigned int i;
 
 	for (i = spi_imx->devtype_data->fifo_size / 2; i > 0; i--) {
-		if (!dma_data->dma_len % (i * bytes_per_word))
+		if (!(dma_data->dma_len % (i * bytes_per_word)))
 			break;
 	}
 	/* Use 1 as wml in case no available burst length got */
-- 
2.25.1

