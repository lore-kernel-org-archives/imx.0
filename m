Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D1642668E
	for <imx@lists.linux.dev>; Thu, 30 Apr 2026 13:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777555311; cv=none; b=mOC9IlbJEQPS8LdW+PzsWQsgvH3wWxjIqTWaJolqD0wc1oIpnYmE1chi/iVVRWTOmhOBBdhhwVF+dm00HPxxvdpQmRdQ0mqHwp+xsA98q98cCSWt+i2AIWMdy9xpyZ23fBfWa7vu/Ej+PMXlIaREXPkpfwlR5QhpKz4pqgXOB0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777555311; c=relaxed/simple;
	bh=GqRGrNLZXVzhBSOIsCYxa32HgZ4zBg0+yUDiq0uerkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qfwo39MXeXsWamC53yVC/X6ESRdWcnbkMe5jLKTVP65bdeQgX9ANqwzg+mr5FId7sX2VTAHRczkrMVH7hxKPN7aginSBSI2yCNDWAToSErNPUyM5P5/HeeTKYCJiQXikijU/zsKKQGt6B1qByhQ2YmUALG/E5uQ5G3rT8vfZryE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=RmfvpZyx; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="RmfvpZyx"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so12485215e9.0
        for <imx@lists.linux.dev>; Thu, 30 Apr 2026 06:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1777555307; x=1778160107; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4V2mrc16hrnhb507yXsAugmx8ywjiAaffpYxLf0PPSI=;
        b=RmfvpZyxdpML9YVhu2khaChyatx24231MqrCLT3eCZ9Ctz7UhbVnWHMdPALsZfnkHV
         pswXmRT5dkX5xz5bvfsUwThlmktb66Op2k1Y3mZ19KblTDe5KCtn4U9JGc+Azd9h0cDd
         BneOTbGN4SrvrV8p+osspDPUxOqOjr7T+CRR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777555307; x=1778160107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4V2mrc16hrnhb507yXsAugmx8ywjiAaffpYxLf0PPSI=;
        b=RjjyyROhxnURr5s4+2QNcYjAV7OR+16NRqQykhfS/s1AwTxosasN+8YjSGfSXvp0eb
         d7DeTThIXrXMj4Zlo0INszAR9mikV7NTKVqvZ/VjStkoJGPG2T+k/3AWncUowI+cgFfF
         xx/Xc/KExYXMgN6/j5ug/42a8uv+dwpqCnoBW0JFG/E1W94p7Qmg+eTSHbFUOpIFdlHI
         H0SyVlgHwjY7afrXXhWD3SNNq3+dnDTUYLcWnyjzV2vmTItZWIMyco0KuQkoM5YgvPuu
         HFs5w1G3kAs13RDVSPz2ouboLdg7ESP2yrl79EHYnMnR8wGpk/v6/2vNcaHKMGiD/Mdk
         CIHQ==
X-Forwarded-Encrypted: i=1; AFNElJ9XoHxt2qPyqlpgH+nvtcw6LOYhLxnOMHxI5uRr4DTV1RHAzHFbtlivXo6rM4R1GTAddlQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKDraxnCWo/8+5kys5aHRTyu74XarosRUvv0h8QgbSavz2m3ih
	M3UDR4PykUusEL4Vum3juik/UQGNkmll4IMMNMfAkBXBjbV4xx4pKMgUf1uZ/6jfRFA=
X-Gm-Gg: AeBDievXn3ATGCXHTU1N+URSrFRBKdeTE+qTn1eGGjX8qxVJnoz9Reb6vHGG8U7Da8Z
	tQTXL2+m0VdYEL+cPNxXo0DRB+yUviAO/X5F2XMkazcZJjFhScjrI4hJWRD683QcWPUaGtqP0xr
	d8c2SIT5OCbz1aMH1NWPAiEYVMP1a+USgTy7WXP4FdIM3EkBcwGOhghiYEYW/6Xzv47DUVvkF96
	pvNSB6Qn5iolseYkk9/B3fKBD+IppOGqx9et3qK9KWXHVQpdPGCOYTnv6RwdhlbfDwSo7DCnskE
	awmVcA4aKnglocumwU6M3if/xpRYEkMkcyxDL+MyqMzzLs9Zl2rNdsMfoScC7yBFVXtp9tcSIvo
	CbdCBcP/QeijeQAiEJ8zH3naIXQ8mbzBblRbZ2slJYbb3QlGokM1EWyfo+x/AOZrDaCcPWH6moA
	3jv5jYk9quvND+o4EXe5rNuTKuzouZ8iZnASc1mWhnOqopdwgUcLJGkXJ4K3mfj8ZFZiQ25AYUU
	cLb8g==
X-Received: by 2002:a05:600c:5286:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-48a86085131mr40450345e9.12.1777555306711;
        Thu, 30 Apr 2026 06:21:46 -0700 (PDT)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82307f28sm106210325e9.13.2026.04.30.06.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 06:21:46 -0700 (PDT)
From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org
Cc: linux@roeck-us.net,
	Jonathan.Cameron@huawei.com,
	wenswang@yeah.net,
	naresh.solanki@9elements.com,
	michal.simek@amd.com,
	nuno.sa@analog.com,
	chou.cosmo@gmail.com,
	grantpeltier93@gmail.com,
	eajames@linux.ibm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	festevam@gmail.com,
	imx@lists.linux.dev,
	m.facchin@arduino.cc,
	dmitry.baryshkov@oss.qualcomm.com,
	loic.poulain@oss.qualcomm.com,
	Riccardo Mereu <r.mereu@arduino.cc>
