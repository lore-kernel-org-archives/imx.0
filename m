Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BF8824AE
	for <imx@lists.linux.dev>; Wed, 19 Jun 2024 10:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718791858; cv=none; b=tS9JyXccHmLq1tx0KwfKWKzicb4gfinVTgsCnOtRgevLeR+x5YBI1w8bBrNhFg8D19VKXgYyaFpw7LpPFmkU3rXglSUVvAw06e8nJJKNkEXgYuoF/tw24CeOChM45k5W0APTGjUiNKwURc+2Z4CTbbRIuhrQtR1oRPf/cjPEka8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718791858; c=relaxed/simple;
	bh=0rAZYQHhp2RqKaZAMHmpDf0sdQTZ9FI3Tx8uRVuGaVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oFqOZfHJ5od1u+KzBpqatL+NXwqawdGK1oClsdPCoNmYEyj6wb8xkgMzRFIoUZ76+N6dk5k5iTUapXkDk6SorvXJUX/r92h8hhflreFPCxmeqlDXNs8hjXkiVttkZkAeFtEgIgD8Kawgu7vdSjVMG5EVyxFU3O0fTU7HrZXnVJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGMmOed8; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGMmOed8"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6b5052defa6so2195796d6.3
        for <imx@lists.linux.dev>; Wed, 19 Jun 2024 03:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718791856; x=1719396656; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YE3Lrkv65eZljuEfFBOSDNEGg8fn6zSJ9y1iJWCoGl4=;
        b=mGMmOed83uyujKzvcnaeNbE3joG9D9kB7pM9Hm59Rp882RQ8xXT0hdK3b5tbKGVcja
         Q0K4cXicx4zqD3Af4TDxVbK3DCYiqLBfGPiuYMEYTM6JoOu5vQnAsPy1rch1h07r3wWT
         mUkaqp58SaP6kFfG1P/DmO7rFXa6PueRZzGcsLwfentblRqtCRN/12eKRVWghD2UKSMd
         f+6Ens+CffR1Xjls7sQUey/YppCMJHiOLR67v5NIvAmegs4//VESQXL8sJk1wsQs/cHQ
         z/5LqtKbI7Yx5/5NLy0J0uA7PoakfiAzQKyYXe5ANPYqUg5QTbO2Wfxl66fJBqdTdtw1
         30gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718791856; x=1719396656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YE3Lrkv65eZljuEfFBOSDNEGg8fn6zSJ9y1iJWCoGl4=;
        b=SYY0RWFx7OJJ3Tx7XsSIny3/HbdM/MynzAsG3IjVcczCC+7BZwf7Qv5bgeiLs4wfv+
         SwBHoZtSNi8G6+Gi4YrMERWXB1GxpePtWSqmkJlbIS7EzOilNqTgdiAVIpLRgKP3aidl
         pj+7gh0AFEqtgoMZTtIOkmxsIAlQ3MvqFQtlpTJc3QwxLmq0xSvZ97acxGNpJLmnv9UX
         FaqeUFc+PTZeth36UfZJI5qWfbiyw9UxrVij5yKh8C+CaHI1QUttB+v6vJZNh3c0ulh0
         Ik/0j9L61IJsvWNYoear3LPiF2pO9lpY9FJb918X6Y+jPhlNiBR0G5yyYc8xR6Q0A1qH
         TAjg==
X-Forwarded-Encrypted: i=1; AJvYcCVac+nxpGDx+1xn9ufN6DhZUtLxvk6C33Z/qlHmDP18F3NtnF9bF2ejSIpHzIRxqr22zSKcCRX0X0+WIAzwoONobbhV
X-Gm-Message-State: AOJu0Yyf0ua7VqgRqGiarQgZfD9uWdg+pMXGPnfQVpWNJ4OeV16x0YB6
	LYrix5AtJfhwZLpcvP8PLNhkyWXyO4JaCleyDMuR9m+DCucKUUrv
X-Google-Smtp-Source: AGHT+IF3P4/l4f+Swlmr4ZOd+VRtcUR3F56EYW5FRGDbYrofYG5NpSJT71LRl1xwlRdhpgjRnFFf7A==
X-Received: by 2002:a0c:dc13:0:b0:6b0:7e44:c89 with SMTP id 6a1803df08f44-6b501ec345emr23691296d6.60.1718791855961;
        Wed, 19 Jun 2024 03:10:55 -0700 (PDT)
