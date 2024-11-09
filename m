Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE5B198822
	for <imx@lists.linux.dev>; Sat,  9 Nov 2024 12:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731156295; cv=none; b=qqXoN5PaDD3bZ1F1OgLXwRfdjJZrBrAtmlLP9JeUtjwqh5GmX+PruuA2DA7rTzlWpxp9CgBzvh9sV/ikoxZ0/YzKX433bIhAcG2JmgutdJqmNcsbxUNRvlVEpKBQrPyB8WJz6bb4JHyDHhjeB4GO6kr0eXfAUQ1W6U6sLt9FFZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731156295; c=relaxed/simple;
	bh=Ll3+VdQ0C3YJ+cNuw/9xWFDuApiijksTxgD0D7LqbW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lgk1VrbakRBVWzitU5vjArRJ1LxKjAXTS5Fh8BXgjZrmwu/97YOQYSSvWUA4ybYbyIOs82GNug7syvAJCM9713fe7FyeX3K6TTvi2U+LWvfTH9Q2ImFBw+REoMBJwCTQMaYYdJUg81RJCSA5mfsNeIVgOxQq+1HpgSNgQG+5YAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FZOfkzaz; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZOfkzaz"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c9c28c1e63so3763565a12.0
        for <imx@lists.linux.dev>; Sat, 09 Nov 2024 04:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731156292; x=1731761092; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=59tEYZAbxZv4QLtXinFrkb5WBvn6BEbQem6S6TXlOJw=;
        b=FZOfkzazOZAewYkPE/+SpVne7XjRvFJLd+wb691AyKCqGxxzJvlmw+HkL7Ofn/3iFK
         PIOdWaepzEiv3hKUZLWbC7J9br41Gj8flmj6OqNPTXro+f2bmnl2Z8L3mLxq2Mrl4GP8
         u9tOXIQb04vABLmBoXB1KwNexq0/rwOP5TPp2/jg7F+Ch2CHrylkzQN5ReI8WgDz9iCa
         ngl7DVPBIqA/pQlDvSaF/tIkhQzlIzziZVvNL/uJPrzP8f6WUJDHCx+CJ1S1hNAkwJYV
         eiuxYXzLuM6WVwtXGq4RPRDW6hS8owj+AYjdg7EmCh/hTA/8nxcr+3koGjUYzGVfwo5U
         NYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731156292; x=1731761092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59tEYZAbxZv4QLtXinFrkb5WBvn6BEbQem6S6TXlOJw=;
        b=DHtTY2om95rKHSBO/kxqySq15tJpER67MBJfmufrYiD5J/xyNZ6fc2zoVQeak/4cke
         eE/1K4AE5lCVV8gvJ/RJ0o7jioVF42w4BZ0Ky9Pf2FxAlI4gGPuKLkfbgMFZZkL+F9Vz
         TR9iHPJcXHNyAhBXusKMfp7nAtHoRNDnEkUAScryYLiLmGnWq0zObPNaYoWMxhq+06IN
         7/ICMVJs8NLIP1J1FuxVa421+C4Q957yA/Z09/h/DEhAaBMPoHFJM26VCUp4HHEHU5pX
         xeEL45uCNmqG5D7eKgsaMr0+7XWOsj5eNBZnNNYeVHK8fxq5KiWmnpv6X+iGbojsPl/c
         W0pw==
X-Forwarded-Encrypted: i=1; AJvYcCXAczKNaZGDq8Y+uDtAyj4CuVVVGSCvVJkv28jVQt8LwDvaCnjivllmpVp1j2JqGvPQXQ0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdNJDWsd82IBQySIejg6/bOHfD2F556f5C5Rl+d5hcAVBzAR3W
	PHyMsOZkhr5deEPYCTgHUIU6fWBI2deZe826sL5KEuY7/B0xl/1o
X-Google-Smtp-Source: AGHT+IHsmH3XqpW0E30HnDtDXqrPkaKiznFfyNU3gMMTiByURLm3AmURnfa20tdQ+1DxMfZF6+oL9w==
X-Received: by 2002:a05:6402:3507:b0:5ce:d6b0:85c0 with SMTP id 4fb4d7f45d1cf-5cf0a444283mr4838208a12.22.1731156291637;
        Sat, 09 Nov 2024 04:44:51 -0800 (PST)
Received: from [127.0.1.1] (leased-line-46-53-189-50.telecom.by. [46.53.189.50])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03b5d793sm2940166a12.17.2024.11.09.04.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:44:50 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Sat, 09 Nov 2024 15:44:36 +0300
Subject: [PATCH 4/4] power: supply: max17042: rename maxim,rsns-microohm
 property
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-b4-max17042-v1-4-9e2b07e54e76@gmail.com>
References: <20241109-b4-max17042-v1-0-9e2b07e54e76@gmail.com>
In-Reply-To: <20241109-b4-max17042-v1-0-9e2b07e54e76@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731156277; l=6311;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=Ll3+VdQ0C3YJ+cNuw/9xWFDuApiijksTxgD0D7LqbW4=;
 b=CgxjsX+bAIDHBkOI0SqP8ZHxW2061yieieg6R6BPSGwA0wkM6muqq3JM+UwOpuN8nMBZE8qH+
 JYXQoELs5oIAJUPqdLaPEzqqmnhBaJeJjCaLjK07S7pPTZRU6D1PucY
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Rename maxim,rsns-microohm to common shunt-resistor-micro-ohms.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml | 5 ++---
 arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi                   | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dts                | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi                  | 2 +-
 arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dts               | 2 +-
 arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dts               | 2 +-
 arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dts               | 2 +-
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi           | 2 +-
 drivers/power/supply/max17042_battery.c                            | 2 +-
 9 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml
index d1ad597e0837..754d9ad3d94b 100644
--- a/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml
+++ b/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml
@@ -29,8 +29,7 @@ properties:
     description: |
       The ALRT pin, an open-drain interrupt.
 
-  maxim,rsns-microohm:
-    $ref: /schemas/types.yaml#/definitions/uint32
+  shunt-resistor-micro-ohms:
     description: |
       Resistance of rsns resistor in micro Ohms (datasheet-recommended value is 10000).
       Defining this property enables current-sense functionality.
@@ -81,7 +80,7 @@ examples:
       battery@36 {
         compatible = "maxim,max17042";
         reg = <0x36>;
-        maxim,rsns-microohm = <10000>;
+        shunt-resistor-micro-ohms = <10000>;
         maxim,over-heat-temp = <600>;
         maxim,over-volt = <4300000>;
         shared-irq;
diff --git a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
index 3d52aa25c83c..0b08d23366d6 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
@@ -173,7 +173,7 @@ fuel-gauge@36 {
 			pinctrl-names = "default";
 			interrupt-parent = <&gpx2>;
 			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
-			maxim,rsns-microohm = <10000>;
+			shunt-resistor-micro-ohms = <10000>;
 			maxim,over-heat-temp = <600>;
 			maxim,over-volt = <4300000>;
 		};
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dts
index 33f398b48119..99023f302a05 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dts
@@ -11,7 +11,7 @@ / {
 };
 
 &bat {
-	maxim,rsns-microohm = <1667>;
+	shunt-resistor-micro-ohms = <1667>;
 };
 
 &led_backlight {
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 90beefaa644f..6f6ce14afbdc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1142,7 +1142,7 @@ bat: fuel-gauge@36 {
 		power-supplies = <&bq25895>;
 		maxim,over-heat-temp = <700>;
 		maxim,over-volt = <4500000>;
-		maxim,rsns-microohm = <5000>;
+		shunt-resistor-micro-ohms = <5000>;
 	};
 
 	bq25895: charger@6a {
diff --git a/arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dts b/arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dts
index a02ece82ff5b..f5d636db33c8 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dts
@@ -22,7 +22,7 @@ battery@36 {
 		pinctrl-0 = <&battery_alert_default>;
 		pinctrl-names = "default";
 
-		maxim,rsns-microohm = <10000>;
+		shunt-resistor-micro-ohms = <10000>;
 		maxim,over-heat-temp = <600>;
 		maxim,cold-temp = <(-200)>;
 		maxim,dead-volt = <3200000>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dts b/arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dts
index f567b7ffb613..35343b1fd737 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dts
@@ -33,7 +33,7 @@ battery@36 {
 		pinctrl-0 = <&battery_alert_default>;
 		pinctrl-names = "default";
 
-		maxim,rsns-microohm = <10000>;
+		shunt-resistor-micro-ohms = <10000>;
 		maxim,over-heat-temp = <600>;
 		maxim,cold-temp = <(-200)>;
 		maxim,dead-volt = <3200000>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dts b/arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dts
index 45ddd17243e7..855f8a554a9b 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dts
@@ -22,7 +22,7 @@ battery@36 {
 		pinctrl-0 = <&battery_alert_default>;
 		pinctrl-names = "default";
 
-		maxim,rsns-microohm = <10000>;
+		shunt-resistor-micro-ohms = <10000>;
 		maxim,over-heat-temp = <600>;
 		maxim,cold-temp = <(-200)>;
 		maxim,dead-volt = <3200000>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
index 2c387c8b6344..0ab64154dc77 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
@@ -103,7 +103,7 @@ fuelgauge@36 {
 		compatible = "maxim,max77849-battery";
 		reg = <0x36>;
 
-		maxim,rsns-microohm = <10000>;
+		shunt-resistor-micro-ohms = <10000>;
 		maxim,over-heat-temp = <600>;
 		maxim,over-volt = <4400000>;
 
diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
index ea212cb10360..497cb6f14bd9 100644
--- a/drivers/power/supply/max17042_battery.c
+++ b/drivers/power/supply/max17042_battery.c
@@ -916,7 +916,7 @@ max17042_get_of_pdata(struct max17042_chip *chip)
 	 * Require current sense resistor value to be specified for
 	 * current-sense functionality to be enabled at all.
 	 */
-	if (of_property_read_u32(np, "maxim,rsns-microohm", &prop) == 0) {
+	if (of_property_read_u32(np, "shunt-resistor-micro-ohms", &prop) == 0) {
 		pdata->r_sns = prop;
 		pdata->enable_current_sense = true;
 	}

-- 
2.39.2

