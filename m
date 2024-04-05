Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B9017107A
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 16:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712333260; cv=none; b=I/L6goHyh3c5FAADt4hPLdbGDqRKLvg2uH6+92VZs1MTpdCr8rs749kKHG+MQo7FY37rOG2Nymd1krB6KYHQWec9nOWH7rTsNKW4Vp9YcwQeevtagIIKFIZVRrIss4R0lvRKNzzHkprjV+k8mWdQlZEsOEl7vct0yvolchZbUxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712333260; c=relaxed/simple;
	bh=qBYmF0xGWXhV6hUCfu3HKLzpWqtGV+Hfy6dq9NOruFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pUqdQIlldCWNfbfqDDrXbc9f/P+e4Faspl+ymYmTmRf2ZZihap+LxnAE0WMKaokBvNFCXa4npnKHq0kuH30Pk9HsyDpgg1cy+S8JylvR6m27xQLA2rHLFZPZY0oS3ir8zCa90DGcWn0Me8K9IHVrvRY56p5uRwxcAbrLYvWJzIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XddoinEc; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XddoinEc"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4156a29ff70so17799405e9.3
        for <imx@lists.linux.dev>; Fri, 05 Apr 2024 09:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712333256; x=1712938056; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOce/01hbDzl8+x1yOJ/1AVGMenhuK+vsq/FsL52bf0=;
        b=XddoinEc1iFohBLoquhpefB17+mQQb4h2Uoutu50mFW12Gb3xztRJ17RXlLm4yFOfH
         UUpxWaZ3wkRdFqAVwf4ubk3Ei8wBQAapbbigETA0KJ4u06MYLir1HaJGdhSAsokV4n1R
         7+k8ouyHOwplDrqfz3iqnPvXXFkiLJv3Xi1uMLBXI6Tz5WFFs+WCZrh/IstYidMEiPZv
         /MaEv1O3tNeZROIr7S7expUYcHt5WZRm6Yl/a6IXx97WHBc5qplM3un67GM6dOrjF6og
         HQCn06f8KccJpd6ARwZ5v4M8Lu5z5pXOJ4qhrVZQ8m9rWERvBgvbTHhgc8wMi/CLhBDR
         JXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712333256; x=1712938056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qOce/01hbDzl8+x1yOJ/1AVGMenhuK+vsq/FsL52bf0=;
        b=gwNgSBNzH2TU7IDB5h82JzzNIvC2AZ2wMbhv8wfPwVVM0YnFnYRTD6JE3TFg50NK4l
         kOe6+R9LqcZjOLrJefTLHcUXoAawe+eRfK5WjS7rjFyjSXeW4lbCQ1DJxZLO2PjDbVMl
         TGR8hBkb5rUuUXBI9t3dtm+FSyEVaWf0rcP4VW8iRwgriP2nP9aNudvsrnMJTUOFcOBw
         i4NIODrB7F0rCVoYRRCA1guAw+4on3wAwY6JNFD1w2tvBBiyF0oP1yVMJuasUP4bSasw
         ybHcMIUQZm0RrDAe0Sz8QaDjJOkCoKMxvdl0Odj4zwkHxrabn5aFPba91+CMVnRlgFdI
         SQBA==
X-Forwarded-Encrypted: i=1; AJvYcCWjMJbPBIZTiR6a5svQP3K2SDr1zsvrfetwyTnYKNSQvEsug3E37YLyVITiHw4oxELa9O8Wvj3i+HHfKbTXLUGyinmK
X-Gm-Message-State: AOJu0YwMpoDNOuUVrTMYKEYmz/adioBDeb3Q2bYyHev9WMKXM1eOhMPp
	NBlGownaHDmTCOfP9RXlobOWYR7BkYPjKBcJxZo6uZhXjcFySrI2
X-Google-Smtp-Source: AGHT+IHX223U4DsZ/xQPDPFZTq5ivcV0JxX0dpOp4Q0Djfm9YV+NtF1fazKA8gfSCWvEVdck2JLcjA==
X-Received: by 2002:a05:600c:3d88:b0:415:52f8:ca74 with SMTP id bi8-20020a05600c3d8800b0041552f8ca74mr1533482wmb.36.1712333256089;
        Fri, 05 Apr 2024 09:07:36 -0700 (PDT)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:f624:ad13:2091:c808])
        by smtp.gmail.com with ESMTPSA id k41-20020a05600c1ca900b004156c501e24sm6902651wms.12.2024.04.05.09.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 09:07:34 -0700 (PDT)
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
Subject: [PATCH v1 1/4] arm64: dts: freescale: imx8mp-verdin: replace sleep-moci hog with regulator
Date: Fri,  5 Apr 2024 18:07:17 +0200
Message-Id: <20240405160720.5977-2-eichest@gmail.com>
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
 .../dts/freescale/imx8mp-verdin-dahlia.dtsi   |  5 ++++
 .../boot/dts/freescale/imx8mp-verdin-dev.dtsi |  5 ++++
 .../dts/freescale/imx8mp-verdin-yavia.dtsi    |  5 ++++
 .../boot/dts/freescale/imx8mp-verdin.dtsi     | 26 ++++++++++++-------
 4 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
index 7e9e4b13b5c5..e68e0e6f21e9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
@@ -70,6 +70,11 @@ &flexspi {
 	status = "okay";
 };
 
+&gpio4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ctrl_sleep_moci>;
+};
+
 /* Current measurement into module VCC */
 &hwmon {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
index a509b2b7fa85..1a2520d4d6cf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
@@ -93,6 +93,11 @@ &flexspi {
 	status = "okay";
 };
 
+&gpio4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ctrl_sleep_moci>;
+};
+
 &gpio_expander_21 {
 	status = "okay";
 	vcc-supply = <&reg_1p8v>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-yavia.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-yavia.dtsi
index db1722f0d80e..27160024d5b5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-yavia.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-yavia.dtsi
@@ -100,6 +100,11 @@ &flexcan1 {
 	status = "okay";
 };
 
+&gpio4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ctrl_sleep_moci>;
+};
+
 &hwmon_temp {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index faa17cbbe2fd..e523762947aa 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -116,6 +116,22 @@ reg_module_eth1phy: regulator-module-eth1phy {
 		vin-supply = <&reg_vdd_3v3>;
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
+		gpio = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-name = "CTRL_SLEEP_MOCI#";
+	};
+
 	reg_usb1_vbus: regulator-usb1-vbus {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -439,16 +455,6 @@ &gpio4 {
 			  "SODIMM_256",
 			  "SODIMM_48",
 			  "SODIMM_44";
-
-	ctrl-sleep-moci-hog {
-		gpio-hog;
-		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
-		gpios = <29 GPIO_ACTIVE_HIGH>;
-		line-name = "CTRL_SLEEP_MOCI#";
-		output-high;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_ctrl_sleep_moci>;
-	};
 };
 
 /* On-module I2C */
-- 
2.40.1

