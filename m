Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736B5423156
	for <imx@lists.linux.dev>; Tue, 26 May 2026 17:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815640; cv=none; b=BHgD66ef71VnUmi74nMlbvcr+KIhG1APOH0THFak0n4eIqlp65bJvTTNjuSagEwPEaXEanXQwo4SJTWT2r6HivqJG9R3eNgdMlnEilgffApwnh0Tt+D7Q5O6LaSaHF75F5KBAomlEb/KHjRxy2ycE7ed1MkW3qD7kOtvSkBtGe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815640; c=relaxed/simple;
	bh=xImboLMczBQdAyz9gWg6GBSKFU5e9Ka0KWu8CeYxrCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cv55rRwINPMKWS/wHDEBKWXCqJ2Cs/MSPjl9RIVawaN0PHNwzJC0dVShLSgemQ+rtQEC71xAJNlJGNqAv7pAkkT2yEKZhsDKFnZWOJmjvdrxerni2k0wBq8ap8jAq+eGdVyC4G6MJPulqbpS/3WrIq1UJ+uoNJYX8VyV/LF3DTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0MDOmS0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HtJfRaQa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0MDOmS0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HtJfRaQa"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH1ejT069550
	for <imx@lists.linux.dev>; Tue, 26 May 2026 17:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j/VpYFMMpLLmKzbMdrg0+lrYz7OLrPF5tO36GfEIMoY=; b=b0MDOmS0Tns7Ipev
	je5IjoPK0TMAWlL3t7B/nxGR4YutfWrB9LlEW133f+2bw1YD7Ja9s8/1IkczJ2QW
	/UR2wpjOCqFqZDzS1B4HT60OysDmLVLhmQ/V0dJBASCq0Ho1uqwamTI1mArgIgbM
	0zAKf6HiG6NMeJoXLxArgLlmgsdwydanj2L00T2M3iT8JLU8Fnw/9x4I4+6Nfxmg
	DKRHEGFxdHw6hYCPNE7rt/ioeLgpkkhk2H+XBFIjhn3OYZ1tHPiEYS02CMQEFU6H
	+9IyJLnBM9d7h51gP8xvZIUUqby0JL73Sa/YiZaC0QeaQXSM2B2BgSsewCYRqmPl
	ejjDYw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edc2yhame-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 26 May 2026 17:13:57 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-841127f960fso3661510b3a.1
        for <imx@lists.linux.dev>; Tue, 26 May 2026 10:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815637; x=1780420437; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/VpYFMMpLLmKzbMdrg0+lrYz7OLrPF5tO36GfEIMoY=;
        b=HtJfRaQaidgX9dT+x+Zm3cPXNJsUmOA82dO2xRFJ/MqF8f78jcfIk8MpJa6AwY4qvW
         Ji9c30dkv/Tcal7Ar5WBbYCdhi8ShIhlfUPxoIyt4YSOX9xlAp9emeAS24ihwSeLtfOa
         X5XmzFKNVNCqdQDyA+352zTy2KNtR8z9O+V5SCHaFsFl01rdWNGoGd1D7Nkei0UT50tg
         WzI1HRg9KY144Lt0fQWDeFGUSYQFfZBoX2xj3cxi6DqRo8OKdcn6h19C9f2XLNCmft/d
         hz6GOTMhQPf4qUtgdAu8/j3Xz8gBvkhoh/SQPIMMM6iDlC3PBCRlj5l+oW+RQKpJtDHj
         pKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815637; x=1780420437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j/VpYFMMpLLmKzbMdrg0+lrYz7OLrPF5tO36GfEIMoY=;
        b=a+WY9+zOH3aMDDLFdV6A5CT6aapsXNRYShtWm99TcNaR0NntI/cbUQq/GqpOweaqJf
         4A2x8rOMS7ffjv1sSGaPIoTLYdcLYRpxa+kqFYotndCaGg52oEcyWCcgFw6DXBSZXxLN
         nUMIhe8SZb6KAQQyxNA4V2IuOF4z52J95HqcMz5BJouJ8dFBfeXSZAtMYV1BFgBS6M7C
         XymSHL8S4u53ZPHQ6IaCq/46thOjCoX35Ls3DTPSM4LlAL13kDcmUl+RxfAZDAZWpGFJ
         PKu5vCFRPPrdh3UXFqxEUUuD89bb2AzZpVG7/Bhg++z+7k9FxG3s0qiG1N3sn4+SwN59
         mnyw==
