Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DDD4DC557
	for <imx@lists.linux.dev>; Mon, 19 Oct 2026 10:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405252; cv=none; b=IRbq3Knm0oBGDnmLSgebxsslFYKnHSUUhgn81fgJ5NpSRGIhXkqwV5PAoXA0MfUKbhQXTQ0DjQuvv/jFQhDgxjk6MwtobVZ2eM3ZZx5+xg2WOb2J4HX4OZN8ujXEpqjJQkZj8lnsoyUHFRzfqxy4NI++2Jv5mtdx03G2Df/3+gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405252; c=relaxed/simple;
	bh=x44fXUGB1hEoqTJKZxN5NuqcekOM+6AMF+EnFq/Ok/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oCif8xt3OPtaoNj72/n61H+jxcG5Ri+tbt5jw+GhIHZb3LCp7cbTE4+tzViGqqRareXUglppgnh+I9GVfFV2WztKuyZPUFnSHFXH809LZaEQQB844Nh7Bg+ChdLfQhsBG6k7S/ltL0ANuD/5JSx6zJbCp9TS/guOoOQJzWJCclQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCgCn16s; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCgCn16s"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15ea896ddc8so2287239c88.0
        for <imx@lists.linux.dev>; Mon, 19 Oct 2026 03:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405250; x=1793010050; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgK4Knz1UTecYHn0SL3JT3fee9wk3Cp4TEKus9TadaQ=;
        b=fCgCn16sh6sWRNlr8T1kOYjfeu6RYeClVgUZzH19csuBU197ovTjtacbJwp0sdM3EH
         MUGtleP7ZNVEzfYQ5XI5mWThIJEi5JaieZVsiyk/VeIfmMiBg9g0BxmkfQUzkQgm9bHL
         A7ti+c+0hz5R3yigYStmCRO4Lc5wCOKYkfA7yGJ8ggiWFacRaQmd//vTEB6VfFQWB+np
         hNRch7w3o/6ywE0vOAKHGZcyTf0SCxDRsa7Tl1yNn46k8X5kE9bddqIvV7Kt0ggtO265
         H4FHWqN4FXacPFdiUXlbuzjcnP5A3FdhUGhyBPR8y162yiohe59Q8c9r9LE5dJzO6Fes
         l/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405250; x=1793010050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgK4Knz1UTecYHn0SL3JT3fee9wk3Cp4TEKus9TadaQ=;
        b=TV1/dLLZa3fRUj0zg2/4qisKAEiUieXVjVZtgSrTRdptCDAWYtLNhUZtyKy31zehA3
         7DvruWyt/LjH0Dz9YL/sKTdP7Gm7/eNheffLJgs/3T92ciiPXGyYNhjLLEjnNp4dOqXf
         lkrNCKpEoqQlydOUAGUgZ4vpBh/gpqOvZc1OoPG6rS0+NG52A8yLgh3KKDibHxxzLv6H
         xDAzjjkTXjydl9NTFwZtP22dkUF6Mdh27mhAPclV9HKjMHOjuRIux8EKf1fJ284jOr+o
         l8aYD3PmA1PIKdc4tScNlEDDJ2s30GlQP3zMelTSW07lCIoiWYexGVTTlvarxntGE26v
         2Wqw==
X-Forwarded-Encrypted: i=1; AKwUvBzkKlE4qP6uK6Ii6cFSe/dJGJmxeFcWgbO5Qqu9fiSYkEMtL2bnVNDvGUjO6xA0VQIY77U=@lists.linux.dev
X-Gm-Message-State: AFq9FYLng6JEs3Ectarxq3MAeEnHSWg/jz/scGQr262IXHNV64KYkXxR
	/2Szw84EYChy9YMt9jIdHTGaWVjlf/e2Ep6gXSJKFv9wR0tKYwiVZbmM
X-Gm-Gg: AYBFou1dEpb6yalDSDMA1HplIJpLmbJm0GxtLumVcXgtnxdnqXXk+Ore7wPnY5YTR6g
	mrxpCp3KoVGFXehD90UGftIM4SjbViZbO6+EQ/B+wsNL8jE3JC4WUy3qQ6GlwrVcjKWTwWstyM+
	0K2xW4FMhjaK41+bniMz3qi6t/3YKfQnn2nidHnEySzzN3HNt028dtVfMF4ZfTGGudF2EH7wX3G
	ePO+LjpAQMaZYOPo+vQPS916cpxpJF+NlaxmhJGKv4vdoneWaLjkISvXaPzvQZo5ZyAPhIHjajD
	r0T1Q1BjS5nB4YQXx6vaoTjQrob2fBRuk0pro815UeyHJqWEjeAh7t4JK/stYa4V/V3i4+Fp82V
	TYEgJedHdWTebtfVl/EIQOAq0zeyPMtNcutjMmMcOHLIcBe7IJYcNnj9PlPS97sVOsJLxxo3/1I
	144srdagqARnTIHYgb+AZ2jJpqk4zA8W0RtO7ETVkhrcjdu2mThlckPcOdYFp6T9KJE2UvYoGad
	Ls=
