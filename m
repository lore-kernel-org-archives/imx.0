Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0469D2D1907
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 01:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785460897; cv=none; b=LrOaPikSrdlTRON/jWTLrkPDhht1XpZiUbk0VEl9gxHbppQIFr8Ig+9TpYjfQja8rTpIFw2F1B4WisuiGZ68lJF0FOuMMMroeHXIlfpOQbrUoE0SqRAq3e/1TMALq11aaY/Yt5XOwaD/6UKM6/mSgwIzYF907zM85okr/jZYcD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785460897; c=relaxed/simple;
	bh=EXM737zPqfFOz8c2oTEgN+Z9Ea1EJcWSCZdWPrOgRko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BByyq2HvUOfzEroXNscPxTs+2ay4fpYOH+siI3K6Nc2teVa/idiG8EPlQ5ZH9CE01w7cllmmIi4V/nNFpYrvBKvDeuQNIky1FEjPhYtw6WLnFexgGMvVi92Qvh28rhUojnzY0+wx2iIYRPq2TE06tqc5TI1sOvpnqODdc/4ZFxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgU+LOgu; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgU+LOgu"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e88b60121so384057a91.3
        for <imx@lists.linux.dev>; Thu, 30 Jul 2026 18:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785460895; x=1786065695; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQZ7kr/xVyL8NQz8gujRJuKRFxvmEh5rg2s5p7tnoi8=;
        b=XgU+LOguha8Cu31eFx8DAABWWySEw+xLwZinMi3FsN9vVaP4hqgm2WQi/GK3RZnNWD
         AGeTaM7h3iD7bvD62txwx/1wKlbz4MpbqKFYQrg88Ausv9XEorZYhCmy99X8OOFBxzi/
         L99vO2kLVsqrqL0ZppTIQcDfvYKribUcJQbDJr+ZIXaOZjOJsrdDIVw9+qQICSvRJOuq
         d5/qvohOcvD16OtRA2F1rmC21IIVR13pWoorzXsOA++gC5ywvoEvScMHyjSbc+DHh9FI
         9vZJLQo5DhDSnEYB7P1XMZjsvSfjVSN9h+asGVGRnQOCxVg8tBqSSNhxaK5hqy2P84p/
         rB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785460895; x=1786065695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQZ7kr/xVyL8NQz8gujRJuKRFxvmEh5rg2s5p7tnoi8=;
        b=RCCi3xAuS1BFsaWTNG/Sok5PLcIQXJWHALdo+AIH3ZPnQCFiUjNKe8rSskHqqhwp2x
         Ei/OmejQl0cRbDQ+h3ibJFmY0Ryf1YcUU7l64owIeUkv2dNaD0EgbB3vW6kRC29tGdGk
         JQfSyL0ct/dDbRPLlxYHildrFHfafvyFm6iRVZs47jesN7fSVkEG3GQYOcQR/ECsCE51
         9nJppOzpMq5MWgbpbCo6qpH1+viHwsxjz28PtSfn7+4WtInMYCtijlt48VHNKDxa9RJD
         qo6mRsGGg0JA9RITigiQNAx+ZUSmgONLO5Uv6HEFWnh5KzhjFGSAPjod29C3Rtah7HV7
         TQ4w==
X-Forwarded-Encrypted: i=1; AHgh+Rp/mpnI4S5/9FO7ZnO7pMJ3AaK39ILKxbw65gHZsk0c+PnAHrPFYtzsmevYGWdUavGdewk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQv8eekJXZW3/7AseO+WhxcB+X7xURJMMVV7Wm3XVheGy1oQ3L
	VctlmwEiDGTqBDL3tMUN4hxTWkRuwdZ/alA0l6xZTCdetAbS5aGwRJS6
X-Gm-Gg: AR+sD12aRzvvlZ5BhZzLYuQBr7CeicdoLcVUZKPmwVzzSlGkbx5lMOd/oaUdWJVgHV3
	OWWqknzSwSobbkStU4POOfL6m+3uLcOgcfczwXZ8kjZrb0CRdDqQuN3F4H3rm+3n1C22tJdrRPA
	B2JlJC4SA2+o8h3pzi5cZWDCYkESiKGnoGHbSos1bQ84qNtt2chkQISzxXUAhnEuLJejj5ZhAVJ
	htY4AvUBkexOE6KCGAvSWaiIKfiHQvXYx4w32C10JFPcEw3DVRXXrCtlbXLtMMzY5naxorr4Z2x
	b3KfPhI/7FiNk3gSlRvaTlHyU0Y5P+VKgioo8d4YCwzyAPVkRNKlXd4iRkGHEUj8+mtiH3a4k4v
	v2Z4u7m9+kBrZiugm9frWq0MjkRwqH2IsG/97m8zBy5h0+BARsvDeX+6PcL2k0rLLZhKaeurqfv
	LV808Kh0uE/jcmqFYBYTnNmmdMnt7fvdpSw4Jc7fbi6i22X9Kk0XUN2E1GnzIXrwvuy2dlaFCcI
	sb3UnQIBIEleQAv/1hKYny1Cg7MqlgJdRacyuZjj5is1Q9GOZhwGpykSdh2GPQZaFunDQBTstsm
	HXRfxozjtiCANedIZG+ceRie1yp3cWXoClxO8hw9Z2D2kP6w
X-Received: by 2002:a17:90b:4ac1:b0:381:c500:b0d1 with SMTP id 98e67ed59e1d1-38fb13c3a7amr108448a91.20.1785460895317;
        Thu, 30 Jul 2026 18:21:35 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38facf50124sm198867a91.3.2026.07.30.18.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 18:21:34 -0700 (PDT)
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
Subject: [PATCHv2 2/3] EDAC/fsl_ddr: use non devm for request_irq()
Date: Thu, 30 Jul 2026 18:21:29 -0700
Message-ID: <20260731012130.1212640-3-rosenp@gmail.com>
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

We need to tear down the irq before edac_mc_free() to avoid a use after
free on teardown as request_irq uses mci as dev_id.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/fsl_ddr_edac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
index 3745eec67335..c505fb268474 100644
--- a/drivers/edac/fsl_ddr_edac.c
+++ b/drivers/edac/fsl_ddr_edac.c
@@ -599,7 +599,7 @@ int fsl_mc_err_probe(struct platform_device *op)
 
 		/* register interrupts */
 		pdata->irq = platform_get_irq(op, 0);
-		res = devm_request_irq(&op->dev, pdata->irq,
+		res = request_irq(pdata->irq,
 				       fsl_mc_isr,
 				       IRQF_SHARED,
 				       "[EDAC] MC err", mci);
@@ -635,6 +635,7 @@ void fsl_mc_err_remove(struct platform_device *op)
 
 	if (edac_op_state == EDAC_OPSTATE_INT) {
 		ddr_out32(pdata, FSL_MC_ERR_INT_EN, 0);
+		free_irq(pdata->irq, mci);
 	}
 
 	ddr_out32(pdata, FSL_MC_ERR_DISABLE,
-- 
2.55.0

