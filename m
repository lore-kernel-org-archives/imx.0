Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308362;
	b=Hl6RcV4jro78Ol3EXz/ZwdTyI7zC510PMRieqE9GDjFQXxIfeKlAntp8K859kXH93Qy2
	 kO7jKGMOiRjqaSzPdB7a1RoX05udVfURg3r0yktROliDmUhI5a5dlS2noruLQkqug8yUE
	 uP1o3IJ2v0x7tDPYO9GpKAtvN09x04bwBe1cOTFwPWhjzCtqlsirmq5MyKEIrLA19F8Jm
	 TsxKVcDwDwXdegEuu5/FfUQPcIB8wKA7OxiJK/AJ9RBGfxn/YyBtV1G9HVAOP4WYqJtaz
	 wUMa/6EdFaacwRIVo3ALRS452AUZ70fzhqVl1qPyYH91vmtGjHtadL6Y4hEMn2XfqSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DGkDAf1iwgLQ/ySGo4CZw9li+oraQecEr79Tmk1GLfo=;
	b=UUtvYZByi8oYbNawa3g5cFCvt2k+eRHAlXvi+lJRymLH/6rbbFGzPhUWFr41D64a9Tv3
	 5aX335VKSddrOCcX1SeEwGg8vHMl8iOLsgF023bDAC0ws7yCihe6/fyC5qCG7Z7E1wylm
	 WzUgGZ0s/8cJO1ihJL1fRm+VHBwNWsGwmHAEUCE0Dl2FEVAkl5NXBRKOb13/PiawdK2LU
	 CQspTDljkixj/gpBKIPZCDHxpEZQ2aEJZVMnLn4Nw/wGuorECJeBiwOLk1DKjuhQw+BNA
	 38uGLMEu39KyfJzrWRlevQr3B8jCojUWPxNZxN+p4X60HKv7laiU7a4Ee6exOb2UfUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JhNuq7Wn;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B0160A2625
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 10:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25B0160A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JhNuq7Wn
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4910b863b84so1139329f8f.0
        for <imx@lists.linux.dev>; Tue, 10 Nov 2026 02:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308360; x=1794913160; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DGkDAf1iwgLQ/ySGo4CZw9li+oraQecEr79Tmk1GLfo=;
        b=JhNuq7WnjyraeMNEkBc1zVysp7PAeDGOuTovje4BI3Fk7yhU7BcBwBI8pnYE5ZjZ9h
         yUAF+PerrZeUurdNo9KCjaJCWFawAZtENNvN8MlpN31/D3fPvqnayhu9CpdbSnxegJKG
         PNrsBxex+Bac1cNCdoVgZ8b80XvmgSJ/6Z9ofJ+ZINFB8WzJMWFsCBkhtq1ddJvY+mH5
         +OCyVPDsSPyAdu3tg+aL2a6hEaMb2aPHMuH+lF5iI7YZ9HNl1GnpVjUHeyyUqtDj8H3L
         Cryrj6JwUH1VjAH0gxs1cgdg7Num9BuatPIb3zDhQdTBOIpCNhKm2C2ofRKSiqLhxj9J
         kvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308360; x=1794913160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGkDAf1iwgLQ/ySGo4CZw9li+oraQecEr79Tmk1GLfo=;
        b=dIFbidCABOwwd8+d2xU7s0R1T54JpgwLjujNBA10xWQUnktTiRsaKfS2cnIyw9t9iC
         NVIWqgYNrsSnwx4ROP+t7nsTp7qoXZU+CmYswFpLfKSx+cZoVoR9DS62thpChTBgJTqj
         zFzMjw7gbWFozbx6ZeqN0wI5pkwFqahh7YCkaxTN7AIxPf86QUKMv0A+BrEpHo4Xb314
         AXlcDv82x10Iw1s98TBnXkusfNNjqlbpthC3U7fkXn4uXYmCmEAt+iF5z5QaQEH+sKbQ
         BtCGHwlEqdO3EGec5fGma7CPknIQGpBexHlEPUWvFKVj6MQPcbHqHRxj/pDJZHYaSdIE
         SpbA==
X-Forwarded-Encrypted: i=1; AL+hErFEi2sKyYafY6q47ps7/6NO1pqmrjHsTDykH7HeKsAp6Dvec2WrxfWXpjFN49msdn5sNi8=@lists.linux.dev
X-Gm-Message-State: APuU4Z8dOAeQSht+F6v/kKm+Zn0o3E8fHpCwtGVskLG/W4Xu10e78o1G
	FTVBIqhbWrq/rSNs5KQvjvh9EvGcamWe0YRkx2S/dj+f+ESVu2oBatsR
