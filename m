Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8E847DFAB
	for <imx@lists.linux.dev>; Mon,  7 Sep 2026 11:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781302; cv=none; b=PQj1XYAQmjLWnrTOkYnjgK/bSsGkU9j1NHU7Vc3ZhR8xWJz2s8GMapnMFlAEtjjnp3zyW/6ihNccyEc/upYd8oQjfCyTrc2s3zBJgUUwaliPWiS+pCpa+cHcrtyjsqjm06nJIxyZaBr/rN3YdRq3KsMPQSXovb9dAhrHeMZ61Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781302; c=relaxed/simple;
	bh=DdYdnfYjL95zd3sgkQfUooOUtR5+8RhDSdYsvzR++NI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XmyvZ+F7lYmukxaAmeZcn0jOlD9wiIHiVJdruazRXwfSfgRemuazssmoXPefsP8bXga6ywKuKt0XPly7o9at+7DxLXFeFsEOGfv3KANYK+ShIEJWTntHp1ndqQxuvFAmqAAA/eYaJjpAlRNyYDeNsTFfSNVwoJEIFWSiTIPtQJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rqn9q506; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rqn9q506"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4859245e493so1496907f8f.1
        for <imx@lists.linux.dev>; Mon, 07 Sep 2026 04:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781299; x=1789386099; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eV9sk5hU0/u8qwTJY/3H34b1rkL69Lya+pyG85fXSY0=;
        b=Rqn9q50659JSQq01MCAf00I2s+tJHfUIDnFjLA5Pez2+Dk1v7mrOiAa8eEHndHT/No
         2DFJ+P92fna+MKxD6dD+zHBkvMyQcNKtgvUWo2RE4kvkCjGqO/CqUacHmpvAaM6PeQpD
         P2l/4vruBPRLHuyToAwkepjLtJIHnTrM1fVa8YDlP/YcxKaRxF49r3Avx7/ss59axW7f
         tERXlL0urtoccJE5qW+UXX8LMyMCAy/Gpi1AzYB5MS50JBdSCgYyupGsZzt/7jpSAzho
         XQmB6/YeSXv8isuEMTWtS8URCzW+0/R2pZjd3sDCcLjOgaw17f2aXdznW2HG4XVem3zu
         H/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781299; x=1789386099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eV9sk5hU0/u8qwTJY/3H34b1rkL69Lya+pyG85fXSY0=;
        b=A6PE4vwprY2wfFOP2s/63i93eeZ/T53KYVdmi5L+qyCj/ZzFWn2qsnrhirGFlOP5k9
         jsl+us054ZIEqeuEyU8h5ei7gnZD1SXVBa8rdQlsSFvNjFlg2wxYiEbwqNr5dJ8eSijb
         CvtADpLzQ6bGI3/3viyBlyxJzKtS4xZjPxEuEgELRpl+AI3G2FYucSOZ2i2Lx3+Lf8+P
         pucZj+ENE9teYJyZ0z4nOtOwU3c3fs/3FRe6rW+bzLtNmNNva8t3eEyo88kzcxZXhHmS
         B7fN2dooB4jW+waJrc8KBCGvvU+xerEVu/HnVK+GTVDfZSZ5WnYI+J6MA3c8WLNt2Asz
         OHRA==
X-Gm-Message-State: AFuF++lMI5kDVRpVKc4rHJaG/sLqtqs3imVwedarMt9xp6du101hOxr4
	8T6OgtNR4Tm4pnLdT41XajqRLpE9QHHsfOV8yPOcg9nnROxKQ3b12N+o
X-Gm-Gg: AYBFou3ndVcw/sHpKD0wxtrcmo9xQlE91uX9Uk4U7oE2qRsCgTYVaZQ1Dpac37LaP95
	k3ZJK5IUkvGy4pNHjYZnrbHJiWI79xe2r5Fu3rD5d3IuMiwEV2kJO9xXE5Pk8dpFKQxVDBMVJV+
	PPkBj3xC3JYpYUbjfg28d5BY5EwIFTTFJPp+Tm/86SWebq0/6ucSe+skXOdWhMjCQME4G1G+fq/
	6vMoWjqXNxSDIQHGKiRjoyAoF6jXwgF45mvbLwNDe5E43RHW7yxgEwPkyK8YC4gRIs45Ohbhr88
	D6h7iB93jLpHzdWzv1/nftLvAaPUky9h3p+MzNrSXaaeOpLCqjrA/wthyJMfvml+Y/P2bFq057S
	bOPYmWJ3PSA1bq8usY0sjZBbFjr876fzxHnF41Er74DLv7Q+7P/asug0g8P6LEqTyX/P/t5CCkC
	1WebRybSMnLcmK3tBGxW6f5b/GOS6KuGdmslQGc4rbWXrT00Z3E3rDker+H1n78qlo2BsC/Re7v
	i6XXwZziWfN5sllbF4eTzzXsGV8BtWLH3S79AiMhJbaonq3nBEe31ZHo0SPIjU=
