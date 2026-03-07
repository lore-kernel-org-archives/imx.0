Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66BF3A641B
	for <imx@lists.linux.dev>; Sat,  7 Mar 2026 15:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772898926; cv=none; b=XR+EjaLZ/xe/F9TAjqDfCpHw+I0SGXy441tTUhABBZSY6kN1NC+hG2veGYqlIKcEdv5bN9cEyUdAikTGsRHVDLE17+kSfpvvwZaVEUtp67q3VSIPYCjxT2GtZZmAS5m1iAcEwp5vkKPuOBmM4dW/NLdRhEY1xmnjHyTx1Dqgkwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772898926; c=relaxed/simple;
	bh=WGIUDSNE4fbzrMwFQAEAhxJOHhFHjOXq0VDgnuQJthg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z+0cmTD0Mw6mEiB5CRa2kGHMimVHKTRC58VeuR7C08VUN/wLZfexCX8g0uLQ+R/C/RNmPLxW1CQWBICAnnuVsETNkORzLtfQyhWgdEEnsfjo5ajPaYyZeCnZNTw9WvkAUUJpnLCuzfRAa3PtBc4iin9dSYHc63PWhIdvkoTiLpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aC9tW+gm; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aC9tW+gm"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-483a233819aso101141765e9.3
        for <imx@lists.linux.dev>; Sat, 07 Mar 2026 07:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772898919; x=1773503719; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXppVponufibYNJUrEWp0KeVC13KUsLoWozvPsPqHDc=;
        b=aC9tW+gm3jCYinZ5Nqbv2gObRmuFh9CQyXD7fRM0qvB23Z6B3ckE1IPkMc1h+aBP5b
         My4buvH4RfRlf2GihYBuIj6uxtHv0N19ubaM+Lz02+TAgezt5dO2hSVCDV2vloqoa94n
         idkfJoJAEJgTopLBvQ0aOzpKL1tMQFT2Vsl1Kk/KrQTxDMHEJiLM08sKok/dFkegZeIv
         L9LC4W0XBf7wHN5WsnB6WxJszec5O10uQz9v6T4biDcrXGbEgVgYgHwv1nNVWzcAgm1v
         755hduKgIfw6dAbNkD7IwTEb3YDsqefAW80WibTCEMS68xIh4fP0jJdovqeIEBaBEgjw
         KJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772898919; x=1773503719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wXppVponufibYNJUrEWp0KeVC13KUsLoWozvPsPqHDc=;
        b=VWfclCqu4q5BiuhLn0osUDz8LHOkA2wD8msz7VnyaF7SFIhFeX21WzxV6DJvVVnrQD
         DqMcBitfvuDwL+19dm9TBCKs7GwFQm9apkYfHMte0U1mhevVLYFryYxecAucnx9dvdSg
         mDNxteTkihCXQ9uWOtngJKVVWE+ZhzS18aaqSbX+zDWP2F9e82Spq9v2Cqr9sPgbP3Up
         B4v6pfEvHR1tb5pFYmKN0WJUn2VbIt9rvtj6vfmDuTIq7Q2QFTRVITT+sG27ZssTq6d8
         lgxlXOkx/NjYaZjKP9f258ZzF2Waw/dPN+W9IkWixbCYUVgA1bvBG/wxgd9LjAVYP69I
         F7Lw==
X-Forwarded-Encrypted: i=1; AJvYcCWn9ymsirNZEyCiTGa/PLm3HhD739f1aiDxlIN5t65CCA3etROUSGVQcgmrbmFo7us+EJc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzrgtDniS9qp6VuoA2L0tGZjwNrfJSE89wVB/eBEwD+dS+XaN1E
	g9xdHLJwNQ9XjpEkr2g1xHb+gyCEAQcSfcScHttpaDC7CIAk7fSwhm+H
X-Gm-Gg: ATEYQzxrIyzboZKawLNYLBZSsJjmWKvEjz4ZzJnArDqW72mCX3ApTIAzCc22QcfwWv2
	AtqONqKQFbD8aKKeQMZ8iH8QAoMpqBkDtu++FGOx0sVei/MWO3snmuaWtUjzXPEalJQu3J2RloN
	2rshmFP96JgE4QVEDnhUafPe1hTBBm0iAGZ1DSCIohORdFhJijY+ryazIld3lwlstd5l1GE3AMr
	bvKK9JnW9KJLQpZ/0zyLhXmMO13/7+by3//wKD/KewGedgu2eVRKIoXqPRe8UQTbpG35TU9nF7D
	HW+Z0OIlllbnljdKoXl4ruEkyL/CJtsgY+J2d9+H6hCPNJyzbQ0xNIXUUe6q9oLy5skEIGwI4Wq
	/aGGrba5Yru/InDXrw/RDRlBDOy79rsTalb6d4wiin/VVhvCt04chtnwxuo4D2INKP5Sc6B1aCZ
	07h+So9JR1wVm7btYt1+rPPRxj+XT07/ynjAvCDshBKCuukOFAfSFtJYLx7sj0+z2dfgb6KFRdI
	siH4mQ1xcEtGyBcne4SAux9UQ==