Received: from aford-System-Version.lan ([2601:447:d002:5be:82:66f1:d3bb:c66f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5c2fbbasm74734976d6.60.2024.06.19.03.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 03:10:55 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8mp: Fix pgc vpu locations
Date: Wed, 19 Jun 2024 05:10:44 -0500
Message-ID: <20240619101045.6317-1-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The various pgv_vpu nodes have a mismatch between the value after
the @ symbol and what is referenced by 'reg' so reorder the nodes
to align.

Fixes: df680992dd62 ("arm64: dts: imx8mp: add vpu pgc nodes")
Suggested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 3576d2b89b43..ee0c864f27e8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -838,6 +838,12 @@ pgc_gpumix: power-domain@7 {
 						assigned-clock-rates = <800000000>, <400000000>;
 					};
 
+					pgc_vpumix: power-domain@8 {
+						#power-domain-cells = <0>;
+						reg = <IMX8MP_POWER_DOMAIN_VPUMIX>;
+						clocks = <&clk IMX8MP_CLK_VPU_ROOT>;
+					};
+
 					pgc_gpu3d: power-domain@9 {
 						#power-domain-cells = <0>;
 						reg = <IMX8MP_POWER_DOMAIN_GPU3D>;
@@ -853,6 +859,28 @@ pgc_mediamix: power-domain@10 {
 							 <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
 					};
 
+					pgc_vpu_g1: power-domain@11 {
+						#power-domain-cells = <0>;
+						power-domains = <&pgc_vpumix>;
+						reg = <IMX8MP_POWER_DOMAIN_VPU_G1>;
+						clocks = <&clk IMX8MP_CLK_VPU_G1_ROOT>;
+					};
+
+					pgc_vpu_g2: power-domain@12 {
+						#power-domain-cells = <0>;
+						power-domains = <&pgc_vpumix>;
+						reg = <IMX8MP_POWER_DOMAIN_VPU_G2>;
+						clocks = <&clk IMX8MP_CLK_VPU_G2_ROOT>;
+
+					};
+
+					pgc_vpu_vc8000e: power-domain@13 {
+						#power-domain-cells = <0>;
+						power-domains = <&pgc_vpumix>;
+						reg = <IMX8MP_POWER_DOMAIN_VPU_VC8000E>;
+						clocks = <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
+					};
+
 					pgc_hdmimix: power-domain@14 {
 						#power-domain-cells = <0>;
 						reg = <IMX8MP_POWER_DOMAIN_HDMIMIX>;
@@ -890,33 +918,6 @@ pgc_ispdwp: power-domain@18 {
 						reg = <IMX8MP_POWER_DOMAIN_MEDIAMIX_ISPDWP>;
 						clocks = <&clk IMX8MP_CLK_MEDIA_ISP_ROOT>;
 					};
-
-					pgc_vpumix: power-domain@19 {
-						#power-domain-cells = <0>;
-						reg = <IMX8MP_POWER_DOMAIN_VPUMIX>;
-						clocks = <&clk IMX8MP_CLK_VPU_ROOT>;
-					};
-
-					pgc_vpu_g1: power-domain@20 {
-						#power-domain-cells = <0>;
-						power-domains = <&pgc_vpumix>;
-						reg = <IMX8MP_POWER_DOMAIN_VPU_G1>;
-						clocks = <&clk IMX8MP_CLK_VPU_G1_ROOT>;
-					};
-
-					pgc_vpu_g2: power-domain@21 {
-						#power-domain-cells = <0>;
-						power-domains = <&pgc_vpumix>;
-						reg = <IMX8MP_POWER_DOMAIN_VPU_G2>;
-						clocks = <&clk IMX8MP_CLK_VPU_G2_ROOT>;
-					};
-
-					pgc_vpu_vc8000e: power-domain@22 {
-						#power-domain-cells = <0>;
-						power-domains = <&pgc_vpumix>;
-						reg = <IMX8MP_POWER_DOMAIN_VPU_VC8000E>;
-						clocks = <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
-					};
 				};
 			};
 		};
-- 
2.43.0

