Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABD81C5799
	for <imx@lists.linux.dev>; Tue, 26 Nov 2024 09:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732612944; cv=none; b=s+4obfrWFmmqa0M2QMta/ZX1oX9O1yy+Q9QLLV91KbuJyE0EGykFj9CCIfLXM3Zos6BoOc26P1W8gK5qPm9wx5GjfXt3TqxPfaY7ZwzqfhJBAhqeX2nM1FmWQuSqTc7NVNfoku4LPGpvwVWI3Cxf6ZHn86s0rfLG8syZu3LbhVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732612944; c=relaxed/simple;
	bh=xLZW2aRQfji5g92cVcho8HCEl8doAepqSdTD7Rl4Ua4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mpXVqWrpAmZW59yLD1NCr1DaNPmFn4BPl8l7DoGMHaVpDVV1AeDgIeYBRcp/OhchKkHUgR6/LBD1uYW9SwLaqiZvjHK92qgskbVoDpzmCf9RsyKg7395FDnVcLXWsuimVlb8QUE19z+31/i2SIckbUX2k5p7UBL9FYFHo5yWOA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.kerkmann@pengutronix.de>)
	id 1tFrlu-0005u9-Fk; Tue, 26 Nov 2024 10:22:14 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.kerkmann@pengutronix.de>)
	id 1tFrlt-000DzK-1c;
	Tue, 26 Nov 2024 10:22:14 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.kerkmann@pengutronix.de>)
	id 1tFrlt-00B5zE-1u;
	Tue, 26 Nov 2024 10:22:14 +0100
From: Stefan Kerkmann <s.kerkmann@pengutronix.de>
Date: Tue, 26 Nov 2024 10:22:14 +0100
Subject: [PATCH 2/3] ARM: dts: imx6sl: add phy-3p0-supply to usb phys
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-v6-12-topic-imx-3p0-regulator-v1-2-c618ed111c75@pengutronix.de>
References: <20241126-v6-12-topic-imx-3p0-regulator-v1-0-c618ed111c75@pengutronix.de>
In-Reply-To: <20241126-v6-12-topic-imx-3p0-regulator-v1-0-c618ed111c75@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Stefan Kerkmann <s.kerkmann@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.kerkmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

The integrated usb phys are supplied by the 3p0 regulator, which has a
voltage range of 2.625V to 3.4V. Thus the min and max values are
corrected and the regulator added as a proper supply for the usb phys.

This fixes the following warnings during the probe of the mxs_phy
driver:

mxs_phy 20c9000.usbphy: supply phy-3p0 not found, using dummy regulator
mxs_phy 20ca000.usbphy: supply phy-3p0 not found, using dummy regulator

The 3p0 regulator handling was introduced by commit 966d73152078 ("usb:
phy: mxs: enable regulator phy-3p0 to improve signal qualilty")`.

Signed-off-by: Stefan Kerkmann <s.kerkmann@pengutronix.de>
---
 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
index 941a2f185056d92f11e6d274d9633b0a3739c4b9..7381fb7f89126e29db05491e751a0d6e519f22f2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
@@ -546,8 +546,8 @@ reg_vdd1p1: regulator-1p1 {
 				reg_vdd3p0: regulator-3p0 {
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "vdd3p0";
-					regulator-min-microvolt = <2800000>;
-					regulator-max-microvolt = <3150000>;
+					regulator-min-microvolt = <2625000>;
+					regulator-max-microvolt = <3400000>;
 					regulator-always-on;
 					anatop-reg-offset = <0x120>;
 					anatop-vol-bit-shift = <8>;
@@ -640,6 +640,7 @@ usbphy1: usbphy@20c9000 {
 				reg = <0x020c9000 0x1000>;
 				interrupts = <0 44 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_USBPHY1>;
+				phy-3p0-supply = <&reg_vdd3p0>;
 				fsl,anatop = <&anatop>;
 			};
 
@@ -648,6 +649,7 @@ usbphy2: usbphy@20ca000 {
 				reg = <0x020ca000 0x1000>;
 				interrupts = <0 45 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_USBPHY2>;
+				phy-3p0-supply = <&reg_vdd3p0>;
 				fsl,anatop = <&anatop>;
 			};
 

-- 
2.39.5

