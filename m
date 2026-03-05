Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461CF37C0EC
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 09:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704150; cv=none; b=c55NM/FwsnYbwLpvMOxXlCzcg3gWUAVt+2Mfg758mGUlr2cWecxFsneqff/pZZy3a0HUKRZnfueNjFCaSP+7IKUOmXycD8Tp1TSfT2T4l01S/V56v7ZXARUC6IWM48KosQjWUuMMwO0MNm8VmZPPqJnDV8W56Kdqmy2aeBXGCRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704150; c=relaxed/simple;
	bh=PbP5HbZOT54hjcl4u46HR+7I6IyXggysw7XDymarv6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mdy48Vnn3SDH6oDOgstLco7KustUwN/YMknTI1CALqUPuIKhftXWqz04nwR4aZilexGZOeyo8jb+89cE/VDPf/aBk72ikhvhSwpQ0n2K5teFiETU85YKrEwfcZ9UQtHzzQAJk100oF5Vxz++vv6gpif3vse5ruXUbi3AT5vpGH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o6yVVFM8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GYFIrzC+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6yVVFM8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GYFIrzC+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62596Fcs2665205
	for <imx@lists.linux.dev>; Thu, 5 Mar 2026 09:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4cGHaTDZ3QbyuBDsIPC7MSdJMXOGPnxDxsu9adO9KiQ=; b=o6yVVFM8h/8hdti5
	M6xulJ38RViodW6hOesY4oK81i2kzeEEPNwDu7mHEUIlqsfYNkrLRJgV70tpPuUc
	aeONl1OXgWobu3CDczQGLcQC5q+6OaMbiryKewQCDQF7Bl2uKg7+UujHc8PrJnH5
	/8aT1FORiaozVrpbx5y6HyINK2qhWBUrpcKrSUOF0a4BWwIeXE6qxYKqyNpXjN6o
	6jQvhBn1aEwe58/PmVTp7uw2+FqzHp9M9Z4uhKOuUnzEaweE81z3+lnu04NHzlgQ
	7koiqJWlSfabzcWqDa/ZRWOyf+2h02N1XM0+bRp25K61a0uJ59tk2wVLjAN9o7Rk
	cLD7Bg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuhb27s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 05 Mar 2026 09:49:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5033c483b74so175416191cf.2
        for <imx@lists.linux.dev>; Thu, 05 Mar 2026 01:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704146; x=1773308946; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4cGHaTDZ3QbyuBDsIPC7MSdJMXOGPnxDxsu9adO9KiQ=;
        b=GYFIrzC+y7zdzR8UItgx2+2mAUZAJwg82mX8l5j+/wR1yzEDyivVuNLFdfMTZP8l4S
         EvW181uekUlS7Qyh6WIJNMrYWzUj03ev9Q4kOxOO/dm15a3EgCj/dYDBcog3MowPJl+S
         3Ezlnzmk2GGBmi1kzQttnjw6HiJ6D9xgDTZyMBSgNqRv5b1fMJBTCLFupIYP3CYZpqYa
         COGQDoPI5sQ5K8RxE1v0XghrS+HKr6DtTHcl5uQqOdKlGvirraod6Y45FuUKmskxAgfh
         7r8Kh37BXGqZvFzjHAFgbco+Tw/As0Pv2qbMPR0kx/yIqccf4yhKlsoxWrtU39OKMnQ0
         rCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704146; x=1773308946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4cGHaTDZ3QbyuBDsIPC7MSdJMXOGPnxDxsu9adO9KiQ=;
        b=qW/tHMy5c/t+bB5bMq3xnlRWQErw/ynRqBH/u1Nhh/s6qhQ5qoWzr+WNGRRXY/Nx/j
         6XBpFQbay87b4zltHP4anu+9kTejtvWqBE+jsgQBRlKb46MRxinckCd+yEMCq1LHPsf/
         ODCfwDoAM9OweO16h72Tl8c7e5Ci7KQmqD78kMI6mgq6bauZAf/vXxhrbbdMjbNRz9g7
         mp/HBiLhFZSMtVy2iYdIlmrXGJ0M7scBBbF9IWXpGsX73fLerBaVgEU0EMhmzUZI+tlH
         wZLveU0SM/OqFz8k9JH5I4oRXu/UNUgwM9L0wrGbmmWmTegd/Yj3CAja3eAB7pBZLY6G
         fuMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsfiJddMTjEXkjsx+UPL8NC/aZBqznmLNsGmpyeiWbHENgu4FOyZLPTzDsM5FY4WLBc4g=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFLAwHEwtat5joz4i02HHkOIqQw+7MPIG1mhRSMSzDx9AnkAQz
	ngFrzGkGdwoJkBnA0el2D9fjCk3ZoiMtque/uYtNV/KCMuCocZi2Tx33HbtKWKYlRKS41TDQ8MK
	0cMqDDoPilH45n9YqJcJeyIeBK4q7TIeFg960WMi5FTY6f66enJ4u7Jw=
