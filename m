Received: from uho.ysoft.cz (uho.ysoft.cz [81.19.3.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52EF2C3247
	for <imx@lists.linux.dev>; Wed,  5 Nov 2025 15:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.3.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762356947; cv=none; b=g0L62PctabBwWCrJJm9VY7MiYGF7EFk8/lmxJvWITlSKnVsC9DxY4JTT6G6APjjF8DC/GJYUmHjwFrqKEeDb0BifxFXRv6wNqIy1GmiMo31e3wZcg5srNdy64GpC00zgQkIDx5EXwYhsCmFVMXw+PFJiEWi3ZUB/rVSBfz3sThk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762356947; c=relaxed/simple;
	bh=iYV/0gxlfsnY/0FDjlyewNo1A9AIsLgh3s2Ej2a9ycY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L6DPbxfiZUMUmyT6tfZOD1rF5E3StovlyFvpQAp+hRyauoMQuzlD5NN8OsYaaG4IOHRWfOhXLfXWAGW6/9+sdh+ndO17wYE8Qu41fQGghpz2yTjisVANlBUQ7Suy0bvRw1YuUnt+3OsWivHPAZcX8Le+4yOzifycvy1/tJ1Fvn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com; spf=pass smtp.mailfrom=ysoft.com; dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b=ahmy7OJE; arc=none smtp.client-ip=81.19.3.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ysoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b="ahmy7OJE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
	s=20160406-ysoft-com; t=1762356407;
	bh=/3nfux16ZKQG2m9VQWPawdpfD+7ff1vFtMyoP8aJnbw=;
	h=From:To:Cc:Subject:Date:From;
	b=ahmy7OJElGvW+VWqcGKDd7BljNCRMBG3J3Yj+OMXH3WQOJY9n76Ytzzb80Lgt/YV6
	 0ZpDQEHZb75zGY6vE0m5HkyLMqwhyE/2iksjc73v7G5V8QUx0JXj1Bs5XSgGuQuYAe
	 JORaRFJzODjLuw/SvqUeWwGXPMIM7nb0U9sOmSSc=
Received: from vokac-nb.ysoft.local (unknown [10.1.8.111])
	by uho.ysoft.cz (Postfix) with ESMTP id 05B17A0364;
	Wed,  5 Nov 2025 16:26:47 +0100 (CET)
From: =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH 1/2] ARM: dts: imx6dl-yapp43: Enable pwm-beeper on boards with speaker
Date: Wed,  5 Nov 2025 16:25:53 +0100
Message-ID: <20251105152555.1992513-1-michal.vokac@ysoft.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Lynx, Pegasus and Pegasus+ boards have a speaker connected to the PWM3.
Enable a pwm-beeper on these boards so the system can produce simple
sounds.

Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
---
 .../boot/dts/nxp/imx/imx6dl-yapp4-lynx.dts    |  8 ++++++++
 .../dts/nxp/imx/imx6dl-yapp43-common.dtsi     | 19 +++++++++++++++++++
 .../boot/dts/nxp/imx/imx6q-yapp4-pegasus.dts  |  8 ++++++++
 .../dts/nxp/imx/imx6qp-yapp4-pegasus-plus.dts |  8 ++++++++
 4 files changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-lynx.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-lynx.dts
index 5c2cd517589b..0a6b668428a3 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-lynx.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-lynx.dts
@@ -21,6 +21,10 @@ &backlight {
 	status = "okay";
 };
 
+&beeper {
+	status = "okay";
+};
+
 &lcd_display {
 	status = "okay";
 };
@@ -37,6 +41,10 @@ &pwm1 {
 	status = "okay";
 };
 
+&pwm3 {
+	status = "okay";
+};
+
 &reg_usb_h1_vbus {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp43-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp43-common.dtsi
index 2f42c56c21f6..6f9bd163ffbe 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp43-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp43-common.dtsi
@@ -26,6 +26,12 @@ backlight: backlight {
 		status = "disabled";
 	};
 
+	beeper: beeper {
+		compatible = "pwm-beeper";
+		pwms = <&pwm3 0 500000 0>;
+		status = "disabled";
+	};
+
 	gpio_keys: gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
@@ -466,6 +472,13 @@ MX6QDL_PAD_GPIO_9__PWM1_OUT	0x8
 		>;
 	};
 
+	pinctrl_sound: soundgrp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT0__GPIO1_IO16	0x1b0b0
+			MX6QDL_PAD_SD1_DAT1__PWM3_OUT	0x8
+		>;
+	};
+
 	pinctrl_touch: touchgrp {
 		fsl,pins = <
 			MX6QDL_PAD_GPIO_19__GPIO4_IO05	0x1b098
@@ -551,6 +564,12 @@ &pwm1 {
 	status = "disabled";
 };
 
+&pwm3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sound>;
+	status = "disabled";
+};
+
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-yapp4-pegasus.dts b/arch/arm/boot/dts/nxp/imx/imx6q-yapp4-pegasus.dts
index ec6651ba4ba2..7332f2718982 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-yapp4-pegasus.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-yapp4-pegasus.dts
@@ -17,6 +17,10 @@ memory@10000000 {
 	};
 };
 
+&beeper {
+	status = "okay";
+};
+
 &gpio_oled {
 	status = "okay";
 };
@@ -37,6 +41,10 @@ &oled_1309 {
 	status = "okay";
 };
 
+&pwm3 {
+	status = "okay";
+};
+
 &reg_pu {
 	regulator-always-on;
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qp-yapp4-pegasus-plus.dts b/arch/arm/boot/dts/nxp/imx/imx6qp-yapp4-pegasus-plus.dts
index 4a961a33bf2d..770a85e0561c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qp-yapp4-pegasus-plus.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6qp-yapp4-pegasus-plus.dts
@@ -17,6 +17,10 @@ memory@10000000 {
 	};
 };
 
+&beeper {
+	status = "okay";
+};
+
 &gpio_oled {
 	status = "okay";
 };
@@ -37,6 +41,10 @@ &oled_1309 {
 	status = "okay";
 };
 
+&pwm3 {
+	status = "okay";
+};
+
 &reg_pu {
 	regulator-always-on;
 };
-- 
2.43.0

