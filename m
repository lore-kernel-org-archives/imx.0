Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5053D4134
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 08:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512500; cv=none; b=baajWoVfT4gjE7gO1TBjBUEveu2pHcd+syl5qatNmUWg43dCnDBNou0F/si9psaTL4UZfrOAOI/TQjX1d8HDl1RoYCUUh+GPiXGA80M9regRPvD75vPS6W2K4vb1F76eoKm+CRrhHP9aaQwl+npaiNvH6kmlTApmQL1ftwK5NHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512500; c=relaxed/simple;
	bh=86sXsUvCK/NB9tywTPkpmKSS/j4crBI4S0ZLvrfM82s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cOANKQIweCcRQvS/bNMgOewjNwQaj/yCvSUZvw9UY8Ony1okrBbKqonxORrgBXaAE8BSxTElq8F7FuhJx+bpNubUVz0nqVzNNZZMxQoW0wlj4s3j8Ery3QY65VOhwhfPvuZIlpv7STZ3/jWVmYeOL5Il6csKjSEIFduqUJhBrAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ItH0BGHk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j+6gUeNl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ItH0BGHk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j+6gUeNl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6J9so3250412
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 08:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oJgy3DNUy2GB+MmvGxEQQo/FlAt4h4kNu4Jgs7rdybA=; b=ItH0BGHkBKyR+U5m
	x3wQnYg0Z0NMz//fDUahmabf1yJfN9UNQHd+Uqi1Ob5MD7+OxcBP7pJ9ab17wwsN
	sgHuUPt7tmzX3Q1TYNBwHPPIBtUkxjSgFVfqFYhd9wsd8vSv4TfnPZSZdSzk98tS
	/WYub2QPRIoKjZF9W9o+Nnu4nF/px1yHSDhTkW0CprlKESgZQH7fvS6F3MFDxmPU
	AO72m3BfbGOnMADgsPWgTpIqKxY9Ac5kioHnC+2oAnZLAL5XZMecRsJSH/NxRiqj
	FuZi2h2BXvMkY15+yglgc747bgmvJT9rW0d6vQwguu1p6Q9yPKl23OdRnWGtf0KZ
	BamU/Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryybxb4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 08:34:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36e09ec696aso5221965a91.0
        for <imx@lists.linux.dev>; Mon, 15 Jun 2026 01:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512492; x=1782117292; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJgy3DNUy2GB+MmvGxEQQo/FlAt4h4kNu4Jgs7rdybA=;
        b=j+6gUeNlTvcVdjtFclh4HjUcqY5uBdmfgHfvRhfTqInHCgNivCcqPu52jUMrULHvN3
         m90XAYzt1UhuH6Z1r6jIH4K6+F5XosLb7KKpWZSR3gSKyHMVPl6ypQk2x9gasej+Ml2y
         h4gpRQpyMbvJOI2gYxfMsi3QUbgYuKMJTHZCZExNIjdKXbqvNBZgJm3UqJ0MoVD3413m
         BTV5edtjiyab8pbVatnG4F0Oilj8uE37NqTvrr5aJLRttwu4R5crUwoBhmypWa5YaC1b
         n9GG3Kw59hvwwRedaAim59vYYoDnbOFfj3Nj5KI/RvBMZDc7u32PBXP+32kqHLBd6ou6
         EfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512492; x=1782117292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oJgy3DNUy2GB+MmvGxEQQo/FlAt4h4kNu4Jgs7rdybA=;
        b=DQOdWcVFITdLlhLJeA0go9Uay3Q26AY0/1MTtbB5jisxOwEPwquRqnac3DTs0KXbZu
         FK/q+0LNoBzIzTEonw8RVR7n6VGmDnVjKbTPse4ZFFHwfje28X46nYZhyyu4nYC8pn9U
         os+6n8c8AdzUCs/E7qZZ8e+M69DYlISs74JWtkhqLWhIG+42dN4FpYerFOJ1Wq4qfcQI
         yGDGV45O8pcQLPEVLKcs7kxKmw228Ff9EjJusysBu0mqBqEtrGpbuu7LjDw/rUEj03e6
         VlJg13dIVPmJgeuRpY/v9n5DVmLTkLOZRv0Wb/Nzs6jPRmzdXSe3jR8/qBqeFZdYlJsz
         n2Jw==