Subject: [PATCH 2/3] arm64: qcom: imola: Move analogix video/audio output to dtso
Date: Thu, 30 Apr 2026 15:21:39 +0200
Message-ID: <20260430132140.30369-3-r.mereu.kernel@arduino.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Riccardo Mereu <r.mereu@arduino.cc>

This is done in order to support different video output over DSI.
Since audio part is linked to Analogix USB-C controller it is moved to
the same DTSO.

Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
---
 arch/arm64/boot/dts/qcom/Makefile             |   5 +
 ...ola.dts => qrb2210-arduino-imola-base.dts} | 122 +++++++++++++++---
 ...rb2210-arduino-imola-video_sound-usbc.dtso |  61 +++++++++
 3 files changed, 168 insertions(+), 20 deletions(-)
 rename arch/arm64/boot/dts/qcom/{qrb2210-arduino-imola.dts => qrb2210-arduino-imola-base.dts} (85%)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-video_sound-usbc.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4ba8e7306419..e89a0e77072b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -193,6 +193,11 @@ qcs9100-ride-r3-el2-dtbs := qcs9100-ride-r3.dtb lemans-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-base.dtb
+
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-video_sound-usbc.dtbo
+
+qrb2210-arduino-imola-dtbs := qrb2210-arduino-imola-base.dtb qrb2210-arduino-imola-video_sound-usbc.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-base.dts
similarity index 85%
rename from arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
rename to arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-base.dts
index bf088fa9807f..fb22effb9a35 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-base.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
 /*
- * Copyright (c) 2025, Arduino SRL
+ * Copyright (c) 2026, Arduino SRL
  */
 
 /dts-v1/;
@@ -110,6 +110,106 @@ multi-led {
 		leds = <&ledr>, <&ledg>, <&ledb>;
 	};
 
+	sound: sound {
+		compatible = "qcom,qrb2210-sndcard";
+		model = "Arduino-Imola-HPH-LOUT";
+		audio-routing =	"IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC2", "MIC BIAS2";
+
+		mm1-dai-link {
+			link-name = "MultiMedia1";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+			};
+		};
+
+		mm2-dai-link {
+			link-name = "MultiMedia2";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+			};
+		};
+
+		mm3-dai-link {
+			link-name = "MultiMedia3";
+
+			cpu {
+				sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA3>;
+			};
+		};
+
+		mm4-dai-link {
+			link-name = "MultiMedia4";
+
+			cpu {
+				sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA4>;
+			};
+		};
+
+		hph-playback-dai-link {
+			link-name = "HPH Playback";
+			cpu {
+				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
+			};
+		};
+
+		lo-playback-dai-link {
+			link-name = "LO Playback";
+			cpu {
+				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
+			};
+		};
+
+		ear-playback-dai-link {
+			link-name = "Ear Playback";
+			cpu {
+				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
+			};
+		};
+
+		hph-capture-dai-link {
+			link-name = "HP Capture";
+			cpu {
+				sound-dai = <&q6afedai TX_CODEC_DMA_TX_3>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&pmic4125_codec 1>, <&swr0 0>, <&txmacro 0>;
+			};
+		};
+	};
+
 	vreg_anx_30: regulator-anx-30 {
 		compatible = "regulator-fixed";
 		regulator-name = "anx30";
@@ -165,6 +265,7 @@ anx7625: encoder@58 {
 		analogix,lane1-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
 
 		pinctrl-0 = <&anx7625_int_pin>, <&anx7625_cable_det_pin>;
+		#sound-dai-cells = <1>;
 
 		connector {
 			compatible = "usb-c-connector";
@@ -198,20 +299,6 @@ anx_ss_in: endpoint {
 				};
 			};
 		};
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-
-				anx_dsi0_in: endpoint {
-					remote-endpoint = <&mdss_dsi0_out>;
-					data-lanes = <0 1 2 3>;
-				};
-			};
-		};
 	};
 };
 
@@ -225,11 +312,6 @@ &mdss_dsi0 {
 	status = "okay";
 };
 
-&mdss_dsi0_out {
-	remote-endpoint = <&anx_dsi0_in>;
-	data-lanes = <0 1 2 3>;
-};
-
 &mdss_dsi0_phy {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-video_sound-usbc.dtso b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-video_sound-usbc.dtso
new file mode 100644
index 000000000000..6fb256498cd1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-video_sound-usbc.dtso
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2025, Arduino SA
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+&anx7625 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			anx_dsi0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&anx_dsi0_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&q6afedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	#sound-dai-cells = <1>;
+	dai@18 {
+		reg = <SECONDARY_MI2S_RX>;
+		qcom,sd-lines = <0>;
+	};
+};
+
+&sound {
+	pinctrl-0 = <&lpi_i2s2_active>;
+	pinctrl-names = "default";
+
+	hdmi-i2s-dai-link {
+		link-name = "HDMI/I2S Playback";
+
+		cpu {
+			sound-dai = <&q6afedai SECONDARY_MI2S_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&anx7625 0>;
+		};
+	};
+};
-- 
2.53.0

