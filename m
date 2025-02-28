Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB6E25F97B
	for <imx@lists.linux.dev>; Fri, 28 Feb 2025 10:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740739209; cv=none; b=MBGcQoUjXpNpb94EBi9TV7irSJ/c7xOyRZ1nBIEBQmmC6AeDpCjYBWUu95x88KdZ7RIJulcgCUctx6zt1GQvgqMCN3qhsVjWmqTWMFoSzhbMTPsvxMu/MdLn2tOK8fZaRhdjREJsePLn/7RJZ23z/JbteSIry7RDqaHq1rSFn0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740739209; c=relaxed/simple;
	bh=it8keP00Y+Nd5kfx7A3bztiKx9hyKFAAHBswegYUOxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KaJ5LRe9DIVFTvRjolzHjgxiLhq7P1ZIHYdGAzB7aJjaiPVSGPQOKZBbBY6cMC4PgwoDQ30LF9KJDG5Oz6WPDQ8rPXXZ6f64El+Cy5vVtivDJzz5tFGiQzbdTo2cbAtFGRU0Jjff2l0Y9lUgcV6imomdf1yDzf23PV65LNoepQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nA+DFnE8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nA+DFnE8"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4398c8c8b2cso20061015e9.2
        for <imx@lists.linux.dev>; Fri, 28 Feb 2025 02:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740739206; x=1741344006; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=312sLNrqEv63+Mv44pzQbo4rdknipAPccCqJcSeXheU=;
        b=nA+DFnE8wB1y5nqv3JYmtxtnf5avnqH/OQ0i9Bb62gr/JVzsiYVW2nfuTKh99l+Tvx
         N011FeCXvoTfghKCwYlB0WJGK6tYNrSVwq0Y+KOVqhxC4tz5YY4AXajGHk5X4y9tIZSs
         VF+jVqzX97IwznyKMsHMezKCiAIPMzU20gqBtg9eKQCWdA/TJcCZT/EVsWEPAD7VPXUg
         uPI3ParNTzy91rxrmdexMAgRFRWBjN5z9cEeqzEQQ4MQ+dc3gNWMY1cCkfDP4NIyrt1w
         FI7Gd5QJQ+hlIxUXu2o3dUOFDZUqfF54RLdA7LoTXJIaOiUN5qxbB8v7b7i/VhQzrKGs
         pItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740739206; x=1741344006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=312sLNrqEv63+Mv44pzQbo4rdknipAPccCqJcSeXheU=;
        b=AkD7mjnHMiwbtJ1ShyPRLKUGtaKaxBT30/elmJ8oT9K48wIVyt+sbhwiuNe3TrRMYV
         RumSCWX8fiZl2sKG+x1aJmXY5nmHmGAbkJX49IPJNg0D/OS3fSmq6Ac6W9xP6vW1jvdk
         bGtnt77kyo7U2/DsAfiT3WNNyYg0F5UYg0xV/bK4xGBM0neUnZpLv5Xc8dP47noKFkge
         7SHFicxn8URotNZyFEh8r30FmYgYBylM0MxVCK0hhwDu5VgfRLXPBuRgQfxi/IPuhEXB
         q8IvpArTX8LhqaX4QLfKoaYfjIgZgrNdyQdc3iJViaAZkaoDOrvTcLoerGF5g0rxLapE
         u2gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKuXbQOS8qGBXhOQBNmwKX/vSXs27mWLyaEOrBqyX3EFTxgLiyCowpm6J4CS9vIBwlTww=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGK0sFo5L6f/iAP9nmFbOMeIg+gA/CKaD9ZITYFkGIWvwTkU2T
	np4KLkXqSPtENClwS/jN1XGwRAheV2UU072xpLHo0Jtk7y6j2C1L
X-Gm-Gg: ASbGncsbHwlPyNd9mW37nUF7gWi66WJVqUdWd4iFVuWp7Gb1POmwXPE3GGY8csZTsrS
	HlLDJ5p4kuzjkyXis63Yxr8WuXpqN4oMSs0HhlXljRuUM2oC9IaGYd1/5/HOjHKvfl027vUONE/
	/j7loxBKOy9nOIP8FJy3dMnHh4OZRkzrxCQtal1CG+wKie+eQW/cI1YdvnPA3cFP3WA0vjOAXbd
	2tJQW2fZCIhpqU5dki0oIkoIMtCZl9udA7zjg4rUKebpjDbMwVWyL4WTrweaJHgEqkWkjV7M54r
	UwlEDdwH8oex09LI78A6wd1QkRM3ApZqu43Izgnm7Q==
X-Google-Smtp-Source: AGHT+IFncYfQLZzLO9PxJRHTbcQAlKTjUNCZ0jwHv2Xpg6+UDCdisti3XOyvr9rdDHjH0Z4kclaw5A==
X-Received: by 2002:a05:600c:4685:b0:439:a0a3:a15 with SMTP id 5b1f17b1804b1-43ba67045camr27125335e9.14.1740739206381;
        Fri, 28 Feb 2025 02:40:06 -0800 (PST)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:31d5:4145:8035:cb68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b73703caesm52078855e9.12.2025.02.28.02.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 02:40:06 -0800 (PST)
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
Subject: [PATCH v1 1/2] phy: freescale: imx8m-pcie: cleanup reset logic
Date: Fri, 28 Feb 2025 11:38:33 +0100
Message-ID: <20250228103959.47419-2-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250228103959.47419-1-eichest@gmail.com>
References: <20250228103959.47419-1-eichest@gmail.com>
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
 drivers/phy/freescale/phy-fsl-imx8m-pcie.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
index e98361dcdeadf..00f957a42d9dc 100644
--- a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
+++ b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
@@ -141,15 +141,11 @@ static int imx8_pcie_phy_power_on(struct phy *phy)
 			   IMX8MM_GPR_PCIE_REF_CLK_PLL);
 	usleep_range(100, 200);
 
-	switch (imx8_phy->drvdata->variant) {
-	case IMX8MP:
+	if (imx8_phy->perst)
 		reset_control_deassert(imx8_phy->perst);
-		fallthrough;
-	case IMX8MM:
-		reset_control_deassert(imx8_phy->reset);
-		usleep_range(200, 500);
-		break;
-	}
+
+	reset_control_deassert(imx8_phy->reset);
+	usleep_range(200, 500);
 
 	/* Do the PHY common block reset */
 	regmap_update_bits(imx8_phy->iomuxc_gpr, IOMUXC_GPR14,
-- 
2.45.2

