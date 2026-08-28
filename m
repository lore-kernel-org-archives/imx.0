Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CC33C1D77
	for <imx@lists.linux.dev>; Fri, 28 Aug 2026 05:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787894115; cv=none; b=T+QkOU8okVYTkADVOPehtD7dOip9U3OVZd1CLzEkk/BSM3O5g7qdReNABP6MORtZL3QIARmUGa0+gZ3N4eM1zFMJVIQGnmyB4ZQcGyiCt42CrQ+nZq2qdWYQeSqsyLPzyu2/sNB9Css1KEFyupXoHrsM7bt879CkWA8sqwaATW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787894115; c=relaxed/simple;
	bh=ooNpW8JTLerSSYS5oKKFbYXh2GfP0xI8kf0/srn2Jwk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lVQROexeD52IdwT10kBy2F9AfJp88BxpxSOleswp/KBIMf2pRv3E26aHx9mb+1M7MRxVPlHHlnXj0gI3y6cayBI5A3m6pHCsXLqYURoh4ncUpNLyPU6h2VrMu7EEb7SCMc/nOUZbAeqD0jwppD7uBf3JzWYBBgE0i6T9pyxNVfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLDR25Lq; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLDR25Lq"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cacb8416a1so6028475ad.1
        for <imx@lists.linux.dev>; Thu, 27 Aug 2026 22:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787894113; x=1788498913; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+L5wETtDoWmts2CARQJ7hOgr0xkLRcjESgYRsPtYLoQ=;
        b=OLDR25LqrJUys7ukXgiqfU3i1piwyC4ICSMI0JDtrcOSDoi53RmykRINmVZ7QFGUTX
         u233EPKkwDLw/FGgrJ7LjwufISi29rDF+CGjdU3FKEUwxpqYVDAmIc5ORdUnYZlNiH+K
         hdld+OFA7MMCGMvgdQO8Ak0OlTRlQCPFsXHI9wLKxTDgWqbrEQyXU/i7jii2SuH++k9W
         7D++LSrmHkyQ86psOV+kN+Ib8gaEpsGMfg+gxyGP3ufIn5nEizh66/JuPknuy1lGgdNf
         ACx8BYwsfqE10+QgtlZ1/9+YWO23WBaFhtQ941ElevvScO+W670bNw06LEjjMFnEMTnT
         7e/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787894113; x=1788498913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+L5wETtDoWmts2CARQJ7hOgr0xkLRcjESgYRsPtYLoQ=;
        b=QIMPZ0+fsPd1kVRi8ktdiVLUEm036mBCZqDeT5jq9YxD7YF+eRXRBd4Supkywgeq7d
         iSZS6PsXCJQbwpu3wCd8RI4Yn/yEdJQQRvw8+L7JZkgCTIYHgpiQW/gms2RWK1fbwtfp
         9uX0OzIQcrRnpy1ufmopA4BIeg8gn4IdBGHPqq93g6s9FMA5ndp0KHu1OmzR0zMbQP/k
         4JlC7zDc0DpVNXQyZoONFMMkICCRfcNWcMO2qWig+6KAWxLCwEG1AoSHuo2nN7DYQ+jN
         g5FyNRBQTlEQ2OupbU4RVmhANilL0FttO1XmLR2pMFs+iqfRkh7tzJigexVfGwADf+OD
         JC2Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro8bavFfK38pluqI/rffesb9yOawX+W/JYHOrZ/k/7AhmfVDcjoS5oi3rEcTV5HYr0s/o4=@lists.linux.dev
X-Gm-Message-State: AFuF++mN95GcnkeNohj+AzN8nnGsxjMU3PeOGDVSHBt7WatIn1umNyiJ
	Pz5bPs+vECyYWL+9YrLdWnc2q7ATpMqbjmsVTP9QK/kC6HkxvwTHSHyg
X-Gm-Gg: AR+sD114gLoiBGtmGb7XWEY4cBpRG3RCulLkakyqkX0A1TFhCnR7kbd/7NIX5BWbhn2
	Ty9a2qE43ejr2cmtK9YP7EzxJXaPIgn0Ci1PRTiYHrr1HCqnWMJUEz8nFugzBi7eg4BjyR/lKnq
	OmYLoIDY/xluDNoe8rKfel4egcJsD7DgTfTvy+2/qk3lPM+Q+V7N33VHgcHjXKCfp9iDnaCzX6A
	g2PCikrK3e8qZuBSv1lFc+Oz5QBwnRHWAiOplQb+5hNoAgK96pId8GTeUE65GC49Cn7h52nZv+s
	eaXTNPaPpF1Ke7kFfCJr+I7FHB1gpApo2nh+TWwYJATcOLH/ylQZV3CfJAEjYZKDg9zL2oKClXp
	/R2oK9xUbphb9FyHABfGkTQuyVIK9ruDYjKCawEFPQaey9tIYgNSwXgjmR4bIDWYRf3inxQX1vd
	Wc3RmY4L8x6uxD2Sh/wrTbnyPpd/KzRJBy0jIak9DORqsYjgH/Sg/NZb/OejJf4WfDNCQV7s9Ue
	U1u/mNqEI0NzAHujNwJpaCNDzWoFdQm+nNVwdiYviE=
X-Received: by 2002:a17:902:cf0d:b0:2cf:ca89:499d with SMTP id d9443c01a7336-2d74def3ffcmr81309995ad.7.1787894111223;
        Thu, 27 Aug 2026 22:15:11 -0700 (PDT)
Received: from hnkz-ubuntu-vm1.mshome.net (flh4-125-195-69-140.tky.mesh.ad.jp. [125.195.69.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75952ea6fsm2011745ad.21.2026.08.27.22.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:15:10 -0700 (PDT)
From: Kazuki Hanai <hnkz.64@gmail.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Ming Qian <ming.qian@nxp.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kazuki Hanai <hnkz.64@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: imx-jpeg: Cancel timeout work on release
Date: Fri, 28 Aug 2026 14:14:52 +0900
Message-ID: <20260828051452.1940559-1-hnkz.64@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mxc_jpeg_device_run_timeout() signals job completion through
v4l2_m2m_job_finish(). This clears TRANS_RUNNING and allows a concurrent
v4l2_m2m_ctx_release() to continue. The timeout handler then accesses
ctx->mxc_jpeg once more while releasing hw_lock, but the release path may
already have freed ctx, resulting in a use-after-free.

Synchronously cancel the timeout work after v4l2_m2m_ctx_release() and
before freeing ctx. The cancellation must remain after the mem2mem release
because the timeout is the only completion path for a hung hardware job.

Fixes: cfed9632ca8e ("media: imx-jpeg: Add a timeout mechanism for each frame")
Cc: stable@vger.kernel.org
Signed-off-by: Kazuki Hanai <hnkz.64@gmail.com>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 725e94152884..dfe3b1ea6bb4 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2805,6 +2805,7 @@ static int mxc_jpeg_release(struct file *file)
 			ctx->slot);
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
+	cancel_delayed_work_sync(&ctx->task_timer);
 	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
-- 
2.53.0

