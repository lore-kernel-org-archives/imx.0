Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213722D5A01
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 01:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785288207; cv=none; b=FDl0zVI55kDqXcgD4DEVp07dPetPwuvHoxirDl0o/wLWpzCaLYtqW5zLaP8dfFfzHLOSiGaYqCu2MUpy1JoeI1BU5PPAC6IurhEAYTEWjYelnV94CpixreKVG/FPQPM+3WAR4MIZzTR/yRRvd5DkEVlQvPv/US8wYD4G8JNiI2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785288207; c=relaxed/simple;
	bh=ruyCAl/d75W453410VelrLvh/Qfpj9qdc2hdxBMy15I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WHU3viLExyQUTvfbaLzmQPwLbtTDvFHu9SGH9J/YN0zMrR3dAQLlz5KZX/UPZUgdV/5JZm1SW1Ur4+ZhxWpDylHrbzhCx76OoDGARSdUioLGoinaBUAbg6UQCO2ZAvL01kGfe18Nsp4kcU8ZohZUg2RSeE+0yv0+UvEl2IZ9RgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d/TwRpSW; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d/TwRpSW"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso5216185ad.2
        for <imx@lists.linux.dev>; Tue, 28 Jul 2026 18:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785288203; x=1785893003; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2AGRW0GPVXdo/+h/vfV0tTRF7kuY/c8KFwUfzyJ8FbM=;
        b=d/TwRpSWjUd1OjxwnCcc/P3iGNbYMO9eFBye4C2wM8naOpc/IbxInSjPRnXFMknT2M
         xXu6BbxUfC/s6UKLfxsPtmDzU43EYwvntz8P9JE81fbFPB+6qfQOU34s4Oi+/ELoLo6s
         pinnU0gfp0nwpu/5tJPSa1KnYky+afLkhFVH9DjadeaNiEZZHd8wLO0WNJ36r1eyWF2f
         n9sPZQYeyPQg5o/2gddLGKeD/jmEKc+vVbSwo0oqZ/HdO/LuPWDiwGFsbVBDu+wSVVag
         f7NBqlVVc31y4ReV0yPstI0h09HhNK0FC/sJ726GSkmi61KtLmZ9IALKWB1+9C7vDqVi
         E5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785288203; x=1785893003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2AGRW0GPVXdo/+h/vfV0tTRF7kuY/c8KFwUfzyJ8FbM=;
        b=iERrXCmhOowFUfBJOmTr+Oi/rq+tvZ7latswL0nR14jZWO41evGhjNzAG95YPdGa8P
         Q/PLvqzTyxNnjMa5eWG42RtzkL6ap6k0UO46BARQLtgYGcaycn7TmL/SZEw7+LQwqSGE
         KyyrsUY3rKVaSHoDbkrN3kckk6eZBRmLYwMzO96pT5Cz0OTMveMHu07uTe5aA8CX7G+q
         US0L+dciFDvtrnU5CT8rVmmMwgpopOI+3ITVxszg/c40GL6Rrq/sg+CHyijAnjyKAQDa
         NbRvE1HPZx6bcpnzW/p3aLyZyUxM2Gs94dm60zyrFk3tcQYxhKJhMkiROaDFEtY3PxRk
         hcVA==
X-Forwarded-Encrypted: i=1; AHgh+RrhK/8OWO0uxWBOvnoQsID/mRwM2P83yHuAFQCDzCi/Sxeahs0Rma+iDKZx6nXX3HFJ+PU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxgbkVEWfzoox+pc8ofHuLqf0fcbKar2JrM6SGq4NcKhZLiatws
	FVnmZ0ZcbucxWZACfVeB+DBqf26JzaE+ecbgnukYp4Cisa5Dlu8OBBPaTrs2HQ==
X-Gm-Gg: AR+sD1193IR1TBtK4RRFSFQk1V4tyj6JMOF591EieFeVmGuaXci+J+4WD0+lIKYbTlL
	MAdlMYZRiQle+SYxsc6V4eC7+1235xQDz433UolVmZJPm0K2CY9vp6gir7ebi/WpKIT3eTWx/7+
	mHx+mdQzbqP+Y3pIsEN4whMlQVVtBkshJ0lkfGqXEEBA6jSBMLvEr3GpCCNzXEdWknia9Cf7BAe
	+iDfN+pZR4mrht42G6xpQRdyrEpHYrLyobxIX/TER5jUkxJcIP0Bdkg/nc6VX19J2Kbs6N9dpbY
	8/RyoGN5Y8NRSXmM7rmVPQ4qk9yyjZeBuPt6DmKiB+JJsG455EZgKALaN0kRedaQ4HQLR8VOgOP
	qVhCI74HDWC3B/TJQeEwZRrhyMLo5H8Xs5qvZBQtPGkZLW1lFIMWftn4dHuMw5o8Ea+IHD3fYK7
	rpOlk9zHxelI9685y3o9iD/z9I2B/b5UwWfj+KrqpU1h3B65AzjfoKbAS5jbflbkUpmUmHZauet
	MfcS2Q1ZEPHYKNoWas7W4kZywxPAK4u+GoqfZGDKSH6OVuIYQiQbM8UrfdikeI/EPCLC6z0Vx76
	sfjJwc/4eLSfqOCEWk/oRsABbPPOKZr3DS4tcQ==
X-Received: by 2002:a17:902:fd83:b0:2c9:97a7:f544 with SMTP id d9443c01a7336-2d015d25a51mr49814735ad.42.1785288203225;
        Tue, 28 Jul 2026 18:23:23 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bf7cb7sm3329575ad.68.2026.07.28.18.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:23:22 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	imx@lists.linux.dev (open list:EDAC-FSL_DDR),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] EDAC/fsl_ddr: use non devm for request_irq()
Date: Tue, 28 Jul 2026 18:23:20 -0700
Message-ID: <20260729012320.616174-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need to tear down the irq before edac_mc_free() to avoid a use after
free on teardown as request_irq uses mci as dev_id.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/fsl_ddr_edac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
index f4cc89b26954..f1ddd1f47f2a 100644
--- a/drivers/edac/fsl_ddr_edac.c
+++ b/drivers/edac/fsl_ddr_edac.c
@@ -601,7 +601,7 @@ int fsl_mc_err_probe(struct platform_device *op)
 
 		/* register interrupts */
 		pdata->irq = platform_get_irq(op, 0);
-		res = devm_request_irq(&op->dev, pdata->irq,
+		res = request_irq(pdata->irq,
 				       fsl_mc_isr,
 				       IRQF_SHARED,
 				       "[EDAC] MC err", mci);
@@ -639,6 +639,7 @@ void fsl_mc_err_remove(struct platform_device *op)
 
 	if (edac_op_state == EDAC_OPSTATE_INT) {
 		ddr_out32(pdata, FSL_MC_ERR_INT_EN, 0);
+		free_irq(pdata->irq, mci);
 	}
 
 	ddr_out32(pdata, FSL_MC_ERR_DISABLE,
-- 
2.55.0

