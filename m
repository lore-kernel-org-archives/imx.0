Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8A731AF10
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 13:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760967243; cv=none; b=aTifUrwruDtWSx2WnsrtPBolkARn7iVo0sAS7c5wGtZdBhoOImQ91+K6mpw4c4mVm4vN9MbiIARSoOuv/csF9Ni1DSKef+rnb9SYe5GnzlZZ0gPZOxfs78zjZ1YweHJruTZBmcC1UODpvnYdSmOMZO61CmQxQyVRGQTxv2GH7b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760967243; c=relaxed/simple;
	bh=Hgiu87Mkxt2XSwmQ3Px5CVqbkZ0WupkvziVmAE7+zfs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ye6avSqqn/1KmSpTFNt4WY0cAda9S3lax1DLDQVWQBPX1IUOO9ZBPC9phCAXD7TDsEuD22F7A0mS4UqUWHtVlQIRQKzNDUIXkkymiJFeQyupgrUAktaXBgbFVDxXxMXpUFOByTfdC1lBwN4yExmOQPHuQSkpzNOpEIUz3BF5cNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=jVJWf94q; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="jVJWf94q"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0144EC9D0E;
	Mon, 20 Oct 2025 15:24:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1760966687; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=D3pswD8T4kvpqjL6vVmhm5ybo8RFGGQLzpUDtqC/p3o=;
	b=jVJWf94qYI4F1rELanQ5NM3tzzzpdF7zRZZjiveQGmr4zOYsBHWg7x+zlITcnA94JIbywp
	dg/Bthe1Rbr4+909npqjaOceIsyHGrOZmD98o2yxB0wtxPhjSjScXm2xbZ3WpP0GsB3Tpy
	et6TXlRh9PWJM6sFh5w9cSBKHnNA6RYZwOS8e1gWOVwkJv7inPEKsTXKnXMmyXqXOmailZ
	2KvOxvagl80X3+rBeoA0FyBhoz4ckoGzNEQ28q8V71y2wl7qEvd/GrpUU+IJbPCLNlU3EG
	w2VsgzLF11nWX+qL2+Vg/DBVPovNdz49Sn3jCg6hGOi1AB1h74xRPfTyPoJvCw==
From: Frieder Schrempf <frieder@fris.de>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Annette Kobou <annette.kobou@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH] arm64: dts: imx8mp-kontron: Fix USB OTG role switching
Date: Mon, 20 Oct 2025 15:21:51 +0200
Message-ID: <20251020132155.630512-1-frieder@fris.de>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The VBUS supply regulator is currently assigned to the PHY node.
This causes the VBUS to be always on, even when the controller
needs to be switched to peripheral mode.

Fix the OTG role switching by adding a connector node and moving
the VBUS supply regulator to that node. This way the VBUS gets
correctly switched according to the current role.

Fixes: 827c007db5f2 ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../dts/freescale/imx8mp-kontron-bl-osm-s.dts | 24 +++++++++++++++----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
index 614b4ce330b1c..0924ac50fd2db 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
@@ -16,11 +16,20 @@ aliases {
 		ethernet1 = &eqos;
 	};
 
-	extcon_usbc: usbc {
-		compatible = "linux,extcon-usb-gpio";
+	connector {
+		compatible = "gpio-usb-b-connector", "usb-b-connector";
+		id-gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+		label = "Type-C";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usb1_id>;
-		id-gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+		type = "micro";
+		vbus-supply = <&reg_usb1_vbus>;
+
+		port {
+			usb_dr_connector: endpoint {
+				remote-endpoint = <&usb3_dwc>;
+			};
+		};
 	};
 
 	leds {
@@ -244,9 +253,15 @@ &usb_dwc3_0 {
 	hnp-disable;
 	srp-disable;
 	dr_mode = "otg";
-	extcon = <&extcon_usbc>;
 	usb-role-switch;
+	role-switch-default-mode = "peripheral";
 	status = "okay";
+
+	port {
+		usb3_dwc: endpoint {
+			remote-endpoint = <&usb_dr_connector>;
+		};
+	};
 };
 
 &usb_dwc3_1 {
@@ -273,7 +288,6 @@ &usb3_1 {
 };
 
 &usb3_phy0 {
-	vbus-supply = <&reg_usb1_vbus>;
 	status = "okay";
 };
 
-- 
2.51.0

