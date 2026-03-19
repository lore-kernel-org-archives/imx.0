Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4600D3502B5
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 18:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773945721; cv=none; b=I4Qm/yKKOfy4jJFCGPOj+9mTKQk6FgevIXIV38VGXE0dq3xh84OrpjtmkmsPO0vjo7bgcwNDqJiMU6wkCXVo6lxyExbTJkBfVMc9PY0ENlT09gdmaQ0fLcuYZUvcg6zdLM/goKB/oIdMCdolhiOHpIbCo42gCSfMdUkkaMASgT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773945721; c=relaxed/simple;
	bh=BM2gvpse60F5Afr+VPCPLl+VC+QrAszo9XAnzuXymqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=arXuDp8YhZH3ueXCT8GsdlmErGm70sBOy0GnkRKQevnA7uUBhYNborR9jM3ZkgfjiV0sjX1rbcx+Y+zaRPBPdQq7wQJZ3d0ATjJiF/BgtnlcuqTHWTAtnQ+uINQlXkvkKheQ4Klyn9bHTIO5Ezw+dY1HB9yBQJL+ICXjs4FxU0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWFxi38f; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWFxi38f"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so10780045e9.1
        for <imx@lists.linux.dev>; Thu, 19 Mar 2026 11:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945718; x=1774550518; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8vxnjwZOXE7HlXyNRQ9zVADAHm3YyuOJfN0fYbFcx0=;
        b=aWFxi38fU8oKKqaq1x5Vn/iydMZ6bpOx/UzutRVfb7Hio94XehNT+lIL6qPrk9VXwe
         paEA6Gw8YdXLTJKVNwJ2V1ej3fJpII1oHA73tZLlYt/yhI1XOHXuVIl4kQfH81K4Bmnk
         a2/XHHEpk52fw8GsWQP4gyr9UQTZ/0nd2zE7iOZfgpBKGgAP04uUCq5QC7GNqfX6b6HG
         GNjCTRfrIVvLhI0VF5y4UG3k2FJ7YMfmtoidVsc2jCucsgSt2azDzx3padn2JoRPqSWG
         NovkaKUVTTbrg3K0I+8b0Kuw+jv29sEba2Ur8kxxzA3Fa9ZDuKEwMANaF9KOOqvSTNF2
         ttXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945718; x=1774550518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s8vxnjwZOXE7HlXyNRQ9zVADAHm3YyuOJfN0fYbFcx0=;
        b=qBblw/Knh1ZpM30eu6VlbXytCzgdnM9Lq9zLTrqPos1zHVffvMIfR+t9aVA9D+FdUt
         B4VxZTCKPXxDGZ6pnJpSos925WSU6mh7K05lVVOf6f0fbdOdRdeFT7LWhF95MnF4BnOU
         Wo/xRkUKzPq/oPHB9SJYLCryY4UYUtSVnk7FwJWnWO5F47icLgYmvuhO+wnPrEowKfSf
         j5B5lZk8fzrxICisRWj/jA29OzSTZEmLaXcp9ObZllb2BBFMLYMdlz0C7+h4NZJI8F2C
         xcqNUZFhKtPLeNVFOcZcV+YIsTajvkXYMw9LqjkmDejwjvoaYbaXan4EsOIEnrlICYrD
         ecyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpvEvoItcsv6LLuxkqUCD2T1EDF1qfRup4CzFEcXFppzBBfsN2IgWhfcQYqpgXv0lpByE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxnae1R0kj381X0fWmezrIK1bKmNqoLT6MMK9pqq30indyujhX5
	e49RJAviEXdZi2g+bstcJ3zMjsU8HMHh8VbkKE3yD/qTz1Qqncg0Ziu5
X-Gm-Gg: ATEYQzxoLVl7tk4jKDBZVUQHCO44HS9980V9p22cLFt6YXnahvEbXrczeMUqp8rLwNH
	rcER782LJBidyBKQqpiywCBkdK7/U0jjchbk1BiNvzEJRtCosvRulwymkHi3PtbgkcfT9tmDNDQ
	3Slnn6RHqWPiNA3Ag1XWLsgOvJZzn3ZRhDF8ibrIYPFaYIqSJzJEq1n39VrX1ate2oDI7dVtyyw
	8sVrz9iD1eKbo9V0Q4O9jXnp+tYB4PIoGAHWmIhGyjLH1tkDLO28Iwd+PUaLqRK4eiWWT3bajmu
	4pV4tmC+lMi7zWbFhBOOCgFFWKFja3+usrWbsu0GJ8DgMRPvYuEwGPIgc0V1QiQwM6OrvpyTs1+
	4dTC06mxnVSAw4HpZi1zPdxjp1u2CsemFS4rbpHDrlESoTW/iAdatlSE8D7sYzvhxaw4CUmYHOH
	rMnrhPk+3+uxVr4MyLk6dUAidpPBxqRqKMUXbphRjzEyuLhPGzI8OP9UipzHeLxNuATW6l25BzD
	ENie45DURRFex1HxezgzNK9gB7ALSxLcRJj7Z7k1vlmAqhwAg==
X-Received: by 2002:a05:600c:8b31:b0:485:40a4:364 with SMTP id 5b1f17b1804b1-486fee1af50mr2335955e9.26.1773945717254;
        Thu, 19 Mar 2026 11:41:57 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm77289195e9.5.2026.03.19.11.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:41:56 -0700 (PDT)
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
Subject: [PATCH v4 07/11] arm64: dts: imx8mm-var-som-symphony: Move USB configuration from SOM
Date: Thu, 19 Mar 2026 19:40:27 +0100
Message-ID: <c0b7513b9a6247f3d11bc3292f3b4e6d6602ea69.1773944896.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773944896.git.stefano.r@variscite.com>
References: <cover.1773944896.git.stefano.r@variscite.com>
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
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mm-var-som-symphony.dts | 48 ++++++++++++-------
 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 12 -----
 2 files changed, 32 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 2b608470da8e..a425ee0ed8a9 100644
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
@@ -133,13 +134,20 @@ enet-sel-hog {
 		};
 	};
 
-	extcon_usbotg1: typec@3d {
+	/* USB Type-C Controller */
+	ptn5150: typec@3d {
 		compatible = "nxp,ptn5150";
 		reg = <0x3d>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_ptn5150>;
+
+		port {
+			typec1_dr_sw: endpoint {
+				remote-endpoint = <&usb1_drd_sw>;
+			};
+		};
 	};
 };
 
@@ -187,27 +195,29 @@ &uart4 {
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
@@ -262,6 +272,12 @@ MX8MM_IOMUXC_SAI3_TXD_GPIO5_IO1		0x16
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

