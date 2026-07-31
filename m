Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3962DC32E
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 01:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785460896; cv=none; b=RVff1rOUtXPe1yjxL+/vOZYSd/EERWLuX+zei/q+J8cM73EUgy0zGRqhHQtG+BZf0yZ4V2e/YWZ9DYOZW6LaXODwgHaaH5FcyBz6MyxTmHqZ1eNFwHc8jCyArHGeD5gV83y0h+TXNmbtZgefjVVSo1lOSq8J/Bmc+dEOVQAFTeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785460896; c=relaxed/simple;
	bh=Z+gXpVeOJerXPn7c/pQ3zs2SIaak8eHO0YCv426HccM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l/AmW/+TxbN6ptGS7QNrcF9G/MVSom/ihKzznCsTJSS3ZaBc59g2d4S8cKvspaFCaV/305SqoWtD2NIHsnd3YAZLru/IHpBAp0X78/ZJ/IzaAUMrhru5ba+7QowzSGLpL6N/RjY9ggsnCsP28Ef0crnbbr+X2AvmFOhyCkGjTeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKTtHy9Q; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKTtHy9Q"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso339715a91.1
        for <imx@lists.linux.dev>; Thu, 30 Jul 2026 18:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785460894; x=1786065694; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=druBUrLqgbBhWVJNiJbBH4EBtzUPbfrjGd0lGlIkkSY=;
        b=nKTtHy9QhyAyymdJ19I0VVd4mpbvlwogRVNPg9da09PaVEGHHYggn5EkbXubp+HmT9
         hklnZaXl4docpPCbUeZd6Bj6xXMQRQMjtV+RR61s7p6hAnZDqR9pLg+7kSgLAoMDYE0g
         9ATpd9//ECFvUdPhtnFcDSfEU+bzNThEMKJqITLZeb65dYGiqhFp2xziZ6LjhUlbIKVX
         wXGVGVhcbUScL+0giLTPJBIgFnDM5QwQvvm63xQOssb3zD5fgIqDg9YM0QeyaMJ4R5yy
         Y7Y7tEB1ycfCQboRV3Plngg0yVZH1a0r/dTNEN15Ns4UmPN1uNnrBMZHGL36rcTk9c2z
         GyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785460894; x=1786065694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=druBUrLqgbBhWVJNiJbBH4EBtzUPbfrjGd0lGlIkkSY=;
        b=Ma1dlc7E49Zf0aXfEk3MXtivMyXJO8bzEHVrHUMgcAvsxlNLGC2AYextBkc3Vrkhm7
         Mu5Tv5Fl+Zi3DYTD1ZjMvN3/jxJobuYIwuOFbXb+tgPUTujVtnyPfoGSZuCRT+Ecblg2
         9EGzavCORuS3KlHmvPnBKznACc+8JDXEFw9+neT9+RA3qmEW96oPiJI1vSc7Y/WAvelD
         NRJ89027IEAtBQ5/R6ijDRw2wPtQyLDRSps6mFMJ2GUklAtpPGDsE93N0CuzaEnaPN9L
         I0nsc5F/xyHpJyT/CpdmlbpfXoMYTokPdx/wpUnio2CRGBR3rMUTvL7MLoh/QcZ9P49f
         0qfA==
X-Forwarded-Encrypted: i=1; AHgh+RppycOkCPellDhipCcmgOPdSD3bYXhhNf5QPdDK4CncQP9RX2ujwh1qP951G+ODHJrQO44=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9+sX6CkL5/IC/4vlrcs4oKNuGgeOqsF7e/jG0Gbf516RizxUS
	rI1aV+LTCD/dzq6pOULsGJj3zOxgEmINRgSUPWRqRaIntlcq+WclHVd1
X-Gm-Gg: AR+sD13D9E2r+doZjDI1vtaDz2/81Eu9N18+Qgw3mAxHtfnfM1g9AgBVkB34XNScds9
	7xPl2eV06PiSRURFDSilfxstot3EeKoNM/3XckQU+epiIvjBWJNJGNk8OSM38Ib7JOS9PHZTLka
	x5stE0AMCANCiykwl+Ia/srEyrI6DoGGYlrtt3lEocHomKQURNzVi9R+DxhU0YWu043m7NiD4CL
	J+AHNcopoCHzWDFsbw8zU10oAE3wTxRRCyIrPi3jDx+6kfEja11L/3GM9AB08Xzn6uTDa9XIMMY
	c48y39N7G68vdp9kJ0qh/K4LPeZlH8yElyxjA/FVw19URpEWOpqJOT9b8t77W8+pVlBHqYhbdsF
	M+f3fNCdDvRwFF39MqHYYqN20Am73b6sup4fwy/JuscyeirVKn29y6IS451ftIC02zrvRVsdV7j
	Ek/d/qFKGER2XVHXa9cRxZBQytZcqXqqlDqkkt36xICP4csxNVIWmCgXlhqxviNckHJYZhYyG2x
	84Ya0ZwnokgG/+Poh3Q3oxyr0BihBRCaf8wcNmyF89cCJupA1GsHGsPyPQHxdgfggyJqzQx/wrf
	MqGNQwI9CE3GEVXLo7f01cvV6k1w/9OxhgCwxQ==
