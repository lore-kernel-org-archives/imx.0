Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494EF3EDE47;
	Fri, 15 May 2026 21:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778881236; cv=none; b=XRj7M28ruWP6EZmhbgDKty4chlUKAtFm4WvuY1tIQdVph8yYj6Y9+Usubu/rn3s/NJPdRgjr7LMx0Q3gewryWqtLk/rr3SXNutJU5VUJtG/uETNCa/dRJuMknuoRcLYOe8JWNINJn/cqoIXgMKFb4UbQXw2phaQqI7twlp9hjZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778881236; c=relaxed/simple;
	bh=mnDbR3xkBC/GdnET/D5ySCv2gXwSSzuNh4VbKIf2bfc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HD1i8asQvPugSLtNgiPtEEc+x7xZCnWqS3Lbxz5ymVMeiIleoAJi8LctHLp6kcL+TWu+YlOun8dgo6kVANumjjwp/pNA1g+OjfWBQ5pJ3rkc1ylnXJFEzDYJQd3l3Du9oBMhD+VwDb5mLb6ndfXNgP+gmFdNzabqIGTsf4reJkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ve4/ofLr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ve4/ofLr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A997C2BCF5;
	Fri, 15 May 2026 21:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778881236;
	bh=mnDbR3xkBC/GdnET/D5ySCv2gXwSSzuNh4VbKIf2bfc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ve4/ofLr17rU/YP25ATIyyvSYtiZ76CZ7SIaTR2BYloORhGADBflhHNgGfsavGooV
	 WzCAKWyVCvbgbfEd2D4tXMMzGM+7JWcXiUnRm2mtb55VRIaErqgaJsGDJ7YeWpESId
	 f3fwEbULByzG2iOZV6lDzmRWbRr1Ft5YkecwgJ+hM5pAaYd1UjeJ1C0UREkh56Qix6
	 fgCTOK+bb//htw7gqy00B+tpK1w2QCEsXdNh14YqPbCYIu2+aYHmmzRsYCfnLzdi9j
	 zi7KZ3p+GYeOwIJTiYmigOti0rwtcJQWGlYrvojjBVR2dVCUayF01SWUEEkqN+LiBx
	 63jS5zA3IUZqQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B981CD4851;
	Fri, 15 May 2026 21:40:36 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Fri, 15 May 2026 17:40:32 -0400
Subject: [PATCH 1/6] ARM: dts: imx: add (power|vdd)-supply for related node
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-imx25_dts_simple_warning_2-v1-1-b06bff192a05@nxp.com>
References: <20260515-imx25_dts_simple_warning_2-v1-0-b06bff192a05@nxp.com>
In-Reply-To: <20260515-imx25_dts_simple_warning_2-v1-0-b06bff192a05@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778881235; l=3317;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=6vBvPUCqlEyMPdXglG8l2+gv+6GZqS7tIbJKDSzwPi0=;
 b=nNru3Ykgths2kP3BFLXByWw1f8rco6eZl9ejPDROOhm7lF8GFEPDk+C/ZBbxTzmz4lJqsEpgA
 wVLWzx3yYlOByzYVlCfpEFTPuI95N9ovTuB2C0ykdxJ2SzXDVT68UUL
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
Reply-To: Frank.Li@nxp.com

From: Frank Li <Frank.Li@nxp.com>

Add required power-supply and vdd-supply properties to fix below CHECK_DTB
warnings:
    arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dtb: panel (edt,etm0700g0dh6): 'power-supply' is a required property

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts            | 9 +++++++++
 arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4.dtsi | 1 +
 arch/arm/boot/dts/nxp/imx/imx53-sk-imx53.dts            | 7 +++++++
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts              | 1 +
 4 files changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts b/arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts
index 6210673f93bea67c4f717b11439069d86f90b008..2acbc86cabb3193f1b27b5de3155cf3d88381f49 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts
@@ -84,6 +84,7 @@ panel {
 		pinctrl-0 = <&pinctrl_display_gpio>;
 		pinctrl-names = "default";
 		enable-gpios = <&gpio6 0 GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_3p2v>;
 
 		port {
 			panel_in: endpoint {
@@ -98,6 +99,13 @@ beeper {
 		gpios = <&gpio6 3 GPIO_ACTIVE_HIGH>;
 	};
 
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
 	reg_usbh1_vbus: regulator-usbh1-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "vbus";
@@ -259,6 +267,7 @@ eeprom@50 {
 	dac@60 {
 		compatible = "microchip,mcp4725";
 		reg = <0x60>;
+		vdd-supply = <&reg_3v3>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4.dtsi b/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4.dtsi
index e395004e80e6d2caba6da8350f1f6ac2dc01f61d..34cb0c344ff6ee10b59d29d528d54051c2a0f82c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4.dtsi
@@ -10,6 +10,7 @@
 / {
 	panel: panel-rgb {
 		compatible = "powertip,ph800480t013-idf02";
+		power-supply = <&reg_5v>;
 
 		port {
 			panel_rgb_in: endpoint {
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53.dts b/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53.dts
index 1a00d290092ad447d45d5e0cb5117183c4bc3dfe..c1e065359fd2d5a2ca287a960155f00c75069899 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53.dts
@@ -29,6 +29,13 @@ memory@70000000 {
 		reg = <0x70000000 0x20000000>;
 	};
 
+	reg_5v: regulator-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "usb_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
 	reg_usb1_vbus: regulator-usb-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "usb_vbus";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts b/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
index 24fc3ff1c70c2f3c9ac4309f9c7c723f003096d9..cd9a050fa906e4a7273ae3a290375c30853ea075 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
@@ -109,6 +109,7 @@ led-heartbeat {
 	panel: panel {
 		compatible = "innolux,n133hse-ea1";
 		backlight = <&backlight>;
+		power-supply = <&reg_lvds_lcd>;
 	};
 
 	reg_2p5v: regulator-2p5v {

-- 
2.43.0


