Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E46151985
	for <imx@lists.linux.dev>; Tue, 22 Apr 2025 11:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745322668; cv=none; b=OqEIjfIjyUd1ZCXaotSEjwQ7rYMH0+uuYSliv36kKKgDwyCo0ZMn3Q0wwJ7HV6VyxmDj+2heCkDL4+WS3RO6+lgyAcPX99BeyhO4AbQmXu0kN3I7Z8K6cbjSPqO6tNGsKEro1rIkV5XY9yg/lpSbwOL9oq8KOxR+qcxQ3FrEAGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745322668; c=relaxed/simple;
	bh=VEhajbJhenyOwhDiqNi6r8q5OP8gwjnJXRhckqsJOpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GRZM0O8tgk0bW50yEOaZvk1s8cClYQoWBPgof+vMyPx+E1K/9XFyloC2Mj/a/jKmaSyo6DeIstGsCfRxsalylVidiE3+U4Y0H7Ng03dCr2rM/yzZC4CggD3z6Omr5OMX6fjIUPGk/69Tx9XWBSIAYqTZgXdrCwAILqV1BD5xdTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dCjnYBr8; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dCjnYBr8"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3995ff6b066so2671317f8f.3
        for <imx@lists.linux.dev>; Tue, 22 Apr 2025 04:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745322664; x=1745927464; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xm+C1Hrf5PZav1kH12OZ68FgqFY1vN+rQWTlgliz2cs=;
        b=dCjnYBr84xIc6hBy9dY6B+nECpuk86oCwRX3/2axZ3qtnaU7l0Asi3CmJH/PNEbwWO
         hONc/Ji8vxEhCJTe6/8UVwCVkhi1E67LySzo17k3ee73VLwCC4ni5P+HZgSdoTueeANK
         dNhWt4kbOB4KB3v2sG1fFO6V3Na0r7rWsfUSSivFW1S0DVqkJh0eMZONkRt9O/lFCm1L
         p8x2yIKsLyZEUbzaj24QQ6ooq+5tHv5e1dLgLEUf2FUX7D6tp97pJesgUbh7GL/h4+Fm
         UswoqIkd0YgsawD5HQUrBQMiy4Hcg4CrElGpxG8eiJB2URsD5zDPa9VeDrrpnbIuMe0V
         2+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745322664; x=1745927464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xm+C1Hrf5PZav1kH12OZ68FgqFY1vN+rQWTlgliz2cs=;
        b=M6fBfDnokUSLlfYl1iDq1U3zAyWGleSzDKVApAgOiO6Wd+PsFfdqt36x0nQ9pI4KaV
         9Uv5/1/++Eb26eS1WDDYIqJnIKDjL3H8xiIbHo7mcS7nE+/bp6OtjzOs08V/jjeZpSdy
         /+DmwhWwqzifMSHTS85+g6eGN+NJTDy+Pr5v34ChJNk1BYp6N62TQArkWt8e8x4fPAt9
         C5c/GRQ8usg3Fxjv+tWCSHMri3EiifwYO1T1NXBniJRSYo7I9eTpBATXYK8/SPwD7kaP
         H/hNaCX4/2Uk7snig/sq69yQg1NN+aM7haXmaoKRciHawXddyMnJfH0n2QT1lIDc48s1
         37xg==
X-Forwarded-Encrypted: i=1; AJvYcCU64yI5ZfuhnHmBWAG59nZlLQZXP7zJ9+HEScHz2C7gWL83cakyUb5glBQ7cmy9QYXsG40=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvJZzsRMeJjT2RQqH026K+Yo2E9EPwHIgITJkdMrxGvXN1bWBw
	MiqgUTZDr6GPk4NDPFW2rCUdY0C+WCdORHQo/MDMO3s15GC+k3BO
X-Gm-Gg: ASbGncvh2v/F90mt55P+f2BbbW2f5+a3lBVl3ysvN+bRs/81+5e6bZ70NVTzPc6/RcB
	J5IlR4SigulRew2azpEV8GH6aLKKRxGxTm6wWCTq1pYsoTE7dtijDjs0ZnXqYlr67yPThtNAldN
	FfAaudGXURGZl8TM/YcpPFiiUO0s8/wbJgMWPUSb5w4qc8AxANM9Sh5jPvwZoA7VUDCUF0jwMQw
	H3WMQ127/no6ZEDLtEqHZRTDd13tcuFI8VVRddgBq2zryCBdAhyfRJLup6wZoTTBQdegQWRc1nT
	xxR/iqaDyem0PDwF9+yic2RMzXL2QxIgnKSimlwkuhMjnjEvyw87Lwrp9H8Bd6BvMZH2hsqfz2a
	aHJtIMIb3
X-Google-Smtp-Source: AGHT+IEDjgGNVWbzB6Xc4tHbi6ZRWUATDYuf4z8WnnwDr13qOhSHxOiNofBtLV/8u9BXBgZvL8GMGw==
X-Received: by 2002:a5d:6da5:0:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-39efbb09d5bmr12222914f8f.52.1745322664453;
        Tue, 22 Apr 2025 04:51:04 -0700 (PDT)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa5a2300sm14767410f8f.101.2025.04.22.04.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:51:04 -0700 (PDT)
From: max.oss.09@gmail.com
To: max.krummenacher@toradex.com
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: imx8-colibri: Add PCIe support
Date: Tue, 22 Apr 2025 13:50:49 +0200
Message-ID: <20250422115051.1867349-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Max Krummenacher <max.krummenacher@toradex.com>

The needed drivers to support PCIe for i.MX 8QXP have been
added.
Configure PCIe for the Colibri iMX8X SoM.

The pcieb block is connected to the on module Wi-Fi/BT module.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

---

 .../boot/dts/freescale/imx8x-colibri.dtsi     | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
index ecb35c6b67f5..e602d147e39b 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
@@ -52,6 +52,15 @@ reg_module_vref_1v8: regulator-module-vref-1v8 {
 		regulator-name = "vref-1v8";
 	};
 
+	reg_module_wifi: regulator-module-wifi {
+		compatible = "regulator-fixed";
+		gpio = <&gpio_expander_43 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-name = "Wi-Fi_PDn";
+		startup-delay-us = <2000>;
+	};
+
 	reg_usbh_vbus: regulator-usbh-vbus {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -261,6 +270,16 @@ ethphy0: ethernet-phy@2 {
 	};
 };
 
+&hsio_phy {
+	fsl,hsio-cfg = "pciea-x2-pcieb";
+	fsl,refclk-pad-mode = "input";
+	status = "okay";
+};
+
+&hsio_refb_clk {
+	enable-gpios = <&gpio_expander_43 3 GPIO_ACTIVE_HIGH>;
+};
+
 /* Colibri SPI */
 &lpspi2 {
 	pinctrl-names = "default";
@@ -454,7 +473,15 @@ &mu1_m0 {
 
 /* TODO MIPI DSI with DSI-to-HDMI bridge lt8912 */
 
-/* TODO on-module PCIe for Wi-Fi */
+/* On-module PCIe for Wi-Fi */
+&pcieb {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcieb>;
+	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
+	phy-names = "pcie-phy";
+	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
 
 /* On-module I2S */
 &sai0 {
-- 
2.42.0

