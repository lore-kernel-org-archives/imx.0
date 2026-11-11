Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428636;
	b=OhdgfFsvEWKEbZt6TsH5Jml7pfmCpgEoOjORZTeRXHu0n1Fz+2KoxtExqzBZx0Blvvj5
	 BTpN5OJ90n4455+lAh3BnKQj1FEVm2UgfwDSJbScgX1rllTSdgyJl6JmCczevaEl6F+l+
	 elrkO5KNiKf/DztAMCVvG6F10iFN71mwFl3lQr7poAON7fAoBcCqob9HOmaNJYwpu3Ywv
	 oXnMgezN806zTo8giF1aWiRohRZVHs/+29YTudWJFWcLWvt66snmRIY1D4ETJPRIhX1gL
	 w/TGbhcga4cCXAE1AW1LJv05kXi5lJefHF1ULyDLjxImMLsq0i3QKBiPorHfHh8GHZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=tauubnPg5+uldXASOWwB//U0wk/F6jo+NhoeWJdXS1k=;
	b=FddXTk/qmSbQxS1qr5KAeiWku/Us+QhPge+J1zXyyuw2RNy/6g4CkWxES57s7z78MgpF
	 jS0UTt8A4/lGNrPJT3WJoy9Q2k9IfkRPEz4m4jhRcW3DRq6Yn6BSMqZAl2MjjJIF1/HSH
	 gh7L0yunSXKvMq1HV7ci+j5M4Zfr/jV2hBxK2eBpyukbppj6FmNOvwsGdSLUBnnaGo648
	 OsCnStILiOjhqkc8Qq2+bOuFjPPna+H40FRNtBRd+luXQpEP5Muaf56kj6z+m8HclFkAD
	 BNkgcphyCKHFqmr99Uw77vCCrt4vg4OaBN0Oj+tmGjYx7n/IokjmBG8c7aV3sY8O0Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kOsE+F4U;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7FA606A339
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 20:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E7FA606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kOsE+F4U
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a214af2076so26860255e9.0
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 12:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794428633; x=1795033433; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tauubnPg5+uldXASOWwB//U0wk/F6jo+NhoeWJdXS1k=;
        b=kOsE+F4UVauxqr3nqP9m7ijADKVSae4loEw+mAA5AVjrp36kwoJs9F+RJzhc/SBGbe
         Pddj5aejXCg4ZhF3xsGShbttDPbH1TfVO9oRym9MB9FBIvQqA1vSYbj8UpHjeAFFR/fF
         m1GAOfAZL+tjeEgCEdRpjIDDe6/jth9Z2sXig9CaxNJZ+gcBQpfYbcs09pmJD0vnOlqX
         RhFs2BG2fVnpiuye0Km3/i/JUQ+tHkb/FLDXWpSzsi9Ep4Y5u13GRooRobdxQpyDwiiy
         vgMK0nWV5p3tZ9SEdRhifehFc6rKGT6a8utcoWMWKS+fkipUDbblg4w2MpMNMzgybC59
         UUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794428633; x=1795033433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tauubnPg5+uldXASOWwB//U0wk/F6jo+NhoeWJdXS1k=;
        b=f4W1sU1Q4W4fbO7eNUrnaMjgh4H5hP7CwskFyaASwkwT0GK46HHuDwWPBEv6nfjbSS
         KMXEpyBpcLnZzXWIr7fcSAnoWksrwb71mrBF4hNFOLiLLtxchwg7HehXe8mAduVxi+zW
         mk92N1L4jNrYqIIkmDkD6owbT8Y9gLzn7S8xvtriYRNGtGvVSv6qImUmLE2D3KIjPbeR
         PixBA+emPraFKEQmh/Pp1Bnyr251Qfn0DGv7nTsp7PGToeaZSrL0ce5E2kQ/SW9Tiipd
         fb2eAj2gBaJHvO0HhSDcWrySetpuHgWRSy/S7UUlwf51UFkFjvYHSnEsVrIWC1ySo0dR
         hQqg==
X-Forwarded-Encrypted: i=1; AL+hErEMvuX7ukkL8qcg6Gd4BzwVejcU3Z3k0s2yWreG3BoB4Okl5Eq7DJ7iV/zA7y0a/2LAcAM=@lists.linux.dev
X-Gm-Message-State: APuU4Z+wLhMeMgEgUm/VDMEV0cl2Hp67sA4L7FBQt8HNjoyIUZMGYbVm
	ADUhzQd0XB6Q9/xJF+B6hoMaOeo1qXGnbmlNOf3tEx8Bc3dR7az1erMR