X-Received: by 2002:a05:6000:240b:b0:485:8a47:5b8b with SMTP id ffacd0b85a97d-4858a475d06mr19956526f8f.40.1788781298671;
        Mon, 07 Sep 2026 04:41:38 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm26763182f8f.3.2026.09.07.04.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:41:38 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 07 Sep 2026 13:41:31 +0200
Subject: [PATCH 2/4] arm64: dts: freescale: imx8mp-verdin: Add DSI to HDMI
 adapter overlay
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-2-ca0c63c2994f@toradex.com>
References: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
In-Reply-To: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for the Toradex DSI to HDMI Adapter, an
accessory that connects to the Verdin DSI_1 interface and provides a
full-size HDMI Type-A output. The adapter is based on the Lontium
LT8912B DSI-to-HDMI bridge.

The overlay is also combined with the Verdin iMX8M Plus carrier board
device trees to provide ready-to-use DTBs for the Dahlia, Yavia and
Development Board carriers, in both WiFi and non-WiFi SoM variants.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-hdmi-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  13 +++
 .../dts/freescale/imx8mp-verdin-dsi-to-hdmi.dtso   | 102 +++++++++++++++++++++
 2 files changed, 115 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 8c6fdeaf12af..715235b62912 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -729,21 +729,34 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-nau8822-btl.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-hdmi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
+imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-dahlia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
+imx8mp-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
+imx8mp-verdin-nonwifi-yavia-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-yavia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
+imx8mp-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-dahlia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
+imx8mp-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-dev.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx8mp-verdin-dev-nau8822-btl.dtbo
+imx8mp-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-yavia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-hdmi.dtso
new file mode 100644
index 000000000000..e572fd13b987
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-hdmi.dtso
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to HDMI Adapter on Verdin DSI_1.
+ *
+ * https://developer.toradex.com/hardware/accessories/add-ons/dsi-hdmi-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pwm_3_dsi_hpd_gpio>;
+		ddc-i2c-bus = <&i2c2>;
+		/* Verdin PWM_3_DSI (SODIMM 19) - HPD */
+		hpd-gpios = <&gpio3 20 GPIO_ACTIVE_HIGH>;
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&dsi_hdmi_bridge_out>;
+			};
+		};
+	};
+
+	reg_dsi_hdmi: regulator-dsi-hdmi {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		regulator-name = "DSI_1_PWR_EN";
+	};
+};
+
+&hdmi_lontium_lt8912 {
+	pinctrl-0 = <&pinctrl_gpio_10_dsi>;
+	vcchdmipll-supply = <&reg_dsi_hdmi>;
+	vcchdmitx-supply = <&reg_dsi_hdmi>;
+	vcclvdspll-supply = <&reg_dsi_hdmi>;
+	vcclvdstx-supply = <&reg_dsi_hdmi>;
+	vccmipirx-supply = <&reg_dsi_hdmi>;
+	vccsysclk-supply = <&reg_dsi_hdmi>;
+	vdd-supply = <&reg_dsi_hdmi>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			dsi_hdmi_bridge_in: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&mipi_dsi_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			dsi_hdmi_bridge_out: endpoint {
+				remote-endpoint = <&hdmi_connector_in>;
+			};
+		};
+	};
+};
+
+/* Verdin I2C_2_DSI */
+&i2c2 {
+	clock-frequency = <10000>;
+
+	status = "okay";
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <16000000>;
+
+	status = "okay";
+};
+
+&mipi_dsi_out {
+	remote-endpoint = <&dsi_hdmi_bridge_in>;
+};
+
+/* Verdin PWM_3_DSI (SODIMM 19) repurposed as HDMI HPD GPIO */
+&pwm3 {
+	status = "disabled";
+};

-- 
2.43.0

