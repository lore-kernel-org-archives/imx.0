Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433ED229604
	for <imx@lists.linux.dev>; Tue, 14 Jan 2025 10:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736852146; cv=none; b=jTfq33oI8THQS5pfpEqINlP1GC+dDXuThPo4FPVbKTvWinJBhvScrEl1jWrn4U8B4n7nRw551g3xUchUrkcoc50GPW1Y1jyQ1StcLVawLydJ1CYMI+X3HSAofA7ZtNIEzNz6NJl2er/Nir8K0ltnM3o20Ek3TJOq316pFLliHXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736852146; c=relaxed/simple;
	bh=PhAfGfQbBpz/wfvfFqXb65XCKmqiTpALKSOTqIQlbX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HcZW7NIBbFBeTiJnLn+X+D+RlyN4fKlyLUdTFDb7b6+Ir1gLMAAfXa3kPMJ3Nja8yB/D3lJk1SnX+wMHtCK/2Rd6RlBFNl25lueOggK0sxL1tTldYuMNUVB4vN8h0R1qheufocLOsfM/o5/HfastF0CRQR2ne1rRM1Xmh39Us9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DbCNuiNW; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DbCNuiNW"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab30614c1d6so53638666b.1
        for <imx@lists.linux.dev>; Tue, 14 Jan 2025 02:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736852143; x=1737456943; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w20vK13nhMzbjHJZSCggje7+hpPlrM9z3S//rlxScS4=;
        b=DbCNuiNWduwpb3iHiWlj9RaZG9n6OBynqwUYh1xdYh28LDj/BSYSRJetE9iv/+uUuO
         QuZA3Jj3D7/Iwg1DJJt0PZSFrFqNQy1AUQmN+A39+8rEWYnj4MzY/8PLehp1OB8uHWId
         +JHSP0vDqV3p0r8+F1taXPYYQq9Fr/8xggqEk8t9YT50ZSQiVv3W1GYxgrl3F1b4OMUu
         5NoC7UK70TEk13mbQvME6rPDqg47p5fjUlq41ZeQBTILNy+4zm8j2MXYLlQCzUe6a2NH
         S+0TnwRft3tXQdgHyH8MP9yocDeI0Fx1qkVPm/QL8IUrP6AfhptpxtOb/jKVY4OWv2WQ
         f8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736852143; x=1737456943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w20vK13nhMzbjHJZSCggje7+hpPlrM9z3S//rlxScS4=;
        b=EM+tIjuvyV1EDxQycrVcySaj4Eh9Kf0rhAuTJBB5ww7iEyNdbkJsuwQ/+zHxvzqn7K
         IIovkafNy2xFj/DPgbFFCNQktuAmSJiTYf1ofv48M6z8pzCZ1fnOPaA8K9bu9usN32gj
         Dbt5yGba8+jdfgFy8FnS0OpS9Hm1JBV2d+eCZO92aF9OSZRrKVcfY4WJxSFduGMLrcvy
         26SynvZuKUgU+iIAc85+HeJ9c0b6tNDBfyWKajEAdubYAR1+oAef9GzzuX8+ML4BsFAf
         fWo0/HTTWzWEBeqYWmMNeqsqpByZrdPL40MwG6ODhcrYM6p+Ju/7En8+6Tsq1BNr+8uX
         YZ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxspTijssfBRZasf4pOQ4sAl7XTVJEHfEBzzDjFN1E1KGIEow+TVvZkI5Ug2P/o85AEUE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmgshvqQmyvgsv/s/ph0/Mavk5yGtY7ccSAgMgOBU3rjYA5mu4
	CJ6eLdn8f100eqEuZySdPFG/5kzNtF4yP//qxZn03lxW6zZTME/qB9FpQVPDYe8=
X-Gm-Gg: ASbGncusoAHlQmN8iGUC/ALak79calzBh6fRbQwVehBRxie4k2muwLw8zt7E3NPENkt
	C2OlI9mKDh6De1wtYicgv49KWltuczAF+FDi5aIExpMsGQkXj/E40L70i5JGtEhWC0d28mhAJou
	xlyezcscp14mfVcedGHlXtsPmQXFn0Or3qn6rhbz9WJD1W20XdzBW4HZaoVGSKYcEHIF1eTgr8q
	u9goi/82TJt5WHLEL/FqhFltYPpu5twJl2yp+mIgOuqL+4nJLsnwADSWLRCQ9gHXG0Unb0=
