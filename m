Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107266;
	b=odTR0QlBufwocaURsmKz2Cy0kM8E8UszlLAlTMU6NRXCMapGcW8h1mYxdmOCqaWEI7H6
	 MZHcJF+e2Kf2ZqNcKYCCzRDvjSfFpdPjTtKtuAppLUP7naD0k8PhxUZElzvPOI3k45VSf
	 yB8twRPc4Q2/tJ60NnSeDfjFehqKQuDTg+8sXbF4RkC8E8iny9m30EP2p659RzR0G+8/1
	 v4xJlETYszIBjM9o7RAvo0DyUvWbkDrQ4am7dH0UOwgr/rV4g01iBNW2Gq1vczglluZry
	 glE0CPcav7OLf4H7/TZF/sFQ0syH17hXGpKbZWLVdbRVnKS4iSgs1PTS9SkNZt4QO+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PI+wWLA/0HjZUtFhvg6XuCK4doWx6E1ESuzMR7f3jIc=;
	b=T2M4hiP8V1cgFhStY4yijRfaG8lAAYRwf/rgoEwRhiLGhg9PuGKNWaadpilqeh8FNUPN
	 X3GOz/MKMrE+kUzVE1UoyKozsUFhXnG/pBVc2TsUpHjlk+zp8E/ennHl4u2ZWe1GsLdZ5
	 4JiQD0yhyvCdAB5io3odJqTA61NVrxNHecY2k5WMvJQClIg5C7a3AvXpVeZ9/s9A7a3XD
	 8KL2aP5MgirHynlgEq5NNL088AzUG1VEJlDeFyq7KkAKjNeDj1SHVf24+0EKOdWrXEWC3
	 o8IfbyWlCLoHILzTSiTaRGRq30+F0A5aKyokRzx6CCpIjboUtpnxtDbKk1hsY0tJPxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gndkwYvp;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BAA606A31E
	for <imx@lists.linux.dev>; Tue, 27 Oct 2026 13:21:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59BAA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gndkwYvp
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so5953155e9.1
        for <imx@lists.linux.dev>; Tue, 27 Oct 2026 06:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793107265; x=1793712065; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PI+wWLA/0HjZUtFhvg6XuCK4doWx6E1ESuzMR7f3jIc=;
        b=gndkwYvpGtlj0Js98fjrSozyIzOeXkQN1hc7iq7JBNL7KtqdwBbU/ttj1fW1RqUOFv
         38qaNxku929s+8hVq0sGYS+6K2SOvi4nxtKlumt4CTfRMtGV3nde4Rsa7T/xF3U/N/Wc
         q6gHYFakvLrD86TELPUREeyGa66g50MZW8WR2yWlOBAi0nMys+ZoNtISEY4waYql2+1N
         0Lv13J2Vh5x2dn+XeRTUWfR5D/5Mv5NXvSEKHPGRooINFHDjQSkm58H4EMx6OKOagztl
         kxkVheY1uqFfolsMxIx6lZSZtIvP0PLe2eP+F0Hik/Rsf+hfcjsXnw9YubB1sIVLKaPB
         S5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793107265; x=1793712065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PI+wWLA/0HjZUtFhvg6XuCK4doWx6E1ESuzMR7f3jIc=;
        b=GubQw63Cj72USkWk8pS2OsuHHKW9GC5w8KcZiMDFPoMDTnEbIvPWDEOxOo2DFqi2z4
         a0eCW2awFpctbVrulAh3y8vY8QRUsC3E+yu4mWFycbPSEFsw9CqZ8lLjBeDDORCMXugK
         zRual5SmovQlZAVZs+VrTb2JT9HRnpc1RPcrwLOwGDmpq29PfZt/+QVD9BP1U9+BtmB5
         BijjH/NP+YiAno9kC50B3rIo4q2t34j9fcRj5ZbXZH7CYMPkgOKrFxp9pue4RioCNP0b
         OxZNvRQ2qslsM/ThXXWZ6/TLgFIr0Y+0j1uD4oEpAWFS9qzPHB+xHGkxEPA9Ah4izjw7
         vlJw==
X-Forwarded-Encrypted: i=1; AKwUvBxYzEb1UKGuDKw9FCTcGFo5OLGzLV8EpWXPOhI1VKjNO6aiW9Zwhr9jFQE3oal7ZToa3hQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYII4DMxfEOcIoeINg+egrfxDR8l+blNRg7wOMkli7MkpAGw7bcH
	RXhaH51edqbFIk7CzDyDqEhrEfTj+TbehI6hMF8WrlEdqMG6WED2FkMa
X-Gm-Gg: AYBFou0Q36Q4kRPKJstMz2zb0eDI/satBZcNrA93n95kthoJY1SFTPzX+Ek+jetbuwz
	3rbjg+XxwfCEMwxDcd4Zlhfvk2xf2JHW4RT1FcBcwX7ghaYCbHm1Z7WVT2y+y7O/xc1xalOJK7v
	xwhb3TTNKFE4GkN9ZsHsDxi0mxyIYoE8XrZ1XItjmJjTw+GEXQbCvUaOwvo7ywZ8fTNkH0tN+kc
	bpOcA3swtuGZR1UYl9/+/ngIqqwS2Gzc+duBrS64h2k58XX7gDGYWwZG5sXddS8A1A6wobE+7NJ
	+eMdMpdUOozyBcjoOqBQ1tAOBXnuNehtlqP0IjF1+hw1RumAzW9f0MVSrsCSqDfIWquMyhLcrcG
	NSGohkW3IGpCfHVsrHZPnDRMKa/j9EakpTOY3H7nmm9I9nW4vJvZOozZ4RWvYGd6znBUibd33RQ
	dAIJVl3lWu6ccWAZuddu9N/ksDYMU1+rWYB0cRtTbApQpKuOljKi7C1PnfjUrITaA50x6CH8LyJ
	6SjhltBdldl/aUugRFdYulfsQLn7xTF//RJ7hnk9VxCJNnzXLi5xfDCdHtYpkOsmZ1CJkkFit9P
	Z7EHOuzWHnnpBTehrFh7QRoLkvN6HA==
X-Received: by 2002:a05:600c:3c98:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a7c1c845a2mr58333335e9.16.1793107264222;
        Tue, 27 Oct 2026 06:21:04 -0700 (PDT)
Received: from SMW032656.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a08dcbfsm177568315e9.2.2026.10.27.06.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:21:02 -0700 (PDT)
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
Subject: [PATCH v2] arm64: dts: imx95-navq: add USB1/USB2 nodes
Date: Tue, 27 Oct 2026 15:16:30 +0200
Message-ID: <20261027131630.575-1-laurentiumihalcea111@gmail.com>
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
v1 -> v2:

* change USB2 DR mode to OTG to match TypeC connector configuration. The
controller should actually support the software-based host <-> device
switch.

---
 arch/arm64/boot/dts/freescale/imx95-navq.dts | 121 +++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-navq.dts b/arch/arm64/boot/dts/freescale/imx95-navq.dts
index 7860c113e9e0..b668c752905b 100644
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
+	dr_mode = "otg";
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

