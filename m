Received: from mail2.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5132DB79E
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 13:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771421467; cv=none; b=DP+GMnOxJDjJmOkuaEhL5BdcqV6xsJI/OKPfXjZK/c3BCGFv6xAJnwXFFE+CjJw2sa2653oQduWOlO/k1444goVB6B2AUa/7evDjt1+tnFxBYHy9qj+bv+GO1IOXS2gx1v6eZHbik26SrUWLKYnBp6P0YnzenNF6z97enqJ0Muo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771421467; c=relaxed/simple;
	bh=e91Bf0/4F0jSKanW5IP/0WxNZq2xDtnxjA6XIHqZcQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uJyXvCc78AQJO8a1vH/oItLPoTJ0SiugzZh0hpH6KmTWYKqRG6A2zjordHC0jxfpOO1aumAaZcIZC3wxpx4olCF8/w7oKR1aE8f9zkgkpr7wodhkclPVtRwMAz4QGYlnXxkCgiGLRyg8dCs3LbcWDN4IF1WFeQIfEcJvIrVXigY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=tydotcxO; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="tydotcxO"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1771421124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o37TNlF0kYb11kTviCYiAyIK3p/HW+yTrLpm+YqS1P4=;
	b=tydotcxOf2sVdLATrRJpdSfzWtdmiUkSWD7O+3+1tSLsEL6iv/iXGFtgDOBHIchv9bBMri
	WzOtG6HWnp3IMDeu3GXomKVidWw7bFUo95zpa04eTpqwYDyZN8GSwa/b970VZ+ue31coeJ
	MBLKliiXHqlXv+gQjwWI0Ozl20P/WGN2ixJIykocZzQGjBaWwF4FCL1eZV7uuc3ejNQbO1
	JJ/O2GaBuF1Hm8EjGDI4buuOlYY+84Qa2G2eZ8vM7YMn2GeMYPesBbUpmyPPi5b81ZCITb
	o01AVUJxWifjlaxpfls4cCLH2XRfZJb+ClJt25YNcYqyMjs1P5fJ01WEyHL0hA==
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 1/4] arm64: dts: imx8mp-kontron: Fix touch reset configuration on DL devices
Date: Wed, 18 Feb 2026 14:25:05 +0100
Message-ID: <20260218132519.74570-2-frieder@fris.de>
In-Reply-To: <20260218132519.74570-1-frieder@fris.de>
References: <20260218132519.74570-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The reset signal needs a pullup, but there is no hardware pullup.
As a workaround, enable the internal pullup to fix the touchscreen.

As this deviates from the default generic GPIO settings in the OSM
devicetree, add a new node for the touch pinctrl and redefine the
generic gpio1 pinctrl.

Fixes: 946ab10e3f40f ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/freescale/imx8mp-kontron-dl.dtso | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso b/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
index a3cba41d2b531..7131e9a499ae1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
@@ -77,6 +77,8 @@ &i2c1 {
 	touchscreen@5d {
 		compatible = "goodix,gt928";
 		reg = <0x5d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touch>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <6 8>;
 		irq-gpios = <&gpio1 6 0>;
@@ -98,6 +100,16 @@ &lvds_bridge {
 	status = "okay";
 };
 
+/* redefine to remove touch controller GPIOs */
+&pinctrl_gpio1 {
+	fsl,pins = <
+		MX8MP_IOMUXC_GPIO1_IO00__GPIO1_IO00		0x19 /* GPIO_A_0 */
+		MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01		0x19 /* GPIO_A_1 */
+		MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05		0x19 /* GPIO_A_2 */
+		MX8MP_IOMUXC_GPIO1_IO08__GPIO1_IO08		0x19 /* GPIO_A_5 */
+	>;
+};
+
 &pwm1 {
 	status = "okay";
 };
@@ -108,4 +120,11 @@ pinctrl_panel_stby: panelstbygrp {
 			MX8MP_IOMUXC_SAI3_RXFS__GPIO4_IO28		0x19
 		>;
 	};
+
+	pinctrl_touch: touchgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO06__GPIO1_IO06		0x19
+			MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07		0x150
+		>;
+	};
 };
-- 
2.52.0