X-Gm-Gg: AYBFou3R7Wriunct0LrbyBfW3zRoGf4CM07HL7UAewBG0I4I6WeRHE7O30oiEoZFQnr
	Obp0rN2STbA/S/nfosQiIl+buylfxtN0D8JUjat6mEGu6MXRlWuGkF9JHn6IXBnPa6SJLfjOvrr
	xD0cZNC5JQY6oQtv7vUBA08tvrYWX2XCYUuTv5hdsJRhEnP9jpPwmsJPzIh96YoGZgv1WmeACSl
	K5vfg4J2r75CCtQAIwu8xmDyOb0G6MOYeErCKkT2ur7K42MGvz+PYODTR/4l4RZ6DtpQZg6iY04
	UxsaBmUMAzVfovPcMXNCL3OIgcqukh3fPHMUYMmtp1ZAYuCCAWMNbn4lnA4nS57aocWl7RGlTWM
	AknFTFhC3Kt48o3DKeVlzlEAFrHiQCKHw5NIb0nWvz0Mkh6u76HQnfh4x6m/VGHRBOhi2twiE3P
	/+GYn/OhGsqRzMGq3srZEW/LNiUKh+iPTBxkDRFN0ckBP31L4DvGGlh3psU/6bLozMFCRH8Mgof
	3iRUsL75THJjAu2oti4o5/cCmt4gexmEmOvTffQD4S/tjrNGQ89UwzG0fZTIb+XNNwQP4TRmpaJ
	Znja5ai/RwXtMb8YgDbNNEqQdkCgxMo5KngEJ9zaarJxlvL3pH6/V+dm47cRbmfV4c/5enLvoky
	4gg6sk0KVkesbWKkNAapGv8WDxNBvSI6ZpA58ixrwZynKpSrb/JLPmPjm
X-Received: by 2002:a05:600c:83cf:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4ba0935d26emr62871665e9.5.1794428633403;
        Wed, 11 Nov 2026 12:23:53 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c990sm12079305f8f.3.2026.11.11.12.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:23:52 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v2 3/3] arm64: dts: imx8mp-var-smarc: Add support for Variscite Echo board
Date: Wed, 11 Nov 2026 21:23:12 +0100
Message-ID: <d74bfe3c5186d3d7cbf7243b109913a0cf9b2f70.1794420001.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1794420001.git.stefano.r@variscite.com>
References: <cover.1794420001.git.stefano.r@variscite.com>
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add device tree support for the Variscite Echo carrier board with the
VAR-SMARC-MX8M-PLUS system on module.

The Echo board includes:
- uSD card support
- USB ports and OTG
- Two Gigabit Ethernet interfaces
- UART, SPI and I2C interfaces
- HDMI display interface
- WM8904 audio codec
- Capacitive touchscreen
- GPIO expanders, buttons and LED
- PCIe interface
- CAN peripherals

Link: https://variscite.com/carrier-boards/echo-board/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Remove the unused ft5x06_ts label from the touchscreen node.
 - Add uart-has-rtscts to UART1.

 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-var-smarc-echo.dts   | 648 ++++++++++++++++++
 2 files changed, 649 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index e51558a49f8b..2492a78c01bc 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -724,6 +724,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-ultra-mach-sbc.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-smarc-echo.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw71xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw72xx-2x.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo.dts
