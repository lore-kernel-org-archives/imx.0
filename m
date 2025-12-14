Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067BC29D280
	for <imx@lists.linux.dev>; Sun, 14 Dec 2025 11:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765710353; cv=none; b=DdGmRsoHvfI+EuMvrIVOmTUMGg995MJRlueakdHLBanEdoarydHmpkNZ+zoJ/svhSsnKnQ+Yx9wRLHsTpdFWnWrpykuQ1whmDa4knx0em/ktA8FGb/UsBDBZYYp0K9wFHZCRTzoRd/2nDY9zMmKslkmId0gEx1ImXD5wn5IffOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765710353; c=relaxed/simple;
	bh=7ljJ05ztTohJDBRhGnpzl50vRdnwmAmrwNkbp/q570E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WP4tnZgSWpSmJij5cBF+dLMq2uEroAxUs+ayxmAstRmsA2tlPRP2eWuaYOeTY9N6PYtrHHwp3iPK+vCJYs7Vb3HbvL2V8SYcAsZtrxJBB8feAleR21vVniV2PhKBVtSa6h8pO3uEcAgiAjsKUmf9pEbj0HNn2nUFZcbxMg9BjLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7SIhEvt; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7SIhEvt"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42e2d02a3c9so1615383f8f.3
        for <imx@lists.linux.dev>; Sun, 14 Dec 2025 03:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765710349; x=1766315149; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d98j53CwylYGkDXzrv9xLEHUO5ol14s3GpQ93nPd4ok=;
        b=G7SIhEvtQ16vIxPRH0NcHMAyAV+K9XdSdZDT3+Q/fMudO2IHtlxfh3zXCtGKOaeU/p
         kZv/qgzAPRhQI+1aGwcTwgtql6qA8XE2mLPjGqP4Hc4A4xvcPfy0df2tXXReKm/kMmNl
         U/sXPfwi64CEXo0pXdQkAymzA5RDNIJzVUi/k38W2q2dMiyWy7W8UiUW/4e37prv2ogb
         05i8UkCTiCoVmuKGkbciCtK00N/lykSEtYCVk8D5VC9lts29OrhJlkbRqRbqcfSeYMID
         N3Wj6j8b257WfkugDBmOo51tVMT0W8s7rWMjkEbUCVJJP2zQscgqbhu/JPK38dYuOCLZ
         MIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765710349; x=1766315149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d98j53CwylYGkDXzrv9xLEHUO5ol14s3GpQ93nPd4ok=;
        b=nUo1kWCRKRiTY+/i4/rvOtN0jhjFE1UL08VJtV2aMfj/U9XOMS+QPMqhc/4IS0kB9x
         sP/SoA18NmnmMag86Z4o8cc0iQzCYtYrExf/9Hfv89HJpZkBLhIEZvMH09h0NDfUze9x
         sTtn9V+Sc7oGRopS3XPzrfuybkraeLM+u2Txm+Y2vv9rdkxu9VHKa27f/PSHykVAy13p
         RSa59GPfqdw4bU8GGUHa32Z936iMiM9cyhujIJslXz512tkvzuEvam5RtH80+e/8gyWL
         7+LOrQgp8VQDCu0hdR2K7Dt58UGu8SODS6demSZP7/VxAHTNxbz7DB8hjfTZMG+5Ovfr
         8e7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+U7xNlBlDiT0OCGuObtP1x5xF73lq+OqIirkVQEIYGfOMmjNeNh6JFxoZAOTezC2nf+Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqGDKUtwLItDCxD1+EkRNYK0H7EPFEq+dbcZovMgtpuI2625hY
	VbILGf+NsB388YLkuJBe7CrZLs3KZXF2XFkf9+WbUhSpGG3erhCLI7TX
X-Gm-Gg: AY/fxX6OUvLWulAfF7tyT03epzRfML92DSLb2YArQTKyjO4N6yhuxVM1YjksZoyyB2C
	sBO5nxiGouqqGWUG5jCw5mY6CUE1BMrS7GjZQpsNWF8P45SPSL16ikDslroK0J1F6GEIElCHqxR
	XlEIwIO5lbge9cD+4rsgEOaaqp7rR+oUMQpDDuILk6D9kswyibHFCMRfHqw9jDKmNe2vLNb7lMJ
	FBt7AyOA62cjXTXiktOaBRmh2WeRiwTJ/R7Fx30tVCP652KE9l4YpgUPTEZkdw3b7frbdBHhks0
	julbLwn364kagTb+ML7MGwls0utzaYDZ8IiCBZlncMBCQTybl3Cf2r0nbYRJDjYlYlvlxgo+R4c
	pQm+6WOJGdPf4nGirAUJ/+IBMgBtLIGnYputpRCo3ybD1FORG/qTfO/8I7QxbUlA2JrxL/tNEJq
	i1yN3pim4Q6c7k2+2lnpC1V+v2WClc+OqHxDFxVmUq7WDxVrFEIW2I4N0WMHK+bx7ZfKXtSEU5R
	tVCHlojishtLiY=
