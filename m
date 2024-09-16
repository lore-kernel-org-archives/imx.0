Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB011BDC8
	for <imx@lists.linux.dev>; Mon, 16 Sep 2024 20:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726517037; cv=none; b=huTbXabMfa7DqbHmyJlBlJofMgcoLqbIH4tOJ9zdSIcbnZ0UlFvXFMQ1Y2S5sMZmN2beQ8v8tgHJlby7gjQWXeMhxzmMOi6kSPxrSw9uz419x4Vt8YB4ckYRscJMhM5/ijLWMmohAAos57OZaXIC+ooTR15+1FhLjh8XxyfnCKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726517037; c=relaxed/simple;
	bh=Df0vu8wyKcJgl+eGOHEdy980cdxBQwXmPA5py9E7sMM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oiPzWm3Fi6lAis1Bzf9KBw0/MduxP4KvAzYk7I7MovyjddcpWQrfDSipdyBonsith5BR2+XZl4O29AudwWnZVDeaoNGcDrBYv42iI401zqDwPjSGhiquVPFOPto0mhDErAWxajb1z2pv/e6NVc3QIY7vJ0enZwAV/RMT/+6cf+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CezDqhE8; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CezDqhE8"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cba8340beso36905935e9.1
        for <imx@lists.linux.dev>; Mon, 16 Sep 2024 13:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726517034; x=1727121834; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oJqKzDykopbcXCyaQAM3tTia9TVWEfHdxg285UZzTsY=;
        b=CezDqhE8jV80E1ZiDaUXaqbv/wgP/ZUkrn+jO6E3JYHPZajsVuRU+voeqfqlcmiaYz
         y+ePjPn0YoopMaALTlSOURjdimAqjPtNGy/3fhngmAOzeWJykS4DkGwHlAItab1dX4h6
         PBPQnMMLB5YiNO64d+syeNxaI2sBVgOZkdPEQj9rGluCuCcPyCabSDhKQCThxihA39AH
         TGI8lke6gavGi5GgK20MrS1REOaj7zK9xxwDXVuGEdH8ZI82cToCn/x+bSnnDmHgXwY7
         pIH3RbuaBqPRp3fPeRg+DdEi9zlh0NgWokekI5sObaXU1U0uKdbGIvXViYG1CMyUhnsz
         sCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726517034; x=1727121834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJqKzDykopbcXCyaQAM3tTia9TVWEfHdxg285UZzTsY=;
        b=Q+UnjDb35U/4R+0NS7IqlTQ+1ffPTHzKT8onrVMFKqnE/x9hyJfsLNoR2/lN0jW0JC
         Obt6i1KibTyFr9Ej+8InELPxg7hj3qYA7XbgUUTucMDSWnulVgR91kp87sfAr1ccDTe2
         szztbpvFmN2k0ObVdJIChYfXWKl5BFwY/CGj1UzPVjS1RHRtro5N+8n2Jqb6RfABpKAC
         AHmrZb9f3nsb5/nUP8tQ6G+mzUN3Frb1mHcIOHz0gEqm4/xrSzdCD4xRBxMyMw3hsy4N
         vE3ioJIax+u5C/7xRjBAj+y6BAOkfG4cjLqgOiI1ptfnaIDZ4ht5Rl2bdR/GLwPLOZy7
         nbUw==
X-Forwarded-Encrypted: i=1; AJvYcCWX1jMKxypwEMvjj/olnWtb7IGEPZHxDmRpe4yB5AcZekHLQEvA4lf412J419dyLSh0YJo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNHgVIY+wvl0XRN4lu0bG06bw0vmr8mzej9K70hUatLh89BMGz
	dIHO/d3TKPETZmHks1JfagD/N7pzdu8DOjDnwPzKgvu6GRliSmu4
