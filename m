Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857A1165EFC
	for <imx@lists.linux.dev>; Tue, 13 May 2025 14:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146218; cv=none; b=VUhp2fQ02X3i4IBghMptb5QY2ewaGuteqO+mrI1wZe9Lmi5o93nH3YPLQTiZza46sYPi3P9iNA35vCOtpjMw+aG9eMaxZIvnV+l5t2mmDLLVOH2rgFUk+JYWZHpUaz9qL3PayW9ezEjI7YHvD9+ernsgbdHMBNR8OHrZsYV5OJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146218; c=relaxed/simple;
	bh=niVeO1JI48jUXIhYsjOcP+FrTTwOsvAnEGcnPCsRgqE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=roLteJFfweLi8TcWgjeIEc3CPpGg1QVG9xvHmmhxCp5dblnIFk7SfatnLu6uS9tjHP1mnTG6OLAdwC5OdbLy5wgKL6vahjvHYBLAwOrO+uSv5ZOuvMnykIVrP6pTSISFza2xwYyJFCy1Emx5iRTla4qs4lLgH39fBSvknmuw8c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UrqsQ/PE; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UrqsQ/PE"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-878440ee153so1544177241.1
        for <imx@lists.linux.dev>; Tue, 13 May 2025 07:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747146215; x=1747751015; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GezTh7CEZSGNy/hj5QCxQQLoFC/kezBwPCYdh6zNgK8=;
        b=UrqsQ/PEIPYMDlfgZ5pvZYJ0juBjYpiU3PQDGpC2itDy53fKWCgsQG9aqrh/zahkK1
         UqYNcQWAexsmciRpVB4GvrpKzo4CmdxBq+4gSEweeZof5GWrwwJBCOzYLnu0AW+IPAdx
         ymOh3Upt30UvNuR4ByKU1C+wFyCawovfhJIW9aXu/5SaULHYdjexNlHC5jkepBtwck2m
         JB3QHaxy3gT9IpGYqtgDc84ntEUPMwmveF4pz5+7rx0r4Cw3zKG/4ACpuxEJihejY/Ja
         ESrhAKcCFtwA4kyhONl7hPJ//VSpLDlgALtdYti85slEGLEQGiA0Qdq6kJ5vDBpXGlqq
         BcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146215; x=1747751015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GezTh7CEZSGNy/hj5QCxQQLoFC/kezBwPCYdh6zNgK8=;
        b=blwFktpUFqomKKzElSaBoUivCbd68zH+9wN6k4vaFwpOelSXMdVqT63fj0MCziM7V7
         W50IRgHPnr9pDq+Vf33+ywpq4+qQqiRfihvwYy2t7lxcmEgoPr90NZ4Ru5rC24H+z/a/
         /ALnMmgrNB2ozeVnPnhuaE3bsF9KCBvuw/CQXEs7nkHZR/8FQrEa3Q7tSiWJ5M6Swnwa
         EVybJojrOxRsbPXbXor/YxgmCzx2CMKTRIe9WCfs+Z6CQHZY/Ls8CYHzMFvo/ROyfyfk
         I9Ej7ncUTFRqSSHDrF5Bk0VDKVSV/j4GgyolMkrnZn5UdVYpboEX8+Omc2YlB/O+wSti
         ubWA==
X-Forwarded-Encrypted: i=1; AJvYcCWC8puvmm0j5DQ7fhSa2nSP+OpZHyTShZVojFSXkHq7RORVRznqzXAIaz1KibrBY6vZUkw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2DpksFlovGHtdf2MBvkpa1aWO6VwllKYMhyLWNFvEw5JGaXSj
	4RnqxDGQ5uxPyYOX9ODEkZVUCgFsonErUx7aACGY8qzxmb8NEOM7
X-Gm-Gg: ASbGncsYcUZ89MPBqzynFVmkntjZG//ztyNqrErzOqY8NtIDVhlSNJ5YEeeeVK0sLQ7
	Z1F9aYQKH9L0/xpq3LRSsntPcsNxgfggZemPOMx4XfkTWiqKufspMZUlv4/+rvsynCRcXKcnz0H
	o1221ARdqIaHuFvdcVIJ6bJ3i3wesH6LJzcLJE/QUz9+YWjIDRGAJG30N9E9pL9wU/ODNrM/RdK
	zC/dmXeJUFo+kOaj5lngFr6w3Iy2OvSPZ1ANo1/mdwas99kNZv+6s7+DX0zetNdh287vZapFk+R
	1dAXmK0AI7HOAgFxjqk34tZKPn6jjwHAYL6bB2QZ/yChqLnzs/8Pg2rOnLz1WnnAYw==
X-Google-Smtp-Source: AGHT+IHGcQgMwPPAEGBJfJrJEY9x7HjJUxv3RHs7/BaUYX3k0+VoevK10R8gdqCI56LzymOxCbK2Hg==
X-Received: by 2002:a05:6102:1586:b0:4c1:924e:1a1d with SMTP id ada2fe7eead31-4deed3cba69mr12923184137.18.1747146215203;
        Tue, 13 May 2025 07:23:35 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:5c18:acd6:b894:dc8f])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4deb203c26bsm6630965137.27.2025.05.13.07.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:23:34 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/3] ARM: dts: imx7s-warp: Improve the Bluetooth description
Date: Tue, 13 May 2025 11:23:18 -0300
Message-Id: <20250513142320.4036324-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GPIO5_17 is connected to the BCM43455 BT_REG_ON pin.

Improve the Bluetooth devicetree description by using a more accurate
description of the hardware as per brcm,bluetooth.yaml.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/imx7s-warp.dts | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts b/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
index af4acc311572..b66e612d3329 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
@@ -43,18 +43,6 @@ reg_brcm: regulator-brcm {
 		startup-delay-us = <200000>;
 	};
 
-	reg_bt: regulator-bt {
-		compatible = "regulator-fixed";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_bt_reg>;
-		enable-active-high;
-		gpio = <&gpio5 17 GPIO_ACTIVE_HIGH>;
-		regulator-name = "bt_reg";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
-	};
-
 	reg_peri_3p15v: regulator-peri-3p15v {
 		compatible = "regulator-fixed";
 		regulator-name = "peri_3p15v_reg";
@@ -288,6 +276,14 @@ &uart3  {
 	assigned-clock-parents = <&clks IMX7D_PLL_SYS_MAIN_240M_CLK>;
 	uart-has-rtscts;
 	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4345c5";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_bt_reg>;
+		shutdown-gpios = <&gpio5 17 GPIO_ACTIVE_HIGH>;
+		max-speed = <3000000>;
+	};
 };
 
 &uart6 {
-- 
2.34.1

