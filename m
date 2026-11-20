Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191128;
	b=yaWRCuy/ltKB3Co0EKTZKB6tvEhtN/D5gAckRZiIayAgTBH17YrBkR2z7B3w8MWhC9GL
	 flll/mqCEBYYf6ETR3Zi4jlTt5G8dd0UGGfV67qPF2MulnQ+Sje0nbkUgjNHAMJfBCw2Q
	 rSsAjw7OluJgHCZnNTNbjdUthLgO1rhm/WcITFJ98RD3ZZ8gqrTWpzmy75pcfjOPzPrlU
	 hKsYFP5vDaM06YoInY39eSRR4v/r4fvaYECflOWZv6qDsf/qeA4JcX0iFLYzTzt8xAEYn
	 CJ1JUZQM6fCTHrKLXdczAdgd+LEaCMb/JDbCX3WQVvr+qS+qIMJBcfr+6zE/Wy9MibQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a35Mq+RYpt2dEaWC1d1eJMfVyB9If3Q8Pl622VJ/HUQ=;
	b=ZFtDG/CqVbO6EVLQdegyr72XkGQZ4ScItVHOA6wIlW3U4VR1lBYpSwui1etzHtcQb9hm
	 AW37VSpdfAaoWE9V00iTUzWYmd9sikd2R4Aki/A4C6rOjfek7KXT88JPE/qxLBTXX07w0
	 dEQa+NgiQZIe5E6Xt0WXIxgLmqiPqtaJwEKC4BmE6V2yc5v60wTQzVIqdkf7voJOBnn/S
	 VYKJbDWgwOZkgNkBWrGewhyBVTr0rYKZ9iU6oAblChRazbJ8wKSFC6gtw7UxQKIBM0qUA
	 /1ZJRGkxr7Yb/2A75gfby6X65hURvzR/tEIlOXRyQu6RmOLyXBs10DQkAFZKk9Ppm1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=L3e+1lDI;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97310606A325
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 16:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97310606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=L3e+1lDI
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so7654845e9.0
        for <imx@lists.linux.dev>; Fri, 20 Nov 2026 08:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795191126; x=1795795926; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a35Mq+RYpt2dEaWC1d1eJMfVyB9If3Q8Pl622VJ/HUQ=;
        b=L3e+1lDI01eWk+gG7hhEMZhV7lCjxL5jWeNSU4ynW8lrvcjjC8pYkgQBQs7DpzGI49
         2s00odxTiMXUa/cPDfw6GuaaLccHkFBt3OZ+ZXNeylTRK9FKSUCDCIUA/eAaGsI1sxlj
         ad5weGEslNROS8u7GFsacRzynB4o3sq/OmcFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191126; x=1795795926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a35Mq+RYpt2dEaWC1d1eJMfVyB9If3Q8Pl622VJ/HUQ=;
        b=cSgqqQuHf6xcQNdus8ug7wdLae/sDLpA0kitIi/8GMtWrnkxM3g5urcoTWntID7r3D
         M9y1Gq3Df+Luc3zO/58xxqCpzpRFq8VEGDJ4WZv35pZv3p1BFbjGo+6DDhtiZocnL8u5
         rJy2UuGhZuJ2qc4mLcV3lYM1by4hApfkDGHqEqExuMw2D8f49gi+v1YEZuxaommVox+x
         Do54MfL4y5H0X6vRLtNWlPp7xJBltTLjZSFBk/u5J583mKrWNRJVMQrveb6Xa+pKe1dx
         PzAcoBnc8xKXv5PTBMvr27HYt3EWDlZCIWXQhOujW3EoOpN21YKWAn6ciNTJXH+CVMYW
         Jtyg==
X-Forwarded-Encrypted: i=1; AL+hErFPZmc+9t4FRUtT6tw7QScYmdOQg9CHD4Jcgw1eoET9QTAyp350vf9NY3BuKdZT9PDnp4g=@lists.linux.dev
X-Gm-Message-State: APuU4Z+xY/j+b3YbeBfOzUVeHk4Ji3eVoR0P0dLmzBMlCbG7LQY4cuiL
	t78EPgkdqoUb2gtQCEWZZxi2BmOGwI0n5qLf7otk+ndEtla5sFgIatCZiHCHGQ992wY=
