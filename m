Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5A5227BB9
	for <imx@lists.linux.dev>; Mon, 10 Mar 2025 12:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741609676; cv=none; b=s9klSzYAo8CwIlANvxjAAFQk5K10RrX/upFmhkCKtEP+daIo9fO13okyAb+18xcgFURQT1dzTG5OrEITltXSVKok3ov2MG27TGe6ybr5DHi5vTn9mwDAUquAdF7hakHKtVQQnukbb5nc7TsGMXA0VdxyGeImJc3yHwDEIVQw7iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741609676; c=relaxed/simple;
	bh=Zy2fJh3cTHOqRs4mkjI77HUqzP8JFc4VAdL+NBQchrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HYHCv+ZmuvlQbRKl4+34X2fr5UYoycfgix0WuxBIW2omquep7rDS8T0pQU+0MwcplosnlPEIK2rZCemozzu9TkXo5l52wTEYaLNN60XNHrb9H/B1zpefUmosb6FYRWnU95K2wQTPjIgVnLdBHAOQa3gzacVjB+C5rTkVklve8pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dez1KU5q; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dez1KU5q"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43bc48ff815so23949465e9.0
        for <imx@lists.linux.dev>; Mon, 10 Mar 2025 05:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741609673; x=1742214473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pP5AGd49889Z3JFGOGRHgkg7HKkdewQ+Zwhw794fEIw=;
        b=Dez1KU5qILr2Rb/K11jhC/EkGtErEzyCCokbPJ2YieNn1hEsfZKvG0rLZaDt6dZudy
         XWlXQipdLvn6cWOUDDkn3mnPPaQneK/jIFkwEk9rqZvZ7nQsZQgqfV44+ZBwo3xPlL1h
         APH7oBDBMWSPhyFwLuvwZKp5hAOhlv/KKPDEaCoV11BxKb9qdw8RDvP7P2y7f7zUyggH
         CeU+TrmHUqZb6oCxdq70V0mtZMrJPvOznk1gOdfkVnO8pHE5Af4ZqgbmVtxF9b3PGDll
         TC8GtUINKdJyC6onXWW3H75XIwrjSr8XhG1U7CCRyO8OClTpajtf/cFr6/8iMCNF2E1H
         U9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741609673; x=1742214473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pP5AGd49889Z3JFGOGRHgkg7HKkdewQ+Zwhw794fEIw=;
        b=etVTXm6fYt5PnM7DZjMbxce/9B4Pj4M78u0Wy5gvjuVdnyoCuTVm/jJ2lIyTNukLZ4
         JMRmQ3UjeE79PxSPRStjf2/gc+aZLHJKVzhQRuDCVZjAYudbRUl24hQh4zLHwGqVyjYC
         mcW1Zc3OZSZ1CTMZn9NNikVIuS4h1FuKrKXQwd+Fnp9M9bxrxX0iwIkG4ZJuO9KChqsV
         IYWaHD8bn57gU+q075VXhZJtf/uKZTe2uknJot0eixRMu2/kRvVKKrsaLYNfKeAmEsMi
         INNTDCDsY+Hm9msP2nENsJEpJI/D+qNd5P9C8oKQ3V3hAiR8pdpd3dyVVjYDBlwHjpu1
         2+Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWJXJcZYRFmmoybOqLFSd3G3byERd2R4Ocu/ca84Sh3MT75KNt6YLF88rhrPA1msq1nG7A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1u32E+oblDTxgXlmaVQNtD7BMesyJCfdkQYjhX2d/MNF/CO98
	IDlDtR2xXUhY7zh7+iOWTHnBmXulg6zAzK/ZfZe+QcanuLUZZYVv
X-Gm-Gg: ASbGncutSnpQlNHiAfqP9kT5kjVJcI4BV/iCF5FNk+8mp3cHhbAN9+WkubDDDc4ru+9
	g6b7Gb5cnsqsuuNZx0bKkHze7wwAG2kGKWnEPErbcou+E9pJOggjz+IXMcVRIbYBhJHFc6MfFe5
	88lcG+c75DLI0WCF0G1uw6IXIKrM//uDeU1e7URBzubnRKMSlWNi3UXaI9SsnS+sfFUpLvWfXL+
	BFQJc8/INUl8QYPEFe350OAWACjp8aRORWH7w0nTb+myJ0WIiF3qKp7/qoSUddL9QnxTx4I5v8h
	xMydGGFcZS38JAcV0QP0SGMEC991c44Lxv44t0w7CSDtJnurm9dspnmQ9rDAODtEtBZCMPcchLD
	VTUq0133VUoSJgcNC
X-Google-Smtp-Source: AGHT+IHkdFXutwUlHgJUEeibLtGVxZ9e1BYhqaRmZdU3VrmHHopZkCNH9T65QpbRvqLO+DUNS6Gfbw==
X-Received: by 2002:a05:600c:1e08:b0:43c:f680:5c2e with SMTP id 5b1f17b1804b1-43cf6805d78mr26252335e9.13.1741609673265;
        Mon, 10 Mar 2025 05:27:53 -0700 (PDT)
Received: from eichest-laptop.toradex.int (85-195-230-40.fiber7.init7.net. [85.195.230.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd6530f26sm171963245e9.4.2025.03.10.05.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:27:52 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	p.zabel@pengutronix.de,
	hongxing.zhu@nxp.com,
	tharvey@gateworks.com,
	Frank.Li@nxp.com,
	francesco.dolcini@toradex.com
Cc: linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v3 1/2] phy: freescale: imx8m-pcie: cleanup reset logic
Date: Mon, 10 Mar 2025 13:27:03 +0100
Message-ID: <20250310122745.34947-2-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250310122745.34947-1-eichest@gmail.com>
References: <20250310122745.34947-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Remove the switch statement for releasing perst and reset since they are
already correctly set at probe and are no-ops for
reset_control_deassert(NULL). Call these unconditionally.

This does not change the behavior of the driver but reduces driver
complexity and allows for easier future modifications.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/phy/freescale/phy-fsl-imx8m-pcie.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
index e98361dcdeadf..5b505e34ca364 100644
--- a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
+++ b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
@@ -141,15 +141,9 @@ static int imx8_pcie_phy_power_on(struct phy *phy)
 			   IMX8MM_GPR_PCIE_REF_CLK_PLL);
 	usleep_range(100, 200);
 
-	switch (imx8_phy->drvdata->variant) {
-	case IMX8MP:
-		reset_control_deassert(imx8_phy->perst);
-		fallthrough;
-	case IMX8MM:
-		reset_control_deassert(imx8_phy->reset);
-		usleep_range(200, 500);
-		break;
-	}
+	reset_control_deassert(imx8_phy->perst);
+	reset_control_deassert(imx8_phy->reset);
+	usleep_range(200, 500);
 
 	/* Do the PHY common block reset */
 	regmap_update_bits(imx8_phy->iomuxc_gpr, IOMUXC_GPR14,
-- 
2.45.2

