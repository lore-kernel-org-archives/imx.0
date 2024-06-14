Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCA819FA62
	for <imx@lists.linux.dev>; Fri, 14 Jun 2024 09:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718359182; cv=none; b=f6bzduLmspOhXbXe8518LCiKHFlnpycdWNHZz5ZuoyJ5z/aNPwE/oylGAvEtqz+IPssJI8hcXywCHu8VhjUWlmLUKgBrQvIAOl0WHUtKLKkKI/nqXJF9F6kfPeGC9hymt/6003cavZnMRTfZd2q9y/LIPdOGo8E6UgMX6iGKGgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718359182; c=relaxed/simple;
	bh=o+UxusDvXcRw/9+99wtmLFw1Ay/JOFInOe2ZTYft6/8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e3HWD0lm0clCS1Gt4yEvi8EW2InWrrJdcneakJ3a07Ya5HSp/+I7MgVYdH4I9hM2LhIh7mLrjCMpNmgmsNyWFgJ6GqBy6G032vBeVt7O8a5GZpeZ4nU/cJ4ZhcpGhdOmtYSbmrmJveiEe5odIyVQu95H+a+4HY8IC9vj6N63z04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=effI9WZ+; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="effI9WZ+"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6f95be3d4c4so763964a34.3
        for <imx@lists.linux.dev>; Fri, 14 Jun 2024 02:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718359178; x=1718963978; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwEL12Dk210SzDROzm2fK2nLGU+zRldORTG8TcrOARU=;
        b=effI9WZ+rGLSSPZ1SzsjsYQ7GeryLIVL762Lzv7dBUwxhqWRBElgZjdaSci18eR9x/
         6vkN+cuZjX7VwBq10loTRq+9lmegbuOH97w46gdToGPboRbcSxSvEl/5yL3emH6mZb06
         kSQEK/TvCBBW+TUDvvNbJgPajQW0g6SD9LQ+eJpn2Bi1maMF8U0y4racSaVJURgSPRaU
         AlmDElIQ3/xT9UEIT2IwBJo5G+ptalkEw7Uv+qb4n6AvXyNxl5LdjlukX6SmZ3OkokgL
         2FN4yyeuaawZUX+w7i4HEzLUKtK/owSQ9fY+dup6LOnRkpASNbK+RU+gfxYoH4ihI0GW
         b8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718359178; x=1718963978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwEL12Dk210SzDROzm2fK2nLGU+zRldORTG8TcrOARU=;
        b=itbWNf03gp7Tfwty3RK2LPMzzOUG1Oq4NJbkXlhLKz4Yw7XykA9GNKPe5awBsfcFwz
         OcGBQlhwxfoD/lfKJJoIJHuMqh78Wo7ESrla9ACCFkCVaPi1EawODJUyiJ+4p7Mo9gyr
         wMAQfxrUj9Fg++umuj7saLTfFVIpW9wGBsnqJIDtFrO1ck+sqc8DlU9sjpZeZ6dv5VDm
         C7zl5dLo9x33fuFgvaAWGzpOV3mPME7u1To9hCYIvT5jLo99ipOMNosTCe6ETtsOINon
         dvEviSER7C342hfNSFWkRPPFwmyiq/dap6djR7a0UKlwGv9Ir0WVyuP1UXwBbXLEYQBN
         RR1w==
X-Forwarded-Encrypted: i=1; AJvYcCXgBRkmopm6wImMlmDMRMUgnZptzOKT12pHHIamzM2q4am8sr7SjmifjFlt0c6059gkfIujZE1jaRIVfyzDIoGoOD/M
X-Gm-Message-State: AOJu0Yzh2u06xfDDSByUy4E6nA99Lv0LLOVP1AWSXpGwPXE8/Ekdq6vx
	IoASmhhctaJbJhpgmodyvBoHL7Helbn0XrYHTaBkugaJd/zRFEoINdeklhBNfFw=
X-Google-Smtp-Source: AGHT+IGaIW4Oj4QyiK1N8uLp44uKOum0SpgbvhX9tXBoqXkfPuCUc1l/mIKPBdvr5bH67v1ZL9Bhsw==
X-Received: by 2002:a05:6830:10a:b0:6fa:e93:3e3e with SMTP id 46e09a7af769-6fb93766baamr2212329a34.9.1718359178133;
        Fri, 14 Jun 2024 02:59:38 -0700 (PDT)
