Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5AB2D1907
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 01:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785460900; cv=none; b=rIJg+uIFISGIwZjLLrZ1NIV5VMMPltiC0NNH7NoEuqtnFaaiud53VCy8CnM2hs2fIprJD9xnekrunXdD62/3JLkrEO5rq0LR9kmmDOAcdmccVlx/NxmM8WCdm5RzHYKiG7ek9RPV2lYbSSo8isqBWeZdIDX3ROgiw5MB09yLX60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785460900; c=relaxed/simple;
	bh=xsFVWzxEmP1xtSwF4J0aOwtU5FsqXzYKJ4uqEQVsIDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dis/htJXQlpFXvKDI7cMFRQW7eo0w11+Kgkj08qoQjpkcyVMb2f+dsGfEGw9X3S5CV5iI30DD5gM4A/U4R7oBvrDSVGnIpu9v7lFHWtObWLR8+N6WmErFklOZw09QBU6kKLPR05+NfVL6OIlx03DrI3+2lqYEQbOFVcq8I/giIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oiafnBUj; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oiafnBUj"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbb662575d3so233084a12.0
        for <imx@lists.linux.dev>; Thu, 30 Jul 2026 18:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785460897; x=1786065697; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jg8//SIb3wCfw25zWTdBtLReUkKBuqQ+hnflSQ8n1KE=;
        b=oiafnBUjtZJzMYSuj1BLInF82mZ0PY79XO47YUR0coy8TMqBeFODioPuF8lvxtC4Fv
         n8IeEJRbBvqTsGtCZS3CFn1WTQiSf/vgQT0dNhs8D9QWaftXJP+I/3SuSqp22beTYgWw
         i/nMx40BbTU+9zN4uKhrkx5O6sJ8z3fg17ZAtlcZpi/kp0nOOVaXJO2r66j+S2xKEVbe
         NPWtgLxPx5fxnwq+abWLibkZ7cE0IJnvDpkMLpdRifGBtXfPE7aqH3jw+RblVA1EvoL1
         r7i9B1gQkgP/Ul0xAnjD2OdfMQMfehKYs16E/UC4ZgF8dHBpM9MZTqWaIYxA6Udh4MND
         0GCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785460897; x=1786065697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jg8//SIb3wCfw25zWTdBtLReUkKBuqQ+hnflSQ8n1KE=;
        b=ElbA7PsumNPa/nBZ0gxRPXEgvEOR1ZMRlh66a/I/yEAklMKwVGZUBhXXYJk7+vs4AT
         Ztg06KDqhYF+6myx8XXR0h3+x/zOlh17/IBWM/Rg7KEi2TOD7l20UAz1jyYFQM/gypd9
         4fwJ9SkjeNoU334jsGMn4KL2BPI1aMt40aoJJC5+u+dnobMvZNkWBNzIlAneUJjoulg5
         UW3JKgCmh2hxO8w8Mi3X/tdj7s0ULPyi75ukjbhZoSCoP31ShafG/TxC+Za+TQMaJvcT
         TPnc+ZrMAKIxY912dFtCgEjh/XRQPNjeWcIZ7ND3jIXlkfajA4bQa22vLPxkUgn4BPfn
         UQMg==
X-Forwarded-Encrypted: i=1; AHgh+RqI3HI4sa0FisnacIv56av1/noxyAbGIwxVaFLwuEQPUe9AnL1CVQwnanZN/WGMqyDNvLk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXDukUcch6xVdhQ6OnypeZ9PHIKFkkOUfRU0ganu12XCBR0iRb
	vCEGSTz+L/g6Vt8dKrUHqs/wZqp9H/RycBNmdAj/15VoGrs6ezswSuAfw79IoQ==
X-Gm-Gg: AR+sD12D2JZF1dJhD6I3hjAaGANrr4eNou5IbfVubwV9REjJ30t5E+CTQ8fCPpsCe75
	dC+Z1K3rofsrFfScocQsXrOXW4FneZT5TZga5Xh3xywdnDpexTBKUoPojcrTQVRv9HRomNzO7xH
	U8XFj3Aw8cnJxJwlyQp/w6FEmYZ1kMA9gipdAyFq6D+P0i+heYhgJZN2mBG7VfixxDvT9GwSm4E
	Vp3WPJdFr4pN0lXuhNsL0JutZJM87Dfd1o6Xw+kt3GYrxGkr6BQ9G8JoIij0uKvDqpJxG/6tc7/
	DrbmASsTRLr6UYplGBhzPYVkJOnnAEVFkwmMz4sCZuQN3tjtkOkZx7d6iTkwtOkDSczcJejcIny
	lovkI5Q6GW2PVH9jZWmiFqOpaczEpHYSYUvc4MBknsll2vNg7k8jIsa3E0NFX+GTn45id8cXlrC
	IqQQ8IjMjhDpbhxaLYcv9N0DYSmLt94shZmVQj/1VYrEFYjrAVHw3+/qSfR57tXPBVTqWyvjKH1
	SRRbLOSfo8qdeTP5RWkShaQysg1CYS6bjeviqupsa7KbFZWWdyz0Y92iqvhaHxS1irunK9FqCMb
	DYIhWplZt95oRgCD5j9xdHvSsJz6ENso2SaciA==
