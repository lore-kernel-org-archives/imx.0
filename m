Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B75D4D9F6C
	for <imx@lists.linux.dev>; Mon, 19 Oct 2026 11:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408732; cv=none; b=GqYp42Uq+geBNY6q+leE7Z7qMG03G4RRBRBJiTxiEk0R1vmxQt38UyktX/xjxX2ddddAgGXjN5wcrQWxZiOaS41tWiR+mYfJKgDghgLbg9cC4qkI4IdIMXBbizPeFjf+kuB18z8iE+3GElJAo+SVYtoxGQfOpiXcJUBfhXag6UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408732; c=relaxed/simple;
	bh=MRLTvOh3aU4FGCN6NR5yVezDJmixMfW4yI8Zi3Belf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=STtXUFV4piDrXxeWP5ByMxMi6Z3mGMc/YILOCDIP9OVtz07hLI7eJljR+/DQOKhnDQt2gM3gFIG/f/mTTVBo3xZ9SzrhPEw3zSQ9nRAISQSygFYXHZfYL/ETKKfVJjX0O/kVuplMg6dNr2fxrzxfgG1VRO+2XQRAxlIfFd8YaAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZvwRU4n+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZvwRU4n+"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so7212995e9.1
        for <imx@lists.linux.dev>; Mon, 19 Oct 2026 04:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792408727; x=1793013527; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAuGbpbYIgMLYkQDiOfgLoi1DhXaRQoxjNR6h+bBZU0=;
        b=ZvwRU4n+QbXLPlQG8MEWwwx/cBfGAUj28lGm5+XYnqP1WGI0O0tUzJoh84kJu8TYvg
         TB9eT6vKQ5veXZhvXGe5AVoUbMWpD+t4Wav9mH1/r8sv7KDydx+jGwBUFLEN0jBXISPY
         mXB1RHfBdPlONRcGUnCnpP6ClN853M0Fk1DBOLYb2hNL6KWE9HpfAEzqWV4+Kx+Fv8mf
         XMauy2KPfZzMdr+Iui0fkjFH0BMTcgbd64OYyf7JA7QgHeMG1I8ZAizYrUJceoCTGBa0
         gTbQDBC0NR4WtAZ1JTTD5VxiSWG8JRXSDbyRo9SUel0BNWAzeqgO4t1nPmCvRBdcs5c4
         4C/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408727; x=1793013527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pAuGbpbYIgMLYkQDiOfgLoi1DhXaRQoxjNR6h+bBZU0=;
        b=ZFwn6Y2g4y0qkzGUNZLVRZmFaTrHAjx4yzCZ1DvHtEunFLAZVZnGN/NzrZrGrC+35F
         6Xu4wHYRvwafVxAnYmUCdYu4FUeSd85/6fVD0elgoBYZZPXIktLDF6dZoAHZZL1Zv+Qg
         /ON0KpATe0GyHb74JSWbirBm//ezIHdiTXUDA6/chTo8HITyCI/WdmGBQmVO8aETIkKT
         J7C2dwAnyv2PaxEHXiOnwbYsu3InKECzwRSShFVsTgJbLu9TVlrWrPOHZtiyUeWye5ES
         /172wWHfTlsa1iIAbEsJAf0Flqjf1aNg2m6CuOU/ZMW5+OzH8CfMfOLR1ckGJ60r1TFz
         j9Mg==
X-Forwarded-Encrypted: i=1; AKwUvBxXZ19CsXsiB+QOjrBsTJxbpCofCMrxg+6P1/tl0xbCPJLtxgM4H3d12H6cRCERKhYQlPc=@lists.linux.dev
X-Gm-Message-State: AFq9FYL90WNxNz9krufb2ztrHk7DlwiY1iya/tmFUTYVIvR3kB3EDkqu
	F6bB6IEA00tyoQQemtIcsg/OPuanh0GgptCMMTD2zB/56tSmSzaaYZpv
X-Gm-Gg: AYBFou2Jvih0KhwQO0g1sGdHDZB8nr9zntce3uG4Y3KSRsbY64KgJ0U9MIDfOHY1+yi
	1kndlIRVniMQ2iLfXTFfcYtateCFsy1NrA/rLKCkTEQB/rMTeBFR+oTI0RO7f8y3cRU1nytyPp2
	+TQnqdLCTqRY1rltV51S80gn4HmeJifl7oLYiemAGg7kR4mC4wOlxiSqBsaaP9tWeWTwx7TM78l
	BXd8f8T4CXNlGA53Nu9A9/DsSgXgLBbIG/dvleECeyMNvI5H4P3zCsyzMa1aFDCa8tGje9QE0iI
	pUXNARA9aT6fs/bqiwhjnzqf8rlkCWfinj1kc6Evvleaj0Aan14pMs7MGMsMXnXZ75rKpk7UC+W
	BXOKJbeS4Z9aOpyzxQrTVV+pObXlhrmWhyOUWYuC0ny6EbRmkw6qyMcX3hlJzuZy5Uw/Y7dPDDY
	b46qZL9bIwTSo2DxL5nGFtORMB51KmsH+DW7qn4eG9FBdMiQWsWtUzj2zfRwSjdBvGjJ1MvnksX
	IjEmpa+Pi/sicsiDP8S4ia6kvezNBPVoGB7IXWaFeHHsT26jI9V7cLA9vY7xABEk1K2LGOdFuPx
	hSg1QmzikuqGEp55kFl7Frs38kTW7nIs
X-Received: by 2002:a05:600c:8883:b0:4a1:80d8:aed0 with SMTP id 5b1f17b1804b1-4a1d75fe793mr119911565e9.15.1792408726899;
        Mon, 19 Oct 2026 04:18:46 -0700 (PDT)
