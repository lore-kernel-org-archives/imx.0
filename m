Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B162F1917C2
	for <imx@lists.linux.dev>; Tue, 13 May 2025 14:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146221; cv=none; b=JpFczj8EUpD223FYUrkv9gAZw/e47ydIu+4lIX44kP2t0L3fN81rFAx/6lnqJoD7aG9CAD1nq9r/aEMsLsLD2DO5aT8pbIuUFgoreI3jVFiejLrV+nsn9s12hdoqyJ7a39BU+Z6YnOUpCLqgRGO5MxJEcqVarKlNxMJ6K/MYZkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146221; c=relaxed/simple;
	bh=/MkHJSCvoUk6wpioAROWSyWxvDXntLxjx4aAWY01jNg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UR4iszvcRbaWqhL0mrs/CytrdNudyWoEyLMJF/OqdHsCVYi66HOVY+kvEMLyXNrKGPglSCVPvxE4bLfuVpt3/he/DXVUDNkwVfYI4da6B0QhurgB1fuD6tBeqrkJXIei8OiAUhEyBd+teHx2TcRBiM0OUCMEdAxUVW1qr4iQINM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+wkNDlt; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+wkNDlt"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86feb84877aso1642254241.3
        for <imx@lists.linux.dev>; Tue, 13 May 2025 07:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747146218; x=1747751018; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Uzgz/IJ5yrsCl91qH+8t4wQoX41kDj9fnW0ZCwuEXw=;
        b=e+wkNDltFQdM5wJPByq8GmqD5h5O4O/Z/NFyE/eL5IPBAkDtnIyVUXI++IkwWLBN2Q
         mfRUMXbI+7NxlSjdLWwokX9HNDHgzU5PaSMtR1sBjBO6PIwLBfhCy9orcej7PUk1DzqZ
         1CJiP9GOHxfJSrE4OVJRWWDGOYH3qDHXpib5PNaF9lDIlbKC5Hmt6BmNO09mKnhZniw2
         NVuiz3MGq5ilyv8tBGQ6XTAqRJXvWnkmieZOLAttf9qbHHwHjaHyHET9ZUSbof5QayqU
         Vvc3NNYPGD5Pk/F3k0Fte/S0HmZkd0LKRo/1E7QFL1jYFi8r94yvkheHwl2G/Xnv/2Z8
         5GMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146218; x=1747751018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Uzgz/IJ5yrsCl91qH+8t4wQoX41kDj9fnW0ZCwuEXw=;
        b=qt57SWS7sEoQ7uQdy8yfHQy9lF958EtDzzK7dwYWpNOHYMVNuyx3Ub+gi8+GnZC5gZ
         I1ZQ/ihe58MCW4NY0ImYuDPU0WAVoXeJC2VUMuV10ojD7cMJVoRhm0mJQGvdaD23WdlS
         UVd4kZtRHNQpHXAI0K6ULV0PVWw+MYRfUdwZooAXxQYPdFcwflKOxrBGZnMyIICLrajC
         kJ7Ti5627NQDaeXUN3gsrPhFVk/IAnUahcRcLV2BXDbr/JS/Y/KTvVexW71Xfd3tAhUq
         XXn2hn1O8WKunxvH1q8r7E6RKtFAoV8SkUD7rhfH2SCB64fU9cS4XX7yZ07aHe+LwliZ
         GbAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVS5wQT1DxENx0ii6JqEdzM0rznoMebtdqEKZgFT0wNzL0MY4/r0QhNXuJ6TJN0urCrxPA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNcrOUYev9w/DBS+Wnuw+YgJsFC4JZCnf2VZVkYjP/Rvd1edJv
	SiRBp0yvESHCgCsmKiGwFaLnGti5BWOo4+z5924PigUBt5+DJTcT
X-Gm-Gg: ASbGnctkFgWslQkqOsQM0WJ8/UsA1m/iHb99oI6flQEmXAWTjYevZCROL6KxAt6xivL
	nrr9fcCiYY6t9Fu+wBIAmTA26H1oLa0N3xphq3rgDk8xrpG7H2WxxjF4LPN1q5gTVfGyjWpSRwI
	VtajN8SbZHnweE69aj/v3+Js5QRcQtMXGXINH0KJ/cjSjWlyrqaiwiCb5uVu3Dj0DJaWOEKostK
	p/xP81xzsgt0V6FNwLnrC5n2wonHFaB3BK/97NLoWqguT+6KDT6RW36fR4i1uTMGshjNYk7m0rx
	wIGXETagh5teueTuEidK2JghvR6XrEWFt8un+Su+zJmjgjBJHZltC8CV8Dby3gpCAQ==
X-Google-Smtp-Source: AGHT+IEFobOfhF6Q0zjJGc5PoNdvF02XzIXIzVwsYXq3HCC3Jx979kft8C4WQQVQTvNxXMdPfdO5pg==
X-Received: by 2002:a05:6102:fa8:b0:4c3:64bd:93ba with SMTP id ada2fe7eead31-4deed376091mr15377049137.11.1747146218479;
        Tue, 13 May 2025 07:23:38 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:5c18:acd6:b894:dc8f])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4deb203c26bsm6630965137.27.2025.05.13.07.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:23:38 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/3] ARM: dts: imx7s-warp: Improve the Wifi description
Date: Tue, 13 May 2025 11:23:19 -0300
Message-Id: <20250513142320.4036324-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513142320.4036324-1-festevam@gmail.com>
References: <20250513142320.4036324-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GPIO5_10 is connected to the BCM43455 WL_REG_ON pin and it is better
descrbed via mmc-pwrseq-simple.yaml.

Also improve the Wifi devicetree description by passing a compatible
string that describes the BCM43455 presence as per brcm,bcm4329-fmac.yaml.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/imx7s-warp.dts | 29 +++++++++++++-----------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts b/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
index b66e612d3329..f2cd95e992e7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
@@ -31,18 +31,6 @@ back {
 		};
 	};
 
-	reg_brcm: regulator-brcm {
-		compatible = "regulator-fixed";
-		enable-active-high;
-		gpio = <&gpio5 10 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_brcm_reg>;
-		regulator-name = "brcm_reg";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		startup-delay-us = <200000>;
-	};
-
 	reg_peri_3p15v: regulator-peri-3p15v {
 		compatible = "regulator-fixed";
 		regulator-name = "peri_3p15v_reg";
@@ -51,6 +39,14 @@ reg_peri_3p15v: regulator-peri-3p15v {
 		regulator-always-on;
 	};
 
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_brcm_reg>;
+		post-power-on-delay-ms = <200>;
+		reset-gpios = <&gpio5 10 GPIO_ACTIVE_LOW>;
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "imx7-sgtl5000";
@@ -301,14 +297,21 @@ &usbotg1 {
 };
 
 &usdhc1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_usdhc1>;
 	bus-width = <4>;
 	keep-power-in-suspend;
 	no-1-8-v;
 	non-removable;
-	vmmc-supply = <&reg_brcm>;
+	mmc-pwrseq = <&sdio_pwrseq>;
 	status = "okay";
+
+	wifi@0 {
+		compatible = "brcm,bcm43455-fmac", "brcm,bcm4329-fmac";
+		reg = <0>;
+	};
 };
 
 &usdhc3 {
-- 
2.34.1

