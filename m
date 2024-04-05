Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7243017167B
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 16:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712333263; cv=none; b=XOc3p844re9tmFrUG7YNW75Ecl03ot4lZHUYDD8HFsr1UYIse5cJAN+Y8UtVuHvHCcKaqAstdDs4v5eR87brzsuQOHsJHrv7EacwnDNoN6Pa3QJNuleO2XErl1ZjVyyU6YzjYBzx64BQLFjEhYLza53ZxgjepJKNLrD8dmkF/9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712333263; c=relaxed/simple;
	bh=7z5A63z34JZY3N+TJSxKM7g09BIVDVW2CNscb4AcyH4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KROuPs6/A/fE5RWh6LIdrhyBTK5W8G/TV31n+4CuKK9d6kIrPDBg5y3P+ZvqENHKGHqg7wS9tJumywXAau2URcB/WpTvi+DotvHIpwa2Gjet3kMG0qElo+BW+x/PyHrQKTEy2u1w4H/+WQ93jQeep/+Jm8y2LNARc2CsaiRo9SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dt0LG6YE; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dt0LG6YE"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4162ef30461so6311055e9.1
        for <imx@lists.linux.dev>; Fri, 05 Apr 2024 09:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712333260; x=1712938060; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6pW63QzcVFb8Z1JhQZTU0zt0MbJJ3KtnHGcQ53YARs=;
        b=Dt0LG6YEAnIb3NXd5T5RkmFWsgAWUk47nCYnozyzzB7gUJjLhKzlGGjluFJOejEPRd
         2SYAjpJ48toqWG9D9X2cb4V+rIBue4xH7cVGjtOqZERyfQypBfGpuBEx3mkpd2S+Z2qr
         168gOqlsVjbo3Mtk8xorhmKkowYDnMlgjFb7wSF58j6un/hifT5zKYj0CuCbDckKPagS
         nKjk33fTQsM/tBix/fKY2KEy6wdfwcohnOjCxtz67FpMvhyQq1SxPNlArf/tQyCuO5/h
         s2gu+JVD2pxlW8lsxgaRDNyB5OdCtx4EspRIRs2iLIZAMXZtm8A7J7rVILOvGFddhUC8
         upZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712333260; x=1712938060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6pW63QzcVFb8Z1JhQZTU0zt0MbJJ3KtnHGcQ53YARs=;
        b=FxIMrfkRSwr81k3GXEplzNVVefocYOfpgoNXZ3VkzTONFWo7MZR68aNUAM690QD+p1
         OhNx4HjZCi/HN0018vVHb4AgtC7Q5+s/KR4F8A8hV3GDaXObDSBGDUSx0kuzZP+svgl6
         auigDoCmoF+YQ4r4tdaHTjCKpqEghzmK/mt/hUI34f/3JLkpsiCln8dFOpdcG8lsL1JJ
         uqQ33f/44gN02ttTnWxIxOmbeZZtrjPagzrPdW9EXG8MWudTLx9GMXaddY8HSpa2LQVz
         fNjZFuPfWb/+wU56CxEOqGPgSebf9HU2a4oRnVvMgKXy5xT/2Auv8mSqgkxl4ZYLHm1L
         /Acw==
X-Forwarded-Encrypted: i=1; AJvYcCWPnYvye2EWvSWLvcwH9RHBY9XQT1rwbaIIIeOckG6Jd/aXefGzflZ2CSC3vwEKrs1hAaKgp7EQfktMdN4hehDogwo1
X-Gm-Message-State: AOJu0Yz2KyDq36uVwEXw00eJR4n6LgBCm73qt3EjTM9EMjm9jdRiwr4V
	OxctWyj+GMJkc4S7j4kJ5wRMkZ67douFbN/wchN0qP6MUTuuVaig
X-Google-Smtp-Source: AGHT+IH+zUWXxsL8Og9UKbQxJ0DlCkaJldoLKLu4x8k64dMC7ySwdn8bowpGE2+mWbtxVMQsEct02Q==
X-Received: by 2002:a05:600c:3acc:b0:413:fc09:7b19 with SMTP id d12-20020a05600c3acc00b00413fc097b19mr1449758wms.40.1712333259840;
        Fri, 05 Apr 2024 09:07:39 -0700 (PDT)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:f624:ad13:2091:c808])
        by smtp.gmail.com with ESMTPSA id k41-20020a05600c1ca900b004156c501e24sm6902651wms.12.2024.04.05.09.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 09:07:38 -0700 (PDT)
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
Subject: [PATCH v1 3/4] arm64: dts: freescale: imx8mm-verdin: replace sleep-moci hog with regulator
Date: Fri,  5 Apr 2024 18:07:19 +0200
Message-Id: <20240405160720.5977-4-eichest@gmail.com>
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

The Verdin family has a signal called sleep-moci which can be used to
turn off peripherals on the carrier board when the SoM goes into
suspend. So far we have hogged this signal, which means the peripherals
are always on and it is not possible to add peripherals that depend on
the sleep-moci to be on. With this change, we replace the hog with a
regulator so that peripherals can add their own regulators that use the
same gpio. Carrier boards that allow peripherals to be powered off in
suspend can disable this regulator and implement their own regulator to
control the sleep-moci.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 .../dts/freescale/imx8mm-verdin-dahlia.dtsi   |  5 ++++
 .../boot/dts/freescale/imx8mm-verdin-dev.dtsi |  5 ++++
 .../dts/freescale/imx8mm-verdin-yavia.dtsi    |  5 ++++
 .../boot/dts/freescale/imx8mm-verdin.dtsi     | 26 ++++++++++++-------
 4 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
index 1cff0b829357..b64dac4f29c2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
@@ -58,6 +58,11 @@ &flexspi {
 	status = "okay";
 };
 
+&gpio5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ctrl_sleep_moci>;
+};
+
 /* Current measurement into module VCC */
 &hwmon {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
index 3c4b8ca125e3..95b7c9a03a23 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
@@ -78,6 +78,11 @@ &i2c3 {
 	status = "okay";
 };
 
+&gpio5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ctrl_sleep_moci>;
+};
+
 &gpio_expander_21 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-yavia.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-yavia.dtsi
index 1e28c78e381f..763f069e8405 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-yavia.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-yavia.dtsi
@@ -81,6 +81,11 @@ &gpio3 {
 	pinctrl-0 = <&pinctrl_gpios_ext_yavia>;
 };
 
+&gpio5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ctrl_sleep_moci>;
+};
+
 &hwmon_temp {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 6f0811587142..4768b05fd765 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -110,6 +110,22 @@ reg_ethphy: regulator-ethphy {
 		startup-delay-us = <200000>;
 	};
 
+	/*
+	 * By default we enable CTRL_SLEEP_MOCI#, this is required to have
+	 * peripherals on the carrier board powered.
+	 * If more granularity or power saving is required this can be disabled
+	 * in the carrier board device tree files.
+	 */
+	reg_force_sleep_moci: regulator-force-sleep-moci {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpio = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-name = "CTRL_SLEEP_MOCI#";
+	};
+
 	reg_usb_otg1_vbus: regulator-usb-otg1 {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -333,16 +349,6 @@ &gpio5 {
 			  "SODIMM_212",
 			  "SODIMM_151",
 			  "SODIMM_153";
-
-	ctrl-sleep-moci-hog {
-		gpio-hog;
-		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
-		gpios = <1 GPIO_ACTIVE_HIGH>;
-		line-name = "CTRL_SLEEP_MOCI#";
-		output-high;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_ctrl_sleep_moci>;
-	};
 };
 
 /* On-module I2C */
-- 
2.40.1

