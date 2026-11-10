Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316563;
	b=BPFMoJHY6qPyZZL770Wrv4DE/Ic9pfHcW+dOplBBzrAKYGPNKV/+KL03XKo4f7RZvwiW
	 L9o9eKBHdDbuNt/Nv3gRo5Ey4R3/1kpVZ4b0lFXRi5OAhFKXM1kelY0wfNPYzhKzLxzay
	 H/YV+DobKjtvdmR8g9U1RUP4RMBNsXl39fOHOEWodKEAlD1D6ObdHu2ZhfIUvuAQheKjh
	 VpWKYdZo1Z3ZjeK19gQo/SbnIAq/CWlm4gHUdz4OH91f4WXYikikwJPOesG9Ck5szxwo4
	 PkBaKdQej6owyWXZjk9PssmQpjGOo1lUn5GfDF6hSNLQhhVLMqMwrr7MPSA7Y0LLo1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=x5xprZt5NhCzwKafxuBKE8lrYdP4CbowwmixO5skWSc=;
	b=cDo2DWXF48fzD+02gZbANKAKWuXaVBZ8bvKJG9/LKDULqmzp3bRfDTG4UnahZZqXoVaj
	 +U9BAj+ktWZURA7jOyMDb0JjlaXDEmfcy0ujyHWOGMQwpC8RPU/HKWiNEB3rE5Wg3f4NR
	 YfOx1IA4D+ClTnjfhXqj0mHHs7FOBYL/s6/UQgD0CWcr7WBjXxkDrzhRIEO6Rfd1DRzOL
	 Y6xIJbD7EFyVZah2dfzuhjBBLbhLCsI37s2cUb8psP2xzBD3FAoap8g2AAkTxrcDYYpyO
	 Rg9l+p0Wbw+XdAeuHtrQCeR5DrqyPI6oFlQURvglaC+otRaP7aipTsgdzvsws9d+Ksg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FYHzEiQT;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE3E606BFDD
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 13:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BE3E606BFDD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FYHzEiQT
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b17cf2fa0aso27098a91.0
        for <imx@lists.linux.dev>; Tue, 10 Nov 2026 05:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316563; x=1794921363; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5xprZt5NhCzwKafxuBKE8lrYdP4CbowwmixO5skWSc=;
        b=FYHzEiQTZmFkgawFOpmU6NFVSsmXpOHSWR+qx47RGcHMygVhU/f7lfe/yEa/rFXsBR
         wNoYrLiJrVVD6xczKVI5CbsNOkmPe+842SP1YIAsaRRtO3TuU2ufRsahkgxv91kVeWfn
         t8U7Epvym/K6JUCqjlpNYKJxt49QnvpMhAv2PPYDQIRWEWVIFOrtnZxsq4MW/X1MLkaR
         Zr3z60myAway7VrKHGjqYLqGbWv9mtSo2JrHvJVzg5eDyT6frH1+e7REGNtRDhrDnjTU
         DuoEZ1sLBvpTNsx5OLeyce3VEytkQKG/jPRjnnVoQUZ94lKt8YZK9fRMhqgweeKiRVqr
         55cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316563; x=1794921363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x5xprZt5NhCzwKafxuBKE8lrYdP4CbowwmixO5skWSc=;
        b=IefhlIuJGUvG/P5rS5iG1+rhqqGf26hqshsPlptIaafcZvMy43UnFhKDZZNjgopRtf
         t8E9CkMkM2cL1zspOBBkiqayt8GgZxBliKXRJVsjUZOO+LVxc/qsQoEu4IXuGdalE2BR
         NHeD1XkbsxBuCIn1qHVEwV+Djhr3RYMEIc6qg1tOr85rmDwQjzRP/mL7dyIpJqxElmgL
         XUu2d7h5soqvZSsvagqW3hBy9gwBhPgLU8sEtsR7IzlrQ6aS8GptciwmsBUI2pqWlmFt
         qaQu7SHxFvUOrf40JfrPi/uijZSMVz3IJXGVi8a/cD29ruE1ihKrKF4rMbpH5H7xkCrZ
         yruA==
X-Forwarded-Encrypted: i=1; AL+hErFIk6EHRVxu3tu0qZFEuDi8TQmzQMZljiasME3fJRABrCR/M+m4dtXOxiwrDhHe/+Jpveo=@lists.linux.dev
X-Gm-Message-State: APuU4Z9jtJ7GuUAm0lq2NlhyoNj6k2lbab51n6Q88cCow32pxyvwQGkv
	KwWe6XNWLku3sZ+UH85XLdf7yHC3UdM9FFq2qUAiKb5U603WsJKg5tL6SkpbKg==
X-Gm-Gg: AYBFou2vdbDNK9Jjxt1XQHjtXRmL7DuNK5F3l9iBa92q1cVDgojc2umwNE5pH7uc1pq
	WtT//bGIGFXCNAOGgoOsuYAIYJZ3jPejxCEBx/Xt7ZQ3757GT5Wz1MQVoJfvDw9W9P+LIAuQ9Rx
	Icdtwe2ScsHg9QN2dOMLDsBRXF1WqHAXxRBW760r3hgiteIugqT1RlcLYPzQZ2pPiJAn6JlOsvU
	jPCjb3ZRJ4aCg59MnWNvYTHcSkIzNqvhanM1OfNK37mEqqphkHzYCWoho/OU3+T1sOxljQcZj7t
	PT4CgIJ3pr0uSM4m7XYX17t5aPOaolO/okLDOCFTR9F0gkQrIljUI2/FsGDSKpPSyZyKYb5gp7T
	IukM7tJTTRsCl8TTOy/188ZJMN0cZWcsXbEi5PT9uhg98m1xAejqgVI1TETDBPuqKvOtU37p6Z+
	Azzp/Vvh1plkGIvKy1FmoxObWpOsc/puGviZQAhsYRnoEkdHXV0ee40cVEY1CN25XZD45muI2jB
	R1lzZkFhqAdN1g3dKvdUsEgqRTgMa/GyvdW+p5z2SRkqH870XbnEGZObb+/OL/N7IxP46LoeyMa
	fRT36PQpZmc++t6qi4qPctVMjAD+AP3D
