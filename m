Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3327F44781B
	for <imx@lists.linux.dev>; Mon, 12 Oct 2026 07:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789949; cv=none; b=qWvKxhsa2NC2KJImx0qBxkTZLdgQd0Y2L6z4pxp3HL0KzoUz8eZqnVCSAAIICl0ncsubW98I4ULz8F0tjb5s2Pi6j7huDVYtCibLw8NSYvRjUMMnBNe5XWBBYQ0cujZ79s6ENdU11bEvVfV+FU1LffAd/KPkBjQis85XPALldvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789949; c=relaxed/simple;
	bh=mvjdRzEphXMCTb3g7xXVWiYmQKB3zaxOriOJUT54Q2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G1zIIJd7SgrNGa2dQ3caY9iMUQ9enK85pMy0QrkgrzVfAqLZ/3ClX75jfNHmc4GkROO5MyGnKmCTDbGya/25MwDXMFTkm6SchJYMPHnfELybPsrYOFK45W8E3f8rXVmAA0x2inO97HlP6gcK+04aFQH7pT2F8oW204woKNrWFmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6I0KaW0; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6I0KaW0"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b001cd92bso860016f8f.2
        for <imx@lists.linux.dev>; Mon, 12 Oct 2026 00:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791789946; x=1792394746; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVFgubLFwSlRx0dc28Lupwth5R3tDS9aeaXU7vAsa6I=;
        b=a6I0KaW0cQnVR07sZbICURmZIH820JtsdPjwGYDk6YVmCYqkmFiEwMPIDafoeStmbM
         ZqKUeG11+p9lcQ1jxvvlgqLM7+0lWeHxH+6wURG99riSl7HgPARsORn0SlKO5qUR+hWt
         0RtWAM+XIhnLNiEHmHiAZzCe8J1KoRIJp9DZpTFoOb/swe7O57Cd9PfZWofkxut7soRq
         540RIaLfSksF38DqPATepqKn+EoLs2Z4/1Mn9yf8pZvpnwDHJXumFNPNjP2WqUlU8/6O
         6N2V/cccg8WQpJMko+M+6e5hd8bzFy5d5JZHq3LVSz0fifvxitoM2oKHcrYCS7j/7620
         jppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789946; x=1792394746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GVFgubLFwSlRx0dc28Lupwth5R3tDS9aeaXU7vAsa6I=;
        b=K7AqqXYrdnjQkAaNzVb1Nj4DPn/am3B93ldEPM2kDRzkKQM5HeBG1xYw+VUQ57C7Cd
         g1qkUsC8x4UuRYFs/AxGDJwu1SIYf3ril4GJcTr7TeJjYw3el0GSeA/EFzk0AhVlOOPZ
         wvEfmaMiNB78ypN8ZwfiRUcnMtguG09q5WxAs2ITNKcJ8ydUOXMZRQg1kaoZF4Y52A7/
         KNL8Qk+UcqS3qdydzoPOiqbmyD8FKfGHyTbNNQrmkRzvX/9tQw1EdLulU+frVd9ffDG8
         rMXQGXdI/YAOH9P5jT6e3FqFlY3kyTnQvR4z9RBfyejppUMZq9HZm3hktZnsdcE+yCx8
         whNA==
X-Forwarded-Encrypted: i=1; AKwUvBy2hMF6o+IjaB0J8tHDY9CqBb2I+C39TDlh7Ms+yK+FiL5pZpB2H6/tEAqVL6lkGRvih/M=@lists.linux.dev
X-Gm-Message-State: AFq9FYLZpv+ADICKtHa+hFf0luVfM+mqbc6lbbTLicpBlghy0tzOCp3Y
	zhNe9LEI7kdKElYMN2P1HdM4DKjGATYiFQ5eFeTGcRva65DE8YCaV9dd
X-Gm-Gg: AYBFou1xpTGkK3/d3SOS0qomxQ4OSO258SrbkRdWXuiukdt5eIBfrPKlp7owo4PHMSO
	jhPCYhgHuu/YVWzlfK2cLgXAilSlcGb5TVfboDJobwmYTiAXJA7XL2/oGCUubc5VJVD9Zo8ffCo
	u1LD0UbKfMYVx+8wxTcqckm57rZM/mU0TSHRyoWt45m1Rty1/XA6K0FGbVLl0m5n5aqd0YWHItv
	2gGw5BPK65iOrQ0RJf+iwMkwu9D//GAMlQU1Bn6gd8DesK2TDb21Wcp9CmWESVLowKcSOlnSedC
	Cbsaw37ok2A4+6v2nVzYdr+QKi8579vqT0qU3dFwQyghBXtUV3hNBi1pl3Akpc91Dn+cvMGdMyx
	a62DT/VTArEWe+0PhdACq9M8p2cMjKNElUojvNZwBVOu8DnUqGUy4WpNY8o64CqteyMWmhVBXrm
	zwD1ekGVrhwiWbosWeDWa9QrtjXzaZq+j8Y2rvNDkVj+rY0RE02Ol5qDzFxJ35mjsQ0RggrSHrM
	Rtt6YuCoFvDDSWsriUIBDnqn6zwnL9Fyhh8/3T8lHeFemFUXhvlKwSkpYL+NGJ2
X-Received: by 2002:a5d:5f51:0:b0:487:b4a:3f54 with SMTP id ffacd0b85a97d-48dbaaec8f8mr15252003f8f.29.1791789946187;
        Mon, 12 Oct 2026 00:25:46 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aadf9bsm17523377f8f.29.2026.10.12.00.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:25:45 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Mon, 12 Oct 2026 04:25:25 -0300
Subject: [PATCH 3/3] ARM: dts: imx6q-apalis: Add VGA overlay
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-v1-apalis-imx6-enable-vga-v1-3-8905d8746504@toradex.com>
References: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
In-Reply-To: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791789940; l=3858;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=J15XFPQXwHwXqajYWDHAsZeClrpxiXPgtU/y11V0Fb8=;
 b=YNznv4USjYwddWq+/qaJHmbbnVovBRRKYP/qeKShQ1yQNEDDt04txudw7FbYWa1YbUcBfvhlF
 4c32Lwb0NINAXgbhaKdb/hcrLlgT4dfPwEKirLnrKQUQndhNJbVX9qv
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the VGA output available on the Apalis
Evaluation Board, which is driven from a parallel RGB interface passing
through a non-programmable video DAC to a VGA connector, without VESA
DDC I2C signals.

The overlay is also combined with the various Apalis Evaluation Board
device trees to provide ready-to-use DTBs.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 | 21 ++++++
 .../boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso    | 79 ++++++++++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index c5caca92ea10..b5ad9172e1f4 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -59,6 +59,22 @@ dtb-$(CONFIG_SOC_IMX53) += \
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
@@ -184,11 +200,16 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
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
index 000000000000..a449ef9fbfaf
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso
@@ -0,0 +1,79 @@
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
+		compatible = "toradex,apalis-imx6-vga-dac";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				vga_enc_in: endpoint {
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

