Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C702FC897
	for <imx@lists.linux.dev>; Sat, 13 Dec 2025 23:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765667380; cv=none; b=LSedfkTfGTwMx38PWWNQLw8zSYe4Wcht5/Bv9YXK5K/7+R7NGda6K47q0IW0yMXUjM0jMgHrVkW/zx/PhgT+GgF95nAIfqDh+6PSRQoRYtmoLIVLETeIV1wb2KQylHxRsA0rrjHZbBB131M3QQMsUn7TABf/9OKyG4CHDgopefk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765667380; c=relaxed/simple;
	bh=yBref/AZwu6pgOZMRs83ElRYvornogsTNti67ViqWjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UwVXnqn2zzQl822Rp9AOprH7AiO6FC2GXQWXVmKip0GlGRcGmXpsbydiiuKvDGnX0/nZBolArehBd6QO3G1TDOnTFeyC4hVuRLZH7KPmfnWmHkAqd3Ox3DI2CmOYoalHIMlLA62RgBxQWzNrsEZcjjInHyIYPzsWTIeYMpiRk5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PxX6IKNc; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PxX6IKNc"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso18199525e9.2
        for <imx@lists.linux.dev>; Sat, 13 Dec 2025 15:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765667377; x=1766272177; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFBu7h1JZxFW4pexj6Ke1Y08ewGv0xJ1I7XQdP6xSOY=;
        b=PxX6IKNc+AS83fvQWB2y5ddXjp2VHZwzosMjzi+4HaDK1hdY3wEe6wOvkJ9k0NAuF3
         umVmRODuM56ZBm/i6QuIAw2Paonga4Kqbx6+IDiYXKpQJoNf1wfFyJgNzF74OvfcNJ25
         2V4ig9AZFGCtBZMK/lFYawA4VOp6EvNf46gLSFyhnk7I+/r2tWzJoypHc+LzJWo73+Jp
         T13JPHcoTEGS3iRDFxPaELSBXpdi/OZNtY0K7vdT4yu3ovQVQscNJRXDPHDODf4FcCVu
         euHP43YvGKDHcGHY7WkQOGGlkaN8ZC6SQgchiMtlZu6Khz5Vsm9SvYZZBsq8vlmY6E3L
         /UsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765667377; x=1766272177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XFBu7h1JZxFW4pexj6Ke1Y08ewGv0xJ1I7XQdP6xSOY=;
        b=MP8mpHjtG3PExuZUeaRIa3JJuqOqvUMO8+BBzzdhDbxfu1Ki4d3FaXrd1ujYhO7TwN
         HshG2lDIsATHR85kBZGLJXpGE0/rYZqX3FuiB/jmYCaRqfEyGk9NKDtjlr0wH0StGE1T
         Q2+sAmwPq9Hf6vKX1gjkcSnNxHWIYD1U58tUMo9CT8k+asFe7eLHQY9Yg9p2Z4DCDoQR
         SrpTqVPH+UyIarsNjSr1uBG7ztrDTkEyraGffWkvbmxka6A/Gkdwd7O9l64tvComk1hB
         VsKiJUGmNvvX9jTiviA4KIJHm/qO6j3Chc1cQfCWEindy3GVsTLfKcyFLKp+92SZO7TQ
         QxLw==
X-Forwarded-Encrypted: i=1; AJvYcCX4id8TRe4kLUffJqbkETAGij0l/ltKLjSVeRPplGMJwPv1TaIcZQQWAkuvlvL+ilvda/s=@lists.linux.dev
X-Gm-Message-State: AOJu0YzzUPM3eoMSyJpfGuoHfgi7C950L91O4qdr7zWz6i2OgR9qqNe1
	RWICT4ZNNJU1dHiXa2j7ugYiWKkm0J0W3rq1/GwJBA+kSwa5wokS6jNP
