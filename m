Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE87472762
	for <imx@lists.linux.dev>; Thu,  6 Aug 2026 11:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786016655; cv=none; b=tk8DcCCoTRR1+TiRzeByccitaSWjy5A824/UvNgZcpNjLx56i4C5bzRj2t+kRcQKKo27E0P9stHHD5xk0aDgHCIAjsAmnKG94mqf5eG2aB5/GuM6BxJBsA90b/b3BECV2DsiFOVI9rXCEnsz77RhQJWquzhJ49W9UJBKO8BkIV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786016655; c=relaxed/simple;
	bh=flYHAsWqMe1Nmyeu2IpHX/mwqnQXdwl3hGTsXJ2UJ48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T4OS9Z1SB5F8/9PRv+zdoi85Riicav2s4V0I6i/fSm5IzrW6Yrt59bBlheq8LXui40Ji+Avjr96yUGFfcfEHFVeKwAqwa7vJOyDus1z9Y3Vk3DHGBhT7XfY+a23H7wdrpItjzxL2nMj94JYmDFPNbIrnGtqZ7otUrlfu711d5ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gU1zl93T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D6V+Ouc+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gU1zl93T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D6V+Ouc+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nqZa1579434
	for <imx@lists.linux.dev>; Thu, 6 Aug 2026 11:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0AxWTtHAl5qkJ2pTsdEn68dPe4XsoapBpxQmFo5neA=; b=gU1zl93T5jCPbr4l
	WWDj6gLTvCdJ1/v3Kg4SoiYFe1kkyr2Uw9VdsrcLyFn1L0TjhuN7Ct+bgBTeAHjZ
	Oo49azSly12MgP+aCDlGxbvPUagbj/ilFPcq6+cKPkwLeUP2vLT6vWWv/sf4gmA3
	n05h17rfRKGTDJzyj6utN++DbL15bUT/gklwxPzubmvjsOYRsdeuuZbfXxfSDlIw
	BLKbfiA22ABZOp3I6Ci7k7ty7j/SKqlLegiyDi+4q8NOX6/ncBGQXdQBfz3EqRIJ
	kRYccDBvl047G6ukb53H+U/fSYhRpSr+mzBwanqvAR6aBVVMCWo6f0pnQ7Qi80we
	enCZuw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvju8hx78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 06 Aug 2026 11:44:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8485d853b08so3616631b3a.1
        for <imx@lists.linux.dev>; Thu, 06 Aug 2026 04:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786016651; x=1786621451; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0AxWTtHAl5qkJ2pTsdEn68dPe4XsoapBpxQmFo5neA=;
        b=D6V+Ouc+qnpDDXy5N+5ck82gP2MrWBXyDVzs/OmAApac0l7+HlfICY7KmnzUekBs8p
         +3CJSDo2P/GY7YmGvXaKo+CIYo0OJ1bugU/tIdue9RgsUP2shooxDXwVcfFCy/0GJe1D
         tlO1hTKMw+xdx8F90NU8ybMHQeoKUs2xD5wGzlTy7Hqhv1hyVZHth0BauRr/TLeA5/jQ
         nYKugR7b0HSCD77HQP15saVHLiwFfsBOx1BUYpnJW8Z27peqPkrM7DwYzv0n6zY8Rb3N
         7W+25u4R2SdtVMgtax828HLwjEXmRi0W7LWXupgttwAQiUMMEegQmoMxcFSVxjPmJuQp
         NB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786016651; x=1786621451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0AxWTtHAl5qkJ2pTsdEn68dPe4XsoapBpxQmFo5neA=;
        b=ZYTS9BmsC8T+XrPyPMbPorFPdBzS7LSRzwre+cO3MjzeU1s8omA4/PizMGZmTateQ0
         FipcmZYQKuWMPIHsX8GQ+gqxhCVmKk4F0VM28ymMFODvZPQ11nfVEnqLfDoiXGGAwjkp
         3wH8g0gkskf7jdsAUuui3NjZDhcNQ7AalcIyi9E3MmEgRNZeh2djpMUeXjhlyVY+bzW1
         JKoD79uaYjg0mRyr9lQ+XfaYIqzps5vfcEFkbGojwFAHQgHIxa3at9oEFE+UIrGcPntS
         k+PXc+lx7AJ9w0JzQ0dmzydL2fazZsJpEjqKj/zo2r+pKzBDf+h0WqhwFJBIyyrUSPoD
         sQEg==
