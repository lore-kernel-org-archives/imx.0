Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721EA42DA53
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 20:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184289; cv=none; b=ahn3taITAX+KDoQW8IcEAIP9Ejbw6BqexYkg3w58UQujKL/MbBAlrgffWAQoNPEPOA87rd8+b74nXPHZupuahW4LpjUptvHQeTi+RCzFLnCWLRQqeBfO98WnodxPlWEeeO4PElG3dyou42LD0nRenaSGF2NsTPZq0UQGHavwsyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184289; c=relaxed/simple;
	bh=icfVyDF9BoilFSxgEpIKcsFKPbm6k6jIWjASHyQnqII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gXcPa+XsLDiVdBENRqgpEcyveFlZ1tX5znnM7NmphZ9G2IuRte+SqdxYpB+sq+txYYL0e1Pm/aKvP+GbLvQ0+kvVG4rRHiNi15rfkOcx7ZE7ieypUcJhW305pjUFwWw41HitydwQun/ExMB60Usf2RO9xo3kIC+mo9pNWEM2+zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUDMrAst; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUDMrAst"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cf50c6f235so38243805ad.0
        for <imx@lists.linux.dev>; Mon, 27 Jul 2026 13:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184288; x=1785789088; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0a8MYcKw5JTNHHIrN3K1TaKhBFHL7HNLhSi2FpFsKc0=;
        b=hUDMrAst8ecLZQNf5Fu5Ul2+YKsl+hZiCF8HnvmZOG0hDeukKgA0M9iciHcl8F8HvK
         znhboFcA3Ud0iHanw8DpXCNy8MnyCATftw89KeWFX8D2k7ME0esuum6lMfmz5mO6vth2
         JzUXFPkh0qpP1Vxh/ipoUp+S96sDaneEOogN736lrH8/33x0uQF95gg0MEEi/m3038hA
         +TP0yW27iqT1qXyyixYPb2ax4pBa/K5yzLEhdD2nd3DaMEkv640aQw/FmKWn2b/Qq5HJ
         qenhk4+dE4cTsq6b/a+TuTy+r3UuM3ud15SEUPDMHXgJ2eIab2nsiR6RvkcszeQykekA
         5CTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184288; x=1785789088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0a8MYcKw5JTNHHIrN3K1TaKhBFHL7HNLhSi2FpFsKc0=;
        b=Fzh9hVs00lQukavEXgui7LSHTXosb4TWWBAqnAiPnV2WsdlRBE6DTj7Z/gr6zj5SwI
         81oXhV5JC2wD2DPq4idvkaK0+QB2W80uHJ9PM7ZZaN5U4A/2T18pUcNcBvAtuAYKMbh9
         nyMkd3NF692K67m0xTASqOG4GnsPN7RTNTqv79gyGCrWE8Tocvrotbw4KENupTwnctAv
         QkYmhhOPFQGWnFTryKXWYTEfvyZk6N5RzzCVd5zmZnYPgZj+E/TTxzwtpNd2cPcYQips
         drYln6hFqzw1FTzQTkVkkGJaVSn34fN8O45svrfiKl7QnwSkizKDTZNDwkYF9YmOUysy
         hTtA==
X-Forwarded-Encrypted: i=1; AHgh+RpPkRn6l985BLin6y0gNoj2fXYzkMovNnvbUM2xC/v7h64awVKSlUkMc8W+EROc/DtQYIM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhfY+DEuDaDrw4nKJ+JYGk9XqithJJQ5Eyv1oJCUtCC9dVmB47
	Z7bKJAAHHOYemTepHcd5vrnmQdtOxGs+NeDX4E/hytgdQ2zPpSdVehZL
X-Gm-Gg: AR+sD101VPd+I9gbh9GmOmqU0aWQ+qTfaH3AjI1cbbdGn2s1Wdbd3l8pQFHt997EuYI
	btiigBfBssrJV+/4KeAB0WoUixthd6MTperITt4OvbTq1tWacxfxSaY1DUI0HdqbGiwNoKpxeAG
	SPlhU+BFajUwO/1ir6QmT6nxgMciHUqA1NPXog8zWBW86xm/nS55XwiOoo0A2SPt1rwf6SF5O2t
	YxE7czoZej6ZFVu67YLaw4c6BAhQ8waNMAf91njOSiAhx1ls/811UA6if9BB+M+qRWrrJymPok0
	GU0tYaXlomdIqCOzUy6gj2NzJKWfZ7LT59BrhEK666g/ApvSTWXfzBe9hGciXyBVQVWAaLU+omW
	UKmbc03jPmo1jBb+yxhuU/i2/9K4SA3x/lRjLuxF5flDegvaels6pHcpsTh0uZguIo5wqQN+oBR
	YHZokNhALqeYvT6vc=
X-Received: by 2002:a17:902:e843:b0:2cf:dc6f:cc42 with SMTP id d9443c01a7336-2d00f5da251mr7142445ad.46.1785184287499;
        Mon, 27 Jul 2026 13:31:27 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:31:23 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 08/64] dmaengine: imx-dma: flip per-chan tasklet to dma_chan BH
Date: Mon, 27 Jul 2026 13:28:36 -0700
Message-ID: <fbe4067de02f050d3b2f958b3a04dcef0549b6f6.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the per-channel tasklet with the shared dma_chan BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/imx-dma.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index 81c6276436f8..3ff0bfbfa5ff 100644
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
+	dma_chan_schedule_bh(&imxdmac->chan);
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
+		dma_chan_schedule_bh(&imxdma->channel[i].chan);
 
 		dev_warn(imxdma->dev,
 			 "DMA timeout on channel %d -%s%s%s%s\n", i,
@@ -448,8 +447,8 @@ static void dma_irq_handle_channel(struct imxdma_channel *imxdmac)
 			imx_dmav1_writel(imxdma, tmp, DMA_CCR(chno));
 
 			if (imxdma_chan_is_doing_cyclic(imxdmac))
-				/* Tasklet progression */
-				tasklet_schedule(&imxdmac->dma_tasklet);
+				/* BH progression */
+				dma_chan_schedule_bh(&imxdmac->chan);
 
 			return;
 		}
@@ -462,8 +461,8 @@ static void dma_irq_handle_channel(struct imxdma_channel *imxdmac)
 
 out:
 	imx_dmav1_writel(imxdma, 0, DMA_CCR(chno));
-	/* Tasklet irq */
-	tasklet_schedule(&imxdmac->dma_tasklet);
+	/* Schedule the IRQ BH */
+	dma_chan_schedule_bh(&imxdmac->chan);
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
+		dma_chan_init_bh(&imxdmac->chan, imxdma_tasklet);
 		imxdmac->chan.device = &imxdma->dma_device;
 		dma_cookie_init(&imxdmac->chan);
 		imxdmac->channel = i;
@@ -1211,7 +1211,7 @@ static void imxdma_free_irq(struct platform_device *pdev, struct imxdma_engine *
 		if (!is_imx1_dma(imxdma))
 			disable_irq(imxdmac->irq);
 
-		tasklet_kill(&imxdmac->dma_tasklet);
+		dma_chan_kill_bh(&imxdmac->chan);
 	}
 }
 
-- 
2.43.0

