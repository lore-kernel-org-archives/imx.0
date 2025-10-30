Received: from mx-relay17-hz2.antispameurope.com (mx-relay17-hz2.antispameurope.com [83.246.65.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102C9258EC1
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 13:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.159
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761832446; cv=pass; b=TVlMoU0GImq8hwXZZC2/s17L1DAxEe0kgnxnJveDb0tdnrOpGH2hOzLuoUp3FSJzbRVyTTN5sMVGj4VRBJUU362s3TFK4SEAM+0LsAhMx0hreiLJYfaHBfRCJ19K+mGwC/8q3jWK5oEySeRhI6Z11FwRtBXre5kaNHSawGDYGgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761832446; c=relaxed/simple;
	bh=7TJedIY/9UFJw10oGIKYKIy0SHdFPabonZXK+kKB1VY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=puB9ALV7jBUUwDWPXw02Ox8mRAhoV/FKtkwO78im1Y3JfGsmmHhOmcEg6FMLPG0JqWdNldQWrDmw11ZeW1v8ilOgS1eetANvjL+6WKvhP2W4SUQz8voJ3m5Ltl9i5UolVINY4KIzJHVZDOL/zUtESEfTPUTDfqrmlBT6TDl7ncY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=SXQbY4cM; arc=pass smtp.client-ip=83.246.65.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="SXQbY4cM"
ARC-Authentication-Results: i=1; mx-gate17-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=ftODCMJWq6xxBVzz35BWN/b7GEhpvIJPEY0znOy+1pQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761832403;
 b=ZOKcQMBc4KuljaC76jILfF1SONPkyaisM6qsi5vH6wVBJZJD/5r/dZ600kFUIeBfUED6Breh
 niv8DuvSaii6zXCTssKYKyYR6WQUReAMtNqA1IBi09POQNw8iBS+Eows6If8Q8NeqXtH1Rajmqv
 3Pqy/4kD4ybtedQfXBj38N2/ckYw9ZnDb3orRJHoFloP4M9tfWv5bd4EXmYYg1v+wAWM3CuDAkl
 KUm/Uo56KKGxW+tIQxMDdrNR1Og4nTYdJkzcfInD4RpCeDReZfNHcmcGdAS2GAg7LQHcchI/1P/
 0lxxjUS+e+JrFAhZVGOz5KvTLUWTXmvh+ycVkGnouOjhA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761832403;
 b=FpMmpnnEMiSLUiE94xIMAI8Jb/a/OJtE+vWUrSgDetNf9e/1EAqL4W53fiDKm9V/PVw7EMVK
 3hv1CFkHv0NwEX7js2w2pI2wbkGzFzyCbEX0F17Alg63tzKBM7ruH8Km9Skh07FP1AD/Pd9KFix
 MQJe9lhiUu68kXAwgWkkS20DsbDk1d82rV7FnhORPnELPT7AIu/oZ2kSaJt4RYodN1RqxQB/msk
 z78KUe+JSx0VcEQbO7UR2wuZoXURxG/aqeUipm32iPT5GcjzEylajmOVoZbIRnF950UbN0dwVYE
 UqtP9OYw09Q7YU5sJg5tInUtmPMO8r08KYFWFRj7s60cQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay17-hz2.antispameurope.com;
 Thu, 30 Oct 2025 14:53:22 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id D53C65A04FC;
	Thu, 30 Oct 2025 14:53:12 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/19] arm64: dts: imx95-tqma9596sa: add gpio bus recovery for i2c
Date: Thu, 30 Oct 2025 14:52:55 +0100
Message-ID: <20251030135306.1421154-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
 <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay17-hz2.antispameurope.com with 4cy5D94wS6zdbpV
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:4ebec40930e540c73b0a44225c3aa667
X-cloud-security:scantime:1.733
DKIM-Signature: a=rsa-sha256;
 bh=ftODCMJWq6xxBVzz35BWN/b7GEhpvIJPEY0znOy+1pQ=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761832402; v=1;
 b=SXQbY4cMqGcRPR6j8yU7VEbdBkrIlAnpvlVx9K/j2Wn17HppT5K1uUxuBI6n1B1NHSj63d5k
 5I5FDQjO6RkkkmW5ckHGYTMd2ta8HQ6J31esgX4r9pXtk7tcP9ilmaGXVbztssx99m2NCseckx1
 YKk6qLVzxL9oEPsJ/McjtEGDAreuSE92UBfckzDUTvFCjDCdmeqT2MGVjc4gEbX7wiUm+EfSFyV
 lFTyWkF7q/qx+GvamVYAVqQeedXBrYXArD8Dm5Br9rVjPiYrCLdbV31UKeizUtk3mfZ5u4H1WCz
 EyYzq0c43O5/gpkShAeaeu/lielRq4kpII3zQZktNbuFA==

Add pinctrl group for GPIO based bus recovery.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/imx95-tqma9596sa.dtsi  | 30 +++++++++++++++++--
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index cc251505f6280..9c892cd8ff215 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -263,8 +263,11 @@ expander1: gpio@75 {
 /* I2C_CAM0 */
 &lpi2c3 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-1 = <&pinctrl_lpi2c3_gpio>;
+	sda-gpios = <&gpio2 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	scl-gpios = <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	dp_bridge: dp-bridge@f {
@@ -299,16 +302,22 @@ dp_dsi_in: endpoint {
 /* I2C_CAM1 */
 &lpi2c4 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_lpi2c4>;
+	pinctrl-1 = <&pinctrl_lpi2c4_gpio>;
+	sda-gpios = <&gpio2 30 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	scl-gpios = <&gpio2 31 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 };
 
 /* I2C_LCD */
 &lpi2c6 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_lpi2c6>;
+	pinctrl-1 = <&pinctrl_lpi2c6_gpio>;
+	sda-gpios = <&gpio2 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	scl-gpios = <&gpio2 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 };
 
@@ -606,16 +615,31 @@ pinctrl_lpi2c3: lpi2c3grp {
 			   <IMX95_PAD_GPIO_IO29__LPI2C3_SCL			0x4000191e>;
 	};
 
+	pinctrl_lpi2c3_gpio: lpi2c3-gpiogrp {
+		fsl,pins = <IMX95_PAD_GPIO_IO28__GPIO2_IO_BIT28		0x4000191e>,
+			   <IMX95_PAD_GPIO_IO29__GPIO2_IO_BIT29		0x4000191e>;
+	};
+
 	pinctrl_lpi2c4: lpi2c4grp {
 		fsl,pins = <IMX95_PAD_GPIO_IO30__LPI2C4_SDA             0x4000191e>,
 			   <IMX95_PAD_GPIO_IO31__LPI2C4_SCL             0x4000191e>;
 	};
 
+	pinctrl_lpi2c4_gpio: lpi2c4-gpiogrp {
+		fsl,pins = <IMX95_PAD_GPIO_IO30__GPIO2_IO_BIT30		0x4000191e>,
+			   <IMX95_PAD_GPIO_IO31__GPIO2_IO_BIT31		0x4000191e>;
+	};
+
 	pinctrl_lpi2c6: lpi2c6grp {
 		fsl,pins = <IMX95_PAD_GPIO_IO02__LPI2C6_SDA             0x4000191e>,
 			   <IMX95_PAD_GPIO_IO03__LPI2C6_SCL             0x4000191e>;
 	};
 
+	pinctrl_lpi2c6_gpio: lpi2c6-gpiogrp {
+		fsl,pins = <IMX95_PAD_GPIO_IO02__GPIO2_IO_BIT2		0x4000191e>,
+			   <IMX95_PAD_GPIO_IO03__GPIO2_IO_BIT3		0x4000191e>;
+	};
+
 	pinctrl_lpspi3: lpspi3grp {
 		fsl,pins = <IMX95_PAD_GPIO_IO07__GPIO2_IO_BIT7		0x51e>,
 			   <IMX95_PAD_GPIO_IO08__GPIO2_IO_BIT8		0x51e>,
-- 
2.43.0

