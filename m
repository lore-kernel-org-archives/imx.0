Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34835477E31
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 14:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497455; cv=none; b=AerRpaaSSHX5r0ImOFEyPCpXDnK5NnmyuP3OT3dUfXo9TNnfrtEASRmgQepag6STj0dvuaZPsv2uAynnGY4+hxXFz9LrIM1pTFLEieYST80JJAppKPEPluQnQ9wyHOpq01Z1+YLCizaA2JbtrMif/rCjTM8FsUFjWJA5TjhsGBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497455; c=relaxed/simple;
	bh=/tuzYSgqP1e1YK4lRH7GySipiUrM231pfnkEZzor0Pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lq+3uRegAVhoTGlMkfabdLgz8fL2zAVt2zwDJ9fV0nREWX7rlvt7mKg4tEx2NN9bJT0azOaP7IHRAAnVvlammvNBaBMtYxVz4cSFHoKZsIX1cqkFCpWZscK5os4Jr1qA1Tdbs2bng62CifiDR8/QnKfdfw7nt6j8ZBcxMgL1PKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHWbHf0T; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHWbHf0T"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b3e03939so7468015e9.1
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 07:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497449; x=1781102249; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70uSNHFwKkHfItFomOduAZmxqjyWJiVQ8AWJNM6Iaws=;
        b=QHWbHf0TsHxBDl+GFWqQZPSoB1vTX9gbP9MJSdXF3YHBw7uw2DgZ3i7a77/p8J+VGl
         tLlg/3URPMvV3p4aNnB05IAfRUKLPeBJdpr9HGJggAhUbMVpUHgs7CqynOB7BMQOtq73
         y6RxuNZqAIYAunub36+5gCN5ZHHN6NV/VMtpmxxYsc7hLjZ9/67hnZ2CxHJikXnnXgr6
         TCY3TWEuKN4WIDno2bZFzGf4/tkJixiOKznKwDpAtRPxYuQqTftw5hfySyf9/bzPbZuk
         Kf2Kg1EGp8YHaLYMDyu4Asg/AjuHMbVpBJguAaiYVs1KOa29IN4iPRJElxC4aV+qF3HR
         N6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497449; x=1781102249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=70uSNHFwKkHfItFomOduAZmxqjyWJiVQ8AWJNM6Iaws=;
        b=JDsFTfJTZfWuCEKIVvSN94wuBGDS4CLAvmhc/A6IidIMXSiH9IZaPm1VsV+PjO+2vY
         CYztgECKeu/E3WsYlIyYDruk+XWHT5e4x55x1JrZrljyGqna+Hkw3PH7eA076g8eY9Ac
         WicZw6s0NFOe9QJL/I7IkTBrhZ3bi8fV7hgF+tUEgaJdORwbFu/UmkKHGDEWZ6NZlvOw
         36F5YWXyteh1HlW9gDBFqCY6++d1ENmKqI+GAkQ6Yq3ZpgQlim35C8JPzBgTojbwe//c
         co387fTerYAMrQ2s5fOQG88sE6vMIbYOkOScz+iygi14RSVTk3NxhegM5IoSUmCUPR77
         eNQA==
X-Forwarded-Encrypted: i=1; AFNElJ+G9HtpE0fIw817Mo4gCy6SZBvUtuzPGmtbwL/3but6/NEMs2xxS7PPzWoPbJoYmnImCD4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdFQqY+bak95n9aCp0agG0QmA9yjKa11Bnph9L13CBK1aUO0+7
	kL8GCIKraydEvjP6vvzPuW/KhOWksK9b8a5A7wLxU0hYRpgmSeUavAK5
