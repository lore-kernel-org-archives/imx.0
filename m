Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D524359707
	for <imx@lists.linux.dev>; Wed, 29 Oct 2025 19:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761766154; cv=none; b=UocrgcCpHZLlq7sIlQt7YnnY/nhM4EUcsXVGNOE426hR6MnrPc+sa8HqoYUGSUOxFNm8M2MVSyvQZRWB+nW+kTPxkf6LkfWDApcs40ZqVpMmI1LLtyCbtuKHQJ89rk3zHUerYkqYYXOfSbT93Z6MUJMPmaxImOGw9g5itQsM8no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761766154; c=relaxed/simple;
	bh=E+yxGzCZFcyhRl056ULuyl5WPwp58wUUUI9XLCSFWXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BO96bB8f2CeVSWsvxC4G41KgC6zVdG1S84eBr0Eh7r9/KJrhUrvpRv8qZdPu9kj/NZoy1GLNy555eGzl5RDuptQZP7MRc0fWA0AuWg3RWWnf8IY+k1CiL/Vv+BWRJvWawh4KokcR96yX8GsLoyhcFHdus+jHymDNgGv18JnqKVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACGSqGp7; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACGSqGp7"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b6d5c59f2b6so57833266b.2
        for <imx@lists.linux.dev>; Wed, 29 Oct 2025 12:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761766151; x=1762370951; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pWDmbZrTdABcUlBNCeOKZzPd6c0px/j6MB6LEuyup4=;
        b=ACGSqGp7cvNOoipJmlBu2tRfQ9RjlRFK5Iu0CZxya2L00adXxLDkFOO/zaymIvr9Ip
         ehBaw+PXPUh5LwtTlIkiVHtgNN7PcYvpVoAR4biXrdBd3mD4RmfUmzIR/59EnMsZQQCk
         co5I4sMASl6KdRdAty4IbOVy86AnDG4ATzVJnRqvoQ2F02zswdq01o5n3YxJBm3D2ix8
         ShZQPruqEh6CM4ZQB1ZaZWh2WlitmeUf6AdrWxhbYcKPNrILycGs37/GEoYEV+yM/5jA
         uRuO5LNl6v1qvojIcvPVhnXUV+m2LXwYCVWacVemmXuSf6vABwC87pba3Jrvt++/ysLZ
         nXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761766151; x=1762370951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pWDmbZrTdABcUlBNCeOKZzPd6c0px/j6MB6LEuyup4=;
        b=km/xo2cfpdNjsTNnSiCbooQEiVX49euEcxzgcuPJN9mdm0/xx//o11TsdesJJoQEMw
         iC58bPZ+u3cAlJhd/lbZ+HW2lrDcCM4O1FsZu9A4zKNBJvetf3/V1OSM1pwEeIf/Se3L
         mAKV4IpeHWSD2usQDktbCz1SD17BGWw/7aYVWLG2XHCcVlngcXbIzXJhVSnKVVXWk/e2
         nw+JqXdoCa+/30UIVEucbyte/MIp8VR/nqP2apDubxM6DDD8TJqOKK4OuQ0y5G9AVtMk
         2eatEmfT+jHFowPcIG3i72zFtB0pT/PBszm4rUnbgP0TFGY1M4VWiyGeRIa/kbsFMgGk
         mezA==
X-Forwarded-Encrypted: i=1; AJvYcCWIKIG3NzQWyuCRvcxRm8LOYLp+DpfgQiF82mR6LjNtZ+2hH5GvmDFyfvvp1GI+R6+IDD8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwYoPmJUJo8dpIXsj2yseEzQa24KUlxgtaz9dg8v/aMJcmOIW9K
	zzS2fy6e4LuyB5fPIrgRW23YSuglhcdxmFaI2eJ2BXFODvehqGc40SXm
