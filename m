Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC603E2767
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 07:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784790827; cv=none; b=kRElBirOw3D56/O3uEahCKPcly4kW80Pxhkx4qExtf81Ec+1guVlT/75/7HVMtALoEeCyHCMflpr4ZQd8IdxSzBPnXE8YvK4kvx4h+2VjCg3ZNX3fnFLxhVVzGgu3K8zd+yvXad17DdhwFvYZ+H/9mnDSe6J44JLsqNWPoT+Arg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784790827; c=relaxed/simple;
	bh=QQ8/050hFzFET3me0Ofq704cyws+Io1cqXqzBjtRwGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KngvyJM2lcNBp0IwAVkcgcDWP1iM0ty59vciwAY5WLtyaAXHh10gfBhTAKTTPLVYXA45BxuQocBTJZ23ooTs/wGN+/A8FBv2bgE7QzrRRRhog5mIoGaUbd13c/tRnqMr9qhtcYPJc9H7RqrXC2cm6wR7M0CzupYU2EF21WiIzsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CE8831A016E;
	Thu, 23 Jul 2026 09:13:35 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 93B1C1A016D;
	Thu, 23 Jul 2026 09:13:35 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 8F44818000B0;
	Thu, 23 Jul 2026 15:13:33 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Date: Thu, 23 Jul 2026 16:13:23 +0900
Subject: [PATCH v2 3/3] arm64: dts: imx93: Add i.MX93 Wireless FRDM board
 support
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-imx93w_frdm-v2-3-b108a76b2e40@nxp.com>
References: <20260723-imx93w_frdm-v2-0-b108a76b2e40@nxp.com>
In-Reply-To: <20260723-imx93w_frdm-v2-0-b108a76b2e40@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 justin.jiang@nxp.com, xinyu.chen@nxp.com, qijian.guo@oss.nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784790808; l=3010;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=QQ8/050hFzFET3me0Ofq704cyws+Io1cqXqzBjtRwGQ=;
 b=fvJFI41HcFz2RlviF7AfAjRoY3oY9yxhcmhVWiEmAf+5ISFX11enmzcD1Gu3QbqIheruYMLZc
 0pS8UcpVqpDDWRgU9ZAVNVcZdcpDtxiI5Kz2lKc22CX6K3DPwQkuVhL
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP

i.MX93 Wireless FRDM board(FRDM-IMX93W) is a low-cost and compact
board featuring the i.MX93W applications processor.

FRDM-IMX93W board basically reuse the FRDM-IMX93 board, with some minor
functional and pin connection differences. Reuse the
imx93-11x11-frdm-common.dtsi and add the board-specific changes.

Here are the detailed differences between FRDM-IMX93 and FRDM-IMX93W board.

Function differences:
Function	FRDM-IMX93W			FRDM-IMX93
WIFI/BT		IW610 in i.MX93W		IW612 M.2 module
MQS		N				Y
M.2		N				Y
RPi 40-pin HDR	Limited support(pin conflict) 	Y

Pin connection differences:
Function  Signal name	i.MX93W EVK		i.MX93 EVK
WIFI/BT	  SPI_FRM	SAI1_TXFS (spi1.PCS0)	GPIO_IO08 (spi3.PCS0)
	  SPI_TXD	SAI1_TXC (spi1.SIN)	GPIO_IO09 (spi3.SIN)
	  SPI_RXD	SAI1_RXD0 (spi1.SOUT)	GPIO_IO10 (spi3.SOUT)
	  SPI_CLK	SAI1_TXD0 (spi1.SCK)	GPIO_IO11 (spi3.SCK)
	  SPI_INT	CCM_CLKO1		on-board IO expander
	  NB_WAKE_IN	PDM_CLK			on-module IO expander
	  WL_WAKE_IN	PDM_BIT_STREAM0		on-module IO expander
	  IND_RST_WL	PDM_BIT_STREAM1		on-module IO expander
	  IND_RST_NB	GPIO_IO28		on-module IO expander
	  PDn		GPIO_IO29		on-module IO expander
	  NB_WAKE_OUT	GPIO_IO14		on-board IO expander
	  WL_WAKE_OUT	GPIO_IO15		CCM_CLKO1
I2C3	  I2C3_SDA	GPIO_IO00		GPIO_IO28
	  I2C3_SCL	GPIO_IO01		GPIO_IO29

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 arch/arm64/boot/dts/freescale/imx93w-frdm.dts | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index be3c858f1eeb1a807cb8ac36269c581143f755df..d48ba7dee1861e0b39ab025c4b8108ffa68c9bf3 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -655,6 +655,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-mini-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-dart-sonata.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93w-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93w-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx943-evk.dtb
 
 imx943-evk-pcie0-ep-dtbs += imx943-evk.dtb imx-pcie0-ep.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx93w-frdm.dts b/arch/arm64/boot/dts/freescale/imx93w-frdm.dts
new file mode 100644
index 0000000000000000000000000000000000000000..766e942fe6638330b602577c541d93f3526afe51
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93w-frdm.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+
+#include "imx93w.dtsi"
+#include "imx93-11x11-frdm-common.dtsi"
+
+/ {
+	model = "NXP i.MX93W FRDM board";
+	compatible = "fsl,imx93-wireless-frdm", "fsl,imx93";
+};
+
+&iomuxc {
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO00__LPI2C3_SDA			0x40000b9e
+			MX93_PAD_GPIO_IO01__LPI2C3_SCL			0x40000b9e
+		>;
+	};
+};

-- 
2.34.1

