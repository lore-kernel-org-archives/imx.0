Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC8036C0AA
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 05:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772170233; cv=none; b=pcENdjPFWGF6Wjtlf/8Vy/stRS1RhdU8oYEj2vd7CAPVvRh0SKJq0HhkpSzL4KdWssWfDIvLFNjKeqIN9MFyRePiOznq49yThb/XV1TXWTWKd3UJBzDPGApwydzhlzkGteXQcLaQYVkUiGg++qmoyDm4Eo3wzT9w/pYJytTCAGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772170233; c=relaxed/simple;
	bh=L+GHPQAqqBvSWQjUMi4LyDjW1xWjQwZbzVzgQjYpoZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UHCA8fSUjUIf6ToS2+uCa4XSw2w2a96R+UFxeXir2eyOpUOiUGcYSR3DHsaF3usOUn1fTH2nyInEBAoLiBl+n83UcjPA06ZPIeXJgszfhfdhU+5wns2JQ87SKhpkqzEGeScYxetx/wEK+PXmh9bn80ZFRb0c6EtBu82zM6cZPdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f8Xr2FzN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fr2AY/tT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f8Xr2FzN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fr2AY/tT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K11V2403203
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 05:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mvSftihsd1SbZhKDJ4Cnab43xZlVq5+abJE9Otkr5lI=; b=f8Xr2FzNaUUpYxVe
	x8oPWd6fiRV5Uf0Z1BCQ7oKyv4u2/Or3U3QBUyzmYzk85UnjU9tPl+JDBFFuMaj0
	Y+JJT6U1tnoDM5+YJakDV1scKkFOMCf6T9wWYgxsVY++L5gaPGCbDfK1oF9BxMFh
	Kwe8ZlLRYeQT8CgxI+AI19UeKiJwhaJNrXYHWmyn84A4Lso2VbOH/nOjwtRGkQkc
	00NQSOIGNXB6yjy1OVE3eLZlgLzHUFYl94cvhoXXfly0qJwJut3h/NOZ8T8Eo2xB
	MO5VnHdVBT03fKlJ96ItM0PoCnUbL3DnkksR+E49gGPE0LbR2Rv+gnexbHCRA3xX
	hiXYqA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjw239fsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 05:30:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899afef8eebso64711716d6.3
        for <imx@lists.linux.dev>; Thu, 26 Feb 2026 21:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772170230; x=1772775030; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvSftihsd1SbZhKDJ4Cnab43xZlVq5+abJE9Otkr5lI=;
        b=fr2AY/tTT2El1sl1enexR5gOgcFwGIMu3nETdI4OVk29WbM9z6NqHfSMGOePDOMXPv
         BjAfGvPQ2FrGY1PwCoAvOG6TbapEx+SlRpVpdyaUQPh3G07UmXoeHYOTGN/qWIDvGRu3
         FHyZtJos3sBxeRDOAAgoeMxwcGkHDORckRgZvgRmu4i8jFRYQkq7aBkWNlOlpmPBQ0Gb
         bAzAI2LZFBjarQS/OOCqw0Wmm/KGvuy/e83QkvGIY6HiTHqCWgyJmZax7uIRsqr9yLUN
         pu3iy5qjFdGBwiGYLRIxRu7nfKGsBTDpBc0AFJHZO/x/Kqwld52h5Br+2DTRo3xstYnP
         YXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772170230; x=1772775030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mvSftihsd1SbZhKDJ4Cnab43xZlVq5+abJE9Otkr5lI=;
        b=J4bAXitxgn6P+4n2AQWshYSwNxbghXeWNxGEGfZUZH0LvX80lVPpRhWi6c7R5X1JAV
         xe5eGUJJ/v+VlQYeqHg9mmi49s7nwgXZn+BF+mPRDsl6H6vwJrrV9rQXCOYgEfgyAwUs
         PuxoGbBvh3/4M2qgaxj6Xs1bBknuWlR5COlUPTfSyMIOtDjKseqFtdJ9OZZoxZDhZjWT
         sOVx0D4cX2W9+wR4zJiBJmgdF67DNPxkzVPJbkIt/GuigzmGDz8F/UH4ZVn5B4VE10Cp
         P/NBJBAy+hU/a/Nzyygnd5IXYvBWWyUswhF14yCr16jGXCJsVMeImnjVrvZfNXXHTRKD
         Abng==
X-Forwarded-Encrypted: i=1; AJvYcCV+reyPNnLw3FK3lKz/jqgX/Ug8p0BqMy8TQBzGOll4SFaqW4bOpeVL9WJd3CguMlfDKVM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXyWK06WV/1RIbVqaJpE6JkHXKHfzNIYFTySInjd5N7/xooeh1
	gWT2LC1up0wocpxTbT3v75UujbzwDFTug2UCHMBEErst5/6DwnbKmwCY+14qi2bjq6V9yxBZzVN
	TB0frAz5gjiLsCq26vNPQk2u0dz2rkFzomDgMavXXL8cWYyia8Lmo8ic=
