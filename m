Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039456;
	b=avb7aHQa1WbEErBR3REWnHO/dO6hEHv/3s2tMQ3TVAAgc/e87ZE2JAQG/jYsP8E/bqOl
	 Z+Jiq4iMeT6Ct/YcGCE2N0TR+ZexjxMquXF4buFquLFocf8yan0zPBETIkt/J4wD05Lkn
	 Cv7NLPRlXqWV/CBhr0KAMvgTKIh7SyBWaSdTBCVFQmE+jOqNALX3mPRVFvlCPTnMILQ+k
	 AE4xeUB0JpjHM2NQ+0+AQNsh/BnQmEFQU39RKILwDxFYh8dNj5nth7D5g2honzDEHI5oI
	 qg/1XyNUJXzc+koA9DqX/0+J58ObfSEXVIXAxrqkJxJySdpggvmh99NfKJJpwBNyJdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hDzwNGKF3X9STRFxmJBhcRpaL+ED6BGdlNgUocMroeE=;
	b=OZfEv4lycSn8wsBNFVRkG0obx6Me7+m7z6Ts3RKexEkbXmVQ9fwSGTaLFCNFNWbJ9KxY
	 +usHvAcj2+tQFcbEQ7gxRQiluhPwjMsRuz8yK3nOXeXpRcOKta/wtGLfW7Ik3pmum3zCS
	 /a3BuQXIk1kDeCFRaFxBKsygXjkEVKcOfsyIm4t4hebBgg+jHCDf43ZVBVHCqd+0XwonN
	 6n+LAVte9qobpZH25rq9tXatzBPDevEa5550ifnKDdScrf+iLAgN381UEuM8Oq9bb6aNR
	 VaA27HP1W2SEtiLYroHn85rnsZmjp/DvQZqG9qbT6DpYXd7Q1yn3pzU3mtSzJCinGMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Cq19TS/T";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D480606A31E
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 18:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D480606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Cq19TS/T
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso25776885e9.1
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793039454; x=1793644254; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hDzwNGKF3X9STRFxmJBhcRpaL+ED6BGdlNgUocMroeE=;
        b=Cq19TS/TKQ5aH+AsHJ2sZ30hH2CXH1EXHnS5MsSMAO2rB5M9KxFb6T9DmJzj1vku6m
         OWZCmLeSO5LIOrDwhDUYp80hXk5WRRPu8oQ8yahDD9qL3a4iAFIVtGDxDDF6E/AJqq+A
         Jwy7jZcnc5wo5bIEHyggp48kr9/UMH+vTayHNqYwpFpWiZd7UviOL/qzRkQKMPc9b6+U
         wOdFnxRhKnuEdVZCHcEGTj5nXPDl6M1+WBJM6K+1Pp/PfSPy0aIlv3cc43TP8RxroPOP
         Dsp4ISZSyc79Kch/eU8jLikEo8RZg3OaRD/3TkjsLVLnwZER5uIdg53uCZRLfkzC6jGZ
         fJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039454; x=1793644254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hDzwNGKF3X9STRFxmJBhcRpaL+ED6BGdlNgUocMroeE=;
        b=xEVPUH6kaH+y3hI8vDp0TKPjUIQjf/sTGTQVLaF+8AKOBymOuCkco5ERf2AmVcZsz0
         qUnLN2dtLbuIUYiZY5pob3z81Y1p0FDfvsvDJ1FA4XDOzz4YPv/3nAldP+QpnKFCNqz6
         aHDFtny/zaGtwVfU2SZX+0Nqr5/yAyWK48G3jhe+cLPw/MpZgxd1VK6mty1J+vhuMXqi
         miv4hZE8QOqe4tl5US4BP8iD8vhBH+GdjUdOci1qMD8uQjuxZS9CV4Jx2z8dwCe6AqL5
         cKY7aKppYE3EY9oXdnCVYQxQv4O9o4uD8mCoeHglPfgZ28ksXMMQwdOovpKsxJ7TtuP0
         Ae+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwWEFPGWKoWvLCFIhs5LcDHMvT/q9BblGq+lWl9Jvi5FSoiijV/tSuQ+3hXPST3oAtk3AA=@lists.linux.dev
X-Gm-Message-State: AFq9FYI3L5ans9tQ8R2/T3AIDnJFdiJuw/DfZbZOq0s+AoBuUQsIMQRQ
	7wlu8Vp/ed4s8v16zbh8Cd5/u0HNsPcAqvOo+uUQTGmlurfnr6NVP6ff
