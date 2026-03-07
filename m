Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013233A4506
	for <imx@lists.linux.dev>; Sat,  7 Mar 2026 15:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772898933; cv=none; b=AJnbwLNsQk1l2Uxm0bLfPCEYAaSvSxkUCjT5Fsx4m9FlfH4rwkbAuw6A7sVi90jOq2K5EFCsB8aj0oz7ICRuVDKhQC6vFST3fKpyyLQMH4aRK2wngmkAxOT5x62skNKU6JEpIB7nzKD2U5j2EVPUy80DDYUDChUEuJc3DpZPyNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772898933; c=relaxed/simple;
	bh=bQBUFvtahalri30V24Dq6Qe59tCww3BZ3N5QjH/KWkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m0xNjwOOBd/+tZyA+Di3ase8mIq1amKV+iO81UHWC/WntilOIGV0jlRsNn3M9NVpcxhxriyfI7YcIR+NlTy99u50YJssPOZe40YJde7SWPyPu3IexgsEj7MmFlmOEU9u9alzY15RowVtICCqIF4mlw/CeZ9Dpg60iyd5nWAy68U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCthPyCw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCthPyCw"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4852f73d0a3so3518335e9.3
        for <imx@lists.linux.dev>; Sat, 07 Mar 2026 07:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772898923; x=1773503723; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUQBvmWHHGMJHsZAlltCWCeup7blkd+CdmrZNVv2zNU=;
        b=mCthPyCw+XivWzLCyPNE9dbxr1g8bPw/+gFb7JcjqiYT9FnAwRjTJxrMUGczcPrHJ0
         dxkKOzBjychz7hqbufQxY6RwHgwgWDUFWyZcYQ+QELCLnmhnp4q00r7J9wyA+B6he0iR
         lM+z14hvNV3/MbUnTi+6O8J2c7s/i1OZdWkW47EiTjyhdHLdxnK62rP9tWzvM/k7zAj2
         sDXl7d1oDHhFYx8pPfx266iDT2+Aos7burkW6QbWlifLC7JY4JsI85pFdBBglPJ1SEwf
         q+dBoAVhaehYbYdK0YKEZYjEp/TevUssYPJQgLhxpyv306L/xEqGkgRay1eMg89s1/Al
         OCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772898923; x=1773503723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VUQBvmWHHGMJHsZAlltCWCeup7blkd+CdmrZNVv2zNU=;
        b=QJV7T1NVM60WrEKRmS04i1rlofZ+DLrxG6kzA48qBsy/fDuS+c7akD5z5yg+T+EN0w
         1mQ96qNaJYtDYCxjISosJ8DgZLs+2059JpeL8fyX/qJlyiy0jT4/ksBS0N5O8TyHWcVY
         Da8ABUBbgcREwmchLcb0A2E/54sNUp691Uff1CN3FZ4A7nj+KmBhgCvlp5ckvrdpgina
         H+nLKbarMyNYRpK7L/b4a8TTR2PenclyjvKKl7RaELyg8Cr94WlwP2rVZNuNPNM9rahJ
         arM29Hz6yso43DPOExzYqYZRn2DpQWAjw3oES80s3RcjlKtOqwzgXyQR1WpVQHk2kGVK
         kaGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTOySlzLMtlifJjIZMeMz8CNahHS/xImvFanWFx8cbeWg1a851XK2RZ5loccuCdN+5PI8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwasEoF+uUC/Kdcg1r8F5APWutqM4FVxx529iAutamxi9kOFiIF
	/p2gVbDOjzarXB+U8KFLJkF/1MUT4Ca0uD08DpZzQwNfOgzkZPeISJvX
X-Gm-Gg: ATEYQzyKc4n2epz/EMmcGSbgk0kJMMwT1jFhiwn9i+LfV6Xhuw1eEeuwg5R3RsodfRu
	j7ztjZe29jDFzaHNc+ahrH59DEBSNd+/etz79LJWGLjlgeq2UQUuKpWmbNPGiMoOFYEiczYINaR
	4QAJOL3eRlLSBVN5T2bjXYo5ETeBYDLeSB31TwH9e+UggFebZlUKS8QowJB+FgAlbqS3/4+GGw7
	LQseweshJlOzuBwTQdNv2+fDxd4yUSrL/L6U1CWrE8/4WtJg4yX9Kg1WCYCs7dblnUayc0j4sul
	4EKh5lS+WKFem+O25Q4ZhDzTjqffaHzTKPB6wyv9Lyo1Of3db8OVYGsN+RU0cNRJ8a5Lm5zoKVI
	tMU0fdJMYFeSR3JmBx9rMDX6NsCLjXDKBFEKVppEDUCGWPNO6+yAROoGUrVYJ2CB2D+uMugDsYi
	+jkU3/actGMI3PoA+p39ipjmSWzFheK4ZIiFY6T31diCR/PK1zVLk16NakhIa271DAMc+PMhZSH
	Ubao6HqghN76OiCoUccIyzo6w==
X-Received: by 2002:a05:600c:a413:b0:485:2fe9:336f with SMTP id 5b1f17b1804b1-4852fe93699mr24092615e9.30.1772898923352;
        Sat, 07 Mar 2026 07:55:23 -0800 (PST)
Received: from GLaDOS.lan (93-35-179-236.ip56.fastwebnet.it. [93.35.179.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm261097785e9.4.2026.03.07.07.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 07:55:22 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 11/11] arm64: dts: imx8mm-var-som-symphony: Enable PCIe
Date: Sat,  7 Mar 2026 16:54:47 +0100
Message-ID: <50e9dc6710d6b2fe48a509e463e04e6ae8b21e4e.1772898346.git.stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772898346.git.stefano.radaelli21@gmail.com>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

From: Stefano Radaelli <stefano.r@variscite.com>

Enable PCIe support on the VAR-SOM Symphony carrier board by adding the
external reference clock, configuring the PHY and providing the required
clock and reset properties.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Add clock-names porperty along with clocks

v1->v2:
 - 

 .../dts/freescale/imx8mm-var-som-symphony.dts | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 9a29c81b06eb..0ffee2d58122 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/phy/phy-imx8-pcie.h>
 #include "imx8mm-var-som.dtsi"
 #include "imx8mm-var-som-wifi-bt-iw61x.dtsi"
 
@@ -17,6 +18,12 @@ chosen {
 		stdout-path = &uart4;
 	};
 
+	pcie0_refclk: pcie0-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -205,6 +212,29 @@ &i2c4 {
 	status = "okay";
 };
 
+&pcie_phy {
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
+	fsl,tx-deemph-gen1 = <0x2d>;
+	fsl,tx-deemph-gen2 = <0xf>;
+	fsl,clkreq-unsupported;
+	clocks = <&pcie0_refclk>;
+	clock-names = "ref";
+	status = "okay";
+};
+
+&pcie0 {
+	reset-gpio = <&pca6408 1 GPIO_ACTIVE_LOW>;
+	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
+		 <&clk IMX8MM_CLK_PCIE1_AUX>;
+	clock-names = "pcie", "pcie_bus", "pcie_aux";
+	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
+			  <&clk IMX8MM_CLK_PCIE1_CTRL>;
+	assigned-clock-rates = <10000000>, <250000000>;
+	assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_50M>,
+				 <&clk IMX8MM_SYS_PLL2_250M>;
+	status = "okay";
+};
+
 /* Header */
 &uart1 {
 	pinctrl-names = "default";
-- 
2.47.3