X-Gm-Gg: AY/fxX71Whi3vJotzbvjaRja1hs52n7kiZ+/bLvpHUtUBFGHwRcq0Qv2wdWng2GjOT0
	D6I0zwioGAzDnfSmzJV3Z4Tu8+WGTnPtsp8DU7WySDdKcPlmjEjp3xGQLjmqw8FQt+LkzFd52ws
	0qeK+Zy9EHEF+OzLrZxK+zquOsgmDpnkEPBRf/4Kx3QIOSWhFItcinx5VvLDd4ukBLvvjtictOl
	ks9ljfRJXfsuArT5QjaVIL3P4yFNgxEP81Znn6FlDz6WZRyZB1pDWLMFTMhhf46SVgwiJ12HXOy
	6NUYdCSeNN5YoaJtYHaRfi4gRTrNn7I6n7kvmCwke6ARh0E98D2a1aHjEF5UVPMjEI9ZffUJI6I
	kkuB4kOFPWGBZIRrEfLV6LvMex9AQpCo/oFxJy1oNJD94kFMeqVLYjqNBJIVBOH6dhMuLs4ArLI
	Any3i4eja1lY7fvgLxDvCIqjo0ZgHu3/Z7Wfp1sUDN9bSjzpZLnIf9rkugrT1kA1toTZ9gvRHWz
	usV4GLO3P8ggCk=
X-Google-Smtp-Source: AGHT+IHEtlj8IChu5bhTz+/I0sk3TLOpzFD+a5W1lLZsBxV4wDhUBQBzvW9/4MfsDfvwL8cT/egQuw==
X-Received: by 2002:a05:600c:4451:b0:477:9fcf:3ff9 with SMTP id 5b1f17b1804b1-47a8f90f54bmr59911715e9.27.1765667376838;
        Sat, 13 Dec 2025 15:09:36 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4f4150sm106040995e9.11.2025.12.13.15.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 15:09:36 -0800 (PST)
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
Subject: [PATCH v2 6/6] arm64: dts: imx8mp-var-som: Add support for ADS7846 touchscreen
Date: Sun, 14 Dec 2025 00:09:06 +0100
Message-ID: <20251213230909.16810-7-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213230909.16810-1-stefano.r@variscite.com>
References: <20251213230909.16810-1-stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VAR-SOM-MX8MP integrates an ADS7846 resistive touchscreen controller.
The controller is physically located on the SOM, and its signals are
routed to the SOM pins, allowing carrier boards to make use of it.

This patch adds the ADS7846 node and the appropriate SPI controller.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 169fc6a9c8cb..ebe615a84150 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -101,6 +101,37 @@ &A53_3 {
 	cpu-supply = <&buck2>;
 };
 
+&ecspi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi1>;
+	cs-gpios = <&gpio5 17 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	/* Resistive touch controller */
+	ads7846: touchscreen@0 {
+		compatible = "ti,ads7846";
+		reg = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_restouch>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
+		spi-max-frequency = <1500000>;
+		pendown-gpio = <&gpio1 12 GPIO_ACTIVE_LOW>;
+		ti,x-min = /bits/ 16 <125>;
+		ti,x-max = /bits/ 16 <4008>;
+		ti,y-min = /bits/ 16 <282>;
+		ti,y-max = /bits/ 16 <3864>;
+		ti,x-plate-ohms = /bits/ 16 <180>;
+		ti,pressure-max = /bits/ 16 <255>;
+		ti,debounce-max = /bits/ 16 <10>;
+		ti,debounce-tol = /bits/ 16 <3>;
+		ti,debounce-rep = /bits/ 16 <1>;
+		ti,settle-delay-usec = /bits/ 16 <150>;
+		ti,keep-vref-on;
+		wakeup-source;
+	};
+};
+
 &eqos {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_eqos>;
@@ -348,6 +379,15 @@ MX8MP_IOMUXC_SD1_RESET_B__GPIO2_IO10                            0xc0
 		>;
 	};
 
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SCL__ECSPI1_SCLK                              0x12
+			MX8MP_IOMUXC_I2C1_SDA__ECSPI1_MOSI                              0x12
+			MX8MP_IOMUXC_I2C2_SCL__ECSPI1_MISO                              0x12
+			MX8MP_IOMUXC_I2C2_SDA__GPIO5_IO17                               0x12
+		>;
+	};
+
 	pinctrl_eqos: eqosgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2
@@ -382,6 +422,12 @@ MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
 		>;
 	};
 
+	pinctrl_restouch: restouchgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12                             0xc0
+		>;
+	};
+
 	pinctrl_sai3: sai3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI3_TX_SYNC                   0xd6
-- 
2.47.3

