Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4C13F7A90
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 18:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773945726; cv=none; b=kz5T1Ff7XuAgM7ZlCb+Ja0h5ALnpSFcKEPE/qwJ6YXblUemTsfPdlnPItcvJprHGId61MgVf4LG1ybhUl7RkBeTbiXFw3pW9RJnzdAU4/VVPzWfXE280Nn9gKlZyjpw/0DXV4EJA9WvE0jk2W/9xa5obPCKHXUCFhfmarmlzSC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773945726; c=relaxed/simple;
	bh=NBG95zW6i90tiCFEeQUOmZfkJk45aW+Rt4XZK3y2dsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rZxabo5s7PXHgjtknPDBYrhHoDttsVNbBaBhk7AjVj59TYS7boHXn2xIcNGY7TwQVPxXHQp92dt9Na7A5ocDbAAK7Qkpks3e0x+h/yK62p6+Yfx7Av+Ii3TsYl+RDnc+GWq5xBiuiGneN63fES4lGgwoqG315WSOWW5nsH2c5SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZOfGa4w; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZOfGa4w"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso11070475e9.1
        for <imx@lists.linux.dev>; Thu, 19 Mar 2026 11:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945721; x=1774550521; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlCReu0S/csjkL3628OmCFhensI/pGag/I8DUVwMu3g=;
        b=TZOfGa4w/dn2cioR97r9M9PStFi0vs6PVKzQnYM1iKGbNKCExgWTBaA6TPB1ahmW1J
         w9qug+wW2nTHs3COLCNdTKpb/O/zaKTCDUOE9SJb9e8YfvK+KgLv5CU2nnbSFwZ0Hx3D
         I8fv2c38JjYB3sq9txO2V5yYbBDQYpqLO1OZ82nY15jkCGO7GpXHyDfOIwLVI65Ge9ll
         65dZlTmlBDgaTgTRrIHCOKjVhwWwYn/dNbUbGE3RBPREmxNd710xj6gCWCKMme504wD5
         szLWKSgz7kyK6YmSQGOcV6aG16WhlQNPfZU224rMHAoApgHiJfIXv4j7mBkysSb5rWaK
         cA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945721; x=1774550521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tlCReu0S/csjkL3628OmCFhensI/pGag/I8DUVwMu3g=;
        b=SMByqaumAl1ssIRtMzaqC1Uh349242N6zCg4DwrQ142xwKQpcWEORfZqhDBlRD1sU5
         UyRATTUQYsPJuuJiAf7h56GjO9NC+3P2h0wh8WQe9k+nlPZfPL60E/VNJBjDPOCM8StI
         pHSiCYWoMuy4DnjQBvCmoyk0LtKVIG356y4pp34v9LsGxEpohyNH5L4Bnu8phJ00ySSr
         +5SPRm6n0ejqfZ6kQTAnM8FscBAu78+CeMzHLalkiBtB9RrM4WaVfbQF37DvjmCTKHvJ
         TVfdUNBQdaYuFUPZdA9VPZE9XkP1oI4sowdLeW7y0vEdt08E8sO7KiEj2041DanClqne
         2taA==
X-Forwarded-Encrypted: i=1; AJvYcCVIeOJcT5IjiyxN9i8SgOCZaDoDadqOn7bd9c40SpUPOavYmrjWlnJWXh0PsU89MQiWQhQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzwF5a5+x5AHUTN9ZU9Xzp8samUvQzG3V9ywqVIM7acwp8Mba5P
	nBJM1sXBdG+gItkN+vjFqzR0DdPLo6hPwtqdyobkmQgA1JPBvLHzqxF3
X-Gm-Gg: ATEYQzygZX70SYKFjA8npuRSeFFILvcyU+Hce0Pc8iQzmBIHqyIPly9Jwr8FcUkP9t5
	RRNIaVm5xtSXF80ZYPd27NAntmPWAbw3Jat5jFQZESn21qvTvV+ncmDtUtRksAvUb3ann998voC
	Kq93IL0uX4WZ/iu49UTWck03fv6XI4R8XAfiFOlxLMi16g+eVZfCexfaGFbhgeW4CZVMv1KVjCJ
	T7zP1UE5bOmJ2cEgoRO/3tcsFTsm2XOZiAyv4GWqFlatmuvfxq8IQJ3rK832zl6NuEmIYi7MVi3
	DSUTXEpsIHzsFt7zPzVj/raP1bLGKCbodsoiJrTYyvXZqLqH7rMkmbU5tO/2KZj16lFRwEJhQSu
	nBW/Semn1hvpBbQEKUF1USGVGh84ISLWaDnTcHQYGnQShq5xXn5ZwlR/V4XXEg7gyAUakxOeCnH
	zb1KwennR6nGaIGf0sObqY4G3S/BWvqKHBolc/ISqLH/qtaVHFKjPLwh+sRLkNKY4KJdY9J34BQ
	vxmHKOxNkWANgLuuUQi7ud+Kcy5JwY3d0WaBg0=
X-Received: by 2002:a05:600c:19d4:b0:485:4278:24f0 with SMTP id 5b1f17b1804b1-486ff03d9d4mr2150745e9.30.1773945721076;
        Thu, 19 Mar 2026 11:42:01 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm77289195e9.5.2026.03.19.11.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:42:00 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 11/11] arm64: dts: imx8mm-var-som-symphony: Enable PCIe
Date: Thu, 19 Mar 2026 19:40:31 +0100
Message-ID: <6c4f4ee33a3c8cf2c36de57bf4f0a706334c10ed.1773944896.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773944896.git.stefano.r@variscite.com>
References: <cover.1773944896.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable PCIe support on the VAR-SOM Symphony carrier board by adding the
external reference clock, configuring the PHY and providing the required
clock and reset properties.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Move vendor properties to the bottom

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mm-var-som-symphony.dts | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index fbad5d2d4a97..857325ef4461 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/phy/phy-imx8-pcie.h>
 #include "imx8mm-var-som.dtsi"
 #include "imx8mm-var-som-wifi-bt-iw61x.dtsi"
 
@@ -17,6 +18,12 @@ chosen {
 		stdout-path = &uart4;
 	};
 
+	pcie0_refclk: pcie0-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -198,6 +205,29 @@ &i2c4 {
 	status = "okay";
 };
 
+&pcie_phy {
+	clocks = <&pcie0_refclk>;
+	clock-names = "ref";
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
+	fsl,tx-deemph-gen1 = <0x2d>;
+	fsl,tx-deemph-gen2 = <0xf>;
+	fsl,clkreq-unsupported;
+	status = "okay";
+};
+
+&pcie0 {
+	reset-gpio = <&pca6408 1 GPIO_ACTIVE_LOW>;
+	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
+		 <&clk IMX8MM_CLK_PCIE1_AUX>;
+	clock-names = "pcie", "pcie_bus", "pcie_aux";
+	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
+			  <&clk IMX8MM_CLK_PCIE1_CTRL>;
+	assigned-clock-rates = <10000000>, <250000000>;
+	assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_50M>,
+				 <&clk IMX8MM_SYS_PLL2_250M>;
+	status = "okay";
+};
+
 /* Header */
 &uart1 {
 	pinctrl-names = "default";
-- 
2.47.3

