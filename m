Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3844E37C108
	for <imx@lists.linux.dev>; Mon, 18 May 2026 02:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779073143; cv=none; b=a6A9Irz5IyuLkJNoXL6DSWC7D7XKU2XqVYUqVcAU6qNTEsGY+E78/0mKq9PjSYOE+bvmaPmVdG4CcHMHOWdOecv/efv59INZCKo5kMFeo0LSZqzD+qzQ3xNXvkHsHbihyvYKXTk+KYlaai7Hx7MrQAd1tEkQ2gsJJjr3PY68i8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779073143; c=relaxed/simple;
	bh=36KvpVLZ2OlTOmDx+ai6Qq77ttV27luyGGK993oHgt0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OS06eYmLef3DSoHXrkQEKRTwC6hh3weaHHOheV4NVG3zLVdy9y298UUwggLUGGL26UDavh2VKTUkrhhZ98EESChqRkYgywjTEL/e+PdgY8icqk/EEeg4N1hBo1/X6Y7JUEOxvkIKNqdnVWTO0g1LY7AfQSk62kNrc0fBd081GqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 97BC31A117D;
	Mon, 18 May 2026 04:58:53 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5F9B51A11BA;
	Mon, 18 May 2026 04:58:53 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 23ECA180026F;
	Mon, 18 May 2026 10:58:51 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Subject: [PATCH v4 0/2] Add NXP FRDM-IMX95-PRO board support
Date: Mon, 18 May 2026 11:58:18 +0900
Message-Id: <20260518-imx95_frdm_pro-v4-0-975346555a9b@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEqACmoC/2XOywqDMBCF4VeRrJsymVw0XfU9ShGjSZuFF2IJF
 vHdG4Uircsz8P3MTEYbvB3JJZtJsNGPvu/SEKeM1M+qe1jqm7QJAirgjFHfTlqWLjRtOYSe5lX
 RADcSdIEkoSFY56cteLun/fTjqw/vrR/Zev2miv9UZBRoUQNYqR0YZq7dNJzrviVrKOKOBR4xJ
 iy4QAFGSXTiF/Mdp1cPmCesFWowImdcqx0vy/IBAHWJdiQBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779073130; l=1424;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=36KvpVLZ2OlTOmDx+ai6Qq77ttV27luyGGK993oHgt0=;
 b=8oK+MDmC88h8FpZTSKRofjrcbESSKd7LxuSew2ILEVR4Nxnfqpzd4W+FaVOMDSWOx3dY7l77m
 NEYRW2Z71+WAy4MKwRDmI+7ImTCKyqnadvuWwlJJXHn5FRsLgsLnVfx
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP

This patchset add Devicetree support for NXP FRDM-IMX95-PRO
development board based on i.MX95 19x19 SoC.

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
Changes in v4:
- Correct underscores in node names
- Correct 'silent-gpio' of can_phy to GPIO_ACTIVE_HIGH
- Fix typo in pinctrl_pcal6416
- Link to v3: https://lore.kernel.org/r/20260509-imx95_frdm_pro-v3-0-96290b471396@nxp.com

Changes in v3:
- Change status of CAN1 to reserved
- Remove unused pinctrl
- Explain difference with i.MX95 15x15 FRDM in message
- Link to v2: https://lore.kernel.org/r/20260428-imx95_frdm_pro-v2-0-434240b652f4@nxp.com

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
 .../boot/dts/freescale/imx95-19x19-frdm-pro.dts    | 1021 ++++++++++++++++++++
 3 files changed, 1023 insertions(+)
---
base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
change-id: 20260311-imx95_frdm_pro-7a8d03b50982

Best regards,
-- 
Joseph Guo <qijian.guo@nxp.com>