X-Forwarded-Encrypted: i=1; AHgh+RoeockOvPmGjPOtJMIyqORc5/YwB99LXZEeOJr2tzHbFBD+PZQlzhS+xVlt73wDF6HHs8M=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvRU4ogn/Aw7ZAuRWkvGE5vFsBRK8XVc+rMeznDt2lsdbxO7co
	r3k3VCGsZRtnsJJX7fWsBjEPzkyceaK3gXBTrDR+nH/mKgDM1yd4S7QIFOScVzohDj+14jcGzaK
	NTwr+Cd8pY7p3ubRcZOFk5+Vj8xmGDqytN0sbVtQ8yFAqo0k2ODRRJw0=
X-Gm-Gg: AR+sD12wh6PZW6zqUhuIPNQG1DA3KDXpXZUrOM6tdtsWBMmrw/pYF9S7StIdRVjcAWe
	vmEit2vadHbVBhceJ+S4tCrXCO72Vw6QEtvS6i31OcQqfVN4LpQ1qDX3ke4GYKRkntthDYIVDvi
	J2AMDg0xTRIbeuI2XfVO4qQVU63bQyYFViUP+LlUaHUuGKdPHuv3kWzYbiZ06BTikCvbWEe2PnA
	64eN4lJaWtFWOi57y30YsaIzfr42zCPUcpSImAgUWzdKmiURsZFS4eCihzMNeGQ9la3plzQkxR3
	BObTfeHbb59OAZpCQPzJ3yWnFIAuLnMo/Dr0uRuIeWPmRbfLu/Q1uMbxmy8psXWbkG7vORn92vw
	0lEclplUaHdRhWCuwtHl9lB3Y3SxhS/g=
X-Received: by 2002:a05:6a00:278b:b0:848:7b92:8e74 with SMTP id d2e1a72fcca58-84f2e0dc994mr17478221b3a.39.1786016651278;
        Thu, 06 Aug 2026 04:44:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:278b:b0:848:7b92:8e74 with SMTP id d2e1a72fcca58-84f2e0dc994mr17478151b3a.39.1786016650815;
        Thu, 06 Aug 2026 04:44:10 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b75dcsm1234756b3a.34.2026.08.06.04.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:44:10 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 17:13:29 +0530
Subject: [PATCH v7 4/5] arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera:
 Add DT overlay
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-shikra-camss-review-v7-4-c7360fd6a5ac@oss.qualcomm.com>
References: <20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com>
In-Reply-To: <20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786016613; l=3728;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=flYHAsWqMe1Nmyeu2IpHX/mwqnQXdwl3hGTsXJ2UJ48=;
 b=+NRK1V2w+DTmTUaqLRTPFAq3rJUHzPs3aeOzAqPyrR6crfUEjHKjnWNHtpZDXgE59xenOHx7W
 pkS6MLmq8lxCjt43CH3uX1Fyd1Z/uKB4H6voc8q1+28zPel/UfHnlq9
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: GO5v3ZJWCeIT69Iv5pi8Gx5JwwZeHVOC
X-Proofpoint-ORIG-GUID: GO5v3ZJWCeIT69Iv5pi8Gx5JwwZeHVOC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfX5Ag0EpCLjAuj
 u3xhVsJD6kDmtZMM+7TMmcbfTlA+nPjB2L48DTpM5KPeoTgMf3yKKy4zmdnUPtUZfZtNf2Ah2Dr
 LEEP9akZWmUTrgdnK8+lF/0jziAs8y9VGrcCLzxQCi/Ur11u+ro02RKFxSDuJ1ZOFexwpnyIbOV
 iZzmPP64z8KXzSr5mlOVU2o4++jkePABiHMk6pUR7ioPxGIK7l0y8VXhDh65OlzbZocuXlxKYZI
 W3TYOZA0zgQKOLlRcbuYUu+37H1fnpvzVmIQTcnJpi3g6wCOTgM1tD0CKEB1Eo7D22C8jHHSQ5/
 LJLIRUOXNSFqzcRhnAw9Tb2woXFdOq4A36TantlPjlKN4RKvXGiht5UFXG3yz9PB4kxWdJJC76d
 XPY77NFMWuDGJf/FjsjoBOHkwsSLS34ki6T5W8Ea0p6ZuRaO1PAB0Gxns3pC2X0rNJwfYDiZheI
 H8ZCi6YbZAQqtxkSHAQ==
X-Authority-Analysis: v=2.4 cv=K5cS2SWI c=1 sm=1 tr=0 ts=6a74738c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfX81gBzK+F7lS8
 qRt+F1s9Uo22rmCdyB9jJ8aSp0pT4GUwOrNO573pVvcV0zKbSLXgwimz/C/bRAp2IhcyT4SHJpa
 pIvI6TlygwtKaey8T/dt4PBq3/r249c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060092

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

