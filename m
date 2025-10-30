Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E4F31DDB8
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 12:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761825770; cv=none; b=jesGuK6HvR0IFmrVFkTvoIm+YY0LbOn6lXCbnyq3kz1VpRIk3MLmaPwnxbbFyUOWWffJDGuZNHS++/OALfRZyCGmEKsHgVwfGYzKcuQhlwbEN/JBaCqXUCfKigkEn4TkZ1gBYu9eZYfDNZGq5szZX/kLt+bBRchRFfgIAMqD7Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761825770; c=relaxed/simple;
	bh=YANsc/aUJY7yFzRK813J7R8e4uexbNeXv+bcwl/+HbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZWb7iT++COpWJj6oXH4uR9HZzUrC8UGsphVuJSx9/R8mtIO1Ob7jTM4erBuj4aUkHj30rvkb4tPR7Mh3Tbj6EdJ53scuCXEBcM8S1OugmK16rvJVGPILX56r+gbYkXYZmc6s1GmjHLVS7zXb8WiEdm2lwrygbdMmuemPJN/q28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZ8T8cfA; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZ8T8cfA"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42557c5cedcso598816f8f.0
        for <imx@lists.linux.dev>; Thu, 30 Oct 2025 05:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761825767; x=1762430567; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0mFQTcGqmSkiKPfup/qBvNwcKsotJhGPnyj9Bdv5bM=;
        b=MZ8T8cfAXl5HB33IqKfsmP/TOjEydR1bOXkKJmzmjWR3AS5QSl8oWSSDWVsywrS93j
         YHxZRgW2H9pmaeFwWvdiRXGkFJ5l1sbxXC5GKX5IQx0lHcf+/JWzpWTu/XYptYaAXIuD
         ZZvAe69+GBHhsPAv+fHjymmiY/i4n35F9Yy0QLf/JMQtb7qoz9p6ANjqVFovsX/kgk53
         vFKME2IDZXIyRNFQZXed4kHELjU3xyV+Ymn0C+FHsFBJOA5Ap0hxhg1g8x0AsaX1+B9/
         8WeqsiUt/8Bs5l7QTrBQjoKOWIYM56qep1BrMoceNPtVhQJYoMmxLfHtfQRcB8LPeezS
         YfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761825767; x=1762430567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0mFQTcGqmSkiKPfup/qBvNwcKsotJhGPnyj9Bdv5bM=;
        b=UNb/8Lx0CUA76kmuz4iZ3TljM2MOcki5yFLzAa1k9JruI/rF60SO7K2l4cfD/a/zdC
         SJhgOGBoL35pYvHjA3uoh60pIi+2ks64YaItmhQqLfUZWEnzRHN9ICggYuG0zcti1aI8
         O3nNXV5eiWwiXK4ZSwd0VMOGnUi5e00EDrIkzyf8PZCsOOdw72SnC6LxL2Wv9G3GoQ04
         iPc5e1cU2TqW3+szEMYsybw340R00CuvmVzIDhF6Q75UflIL8Xz6+ENM1m8XohBpBaJY
         gqMsRg5CGxgGT17J57gsT48HK0nG1ECt+cyg7crqJHEp4vtgqCokl7j83rJUZzsrSVG8
         AR4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7fkptSTg1k8SqGHMryWmlMZLXkz2o13kfE+towU0O+/CeVdxVYOwuL1OYLSYPkoyau5w=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQdr4BTI9RZ2BiltKO7UN2MkijSo4HmKvP1Zw2q5kDujuFi24n
	lXbgkSSUvQcOT/lxLCgNcBGem4r8DH5J7iRT7Rzvo10Pthn4HXaIcYRO
X-Gm-Gg: ASbGncuiBf2Ym/lXiVsYowSvpQW5OlM3rXDAwF+6tpYkPAB/vnJki7sv/0yq0gpMdqy
	nMQPuwxDwFDdVFtyUuI9ixQ4f7oBeFGGlJxsDFbebc31yUmw3T2ArNY9pnbSqUkbxvQMtJKBeov
	n5EnNBFOIAa29htYyifnWOVi1o3V2iPF741ZnJuhRwxOcs7ymgj5f5xZ1Xr9T5Kf7DfKa2386u/
	oFq6h4uHjfqXJXkiWJawJHb2FLIvwvvzTXJq5mPIroscLEoXn5wJ04Zdy2DwOfWSG0/84K1H8IN
	XQhirmSmo0Jz0YvI+DEwHq6akz1OuTlW8vfRf1TGTVlaMF/Jj461PdZ6zKgo11EBVLulTdpkxg/
	okHGkFM//0XoHtHu97r2iah7j1s66Ziq/WAAnrJ9wlwxxj3jtieg9xB9X9qqnRZkqwm/myG70dC
	PP5w1rp5hTok4OBtAkopR9WUxo7MXJ8nVofNKsD3lTwLzVwhxYZ51J0j10iZU3c+CHeQGYSpS8
X-Google-Smtp-Source: AGHT+IE+1Y1iMggZfF62Rfc9eTffUBllTx25tgqnlq9EBnWiqaF5y6rvo9W+qkPwMxETU1MJsDHwbw==
X-Received: by 2002:a05:6000:240f:b0:3ec:db87:e8fa with SMTP id ffacd0b85a97d-429aef830bbmr5741010f8f.26.1761825766901;
        Thu, 30 Oct 2025 05:02:46 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-146-98-100.cust.vodafonedsl.it. [93.146.98.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429b9b436efsm2399848f8f.23.2025.10.30.05.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 05:02:46 -0700 (PDT)
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
Subject: [PATCH v2 2/4] arm64: dts: freescale: imx93-var-som: Add PMIC support
Date: Thu, 30 Oct 2025 13:01:22 +0100
Message-ID: <20251030120127.509933-3-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030120127.509933-1-stefano.radaelli21@gmail.com>
References: <20251030120127.509933-1-stefano.radaelli21@gmail.com>
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
v2:
 - Fix pinctrl alignment

 .../boot/dts/freescale/imx93-var-som.dtsi     | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index 37f7837fb5ac..85fd9c9c9372 100644
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
+			MX93_PAD_GPIO_IO28__LPI2C3_SDA		0x40000b9e
+			MX93_PAD_GPIO_IO29__LPI2C3_SCL		0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c3_gpio: lpi2c3-gpiogrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO28__GPIO2_IO28		0x40000b9e
+			MX93_PAD_GPIO_IO29__GPIO2_IO29		0x40000b9e
+		>;
+	};
+
 	pinctrl_lpuart5: lpuart5grp {
 		fsl,pins = <
 			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX   0x31e
-- 
2.43.0

