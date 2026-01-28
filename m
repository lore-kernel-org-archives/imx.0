Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4AE2874FA
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 05:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769576764; cv=none; b=pwpL5nyHIta89+WeseoZhDt2RhLYzU6PYehi8MghZLs4TMgQ+4/mXc4ATcwNJuSVcbJ9gM76ThcF75vTDDT7xZ1Xw4di+Ihp9Wi4DCBSKFycZCiDxMuXW5DsQ/PQk++9WShFJQhp5Fhdvilr6qk/yCbJ7d/j2yc0y/qTW0mjAlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769576764; c=relaxed/simple;
	bh=oVvyqYd4qWPHGv5pGoRjzKPFmVfR/DQ8l8BxnYcGVUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q1vZS8KeHIMTv7kVkIvxyfqJ9033sC15Tk772Z2ZthTyMpCeZDZECSr1Wf6RWJR2V5GTsKMv4FHcALhYxW3FsN5CJI8M03HiMt7/Ez5dksUMmeH3CeFZMSL42HumC5BZVZhM+CuTRGfta9iur9iMSbcjvXRt5ke2RCM9hbmz124=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLguAcel; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLguAcel"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a871c8b171so9456835ad.3
        for <imx@lists.linux.dev>; Tue, 27 Jan 2026 21:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769576763; x=1770181563; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sK4p8AbcNLvlqa+RZXsOEdBM7mQdQ2CRB4EPV5C/zSw=;
        b=VLguAcelbCFBJaGCEhzb0qhQaOh+PJtBWl6PiuaCorOsS4hEV+Z0KMw6PqMEYE/8+9
         QgWOPUepizirIZFrVghuhBTUbcB2CA30vQaIjZ6PnqZfZwdUXMBao32Cjs+Q3gkoVHEW
         6Hgchp8jjPXPpeGJoXr9lgsr02lI1y2twSNgwjgdP062meWZ/w5aGzs10LyxaEVTqdnP
         sp5FVSAXHB/W1Ey1cP1y/egaCsOeONKU/4HscrZXujFPI80yXhH3meiMs23mKBuyuUdY
         4Tq7NbAIJnu8Cd/3SbaLVSQbvJz2tmBLV62GO6PGhpI8qhs5LdzjeQa8U88a1zNeBkEw
         td8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769576763; x=1770181563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sK4p8AbcNLvlqa+RZXsOEdBM7mQdQ2CRB4EPV5C/zSw=;
        b=In0m9/s/V8lmbTjoX5Kbqla3k6Hv9xFfaflL15gDbYVveX57u3pkw8tmb46oxekdHB
         JXjDIZOKkuYATaGZiC89/rAMxk2kz4nhuCrpvMxW/c4z//VN2WRdTCj4N52ma1BIry5q
         H01blrRPAUZfBrk0mFLRBP6fafOYLt8RXewybP4ZhIPklKtOsnRgaAyAf1WesF8hqMTK
         LFySxDW4wYX/1AN49581Qp/CJtsY/Cxo8BYCgFjxgND+pOyYq74C5ajj1YODkNDyiAU+
         v0klY2vK7MiGlipnTbld5sRWNJr97J97Z/b6SNkA3QQnjn2uwM8+Jil2+YJDkw42REYl
         3Iww==
X-Forwarded-Encrypted: i=1; AJvYcCUAhRXga9zDmSaIh1cotR+BURfbTT0rc+ZKMnYzMr5vn5sZT9k3LUEWsQaA1i79qWZVhsw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXW3qXUiyRIGLbGOqOGt0n2PsJL1oY3HhVKMBOlFgO/i8bhLEp
	8kbAsGQtb1wuYtbyICNM1AYrUk0SqLIG4TL3wDId9Yq88XZCipnTlFK9
X-Gm-Gg: AZuq6aKqMwsJu8KbfT3T5S4BSRlrL5SBsJ0b+96mLsCzhB2mtO/6aRkDieTbfbBi0XO
	fczM8dl9aCAhq2eth5AAY98jd3PzSc7Jtbbexy6Qrm+L3uFYYiG2vWCz/V1iQjurvR3qRXnDsfE
	phzf8CUwDG7SwQlhVrYDnP7yAYGy5FwxI8wo5muqyiEtthhYGiM3nUY311I34+lcnISGkazceJD
	oeL7CZ0fB+p7tUcCS6W4SsKWCS4DL3AdmVDXvVds9UjKDnRujLLFzwU2NdUhWh2kVzU5vZiCJGs
	G2JzsdXGBAPfNYEEBBJbMCLveVdNoZZn3wxsSjc+n2BN7ESLAiZHG0oX/6H/71rd6537aufZI3T
	v3/aJHcoom5cStAqkyrWvAyBx7VV+34syg1GRnn9PpsWLZlHNjXYG0kUuLixeZ9CpQKmSUA7p0S
	bncX8jL2Ho+yYOjaMopnDtFLgOuyRQYKPYWBMwAH846D0kz6049yGgKCg=
X-Received: by 2002:a17:902:e808:b0:295:24ab:fb06 with SMTP id d9443c01a7336-2a870d645ecmr37710295ad.22.1769576762557;
        Tue, 27 Jan 2026 21:06:02 -0800 (PST)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3ee952sm9736025ad.14.2026.01.27.21.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 21:06:02 -0800 (PST)
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
Subject: [PATCH v2 1/1] arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM
Date: Wed, 28 Jan 2026 13:05:49 +0800
Message-ID: <20260128050549.3337279-2-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128050549.3337279-1-onlywig@gmail.com>
References: <20260127025740.2601841-1-onlywig@gmail.com>
 <20260128050549.3337279-1-onlywig@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index 000000000000..1111503b08af
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

