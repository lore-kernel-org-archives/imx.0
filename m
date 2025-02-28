Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C77325F7A9
	for <imx@lists.linux.dev>; Fri, 28 Feb 2025 10:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740739211; cv=none; b=qWC0rC7Lkyz7l8meO8ASgmAKuI5DSoDfcXn/59gOFh2isyxO3SRe6zW/yX3c3xZozHdOwjLd19EtXrb6/45uFWEXDttVAt4D1rKsyHvdnp/qp2wQlrHxSrFNhX5ajr/Sms+kYc2/+iyoNO87xIzVRe+DkrE0qGeyqdv0C7vNcwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740739211; c=relaxed/simple;
	bh=BtzMxTsiUBKKfohLqHJJpcoRDbN/5OcsFVC/lglePDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kuCIRNuNdjdeBxj4x8EcIn5BqN66qOC+LFDyfW/OsJrVf5om0EHu6+TXRJrNXyooKQ+/19f6f3tU2qPxhcx9kWIUnlfvUieTJb+JHsIoDOwurKHV3QeHwbh+FP0vkPKkUtYB8PRLw47lYxTHjGN05DNnus2Txw+yTYhVJdmZ0KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JU/PMKvP; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JU/PMKvP"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43996e95114so13557235e9.3
        for <imx@lists.linux.dev>; Fri, 28 Feb 2025 02:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740739207; x=1741344007; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNQfrx2+Y7l3TBgRs2HYeEusAxTadJTrsHyF6Qzg2L4=;
        b=JU/PMKvPHCpuEOR+tvNO6ndcI53hE0MG0LWE7Y6qj/uADMh0bU70kJaue0kVIoRnIz
         uppwJZ/BPMoHIwPd7Oe5OX/Qkx0CzLWYIKVEMjnnFluv+BoQ5VAqgiSk051AMXgaGtPM
         HF/EVBew4zR4ZiHoAuptmVLrv7NRdO2EneDvJciq4HXNN6twKAVkEcEITDixrhpDXyTU
         SLLDz8DC8GxsFNTWPxEywvktmOY5wyjaXgq3jrzylqdD17HDKtiWtq2QMMeKe35Sywdj
         HGub1Quyg+zEVgSGRoQ4yMLLHKNHfCjkHf9EuE6/iSCVyCgCybWJhBE4NLjpZ9IKQuHp
         fALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740739207; x=1741344007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNQfrx2+Y7l3TBgRs2HYeEusAxTadJTrsHyF6Qzg2L4=;
        b=HoAdTmb1S7kbffzIpZFCHMSS1VEe2NSnqJH0+/dD7JMYR/H46dgK8NWa6FM6o8Xboh
         me9WaDx9L0N0cX0V5xpkNgPj24xMrbwyj8YjhFUoFbqaGVhuXSGoLfMi3zZjTDeHcGgF
         YG5UvHW+WNJY8oVY2j7dtyPensF8Gwc09NZFiddc0BzddpxJeoV/3hNv5Cq0gg9rm8HO
         3/GeSlJy7wEs1mwAT2m3yULIASE9e1O4z5UlOyc1reRLgE9JjQclkr5enQmcaB0+KrP9
         NN7TYbNIJveEONGcTSXa3UziPkEb0Qw0dBPWmnhAmPxPgu8lpJ/0b3t5iEnA1qThnxGz
         3jig==
X-Forwarded-Encrypted: i=1; AJvYcCUmkR9WXy0/ShO0MsfgLMZa1D2Xukp89sQEHrVUTdRN2KfC8YI8VbIKhOFwno77KFFheyw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCZ+ouVLR0LJfSzY/jABZBGruINNWQmWqvw6CGv0JlrNa2xif4
	Dh9qCC00tjX8CnXYljtmkta8nHRFInSvHw0GAv5Q05wrRYNNbrjl
X-Gm-Gg: ASbGnctzvKStrsy0c77/9boaTAbdLRnBb0QDqVOJwqcodDAHu1bq7BNfMhX/HZjpRKO
	I39s/kLzmlyNhhPY9DViHbgp0Af5xgbgXN+8HZb6PGqa87kcWijiEQAOsLwAJNTSpRv7Djd0r0q
	wDb78OQfxeB6fAeqB2V1T8MF17x9phWav8qd9DX/RpyxrQ2VMMqWYB1pzA7vbbTxMMAPG7XkLvZ
	hyAUnuA5VTJJcASlw6auX4VGIlRe4xfzmSs9Z3ivRVCPTSmRYWV2E74amHZCCou+zkHTsH3UhxC
	TJiZcwCFFwEXcfbWwuNHZ9oHDKYQaaLegxsUyUoUFg==
X-Google-Smtp-Source: AGHT+IHwAKMkbQkKZji2hIl2kLJahCHtsGvhDRkHSsHi5xjEjBT4SBZNdGXhe19X/KZFU+W8IlL/xQ==
X-Received: by 2002:a05:600c:1c95:b0:439:8bb3:cf8e with SMTP id 5b1f17b1804b1-43ba67606abmr21106225e9.20.1740739207395;
        Fri, 28 Feb 2025 02:40:07 -0800 (PST)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:31d5:4145:8035:cb68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b73703caesm52078855e9.12.2025.02.28.02.40.06
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
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	stable@vger.kernel.org
Subject: [PATCH v1 2/2] phy: freescale: imx8m-pcie: assert phy reset and perst in power off
Date: Fri, 28 Feb 2025 11:38:34 +0100
Message-ID: <20250228103959.47419-3-eichest@gmail.com>
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
 drivers/phy/freescale/phy-fsl-imx8m-pcie.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
index 00f957a42d9dc..36bef416618de 100644
--- a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
+++ b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
@@ -158,6 +158,17 @@ static int imx8_pcie_phy_power_on(struct phy *phy)
 	return ret;
 }
 
+static int imx8_pcie_phy_power_off(struct phy *phy)
+{
+	struct imx8_pcie_phy *imx8_phy = phy_get_drvdata(phy);
+
+	reset_control_assert(imx8_phy->reset);
+	if (imx8_phy->perst)
+		reset_control_assert(imx8_phy->perst);
+
+	return 0;
+}
+
 static int imx8_pcie_phy_init(struct phy *phy)
 {
 	struct imx8_pcie_phy *imx8_phy = phy_get_drvdata(phy);
@@ -178,6 +189,7 @@ static const struct phy_ops imx8_pcie_phy_ops = {
 	.init		= imx8_pcie_phy_init,
 	.exit		= imx8_pcie_phy_exit,
 	.power_on	= imx8_pcie_phy_power_on,
+	.power_off	= imx8_pcie_phy_power_off,
 	.owner		= THIS_MODULE,
 };
 
-- 
2.45.2

