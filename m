Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F89260569
	for <imx@lists.linux.dev>; Mon, 14 Jul 2025 15:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752506090; cv=none; b=FUOmiobipUQtF91xo5Jm0bW7aSStykPNnEgMPuLjU9G7jlSLKU6ZI6qDw+Tc0Epp8IEeUR3itREkmyyP+lgWmmyJKbtZyCBrIkTHQm0kyzvceHJIuW0kGxBRh9/r5QXcntUOF+1h2EXwhp9k0+JrLMshKC9C57SneUMrSJ1NdB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752506090; c=relaxed/simple;
	bh=REUBT2XvKcDY3YC6MdDeukEJT67Rl4GIi5UkMsK2Ais=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AFNZ8C1+7MQ4VbcqDtQUlF9JPncvN9UXkir3EnvmLQa16MS6wlwmwqqZtcRvYhGKejDrBly0cAeXrP/z81S/O/9t3T9CB/EtGzw65W4VYLJqXNFx2V1mHHIDgScq91yCvLatY4pG5wi8Qmw58md7WoYutNPB9aOSs+4jUoKE6i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GXtzVcuv; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXtzVcuv"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so9579247a12.0
        for <imx@lists.linux.dev>; Mon, 14 Jul 2025 08:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752506087; x=1753110887; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwBMlHHy2zuqqOIt3wM/gII1DkI956IRm4le60WaIXc=;
        b=GXtzVcuv/oBRFUkjskkgEbfYRywZ14+hnBv0tTcI42UtQVlCh5z03mvM3cf6zypoU9
         9+Bq6dh4tlotVQXtNUI4sXLVaXk+hmpRjQ7HliNifHzVDqEHpJprd7Ou/poOhjNsncg5
         77Fu4NLYsQFSlv2y04V7qXpXL2bZEL9fGJJeFCaYiOTiaxEE2EWXHjohJVZojtmUaUgp
         ZHVH4MLlc0rQ3pkKtXBSS2ljkKNW1sXKOpZ7pU1kOkrvki4/ZkcRTQr4Lxgs3Du16vSZ
         7NAtWwzK+hAmChoa+uNjgKm8sNAmiez3O4r/W1GvE6bNva9bLip+u+I/3lBTvILi1kIn
         jxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752506087; x=1753110887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwBMlHHy2zuqqOIt3wM/gII1DkI956IRm4le60WaIXc=;
        b=Q0G8MWSVOPlqr5EjsYMVl+qfkph93DVl5pPEBhW8Y+m6MNORy/jdlInfaXEOTBFipr
         Ng3Fu9FnpzAKPddbPvD8qJyEc2KPFHf2bqiURv52pBLm+zAkaaThATm4xoS/N18u7ptH
         voIcsZ/pZ3PGGL37OttEfrjeMtGmG/f8Pw3AhKHUGFPbcad7TKENKP98ICLNN5V2yFfm
         F/QAHOjaeFBnci+fc8qqiUtOJxJMy78tsAPF+xYSQEpv4PvxmLUcDm76Hp6h0bgO3uAY
         c4z+yWEfIkuMkcVU1Pv3JGBBF3JszCDgNWNP2GtM17s5TgAXzbaBNjVK0QVOf/d2jJgH
         kGRw==
X-Forwarded-Encrypted: i=1; AJvYcCXtd55pUxSlx69hr4QJ730JzJiqUN+q5fyx/Fmlpx08Dav4RrlRiWgAqOapnqQn2ArKpVs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3yWbZOCAQCEQKbakyqj6U50m3Xegj5cmlUG6R0fXnx4J2hzel
	WxPaF7S+ls34h0CjlEUNUbbRiGhTiNnFaRdprXCAedHyaFraMZhVq/iF/dDS+Q==
X-Gm-Gg: ASbGncv6BN7Md975KVC2qrxqUBZuhb3b3x/6PHvg98TIJaUt+U8ti9xdg54p27NYNxp
	UZJOkFoi0UtTdKWxxvaqCpSM+FysjljpG5EHL1I9DCIeM8DDTim7Tnvia6fy3z2WI5tY5oXXEri
	UF2HhXZvwFq7bnT9yitQCnJSrnVj7HvdfoEMHp1trvtzd9OEGw9WMQ4pwUWJywOSHIhh/Zbzbck
	XiTGHkkvyDiwmWeYQewqFWdJ5GY3/I44JkvFgVI/M5lukTkI/6G6VtDOZNrXilq0nCrInvjdOoM
	3Fvdvg7DCjc2XXvebve5tSK5BbeiJJCCRfxw9Wj3PrR0ksTowwD3f02QKNHgjV6Qk850MYMlUtP
	1A0d3mUy4GnXWRdndOnYMZEsOwiP2OX5ZNldb+XJp9O3BiuyKVqlkOfmz7VjVyYTCtzY=
X-Google-Smtp-Source: AGHT+IHIMKnTNpqJDxY3v0bo2WYrU4HSwD3uCw03bQshJpV99EtaA9dPr7btQW2fPifZaqFAm2Ao2A==
X-Received: by 2002:a17:907:9604:b0:ad8:942b:1d53 with SMTP id a640c23a62f3a-ae6e2540128mr1509141166b.27.1752506086795;
        Mon, 14 Jul 2025 08:14:46 -0700 (PDT)
Received: from playground.localdomain ([92.120.5.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7eec2b1sm847701266b.68.2025.07.14.08.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 08:14:46 -0700 (PDT)
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
Subject: [PATCH v4 2/2] arm64: dts: imx: add dts for the imx8ulp evk9 board
Date: Mon, 14 Jul 2025 11:13:46 -0400
Message-Id: <20250714151346.7575-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714151346.7575-1-laurentiumihalcea111@gmail.com>
References: <20250714151346.7575-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DTS for the i.MX8ULP EVK9 board. Some notable differences from the
i.MX8ULP EVK board include:

	1) M.2 header uses SAI6 instead of SAI5.
	2) Ethernet transceiver chip (KSZ8081RNB) uses different pads.
	3) USB0 ID/OC signals are tied to different pads.
	4) USB1 ID/OC signals are tied to different pads.
	5) EVK9 board integrates the 9.4x9.4mm SoC package, while
	the EVK board integrates the 15x15mm package.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../boot/dts/freescale/imx8ulp-9x9-evk.dts    | 69 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 23535ed47631..cbcabdfb324c 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -332,6 +332,7 @@ dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-csi.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
 
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

