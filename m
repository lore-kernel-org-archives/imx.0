Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A7D3BFE3B
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 10:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913381; cv=none; b=KH+6l9kyivjFSfOwbDTW8lbV1wKn058ZAs62b+x+KL/ofFukB/9rp6wlOzCp1gBdYlLQRuTHXoXJQWQwsHLo0LeklsrrLM6xHwemxSKVDXIQSnTNaCbO7Mcihp/LG1xKUtqASZmaw2yJE8HB6N7McNX6s6gJCMbQ3IPHmVUBVvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913381; c=relaxed/simple;
	bh=UvXqqZnMBGGcWobRETXzQ+YghTSL+VpY664flu2EX9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=be1hNVRjIwC0POdWTzcgdpY9LdwAYiUnFbnQxSqjKRqYluXGwGOtIRYLeELvYHabilslzghO/MRiw9+VXL91NOhMDwYzHEZ8RfesQtHFVO604dVNtzBRFHAQncuSXgZQg9+eg7B0kcTQUs2+jY6PgWCP1L4tVj8VMlmM9O0I0Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DenqeJBY; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DenqeJBY"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45ef4223be7so2121821f8f.2
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 03:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913378; x=1781518178; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9onXniPIM0BFv5kDhXCuEWqOXXqSqeWgy1dwP69TYg=;
        b=DenqeJBYSQACbk9EqXQpADbNUkM5d0e74v0rdp3FvldtadIipOtnT3DtuByiOLWx55
         3YID1uW6Gdc6I+3uQ1JuwdArVWOBw2NmmVMv9h5aEd16KGIFliDRzU0FGfEg5Z12ZkkV
         m0rX9rCtSuiZsDm9cGDp4iaBs4iT979ZPCWzfHxc9Hv+RNVG3nnxlG83gaRDVaN0/eLh
         hzAGUwTbv7iuP1Su4PXdB0EDsgq838RcHSpbP7KN/BFCgO5ryWwsfRdyNV07XR+Bqsl8
         2WVQOyUUj89cUYJEE9kH4e6TFdcrwAe3hgm31e2+OHr37eSCxDhSKRZLb9gRKUjzXb4j
         1E6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913378; x=1781518178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l9onXniPIM0BFv5kDhXCuEWqOXXqSqeWgy1dwP69TYg=;
        b=r6/gI6LnCfo6NDR+Ggw2+saq/+VMdojc9zZxZs7BtwxRbe+Y9tJAEzJlaen/B8Iy0J
         UMdD5c/J9XW84soSkXZO0unB+LMGx4YzbTvm0M+vsvU+xxx0c6MI/Z39L8q2XqM1w9ry
         Ox1ArVi4SYrzH9vTWez/RyDCDKJGgXvdlepCDqSZfS0jx8KwyTJIG5Fj44snMWWQILzO
         vpfjzi/9yymL/6TygpJXYKpR03+jIXlf50hsXPE+uBxq4VtIUWqs9T+XKQCOhZwSg8nu
         h5Coi3KHsYQPt968Zy2EJ6ZKdd3XnL0LcO3tD578qw5/u73P/xj7yxo7ijFc18+B5Yhl
         cymg==
X-Forwarded-Encrypted: i=1; AFNElJ/PKoOkjcPPGMOpvCLOOz81+nmMfycgWy18+UR/Wz41FVyw+0SLo+HEK8MhyIAkj9LVuqw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxub/TMTQ78avXlW4WY4tBZGQ/wjaj2zKJEohlyYhd+fpbRB9YE
	5PwNtXkgPIuY0XfuBx6worKrPxzPcP5p8PDbD6myEYSZ0Si78msZEXnf
X-Gm-Gg: Acq92OHwUdN5kL2WJUFFwsXp9fkt6TFnODDaZYVh47YX8hLcJDC212Bgl1dmi3skAlj
	RBysGuTTZfarvrxURT89C/ns4DMd+bZzMJ8KwiZaoJnnWOh9PkGKZ+AM+DanHMGm/k+ss70togy
	M/bpW3rrr7uuufTZBEnXzNdVB4rwZpJapEjUoCck3QqOgqHFO7ZWZG5QOVwV84Vf/j7uBOkXjKk
	bvho99CyxJSbKweWcR2nmLSqNxPoR89zwgRr1YqkbTggcGP7qbDifZHv7mGWc0NLjBRc4Kpmbjr
	nUlq9BgbWNNHFMpCJ8TxTgDnz8rXktC6ODbGbw1tmmN3buRAMGk7r6wADGElZOWXm2JDGXQnh7e
	k7hCssaqAw0fEZN6ir0ITqaQ2toMQciNa0o/mEsHv6qDIZBiPTiPTqL9Pv+HUCgp47BXmPqkslm
	vyFRe1rW/xbxmsf04tdk8sDYqaYLEsVKURCkV9IMM5+uhbYpQJElXIoc8SPCHzEOHwXtUZAEHqX
	6EB7jdCyg+RvIQP+v2ldn/8lIFYQtKGGY7A2U4Aacdxt4eZ
X-Received: by 2002:a5d:448f:0:b0:45e:fa7b:a7db with SMTP id ffacd0b85a97d-460304eb421mr16635918f8f.8.1780913378451;
        Mon, 08 Jun 2026 03:09:38 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:38 -0700 (PDT)
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
Subject: [PATCH v4 02/14] arm64: dts: imx8mp-var-som-symphony: enable USB support
Date: Mon,  8 Jun 2026 12:09:20 +0200
Message-ID: <69418a0a09103d0982e474d3d5ca8a3543fb39ea.1780912893.git.stefano.r@variscite.com>
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

Enable the USB controllers on the Symphony carrier board.

Add the PTN5150 Type-C controller for USB role switching, enable the USB3
PHYs and controllers, configure the I2C bus used by the Type-C
controller, and set the first USB port in OTG mode and the second port
in host mode.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Fixed USB irq edge type

v2->v3:
 - 

v1->v2:
 - Update PTN5150 interrupt trigger type

 .../dts/freescale/imx8mp-var-som-symphony.dts | 80 ++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 25f707012f62..2b04c9027125 100644
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

