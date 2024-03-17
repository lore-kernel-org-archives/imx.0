Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD301CD2E
	for <imx@lists.linux.dev>; Sun, 17 Mar 2024 16:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710694142; cv=none; b=BAiAwn/m8jQpJgK/TM1p9Lhz4xNhl5zvn9XYmutmN3gDe4EWo+2PxcDIJHHd2KUV3K946qcIarKeewi4aDB5P+0ngcZiCD8ftaofUiu1okM5OmjDeJgV7nhWVq0PE70PMr2TWZqlcCWNd9N2+MRwzOp+VhhfnSJlLSRWaHwKh5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710694142; c=relaxed/simple;
	bh=+O/vlZonVinsZWvGzNB4jzLy9xzf97iXd82SLN8vLCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g9ShhQKu2Qei48xiZ4SkbdIVB9F77zDudCCagjVc4X+IUMlrhcN3BtIe2yOczTgrcJccrR+9AHYJT04am7/vR+E/tkXaVf8MoTC7fJbCLgATKvnX87loZAscrkmm0Ze7bJCGZ5nrIf5d22Kd3K/XK68gDNWfQhy079H4bfIzx6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g+pJ15x6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g+pJ15x6"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1B2115C2;
	Sun, 17 Mar 2024 17:48:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710694112;
	bh=+O/vlZonVinsZWvGzNB4jzLy9xzf97iXd82SLN8vLCY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g+pJ15x6e9SeHvxJQotkVsVUTtL3z58XEPjOrC+0sLRW1kQxmX5oIfPkTQy2ZZovV
	 NSRcPf3z53OSUElsGOtw0AXwlT93W3c+q5HThjnwsGfyNooydgnfrQB0xg8n/FGtTv
	 UlfQJM5p+VNZhCUz22H5gu7TITevcST7nsB3ZGMI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: freescale: imx8mp-sb-ucm: Add HDMI output support
Date: Sun, 17 Mar 2024 18:48:49 +0200
Message-ID: <20240317164850.32708-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240317164850.32708-1-laurent.pinchart@ideasonboard.com>
References: <20240317164850.32708-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the HDMI output on the Compulab SB-UCM-iMX8MPLUS, using the HDMI
encoder in the i.MX8MP SoC.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../boot/dts/freescale/imx8mp-sb-ucm.dts      | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dts b/arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dts
index 0141d85dc6a3..9dfa43d14a9b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dts
@@ -32,6 +32,18 @@ dsi_backlight: backlight-dsi {
 		status = "disabled";
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
 	reg_3v3_per: regulator-3v3-per {
 		compatible = "regulator-fixed";
 		regulator-name = "3v3_per";
@@ -70,6 +82,28 @@ &eqos {
 	status = "okay";
 };
 
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
 	pca9555: gpio@20 {
 		compatible = "nxp,pca9555";
@@ -134,6 +168,15 @@ MX8MP_IOMUXC_SAI1_TXD0__GPIO4_IO12		0x00
 		>;
 	};
 
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x1c2
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x1c2
+			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD		0x0
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC		0x0
+		>;
+	};
+
 	pinctrl_i2c5: i2c5grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SAI5_RXD0__I2C5_SCL		0x400001c2
@@ -210,6 +253,10 @@ MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0xc0
 	};
 };
 
+&lcdif3 {
+	status = "okay";
+};
+
 &pwm1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm1>;
-- 
Regards,

Laurent Pinchart

