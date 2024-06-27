Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E52F13B5AE
	for <imx@lists.linux.dev>; Thu, 27 Jun 2024 10:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719485327; cv=none; b=UKBhjC0I75bihdJGn+kIBB+M74z02FDfEZCR6qd1ykZ3x78rh23RzT+Yh//0e5liz7gOxySKfcPWYm+s6bGr2Jw/SXLzz9A0jCN+qBVddWXKHlNgFXsAtzlweAXqFinkVQSyAXxfThYfKZzU0sJNylIve2yxVB4kUFlW03I4D6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719485327; c=relaxed/simple;
	bh=E3tkZi5Re0xZBXiTJIkaP/WSpbFH1vO+uf3euVwYTiM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KFwsjXjlt28KIouw39BqeaWaJtb2jY/tmRSO8Agul5KSUM9ERuKxP/CYUzvXGjZf1n1Fp3ftgrvNzzwNaTK7gLJrjRQEc0PbYSRFX0eJv2OHfAXZX5FUW6sxvczElEdWtOfS+YkVDQ6B37ZSEXu/kVCJFc1sr4RXM1vJbBc4qeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldaZPDhP; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldaZPDhP"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52db11b1d31so2736734e87.0
        for <imx@lists.linux.dev>; Thu, 27 Jun 2024 03:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719485324; x=1720090124; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UB49lb/IgQI+QFjiW4RxbsxUbcomLADrjUg4RQdZZT4=;
        b=ldaZPDhP02X9fRbLhJIzY8WjPlOGwyAEDD9i0nxZkluL06GIxwjYu+n4iBWqUQ2X8o
         EBe1I+UR/w8pX9BQL/9iwfQOvKfwva9Df4f0jfzfN2/0NTYJwGuDuqtkw9QgKuZFX1gC
         YgPmJiM+jUKkViN+T799+c7RJK3Res7tddIBikWGSmsz6T15ozq/Ij5pOygJXgtAKVOZ
         eFH2xWBzV45N/Jjyb6UWVRyVNfZHzdvxXSzH/bEVKQ0kILDEqcbnKHSHLzHFCV3TtojL
         j4uHqMsBT4/zMHCs6TkjBJmgpVB65SEeWgLOfdcMfsftPllaCIf4DQQxs08zufyoEJf+
         pG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719485324; x=1720090124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UB49lb/IgQI+QFjiW4RxbsxUbcomLADrjUg4RQdZZT4=;
        b=is77YQcK4a0tdiepvIYSOXKYKjFu9xYiXY9HllYlDSHcjS1KHfC7cvUWUMTmEJ2XGJ
         4+ji9EvkGuPqKWNSfsFTJsiUjhEd1E5oyvXIWULKR5bdzqwAhm7spi2V45OsYfOjtQtD
         ldCT1asj0nZ/QsDkSHdWQYr66uuQh1d1VgYLuADj+Tpev2+hCC5rPlMDdzq+YgLyF2IX
         CLvAq9QFadzHhlyswh1nKVHdjYDA7BZ1ctG9QytdKRIttL8Yc5odGskkX5WQ2U8WrJNp
         Y7xdSAf7IgcORILSky3SdBEFIotdqV0GColV66dC10cxBpxq6zS3G6sZHAKlZvZ2K14V
         dWqg==
X-Forwarded-Encrypted: i=1; AJvYcCXIS75tX8xCNGgzchDWKr3GBCoJvsyXm2J1fQhKmGtOvZWTh/woOsQTJlkdmBofZqTbTmBdobiGwYhh2f2zX1zKbhbj
X-Gm-Message-State: AOJu0YzFvvHiGyaCuffek7N07kse48H5xevb44hFPcJxNPxZ+H8a84ow
	PxyC+uQVb24HGNkafApRtsZWfjcdQGtAo/7tL+1FzJa1Uuugf6Zg
