Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D3B315D5C
	for <imx@lists.linux.dev>; Sun, 14 Dec 2025 21:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765749194; cv=none; b=qv/qodg/sBWuZc0DZFiz6kiQOpC0+XD+komNuId0e1wNW6RZVsz6gMtO4bm42m2yDPgd35/AIJXFHyz9yr0Mh4agQkkN2qguw3IIbrFkBHpwh9bjyOYOPGokEukD45iZ5wvaAM5dZzoMk8H8BuY5Nrh/detvAxGMwRaw6TkdsZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765749194; c=relaxed/simple;
	bh=aSpybkLoe5CnA4HYcJhOwk25yxid6o9UNHL3aNFzoJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GRakbIOmlSTzRvRUs3QYx6N7x4vbN9PcMM14hckVPVOyITF65O0UvDiYz187wSw7l3bB1b4Z1iM8hblYldRqFA4S73NguugNA/vGXJknlkPd8LVGW4o4F6/TRqFHNhOYV2Cv0KIMz7UeYBC59cgkoEfNN2TNBfv9SXuUxqePxQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imYaBX9E; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imYaBX9E"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47774d3536dso28073125e9.0
        for <imx@lists.linux.dev>; Sun, 14 Dec 2025 13:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765749191; x=1766353991; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tM/GDAHbcq8iQ+ECF/3alHpWVJkwLioPe4BjvZMs1mE=;
        b=imYaBX9E4S7I0/zoQGmNvOOVjcMGkAOdd5krq2VsYeRjL5UOfA8Meqx1iUYQwaTdkN
         ApFkvhejWbnLXY3AFlwze464Sd1t2f96eoMA50Q/G16qxZUZo4N87PPqwLl17uyLocln
         aqM5GzTp7BtXX6ucO7LXV7NthTtspDoWREShgADZA4d7pj6yG1+c/pFfOKPr9qPN9ta9
         +DWLugG2kWNZQjFRFB8t7LXM+Yo3OkCxrlwF0ck/A+frFAFUk2CorS90ztRd1IgLy6Js
         pA7v6D9PNbr+oIcBBfa1YjgCQcvvfgjjro11uw8Xy0IU9zaJoci7ajz1MEHTEgSO4c0x
         +oig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765749191; x=1766353991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tM/GDAHbcq8iQ+ECF/3alHpWVJkwLioPe4BjvZMs1mE=;
        b=X3jiG5nbcIU4qRm53mkmUe6cMFPuLuGEWmUJ/1jLXGDZ5fC6gC4S8/i6ZuH5eE63xR
         7QOlUecjl0egR+elPowo5xwUkf6G0/S215oRZgLATgRLAYUZv3mjS2e8bKmxvlhiutpS
         uMsEaqGBYbjP01N5cvGcvS5BKKkM5JxcHAdE0jDXzgz5mJxprZEpoWptZsnQHYSm+VN8
         qrc2NlhtflWmgQhm4paIkFH//fQf4YeHIWL4JNkVZ7u1ZFfS9U4ODUcigvu6shPUMarS
         ITcJ4DUYTsgJURFxJTEoXZd06+ck6zqN+pE8IYZ0sL47tu1YV9sFmap2LB3/AmjqhFXf
         4B3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtwYeeevR/THxYUyUGINi84HUU0ZLUwvdeRs23rvh4q2WNAHI32td+V14ZHGKOXOrmmU4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAc9WZqPwI3Z9WnxGqTpy+0bMDnKC0ELtZv7EFiNQ9O9wtUkCp
	bHaMOQ2772yb4tB7XEtKKCqvbKzaf8AIQypCxTUOZGR7INGw2hp+Ves2
X-Gm-Gg: AY/fxX4HuZLpW2Fxa09Ht7URUreMEBPxdipcHKcE6SV7pIlA1g5Y/dMezHR93jP4zoL
	/OvShj0WINYK3huc5IO3q9jS81oR5DqD06E96SP0jTEIhqL+UutNqrteEBCdV3xABaz3+DS4j5r
	iVNYromE3T76mWay6lJeUDI4vwewsUvwWzVbbNnBITvNIFM6z0NfZi1btY9daOVPipQxrtPQ6WY
	P0io87sdp426U3v57RvlZEXuZ84yNuct29hwGoe7beRMBQuCsOZrRCZFTC9MLnBiQ3yyaG8//yx
	CfVw5mv9Wb2IHNCSTzJmjAYWHvj+K8YU/nzoE3tfGmCPFUSbaEFXfgL2y3sExvAO1Wz4dpN1GpO
	MW7hZv0o/jO0q4tFdsLcqbTJ46QuEQPpYjLonpDFalTt3dHlzO5NL01lsYFDJ3TY52RauKprns6
	1Z6BCej2KLycODNuPddh5b3S0CpiswR/oZ9VNacyksR64U9bM4pL3MZ/f0OYvzzYSLvoplhp/09
	+bfLHQIqGiPFMk=
X-Google-Smtp-Source: AGHT+IE0IMq/1tUZxhnQGiJzgtJjbUC5CSa+FGAkLQyEctAaGf7usWM7SccW7nJPbd0Qiddz4/h6GA==
X-Received: by 2002:a05:6000:2908:b0:430:fcbc:dc52 with SMTP id ffacd0b85a97d-430fcbcdd84mr1760945f8f.30.1765749190606;
        Sun, 14 Dec 2025 13:53:10 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f6a42c8csm7625568f8f.16.2025.12.14.13.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 13:53:09 -0800 (PST)
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
Subject: [PATCH v4 6/6] arm64: dts: imx8mp-var-som: Add support for TSC2046 touchscreen
Date: Sun, 14 Dec 2025 22:52:53 +0100
Message-ID: <20251214215256.5812-7-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251214215256.5812-1-stefano.r@variscite.com>
References: <20251214215256.5812-1-stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VAR-SOM-MX8MP integrates a TSC2046 resistive touchscreen controller.
The controller is physically located on the SOM, and its signals are
routed to the SOM pins, allowing carrier boards to make use of it.

This patch adds the TSC2046 node and the appropriate SPI controller.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 6da5df11c44a..49467b48d0b0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -100,6 +100,37 @@ &A53_3 {
 	cpu-supply = <&buck2>;
 };
 
+&ecspi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi1>;
+	cs-gpios = <&gpio5 17 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	/* Resistive touch controller */
+	tsc2046: touchscreen@0 {
+		compatible = "ti,tsc2046";
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
@@ -347,6 +378,15 @@ MX8MP_IOMUXC_SD1_RESET_B__GPIO2_IO10                            0xc0
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
@@ -381,6 +421,12 @@ MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
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

