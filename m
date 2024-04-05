Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC540171E61
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 16:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712333265; cv=none; b=Xmk3nfQjsrAXjvielYN+ItwEljOOWZ1ikUSH9ovQLZF5EExf52VpB+qrl135eM+E+WRqrMipK6riHxmD7rab7OXQj7D1A2P+lKKlxQ+TAowa2jBA06gsQBmDb6GrfnAhvpU1TN45CJeCKrRMl2elUQyEtW4Y0scNwDFFpRqELZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712333265; c=relaxed/simple;
	bh=s2oelWPLHDUwNqi9cCjSGSaQzE7ldrgKjOrCLiSRNug=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D471JDL/2MMe/y7GzGsKBHDonnkf8U9hy2f8rY/zOu9vbyktmLM1M+9GETXkQ/qPSOj7ZgCfXCLuzXLsgO9QXnYReeMrUq7erMfceu4UH989rrvgKJHqkMqdII/3jgonxLcGcqXYPXPbtgOO6+JMzimV33Mt1d1lLmCs7NIlZrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyqjGHz7; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyqjGHz7"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4162b0e21b0so12295205e9.0
        for <imx@lists.linux.dev>; Fri, 05 Apr 2024 09:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712333262; x=1712938062; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rWZ/UFU9OUajltHDRCM2CeH0LshCjJsNLCkamYUQgwY=;
        b=lyqjGHz76wEM/oIt72hdwQY+teLLOcPQXkPTv2KD+e3p5uoQxB7QFayZjeFLDyU83N
         pEh/Jd/7WKsYQWTO492W0ulWeYCAU7WBjclJNLEMoUPQAAANyDTs7Zh4P1ms8B5CzeUu
         A2CO/RpGn+lr3PlNqHUoEg0lszYceNd5F1IMkTMXZjC7zZJJ3WhCS5vRZihYNvcujS1R
         If+Kon2SflpLUehEOf5zGbowNZjaH5K5lynB0MewufZOIYYwikW3ImX/zfOmaMIRAN/u
         u7lI0E83vlNONeuq2Eu9uuOVerxulXQ5zLW8ZJY1+/n9D3XQFQ4Gkrpt3sqIIO63/wWr
         XWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712333262; x=1712938062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rWZ/UFU9OUajltHDRCM2CeH0LshCjJsNLCkamYUQgwY=;
        b=GMwLOF0t0zYi0j5l0w5xY0m8UOvFPH4IkT4AOJ+/EyNbkFBqYgxA7RVnvtQBEc8ILx
         m6u4dc/JgCgyoo7/X5/gxGEfbYUTyB0x9mlS/2UxtIScYPG/i7Cx538tuQ1Pz+x9S3yr
         iCuip2RL4YZJGp5fKqeT+HkTmvtAth/Nm6XyRlmsdV105XVy1RXXyZnGkTKJHDS38/4e
         CAZIHFuY3V7gDPBWV8seR3Hali59p95p1Bt/NxkOOcz8DNlR2t08Wybwkm8xZeTKHF3l
         fmS3ripN4Fxz1L6VTpAfcdCp7jYHJiuzFIavoLkcmf0jLv5ZvY7KdPn3+MbyxiByU4FN
         6caw==
X-Forwarded-Encrypted: i=1; AJvYcCU7J6PEEEj2vqEAFpzaTXRRVaCzPcSSkLqb2sB9/WLBBaMTfGZ7ornJUQ3x3IiCYrYuTRyIUQslzbkCbRk6FlHOBm0O
X-Gm-Message-State: AOJu0YxZTFeiYYMa5auEpwSd7Qjw0azVYZXAL8/JVQa9tzvvYVKk9whi
	HhBGXsKWYrr1lDHTA9UUZB20MG+2o+5Gqqk6wJjpeWKI14Qmjpih
X-Google-Smtp-Source: AGHT+IEIEeAONGwQhGeJMxNS3GD/dJh0uPbqMERZziPL6q1ylU9BP4frM9EsEdBFmc2rYLQVFaQ9+g==
X-Received: by 2002:a05:600c:1e13:b0:416:3326:c150 with SMTP id ay19-20020a05600c1e1300b004163326c150mr440524wmb.29.1712333261663;
        Fri, 05 Apr 2024 09:07:41 -0700 (PDT)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:f624:ad13:2091:c808])
        by smtp.gmail.com with ESMTPSA id k41-20020a05600c1ca900b004156c501e24sm6902651wms.12.2024.04.05.09.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 09:07:40 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v1 4/4] arm64: dts: freescale: imx8mm-verdin-dahlia: support sleep-moci
Date: Fri,  5 Apr 2024 18:07:20 +0200
Message-Id: <20240405160720.5977-5-eichest@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240405160720.5977-1-eichest@gmail.com>
References: <20240405160720.5977-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Previously, we had the sleep-moci pin set to always on. However, the
Dahlia carrier board supports disabling the sleep-moci when the system
is suspended to power down peripherals that support it. This reduces
overall power consumption. This commit adds support for this feature by
disabling the reg_force_sleep_moci regulator and adding two new
regulators for the USB hub and PCIe that can be turned off when the
system is suspended.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 .../dts/freescale/imx8mm-verdin-dahlia.dtsi   | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
index b64dac4f29c2..393fc9e20423 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
@@ -32,6 +32,25 @@ simple-audio-card,cpu {
 			sound-dai = <&sai2>;
 		};
 	};
+
+	reg_usb_hub: regulator-usb-hub {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpio = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		regulator-name = "HUB_PWR_EN";
+	};
+
+	reg_pcie: regulator-pcie {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpio = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		regulator-name = "PCIE_1_PWR_EN";
+		startup-delay-us = <100000>;
+	};
 };
 
 /* Verdin SPI_1 */
@@ -98,6 +117,7 @@ wm8904_1a: audio-codec@1a {
 
 /* Verdin PCIE_1 */
 &pcie0 {
+	vpcie-supply = <&reg_pcie>;
 	status = "okay";
 };
 
@@ -120,6 +140,11 @@ &pwm3 {
 	status = "okay";
 };
 
+/* We support turning off sleep moci on Dahlia */
+&reg_force_sleep_moci {
+	status = "disabled";
+};
+
 /* Verdin I2S_1 */
 &sai2 {
 	status = "okay";
@@ -148,8 +173,16 @@ &usbotg1 {
 
 /* Verdin USB_2 */
 &usbotg2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	disable-over-current;
 	status = "okay";
+
+	usb-hub@1 {
+		compatible = "usb424,2744";
+		reg = <1>;
+		vdd-supply = <&reg_usb_hub>;
+	};
 };
 
 /* Verdin SD_1 */
-- 
2.40.1