X-Gm-Gg: Acq92OEOG0wtQEIWM+pOfDB9mTxaOV5EkBCZk/6RfpPFgpKgFvIN4DDYhbhl+buPnQH
	tgBhV60bB6OQm1mf5LjT1MN/muKQcA8a/UJpMoTO8VfzjU/gp8YFjWKhM96VMOD3tBCm4dqJJsn
	wyX4AingTphBTMZ7WEIvS5YlzFcAj1JlFZOc35B5RUrzwY7GogcSIS5He6DxOcw7KRcWyPdxG8y
	nLmlaeDY/UXY7Q5erjjFLtGqMROlpUcnZe2Zok1hbZmxBGxdRDmioemHcDq/lLOKsw4lllPDz4q
	DfrjzmmwFliz4rWwP7YgJlO3bC0OxXrD60eGX+u9H3Sp12QblBESz9hCeHbp1YLtqrqrJwO+bfv
	q2Bvi5V38tTFhBkL7Xxm8f3/IpYXKINed3OgOKPV4LWx7XK2eHZnDTsCB3Dpqu9yijTs6uX+msF
	JgNZPEj1rdAFiYAZKDCd6xJ+MnFXprwyfb4cYeFD9WCMvQglU6/E/DyR27ycyHYMjGj1um5tWqT
	4QYhG/dZyw6uHiiKULxfHe6yDVgAuZ6AbP9WAGBwH1aLsnNKEI6bgKxM8s=
X-Received: by 2002:a05:600c:8184:b0:490:ad1e:1846 with SMTP id 5b1f17b1804b1-490b613f158mr44573345e9.9.1780497448722;
        Wed, 03 Jun 2026 07:37:28 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:28 -0700 (PDT)
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
Subject: [PATCH v3 02/14] arm64: dts: imx8mp-var-som-symphony: enable USB support
Date: Wed,  3 Jun 2026 16:37:09 +0200
Message-ID: <7d8b29b9a29b1976cafc3d279482012efae1a994.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the USB controllers on the Symphony carrier board.

Add the PTN5150 Type-C controller for USB role switching, enable the USB3
PHYs and controllers, configure the I2C bus used by the Type-C
controller, and set the first USB port in OTG mode and the second port
in host mode.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - Update PTN5150 interrupt trigger type

 .../dts/freescale/imx8mp-var-som-symphony.dts | 80 ++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 25f707012f62..76928b005826 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -72,8 +72,11 @@ reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
 
 &i2c3 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-1 = <&pinctrl_i2c3_gpio>;
+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	/* GPIO expander */
@@ -95,6 +98,22 @@ usb3-sata-sel-hog {
 			line-name = "usb3_sata_sel";
 		};
 	};
+
+	/* USB Type-C Controller */
+	typec@3d {
+		compatible = "nxp,ptn5150";
+		reg = <0x3d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ptn5150>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <5 IRQ_TYPE_NONE>;
+
+		port {
+			typec_dr_sw: endpoint {
+				remote-endpoint = <&usb3_drd_sw>;
+			};
+		};
+	};
 };
 
 &snvs_pwrkey {
@@ -108,6 +127,52 @@ &uart2 {
 	status = "okay";
 };
 
+&usb3_0 {
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	adp-disable;
+	dr_mode = "otg";
+	hnp-disable;
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+	srp-disable;
+	usb-role-switch;
+	status = "okay";
+
+	port {
+		usb3_drd_sw: endpoint {
+			remote-endpoint = <&typec_dr_sw>;
+		};
+	};
+};
+
+&usb_dwc3_1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usb3_phy0 {
+	fsl,phy-comp-dis-tune-percent = <115>;
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <33>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
+	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
+	fsl,phy-tx-vref-tune-percent = <122>;
+	status = "okay";
+};
+
+&usb3_phy1 {
+	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
+	fsl,phy-tx-vref-tune-percent = <116>;
+	status = "okay";
+};
+
 /* SD-card */
 &usdhc2 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -129,12 +194,25 @@ MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA                                 0x400001c2
 		>;
 	};
 
+	pinctrl_i2c3_gpio: i2c3gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SCL__GPIO5_IO18				0x1c2
+			MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19				0x1c2
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                             0xc0
 		>;
 	};
 
+	pinctrl_ptn5150: ptn5150grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX                            0x40
-- 
2.47.3

