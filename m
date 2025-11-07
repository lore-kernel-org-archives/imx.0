Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A0F2E975A
	for <imx@lists.linux.dev>; Fri,  7 Nov 2025 14:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762526999; cv=none; b=bJV+VVGw4dk5HWsgp+oVuUFJgAf+o/1RT4+t2EGpt53qMuYiMas0m43q8Jquidc3R0GdGQC+UjExKJ3VkFktvPA6sGUFqtLecUpf+qSpsqifZzw9Y0upSNz/T4BtBJn63YbnvD6QLR5Oogh5xAo7ldr8morPaDORhE8DhF+BbjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762526999; c=relaxed/simple;
	bh=9xmlgYIcPDg2cJwx5uGKS37YQZiZmJHaREenlXSoNzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nRBpFqfPxHog2E4LpduOJOUK42fd1dpMuXwHxIYTCIK2PVaK0fPW5uItHXFe2IKdJzdePOglFMxZzkSRj0180SPIauC2Swq+ReT3xs2l84g5wiWJmdzSHFxcOd64XQUPnGbw3vuXq+0Y8yaCTeznXQZ7NGHUfzyApxzl06O7lJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vHNmh-0001Tb-JW; Fri, 07 Nov 2025 15:49:51 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Fri, 07 Nov 2025 15:49:52 +0100
Subject: [PATCH 2/2] arm64: dts: imx8mp-skov: add Rev.C HDMI support
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-v6-18-skov-revc-hdmi-v1-2-595549e5b496@pengutronix.de>
References: <20251107-v6-18-skov-revc-hdmi-v1-0-595549e5b496@pengutronix.de>
In-Reply-To: <20251107-v6-18-skov-revc-hdmi-v1-0-595549e5b496@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

From software perspective, Rev.C HDMI and Rev.B HDMI don't differ since
the panel is connected via HDMI and the touchscreen is connected via
USB. However, the bootloader firmware expects to find a dts with the
correct revc-hdmi compatible.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/Makefile                  | 1 +
 arch/arm64/boot/dts/freescale/imx8mp-skov-revc-hdmi.dts | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 525ef180481d331e9c4decd092b7b831c497b67e..9da685641aa9e102a8566f0e58c0b57bb822c7d0 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -233,6 +233,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-hdmi.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-hdmi.dts
new file mode 100644
index 0000000000000000000000000000000000000000..c263e8fd048464df637604a8776aef345877e4f6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-hdmi.dts
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include "imx8mp-skov-revb-hdmi.dts"
+
+/ {
+	model = "SKOV IMX8MP CPU revC - HDMI";
+	compatible = "skov,imx8mp-skov-revc-hdmi", "fsl,imx8mp";
+};

-- 
2.47.3