X-Received: by 2002:a05:7022:ea9c:b0:149:49c:233 with SMTP id a92af1059eb24-185138b5a78mr9592984c88.27.1792405249689;
        Mon, 19 Oct 2026 03:20:49 -0700 (PDT)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18319d3b880sm26324251c88.10.2026.10.19.03.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:20:47 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Mon, 19 Oct 2026 07:17:16 -0300
Subject: [PATCH v2 3/3] ARM: dts: imx6q-apalis: Add VGA overlay
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-v2-apalis-imx6-enable-vga-v2-3-ef6a3a780472@toradex.com>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
In-Reply-To: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792405217; l=4062;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=r+aca+myZbkHcW0Bz/oaFLZH6+eopUpkEgtw7VP1FW4=;
 b=Zvh0iDVRcy5Gtps1SXd63pWalIOszDSoQM1rurde5ryRdO6K2rMFmCqUHSbRjy9tbneq4/t3j
 sSjRGYh4TiPDpQo5LJT494T+Ww6uL06s9RSdMfWvljaiQEMcGs5xrW/
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the VGA output available on the Apalis
Evaluation Board, which is driven from a parallel RGB interface passing
through a non-programmable video DAC to a VGA connector, without VESA
DDC I2C signals.

The non-programmable video DAC consists of a simple resistor ladder that
converts the digital 16-bit RGB signal to VGA. The VGA output is gated by
an active-low data-enable signal.

The overlay is also combined with the various Apalis Evaluation Board
device trees to provide ready-to-use DTBs.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 | 21 ++++++
 .../boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso    | 80 ++++++++++++++++++++++
 2 files changed, 101 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index b5fad2ba764c..9c218260fdcb 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -60,6 +60,22 @@ dtb-$(CONFIG_SOC_IMX53) += \
 imx53-qsb-hdmi-dtbs := imx53-qsb.dtb imx53-qsb-hdmi.dtbo
 imx53-qsrb-hdmi-dtbs := imx53-qsrb.dtb imx53-qsb-hdmi.dtbo
 
+imx6q-apalis-eval-v1.2-vga-dtbs := \
+	imx6q-apalis-eval-v1.2.dtb \
+	imx6q-apalis-eval-vga.dtbo
+
+imx6q-apalis-eval-vga-dtbs := \
+	imx6q-apalis-eval.dtb \
+	imx6q-apalis-eval-vga.dtbo
+
+imx6q-apalis-v1.2-eval-v1.2-vga-dtbs := \
+	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-eval-vga.dtbo
+
+imx6q-apalis-v1.2-eval-vga-dtbs := \
+	imx6q-apalis-v1.2-eval.dtb \
+	imx6q-apalis-eval-vga.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -186,11 +202,16 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-yapp4-ursa.dtb \
 	imx6q-apalis-eval.dtb \
 	imx6q-apalis-eval-v1.2.dtb \
+	imx6q-apalis-eval-v1.2-vga.dtb \
+	imx6q-apalis-eval-vga.dtb \
+	imx6q-apalis-eval-vga.dtbo \
 	imx6q-apalis-ixora.dtb \
 	imx6q-apalis-ixora-v1.1.dtb \
 	imx6q-apalis-ixora-v1.2.dtb \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-v1.2-eval-v1.2-vga.dtb \
+	imx6q-apalis-v1.2-eval-vga.dtb \
 	imx6q-apalis-v1.2-ixora.dtb \
 	imx6q-apalis-v1.2-ixora-v1.1.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso
new file mode 100644
index 000000000000..991c2b7c2777
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * VGA output connected to a parallel RGB LCD interface through a
+ * non-programmable video DAC with a VGA connector.
+ *
+ * The VGA output is available on the Apalis Evaluation Board without VESA DDC
+ * I2C signals.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	disp1 {
+		compatible = "fsl,imx-parallel-display";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ipu2_vdac>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interface-pix-fmt = "rgb565";
+
+		port@0 {
+			reg = <0>;
+
+			vga_display_in: endpoint {
+				remote-endpoint = <&ipu2_di0_disp0>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			vga_display_out: endpoint {
+				remote-endpoint = <&vga_enc_in>;
+			};
+		};
+	};
+
+	vga-encoder {
+		compatible = "dumb-vga-dac";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				vga_enc_in: endpoint {
+					data-enable-active = <0>;
+					remote-endpoint = <&vga_display_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				vga_enc_out: endpoint {
+					remote-endpoint = <&vga_connector_in>;
+				};
+			};
+		};
+	};
+
+	vga-connector {
+		compatible = "vga-connector";
+
+		port {
+			vga_connector_in: endpoint {
+				remote-endpoint = <&vga_enc_out>;
+			};
+		};
+	};
+};
+
+&ipu2_di0_disp0 {
+	remote-endpoint = <&vga_display_in>;
+};

-- 
2.43.0

