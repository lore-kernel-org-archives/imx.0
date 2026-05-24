Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15FD2F6577
	for <imx@lists.linux.dev>; Sun, 24 May 2026 17:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779645212; cv=none; b=YuYfRQVtQ/hj+X3w9Hg9H4jHjS8SJRkM5V//K1MQRLiaNA7+IJd0IRvBgx6sXdNZm68rFJVcXT/dSgKR09y99XPIOwrdW4AjIxJnShPjQJlMgBwBKercYVGpNIQvij1d38B5xdARzRY/fuUVqBOIyZ+alC6ViP6bmoad5sTCYIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779645212; c=relaxed/simple;
	bh=RIIkHBh6BPzSisFnhl/7Tmt2+QHkyhNR0tNYKg+Cnq8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T/RdG91X27A7l7vhdkJQ9blm8jyrfrl3n1j5cSgTZwYT3vEFg7FH5/cgdDjlQdgg08j0nI2W7YoelS91yeeN53CoxsV7BCwN3YNZKwXl2rW2bDB/xZIP6sFVhaBhQmj0Jnol+yYFPiUMoinzAm1ECaVkdo98tKh8fNBgjaOYTwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hyxw+B1t; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hyxw+B1t"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a40502e63bso8967419e87.0
        for <imx@lists.linux.dev>; Sun, 24 May 2026 10:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779645209; x=1780250009; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xuzjGJ4dL5LPMOZspbodS1eRRrvJ2J4imKwWVHJPTkk=;
        b=Hyxw+B1t3v25DjlPWX9f2NAQ+en/NvA9xHY0j50jN1LJcb30nrW3ai21huObyrwtAy
         RfQ1wceAwx3XtZYZY9Q9WPj3skUK+dBSVaSD0s0a9Nh6lpI+XksyQwojNUpMTXs7uRKZ
         miwoRy26NprLXw6+1T0Pv2JCGHYSTuzLzRir5wU3viulD1IYyrOl4IT7UEbEiYU7zuzY
         7mKeBXIlkLu31HY6iYeIC1SB/p+Xr+H7k5CG5HvNvgDQzH14ublSZ4vhL+qhDlHx2wzD
         lNO+KClD/Kj6VlVcZN/W7msW6qPfaCvH4ry/kmK/2iqm9CDHJytDvEuhwLpbe/OFUVfT
         D5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779645209; x=1780250009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuzjGJ4dL5LPMOZspbodS1eRRrvJ2J4imKwWVHJPTkk=;
        b=CN+IwlRr/VYM2NCU2ec0REA5dS+TiMLvJHn28syUIcmKrAvImqy+OCjanDYNY6v36Z
         DhP9D7xJPgW5wDrw2PCuPW6MIWtSMubWX3zplpx5x3Sl40Rb5AIvNxxOaejMnMF9e41I
         4hW5cDyy7NVUU9fLcJIlAyMUkw7N+tMCpCdLPsHtLAnV9RzAFXSgN2U9qX0qdImJeUbO
         7y//KAO6l5/lBDcc38LkJ1yybLz8nOZAZ3XaQODOaQ+EYxPIvbb/rv30/AvDkbYXitVC
         a1SZXCRzpjbTKqMpNatADZ0qdDvuErOo8u2FIB5aBTjVcLZmbARR567hLpqcvdPaEbhd
         dZYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+lxozujIRI+dFrX3ZPxmYTUnvLLAqxeih1x3MNDbtC/pwxemgke7uUSgrS2trUMJ0cynQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPTH3fiW4hVjP/DiX+Can2hFz1lOLO9ytHE+FS2VfNXc/Yqd0a
	nuyJ0kE28+T7783sP8Urr7QbLkAeqzKrevPq7/ldCmNmg/8x2J52zKuY
