Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680415;
	b=x1berdUL7vTB8CcUT1qDFTc4epJvmUaAghIJ9Nolz7KYkl0vlTCNNAcxkgkeyyLwSLku
	 x06osincVnqKwhlS7GY8+jOllSaMhquGwk5aDST/mfgPOD5BNxjpqrQ3RQuP7aomB6Gos
	 75ydBjt+1jbd27QYiAWrDoLoSCB8XFAw75wsf8xSgUly7oVrPMjoGeqdSM1vr+5D+s6K5
	 TKYM3vv30tzySYzePm4ExMKBueyhen4Xati1UdqU+B+zyBrs7XZkT9bOjBShgh4Hwtd69
	 hG/MVrZG6mtfI/ENj3Kh7xyPLTGHEgtlYaq6ZipZsbag72aeWQ9E4a3Qu3ub0GmIyPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+ulViqmN/gERqSfWWEq4zOnz42D6WlhHjq94c4ttf9o=;
	b=khkwpG2tgAO6TPtovuCsuCWGJESXWa1Ek4WTDwoApLhLhd66GMngsMvI9curGC1aoEJR
	 m8juAYoNT8MBiAkZ3zSEJ7ZQ3oP66ujpaSNvMf7dihTTzeHccEUQd/o8O0vWSgxIM+SEW
	 yddrbBhxy+0hNyd3LkwT4WABw/MDC0DEkn+fLYmORtNdnk/kdBnllkJ+Ee5XRPx8fKtTU
	 9mxNvIFBQ23cEYpxRu0vJqfOdP8xGVVJriyeUJIgydT2e6joA3CLFwzkdRj3J4joMAXdv
	 NtpYWYvA6aDFa1660PDb6IL9yR5hqydaUuYd5Z2uHGhn2hvCeHq0kRoXTMseBJxcp7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KI5V25n8;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101BC606A32A
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 14:46:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 101BC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KI5V25n8
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so768814f8f.0
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 07:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680413; x=1793285213; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ulViqmN/gERqSfWWEq4zOnz42D6WlhHjq94c4ttf9o=;
        b=KI5V25n85GINX8UnZ4QGl2aEcbi9t2x92zSQc/6p3K11m3XJOzpXouMOhYqo+aMt9D
         XkflnjhQ8EUdOcq4awDcJVTgEcyUA0nY7Lxtev02MkxGYqZPMGAh0l9Y2oS7fCYichAe
         lm235VV2v+iWJK1BnnyIfstywXRlI8RavaSGn09E8fS7cjyQ5IJaK+S/Ho+9CDrzC19n
         sERiHMnXYsFmfiaoOxz+o17GsK1/3667yQ6+4aK8jZfCOglgHzHdpHyHHI1k+SUM/Ejz
         zk+oyNeoJP6l1zXwlIN71RvnouYdRUrmcl50VLhKulj1ABjJMxxtI5FELqPP2kxyHfUC
         m+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680413; x=1793285213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ulViqmN/gERqSfWWEq4zOnz42D6WlhHjq94c4ttf9o=;
        b=EkN1pFv+hepjG8HZJMVXHsTALAYneEJKZCP5DIsZd/uAsuUVN7voGoUGnnEg5U4A3N
         l6I/MdZFZ+80VJGvD/cbtssaljSozxPKmCPIyStIlqxlrwo5Rxnij7ZSaxY2yL2mQtz2
         E/Ayq7rxeVYq/8mVGZdKK6d5pfsr7IDMW/LFGbIKrw/ODDoIfIgG2HWzP7yGc2MvrLnn
         UPeK7FoFx+qCF7T5a6wflGc/SkQf0ogMG834UXv3+kbbhP19CnlkGOjylAtzoLOOebG8
         ndr1Iz9ZkvBsOQPRSUIysxVKrIOXwvOaPwnJJzI6Ss8n8n8BmokPCJu9jgu02Bn+PC0e
         FmwA==
X-Forwarded-Encrypted: i=1; AKwUvBwIJ45G/802LeRZTGHM5BWS+ohZu37za0ifeBsW6N1V2dbiozEvb3cdvOC5PleFA9SERjY=@lists.linux.dev
X-Gm-Message-State: AFq9FYLVfdk/A4ulSfNJ77/I3k7PNL0kIBPxmvBeQMgp5aOG8eXlv12m
	/FHsknKWE6udAQEsAt57TMXrFrAdUjqix66AuMJvLStvdQl0+9vkx2zi
X-Gm-Gg: AYBFou1aymGuC++T5vkLuc18GGYgE8DhMTT6eONDlB8+Hamq81URIuSXqhw7HdfOBJv
	wHDXDTdBpTmDVViMtcurBiR8KDia4w0gnMDcwus/QzMBs+mhWDhNTLd1SnI9DDKs6D+V1CRvdhV
	J0JTWYLD6d/ORXq8x/0savxV+iJ//yUOccpq2sUz7w1T06kozIqHm5I9pjDMU83CgejLjV2OF7P
	4+y/9detb5USNMq1BszNgMBpQ5plpkFponQ1aZapV6GebElXk1vVQ0MtFxhWw8u68oXtXeyW8YC
	/tHTT30mw9Y5u3KX7jmBrLOmgcNbqYxL/AxrFrJtW7g3XKN2lTjp4pzhHj9gIzff+K2R4FS3QDC
	9hhDG94fEc3Ql+FEpgfyOJbZV2UQQrBN03mOK3n92Tf5ZrST5hT/rfBmXVamDL6dsyjQD4WXiqg
	11AgQI+PVAUABsUgF1QvcXrAgevxFrVQSpAH7ce6faSyQpe3XpyjWjz+aIHbKIwz4mrbn8JxFsq
	kfgU54k0V+HooIu3uStggBfrotJ4BO9uO5Q+XTSR2rxDPy8rAeLStPsl6N6cJbNmEpYzuewlGjT
	yuWy5ZFfqxFXtMcV8qshaIZ1SiM6SS5QoSxmIytZb+6ZzOOMohV9z5g=
