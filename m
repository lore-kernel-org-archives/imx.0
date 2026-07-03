Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D9C417362
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 15:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092461; cv=none; b=py11oCQNzy4UJHAZf35nTBSsmlNBsYDv5h8Nf+mMiQYR8sMFwxHV403I7MJayjCbrRminGTpJ+yT1j9JQUJQVzYfTZ09PPg02iKRQ8old/5Wrn5Ws/k3XSw/UR7xv5BJ/EbGr9wIjurlGE7yNpryLVGKrhQZDTmpJWauGOsMEUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092461; c=relaxed/simple;
	bh=3IRI+0YZ89YfdI6eLFQJsGv8r3K38cc+bhDF8g2QYh0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lm8J8gxISrmfpqv+iscfFbt1eyWjpOwwwshYyco5sGov4JAoYPrqPP8oGlOBZVviEHMxjNKw9Q4ysjleHzuuO0BpohxQa27sbLPx0Nxj55H29MdHLJWlP8g1qnSFehLPlL9F6kXphrbM1+QMnYWJxY6G0Vk29ZF0G8n8K5prkQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CnGOMHtk; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CnGOMHtk"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-476d8e647e9so614832f8f.0
        for <imx@lists.linux.dev>; Fri, 03 Jul 2026 08:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783092458; x=1783697258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QGZm4+XMD1ngU96wT2Oojs/SHdS870fkpgs5aUT2QU0=;
        b=CnGOMHtkcMkKvy3UIwj1GGj9xuBoWkQHWIy3iaX4mnKSY5SgYsfz/SwLyEZ+YQDHlV
         wPK4TBWcV5CQjAVx3K7Z8DdezNZOCFhky13ekl3KkyzFUm5lTztwLQnzBzJnIF8zZkuA
         y8PRjWke7KX19SC75IQ+Me9uJoyEoEtf3o/+j6S+Rgx/eIRVRq9qQyAMiFoNWxA6k2Yo
         osoeFTU6OEBdCj1pRUQrHccoHF6TpTZUVkA84ZPo1o1d6IfzVH5fasHYOoFvFMg8Gwoy
         CjTmygo3paEqUvHCurZQIervhLtRPR2pMpOYzpcs4yWK2E+NWOUDHptxx6PLy1Bayi7b
         fsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783092458; x=1783697258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGZm4+XMD1ngU96wT2Oojs/SHdS870fkpgs5aUT2QU0=;
        b=AryI8NXBpSrfGHbFntkh9SFPE0+K6xzJOpcC407B4ZKpRaC6tTFgsHCLjQugXbihxF
         YbmV5IjhO/CnCQtDeVwLjszie0w9Qg8YOk++I2w3fL+OnDlhaVJVDVafWlC3fToh1Qdw
         5CzoExQ3GA78Hkr6mrgpo/B8UOiGQGNCP/n/CgIATrfBI31OyuV9WOuCOJ5CT1jXkgVH
         f2FKz26bb97Lc1hqUgFMXq81nY5OxJuzCA3OYIJyJsi43DZ8J6fBOWsSEERbRteOkxQs
         MGh1UEtmOhRZM5jTwTaN7KSkEljgSa85bvn7iveDEqUbt0QFx9DIjil8Z9vDin19Ho5C
         vJtA==
X-Forwarded-Encrypted: i=1; AHgh+RrhRlqRhiLElasCrMF+4MEHRu7FlAVM2xgebCEy806WcN7A1AHwLMHUUGFtMiiOgDkKlq4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+KkISaL25XfGoML0wVnAGdC9GqsTAUkpYNIVSNGKV18bDB7E1
	IomJ0sQBfrway04AG92qGU943UEgU/5TYkAuc4RpWmx4R2/5BcitBt6n
