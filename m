Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBD4481FAA
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 14:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497455; cv=none; b=ryXQ8GoUWc6oMhrjce92VRyegY1Hp6w04HTh0fbAu02ZEtzUbwu8o8ACkIhRC0C12V1i4qCujHN1YkX51OvEVVPuhLJHmq+fsqbcG4CXyxLQG4mA6C7EGE+uGJvSXtPio6nSKxymxD0A1B/dNpOIBuvyRzeaCIjKXOOOz3GNXfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497455; c=relaxed/simple;
	bh=0YYS7jkrYUXTiFsQHyeEAo9TKyc4891j36hAX5xj8fY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sm4LzlzIgSqkwjfJObzFeTJIBZYZZDh0XOKtP47sDNNJQvu2/sc/jsh6pWiVjZ+vyvMJLYSx4jzFKXNzSEsEW5RLF4tfXeMy/93TrgL8P85Oim0uzhFngk/yBcqzvf9y2UeWHkFk2ZzFHFmFChGLgTexC0I9uA6ar+FqEgmoWZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pHYU6c2P; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pHYU6c2P"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso17809885e9.3
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 07:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497452; x=1781102252; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfUZSTS0CZscO6d5l/TdgGte3dejtKMX2oAoiuKxV7U=;
        b=pHYU6c2PAHty/U4j31I0lj8qMQjpMFCTgnmQAvnf9B9/ETXyivyQcfaENhf8nCcb8l
         RSCJGU3Wddlz0dECyr732BfFAG3nbbCsVGYdymNBz7sCvvJt4V+c3XEhhm5Vy5Qz7dSO
         a3wfyOap6MNXHRoLlNnK4YX5XfRsTp6tBM/HvC/0OSRrTdcBTn/aa3X3Bd6yDlqxvOVP
         ZKAjOI1D1Rwwl2OxCAZmA44hvltp0FqQedpbOPX26C7RePjDpKqHpcCTriFkdZjH6IkB
         /AnDROScQR0Qw4OZZ0aYS5KwctPZnw+q++T0WAZkGO2rPvOaXeNqG9DKNmLIMZVNoYCl
         W4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497452; x=1781102252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SfUZSTS0CZscO6d5l/TdgGte3dejtKMX2oAoiuKxV7U=;
        b=az1L6LxG8fgqty7JDsC7IZYA8GgoacbBT6J5enuJbPUcTgvshhgV51tyb/WqQ1WqBZ
         wASo2cKlCMpiyZV/qHsk1j0lhFM2/j6Y0U+HQERuCPU0BLBGhjhBE9/UYpCsMZF+uHxt
         4DCiQyjeFqvUn7oIxJ6Cb7QOBIAqxLHhGRiNgbwlyxMlpRyjVEUcZBAsvzxN5XcxKn1u
         CB1iEskbCAx5A3YCMdR7KJIUM5z/43gqHtUd+S53IrETTzLZY1kaH0qEWS/PJ1xzmo5f
         KggiuurmaYC4lbTK2UJnKK0M4tmLZuFkFA3JYWvh6WwXCHmlUBwU+7RRgH0uIZVSNGow
         zNhw==
X-Forwarded-Encrypted: i=1; AFNElJ8cM8h4tpRf3S0ZWw2ovwSF/MuWORQZo9zclMKUba4fhYX0T6y+SHcsglVI4pGBsUlMUp0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJaIVleYjDst3+dKkCsXD7x8FRsl26Zy3E55T0QI6DaoFXuIYx
	saevv3UjwKulhWYn6NiUujEU6aHDsvE/K4SxrZ131oQXQqWW6uPGydyw
X-Gm-Gg: Acq92OEsSqcZiWcwf0iBr4NRnvguuNtv1wHTxV1Vzm8OQIYP+0Jzmp2alO0OJMolnWi
	AT+N5TqNbk364cFlSW+in6em+IZW7ZhQd6TCm+fTLLgKm8orx9oQJXkAFRsbq6XxNeMyYnObe2I
	jPuj9I4hT0IxxQvfe25JqmRAXGFyW9rlCsrhOBfWtMcbo6y9kj1hG30tgMNCLn49fe8Gmgpjmvv
	znbZUBj8gTLDOxc4wieE4YQYg0rYR3KxsYXw9o9LUMdgJvwBZbiADQKAx9U6iWppJM217eX6jWv
	R+uajAI6gKfzljopycX7wGtnz4gVyBUXrXYogwj1k3htcNzF5fb5vZqSXWlSk8udjZGYp6Kh+sn
	Io33Ss4NfpbpBq7PjY/VoOkWlp/iPjEMtuN1CPcNlZDLEmrWtGvccziVqAatjUMO0rhEYKqTMF1
	OzSW8h9PxFplOT5Em5WaLn0yY3w4+bmkFHJva7cv0NeCZWYCbQpDOUb5MxQl3eRLjlghIHViXS0
	C1JMowFrU7VIp54J5CJsSuYt5LVJRStYWYeK0ud/M2xog06khp0KwkuxEk=
X-Received: by 2002:a05:600c:5288:b0:48a:53ea:140b with SMTP id 5b1f17b1804b1-490b5ed01damr61804125e9.28.1780497451711;
        Wed, 03 Jun 2026 07:37:31 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:31 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 05/14] arm64: dts: imx8mp-var-som-symphony: enable header UARTs
Date: Wed,  3 Jun 2026 16:37:12 +0200
Message-ID: <52dc9b387d337c646718378306e76a1bb70616e2.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable UART1 and UART4 on the Symphony carrier board and add the
corresponding pinctrl configurations.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index b15ca44b9a92..9500c9bf0f42 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -154,6 +154,13 @@ &snvs_rtc {
 	status = "disabled";
 };
 
+/* Header UART */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
@@ -161,6 +168,13 @@ &uart2 {
 	status = "okay";
 };
 
+/* Header UART */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
 &usb3_0 {
 	status = "okay";
 };
@@ -261,6 +275,13 @@ MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
 		>;
 	};
 
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX				0x40
+			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX				0x40
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX                            0x40
@@ -268,6 +289,13 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX                            0x40
 		>;
 	};
 
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX				0x40
+			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX				0x40
+		>;
+	};
+
 	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14                             0x1c4
-- 
2.47.3

