Received: from mail-m49234.qiye.163.com (mail-m49234.qiye.163.com [45.254.49.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF9833970F
	for <imx@lists.linux.dev>; Wed, 22 Jul 2026 16:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784737713; cv=none; b=GeE/OAqAE9TINnvsQm1We6TilacMOa9L0b/VYoNHUVugQQlfT+MNJ6cMwXzjMjBqZYnueEGvoTg7tkbYPa0QVJjLF0N//NnKYPoSyXqor+uM6g7CdxxaYACcTds2R4ecfqrmi2vAhZkPIWubNt9sskuHzD9aDU2KGVHm94z6DH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784737713; c=relaxed/simple;
	bh=+qrfvr3yT8Y+h6xVmBZPq0PazhzIv1riYD2bk5pyRCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=taSJusHOzPPKaup7CZA/rN2ViLz9nkHP2oej5I6MTN6ZSiUkWfPdIuzffkS9jNbtccsIuj/i1p6fcz14NDCOeO42Nkm3YFO9pZiDIxvI8D56FUP4YWOXZ1m/sSkKctsOMtW82BBfOinrYb6TTGymn0WrKfqP4crkyIcR/XbheRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=MEtjOhxR; arc=none smtp.client-ip=45.254.49.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="MEtjOhxR"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 472ee9f2a;
	Thu, 23 Jul 2026 00:13:02 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Thu, 23 Jul 2026 00:12:39 +0800
Subject: [PATCH v2 1/2] arm64: dts: qcom: qcs6490-rubikpi3: Add 3.3 V
 output supply
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-rubikpi-next-20260615-v2-1-47c5add80114@thundersoft.com>
References: <20260723-rubikpi-next-20260615-v2-0-47c5add80114@thundersoft.com>
In-Reply-To: <20260723-rubikpi-next-20260615-v2-0-47c5add80114@thundersoft.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Roger Shimizu <rosh@debian.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784736781; l=1550;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=+qrfvr3yT8Y+h6xVmBZPq0PazhzIv1riYD2bk5pyRCs=;
 b=oz2ULZfi8R8+Snmi+7cy+TzM16AQMtpH7zaFM2ofwGio6V+Vxa+K+A9MbQBUnJlOq+Ztkm8Dy
 yX7SKGn1EXpBm6uk9ohRGUYZLpSDUEuezehmSWz8pu87vI80eKn9u32
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9f8a9a19fb09d5kunm8c572dff4a6e65
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZQktCVk1JSBpCGksaGU9ITFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=MEtjOhxRMDO9ufmZRgGso47Kro8DZnI8ia6jvALqxlCKOh15zgbgW4ZIluEvnwOOnfTCpTenJ5hcNKDE1g115+xka1wH8CzqNIUF9IvC4i10mcrNDNlEO330eFLSvSCvQndjBW7i+ro35MRe0oD5Rsapga/XaFxlKK6WACvgxss=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=CULHXGrS+UglX5eAIXw8WS2hqXjXAHSqusYSImSEm7U=;
	h=date:mime-version:subject:message-id:from;

Describe the GPIO-controlled VCC3V3_OUTPUT rail. This board-level rail
supplies the two camera connectors and the 40-pin expansion header.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index d8a9a7e47bdc..45514918562b 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -214,6 +214,23 @@ vreg_usbhub_rest_1v8: regulator-usbhub-rest-1v8 {
 		regulator-boot-on;
 	};
 
+	vreg_vcc3v3_output: regulator-vcc3v3-output {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vcc3v3_output";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&vcc3v3_output_en>;
+		pinctrl-names = "default";
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 
@@ -1251,6 +1268,13 @@ usb_eth_power: usb-eth-power-state {
 		bias-disable;
 	};
 
+	vcc3v3_output_en: vcc3v3-output-en-state {
+		pins = "gpio14";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
 	wifi_reset_active: wifi-reset-active-state {
 		pins = "gpio16";
 		function = "gpio";

-- 
2.43.0