X-Gm-Gg: ATEYQzx5ah6LdPXYq8pd+4+do6O8lyqmYrpVVA8/AtFvVsex4/OAqK21SkvPEKGsf6r
	Pim96nM0rGUtJe403YoPbBMkPkIDoYnZOLmZkfzNEaAFLy9SMH8AToqu9GBJXXoIsyDpMXcbSjU
	ws2GziPiDH192Y8ewUyxWYb3amJiO6Pm1i15D7RFT3f+hOTX7D9aBJs00rK2nnZxdL1DJ0V6vND
	TtFIMomhnUCFzhnHsDpqqmCnWofAxBceWSvzuKjVQHwwXwLE4/VVXCrEubQR2qmvzj/3ztjAD2V
	2tuTCZKISIXLKmSiuJW7QC0OqIfTkIYAf2j7Hlv/u0uysmE69i1Pw8WR28r4tlKcNLUunOOIF5Z
	8IBpeaa9Mi4XycOyVR4Bvrw8HRUwdv8CFDUZkc3Cvdbrq8kbAxL/l3jJJeRHeO/1wvfKeu2dmmH
	YfQRLBV1MbHQGw
X-Received: by 2002:ac8:59d3:0:b0:4f4:c0b3:f50d with SMTP id d75a77b69052e-508db23d4ffmr63775961cf.2.1772704146397;
        Thu, 05 Mar 2026 01:49:06 -0800 (PST)
X-Received: by 2002:ac8:59d3:0:b0:4f4:c0b3:f50d with SMTP id d75a77b69052e-508db23d4ffmr63775601cf.2.1772704145831;
        Thu, 05 Mar 2026 01:49:05 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074496300fsm177126211cf.2.2026.03.05.01.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:49:05 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 17:48:16 +0800
Subject: [PATCH v6 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-sm6150_evk-v6-5-38ce4360d5e0@oss.qualcomm.com>
References: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
In-Reply-To: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772704098; l=3694;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=PbP5HbZOT54hjcl4u46HR+7I6IyXggysw7XDymarv6E=;
 b=xPjuR1/IXLW6OcuyjZzHZvvlAfZjFPgkhBUumCm5uy+lLpB6F1tFgB9R9QSnD1D9ATPpDavj+
 2EWETJBbdnFCbfji+wPN8nVvPK6tZEYFBwcjp2ER7wqe2htnK25bEnu
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OCBTYWx0ZWRfXzVhGECy4ABUm
 3N1VWl9XFi0CtiTfENLyJOxQ8iNsXQwUoTCaHxJ0rPIGpBIouIJxn/JMIXxSVlwn7gqWPy0kgqm
 ziRrZ0rAyC9n3imHdA2A2YCtnzcmIIQrv9gNm7Xt/ky9EUTeHcK6ZCRLngILpTr3xnpV5pAqoQM
 aLXTwdY91GKjS3/KzKiwXU1Cpk/BfuzO0CNES063o+jvhsahUT5Hnb8UjjIsVuGq2PC/W5iKo5A
 08hwLUWlIAwxzxIsgVCF6tdkiGvNQHxmGmcMmRuCiRsmreeRqLoAKnyvYO8pTPrVO+6LUIsQJkO
 eCuMy/OppwQCDcOTYtsNvk0E6rdZ+rr6JIvcQsYUFHNnv2k8G1hHjxQ8aWeI+ADItWf76AwDklQ
 Mqetnn7t5NeAlbJ6YY7t8Ry85I+jRuLk8HZcrxeUTL2ooHy+KauzkazF4D201XZK7qNPDj5k4xC
 Wirk7tPvJcEPc5npEjg==
X-Proofpoint-GUID: WsChlke6E2owqXmFueq0pbDUIvEjsb0f
X-Authority-Analysis: v=2.4 cv=SqydKfO0 c=1 sm=1 tr=0 ts=69a95193 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=nxASbDduW_9Jqosb7dAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: WsChlke6E2owqXmFueq0pbDUIvEjsb0f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050078

Enable IMX577 via CCI on Talos EVK Core Kit.

The Talos EVK board does not include a camera sensor
by default. This DTSO has enabled the Arducam 12.3MP
IMX577 Mini Camera Module on the CSI-1 interface.
CSI-1 interface using mclk2 as the MCLK source on this board.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 ++
 .../boot/dts/qcom/talos-evk-camera-imx577.dtso     | 63 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi        |  7 +++
 3 files changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index defd40ab69e5c419b9d394c2ba557923de9225f2..5301e9dce4cb2b874715f8bf16a648d33339b578 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -353,6 +353,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
 talos-evk-usb1-peripheral-dtbs := talos-evk.dtb talos-evk-usb1-peripheral.dtbo
 dtb-$(CONFIG_ARCH_QCOM) += talos-evk-usb1-peripheral.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtbo
+talos-evk-camera-imx577-dtbs	:= talos-evk.dtb talos-evk-camera-imx577.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtb
 talos-evk-lvds-auo,g133han01-dtbs	:= \
 	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..e0c385ec53b18e88b08166d391a638c42e42a5c5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,qcs615-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&camss {
+	vdd-csiphy-1p2-supply = <&vreg_l11a>;
+	vdd-csiphy-1p8-supply = <&vreg_l12a>;
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
+&cci {
+	status = "okay";
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk2_default &cam1_reset_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		avdd-supply = <&vreg_s4a>;
+
+		port {
+			imx577_ep: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index f877a3e5d0b000e9c9c5ee59dbbccc8cdfa05937..1b17d49bcbea4e3e2b42c70c5eb2ae8120841b8f 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -463,6 +463,13 @@ bt_en_state: bt-en-state {
 		bias-pull-down;
 	};
 
+	cam1_reset_default: cam1-reset-default-state {
+		pins = "gpio29";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	pcie_default_state: pcie-default-state {
 		clkreq-pins {
 			pins = "gpio90";

-- 
2.34.1

