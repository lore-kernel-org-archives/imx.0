Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741881D1F52
	for <imx@lists.linux.dev>; Tue,  6 Aug 2024 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722951297; cv=none; b=RP27afZhS6SdIymHKznpQ/QRH5AktlnelTlyBxaMVLmIpYEbKNXXkB0TBhrWcbvq1mN2b+2KVc5bw/Z+yLLVBjbL7zJQIdX3nJu9WeuEtqNjrds4vuQoRGbcGJ1wO8gsUkbE/2XNO7WIdu3BiaoEdszzGAe4K0tGYz1JpD4tgrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722951297; c=relaxed/simple;
	bh=UdzWhsd9oz0+AmDdGddx8suhoSHnbzpjtEd4LPJVNzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M97FxKQHaLrS9IAlG3Q7gIagZkTsOfyS1YEo0Z6jxSYobRXnRZaRaqGuLR1QujScLPIeW0xtHmBqMjNGXi9UEyd7dLsj6XDIyJSPYAhwfcQboVualVOMZQLbLXbZuBrCSDa2a1ainqIYaFpM05oSl/qjho+/F6YMmolBF31eIT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=fail smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=S0b8PbWB; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="S0b8PbWB"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F3DEBFBCA;
	Tue,  6 Aug 2024 15:34:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1722951292; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=oGGBzcnOnP0mo+bJ5KHmTIO9dRW6gvWt4+kpJJygojQ=;
	b=S0b8PbWBmhssF5D9k42QB4s6ZzguC5h/YbvfPLQdBtYJ4ffo8kF/5LbZYfVoGiVZ+qLA14
	CaqVihMfpLlqKc5S/wIU01hVRBpoHr1eKMgL38NgPbWwM55lRaAg0C7d0LD0HyTvvbUzpa
	kYxC+WLEZVaqKg6aL8TXO+eXByLlhaC68f6XEmjUes6FWCDinyIlXMk6B8PXD0uQHplPXe
	3QJiK+dgjoq4t2G2TvT1skNCy+Bd32bgoB4tdCvWAkBQXZOW4+DKIjBopGOOf6zl6oaQIX
	m9XmgT9e7cD/1ONDkxuiFvs1TEiIdN+J3hgUdBpVak1nOm6dbYFnGDm8HpOhIg==
From: Frieder Schrempf <frieder@fris.de>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 3/4] arm64: dts: imx8mm-kontron: Add support for display bridges on BL i.MX8MM
Date: Tue,  6 Aug 2024 15:33:01 +0200
Message-ID: <20240806133352.440922-4-frieder@fris.de>
In-Reply-To: <20240806133352.440922-1-frieder@fris.de>
References: <20240806133352.440922-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The Kontron Electronics BL i.MX8MM has oboard disply bridges for
DSI->HDMI and DSI->LVDS conversion. The DSI interface is muxed by
a GPIO-controlled switch to one of these two bridges.

By default the HDMI bridge is enabled. The LVDS bridge can be
selected by loading an additional (panel-specific) overlay.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/freescale/imx8mm-kontron-bl.dts  | 146 ++++++++++++++++++
 1 file changed, 146 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
index aab8e24216501..2b344206dfd16 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
@@ -25,6 +25,17 @@ osc_can: clock-osc-can {
 		clock-output-names = "osc-can";
 	};
 
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_in_conn: endpoint {
+				remote-endpoint = <&bridge_out_conn>;
+			};
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -132,6 +143,90 @@ ethphy: ethernet-phy@0 {
 	};
 };
 
+&gpio4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio4>;
+
+	dsi_mux_sel_hdmi: dsi-mux-sel-hdmi-hog {
+		gpio-hog;
+		gpios = <14 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "dsi-mux-sel";
+	};
+
+	dsi_mux_sel_lvds: dsi-mux-sel-lvds-hog {
+		gpio-hog;
+		gpios = <14 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "dsi-mux-sel";
+		status = "disabled";
+	};
+
+	dsi-mux-oe-hog {
+		gpio-hog;
+		gpios = <15 GPIO_ACTIVE_LOW>;
+		output-high;
+		line-name = "dsi-mux-oe";
+	};
+};
+
+&i2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	status = "okay";
+
+	hdmi: hdmi@39 {
+		compatible = "adi,adv7535";
+		reg = <0x39>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_adv7535>;
+
+		interrupt-parent = <&gpio4>;
+		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
+
+		adi,dsi-lanes = <4>;
+
+		a2vdd-supply = <&reg_vdd_1v8>;
+		avdd-supply = <&reg_vdd_1v8>;
+		dvdd-supply = <&reg_vdd_1v8>;
+		pvdd-supply = <&reg_vdd_1v8>;
+		v1p2-supply = <&reg_vdd_1v8>;
+		v3p3-supply = <&reg_vdd_3v3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				bridge_in_dsi_hdmi: endpoint {
+					remote-endpoint = <&dsi_out_bridge>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				bridge_out_conn: endpoint {
+					remote-endpoint = <&hdmi_in_conn>;
+				};
+			};
+		};
+	};
+
+	lvds: bridge@2c {
+		compatible = "ti,sn65dsi84";
+		reg = <0x2c>;
+		enable-gpios = <&gpio4 26 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_sn65dsi84>;
+		status = "disabled";
+	};
+};
+
 &i2c4 {
 	clock-frequency = <100000>;
 	pinctrl-names = "default";
@@ -144,6 +239,30 @@ rx8900: rtc@32 {
 	};
 };
 
+&lcdif {
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <54000000>;
+	/*
+	 * Let the driver calculate an appropriate clock rate based on the pixel
+	 * clock instead of using the fixed value from imx8mm.dtsi.
+	 */
+	/delete-property/ samsung,pll-clock-frequency;
+	status = "okay";
+
+	ports {
+		port@1 {
+			reg = <1>;
+
+			dsi_out_bridge: endpoint {
+				remote-endpoint = <&bridge_in_dsi_hdmi>;
+			};
+		};
+	};
+};
+
 &pwm2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm2>;
@@ -207,6 +326,12 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio>;
 
+	pinctrl_adv7535: adv7535grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI1_TXD4_GPIO4_IO16		0x19
+		>;
+	};
+
 	pinctrl_can: cangrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28		0x19
@@ -277,6 +402,20 @@ MX8MM_IOMUXC_SAI3_MCLK_GPIO5_IO2		0x19
 		>;
 	};
 
+	pinctrl_gpio4: gpio4grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI1_TXD2_GPIO4_IO14		0x19
+			MX8MM_IOMUXC_SAI1_TXD3_GPIO4_IO15		0x19
+		>;
+	};
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL			0x40000083
+			MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA			0x40000083
+		>;
+	};
+
 	pinctrl_i2c4: i2c4grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_I2C4_SCL_I2C4_SCL			0x40000083
@@ -290,6 +429,13 @@ MX8MM_IOMUXC_SPDIF_RX_PWM2_OUT			0x19
 		>;
 	};
 
+	pinctrl_sn65dsi84: sn65dsi84grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI2_TXD0_GPIO4_IO26		0x19
+			MX8MM_IOMUXC_SD2_WP_GPIO2_IO20			0x19
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SAI2_RXC_UART1_DCE_RX		0x0
-- 
2.45.2

