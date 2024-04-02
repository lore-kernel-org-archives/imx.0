Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E5918628
	for <imx@lists.linux.dev>; Tue,  2 Apr 2024 06:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712037738; cv=none; b=AGZOdNrXE7UzPv19frviteJt90KlrbGaEDaY+YXQjC6X/l+7vBgOHNd78Qj/bAM2Rmht07q+Lo/sjSh0tV7rYTbAY0gz8uWIHRo218ebcefgStn8LQvtcGSyV5TkNq1CRqN35ipVNYMNxhobpAFIv5XjbfjOag1NhO0N5/xP6Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712037738; c=relaxed/simple;
	bh=WgWEWAEa+v2AKFyLz2Py8rA09bthmt8TkJPRop7rm/k=;
	h=From:To:Cc:Subject:Date:Message-Id; b=gPLnRDyEW9hZJ7qNuilGsiQPdThCMAEAlyTx4V4sRGEjpdN+tU9cfw1MwpyiOcC5BkiIzARtpcMnMsCDgHSChNADNivJ730jHQ4JvJh6jLFc3YE6rpEGGEXQ5ezMJj4JoSE4IbLw/AzM3NCRafcZfHoCnuJpE8P8/EVJT9f4m3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8EC861A04B1;
	Tue,  2 Apr 2024 08:02:15 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 451E11A19C2;
	Tue,  2 Apr 2024 08:02:15 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 54E401834890;
	Tue,  2 Apr 2024 14:02:13 +0800 (+08)
From: Richard Zhu <hongxing.zhu@nxp.com>
To: vkoul@kernel.org,
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
Subject: [PATCH v2 0/3] Add i.MX8Q HSIO PHY driver support
Date: Tue,  2 Apr 2024 13:45:01 +0800
Message-Id: <1712036704-21064-1-git-send-email-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

v2 changes:
- Place the dt-bindings header file changes as the first one
in the patch-set, make the annotation more clear, and add
Frank's Reviewed-by tag into this patch.


i.MX8Q HSIO module has PHY and mix control regions.
This patch-set adds i.MX8Q HSIO PHY driver support, and provides
standard PHY phandles that can be used by i.MX8Q PCIe or SATA
driver later.

[PATCH v2 1/3] dt-bindings: phy: phy-imx8-pcie: Add binding for
[PATCH v2 2/3] dt-bindings: phy: Add i.MX8Q HSIO SerDes PHY binding
[PATCH v2 3/3] phy: freescale: imx8q-hsio: Add i.MX8Q HSIO PHY driver

Documentation/devicetree/bindings/phy/fsl,imx8q-hsio.yaml | 143 ++++++++++++++++++++++++
drivers/phy/freescale/Kconfig                             |   8 ++
drivers/phy/freescale/Makefile                            |   1 +
drivers/phy/freescale/phy-fsl-imx8q-hsio.c                | 518 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
include/dt-bindings/phy/phy-imx8-pcie.h                   |  29 +++++
5 files changed, 699 insertions(+)

