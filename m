Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5FF168486
	for <imx@lists.linux.dev>; Mon, 19 Aug 2024 12:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724069025; cv=none; b=VSU8yONI35OunVWQRAcf2CdlWbdE5kitf5xxSl1zsBaJL9oAL95OY8hGFVygH0mokvVWb6JxPRMf7eIU1xwcxaHD8w/15jM1B1vCgRRRcrJBvAV07ZhNvZm6BjN2Lb7xFODmVc0fn3KDXif3t7ENJsiV/dNM29k4/zJhx6z0aR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724069025; c=relaxed/simple;
	bh=/55SAbLHgIBqEGqnepM9KYgvl/cueLc5kk8E2B5yxtc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FHA3WiYB+Gj4xVXDZ13Gr/48PIg0j5UPCGq3HXJdCMgfL6DFzdoDier2MOMcr28uLKN6r2WmS57OrZMTkzSPXRkQMTPJ6umotkPRIUs9O8T8TrNc9Io5UY6hkJCaqKMjV9L1K0AN4oAeUnlhYkZGJARaQNnq4lng5wk/HzIuY/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=gnNIGni5; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=QpN68Mui reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="gnNIGni5";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="QpN68Mui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1724069022; x=1755605022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AlLyVPcDweKxoqSPfzobGrSnmdMO77JExhjrPdDR44E=;
  b=gnNIGni5333tKy5rBba1dWzlSi0FUD2xgHOjSQ2jVp7eJ9E39l3CaO0o
   NYKIq3wJjyswuB3Q4ENeokXZkm/U/AAvTjmkbmN4WBBzi5s5A2W2uUIqU
   gRLtymBlAOa2QkzAUowhVa95andTK+CdV637sIIwGsvnHZoA0Ve9gutEo
   LyYeEbl/9Vuf71G4PnG6bXHkHomdBiqRO46tQbIaKg2wYQDbOtp58B461
   myW5WEqzjG6XWfKnvRk4IBLLBLzeeTaSbvXlO3V7dgdn2MIsSoFKNKZNJ
   QhOk5Q7nnAjERX1XylKQlPXY9++yXcv9uaxzzzIgRrdo9RpDFcqd7E/OY
   g==;
X-CSE-ConnectionGUID: JQ62y8yGThuFkqshpWlGaw==
X-CSE-MsgGUID: mztHI6FIRY6wgpOk7Fjp3A==
X-IronPort-AV: E=Sophos;i="6.10,159,1719871200"; 
   d="scan'208";a="38467101"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 19 Aug 2024 14:03:42 +0200
X-CheckPoint: {66C3349D-27-E9ED6009-C4B0BEC8}
X-MAIL-CPID: 7FE3CA89D5D4F40EFEDE0356461F5D71_3
X-Control-Analysis: str=0001.0A782F24.66C3349E.0038,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E8E39166FD3;
	Mon, 19 Aug 2024 14:03:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1724069017; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=AlLyVPcDweKxoqSPfzobGrSnmdMO77JExhjrPdDR44E=;
	b=QpN68MuiMu+OElTmgCIUNXSEmiB+Mfq0T05FJWNZ0yoDggpUZp4V4NCoYH/tzbP/oRRVL0
	i64YfKHBCFDDGrkFsj1mdKx08D0HM8BnTeIJSu5W2oKGzdJ/a9ndAutLcgGbQXj/64VYLA
	lIp5MaU8/F+4Xq2ccB/4PVDmfOrZERbnNWea4LZ+hGjD590xx8d7cEp516Ynomzj2rJX4y
	PcBmwyhALJcuK9+Cg4Q2EDUhhWZMhgiACiWDwTrR54llO9NcDi4W+HjnfY650p5OnkiNpa
	ye8jwo9vDnQm3qYa073b/5WCHPgfMvQCzRHzwY093Nq0VUvYnq1mkZpbfnOHyw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 01/14] arm64: dts: freescale: imx93-tqma9352: Add PMIC node
