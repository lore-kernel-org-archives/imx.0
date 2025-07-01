Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D348A7260D
	for <imx@lists.linux.dev>; Tue,  1 Jul 2025 00:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751329454; cv=none; b=E0wJM77b7RqWeUehLVKfGmsqGZa9z3ZHoZGxMWyUdM0Ci/ZsyM+gul9cmtJHSMEOA07APV0m0aNCSzbSjss5J8O9yZUsAX3vrSuy8IFQcXzrIcuIP1UR+y0MvyLr5mABjb8kzT/EEj+ldLd9vUPb3DqBBzav2wd0WwrbAvLkv5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751329454; c=relaxed/simple;
	bh=ieVn41evUKiucK5EdElW+dWxbLMSlux0+pszLx9BUik=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FNm6rIbRMj4wtEptfiJN22kKoMge0nqiJVwRiWNiVMp9RjR3y3yreLZei71vJQpgqG/D1B9sVWhLv0GggwqafhbahOSsgYWZI8eg41Jui172RyQb2eFH3or2WyqjwZRVksvTfVz95Xlb7tR2ko0lKWg0C2/coTNy4yvM1WNm5CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZlhNydq; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZlhNydq"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60c4521ae2cso9183464a12.0
        for <imx@lists.linux.dev>; Mon, 30 Jun 2025 17:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751329451; x=1751934251; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PY79EKzRYcaTfBmkEn1plelmE3wgG6iSvl/aBwK6Y9E=;
        b=gZlhNydqQ0fFzsCSvCIHf2kaboSXIGnHUOpNRDsKH9OujHYj53inDESt1hzzYk+b+L
         tK/LeFa4PBfSJu8/Rc7SGFmpMWh/ogSgqsrDeFpZw2hVgYLAVtgfQ2dVHeS6JtU5IvTZ
         HJ1wopbvh/pTuek1WXAQzqtjV6DR0weDPW/x8G4eHFeR72ZLBid+WdxBHWKkYwUjed4B
         j190QQph+ozrcLKKz7t4nwEzYFVYSSOCeRUZvISzD2T9vcYBDj4jVfCYJjewfOcWd4Br
         Ddr5JC3MiWa9m+ytxm5MwVLhLusjDPPEHrrrA2kXWXwyoZZLMe0O+EplqUZZdJ7lixg4
         PdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751329451; x=1751934251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PY79EKzRYcaTfBmkEn1plelmE3wgG6iSvl/aBwK6Y9E=;
        b=bqAcfi83ThJcJKV/5y7zuH2gPyR9xlZryLO7kVjmZHfg3bA9EmvOGpmnTR9+NGY33b
         pLaEfA+BVj/uu5gCnjb4TVPTlr/lTGE7ts1vJ1p4VkCua6QDGi83nw0kTvVe5Vofv5Bx
         bSpA8ydnRarqyK3wU6N3Cn0wAkurHtQMRpWEUPcCMvbj6GTAqTtJRpZKL9Bm7XFMzXr7
         tV2ys8O6yQrezy3WJc7YXDhuxTbBjJCnwpMTzWjEqegHBDqlB/vABRIc1gEKy/HOjqzw
         iAui0LUClt+8aeg7uNYQI4v/mIcYDWXTRhHp+JZmu/Z2KDukxnD5LFrC4swpGodDj1gg
         H2Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXxfOPt+WSYSpPD5spZmRzLbOcuZ9OgStVAovNXqXMxdJ+biX5ojv07FjAxmlOMOQhxQWk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyANSogb4aWEGN5/XAASU86uJvq01eqe0psiOHmIUdSL+w9n301
	eQp934VCCtfWakaJFn2jF8oFD0kStPQFJpKwp4dVea0IzzULno3kk4+k
X-Gm-Gg: ASbGncsDegMMVGpFJQ+BkMAOm1Oto/b9s0CqC3aoNrI0IGcWCwmHECulamMYoPsDluU
	ckFjMgpjrESy8+UPz9XYvRIA4Ai+SWR15ww65Xi3lRokms5LkeW57HnETTrl639CuqWM+6ojUG0
	Yr2ot+gmIZG6+omcds6V+HhQJASwKhQ5f4wbTYIv0jaQgEo7oBYx0KO+/L53x154TO48SqM3ncR
	tAQD8oOH/yq3PGV5dqRtIWsux3xHxiUUxIXDqLA/f+tyGcmlPJfeBiu4kxrITWk746itcWdZwRl
	ouZihtCoSPltJ4p5wldBUfnxbCqvyv/0lCZOyQbJbKE/OPLamS6F01eLD4mkOMFG3gJL0F+btkt
	JTRTwMPZ4T6jEIPCbk3ihHC0=
X-Google-Smtp-Source: AGHT+IEAfpopEL8Ya8sEfPn6VusJkqolqPXZlhfkBFbQaxAdvhUnPxryh5fslzeOetzbNMf/U+Ltjg==
X-Received: by 2002:a05:6402:40d5:b0:606:dee2:42df with SMTP id 4fb4d7f45d1cf-60c88ddd2c7mr14791183a12.17.1751329451100;
        Mon, 30 Jun 2025 17:24:11 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60e26b7ac4esm979532a12.7.2025.06.30.17.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 17:24:10 -0700 (PDT)
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
Subject: [PATCH v3 2/2] arm64: dts: imx: add dts for the imx8ulp evk9 board
Date: Mon, 30 Jun 2025 20:22:39 -0400
Message-Id: <20250701002239.972090-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701002239.972090-1-laurentiumihalcea111@gmail.com>
References: <20250701002239.972090-1-laurentiumihalcea111@gmail.com>
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

