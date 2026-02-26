Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B61338A70D
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 14:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772117320; cv=none; b=O1oBN4+ve8mz/6tgwPpiVLJuuyvuaMAWu3y33WNg4ZbOnYliUI7MuhAmnlDPR25QKDmFHoXg/hQIHRA1VZdN6O3hvEDQqroraYrbhRosM2p2mID1AcOMfwtw1P/tj48EoXUPqZLTfCAdTZQLSwV07eVQmUIzNUSNLHBWc4OMrpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772117320; c=relaxed/simple;
	bh=7zTQA8lPctzwCwCjXrHIP1VZj+HCyeAawrW7SHbynq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XW1ojd/8vRpgWIInAn2dj9Qx4HQSGVl1virqKy0piP5juN0dv0C3IQOAmRYpJ5Wy8Z6++FERFla9FE74cW8NaBDRNKj5EALPM/z3YNOksvZnLLcs8Ep7Jzai5/s73xZhiWiG7IJ3dS0llVmYwk5/4f4Xb8vRVBketl4/diDGRWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDHiyDHq; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDHiyDHq"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2addb31945aso6539825ad.1
        for <imx@lists.linux.dev>; Thu, 26 Feb 2026 06:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772117319; x=1772722119; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/bj7g2xVbgir6ea9eN+82z6ip7UdFAQ5IC4Yz8wr/Y=;
        b=BDHiyDHqYrhuapa4Nq7QmFGNO2M8xFM9LmMjlDfw2D3+5m9ujCPRYNu/NECb3DoAG4
         kxENSE1VfyA3HkyCvkgIofQm2ZhWtm69yYvboJPYF/HFdvf4Dg4/MlZG59LZ7pAR23E2
         L8N1wL8oUkeutzXzL7VgJG6QRrK7/dSSqOSRWP57hMOA0sL7NyWdJ9a8koQCF4Ckqzzt
         TyUs0tG8QtUi5KEr0CyESGn9LtFUZlhmg0IDX/eQXKToXRbQa9shjd3BxMuLIaYmD9/R
         jDwK3Sj1JLLV2XisGkDG5XH8bIut+5zpOQXRqQagsG7Jd7eT7WS99w0ytn/CX7dOHfrY
         RHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117319; x=1772722119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r/bj7g2xVbgir6ea9eN+82z6ip7UdFAQ5IC4Yz8wr/Y=;
        b=bXVZSSuK9fKgQCpVQ4jaSPy7+XBeOichZhd0bLMARML41V5SP/dxT/VTCvVd0QzuQn
         mBcDK8/KioJ4FijqZEqups9yqYwUbQQZNLHRXMlZ+3xkcD6FQb27vfEDCECsOvMg9wf8
         GsxkXPHLYOE64ELR8R6kMnccMcfFLCGpqSurfR3c6Bs6CzjqjhQsp7lpIUwmlq0e1+Xo
         LwaLfkQAjnQW5bMrRF+Y6IS2RMDnldBjFAdF2cs9RYX5+QPI/PCoBBRR3gVr7n/nij79
         /1AxEO84pGYeCAKS1cXLfXD5Hr4bsNFe1IyPoXFJUslejOUfnkaOJ2JytFeNwE94tyrs
         I56Q==
X-Forwarded-Encrypted: i=1; AJvYcCXoCk8fuK1twARacgn+IeJOZv06QnUUHTnTwdgF7A5vPvrlHnpZbwpBUD2DWT0HtUdIDEM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCGCrnNIQnsl7jFpc7vubaBnJfXvSLiTGjD7IKKbYh791P4x76
	MHw6VZ+/+iKKChAvGj2WDcQYbBbMoHx+Ru2MLQKlqGx+SsrfYmkLHqXH
