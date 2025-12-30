Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8B92FDC35
	for <imx@lists.linux.dev>; Tue, 30 Dec 2025 08:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767082023; cv=none; b=AtlU0jBxHvUM3cgAv0alaCNFM/CMwjkMkwYvK081z0qThrlWWGAEUx/r/QEUQlmf6nbokSjcFH2+K0ftsGqo1vLD2h6z6COIwj2sfo/7QB1ro9u/y/pQrrHzZZg2I8+BduwYhnd6F6k4iYGiKPgbrwZnhUXgpdpEvuRXdrVsSL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767082023; c=relaxed/simple;
	bh=WF+3YUeStBER7WDlSH8W0Q73euxvDdCx6NdqjDTRwO4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t9+UFAooZx4eZ6raAgg+myLMFdAs815TOoifo6w65+A1fYAkQ81zbopgRzn9oRsWyT6/uiWkvFhj2jqwVvDXLJ3UHHb8yBLZi8vdhkLRbGDfIxqAV2T1vKC2gnUGiYEdUrcB+K0WBWjcRxo5cVdBXVJ2a+rrXZkiH0gWVcEZ/Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 617DF201C5C;
	Tue, 30 Dec 2025 08:59:05 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EF0EE201603;
	Tue, 30 Dec 2025 08:59:04 +0100 (CET)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 8D1B018000A0;
	Tue, 30 Dec 2025 15:59:02 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Subject: [PATCH v3 0/2] Add FRDM i.MX 91 Development board support
Date: Tue, 30 Dec 2025 16:58:52 +0900
Message-Id: <20251230-imx91_frdm-v3-0-60cac61c96ec@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADyGU2kC/23MywqDMBCF4VeRrJviTLyv+h6lFHXGOgsvJCVYx
 HdvdCOFLs+B71+VYyvsVBWtyrIXJ9MYhrlEqu3r8cVaKGyFMaYAkGgZlhKenaVB10TYYBvnnBc
 qgNlyJ8sRuz/C7sW9J/s52h7292/Gg441p3lmGupKY7LbuMzXdhrUHvF4QgT8gRhgQpQRFiUXQ
 Cfctu0LnVlnv9sAAAA=
X-Change-ID: 20251114-imx91_frdm-add2b2c07e78
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Justin Jiang <justin.jiang@nxp.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, qijian.guo@oss.nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Francesco Valla <francesco@valla.it>, Tom Zheng <haidong.zheng@nxp.com>, 
 Steven Yang <steven.yang@nxp.com>, Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767081542; l=1631;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=WF+3YUeStBER7WDlSH8W0Q73euxvDdCx6NdqjDTRwO4=;
 b=AWTITKcGcf/bNI+QNQVYK/k7HUzGm36o148BWGsptXbDzoCSZGjOefGMpBjZnUV202l10RkGY
 BNyYbZ7LhW+DsE8owgJuw0LJ9Oo4iadfMbQjg68Pq/P0Xc37t9SQCue
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP

FRDM-IMX91 board is a low cost development platform based on i.MX91 SoC:
https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX91

Add device tree and dt-binding for FRDM-IMX91.

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
Changes in v3:
- end property list with 'status'
- add newline between property list and child node
- add code-review trailers 
- Link to v2: https://lore.kernel.org/r/20251212-imx91_frdm-v2-0-4dd6d289e81d@nxp.com

Changes in v2:
- rename compatible 'frdm-imx91' to 'imx91-11x11-frdm'
- rename 'sw-keys' to 'gpio-keys'
- rename 'user_btn' to 'button-k'
- drop lpspi3 node
- rename iomuxc 'grpsleep' to 'sleepgrp'
- move dt-binding patch before the dts patch
- add board page link in cover letter
- use CAN PHY to manage the stby gpio of flexcan2
- drop realtek property
- add pcf2131 aliase
- add bootph- property for nodes should be kept in bootloader phase
- add reset-gpio and assert for eqos and fec
- delete unused alias
- Link to v1: https://lore.kernel.org/r/20251114-imx91_frdm-v1-0-e5763bdf9336@nxp.com

---
Joseph Guo (2):
      dt-bindings: arm: imx Add FRDM-IMX91 board
      arm64: dts: freescale: Add FRDM-IMX91 basic support

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts | 906 +++++++++++++++++++++
 3 files changed, 908 insertions(+)
---
base-commit: 73f1e611b076de705c2f1c26cfdfc5b8e96f4733
change-id: 20251114-imx91_frdm-add2b2c07e78

Best regards,
-- 
Joseph Guo <qijian.guo@nxp.com>

