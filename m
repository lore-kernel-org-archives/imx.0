Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6633BBFB2
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 07:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507606; cv=none; b=uYvD6I+mg90sXaaCY/cciZpgJPPANZ8jgvIWEHMiq6ivJm0PMR5ntK32LAOAzh34k1DE7XTIIrZQH/lVFVIWtXVh3lHUKgjTDqcF0GPEbukKwmrA4dUPIlb8pe5O0nkyMGKKbte64gSbInyyx912QXgF/hc1+WwCE9c4NGnqczw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507606; c=relaxed/simple;
	bh=E7CeGzLsAvE26qPQBzedfdcKyXCu72MrhvI0MBEY7vc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RvPVexjjGftYMss11Pok9T3O6AzLh3MuUQqUWkS0zgUc8BuBpKEgdE5DB936xFM/rW3m6GmacZjgqQvM1PjhZuxM9PUSYIvyCAK1v5+orHCpIOkf70xpXCPXSe05Y8GboHLa2gzBIcd4AreAR5J1E7Uhhyr29T64+D2p4b3desw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P87njQv5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vg5ptp+4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P87njQv5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vg5ptp+4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6ItQ13332452
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 07:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+okVD8ssr3GgTvCo7FatLeqFw/vAJdaEkp9FFWDQmE=; b=P87njQv5UEc1WKHe
	s3z+N3dUD6NF8urUymNCpqs9uVD2rQZ0aOwAgwUXKReywS5LIl9Bi3UwZ6A5M9Ic
	Xl4UwkhXLuXbuJScwtmkLXTE6ODQHdgg8cZF/hLfzs3h6TFFrDQkkCxvCRkCgPJk
	baczb0d0fp4INeV6r5ZzkoYCU+mGr8Gyjm+5t3CNTq2nDr7F5L7+9JVVYFfymYYp
	jhkJl5h4XfFDEkhALeERoIjyZs3pFRukl5Qhd/rIMJnQawcDkHVFTTqwAjQs88eI
	hG7Ezwpd1akez6qlFa3650EmxMWsqjEJnMfCh+ry0mis0SK7AClbe1fm1VIZ0Y9o
	c+l4Rg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4erye16647-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 07:13:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36db995d083so2108862a91.0
        for <imx@lists.linux.dev>; Mon, 15 Jun 2026 00:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781507604; x=1782112404; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+okVD8ssr3GgTvCo7FatLeqFw/vAJdaEkp9FFWDQmE=;
        b=Vg5ptp+4HZ/qBkcpz3ANULnPLWZYCY7tYE3qkgNG8EXZXMY6QdHCprZwlyAQJopBwL
         a1BbHDJAqsT1zEPgwA/uoPB4gJnCckiX1tI6b7AlEIklmMSYn3WPGwlqaXUKh76SABrL
         hIcDD3mWWDZep+xw4TTlqsvlEhbkWKaWp0cDhwycornEfv/KnRAtmL29ZpnIpGc3m/ml
         LchznJEfhi2T9t9MS3tYbY3OyxdsvzRB9s/4rhfmDtbQ4igayyC38vSb3U/CYiRyIfZf
         UlUoqmfDx1E11FXFFOWNXTRRhBI2KhV/yEacda9lQ3CaNnM+Yd5J4wVV+TdchffqwXw7
         w4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507604; x=1782112404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O+okVD8ssr3GgTvCo7FatLeqFw/vAJdaEkp9FFWDQmE=;
        b=lKGnJZqVCKtJ7GjomAmxK6z1FqZTBXgBvMC+7eNgoriqWQeb+c3AA68i1d4BcRhRx/
         VAzAD4UxjzT53QLN0TQibGEAJSWmJS8Ra+U9wbsjLtN5Cr5tqUBWVj1042JbNBWkQt/J
         dF9JCRiM5hwfPIw0WjyHqjES3dOoF+WIzf69mH/iC2IeKEXFqUROUdC/ge95VgjZP0Rb
         9zAx1oVFcSDfuvofjYQEfOiXlr9+pNDkl2YzBrh22KKC7+ROmWy9qej9KF7UveEIPGcw
         B28KD6vXEKPRO1yPxjndoIagUj2b7XhvEvd+jvnqrTBKlLu+qlIXUhkCFBuTWUn3kAwx
         2WqA==
X-Forwarded-Encrypted: i=1; AFNElJ+mWdjxAabYLZ3pn+Ov634vB1sC0tXMPZ7u7xoHwqTcb5S274dbVju7FBEBm2HaFdzo8W4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUAPtJQW9QHO/3vXop2SkeExp8xA0FRrGcNTpqYdO34aE0uId0
	mejb5ZpkUSkN2kv3P/ZQvjKx8Zf6rq5QaQ2nkv8XjI+Lv6m3sqvVPtU3AsVbUXN27msBVKgVvO2
	ZwGcpmKDKenZ7niZsL2V/HkO6IJS8VRUZYELH6V++O22uDRR/EwrJkco=
