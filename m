Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E3B37419E
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353817; cv=none; b=sFW3fnHz4deRMx1qXvHXyUDv66uF+alfzIjEe36Jd8CKseDMeT73EWyYoR5M5oKp71C++oiWO3aawF4gAsWvYCYtfLF4JN+6JqhV3QWDE6V1a0btBc+xlpWxwpJACMIRNbWP1PtKuyYbXoaxreq5FPw+8Y41woKHvqMhjpZaJZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353817; c=relaxed/simple;
	bh=Im4SjL4rj+dZ4r9wviLtR9OUBndAmT+OXOPPEYGwiEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cWyNxh5GQWehwacDyNHoTUcyAG9Fv7rQkGKMdakXltRYFt68xNVmGB6MYQDFQ2U7O93p4/a/ozXOUjkLqquZcOA6NfeHggZEHiCW9YZaH6B4qiNHfUjb0S8Hss44RVkBtv0RTA/ZJeP4N42FtV0JSxM5pHh52zpY5w2jj5lEyGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2o2vasp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2o2vasp"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-483770e0b25so40317765e9.0
        for <imx@lists.linux.dev>; Tue, 17 Feb 2026 10:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771353814; x=1771958614; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozOixa4IFnis7hOv1BdsjCzbYXYnC7+PJ6nqzXPd9iE=;
        b=M2o2vaspxVZSEEPSoQRC0PcNowX2FVsmX6nUUGHISjqM8OkxUHuH5lRjPqH16ZAluY
         qwIvoDIWco2/OQa8TJVNQJ72EIxxmFHwZMyLauaOMlq3H4zCYksblyNxCsQx6fiy24Tj
         S5WwRtO8ZldXVh1hIX8W8D4Be3dULDjlpMuXdkfh4QYgKu7fIBoNhL0h9NqaspGeOPmr
         Ue5roT1hjCYu7B4X7LxBb1PYWvUkq+phB/IVqwKKH9pB3Jo9dyIKO2twKxufCaN1a0K+
         NG7gTGqgBwi4w1lo7SYY107PWJ+XXgS4rBLbJBYplHXJY+z1uwUGXvVxiJsds+VfjEOr
         tRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353814; x=1771958614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ozOixa4IFnis7hOv1BdsjCzbYXYnC7+PJ6nqzXPd9iE=;
        b=jt/oR49yMDAT089T0q8EXVK1LpaLyGOpR6TWd0xDG4Uelbgby7wIVpnmigUxZIWRNB
         Xs1kgpJnXuR/+KXXClzEOV1Btzpqr3CydMQJ0s3+4Udrgn31FinnAe2at6o0V61wpkPX
         iokGJP3PakATlPQEluaTo671DouvZh3511W7PeYYt0JTWpcC/XpGwaWv5L2OLJTDcwaX
         8VKjVpZ0dkESoQ5DcT46OEuwXfiUiUfQNoVW0gzpDuYfR/PxoWwhfrIlfe//3mAFxyt2
         pRPjD9qWDIU4CiRaqzx4CgGPubBx/klsRz38C2QSnZwiMGXTUOh5Em9+OQKa6ZaG1kCI
         pcpA==
X-Forwarded-Encrypted: i=1; AJvYcCVsCRApZ5deeZSyZoKVM0BSFN7ehOI5yAIKGpDxCcT6sCsaCXbiV/QiQN58yYwloyBzGOE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOsH7cDM5Z2puZn9YjdRo6n2/f6WwUJAdR/VrUV++gwIivQeut
	jt/mfVt2HaHw005PdmxtJ/JprnYqdr01aR+oYGZFnya6hSl1CM7Tn4s9
X-Gm-Gg: AZuq6aIEUWJGYpBTr5Oj6GWK9y3ZInKWOn+2MF7EidAfr4fwnj/eUaqFqvn+n3Ph/mw
	zoYpStR6ClXmDz03nHImgsln3kuucJc8SRHhjpoMMVlUpurrMVtNlbKwM09ouXWg+y/Ey7dxcQE
	GW9n8spCbX7CX+LlmHbYXEvvIw6ly0ptMDTOP8buG19dlAyXr1g9YpK8ygtTyGuC1LWtxfqf2PD
	dwVTgH8oV9pIrm4PSDtXcyGA/bSwWnY9MRaZpPSPfTrN6qByVtrKUn8UuXHO5RumZoO5WljMb/I
	WlOU/J0AgBp8WLxkeLdXrDtxYZcfpNtrdIc2riK263qnZcbzMgcD5m/xekDKLl+h7esmiilPjwG
	dztDrJbZMRCnRAzyuOTMtN/nUUVjOCCW90t+ZTrvh9N4VVwwhPTknCn7VZCTkbIDWzZWVbZWcNZ
	GUAMnZ7bqagsjyRDbFjg0/pjPacrQl5o6k2QontwbTOGruE5TwFSwe50UaefhDWUcsLGCkc/zuK
	GHvqe8J+64EK/SzZbdJywHx/LhJvrAhCaYWrEVX
X-Received: by 2002:a05:600c:6912:b0:483:456a:5146 with SMTP id 5b1f17b1804b1-4837108fed4mr260857485e9.25.1771353814118;
        Tue, 17 Feb 2026 10:43:34 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839731d7c3sm1096185e9.18.2026.02.17.10.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:43:33 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 07/11] arm64: dts: imx8mm-var-som-symphony: Move USB configuration from SOM
Date: Tue, 17 Feb 2026 19:42:41 +0100
Message-ID: <d4d51b3ffb9b65564fa0eae82c4bdb5abb8ac1ff.1771353301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771353301.git.stefano.r@variscite.com>
References: <cover.1771353301.git.stefano.r@variscite.com>
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
 .../dts/freescale/imx8mm-var-som-symphony.dts | 52 ++++++++++++-------
 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 12 -----
 2 files changed, 34 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 689894405b27..3242a0b739f6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -30,6 +30,7 @@ reg_usb_otg2_vbus: regulator-usb-otg2-vbus {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_reg_usb_otg2_vbus>;
+		pinctrl-1 = <&pinctrl_reg_usb_otg2_vbus_sleep>;
 		regulator-name = "usb_otg2_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
@@ -117,13 +118,20 @@ enet-sel-hog {
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
 
@@ -171,27 +179,29 @@ &uart4 {
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
@@ -246,6 +256,12 @@ MX8MM_IOMUXC_SAI3_TXD_GPIO5_IO1		0x16
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
index e2b1919d7188..96293036a4d4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -411,18 +411,6 @@ bluetooth_iw61x: bluetooth {
 	};
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
 /* WIFI */
 &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
-- 
2.47.3