X-Gm-Gg: AYBFou3berqchBeSurY4InlYEtWS0wpbbrNBbeqmVqVIb580C08zP4q8vmL0Q4BG1+4
	fq5lY0wCBlgWVkha2jZjJJBCxcloZBc4TZMqux69xIy4EhNDN18Q/QHGrUG517nEIauTpbYjjp9
	TFfgYj6W+YAu8SyXLq3Bn+Pm4X+3aEVoM7hnTTPIqUOmtHb52n5e+PSljxXkrBul0yA69RzLQ4l
	CIKCRIiMNRaRy+MOw21OdXJFmwO70WvrXu3YUWxVqroCDAq3rGBSwh7aCUlKKCw8NbYCLmiPEjD
	9ubPy+YotkMRCrig1i4ISNdJEpcSO/hEQTadUvRcDNuW8sSf7u70jK5SuNdUHyMRn1LkjhX/ICL
	4o0S55uCgrtZ7LRpoDmVgetZF56ubdIhDcl3jHjSY8joqf3qPV8i8bneH7z1+bE2Rcrnk7hXhPd
	230FD++j0MNxZQOzhIXw2uD/MHRh1J4rKnfAstQchVWvdesANy5A8n66kl0AzSu7sackK23VgmF
	72Bt7F80XxH9TVairaC1fzAvULmedtv6mry3mTYduWkNd71mTfhxntWsy+CFUixOo0rHmCLbdJh
	ICG9XJJSlcdY4EaU/Mednr0Dn2uDT+GjXxSgIjNBNz3fg0R9NvbVwb0VyRCHyQs1paItwczkyG2
	lfDnP6xofsqDsVdSv0VA51GrQmphnko/JbFQJSDS6orVsaALT1Ss=
X-Received: by 2002:a05:6000:24c4:b0:492:b1c5:6db6 with SMTP id ffacd0b85a97d-49835e20e10mr4901092f8f.6.1794308360444;
        Tue, 10 Nov 2026 02:59:20 -0800 (PST)
Received: from [10.0.1.33] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm2933551f8f.20.2026.11.10.02.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:59:20 -0800 (PST)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Tue, 10 Nov 2026 11:59:16 +0100
Subject: [PATCH v2 4/6] ARM: dts: imx6dl-colibri: Add Toradex Capacitive
 Touch Display 7" Parallel with Touch Adapter
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-colibri-imx6-overlays-v2-4-9776c186d953@toradex.com>
References: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
In-Reply-To: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4596;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=I2N4IIgnqZ9lXk9WuHPxr/mHiETXFvJEgNN5qC1ebNs=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj69JP5Qq813zeHH+b/w3uTD+h2SX1dV55ZZfJ774QKK
 9niWMHUjlIWBjEuBlkxRZaMJ6qCfAohsh4czckwc1iZQIYwcHEKwEQenGBkOJ4457apv9T05W2T
 9ANuCrDeOTsl7bXc4+aS7zHpZ8/3MDL8L9itFX4o7Ly6p1/cu+PNDJfa+Q94Ze+eV1BzsGnuHd0
 p7AA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

From: Antoine Gouby <antoine.gouby@toradex.com>

Add a device tree overlay for the Capacitive Touch Display 7" Parallel
on the Colibri iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHC 7" WVGA TFT Transmissive LCD
and the touch input is provided by an Atmel MaxTouch capacitive touch
controller.

The touch controller is connected to the Toradex Capacitive Touch
Adapter, the connection to the various carrier boards is documented in
the datasheet [1].

The touch interrupt and reset signals on SODIMM 28 and SODIMM 30 share
their pads with the Colibri PWM<B> and PWM<C> outputs, disable PWM1 and
PWM4 to avoid the pin conflict.

The overlay is also combined with the Colibri iMX6 V1.2 Evaluation
Board v3 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
Link: https://developer.toradex.com/hardware/accessories/add-ons/capacitive-touch-adapter/
Link: https://docs.toradex.com/104615-capacitive-touch-adapter-datasheet.pdf [1]
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 |  6 +++
 ...nel-cap-touch-7inch-parallel-touch-adapter.dtso | 57 ++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 7f527e2b9090..02d21d62b370 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -88,6 +88,10 @@ imx6dl-colibri-v1.2-eval-v3-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx-hdmi.dtbo
 
+imx6dl-colibri-v1.2-eval-v3-tdx-panel-cap-touch-7inch-parallel-touch-adapter-dtbs := \
+	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtbo
+
 imx6dl-colibri-v1.2-iris-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx-hdmi.dtbo
@@ -141,11 +145,13 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-iris-v2.dtb \
 	imx6dl-colibri-iris-v2-hdmi.dtb \
 	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtbo \
+	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtbo \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-v1.2-aster-hdmi.dtb \
 	imx6dl-colibri-v1.2-aster-tdx-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
+	imx6dl-colibri-v1.2-eval-v3-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-v1.2-iris-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtso
new file mode 100644
index 000000000000..ffc54438d33b
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtso
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display connector and Toradex Capacitive Touch Adapter.
+ *
+ * Toradex Capacitive Touch Adapter connection with the various carrier boards
+ * is documented in the datasheet [1].
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
+ * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-parallel
+ * https://developer.toradex.com/hardware/accessories/add-ons/capacitive-touch-adapter/
+ * https://docs.toradex.com/104615-capacitive-touch-adapter-datasheet.pdf [1]
+ * https://www.toradex.com/accessories/capacitive-touch-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&atmel_mxt_ts {
+	pinctrl-0 = <&pinctrl_atmel_adap>;
+	/* Colibri SODIMM 28 - TOUCH_INT# */
+	interrupt-parent = <&gpio1>;
+	interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
+	/* Colibri SODIMM 30 - TOUCH_RST# */
+	reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&backlight {
+	status = "okay";
+};
+
+&lcd_display {
+	status = "okay";
+};
+
+&panel_dpi {
+	compatible = "logictechno,lt161010-2nhc";
+	power-supply = <&reg_module_3v3>;
+
+	status = "okay";
+};
+
+&pwm1 {
+	status = "disabled";
+};
+
+&pwm4 {
+	status = "disabled";
+};

-- 
2.55.0