Received: from [10.0.0.136] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e3ebb3aasm193183505e9.0.2026.10.19.04.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:18:45 -0700 (PDT)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Mon, 19 Oct 2026 13:18:34 +0200
Subject: [PATCH 5/5] ARM: dts: imx6dl-colibri: Add VGA overlay
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-colibri-imx6-overlays-v1-5-e4d028727382@toradex.com>
References: <20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com>
In-Reply-To: <20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4928;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=rV4clumIvWpWiwOoIzG+2Vz7clpxc4eRzzo4Zecgm0w=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsi6+qf/+ASOA7KLGI0Sl+RfY77752CpqZbW1ZVrq9wvJ
 3kF9zW2d5SyMIhxMciKKbJkPFEV5FMIkfXgaE6GmcPKBDKEgYtTACYyR56R4bZtUbmP2NJL336z
 Gx29MdP83MySSVlKgtWTxI/Y6wZOms7I0GW5/a3el2tSyTHfSqpczIW/cHofVb0QxnUiMi/g1QZ
 xJgA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

From: Antoine Gouby <antoine.gouby@toradex.com>

Add a device tree overlay for the VGA output on the Colibri iMX6
parallel RGB LCD interface. The VGA output is driven through a
non-programmable video DAC without VESA DDC I2C signals to a DVI
connector. The DAC power-save input is driven by the BL_ON signal on
SODIMM 71, like on the Colibri iMX6ULL and Colibri iMX7.

The overlay is also combined with the Colibri iMX6 V1.2 Aster,
Evaluation Board v3, Iris and Iris v2 carrier board device trees to
provide ready-to-use DTBs.

Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                | 21 +++++++
 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-vga.dtso | 67 +++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 1ea51b13ab7c..11fcef5195c8 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -84,6 +84,10 @@ imx6dl-colibri-v1.2-aster-panel-cap-touch-7inch-parallel-dtbs := \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-panel-cap-touch-7inch-parallel.dtbo
 
+imx6dl-colibri-v1.2-aster-vga-dtbs := \
+	imx6dl-colibri-v1.2-aster.dtb \
+	imx6dl-colibri-vga.dtbo
+
 imx6dl-colibri-v1.2-eval-v3-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-hdmi.dtbo
@@ -96,10 +100,18 @@ imx6dl-colibri-v1.2-eval-v3-panel-res-touch-7inch-parallel-dtbs := \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-panel-res-touch-7inch-parallel.dtbo
 
+imx6dl-colibri-v1.2-eval-v3-vga-dtbs := \
+	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-vga.dtbo
+
 imx6dl-colibri-v1.2-iris-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-hdmi.dtbo
 
+imx6dl-colibri-v1.2-iris-vga-dtbs := \
+	imx6dl-colibri-v1.2-iris.dtb \
+	imx6dl-colibri-vga.dtbo
+
 imx6dl-colibri-v1.2-iris-v2-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-hdmi.dtbo
@@ -108,6 +120,10 @@ imx6dl-colibri-v1.2-iris-v2-panel-cap-touch-7inch-parallel-dtbs := \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-panel-cap-touch-7inch-parallel.dtbo
 
+imx6dl-colibri-v1.2-iris-v2-vga-dtbs := \
+	imx6dl-colibri-v1.2-iris-v2.dtb \
+	imx6dl-colibri-vga.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -154,15 +170,20 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-v1.2-aster-hdmi.dtb \
 	imx6dl-colibri-v1.2-aster-panel-cap-touch-7inch-parallel.dtb \
+	imx6dl-colibri-v1.2-aster-vga.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
 	imx6dl-colibri-v1.2-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
 	imx6dl-colibri-v1.2-eval-v3-panel-res-touch-7inch-parallel.dtb \
+	imx6dl-colibri-v1.2-eval-v3-vga.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-v1.2-iris-hdmi.dtb \
+	imx6dl-colibri-v1.2-iris-vga.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-v1.2-iris-v2-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2-panel-cap-touch-7inch-parallel.dtb \
+	imx6dl-colibri-v1.2-iris-v2-vga.dtb \
+	imx6dl-colibri-vga.dtbo \
 	imx6dl-cubox-i.dtb \
 	imx6dl-cubox-i-emmc-som-v15.dtb \
 	imx6dl-cubox-i-som-v15.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-vga.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-vga.dtso
new file mode 100644
index 000000000000..f22f1969a6a8
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-vga.dtso
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * VGA output connected to the Colibri parallel RGB LCD interface through a
+ * non-programmable video DAC with a DVI connector.
+ *
+ * The VGA output is available on multiple carrier boards (including Iris,
+ * Eval, Aster) without VESA DDC I2C signals.
+ *
+ * The DAC power-save input is driven by the BL_ON signal on SODIMM 71.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	vga-encoder {
+		compatible = "dumb-vga-dac";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_bl_on>;
+		/* Colibri SODIMM 71 - BL_ON */
+		enable-gpios = <&gpio3 26 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				vga_enc_in: endpoint {
+					remote-endpoint = <&lcd_display_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				vga_enc_out: endpoint {
+					remote-endpoint = <&dvi_connector_in>;
+				};
+			};
+		};
+	};
+
+	dvi-connector {
+		compatible = "dvi-connector";
+		analog;
+
+		port {
+			dvi_connector_in: endpoint {
+				remote-endpoint = <&vga_enc_out>;
+			};
+		};
+	};
+};
+
+&lcd_display {
+	status = "okay";
+};
+
+&lcd_display_out {
+	remote-endpoint = <&vga_enc_in>;
+};

-- 
2.55.0

