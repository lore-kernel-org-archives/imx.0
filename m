Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62E81D63F4
	for <imx@lists.linux.dev>; Tue, 15 Oct 2024 23:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729036794; cv=none; b=JtXMO3xsDI5FbOtbu2d5k/LiPZp6cHV3GQMERKvQgpoU6jDPoN9L7rs/EKmxzKqgAy1Hiy3yURxqvMYjUtkr1AWUoY5ns39hJxO0GdR6U0UjmmWM2FY6RTqY4TYE29ERF7KeIqAa0gacW3bWdvQEYZJ09cGBDMPD/hjERm4VIJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729036794; c=relaxed/simple;
	bh=b5cHyWBOfyu2SFHBcdLtZIDVG2MH8i0+A7M4xuXIYaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ewMJfrKTfvhBs6ZDu9qB34PDT+eEwJ/bxDUwN2OlXNsJqaV4YAETYH534cZK4CqCDRcyb8YE0i3wXPtFns9JjN0cVh1km5/7EJhJ3eq1r02gvnTZFsfEDmi1MZa/fygovEIKjnZBt1g2h/bbE2f7igNNaSzoNzro2XcVmN2i5nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Pdm1H70T; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Pdm1H70T"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 1FD92889AA;
	Wed, 16 Oct 2024 01:59:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729036789;
	bh=z7oJ4eldV++8WReLLKVVuSPOVo/xhffio4OF/7VkpCg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pdm1H70TGICcUR0kXpV/AzyItqaZx60Wc105xAhrI2iEnHW/xnvNWQOtSLK8CK7he
	 otk1hTOpEuQJu8CuiSGUJOKy82IEKZe3nv0510YvwplEpAXnfId0LKeTrLmdP9Xdct
	 CdtGJbO37tAeZdvFJbeCcl5ZljT1u69cnJVreDx7T5ZN4JD2sTSzIK9na5JI29MCiE
	 TWvBVEtJ9rCHl7l2TH7jHKTP3f0K41kKLJb6jt+IjKgCTlI0eez+KfD0Onqj8hpogL
	 exGRaMfDy5TYXETb42eJKbMd8BUGC14QegSxTLzadBC/pGC74HtGC1F56SanGZJs1f
	 StOD9lk8mzpNg==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Parthiban Nallathambi <parthiban@linumiz.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com
Subject: [PATCH 2/2] ARM: dts: imx6dl: Add support for i.MX6DL DHCOM SoM on PDK2 carrier board
Date: Wed, 16 Oct 2024 01:58:36 +0200
Message-ID: <20241015235926.168582-2-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241015235926.168582-1-marex@denx.de>
References: <20241015235926.168582-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Add support for the DH electronics i.MX6DL DHCOM SoM and a PDK2 evaluation
board. The evaluation board features three serial ports, USB OTG, USB host
with an USB hub, Fast or Gigabit ethernet, eMMC, uSD, SD, analog audio,
PCIe and HDMI video output.

All of the aforementioned features except for mSATA are supported, mSATA
is not available on i.MX6DL and is only available on DHCOM populated with
i.MX6Q SoC which is already supported upstream.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Gregor Herburger <gregor.herburger@ew.tq-group.com>
Cc: Hiago De Franco <hiago.franco@toradex.com>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>
Cc: Joao Paulo Goncalves <joao.goncalves@toradex.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Marek Vasut <marex@denx.de>
Cc: Mathieu Othacehe <m.othacehe@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Parthiban Nallathambi <parthiban@linumiz.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  1 +
 .../boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dts    | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dts

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 92e291603ea13..541eebb968cf4 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -73,6 +73,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-cubox-i-emmc-som-v15.dtb \
 	imx6dl-cubox-i-som-v15.dtb \
 	imx6dl-dfi-fs700-m60.dtb \
+	imx6dl-dhcom-pdk2.dtb \
 	imx6dl-dhcom-picoitx.dtb \
 	imx6dl-eckelmann-ci4x10.dtb \
 	imx6dl-emcon-avari.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dts
new file mode 100644
index 0000000000000..38235925257a7
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2024 Marek Vasut <marex@denx.de>
+ *
+ * DHCOM iMX6 variant:
+ * DHCM-iMX6DL-C080-R102-F0819-E-SD-RTC-T-HS-I-01D2
+ * DHCOM PCB number: 493-400 or newer
+ * PDK2 PCB number: 516-400 or newer
+ */
+/dts-v1/;
+
+#include "imx6dl.dtsi"
+#include "imx6qdl-dhcom-som.dtsi"
+#include "imx6qdl-dhcom-pdk2.dtsi"
+
+/ {
+	model = "DH electronics i.MX6DL DHCOM on Premium Developer Kit (2)";
+	compatible = "dh,imx6dl-dhcom-pdk2", "dh,imx6dl-dhcom-som",
+		     "fsl,imx6dl";
+};
-- 
2.45.2

