Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57963EDADA
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 13:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270863; cv=none; b=VoZ0qx/dNEuhvsgWES6OWVDA3kPwDGvuy70yOlMBIXh9qZujncXr59T9hz1pCLelq6TtlwFZ2/bXn49jn/TuXafTeCczKY1K8oDll5UNIQDWQp/gu4lN2Spgi/qvQ/LnFLwYl0HX8NhAYLYDfL73HCT/0ZaYzOMA6NqFDphhTZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270863; c=relaxed/simple;
	bh=uRKMa+0pM5/xNHpif3K5YMMQ7wGymJJ4S/rOeExb078=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QNVrtKro9VOmYHX1HruUunVrI1CcmswOcak5zLUvWJvqN/MGr6uPoFrsvOnuySMOWLhVg9QYqIEZKT+VS66nrGbPmGhNt/ma558AK5j7OCLRtu86j+afK4ARu6ffl5ss9UZaqfTgqpgk8lEUjoYKfieM5TX9lwxsEReILtCXWd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UY/NUMcE; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UY/NUMcE"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30749947917so2925038eec.1
        for <imx@lists.linux.dev>; Fri, 12 Jun 2026 06:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270861; x=1781875661; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/AXZy6D5BbhT5x9hx+suwKOnmd8LSBhmzi01ciTQP4=;
        b=UY/NUMcEsxfyZezCgocJh+F81Jyzon8ZgSN0iVfZBS3hAzbmfWnQ6Q4D30qh2qlF5O
         /fo9mP6HUdBfitb6wMX56WIcc2D9qFdcj3MIYPUjnUAWjQl+su4HsMQC+8Ecv0ilTmsB
         yKGRCOmo94lDcPKDZs0K1j8UN1mMh1KLedWYq0RSiNWJ+jf6oHEHYlvLstF+wfiTgwEI
         XWVg9CYnEoaFOmJ6XiSz1n04FyWm30TTB55V8RoGXxmdstgiqyfT+cpK4/GRebECRhBN
         8XseN0VPKo/4JGIsfKL28cJQxswUDitEwvz2WcyK6bDiAe6s1VgRUV5rBQfPGxnNRR8d
         zDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270861; x=1781875661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t/AXZy6D5BbhT5x9hx+suwKOnmd8LSBhmzi01ciTQP4=;
        b=mRy7cQyY7enk/qfXyXm8YgbS0p7fl5RiOcAHTOIg5PFuOMCseKUDbo6OGycuiDTj2x
         S5v50NE/t3Z3Cg/9qqRwRuH+jC+6o/oUcblXr/un9u84b6g/tCzhwT/z0h7mbv2qSdgr
         gSZcvGxRXZsHTVQy5IWMYmtKXN9zEwi/TfbC2B1kR460478gXcOgmC1MiVxuGcYVWeHd
         x+Wrho9LeMRwDxEieHdWbgfkAenLO1+WOT+Hqm67vcMJojrsQ115BMZatFrJBvzPl0a2
         z/mSoNPP488LXr70PQNU5xsQUPGK0jEPmL/q0mNqq//NzNsFeM/uyveKWG/pmintw551
         k/sw==
X-Forwarded-Encrypted: i=1; AFNElJ8Bkfkjwtqw522ky7k3vZ1UZzMY68Keq7C0+wlb2myCRmwSqDK5ebsxER6ECCl0Ad7volU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1AUCszmvG6CaLDCiiToOSqqdibOmeJ8khadJAJXJj2PT79KOg
	yqCvhjxK+szAyKZ1JnWrJrQu5jscGtMv10p40j9SU/AyqjvG6qciMwjf
