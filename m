Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD3124FC03
	for <imx@lists.linux.dev>; Wed,  5 Mar 2025 14:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741185855; cv=none; b=rP8MRjQlvf7CXOOqAtiOIQ5Vi2/YuCjHr2TSrNXrqXY3SsookRj0sliCOknhPtiXWPiO8oozriJ+0D6HMSD0rpmontjLtsRrGv4wl1yCZakNwsyi1AoDWh6SAuifp/uSxN5j7fwXUqpBmvWqr1YqWZsLoFFKLBbUeUrCgodRYS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741185855; c=relaxed/simple;
	bh=8YPkqmU4X8iTIjEGD6+u3qjdqvLAhcHfMt6fUOhJLtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RaiSLW2C5Zt73r8mUN/MocRCOnu15Zjaz9l2tmcu+Nd3ZWZRb3j3r17Yb+EbTVkK4xVz15syd3elkK0lo1FDn5ORRW8SJjWEjOBZE9z6ssBqm5rVEI0Bgmphhjygbnx51mckeBZE9o+c5AIGAtw6Btsr2r4XjxSrJwjjHw9DFfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mYHSC0tm; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mYHSC0tm"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43bd732fd27so4352495e9.0
        for <imx@lists.linux.dev>; Wed, 05 Mar 2025 06:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741185852; x=1741790652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNwIlbvFX4QRldBXaIs5/RL9LSC9AEjKyZahDbOst8Q=;
        b=mYHSC0tm8Jr3eZ/dUeJp5S/54CniNcZ6OGktXvqf9Bng2JAxk3+LwShrJTzUzxrEHk
         0qGZ9/Wj7k1m/2Htaxvh23z8UNIuUb/4vWD+fa8a47ZPsoqfycP+e6U6NO74Nz3wVFyT
         Z2uHEd74CLqNB1ryJFHUoCcUOmxmpXUwrKCBaHmg4ZqyNC07AJEl5zPn8Q8cC6mT1pW0
         4pGtDG5tESJomyRIOzOQEqIQXJIvor+7syNn73yoHr33+ADvq3oHiULnZnY8VS/kiYh0
         clD6N6gR/7tsMcmUT+gYB53GZgg9DUTf3pTnd3ovX/dLkKXqxnyOuPZtgpCn6tk/4VhD
         6Wvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741185852; x=1741790652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNwIlbvFX4QRldBXaIs5/RL9LSC9AEjKyZahDbOst8Q=;
        b=d/Een3vjmMWvSho3AoQ7Wgi1Qkdjc9wH5vT/zMLrQHgvINHkm4HmDhx7kpCFMYhnHw
         ISGW7lz7aeUE3T/5AWnxGfj4suwe7KKy9UZCQD1/mdOAfY9DRJvhhi7s9oAH/kyHqoY8
         rlP+uvo1GVCFjNRJSKy56JKcEMlw02IvE/z35y8P0V2D3Zm0SkwJ/Icb+viVLMxfSrSD
         uJ5J57ySnuZLns/3b/Z4MrLWThmlwL+GPqVspFeNweUNYXffl1k+GDjGHJQkLexuK6mR
         nwZA8UkPSadw0e6BrZCBV0bfKNL1DM6b6PgBzSv6QYa2NB2SQdSzvoxG5phvU6vePiB8
         cFqw==
X-Forwarded-Encrypted: i=1; AJvYcCUQxh1J8mgfv03jEb6yf4i1t89zxvpFfGPPvQuTNd86MAptLdwuMeI+2EB+XeR6bLkbLqs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDVyRS7Ls8BaYaGFBwO84UB1RmO8LoGqwd8GibAvLAR+PlM4l7
	GDWkc2LDmSvN2LLcZ+q/8T3LynyCtKgvq2nflaAPqX9UHePUIsDB