X-Google-Smtp-Source: AGHT+IGpcdlnbpU7EgkN9nVbuDNBKqoVX0DKnfVRK05L+w7SZW6I3HTkSWOHcc7UuhjMDardzIpoZA==
X-Received: by 2002:a05:600c:3516:b0:42c:b7ae:4c97 with SMTP id 5b1f17b1804b1-42cbde1a867mr131407545e9.11.1726517034351;
        Mon, 16 Sep 2024 13:03:54 -0700 (PDT)
Received: from ld-100007.ds1.internal (178.165.165.188.wireless.dyn.drei.com. [178.165.165.188])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-378e7800138sm7884487f8f.68.2024.09.16.13.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 13:03:53 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
X-Google-Original-From: Diogo Silva <diogo.pais@ttcontrol.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	aisheng.dong@nxp.com,
	Frank.Li@nxp.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	diogompaissilva@gmail.com
Subject: [PATCH] arm64: dts: imx8: Fix lvds0 device tree
Date: Mon, 16 Sep 2024 22:02:56 +0200
Message-Id: <20240916200255.2566209-1-diogo.pais@ttcontrol.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Diogo Silva <diogompaissilva@gmail.com>

Some clock output names on lvds0 device tree were duplicated from mipi1,
which caused an -EEXIST when registering these clocks during probe.
Also fixed the device naming to be consistent with lvds1.

Fixes: 0fba24b3b956 ("arm64: dts: imx8: add basic lvds0 and lvds1 subsystem")
subsystem")
Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 .../boot/dts/freescale/imx8-ss-lvds0.dtsi     | 22 +++++++++----------
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts  |  4 ++--
 .../boot/dts/freescale/imx8qm-ss-lvds.dtsi    | 20 ++++++++---------
 3 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-lvds0.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-lvds0.dtsi
