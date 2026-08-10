Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF3E435529
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 18:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385533; cv=none; b=h0XiD20j5fyanoCsS7kxalh8hYdfczDFcgo/urhFF9bYge2SDlexBOt4rjK4wwZpeCGe3pxW1TdaBTJ7N5RSRBtfRj4kDqaRBo1qLWGxLtG9kFUdJdxQpebMbfaGMIy08IKnCDUiX3VhSp3WL2cOAUTy7O7ipuQz1ZO7KSIoucE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385533; c=relaxed/simple;
	bh=iDQocSIDsAlV/ALE+AarkKKauy6yJDgGIKOSWbkIszs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N+5/NuN06GSu8CEQGYDCLKtCBNaCNVmEMlpiXXbd9+DPTF4Vn6/JCiR0JBgMCtl43wOCKlRDtQ1LVpFFa7ydtFB4/ZrdCmDQIA5/5rDRdIbbaY8an8cqbShQnIWuNviE1R05cpQGJTIBUs+nZxrdmjMiLNAQ/DUxbSK8rsCRt/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=plJcaotE; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="plJcaotE"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso1891515a91.1
        for <imx@lists.linux.dev>; Mon, 10 Aug 2026 11:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385531; x=1786990331; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P1heC4kdbiOKopjs0B6gQi+UwOdRbZzbCNzgmPlgldM=;
        b=plJcaotEQGOLoDPTHNQvznI9rsMFdZGM9Mz123Gk6LlCKW79c+uY9wjmYSp4WMwLEq
         5P6jbszSMBeI/3+G5Y8/4ZHAxpVv/ntxhtla0zql4NyqVYO2k9ieufEDbqU2+NJCL3kJ
         5W0N1XqUHEgIMo9SnRw3Yg15g/uwsGleg4oqJiw8PVi2+bkZfu149R3uV0+rTzoBZ9S2
         Hb69nqr9mFeWkOugtQTShZb2+cgrLZ7SawvH72AMzsGeT/cQw4GMI7VGO5TQR9D6v2Oy
         b2M1ULl94Ne8zhigjiaHv+rxbnsNkNIir9FSbZJgqO+oQ0cH+668Mf1rrcyhDBNnmvop
         YH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385531; x=1786990331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P1heC4kdbiOKopjs0B6gQi+UwOdRbZzbCNzgmPlgldM=;
        b=LFl7gaMqOZjItz4KAcDCDi749pyB6lGwo4HW88Wn0BCW1uo/5NeitauU+qcKVPy+V0
         ZTgWYYQt20djaCTG5j4O2Aqe4TyIN973o3SXBi+X24pgZmyGbJlBXYFS5Ev2mVnijZ61
         MVsCptRQ0wojxu268dF36Fpbexcn9de1sam/RZOOmnDPt0sL+Lr3FFFiW2fEEIc3gd0u
         PBnHO/ilU8pREHEy8DcvAlD56HII4oSltzWduIX65La/6pOeJARAunztxUHlcPkwhxrI
         WgtvHBbUPa+LwQXLNBdGX5/j2ePfXhBl7a0XU+78vxdsx7Zo2ZlpFFKkh/t1/Ti6z+86
         MFSg==
X-Forwarded-Encrypted: i=1; AHgh+RpCEFqEq7OsyByG/p+LMmhyrmmotts5x9EZVvwXOfyemXHAcNyj5FAJZuEWbJrfdwMRK4I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx41LK+CjOdfv12JR1ycpIuSGHakPi81HFe1EwGpZQdndBCcWpn
	TGNHtIk4gi4V1jumIDckvjFsx6e+IeHTdr/cpOGVOIIT74V7Puy4+bbZ
X-Gm-Gg: AR+sD10IN7VjSxJL9cGUrN9iRy9uHbTTw/vYtQERbYeKvmQgAekjKLjtJWksWkCaXq6
	c4SX5NnY6MIH2qBp9OLK8Wpn6e+cSy2jVr0x4UVtskTLspuuBXieX6DTiQOE/lbwgflON0TetCq
	qGGRDV058FMYRlrkmd9ZG1oF+qIgCZYcwjCwpSzgLkk7ThFetI2uSXsXQu+Mh9Uk0+trLnojAoR
	vrilcrCdZWc+2m0ewyv52YEuHFQycY7i3eWMjYW+OyBZJ1tOxReX2tCOnBlfpiMKfOO3NGs8zbA
	e0eH8V9CrfDn75cFvS8GnkV0CXgK56yn0Ntj6mKucnGOI752JDPZI+AKa9nOGhWwqfoZ2TIilgA
	Nin8IgB5fEqszM8oRHVAU1g5rWFSSzwW/fq1ItrnPYhvoFexv9yJDnVTeucHvExcxNvL6jtovYw
	tvbdI6i9c/n6Cj2f75FHoC+Jdoxe9NpjDJWfgVoYoUZjHJ/dtlrLFk/Exr7fMyoE0=
X-Received: by 2002:a17:90b:3806:b0:38e:7080:b4c0 with SMTP id 98e67ed59e1d1-3903c5cfbccmr42496378a91.10.1786385531037;
        Mon, 10 Aug 2026 11:12:11 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:12:10 -0700 (PDT)
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
Subject: [PATCH v3 13/34] dmaengine: mxs-dma: use dmaengine BH scheduling
Date: Mon, 10 Aug 2026 11:09:14 -0700
Message-ID: <3dec314c8878181bbf9bd8bdf6d222c435643fc0.1786384168.git.allen.lkml@gmail.com>
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
 drivers/dma/mxs-dma.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index 7acb3d29dad3..149ac402f7b4 100644
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
+	dmaengine_schedule_bh(&mxs_chan->chan);
 
 	return IRQ_HANDLED;
 }
@@ -781,7 +780,7 @@ static int mxs_dma_probe(struct platform_device *pdev)
 		mxs_chan->chan.device = &mxs_dma->dma_device;
 		dma_cookie_init(&mxs_chan->chan);
 
-		tasklet_setup(&mxs_chan->tasklet, mxs_dma_tasklet);
+		dmaengine_init_bh(&mxs_chan->chan, mxs_dma_tasklet);
 
 
 		/* Add the channel to mxs_chan list */
-- 
2.43.0