X-Gm-Gg: ASbGnctaoZCRVpUTj+Ba2lmyqe+g06dvT6T+RKs+FKB1vNgJHftezREXBwfd3Bafm7x
	3RyHBbNmDErBwvc/uF5Jipsriav9w1TIlh5X/HxzT2iAB9AatGTyWqnvPNYT91hxxtQ3HdV12mP
	EXHAMKt6Fxq93dsZmD0SUNxt6BvuRi3ucDgXSkOXJhG0JcH7mvZppvo5fbRFDk7NWXck/5EMYdq
	AusjdjRp0KOYpZ92w+cam42kbc5qF7AvCrSzFEWFzGgLL96nELwLTazN4YD7T5gapnimx93FIzn
	ITKYyIgrtMZflB+isH8fT/LUE/vJkPuw7svWs/2T7KGBxgcH
X-Google-Smtp-Source: AGHT+IFJVniNBPju7U0+Zkvo7cT0yiY6E+Oe3yG3cuVYvnJhnTUke2U3Jt13V/c1QPsHTlV77FcZzw==
X-Received: by 2002:a05:600c:1c94:b0:439:7c0b:13f6 with SMTP id 5b1f17b1804b1-43bd2ae52d7mr27450545e9.31.1741185851384;
        Wed, 05 Mar 2025 06:44:11 -0800 (PST)
Received: from eichest-laptop.. ([178.197.169.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd435cd8csm19314375e9.40.2025.03.05.06.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 06:44:11 -0800 (PST)
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
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] phy: freescale: imx8m-pcie: assert phy reset and perst in power off
Date: Wed,  5 Mar 2025 15:43:16 +0100
Message-ID: <20250305144355.20364-3-eichest@gmail.com>
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

Ensure the PHY reset and perst is asserted during power-off to
guarantee it is in a reset state upon repeated power-on calls. This
resolves an issue where the PHY may not properly initialize during
subsequent power-on cycles. Power-on will deassert the reset at the
appropriate time after tuning the PHY parameters.

During suspend/resume cycles, we observed that the PHY PLL failed to
lock during resume when the CPU temperature increased from 65C to 75C.
The observed errors were:
  phy phy-32f00000.pcie-phy.3: phy poweron failed --> -110
  imx6q-pcie 33800000.pcie: waiting for PHY ready timeout!
  imx6q-pcie 33800000.pcie: PM: dpm_run_callback(): genpd_resume_noirq+0x0/0x80 returns -110
  imx6q-pcie 33800000.pcie: PM: failed to resume noirq: error -110

This resulted in a complete CPU freeze, which is resolved by ensuring
the PHY is in reset during power-on, thus preventing PHY PLL failures.

Cc: stable@vger.kernel.org
Fixes: 1aa97b002258 ("phy: freescale: pcie: Initialize the imx8 pcie standalone phy driver")
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/phy/freescale/phy-fsl-imx8m-pcie.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
index 5b505e34ca364..7355d9921b646 100644
--- a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
+++ b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
@@ -156,6 +156,16 @@ static int imx8_pcie_phy_power_on(struct phy *phy)
 	return ret;
 }
 
+static int imx8_pcie_phy_power_off(struct phy *phy)
+{
+	struct imx8_pcie_phy *imx8_phy = phy_get_drvdata(phy);
+
+	reset_control_assert(imx8_phy->reset);
+	reset_control_assert(imx8_phy->perst);
+
+	return 0;
+}
+
 static int imx8_pcie_phy_init(struct phy *phy)
 {
 	struct imx8_pcie_phy *imx8_phy = phy_get_drvdata(phy);
@@ -176,6 +186,7 @@ static const struct phy_ops imx8_pcie_phy_ops = {
 	.init		= imx8_pcie_phy_init,
 	.exit		= imx8_pcie_phy_exit,
 	.power_on	= imx8_pcie_phy_power_on,
+	.power_off	= imx8_pcie_phy_power_off,
 	.owner		= THIS_MODULE,
 };
 
-- 
2.45.2

