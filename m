Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3504476CF5
	for <imx@lists.linux.dev>; Wed,  5 Aug 2026 13:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938021; cv=none; b=OddDyoUIU1VA8qWt5glvy3onTCUjd3nTQWm//jCM+9S4T4OGTVTAMLvs/Z2bOAFRcTCCVACDXKpYd7bU1yq+kK2j3jNLYiMLBK7eOGnqT6WKmU8fofKc5PaK959/ntanXquWv9mlAIeWnR2rtp2wxAUQPc8lo3z0rr3Z5Vtadwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938021; c=relaxed/simple;
	bh=flYHAsWqMe1Nmyeu2IpHX/mwqnQXdwl3hGTsXJ2UJ48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R3h3zzwY3+ynvmKTB0ZAVPKn3GoUhWra0nZIshMQH3oKGwLVrceaVNOvmc3Hkh8GbBvRI5LnrYxNa+jO2Gh6k2mPkifV7Cvzkx5Po0/PQlpDYj9x+njXgsDHY4l7w3fllHC3wJDZjrgfQ7UlavPNbT3kW1ZTUFzS6rh5XoCsroQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HLsfoYmK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OPWq7Phm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HLsfoYmK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OPWq7Phm"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675BvuB63124704
	for <imx@lists.linux.dev>; Wed, 5 Aug 2026 13:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0AxWTtHAl5qkJ2pTsdEn68dPe4XsoapBpxQmFo5neA=; b=HLsfoYmK5hMDuRsi
	JTnIUGf948/TrDp/4m31BjvXBmFr9AzFJUmZ4N0RD6agwv0QtGpiave/SFfo/WCg
	G/rD8dinA5PIxzFmYTKgUESL7MjNu/+UDpPjG5qvmV81SS7O/SgFFt3HKEKW3ECD
	ylMXV7hop2iUz+yQJFW5AxX95rCSr5hcMROjnTkO2nPDcxQMNhO497384atpIsHC
	fSnsL4RyTfs8wTrGOL2xirSvWMq/6GxjDkS6gW+bFXwVKy3x2/r5UwPoNikQCf0g
	nQrhHLNfAgULF0080fKNPh6G4xlKkGBJ7M9e2FUA3GLlWdSeWsw/Qj4cFfZFi9gQ
	AyUfnA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv14w9hqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 05 Aug 2026 13:53:36 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81f0b6bb02dso27002457b3.3
        for <imx@lists.linux.dev>; Wed, 05 Aug 2026 06:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785938016; x=1786542816; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0AxWTtHAl5qkJ2pTsdEn68dPe4XsoapBpxQmFo5neA=;
        b=OPWq7Phmrm3FGJFvAWIdUUvqGszWouavfh9k/dDZHLgePKwyl3eW0NaLx6XLxYfHp2
         gj9MY0eYsxp8yp+3vToS9paYuW3YmTjoAW5x9Rw1Pwb85y1cC+NSuXwIFlsWKO5OxfOp
         pwUnO0cCszrs0otEUgV3llb2g7Au2UWaqhln60Qh3fVNsKgmJQgiVS5tg8oa2Cu+Ian5
         LkILWLmj4JcfhDat6Ou3nr2XF2x/S0oZmZEf/PA1azHrmbafw5zzvXl8m1JtrUkcWBj8
         ReotYX4UIXWvtxQyNpEsaG6pFUXDDCUEFMATK5xIaG/ziRzNCeD6QTP0MI/M+59o5hs3
         kNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785938016; x=1786542816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0AxWTtHAl5qkJ2pTsdEn68dPe4XsoapBpxQmFo5neA=;
        b=spiJIWaizFBqxZf4BQRF9QFNztxTXoyw5iba7dqgx5F/c32thHzdjrL1xJRSgjldfT
         isg0oZLTqPrVI/Q65ASLOWl/mnM2oOu/odhmCxfwjhKy+iZeJyXD/dSPY6CJPP/sjkpC
         XzLhIE3Lw5hvJd7LEvlKlnSesxJQTUeMoUll4VEZgo7US4o9+59wKXw+2Ig1A+LsKy1l
         bEIVH19kZly1Tsk73qBzyfmT01VmGl9HvkwcOAbfErUzykH0ocY5OVKylmuTHzMIwb1c
         UAuXSyr7BAgGYBQq7aJ9Si0FUvfvJz22IGevqREXV4Yh+UnNlyivMMvzk4Bl4DJ7Q1o6
         v3xQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNt9xMXsbjq1Q6ulhnf+5zc6r6nrwT80LAgNRrXydw/FhgfElb0YqczBVZrWEoZMeqGRc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4ZR3PMXgotEaE5XdGPFfYgEl8cCou2wvsVuC891SdliEbe3Lq
	YH94bzGXQsNep5H5WgqO6uciadgSiwYJlXb228ivMZaYwHdKk+QqBlmfS4nA+CSsfScs6qGjFW1
	n5OKkFD2gF4B0uUqazhJZj9+KEaBkSo8OqeJKR4P12mAgUBMePTzSukc=