X-Forwarded-Encrypted: i=1; AFNElJ8MulzAacrDhmRGOfqDNeMs9lrKlK5yUt2/epMjjIka8c1xBQ9eiozVDbvxmb+e0qBSPv4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoxhRWe5t0/AjGsghS6rJ7INji2i2hq8F/Oeq7PHLdUNhZ9MBp
	uVo8D5Bn54zynkERQk14Dk3bwZLCHmACUXB5zlmHXnsBSIuAOJ5hRDg8qJq4ij+0f3WbHSLLyia
	/F95Yqc+VHW+FHfBlCwCL9RSeryC9AY2xJohldzpMpjsoWL7A1j6QUCo=
X-Gm-Gg: Acq92OFMSipiyA18v5D+pyeO1LJ3ydrGno7u+x7Wj25j4XPIY3Vzj6FJAp8nY5Akztq
	AXg1ZO0r+E6GlFRT98OF5DB3/t4b1f247tTeP3623rhMQA9/svqNDERtaL4cM/bjxeWG/pUeRec
	oH+YDNrZDQLvryr0Ar+3B460keNfcZRirIoM9JqHkwDBwd3jPrEKSXMRwhP0sq+DMFAxmAqVtjq
	sefw6dMz6mvDM2dB0wKcRU1tvOfIS+t/f136jVfmAS6mtLBEFQgIZAKdTN9r3OZ9/csGL/5xeLn
	xAfhdxreHAwcqPoKePx1iqB4j/bzwrCYraWj2AQAA0Vi7lcyNXiUyWcWzcQjgDdG8ZoZ8/gcFaG
	5dfAcsfalLoF0XuJsQerY1HVU68PTFPU25Lxgm4soNnOyEmGLFiIw
X-Received: by 2002:a17:903:2f0b:b0:2c6:9448:363a with SMTP id d9443c01a7336-2c694483867mr7693305ad.20.1781512491798;
        Mon, 15 Jun 2026 01:34:51 -0700 (PDT)
X-Received: by 2002:a17:903:2f0b:b0:2c6:9448:363a with SMTP id d9443c01a7336-2c694483867mr7693085ad.20.1781512491308;
        Mon, 15 Jun 2026 01:34:51 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c70easm122789235ad.25.2026.06.15.01.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:34:51 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:03:59 +0530
Subject: [PATCH v4 6/6] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add
 DT overlay
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v4-6-bcb51081735b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512439; l=3663;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=86sXsUvCK/NB9tywTPkpmKSS/j4crBI4S0ZLvrfM82s=;
 b=AFevhZYVm8Sy6eMT0e5zugn9wRNuGPmB4Eb2NMT60RbAak8HDv5GHGmoVsN1fBNKodTiSyOya
 O3sH+ge32u1B7ZJY91uPTVO9Dt5/+Yx/hEqBlRJY7ICzkR+Jcbv/pGb
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: Qpyv4KdHk_rbtTbXaELpsM15gilo8VUj
X-Proofpoint-ORIG-GUID: Qpyv4KdHk_rbtTbXaELpsM15gilo8VUj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfXzgUtBspjEZQA
 Rr+NypNi7sV4JFMDae7e6cVKx4NkH+LgHLWXqRm2TwDjh1azzG/DffXXfwIqDnsfVE26o2sfqaK
 hOmmQG70o6nOgCYVksnZOCVAEc3QNsw=
X-Authority-Analysis: v=2.4 cv=JLYLdcKb c=1 sm=1 tr=0 ts=6a2fb92c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX9DS9ubI6fTUL
 OdBMLu/jPb3mJppdigQSPWESAD8Qo6/JGnZ1r7JmPP4c/H6nGa5dLN4MbIyIdPo4MenygDhQ9ND
 Lm8T8ydV2CdKkXlKoM2Mks+PMuoukZVUZwuD0gauKGIOW7kCT9tTYJTSVcDGoHHTFOYyTbCETQl
 StANPPLmk1qD5ehktBFRv9ZAnn2PHF45lAV30bGxjaAJN/rfZKh9IU0EoEWM3+qlUoQq1CbQjo+
 SM0od3EHLJSE3Gc2bzIVMrf7Dpb3w0X6swR/b5qnE/OhcT2dx+TRx242ngq7L7U0Qzv0Ltq4i6B
 x1j2XOzXhfA2HsZugT+kf+3dlj+9dT6ofUbdZOZpZY/Brmvwvm2mQDSpxoVyjmE3kuWKsFCIOQ+
 3NsulReyFpA4Gjpcie8wq93KTQ2jcb5akQJs9jrGS1ZbQjJoUhSZc22bro9Vs0Oa1ijnDcpVrrr
 etWlUAWRtBXzqfvt+vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150089

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
index 0000000000000000000000000000000000000000..d8c968a918c67cdebc0e7c6fc14ef820c97ecb75
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

