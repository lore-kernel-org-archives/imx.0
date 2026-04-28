Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A7A392C56
	for <imx@lists.linux.dev>; Tue, 28 Apr 2026 08:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363931; cv=none; b=Gsyd2dDv9l6ntzkLuEc0s3PU+NYyQJuVCo6dFaZpyWCRJvBXR2HbMvGz8ForK4dS5G2Afloc6oDOj+jVt8yzZc13zRmgIIca4W+HqCOBIzIfIdEYa0lYVygYW7s8Ax8QJCuC7W9NNxbG/xS8SIiiCIWr3Gj2+aFj0edGNGj56Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363931; c=relaxed/simple;
	bh=CkAAtD5YmfCNBOnuQOiQRptEzghvDmFA6t0i/Us/rmk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jvMIYdC2YrB6JwXw/r+Bk05l+pSogQzvws6I2JZVstrwgDpr13f+10sA/Az9uOxNhBmR1Fe8sqERy1iWsiF+QPC5conMUSBxgTK4iS1xeWtO+TRM5AzzVHzgMmUlQlwhrxXzPuRMpf+8JZUF7C2itu/ucl9+6QZre4cGsM+Wg2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3C4932011DC;
	Tue, 28 Apr 2026 10:03:16 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F1E762034DC;
	Tue, 28 Apr 2026 10:03:15 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 6DBE21800083;
	Tue, 28 Apr 2026 16:03:13 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Subject: [PATCH v2 0/2] Add NXP FRDM-IMX95-PRO board support
Date: Tue, 28 Apr 2026 17:03:11 +0900
Message-Id: <20260428-imx95_frdm_pro-v2-0-434240b652f4@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL9p8GkC/13MSwrCMBSF4a2UOzZyk1JNHLkPKaWPxN5BHiRSI
 iV7NxacOPwPnG+HpCPpBLdmh6g3SuRdDXFqYF5H99SMltogUFyw5ZyRzaobTFzsEKJn11Eu2E4
 dKimgnkLUhvIBPvraK6WXj+/D3/h3/VHyn9o4QyZnRN0pgxOf7i6H8+wt9KWUD+RMdlyqAAAA
X-Change-ID: 20260311-imx95_frdm_pro-7a8d03b50982
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 xinyu.chen@nxp.com, qijian.guo@oss.nxp.com, justin.jiang@nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777363393; l=963;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=CkAAtD5YmfCNBOnuQOiQRptEzghvDmFA6t0i/Us/rmk=;
 b=3A++Sago1au9eBWxxqbp/XVHvpZHP+RAgcot14Rg0lzwzVdKg4Vw4BuDcJ06UMG0HguZJFJf4
 Z3cFZwEC587DpBxAPBx9IcRHOh2vPiSwmSdJ1bUecyZB1r3Y5YqJEgI
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP

This patchset add Devicetree support for NXP FRDM-IMX95-PRO
development board based on i.MX95 19x19 SoC.

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
Changes in v2:
- Run dt-format to reformat the node order
- Change compatible of mqs to audio-graph-card2
- Add imx95-19x19-frdm-pro in Makefile
- Link to v1: https://lore.kernel.org/r/20260318-imx95_frdm_pro-v1-0-8c00e59f0b1b@nxp.com

---
Joseph Guo (2):
      dt-bindings: arm: fsl: Add i.MX95 19x19 FRDM PRO board
      arm64: dts: freescale: add i.MX95 19x19 FRDM PRO board dts

 Documentation/devicetree/bindings/arm/fsl.yaml     |    1 +
 arch/arm64/boot/dts/freescale/Makefile             |    1 +
 .../boot/dts/freescale/imx95-19x19-frdm-pro.dts    | 1049 ++++++++++++++++++++
 3 files changed, 1051 insertions(+)
---
base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
change-id: 20260311-imx95_frdm_pro-7a8d03b50982

Best regards,
-- 
Joseph Guo <qijian.guo@nxp.com>