X-Gm-Gg: AR+sD13js8JR0odbbzxZd7OLSfQuLVqZVmLk29tUKDWW362k//N6Fag2ONmnbjjwqjo
	ZJ34yRskiuN455zpdx2fiUKzkZwRrGKZZgtxyk6n+dRxKVlQ7D5xszahHI1gn3Xvf00h/lv6NWt
	irowEigSej6v8mahnpKPX30Ga4ZplFukfrEPzEFZCI+k73CoseX8HgZLzVsOZgxpbnb8pXdLKBL
	WKOQwDXG81KyDYJmEqh4i9T7vB2uYqIo6uHmXXjIZjYkk69UOVyut4N2JUxvGIiLeeFrBg3Dl3/
	zIIcscaBGDrklTyEY22ULVuOz3X344m+6z4ER45xhKQJxIgwqpbSggGm6O4obEnAVE6X62pOqvE
	yvy9yfVuwSx2msfNN7L9wHJpR84Gjlow=
X-Received: by 2002:a05:690c:6aca:b0:80c:2874:67b8 with SMTP id 00721157ae682-8202b0832b8mr40762057b3.32.1785938015768;
        Wed, 05 Aug 2026 06:53:35 -0700 (PDT)
X-Received: by 2002:a05:690c:6aca:b0:80c:2874:67b8 with SMTP id 00721157ae682-8202b0832b8mr40761777b3.32.1785938015288;
        Wed, 05 Aug 2026 06:53:35 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8201320ec71sm20892517b3.12.2026.08.05.06.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:53:34 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 19:22:49 +0530
Subject: [PATCH RESEND v6 4/5] arm64: dts: qcom:
 shikra-cqm-cqs-evk-imx577-camera: Add DT overlay
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-shikra-camss-review-v6-4-a8dbc66f0d87@oss.qualcomm.com>
References: <20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com>
In-Reply-To: <20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785937970; l=3728;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=flYHAsWqMe1Nmyeu2IpHX/mwqnQXdwl3hGTsXJ2UJ48=;
 b=PDMw2aOWYrYOCZFdzruf6zNH7k5l6AoNAcwe9ZZBFFBOXv16kpouXh6hdvnEhSyvNTOC6GX2N
 XzVzwFuc728DLzuZ3r7NkQqRtxWQx8CZ6NCsP+Tb5L01ZEVnFzKkWeH
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExMiBTYWx0ZWRfXyaq3z9UbOnR+
 LITBZ6Dn7CxsXZj3iewhMLTKYLAPZ/QHuGS6mWCNJu2a+vZRWwXIrEXWBoFj0JlYIEmeq/Mr11A
 WXtTqgoJDxeWsXUBsYo/3/3pgYj2bEI=
X-Proofpoint-ORIG-GUID: YZGi0tzIs2PfquLK4GnUUToIxS1P_UWi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExMiBTYWx0ZWRfX70h8zlQt1o/G
 GCHAXko+A/VzUfw3iYx+0iZqmlrr7qlsSSxwLAa3aCvCG4mirCRu4qD4qb+FGcE4aV0NnfKtizG
 Uu8CPh0cmEPZ8Bo1MvWaSnmsDV+7rYCequ+SaAToki3C8VhgABnoiFgdB/ev/zVMtSY6j0Uut8Z
 ZXBFAdxGOyNwuB2qojvlxKpM4wCmWexfT8uQ04NYi4KhbAhXrGAUfxjYqhgQ3OV08d39V/mtlfd
 D0DeJUTkJhPZbb7ucB2UUr8301Ci5gbcPz/g7Xe+OREnzz0Lho/7eir++Z5Nrm2dypTiF1pupxp
 BqX27k5wv2W+dUUWHKEYWOrGxvLdxH3QVDvGGg7LONpCEipQX4JTRSjmbI4W61RTnKbSqDYNNuF
 4uFAQnVRX1PbVsSwxxai8RNJuaysr1fgHbePT/L4BPAeNjRRvYUaxHyj25OHu+Rv/moF1trFW3L
 +36NHonoGhc2Aqxfa+g==
X-Proofpoint-GUID: YZGi0tzIs2PfquLK4GnUUToIxS1P_UWi
X-Authority-Analysis: v=2.4 cv=Cu+PtH4D c=1 sm=1 tr=0 ts=6a734060 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050112

Shikra CQM and CQS are retail variants sharing the same PM4125 PMIC
and identical camera supply rails. The only difference between them
is the integrated modem on CQM, which does not affect camera hardware.

Add a shared overlay for optional IMX577 integration via CSIPHY1,
used by both CQM and CQS EVK boards.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  6 ++
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso | 79 ++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55d539f5292816ce06c9a46bd4904c..03ed24afad5795b49848a2548c0facdc9f3e7115 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -339,6 +339,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
+
+shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..3a481d972cd27a2a324d96d8f47c161e11ea54f3
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso
@@ -0,0 +1,79 @@
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
+	vdd-csiphy-1p2-supply = <&pm4125_l5>;
+	vdd-csiphy-1p8-supply = <&pm4125_l13>;
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
+		pinctrl-0 = <&cam_mclk1_default &cam1_reset_default>;
+		pinctrl-names = "default";
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		/*
+		 * avdd and dvdd are supplied by on-board regulators on the
+		 * IMX577 module from the connector's 3.3 V rail; they are
+		 * not SoC-controlled. dovdd (1.8 V) powers the carrier board
+		 * level-shifter that translates CCI I2C and reset lines
+		 * between the SoC and the connector.
+		 */
+		dovdd-supply = <&pm4125_l15>;
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
+
+&tlmm {
+	cam1_reset_default: cam1-reset-default-state {
+		pins = "gpio33";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};

-- 
2.34.1

