Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87333CF962
	for <imx@lists.linux.dev>; Tue, 25 Aug 2026 06:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787641040; cv=none; b=tXGcYlUV/oCoeco2OLgzXtjL6EOZuP1K59lQp4Q0jQNUD9GpsV/7BAWBJCSN4+S2r6lGuE3I+jNb7lU/xtJovqL7G9k6etWQEoUYKc/ziaVtvy3zgdxe8Qu65aa2tkBdwcpjYBBx4t23cw87bAr2UeXXsAwKWLpWn1oyUUqn/ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787641040; c=relaxed/simple;
	bh=OrWrYeE84IJBhLvbGJNq3xf3KVc3vHUVH9UKkwrGadA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YTPr9RwWCeSAjTQygN/MiuvG+yPfHdEzODO1ucf8ESL9Ch9jV5r+m0ugC1LkL5UV7TQwfYyxLku/FGDlF/ecdUdCr8pWaM41JoNVH2NsNkuYLmMIWc1CasQVRzHfz78MthprDKtr7RCU7orl+WwWMxPck3hEXsJG9HNnkyNL6bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nzc8T0lW; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nzc8T0lW"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a422090b14so5846977a12.1
        for <imx@lists.linux.dev>; Mon, 24 Aug 2026 23:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787641034; x=1788245834; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dl1U9Z8ES9n931N1eYYW3Bp5MkXQyuJOvUdMFsbuzQg=;
        b=nzc8T0lWaV2RWVsh+uMKAlAlpjeN3RansRdHV72L/Zwhz8pvPD3Vln9S/xpWNAHro8
         QdEqU2KoObQNslWYnfxroETQ4e+vR1d5aDUqX3DtpKBy2G4l5Vy7fWP2er/gSznX6ie/
         3ns86MT4ZGkwghyEeT9POSCTE8g9FvBshujDQpYybnREYJVkXTe6ea8LydoeJOFSM/Ux
         BRZoBwSr20t2sGsh52ZWjHnvdAa2F4+gGDjEhsg2hU7y/I/D+vpZaP/z3oYkCDSM8kB2
         eNqXH0xDb5XqofhjJWAsHSN5jnGNzc84NpsVrBiJpqalPtr/SebkeCeMMf8GFlqUAFQv
         Cn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787641034; x=1788245834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dl1U9Z8ES9n931N1eYYW3Bp5MkXQyuJOvUdMFsbuzQg=;
        b=IypS2Ie+VhqZ4h+d45zluOjn2YD1Ixa5pODzg7m1VWSpO3Tk9mjQOXSgacm8l6Si38
         0zbm4/v+LB/f8RDZZaWCkZ+KAikZ9FnQTFhIE5QUw6OfMyMg395If2amNFS7hdu0+lRV
         xnNPNrWUTivqQPuTpBqUrDCHzg1r7GQXof5FG6MuVDJPZdxQ9GsVvmtGHyqeDbcfJjPZ
         93kqhIcfGuJA2f13VV+9zVoVeONfD2PYN0U3yhyINqjoJ3wlyWYpRDNboV/Ej/CYBkns
         W3DrkEYKQNRotj3k4SvsezG5jD1rp9o4P6s5QM5JY5A6/mvUUrnOlrakZ0jpexLz7jjM
         IR0Q==
X-Forwarded-Encrypted: i=1; AHgh+RrR98Ov6NjoL5273KC0k3aCXeiv8x/fmJ4hN542aTxX8+gvo6rTwmnaOIkQYTymXfo4L9c=@lists.linux.dev
X-Gm-Message-State: AFuF++kYI0JFkuj+slNRyevZlr2quzT0CWgKATo4hVJmqektrfGWNDeO
	vdCoxjQo424ptwer4T5lTa5xm3pAOf/wJc/8RLx/lZMLohLH4tMsamv+
X-Gm-Gg: AR+sD1178L8PGPXzyVsxJJIIGFVDZVgBFw8W/zVstAPCLzn1fZFsEOwHzZcW/tE7KwV
	9ecCtMKRnb5GBxxIJxYrPmGSnuaLOb2eQ8snPGQ1BnOCQLELtSs0K/LQj4G49y2yp58S7SEoKK2
	WBUmGQV+ZJqMYyVdXNGQ5bBVXrh520N/BjWNG4sat0wdcLFqvG2WsBddpz/fEAkA6j8moiuNQST
	bd3qqJgHNW0MJGXcD1kZ/jGMkxnHfbfGBzfNwIEbbr6D73QL4Kp8zoGOrzRD6ikRz2blrHTf4KL
	JHWNNMopcCvCUyY89rhKMNARXLApHFyeTEzHRirCHhmYtwlzKEPPA+F+2exzAxCKRRtg2d5WEsQ
	LEwrKJ8spP6TvC1atOSGComcXUUTHMFS4yVNa3x0TzoTEKzYQ1jPrTreLUykzvgdOq4hCS9odAb
	1EcUOfui4M4XFTQmR+GPVU6wRmGrFSFLxQ1nTZLST8gqY9c0KppYlsuZ6WoV6jqMIvL5ZGTOntX
	Pcuz9CGGTAsGLMrUjVSB6r8Xhck1K76j2EO4cSTj6a7LzoC9XooNa2t
X-Received: by 2002:a17:907:930e:b0:c1c:4e36:eec6 with SMTP id a640c23a62f3a-c2492099898mr2452479466b.18.1787641033619;
        Mon, 24 Aug 2026 23:57:13 -0700 (PDT)
