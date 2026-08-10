Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3D5435531
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 18:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385498; cv=none; b=HKGqtrN2UHBGlLHxiDwi4it+UTViFfZ0ULn05pqL6LZBzZ4VnugaylGhB7/uW8ioVUQmetWIJbYD2FI4dubS7YemVNP1v6JjciGI1qziTOwORoAQ6Y81vp7L7OHGSOiIH9wnZMJUEpDDzxOXJPP8BNxJOvei0VaYwje5Cn1iNdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385498; c=relaxed/simple;
	bh=yNW/T5FeMOjAddNqHQhDND7Stuqs/EAs9+VIYXSqtKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AzdemFybsjXODJdifkGZvdE8ja3BrIwNZv58LZslSozLA4SGFRUKLfQNeXbAYyRq/ol2CqDtqYLPIyP2GshytbV0Wiyu196sfHCu/EUyFKzb1kp+SWxWl1TnytVGdIwaWd68A6cgAZD1apAQiloHuU0CyHT1JRc1xiBMPd80sVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FdP4J6t0; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FdP4J6t0"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dcbade417so9860a91.1
        for <imx@lists.linux.dev>; Mon, 10 Aug 2026 11:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385496; x=1786990296; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZhvQ0nLd8X2lUGK/yPjcMAYgujrbK07Er9DeXa2ehmE=;
        b=FdP4J6t0ozrH9PLyYvZY1Yenz/vSs9GDRuDbzNpOpCUVmAeHH9Yi8q8917BX8T/Xx6
         ZXOrQLe2oRvYvSSKeDy4bMAz5Tn2gFbwpMejQpXyWLOl3itAbBdZ3Qn5WB3Do9zl9fmE
         p0WjDsMgA52K0683bSn0OxfnJRcQ8CSL/AWEfs3oVfkKiP+1tIN+exIyX69uLkBjZL7A
         L6Ez7DeJWl5lFtLE2R0OOFQVh/sM5Uc3QUgI28puVaO9eeNSgq8gDajsZY52/mq+pJFN
         BwKjzgoPoA2GB6cfaUdku1fWcTfZFP02NGPPdh8mWbIkQaoKUNlFwZCwMCKSGSefn5+C
         8oFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385496; x=1786990296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZhvQ0nLd8X2lUGK/yPjcMAYgujrbK07Er9DeXa2ehmE=;
        b=l8Je1IrWyeVON75c7em2HJib2SqB86xLuqPdGreWCHI2TBtkVs6fAIo3DbuLYyCSD0
         9UOtLhC4hLXdAVu/5ymq3qnfoeAWI1W1cG0NCStRQZtpI31kklz2Ljd6hr2eer61mWTi
         YPN6cZxjiLQE08MfeY6RuMRjUOeBMgxpu2HCb2cukl1c/esNrpP7oNl9QzgMM1Cj1mN5
         IsTaCzWwAcuOY/077UhCGG7IYDV4iMh9BnEzZplShpkF+fS9YteH+WvMQyiJNEFcngKF
         TJxT/72yaHpOFgYZYVxALNC4dsnQkPVECrY8OUtzmri2Q4IrVW6Bhjjz0iqzzpn0M1xi
         jeKw==
X-Forwarded-Encrypted: i=1; AHgh+RqPhewsca8q1JLd2EKx7cDYYTP0eMuTNdcerKNT6bjsth15tV5qrTjz64L5xFqdG2fhQ6I=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuwT4boMhJOcZeb1ZBmg+Jr374T/HVHwFeemzvy/9rGs9zT7FP
	0JfazhOys5HeXG3OZC+p7dHMFxfRh0PKHOLsEokbbqJ/q3eSHNmWJKud
X-Gm-Gg: AR+sD10RwKk3eGGpNLg678m3buq0xhk3RnuIATzza8zDoiBpoK8UrqTwHnxB4wI+c+n
	O44ca72LHKY35Rs8b7ikjxYUv86uhFFWXs9Dmup+/6ISVYVTQeHqa+QLE98hAVf7lZyhCi7FOh1
	+++lhZ6AO0jCro0fqEroL7MOrE/wYtBg9lo0v/0XOsuqKK6qUwN0bj3Nw9A3MiJXNR62F/xRFML
	bVGxxDMUU5z6bh0ittOWyC4tBhW5REo/xX7LlLqge/9XwIAf5Aq4ETzC5q30rY3+Ab54Nrd5ccm
	LNtwW+hhlesWQAMvrdyazZ1UbJVKEzlI6CM+FVEMVIDZvVvyONa8NU8o4DWbI2vkF759Q6s86LZ
	Habuaage8IW5EIlZ/BNM6Sv7EGDA8Ax7ho8NfObKafFveN4ctU4T38w+T+nR4/LE2YjOs59PdoM
	hoOjKq6PguVRcxWb0xidR5ugHOgeTfRX5cufSKfWEY8OgQp7M+vFlVX+J7ewzGF5q51d82dKPuU
	g==
X-Received: by 2002:a17:90b:1811:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-3903bb0ab77mr40673994a91.0.1786385495692;
        Mon, 10 Aug 2026 11:11:35 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:11:35 -0700 (PDT)
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
Subject: [PATCH v3 08/34] dmaengine: imx-dma: flip per-chan tasklet to dmaengine BH
Date: Mon, 10 Aug 2026 11:09:09 -0700
Message-ID: <787938bdaef4c3530b4bf0296386a33928b877f0.1786384168.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/imx-dma.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index 81c6276436f8..308fe407fe16 100644
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