X-Google-Smtp-Source: AGHT+IH8uGQHUEGjnwmbuaTG7OA0INNOSmTaWG92qY9kO76Cptm1NW4J26INzPWirk186SsdGwe35A==
X-Received: by 2002:a5d:5f54:0:b0:42b:396e:2817 with SMTP id ffacd0b85a97d-42fb48ff7cemr9210148f8f.40.1765710348922;
        Sun, 14 Dec 2025 03:05:48 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f36b6a19sm7823660f8f.38.2025.12.14.03.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 03:05:48 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/6] arm64: dts: imx8mp-var-som: Move USDHC2 support to Symphony carrier
Date: Sun, 14 Dec 2025 12:05:24 +0100
Message-ID: <20251214110531.9475-2-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251214110531.9475-1-stefano.r@variscite.com>
References: <20251214110531.9475-1-stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VAR-SOM-MX8MP module does not include a microSD slot connected to
USDHC2. The USDHC2 interface is routed only on the Symphony carrier
board, and it may optionally be used or omitted depending on the
customer's carrier design.

Move the USDHC2 node, its regulators, pinctrl groups and related GPIOs
from the SOM device tree to the Symphony carrier DTS, keeping the SOM
description limited to hardware populated on the module.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts | 77 +++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 75 ------------------
 2 files changed, 77 insertions(+), 75 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 36d3eb865202..ea3c193bb684 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -8,4 +8,81 @@
 / {
 	model = "Variscite VAR-SOM-MX8M-PLUS on Symphony-Board";
 	compatible = "variscite,var-som-mx8mp-symphony", "variscite,var-som-mx8mp", "fsl,imx8mp";
+
+	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "VSD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio4 22 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <100>;
+		off-on-delay-us = <12000>;
+	};
+
+	reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
+		compatible = "regulator-gpio";
+		regulator-name = "VSD_VSEL";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio2 12 GPIO_ACTIVE_HIGH>;
+		states = <3300000 0x0 1800000 0x1>;
+		vin-supply = <&ldo5>;
+	};
+};
+
+/* SD-card */
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	vqmmc-supply = <&reg_usdhc2_vqmmc>;
+	bus-width = <4>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14                             0x1c4
+			MX8MP_IOMUXC_SAI2_RXC__GPIO4_IO22                               0x10
+			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12                               0xc0
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK                                0x190
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD                                0x1d0
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0                            0x1d0
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1                            0x1d0
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2                            0x1d0
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3                            0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK                                0x194
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD                                0x1d4
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0                            0x1d4
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1                            0x1d4
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2                            0x1d4
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3                            0x1d4
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK                                0x196
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD                                0x1d6
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0                            0x1d6
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1                            0x1d6
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2                            0x1d6
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3                            0x1d6
+		>;
+	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 29f080904482..949d9878f395 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -35,27 +35,6 @@ memory@40000000 {
 		      <0x1 0x00000000 0 0xc0000000>;
 	};
 
-	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
-	        compatible = "regulator-fixed";
-	        regulator-name = "VSD_3V3";
-	        regulator-min-microvolt = <3300000>;
-	        regulator-max-microvolt = <3300000>;
-	        gpios = <&gpio4 22 GPIO_ACTIVE_HIGH>;
-	        enable-active-high;
-	        startup-delay-us = <100>;
-	        off-on-delay-us = <12000>;
-	};
-
-	reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
-		compatible = "regulator-gpio";
-		regulator-name = "VSD_VSEL";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <3300000>;
-		gpios = <&gpio2 12 GPIO_ACTIVE_HIGH>;
-		states = <3300000 0x0 1800000 0x1>;
-		vin-supply = <&ldo5>;
-	};
-
 	reg_phy_supply: regulator-phy-supply {
 		compatible = "regulator-fixed";
 		regulator-name = "phy-supply";
@@ -271,19 +250,6 @@ &uart2 {
         status = "okay";
 };
 
-/* SD-card */
-&usdhc2 {
-        pinctrl-names = "default", "state_100mhz", "state_200mhz";
-        pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
-        pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
-        pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
-        cd-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
-        vmmc-supply = <&reg_usdhc2_vmmc>;
-	vqmmc-supply = <&reg_usdhc2_vqmmc>;
-        bus-width = <4>;
-        status = "okay";
-};
-
 /* eMMC */
 &usdhc3 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -358,47 +324,6 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX                            0x40
 		>;
 	};
 
-	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
-	        fsl,pins = <
-	                MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14                             0x1c4
-	                MX8MP_IOMUXC_SAI2_RXC__GPIO4_IO22                               0x10
-	                MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12                               0xc0
-	        >;
-	};
-
-	pinctrl_usdhc2: usdhc2grp {
-	        fsl,pins = <
-	                MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK                                0x190
-	                MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD                                0x1d0
-	                MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0                            0x1d0
-	                MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1                            0x1d0
-	                MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2                            0x1d0
-	                MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3                            0x1d0
-	        >;
-	};
-
-	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
-	        fsl,pins = <
-	                MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK                                0x194
-	                MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD                                0x1d4
-	                MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0                            0x1d4
-	                MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1                            0x1d4
-	                MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2                            0x1d4
-	                MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3                            0x1d4
-	        >;
-	};
-
-	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
-	        fsl,pins = <
-	                MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK                                0x196
-	                MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD                                0x1d6
-	                MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0                            0x1d6
-	                MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1                            0x1d6
-	                MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2                            0x1d6
-	                MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3                            0x1d6
-	        >;
-	};
-
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK				0x190
-- 
2.47.3

