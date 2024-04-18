Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0C7190691
	for <imx@lists.linux.dev>; Thu, 18 Apr 2024 20:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713472706; cv=none; b=rasIFt++cb/uZCBzJaXyVkJjGFP8NoT/9j09vsQ5OyiwJmwT+QhT55TnvfWVczDjRm7FEUrKnYjmL31HV/W4g2zJIppHsmv/9ErRpOW+a9mtx61V0MnViS4yWlvS0KFgj8fht5ccBqJuul69MAqXiFfAxd2706VLo7RnananbOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713472706; c=relaxed/simple;
	bh=IXsOSB48KhBFOf88YD8Blw+Mq+X3++0K3YE2RV82H3M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i+ubhUx9R4hMIcqnP0OlWPnR7uoTQhRtEQ1BB+pe60+quOVfZ4Paye/Lx0wv9OiUNIhizHrr44Lmoyh3I9qq3oG5QWYyMPl+0JmcncMxM8U2X7O61fWHJSkQ3obCx74mFcTXLN/T/BNq+8Vh0kJ4r1O6FyeF0dZ7z+7T/Al02j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=luwtmBT1; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="luwtmBT1"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a519e1b0e2dso131924466b.2
        for <imx@lists.linux.dev>; Thu, 18 Apr 2024 13:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713472703; x=1714077503; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7A9GTsxN8IunCYp1DUkY8RgJAa3KxxBOsbu5rncJB9Y=;
        b=luwtmBT1nVDxWWSEHVkty8gKWVwLa5upiCK7LjT0hyU/txyZognwfCspc+FN/JCyQ6
         FtvIW+W0M3i+Zv1I5YLbjDg4OMDujzT3ECtxwvn3mv7o6AI/j5naT3c3SJVHLMLPNHAb
         8N5a93Wd6DvvJgjsMr6UPsBgml63Q266BHxqS4F967mnCxjySGrYMORLWMPKYCmB8716
         6p9cO3wCsFWUdthJoswlQndxHL55Gq9RLiiQRRjS3tmxFyKmJzK93OgJKmLXlb9Sxlll
         oF5/MvDKHvapSMZPrk/pDI+227yXXWP/SjH0sPPWTnNYu3ae+IuvJnZ1L5wU3Mqzszr0
         FBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713472703; x=1714077503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7A9GTsxN8IunCYp1DUkY8RgJAa3KxxBOsbu5rncJB9Y=;
        b=rhuBAvWXbwEj05tzht2KR5XVPdiNfs15vaIqUmifHolatCkrgiPBc2Mdw0jxKQgqi2
         XPEg4rROF0wik8x5nt03bY+n4ZxSn/wDb4JVVndCx0AF3VMYh3iCEBGpOecNL7uvML/B
         gtRP6SmlxM+N4jUqOuxl9E3HLKDtRfMc+WGfwggod3lvWHNWXHoFUIsnZ7iNEcs1Jf8Y
         I1rM6Gz04bog3c+SnUy+nxoFrLqgr+nJS/T2RqUjCw+qmSJssNP4rYzZZep1fiTiRgS0
         1+1C6lHJin8XUFKnQ4Uw0og4XGyts/VGWFmc2oN0MCNo/gRb61xCs3yeiw8N+2E6CShE
         /5Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWhXEb7t8HfXn0RzYD5Qy2SHuKqX/mkDcm21bHTE0k5QZq2oXF48UbSzDVFY8d3ibOVmxfw2h6Zp62KvPMVSagl2+lk
X-Gm-Message-State: AOJu0YyHFZKgGhqAO1obhUyP5+nu1h0TX9zZMIJiNg4vA4EqS55/nRtz
	vnW1My3GuFOjHVXWx1JncInfKCRu8NJxRwDbk22iNYyGLtKocvAt
X-Google-Smtp-Source: AGHT+IGzLyE7VxWjZDABe7Un265onJx95a/vOFgpB1qchpktSO/egBKsgsmbcFgr7ax7wodqHkbROQ==
X-Received: by 2002:a17:906:5f89:b0:a55:5ba6:ace9 with SMTP id a9-20020a1709065f8900b00a555ba6ace9mr165722eju.9.1713472702807;
        Thu, 18 Apr 2024 13:38:22 -0700 (PDT)
