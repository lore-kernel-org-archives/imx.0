Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5204624EF68
	for <imx@lists.linux.dev>; Wed,  5 Mar 2025 14:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741185853; cv=none; b=j53VWOcuDGiTRwEztuZyXBdjyAcM1AFQe2K201GK+StLipQl/LHLW06fbWkaUKPXwKZzQNCANXJjV+bfXYxihsvXFDc07xM2jqW24oLsaGpWQxGmVnEiQH4qzhiP2UF3gHLnkR+WRI1qWBtatoNr2zqBc7B18OWpoHEsH7rQZdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741185853; c=relaxed/simple;
	bh=656yZq6rNtUOx1YB7LPH8s26cM1Yb4fvkIYcST6VSoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ye0Unxoa3PKHz0QPwJu0m2yh5CIkpLjsAE8YCmenqDm1qnDgIdUXFD1DAZzNnnCrKj0N+VUWesw9dBHj+vBBvsHBpgRx3IGQk/sWQ3/2pRG6iGlLvUr2QBnSIzTjnQnl3OSb6/0qt12B/Bg6QsKU75c4pwUfCkUhn+KSDY9ymbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOGl0rvc; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOGl0rvc"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-390f5556579so3070202f8f.1
        for <imx@lists.linux.dev>; Wed, 05 Mar 2025 06:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741185849; x=1741790649; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=adw/wXG4xAXtVNNpVBpZ7rOz/ozzGq1WFDZ6AcGQFEg=;
        b=kOGl0rvcOnMPW+vh1Po3wR1yDrmZkfqvj/FhPNVecUaFWDB1yvnq3IQpoT1xZVTKge
         UaVR822v1kSusGJ7UZC6oibyXIRsQsyLQ9UYJiHHNkjzrmeqVxUk+fPmY+G63AN5eH5a
         wm6MzF+ZA29Oy6nJNEkcvjqN3wVTKG8wO/6WO3CwYBNh0P7U875nRbu5Jga+z+x04drr
         wmhBcv1dFQYkLuSEP+8Ypg9JcupLSi+jvZXRCwhDqriqLoaRkOlRk9MY6qfTmCvbUKtW
         qD7ZEo2Q0lcA1SKdzFx7z2+T/cvvE7hzahQBCFHRHycOp2pwnTF/gGKAJPgLdXrE3dFg
         wz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741185849; x=1741790649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=adw/wXG4xAXtVNNpVBpZ7rOz/ozzGq1WFDZ6AcGQFEg=;
        b=rlxpIZSKKj6hJfN2qUUICR3ZrwIzkW/qiuiHN3WSy9L8wp/lMDY70ioCbBiha7wGcd
         DBX/EJJvsXVl9wuf9F6tQ6eGLeI9iBTteWw2oJGIW8ZIMCUj1oXw22GYBqXGbzdGZPO2
         I2oRHLJc4bbn1i4qFfgn3eNhnynMywdDTpAj7ywtZgMHnwOTN7sKlwu9m/cz7hsr0cy9
         rhjYGqzf7q7gwDtVxaMqP4wrrUnK2UDXhV6dZ24A1epHS2Z9qQAlad23dmrpGldzdAQl
         fg16L1HX5BatRNQbybLtoyVw5upSIw6glYtecKQKhxlRUCnJ7PXbZAAKImtY6BHwrHCp
         1DoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWf1mtc87OZo30Y4gBhenNKvWTkUmoKdItc5cfDK/IsmiMNTNDCRQPN7YqNhUNlkJkCbI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2LXfZ1mA88JIJUA+ok/OKRg2VMqmWpzsXVmotj8eBYAOaP2v2
	kdwzMbTxkw+pVpW1wq9v3SQZGh0Atc3ZtEqXvmZHCXXsJAbovl/2
X-Gm-Gg: ASbGncs+/pQ+TCFcVrul9wAbT/JQCuhamdlgv69zjnCgY+U7bCnDFmMbxk9At0WnqwU
	BlLtfkOWJ8PdgYmzXppi7ZWW4gc/MABgDlMRKiXrjWm6708ZTIjkK/k5X/aOsxerf1txrMcrS7r
	CkXLKkaXlWbhZRJr9Q0S6QInWQw/9x9iQ3ZSLvBs4VjkN2y10RPop++Mj+4esgU02+Dp55RmERd
	BdESnh1V8GxSPIYkKmytdeQLJkq6+gAtQLl088btfZme4TXrKmHhFEpr3Ns1UsiaEq8EV/uVr3A
	2GcagOXZfVCkYH28CCuFEfi73xvyItYW9fOk4OQQ4okvpOBk
X-Google-Smtp-Source: AGHT+IFbsaX9wmtUFug2h6kZAAYC0Hb0y6lxNl62FVu79knUqZWExgLI4s21uIXSphigDaJmEpgWiw==
X-Received: by 2002:a05:6000:2cd:b0:390:ea34:7d83 with SMTP id ffacd0b85a97d-3911f76f519mr3393536f8f.31.1741185849295;
        Wed, 05 Mar 2025 06:44:09 -0800 (PST)
Received: from eichest-laptop.. ([178.197.169.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd435cd8csm19314375e9.40.2025.03.05.06.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 06:44:09 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	p.zabel@pengutronix.de,
	tharvey@gateworks.com,
	hongxing.zhu@nxp.com,
	francesco.dolcini@toradex.com
Cc: linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v2 1/2] phy: freescale: imx8m-pcie: cleanup reset logic
Date: Wed,  5 Mar 2025 15:43:15 +0100
Message-ID: <20250305144355.20364-2-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250305144355.20364-1-eichest@gmail.com>
References: <20250305144355.20364-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Remove the switch statement and base perst release on whether it is
found in the device tree. The probe function fails without the reset
property, making it mandatory. Therefore, always release reset
independent of the variant.

This does not change the behavior of the driver but reduces driver
complexity and allows for easier future modifications.

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

