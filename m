Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548DF2F3C19
	for <imx@lists.linux.dev>; Sun, 19 Jul 2026 19:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784490018; cv=none; b=Rrxfjy1OnUMVLcfhsvGoXIlWbVScegZKf0oZOIhHQ8a0pzrdEHoP/b+tyEQE16tNfRBk65pFxr1d8wJsiwaU2qJ8FEPZqzfYtD/andcrCauD70J7pSeiXxiSM7Bfeqvst37zcJvJSqf60ZCCdoCrTP+nOtLi+5QS7Zg/MToIAfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784490018; c=relaxed/simple;
	bh=ifU1kMZfngVDHcvrjk0awPR30T+Cgv/d0HA1XGLTU7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lb/HPWixx5cRdt55U2yssThNTPHXw+5F/I4LVtpQcMF/qLbmkFUOvhrCZnALA+d/rSDFCA7souPmdBzMKEcNIA5G/fqb2hrncT3JmV+vflIPu1S/grCiuyImmJiBIC67IG4eId91+N9VCnbAIEp7DF55shIrswNyEZjwo1kIIC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EX0KIdNm; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EX0KIdNm"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-384c94c9414so5089309a91.3
        for <imx@lists.linux.dev>; Sun, 19 Jul 2026 12:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784490017; x=1785094817; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSIQ5/dAG3XXTro4N8Y7fM6rRNG5QM3A2gVdghbdtAs=;
        b=EX0KIdNm47LAy0podrJ73HosTTumRWGI0Ix6/kBteWPGivdzXIOH1FzQd0ig4jve3Y
         BNnnqkTabuX28JDy8mzfdaDuZUB00XNRgxLGv2fxw3mARq+I7MDus2XygQ/rKMhF0Hpg
         dFH6tEHIM5ZsDH/xUHhknO08yVAXbin6fIFWpPD5GT0j48rMiqnQI8DaE5fnYR/wwjVn
         ZQWmU3ZPQGavr8NQAMKNCwIFiIHrV5VBGG0teUS/5ZgcVj8E5FYf5nVubiduW3DOdgGR
         xNmjBidkk5pbcTWgcmKLF2LNBIpKMoI2duJdpSnQXnwJSITPb/R6MrxTd+ocCIv7TK45
         aohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784490017; x=1785094817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VSIQ5/dAG3XXTro4N8Y7fM6rRNG5QM3A2gVdghbdtAs=;
        b=GWXD2tCb44CF9MWaW2l+X4eD+o8KEoqBPyXPIO9v25RFKlw/Q00+JYK8wafVw56NeO
         kJBgHtM+iJIz9baN+6LQPlE3W8wEY/bsyuT8GwzY8V4adbGzrMhpM6QWQcK9fucnaAzp
         p+lkK7apVAfdvXFg//MQ1q6el51G/PuarEcD9BMFgwRQqgaTKeDDFGsFG2HwHyk3F3O2
         pwf7G3qw0IswN3Ak/POcVKaV0zauxtQ7x49QNEjjvDq4jG2bApQgt5wugXBeiYO++JCm
         Tl/6DfKGdJTBA09zWZUQBRzZkF6sf4MKG/KB0/nMQ7bN6BXxkxkSHsbZVyqW/hCWGR54
         CafA==
X-Forwarded-Encrypted: i=1; AHgh+RrE0Wb08D58uUliaO1p8KPp5qdTKfV1l7WLGic0bTXvYl3jh7MAPt57UEfjGaBiowkdLxo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7o5ySxbGlmOTSPUM7bV3hkSftvs9nnCZHJchbiU5zs9IHACGO
	3GOAyaJdk0P/oL+rQJxKxnXbvlGNlAPuzZWHU+V4GCEGHoL9qBepzJMB
