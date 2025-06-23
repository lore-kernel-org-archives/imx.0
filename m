Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D4D25E465
	for <imx@lists.linux.dev>; Mon, 23 Jun 2025 15:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690979; cv=none; b=esjk8LA/6oLI7W8Ui7V5ZylMPiCpBXp+XO8aKGU0rvDqMzpVeqJaq7BTxbSAWB/y7y+roH5OwRQnbehatgsWbHHm0W0d3PU40qFlEdWT/WONxCeI0+zFJl1YRV2flTs1AkFnW4jJHC4qz6bATqgRMMtjJzx5TKjCh29lpdDYk6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690979; c=relaxed/simple;
	bh=FOJL2OjNMuhW48vZHtKj3F+xZx3Pxs2POJzYR2rhh/c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QyK/bEKqHdaDkWtKpdPmbqx0073dAD0JB/a9axVNaRl7atkmcWOCFhFo7UVZUnLoVxaR4ca34NNbkzMULCGzuciezqC1nRVQ/qKl3mNRPM94wFm9wzHEajUNcu9byBkd5ixiJHq+FpY5V/hDWoPLYQeNuXetZjrupiJI0UhcGDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C4RX8J+g; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C4RX8J+g"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae0a420431bso29315866b.2
        for <imx@lists.linux.dev>; Mon, 23 Jun 2025 08:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750690976; x=1751295776; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8DVcSJ/dvopLv561u5ZgnhDKEYiQSLuZjoUf/lGc7y8=;
        b=C4RX8J+gmxR63lins4cYjBY1d3xyxlWi7C+UIMtg4M9lpIjcxKeN0nOP+wH33wchbI
         4r4lnIevxKNee78vLlna+LrzLOjZSmkw9zQcSzKz1jaFrVBWrO/piQmWHVZFtge/rpbP
         FWqaJ9FhCzTd997hucsPsrzFIR15qdzJty1vt5lWPInt2OvlAUbRhnXcMseD5xbVu5w7
         qHGMxNyq7BN7fRkiFTnkXBilbiyQZgU6tvY3M60nJ2BntVJiG4tCZrDjUwkeoimAokMF
         TwGHmt9sqRLAU5I4iWp/VUYzdRJciZt3ngtmjx1pWJr6HlFK+UphIqb3UkdSaSOARg21
         YvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690976; x=1751295776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DVcSJ/dvopLv561u5ZgnhDKEYiQSLuZjoUf/lGc7y8=;
        b=KP0k9/KMfgG+QiZvKi4epwKSyvtzIKXQfdfPp3G3qVB4hgcC6GitwiIf9m4/52eoyb
         281P/j8IpXtLcsIAXwVCvsvm3rJxG3bQOHTaPeRQd5L2IerDhyH842k5tz4OLoJfcwqA
         LHS16jooHiMcZEcfof2PJqDBe44FoXGXAhsne5GXd9NUfWSuwOlAV/c1qh7jLlG+mlSC
         uYznXdzPZPca0yAS4hRK+4hkKI4BOBHUUdlUJ0QsDU06F1ZvfI8Ysllf4w7IbiuO8ycX
         hRoCNZwrs9LjplDM5Chz/Cgdu8ZXzSDUoClaf2n5A5iP5GPR4zy/a1n2I8ZmUqKASZtu
         98yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNIELIS1aeVhJ6OR61kTdQL6HhmqyUg7tqZHc5In2v5n/d9JaM3kQ50hHVBLKLYrUSTIA=@lists.linux.dev
X-Gm-Message-State: AOJu0YznG2qSCDplIJqZj1ry9ecEkbaWE+UAfUGgcFs0i1zcLDkMxv+l
	vHuZP59LpbFjh9YWrTyZBZR6Cq1usTqAyFzL+Y2On2pbIaXyLsOdyQ/I