X-Google-Smtp-Source: AGHT+IGDdHq5IeXT9AYX+DdXqyQF6IqrQBJnbIU5m4qB7+mYAXJmAApCaCOoT/18L4Yg21S95fHvaQ==
X-Received: by 2002:ac2:5618:0:b0:52c:dea0:dd55 with SMTP id 2adb3069b0e04-52cdf7f10d2mr8461836e87.24.1719485323871;
        Thu, 27 Jun 2024 03:48:43 -0700 (PDT)
Received: from vitor-nb.. ([2001:8a0:e622:f700:9537:8d85:b9f7:78bb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c826a2e7sm58503995e9.21.2024.06.27.03.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 03:48:43 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ivitro@gmail.com
Subject: [PATCH v2] arm64: dts: imx8mm-verdin: add TPM device
Date: Thu, 27 Jun 2024 11:48:39 +0100
Message-Id: <20240627104839.645778-1-ivitro@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Add TPM device found on Verdin iMX8M Mini PID4 0090 variant.

While adding the node, rename `pinctrl_pmic_tpm_ena` to
`pinctrl_tpm_spi_cs`.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
v1->v2
  - rename `pinctrl_pmic_tpm_ena` to `pinctrl_tpm_spi_cs`.

 .../boot/dts/freescale/imx8mm-verdin.dtsi      | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 98544741ce17..6e066bd5d982 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -228,15 +228,16 @@ &ecspi2 {
 	pinctrl-0 = <&pinctrl_ecspi2>;
 };
 
-/* Verdin CAN_1 (On-module) */
+/* On-module SPI */
 &ecspi3 {
 	#address-cells = <1>;
 	#size-cells = <0>;
-	cs-gpios = <&gpio5 25 GPIO_ACTIVE_LOW>;
+	cs-gpios = <&gpio5 25 GPIO_ACTIVE_LOW>, <&gpio4 19 GPIO_ACTIVE_LOW>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_ecspi3>;
+	pinctrl-0 = <&pinctrl_ecspi3>, <&pinctrl_tpm_spi_cs>;
 	status = "okay";
 
+	/* Verdin CAN_1 */
 	can1: can@0 {
 		compatible = "microchip,mcp251xfd";
 		clocks = <&clk40m>;
@@ -246,6 +247,12 @@ can1: can@0 {
 		reg = <0>;
 		spi-max-frequency = <8500000>;
 	};
+
+	verdin_som_tpm: tpm@1 {
+		compatible = "atmel,attpm20p", "tcg,tpm_tis-spi";
+		reg = <0x1>;
+		spi-max-frequency = <36000000>;
+	};
 };
 
 /* Verdin ETH_1 (On-module PHY) */
@@ -808,8 +815,7 @@ &iomuxc {
 	pinctrl-0 = <&pinctrl_gpio1>, <&pinctrl_gpio2>,
 		    <&pinctrl_gpio3>, <&pinctrl_gpio4>,
 		    <&pinctrl_gpio7>, <&pinctrl_gpio8>,
-		    <&pinctrl_gpio_hog1>, <&pinctrl_gpio_hog2>, <&pinctrl_gpio_hog3>,
-		    <&pinctrl_pmic_tpm_ena>;
+		    <&pinctrl_gpio_hog1>, <&pinctrl_gpio_hog2>, <&pinctrl_gpio_hog3>;
 
 	pinctrl_can1_int: can1intgrp {
 		fsl,pins =
@@ -1111,7 +1117,7 @@ pinctrl_sai5: sai5grp {
 	};
 
 	/* control signal for optional ATTPM20P or SE050 */
-	pinctrl_pmic_tpm_ena: pmictpmenagrp {
+	pinctrl_tpm_spi_cs: pmictpmenagrp {
 		fsl,pins =
 			<MX8MM_IOMUXC_SAI1_TXD7_GPIO4_IO19		0x106>;	/* PMIC_TPM_ENA */
 	};
-- 
2.34.1

