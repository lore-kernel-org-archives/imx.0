Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B5E3CD8C9
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 14:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929689; cv=none; b=K4qhG6HYY4rJLYJ2gDkiJCGBnI7Q623GPCDmp3th8ekWYD5XG2KEs/fGxw5R8BrwhYAvjuGb/zlPpii2IE0TqVHsphB394DpAtNpNr4CgMb5zLa9AmwNqlsiriVCWk4Ty5fUGMJ2wODmX7pB9dRYk31Xkm/1ueA8cZEtHYsyoV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929689; c=relaxed/simple;
	bh=3OR75mM00ga78bJJ5INn61HGws3S4oSk9aXzdQei9eI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UdG33v5Pk05NkZSiYc5+X0nBLnL/qKJwUg077u6nFmvr0B2dabUY+uWJC2TYKLLzHmOgQJd6uTARjspj96TtSj4THPbd3Dr/DfG73VXPtt4IGMTHgzfzvAgKULn/K3iUI5ZipuYX9DteSZhZtJ7Qsr+5YdFpka5HDGD4W8be/rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cd5PcwmS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cd5PcwmS"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490d1e54b3bso6258355e9.1
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 07:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929686; x=1781534486; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZtDd2dpRTbBih32m/3kw3VCO4DN79CIvfv0d4AZ5vY=;
        b=cd5PcwmSwAWGQOh2QoIshDBPkyw4ahcYH+gRB1AA2i6uJ2XwxcdT0ZdySHEVvphZ5F
         fvUOeIDmAM4uds1z5F4GQZc0Vw1C1ycbnt2TgAlohJuFpwP1zyUAnRLdhobz4T64uKVQ
         Oy/9vL7jKyX/M2oMRcMP2Jd77ZwXY1GlWIJOnQRRqGGX9y4eY0+PcnaKMivQnLWVPpTq
         CXDlPk6Bw/z8rlSJ51IIj0HDkCkvaHDlzL0vBVsqPD74kXbL0b7n2oEX8F4XPrMjFbxl
         hrn0arFiqvup0i2Dky5DnMCAjTl+LKk/ay5fMX3imIXrJ+so2bAeylkLIljLiQWv1Suj
         EoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929686; x=1781534486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VZtDd2dpRTbBih32m/3kw3VCO4DN79CIvfv0d4AZ5vY=;
        b=JmdKNnwNvNeTJjctAwRhDPDHSn3Ksuh0NryOjtD1n3Ieog56GGGw/HqoRYXakACi4S
         VEW+awnDzC+2lqkv/z8mWjE/PX4bjiAH9mxaprg4jHjBT/9wcGkn1a7GtkxrrVpg0nZP
         iBVI4L0a+N0LjZVK//d3dZiFjM3+K6QNfN3HCUzGMSJ8cjAuNEg9aUqQiWLc3H4D+GiP
         4gZzE72la4oVhByQt/elFA7OSzOs6QHLBRJL8qBiYxKUg3BAzkFoc8x90h6LFWU5vecE
         yga4xbqY0gonUdZi/YLYDhAN25XWFywcnA2XKXBFieHidMA2nPsHo48wYHCpxl4TWik3
         rXuw==
X-Forwarded-Encrypted: i=1; AFNElJ+i5gIq/+gtTh6iaRtP6MvUh1wkK7dcfCqzJwRAp6/6LqRmmyHbE4CPPHSJCw4wDE7QxC4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzAW/zoKEMtkYhk5MslEwZmP6gDwXm08IuGQnApQiZth7iUhPgT
	3W/i+aIMKVgn+Gk3ZksDeL5LBGrBXNyq9erljoApWMpab0d+03AqTlnT
X-Gm-Gg: Acq92OEmHCSVBRtcmbXVjHSpMmG8FUIoc9yrrdLJcILUx0Sur5aWmnvPKlaQLzl4bfS
	hmq3c2IQqy5IZsJaMnKSSleeC9eLv/6Jj7GZgtw8LZmJUjmLE+dwHAiNjnQytkZ37WO50aNGAwX
	8qmgCeQoc4Yk5bv7e3W7zcdEHKXssH4q5uV/8W7ebriVyhiOymioA33g3t0+6covyJHU1FbQrC+
	ELgRftXRLevBtC1vsHoYP+vZX15FCGSez1XIC5cYa96yVZT6rzPcQMwELC0swaJFXJgTZ8DwywQ
	BPW40N/Fi69jAYOWn+ZQuSrfwYkQdQL8N8LSg/8XvYLTeQnrqNRpkxUx3wveKPllVlajU/i1bHX
	6MS/+0t+6UwNaS2AK0kfSvm3mUc3FCKgRaEbjzuIIbjXwi/VbvRqmXnVfnu3p4ehneACx7tlWhY
	+BRu3Pj4PYPvDCq+sx7hvqIKVbxbKwWYVEzJPcJuIbgTv+N68beVZDE6qGOqvHJyy8m6y1Qs+TR
	1mnyCYh/0v5F6Ea7TyRXijEto2Fre0h7AcYTxj3DoNPyUgI
X-Received: by 2002:a05:600c:528a:b0:490:7136:ad05 with SMTP id 5b1f17b1804b1-490c25d5d3amr273239015e9.31.1780929685726;
        Mon, 08 Jun 2026 07:41:25 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:25 -0700 (PDT)
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
Subject: [PATCH v5 02/14] arm64: dts: imx8mp-var-som-symphony: enable USB support
Date: Mon,  8 Jun 2026 16:41:03 +0200
Message-ID: <5646fd0a05093822d25bc358c53a08735b16a300.1780929317.git.stefano.r@variscite.com>
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

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the USB controllers on the Symphony carrier board.

Add the PTN5150 Type-C controller for USB role switching, enable the USB3
PHYs and controllers, configure the I2C bus used by the Type-C
controller, and set the first USB port in OTG mode and the second port
in host mode.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Add the SION (Software Input On) bit for the I2C recovery pins

v3->v4:
 - Fixed USB irq edge type

v2->v3:
 - 

v1->v2:
 - Update PTN5150 interrupt trigger type

 .../dts/freescale/imx8mp-var-som-symphony.dts | 80 ++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 25f707012f62..cb27853ba281 100644
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
+		interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
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
+			MX8MP_IOMUXC_I2C3_SCL__GPIO5_IO18				0x400001c2
+			MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19				0x400001c2
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

