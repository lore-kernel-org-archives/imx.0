Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378161;
	b=XyeSsTpdSm/LooKkkhm2lVMdIm4cZ7BzPys5/1Rq7ftbcMQjvxN7DUywfkyrj4ibz8ag
	 W5k0jIWCtHkaHX3Cc7JlqOrsu16kixenJlRvcBmHbJmKksFMTRUD6RZChrsc/45L+HwvB
	 FcNyl08nuiD9HtKOa9vJThFqJbc5Bo/VTuhzMwRbJgwPinxBq3T/Tf0/oazJ90TyhBjB2
	 0Ch7CaFs3qk6rIl1pJlAA8VwDRwZ4RS/IuOJ42fh4r4rqrETrWrTiPjnGvXeMHUDVSM+F
	 NtwGteiFBnJEdoBumft8OrOvkRpKK9IhD5JW3xCIymSqWU0nf4LQkHIO4mXYnulJcnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z35yEEi9TZLdCD1HTNmsvOHqwJ3ebC3waffosyNXYts=;
	b=g2gSbG5BO0BLwuRwdafr5e8blG1GfW79oMN2WItQQMH0cLUe7sFSRm0rXeST8XkwEdPj
	 ISpDJbm6uomigmlIlzyPUCtxv8bvX0MApCJ2xVd0akJESQ5osaIvoKrb8SVeBJnq7M408
	 xo5++Gtj1K6lPM/iPerdtwgIZyw+TSZBFZyMAVdTvI6c8sUFHCSZuE9cHrzQncwdhANSh
	 NzUllIpl9ifNPbMQz1qIktAQfA5K64eWmafE2H9kNpEZd2F7t+AkF5fQskCZGJGcdnlAP
	 OZ9JJfDVJESvjc8qyV0SM0+rKm4JuJQS2DYmJO6so260sA/wF/VPP8h2/JSkFLGsykA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=kYwLz48p;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D389606A324
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 16:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D389606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=kYwLz48p
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so9079365e9.1
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 09:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793378159; x=1793982959; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z35yEEi9TZLdCD1HTNmsvOHqwJ3ebC3waffosyNXYts=;
        b=kYwLz48p8V0+J7Ad+x72vBrk7G45tk04AwsHFsxv6OtKXwdp2BoN6WfrDoG/OFihyD
         gxFcS+JW4tRM3NPHqUhq42kBOZzwq1g40YlBG5yRr3Z8+Z2d0Qb3FZ6RMlfKhzcZ9vT6
         zKTvQcfH973iU2Nu7j7G95eW4YNB1DTrQpiBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378159; x=1793982959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z35yEEi9TZLdCD1HTNmsvOHqwJ3ebC3waffosyNXYts=;
        b=Tm2IIuV40S3HpJrc4WBy12FcUjtcyN3RYKnQlx/rxWt8HaQXGTDhkvjFvnGOXuuVsm
         s/LkS99YMzH9cofrjH8i6RnaD0st78ALz8z47BKrMsM/kVnM1cC2O5cS67zKGGEVDzJM
         1jtopYztOMWxr/fvAjQ4OSBYt1b6ZVZZR5OVan69XaWGf6Q0LIUW8SUdC3Es7n3i3vTq
         TUOHEndvVo5S3ZIF+xsQIqREpPr2Y98ZAOnMJ5HnhArHRFJQLCf5Ijpj1lRvJZXH4pz4
         +Thfwla9OiuvaSMJPiSetB5TdPr9wDkaZ1ylXNcbeQbiWwc3Fjlv7eBvigPPvcH6RmLw
         TmVQ==
X-Forwarded-Encrypted: i=1; AKwUvByOiY/lPRgRrL0n859ZeC5xMCnPSXC2n3STWb/jisvqovQRoOZjIq9AOLPozCflcw9DgX4=@lists.linux.dev
X-Gm-Message-State: AFq9FYLHIgtdEdliKr/4SIxfREBF7H2ITKITBVp0JForVsp5HkLrlCkm
	0NQQMdD2ZFhL4PgIu3lTXg9eNejVlduvj+DbI4yJ5IpF9+Q/grr7e20WNy+zVPt06To=