X-Gm-Gg: ASbGncuiRvF3JDqNeW1Iz5fOiGD72odbHIr1G2G/zs6mTQQibE70ceWxHY1HqtbELxH
	5KfICY+QjM5YnfhR3+p4RgDnlt/DRaTDawClXYkkkIP2aFoLVF/cy0vtGHLZjKOjuZuIt9A4bgy
	NxAON2ENTq42nfsSrZGW35s2WUtyOuMtr3k7Ol11SpZNs3q2BSU/kojRgXgJAm9DNxvRvn92nC7
	wXR54Cp8ws5GMrO8pCsTgZYfslIZ1YTNi2yRvXwF09cEjIIPK31Lj5IRubmOLxd0ah03pDoMOVE
	xQmg6nnT403MHmRtzWdl3TVSZs3Gx16f7ACAp7uycMM3bhW1M16t5H9GRWYeb5jTcXqGNgeYUoP
	K2QjJU4bVUk4D1xYZiCtiiM8=
X-Google-Smtp-Source: AGHT+IFSO4725zW0tfiRfFFvsoN+L2INX8CRqzWeVA5SH7DGUv0pCu2PupV+KgzNzAz1wlydHfE6zg==
X-Received: by 2002:a17:907:1b1b:b0:ad8:a935:b8eb with SMTP id a640c23a62f3a-ae0579d1abemr1091515466b.3.1750690975318;
        Mon, 23 Jun 2025 08:02:55 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209ad2sm732870766b.148.2025.06.23.08.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:02:54 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx: add dts for the imx8ulp evk9 board
Date: Mon, 23 Jun 2025 11:01:46 -0400
Message-Id: <20250623150146.1398044-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DTS for the i.MX8ULP EVK9 board.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../boot/dts/freescale/imx8ulp-9x9-evk.dts    | 68 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 4da7501ece17..4b288b324d38 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -322,6 +322,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
 
 imx93-9x9-qsb-i3c-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-i3c.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
new file mode 100644
index 000000000000..c610ec9aa30e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+/dts-v1/;
+
+#include "imx8ulp-evk.dts"
+
+/ {
+	model = "NXP i.MX8ULP EVK9";
+};
+
+&btcpu {
+	sound-dai = <&sai6>;
+};
+
+&iomuxc1 {
+	pinctrl_sai6: sai6grp {
+		fsl,pins = <
+			MX8ULP_PAD_PTE10__I2S6_TX_BCLK  0x43
+			MX8ULP_PAD_PTE11__I2S6_TX_FS    0x43
+			MX8ULP_PAD_PTE14__I2S6_TXD2     0x43
+			MX8ULP_PAD_PTE6__I2S6_RXD0      0x43
+		>;
+	};
+};
+
+&pinctrl_enet {
+	fsl,pins = <
+		MX8ULP_PAD_PTF9__ENET0_MDC		0x43
+		MX8ULP_PAD_PTF8__ENET0_MDIO             0x43
+		MX8ULP_PAD_PTF5__ENET0_RXER             0x43
+		MX8ULP_PAD_PTF6__ENET0_CRS_DV           0x43
+		MX8ULP_PAD_PTF1__ENET0_RXD0             0x43
+		MX8ULP_PAD_PTF0__ENET0_RXD1             0x43
+		MX8ULP_PAD_PTF4__ENET0_TXEN             0x43
+		MX8ULP_PAD_PTF3__ENET0_TXD0             0x43
+		MX8ULP_PAD_PTF2__ENET0_TXD1             0x43
+		MX8ULP_PAD_PTF7__ENET0_REFCLK           0x43
+		MX8ULP_PAD_PTF10__ENET0_1588_CLKIN      0x43
+	>;
+};
+
+&pinctrl_usb1 {
+	fsl,pins = <
+		MX8ULP_PAD_PTE16__USB0_ID       0x10003
+		MX8ULP_PAD_PTE18__USB0_OC       0x10003
+	>;
+};
+
+&pinctrl_usb2 {
+	fsl,pins = <
+		MX8ULP_PAD_PTD23__USB1_ID       0x10003
+		MX8ULP_PAD_PTE20__USB1_OC       0x10003
+	>;
+};
+
+&sai6 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_sai6>;
+	pinctrl-1 = <&pinctrl_sai6>;
+	assigned-clocks = <&cgc1 IMX8ULP_CLK_SPLL3_PFD1_DIV1>, <&cgc2 IMX8ULP_CLK_SAI6_SEL>;
+	assigned-clock-parents = <0>, <&cgc1 IMX8ULP_CLK_SPLL3_PFD1_DIV1>;
+	assigned-clock-rates = <12288000>;
+	fsl,dataline = <1 0x01 0x04>;
+	status = "okay";
+};
-- 
2.34.1