Received: from lmc-playground.localdomain ([188.25.209.252])
        by smtp.gmail.com with ESMTPSA id l21-20020a170906079500b00a473774b027sm1305649ejc.207.2024.04.18.13.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 13:38:22 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Liu Ying <victor.liu@nxp.com>
Cc: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] arm64: dts: imx8ulp: add DSP node
Date: Thu, 18 Apr 2024 23:37:20 +0300
Message-Id: <20240418203720.8492-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240418203720.8492-1-laurentiumihalcea111@gmail.com>
References: <20240418203720.8492-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add node for i.MX8ULP's DSP core and its dependencies.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 39 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    | 22 +++++++++++
 2 files changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 24bb253b938d..5dadcbba370d 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -67,6 +67,32 @@ vdevbuffer: vdevbuffer@a8400000 {
 			reg = <0 0xa8400000 0 0x100000>;
 			no-map;
 		};
+
+		dsp_reserved: dsp_reserved@8e000000 {
+			reg = <0 0x8e000000 0 0x1000000>;
+			no-map;
+		};
+
+		dsp_reserved_heap: dsp_reserved_heap@8f000000 {
+			reg = <0 0x8f000000 0 0xef0000>;
+			no-map;
+		};
+
+		dsp_vdev0vring0: vdev0vring0@8fef0000 {
+			reg = <0 0x8fef0000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0vring1: vdev0vring1@8fef8000 {
+			reg = <0 0x8fef8000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0buffer: vdev0buffer@8ff00000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x8ff00000 0 0x100000>;
+			no-map;
+		};
 	};
 
 	clock_ext_rmii: clock-ext-rmii {
@@ -95,6 +121,15 @@ &cm33 {
 	status = "okay";
 };
 
+&dsp {
+	assigned-clocks = <&cgc2 IMX8ULP_CLK_HIFI_SEL>, <&cgc2 IMX8ULP_CLK_HIFI_DIVCORE>;
+	assigned-clock-parents = <&cgc2 IMX8ULP_CLK_PLL4_PFD0>;
+	assigned-clock-rates = <0>, <475200000>;
+	memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
+			<&dsp_vdev0vring1>, <&dsp_reserved>;
+	status = "okay";
+};
+
 &flexspi2 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_flexspi2_ptd>;
@@ -176,6 +211,10 @@ &mu {
 	status = "okay";
 };
 
+&mu3 {
+	status = "okay";
+};
+
 &iomuxc1 {
 	pinctrl_enet: enetgrp {
 		fsl,pins = <
diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index c4a0082f30d3..99ed8c1ee57c 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -198,6 +198,22 @@ soc: soc@0 {
 		ranges = <0x0 0x0 0x0 0x40000000>,
 			 <0x60000000 0x0 0x60000000 0x1000000>;
 
+		dsp: dsp@21170000 {
+			compatible = "fsl,imx8ulp-hifi4";
+			reg = <0x21170000 0x20000>;
+			clocks = <&cgc2 IMX8ULP_CLK_LPAV_BUS_DIV>,
+				 <&cgc2 IMX8ULP_CLK_HIFI_DIVPLAT>,
+				 <&cgc2 IMX8ULP_CLK_HIFI_DIVCORE>,
+				 <&pcc5 IMX8ULP_CLK_MU3_B>;
+			clock-names = "ipg", "ocram", "core", "mu";
+			power-domains = <&scmi_devpd IMX8ULP_PD_HIFI4>;
+			firmware-name = "imx/dsp/hifi4.bin";
+			mbox-names = "tx", "rx", "rxdb";
+			mboxes = <&mu3 0 0>, <&mu3 1 0>, <&mu3 3 0>;
+			fsl,dsp-ctrl = <&avd_sim>;
+			status = "disabled";
+		};
+
 		s4muap: mailbox@27020000 {
 			compatible = "fsl,imx8ulp-mu-s4";
 			reg = <0x27020000 0x10000>;
@@ -520,6 +536,12 @@ per_bridge5: bus@2d800000 {
 			#size-cells = <1>;
 			ranges;
 
+			avd_sim: syscon@2da50000 {
+				compatible = "fsl,imx8ulp-avd-sim", "syscon", "simple-mfd";
+				reg = <0x2da50000 0x38>;
+				clocks = <&pcc5 IMX8ULP_CLK_AVD_SIM>;
+			};
+
 			cgc2: clock-controller@2da60000 {
 				compatible = "fsl,imx8ulp-cgc2";
 				reg = <0x2da60000 0x10000>;
-- 
2.34.1

