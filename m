Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBEA1990C7
	for <imx@lists.linux.dev>; Sat,  9 Nov 2024 12:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731156292; cv=none; b=bF2mG11sEsxFBW0VXOs08+8DIUSgejQZBfB0oKzXBUVxypy0vjE35MCS8F38sNRY/JuBx+OCFdPCVNO2ZceSP4VDShUiUsMnZKDfbYbtONzh2/1zPSJzl+UnXe90LDgVhPPmqVtzkrFzJnotv2F5oAT+ZfLGLZpyUpJ5jOes3jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731156292; c=relaxed/simple;
	bh=oX98cqsu9ezhoyh3zMCsqzngVH4022JCLrceQnb5H7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CfjGAMcYQTipO+RwASIv4MpU/zberdwCHIpmScMoFPDYhCJynHV5+1KU+pK9gBfZ+7iHNJrrNbVbPqppOHj6qgWH0y+OfM/ynRRkiTU9Yj1ZyXLW/MybpkLZMVHbcyjL0lBpZTuWbCPhk25cmptQE/8y9Kndu81I3IFhnwA7dqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/93aH0v; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/93aH0v"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5cec93719ccso4002186a12.2
        for <imx@lists.linux.dev>; Sat, 09 Nov 2024 04:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731156289; x=1731761089; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CQ9NSVxNmU2bLIFXUwQFB7anXf5+cHYcjGaMIkMwGmQ=;
        b=O/93aH0vWQX9hmmb7a+vS1gdDqVu1ks81mfUm1jUwSL+RTbJu0EebrkHQH+I1fjE4V
         Ye7K8xj9qVSXanuCD9R6TC3hnbIvwgQW0K39xGFxlohuwGuezjjVWS6IRFVkNRONkToP
         FPY8G73L7B271EOWF/CJ93+8Vd8R2D1NQe9uhL192Un5IHxbwH1W4/CuaWpnVgwiO3gi
         bfnE9XhjwGixoqQaoPnir6UV7W7/TuwE3sA8e572evzrxdjqFkl3AA7L4lGqHQ0p9tSV
         1bcrjS6vym92cIzhNlWOMZe3l+u/y4qbyJyWK/owITw5CT9Fo1G+Qr00S1IJrKfQ538i
         VLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731156289; x=1731761089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQ9NSVxNmU2bLIFXUwQFB7anXf5+cHYcjGaMIkMwGmQ=;
        b=D8dOgH4EfZLgBU6HE4llpGggQLbYYANJPtLI+dTn4md33W3cwNOE3SdpMJAYVkadDD
         eQO74+ootwOK/isqrQyMAMBcrKWo2y3OkEFneontMvr22KHuSYDoTJQ2beszC4h9S5m4
         X0mgXqG5WCFuM7PPOC4odOAsXDVk7eR2EjxGArWALM1k0whCbgbwo3FquJM6vYwH+lvd
         e7F7+EfXAw/DAmdQ0HWeEXvm0VWCRajQDNUBYLqHK3rrNsT8YkXiBclVz4IZzA2A1rKD
         xcLL3Vnzj8DYgc8E4d/qzrBzs76BmC7gWyLOYYNOcngpbyh5AWS1fItiybJTSpiR1UyO
         4pFA==
X-Forwarded-Encrypted: i=1; AJvYcCVYR7blk+feZDSiiJt3ytfslIOxEATd8Xm28GpXvI+V0crSS38+aBCyBRTg/pSSsbzqoyA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxxgp6L4yv/+P+cqMnIhUER2KtumliaJ6cVbG46igINy8MFHyhv
	DphsEkp7yTGYIzUfmmvp4t8yffvRPbY9HAFp5R71Uc5/FiS5QrnC
X-Google-Smtp-Source: AGHT+IEava32G9LkepDqhNF98BHoT2kEpMj/WzLFM5B1x5SUXXliyjsQMEGMpaCuJJcC1rJTYXaoqA==
X-Received: by 2002:a05:6402:d0d:b0:5c2:439d:90d4 with SMTP id 4fb4d7f45d1cf-5cf0a45f22bmr4810410a12.30.1731156288669;
        Sat, 09 Nov 2024 04:44:48 -0800 (PST)
Received: from [127.0.1.1] (leased-line-46-53-189-50.telecom.by. [46.53.189.50])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03b5d793sm2940166a12.17.2024.11.09.04.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:44:47 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Sat, 09 Nov 2024 15:44:35 +0300
Subject: [PATCH 3/4] power: supply: max17042: use microvolts for voltage
 comparison
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-b4-max17042-v1-3-9e2b07e54e76@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731156277; l=7169;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=oX98cqsu9ezhoyh3zMCsqzngVH4022JCLrceQnb5H7w=;
 b=fSAus6hdbJoEivY1qvsqsA9L4OfkV3c0pEcQviAyQ4PUq6GytjxonoqhMMGpCSqQMVG158a0S
 DYpghObEXyZBGANGKXeOJNanilreWXaqeQaSScPgTm2cV2w089dJsIP
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Do not convert VCELL register value from uV to mV to compare
with vmin/vmax. Rather use uV for vim/vmax, since that's a
standard measure unit in power supply drivers.

