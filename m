Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF05A48B38F
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 12:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315302; cv=none; b=GwbMdCAM8TLXujA+SQ4G8ux51jqjqD4bsh37HoWTUInWf/eoAJFG7una2lCvHx8SU7Y5P78ON/reLf5zhVtaBS1JQf3deibykDPL5NJTs472iX5yLD03UREGAFLTa4KOlcafPJ7pvxDa8IxJ8ac+LPRo8FX3bvpJPl+MPVfQim8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315302; c=relaxed/simple;
	bh=w1MriAcdQD7w1o/GvImxskVFrATjbDoFiQ4yUcTI6vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eenXB5PgYCeuR3d+XZBc+LB4tuJAJQlRiJaOpinebNkDMWQ4F+qpe5kSkyw3aUlMmftOlCKpOMbZXXavP9xc2iO+rWTvfCpFpwyuFBlyPddLXFWXvdiqASQJtziqGOzlwXl6KKZTBESs4gRQkZLMHYSYbb1fb9AzQV0Xfrk5Cgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKSbTPMj; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKSbTPMj"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a28cbdso1829449a12.3
        for <imx@lists.linux.dev>; Fri, 21 Aug 2026 05:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315293; x=1787920093; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0sHAFFcr10joBu/opX/m3sI5SEwtl3K5J3ExhEwCccM=;
        b=mKSbTPMjX0YQM/duiRojV9uOxQ3xC69VuktS+WW+UwuZa6W1RZfaXz3YCus5sTbe5S
         PWmito1ebQUup7+G1HnHVszkYTJkUPsKHA2YN7FKI31qkOIBzYLnrtaeIjkOJ77xngsx
         N+8b1vq64dDUSnNjkMrSTGKmhQFikh8VQ/MCJOVlHVhTx56WO7bmMc4ylv0gxmkFMmX7
         HO+fPx1Z+nXedfQjU+DU5ynjo6navvXItgoWGQCpCuPojgDRL6kXg5troORmgvw0MryY
         HAlx5ACRcIQ4p2tD2lqJAOXyw5huz/WsxJkJaNMlqwp7n4akeeevjH30GVbWa9yRPmVS
         afJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315293; x=1787920093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0sHAFFcr10joBu/opX/m3sI5SEwtl3K5J3ExhEwCccM=;
        b=JzNTGvXGc2Jy3oc6QxktraUMPNBAbEw4LLb8MGiLx+9AjRWcuuLc4oJWnddSEnOmrO
         lNfuYj0x+fNfYMPvv3yNkXMGZGdZn36OMa3S0kqOFkcwz8Y2AZ8txHWSVk9F0bmPmcZb
         Dd85h1FGpGcRR8BYYRLPcgEcHr1rk5lX5qMhu40Lx6y8ya1OdDenimZgZBWtqs1n4alI
         hZ/Eg1KfAZxTbJlYQ5Guv+X/+f+1wtlR4eTfGEqJP2Pwtn3CUS6SOh1w/5qHRHQKqiLs
         5AMWQ/ZryB1nM4BJ3iLzgHDdn5247YcEvQcpheGFXJNn0GGlfh+IuvJaw29Blh06xlG4
         jkmA==
X-Forwarded-Encrypted: i=1; AHgh+RpkD2/wzzgG00wfWhXZQcKdJskeoD/oTkjIBcIoJTsYP8vv5csfVgzu3/qfPXzk/SlVMcE=@lists.linux.dev
X-Gm-Message-State: AFuF++nnXybMwqcU6NvYa5Jaf57j+NvBpaUPWAE3I2EII9VJTS+itGSC
	mb4bqzEtnKG4NvHcpeRWAMcNmniYQvA5gwJeM/Kdcc9+qyl6RPXmdcgg
X-Gm-Gg: AR+sD13TU41+stqa487td+JMo1GEzhCabtYO0BEhDpOmkzjFRA+RvQN90f8ld+GcmFX
	f06hoHZAV+27KynVg8xYzd3gAQdH+2aPgvHY9YE+xQ3BPyHEm3zbrl3zXdiwHoisRM+wrUtX0qK
	jH+chceEwlo+ad6EVLULkTvZqf3+imiclYt992vH/zR89Sm07lFCWhSqiNWkNDu6fZ1XG3WE7fh
	Lsyk70E83j4kQoSZwLxcC8UMcHvOngGQ3sGrHO+L04iQwa0d6lgHYPMgcg/KkIGZw3HZ2z67SmV
	RRePHtu0diBxJGhkagTqjPU53Efjvi+AUWmAhUh4osvGtWs8a65utXpglP3robljV4lfWBb23oL
	c8uepuaJmLVm0SPXVUMY/ZWSvi40ay3b469oF5t36rrTMhGfymHpS+UfX7lWAiAqjpYAYDtl5hT
	KgJlLilsxAUaomAOhhi8LKQ7DFjVPY6Xu1aspLqQgp4nkUsPUxK9mht2H0EYE5PJNxg/XXxVTM5
	UbQa5seouAvmZVDugqTbOxi4rz1j6lpM4ZqeOF+ey1Pen6k4BobJqRsVA==