X-Gm-Gg: Acq92OF6TdnQ+QZU5/iAQyQkwY2mdq+3RdqFHobSSG2xARWtV/uloC0Dkt2jHpX0d2Z
	FP/4iVI2L8Ltnl9jXG7p1OXs3LAbeNH62qH2RN84d6cO0oR8z3GGqFawtwkl00Ezbj+uHreY8i5
	uqtbn7Mqu88u0WMhNI6Lj1FIJsaMb23OhY6V3aFEjVUEzsQIFhOpoxoosEEAygKWXyhngFob6Ua
	MkM9WDk2aSS38i3gq3OAhV2Fo803wEC3cP493R1YL4nEVRJSqT6K9H8TeW7OvZEJVzL7jSjDnwJ
	TiajgjIHVgCOBCWNQyqmfKZ8J11VIaP98q8e8H8Z8cFhI31zezXDLLJAlt44i3PSG+c8n4jUj8Y
	irmz6F9PcRvNgAr8q9BGAD6MA9HxhQ6exf2izWkgkEmaLPH02gWHg27zcR1YnmgYEIafvOLuCl8
	w4tMo=
X-Received: by 2002:a05:6512:31c4:b0:5a7:4a60:1454 with SMTP id 2adb3069b0e04-5aa323a93b2mr3709073e87.33.1779645208574;
        Sun, 24 May 2026 10:53:28 -0700 (PDT)
Received: from rafiki.local ([2001:470:6180::e68d])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf96cbsm2063846e87.84.2026.05.24.10.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 10:53:27 -0700 (PDT)
From: Lech Perczak <lech.perczak@gmail.com>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lech Perczak <lechu@hswro.org>,
	Lech Perczak <lech.perczak@gmail.com>
Subject: [PATCH] ARM: dts: imx7d-pico-pi: add OV5645 camera support
Date: Sun, 24 May 2026 19:53:12 +0200
Message-ID: <20260524175312.10952-1-lech.perczak@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add OV5645 camera device node and enable relevant components in the
video capture data path, so output stream can be captured, and the
camera itself can be controlled over I²C bus.

This is roughly based on descriptions found in downstream kernel tree [1],
adapted to match upstream bindings.

The camera can probe successfully and establish an image path through
MIPI-CSI and CSI peripherals, but so far I wasn't able to transfer the
actual image, probably due to pixel format incompatibilities between
the camera and CSI peripheral drivers - yet I'm hoping, that submitting
this will eventually help getting full support.

Link: https://github.com/technexion-android/kernel_imx/blob/ce8fd74abf518dac0a09e8dcb37f3496f6375124/arch/arm/boot/dts/imx7d-pico.dtsi#L874 [1]

Signed-off-by: Lech Perczak <lech.perczak@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts | 60 +++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts b/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts
index 62221131336f..b36936ecfa4b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts
@@ -59,6 +59,33 @@ polytouch: touchscreen@38 {
 		touchscreen-size-x = <800>;
 		touchscreen-size-y = <480>;
 	};
+
+	camera@3c {
+		compatible = "ovti,ov5645";
+		reg = <0x3c>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_camera>;
+
+		clocks = <&clks IMX7D_CLKO1_ROOT_DIV>;
+		assigned-clocks = <&clks IMX7D_CLKO1_ROOT_DIV>;
+		assigned-clock-rates = <24000000>;
+
+		enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio1 5 GPIO_ACTIVE_LOW>;
+
+		vdda-supply = <&reg_2p5v>;
+		vdddo-supply = <&reg_vref_1v8>;
+		vddd-supply = <&reg_vref_1v8>;
+
+		port {
+			ov5645_to_mipi_csi2: endpoint {
+				remote-endpoint = <&mipi_csi2_in>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
 };
 
 &usdhc1 {
@@ -93,5 +120,38 @@ MX7D_PAD_EPDC_DATA04__GPIO2_IO4		0x14
 			MX7D_PAD_EPDC_DATA13__GPIO2_IO13	0x14
 		>;
 	};
+};
+
+&iomuxc_lpsr {
+	pinctrl_camera: cameragrp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO04__GPIO1_IO4	0x15
+			MX7D_PAD_LPSR_GPIO1_IO05__GPIO1_IO5	0x15
+			MX7D_PAD_LPSR_GPIO1_IO02__CCM_CLKO1	0x7d
+		>;
+	};
+};
+
+&csi {
+	status = "okay";
+};
+
+&mipi_csi {
+	status = "okay";
+	clock-frequency = <24000000>;
+
+	ports {
+		port@0 {
+			reg = <0>;
+
+			mipi_csi2_in: endpoint {
+				remote-endpoint = <&ov5645_to_mipi_csi2>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
 
+&video_mux {
+	status = "okay";
 };

base-commit: 79bd2dded182b1d458b18e62684b7f82ffc682e5
-- 
2.47.3

