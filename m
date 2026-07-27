Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A65242BEB5
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 20:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184317; cv=none; b=Bn+aut0yugssYTHViPa+WE1aVj1LGLy6XR203L6pWVynvfl1phWqkURKLMni/UhMAvFClByhCZd7DvhnK0r1qEsSMm3kzwx0yUBwTamzoxTxRfNBuM+vQVptLNFHkYugTPDt9DZVzhGoKIUOCaHBd3btGf3Wiikdb3Rz+4V50Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184317; c=relaxed/simple;
	bh=F6swiu/pbHsFLDcyPzv04tz4oF5vseby/Ivc/N6dGAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fja0bpTkvy42ohU3N3YIJscvSMOT6uf04uZvjC45LLUI9i4OkkKvmoFACD8mPa38YGfpus8Sz1DcrgrulrGUaqDYOgRtZzFSEdO8uKW6dmwEw/n5fZ5x9GaYHP1XsGBs9B44HJkF9PyhWLWijpIxWMPi01FxvQz+C+S5z7YXDto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mZf6e4Ya; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mZf6e4Ya"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d004f135b1so12220125ad.3
        for <imx@lists.linux.dev>; Mon, 27 Jul 2026 13:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184316; x=1785789116; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0ft1nhloqnztuc290Fs03Kt4IzqAO7BmLTHY5joAAk=;
        b=mZf6e4YasM9IjiL/Fv2Hh6tm+5fkXkWbeym5JGcQsEvp6mVVQlPfGelaBwxwdQDeDb
         WCH1JtTSNHadevILgog1JjRdDUViMehDhbSR2dXz60BlCM6AirbS9xulXGWPMegg1fFx
         ava3RWtn57lnn3NHY5kXDAoleXLezENw9smWuB4bE7mPDzv/BiQb4+0DRT8ViOMgzw7R
         rdwUKNz2HHeZHmDUkRqDEL3Mj5VicnhsAoWngTuBLdzNXWFHNWGH+3Arh4zF1itFk+3+
         BEHP4wfbdst2u6TS28Rab+UAYqvUURcdCpFxLo+b+MbjrBSgbaK/O/5X8FjcBraLYb7H
         kTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184316; x=1785789116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d0ft1nhloqnztuc290Fs03Kt4IzqAO7BmLTHY5joAAk=;
        b=SMwELzPgGsDNODC2an7ANm89tUFuHQrKCWDV3bUJthyvk6rWRpa33A46yKFX0IRZbh
         Nn11EXgf01QSJL6ZetjA88act6DZb/ytHMHscvJD7q7FP0mWzbyCKN6yDS/afuoUSSnX
         J/QQfhGykgfZHc6jq6vpxCm7CZVOujMAwfj6k6PHAW3n/nuRGIbxZV/DfFMRPQTLlaqO
         udUEvPfSYDlWw4KCTMQ2nuhCR1ILXbn5gmIoNUYLo/NjTA7vLHZVUHPMUYqFgkEvhI9S
         pQnyEWXP76GukVt359Zv0fyZmP5V4TATXir2eiDtjqv+1lX51SnGyKUul52D6wSP7rDr
         ebrw==
X-Forwarded-Encrypted: i=1; AHgh+RqewLJZHBEWi8q8wZkrgtOoSKUdeN+RczqQi+Kcxh7chA8lG/9k/LUOZuVELNYi9cwTqQc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDnHnEdrc9d3s0KEb5KFIgk6w3V8OZeB/9wuQdCxWk28GkKG0K
	byKTLkc/i7KOB39gHLBW75+vp8k3XqTk5YlRUh9j3Glpj5QyWtizX81/
X-Gm-Gg: AR+sD12km/8w8gz+Wbl7v4JPeEFWXYS9yNJDxYvvpXHO7ZyxUw1QrMRlHjf9VS6FHTR
	9qEY29ctVeZ/5y38i2tc+cCNLilorf1+xACc6qLUxpedGM0K0ksQMgO6rNXiCVlHYQLVsOJ/H+V
	i3zhhj+4Nbqp3xUQeCzW0Hal32WdlDCtDtFB1mxV38pyQ7XOmc9kWJKgfTnGWg5eyjWoXJST2Wh
	7efJc7g1acEbptESHreqU+lVF+81J3o18gO46GPAdKLmS9Q80p2FcsX4tEaOkagIYGhsf6mHMiU
	IkF/oCYFEgOs27I7f6CXr3Q88yaLESFTl9FXo/P5CKR+ZX4QYefwWmEplrNn6si3wNQCCjjl3Vb
	CVJubc6TXrVJfgmB/7cPyL0kDdHPhrRKkWwBWyBadlYKLYd7Jckx480XBvUeqkdFjaeRo+FpjBx
	dJmhkj
X-Received: by 2002:a17:903:1663:b0:2bf:9760:b94d with SMTP id d9443c01a7336-2d00f42d025mr7516855ad.15.1785184315598;
        Mon, 27 Jul 2026 13:31:55 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:31:52 -0700 (PDT)
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
Subject: [PATCH v2 13/64] dmaengine: mxs-dma: use dma_chan BH scheduling
Date: Mon, 27 Jul 2026 13:28:41 -0700
Message-ID: <e0499d943001c6ef2142bfdc910f584dd575e8bc.1785183549.git.allen.lkml@gmail.com>
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
 drivers/dma/mxs-dma.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index 7acb3d29dad3..8cecc0add82d 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -109,7 +109,6 @@ struct mxs_dma_chan {
 	struct mxs_dma_engine		*mxs_dma;
 	struct dma_chan			chan;
 	struct dma_async_tx_descriptor	desc;
-	struct tasklet_struct		tasklet;
 	unsigned int			chan_irq;
 	struct mxs_dma_ccw		*ccw;
 	dma_addr_t			ccw_phys;
@@ -300,9 +299,9 @@ static dma_cookie_t mxs_dma_tx_submit(struct dma_async_tx_descriptor *tx)
 	return dma_cookie_assign(tx);
 }
 
-static void mxs_dma_tasklet(struct tasklet_struct *t)
+static void mxs_dma_tasklet(struct dma_chan *chan)
 {
-	struct mxs_dma_chan *mxs_chan = from_tasklet(mxs_chan, t, tasklet);
+	struct mxs_dma_chan *mxs_chan = to_mxs_dma_chan(chan);
 
 	dmaengine_desc_get_callback_invoke(&mxs_chan->desc, NULL);
 }
@@ -386,8 +385,8 @@ static irqreturn_t mxs_dma_int_handler(int irq, void *dev_id)
 		dma_cookie_complete(&mxs_chan->desc);
 	}
 
-	/* schedule tasklet on this channel */
-	tasklet_schedule(&mxs_chan->tasklet);
+	/* schedule BH on this channel */
+	dma_chan_schedule_bh(&mxs_chan->chan);
 
 	return IRQ_HANDLED;
 }
@@ -781,7 +780,7 @@ static int mxs_dma_probe(struct platform_device *pdev)
 		mxs_chan->chan.device = &mxs_dma->dma_device;
 		dma_cookie_init(&mxs_chan->chan);
 
-		tasklet_setup(&mxs_chan->tasklet, mxs_dma_tasklet);
+		dma_chan_init_bh(&mxs_chan->chan, mxs_dma_tasklet);
 
 
 		/* Add the channel to mxs_chan list */
-- 
2.43.0