X-Google-Smtp-Source: AGHT+IG+VYqAZEZjAkkDupQTvwlvu2SSq7a2Lp6yZVkX5waA19et6Qvi69lKI25WLQ+J8Hn9t77VNw==
X-Received: by 2002:a17:906:c14b:b0:aac:619:6411 with SMTP id a640c23a62f3a-ab2abc6fd33mr825598566b.11.1736852142566;
        Tue, 14 Jan 2025 02:55:42 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95624e8sm611169266b.127.2025.01.14.02.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 02:55:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dmaengine: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 11:55:37 +0100
Message-ID: <20250114105538.272963-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/dma/imx-dma.c           | 3 ++-
 drivers/dma/pxa_dma.c           | 4 ++--
 drivers/dma/ti/edma.c           | 3 ++-
 drivers/dma/xilinx/xilinx_dma.c | 3 ++-
 4 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index a651e0995ce8..de8d7070904e 100644
--- a/drivers/dma/imx-dma.c
+++ b/drivers/dma/imx-dma.c
@@ -17,6 +17,7 @@
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/dmaengine.h>
@@ -942,7 +943,7 @@ static struct dma_async_tx_descriptor *imxdma_prep_dma_interleaved(
 		"   src_sgl=%s dst_sgl=%s numf=%zu frame_size=%zu\n", __func__,
 		imxdmac->channel, (unsigned long long)xt->src_start,
 		(unsigned long long) xt->dst_start,
-		xt->src_sgl ? "true" : "false", xt->dst_sgl ? "true" : "false",
+		str_true_false(xt->src_sgl), str_true_false(xt->dst_sgl),
 		xt->numf, xt->frame_size);
 
 	if (list_empty(&imxdmac->ld_free) ||
diff --git a/drivers/dma/pxa_dma.c b/drivers/dma/pxa_dma.c
index e50cf3357e5e..249296389771 100644
--- a/drivers/dma/pxa_dma.c
+++ b/drivers/dma/pxa_dma.c
@@ -10,6 +10,7 @@
 #include <linux/interrupt.h>
 #include <linux/dma-mapping.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/dmaengine.h>
 #include <linux/platform_device.h>
 #include <linux/device.h>
@@ -277,8 +278,7 @@ static int chan_state_show(struct seq_file *s, void *p)
 	seq_printf(s, "\tPriority : %s\n",
 			  str_prio[(phy->idx & 0xf) / 4]);
 	seq_printf(s, "\tUnaligned transfer bit: %s\n",
-			  _phy_readl_relaxed(phy, DALGN) & BIT(phy->idx) ?
-			  "yes" : "no");
+			  str_yes_no(_phy_readl_relaxed(phy, DALGN) & BIT(phy->idx)));
 	seq_printf(s, "\tDCSR  = %08x (%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s)\n",
 		   dcsr, PXA_DCSR_STR(RUN), PXA_DCSR_STR(NODESC),
 		   PXA_DCSR_STR(STOPIRQEN), PXA_DCSR_STR(EORIRQEN),
diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
index 4ece125b2ae7..b1a54655e6ce 100644
--- a/drivers/dma/ti/edma.c
+++ b/drivers/dma/ti/edma.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 #include <linux/of.h>
 #include <linux/of_dma.h>
 #include <linux/of_irq.h>
@@ -2047,7 +2048,7 @@ static int edma_setup_from_hw(struct device *dev, struct edma_soc_info *pdata,
 	dev_dbg(dev, "num_qchannels: %u\n", ecc->num_qchannels);
 	dev_dbg(dev, "num_slots: %u\n", ecc->num_slots);
 	dev_dbg(dev, "num_tc: %u\n", ecc->num_tc);
-	dev_dbg(dev, "chmap_exist: %s\n", ecc->chmap_exist ? "yes" : "no");
+	dev_dbg(dev, "chmap_exist: %s\n", str_yes_no(ecc->chmap_exist));
 
 	/* Nothing need to be done if queue priority is provided */
 	if (pdata->queue_priority_mapping)
diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 108a7287f4cd..3ad44afd0e74 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -46,6 +46,7 @@
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/clk.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 
@@ -2940,7 +2941,7 @@ static int xilinx_dma_chan_probe(struct xilinx_dma_device *xdev,
 			    XILINX_DMA_DMASR_SG_MASK)
 			chan->has_sg = true;
 		dev_dbg(chan->dev, "ch %d: SG %s\n", chan->id,
-			chan->has_sg ? "enabled" : "disabled");
+			str_enabled_disabled(chan->has_sg));
 	}
 
 	/* Initialize the tasklet */
-- 
2.43.0

