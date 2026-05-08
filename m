Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BDF388E46
	for <imx@lists.linux.dev>; Fri,  8 May 2026 11:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240513; cv=none; b=KXVMNiWlZxhgdetlmkpN/aB8rVNkZ/YJHy6/639gtgASwvuW+cR5ldS5ENAr30r8+kn/7z+RK34kMTzm2FFECbbxfICB38IC+dRfQ8pmapE6jwQzU4pD/9DJ7w6BfV52AZg69DT8PT+uIJ1cXyaeubglES1fzZ7z1ri9Rh06M+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240513; c=relaxed/simple;
	bh=C+fdaZxLrumZmrqKOPIPxKcscjjl4PkjK9Fk9tnFUzI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QkFughdGg5cXZkD8kqP4DBUyFg1BXCr36Mp2ZNQLdPDEq8I5hYutQKpGETWv3kq80RwNUmbp78G3wcCSY20sm+7cs7XQhq+IBMFKDDo4iGFqPZb2bNVlx8tr+4YlKTu1mYbGrWyFErQhKb02sfU1lPS5ciCenFdm8abCES2rSqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DfXUIhTl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZI97x9JZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DfXUIhTl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZI97x9JZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648AcPAd2183373
	for <imx@lists.linux.dev>; Fri, 8 May 2026 11:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tX6JkDWmit7Ac/IJ9FKAS/zdI+alWCBDeK1QiGdkxGY=; b=DfXUIhTlvOjxe8Y+
	5kJ8S1H4F38EI19gMMZTsfOEYWOHxuMGyzCK4u7S4lVytDG4K7UFzjs2sToNZTAH
	4tzc9XCP7g3uv19LpgL8NH7CYihGJaWeeALzVHkTZbR2f25wGnCW38PLgKX5Hh6o
	tDhkqZjEjZOjqR9gmBcmfI53WSf4WdquyJreFxk+KfILQZJIyztluPkuWcZQ1Qin
	v1hbnTAT/nZIBD4Zzkjf6ol/9ObMxRJ+uwTu7dIq5HB2XBw7zDtPneeNIOeHiUF2
	So8T/hnfKBLrztGdl7jI/lWiGyhAjhgYMgt8AOE3vqdDvNIM0FluhinPPdzFK+gn
	p46ZkA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10pyb6jd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 08 May 2026 11:41:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8eabf08affaso137659385a.1
        for <imx@lists.linux.dev>; Fri, 08 May 2026 04:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240510; x=1778845310; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tX6JkDWmit7Ac/IJ9FKAS/zdI+alWCBDeK1QiGdkxGY=;
        b=ZI97x9JZnZMJO9jeyr9+e/NzGouXBGkgpgcxvU9ZXoLMFj2MUU22XkclvnRuzCuIc6
         GBZY210N3hI3YpBxJuSZ1P0MQWli0WHA0U68HFReuH3JKII5xaqWj3HLIOjlG6H8ktqZ
         R78np+MyRCN2LJmK//b5lKiIln8hiJrjvs4IGypte1T+QNy+FlgWqZtW4cBp7qvTr1GQ
         QtObxcgVtH5Hpgnn7SpXXVLqPngrYRJM1JFPEhlvY/7NlMUSqKWKfTF3Bt9E5zw+km25
         wtP01UweFL4IqWb7SyEGV79ywCuctxaRxZiZW6H+cVzs5ffUt0CZf6ILZUQ5KGNsPjyP
         hLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240510; x=1778845310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tX6JkDWmit7Ac/IJ9FKAS/zdI+alWCBDeK1QiGdkxGY=;
        b=dmzAqhqj6ENcwZcRCFk4+2lbh9kLK0pUmmG9e/rEy+S67xqBT6g1mg9ELbTvjq8VYT
         qX9b9ALYv8WrIjBRgsMC7c0Y118vzzo5L9B4C7fltwiKnSrM/KPj8xZ/CjPpZCSGnPSl
         zj6Cl16k09p9w6Z87ViC9iEDl5dFBbBPm+dRqGuS3GdafpY/c5r7C/NKZSLl76AhOmsx
         7XZKZ/Zath5EnkhEjYSgbCpP4cn9NE8PYY4PsZ0QsOS7GoTxw5j/mN1mD+p6MK6d1Lif
         u600RonyOraZN52q4HYroPCeutfL89eW9wYsezjE+Pjm6GBdrGhJDhskdpmjHTF7+BlY
         yakg==
X-Forwarded-Encrypted: i=1; AFNElJ+NtRMoNP5C64ybJwH/mqf2nt+HSWS9JSfu3j8gyUBw/i4D1ZR7w3Z0c48Mqz5NTXXRok8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwubqzH9RA3PsQqonKXcrnZKM74GF8W8baLR6etR274r2MIR9QG
	VKkca55GYJYDQ+ZVAweFY748xzC/o8+pRBgeJVNcMpUSaLBt4wQ+8c/Zo/tVcyXBjZFfLUG9RIm
	20yxG8mw8xTOmZJxiWzfZMQfVoOfktYFMGIFKmyFPYQBq6hX2lCrqrMI=