X-Gm-Gg: AYBFou2drMqpfrd/y1DXAgrRlC+0pHZYT4cYQGYYHc0sF2PV9YJFCrbjK4t3Xzu+Wh4
	idC6Zvb4NixpAhlYIAaIzHyL212UsXfYc2CGGUt+4OZPDQAfG1s50JoOZtrv360G06zOR2I6Jmv
	nRnuHx5rKb8LkdpDP+El0b2PXbPltBC6sicmpNP15DBByVCh+yGAZNvaJJH8tjPUEJSE+d0UB+5
	TmSvk6jS7CmYPWRTtaU2ykANqWeR56/du9/byOszKTv6jKQko4Aio1vH7RA5rjOwL0PucnlWXyD
	z5nYX9B1W7J3IEpz9DUNJ7uT7D3HzlvTiCXOkBNMnDUC03uM36decQ6ZnEIsirODmqAGMkFPp/C
	dfpvCYAIFf5kMipjsVkhzvYdOyEluKDFUX2usfRzJl3cyOqhpnTy6+JKTF5NjN5vXVWssL4jluA
	p0jyUUtGdSSJt3JE7ScwTyyoJWcp7EuzC6pKwY2NoGfcrJdU9G8VK60RMaPYMhiEybs9TuHEij7
	v4H64J1BbjQPxl5gvw7I5oTddB9cHcQe0iNsldtWuIj3r1NoyD1nsycMqjT3RlEcbseTidh1WjL
	jhaInptjGAdrerq+9tv8dZheTDiW7+wElbFi5R0AIfX785xsqjoJUHmiAme9qZ5PvRNUD6JDEip
	xz15AGJzHir2IKvLGOcJ/oxIUhZs0M9u0evAI54NBj219nvKekww=
X-Received: by 2002:a05:600c:a15:b0:4b6:267a:dd6e with SMTP id 5b1f17b1804b1-4bb88938a62mr81026755e9.28.1795191125848;
        Fri, 20 Nov 2026 08:12:05 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm143459745e9.3.2026.11.20.08.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:12:05 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: imx8mn-bsh-smm-s2/pro: add boot phase properties
Date: Fri, 20 Nov 2026 17:11:53 +0100
Message-ID: <20261120161159.1944199-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add boot phase properties to the resources needed during the boot
process.

The BSH SMM S2 and S2PRO need UART, watchdog, PMIC, GPIO and boot
device access.

Tested on BSH SMM S2PRO with U-Boot v2027.01-rc1.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 .../freescale/imx8mn-bsh-smm-s2-common.dtsi   | 22 +++++++++++++++++++
 .../boot/dts/freescale/imx8mn-bsh-smm-s2.dts  |  2 ++
 .../dts/freescale/imx8mn-bsh-smm-s2pro.dts    |  2 ++
 3 files changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index d20393c2d901..5515236d3c09 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -77,10 +77,23 @@ ethphy0: ethernet-phy@0 {
 	};
 };
 
+&gpio1 {
+	bootph-pre-ram;
+};
+
+&gpio2 {
+	bootph-pre-ram;
+};
+
+&gpio4 {
+	bootph-pre-ram;
+};
+
 &i2c1 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c1>;
+	bootph-pre-ram;
 	status = "okay";
 
 	bd71847: pmic@4b {
@@ -95,8 +108,11 @@ bd71847: pmic@4b {
 		#clock-cells = <0>;
 		clocks = <&osc_32k>;
 		clock-output-names = "clk-32k-out";
+		bootph-pre-ram;
 
 		regulators {
+			bootph-pre-ram;
+
 			buck1_reg: BUCK1 {
 				/* PMIC_BUCK1 - VDD_SOC */
 				regulator-name = "buck1";
@@ -244,6 +260,7 @@ bluetooth {
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart4>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -280,6 +297,7 @@ &wdog1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_wdog>;
 	fsl,ext-reset-output;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -326,6 +344,7 @@ pinctrl_i2c1: i2c1grp {
 			MX8MN_IOMUXC_I2C1_SCL_I2C1_SCL			0x400000c2
 			MX8MN_IOMUXC_I2C1_SDA_I2C1_SDA			0x400000c2
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_i2c3: i2c3grp {
@@ -346,6 +365,7 @@ pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
 			MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x040
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_uart2: uart2grp {
@@ -369,6 +389,7 @@ pinctrl_uart4: uart4grp {
 			MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX		0x040
 			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX		0x040
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc2: usdhc2grp {
@@ -414,6 +435,7 @@ pinctrl_wdog: wdoggrp {
 		fsl,pins = <
 			MX8MN_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B		0x046
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_wlan: wlangrp {
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts
index 11a1ba5bfdb7..5add6a8e1c59 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts
@@ -21,6 +21,7 @@ memory@40000000 {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -43,5 +44,6 @@ MX8MN_IOMUXC_NAND_READY_B_RAWNAND_READY_B	0x00000056
 			MX8MN_IOMUXC_NAND_WE_B_RAWNAND_WE_B		0x00000096
 			MX8MN_IOMUXC_NAND_WP_B_RAWNAND_WP_B		0x00000096
 		>;
+		bootph-pre-ram;
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
index 475cbf9e0d1e..b48905a9b4dd 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
@@ -85,6 +85,7 @@ &usdhc1 {
 	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
 	bus-width = <8>;
 	non-removable;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -133,6 +134,7 @@ MX8MN_IOMUXC_SD1_DATA6_USDHC1_DATA6		0x0d0
 			MX8MN_IOMUXC_SD1_DATA7_USDHC1_DATA7		0x0d0
 			MX8MN_IOMUXC_SD1_STROBE_USDHC1_STROBE		0x090
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
---
base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
branch: imx8mn-bsh-smm-s2-bootph

-- 
2.43.0

