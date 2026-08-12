Received: from mail-m49217.qiye.163.com (mail-m49217.qiye.163.com [45.254.49.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1F838A733
	for <imx@lists.linux.dev>; Wed, 12 Aug 2026 03:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786505937; cv=none; b=GxprnuoA+22sKoJ36mRYWCzenTrW3qV30++8MS60l58siTqCFav2vBKRYT7QMeCx+KZJh6VDSmX1N4z6hQJwikgxPNMazzdd2kMb2iCZbOKktbpnjXPKdnl+uC2FsGa0Rnd5i4/bdgBWd6wJOnWFZsQZE5+yQ2ZPMmAJXCk50i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786505937; c=relaxed/simple;
	bh=4AUkVZdED8INaKxYXi8vIBzZp+pos8MPvKlYMVmdfpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ifos6pCyR04ZvsJoEghdWh2JH7R5sjqIU9iMcZjFkgvx8U/ZBGKpvm7UjqwRlnV13PbuvxtAG9JgjkjfkjqGJpCu0EJX4e1sRgFWtXiIYYSTpvC5CPZ/XkiwP/aQgWgYSJ4kpHwuYaOrZsuo5/4JoiEdDuZjXHIfaRKXVkecR78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=gdTFfhtS; arc=none smtp.client-ip=45.254.49.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="gdTFfhtS"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 49a56c4b7;
	Wed, 12 Aug 2026 10:23:15 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Wed, 12 Aug 2026 10:22:38 +0800
Subject: [PATCH v3 1/2] arm64: dts: qcom: qcs6490-rubikpi3: Add 3.3 V
 output supply
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rubikpi-next-20260615-v3-1-06e21232d8e4@thundersoft.com>
References: <20260812-rubikpi-next-20260615-v3-0-06e21232d8e4@thundersoft.com>
In-Reply-To: <20260812-rubikpi-next-20260615-v3-0-06e21232d8e4@thundersoft.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Roger Shimizu <rosh@debian.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786501394; l=1688;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=4AUkVZdED8INaKxYXi8vIBzZp+pos8MPvKlYMVmdfpw=;
 b=olDCzWoPw1qOj+rvq7y1J+YcWz4J6V3EMdvfgrf0OIkb/PiyN7l6OOOM0HZ+hPL7AJDnwX8Zy
 tCtl9HhN0qNAhEOTFM2dfghvWPMxdVLosYXfbRzTQdQenpkXiVEgQHv
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9ff3c7f48f09d5kunm2a4e641d37f494
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGhhKVk0dQkpISR5LThkeHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09LVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=gdTFfhtSZs1rFItb+RETNpXpg/EtDqIk+5ctIxKNYFnpOCVOdFkXF7YycykygZzS23ZPgvZgCrrSJsnFPnGL5F1F5nSGTyJaP9nei6uGIFUjThxBLroXhoVA2d4NaNF0fRnsbdKcB1TAeAUuOXc1OJvKAL5S2OAxcNp4UjbgJGs=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=KWMwlHvU9gSi7icyvD9gEKtDUM9vFD6hRmzH2Pd6GIg=;
	h=date:mime-version:subject:message-id:from;

Describe the GPIO-controlled VCC3V3_OUTPUT rail. This board-level rail
supplies the two camera connectors and the 40-pin expansion header.

Keep the rail enabled because expansion-header consumers are not
represented in the Device Tree.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index 13e8e62f6205..0f21777c480b 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -214,6 +214,22 @@ vreg_usbhub_rest_1v8: regulator-usbhub-rest-1v8 {
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
+	};
+
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 
@@ -1251,6 +1267,13 @@ usb_eth_power: usb-eth-power-state {
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

