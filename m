Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A729E3C3458
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 14:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929688; cv=none; b=VS9dynyFXMGxKSpZbZnZz3l4TAf2iraMN30GSIc7IAy4fEgtiv3SiNfTWKpwDAL1GWHWGwlqapLUvLwMOe/X50dN80n5j54jzsBvr/Y1XlPs4/KkQEkGAdk89LQp87mNAnVMtM9r8Gb95FEHAMmxCzagRCQ1XmemEqRf9vC2268=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929688; c=relaxed/simple;
	bh=lilfA9acgCtZCo33KjWuMwgzngzJHNaHTaGdvpueM1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kSZmGybFlDMF52iUj9oBvWSZN/Y62Qm/4xSRUrhKFMpuSNy22R6rE7Un6hD+M8rb5y4WMlruJyqs01mMLsjVCKZejtIt/eEfB8ewh/Y3KwRn/zoDBEASifAgx/HlRBbVre4PJLAN4jm2YkE3tWNq9YodD3RdQy9WKPr4rFTlZII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rpe4v5Wa; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rpe4v5Wa"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45ef82204c6so2322959f8f.3
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 07:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929685; x=1781534485; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUFEbSrxjizvOlFmP7SeRCnWi8SYp3vMPq4IB/dpDJM=;
        b=Rpe4v5WabM/Hqh5DQ47MS9tk+9LSQlptPpgj2GTJLPJN+qrOirsmaCm5vVbedyDUXz
         azfiFXyZyKRq/ZYgQ8sNRLG6XB+mEGNDUG8c9ARgFfp/PvoLseivT7FeVdgsYM8bsICx
         KSPbhfueyVhXqLBEgXCDX3Ckk35lJnCNdtP/6jJaLf03BRop2jn1rkSNzC8lFeTlFg3L
         FEl/gkx8Cf2gPkOOj7JrOT6vprlVgVv3y8buvof6w3Q/rgDnJeXxim/C2Q/TasQQTOOg
         KY5bSw/OoPGeMjo9fIhm1zJG9F7cWoiIvAvBzoeiTHXUgAlsQfGjSMCn9XDPkKD2n2Np
         nMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929685; x=1781534485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TUFEbSrxjizvOlFmP7SeRCnWi8SYp3vMPq4IB/dpDJM=;
        b=h3VaJsMRh+RDnNYbeWcM0YUzY/lEzNqZ5MoqXbSUOP+cEmfrbX5Zg3Snw+rtrcpA0c
         EcPmmzKqme9fv0ArdojG1UjPqnLQTiELea5Nwai0m8pOH0yqO4bm1CKKfCqrvxx2AuoG
         xhH8UOieBKk45D2S6JUFBk+Bznr9oMeFz9tw3CBwTXUDVf8v5TeJWA0nZ5PgEyq+gjf/
         LhLUcI3TBksMPzcMKe8rKtxBfL2sBLBllUgbg7aOkvwMX+S/47zxA60y1/V/vYqYRb+I
         IA+4fkB7QtVL+yuXZsXSvkYXZ9mzvalZllZREe3HDKkMTuQQmNn9QY/phJzxjuR8UxmZ
         b71Q==
X-Forwarded-Encrypted: i=1; AFNElJ+XrWEEgUEQ4nMx2fY5wPcGYem8bICsSiRHpP108qoJYe1LPVJYXTxoSrsyBpt5D8DP5M0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwW4J0tbA4EVdvnnBHnhkYNic50vm4zP28z/+UasC18gmFmI7SX
	E5Z5zXF0FxksUDXDggs4i2eOvweWL7KQvOuFWt1LNI6M5/ZB95zXz527
X-Gm-Gg: Acq92OE90NhCjzZQPXH3C7Ub6ZaqYjqJ9cIkrGRQuDWcyK7ab0BfQWH4iCVHwGBP8c2
	3irOet+A23ucOhDT3zmgtR0YPfgG40Rx4lNNOnwhIC4GyyKcyFdCJ0Cwejx5jHffLNqkLpbQ3Ob
	CPAJG8fBvxEotKVGuGDigpugmL5hGCHVsSTO4/E3uZv1mp3lx7DNx9bif4UmjYqwGMzq+4oSgxu
	X4E9Qz2CUuly5g3MLl7E1nLE6ig7g4x50pqexLkSIQ3bYDv62/EZMjhNARsW5lbL//OPJ4ulePZ
	arjsHcASuRpjzo7bJEEytDE2hvYCF6MIreBiiWqun7kIKD8RjLaAkDJIs+qXydkMrYJm8UFs3ea
	HwZXGAqX0BJG7MR5L7JJiJBU6dFpvtCtEMbQtOzhG9oWUWSFVzbEBBTUTrWNaVT39fIeaCZL9cC
	w2esjXe66OIf0+J8Vqat1b15U5oFmuq+VxmLLzixYSI/PwTU0blkuLt+dWyegl178jJRxl/hTz3
	WUnSRANDwHc1fSKaa8N4Z5GNNyoUCK1Mqp9bIW1yEkwmVDg
X-Received: by 2002:a05:6000:189:b0:45e:df46:ba30 with SMTP id ffacd0b85a97d-46030630642mr18072389f8f.34.1780929684703;
        Mon, 08 Jun 2026 07:41:24 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:24 -0700 (PDT)
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
Subject: [PATCH v5 01/14] arm64: dts: imx8mp-var-som-symphony: add input keys
Date: Mon,  8 Jun 2026 16:41:02 +0200
Message-ID: <2a02e17dd1cf516332e2f86e733620d58b9a73b9.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Back, Home and Menu keys connected through the GPIO expander on
the Symphony carrier board.

Also enable the SNVS power key.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 291f65e36865..25f707012f62 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -13,6 +13,31 @@ chosen {
 		stdout-path = &uart2;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-back {
+			label = "Back";
+			linux,code = <KEY_BACK>;
+			gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-home {
+			label = "Home";
+			linux,code = <KEY_HOME>;
+			gpios = <&pca9534 2 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-menu {
+			label = "Menu";
+			linux,code = <KEY_MENU>;
+			gpios = <&pca9534 3 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
 	gpio-leds {
 		compatible = "gpio-leds";
 
@@ -72,6 +97,10 @@ usb3-sata-sel-hog {
 	};
 };
 
+&snvs_pwrkey {
+	status = "okay";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.47.3