Received: from GLaDOS.station (mob-5-90-70-208.net.vodafone.it. [5.90.70.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24d6f203acsm613534266b.24.2026.08.24.23.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 23:57:12 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	alexander.h@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: [PATCH v4 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
Date: Tue, 25 Aug 2026 08:56:54 +0200
Message-ID: <2b7fabe6b1c4d08e58d2542742492564b67c4c32.1787586961.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787586961.git.stefano.r@variscite.com>
References: <cover.1787586961.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add device tree support for the Variscite VAR-SOM-MX7 system on module.

The module is based on the NXP i.MX7Dual SoC and is available in
multiple configurations and hardware revisions.

Add the common SoM description together with support for:
- eMMC storage
- NAND storage
- WM8731 audio codec
- VAR-SOM-MX7 V2 hardware revision

Only SoM-specific peripherals are described here. Carrier board specific
interfaces are provided by the respective carrier board device trees.

Link: https://variscite.com/system-on-module-som/i-mx-7/var-som-mx7/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Fixed non-generic names and wrong separators
 - Fixed ads7846_ts pendown gpio

v2->v3:
 - Removed wrong header in dtsi
 - Fixed pinctrl name
 - Fixed sai clocks

v1->v2:
 - Moved ethphy1 reset pin mux
 - Fixed irq types
 - Removed duplicate assigned-clock-rates property
 - fixed wifi child node name
 - Added color property in gpio led definition
 - Updated deprecated reset-gpio propery
 - Added disable-over-current property in usb nodes

 .../boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi  |  99 +++
 .../nxp/imx/imx7d-var-som-mx7customboard.dtsi | 382 +++++++++++
 .../boot/dts/nxp/imx/imx7d-var-som-nand.dtsi  |  73 ++
 .../boot/dts/nxp/imx/imx7d-var-som-v2.dtsi    |  66 ++
 .../dts/nxp/imx/imx7d-var-som-wm8731.dtsi     |  65 ++
 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi  | 635 ++++++++++++++++++
 6 files changed, 1320 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi
new file mode 100644
index 000000000000..2f8185f8c526
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common dtsi for eMMC support on Variscite VAR-SOM-MX7
+ *
+ * Link: https://variscite.com/system-on-module-som/i-mx-7/var-som-mx7/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+&gpio6 {
+	sd3-pwr-hog {
+		gpio-hog;
+		gpios = <11 0>;
+		output-low;
+		line-name = "sd3_pwr";
+	};
+};
+
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	pinctrl-3 = <&pinctrl_usdhc3_sleep>;
+	vmmc-supply = <&vgen3_reg>;
+	assigned-clocks = <&clks IMX7D_USDHC3_ROOT_CLK>;
+	assigned-clock-rates = <400000000>;
+	no-1-8-v;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX7D_PAD_SD3_RESET_B__SD3_RESET_B	0x59
+			MX7D_PAD_SD3_CMD__SD3_CMD		0x59
+			MX7D_PAD_SD3_CLK__SD3_CLK		0x19
+			MX7D_PAD_SD3_DATA0__SD3_DATA0		0x59
+			MX7D_PAD_SD3_DATA1__SD3_DATA1		0x59
+			MX7D_PAD_SD3_DATA2__SD3_DATA2		0x59
+			MX7D_PAD_SD3_DATA3__SD3_DATA3		0x59
+			MX7D_PAD_SD3_DATA4__SD3_DATA4		0x59
+			MX7D_PAD_SD3_DATA5__SD3_DATA5		0x59
+			MX7D_PAD_SD3_DATA6__SD3_DATA6		0x59
+			MX7D_PAD_SD3_DATA7__SD3_DATA7		0x59
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX7D_PAD_SD3_RESET_B__SD3_RESET_B	0x59
+			MX7D_PAD_SD3_CMD__SD3_CMD		0x5a
+			MX7D_PAD_SD3_CLK__SD3_CLK		0x1a
+			MX7D_PAD_SD3_DATA0__SD3_DATA0		0x5a
+			MX7D_PAD_SD3_DATA1__SD3_DATA1		0x5a
+			MX7D_PAD_SD3_DATA2__SD3_DATA2		0x5a
+			MX7D_PAD_SD3_DATA3__SD3_DATA3		0x5a
+			MX7D_PAD_SD3_DATA4__SD3_DATA4		0x5a
+			MX7D_PAD_SD3_DATA5__SD3_DATA5		0x5a
+			MX7D_PAD_SD3_DATA6__SD3_DATA6		0x5a
+			MX7D_PAD_SD3_DATA7__SD3_DATA7		0x5a
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX7D_PAD_SD3_RESET_B__SD3_RESET_B	0x59
+			MX7D_PAD_SD3_CMD__SD3_CMD		0x5b
+			MX7D_PAD_SD3_CLK__SD3_CLK		0x1b
+			MX7D_PAD_SD3_DATA0__SD3_DATA0		0x5b
+			MX7D_PAD_SD3_DATA1__SD3_DATA1		0x5b
+			MX7D_PAD_SD3_DATA2__SD3_DATA2		0x5b
+			MX7D_PAD_SD3_DATA3__SD3_DATA3		0x5b
+			MX7D_PAD_SD3_DATA4__SD3_DATA4		0x5b
+			MX7D_PAD_SD3_DATA5__SD3_DATA5		0x5b
+			MX7D_PAD_SD3_DATA6__SD3_DATA6		0x5b
+			MX7D_PAD_SD3_DATA7__SD3_DATA7		0x5b
+		>;
+	};
+
+	pinctrl_usdhc3_sleep: usdhc3-sleepgrp {
+		fsl,pins = <
+			MX7D_PAD_SD3_RESET_B__GPIO6_IO11	0x10
+			MX7D_PAD_SD3_CMD__GPIO6_IO1		0x10
+			MX7D_PAD_SD3_CLK__GPIO6_IO0		0x10
+			MX7D_PAD_SD3_DATA0__GPIO6_IO2		0x10
+			MX7D_PAD_SD3_DATA1__GPIO6_IO3		0x10
+			MX7D_PAD_SD3_DATA2__GPIO6_IO4		0x10
+			MX7D_PAD_SD3_DATA3__GPIO6_IO5		0x10
+			MX7D_PAD_SD3_DATA4__GPIO6_IO6		0x10
+			MX7D_PAD_SD3_DATA5__GPIO6_IO7		0x10
+			MX7D_PAD_SD3_DATA6__GPIO6_IO8		0x10
+			MX7D_PAD_SD3_DATA7__GPIO6_IO9		0x10
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
new file mode 100644
index 000000000000..aecc8c747f04
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
@@ -0,0 +1,382 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Variscite VAR-MX7CustomBoard carrier board for VAR-SOM-MX7
+ *
+ * Link: https://variscite.com/carrier-boards/var-mx7customboard/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/ {
+	chosen {
+		stdout-path = &uart1;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_keys>;
+
+		key-back {
+			label = "Back";
+			gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_BACK>;
+		};
+
+		key-menu {
+			label = "Menu";
+			gpios = <&gpio2 28 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_MENU>;
+		};
+
+		key-home {
+			label = "Home";
+			gpios = <&gpio2 29 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOME>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_leds>;
+
+		led-d10 {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	reg_hsic_hub_connect: regulator-hsic-hub-connect {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_hsic_hub_connect>;
+		regulator-name = "reg_hsic_hub_connect";
+		gpio = <&gpio1 12 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	reg_hsic_hub_pwr_on: regulator-hsic-hub-pwr-on {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_hsic_hub_pwr>;
+		regulator-name = "hsic_hub_pwr_on";
+		gpio = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usb_otg1_vbus: regulator-otg1-vbus {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usbotg1_pwr>;
+		regulator-name = "usb_otg1_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio1 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usb_otg2_vbus: regulator-otg2-vbus {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usbotg2_pwr>;
+		regulator-name = "usb_otg2_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&clks {
+	assigned-clocks = <&clks IMX7D_PLL_AUDIO_POST_DIV>;
+	assigned-clock-rates = <884736000>;
+};
+
+&ecspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi2>;
+	cs-gpios = <&gpio4 23 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	status = "okay";
+};
+
+&i2c2 {
+	/* DS1337 RTC module */
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+	};
+};
+
+&i2c4 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	pinctrl-1 = <&pinctrl_i2c4_gpio>;
+	scl-gpios = <&gpio4 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio4 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	ft5x06_ts: touchscreen@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touch>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <30 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+	};
+};
+
+&pcie {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcie>;
+	reset-gpios = <&gpio2 31 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pwm2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm2>;
+	status = "okay";
+};
+
+&snvs_poweroff {
+	status = "okay";
+};
+
+&snvs_pwrkey {
+	status = "okay";
+};
+
+&snvs_rtc {
+	status = "disabled";
+};
+
+/* DEBUG */
+&uart1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_uart1>;
+	pinctrl-1 = <&pinctrl_uart1_sleep>;
+	assigned-clocks = <&clks IMX7D_UART1_ROOT_SRC>;
+	assigned-clock-parents = <&clks IMX7D_OSC_24M_CLK>;
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	assigned-clocks = <&clks IMX7D_UART2_ROOT_SRC>;
+	assigned-clock-parents = <&clks IMX7D_OSC_24M_CLK>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&usbh {
+	disable-over-current;
+	vbus-supply = <&reg_hsic_hub_pwr_on>;
+	status = "okay";
+};
+
+&usbotg1 {
+	dr_mode = "host";
+	disable-over-current;
+	vbus-supply = <&reg_usb_otg1_vbus>;
+	status = "okay";
+};
+
+&usbotg2 {
+	dr_mode = "host";
+	disable-over-current;
+	vbus-supply = <&reg_usb_otg2_vbus>;
+	status = "okay";
+};
+
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_usdhc1_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_usdhc1_gpio>;
+	cd-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
+	no-1-8-v;
+	keep-power-in-suspend;
+	status = "okay";
+};
+
+&wdog1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog>;
+	fsl,ext-reset-output;
+};
+
+&iomuxc {
+	pinctrl_gpio_keys: gpio-keysgrp {
+		fsl,pins = <
+			MX7D_PAD_EPDC_BDR0__GPIO2_IO28		0x32
+			MX7D_PAD_EPDC_BDR1__GPIO2_IO29		0x32
+			MX7D_PAD_GPIO1_IO11__GPIO1_IO11		0x32
+		>;
+	};
+
+	pinctrl_gpio_leds: gpio-ledsgrp {
+		fsl,pins = <
+			MX7D_PAD_GPIO1_IO13__GPIO1_IO13		0x59
+		>;
+	};
+
+	pinctrl_ecspi2: ecspi2grp {
+		fsl,pins = <
+			MX7D_PAD_ECSPI2_MISO__ECSPI2_MISO	0x2
+			MX7D_PAD_ECSPI2_MOSI__ECSPI2_MOSI	0x2
+			MX7D_PAD_ECSPI2_SCLK__ECSPI2_SCLK	0x2
+			MX7D_PAD_ECSPI2_SS0__GPIO4_IO23		0x2
+		>;
+	};
+
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			MX7D_PAD_I2C3_SCL__FLEXCAN2_RX		0x59
+			MX7D_PAD_I2C3_SDA__FLEXCAN2_TX		0x59
+		>;
+	};
+
+	pinctrl_hsic_hub_connect: hsichubconnectgrp {
+		fsl,pins = <
+			MX7D_PAD_GPIO1_IO12__GPIO1_IO12		0x59
+		>;
+	};
+
+	pinctrl_hsic_hub_pwr: hsichubpwrgrp {
+		fsl,pins = <
+			MX7D_PAD_GPIO1_IO10__GPIO1_IO10		0x59
+		>;
+	};
+
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX7D_PAD_I2C4_SDA__I2C4_SDA		0x4000007f
+			MX7D_PAD_I2C4_SCL__I2C4_SCL		0x4000007f
+		>;
+	};
+
+	pinctrl_i2c4_gpio: i2c4gpiogrp {
+		fsl,pins = <
+			MX7D_PAD_I2C4_SDA__GPIO4_IO15		0x4000007f
+			MX7D_PAD_I2C4_SCL__GPIO4_IO14		0x4000007f
+		>;
+	};
+
+	pinctrl_pcie: pciegrp {
+		fsl,pins = <
+			MX7D_PAD_EPDC_PWR_STAT__GPIO2_IO31	0x79
+		>;
+	};
+
+	pinctrl_touch: touchgrp {
+		fsl,pins = <
+			MX7D_PAD_EPDC_PWR_COM__GPIO2_IO30	0x80000000
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX7D_PAD_UART1_TX_DATA__UART1_DCE_TX	0x79
+			MX7D_PAD_UART1_RX_DATA__UART1_DCE_RX	0x79
+		>;
+	};
+
+	pinctrl_uart1_sleep: uart1sleep-grp {
+		fsl,pins = <
+			MX7D_PAD_UART1_TX_DATA__GPIO4_IO1	0x10
+			MX7D_PAD_UART1_RX_DATA__GPIO4_IO0	0x10
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX7D_PAD_LCD_ENABLE__UART2_DCE_TX	0x79
+			MX7D_PAD_LCD_CLK__UART2_DCE_RX		0x79
+			MX7D_PAD_LCD_VSYNC__UART2_DCE_CTS	0x79
+			MX7D_PAD_LCD_HSYNC__UART2_DCE_RTS	0x79
+		>;
+	};
+
+	pinctrl_usdhc1_gpio: usdhc1-gpiogrp {
+		fsl,pins = <
+			MX7D_PAD_SD1_CD_B__GPIO5_IO0		0x59
+			MX7D_PAD_GPIO1_IO08__SD1_VSELECT	0x59
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX7D_PAD_SD1_CMD__SD1_CMD		0x59
+			MX7D_PAD_SD1_CLK__SD1_CLK		0x19
+			MX7D_PAD_SD1_DATA0__SD1_DATA0		0x59
+			MX7D_PAD_SD1_DATA1__SD1_DATA1		0x59
+			MX7D_PAD_SD1_DATA2__SD1_DATA2		0x59
+			MX7D_PAD_SD1_DATA3__SD1_DATA3		0x59
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX7D_PAD_SD1_CMD__SD1_CMD		0x5a
+			MX7D_PAD_SD1_CLK__SD1_CLK		0x1a
+			MX7D_PAD_SD1_DATA0__SD1_DATA0		0x5a
+			MX7D_PAD_SD1_DATA1__SD1_DATA1		0x5a
+			MX7D_PAD_SD1_DATA2__SD1_DATA2		0x5a
+			MX7D_PAD_SD1_DATA3__SD1_DATA3		0x5a
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX7D_PAD_SD1_CMD__SD1_CMD		0x5b
+			MX7D_PAD_SD1_CLK__SD1_CLK		0x1b
+			MX7D_PAD_SD1_DATA0__SD1_DATA0		0x5b
+			MX7D_PAD_SD1_DATA1__SD1_DATA1		0x5b
+			MX7D_PAD_SD1_DATA2__SD1_DATA2		0x5b
+			MX7D_PAD_SD1_DATA3__SD1_DATA3		0x5b
+		>;
+	};
+};
+
+&iomuxc_lpsr {
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO02__PWM2_OUT	0x110b0
+		>;
+	};
+
+	pinctrl_usbotg1_pwr: usbotg1pwrgrp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO05__GPIO1_IO5	0x14
+		>;
+	};
+
+	pinctrl_usbotg2_pwr: usbotg2pwrgrp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO07__GPIO1_IO7	0x14
+		>;
+	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO00__WDOG1_WDOG_B	0x74
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand.dtsi
new file mode 100644
index 000000000000..d2c3b9e6007e
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand.dtsi
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common dtsi for NAND support on Variscite VAR-SOM-MX7
+ *
+ * Link: https://variscite.com/system-on-module-som/i-mx-7/var-som-mx7/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+&gpmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "spl";
+				reg = <0x00000000 0x00200000>;
+			};
+
+			partition@200000 {
+				label = "u-boot";
+				reg = <0x00200000 0x00200000>;
+			};
+
+			partition@400000 {
+				label = "u-boot_env";
+				reg = <0x00400000 0x00200000>;
+			};
+
+			partition@600000 {
+				label = "kernel";
+				reg = <0x00600000 0x00c00000>;
+			};
+
+			partition@1200000 {
+				label = "rootfs";
+				reg = <0x01200000 0x3ee00000>;
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_gpmi_nand: gpminandgrp {
+		fsl,pins = <
+			MX7D_PAD_SD3_CLK__NAND_CLE		0x71
+			MX7D_PAD_SD3_CMD__NAND_ALE		0x71
+			MX7D_PAD_SAI1_MCLK__NAND_WP_B		0x71
+			MX7D_PAD_SAI1_TX_BCLK__NAND_CE0_B	0x71
+			MX7D_PAD_SAI1_RX_DATA__NAND_CE1_B	0x71
+			MX7D_PAD_SAI1_TX_DATA__NAND_READY_B	0x74
+			MX7D_PAD_SD3_STROBE__NAND_RE_B		0x71
+			MX7D_PAD_SD3_RESET_B__NAND_WE_B		0x71
+			MX7D_PAD_SD3_DATA0__NAND_DATA00		0x71
+			MX7D_PAD_SD3_DATA1__NAND_DATA01		0x71
+			MX7D_PAD_SD3_DATA2__NAND_DATA02		0x71
+			MX7D_PAD_SD3_DATA3__NAND_DATA03		0x71
+			MX7D_PAD_SD3_DATA4__NAND_DATA04		0x71
+			MX7D_PAD_SD3_DATA5__NAND_DATA05		0x71
+			MX7D_PAD_SD3_DATA6__NAND_DATA06		0x71
+			MX7D_PAD_SD3_DATA7__NAND_DATA07		0x71
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2.dtsi
new file mode 100644
index 000000000000..8aa9d0950a97
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2.dtsi
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * dtsi for Variscite VAR-SOM-MX7 V2
+ *
+ * Changelog link: https://dev.variscite.com/var-som-mx7/changelog/#var-som-mx7_v2-v20
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/ {
+	model = "Variscite i.MX7 Dual VAR-SOM-MX7 V2";
+	compatible = "variscite,var-som-imx7d-v2", "fsl,imx7d";
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <10000>;
+		reset-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&fec1 {
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+};
+
+&fec2 {
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+};
+
+&pinctrl_wlan {
+	fsl,pins = <
+		MX7D_PAD_LPSR_GPIO1_IO04__GPIO1_IO4	0x09
+	>;
+};
+
+&pinctrl_wlan_sleep {
+	fsl,pins = <
+		MX7D_PAD_LPSR_GPIO1_IO04__GPIO1_IO4	0x10
+	>;
+};
+
+/* BT */
+&uart3 {
+	bluetooth_iw61x: bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
+/* WiFi */
+&usdhc2 {
+	/delete-property/ #address-cells;
+	/delete-property/ #size-cells;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	/delete-node/ wifi@1;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
new file mode 100644
index 000000000000..92dda8d36478
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common dtsi for WM8731 support on Variscite VAR-SOM-MX7
+ *
+ * Link: https://variscite.com/system-on-module-som/i-mx-7/var-som-mx7/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/delete-node/ &codec_wm8904;
+/delete-node/ &wm8904;
+
+/ {
+	codec_wm8731: sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&sound_master>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&sound_master>;
+		simple-audio-card,name = "wm8731audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "RHPOUT",
+			"Headphone Jack", "LHPOUT",
+			"LLINEIN", "Line Jack",
+			"RLINEIN", "Line Jack",
+			"MICIN", "Mic Bias",
+			"Mic Bias", "Mic Jack";
+		simple-audio-card,widgets =
+			"Headphone", "Headphone Jack",
+			"Line", "Line Jack",
+			"Microphone", "Mic Jack";
+
+		sound_master: simple-audio-card,cpu {
+			sound-dai = <&sai1>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&wm8731>;
+			system-clock-frequency = <12288000>;
+		};
+	};
+};
+
+&i2c2 {
+	wm8731: audio-codec@1a {
+		compatible = "wlf,wm8731";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&vgen6_reg>;
+		DBVDD-supply = <&vgen6_reg>;
+		DCVDD-supply = <&vgen6_reg>;
+		HPVDD-supply = <&vgen6_reg>;
+		clocks = <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>;
+		clock-names = "mclk";
+		assigned-clocks = <&clks IMX7D_AUDIO_MCLK_ROOT_SRC>,
+				  <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>;
+		assigned-clock-parents = <&clks IMX7D_PLL_AUDIO_POST_DIV>;
+		assigned-clock-rates = <0>, <12288000>;
+	};
+};
+
+&sai1 {
+	assigned-clock-rates = <0>, <36864000>;
+	/delete-property/ fsl,sai-mclk-direction-output;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi
new file mode 100644
index 000000000000..158158afc339
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi
@@ -0,0 +1,635 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common dtsi for Variscite VAR-SOM-MX7
+ *
+ * Link: https://variscite.com/system-on-module-som/i-mx-7/var-som-mx7/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+#include <dt-bindings/leds/common.h>
+#include "imx7d.dtsi"
+
+/ {
+	model = "Variscite i.MX7 Dual VAR-SOM-MX7";
+	compatible = "variscite,var-som-imx7d", "fsl,imx7d";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
+
+	reg_phy_vddio: regulator-phy-vddio {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio-1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_vmmc_wl: regulator-vmmc-wl {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "wlreg_on";
+	};
+
+	reg_vref_1v8: regulator-vref-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vref-1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	codec_wm8904: sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&dailink_master>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&dailink_master>;
+		simple-audio-card,name = "wm8904-audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN2L", "Line In Jack",
+			"IN2R", "Line In Jack",
+			"IN1L", "Microphone Jack",
+			"IN1R", "Microphone Jack",
+			"Microphone Jack", "MICBIAS";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+		simple-audio-card,mclk-fs = <256>;
+
+		dailink_master: simple-audio-card,codec {
+			sound-dai = <&wm8904>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai1>;
+		};
+	};
+};
+
+&adc1 {
+	vref-supply = <&reg_vref_1v8>;
+	status = "okay";
+};
+
+&adc2 {
+	vref-supply = <&reg_vref_1v8>;
+	status = "okay";
+};
+
+&cpu0 {
+	cpu-supply = <&sw1a_reg>;
+};
+
+&cpu1 {
+	cpu-supply = <&sw1a_reg>;
+};
+
+&ecspi1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_ecspi1>;
+	pinctrl-1 = <&pinctrl_ecspi1_sleep>;
+	cs-gpios = <&gpio4 19 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	/* Resistive touch controller */
+	ads7846_ts: touchscreen@0 {
+		reg = <0>;
+		compatible = "ti,ads7846";
+		pinctrl-names ="default";
+		pinctrl-0 = <&pinctrl_restouch>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
+		spi-max-frequency = <1500000>;
+		pendown-gpio = <&gpio1 9 GPIO_ACTIVE_LOW>;
+		ti,x-min = /bits/ 16 <125>;
+		ti,x-max = /bits/ 16 <4008>;
+		ti,y-min = /bits/ 16 <282>;
+		ti,y-max = /bits/ 16 <3864>;
+		ti,x-plate-ohms = /bits/ 16 <180>;
+		ti,pressure-max = /bits/ 16 <255>;
+		ti,debounce-max = /bits/ 16 <10>;
+		ti,debounce-tol = /bits/ 16 <3>;
+		ti,debounce-rep = /bits/ 16 <1>;
+		ti,settle-delay-usec = /bits/ 16 <150>;
+		ti,keep-vref-on;
+	};
+};
+
+&fec1 {
+	pinctrl-names = "default","sleep";
+	pinctrl-0 = <&pinctrl_enet1>,
+		    <&pinctrl_enet1_rst>,
+		    <&pinctrl_enet2_rst>;
+	pinctrl-1 = <&pinctrl_enet1_sleep>,
+		    <&pinctrl_enet1_rst_sleep>,
+		    <&pinctrl_enet2_rst_sleep>;
+	phy-supply=<&vgen3_reg>;
+	assigned-clocks = <&clks IMX7D_ENET_PHY_REF_ROOT_SRC>,
+			  <&clks IMX7D_ENET_AXI_ROOT_SRC>,
+			  <&clks IMX7D_ENET1_TIME_ROOT_SRC>,
+			  <&clks IMX7D_ENET1_TIME_ROOT_CLK>,
+			  <&clks IMX7D_ENET_AXI_ROOT_CLK>;
+	assigned-clock-parents = <&clks IMX7D_PLL_ENET_MAIN_25M_CLK>,
+				 <&clks IMX7D_PLL_ENET_MAIN_250M_CLK>,
+				 <&clks IMX7D_PLL_ENET_MAIN_100M_CLK>;
+	assigned-clock-rates = <0>, <0>, <0>, <100000000>, <250000000>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy0>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			reset-gpios = <&gpio5 11 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <20000>;
+			reset-deassert-us = <80000>;
+			vddio-supply = <&reg_phy_vddio>;
+		};
+
+		ethphy1: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+			reset-gpios = <&gpio4 3 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <20000>;
+			reset-deassert-us = <80000>;
+			vddio-supply = <&reg_phy_vddio>;
+		};
+	};
+};
+
+&fec2 {
+	pinctrl-names = "default","sleep";
+	pinctrl-0 = <&pinctrl_enet2>;
+	pinctrl-1 = <&pinctrl_enet2_sleep>;
+	phy-supply=<&vgen3_reg>;
+	assigned-clocks = <&clks IMX7D_ENET_PHY_REF_ROOT_SRC>,
+			  <&clks IMX7D_ENET_AXI_ROOT_SRC>,
+			  <&clks IMX7D_ENET2_TIME_ROOT_SRC>,
+			  <&clks IMX7D_ENET2_TIME_ROOT_CLK>,
+			  <&clks IMX7D_ENET_AXI_ROOT_CLK>;
+	assigned-clock-parents = <&clks IMX7D_PLL_ENET_MAIN_25M_CLK>,
+				 <&clks IMX7D_PLL_ENET_MAIN_250M_CLK>,
+				 <&clks IMX7D_PLL_ENET_MAIN_100M_CLK>;
+	assigned-clock-rates = <0>, <0>, <0>, <100000000>, <250000000>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy1>;
+	status = "okay";
+};
+
+&i2c1 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1_gpio>;
+	scl-gpios = <&gpio4 8 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio4 9 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	pfuze300: pmic@8 {
+		compatible = "fsl,pfuze3000";
+		reg = <0x08>;
+
+		regulators {
+			sw1a_reg: sw1a {
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <6250>;
+			};
+
+			/* use sw1c_reg to align with pfuze100/pfuze200 */
+			sw1c_reg: sw1b {
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1475000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <6250>;
+			};
+
+			sw2_reg: sw2 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			sw3a_reg: sw3 {
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1650000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			swbst_reg: swbst {
+				regulator-min-microvolt = <5000000>;
+				regulator-max-microvolt = <5150000>;
+			};
+
+			snvs_reg: vsnvs {
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vref_reg: vrefddr {
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vgen1_reg: vldo1 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vgen2_reg: vldo2 {
+				status = "disabled";
+			};
+
+			vgen3_reg: vccsd {
+				regulator-min-microvolt = <2850000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vgen4_reg: v33 {
+				regulator-min-microvolt = <2850000>;
+				regulator-max-microvolt = <2850000>;
+				regulator-always-on;
+			};
+
+			vgen5_reg: vldo3 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vgen6_reg: vldo4 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	pinctrl-1 = <&pinctrl_i2c2_gpio>;
+	scl-gpios = <&gpio4 10 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio4 11 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	wm8904: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>;
+		clock-names = "mclk";
+		AVDD-supply = <&vgen6_reg>;
+		CPVDD-supply = <&vgen6_reg>;
+		DCVDD-supply = <&vgen6_reg>;
+		DBVDD-supply = <&vgen6_reg>;
+		MICVDD-supply = <&vgen6_reg>;
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
+		/* DMIC is connected to IN1L */
+		wlf,in1l-as-dmicdat1;
+	};
+};
+
+&reg_1p0d {
+	vin-supply = <&sw2_reg>;
+};
+
+&reg_1p2 {
+	vin-supply = <&sw2_reg>;
+};
+
+&sai1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_sai1>, <&pinctrl_sai1_mclk>;
+	pinctrl-1 = <&pinctrl_sai1_sleep>, <&pinctrl_sai1_mclk_sleep>;
+	assigned-clocks = <&clks IMX7D_SAI1_ROOT_SRC>,
+			  <&clks IMX7D_SAI1_ROOT_CLK>;
+	assigned-clock-parents = <&clks IMX7D_PLL_AUDIO_POST_DIV>;
+	assigned-clock-rates = <0>, <12288000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+/* BT */
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart3>, <&pinctrl_bt>;
+	assigned-clocks = <&clks IMX7D_UART3_ROOT_SRC>;
+	assigned-clock-parents = <&clks IMX7D_PLL_SYS_MAIN_240M_CLK>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+/* WiFi */
+&usdhc2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz","sleep";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_wlan>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_wlan>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_wlan>;
+	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_wlan_sleep>;
+	keep-power-in-suspend;
+	non-removable;
+	vmmc-supply = <&reg_vmmc_wl>;
+	status = "okay";
+
+	brcmf: wifi@1 {
+		compatible = "brcm,bcm4329-fmac";
+		reg = <1>;
+	};
+};
+
+&iomuxc {
+	/* GPIO Used in User Space init script */
+	pinctrl_bt: btgrp {
+		fsl,pins = <
+			MX7D_PAD_GPIO1_IO14__GPIO1_IO14			0x80000000
+		>;
+	};
+
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX7D_PAD_ECSPI1_MISO__ECSPI1_MISO		0x2
+			MX7D_PAD_ECSPI1_MOSI__ECSPI1_MOSI		0x2
+			MX7D_PAD_ECSPI1_SCLK__ECSPI1_SCLK		0x2
+			MX7D_PAD_ECSPI1_SS0__GPIO4_IO19			0x2
+		>;
+	};
+
+	pinctrl_ecspi1_sleep: ecspi1-sleepgrp {
+		fsl,pins = <
+			MX7D_PAD_ECSPI1_MISO__GPIO4_IO18		0x10
+			MX7D_PAD_ECSPI1_MOSI__GPIO4_IO17		0x10
+			MX7D_PAD_ECSPI1_SCLK__GPIO4_IO16		0x10
+		>;
+	};
+
+	pinctrl_enet1: enet1grp {
+		fsl,pins = <
+			MX7D_PAD_SD2_CD_B__ENET1_MDIO			0x3
+			MX7D_PAD_SD2_WP__ENET1_MDC			0x3
+			MX7D_PAD_ENET1_RGMII_TXC__ENET1_RGMII_TXC	0x1
+			MX7D_PAD_ENET1_RGMII_TD0__ENET1_RGMII_TD0	0x1
+			MX7D_PAD_ENET1_RGMII_TD1__ENET1_RGMII_TD1	0x1
+			MX7D_PAD_ENET1_RGMII_TD2__ENET1_RGMII_TD2	0x1
+			MX7D_PAD_ENET1_RGMII_TD3__ENET1_RGMII_TD3	0x1
+			MX7D_PAD_ENET1_RGMII_TX_CTL__ENET1_RGMII_TX_CTL	0x1
+			MX7D_PAD_ENET1_RGMII_RXC__ENET1_RGMII_RXC	0x1
+			MX7D_PAD_ENET1_RGMII_RD0__ENET1_RGMII_RD0	0x1
+			MX7D_PAD_ENET1_RGMII_RD1__ENET1_RGMII_RD1	0x1
+			MX7D_PAD_ENET1_RGMII_RD2__ENET1_RGMII_RD2	0x1
+			MX7D_PAD_ENET1_RGMII_RD3__ENET1_RGMII_RD3	0x1
+			MX7D_PAD_ENET1_RGMII_RX_CTL__ENET1_RGMII_RX_CTL	0x1
+		>;
+	};
+
+	pinctrl_enet1_rst: enet1rstgrp {
+		fsl,pins = <
+			MX7D_PAD_SD2_RESET_B__GPIO5_IO11		0x59
+		>;
+	};
+
+	pinctrl_enet1_sleep: enet1-sleepgrp {
+		fsl,pins = <
+			MX7D_PAD_SD2_CD_B__GPIO5_IO9			0x10
+			MX7D_PAD_SD2_WP__GPIO5_IO10			0x10
+			MX7D_PAD_ENET1_RGMII_TXC__GPIO7_IO11		0x10
+			MX7D_PAD_ENET1_RGMII_TD0__GPIO7_IO6		0x10
+			MX7D_PAD_ENET1_RGMII_TD1__GPIO7_IO7		0x10
+			MX7D_PAD_ENET1_RGMII_TD2__GPIO7_IO8		0x10
+			MX7D_PAD_ENET1_RGMII_TD3__GPIO7_IO9		0x10
+			MX7D_PAD_ENET1_RGMII_TX_CTL__GPIO7_IO10		0x10
+			MX7D_PAD_ENET1_RGMII_RXC__GPIO7_IO5		0x10
+			MX7D_PAD_ENET1_RGMII_RD0__GPIO7_IO0		0x10
+			MX7D_PAD_ENET1_RGMII_RD1__GPIO7_IO1		0x10
+			MX7D_PAD_ENET1_RGMII_RD2__GPIO7_IO2		0x10
+			MX7D_PAD_ENET1_RGMII_RD3__GPIO7_IO3		0x10
+			MX7D_PAD_ENET1_RGMII_RX_CTL__GPIO7_IO4		0x10
+		>;
+	};
+
+	pinctrl_enet1_rst_sleep: enet1-rstsleepgrp {
+		fsl,pins = <
+			MX7D_PAD_SD2_RESET_B__GPIO5_IO11		0x10
+		>;
+	};
+
+	pinctrl_enet2: enet2grp {
+		fsl,pins = <
+			MX7D_PAD_EPDC_GDSP__ENET2_RGMII_TXC		0x1
+			MX7D_PAD_EPDC_SDCE2__ENET2_RGMII_TD0		0x1
+			MX7D_PAD_EPDC_SDCE3__ENET2_RGMII_TD1		0x1
+			MX7D_PAD_EPDC_GDCLK__ENET2_RGMII_TD2		0x1
+			MX7D_PAD_EPDC_GDOE__ENET2_RGMII_TD3		0x1
+			MX7D_PAD_EPDC_GDRL__ENET2_RGMII_TX_CTL		0x1
+			MX7D_PAD_EPDC_SDCE1__ENET2_RGMII_RXC		0x1
+			MX7D_PAD_EPDC_SDCLK__ENET2_RGMII_RD0		0x1
+			MX7D_PAD_EPDC_SDLE__ENET2_RGMII_RD1		0x1
+			MX7D_PAD_EPDC_SDOE__ENET2_RGMII_RD2		0x1
+			MX7D_PAD_EPDC_SDSHR__ENET2_RGMII_RD3		0x1
+			MX7D_PAD_EPDC_SDCE0__ENET2_RGMII_RX_CTL		0x1
+		>;
+	};
+
+	pinctrl_enet2_rst: enet2rstgrp {
+		fsl,pins = <
+			MX7D_PAD_UART2_TX_DATA__GPIO4_IO3		0x59
+		>;
+	};
+
+	pinctrl_enet2_sleep: enet2-sleepgrp {
+		fsl,pins = <
+			MX7D_PAD_EPDC_GDSP__GPIO2_IO27			0x10
+			MX7D_PAD_EPDC_SDCE2__GPIO2_IO22			0x10
+			MX7D_PAD_EPDC_SDCE3__GPIO2_IO23			0x10
+			MX7D_PAD_EPDC_GDCLK__GPIO2_IO24			0x10
+			MX7D_PAD_EPDC_GDOE__GPIO2_IO25			0x10
+			MX7D_PAD_EPDC_GDRL__GPIO2_IO26			0x10
+			MX7D_PAD_EPDC_SDCE1__GPIO2_IO21			0x10
+			MX7D_PAD_EPDC_SDCLK__GPIO2_IO16			0x10
+			MX7D_PAD_EPDC_SDLE__GPIO2_IO17			0x10
+			MX7D_PAD_EPDC_SDOE__GPIO2_IO18			0x10
+			MX7D_PAD_EPDC_SDSHR__GPIO2_IO19			0x10
+			MX7D_PAD_EPDC_SDCE0__GPIO2_IO20			0x10
+		>;
+	};
+
+	pinctrl_enet2_rst_sleep: enet2-rstsleepgrp {
+		fsl,pins = <
+			MX7D_PAD_UART2_TX_DATA__GPIO4_IO3		0x10
+		>;
+	};
+
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX7D_PAD_I2C1_SDA__I2C1_SDA			0x4000007f
+			MX7D_PAD_I2C1_SCL__I2C1_SCL			0x4000007f
+		>;
+	};
+
+	pinctrl_i2c1_gpio: i2c1gpiogrp {
+		fsl,pins = <
+			MX7D_PAD_I2C1_SDA__GPIO4_IO9			0x4000007f
+			MX7D_PAD_I2C1_SCL__GPIO4_IO8			0x4000007f
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX7D_PAD_I2C2_SDA__I2C2_SDA			0x4000007f
+			MX7D_PAD_I2C2_SCL__I2C2_SCL			0x4000007f
+		>;
+	};
+
+	pinctrl_i2c2_gpio: i2c2gpiogrp {
+		fsl,pins = <
+			MX7D_PAD_I2C2_SDA__GPIO4_IO11			0x4000007f
+			MX7D_PAD_I2C2_SCL__GPIO4_IO10			0x4000007f
+		>;
+	};
+
+	pinctrl_restouch: restouchgrp {
+		fsl,pins = <
+			MX7D_PAD_GPIO1_IO09__GPIO1_IO9			0x59
+		>;
+	};
+
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			MX7D_PAD_ENET1_RX_CLK__SAI1_TX_BCLK		0x1f
+			MX7D_PAD_ENET1_CRS__SAI1_TX_SYNC		0x1f
+			MX7D_PAD_ENET1_COL__SAI1_TX_DATA0		0x30
+			MX7D_PAD_ENET1_TX_CLK__SAI1_RX_DATA0		0x1f
+		>;
+	};
+
+	pinctrl_sai1_sleep: sai1-sleepgrp {
+		fsl,pins = <
+			MX7D_PAD_ENET1_RX_CLK__GPIO7_IO13		0x10
+			MX7D_PAD_ENET1_CRS__GPIO7_IO14			0x10
+			MX7D_PAD_ENET1_COL__GPIO7_IO15			0x10
+			MX7D_PAD_ENET1_TX_CLK__GPIO7_IO12		0x10
+		>;
+	};
+
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX7D_PAD_UART3_TX_DATA__UART3_DCE_TX		0x79
+			MX7D_PAD_UART3_RX_DATA__UART3_DCE_RX		0x79
+			MX7D_PAD_UART3_CTS_B__UART3_DCE_CTS		0x79
+			MX7D_PAD_UART3_RTS_B__UART3_DCE_RTS		0x79
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX7D_PAD_SD2_CMD__SD2_CMD			0x59
+			MX7D_PAD_SD2_CLK__SD2_CLK			0x19
+			MX7D_PAD_SD2_DATA0__SD2_DATA0			0x59
+			MX7D_PAD_SD2_DATA1__SD2_DATA1			0x59
+			MX7D_PAD_SD2_DATA2__SD2_DATA2			0x59
+			MX7D_PAD_SD2_DATA3__SD2_DATA3			0x59
+		>;
+	};
+
+	pinctrl_usdhc2_sleep: usdhc2-sleepgrp {
+		fsl,pins = <
+			MX7D_PAD_SD2_CMD__GPIO5_IO13			0x10
+			MX7D_PAD_SD2_CLK__GPIO5_IO12			0x10
+			MX7D_PAD_SD2_DATA0__GPIO5_IO14			0x10
+			MX7D_PAD_SD2_DATA1__GPIO5_IO15			0x10
+			MX7D_PAD_SD2_DATA2__GPIO5_IO16			0x10
+			MX7D_PAD_SD2_DATA3__GPIO5_IO17			0x10
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX7D_PAD_SD2_CMD__SD2_CMD			0x5a
+			MX7D_PAD_SD2_CLK__SD2_CLK			0x1a
+			MX7D_PAD_SD2_DATA0__SD2_DATA0			0x5a
+			MX7D_PAD_SD2_DATA1__SD2_DATA1			0x5a
+			MX7D_PAD_SD2_DATA2__SD2_DATA2			0x5a
+			MX7D_PAD_SD2_DATA3__SD2_DATA3			0x5a
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX7D_PAD_SD2_CMD__SD2_CMD			0x5b
+			MX7D_PAD_SD2_CLK__SD2_CLK			0x1b
+			MX7D_PAD_SD2_DATA0__SD2_DATA0			0x5b
+			MX7D_PAD_SD2_DATA1__SD2_DATA1			0x5b
+			MX7D_PAD_SD2_DATA2__SD2_DATA2			0x5b
+			MX7D_PAD_SD2_DATA3__SD2_DATA3			0x5b
+		>;
+	};
+};
+
+&iomuxc_lpsr {
+	pinctrl_sai1_mclk: sai1-mclkgrp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO01__SAI1_MCLK		0x1f
+		>;
+	};
+
+	pinctrl_sai1_mclk_sleep: sai1-mclksleepgrp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO01__GPIO1_IO1		0x10
+		>;
+	};
+
+	/* GPIO Used in User Space init script */
+	pinctrl_wlan: wlangrp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO04__GPIO1_IO4		0x09
+		>;
+	};
+
+	pinctrl_wlan_sleep: wlan-sleepgrp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO04__GPIO1_IO4		0x10
+		>;
+	};
+};
-- 
2.47.3

