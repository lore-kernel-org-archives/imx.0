Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02C322A7E6
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 13:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571821; cv=none; b=AEyj7odEiqLrRZheOzjvI7mnOBjq53L3A1J03ZTUC+1mBC2ZLBuxZYORzpw2+XhOLee1VfzRa1A8Siz68iT4QcH910D34GriBRSkB24buTw/w5XK0RCJEC6v67EGW5QBeXcWSpYzqNm5kiBAu72ZYBI41VQOG+YHQvvt5VLEm/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571821; c=relaxed/simple;
	bh=h91Mh4hoPgByHdcKd6/RneQUViXMJHcN0u0JxmaBjQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iiEs/LncyJIzaeULy0Os/VEkcOG/TCuhizEr8nUhKoJGrIvFmV8NHjMDCZ4crqGJyJfJVHGbSHFcBZKf8BKwr14+fZodpVDE+Y26Ft6ZSvn+pahw2zGtevhzOprFyRXEpj9Jk5/lCSS7TKr4u4uzT8Jl4jqAQMJ65ni57kAKa2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=SwYgCuy6; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="SwYgCuy6"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-430ca4647c7so20109795ab.3
        for <imx@lists.linux.dev>; Mon, 27 Oct 2025 06:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761571819; x=1762176619; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXEnNR948aKFzOMEVavf8q+kCpka+pPq8yUEtfNzTFc=;
        b=SwYgCuy6O15Vmll6UWH0OGR0l6gxZVQkjALqhzpp9AjAHy28zuOISmOMKPViCJXxij
         s0Altep0VCrKxB4ky669WI/XSs6pCs6hAaqdjXVv7k5W0pkLsxWKb6S096hzm261LAtC
         cOnX6eZl1nYPy9+FP1n0wD0TIqA+K71QTLcJUiuGRAHUdaOo4NdVbKhevvaz3PANK+Nv
         KQWDf7zMWaQ6SniJmQa+us/GnJlDQWz6clAiD9XR5qPjiv1vcepSoLTfU0Bxf6Vs40R/
         NsehpYf3b/x/6jaw4wRu40r5k9jlMK7941K1OlYQMcB4N33f4bNOqQxS/cXTNkgi136V
         wtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571819; x=1762176619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OXEnNR948aKFzOMEVavf8q+kCpka+pPq8yUEtfNzTFc=;
        b=sDL7iLlmw9jrsSuor4h0RftgKpUvbCd4Jm4nQgqm6aRRMff0k+r1dYbG9TSIsEIKUj
         cGtwUYWKpeE4wL7vdx3GL7LeC3LqoAdIBVryUZ2mFBmgyujie2FT/grc37DXcioxPZfZ
         3AEDtwONWJdTuOMayL6adI/eI/LCLGIzQsdvznHZuokudYDGZlOaPSPErotujXVYr9Gy
         jIDEsMPWNxJFhFWARFxRRk1UhT4cJfp4+I8BKr7dyaSOGXYb3k24H3vmL9skxNfLofAp
         AF3vouR163AoxUsNRcpVvNY/b912KubqCKdiwrQU1Hite9hRpoyg+/yNPinOh7lItH8K
         zNog==
X-Forwarded-Encrypted: i=1; AJvYcCXx6Jz1xgKRa/Hx76F8QUAJiWYMTW8M5blsMbmi/y1rOEJSVr/5Z0RtuQ3w5t1Vuw9wIJE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyopHZIDfCP13F4nOIko/se5T0qUaIJeuNGS0QcZ8CQh1wj/GbG
	AUgsQk1olwL58kMnhNblr0AUrbpSRImP1Oshhehf2wgQ3So2SdInPFRzVQp/80Mm5Q8=
X-Gm-Gg: ASbGnctB0qKtn5cCOcVAcI/k2CbM5DXg1MIRVabXJTGqCLs6kcQxkT/xqcnMme3vj8E
	t+M3vXWmciiQaKvvJaDYdf/wrLFnkM9MO80EZwNAuG2FIlMinae5KwDB5bJlk5wm/pXNmSyD3qd
	nPelew4A7MTiuvisMz6NPhPNqbp2+sLZjqracPCMFltHy/wlbYDkgtzFmML4LwVJLiGZn4hE+bT
	9t2nZ0G8gnXjpFv0I2QtebII8fYzstFuJGpTd2YR/p93puoR4KlXuFOOYjWdDmm9q6z+4kdwo7b
	9GCF/+pkHE36Iv3i0TxNEt+hD/R8Q7X29M0hN2OqzEULBKM/bxEI1k2tEhpGzXRceES9QS+j5r0
	FxXetA+pQ3Mpn9NMtW3w1nmQm7bHXFI05NBRRfCpfcdNLYpSvrp5ulCgSSSE5/880SqWJA20BtM
	T4EJ80oZvTtntfgt275IYx552T9++dz/+D0mYirz/tYFU=
X-Google-Smtp-Source: AGHT+IH0glKysst9aA3Dl1hO2CkWup00aLcqDqNV6Kijix8yVXf6s0ExlLzii7wtaTpwbQLaOSZlgw==
X-Received: by 2002:a05:6e02:2689:b0:430:aea6:833f with SMTP id e9e14a558f8ab-4320f6c7f59mr1567415ab.8.1761571818580;
        Mon, 27 Oct 2025 06:30:18 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea78e2fd4sm3093057173.26.2025.10.27.06.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:30:18 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: han.xu@nxp.com,
	broonie@kernel.org,
	p.zabel@pengutronix.de
Cc: dlan@gentoo.org,
	Frank.li@nxp.com,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v4 3/9] spi: fsl-qspi: add optional reset support
Date: Mon, 27 Oct 2025 08:30:01 -0500
Message-ID: <20251027133008.360237-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251027133008.360237-1-elder@riscstar.com>
References: <20251027133008.360237-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for one or more optional exclusive resets.  These simply need
to be deasserted at probe time, and can remain that way for the life of the
device.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/spi/spi-fsl-qspi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index c887abb028d77..1e27647dd2a09 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -36,6 +36,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_qos.h>
+#include <linux/reset.h>
 #include <linux/sizes.h>
 
 #include <linux/spi/spi.h>
@@ -267,6 +268,7 @@ struct fsl_qspi {
 	const struct fsl_qspi_devtype_data *devtype_data;
 	struct mutex lock;
 	struct completion c;
+	struct reset_control *resets;
 	struct clk *clk, *clk_en;
 	struct pm_qos_request pm_qos_req;
 	struct device *dev;
@@ -857,6 +859,8 @@ static void fsl_qspi_cleanup(void *data)
 {
 	struct fsl_qspi *q = data;
 
+	reset_control_assert(q->resets);
+
 	fsl_qspi_clk_disable_unprep(q);
 
 	mutex_destroy(&q->lock);
@@ -902,6 +906,10 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	if (!q->ahb_addr)
 		return -ENOMEM;
 
+	q->resets = devm_reset_control_array_get_optional_exclusive(dev);
+	if (IS_ERR(q->resets))
+		return PTR_ERR(q->resets);
+
 	/* find the clocks */
 	q->clk_en = devm_clk_get(dev, "qspi_en");
 	if (IS_ERR(q->clk_en))
@@ -923,6 +931,10 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = reset_control_deassert(q->resets);
+	if (ret)
+		return ret;
+
 	/* find the irq */
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-- 
2.48.1