X-Forwarded-Encrypted: i=1; AFNElJ+x3QbH6qsxNG62YU9fbcpufyCggeLriLsN+WfVUT2vzoXidc7OOzcBAMgazaXjlwdeZtg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwlZEngU4+YtQ9poNL1hwopOXXpjOx8C+zXvTIIZWVEaTErlQy/
	bnJKFnqpxeohKloaYWNbe24CK9gKHa5ZavYojVCfHNqXG1j24MBPVHjiqDlcqI+xYRX3Mcj7goK
	JVrfzkHJ9NGK7OgDYbql6rkOd0IBD4xd9cJgsDCNCzSfdrIQSqa7z44Y=
X-Gm-Gg: Acq92OEGMVQ37JOTps1Zed+SRfJE7Gy7gkQ/Svkc6SleG79Wd5ccCwB3RWGrQzpLSRj
	c5Mn8IrikFIvj904Kz8Amu/h3QHlMBvAiluOE2vw+xFby9mFSb6uSuWTYCmHm3hHcBINLGDRdFx
	YHAMeTJE6GbCvM4k2hVhsJt8PgT8zy3JBpT9l7iO7OelJq7dMGpVgCzLb1aIwstPvlwpEJ5hifR
	Dtun8UzPvU8cvnOIHVdP3Gk6Mxd7Qr7dfQAnGC3lXyQZuRBZpXEyP5Ofl8etMnEiszjcgO7WrXT
	pXKULkUdFh0/gIVP82QCZKF+RCVFSHkZQ0vcrFKN5ewkK8MfXJLMc3MGD3wnfmBKozi2To+oXgR
	H7rXegRpQeyDRqrL/qj2CvEMTDujoSB7MUnpxEElQ8N3BDyWHys0+
X-Received: by 2002:a05:6a00:298f:b0:83f:638d:1e64 with SMTP id d2e1a72fcca58-8415f580e40mr17369728b3a.8.1779815636590;
        Tue, 26 May 2026 10:13:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:298f:b0:83f:638d:1e64 with SMTP id d2e1a72fcca58-8415f580e40mr17369687b3a.8.1779815636112;
        Tue, 26 May 2026 10:13:56 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:13:55 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:42:52 +0530
Subject: [PATCH 8/8] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT
 overlay
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-camss-review-v1-8-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: tK0ZGMqj_KBMqmlHT4KhKvpCl9eQyvKm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfX6eCYVx9iZv47
 UuEA+dXQL1eqaPsPZbQiohOiUJFFGSWKpAbVon0SPI4LAD84YtudvLU+5xud1wf4OPjAhrYNNQi
 hW/brrFuuBAjczQRz5J/Ch+9xI3e6rmNENZnRp8Z0NgZ5wcGqSVHL/rvfivUBSOVj020CsBHmK9
 9wy5JgQ+a3zwkcEhMqNz3ciyJH5E2SucBZGWGSzUxErhtYNhlIwwBVePU2Dp2lLiHp2WjT0FcuL
 YQhI4XGRK12S9uI996e5DA5JUS2sHkh6UZWUhdp5Y1+I4FbvZiDtQDMyyswtVAfNP01ciQuMbnG
 qAZX295CCP2AbhKQ36JEIGRe+UdRmnUa2sWv/EhmVF0mEw78kbj1vGiwZpZtConVpq0ZFX3zup1
 bWjsbdaUHWc2kmUcY/Wlvl64uz4xMudavyYU8I1X1Y6e51XEKZHDQa3Sc9v1SRb6CmKsU6txR+t
 rNdR3+eV9mmpNXd6z9A==
X-Authority-Analysis: v=2.4 cv=CYg4Irrl c=1 sm=1 tr=0 ts=6a15d4d5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FHwBmxWp57AShg3XVyoA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: tK0ZGMqj_KBMqmlHT4KhKvpCl9eQyvKm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260149

Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
different CSIPHY and sensor supply rails compared to the retail boards
(CQM and CQS) which use PM4125.

Add a dedicated overlay for optional IMX577 integration via CSIPHY1.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     | 63 ++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index df41830e18edff82893ca24ca84d7e03065d0ef7..2a728c975a38f700360e317307036efb0968a00f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -340,9 +340,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
 shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-evk-imx577-camera.dtbo
 shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-evk-imx577-camera.dtbo
+shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..f0423f1ab4e93abdcc7cad8977b39e31b2437e8e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,shikra-gcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&camss {
+	vdd-csiphy-1p2-supply = <&pm8150_l11>;
+	vdd-csiphy-1p8-supply = <&pm8150_l12>;
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
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&mclk1_default>;
+		pinctrl-names = "default";
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		dovdd-supply = <&pm8150_l15>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};

-- 
2.34.1