X-Gm-Gg: AYBFou35CG0JD5Mf/74p6MjbUEtFF3hitZGb6h+ldzBfCK9AgBTcpavD+Jl4Ud4JxpV
	andUKpFLJTpIbF0lw0l6ZwroPbXskeHR0xqrszsOjnOEkb7RweJtcYqDYHBmivbsVltYk09wSWn
	7Wy+JFmeZU5QhZv2XJ31/90uej7NqmFre5COTF+yPJ1adgLByH60bLmpSxDHk7UsqVwZSdgPc7o
	CK8XiDFq/7LB9Ejz8MXzJJuVL43XdykAwDWOrsIYVQivjLA3wcZONMuIexAw/jH9SKaHzs43LYZ
	aF5ofLsNePLDZE7b9JjrBhFqY84+QpVPt/0LbIG7TVOp2A0l3QCkhZlS9hbBu9rFMIE54klQssc
	tmp4o2n4FZp/VCrZcK89kA6U8cD8IZMaQuGy9At3SSyaIYR6JcXvp2tv/xSU1JLsi/U5GJsAk01
	VMBiTFwXWaUO2+DaO/iar4dz+82dT2r8n28hyEhdBo/Zx1TgT7tJyJJ5ecZo/hf8hko45DL3OU3
	sTSpHJsVZyEaD8ZTZ3kUiMiO1P2IPTJZW7b21EuVmcR676j0+5mGl/vGK+aRYh+1gNEVx7Mj9w4
	eN7imQ==
X-Received: by 2002:a05:600c:3486:b0:49f:f099:6fb1 with SMTP id 5b1f17b1804b1-4a35ac95955mr122964795e9.15.1793039453713;
        Mon, 26 Oct 2026 11:30:53 -0700 (PDT)
Received: from SMW032656.wbi.nxp.com ([128.77.15.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e11bsm250727985e9.1.2026.10.26.11.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:30:53 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx95-navq: add USB1/USB2 nodes
Date: Mon, 26 Oct 2026 20:21:50 +0200
Message-ID: <20261026182150.11330-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add and enable the DT nodes for USB1 and USB2.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-navq.dts | 121 +++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-navq.dts b/arch/arm64/boot/dts/freescale/imx95-navq.dts
index 7860c113e9e0..5fe245b62306 100644
--- a/arch/arm64/boot/dts/freescale/imx95-navq.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-navq.dts
@@ -5,6 +5,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/usb/pd.h>
+
 #include "imx95.dtsi"
 
 / {
@@ -80,6 +82,72 @@ i2c3_gpio_expander_21: gpio-expander@21 {
 		pinctrl-0 = <&pinctrl_i2c3_gpio_expander_21>;
 		pinctrl-names = "default";
 	};
+
+	ptn5110_usb3: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		interrupt-parent = <&gpio4>;
+		/* USB_PTN5110_ALERT_B - shared IRQ line with tcpc@51 */
+		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pinctrl_typec>;
+		pinctrl-names = "default";
+
+		/* no SINK circuit (EN_SINK1 tied to TP32) */
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB1 3.0 Type C";
+			data-role = "dual";
+			power-role = "source";
+			self-powered;
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					typec1_con_hs: endpoint {
+						remote-endpoint = <&usb3_data_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					typec1_con_ss: endpoint {
+						remote-endpoint = <&usb3_data_ss>;
+					};
+				};
+			};
+		};
+	};
+
+	ptn5110_usb2: tcpc@51 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x51>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pinctrl_typec>;
+		pinctrl-names = "default";
+
+		/* no SINK circuit (EN_SINK1 tied to TP30) */
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB2 2.0 Type C";
+			data-role = "dual";
+			power-role = "source";
+			self-powered;
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+
+			port {
+				typec2_con_hs: endpoint {
+					remote-endpoint = <&usb2_data_hs>;
+				};
+			};
+		};
+	};
 };
 
 &lpuart1 {
@@ -145,6 +213,10 @@ pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7			0x31e>;
 	};
 
+	pinctrl_typec: typecgrp {
+		fsl,pins = <IMX95_PAD_ENET2_RD1__GPIO4_IO_BIT25				0x31e>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		bootph-pre-ram;
 		fsl,pins = <IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX			0x31e>,
@@ -198,6 +270,55 @@ pinctrl_usdhc2: usdhc2grp {
 	};
 };
 
+&usb2 {
+	disable-over-current;
+	dr_mode = "host";
+	usb-role-switch;
+
+	status = "okay";
+
+	port {
+		usb2_data_hs: endpoint {
+			remote-endpoint = <&typec2_con_hs>;
+		};
+	};
+};
+
+&usb3_dwc3 {
+	adp-disable;
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	usb-role-switch;
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+
+	status = "okay";
+
+	port {
+		usb3_data_hs: endpoint {
+			remote-endpoint = <&typec1_con_hs>;
+		};
+	};
+};
+
+&usb3_phy {
+	orientation-switch;
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <17>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
+	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
+	fsl,phy-tx-vref-tune-percent = <100>;
+
+	status = "okay";
+
+	port {
+		usb3_data_ss: endpoint {
+			remote-endpoint = <&typec1_con_ss>;
+		};
+	};
+};
+
 &usdhc1 {
 	bootph-pre-ram;
 	bus-width = <8>;
-- 
2.53.0