X-Gm-Gg: ATEYQzwAgv1BopLgn9N120U2BLMBnLeRWNJCsirTX1RC6QXXrR4p1YvoUnEGS/10l+2
	jvjQ/UgGXI4hTe8qgJOfdKapOu/Exn1N02R+nd5aFmXZZfOpfV0OXE+BoRjj3AfeH9B+CoMPHX6
	IyQiY3vpecpqhMWIwThAmbFFqwYjiOqvp7dWCjFntqbm24t8nxqV1/BhLtbVz35XzIIzn/EJfvT
	3Ekn5yZrIZGU0Et1NIMUtzfl4ZxctKz4iWvUv4KbLBW+mddoWL1AnT0K0dHiLonbNdeHEuOchjm
	PvFnWZdo+8hgsRsBSx5bz1UhUaixTpwjoxkSGW9rP14v5w1xrN32n1piO6gwEWvi6LYTzl7TMHy
	VR2sw3mBgJJIhUQNpD2ZpTYEW1QAvDpk8H62g0BCG3w6mJ4HQn1NID3dOXONAgtDQSFxmkLi6J6
	h/CPmrVzFqjy1F
X-Received: by 2002:ad4:5cc7:0:b0:899:a58a:9039 with SMTP id 6a1803df08f44-899d1e54365mr27172486d6.49.1772170230441;
        Thu, 26 Feb 2026 21:30:30 -0800 (PST)
X-Received: by 2002:ad4:5cc7:0:b0:899:a58a:9039 with SMTP id 6a1803df08f44-899d1e54365mr27172096d6.49.1772170229863;
        Thu, 26 Feb 2026 21:30:29 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744afa7d7sm36590121cf.32.2026.02.26.21.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:30:29 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 13:29:40 +0800
Subject: [PATCH 2/2] arm64: dts: qcom: hamoa-iot-evk-camera-imx577: Add DT
 overlay
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-hamoa_evk-v1-2-36f895a24d8f@oss.qualcomm.com>
References: <20260227-hamoa_evk-v1-0-36f895a24d8f@oss.qualcomm.com>
In-Reply-To: <20260227-hamoa_evk-v1-0-36f895a24d8f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772170211; l=4071;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=L+GHPQAqqBvSWQjUMi4LyDjW1xWjQwZbzVzgQjYpoZQ=;
 b=R1BoEM2l+QRSFpo9pTovfM5KoiIDRXx2uUsgGfdRgEUDSF8H8uiABvrCgwwc/W423s/QelVym
 64Up7FeDSNLDmbaDkBMueu6bT7p5OQq3N7O1TftR3fkweIMJ88WlTYf
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: ElLYQacq6hp6dG2NhfTJY1xEhouuJZJX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA0MyBTYWx0ZWRfXxgvj7Dr1NGLZ
 JtQLNqXXgz83qsDHp0wBoKNVAtJz9bf1RQYhKIHwjApVZ1FC0Ka7zDVV+QjEJc57V92dJnEYORg
 AnmjL/3yHc8RKEEwhpTKYRHIXVPquTnwdJBXdtt8K7ybJCuRbh5dDXKW/64i24FZdz5GxgEHCUy
 woPETb5gLZxTVy1a9tKVJWU5Nzee9ZmW2CcZAxOYlCDP6gssO2aBnuYLYcv/acgDFCRhhYKJRsZ
 22EGg0JDnTfQzLHrTeLb/K8vKDF5M3UV+bKl2CO87xmfR0nYfvJXkEEevLDk/p7igPOSK+kKnIu
 XFv2uoHMT1IIynDsZkvB9xbFia5sijbAHDVccG+T4chgGKJbgd8NXEVzEXj/Q2RHY42Y4+2Y96x
 LdOP8tzUJhowLOO9hV3ORlvFXjan/bix3gKFWT8vH7gTjEMc6KU09tX3LoU9sFIqiUm7Sf3BgPy
 hilRbMdMkQLg8XZVfxQ==
X-Authority-Analysis: v=2.4 cv=cJHtc1eN c=1 sm=1 tr=0 ts=69a12bf7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=GnqVPrpTqDTv7ixMMmsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: ElLYQacq6hp6dG2NhfTJY1xEhouuJZJX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270043

Enable IMX577 via CCI on Hamoa EVK Core Kit.

The Hamoa EVK board does not include a camera sensor
by default, this DTSO has enabled the Arducam 12.3MP
IMX577 Mini Camera Module on the CSI-1 interface.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         | 16 +++++
 3 files changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 317af937d038f5d8bb5292db66c48625fd904793..724e3c4524e9fecb0719f5297ea19a1fc7f5797d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -15,6 +15,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-camera-imx577.dtbo
+
+hamoa-iot-evk-camera-imx577-dtbs	:= hamoa-iot-evk.dtb hamoa-iot-evk-camera-imx577.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-camera-imx577.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..f45a7fbd14b1f6eea994de5d15402106ca1b5e79
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/phy/phy.h>
+
+&{/} {
+	vreg_cam1_1p8: regulator-cam1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam1";
+		startup-delay-us = <1000>;
+		enable-active-high;
+		gpio = <&tlmm 19 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&camss {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csiphy1_ep: endpoint@0 {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep>;
+			};
+		};
+	};
+};
+
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 110 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam1_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK1_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		dvdd-supply = <&vreg_cam1_1p8>;
+		dovdd-supply = <&vreg_l4m_1p8>;
+
+		port {
+			imx577_ep: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};
+
+&csiphy1 {
+	vdda-0p8-supply = <&vreg_l2c_0p8>;
+	vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index fccf1d1bdc6067b33e264262af3c4bb64346cf1c..f44f314b2192a131dfcbb0358d5b85a9e91fd739 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -1274,6 +1274,22 @@ right_tweeter: speaker@0,1 {
 };
 
 &tlmm {
+	cam1_default: cam1-default-state {
+		mclk-pins {
+			pins = "gpio97";
+			function = "cam_mclk";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		rst-pins {
+			pins = "gpio110";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.34.1

