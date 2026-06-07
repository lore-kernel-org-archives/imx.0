Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009112459E5
	for <imx@lists.linux.dev>; Sun,  7 Jun 2026 13:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780837947; cv=none; b=Amy0Ljnf80bQM33R9bwe80if91lU3YASBEnz3RDX0h/OnwF3UlRrlnNatEGD0sYFfn9ufzWhD4l8sVa+nLeIlCYAETa4NRJYfakpfQmhvpwMdKmeIdEq/ZV0NbsGLnURdwzNRVzCYXjd6xGNhqAlvTOsySnoEPfFQpy/xkSa/Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780837947; c=relaxed/simple;
	bh=7olzZHHpB71MrERaSvQjT5XeeR/NDdooMLayR7fPucY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LgPhj5kMoEaAsbD1RXKZOwdL3YuEioBkgV+RJw/bXBa79C163wg7gBQudX9H2sX+JEa72M6WoYcKHRUvikc0LpGlNLT7lUG71GaZ3xvzlT7Br8BlnpDQ8BykrhfxtSwcEs8qBiIyOe1C+M+9jKARDWlwTC0IqlK9p1nIGgc15Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGntQI8j; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGntQI8j"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-befee9e5ef7so379735966b.0
        for <imx@lists.linux.dev>; Sun, 07 Jun 2026 06:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780837944; x=1781442744; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=upYkD5TmeVM6Zj2sXRhLZMQLdRWjjRoIFrUgE/4H0kg=;
        b=dGntQI8jtmXFFsnNSEXFP8ayafivotozyj8cHwy4JHR68j3z9gjL3/Vzb64QysP9Rr
         diyx7YXats0ENlV9G0U7slkImc0kaqyY9zZcIdIwu3NtkqFleQrjXGLPALTVgqdtSyrj
         c9ibS3Gw0C+omhCJPLl1n+q4n7nwckMbpQbg7JGQ3Khjfnwd1958CjtPezbxt8lsHfjg
         NabhV828UA6JdJ9f4d3tlp89ieBQcdWCEmYSWQzmqDHp8iPNgr6YkRejDfsZHbb5YUsD
         1XYYukZNRoKhQZMsiXfxpctxs6P8IhgaYEcU7CFmx1tyER+9UPmWpbpIcOzilz647A4I
         7Kxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780837944; x=1781442744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upYkD5TmeVM6Zj2sXRhLZMQLdRWjjRoIFrUgE/4H0kg=;
        b=JP6BI/NTjb4i0Qa7vdk0A9TzCihS8zD6Qh9oBCiYYWqajX4Vh05PFBoR+Fhvbbp7oo
         tYBv7pVyHm8TKpVkFH5V4NV9M5Fvo9LGTVnblnfPF9EQIyyOvg/CRVZqxPvVw1zK+YE5
         oR54mgWrFKM6B4eaTb2u1hbCG0GbJYaD5akavQEabzcsY2agqYpQwQFbHkhXWdRO5OBq
         NqrIqjSEdo7R+Fi5ijF2j9zf8pzoMlmnAGV1LlDOEJ4DeYmnSasJDtPiNkbsRlKA8qy5
         nxmwsD3s1SZ2L6EFwpsdRv3bqU8qXIJKIu2y5rJMaM/myFzzH5+sncCKzcXGrIzdu4II
         aXtQ==
X-Forwarded-Encrypted: i=1; AFNElJ+jlGydDB7N/sIDHdbj9VThkNhZmAOs8uOlgry9wySKgKnf7oQRXsu2pwmf6/CwpWNl6qc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRNtEuT7H19HuRjt8Yi6JWMTnSi044TiZgbPj7LbQC8uQsW6Tv
	a1dCUlq2Xx6Il//Zhf+C4JBKKkHsO/l6H67IIXgZ2yv6Gr9O10cf+3O1
X-Gm-Gg: Acq92OHBdxcjhQiDEDL+fLe4q+WoCOBmulDENozI3rVUeGfv933K6VOeqjVsXsDXKVQ
	nApzSyOoFP8B3d8WRRcJVI7S3rVao1/cidi+JUqkv6K3TVmU4XqvlLZTQCeP4LIKaA6Kr9vzq0A
	9/12MCPvR24vu0u0LpDj+9lOOGJOKYm0lIkpgco3oWm1I9vfpleQstvHeC+mh38cvyKzLAmfkRc
	8R8KPelGoCkDKblqs0EU0uPAkFBF2BThOES9UI2LHen1sCW8iqgPUvQzZvm81+7gmNRNU/VrWER
	WGdrhAItUtOh6/9BKip6GT2D+wgEhBS4j+5hpwkfU3UQSe3boY5pXglN5KWkYN4okeOXBKsO4/T
	PD/7Xgs69zz2EW7bRf2nXWvtq7xWSN4gynDW+Sl1g/2Uk4Yz+IC3roFHDN332n92SeIbUQj8eMt
	zS4b2cmTSxlDa66Bh1Mz1O35eYx2HJaxtxWr/l9KLrQIMKP1U=
X-Received: by 2002:a17:907:2718:b0:bea:f4e0:c7b9 with SMTP id a640c23a62f3a-bf370d638ccmr395176866b.19.1780837944394;
        Sun, 07 Jun 2026 06:12:24 -0700 (PDT)
Received: from gigabyte-b550m.local ([80.68.228.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05176e1b5sm719839566b.8.2026.06.07.06.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 06:12:23 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: imx7d-pico: describe Bluetooth controller
Date: Sun,  7 Jun 2026 15:12:17 +0200
Message-ID: <20260607131217.6497-1-lech.perczak@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ampak AP6335i Wi-Fi module atop i.MX7D Pico SoM also supports Bluetooth 4.1
via UART attached to "serial6" port. Describe it, so the controller can
probe automatically on boot.

This is based on "Pico i.MMX Development Kit for Android Things Hardware
Manual" rev. B1 [1], Table 6 on page 12.

Link: https://www.nxp.com/docs/en/user-guide/PICO-IMX7UL-USG.pdf [1]

Signed-off-by: Lech Perczak <lech.perczak@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/imx7d-pico.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-pico.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-pico.dtsi
index a1574ccec89c..6d4e8087192c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-pico.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-pico.dtsi
@@ -339,6 +339,20 @@ &uart7 { /* Bluetooth */
 	assigned-clock-parents = <&clks IMX7D_PLL_SYS_MAIN_240M_CLK>;
 	uart-has-rtscts;
 	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4329-bt";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_bluetooth>;
+
+		max-speed = <3000000>;
+
+		reset-gpios = <&gpio4 18 GPIO_ACTIVE_LOW>;
+		device-wakeup-gpios = <&gpio4 17 GPIO_ACTIVE_HIGH>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-names = "host-wakeup";
+	};
 };
 
 &usbotg1 {
@@ -401,6 +415,15 @@ &wdog1 {
 };
 
 &iomuxc {
+	pinctrl_bluetooth: bluetoothgrp {
+		fsl,pins = <
+			MX7D_PAD_ECSPI1_MOSI__GPIO4_IO17	0x14
+			MX7D_PAD_ECSPI1_MISO__GPIO4_IO18	0x14
+			MX7D_PAD_SD2_RESET_B__GPIO5_IO11	0x14
+		>;
+
+	};
+
 	pinctrl_ecspi3: ecspi3grp {
 		fsl,pins = <
 			MX7D_PAD_I2C1_SCL__ECSPI3_MISO		0x2

base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
-- 
2.47.3

