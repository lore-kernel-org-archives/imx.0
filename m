Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B79D3F0AB8
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 04:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790139523; cv=none; b=kkJkd+OQxypC8EVtwDw2Dwpy01e1/j6q0N1LZ2uYAOqRWfR50pSOqq4OmP6OFITSrM4pJekLeFXgS79dJlkHNGh+U1rg/rd64sYV8Ebu32vQ+oLF7X8fB8QKI3lCerHwkCkA44imkdiddapRoVEpEQzsxS7yftgglGwtW42Nqf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790139523; c=relaxed/simple;
	bh=Ypq6Dg2eVufbD0MjECY4yykbq5Ag7/VlnHbUB0+5woo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LjkJMs7hW7jExky3bmZeotAYx34bT/AqVLNaX67v6hEZDM3oOL8NmAmGnY5EmNRK0e5I/t7QI0+r9QBQ+d4qAtzkwIbQi4C2lIWKRfTvvnuE1Ki59rmSrzOC4Ms5WqSjGLzwkPHbszzqq7T9PDZi7tf5qOnGnm3P4Lxmn1ag3y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDfm6N9L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EhbtaZCu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hDfm6N9L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EhbtaZCu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iT0t1590649
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 04:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ALesk1DpfGIEfjQUFR4dRWvtQCbr1M6t9o6IkKBqb7k=; b=hDfm6N9LGUkWs1rc
	ziVwnB6GrscRv4S59/jPdpkqTgsuGJtBSozxi2VPs74e/8OVHmpScSRkTlk4zfAk
	W4wpcD9wUEKiSkmx1uSfthMxEWaqSNW7WCmDdF8YjYuf20isoDw6qQ8Ff4daplYR
	nPOWnGmaxCqcFJpgt/ygygzUXpdNdktosjFSxVGa/1L8QldG0wQjmExGoBEbThrd
	iZEb5zUGVH4x2CuIE/WlL/Aq9MSj4H1k7zoUP3u7FqSpUxr65X734kv+QDTHOS1u
	e+bzLfgxu7Tj8f7cO/vr/wUvoGZRDNQDRrlRW8Qz+THF0JosY9AWkhwLVwsLzjjX
	hs9nCg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurntcfrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 04:58:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-313d1015161so1287686eec.1
        for <imx@lists.linux.dev>; Tue, 22 Sep 2026 21:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790139508; x=1790744308; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ALesk1DpfGIEfjQUFR4dRWvtQCbr1M6t9o6IkKBqb7k=;
        b=EhbtaZCu+qB/fivwWTU+M82Afedb4VVJENqAZHwqHgYqiBXmNPCi+qoTVb8LriEj0s
         o5cIAJ6AkNU29OCkevW6Io9G5SXW86JU5bQ4DzhfDtE045/jL+EI6HXwLV1/e4ZWO9Mn
         BwwHxp15DwvoJqxuIG81ri5DUUZfwOX/tJ9PPfwwhxdNWG4MsNvheAt+o0YtCJYNHZqz
         HKIfUDm1qmXwPVOyZcpO+hxQ5nkZW4ibxTOW0eICYG78pOouZae8cqrQiK998PU+B1uS
         ZN6DF9OQ/QXUo7TwwIOnYDCA9aL8F521MBeXbG/dl2KJygrBD817cxbBCdPoT6jpM5Uu
         ujYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139508; x=1790744308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALesk1DpfGIEfjQUFR4dRWvtQCbr1M6t9o6IkKBqb7k=;
        b=cLc7PoPdjssDXv7CmcomFZ9vZqT/wNVh++31gkx+1wtm1yTXw+74AOTiGPVStW0Msz
         r5TfN4r67ZZLzGQIgH/YoriYVeUMlBdZW8/F+CfqKcoBHLbYrLsqwSisLkBStl7NFtYm
         b6cAovt/PCb0s5O0n26uMOKfDX3mjpZ+FVD0Z6wklCxrCkdXoMCvDgeR0dQoNRAMfRnm
         ocuFU8Ne0Jx3S5Y6rtiQhO0Mey9bB6VojVXctivebWg9WWuB7Gfq6euQa/iZ56th09ww
         FTjpoLtazsw4MazFbQ/YsWegY7RqEsJQsc+T61qUIt9mDhYnrALCO5Dz0ZkZbkJJ7r2E
         wGSg==
X-Forwarded-Encrypted: i=1; AKwUvBy/Np2rjUSZ5dSs+ahyxrbf9iJFnsqzvpSSP/19Fi5AZaE9rqv0C/v+WKBQh9NuRhwfuFQ=@lists.linux.dev
X-Gm-Message-State: AFuF++lw6oELQ6baLmVYwbF2MFwSQGKXEfzSCHjZBiWFMw3nGhVlRa9T
	8ToAjJnTguX7u5Bprjk95YXUx4zWGjfgBRMkBPz9CfT2geyMXQ0aRamX2riqY+H0eheaoIzvIcY
	FuxTSgpK59L4ZuC71+mukvMqWQhDxC0nGI6C+v4wxXHb0nIfNiulS3ZM=
