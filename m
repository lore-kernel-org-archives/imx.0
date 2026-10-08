Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BEA502549
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488448; cv=none; b=MlHJnNPcb9LZtOm65UZtJ/oePNeC6ED4xSDlwptWpYHBYDtj1t330r5ZJ/NWDy1pA+NtxoJSzsezbhVFzbTFwcUb7EbvcxpdpkMqO+IKEcncnBdNAUK8h73vcgnSZg3iHg9F/A14l1QFY3EMWHLvXgEX8JvmpuVm0mPygExmrRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488448; c=relaxed/simple;
	bh=5AReXrC4FLJO1biq7t78AJouBrM49sHmYzFp01FRQsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ihfsJPum8S5FU26jX9ui2bmnW1yXCd/nVR0fv/5RNamYFC3W7AqF15zxKxmEnPQnkIEdNUW9aVo2sgK3yptjMimb5ZhCUb2oWTU9RgYKuAQNehCzKkcWRSN+IbP10NCH7i1pHsP0106yb6LjKZZtt7aEI7xwJz1SZ69HVPOLbRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=svoxFPsf; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="svoxFPsf"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so21751395e9.2
        for <imx@lists.linux.dev>; Thu, 08 Oct 2026 12:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488440; x=1792093240; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32knc5yptOaSTzPqRswLQEdRMbmmyBGuNbQZiUAho2s=;
        b=svoxFPsfidznFxdkyo0psd36AHkB/ve1QTdWhIWOAXV5ee+8h1JysOrDOgxxRMzgsF
         rPniagL2f2Exp5/42X1SGxZ5fayQouZMCtZ1ksU8zffrLkUOH7gd911js8JO3IbULQFW
         iv+r8e95hi3EelUSY3PKmpaMN1GR6wBqkn9gTljhEs2mQIeZGgJTCR0MI3q7rKxy9cOO
         p4rnnx9VBr9hfhUZrFpnpDbm6YS5pkI5kXvfglKIhtrhT83zLO+aXcYyGFMD6lGZ/LwZ
         VV3IYW1u7WIMatJG0nl2dbThd521cTz9rdW3TQV7AFCGiSB1mQmjK7qbSkoq5rtSW4iS
         O9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488440; x=1792093240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=32knc5yptOaSTzPqRswLQEdRMbmmyBGuNbQZiUAho2s=;
        b=DfLOvL92RLiv3pXwkbAG7hSz/rYr1oOZXlJRJFw/VU6GHOBpZUzSi/au+OAP/KI+AA
         IxcxdHCg+Mg/19ahqMcR8ottX1wwYLcVOtVuOXTM/m04eFSlIYZZL+q7KhY+6GnauMht
         VHbIuDP9hkutw7gPzFj7rVerNwdzx0aZkQBcr0uNQh1nC0Z3zJ0hEjs0QfY4icN/QpLc
         EQM2knAv32CE4nbvTbAiAE/yQoFhXrHh8XMH0pj1IywEKHsE1wLpW0HBxznVDq3ao3cA
         zOk6XL+c/gz5/fVoEPCsYN8dEKK+UjLPtIei9rU4fTasUvlx6/mQjsSvc+szV2rdm1ZD
         HKAg==
X-Forwarded-Encrypted: i=1; AKwUvBw0oW3MVNIiWvcGjZOtftn1bmZuvlxqjhiWA8PFyYmE+fj9Vb5Y1AgSji9tb+qK/D9ZW44=@lists.linux.dev
X-Gm-Message-State: AFuF++m8KDtH1lvoFKJP38FskY49HDwcAb997EbY5iaryX9mdmob/r07
	uniBmg6DFkV1uBh5y9tt2EWucuYCLC+a1ofquujqE9mv4TVKsSKYXYYf
X-Gm-Gg: AYBFou1jPZai1GCuFx8lAripEkFyVmIt8ydXjP1mPdcpMK96rCKgHc1wBAWOqY/FQ+W
	zFNkEGPBxGBz+3lN+YeaLxN9UaXyh+Q92ttKZdMsCdgFYRQP3kf0TuqIIqJuq6eMYY/dkjykMwh
	ftrBUfmCrIiDnPNSd0its2I3AxQUsD9KIofmOJTAf5eNU2mw5j4UbFz63bnsxp4nNdzaqmsX42i
	1I3JXiooBbyD9cZz8Haj3cZTDVg1nmbGwMRd4T8wpxv4f95iTV4K9RbpVSXsNx93qNtGGbib7K9
	QdgaGLdH/QHV3PcDZOxTyowgs4xW+UpILe2D3MiSG+3I3QjTNHA1OHeaoMh0yOjqhHhhW9Wm6n0
	VKchhYFugkP3uI98dzvo/HZL3RCha1Qc2yGlYNCpijr9pKyx5Jj1Ws94OL7VwgwZFCQ1FFJjt4+
	siV8dTu9oqDBhQ63r8P99qck7AzIYl9t8ikDKED5sABS86f49mV5ilU0BlyUbIcE2y+AnFK4jCQ
	DEWWdfKNxtQKCTSj3PbS2dxvnjmr00I7v+Ue8wBy0TKwqvYyNL9PK2t1q2eW+1A4gejUiDeR++x
	c8rp0vmnN4c4jpsoi1Sn5g==
