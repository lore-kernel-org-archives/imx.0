Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A112E4277
	for <imx@lists.linux.dev>; Fri, 27 Jun 2025 14:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034449; cv=none; b=HKmjVHRUsTQexqgJgOzIWuDPOHk6eiACnpweKri/s6VC2itLy36WJQuIQep4nOEXk4FmxHoyaY31FJ8d0WdtnU9AN85gV7JqcUup1nR/ogMzRXww6uZ1xUAYahChZY1HgrGLzdX5RAf37vLeG8YjYtrFMGQXPLUt5f84mKm6MXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034449; c=relaxed/simple;
	bh=ieVn41evUKiucK5EdElW+dWxbLMSlux0+pszLx9BUik=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S6kEcdd6KIH36Wtpp00uXhqL1FwNmuI9WXpQ0rg5FoXCHvakEaegvtl5xUhq3JKqFBK/mkwC40nGQBatOI/mBxPpadYgSK9+l3qO6IsWpcL9zv+ljkDQ/9mJ1evu8f0l81JACbWpJ5kscuWugI2NYlLut8PzGW6Wldc2BkCZIow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2Bu/GsQ; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2Bu/GsQ"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so4033892a12.2
        for <imx@lists.linux.dev>; Fri, 27 Jun 2025 07:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751034446; x=1751639246; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PY79EKzRYcaTfBmkEn1plelmE3wgG6iSvl/aBwK6Y9E=;
        b=U2Bu/GsQIxwHs5VUkIRSFWwCnSXxdvWJZ97amDhRJyKKz73Piu0AO/+Qtw61jXtZWJ
         Tq+vTWU4AO5xuCtCjQj3S863/+vOgEMfiuNTVOG8rEuFlo5fb55YAXxt2VUY82hfNuLq
         L8jZ8K2lSu+BJlPsT6Sk9F6sXVKtEp9T8pRysTnzYv6gDsH8oGnpAKBePOD0fK/snM99
         WrSl4A7+reUUxQJDd98UH7AW+5VBCjKunaANRLAsTT1ZOmFA9KBv+tXLa5rz2SJ0B8Kz
         aIwvXcC/HQkIUU6sSQmLsVxEZemUcJSNbK/UpRlqxu9uYER9SasmHEI0OQ0EK70Ol14S
         Bscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034446; x=1751639246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PY79EKzRYcaTfBmkEn1plelmE3wgG6iSvl/aBwK6Y9E=;
        b=hSw9dmpdmMqoPSCfV1cPx3+4zSBE9mtz+/LKaX63kMto9QiAbXjsabFrRss5hbBoUX
         HuekhU7bq7yvcMpHEsg0WVLfbDVuLbgdKMwgEKojNwY6Y7z98sV6Ngc357FHQDwxXhRh
         kw68NTDEIUUm7FCLEJtc0Kb4+DZMWacipLpKKBx0uPuumI/Be/LOkpcSPC48YNeZeFQK
         KQf6q0R7XLPBcfQkmRLrO+PyU615/vCO53Q2yawguB+lFodkjGBcIDrQ81WMFCzlGR2m
         riRtV5vhZnf5IjwqO0ZhjPt+GX6umnDG51Mjf16EIUlt8wm5vdmwZx7o5XQOioz3xRBy
         +rhg==
X-Forwarded-Encrypted: i=1; AJvYcCWUCKvhIuU+iFcq7n0kMlH/699qKB0eto1wCX+0gH61BO/nx3ESptU/ESjtRqgG6xyTj3M=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeU92Auh8ogu2f/SQL4Rk/KQuKYO1y4MNx2Ssy/qHQGLHJr63z
	cY7Tu01OZUxeEFayCGp7TyUApV3QnVDf7lJKY8K/1hKIvKCsWljqXkLNNfSzEQ==
X-Gm-Gg: ASbGncsjiKW1qjJ5AbMe0/+6Agw9LZ5lvTNOecrzBecGSPWrXRuTXMm0pTuu0plI5xY
	5c5kOg1iXG+lWD+wm1+8MDgoa0oz9nvCBdeYcowQASOXqj4HWbmdjtx2dUZIOVAW5KRlJl47VUj
	Gd+j5tDozfKe1ZK8RXIpW6wTgwkpF9zIkAWtMfjwkOXqRtvBhTrrQhRyfnNtlqsSM7cw5Gxnafr
	+dMFY16OCjXffsetRuyprkEI+Uq5uNs9VOLSfEw0e5cot4LTY/JqAD3eWzF+TE03F6ewtjzRZeY
	ssUVVQA5VqUoPeZQqJmUXo1i9e4FdiKwXfECxE7FqWnz2j4HsTl2hWdqHx+vgfsHcvluldGD4no
	kmB2R/KI7OuRJQ6qF8PDkDImInPEM2Nogdw==
X-Google-Smtp-Source: AGHT+IFnOD06HjYEqKm1S8KuPS4M3Ez8CyJAs1iLSJ2WT8T4Kt7o/r+8yNxZapY+lwfOAyqb7QEm3A==
X-Received: by 2002:a17:907:961a:b0:ad8:9257:571c with SMTP id a640c23a62f3a-ae34fd6c852mr358792166b.20.1751034446217;
        Fri, 27 Jun 2025 07:27:26 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35e2dafcbsm98925366b.116.2025.06.27.07.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:27:25 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: imx: add dts for the imx8ulp evk9 board
Date: Fri, 27 Jun 2025 10:26:45 -0400
Message-Id: <20250627142645.134256-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627142645.134256-1-laurentiumihalcea111@gmail.com>
References: <20250627142645.134256-1-laurentiumihalcea111@gmail.com>
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
 .../boot/dts/freescale/imx8ulp-9x9-evk.dts    | 69 +++++++++++++++++++
 2 files changed, 70 insertions(+)
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
index 000000000000..5497e3d78136
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
@@ -0,0 +1,69 @@
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
+	compatible = "fsl,imx8ulp-9x9-evk", "fsl,imx8ulp";
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
+		MX8ULP_PAD_PTE16__USB0_ID		0x10003
+		MX8ULP_PAD_PTE18__USB0_OC		0x10003
+	>;
+};
+
+&pinctrl_usb2 {
+	fsl,pins = <
+		MX8ULP_PAD_PTD23__USB1_ID		0x10003
+		MX8ULP_PAD_PTE20__USB1_OC		0x10003
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