new file mode 100644
index 000000000000..dd7afc59bb13
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo.dts
@@ -0,0 +1,648 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Variscite Echo carrier board for VAR-SMARC-MX8M-PLUS
+ *
+ * Link: https://variscite.com/carrier-boards/echo-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/phy/phy-imx8-pcie.h>
+#include "imx8mp-var-smarc.dtsi"
+
+/ {
+	model = "Variscite VAR-SMARC-MX8M-PLUS on Echo-Board";
+	compatible = "variscite,var-smarc-mx8mp-echo",
+		     "variscite,var-smarc-mx8mp",
+		     "fsl,imx8mp";
+
+	chosen {
+		stdout-path = &uart2;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-home {
+			label = "Home";
+			linux,code = <KEY_HOME>;
+			gpios = <&pcal6408_1 4 GPIO_ACTIVE_LOW>;
+		};
+
+		button-up {
+			label = "Up";
+			linux,code = <KEY_UP>;
+			gpios = <&pcal6408_1 5 GPIO_ACTIVE_LOW>;
+		};
+
+		button-down {
+			label = "Down";
+			linux,code = <KEY_DOWN>;
+			gpios = <&pcal6408_1 6 GPIO_ACTIVE_LOW>;
+		};
+
+		button-back {
+			label = "Back";
+			linux,code = <KEY_BACK>;
+			gpios = <&pcal6408_1 7 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_led>;
+
+		led-0 {
+			function = LED_FUNCTION_DISK;
+			gpios = <&gpio4 18 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "mmc2";
+		};
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "c";
+
+		port {
+			hdmi_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
+	pcie0_refclk: pcie0-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	reg_audio_echo: regulator-audio-echo-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "wm8904_echo_supply";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reg_base_per_3v3: regulator-base-per-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "BASE_PER_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "VSD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio1 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <100>;
+		off-on-delay-us = <12000>;
+	};
+
+	reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
+		compatible = "regulator-gpio";
+		regulator-name = "VSD_VSEL";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+		gpios-states = <1>;
+		states = <3300000 0>, <1800000 1>;
+		vin-supply = <&ldo5>;
+	};
+
+	sound-echo {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&echo_codec_dai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&echo_codec_dai>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "wm8904-ech-audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN2L", "Line In Jack",
+			"IN2R", "Line In Jack",
+			"IN1L", "Microphone Jack",
+			"IN1R", "Microphone Jack";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+
+		echo_codec_dai: simple-audio-card,codec {
+			sound-dai = <&wm8904_echo>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai2>;
+		};
+	};
+
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+	};
+};
+
+&aud2htx {
+	status = "okay";
+};
+
+&ecspi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi1>;
+	cs-gpios = <&gpio5 17 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&ecspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi2>;
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	status = "okay";
+};
+
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	status = "okay";
+};
+
+&hdmi_pai {
+	status = "okay";
+};
+
+&hdmi_pvi {
+	status = "okay";
+};
+
+&hdmi_tx {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hdmi>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			hdmi_tx_out: endpoint {
+				remote-endpoint = <&hdmi_in>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	pinctrl-1 = <&pinctrl_i2c2_gpio>;
+	scl-gpios = <&gpio2 8 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 9 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	typec@3d {
+		compatible = "nxp,ptn5150";
+		reg = <0x3d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ptn5150>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
+
+		port {
+			typec_dr_sw: endpoint {
+				remote-endpoint = <&usb3_drd_sw>;
+			};
+		};
+	};
+};
+
+&i2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-1 = <&pinctrl_i2c3_gpio>;
+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
+&i2c4 {
+	wm8904_echo: codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_MCLK1>;
+		clock-names = "mclk";
+		DCVDD-supply = <&reg_audio_echo>;
+		DBVDD-supply = <&reg_audio_echo>;
+		AVDD-supply = <&reg_audio_echo>;
+		CPVDD-supply = <&reg_audio_echo>;
+		MICVDD-supply = <&reg_audio_echo>;
+		wlf,drc-cfg-names = "default", "peaklimiter", "tradition",
+				    "soft", "music";
+		/*
+		 * Config registers per name, respectively:
+		 * KNEE_IP = 0,   KNEE_OP = 0,     HI_COMP = 1,   LO_COMP = 1
+		 * KNEE_IP = -24, KNEE_OP = -6,    HI_COMP = 1/4, LO_COMP = 1
+		 * KNEE_IP = -42, KNEE_OP = -3,    HI_COMP = 0,   LO_COMP = 1
+		 * KNEE_IP = -45, KNEE_OP = -9,    HI_COMP = 1/8, LO_COMP = 1
+		 * KNEE_IP = -30, KNEE_OP = -10.5, HI_COMP = 1/4, LO_COMP = 1
+		 */
+		wlf,drc-cfg-regs = /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
+				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
+				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
+		/* GPIO1 = DMIC_CLK, don't touch others */
+		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
+		wlf,in1l-as-dmicdat1;
+	};
+
+	pcal6408_1: gpio@20 {
+		compatible = "nxp,pcal6408";
+		reg = <0x20>;
+		vcc-supply = <&reg_base_per_3v3>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pcal6408>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
+	};
+
+	pcal6408_2: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		vcc-supply = <&reg_base_per_3v3>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	touchscreen@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_captouch>;
+		reset-gpios = <&pcal6408_1 0 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+	};
+};
+
+&i2c6 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c6>;
+	pinctrl-1 = <&pinctrl_i2c6_gpio>;
+	scl-gpios = <&gpio3 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio3 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
+&lcdif3 {
+	status = "okay";
+};
+
+&pcie {
+	reset-gpios = <&pcal6416 14 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pcie_phy {
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
+	clocks = <&pcie0_refclk>;
+	clock-names = "ref";
+	status = "okay";
+};
+
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+	status = "okay";
+};
+
+&pwm2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm2>;
+	status = "okay";
+};
+
+&sai2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	assigned-clocks = <&clk IMX8MP_CLK_SAI2>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <11536000>;
+	clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_IPG>,
+		 <&clk IMX8MP_CLK_DUMMY>,
+		 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_MCLK1>,
+		 <&clk IMX8MP_CLK_DUMMY>,
+		 <&clk IMX8MP_CLK_DUMMY>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+/* Header */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+/* Console */
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	status = "okay";
+};
+
+/* Header */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
+&usb3_0 {
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
+
+&usb3_phy0 {
+	fsl,phy-tx-vref-tune-percent = <122>;
+	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
+	fsl,phy-comp-dis-tune-percent = <115>;
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <33>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
+	status = "okay";
+};
+
+&usb3_phy1 {
+	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
+	fsl,phy-tx-vref-tune-percent = <116>;
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	adp-disable;
+	dr_mode = "otg";
+	hnp-disable;
+	maximum-speed = "high-speed";
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
+	/* Prevent controller from entering U1/U2 power-saving states. */
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+	status = "okay";
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	vqmmc-supply = <&reg_usdhc2_vqmmc>;
+	bus-width = <4>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_captouch: captouchgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14		0x16
+		>;
+	};
+
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SCL__ECSPI1_SCLK		0x12
+			MX8MP_IOMUXC_I2C1_SDA__ECSPI1_MOSI		0x12
+			MX8MP_IOMUXC_I2C2_SCL__ECSPI1_MISO		0x12
+			MX8MP_IOMUXC_I2C2_SDA__GPIO5_IO17		0x12
+		>;
+	};
+
+	pinctrl_ecspi2: ecspi2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK		0x12
+			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI		0x12
+			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO		0x12
+			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13		0x12
+		>;
+	};
+
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_TX__CAN1_TX			0x154
+			MX8MP_IOMUXC_SPDIF_RX__CAN1_RX			0x154
+		>;
+	};
+
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_CEC__CAN2_TX			0x154
+			MX8MP_IOMUXC_SAI5_MCLK__CAN2_RX			0x154
+		>;
+	};
+
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x400001c2
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x400001c2
+			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD		0x40000010
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA6__I2C2_SCL		0x400001c2
+			MX8MP_IOMUXC_SD1_DATA7__I2C2_SDA		0x400001c2
+		>;
+	};
+
+	pinctrl_i2c2_gpio: i2c2-gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA6__GPIO2_IO08		0x1c2
+			MX8MP_IOMUXC_SD1_DATA7__GPIO2_IO09		0x1c2
+		>;
+	};
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL			0x400001c2
+			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA			0x400001c2
+		>;
+	};
+
+	pinctrl_i2c3_gpio: i2c3-gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SCL__GPIO5_IO18		0x1c2
+			MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19		0x1c2
+		>;
+	};
+
+	pinctrl_i2c6: i2c6grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_RXFS__I2C6_SCL		0x400001c2
+			MX8MP_IOMUXC_SAI5_RXC__I2C6_SDA			0x400001c2
+		>;
+	};
+
+	pinctrl_i2c6_gpio: i2c6-gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_RXFS__GPIO3_IO19		0x1c2
+			MX8MP_IOMUXC_SAI5_RXC__GPIO3_IO20		0x1c2
+		>;
+	};
+
+	pinctrl_led: ledgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18		0xc6
+		>;
+	};
+
+	pinctrl_pcal6408: pcal6408grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05		0x1c6
+		>;
+	};
+
+	pinctrl_ptn5150: ptn5150grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10		0x10
+		>;
+	};
+
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_EXT_CLK__PWM1_OUT		0x116
+		>;
+	};
+
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO11__PWM2_OUT		0x116
+		>;
+	};
+
+	pinctrl_sai2: sai2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_TXFS__AUDIOMIX_SAI2_TX_SYNC	0xd6
+			MX8MP_IOMUXC_SAI2_TXC__AUDIOMIX_SAI2_TX_BCLK	0xd6
+			MX8MP_IOMUXC_SAI2_RXD0__AUDIOMIX_SAI2_RX_DATA00	0xd6
+			MX8MP_IOMUXC_SAI2_TXD0__AUDIOMIX_SAI2_TX_DATA00	0xd6
+			MX8MP_IOMUXC_SAI2_MCLK__AUDIOMIX_SAI2_MCLK	0xd6
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX		0x40
+			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX		0x40
+			MX8MP_IOMUXC_UART3_RXD__UART1_DCE_CTS		0x40
+			MX8MP_IOMUXC_UART3_TXD__UART1_DCE_RTS		0x40
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX		0x40
+			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX		0x40
+		>;
+	};
+
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX		0x40
+			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX		0x40
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x190
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d0
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d0
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d0
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d0
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x194
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d4
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d4
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d4
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d4
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d4
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x196
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d6
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d6
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d6
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d6
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d6
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
+		fsl,pins = <
+			/* Card detect */
+			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12		0x10
+			/* Power enable */
+			MX8MP_IOMUXC_GPIO1_IO08__GPIO1_IO08		0x1c4
+			/* Voltage select */
+			MX8MP_IOMUXC_GPIO1_IO04__GPIO1_IO04		0xc0
+		>;
+	};
+};
-- 
2.47.3