Date: Mon, 19 Aug 2024 14:03:15 +0200
Message-Id: <20240819120328.229622-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240819120328.229622-1-alexander.stein@ew.tq-group.com>
References: <20240819120328.229622-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

With driver support in place add the PMIC node and remove the
fixed-regulators for rails provided by PMIC.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
 .../boot/dts/freescale/imx93-tqma9352.dtsi    | 113 ++++++++++++++----
 1 file changed, 92 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
index acd08263344fc..041389b369af6 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
@@ -25,20 +25,6 @@ linux,cma {
 		};
 	};
 
-	reg_v1v8: regulator-v1v8 {
-		compatible = "regulator-fixed";
-		regulator-name = "V_1V8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-	};
-
-	reg_v3v3: regulator-v3v3 {
-		compatible = "regulator-fixed";
-		regulator-name = "V_3V3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-	};
-
 	/* SD2 RST# via PMIC SW_EN */
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
@@ -47,14 +33,14 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		regulator-name = "VSD_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		vin-supply = <&reg_v3v3>;
+		vin-supply = <&buck4>;
 		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
 
 &adc1 {
-	vref-supply = <&reg_v1v8>;
+	vref-supply = <&buck5>;
 };
 
 &flexspi1 {
@@ -105,6 +91,91 @@ se97_som: temperature-sensor@1b {
 		reg = <0x1b>;
 	};
 
+	pca9451a: pmic@25 {
+		compatible = "nxp,pca9451a";
+		reg = <0x25>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pca9451>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+
+		regulators {
+			/* V_0V8_SOC - hw developer guide: 0.75 .. 0.9 */
+			buck1: BUCK1 {
+				regulator-name = "BUCK1";
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <900000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+			};
+
+			/* V_DDRQ - 1.1 LPDDR4 or 0.6 LPDDR4X */
+			buck2: BUCK2 {
+				regulator-name = "BUCK2";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+			};
+
+			/* V_3V3 - EEPROM, RTC, ... */
+			buck4: BUCK4 {
+				regulator-name = "BUCK4";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			/* V_1V8 - SPI NOR, eMMC, RAM VDD1... */
+			buck5: BUCK5 {
+				regulator-name = "BUCK5";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			/* V_1V1 - RAM VDD2*/
+			buck6: BUCK6 {
+				regulator-name = "BUCK6";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			/* V_1V8_BBSM, fix 1.8 */
+			ldo1: LDO1 {
+				regulator-name = "LDO1";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			/* V_0V8_ANA */
+			ldo4: LDO4 {
+				regulator-name = "LDO4";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			/* V_SD2 - 3.3/1.8V USDHC2 io Voltage */
+			ldo5: LDO5 {
+				regulator-name = "LDO5";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+
 	pcf85063: rtc@51 {
 		compatible = "nxp,pcf85063a";
 		reg = <0x51>;
@@ -116,28 +187,28 @@ eeprom0: eeprom@53 {
 		reg = <0x53>;
 		pagesize = <16>;
 		read-only;
-		vcc-supply = <&reg_v3v3>;
+		vcc-supply = <&buck4>;
 	};
 
 	eeprom1: eeprom@57 {
 		compatible = "atmel,24c64";
 		reg = <0x57>;
 		pagesize = <32>;
-		vcc-supply = <&reg_v3v3>;
+		vcc-supply = <&buck4>;
 	};
 
 	/* protectable identification memory (part of M24C64-D @57) */
 	eeprom@5f {
 		compatible = "atmel,24c64d-wl";
 		reg = <0x5f>;
-		vcc-supply = <&reg_v3v3>;
+		vcc-supply = <&buck4>;
 	};
 
 	imu@6a {
 		compatible = "st,ism330dhcx";
 		reg = <0x6a>;
-		vdd-supply = <&reg_v3v3>;
-		vddio-supply = <&reg_v3v3>;
+		vdd-supply = <&buck4>;
+		vddio-supply = <&buck4>;
 	};
 };
 
-- 
2.34.1

