Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97BB28C2D0
	for <imx@lists.linux.dev>; Wed,  7 May 2025 14:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746627325; cv=none; b=jv6JAila++mw7xSO8VreFlpauHJ9un69kGjakfCynkFGd9TjZ/7uX31eritZzIYxJRUNFrr+w8PnRtLPNJSLo+WFhiOBU75ChIU2C5qdNqkrvOG08qIGt8/LiAndSVAoKSiUNzahvfrKCQfOcFa2WvxZLzlyFmN23OBsuS1etPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746627325; c=relaxed/simple;
	bh=RKMneX1wQOhwOyRqZHFY/RTQfW6urNlhtUZHaTk0CvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PzNmKVt3zonDubRLA/9gwWKEILuvOCbxxllmCtZUFC9jNkJFY1zLx4jBW5ZjGtqu9COYBLpajqUxSXu0aAMISLhigVGo7qvW2PF9ieNhknD2ntyOC1ptG6nbvXCpYh9R1aWO1zznBb5T9kNdAz5uUYvQsvFP5axUo8WakAtDKg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=rHIrLePl; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="rHIrLePl"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54d6f93316dso5965070e87.2
        for <imx@lists.linux.dev>; Wed, 07 May 2025 07:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1746627321; x=1747232121; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8kbahxvpfkE5SUIJ9O+RAhHkMsjfPizkD68mJarweeM=;
        b=rHIrLePlpm0qpM+7G0qRimtFdgYUBjW0NXqR6iLICo3hGNU9tEaMCu/eIyhwqfjDa3
         rwQUsRB4lE/2PJfWko1804U1cNBnCbBZgwu+m0h7E6ezeutNGzIoILvoTlO24eJPbxdH
         drhrFGQ1v4i95juBklCG2pLDJppmtqrC+fKEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746627321; x=1747232121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8kbahxvpfkE5SUIJ9O+RAhHkMsjfPizkD68mJarweeM=;
        b=P/lmz0a79rysIov3nhM3fsZ/DRzl1Xo5QA3rbU5Z3LYWYycPeqHAXKpngLwlmXBiAx
         nWK2Z/dOBECca3F2zZCFoPWFailjSnVXCTDc6mUp9buIb694lUS3G9JVb19ErACHiBIN
         DO0tWPRgLc1QSO8u+giOtW/5DRo41veJfW3EZfPy3QTybVCsaxEi40mSjhbOfkvby9CV
         TCbRl7wFjhps6haNga2tztFwW6KWCkvM5h8niFFIuiReS04YP44hbQ6IUEnpL4fm0XUH
         K6bB3GJoXKehaZKSIeCWoyOd/B7wqE31OJ/hI1j2th/EieFxMeEpvrz1lxmBsUJzHQZ6
         BMhw==
X-Forwarded-Encrypted: i=1; AJvYcCXx67AHGbmraCd1ejce2694z8bGn3dVbDveQ3zVFnAIRmgXVYWXOdodq3triKweSCLgavM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzfHMIR/6t+BvhY4VONPkWqVLK0x4ZYHmWF6V8dEWsr/ynZJv6o
	M97qTIiWgeDmaKDfmqtfv0cZVTYcHNkHEYoyNohU8cj8Z2uFK6fM3k4zJrIPy7qYkuf6t/rH65L
	W
X-Gm-Gg: ASbGnctGlTeL9lFx6g+vHyZLfg+GbFRAADkzQM1cOz5/RPMLRMw7Hgol5YxPN2tq41k
	CJI3tCKw7SPYlvLhI1ZGsgDZggzPMf8dNMBh80y1YAEJ2P+iA4IuWOz2cYhO5y4scISsrxAn5yU
	xkdAhtHhvFMCKQDoBs0/WTHTvASXSCV0Xag+HER+YcP/cuC9n2Iu4XhcmuvHlA1AELb4IKTNHRx
	ylU1PHS1GHjtP7L8WIF5e5ayzN+Z+AOZC+OvyJCBZ3C6BCW0RnDPKTzHyg1HOzZmoMMNrF+zv1F
	rG/OFiZ3gZLRQ1nWCIE+IhKnotQj/M3k3nXx4IyTcpd/ncgXHzdbWzzTEvkejzvSgL3mweH1ZsQ
	RyovL+m5yoRBIR8JY8UF4N+9LqfkaOA==
X-Google-Smtp-Source: AGHT+IHdlj7CpNVBpX0ik+NG/wdlK6dMWu7TW5P7ZwM+3Yc0y5PuGMTHr+/cHr3uiayAfwmPefwgnQ==
X-Received: by 2002:a17:907:2d23:b0:ac7:4d45:f13e with SMTP id a640c23a62f3a-ad1e8bc3151mr378991766b.13.1746627310389;
        Wed, 07 May 2025 07:15:10 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c02f3sm927944966b.92.2025.05.07.07.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:15:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: mxs: use padconfig macros
Date: Wed,  7 May 2025 16:14:58 +0200
Message-ID: <20250507141504.1332054-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert mx2{3,8} dts files to use the padconfig macros defined in
mxs-pinfunc.h.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/nxp/mxs/imx23-sansa.dts    |  6 +++---
 arch/arm/boot/dts/nxp/mxs/imx23-xfi3.dts     | 12 ++++++------
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts |  6 +++---
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx23-sansa.dts b/arch/arm/boot/dts/nxp/mxs/imx23-sansa.dts
index cb661bf2d157..613f13b6c8a8 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx23-sansa.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx23-sansa.dts
@@ -93,9 +93,9 @@ MX23_PAD_LCD_DOTCK__GPIO_1_22
 						MX23_PAD_LCD_HSYNC__GPIO_1_24
 						MX23_PAD_PWM3__GPIO_1_29
 					>;
-					fsl,drive-strength = <0>;
-					fsl,voltage = <1>;
-					fsl,pull-up = <0>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
 				};
 			};
 		};
diff --git a/arch/arm/boot/dts/nxp/mxs/imx23-xfi3.dts b/arch/arm/boot/dts/nxp/mxs/imx23-xfi3.dts
index 0b088c8ab6b6..fad08f6c008f 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx23-xfi3.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx23-xfi3.dts
@@ -83,9 +83,9 @@ hog_pins_a: hog@0 {
 					fsl,pinmux-ids = <
 						MX23_PAD_GPMI_D07__GPIO_0_7
 					>;
-					fsl,drive-strength = <0>;
-					fsl,voltage = <1>;
-					fsl,pull-up = <0>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
 				};
 
 				key_pins_a: keys@0 {
@@ -94,9 +94,9 @@ key_pins_a: keys@0 {
 						MX23_PAD_ROTARYA__GPIO_2_7
 						MX23_PAD_ROTARYB__GPIO_2_8
 					>;
-					fsl,drive-strength = <0>;
-					fsl,voltage = <1>;
-					fsl,pull-up = <1>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_ENABLE>;
 				};
 			};
 		};
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts
index d004b1cbb4ae..f170df37b3f8 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts
@@ -102,9 +102,9 @@ mmc_pwr_cfa10036: mmc_pwr_cfa10036@0 {
 			0x31c3 /*
 			MX28_PAD_PWM3__GPIO_3_28 */
 		>;
-		fsl,drive-strength = <0>;
-		fsl,voltage = <1>;
-		fsl,pull-up = <0>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
 	};
 };
 
-- 
2.43.0

base-commit: 0d8d44db295ccad20052d6301ef49ff01fb8ae2d
branch: modify-mx28-pad