X-Gm-Gg: AYBFou2Z1o0bZn3AnncEkGpTp+wHP3bjzjD/141p00nyKTXK5Z0W7uCofosTejMBucJ
	XqcauadudvhHm7cGUPJz4kHxHV6v7HTEO6tMxFTiyJMhJN2p2Od2/+jxOkDYnEUDs8tzAT9TVhx
	r3sAbRDy8aJT34SsInniBHcTVPvHRNcO76amB719QCJBuzZ2G9f6ws/hkEajmskYUeR+EECxuuy
	flKGBi3hXXmVz4UQt43YucPXHl2z7FymBy/Ar1DlteSOnbfqtZ+tYEiGAZM+22JGMBbyzISbCiK
	OqcHvQPrU0DS4cxBpLQ1nVDguVAX4KBcxU7AX69BvgWplzDa2BXGX1tZWJA4EJXNbAjNR/d90vS
	PO55ha/NSjj53t3DLD0iZq5H0nwzT/YKVOGdrPeElbYWnaR4MB3XWRDyQIHtmFayrXtZE930HfR
	H1yuiuObFXMpoLXp4JqAvtvXzm5phHM0VvoXT0HPByB4vDyNCb8aUQrC8rTRYXX2MC+Iev5scxg
	ghXpFkfpxU9FCtnw3Fcy0jiP9tDoIg9wVue30yM14L5ykGgFHvnRqhV85B3bA3yrc12zjsncIdx
	P0l9HxoTA4I8J92s6I8YVOafdi7BKrdhharNd9RMarhZeV//YzT8Znd4KUPHetYZ2A2hzKAir6L
	EyRyPiUDsUGa5cUBZ8zXw1Tn37Y8sEgoCcP9cUwuB7PwnTpFp4oXBJHsAxngWI1NEHm46ApvM9/
	mlCLZXXOcXyarks0Zzp/U5UekJqQ==
X-Received: by 2002:a05:600c:6095:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4ac18b7e1c1mr61761445e9.23.1793378158975;
        Fri, 30 Oct 2026 09:35:58 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723fcsm4084806f8f.14.2026.10.30.09.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:35:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/5] arm64: dts: freescale: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0 board
Date: Fri, 30 Oct 2026 17:35:43 +0100
Message-ID: <20261030163547.2682583-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
References: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
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

Support Engicam i.Core MX8M Plus Fast Ethernet C.TOUCH 2.0 board with:

 - 10/100 Ethernet
 - CAN
 - RTC
 - USB host, through an on-board hub
 - USB OTG, device only
 - Micro SD card connector
 - LVDS display connector

The C.TOUCH 2.0 carrier board is described in a separate dtsi, so that
it can be shared with the other i.Core MX8M Plus SoMs.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../freescale/imx8mp-icore-mx8mp-ctouch2.dtsi | 166 ++++++++++++++++++
 .../imx8mp-icore-mx8mp-fe-ctouch2.dts         |  17 ++
 3 files changed, 184 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe-ctouch2.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..bf324cdec879 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -655,6 +655,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pulse.dtb
 DTC_FLAGS_imx8mp-hummingboard-ripple := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-ripple.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-edimm2.2.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-fe-ctouch2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-iota2-lumpy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-bl-osm-s.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2.dtsi
new file mode 100644
index 000000000000..5338aeb6ec92
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2.dtsi
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2026 Engicam srl
+ *
+ * Engicam C.TOUCH 2.0 carrier board for i.Core MX8M Plus SoMs.
+ */
+
+/ {
+	aliases {
+		rtc0 = &pcf8563;
+		rtc1 = &snvs_rtc;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm2 0 100000 0>;
+		brightness-levels = <0 100>;
+		num-interpolated-steps = <100>;
+		default-brightness-level = <80>;
+	};
+
+	chosen {
+		stdout-path = &uart2;
+	};
+
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		regulator-name = "VSD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	status = "okay";
+
+	pcf8563: rtc@51 {
+		compatible = "nxp,pcf8563";
+		reg = <0x51>;
+	};
+};
+
+&pwm2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm2>;
+	status = "okay";
+};
+
+/* console */
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	status = "okay";
+};
+
+/* USB OTG, device only */
+&usb3_phy0 {
+	status = "okay";
+};
+
+&usb3_0 {
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+/* USB host, through the on-board hub */
+&usb3_phy1 {
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
+
+&usb_dwc3_1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+/* micro SD */
+&usdhc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	bus-width = <4>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_MCLK__CAN2_RX		0x154
+			MX8MP_IOMUXC_SAI5_RXD3__CAN2_TX		0x154
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL		0x400001c2
+			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA		0x400001c2
+		>;
+	};
+
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO11__PWM2_OUT	0x116
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x40
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	0x40
+			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x40
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d0
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d0
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d0
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d0
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12	0x1c4
+		>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe-ctouch2.dts b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe-ctouch2.dts
new file mode 100644
index 000000000000..c4271cffca9a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe-ctouch2.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2026 Engicam srl
+ */
+
+/dts-v1/;
+
+#include "imx8mp.dtsi"
+#include "imx8mp-icore-mx8mp-fe.dtsi"
+#include "imx8mp-icore-mx8mp-ctouch2.dtsi"
+
+/ {
+	model = "Engicam i.Core MX8M Plus Fast Ethernet C.TOUCH 2.0";
+	compatible = "engicam,icore-mx8mp-fe-ctouch2", "engicam,icore-mx8mp-fe",
+		     "fsl,imx8mp";
+};
-- 
2.43.0

