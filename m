Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781F7350298
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 16:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792081404; cv=none; b=qU3PzfIMcmhwRw/0iJ5cb14Xlt7se373RFOTCTPdxFIA3/dmH77b3j+v/2I+EtMlMp28AhncBDPs+m+5rZHFvoaZkuwyl8FvmWvPLZuvZnWVB1MGGVRBEEZNZoG7kNH2HKhQXK42a9N4mIjlkz+O5bgcSpCT6scYL89QnqrqhLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792081404; c=relaxed/simple;
	bh=QPdfVv0xjaBDwPQ8HURDYLE3vCH7R5wni8Gxnxxzetw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mbRv4vDZ5q48+7bJ91LcWYCyaV2tQiidtsIfD/x165rywOOpCPON8kUXl7tgKyFiYOB7be2quTK2dxcA3qP01v1SJN7YLjxDdW8abWMxm7Q/+V8/5CThPJuTyu87/k94L5umZ/lcVbRNVoUQ5ME7WZO0ahwT21wPCtgHQxI+ofw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o33NiboW; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o33NiboW"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso113731f8f.1
        for <imx@lists.linux.dev>; Thu, 15 Oct 2026 09:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792081386; x=1792686186; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H1Zj18i8wLD+v0cMejrP3M0EMkqe51uSgByins6dl78=;
        b=o33NiboW5zHJfLoACBxPZbimP29l+ZN48cYWqhtfQFvn+Isq+2usyfBTTeSG2An/9W
         Dz7vzqbsjRZhRC76gmTaZjpoNzYxvsE7q55GMlYDn+4ddxP0nqnLqrSCQ1ASVL4R+fzQ
         pxauguxkvo0eTkoppMQ3l1wD4IWsWPDZM2n4owwVcTJdfrlSGdqnBLi5wHKoc97p4TmC
         p/G85dApYwJfLDXdHpAf6W4U6Oel7omlHndEOUOJm0Bcaz+ehgx3qGDrDqg/vzB6gn/p
         WsYNngLJV49xCA/vm/7g/uOHjZEx6Yx7XNp7pFdq4KhjCV29aD1sBIRtgDfk16UZHPIU
         y7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792081386; x=1792686186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H1Zj18i8wLD+v0cMejrP3M0EMkqe51uSgByins6dl78=;
        b=2FiGCctwsV2OCZ0HM7DDVYKdM9PAmfov07DisYKlWuuEi+9kQ0kUFGiIC6NnPXKuB1
         kLwfpAwtF+H8bmsyRTHMWdKQNCFuHajdfy5CV4cLmOsn+Tj4eh6a0EhlzGAsFkEI5JhB
         dRs8HlMmhr41Qcmy2XKHHZESB77L+/WatwkzfoLzxzUJqZLqZZe72q8bkptwJpAlr563
         yS7Evpo6wZw3tpFLRL2ci6lcJ0TthKVlOpKOykZApnQoxk37ej+n/UdsBnVtR9WB9Ru1
         C0jWCNZhxtzMjBdjw2gh/R9NdPFIL2N71SdliMzfJJWtEhrNNsSlTtOBs/NJxMs+UnpB
         9ahQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDjC6LZVCyaxF3LvaRo7IiNJp/6q8rGXyjaBCXt2OxnYLdfIV2oAU+D1kJ7WiVodslpy0=@lists.linux.dev
X-Gm-Message-State: AFq9FYLKhuO2nlyi3F8nKupp3FryG89QNWpeyuSI52MojIUk/tidfMwF
	oK8bI34KIS5itwso4yXcnZuNQUZhugdyCWerCP6RKoJ80dmGT881qChM
