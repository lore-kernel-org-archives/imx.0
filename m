Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBDA40FDAC
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079023; cv=none; b=KvN33JJqPXQI26eyjmGw9aeRfuhuuWw2YQyPDJEQCa8W85i6h0OdRCMUqlpuccx2tUUf5DF+wyE973IH+jmdBiox09GY66rBFT91j6fFxFYCbrbNytTiP3UUrYBiG4gkyUaTDI+N/iKhQQwZAnwiT3lKzPD7AjHg1V6pWyuIFqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079023; c=relaxed/simple;
	bh=t5OG46p4ljnSn6Ugt7/7Wx2T2LZF7712SOUc7lxrUEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nk4MGvKTn6EZp6yIelY/5azQCLXTeTR+N0egA8rxi8EyNg3tXRPPIhHI8+GXDAIXO2AVk59uq941clvNBXXKDHn665C62xODDYWHOtFsTpXxk1aDQZQM4rp+kH0vbbSo5dx2XVjSm1MVdWGzb/XhZwB/V8NTj5goJMsafoiTsGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evXaYxiB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jm9wlsqZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="evXaYxiB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jm9wlsqZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M81uJj2279967
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hgRWl7dvcHPI/iM3lLLq/fDWsyOLgllUFc6gqOMV6G8=; b=evXaYxiBSZQaEWYv
	+VBuSfXwQhkd87y/Bj0AHJ4meuEOTVNM3rFH+6b6vkpPYPLtrpoSCazdObFE9RVm
	IonjcAU5x4ETLTB5Yn9UvT5Xo/h5bfa21u7un59kndyipQpR9CXspqStcZuZAT46
	4lyMnPqj5eav6fTHpuCjJmfdtx2lkIIqA40WwvjweTn6NoLF2Az80URxgSKuZHXT
	vGgWTDza2YHIG7adWsaelUD7iTnHW5e/pJMCXZqiroRNv7ZsAAc/NATZp5PbHF0L
	Kht9wN38j6taR7a5lTHZZoB3LDAenpIIA4YG48TuvmtrnL7baItNL6IpoVj88zxb
	IOKEFQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7fat0u0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:50:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-502aaf2d18bso26329571cf.0
        for <imx@lists.linux.dev>; Thu, 22 Jan 2026 02:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769079017; x=1769683817; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hgRWl7dvcHPI/iM3lLLq/fDWsyOLgllUFc6gqOMV6G8=;
        b=Jm9wlsqZilA9UuIQcagqyp1NZEBUjZp602c4EmKkJ7HOS9W/z1vrSeSDWH2/HcFbnA
         TtSnDTC/mV8VoiiE1c7bPgNRTX/xacZBTIlabB7nLbN6NxJSt0+UaB4iedTpnKZ7myBI
         2FJAQxBY3Sg/k5Fv0DIyo30igo+Y5shx004ZhrQoqJ98pDyhu/fmHSOyzY9Z4Bfr+/+M
         /4l9+TXH5xfrWpdQ3C9JGrirGLZDQfLv3TvI7XT8t/hbLc7fN1NlSTtGTvysDa32NlM1
         KoWDQc72lN9H6laCVuKpI0+2b4+NY91PjtqtyLG3Ff5XPHr1G5qqRNz7FM4J9h77zgTX
         ejvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769079017; x=1769683817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hgRWl7dvcHPI/iM3lLLq/fDWsyOLgllUFc6gqOMV6G8=;
        b=UOyqhkTSnGxX09ICORJQpkyDXvjzOPcnLMzmk7QFOGFCQc0OUJegHNv8NGbcgJgvuf
         tRo4eZhpOf9Dy9rdXcZjJhHyr3CJVVesd3y6oMYhKgfjAVn/rOMNIk4mJbakHUwuuMze
         hBiUqQTiquUDoBOKut9Jd+BtxqljwWb9x3LRWcbVjVsLxLvGXjfgY/1MlxKIMpbM0skm
         fWnjk4Nwz1KsFLkCYAXn/mmW/Jd1k/qVMC2sARjCGpJlnjl3CuLCOBXn4Z8jhyByS6rV
         j5oOkWsYm3mqgbOf3hBvQXGKrFl1QRTXzXlawhPw1psBfHwihfL1RhbBO9+riBKJsXAs
         fKJg==
X-Forwarded-Encrypted: i=1; AJvYcCUAfDnznXZtjaRvTJXROn5/KWfA6zf4vcTdHKUs65INYKvJbEEbMPednFKTa37EZ6aN2f0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTQICiGaxGxS6puWiKXJAzogMNqPWb9EiP6AvIi8lNXXNPtjUS
	+JOsd/hk6YqGPLa43sS0DpFoPVAV8X93iIkYkGTLvfLt+OJ97Kkwo5yia87fSB4g9dxFuZen/Ll
	aiGjq8O+r0zihGaLy8worBBY2zxsncNHf/klKguCyU4FfLglCTVGjLMY=