X-Received: by 2002:a05:600d:8445:10b0:485:2f8b:55f2 with SMTP id 5b1f17b1804b1-4852f8b5ceemr22161775e9.24.1772898918961;
        Sat, 07 Mar 2026 07:55:18 -0800 (PST)
Received: from GLaDOS.lan (93-35-179-236.ip56.fastwebnet.it. [93.35.179.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm261097785e9.4.2026.03.07.07.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 07:55:18 -0800 (PST)
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
Subject: [PATCH v3 07/11] arm64: dts: imx8mm-var-som-symphony: Move USB configuration from SOM
Date: Sat,  7 Mar 2026 16:54:43 +0100
Message-ID: <04b20cb1abdea86c551a851a19eba8fce1640c87.1772898346.git.stefano.radaelli21@gmail.com>
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

Move the USB controller configuration out of the i.MX8MM VAR-SOM dtsi
and into the VAR-SOM Symphony carrier board dts.

The SOM does not provide any USB connectors and carrier boards may
choose whether and how to route USB, therefore USB should be described
in the carrier-specific device tree instead of the SOM include.

While moving the nodes, align the Symphony USB description with the
carrier design by enabling both USB controllers, wiring USB1 to the
PTN5150 Type-C controller for dual-role operation, and updating the
PHY tuning and VBUS regulator pinctrl (including a sleep state).

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mm-var-som-symphony.dts | 52 ++++++++++++-------
 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 12 -----
 2 files changed, 34 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 51ac8ee34c3b..86246de8f36f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -32,6 +32,7 @@ reg_usb_otg2_vbus: regulator-usb-otg2-vbus {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_reg_usb_otg2_vbus>;
+		pinctrl-1 = <&pinctrl_reg_usb_otg2_vbus_sleep>;
 		regulator-name = "usb_otg2_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
@@ -140,13 +141,20 @@ enet-sel-hog {
 		};
 	};
 
-	extcon_usbotg1: typec@3d {
+	/* USB Type-C Controller */
+	ptn5150: typec@3d {
 		compatible = "nxp,ptn5150";
 		reg = <0x3d>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_ptn5150>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <11 IRQ_TYPE_NONE>;
+
+		port {
+			typec1_dr_sw: endpoint {
+				remote-endpoint = <&usb1_drd_sw>;
+			};
+		};
 	};
 };
 
@@ -194,27 +202,29 @@ &uart4 {
 };
 
 &usbotg1 {
-	disable-over-current;
-	extcon = <&extcon_usbotg1>, <&extcon_usbotg1>;
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	status = "okay";
+
+	port {
+		usb1_drd_sw: endpoint {
+			remote-endpoint = <&typec1_dr_sw>;
+		};
+	};
 };
 
 &usbotg2 {
 	dr_mode = "host";
 	vbus-supply = <&reg_usb_otg2_vbus>;
-	srp-disable;
-	hnp-disable;
-	adp-disable;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
 	disable-over-current;
-	/delete-property/ usb-role-switch;
-	/*
-	 * FIXME: having USB2 enabled hangs the boot just after:
-	 * [    1.943365] ci_hdrc ci_hdrc.1: EHCI Host Controller
-	 * [    1.948287] ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus number 1
-	 * [    1.971006] ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
-	 * [    1.977203] hub 1-0:1.0: USB hub found
-	 * [    1.980987] hub 1-0:1.0: 1 port detected
-	 */
-	status = "disabled";
+	status = "okay";
 };
 
 &pinctrl_fec1 {
@@ -269,6 +279,12 @@ MX8MM_IOMUXC_SAI3_TXD_GPIO5_IO1		0x16
 		>;
 	};
 
+	pinctrl_reg_usb_otg2_vbus_sleep: regusbotg2vbus-sleepgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI3_TXD_GPIO5_IO1		0x120
+		>;
+	};
+
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index c37badc4cf27..75f56dc89b8e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -378,18 +378,6 @@ &uart2 {
 	status = "okay";
 };
 
-&usbotg1 {
-	dr_mode = "otg";
-	usb-role-switch;
-	status = "okay";
-};
-
-&usbotg2 {
-	dr_mode = "otg";
-	usb-role-switch;
-	status = "okay";
-};
-
 &usdhc1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.47.3