X-Gm-Gg: AfdE7ckHDVn1zNS6+545RpUtXv7zV6rmXCqMVdxHEaesnYxECIDaSbs9MceJ+RC+Ttk
	tN2j6SRqi9djysqVortMnT1FtF0vA/XYmUhrw1ODEbQUGkSSl/t4kkRRnCgVCY8CPfHk1BJcrsQ
	wlQ5WqsdT6XXvsQVDWM0NcI1miRK623Bbfxx9yV4Fkpzo0JTLu3zuf8QxWt+LY5VA0IUTgu5ZVS
	SL4mp9bXytXUCgmESb3FDBYWk2sW3zsq45wHDMvsT9OloF52vgJGYJbJC9A4WyAbGWmPIWpJO7u
	Ct9UwFYwaMGL7yIfq6GAq/YB/WybBb/rb9HQtXf5+R/t6MSj2o5ktVDIIQ5BpxQwz/HPdBi3NEc
	Rp9fulJEd/vQ528AnppNd7e5mj9sN3SN9iqNVqSMPtz91sC4kxxRcRh62UTpnqGnvqnvwWHw1kQ
	a4BIBnyPANBxz6V5NKRsEJInljwJsOKkihYMIB99PKbWwziwCAZrhbvGGJ2BlkpfyoxGEuLEN7Z
	SGLmkVJUiIEzJhtVF5e41vuDlglQXAV+WblGMjjYGKdg6zXcUqbiYE=
X-Received: by 2002:a17:90b:57ee:b0:383:f52b:d616 with SMTP id 98e67ed59e1d1-38e4b40292cmr12031474a91.10.1784490016674;
        Sun, 19 Jul 2026 12:40:16 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e3a0fb993sm6308126a91.15.2026.07.19.12.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 12:40:15 -0700 (PDT)
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
Subject: [PATCH 1/2] EDAC: fsl_ddr: restore MC error registers on probe failure
Date: Sun, 19 Jul 2026 12:40:08 -0700
Message-ID: <20260719194009.117532-2-rosenp@gmail.com>
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

fsl_mc_err_probe() clears FSL_MC_ERR_DISABLE and, in EDAC_OPSTATE_INT
mode, sets FSL_MC_ERR_INT_EN to enable error reporting. If a later
initialization step fails and jumps to the err/err2 labels, the cleanup
only frees driver memory and does not restore these hardware registers.

This leaves the memory controller configured to generate interrupts while
no handler is successfully registered, which can cause an unhandled
interrupt storm on the shared IRQ line. Restore FSL_MC_ERR_DISABLE,
FSL_MC_ERR_INT_EN and the SBE threshold in both error paths.

Initialize the orig_ddr_err_disable/orig_ddr_err_sbe save fields up front
so the error paths are safe even when they are reached before the INT
block populates them.

Built for arm64 (defconfig + CONFIG_EDAC_FSL_DDR) with LLVM=1;
drivers/edac/fsl_ddr_edac.o compiles cleanly.

Fixes: ea2eb9a8b620 ("EDAC, fsl-ddr: Separate FSL DDR driver from MPC85xx")
Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/fsl_ddr_edac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
index b27dff96aeb6..b1e6e177b088 100644
--- a/drivers/edac/fsl_ddr_edac.c
+++ b/drivers/edac/fsl_ddr_edac.c
@@ -518,6 +518,8 @@ int fsl_mc_err_probe(struct platform_device *op)
 
 	pdata = mci->pvt_info;
 	pdata->name = "fsl_mc_err";
+	pdata->orig_ddr_err_disable = 0;
+	pdata->orig_ddr_err_sbe = 0;
 	mci->pdev = &op->dev;
 	pdata->edac_idx = edac_mc_idx++;
 	dev_set_drvdata(mci->pdev, mci);
@@ -645,7 +647,11 @@ int fsl_mc_err_probe(struct platform_device *op)
 
 err2:
 	edac_mc_del_mc(&op->dev);
+	ddr_out32(pdata, FSL_MC_ERR_INT_EN, 0);
 err:
+	ddr_out32(pdata, FSL_MC_ERR_DISABLE,
+		  pdata->orig_ddr_err_disable);
+	ddr_out32(pdata, FSL_MC_ERR_SBE, pdata->orig_ddr_err_sbe);
 	devres_release_group(&op->dev, fsl_mc_err_probe);
 	edac_mc_free(mci);
 	return res;
-- 
2.55.0