X-Received: by 2002:a05:6402:13cf:b0:6a0:6978:bee0 with SMTP id 4fb4d7f45d1cf-6a42f219adcmr6525183a12.9.1787315293130;
        Fri, 21 Aug 2026 05:28:13 -0700 (PDT)
Received: from GLaDOS.station (mob-5-90-140-38.net.vodafone.it. [5.90.140.38])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3feec9c9dsm6608874a12.4.2026.08.21.05.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:28:11 -0700 (PDT)
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
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: [PATCH v1 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
Date: Fri, 21 Aug 2026 14:27:51 +0200
Message-ID: <d709664186f2a85b6c3173b5e5a8a297464fd7f7.1787314780.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787314780.git.stefano.r@variscite.com>
References: <cover.1787314780.git.stefano.r@variscite.com>
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
 .../boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi  |  99 +++
 .../nxp/imx/imx7d-var-som-mx7customboard.dtsi | 378 +++++++++++
 .../boot/dts/nxp/imx/imx7d-var-som-nand.dtsi  |  73 ++
 .../boot/dts/nxp/imx/imx7d-var-som-v2.dtsi    |  64 ++
 .../dts/nxp/imx/imx7d-var-som-wm8731.dtsi     |  65 ++
 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi  | 633 ++++++++++++++++++
 6 files changed, 1312 insertions(+)
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
index 000000000000..82814535fb93
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
@@ -0,0 +1,378 @@
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
+			gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	reg_hsic_hub_connect: regulator_hsic_hub_connect {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_hsic_hub_connect>;
+		regulator-name = "reg_hsic_hub_connect";
+		gpio = <&gpio1 12 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	reg_hsic_hub_pwr_on: regulator_hsic_hub_pwr_on {
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
+		interrupts = <30 0>;
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
+	reset-gpio = <&gpio2 31 GPIO_ACTIVE_LOW>;
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
+	vbus-supply = <&reg_hsic_hub_pwr_on>;
+	status = "okay";
+};
+
+&usbotg1 {
+	vbus-supply = <&reg_usb_otg1_vbus>;
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usbotg2 {
+	vbus-supply = <&reg_usb_otg2_vbus>;
+	dr_mode = "host";
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
+	pinctrl_gpio_keys: gpio_keysgrp {
+		fsl,pins = <
+			MX7D_PAD_EPDC_BDR0__GPIO2_IO28		0x32
+			MX7D_PAD_EPDC_BDR1__GPIO2_IO29		0x32
+			MX7D_PAD_GPIO1_IO11__GPIO1_IO11		0x32
+		>;
+	};
+
+	pinctrl_gpio_leds: gpio_ledsgrp {
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
+	pinctrl_uart1_sleep: uart1sleep_grp {
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
+	pinctrl_usdhc1_gpio: usdhc1_gpiogrp {
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
index 000000000000..724aa6fb36de
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2.dtsi
@@ -0,0 +1,64 @@
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
+	mmc-pwrseq = <&wifi_pwrseq>;
+	/delete-node/ bcrmf@1;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
new file mode 100644
index 000000000000..5fab164a6482
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
+	wm8731: wm8731@1a {
+		compatible = "wlf,wm8731";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&vgen6_reg>;
+		DBVDD-supply = <&vgen6_reg>;
+		DCVDD-supply = <&vgen6_reg>;
+		HPVDD-supply = <&vgen6_reg>;
+		clocks = <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>;
+		clock-names = "mclk";
+	};
+};
+
+&sai1 {
+	assigned-clock-rates = <0>, <36864000>;
+	assigned-clocks = <&clks IMX7D_AUDIO_MCLK_ROOT_SRC>,
+			  <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>;
+	assigned-clock-parents = <&clks IMX7D_PLL_AUDIO_POST_DIV>;
+	assigned-clock-rates = <0>, <12288000>;
+	/delete-property/ fsl,sai-mclk-direction-output;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi
new file mode 100644
index 000000000000..cbd6252bd18f
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi
@@ -0,0 +1,633 @@
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
+/dts-v1/;
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
+	ads7846_ts: ads7846@0 {
+		reg = <0>;
+		compatible = "ti,ads7846";
+		pinctrl-names ="default";
+		pinctrl-0 = <&pinctrl_restouch>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <9 0>;
+		spi-max-frequency = <1500000>;
+		pendown-gpio = <&gpio1 9 0>;
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
+	pinctrl-0 = <&pinctrl_enet1>, <&pinctrl_enet1_rst>;
+	pinctrl-1 = <&pinctrl_enet1_sleep>, <&pinctrl_enet1_rst_sleep>;
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
+	pinctrl-0 = <&pinctrl_enet2>, <&pinctrl_enet2_rst>;
+	pinctrl-1 = <&pinctrl_enet2_sleep>, <&pinctrl_enet2_rst_sleep>;
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