X-Gm-Gg: AZuq6aLTKK/GNtEIocksf5Xz/9y7qYnHkA1ujkjIHJ7SI+CqjM7hm3g4zExPKcT9Mq/
	RkdzIzWZkG5bMQBA2GD7rnqb4+D4gSL3BlnedpiHEGycgoLBxoVi7+ZhjeUUVYfZdyby2yDBbWX
	uiJspUNJt1D46ZHIRw0TlP/welPAj+XO+0oBxl/DhaR0BGH0Wj/XCypLkJ9s/MoKX2fr6V+OCzc
	NFlwu+ouhvatXQ+S6ZkpeXwbZT8feGHEyahfVlqlm2HrK4Hk2M0BowSOvJ4WYw+kfuFyC0vZh8S
	SyaJYsulJuEU0c3NbdnEC4+6dLYjjqTMz/bVPXd0JZoXCUbjDlc6bb7QjK30c4KQp7+VyIFFFl0
	gzLvPT7QtUhgttnIB/xsnhFQ98NV6AS+oep5Px1su7TUMn6RR7lPsYeW7xagye7dzBLCdL29bqD
	ec
X-Received: by 2002:ac8:5fca:0:b0:4e7:2210:295f with SMTP id d75a77b69052e-502d84b0ca5mr104417571cf.13.1769079017250;
        Thu, 22 Jan 2026 02:50:17 -0800 (PST)
X-Received: by 2002:ac8:5fca:0:b0:4e7:2210:295f with SMTP id d75a77b69052e-502d84b0ca5mr104417371cf.13.1769079016824;
        Thu, 22 Jan 2026 02:50:16 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d9ee19sm121704901cf.14.2026.01.22.02.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:50:16 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:48:56 +0800
Subject: [PATCH v5 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sm6150_evk-v5-5-039b170450a3@oss.qualcomm.com>
References: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
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
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078967; l=3019;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=t5OG46p4ljnSn6Ugt7/7Wx2T2LZF7712SOUc7lxrUEc=;
 b=URKlVySI9bGyFKXmi/af25h80gqnu4VJjSXLLRwz6zqMcNzAll63j7bl35RrIxcIpvsSQ5ynL
 ezsaxvknZJCB/yHb/I0v1nG7WDk2WKAFwlUKpi7YznekQBDOvCW2je9
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=Hrx72kTS c=1 sm=1 tr=0 ts=697200ea cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=G5RPoKDYpsqj7oBEIzsA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NyBTYWx0ZWRfX2F7h2JQdjRgs
 z7oVPa14mNHZrAnLui1Xc+lVbgk5SDX10MFh/61qx5ltiGMut28zUTGRLlG1Sp9rr5DOHkeBfHg
 dmHEB8V9laEM5O1Bs69/+x96+oQoNf0oL8TnBU5TfQfiraj7sVb+CbSrT3sk5auugQguh0xOswn
 Pw23Q1JJbS1uAOOZHbrOHkBsGU6MMPcq00oabScXuzm44sqvWFZs7vDiA05Xe1C3zImX09+gcMw
 kSM7JBXZiq7nQg6rVyNpLcTA4kNvl+sDKbcEJ7jOVIR+8D5kdmKsRx1iwjAbps80ZRDLQcnLfBP
 MY9pPDygZofHzTrQhth7Z4eVRSldWWzOmDPclqB/J3bkYR5g4eJ4Z8fXt//OqtvKNS0VPXuxEpx
 UWnc6WXuRcxP82PJT40lRq+YP2BoEyWWf2/lws0VDODb3OMSTyzuTrMqrcO6ju0Bvh13vcscRSL
 Dwn2MrR4sNpO40CJieg==
X-Proofpoint-ORIG-GUID: 3e-se5vKAqhCPBEOyzXTyIBSzzp3yY_r
X-Proofpoint-GUID: 3e-se5vKAqhCPBEOyzXTyIBSzzp3yY_r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220077

Enable IMX577 via CCI on Taloss EVK Core Kit.

The Talos EVK board does not include a camera sensor
by default, this DTSO has enabled the Arducam 12.3MP
IMX577 Mini Camera Module on the CSI-1 interface.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 ++
 .../boot/dts/qcom/talos-evk-camera-imx577.dtso     | 63 ++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index a2e48b58323c10735c8b98996cee6669e4f918e7..b505b5b1aa2feaaae691977b35a2d872751c4a46 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -349,8 +349,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtbo
+talos-evk-camera-imx577-dtbs	:= talos-evk.dtb talos-evk-camera-imx577.dtbo
 talos-evk-lvds-auo,g133han01-dtbs	:= \
 	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..53006a861878f9112673b9a0ad954bed7a5fdca5
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
+				remote-endpoint = <&imx577_ep1>;
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
+		pinctrl-0 = <&cam2_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		avdd-supply = <&vreg_s4a>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};

-- 
2.34.1

