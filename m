Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6483476CF3;
	Thu, 13 Aug 2026 12:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786624946; cv=none; b=RkZWw4sToVNROFInOmxDyMpgSj0QuVW2Uqw9skBdekPVGh1yU5JL+ECHxkb6Ld/VmeR/wRESPcmK8Z4B0ABUoDc0XK/sexYIHtY4J6FBaPLf6fjveiEFQo7cyVppe9cJihmWeGvDHaNScfu3n2UM/BoMnrXcfCg1ZkZuXPlUoiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786624946; c=relaxed/simple;
	bh=IziNnZNk7z+jo8WWgFO+jaaBCuHRlXBQ++5+VFAUVY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cqxl9vZZIg1ODwyALclUZ2QG+RpXXUdKGle4zzwfWdNj4zFYnjIrkGwmWy96VL65mLWyYvycISUyAX0um+Z5aba+xl/elzcOIJ0PrTopNRlxKEWHkrF6JjXIZI90QP08Cth7S+nqwR4t6v4QssB/BhNiLcLkY0E2I6qX4EprXUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=fdXYo5B0; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="fdXYo5B0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=c+VeLjO2DwFBf6rQsy8olsg3EAsIDvKkOvaB8/Zphig=; b=fdXYo5B05QUYmO2FSc7a5QyqLd
	NTmvkskK6jev/tYpRFQ0RGjzuMfGWd1Y21fSR3X2nYSYRHyInyJOJB/lJZ+tKLPBcN59zFRM8DEhf
	HfJxkhb6I1HNndVy6UShwz+X29+SY/ZvflkgZWDjn+RiPWq5uSUB3fHr7biYYPmPBadqSeTHNqIUV
	GKfpV0Q53bNxIxmljRKGt5zUN/pPtf1Of2rDWLXGWVpaku2t4mrqyHCpm8v1nBpD8voqDv012WMnb
	KLYPe6/WeJl7cIrLaiHmCiFj7V/QqlwFU6hQn3NPfNaUIZiE8xYGKvP9GorrmcCBUoQYBZdNsMUww
	1qfr8VRA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wuUIu-000BXJ-34;
	Thu, 13 Aug 2026 14:13:01 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wuUIv-0005zb-1I;
	Thu, 13 Aug 2026 14:13:00 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: mba6ulx: Add USB hub node
Date: Thu, 13 Aug 2026 14:12:46 +0200
Message-ID: <20260813121250.3993187-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813121250.3993187-1-alexander.stein@ew.tq-group.com>
References: <20260813121250.3993187-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28091/Thu Aug 13 08:25:54 2026)

Instead of handling the USB hub reset using a regulator, add a proper
on-board USB hub device with reset-gpios set.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
index dea473f660f91..2327528b402f3 100644
--- a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
@@ -133,16 +133,6 @@ reg_mpcie: regulator-mpcie-3v3 {
 		vin-supply = <&reg_mba6ul_3v3>;
 	};
 
-	reg_otg2vbus_5v0: regulator-otg2-vbus-5v0 {
-		compatible = "regulator-fixed";
-		gpio = <&expander_out1 0 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		regulator-name = "otg2-vbus-supply-5v0";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		vin-supply = <&reg_mpcie>;
-	};
-
 	reserved-memory {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -407,10 +397,18 @@ &usbotg1 {
 /* 7-port usb hub */
 /* id, pwr, oc pins not connected */
 &usbotg2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	disable-over-current;
-	vbus-supply = <&reg_otg2vbus_5v0>;
 	dr_mode = "host";
 	status = "okay";
+
+	hub_2_0: hub@1 {
+		compatible = "usb424,2517";
+		reg = <1>;
+		reset-gpios = <&expander_out1 0 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&reg_mba6ul_3v3>;
+	};
 };
 
 &usdhc1 {
-- 
2.55.0

