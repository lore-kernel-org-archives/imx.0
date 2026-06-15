Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4779B3D3D05
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 08:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512494; cv=none; b=bxP3KaRDvgOZ4CxB15CRz8bCEov46MN7iHYU10jYPg3vHtIv0/MgU5TsmmGsanQNZKt/G94W0HJm5P9+hzLM2RcGwQ/5Qsqrzgb3zcBhsjs2VT0LTZaGtdGQ3d+Rs5jyDm98Xy/gRCC1O0g2kbr9DeM0Ie4BJiz16sBPyJ3+hzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512494; c=relaxed/simple;
	bh=X503i/Mth0eTflp/hBfEJ8uVr06pRZPumlIjapac8+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RKjRFCJZ1VB1OuLBPKRhs9+LI7HgH5+bE4Buafuu2B2VsN/Hz1BgA74sEjaLD/oVoR8z8aPVKzNbnGVtRjQwhtyV0yd8CwBgNmQF1nbNUDxXUZ9eaJLIsuLpdj1T7sqwhrXZ+FM/oEgMskGCou84l2B3pCMW0E0ge0EvWsTkVm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eFT1Hah9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eYOu9LOf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eFT1Hah9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eYOu9LOf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6IsRd1835983
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 08:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ogg4+x3ABUq0tZ1UsQhDlNpMjMUYFLtgDBX0fb8zT00=; b=eFT1Hah9jS0fxap1
	ii3Npy85ddvflo+0FlYx9VL+jciwm3Ipl8rmTG6lxVtZuJ5c4SHpDQBGLIZPGZKe
	NzYyzuxdTZFMWF5dqaU9u+/IjAyfh3OCwtkr/Dy4/RO7KTTe9qsiq/ekjtQkBPoI
	te+Qbs7cwjQFhxzAabgVzK6LSwEGXaHVDjd9y3hXxMnG+tm9uR9NjvaB45nH+Pdu
	JFn5dgO99t6zilMJpriwTYInaMmMIyUX+h1Nq/rrAqJbPmm/ZszUoRwM75ax6Dzn
	G8IYFhp+kUMw/Ul/2mvtv7Zo2G1/psThhLc8YJGvHiq/YkITXXdMOXmLKnumnodA
	AdEueg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryffpdn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 08:34:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c272e532so33227375ad.1
        for <imx@lists.linux.dev>; Mon, 15 Jun 2026 01:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512485; x=1782117285; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ogg4+x3ABUq0tZ1UsQhDlNpMjMUYFLtgDBX0fb8zT00=;
        b=eYOu9LOfng1PF9XmlEqunmZcyDGUhFYnSSPNBzfOC3Tnko5kKXIdPvemrbgg7Gf/bq
         kbrFejYHFubWAfbPs47m+NoezcRsFmcUpxfAXNPR6xriL4/I2vjWx2QkEnr/P09qp+hg
         1zkUoqbB704sNPpVi1ZGBCZW3bi4KLSIoiCQl6VKR7wvw1CjA2hnBctPgQ14UEnPv54u
         zxZtauxQPDfrL0tW08xQ8wKiL5S448qkg+IDnh1K5SklpZ3WqQlF6dRD/XiCi2o3Aeei
         X/dJrA1I3y87rddn2YBcWmsvk41k2xNyk0DaXnQnkGvUyMW/l1ttOQTqoy2U8+5MUVFl
         HUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512485; x=1782117285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ogg4+x3ABUq0tZ1UsQhDlNpMjMUYFLtgDBX0fb8zT00=;
        b=Pz731zYXeAKGtvKF9kvqhVy4QnDIe1hV0kbQtuf3SJBNh1zB1adRb3QcvWHghGL5oK
         MPHM3zkigRrDenq+1NHf1y10Bjij9yqMCS/8h/LisKLLyf7Cv2U5It1GkF5vil4aobKg
         NwbYz2rrgY1400qx4fsTHi4jpq5JeWu3S95G7r17/q7Xj4lf5LvyrX52kNio+RQGybi3
         3MnzMBKr7y/Br9Vt6K4Jnor+P1J98NrWRSYLAdfXuNR/N1jLWqV72bhDoSh6m39Iwo/2
         EcLS64R/Tqm2Fuwlp7DtQsGmFPeF2i8gDAgsX2829dPuIfM3Y7YMPeJvnXCU37aKp8UR
         ry8A==