X-Gm-Gg: ATEYQzwhyuX3vybRfchS/PDEWJJhd/vHdzKKjRoaUkZUdq6QDI+Il7epPg2Wy9Ggmct
	6wtMZNDpNJQ9R217bY9irtW/WcKXP9sfot132LeHyf8p2gQSsS4Byv6jFKdw618P6GQfz2xrMNM
	UMAKGg9mGVKSt5XtC4KEeBdIr+SzMxTLsrmIW4fGE8tLZ2Ymss0Evb9a40ZdzxMbvIubvzWH+8N
	fDCjw0oF5YY5S900RkZX93wkZXavPdTVgVoZSAOIm5GkOM3r2snJ2h2/XZozVcPneuKtpGlxWSm
	Vr9KZ5E7TE8OF3LqTppw9sPtW0XeGj3jmoLJ2y0LVCWoV1PSC22dcaItLlJAIPilQ1TmYeT/liy
	RQl+H/5bQFqZSPcgD/7kn08ipJtGk1lOWECfmt1t5gQeppjUePm4ImjamNDWxm9PSgJn2M75Lop
	XQjgFc8w3/imaoCtMVR54wA6Pr+lD1G80nw6j8FRI3hZM1WLWXjkYI4Xb8hJEeKoY5T/4=
X-Received: by 2002:a17:902:e785:b0:2ad:c1e1:c286 with SMTP id d9443c01a7336-2adc1e1c458mr70241875ad.24.1772117318539;
        Thu, 26 Feb 2026 06:48:38 -0800 (PST)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69fa65sm27871825ad.58.2026.02.26.06.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:48:38 -0800 (PST)
From: Wig Cheng <onlywig@gmail.com>
To: shawnguo@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zaq14760@gmail.com,
	Wig Cheng <onlywig@gmail.com>
Subject: [PATCH v5 1/1] arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM
Date: Thu, 26 Feb 2026 22:48:19 +0800
Message-ID: <20260226144819.3428730-2-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226144819.3428730-1-onlywig@gmail.com>
References: <20260226144819.3428730-1-onlywig@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree overlay to support the MayQueen PixPaper e-paper display
on the NXP i.MX93 FRDM board. The display is connected via LPSPI3
interface and uses GPIO pins for reset, busy and DC control.

The overlay configures:
    - LPSPI3 pinmux for SPI communication (MOSI, MISO, CLK, CE0)
    - PixPaper display device with proper GPIO assignments
    - SPI frequency set to 1MHz for stable operation

Enable Open-EP Community pixpaper-213-c support on NXP i.MX93.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  4 ++
 .../freescale/imx93-11x11-frdm-pixpaper.dtso  | 50 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 700bab4d3e60..aa5eb1626c10 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -417,6 +417,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
+
+imx93-11x11-frdm-pixpaper-dtbs += imx93-11x11-frdm.dtb imx93-11x11-frdm-pixpaper.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm-pixpaper.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
new file mode 100644
index 000000000000..28aeff9520e2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Overlay for Mayqueen (Open-EP Community) pixpaper display
+ * support on NXP FRDM i.MX 93 Development Board
+ *
+ * Copyright (C) 2026 Wig Cheng <onlywig@gmail.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx93-pinfunc.h"
+
+/dts-v1/;
+/plugin/;
+
+&iomuxc {
+	pinctrl_lpspi3: lpspi3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO08__GPIO2_IO08		0x3fe /* SPI3 CE0 */
+			MX93_PAD_GPIO_IO09__LPSPI3_SIN		0x3fe /* SPI3 MISO */
+			MX93_PAD_GPIO_IO10__LPSPI3_SOUT		0x3fe /* SPI3 MOSI */
+			MX93_PAD_GPIO_IO11__LPSPI3_SCK		0x3fe /* SPI3 CLK */
+		>;
+	};
+
+	pinctrl_epd_ctrl: epdctrlgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO05__GPIO2_IO05		0x31e /* DC pin */
+			MX93_PAD_GPIO_IO06__GPIO2_IO06		0x31e /* RESET pin */
+			MX93_PAD_GPIO_IO26__GPIO2_IO26		0x31e /* BUSY pin */
+		>;
+	};
+};
+
+&lpspi3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi3>, <&pinctrl_epd_ctrl>;
+	cs-gpios = <&gpio2 8 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	display@0 {
+		compatible = "mayqueen,pixpaper";
+		reg = <0>;
+		spi-max-frequency = <1000000>;
+		reset-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		dc-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
+		busy-gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
+	};
+};
-- 
2.43.0