Received: from krzk-bin.. ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6fb5b2fe510sm554180a34.48.2024.06.14.02.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:59:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: drop stale Anson Huang from maintainers
Date: Fri, 14 Jun 2024 11:59:27 +0200
Message-ID: <20240614095927.88762-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Emails to Anson Huang bounce:

  Diagnostic-Code: smtp; 550 5.4.1 Recipient address rejected: Access denied.

Add IMX platform maintainers for bindings which would become orphaned.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/arm/freescale/fsl,imx7ulp-sim.yaml    | 4 +++-
 Documentation/devicetree/bindings/clock/imx6q-clock.yaml      | 4 +++-
 Documentation/devicetree/bindings/clock/imx6sl-clock.yaml     | 4 +++-
 Documentation/devicetree/bindings/clock/imx6sll-clock.yaml    | 4 +++-
 Documentation/devicetree/bindings/clock/imx6sx-clock.yaml     | 4 +++-
 Documentation/devicetree/bindings/clock/imx6ul-clock.yaml     | 4 +++-
 Documentation/devicetree/bindings/clock/imx7d-clock.yaml      | 1 -
 Documentation/devicetree/bindings/clock/imx8m-clock.yaml      | 4 +++-
 Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml      | 4 +++-
 Documentation/devicetree/bindings/gpio/gpio-mxs.yaml          | 1 -
 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml      | 4 +++-
 .../devicetree/bindings/iio/magnetometer/fsl,mag3110.yaml     | 4 +++-
 .../devicetree/bindings/memory-controllers/fsl/mmdc.yaml      | 4 +++-
 Documentation/devicetree/bindings/nvmem/imx-iim.yaml          | 4 +++-
 Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml        | 4 +++-
 Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml        | 4 +++-
 Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml        | 4 +++-
 Documentation/devicetree/bindings/pwm/mxs-pwm.yaml            | 1 -
 Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml      | 4 +++-
 Documentation/devicetree/bindings/thermal/imx-thermal.yaml    | 1 -
 Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml | 4 +++-
 Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml  | 4 +++-
 Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml   | 4 +++-
 .../devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml         | 4 +++-
 24 files changed, 60 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-sim.yaml b/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-sim.yaml
index 526f508cb98d..bd39cf107f3e 100644
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-sim.yaml
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-sim.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale i.MX7ULP System Integration Module
 
 maintainers:
-  - Anson Huang <anson.huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 description: |
   The system integration module (SIM) provides system control and chip configuration
diff --git a/Documentation/devicetree/bindings/clock/imx6q-clock.yaml b/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
index bae4fcb3aacc..74cfdcf1c93b 100644
--- a/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale i.MX6 Quad Clock Controller
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/clock/imx6sl-clock.yaml b/Documentation/devicetree/bindings/clock/imx6sl-clock.yaml
index c85ff6ea3d24..b780bdaa4126 100644
--- a/Documentation/devicetree/bindings/clock/imx6sl-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx6sl-clock.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale i.MX6 SoloLite Clock Controller
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/clock/imx6sll-clock.yaml b/Documentation/devicetree/bindings/clock/imx6sll-clock.yaml
index 6b549ed1493c..992536b2bf6a 100644
--- a/Documentation/devicetree/bindings/clock/imx6sll-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx6sll-clock.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale i.MX6 SLL Clock Controller
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/clock/imx6sx-clock.yaml b/Documentation/devicetree/bindings/clock/imx6sx-clock.yaml
index 55dcad18b7c6..cd67fd6ba7ad 100644
--- a/Documentation/devicetree/bindings/clock/imx6sx-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx6sx-clock.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale i.MX6 SoloX Clock Controller
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml b/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml
index be54d4df5afa..3804369c9f8a 100644
--- a/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale i.MX6 UltraLite Clock Controller
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/clock/imx7d-clock.yaml b/Documentation/devicetree/bindings/clock/imx7d-clock.yaml
index e7d8427e4957..880d602d09f4 100644
--- a/Documentation/devicetree/bindings/clock/imx7d-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx7d-clock.yaml
@@ -8,7 +8,6 @@ title: Freescale i.MX7 Dual Clock Controller
 
 maintainers:
   - Frank Li <Frank.Li@nxp.com>
-  - Anson Huang <Anson.Huang@nxp.com>
 
 description: |
   The clock consumer should specify the desired clock by having the clock
diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index 80539f88bc27..b4afd5aa8769 100644
--- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: NXP i.MX8M Family Clock Control Module
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 description: |
   NXP i.MX8M Mini/Nano/Plus/Quad clock control module is an integrated clock
diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
index 918776d16ef3..e1fc8bb6d379 100644
--- a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale i.MX/MXC GPIO controller
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
index dfa1133f8c5e..8ff54369d16c 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
@@ -8,7 +8,6 @@ title: Freescale MXS GPIO controller
 
 maintainers:
   - Shawn Guo <shawnguo@kernel.org>
-  - Anson Huang <Anson.Huang@nxp.com>
 
 description: |
   The Freescale MXS GPIO controller is part of MXS PIN controller.
diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
index 54d500be6aaa..1dcb9c78de3b 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale Low Power Inter IC (LPI2C) for i.MX
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml#
diff --git a/Documentation/devicetree/bindings/iio/magnetometer/fsl,mag3110.yaml b/Documentation/devicetree/bindings/iio/magnetometer/fsl,mag3110.yaml
index 6b54d32323fc..467002a5da43 100644
--- a/Documentation/devicetree/bindings/iio/magnetometer/fsl,mag3110.yaml
+++ b/Documentation/devicetree/bindings/iio/magnetometer/fsl,mag3110.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale MAG3110 magnetometer sensor
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/memory-controllers/fsl/mmdc.yaml b/Documentation/devicetree/bindings/memory-controllers/fsl/mmdc.yaml
index 71547eee9919..5447f1dddedf 100644
--- a/Documentation/devicetree/bindings/memory-controllers/fsl/mmdc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/fsl/mmdc.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale Multi Mode DDR controller (MMDC)
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/imx-iim.yaml b/Documentation/devicetree/bindings/nvmem/imx-iim.yaml
index e9d9d8df4811..bb37d72c9eaa 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-iim.yaml
+++ b/Documentation/devicetree/bindings/nvmem/imx-iim.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale i.MX IC Identification Module (IIM)
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 description: |
   This binding represents the IC Identification Module (IIM) found on
diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
index be1314454bec..e21c06e9a741 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale i.MX On-Chip OTP Controller (OCOTP)
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 description: |
   This binding represents the on-chip eFuse OTP controller found on
diff --git a/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml
index d9287be89877..95121dd6311c 100644
--- a/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: On-Chip OTP Memory for Freescale i.MX23/i.MX28
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 allOf:
   - $ref: nvmem.yaml#
diff --git a/Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml b/Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml
index 8bef9dfeba9a..ac0a35bf8648 100644
--- a/Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale i.MX TPM PWM controller
 
 maintainers:
-  - Anson Huang <anson.huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 description: |
   The TPM counter and period counter are shared between multiple
diff --git a/Documentation/devicetree/bindings/pwm/mxs-pwm.yaml b/Documentation/devicetree/bindings/pwm/mxs-pwm.yaml
index 8f50e23ca8c9..a9d3a41ac5b9 100644
--- a/Documentation/devicetree/bindings/pwm/mxs-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/mxs-pwm.yaml
@@ -8,7 +8,6 @@ title: Freescale MXS PWM controller
 
 maintainers:
   - Shawn Guo <shawnguo@kernel.org>
-  - Anson Huang <anson.huang@nxp.com>
 
 allOf:
   - $ref: pwm.yaml#
diff --git a/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml b/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
index 2ff174244795..ed1d4aa41b8c 100644
--- a/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale Low Power SPI (LPSPI) for i.MX
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 allOf:
   - $ref: /schemas/spi/spi-controller.yaml#
diff --git a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
index 808d987bd8d1..337560562337 100644
--- a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
@@ -8,7 +8,6 @@ title: NXP i.MX Thermal
 
 maintainers:
   - Shawn Guo <shawnguo@kernel.org>
-  - Anson Huang <Anson.Huang@nxp.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml b/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
index d2c1e4573c32..42e2317a00f5 100644
--- a/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: NXP i.MX8M Mini Thermal
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 description: |
   i.MX8MM has TMU IP to allow temperature measurement, there are
diff --git a/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml b/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml
index d155d6799da6..66c4972d5072 100644
--- a/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Thermal Monitoring Unit (TMU) on Freescale QorIQ SoCs
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
index 181f0cc5b5bd..36b836d0620c 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale i.MX Watchdog Timer (WDT) Controller
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
index 9c50766bf690..a09686b3030d 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale i.MX7ULP Watchdog Timer (WDT) Controller
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 allOf:
   - $ref: watchdog.yaml#
-- 
2.43.0