X-Gm-Gg: ASbGncsptTx1GiyK0+m2T3uomLlzAnkORLTCDJnjI1O9S0cwQqU9t3Ivq2x8ylb8tGb
	nqbYHml5FAPYkRdimCpeY4pe9OtXlNbUnsbLNDjuhXz78JjmnY1lyt6BemroRY2xtOxJqhVm3xT
	EJLVZDmNoeymI9YchuWiRU2i9g452AuJ/fyJICKN5i5xLpfFfOwHSOz8JiYHqSr5eMYZIBv87Sf
	qWjWWXoTGr93qfftK5DjN1okEQO2LT7ZYSZDQDHwMvemF43dYjvVru8ZLpWP5G9LVw9g3lGh4Pr
	uiIo5x5R9KScJ30ddql2epmQvXnewc0zDSwieXjOzW011mPxhFAyGv/WKlIe+GgFrcGE+E6ru9X
	FMRQ39XcZJLT06rEu3QaYArG1xqCg+ZB4OpOEIyk1y9VFTHd8gK9woLxamy0AfnRyVTV5u1jGpd
	uJoK5YHZTU6YoJCwX1nxqgIuAXCPWfMhko3LcGWZ9H5zXU2Tq7j7nMuiq/5zpflw==
X-Google-Smtp-Source: AGHT+IHwJhZkEKqRnVEte1O7I0899f550vGZfsEycCCZE4aJZvfMSJzZMXQacN9shYw9JF12C9LbCw==
X-Received: by 2002:a17:907:a03:b0:b04:626e:f43d with SMTP id a640c23a62f3a-b703d533318mr342078366b.47.1761766151112;
        Wed, 29 Oct 2025 12:29:11 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-146-98-100.cust.vodafonedsl.it. [93.146.98.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8548eda6sm1496673266b.75.2025.10.29.12.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 12:29:10 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 2/4] arm64: dts: freescale: imx93-var-som: Add PMIC support
Date: Wed, 29 Oct 2025 20:28:47 +0100
Message-ID: <20251029192852.656806-3-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029192852.656806-1-stefano.radaelli21@gmail.com>
References: <20251029192852.656806-1-stefano.radaelli21@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VAR-SOM-MX93 features Dual Freescale/NXP PCA9541 chip as a Power
Management Integrated circuit (PMIC).
The PMIC is programmable via the I2C interface and its associated
register map, and this patch adds its support.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
---
 .../boot/dts/freescale/imx93-var-som.dtsi     | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index 97198007b545..368530f5831f 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -70,6 +70,90 @@ led@1 {
 	};
 };
 
+&lpi2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "sleep", "gpio";
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-1 = <&pinctrl_lpi2c3_gpio>;
+	pinctrl-2 = <&pinctrl_lpi2c3_gpio>;
+	scl-gpios = <&gpio2 29 GPIO_ACTIVE_HIGH>;
+	sda-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+
+	pmic@25 {
+		compatible = "nxp,pca9451a";
+		reg = <0x25>;
+
+		regulators {
+			buck1: BUCK1 {
+				regulator-name = "BUCK1";
+				regulator-min-microvolt = <650000>;
+				regulator-max-microvolt = <2237500>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck2: BUCK2 {
+				regulator-name = "BUCK2";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <2187500>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck4: BUCK4{
+				regulator-name = "BUCK4";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck5: BUCK5{
+				regulator-name = "BUCK5";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck6: BUCK6 {
+				regulator-name = "BUCK6";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo1: LDO1 {
+				regulator-name = "LDO1";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo4: LDO4 {
+				regulator-name = "LDO4";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo5: LDO5 {
+				regulator-name = "LDO5";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
 /* BT module */
 &lpuart5 {
 	pinctrl-names = "default";
@@ -140,6 +224,20 @@ MX93_PAD_UART2_TXD__GPIO1_IO07			0x51e
 		>;
 	};
 
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO28__LPI2C3_SDA                  0x40000b9e
+			MX93_PAD_GPIO_IO29__LPI2C3_SCL                  0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c3_gpio: lpi2c3-gpiogrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO28__GPIO2_IO28                  0x40000b9e
+			MX93_PAD_GPIO_IO29__GPIO2_IO29                  0x40000b9e
+		>;
+	};
+
 	pinctrl_lpuart5: lpuart5grp {
 		fsl,pins = <
 			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX   0x31e
-- 
2.43.0

