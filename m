Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C681591E4
	for <imx@lists.linux.dev>; Wed, 24 Apr 2024 06:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713940793; cv=none; b=K/TH9EVI+LaYh+zK3bSU4XkejtOBX5iTtY6BldhxuXMDSa5WFWkQc+hHYZBhOL4CKSg5ks42rudShTpe8TvByaeq88T6yQ/38XNdt0ULIUKVaVORy9o62tfFUNAB+RVy6dmwBIHKnf5/Rnzb96W6VaYU8QiFvDMYs3gI6A7r7dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713940793; c=relaxed/simple;
	bh=rZBy/i+sD+VWCZ0HAIWMZJeuAKvsI/pfhC5oycrcFDc=;
	h=From:To:Cc:Subject:Date:Message-Id; b=PH2yhh8aOyx0zZpeKFOXy2NABSa4sfowvwJANqheRREB24lF1sPIL01+i4HZAHnFC1wQqiSA5BKK740+8ptT2rX2oD3egHbi7T4oZ5rA/ouw+A2n9isb29iTvFz+detMSUG0D5CSpLWUwI/eLdFIOt3HU5REG2NwbEx6l+TBRd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 801211A22BD;
	Wed, 24 Apr 2024 08:39:43 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E16821A22EE;
	Wed, 24 Apr 2024 08:39:41 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 70D73181D0FB;
	Wed, 24 Apr 2024 14:39:39 +0800 (+08)
From: Richard Zhu <hongxing.zhu@nxp.com>
To: conor@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	frank.li@nxp.com,
	conor+dt@kernel.org
Cc: hongxing.zhu@nxp.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev
Subject: [PATCH v3 0/3] Add i.MX8QM HSIO PHY driver
Date: Wed, 24 Apr 2024 14:21:20 +0800
Message-Id: <1713939683-15328-1-git-send-email-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

v3 changes:
Refer to Conor's comments.
- Let filename match a compatible
- Refine description of the fsl,refclk-pad-mode.
- Remove power-domains description.
- Keep clock ording for two devices.
- Drop the unused label and status.
Refer to Rob's comments.
- Use standard phy mode defines.
- Correct the spell mistakes in the binding document.

v2:https://patchwork.kernel.org/project/linux-phy/cover/1712036704-21064-1-git-send-email-hongxing.zhu@nxp.com/ 

v2 changes:
- Place the dt-bindings header file changes as the first one
in the patch-set, make the annotation more clear, and add
Frank's Reviewed-by tag.

v1:https://patchwork.kernel.org/project/linux-phy/cover/1711699790-16494-1-git-send-email-hongxing.zhu@nxp.com/

[PATCH v3 1/3] dt-bindings: phy: phy-imx8-pcie: Add header file for
[PATCH v3 2/3] dt-bindings: phy: Add i.MX8Q HSIO SerDes PHY binding
[PATCH v3 3/3] phy: freescale: imx8qm-hsio: Add i.MX8QM HSIO PHY

Documentation/devicetree/bindings/phy/fsl,imx8qm-hsio.yaml | 146 ++++++++++++++++++++
drivers/phy/freescale/Kconfig                              |   8 ++
drivers/phy/freescale/Makefile                             |   1 +
drivers/phy/freescale/phy-fsl-imx8qm-hsio.c                | 607 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
include/dt-bindings/phy/phy-imx8-pcie.h                    |  62 +++++++++
5 files changed, 824 insertions(+)