X-Gm-Gg: AYBFou10wM440FIVThHpdHX3RVNVaC2KxurgQK25ox36jMc6LviDRPXMvNv31hY48RD
	lh0+S+CZ0FhO9VIfxBi+WgZCiwhRWpGJaGn23defEykJrqetfQtoM5U2ZS2Zw/uRduEDpo8IK+B
	mGvXHWgN0yaoMNiE7qGM/sMx43rvSNPIjO15iwvhZnH2sB/g1JolTsHDRwkBiyUCuVAjOJX6ZD2
	6da6SXH4ccIVivhXUzIch6il5EiVRA4O+JsoSDiO+EFIM8HCNFXUF5ySy1Dh/EGz1+OYzOLHYst
	RuluWwbWDE2xVDXYs1s2NiTUK3r2JJudVbaXgZh4UDT9BEXZ1X4wzmolw55MNmL4N4/B6kmo6pa
	LbrKezHitS+HztmzJEAq80hsk7k28N7fbPQ5QPO5KDJzI5+QAx/IxAYV+Iuu51aPooDbA9CMHXS
	1/jP8Zn03UxB4Wko0dMiQkp/eUJBd2JhjEO6W+JIqPylc1M8K+CB1TlAebymdrJpPoEoOwcLhyO
	Kfnq2Axb5qU3VbN3gGrnzzVVTiyxnKa+A9563Z7+iJNTUkYfwR1qxU1ZFWX8nsxTeUx5eHi+Dw0
	O1Z7zeePJjIxC3t6qnDWoA==
X-Received: by 2002:a5d:428f:0:b0:487:13a9:80d with SMTP id ffacd0b85a97d-48dfadffbcbmr1105292f8f.10.1792081386308;
        Thu, 15 Oct 2026 09:23:06 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4f34sm20616982f8f.28.2026.10.15.09.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:23:05 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 1/1] arm64: dts: imx8mm-var-dart-sonata: Add OV5640 camera support
Date: Thu, 15 Oct 2026 18:23:01 +0200
Message-ID: <20261015162301.63838-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the OV5640 camera connected to the Sonata carrier
board's first MIPI CSI port.

Describe the sensor on I2C2, its 24 MHz reference clock, fixed supplies,
and reset and power-down signals controlled by the GPIO expander.
Connect the sensor to the MIPI CSI receiver using two data lanes and
enable the receiver and CSI bridge.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mm-var-dart-sonata.dts  | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
index 57d29a5c3821..427a255fe8ec 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
@@ -75,12 +75,39 @@ clk40m: oscillator {
 		clock-output-names = "can_osc";
 	};
 
+	camera_clk: oscillator-cam {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
 	pcie0_refclk: pcie0-refclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <100000000>;
 	};
 
+	reg_camera_1v5: regulator-camera-1v5 {
+		compatible = "regulator-fixed";
+		regulator-name = "CAM_1V5";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+	};
+
+	reg_camera_1v8: regulator-camera-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "CAM_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_camera_2v8: regulator-camera-2v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "CAM_2V8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+	};
+
 	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -95,6 +122,10 @@ reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
 	};
 };
 
+&csi {
+	status = "okay";
+};
+
 &ecspi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_ecspi1>;
@@ -200,6 +231,26 @@ ft5x06_ts: touchscreen@38 {
 		wakeup-source;
 	};
 
+	ov5640_mipi1: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&camera_clk>;
+		clock-names = "xclk";
+		AVDD-supply = <&reg_camera_2v8>;
+		DOVDD-supply = <&reg_camera_1v8>;
+		DVDD-supply = <&reg_camera_1v5>;
+		powerdown-gpios = <&pca6408_1 3 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pca6408_1 1 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_mipi1_ep: endpoint {
+				remote-endpoint = <&mipi1_sensor_ep>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+
 	extcon_ptn5150: typec@3d {
 		compatible = "nxp,ptn5150";
 		reg = <0x3d>;
@@ -263,6 +314,21 @@ st33ktpm2xi2c: tpm@2e {
 	};
 };
 
+&mipi_csi {
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+
+			mipi1_sensor_ep: endpoint {
+				remote-endpoint = <&ov5640_mipi1_ep>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
 &pcie_phy {
 	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
 	fsl,tx-deemph-gen1 = <0x2d>;
-- 
2.47.3

