Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75EF28136C
	for <imx@lists.linux.dev>; Sun, 14 Dec 2025 11:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765710360; cv=none; b=cXwSVFZKMlXAxFozdViOBtH+6V+/ONINP4ama+TKGk1rLofvhJG2M8JO6tSUqrxqxIpEVIiH5dpGnCuJ7wRpdlPeesk4PUV5yYMERTyZN3Hs+Csl98Blrak0+LLpSvtO10hmiejQBDV/EJosIzz/iDV7CrWtL3Fm0w5re8MBiao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765710360; c=relaxed/simple;
	bh=0vx0G+xvB4rLVv1R2A8zSldA+5rpjG2FAPCN6UsCqTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fB5c9sc/OkRv+Ye1AKP6U/5XSAgTnkWgC8znhXsZg64Tcdqwl5hFY5J2gV4NgKXhanSSBKt7XtI3wu/mFm2keQqRQeLdPq3QsAIsymHZf6HKjjKmtqDZImNl88ikC/k4cdgFrRQR1qj8ByWkC7Glg1dEjWtT/A0vPf65r/iazVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPMQV6UH; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPMQV6UH"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso11084315e9.1
        for <imx@lists.linux.dev>; Sun, 14 Dec 2025 03:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765710356; x=1766315156; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KS2inHSkLCkU7sr8x8nyHZWnAt9HgwanjJVsRDuujGk=;
        b=PPMQV6UHUQbDcwFfxi8PfD+4FwM2vOVjsPyyrKcwlmLNuHJ4ViGZdJQlmjW2AUTvI4
         IyxTmm+0+rHo3AgfGnjoVGLbziezpCF9IuEnTvba+j79UZjgyb6rpJEi2rGaFciiXV6l
         03YRqtJM29RJVjY2S99Yed9HVXYy8P7kxJgUx5W3ajJzotC9GN5KvE85u8MlEEI/ICAU
         adi2rD8wSCQiOZdJZc+KEAw7Bx6hx8cAAG4GnZUjx+8tBpgsU4GM6eUW2YsWqCZZ+nrw
         VB5/BDSW0rytzv6dPbXeZJYCzkYJDyqdVT46LgRCYW1qT7FMjTczEfvbzFHaUxAICTAE
         y5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765710356; x=1766315156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KS2inHSkLCkU7sr8x8nyHZWnAt9HgwanjJVsRDuujGk=;
        b=oLR4jqEB7a5bmXwnawrb9RtLi3kqBzXgaD97NYntW/A/8IqqJ5e/uBhV8Cswa9ZtBO
         SX1VVwpq7dfpOt8zflpmlW3reyqJZ0RVFFn8DCyLsLS0Jc9h3jMH8pDKUwJu1pph5Lkp
         nBGx8fjokdz56nIdBkWhbVBHMAim65olumMKT0jmhBYvIvi5REgavFgnfyqX502nt0AJ
         pbuqIW430hnDpdjMwW9xsy+MmQfggXlcFPkvuXJ9WcXoW0lrxab2pREqOVT7bh3o1qkC
         1oc5NO2xEp2Jnyh6WTFP9cHeVJym9cJ4mD8QfEpSgxwuMgxGAekonzr7TrqeEym5pa+A
         zC1w==
X-Forwarded-Encrypted: i=1; AJvYcCUMQeJcQ/dusSh+fLBehXOHAms2IoFc5gN5+OKMObGp4r4oeL/lEV4xf5lNxoiDClbkXmw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIj+DW127/oDtA3MZ2sXp1V6AsEDDOF/mkBtA4m8928yPi49jB
	mE41NeXBb1iWlxw52FUgFAovCLtxN5la9Isq0y563Ujvhv4y0nrs5/vM
X-Gm-Gg: AY/fxX4ulUGw0lHbvB8fU7O9iWXPxUTlz+WkFJ+p51vWNa5Vy+MSdWE8ng3t23j/gS1
	7uKZJg1n9OrdbiucN6TZL4T4VhVDsocbUxoPVy12yVyHDjRVL1IXVUhsUjTbh1SHaZAjChCwHLG
	kKqGsDeeI6m6G7GdBncJDhAfetieQDEsiHVIh2Knh8FScEfRZH3PTy49jDjNk4qlHT6Ole8o+Se
	AyWwq6/mtaJeF3FIlxknIPeVkVAiYqbxZKRNEUtnqcZ5stOfceAKrf5dMNZ/4sZhba+wvNXRmwt
	rgxJtwLpHIdDPQakJ8MnGixEZPnxeIgryQ85dsPwVQQHt42mNiwfr9V7fgNaFJuT95OqSUj0Rpi
	fDxYTEOsnLNq5vvjjwEoejk2JDW5qu5BkAx8jvSFSvLbkJk9XHH01RhF4G2fkMU8Cfa1EuGLpYO
	AvrPCDY2Nm74P5p5Y/51RYPdhaeT/UYfwjsF4TQji4plxK21K68sryGvN4ox9YnuNUDlu1EhDPL
	mMnC9SLv8BF+50=
X-Google-Smtp-Source: AGHT+IGcS0RwgGVBlNe8lVebHczMSiBY6IRZ2F343Ze4Z7S+9GdrqUIDHIw2U32XGAlYd+RgQfN1pw==
X-Received: by 2002:a05:600c:4f14:b0:475:dcbb:7903 with SMTP id 5b1f17b1804b1-47a8f8bd9a7mr81322325e9.9.1765710355640;
        Sun, 14 Dec 2025 03:05:55 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f36b6a19sm7823660f8f.38.2025.12.14.03.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 03:05:55 -0800 (PST)
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
Subject: [PATCH v3 6/6] arm64: dts: imx8mp-var-som: Add support for ADS7846 touchscreen
Date: Sun, 14 Dec 2025 12:05:29 +0100
Message-ID: <20251214110531.9475-7-stefano.r@variscite.com>
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

The VAR-SOM-MX8MP integrates an ADS7846 resistive touchscreen controller.
The controller is physically located on the SOM, and its signals are
routed to the SOM pins, allowing carrier boards to make use of it.

This patch adds the ADS7846 node and the appropriate SPI controller.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 6da5df11c44a..8ab0e32879cc 100644
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