X-Gm-Gg: Acq92OFR4Rbwbmj46WCzCT138DRuHMw4HHF3nG+1tw0Jn2DtbiBkoxUHreSLO04BmRA
	vNLord7DjyWRnixO92WxO2oLb07qIVa+I+APldUi1OkRrr7TxA4q1KiHTGepdYYGpF9Y7nWjeDD
	98/0sGNdj2m6pWsiElEUQJ5e2r00bvZQZKSayFmSCuAoK5ZnntV8PJdSMeF31pjA76srsn6Sq26
	scelMLyTMxDpAmirQWE3KR1tNLtkAl1ct8IkuK6eN8Fcvckfw7VPRPjUGo6778BAgEwebpuDiU8
	dKK7ikVfEdW1TtjeQxvanFoC1y8LDMcxu/k+7gGejd0EKwd+DdIPQN6GASxVCXaHl8F+QKBCOgW
	NFeD+U+6Vd2lNOrralUPjWnQEjB0PC+9YdcibGWucbG6ncIzkBAQN
X-Received: by 2002:a17:90b:5627:b0:36b:9835:cf96 with SMTP id 98e67ed59e1d1-37a01e2fbecmr13426992a91.2.1781507603846;
        Mon, 15 Jun 2026 00:13:23 -0700 (PDT)
X-Received: by 2002:a17:90b:5627:b0:36b:9835:cf96 with SMTP id 98e67ed59e1d1-37a01e2fbecmr13426964a91.2.1781507603363;
        Mon, 15 Jun 2026 00:13:23 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2668cce5sm14867474a91.16.2026.06.15.00.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:13:22 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:42:17 +0530
Subject: [PATCH v3 6/6] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add
 DT overlay
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v3-6-8183481f48d0@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781507551; l=3663;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=E7CeGzLsAvE26qPQBzedfdcKyXCu72MrhvI0MBEY7vc=;
 b=oKXbX4Mg1Z1NzqLOxWaXB5EB9ZWK+zefxeRcBA11wXCYJh2Mou0lDq4j8rzw55rUHdS5kfQV1
 Rkuxe7ZJBiaCyHJpuvEcVQ1DPWHtTQU0PZzr6rG8QibNPAM/OQeIPt9
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: cpEz0oSbIXYqE4Rv6od_txamY9eQTbG7
X-Authority-Analysis: v=2.4 cv=MNlQXsZl c=1 sm=1 tr=0 ts=6a2fa614 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3NCBTYWx0ZWRfX6ruGNN5q3IuN
 5Cq67w9GZSQc+DgothD+G1rVTD4CkuuTVqR8AJB/Zd9vmjIGSL/8D4/f+7R7noBIgsq4SM3i9kq
 ikdXkQArKFz6jMI937Yy+PAFugggxBs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3NCBTYWx0ZWRfX5b5ejq77ZskO
 PNWnzN/n/qDatXqJx1N4TMS72BVo76wYwgP7a3i14IjUEeFk+i6WKClflgwEah6XGRIq0NLgCE1
 BdD1Xoa1Hhj6g5BOJVbwDO1YOs5z1ks4ekB58rIvs+9uSCquDU3AKgv+YdP4lIhbUbWqCEvGk65
 ZKlpkivz8m+g3mtQ43l7uoI+QRp/g35kyUd8cGASkud4yIX+LwbWI3Ip5GibENJaI4B4Q3Lx8c+
 eJ4nzJbNcClSNI9YOvd8hMVurmKvyx/4Guh+j636gFdjqoqFAr/JFljwasimaAqIWpNGakfwLeo
 +hjX4teFKrxpnDQOmE3UvgVbmqtGVrW6cvfJdUShYbqrSENv0JhucQJL4/ruGecE/6v5y/5FDqi
 lks7wVFSM81CD1pJHgxab5lBNBySwC7KpI08glDZ1qInNjIhIVeKJ5EbUR1VIdRgffzKKJmR4RI
 H7arbrBoa2sYZRDRcXw==
X-Proofpoint-ORIG-GUID: cpEz0oSbIXYqE4Rv6od_txamY9eQTbG7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150074

Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
different CSIPHY and sensor supply rails compared to the retail boards
(CQM and CQS) which use PM4125.

Add a dedicated overlay for optional IMX577 integration via CSIPHY1.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     | 79 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 76b8f144983827f4905a72935e8d5291a227dc97..09f2318d1c12c4239a6a7bac4ecbca38eb65ffa2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -340,9 +340,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
 shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..d806fd9f520e9ca4b854714bbf746d049bcb7f9a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
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