index d00036204a8c..a4d94467039f 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-lvds0.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-lvds0.dtsi
@@ -10,34 +10,34 @@ lvds0_subsys: bus@56240000 {
 	#size-cells = <1>;
 	ranges = <0x56240000 0x0 0x56240000 0x10000>;
 
-	qm_lvds0_lis_lpcg: qxp_mipi1_lis_lpcg: clock-controller@56243000 {
+	lvds0_lis_lpcg: clock-controller@56243000 {
 		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x56243000 0x4>;
 		#clock-cells = <1>;
-		clock-output-names = "mipi1_lis_lpcg_ipg_clk";
+		clock-output-names = "lvds0_lis_lpcg_ipg_clk";
 		power-domains = <&pd IMX_SC_R_MIPI_1>;
 	};
 
-	qm_lvds0_pwm_lpcg: qxp_mipi1_pwm_lpcg: clock-controller@5624300c {
+	lvds0_pwm_lpcg: clock-controller@5624300c {
 		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5624300c 0x4>;
 		#clock-cells = <1>;
-		clock-output-names = "mipi1_pwm_lpcg_clk",
-				     "mipi1_pwm_lpcg_ipg_clk",
-				     "mipi1_pwm_lpcg_32k_clk";
+		clock-output-names = "lvds0_pwm_lpcg_clk",
+				     "lvds0_pwm_lpcg_ipg_clk",
+				     "lvds0_pwm_lpcg_32k_clk";
 		power-domains = <&pd IMX_SC_R_MIPI_1_PWM_0>;
 	};
 
-	qm_lvds0_i2c0_lpcg: qxp_mipi1_i2c0_lpcg: clock-controller@56243010 {
+	lvds0_i2c0_lpcg: clock-controller@56243010 {
 		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x56243010 0x4>;
 		#clock-cells = <1>;
-		clock-output-names = "mipi1_i2c0_lpcg_clk",
-				     "mipi1_i2c0_lpcg_ipg_clk";
+		clock-output-names = "lvds0_i2c0_lpcg_clk",
+				     "lvds0_i2c0_lpcg_ipg_clk";
 		power-domains = <&pd IMX_SC_R_MIPI_1_I2C_0>;
 	};
 
-	qm_pwm_lvds0: qxp_pwm_mipi_lvds1: pwm@56244000 {
+	pwm_lvds0: pwm@56244000 {
 		compatible = "fsl,imx8qxp-pwm", "fsl,imx27-pwm";
 		reg = <0x56244000 0x1000>;
 		clock-names = "ipg", "per";
@@ -48,7 +48,7 @@ qm_pwm_lvds0: qxp_pwm_mipi_lvds1: pwm@56244000 {
 		status = "disabled";
 	};
 
-	qm_i2c0_lvds0: qxp_i2c0_mipi_lvds1: i2c@56246000 {
+	i2c0_lvds0: i2c@56246000 {
 		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
 		reg = <0x56246000 0x1000>;
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 62203eed6a6c..f7b9b319a58a 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -96,7 +96,7 @@ vdevbuffer: memory@90400000 {
 
 	lvds_backlight0: backlight-lvds0 {
 		compatible = "pwm-backlight";
-		pwms = <&qm_pwm_lvds0 0 100000 0>;
+		pwms = <&pwm_lvds0 0 100000 0>;
 		brightness-levels = <0 100>;
 		num-interpolated-steps = <100>;
 		default-brightness-level = <80>;
@@ -541,7 +541,7 @@ &fec2 {
 	status = "okay";
 };
 
-&qm_pwm_lvds0 {
+&pwm_lvds0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm_lvds0>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi
index 0514d8b2af75..46fa97d5ba5c 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi
@@ -4,31 +4,31 @@
  * Copyright 2024 NXP
  */
 
-&qm_lvds0_lis_lpcg {
+&lvds0_lis_lpcg {
 	clocks = <&lvds_ipg_clk>;
 	clock-indices = <IMX_LPCG_CLK_4>;
 };
 
-&qm_lvds0_pwm_lpcg {
+&lvds0_pwm_lpcg {
 	clocks = <&clk IMX_SC_R_LVDS_0_PWM_0 IMX_SC_PM_CLK_PER>,
 		 <&lvds_ipg_clk>;
 	clock-indices = <IMX_LPCG_CLK_0>, <IMX_LPCG_CLK_4>;
 };
 
-&qm_lvds0_i2c0_lpcg {
+&lvds0_i2c0_lpcg {
 	clocks = <&clk IMX_SC_R_LVDS_0_I2C_0 IMX_SC_PM_CLK_PER>,
 		 <&lvds_ipg_clk>;
 	clock-indices = <IMX_LPCG_CLK_0>, <IMX_LPCG_CLK_4>;
 };
 
-&qm_pwm_lvds0 {
-	clocks = <&qm_lvds0_pwm_lpcg IMX_LPCG_CLK_4>,
-		 <&qm_lvds0_pwm_lpcg IMX_LPCG_CLK_0>;
+&pwm_lvds0 {
+	clocks = <&lvds0_pwm_lpcg IMX_LPCG_CLK_4>,
+		 <&lvds0_pwm_lpcg IMX_LPCG_CLK_0>;
 };
 
-&qm_i2c0_lvds0 {
-	clocks = <&qm_lvds0_i2c0_lpcg IMX_LPCG_CLK_0>,
-		 <&qm_lvds0_i2c0_lpcg IMX_LPCG_CLK_4>;
+&i2c0_lvds0 {
+	clocks = <&lvds0_i2c0_lpcg IMX_LPCG_CLK_0>,
+		 <&lvds0_i2c0_lpcg IMX_LPCG_CLK_4>;
 };
 
 &lvds0_subsys {
@@ -41,7 +41,7 @@ irqsteer_lvds0: interrupt-controller@56240000 {
 		interrupt-controller;
 		interrupt-parent = <&gic>;
 		#interrupt-cells = <1>;
-		clocks = <&qm_lvds0_lis_lpcg IMX_LPCG_CLK_4>;
+		clocks = <&lvds0_lis_lpcg IMX_LPCG_CLK_4>;
 		clock-names = "ipg";
 		power-domains = <&pd IMX_SC_R_LVDS_0>;
 
-- 
2.34.1