Convert "maxim,dead-volt" and "maxim,over-volt" to uV.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml | 2 +-
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts                     | 2 +-
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi                     | 2 +-
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi                    | 2 +-
 arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi                   | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi                  | 2 +-
 arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dts               | 4 ++--
 arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dts               | 4 ++--
 arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dts               | 4 ++--
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi           | 2 +-
 drivers/power/supply/max17042_battery.c                            | 4 ----
 11 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml
index e98ffdad1ec3..d1ad597e0837 100644
--- a/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml
+++ b/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml
@@ -83,7 +83,7 @@ examples:
         reg = <0x36>;
         maxim,rsns-microohm = <10000>;
         maxim,over-heat-temp = <600>;
-        maxim,over-volt = <4300>;
+        maxim,over-volt = <4300000>;
         shared-irq;
       };
     };
diff --git a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
index 0d8495792a70..0ca755160bef 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
@@ -150,7 +150,7 @@ battery@36 {
 
 			reg = <0x36>;
 			maxim,over-heat-temp = <700>;
-			maxim,over-volt = <4500>;
+			maxim,over-volt = <4500000>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
index 9bc05961577d..758bfc10826f 100644
--- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
@@ -186,7 +186,7 @@ fuel-gauge@36 {
 			pinctrl-0 = <&max77693_fuel_irq>;
 
 			maxim,over-heat-temp = <500>;
-			maxim,over-volt = <4500>;
+			maxim,over-volt = <450000>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
index 3d5aace668dc..c744907b7c42 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
@@ -263,7 +263,7 @@ fuel-gauge@36 {
 			reg = <0x36>;
 
 			maxim,over-heat-temp = <700>;
-			maxim,over-volt = <4500>;
+			maxim,over-volt = <4500000>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
index 28a605802733..3d52aa25c83c 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
@@ -175,7 +175,7 @@ fuel-gauge@36 {
 			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 			maxim,rsns-microohm = <10000>;
 			maxim,over-heat-temp = <600>;
-			maxim,over-volt = <4300>;
+			maxim,over-volt = <4300000>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 1b39514d5c12..90beefaa644f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1141,7 +1141,7 @@ bat: fuel-gauge@36 {
 		pinctrl-0 = <&pinctrl_gauge>;
 		power-supplies = <&bq25895>;
 		maxim,over-heat-temp = <700>;
-		maxim,over-volt = <4500>;
+		maxim,over-volt = <4500000>;
 		maxim,rsns-microohm = <5000>;
 	};
 
diff --git a/arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dts b/arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dts
index 8380451ebbf6..a02ece82ff5b 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dts
@@ -25,8 +25,8 @@ battery@36 {
 		maxim,rsns-microohm = <10000>;
 		maxim,over-heat-temp = <600>;
 		maxim,cold-temp = <(-200)>;
-		maxim,dead-volt = <3200>;
-		maxim,over-volt = <4500>;
+		maxim,dead-volt = <3200000>;
+		maxim,over-volt = <4500000>;
 	};
 
 	/* charger@6b */
diff --git a/arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dts b/arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dts
index ec5589fc69bd..f567b7ffb613 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dts
@@ -36,8 +36,8 @@ battery@36 {
 		maxim,rsns-microohm = <10000>;
 		maxim,over-heat-temp = <600>;
 		maxim,cold-temp = <(-200)>;
-		maxim,dead-volt = <3200>;
-		maxim,over-volt = <4500>;
+		maxim,dead-volt = <3200000>;
+		maxim,over-volt = <4500000>;
 
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dts b/arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dts
index eecf78ba45bb..45ddd17243e7 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dts
@@ -25,8 +25,8 @@ battery@36 {
 		maxim,rsns-microohm = <10000>;
 		maxim,over-heat-temp = <600>;
 		maxim,cold-temp = <(-200)>;
-		maxim,dead-volt = <3200>;
-		maxim,over-volt = <4500>;
+		maxim,dead-volt = <3200000>;
+		maxim,over-volt = <4500000>;
 
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
index fbd2caf405d5..2c387c8b6344 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
@@ -105,7 +105,7 @@ fuelgauge@36 {
 
 		maxim,rsns-microohm = <10000>;
 		maxim,over-heat-temp = <600>;
-		maxim,over-volt = <4400>;
+		maxim,over-volt = <4400000>;
 
 		interrupt-parent = <&tlmm>;
 		interrupts = <121 IRQ_TYPE_EDGE_FALLING>;
diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
index f3d89d4d5c42..ea212cb10360 100644
--- a/drivers/power/supply/max17042_battery.c
+++ b/drivers/power/supply/max17042_battery.c
@@ -182,8 +182,6 @@ static int max17042_get_battery_health(struct max17042_chip *chip, int *health)
 
 	/* bits [0-3] unused */
 	vavg = val * 625 / 8;
-	/* Convert to millivolts */
-	vavg /= 1000;
 
 	ret = regmap_read(chip->regmap, MAX17042_VCELL, &val);
 	if (ret < 0)
@@ -191,8 +189,6 @@ static int max17042_get_battery_health(struct max17042_chip *chip, int *health)
 
 	/* bits [0-3] unused */
 	vbatt = val * 625 / 8;
-	/* Convert to millivolts */
-	vbatt /= 1000;
 
 	if (vavg < chip->pdata->vmin) {
 		*health = POWER_SUPPLY_HEALTH_DEAD;

-- 
2.39.2