X-Received: by 2002:a17:90b:1650:b0:38e:ad9d:1151 with SMTP id 98e67ed59e1d1-38fb11368d2mr135362a91.4.1785460897057;
        Thu, 30 Jul 2026 18:21:37 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38facf50124sm198867a91.3.2026.07.30.18.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 18:21:36 -0700 (PDT)
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
Subject: [PATCHv2 3/3] EDAC/fsl_ddr: restore MC error registers on probe failure
Date: Thu, 30 Jul 2026 18:21:30 -0700
Message-ID: <20260731012130.1212640-4-rosenp@gmail.com>
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

fsl_mc_err_probe() clears FSL_MC_ERR_DISABLE and, in EDAC_OPSTATE_INT
mode, sets FSL_MC_ERR_INT_EN to enable error reporting. If a later
initialization step fails and jumps to the err/err2 labels, the cleanup
only frees driver memory and does not restore these hardware registers.

This leaves the memory controller configured to generate interrupts while
no handler is successfully registered, which can cause an unhandled
interrupt storm on the shared IRQ line. Restore FSL_MC_ERR_DISABLE,
FSL_MC_ERR_INT_EN and the SBE threshold in both error paths.

Do not pre-initialize orig_ddr_err_disable/orig_ddr_err_sbe to 0; the
err path must only restore registers that were actually modified.
Split the error labels so early failures (before the first hardware
write at line ~~580) jump to err_free, which does cleanup without
touching hardware registers. Save orig_ddr_err_sbe alongside
orig_ddr_err_disable so the err label correctly restores both
registers, avoiding stale bootloader state clobbers.

Built for arm64 (defconfig + CONFIG_EDAC_FSL_DDR) with LLVM=1;
drivers/edac/fsl_ddr_edac.o compiles cleanly.

Fixes: ea2eb9a8b620 ("EDAC, fsl-ddr: Separate FSL DDR driver from MPC85xx")
Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/fsl_ddr_edac.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
index c505fb268474..139277c4e2f0 100644
--- a/drivers/edac/fsl_ddr_edac.c
+++ b/drivers/edac/fsl_ddr_edac.c
@@ -577,23 +577,22 @@ int fsl_mc_err_probe(struct platform_device *op)
 	pdata->orig_ddr_err_disable = ddr_in32(pdata, FSL_MC_ERR_DISABLE);
 	ddr_out32(pdata, FSL_MC_ERR_DISABLE, 0);
 
+	/* store the original SBE threshold */
+	pdata->orig_ddr_err_sbe = ddr_in32(pdata, FSL_MC_ERR_SBE) & 0xff0000;
+
 	/* clear all error bits */
 	ddr_out32(pdata, FSL_MC_ERR_DETECT, ~0);
 
 	res = edac_mc_add_mc_with_groups(mci, fsl_ddr_dev_groups);
 	if (res) {
 		edac_dbg(3, "failed edac_mc_add_mc()\n");
-		goto err;
+		goto err1;
 	}
 
 	if (edac_op_state == EDAC_OPSTATE_INT) {
 		ddr_out32(pdata, FSL_MC_ERR_INT_EN,
 			  DDR_EIE_MBEE | DDR_EIE_SBEE);
 
-		/* store the original error management threshold */
-		pdata->orig_ddr_err_sbe = ddr_in32(pdata,
-						   FSL_MC_ERR_SBE) & 0xff0000;
-
 		/* set threshold to 1 error per interrupt */
 		ddr_out32(pdata, FSL_MC_ERR_SBE, 0x10000);
 
@@ -621,6 +620,11 @@ int fsl_mc_err_probe(struct platform_device *op)
 
 err2:
 	edac_mc_del_mc(&op->dev);
+	ddr_out32(pdata, FSL_MC_ERR_INT_EN, 0);
+err1:
+	ddr_out32(pdata, FSL_MC_ERR_DISABLE,
+		  pdata->orig_ddr_err_disable);
+	ddr_out32(pdata, FSL_MC_ERR_SBE, pdata->orig_ddr_err_sbe);
 err:
 	edac_mc_free(mci);
 	return res;
-- 
2.55.0