X-Gm-Gg: AfdE7cnZwdkPFw4/gzaZoU6H/BuLKjb8iJvM0Q9IDVZ0YS0dB3Gme0R6zyJjuKgEXab
	4uo6hMyhcOn9YsufqRcwX/iH+gVIpyubOBUoagc4hMJ+p4Yt8KUJ2cTY5a4Pjxv2XPErsByH4KQ
	IBQpm5HgrtCk/u910LmgIQEpOq4rgnNuCON4QKHIgKs7HuKRizaCnkPyHH3kLmcvsPeqHhICco+
	FiyqBXzDR5nvPOJ3PfjKdfOUMg8/paQvwY4t7lu0IwNsvs3BmRVBV9A+2I61wBUINiRY7N+bYgQ
	5wY4uSNZhKlNatu24VyB/S21o5ATboOG4dcND5p2BIjCN7Ud8AUDfAQKZPsIEST7vI4fVJvUm9E
	tNsZ7xfRwE8zXdNu2Nkxc9J0KO36sIWST1FzAVKT2Q5UAjPojAQ5J3oq4Kt5BfLoV7ZosokiW8J
	USUZVcpEAnterogWdTiqUv66OkP3olDmjv3Atnz2C9bvf5kJQBFJyfrrZO/r0NOZ1JnxksjD4+0
	em6x8k33AWmrvZszsD6SaumZmw=
X-Received: by 2002:a05:6000:52:b0:46f:f12b:e44b with SMTP id ffacd0b85a97d-4775be03161mr11748719f8f.31.1783092458177;
        Fri, 03 Jul 2026 08:27:38 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.vodafonedsl.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960b06sm85460f8f.28.2026.07.03.08.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:27:37 -0700 (PDT)
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
Subject: [PATCH v1 1/1] arm64: dts: freescale: imx9-var-dart-sonata: fix Ethernet PHY configuration
Date: Fri,  3 Jul 2026 17:27:31 +0200
Message-ID: <20260703152731.236793-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Fix the Ethernet PHY description on the DART-MX9 Sonata boards.

The GPIO previously described as the PHY reset line is actually a
board-level enable signal required by the PHY. Model it accordingly and
remove the incorrect reset GPIO description from the PHY nodes.

On i.MX91 and i.MX93 the signal is described as a fixed regulator,
whereas the existing regulator description on i.MX95 is reused.

Keeping the PHY enable asserted during boot ensures that Ethernet
initialization completes successfully.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx91-var-dart-sonata.dts   | 14 +++++++++++---
 .../boot/dts/freescale/imx93-var-dart-sonata.dts   | 14 +++++++++++---
 .../boot/dts/freescale/imx95-var-dart-sonata.dts   |  3 ---
 3 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
index 3f0fd321d95f..f7e32f9375f5 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
@@ -97,6 +97,17 @@ reg_rgb_sel: regulator-rgb-enable {
 		enable-active-high;
 	};
 
+	reg_phy1_supply: regulator-phy1 {
+		compatible = "regulator-fixed";
+		regulator-name = "SUPPLY_PHY1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pca6408_2 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <10000>;
+		regulator-always-on;
+	};
+
 	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -139,9 +150,6 @@ mdio {
 		ethphy1: ethernet-phy@1 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <1>;
-			reset-gpios = <&pca6408_2 0 GPIO_ACTIVE_LOW>;
-			reset-assert-us = <15000>;
-			reset-deassert-us = <100000>;
 
 			leds {
 				#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
index 5513d3b148a2..1ca3ec8330d0 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
@@ -103,6 +103,17 @@ reg_vref_1v8: regulator-adc-vref {
 		regulator-min-microvolt = <1800000>;
 	};
 
+	reg_phy1_supply: regulator-phy1 {
+		compatible = "regulator-fixed";
+		regulator-name = "SUPPLY_PHY1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pca6408_2 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <10000>;
+		regulator-always-on;
+	};
+
 	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_SD2_3V3";
@@ -180,9 +191,6 @@ mdio {
 		ethphy1: ethernet-phy@1 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <1>;
-			reset-assert-us = <15000>;
-			reset-deassert-us = <100000>;
-			reset-gpios = <&pca6408_2 0 GPIO_ACTIVE_LOW>;
 
 			leds {
 				#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
index 7a58ad38ffb4..ccf7e77016e4 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -346,9 +346,6 @@ &netc_emdio {
 	ethphy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
-		reset-gpios = <&pca6408_2 0 GPIO_ACTIVE_LOW>;
-		reset-assert-us = <10000>;
-		reset-deassert-us = <100000>;
 
 		leds {
 			#address-cells = <1>;
-- 
2.47.3