X-Received: by 2002:a17:90b:4a87:b0:3a8:c0cd:57fb with SMTP id 98e67ed59e1d1-3b166cbd030mr2853475a91.42.1794316562378;
        Tue, 10 Nov 2026 05:16:02 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:01 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 08/33] dmaengine: imx-dma: flip per-chan tasklet to dmaengine BH
Date: Tue, 10 Nov 2026 05:13:08 -0800
Message-ID: <bb9ba66250d97a83048c5bcce45b20a1ea6ca6af.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/imx-dma.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index ca1d08e90a06..a9d05b2e2205 100644
--- a/drivers/dma/imx-dma.c
+++ b/drivers/dma/imx-dma.c
@@ -145,7 +145,6 @@ struct imxdma_channel {
 	struct imxdma_engine		*imxdma;
 	unsigned int			channel;
 
-	struct tasklet_struct		dma_tasklet;
 	struct list_head		ld_free;
 	struct list_head		ld_queue;
 	struct list_head		ld_active;
@@ -344,8 +343,8 @@ static void imxdma_watchdog(struct timer_list *t)
 
 	imx_dmav1_writel(imxdma, 0, DMA_CCR(channel));
 
-	/* Tasklet watchdog error handler */
-	tasklet_schedule(&imxdmac->dma_tasklet);
+	/* BH watchdog error handler */
+	dmaengine_schedule_bh(&imxdmac->chan);
 	dev_dbg(imxdma->dev, "channel %d: watchdog timeout!\n",
 		imxdmac->channel);
 }
@@ -390,8 +389,8 @@ static irqreturn_t imxdma_err_handler(int irq, void *dev_id)
 			imx_dmav1_writel(imxdma, 1 << i, DMA_DBOSR);
 			errcode |= IMX_DMA_ERR_BUFFER;
 		}
-		/* Tasklet error handler */
-		tasklet_schedule(&imxdma->channel[i].dma_tasklet);
+		/* BH error handler */
+		dmaengine_schedule_bh(&imxdma->channel[i].chan);
 
 		dev_warn(imxdma->dev,
 			 "DMA timeout on channel %d -%s%s%s%s\n", i,
@@ -448,8 +447,8 @@ static void dma_irq_handle_channel(struct imxdma_channel *imxdmac)
 			imx_dmav1_writel(imxdma, tmp, DMA_CCR(chno));
 
 			if (imxdma_chan_is_doing_cyclic(imxdmac))
-				/* Tasklet progression */
-				tasklet_schedule(&imxdmac->dma_tasklet);
+				/* BH progression */
+				dmaengine_schedule_bh(&imxdmac->chan);
 
 			return;
 		}
@@ -462,8 +461,8 @@ static void dma_irq_handle_channel(struct imxdma_channel *imxdmac)
 
 out:
 	imx_dmav1_writel(imxdma, 0, DMA_CCR(chno));
-	/* Tasklet irq */
-	tasklet_schedule(&imxdmac->dma_tasklet);
+	/* Schedule the IRQ BH */
+	dmaengine_schedule_bh(&imxdmac->chan);
 }
 
 static irqreturn_t dma_irq_handler(int irq, void *dev_id)
@@ -592,9 +591,10 @@ static int imxdma_xfer_desc(struct imxdma_desc *d)
 	return 0;
 }
 
-static void imxdma_tasklet(struct tasklet_struct *t)
+static void imxdma_tasklet(struct dma_chan *chan)
 {
-	struct imxdma_channel *imxdmac = from_tasklet(imxdmac, t, dma_tasklet);
+	struct imxdma_channel *imxdmac = container_of(chan, struct imxdma_channel,
+						      chan);
 	struct imxdma_engine *imxdma = imxdmac->imxdma;
 	struct imxdma_desc *desc, *next_desc;
 	unsigned long flags;
@@ -1142,7 +1142,7 @@ static int __init imxdma_probe(struct platform_device *pdev)
 		INIT_LIST_HEAD(&imxdmac->ld_free);
 		INIT_LIST_HEAD(&imxdmac->ld_active);
 
-		tasklet_setup(&imxdmac->dma_tasklet, imxdma_tasklet);
+		dmaengine_init_bh(&imxdmac->chan, imxdma_tasklet);
 		imxdmac->chan.device = &imxdma->dma_device;
 		dma_cookie_init(&imxdmac->chan);
 		imxdmac->channel = i;
@@ -1211,7 +1211,7 @@ static void imxdma_free_irq(struct platform_device *pdev, struct imxdma_engine *
 		if (!is_imx1_dma(imxdma))
 			disable_irq(imxdmac->irq);
 
-		tasklet_kill(&imxdmac->dma_tasklet);
+		dmaengine_kill_bh(&imxdmac->chan);
 	}
 }
 
-- 
2.43.0

