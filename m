Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51DA257452
	for <imx@lists.linux.dev>; Thu,  2 Apr 2026 18:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775155030; cv=none; b=nhJASabqAnKJvrDISB1j0lzyPzlcA8+Ao8EwE1bUbG8lAsAqhypY6ROy0Ghylcw/dyKJjnxfQbqaUhj/5lAVDpIGndaV9fsFvSPFbXD/ptpVuMu+Cp0kTdliNBr50f/12XK9LuCJjXQUIem2TLTKr3XXs5OXPiS89WZO/yLbHIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775155030; c=relaxed/simple;
	bh=9pBjDLgqpMumQWeZisa/9Hlv3ZQZpBWCi3eCi1iU9vw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e4G3T4dNPeq9kPDQVQN0wxyMRmLZAEfybRmD8/OIQps7TWSZp1ri1+g+0CWT1wLrFiEZNY6hOqqY/i7kCDRkxv2BASfMHFBCBE06jKvIsbf5ppXfkk8v4hCieh4ewASNXhg0bPCFW4AF+ZA60H5HdI/KcLjdtPJQE1pjX/RJeaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id CA6391F8004D
	for <imx@lists.linux.dev>; Thu,  2 Apr 2026 18:37:07 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 50DBCB40133; Thu,  2 Apr 2026 18:37:07 +0000 (UTC)
X-Spam-Level: *
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 1E980B4012B;
	Thu,  2 Apr 2026 18:36:31 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Yannic Moog <Y.Moog@phytec.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH v2] arm64: dts: imx8mp-phyboard-pollux: Add HDMI support
Date: Thu,  2 Apr 2026 20:36:26 +0200
Message-ID: <20260402183626.3284639-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PHYTEC phyBOARD Pollux comes with a HDMI port on the base board.
Add the required device-tree nodes to enable support for it, including
both the video and the audio paths.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../freescale/imx8mp-phyboard-pollux-rdk.dts  | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
index 0fe52c73fc8f..4efdc6bdfe12 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
@@ -38,6 +38,18 @@ fan0: fan {
 		#cooling-cells = <2>;
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
 	panel_lvds1: panel-lvds1 {
 		/* compatible panel in overlay */
 		backlight = <&backlight_lvds1>;
@@ -126,6 +138,13 @@ reg_vcc_1v8_exp_con: regulator-vcc-1v8 {
 		regulator-name = "VCC_1V8_EXP_CON";
 	};
 
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+	};
+
 	thermal-zones {
 		soc-thermal {
 			trips {
@@ -146,6 +165,10 @@ map1 {
 	};
 };
 
+&aud2htx {
+	status = "okay";
+};
+
 /* TPM */
 &ecspi1 {
 	#address-cells = <1>;
@@ -201,6 +224,32 @@ &flexcan2 {
 	status = "okay";
 };
 
+&hdmi_pai {
+	status = "okay";
+};
+
+&hdmi_pvi {
+	status = "okay";
+};
+
+&hdmi_tx {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hdmi>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			hdmi_tx_out: endpoint {
+				remote-endpoint = <&hdmi_connector_in>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
+};
+
 &i2c2 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default", "gpio";
@@ -244,6 +293,10 @@ &i2c3 {
 	scl-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 };
 
+&lcdif3 {
+	status = "okay";
+};
+
 &ldb_lvds_ch1 {
 	remote-endpoint = <&panel1_in>;
 };
@@ -444,6 +497,15 @@ MX8MP_IOMUXC_SAI5_RXD0__GPIO3_IO21	0x154
 		>;
 	};
 
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c3
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA			0x1c3
+			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD				0x19
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC				0x19
+		>;
+	};
+
 	pinctrl_i2c2: i2c2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL		0x400001c2
-- 
2.53.0

