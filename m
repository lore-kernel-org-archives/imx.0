Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B963563E5
	for <imx@lists.linux.dev>; Thu, 29 Jan 2026 02:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769653765; cv=none; b=PnjdZeTlKtIW6DijPZJmrAiB/w6MYYy8MtVSbe5g+KDr2hbrM0I75QkwlpKhM4scMy6+N/o+uz8JSuWQOWCIIaK8M+erUekY9KB6OY9FgBfzfDJP/yCuBs6HcL/6CnGTIN5MCtUrRLA6kvdFV2Zyqw85Z7RZQlLNDYiyVPPK/10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769653765; c=relaxed/simple;
	bh=Ux4yXdcrD7sWaWrJxWfS5yeD2Dtq6BEm/InYgyeESXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AHirV/KrtojyjpCc9zmL/dv9EmQmzbAubYXBEtGbpZ08LmQ8XXnlGpv70HUuJHtXX0hQerKoBfz+F9lPn2lE+gPlopqu3upkP5XmGKm7wpHGIFbllz7x1VXDXm/DD2BzJT6w5xjcTG92+E6AcPO3C6YyAGP37itGjwUZtMeGx80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TdPRDmrW; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TdPRDmrW"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3532aa9a77eso201880a91.0
        for <imx@lists.linux.dev>; Wed, 28 Jan 2026 18:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769653763; x=1770258563; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jyw7q0/YQsMTgrYvASBDoKvdAbxjjEM7hz6Ka6xcckU=;
        b=TdPRDmrWY+8jMaQOGsILhzP+17HA3HkEACKfdW/x3qDJmNs+q1sSHzWn5zbzzkRm+k
         QSXeXYdvpv3ZBLkxNQOigqC0g8s4LFNf/bMkS+M/88sH2hfpvbG6sYy8bDQ9NYrfRBPz
         m8tRSWLNYRtlvt6rg3AkXrKXXLdVC+AEIZ9xAlXj+xvVKTeoYbzx0zLu6MzIIuzPW9yt
         fgW5dVhU31AwAlMD5FmAcYoFp5HH6nbcCCDKROx12X0lSKc1W342twxmmtytB0x/zKpj
         3x0M7cHJPhCnsb79HNgwBjLwG/4ttSK6dktl1S/rEwQWuTOYI6Y3SfAmQJNVyDiisbaO
         TdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769653763; x=1770258563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jyw7q0/YQsMTgrYvASBDoKvdAbxjjEM7hz6Ka6xcckU=;
        b=Six9tscz8jSaFQ0G1ruUm+pu1r386QlnbpoXeNW7GIviQGvuppqn0kx3RTPYHgrDYN
         AxtJfwKqwIfmAzrIGeBQo77QyUKvj1RMZv4Cpm5SW+ad/lnPBZd3nSppXYHqdyHF+DOj
         ZnPM6JS//nz3OO9ldRnDdTFXIeqRwsVnUQzQvX+bFIin8ljGrOnO7w5N3VNlnOVgTld4
         4d4+6jF6Llur/u0k1zfSD52fmVVPia9rWDfh5zM+zkYr0M4ca5scW1f6pEBdO83s6W4q
         UnwmTtChQJdwy43bN3cQsRZLoqUywDODa+zRLIJZu7NFm8lBBdA9DKqjcXdGC6HL2s5g
         R6aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEFS3fNOIydaZzmGboPNMs9LeUq/rGDJISRwoxxi+Y6g00USPscGxO6grvtWiPlRPRgyY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3tWVImRbxz7+S+CmLhsXVn1tZ1dlnve1/bms3aO6Ptnls8Yk+
	QF300TJT3VnoNJuIoqaT+exhteHos3TwUZUAhpAPNoH+7UvdgtiHhPvi
X-Gm-Gg: AZuq6aIkgec2CF8bDBpTm5LfpH3WNQ6GPc7wlhC1SFAudZGfPlCH7sWaZD2+X63i8wD
	3pY+8mU19qbp4ozDca5vwQktgrCdNgEFrOUJfSofekiTDkyoSim1e3yXP6wuMiL/dh9SbKYBi6C
	O8iKWr2D+WR1zPgrmCsh6upHchp+8w0rueE00FU/VJXZAgxFhZL5rzUsxjQ1s26ajUOipN1KPxv
	9kOuWk8utpqqsSz7H8KIMyC37jSbV6W+mFHN16MZBNmUzfIO4M/a0VCyy3rvRl4rFrTaXa0LbOB
	cfQ1Yiqne0CPZX8SQhJ9Ack9sm7OoioeA5WrvbAc4KXDEfy2/JIHH2zZet/xfvHGiDGKD1vltRr
	35qxb4euMJX7XBLwxCNLdUUhtJp6ulR4RgO4FpKrmuQB0ibkYpLuCVc0bygU/SQay57KV9CuAlN
	3m1b2UY7fDG0Xjo/knnSqBNz67vYWgoyjgPYcynVpdp/8oms7K9gnJ1s4=
X-Received: by 2002:a17:90b:1d48:b0:32e:a8b7:e9c with SMTP id 98e67ed59e1d1-353fed8ac13mr6667239a91.29.1769653763199;
        Wed, 28 Jan 2026 18:29:23 -0800 (PST)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f2f0283sm4380542a91.5.2026.01.28.18.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 18:29:22 -0800 (PST)
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
Subject: [PATCH v4 1/1] arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM
Date: Thu, 29 Jan 2026 10:29:10 +0800
Message-ID: <20260129022910.3942028-2-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129022910.3942028-1-onlywig@gmail.com>
References: <20260129022910.3942028-1-onlywig@gmail.com>
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
 .../freescale/imx93-11x11-frdm-pixpaper.dtso  | 50 +++++++++++++++++++
 2 files changed, 54 insertions(+)
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
index 000000000000..5fee27a589b5
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
+		spi-max-frequency = <5000000>;
+		reset-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		dc-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
+		busy-gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
+	};
+};
-- 
2.43.0

