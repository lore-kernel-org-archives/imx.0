Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E9348C418
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 14:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497465; cv=none; b=ZE8QudNzTnSI68oxHWbRYYs9Mz1HbtzNoFbZsGq3HB9s7iNaQCA4NF2v1Y3MBq3XFuY3co6QvXieRV2t6Featcs6PmC6chTk0XzilBpLJuxYJmMpBT40x2WdHOJ+BNtY2QEIXOKyhMZQqbRkn17yUFEALWSX+Rf5f56bZrvXDuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497465; c=relaxed/simple;
	bh=tapJulvq9sZNzCtmbZgAjkSubCFsjmsf/ax+SbMxIuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UqBFvCj385YEBr63sns2dEBCZXHe3ZD1T3OSiHI5oqNR8Cbk0H/Kz8v/ehkkT0AgpFJJ3hwWTlQWYalBv9Q0IY9+s50sxxgp/yXSYFKG09a9gCH7ZUhxzbKcBWPY2JSi1I8cJpl9uQpKKgssPfoco+vbE9B3iu2spl1WcsKd/lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qzljMVsG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qzljMVsG"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so117566135e9.2
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 07:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497462; x=1781102262; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2r42H6aMK4b6UNRgIksoOLm8aN27wEuwsly03FlTjcQ=;
        b=qzljMVsGw+H2nQtaix+OUmn1fccka4TeCSYV9ODUO3qfBjgAEaGESm5iRXRyx5tLRn
         2qnY6rI+MwA5jzcMEU00v77aZVT9L7H6J/8espUcO5bAe9+GUDEDR9IairB5JLV0yVds
         9SvdUBs77gTqRI9g7qSTBjMP6FRyt4tUZkLy31jkGDrb6aQU6v2u2DoiwyeWFo6zViFl
         WB8Kkr7gzoohrcPxoCe85SDqjhf80Dy4w7UTFYfl1PDYi9vwM1VMyZKvVeRa1qDTZPye
         7sglnw0LRbrmLxdG5CxQodkREx2p/2vsElfvaI9Mc4iPWKcum6OuyKK327tesvAtHSaI
         Rkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497462; x=1781102262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2r42H6aMK4b6UNRgIksoOLm8aN27wEuwsly03FlTjcQ=;
        b=d2ciFBh1GbojTMsykyiZK57CA6cdVZdNCBJIvKBzRGJ4gAOfi+l/0h666RBLKBp1O/
         TjSUVCKR2Nnmh6EsC+Q3o6Gdf56ZK2Yuw0cKjtU7VQbppYSS1h1Zdy24dNjQuES1tOGE
         rJCO6cgWTVr3AyZR2Q3iKdFfe6k1vEDCr+wbEHJMWOBwSiiech3n6JDeZhr+5WZ23AkJ
         tSjfuBbm+/D6Ea6+KtfOQUrQ0PFcFY/XczE9wILY6tKEF4pq7tb5eQRl989W8UoIl5W+
         udS47BEp7lCSJ4LzGPhOiL2kLhVbR9L5EIqKq8jfkYgZK0M4fywDhLBBl92klslzSjf3
         JPgw==
X-Forwarded-Encrypted: i=1; AFNElJ/gTf0Cuww5s7uFwc9PvviuOpC6b/7qJboWRNLxmigCcolLTiy10o/g0qAZI+E1ShIArgE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzjl0c+/9bGZbVnYnlC4eJd+c7M/CfIKWUGvebOB5t1KD7BJo4D
	DEirNlxvHLDQ2Mt6AL5nnV0K3dXe7wTYzXuvUpze4o4A/ge5iM/r9aHC
X-Gm-Gg: Acq92OF/4oRcpOR3M0mjfvJDqc+giwSskC1le07sqtPCpR2Xbq3IRF8D5v3wcvhWixR
	KCCzH0iVenof7souGMZ8qJbIyS0JPEZ7PS0X0T/E9z1YN6P4rW4UO0FuuGcVNlzSqtxlUFqst6o
	7xNTt1822wt3gKC/Uxy7R5L+Y7QakB8+QBHeo73oKybHzu2KyjJQ8TR2OJNg9OFMJK6CK7Z6mId
	ofm7MMRq1Jqc1/77fRREy2JrXZh+LX8h1jtJvVErE8SkTEXrPikF4DP4pAbEzGcrC4XV6HU13I0
	DZ79WzmL8ea+Hqv3+GDz9TJQFfjhLj//pK+in+HcOhKZIIAmgDyOS9VrF6QXjXUZmzmWr6g4F8k
	l9YUW1uvBNxOfegJKqvhC3cVNrOeVULJAck9+xKnaRXLc2JHAYzDJ1eHOoJDERezZF6ABfrKWWc
	otHXZ3E8BI1J/pH1y+daItppyIYsAli96iAR0KhRQ/UgonyVNz7ONlFBjk9vJatmXDqFcOgntxF
	2l/8qd4RJbSvGpq9Sy44UE+sH/9gkz5SMS5VytnyhBc8aFW
X-Received: by 2002:a05:600c:c163:b0:490:b5d0:598e with SMTP id 5b1f17b1804b1-490b5fe9575mr65008075e9.21.1780497461900;
        Wed, 03 Jun 2026 07:37:41 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:41 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 14/14] arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs
Date: Wed,  3 Jun 2026 16:37:21 +0200
Message-ID: <aa740b2d684362627b46d35912c979c01f8c2c36.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the GPIO pinctrl state and GPIO descriptors required for I2C1 bus
recovery on the VAR-SOM-MX8M-PLUS.

This allows the I2C controller to recover the bus if SDA or SCL are held
low by a device.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

 arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 49467b48d0b0..61786eee0e82 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -180,8 +180,11 @@ led@1 {
 
 &i2c1 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1_gpio>;
+	scl-gpios = <&gpio2 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pmic@25 {
@@ -415,6 +418,13 @@ MX8MP_IOMUXC_SD1_DATA5__I2C1_SDA				0x400001c2
 		>;
 	};
 
+	pinctrl_i2c1_gpio: i2c1gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06				0x1c2
+			MX8MP_IOMUXC_SD1_DATA5__GPIO2_IO07				0x1c2
+		>;
+	};
+
 	pinctrl_pmic: pmicgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
-- 
2.47.3