X-Received: by 2002:a05:600c:3b8d:b0:49f:fbad:29c1 with SMTP id 5b1f17b1804b1-4a1806611acmr136284345e9.33.1791488439940;
        Thu, 08 Oct 2026 12:40:39 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:37 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v5 10/13] ARM: dts: imx6ul: Share Variscite PHY clock and update PHY options
Date: Thu,  8 Oct 2026 21:37:50 +0200
Message-ID: <3d7cd1dc732ff0dcb378ba8f41d06a06eaf1a850.1791487179.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Move rmii_ref_clk from the ENET2 file to the VAR-SOM-6UL common
file. Symphony needs the same clock but must not include the
Concerto FEC2/MDIO configuration to obtain it.

Encode the Micrel RMII clock selection as <1> to match the updated
binding.

The existing Concerto descriptions hold PHY reset for 100 ms but
do not specify a delay after releasing it. Use the reset timing
validated by Variscite: assert reset for 10 ms and wait 100 ms
after deassertion before accessing the PHY. Apply this timing
through the shared Ethernet files to both the existing Concerto
boards and the new variants.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Replace the broad Concerto conversion patch with a focused Ethernet
   update. Move the audio, storage and carrier consumer updates into
   patches 7-9 alongside the corresponding shared-file changes.
 - Retain the existing ENET1 and ENET2 option files and move the PHY
   reference clock into the module common file for Symphony to reuse.
 - Encode the Micrel clock-selection property as <1> and apply the
   validated 10 ms assert / 100 ms post-deassert timing through the
   shared Ethernet files, including the existing Concerto boards.

v2->v3:
 - Use the shared storage and wireless option DTSI files.

v1->v2:
 - Use the shared WM8904 codec DTSI in the existing Concerto boards.

 .../dts/nxp/imx/imx6ul-var-som-common.dtsi    |  8 ++++++++
 .../dts/nxp/imx/imx6ul-var-som-enet1.dtsi     |  6 ++++--
 .../dts/nxp/imx/imx6ul-var-som-enet2.dtsi     | 19 ++++++-------------
 3 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
index d2a9877344ce..ef838ae07297 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
@@ -20,6 +20,14 @@ memory@80000000 {
 		reg = <0x80000000 0x20000000>;
 	};
 
+	/* ref_clk for micrel ethernet phy */
+	rmii_ref_clk: rmii-ref-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+		clock-output-names = "rmii-ref";
+	};
+
 	reg_3p3v: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-name = "3P3V";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet1.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet1.dtsi
index 6b1e34347bec..ace6d9f35b87 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet1.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet1.dtsi
@@ -5,6 +5,7 @@
  *
  * Copyright 2019-2024 Variscite Ltd.
  * Copyright 2026 Dimonoff
+ * Copyright (C) 2026 Variscite Ltd.
  */
 
 &fec1 {
@@ -37,8 +38,9 @@ ethphy0: ethernet-phy@1 {
 		clocks = <&rmii_ref_clk>;
 		clock-names = "rmii-ref";
 		reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
-		reset-assert-us = <100000>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <100000>;
 		micrel,led-mode = <1>;
-		micrel,rmii-reference-clock-select-25-mhz;
+		micrel,rmii-reference-clock-select-25-mhz = <1>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet2.dtsi
index f0ed71798617..a207a720bd30 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet2.dtsi
@@ -7,15 +7,6 @@
  * Copyright (C) 2026 Variscite Ltd.
  */
 
-/ {
-	rmii_ref_clk: rmii-ref-clk {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <25000000>;
-		clock-output-names = "rmii-ref";
-	};
-};
-
 &fec2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_enet2>, <&pinctrl_enet2_gpio>, <&pinctrl_enet2_mdio>;
@@ -33,9 +24,10 @@ ethphy0: ethernet-phy@1 {
 			clocks = <&rmii_ref_clk>;
 			clock-names = "rmii-ref";
 			reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
-			reset-assert-us = <100000>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <100000>;
 			micrel,led-mode = <1>;
-			micrel,rmii-reference-clock-select-25-mhz;
+			micrel,rmii-reference-clock-select-25-mhz = <1>;
 		};
 
 		ethphy1: ethernet-phy@3 {
@@ -44,9 +36,10 @@ ethphy1: ethernet-phy@3 {
 			clocks = <&rmii_ref_clk>;
 			clock-names = "rmii-ref";
 			reset-gpios = <&gpio5 5 GPIO_ACTIVE_LOW>;
-			reset-assert-us = <100000>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <100000>;
 			micrel,led-mode = <0>;
-			micrel,rmii-reference-clock-select-25-mhz;
+			micrel,rmii-reference-clock-select-25-mhz = <1>;
 		};
 	};
 };
-- 
2.47.3

