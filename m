Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCAB26158B
	for <imx@lists.linux.dev>; Sun, 19 Jul 2026 19:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784490022; cv=none; b=NJ6d7PPIeKIVgebL/F6JFQYs5fbLwI0VXqhV3yBgUcRUfGqVbT+Zjzr8UEUyW1aHxCImmCo232W+ZL3TwV3m9iZHqxpH1ZynczDblRlct49uIveXWfrv2lAffRnsgyFmfiB6pw8/pU2MwA28AIFwwXo0JhBpC6irg7Pfw++GD6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784490022; c=relaxed/simple;
	bh=TLJtucb+fMTnZkK3MG1MYEdha1u6aPFM1hXEkh/SJAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BFxvUb8iI8vnbYtgTdpAZXXobcob0lz1bunf3UnWuUEgEG/Il091CBIxJ75H1ASDofzi0HqtGNfvC0HjRJ/hwsONhe2BaY00zWkp2sa2VNNuvTZOTMBlBJaIP7azqAmOTmuGjGxtHC0UzIYYfoirg5ZcmzXDxKOv7EPpcf4Pf3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgVkWBMy; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgVkWBMy"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-381b831d535so7092470a91.0
        for <imx@lists.linux.dev>; Sun, 19 Jul 2026 12:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784490020; x=1785094820; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHDTeZIldDDYJIkvsl14Ioncr+9aGn9+y+1u1DznXfQ=;
        b=bgVkWBMyC/JuynkJrrtknuTpSRxzbFbrRtlAXsrztyXONSMgzJbZCWkW783UMldHBA
         VgO55ZeINkkXzOBa73kDx/Aea/68V5chNqZb0IF/TrHRKHsL5HPxOfPr/PhnqA7ftR9P
         hesJ1tmvel+iW1D3u9MIjFJUfqwhCkA+ORup7piwOh7uYSHmE9BAise+VBRDIau0j85/
         lOxwpHeFFeBdzVmA7heD0V6ysfbAJONVMEn4pHqWSYs1CKCPOfYyPnMgzC/+pvzHaxU5
         tMlfxQPZr7sE6gDMPVu3oU02wVuPCELLbhzF2U+v/yIsYevMAhE74K1TJj8OG64fG4T/
         SCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784490020; x=1785094820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JHDTeZIldDDYJIkvsl14Ioncr+9aGn9+y+1u1DznXfQ=;
        b=SeW5L2PsALLjPpIo/AdxdXhiq8V+SIb2dcMozEmljEJOvy9+0SHmI+bf/+l4Wu5tHz
         LSoq+3Lt+5cQDuR9p6sGHs/eT0MqYASpQwqIQnHZT29ZSyWpnzZcI/vGgZDIaQwdavJF
         A7bIgMoj2Jv631OBEuxeeH8ScgtnSSEhDHhD3ChswxKWjD7hBFwIpQpFkuKtLK+EJRSu
         mLj9sJo9De/jJTfL+X1CmtMjJJaK3rXuZ/oZZ9wmVTT5yEb1A4LP0o9V0mizyp5d0mKm
         rGGUc5VLJCz/3jIj4nZq2Bm68CSVWDrmEK2WzZNSojR7jSYvCxSiTqZIepHH1xCoeSvz
         9RGA==
X-Forwarded-Encrypted: i=1; AHgh+Rq5w7rDjPUUoK9C4uFU8MMJfYzF89zjUp7ll5WQE6BPammx/bHEDnOn2FO6slo9/6F5JG8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZby1ZpAIL7mJdFbR3p+CRM5OadnE6nKItL1RfLOZKh21YYBtL
	RD8WUjnCqan8auV8qEYNIZLpc98/c7cmYfR5Jb4ctsCmesBjcFVDl5V2
X-Gm-Gg: AfdE7cnZ0+VRv8IGQeoKNnbkDhHPaLicXinxGqQwTAuR8etw2xbvwl58Dqv36Zs2X2R
	yia2sV6gOOQrlOi81Lh09ZIwam4mm7aN5w9iPitHMiHHOuM11SX59f6r4A9TWze6gQ4zE7gfxkW
	oy/j2QgSs9MaHFfs6pjQjCNycTd6CJ0tNQzLrw8Q4+dwuS7WgG/sfQSsA8YHqXwpd6J1syv+IA2
	cRUwyGETMmbbFniKYDjQaaIY/sFwM9l9WCFbtl5Ke3FsZMAcJsXgFt6qSbYsYg5deGwAgDKJE8V
	YQ6CCIUUro1zunlMTluyVH8flKAIOhUbS/s33/PHzjVce2i3bKXCpZzfdA7ttNFe5t5WOt3+na6
	q6+BaBWKfl8S3SceoNL5VJ0HG5FnRsnnaAhJaPRYF8sCFqr1FtSDfhd3rZrF0dRtzdzTbUvgwd0
	IoLG7h3lZW+O/JAnX4o5q3zzrlS9LIxK/TBhyKrRR826CmnlhMby+yvbLRxhMEq4uWWtzunKomm
	YCauvEY7WYeFjBW9MIDBkyDZ3gdYktPeBuFsZK8On08j34zf5YZdh0=