X-Gm-Gg: Acq92OFhPE3xxFjtwFUDgEYRoWujEEr7jZAsQ0fSryPuJCfADwbPKDDAaR5afAAQvPk
	/DiS1ehCpjq9AQ0yZzzJUBfTnBlQz+btbfa8iTP0A9upWNQngMNs7n0caB7eHaDF8UJiNEQYqwS
	VGOcKlplgVcmM+mGZVuLvdUoiBFwP/t32syjlzTt7HR5Ji2KxPKgePak5vp4vrnBR95f+n2IY+2
	HPVk7qpruDzDFzXPU+NnWoV9hjHXZOdnoDazMnTXfsc83XFQrMR4qP9D16XxEDWCzBswqireqjl
	CIGpdwoioKSaVjurOoBItEGTMVL6ekYziQEDL09AW2c2onaVtBo8rnj+SNzydStKeKpkG6/OplO
	wLBDgEkdoHuBZGScoFD73py1uXTLDYL4zoGsBJj0MgIhPyWtsLjmOmJaZivqSjb3zNdWeyL6BlI
	rg8grguXnDsj9whVghYVt1GJ6qACALlMQkKyDPK3Bgme/DOS00p8D0GTd3tg==
X-Received: by 2002:a05:7301:60d:b0:2be:2cfe:68b7 with SMTP id 5a478bee46e88-3081ff9ae90mr1661153eec.11.1781270861204;
        Fri, 12 Jun 2026 06:27:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:40 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 08/11] ASoC: imx-audio-rpmsg: Use guard() for spin locks
Date: Fri, 12 Jun 2026 20:26:36 +0700
Message-ID: <20260612132639.78086-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612132639.78086-1-phucduc.bui@gmail.com>
References: <20260612132639.78086-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/imx-audio-rpmsg.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/sound/soc/fsl/imx-audio-rpmsg.c b/sound/soc/fsl/imx-audio-rpmsg.c
index 38aafb8954c7..b55dfbdb4502 100644
--- a/sound/soc/fsl/imx-audio-rpmsg.c
+++ b/sound/soc/fsl/imx-audio-rpmsg.c
@@ -22,7 +22,6 @@ static int imx_audio_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len,
 	struct rpmsg_r_msg *r_msg = (struct rpmsg_r_msg *)data;
 	struct rpmsg_info *info;
 	struct rpmsg_msg *msg;
-	unsigned long flags;
 
 	if (!rpmsg->rpmsg_pdev)
 		return 0;
@@ -37,21 +36,21 @@ static int imx_audio_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len,
 		/* TYPE C is notification from M core */
 		switch (r_msg->header.cmd) {
 		case TX_PERIOD_DONE:
-			spin_lock_irqsave(&info->lock[TX], flags);
-			msg = &info->msg[TX_PERIOD_DONE + MSG_TYPE_A_NUM];
-			msg->r_msg.param.buffer_tail =
-						r_msg->param.buffer_tail;
-			msg->r_msg.param.buffer_tail %= info->num_period[TX];
-			spin_unlock_irqrestore(&info->lock[TX], flags);
+			scoped_guard(spinlock_irqsave, &info->lock[TX]) {
+				msg = &info->msg[TX_PERIOD_DONE + MSG_TYPE_A_NUM];
+				msg->r_msg.param.buffer_tail =
+							r_msg->param.buffer_tail;
+				msg->r_msg.param.buffer_tail %= info->num_period[TX];
+			}
 			info->callback[TX](info->callback_param[TX]);
 			break;
 		case RX_PERIOD_DONE:
-			spin_lock_irqsave(&info->lock[RX], flags);
-			msg = &info->msg[RX_PERIOD_DONE + MSG_TYPE_A_NUM];
-			msg->r_msg.param.buffer_tail =
-						r_msg->param.buffer_tail;
-			msg->r_msg.param.buffer_tail %= info->num_period[1];
-			spin_unlock_irqrestore(&info->lock[RX], flags);
+			scoped_guard(spinlock_irqsave, &info->lock[RX]) {
+				msg = &info->msg[RX_PERIOD_DONE + MSG_TYPE_A_NUM];
+				msg->r_msg.param.buffer_tail =
+							r_msg->param.buffer_tail;
+				msg->r_msg.param.buffer_tail %= info->num_period[1];
+			}
 			info->callback[RX](info->callback_param[RX]);
 			break;
 		default:
-- 
2.43.0

