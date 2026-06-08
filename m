Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB673CFF62
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 10:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913397; cv=none; b=YsswY8kNM71IM/ZHxYjAgtKDw0o+38fwtGoJvviVyCaYLRCs6AA8WQDqAc2oQsOlrwOrpHsmsm/d9AORdSO5UyNg5NtTmdCit+7Zse5AQ8CwJAFBgyHhvOH4D9lQejVioK8Fy0bAcYIrS1bBYOTn0dSV6InrDhNsJPdFz7b1VKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913397; c=relaxed/simple;
	bh=uiq53YdN9mD5KH9bgzWCxtVQkc7NMgMKrqahaNEO2OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZVziHxq081mH+d2yaqTkbG95C4J0xQ3XyydUZWmORdLScp8gTx+icoCBDyigXc4VI2LiUSsUTS/d41irHSsSPE14Lzlymw7Q14K+q0fCsJg75HPI+HG6JgeDTm1+mrcgDsJS8304WXDM1Z9O7INU+4zkKiekzvtGkt7clJ7tns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nduzQeTa; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nduzQeTa"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so9915595e9.1
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 03:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913393; x=1781518193; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOMpLGsu1GWWWZlLzdQ6mKdRcaKS3cPpX8tZ/ShuVaY=;
        b=nduzQeTaov8YaLAlaD/9m9E8Ye7WgLn4fMCogsy+DxpIy0U7DiD2dGx0Qs3CZo5fkY
         9/WHigrXg3gq+PvfTxEt6oYzaaP7MyOJWN6gTXEdGwqMQVNO7NHv5w/YPhCkNvfCXWF/
         OMxZ5mkIoY/pmdbbF9EHVPGK31eNzOQWd/TWdLL0CwCbbCOLyituUOg3DxB0mFhZsHNb
         VJz1aPOvdQP5NC2pzZIYKb1Lg1aICXitfNjc2x4VnOkikzKzbxWz0NrWuERL7PIHCCUd
         KN/kcTTrjafuueZbgdrWUZNFh21JESpv+9V08QLIUQQO2Bf9TINiNYqf8bpf67orwvOu
         zrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913393; x=1781518193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LOMpLGsu1GWWWZlLzdQ6mKdRcaKS3cPpX8tZ/ShuVaY=;
        b=BkAVIlBtBwlKoMlyQrZmTYrRMol3KtpqL9qxal9Cnx9gmndLWEqnqLpeDoH1geJF0y
         KXJgtVzBRm977QDuYeIwL+sXs1nwOE4feOKnkTtylei4r2fvzTXunSDelG/x3eoSUvX3
         F9MX4iiTAwkFoQKPH7F/SwpJXs4ynxYu+oY9ENVcIpFJx0CGw0xbtkiixfXo0PuoH3I5
         oh94ztMI/Loq0OvJbVEXN74Z4rz70bwu3nkwGKifLkHNksKGOcAnFVWpngNX/TFac7YL
         jOaN0pbrXZ5wrAQ4SGSugiqFFm4fjX59RBbkYHGku/7Deiqg/YFJds7z67vpHD0ISYOr
         U5UQ==
X-Forwarded-Encrypted: i=1; AFNElJ/4YzW07Lg2FpJzikERMxV6C53Vk7qNWlqlaWzDxcTDBd/QfEbELByEqAvW0C7a5vcaFZo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ4jXCIu47frEGord/e4hz3d7/BIPkucQxCFWawHJnUpIRNql5
	0TrXf64ZItHHOm98+sjaiJUNTsijcRrYqaPbhepiUnXtvwOsNDkM+ayo
X-Gm-Gg: Acq92OEPlmH1X4K7v53tSggGHNFVvBxMJBLxDHpzQPhzmoTYRRtA4N8pJIQ+L62B7T4
	T7gTBi+JWNOjoIUR4kwKjmO00DaphoeiNPV3oxwg86si+hsrlcLOqJIW8giDOxd+jabUOmN6SAf
	kyoVolyGNJU/KBTn8jzPC9/wiO9GLGT5XFZO6CtgZ66Og1k1O0OvzeHRooPrvBd76Y5B2TEisGu
	uVxGxIbjagEBWEwNzyQJjxwDW3zAcySIwL71LRSCojswC4Tp43ihAfo6mhcye9b0YsQcwS4d4Z9
	nuEm4+aHyMnJ2uZ/FmxuW7NIpM55r0dyvfJTZuk8whGRT/w9eWZVHrflFfsOtv9ENLlroCIDRIB
	+iyrGg1TDfYOAyN8De2gqqV9bFJT9Eb5tQza08olGpkEct/bTWTUwDjwToNJaaCsWOUCjEmlroi
	kgFix93rWgqZHFc9wJeVJlalfgwXhJxL1nhC2BJytuFCoHLtHxSgnXeDeVCqYKDkgvRkJ2EXMEW
	k2YMPBV7SEHUDCz/MbxKd1RDGQVUEGmBGahVuQLkkJMrH0M
X-Received: by 2002:a05:600c:34c9:b0:490:688b:f10d with SMTP id 5b1f17b1804b1-490c25b3549mr258294425e9.7.1780913393254;
        Mon, 08 Jun 2026 03:09:53 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:52 -0700 (PDT)
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
Subject: [PATCH v4 14/14] arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs
Date: Mon,  8 Jun 2026 12:09:32 +0200
Message-ID: <cc46f3773655b49d5e2875b00557a8f81196732b.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the GPIO pinctrl state and GPIO descriptors required for I2C1 bus
recovery on the VAR-SOM-MX8M-PLUS.

This allows the I2C controller to recover the bus if SDA or SCL are held
low by a device.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

 arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 49467b48d0b0..61786eee0e82 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -180,8 +180,11 @@ led@1 {
 
 &i2c1 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1_gpio>;
+	scl-gpios = <&gpio2 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pmic@25 {
@@ -415,6 +418,13 @@ MX8MP_IOMUXC_SD1_DATA5__I2C1_SDA				0x400001c2
 		>;
 	};
 
+	pinctrl_i2c1_gpio: i2c1gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06				0x1c2
+			MX8MP_IOMUXC_SD1_DATA5__GPIO2_IO07				0x1c2
+		>;
+	};
+
 	pinctrl_pmic: pmicgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
-- 
2.47.3

