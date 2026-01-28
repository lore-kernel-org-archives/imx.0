Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088BA3054D8
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 15:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769615742; cv=none; b=f1+FbcUf8IkoTUa4tPOdUTfnPTyESpYUJeet9LwPBgkxoOnJvFe2QeUeWWPF0M0alwxj6WX1MJaI2F6zPhI957fXJy/DWdpI5eF8uVnAmI6cRdFJIQD9R4gHHPvJAZQuY4NCSvAAwD1j7VSHwqvEOufH1r3h8rrmtlYf7CoAbGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769615742; c=relaxed/simple;
	bh=jPRhiQfxg8h9GkIArmifPxx4IycN1uG35LhZ2f1Ng3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JqHIlr0HJ0845995l8Kir+WZtdtsp+W6CWe8wNiYPPfd+0oIdcCz5hA8TLrNZjAd9HQ0TjyHu3NAlu9Qswk26v6vCOcoavL6MBBIICbvmmC1XcsUaN6v+2sXwzsyF/PLvUIGXL7seygaX6fVWYjWHWP4VYpJYXrGJoVYa3YBk5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DsnTV3bL; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DsnTV3bL"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-81f5381d168so6455419b3a.2
        for <imx@lists.linux.dev>; Wed, 28 Jan 2026 07:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769615740; x=1770220540; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjUncjcLWPAdsY5AzwGqsgN5nsZqzSUVUhLs3CXNF+s=;
        b=DsnTV3bLFJubT7bOyOSdZTA6WSNYo1OtGjhg8uBof6MIn2gCEiAK56K0laFWKgg/yM
         mEa3UjgvvP9l3kc9RxZ2nxMuqstXzknzveQLmTmt7GqIznuseY/X+nRWPIvtIYfFEMFg
         g/Iayou+EHANrIAiApWMzqdsdN67mC0Pbra4E3wzPE5lZN9/XJWoHLg0XFMHnlwbY1OW
         P6jFKDFVBUXZKUKLTf3j8C1dvFqg7xIoOVyJJW7jFRO2wwtl2FOpW5J2dVieI7o0AKKq
         /4rkthZjmgGztn/5MGVxDqKb2zdQu/xFWt8DsuVRFG/ISVCY3bPl9uxNpw7ni43eB7PE
         cc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769615740; x=1770220540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HjUncjcLWPAdsY5AzwGqsgN5nsZqzSUVUhLs3CXNF+s=;
        b=qWn9HSPNLv5efOm11h/0BPUJavIfAOekADmDR0pD1qffp/E2u54PHPL0UKBKvhPga6
         ZPRj2dYozpib8QGusxNi5DU55be/ppO04IBCWzU+C2FXImK2eSovw1wC+GcDb7XF5TeO
         +N927F2tGtwvpxIfZqVvgyJFWQcvSkRhIiGOd5A5LaqBANJW+pUJXqs4lN0/3caV33su
         jHQoUqEUp3bXDl8hyFGMo3ZxB3/8rXG7ME2tN4Ugy6eOQO7sQiP4qhZJiKhgmkk/7W2l
         TDbTXKTZipgQaJGF5grgRHGen1H4w7Wav9QQtIfTZwnSMm9Ww/9vof2PIxvgovlrB0sQ
         KfKA==
X-Forwarded-Encrypted: i=1; AJvYcCU7AVIBs13yki96TLG60fLEJoa2fMkubcbZJYAtfp6fFvtYv/J/i708e6NLEnhxycBpSsQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YymydcXG3tot7VTRPFh89xjkf+pKnkbg5+SbTr+ixaTu8ch/bzi
	O9p+63Va1QqdD04D9JLEA9Gak3w497DpalT4Gh856BqL6snyAXCtD0Qb
X-Gm-Gg: AZuq6aJEQBMjXp+UID5ZbNhpDOevoVpB1bOhs00GmGtO2yNtANO98OcYO4BKgpqBzKr
	bGzK0Y058/DmSOtIUrPr9KDbuvoSd+Yp7ojbCWknpA2se5iyZVF+tr7pBw28GtmWFPoPMLHdMxt
	IIQ0t56vFG6CN+R+7t0ZHfL9L7FiM6YtoOSzTYuqxVd61jjOA/q2p2jGbdQd/bj+KmUdlXAe/ag
	LXL9mI6b/mjhkRjSr2tgfahfjmNhiNZICQYtIUA7R+DpxTEnPKJyPsnyVg50rrUW50BRMXQnXtj
	KVqKnBmsAUjkXuLUAIBonceWnQ26lgSobe5aJ4NhSd93cLeZ1zLDml4IWamCnwiDtbfVPLvbkH3
	dYTnqYwfeKUrSxDpxwmh+VopmTh64e43SmpTHca2kB344Ipj0L+XRGESUUSxNL8HVfOFMxgp8Fz
	mwp0V53QH3OJun/BmpBaC+x+l6G039ZhAQf3oHb8y+5iCs6VtWMYezINo=
X-Received: by 2002:a05:6a20:3d05:b0:366:14b0:1a2f with SMTP id adf61e73a8af0-38ec655cb7fmr5809916637.61.1769615740386;
        Wed, 28 Jan 2026 07:55:40 -0800 (PST)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6427da845csm2621521a12.12.2026.01.28.07.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 07:55:39 -0800 (PST)
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
Subject: [PATCH v3 1/1] arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM
Date: Wed, 28 Jan 2026 23:55:29 +0800
Message-ID: <20260128155529.3699599-2-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128155529.3699599-1-onlywig@gmail.com>
References: <20260127025740.2601841-1-onlywig@gmail.com>
 <20260128155529.3699599-1-onlywig@gmail.com>
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
    - SPI frequency set to 5MHz for stable operation

Enable Open-EP Community pixpaper-213-c support on NXP i.MX93.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  4 ++
 .../freescale/imx93-11x11-frdm-pixpaper.dtso  | 51 +++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index ce8f937c2315..c2727f8061e2 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -398,6 +398,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
 
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
index 000000000000..a78284c10838
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
@@ -0,0 +1,51 @@
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
+	fsl,spi-num-chipselects = <1>;
+	status = "okay";
+
+	display@0 {
+		compatible = "mayqueen,pixpaper";
+		reg = <0>;
+		spi-max-frequency = <5000000>;
+		reset-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		dc-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
+		busy-gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
+	};
+};
-- 
2.43.0