X-Received: by 2002:a17:90b:2f0c:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-38e4b431074mr12281543a91.8.1784490019784;
        Sun, 19 Jul 2026 12:40:19 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e3a0fb993sm6308126a91.15.2026.07.19.12.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 12:40:17 -0700 (PDT)
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
Subject: [PATCH 2/2] EDAC: fsl_ddr: manage mci lifetime via devres to fix remove UAF
Date: Sun, 19 Jul 2026 12:40:09 -0700
Message-ID: <20260719194009.117532-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260719194009.117532-1-rosenp@gmail.com>
References: <20260719194009.117532-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fsl_mc_err_probe() requests the shared interrupt with devm_request_irq(),
passing mci as the handler context. At removal fsl_mc_err_remove() calls
edac_mc_free(mci) explicitly, but the devm-requested IRQ is only torn
down by devres afterwards. Between edac_mc_free() and the IRQ release,
another device sharing the line can fire and fsl_mc_isr() will
dereference the freed mci and its pdata.

Register an edac_mc_free() callback via devm_add_action_or_reset() right
after edac_mc_alloc(), so mci is owned by devres and freed only after the
devm IRQ is released (devres runs actions in LIFO order). Drop the
explicit edac_mc_free() from both the probe error paths and
fsl_mc_err_remove(); edac_mc_del_mc() is still called explicitly at
remove time so the edac device is unregistered before the deferred free.

This also lets the now-redundant devres group open/release/remove calls
be removed.

Built for arm64 (defconfig + CONFIG_EDAC_FSL_DDR) with LLVM=1;
drivers/edac/fsl_ddr_edac.o compiles cleanly and passes checkpatch --strict.

Fixes: ea2eb9a8b620 ("EDAC, fsl-ddr: Separate FSL DDR driver from MPC85xx")
Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/fsl_ddr_edac.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
index b1e6e177b088..cdd129bc42c7 100644
--- a/drivers/edac/fsl_ddr_edac.c
+++ b/drivers/edac/fsl_ddr_edac.c
@@ -490,6 +490,13 @@ static void fsl_ddr_init_csrows(struct mem_ctl_info *mci)
 	}
 }
 
+static void fsl_mc_edac_free(void *data)
+{
+	struct mem_ctl_info *mci = data;
+
+	edac_mc_free(mci);
+}
+
 int fsl_mc_err_probe(struct platform_device *op)
 {
 	struct mem_ctl_info *mci;
@@ -500,9 +507,6 @@ int fsl_mc_err_probe(struct platform_device *op)
 	u32 sdram_ctl;
 	int res;
 
-	if (!devres_open_group(&op->dev, fsl_mc_err_probe, GFP_KERNEL))
-		return -ENOMEM;
-
 	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
 	layers[0].size = 4;
 	layers[0].is_virt_csrow = true;
@@ -511,10 +515,17 @@ int fsl_mc_err_probe(struct platform_device *op)
 	layers[1].is_virt_csrow = false;
 	mci = edac_mc_alloc(edac_mc_idx, ARRAY_SIZE(layers), layers,
 			    sizeof(*pdata));
-	if (!mci) {
-		devres_release_group(&op->dev, fsl_mc_err_probe);
+	if (!mci)
 		return -ENOMEM;
-	}
+
+	/*
+	 * Manage mci lifetime via devres so it is freed only after the
+	 * devm-requested IRQ is released, avoiding a use-after-free of mci
+	 * (and its pdata) in the shared interrupt handler during removal.
+	 */
+	res = devm_add_action_or_reset(&op->dev, fsl_mc_edac_free, mci);
+	if (res)
+		return res;
 
 	pdata = mci->pvt_info;
 	pdata->name = "fsl_mc_err";
@@ -558,10 +569,8 @@ int fsl_mc_err_probe(struct platform_device *op)
 
 	if (pdata->flag == TYPE_IMX9) {
 		pdata->inject_vbase = devm_platform_ioremap_resource_byname(op, "inject");
-		if (IS_ERR(pdata->inject_vbase)) {
-			res = -ENOMEM;
-			goto err;
-		}
+		if (IS_ERR(pdata->inject_vbase))
+			return -ENOMEM;
 	}
 
 	if (pdata->flag == TYPE_IMX9) {
@@ -575,8 +584,7 @@ int fsl_mc_err_probe(struct platform_device *op)
 	if ((sdram_ctl & ecc_en_mask) != ecc_en_mask) {
 		/* no ECC */
 		pr_warn("%s: No ECC DIMMs discovered\n", __func__);
-		res = -ENODEV;
-		goto err;
+		return -ENODEV;
 	}
 
 	edac_dbg(3, "init mci\n");
@@ -639,7 +647,6 @@ int fsl_mc_err_probe(struct platform_device *op)
 		       pdata->irq);
 	}
 
-	devres_remove_group(&op->dev, fsl_mc_err_probe);
 	edac_dbg(3, "success\n");
 	pr_info(EDAC_MOD_STR " MC err registered\n");
 
@@ -652,8 +659,6 @@ int fsl_mc_err_probe(struct platform_device *op)
 	ddr_out32(pdata, FSL_MC_ERR_DISABLE,
 		  pdata->orig_ddr_err_disable);
 	ddr_out32(pdata, FSL_MC_ERR_SBE, pdata->orig_ddr_err_sbe);
-	devres_release_group(&op->dev, fsl_mc_err_probe);
-	edac_mc_free(mci);
 	return res;
 }
 
@@ -674,5 +679,4 @@ void fsl_mc_err_remove(struct platform_device *op)
 
 
 	edac_mc_del_mc(&op->dev);
-	edac_mc_free(mci);
 }
-- 
2.55.0

