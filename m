Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD84342377F
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 09:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330498; cv=none; b=q4XwzXcBK/Ko2OL9MhAqpd7cdrpAAWoMEkotXpTWmxUZCph9r6xr8d8EMlAoSQzH/VM0OCVBAC4wXCmLaAf4B/NdP9veMGlzHdalDFUJnyhj56CCnHvt4CppIl6kt/xYPl2O9pdMJdrCmPeSDfkRysfBOmxB5WbRo+QHgumntuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330498; c=relaxed/simple;
	bh=it0iyHNzGgRXSbIYqOspiD1U5H+0kjcNa5mlHWyzZs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d+hf1Op5ReuPYxt5ooAIxl+Q8ZCx5deyBXhfKU77YyTSFv6RIHqb51a7ehugRhM3VtRuzgvyixYFBOTfd45WBTgVZx9VUq6WTD+GPonQGojV0R+3vscNNPyWAGsvfwKY59PQGrwqVPyUwBAmOgNa1d0k8mSazdAF00XxO07fHuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KbsnTBvu; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KbsnTBvu"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493c83474ddso25780455e9.3
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 02:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330492; x=1783935292; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/2A7YnOroeJEFO5nPIrjvO/9o42R/QUT3pw+IoCgcU=;
        b=KbsnTBvutovXLEIsQH8nvP1tkbqXNig7o8pJauQrYNWfUk7U9T9yV2F0E3D7dTzZkf
         M1v47d6eNcAuamN8r/iIxYh9/c03Gbe719JgkuM8wwoiuacLrwyd7lsCNGxDxfsY6vSi
         lyX1C+Tdc03kpARfqM4JiwGojuW+yBsPXUZLq3DMU9kq43iPnilAgsiokmCSDoxmO8fP
         4k8V2J7opgR1gkKf5RkGdRI5OvkkYxVqpe7okcRF6I/rSleSeZgQtmsIYkS6mPIqDmXf
         Z/uA0genH+dhUgUy0xcXmyunoDVet/ksKxsPIp7GiiLYAhO9r7jHMXYDrHdE/RG9TH02
         /kkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330492; x=1783935292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g/2A7YnOroeJEFO5nPIrjvO/9o42R/QUT3pw+IoCgcU=;
        b=tQ5LvD+u7GLn/QdjuUr+x/zmw0PuWxHne0ES0W6XjjeFZ99erll41CKkKMGs+1A+07
         ihg25Lob+wj3po4Zx/bKb8RTf3l08wVHEIYyOaA/VSGr0Ko/EaGFoBaPeAET+0RF3QCi
         CFE3vhh82ntbfKtaivLH8Jvi37zw2LMvgUnw1htlcFqgH/ziM8qZhqRW1z8vB0EPqJsO
         JGpxgWJH+qAFMw3uG1v8CG7wrdwv99+8/RlxqMXRuKqfsBn5gu3Qunm/5t4C2NZSVZ6v
         W+Ba77+FW8yhLUOBmv+yaTPUd/rViwAhwTzqws2UbG9bWdfg3XrMkv18l18XpKYUql43
         oCTg==
X-Forwarded-Encrypted: i=1; AHgh+RqZafKyrS90I5F/Z7f8WSn2xz4K963eKSnuv2EgFxmVr+QxbIgUpgyPU+v0tVQyEUeHIBM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmWn5IpnqHBu/Rxactm/Lup/VKM+eSUi3xZaR4L08ubehWpqcn
	h6qyu+ZlafLwA/eWfTOVrflsu+C6kGXfOupAnV5m5GRvfO5gr0ihdHVV
X-Gm-Gg: AfdE7ck5rVPYfCoPl3ru0G1oJSsANrIYQqY+8YDmY1UMtu/AxTB+jTq5465ySqFXHP+
	B8ZAJtxYwXxgY/SYusNBTmoEJ8NP+mnq0TK0IPU1cD4tSZqcUvGOti1JVjacI7C0kB1cht+YKk9
	qHbwbNW7mGeOHAiQuIxAMcB5pD75DCch04SRcHstVH7OkE0NlQvWMFJUCMlymJJzEG8ZL3ylXOc
	T31P4qtDjzMhy5vDo4NCDnU4O7jfrZRZUmiEB8VJtPq/k9uI3hhJmN0iUvyLOWBpQxjSfLsx3Ed
	cao75ch2PsQlaxIsQ0tnUEanPqbcq6U98/WXafzRP4XQntE3/qcGX6FQqohWpNmRpE+OFLFEd+8
	KdS0EROSrjCxeaAkbywCamrg4VetrOM5tVW/0i20Q5O4pUOjJsv22CiwyRzjS9V/0wPqlL0eYvH
	SXNj847hiL8zITJ7QRWewDik9xpwajDBYdqUyt2jJQmwCkYhRf0BHCz41B2rQWU/DE87Nc1F8FX
	mdS0MBFAR5IrIFaDDECjbKD8g==
X-Received: by 2002:a05:600d:844f:10b0:493:c1bc:79bd with SMTP id 5b1f17b1804b1-493d11f03acmr74713315e9.20.1783330491864;
        Mon, 06 Jul 2026 02:34:51 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:51 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 01/15] arm64: dts: freescale: imx8mn-var-som: Move UART4 description to Symphony
Date: Mon,  6 Jul 2026 11:34:31 +0200
Message-ID: <3ddf65049a048dc4760df1e8ae5af4d3e91ca77f.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX8MN module does not provide an onboard debug console.
UART4 is routed and exposed only on the Symphony carrier board, while
custom carrier designs may choose to expose a different UART.

Move the UART4 node from the SOM device tree to the
imx8mn-var-som-symphony.dts, keeping the SOM dtsi limited to hardware
present on the module itself.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../dts/freescale/imx8mn-var-som-symphony.dts  | 18 ++++++++++++++++++
 .../boot/dts/freescale/imx8mn-var-som.dtsi     | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 3434b189fa58..b07e71d3adee 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -15,6 +15,10 @@ / {
 	model = "Variscite VAR-SOM-MX8MN Symphony evaluation board";
 	compatible = "variscite,var-som-mx8mn-symphony", "variscite,var-som-mx8mn", "fsl,imx8mn";
 
+	chosen {
+		stdout-path = &uart4;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -171,6 +175,13 @@ &uart3 {
 	status = "okay";
 };
 
+/* Console */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
 &usbotg1 {
 	dr_mode = "otg";
 	hnp-disable;
@@ -234,4 +245,11 @@ MX8MN_IOMUXC_UART3_RXD_UART3_DCE_RX	0x140
 			MX8MN_IOMUXC_UART3_TXD_UART3_DCE_TX	0x140
 		>;
 	};
+
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
+			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
+		>;
+	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index 38ef9e4fdf07..32f101ef2850 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -11,10 +11,6 @@ / {
 	model = "Variscite VAR-SOM-MX8MN module";
 	compatible = "variscite,var-som-mx8mn", "fsl,imx8mn";
 
-	chosen {
-		stdout-path = &uart4;
-	};
-
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0x40000000>;
@@ -274,13 +270,6 @@ &uart2 {
 	status = "okay";
 };
 
-/* Console */
-&uart4 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart4>;
-	status = "okay";
-};
-
 &usbotg1 {
 	dr_mode = "otg";
 	usb-role-switch;
@@ -432,13 +421,6 @@ MX8MN_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B	0x140
 		>;
 	};
 
-	pinctrl_uart4: uart4grp {
-		fsl,pins = <
-			MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
-			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
-		>;
-	};
-
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK		0x190
-- 
2.47.3