X-Received: by 2002:a05:6000:298e:10b0:48e:eb:56c5 with SMTP id ffacd0b85a97d-48e2d102e96mr4094255f8f.8.1792680413276;
        Thu, 22 Oct 2026 07:46:53 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828c6dsm13672146f8f.24.2026.10.22.07.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:46:52 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:46:46 +0200
Subject: [PATCH v2 3/3] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 OV5640 overlays
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-v1-smarc-imx8mp-cameras-v2-3-cfe3d25e7aed@toradex.com>
References: <20261022-v1-smarc-imx8mp-cameras-v2-0-cfe3d25e7aed@toradex.com>
In-Reply-To: <20261022-v1-smarc-imx8mp-cameras-v2-0-cfe3d25e7aed@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add device tree overlays for the current 27 MHz and legacy 24 MHz
Toradex OV5640 camera modules connected to CSI0 and CSI1 on the SMARC
Development Board.

CAM_n_CON_PWRCTRL (pin 24) is an active-high power-up input of the
camera module, so it is described as an active-low powerdown GPIO.

The overlays are also combined with the SMARC Development Board device
tree to provide ready-to-use DTBs.

Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             | 17 +++++
 .../imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtso    | 15 +++++
 .../imx8mp-toradex-smarc-csi0-ov5640.dtso          | 75 ++++++++++++++++++++++
 .../imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtso    | 15 +++++
 .../imx8mp-toradex-smarc-csi1-ov5640.dtso          | 75 ++++++++++++++++++++++
 5 files changed, 197 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..2defe77ee7df 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -709,11 +709,28 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-csi0-ov5640.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-csi1-ov5640.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-csi0-ov5640-24mhz.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-csi0-ov5640.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-csi1-ov5640-24mhz.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-csi1-ov5640.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
 
+imx8mp-toradex-smarc-dev-csi0-ov5640-24mhz-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtbo
+imx8mp-toradex-smarc-dev-csi0-ov5640-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-csi0-ov5640.dtbo
+imx8mp-toradex-smarc-dev-csi1-ov5640-24mhz-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtbo
+imx8mp-toradex-smarc-dev-csi1-ov5640-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-csi1-ov5640.dtbo
+
 imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
 	imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtbo
 imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..7e6991b95dec
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 with 24 MHz oscillator connected
+ * via Toradex SMARC Development Board CSI0 connector J45.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ */
+
+#include "imx8mp-toradex-smarc-csi0-ov5640.dtso"
+
+&clk_csi0_ov5640_osc {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640.dtso
new file mode 100644
index 000000000000..23b155beec2a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640.dtso
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 connected via Toradex SMARC
+ * Development Board CSI0 connector J45.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://www.toradex.com/accessories/csi-camera-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clk_csi0_ov5640_osc: ov5640-csi0-xclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <27000000>;
+	};
+};
+
+&isi_0 {
+	status = "okay";
+};
+
+/* SMARC I2C_CAM0 */
+&smarc_csi0_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&clk_csi0_ov5640_osc>;
+		clock-names = "xclk";
+		AVDD-supply = <&reg_carrier_3p3v>;
+		DOVDD-supply = <&reg_carrier_3p3v>;
+		DVDD-supply = <&reg_carrier_3p3v>;
+		/* CAM_0_CON_PWRCTRL, pin 24 */
+		powerdown-gpios = <&smarc_csi0 3 GPIO_ACTIVE_LOW>;
+		/* CAM_0_CON_RST, pin 11 */
+		reset-gpios = <&smarc_csi0 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_csi0_to_smarc_csi_rx: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&smarc_csi0_rx_in>;
+			};
+		};
+	};
+};
+
+&smarc_csi0_rx {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			smarc_csi0_rx_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_csi0_to_smarc_csi_rx>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..f6bfc3d49f5e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 with 24 MHz oscillator connected
+ * via Toradex SMARC Development Board CSI1 connector J46.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ */
+
+#include "imx8mp-toradex-smarc-csi1-ov5640.dtso"
+
+&clk_csi1_ov5640_osc {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640.dtso
new file mode 100644
index 000000000000..d78f46a764f8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640.dtso
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 connected via Toradex SMARC
+ * Development Board CSI1 connector J46.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://www.toradex.com/accessories/csi-camera-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clk_csi1_ov5640_osc: ov5640-csi1-xclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <27000000>;
+	};
+};
+
+&isi_0 {
+	status = "okay";
+};
+
+/* SMARC I2C_CAM1 */
+&smarc_csi1_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&clk_csi1_ov5640_osc>;
+		clock-names = "xclk";
+		AVDD-supply = <&reg_carrier_3p3v>;
+		DOVDD-supply = <&reg_carrier_3p3v>;
+		DVDD-supply = <&reg_carrier_3p3v>;
+		/* CAM_1_CON_PWRCTRL, pin 24 */
+		powerdown-gpios = <&smarc_csi1 3 GPIO_ACTIVE_LOW>;
+		/* CAM_1_CON_RST, pin 11 */
+		reset-gpios = <&smarc_csi1 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_csi1_to_smarc_csi_rx: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&smarc_csi1_rx_in>;
+			};
+		};
+	};
+};
+
+&smarc_csi1_rx {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			smarc_csi1_rx_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_csi1_to_smarc_csi_rx>;
+			};
+		};
+	};
+};

-- 
2.43.0

