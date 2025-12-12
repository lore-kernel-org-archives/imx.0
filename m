Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298092BB13
	for <imx@lists.linux.dev>; Fri, 12 Dec 2025 02:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765506705; cv=none; b=AbQczWCA6GhQScSC4/11ZhH0yWNqweVozmTKR46BeD6DxEQ6tcNHRhoX77dZWacNPsuqjFCCo3TVXV0024Ajg8nOJRHBRQfjbATas0gbS1CyHUZ5pEWA21+ekRCgJPQ4MfRJZ4o7b6qCIW/3a61TokQy9luTyLFuMJfkz6w06SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765506705; c=relaxed/simple;
	bh=qZxoOpZklmk0uLrecCQ0PIkOwJOw6TGfs6nzQjEN3Jc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uyhqvkg2CLoT/zkMcbfC+7v3BXFFKVoa4HPhDAGc03Sae7z3qL9zAJvpp7Lwqo7fm9Xy9+354uv9jdI1mpalNJ/nAF1zsOPnivjjdQMZkg928KZP6BfsOmAhwkAr3ykel79JJv+TxJS+3MMVwtHUAvv6gAkVPpehX1JgHYBQr1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F0327201E63;
	Fri, 12 Dec 2025 03:31:36 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B95E0201E61;
	Fri, 12 Dec 2025 03:31:36 +0100 (CET)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id E7A2B1800241;
	Fri, 12 Dec 2025 10:31:34 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Subject: [PATCH v2 0/2] Add FRDM i.MX 91 Development board support
Date: Fri, 12 Dec 2025 11:31:32 +0900
Message-Id: <20251212-imx91_frdm-v2-0-4dd6d289e81d@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIR+O2kC/23MQQ6CMBCF4auQWVvTaYWKK+9hiAE6yCxaSGtID
 endraxd/i953w6RAlOEW7VDoI0jL76EOlUwzr1/kWBbGpRUNSJeBLvU4nMK1oneWjWoURoyVyi
 HNdDE6cAeXemZ43sJn8Pe8Lf+ZTYUUlBtGj3YqdW6ufu0nsfFQZdz/gInVthCogAAAA==
X-Change-ID: 20251114-imx91_frdm-add2b2c07e78
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Justin Jiang <justin.jiang@nxp.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, qijian.guo@oss.nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>, Tom Zheng <haidong.zheng@nxp.com>, 
 Steven Yang <steven.yang@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765506694; l=1410;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=qZxoOpZklmk0uLrecCQ0PIkOwJOw6TGfs6nzQjEN3Jc=;
 b=k9WzHtAHy892HO1YZlrnaTyEyjFDdhH19IAAa3kvAPqGDaa5BbyQTFUSbLQ7ED2OWM5os8hgH
 sD6AwNqmtu2DwQ338HGaGwbr73Jfk7YqWMv3m9Z9QLBvG4iwqAGeCOy
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP

FRDM-IMX91 board is a low cost development platform based on i.MX91 SoC:
https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX91

Add device tree and dt-binding for FRDM-IMX91.

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
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
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts | 904 +++++++++++++++++++++
 3 files changed, 906 insertions(+)
---
base-commit: 73f1e611b076de705c2f1c26cfdfc5b8e96f4733
change-id: 20251114-imx91_frdm-add2b2c07e78

Best regards,
-- 
Joseph Guo <qijian.guo@nxp.com>