X-Gm-Gg: AYBFou3EMfwYhSxtP/9Oijm5fdXLqPlSxNDa0HuQVaUlltM1MAZgA9rgbEz/TxKf6qW
	7PxI+bAooDEm+81fRv1cYuSrgZT19UgeAKLfSL/f467KmfqpJJgEbv2+2Ajcyu65v7m3I9vul3U
	qYQmMRHj+OfTm5muaU73qCPaBm0ng5GtQK4VQH/zN8dPkp+KYXld6FIb+lqQn3QIWpGICddW07E
	ln8teUe+phuXqWph6hzmOORwTrTAz8ymdjfLhP8WEg9XHt9EQ1FQQJxeCddZRbsLQMZdqVe22qm
	ehyF/VXvWzATNJlyNVUjVJYRDQFW7vqDkqV4r/AC3XmNIyuh3esVKZmC8bJvLjcKyiWkASzgT33
	t6iISwouGX+dcd/46AqXSxuHQ2Qhtu5V0AUNe+FQ8
X-Received: by 2002:a05:7022:6984:b0:142:d676:146a with SMTP id a92af1059eb24-144f90a43camr2679273c88.9.1790139508229;
        Tue, 22 Sep 2026 21:58:28 -0700 (PDT)
X-Received: by 2002:a05:7022:6984:b0:142:d676:146a with SMTP id a92af1059eb24-144f90a43camr2679224c88.9.1790139507627;
        Tue, 22 Sep 2026 21:58:27 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm3168907eec.26.2026.09.22.21.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:58:27 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:27:32 +0530
Subject: [PATCH v9 5/5] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add
 DT overlay for Shikra
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-shikra-camss-review-v9-5-09f5fbea1309@oss.qualcomm.com>
References: <20260923-shikra-camss-review-v9-0-09f5fbea1309@oss.qualcomm.com>
In-Reply-To: <20260923-shikra-camss-review-v9-0-09f5fbea1309@oss.qualcomm.com>
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
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790139451; l=3645;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=Ypq6Dg2eVufbD0MjECY4yykbq5Ag7/VlnHbUB0+5woo=;
 b=NHlaTzoTtEfC1dvSh+miiBbhXHuphwoVF4uPUO8q58vHBJp51O0iu6shpajiOpelJgb4yzArI
 LrrGc+pOAF5DyR1VjslbZJT7r3bfTurAcwVbswgTofksQnDIzfAK/ar
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: igiw-SGT-UKemhTorIEMrmE87f2INCY6
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab35c75 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX0JitVnSNvFg8
 brTzYpp7JMmWAlV3/FGUVIElLkm8n7d1Itgykkz4eGezw7mcdWihRF+Yl4EL1iBpDvGKciP6MT1
 s7aAODzFYT650wKMNo7kEoOosIdgzkasVZfXlO6igTgKtR+7CZa+MpghXBTGWXqKD037BLY5guS
 uagXWIoeIgl6VKdUjkWzGzSqxiRh8Rq/31uo+BAXj1Sd0mLCuoE2pni90eDc2DINdcgFFiAGVMZ
 RPXsnKUUVnsQVP9nccS97DjXu0UqVh1Brh/RPJKXS/KOQ2EJwLHctga6JHNNMYj3U4ufm6wn/qJ
 wQ/tHWiGg+cSiBS5Ijew19jxMAh4XKRNWsejM4VzKCRVg1DMhe1+aL/Q/25+/+hCnRehBe2BuL2
 jbV8Q4pN0JXmoF/vaM3xhWvLwp36WWk+Z9BlJwbs7KID2d5w7YygnDMwFDqD2zSfws84eFeXKbs
 S4Gt2QjNSUN2YImG50A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX0SW6IC3cBIP8
 wVY0fu4Hua+DuxmfPoPAzLFasXk05itvEGTxlQuRzub+wFDkXhJB1qSH06K2V/uK39f8MRE5UCk
 EbNb9cs3noY/Xpxe8O4lBARCT66CeZo=
X-Proofpoint-GUID: igiw-SGT-UKemhTorIEMrmE87f2INCY6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230019

Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
different CSIPHY and sensor supply rails compared to the retail boards
(CQM and CQS) which use PM4125.

Add a dedicated overlay for optional IMX577 integration via CSIPHY1.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     | 72 ++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index c049c3b0637f306c242eb42bc3cc11a333ae012f..15068e8dcbf451c1c3f10e3754d1ea430c20b030 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -366,9 +366,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
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
index 0000000000000000000000000000000000000000..e10fb33996e8e8a01e72a23d4e6b59f4ebbd9b1a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
@@ -0,0 +1,72 @@
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
+};
+
+&camss_csiphy1_port {
+	camss_csiphy1_inep: endpoint {
+		data-lanes = <0 1 2 3>;
+		remote-endpoint = <&imx577_ep1>;
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
+				remote-endpoint = <&camss_csiphy1_inep>;
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