X-Gm-Gg: AeBDieuq1poV98S638Vw+fzY+yYGQRn6TbpvOdCI46SrDcm47hrgPhqFxferMCTiy66
	LiXcEUX4UPBq083M3Y7ER5qTY6k4hZUg1nVgPmN4BLuVcFZ2mxEHEViodc5Mxqyx3IFdcmXsgtk
	udPMkrVmn0681vH0472AIak2SP+CymD5h/dP+a7/7Htbl7vE72RST9N+nDtFHdzEl0AnBo2o5HY
	N8Z2VGYVl6bV5md3bi3Duz58O7aFZIglNdYEztT+8wDoh1qeCw+FnjFT/imPvzy3CBSlU17A9s4
	9PYxBVQ0xt/E+faYDhvecJkpP2lbhAx50DN7PoVslXfF4axNMyN0eYWznrZjvSglITPznbOgwyq
	sJf5eiylfqUS1NnHZ0Q92wX2kpCSDwwNXHl3kIM7duhNEBAsEB75YVqQFA8Hhso13DLEyb/Rv2b
	0QLlSKPK/LOrH2
X-Received: by 2002:a05:620a:1a0f:b0:8ee:e011:a77a with SMTP id af79cd13be357-904d43924eemr1787929285a.13.1778240510148;
        Fri, 08 May 2026 04:41:50 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0f:b0:8ee:e011:a77a with SMTP id af79cd13be357-904d43924eemr1787923085a.13.1778240509717;
        Fri, 08 May 2026 04:41:49 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:49 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:40:03 +0800
Subject: [PATCH v2 7/7] arm64: dts: qcom: hamoa-iot-evk-camera-imx577: Add
 DT overlay
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-7-3ebdca3e4ae2@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=3823;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=C+fdaZxLrumZmrqKOPIPxKcscjjl4PkjK9Fk9tnFUzI=;
 b=9XYbJL6WMlwsC7APPQEr/KM3rpDbA1ZBSBoisHSl12i+aDVSSutd/eLI4oZcb23vOxSu2GI5R
 nQvVmkw1noWAs+1OJ3bfyT6apViMjUM9kvQLXtDao8r4x6pUxoqAUuP
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=DZUnbPtW c=1 sm=1 tr=0 ts=69fdcbfe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=uiy82_YRydbR65prXQIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: jPXbS-C1Nh0yffAESt6qu5Xl7iBjYPma
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfX/9RCeQt+6Vm1
 wwkdeOIZ6X5TBTwFvdlUc6qA/K0Z/WcIfFmAixWgWkxfw1N+fOBZMFpEIzP4BDUqD8YN6/f+kDw
 i7/r+m9Tcd+G+JNSjTZ44hcpXHVZ5JLYcu9QyPfLZ6zKHU2478fBxcgej3xQxxESq2VpXpXXxhu
 5I/3R4EE8DntLekA4r22G+pcdgzyfKtxR1PasNyHE7xn0lreGCEK+Rt4ghKOQ+DSseU6gAsXyKT
 b3agksBPI5Duvx8jKF5FJdI5uwMuaT+wpiK5g9xhTk9/PEG1Q62sygqwIYZhavI4tze23uq5mdx
 XFKaw5VtsaJsgApKk7JeayTKcW1iX5MpdhWzIwT2KTl1nqJEUkaZ2U4oq0mMR3k2CJzeMFc37Kg
 MAiFssH5gzs9j4Tk+bIWhRM4F5O/HQhTpT54j/23nM4yWlWX2HnimkEKH0jB9XDSi6luMLRZa9p
 bPDIb5c+hFGHy9tPhcQ==
X-Proofpoint-ORIG-GUID: jPXbS-C1Nh0yffAESt6qu5Xl7iBjYPma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080121

Enable IMX577 via CCI on Hamoa EVK Core Kit.

The Hamoa EVK board does not include a camera sensor
by default, this DTSO has enabled the Arducam 12.3MP
IMX577 Mini Camera Module on the CSI-1 interface.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso | 74 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  7 ++
 3 files changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4ba8e73064194926096b98b9556a3207e8f24d72..48536765058a4244a2b895bccc21567d186605bd 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -22,6 +22,11 @@ hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-lenovo-ideacentre-mini-01q8x10.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-camera-imx577.dtbo
+
+hamoa-iot-evk-camera-imx577-dtbs	:= hamoa-iot-evk.dtb hamoa-iot-evk-camera-imx577.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-camera-imx577.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..4a20656f16799d7a9c8fd4ad63ac0989cdc37de4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso
@@ -0,0 +1,74 @@
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
+	vdd-csiphy-0p8-supply = <&vreg_l2c_0p8>;
+	vdd-csiphy-1p2-supply = <&vreg_l1c_1p2>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
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
+		pinctrl-0 = <&cam_mclk1_default &cam1_reset_default>;
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
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 460f27dcd6f694c22ab2670d26753ee096ab3682..8cfcf48ee0099d4b505acc3e5662553e77704d5c 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -1320,6 +1320,13 @@ right_tweeter: speaker@0,1 {
 };
 
 &tlmm {
+	cam1_reset_default: cam1-reset-defult-state {
+		pins = "gpio110";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.34.1