X-Forwarded-Encrypted: i=1; AFNElJ9Acle9pBB8HFIdiz7BlAk068JTNZLJ+BZ3jFxuKWYw7i6A//TLDYyWl1ZlHylpIHIWedc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzp0iBDVPJ/8xmQkg/zu4sQ3wawqQQfhAnWSsZvqOYhQ/F02+im
	Q7L6dvPbkVgZ87FyageVhVA6cmnBF/NhTVFnyAzmeMuV/C7kHgB9ll74OBefAz3odnxGpa35z/q
	QYqxhWiQK+EwPKN2kXoh2BhCxRY3c6GfEj+gI1cekBE6Hw6IyYADOoA67xzygojE=
X-Gm-Gg: Acq92OG6QRWu9y+wcLgIFTnzfu8SWmTJd+WgNA+sXIbz2dmgX8YtzHoW+NR5DTbpb2Y
	RI3XgWCXQSoY1AuV5fIdoPbO7cvqsdPw4cvkCL/JQBEGnTeqNAgcwcm4oqctcYEMsMRDJJBVCUJ
	+nPX+KS09e2hQg9PNs5DUk/NRyriMJCPxG5eCiV1L0XfhONTThoRUd/fAxc7JTwpSVPytdZ18AW
	FGYg1pDA2on/+TFqoIblMcPb9Nr4Y+KUk4+93Hkzb0NmCobYf26nvzEbNklhdsZRxWLB5kbD8Wz
	08sgf69vn7JPZhbgl8k9RuGCyEgF7p1rBEfkd4muNAN3yqPEpex/1c5BTSW4qr5hTE36HeFa6OK
	6qBGwRfStzOoflq4j6jNOLKUzsemL2ARbr2BU3asOoku6/Z54Js0P
X-Received: by 2002:a17:903:1207:b0:2ae:450c:951e with SMTP id d9443c01a7336-2c6641e180cmr104881205ad.17.1781512484552;
        Mon, 15 Jun 2026 01:34:44 -0700 (PDT)
X-Received: by 2002:a17:903:1207:b0:2ae:450c:951e with SMTP id d9443c01a7336-2c6641e180cmr104880975ad.17.1781512484003;
        Mon, 15 Jun 2026 01:34:44 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c70easm122789235ad.25.2026.06.15.01.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:34:43 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:03:58 +0530
Subject: [PATCH v4 5/6] arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera:
 Add DT overlay
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v4-5-bcb51081735b@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512439; l=3728;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=X503i/Mth0eTflp/hBfEJ8uVr06pRZPumlIjapac8+M=;
 b=HSVeJrzwoJPjIg0lth7jjpJ+yu4+T0MG7EJiH0F6k4OQXUeBwaFIwd8XaW3Cnbau3JrX0ZOPL
 Ht73cPtScrRDrVj0aPkrpIAiYqSkDJ/yT3aq2UJ47aF55jxuO/1Mha3
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=HuxG3UTS c=1 sm=1 tr=0 ts=6a2fb925 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ob7nR_YLP3HBeJlLsJHbRh74pPYoqYJj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX3ITUosES6P+2
 KRViwefa/7v3xKYWtqp+dfTj/SjR9LUef8W9HpLxx8phcEzvPElcBqgJtMz2LBJ9UxTJjBuHZrB
 akkgUMucOET62Ev6Ts4MbTYvfb4lbNk=
X-Proofpoint-GUID: ob7nR_YLP3HBeJlLsJHbRh74pPYoqYJj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX2mXScOG+OzbQ
 YmGK8gAIC1WfJl2MYyIotlgaSjYEpTfh2ymVvueO8JF2Bdx+ohTc3sy0hw4rT4P7UQcPp1Sc0MA
 tf97ZKDMkP8AzRtcBBmjUJ1122W01E7aD0+1dJmEAbzUI0rL1yBSveppyOk/E3Qc1Ydd716yeju
 W1XVKEmrr/iD1c4OR1lQU8MD2ScDHUqoKC93rWr1SnThdMg3ri5BbL2iSyYUtVROvruAuRQVSs1
 iyk2GYJNwX88pc9Xkql8OMrGYyKKQFBn5o8QPbJvt+sSffRLYs7Xu403uZd09+2AJwXKNShoSlE
 gZXYDj76M30xsY5oZO7a1UsPk/LFqTSFqqx89YYNo4Whg4eHF7Xbh/I7FHKgPrdzDq5N5nLv+C0
 N/ZyyORdKH0LnD16SuHV7zZWL3l7i89iKEPh4T/QaoM+FyG8kVPmjMxS2/OVQQuyhhVGq4P+V7f
 n3WvRVWkgM94XFWai8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150089

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
index a9e9d829fb962386b3975f345ec006504607130a..76b8f144983827f4905a72935e8d5291a227dc97 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -337,6 +337,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
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