X-Received: by 2002:a17:90b:1d8d:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-38fb121ee39mr128591a91.14.1785460893844;
        Thu, 30 Jul 2026 18:21:33 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38facf50124sm198867a91.3.2026.07.30.18.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 18:21:33 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	York Sun <york.sun@nxp.com>,
	imx@lists.linux.dev (open list:EDAC-FSL_DDR),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2 1/3] EDAC/fsl_ddr: use devm_platform_ioremap_resource()
Date: Thu, 30 Jul 2026 18:21:28 -0700
Message-ID: <20260731012130.1212640-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731012130.1212640-1-rosenp@gmail.com>
References: <20260731012130.1212640-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded of_address_to_resource() plus devm_request_mem_region()
and devm_ioremap() sequence with devm_platform_ioremap_resource(), which folds
the resource lookup, region reservation and mapping into one step and returns
an ERR_PTR checked with IS_ERR()/PTR_ERR().

Behaviorally equivalent with respect to region reservation: the driver
already reserved the region, so the non-overlapping reg requirement was
already satisfied. Drop the now-unused linux/of_address.h include.

Remove devres stuff. Not needed. devm is already used.

Fix a mistaken return code of -ENOMEM when PTR_ERR should be used.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/fsl_ddr_edac.c | 39 +++++++------------------------------
 1 file changed, 7 insertions(+), 32 deletions(-)

diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
index 2a545e5812e7..3745eec67335 100644
--- a/drivers/edac/fsl_ddr_edac.c
+++ b/drivers/edac/fsl_ddr_edac.c
@@ -22,7 +22,6 @@
 #include <linux/gfp.h>
 
 #include <linux/of.h>
-#include <linux/of_address.h>
 #include "edac_module.h"
 #include "fsl_ddr_edac.h"
 
@@ -495,13 +494,14 @@ int fsl_mc_err_probe(struct platform_device *op)
 	struct mem_ctl_info *mci;
 	struct edac_mc_layer layers[2];
 	struct fsl_mc_pdata *pdata;
-	struct resource r;
+	void __iomem *mc_vbase;
 	u32 ecc_en_mask;
 	u32 sdram_ctl;
 	int res;
 
-	if (!devres_open_group(&op->dev, fsl_mc_err_probe, GFP_KERNEL))
-		return -ENOMEM;
+	mc_vbase = devm_platform_ioremap_resource(op, 0);
+	if (IS_ERR(mc_vbase))
+		return PTR_ERR(mc_vbase);
 
 	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
 	layers[0].size = 4;
@@ -511,10 +511,8 @@ int fsl_mc_err_probe(struct platform_device *op)
 	layers[1].is_virt_csrow = false;
 	mci = edac_mc_alloc(edac_mc_idx, ARRAY_SIZE(layers), layers,
 			    sizeof(*pdata));
-	if (!mci) {
-		devres_release_group(&op->dev, fsl_mc_err_probe);
+	if (!mci)
 		return -ENOMEM;
-	}
 
 	pdata = mci->pvt_info;
 	pdata->name = "fsl_mc_err";
@@ -531,33 +529,12 @@ int fsl_mc_err_probe(struct platform_device *op)
 	 * Default is big endian.
 	 */
 	pdata->little_endian = of_property_read_bool(op->dev.of_node, "little-endian");
-
-	res = of_address_to_resource(op->dev.of_node, 0, &r);
-	if (res) {
-		pr_err("%s: Unable to get resource for MC err regs\n",
-		       __func__);
-		goto err;
-	}
-
-	if (!devm_request_mem_region(&op->dev, r.start, resource_size(&r),
-				     pdata->name)) {
-		pr_err("%s: Error while requesting mem region\n",
-		       __func__);
-		res = -EBUSY;
-		goto err;
-	}
-
-	pdata->mc_vbase = devm_ioremap(&op->dev, r.start, resource_size(&r));
-	if (!pdata->mc_vbase) {
-		pr_err("%s: Unable to setup MC err regs\n", __func__);
-		res = -ENOMEM;
-		goto err;
-	}
+	pdata->mc_vbase = mc_vbase;
 
 	if (pdata->flag == TYPE_IMX9) {
 		pdata->inject_vbase = devm_platform_ioremap_resource_byname(op, "inject");
 		if (IS_ERR(pdata->inject_vbase)) {
-			res = -ENOMEM;
+			res = PTR_ERR(pdata->inject_vbase);
 			goto err;
 		}
 	}
@@ -637,7 +614,6 @@ int fsl_mc_err_probe(struct platform_device *op)
 		       pdata->irq);
 	}
 
-	devres_remove_group(&op->dev, fsl_mc_err_probe);
 	edac_dbg(3, "success\n");
 	pr_info(EDAC_MOD_STR " MC err registered\n");
 
@@ -646,7 +622,6 @@ int fsl_mc_err_probe(struct platform_device *op)
 err2:
 	edac_mc_del_mc(&op->dev);
 err:
-	devres_release_group(&op->dev, fsl_mc_err_probe);
 	edac_mc_free(mci);
 	return res;
 }
-- 
2.55.0

