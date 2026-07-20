Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DE73B14D7
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 06:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784528948; cv=none; b=jnz8xrevU7LUfThRd2WeqXpFlf44mbghbwtp3BptEbyeWItsa61U+Ls9OvRyFURbW/YFf1whcr/7ilRo1LlZpGQpRvGDmxwGZyWmia8jOFPIPzrxnY6oCkeGJ+jDvsAXmR9Jkdv24DzWZg3UUtDUrySUDdnPMfH+HdNbpUGYxyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784528948; c=relaxed/simple;
	bh=SYmL2yxbUbMx5yLLjsJOBqmUBV+i6ecNo6KLOjxQn8I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GvMo/1is62Tz0HpDaLHcH4Nu7BT7/Xon5VQnrgNdNkv/sTHeXQgP8mV7Vs8/5kE7N7NBv/lrxOgpR2P4/wLphpRZsLYDEY/of3E4vkurKx66qsGTyVX/TQkqgBpqukXWhSwz6cH2XIgNnT6IIFChrAq4wz4UK0F2q1zRuexV6LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 585911A0042;
	Mon, 20 Jul 2026 08:28:57 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 29A131A0040;
	Mon, 20 Jul 2026 08:28:57 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 193C118000B1;
	Mon, 20 Jul 2026 14:28:55 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Subject: [PATCH 0/2] Add i.MX952 FRDM board support
Date: Mon, 20 Jul 2026 15:28:52 +0900
Message-Id: <20260720-imx952_frdm-v1-0-6d145eaaa5c4@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACTAXWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0Nz3czcCktTo/i0opRc3VSLtCQTQ9PEVJMUEyWgjoKi1LTMCrBp0bG
 1tQCKYaayXQAAAA==
X-Change-ID: 20260717-imx952_frdm-e8fb415ae4d4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 qijian.guo@oss.nxp.com, justin.jiang@nxp.com, joy.zou@nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784528934; l=811;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=SYmL2yxbUbMx5yLLjsJOBqmUBV+i6ecNo6KLOjxQn8I=;
 b=94YVHE9ZHDtU2SEPVEZVdVZiSmKMYw6RnEQqmwuo9yY1xwvv+off9DtuRSAiU1kL0CNF1yHPS
 kKcK3FKZruDDbfZnURludpx/kQ5QEMCRnidmgRNA+amFgtQjYfjQaJ9
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP

i.MX952 FRDM Board is a low-cost and compact board featuring the i.MX952
application processor.
Add dt-bindings and basic device tree for i.MX952 FRDM board.

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
Joseph Guo (2):
      dt-bindings: arm: fsl: add i.MX952 FRDM board
      arm64: dts: freescale: add i.MX952 FRDM Board support device tree

 Documentation/devicetree/bindings/arm/fsl.yaml |   1 +
 arch/arm64/boot/dts/freescale/Makefile         |   2 +
 arch/arm64/boot/dts/freescale/imx952-frdm.dts  |   9 +
 arch/arm64/boot/dts/freescale/imx952-frdm.dtsi | 727 +++++++++++++++++++++++++
 4 files changed, 739 insertions(+)
---
base-commit: 139fb260e37938042c6ffaad796e236fde2bafed
change-id: 20260717-imx952_frdm-e8fb415ae4d4

Best regards,
-- 
Joseph Guo <qijian.guo@nxp.com>

