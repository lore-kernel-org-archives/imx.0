Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA56B43CECD
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 19:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772827132; cv=none; b=L7Q2QwZFgW7mTAs239aTLTCQzyM9dOdp0/crmAYMQDzmoB0JOFp/DmUnKlX/WzaiU9yFx6iWfkDsd4jbjH3uyadZsIpEImrS6cxPj7CBt6t2IIUbdAQs6vNX0pU3oDyONDR384KZTHzWHsz+wWXYst5DwGwU0GZiDOY+cwvkN0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772827132; c=relaxed/simple;
	bh=xTRveRJF2dl7CBQyRHlw6rc1lcP+lhknVliLp+7BJd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bB28dlitBV8I1vVsk+F+cizwqY4uPMnWQdUM6oWQAzLkIr0o17lGfHLGegKPqVStITLzEMZS1YYYqvcQhQSwvjhdXyVaeM56WdUBYbiqhImZOV3Wv0+xeICAc77BgplBCmH2q6q4M4tsBZokF4ot5bV3f+DxH7Eijs9ATn/zQJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBTJAKcV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBTJAKcV"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-483703e4b08so93979445e9.1
        for <imx@lists.linux.dev>; Fri, 06 Mar 2026 11:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772827127; x=1773431927; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tXjij1D9KtsqrCPi7i7680wT/H004NOdFpzApfvwok=;
        b=jBTJAKcVg0tOpWaAbVKIUPxaeJKorklD3tGi1PXOHxEjJ+C+xmo7yVORiEH1a0ACOq
         19Wp19lu7gRgDB1FqaQj8DJB2B+sJf8epshN7eSF5GQ4zMWLhaNkQtie3g8l5qIPyWQ1
         J3lzQy6FOjZSckQlOJOtBQ/FN/KKm23uCHbDSvths/tGm0nRZCoOJ5GeJ9/+3aap7/jV
         +0Wp5s9MhK4bhf4JEFAH7bXxH4T6bTcnbBBr1TKFYG9fTkAgqnsGuc4wYT2zBv7OjntS
         cPTEw4DUeM9i9qZipxdb5Vyr3Gws967Mw6qrHtXRwy2zqfmA90goJ27fPRupy4iQLRLB
         Q8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827127; x=1773431927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9tXjij1D9KtsqrCPi7i7680wT/H004NOdFpzApfvwok=;
        b=qI1bS2Yv3P8Ikfv/zEa45jcU7zr6hMsQ1Sy/iU7Tk8+TJaRpmJaW1otiayroQWtHqX
         +XuBlDqA3C4VpvjBUkyYF7N20W+L0KhAJUHX5njwRzEaTueRfCn9aT48jWic8v8Ej08e
         0zotuvchlJ803lagGrirB15v1HpxHhkAyCL6PH/uMTlzWUnyNHg0cseVYki/DkfgF0c6
         fF3txyWlOq9m/BCQXEzaK1tdXHXBO4LFrGCpSUeGvowH6p1q/tfMfs62/BG7gik1LIm3
         Xg32DCT6l2tQ2QXr6pxkDF/xIn62oqvFwVSk9MQkOpwK1KUnR2x0C44h0Mec1AZfilj3
         a8iQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8ohn1pIS7PhVYZesXZ+zOlMt9jjpSXguBPMXl+kEJ8EYR/7SctoC0X9c3PMbBxWeI9QI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmvGw9mHpTGcF6ygXSyIDNnK6JhBSbCRNL4msbHyjkHHSK5NCH
	cZUdprBXvbVyDHBJA4tW0VbiA/rCKoYWa6GWpbRtYIb3ZZfT6xJzn1g2
X-Gm-Gg: ATEYQzyy4k1QME/zlLDpJuMQKgxG9/OyZ5OuHdY+wKZsbxW90tmWhA2kEQPDjA+zdQq
	JR9vc/KxMXal8Sv/9oFFUfywZ7Rmacuah7NGrxU0vQL+ehH63/hLSeeJJDjA2FM0KhysZyCFMbm
	qJBVF8uSyDu17PlS8S/ISD3xndxsT6/MLAukFg6nE7JjMXeb17iKgsBxLGdbxdcwsdETAbY8rMk
	VN4UEzgU9Yp1DsxaFGiZuDaJW7/VMdHOF38Zkwe0M5aHFoD19Vfrs1bUc34VecSV/eLy2RXxo1u
	8ZuZreDQVPYDJviCt1JOhj9jjNeISMnBk/EfLCWoJyR/hAcUod99EoHtrVeQD99Y9jV+Zp281yG
	qFdpwVCXAdduuPDDL/WnhULhSxLzyIEtgzui2Hod2au14vK31oIAtiYMGEpDwwYqgGSac5CN5lv
	mJ2bVUuB8bhz8dwSHUptOYc96Tz1IvTdY1u4mpLo3kPW5gBxaUv4072L1/Oq59A+wD9CZqScNZ+
	3ey9WozkisK/ueG9i/8HNxj8TFn8QuX+Wu+JXII5RryQhd1Cw==
X-Received: by 2002:a05:600c:8705:b0:479:1348:c63e with SMTP id 5b1f17b1804b1-4852674e8camr56209175e9.9.1772827127154;
        Fri, 06 Mar 2026 11:58:47 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48523803b5fsm25167265e9.7.2026.03.06.11.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:58:46 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
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
Subject: [PATCH v2 07/11] arm64: dts: imx8mm-var-som-symphony: Move USB configuration from SOM
Date: Fri,  6 Mar 2026 20:58:26 +0100
Message-ID: <04b20cb1abdea86c551a851a19eba8fce1640c87.1772826534.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772826534.git.stefano.r@variscite.com>
References: <cover.1772826534.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

