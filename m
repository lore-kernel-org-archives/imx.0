Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228003BBFD5
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 07:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507600; cv=none; b=W3lBvr9Hd0YOo1Ms2uTkFPahD5pOq6QG/PnabZmr71c01X0afAOBeBPV5EuZBdb4fP3ywgy/qlAL3rsYamWtJnDqZB84R3momXxSKuu2T27VuXbA4sUu+nP0hMQe0D3tsJ0QN5DSK6btnI6q2Q0wDiKsuwhRrrGLWT0b3SrlDpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507600; c=relaxed/simple;
	bh=uTL9b6XbA0RtAXsYmfuH5ui5uiOY/IkXuIsNHvc3KvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eli9FHON/ZFJCFYcKOSZkHICGtBZAu7RICjl/cDGbNvslRQI1N395mP5WQ7JCpKXGMi/zRojnucNuUU58wFmCtZpMzovbTqWAWi+ch1grioOqCLqqzZp2mT3bycuiYpBBKYVmqWh7K9RQ1qLqtMxsRJNcusefUDBkKE6Y3iH2wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cMKg0+Cc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ojawa6U4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cMKg0+Cc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ojawa6U4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6J0MQ3344558
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 07:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VMYIMAke9Egc/yVx7PIrN4xAB45Me7NI309julpzCAg=; b=cMKg0+CcGZtEofP6
	Vm2Gj5fuqMQcQAnKlpt0K7N8H4hMgZhCTO1ZqCTEUfzV7ttTak1RgAHxglDOmCrZ
	hQ/9wXVXhVo5SSfFHgJaeLjOn4HQXBNSralSgefPdfYBaokyMahWXBiz+JFJ+LLv
	SD9fQFczZGuVvHJ/VNToWZ6KQCkxTZnsw8Bq2W49t2m6JMW0Oilli5xQsz0A985Y
	vpvY+CVRr+TvGQUXIHfhP5H9YiK1/lCPr7Zd2ptZvhRzJPQy0eMrWMFYJnH943ri
	LI81TcgIzVk0X4J19TU0I9J7UDKsrEKqN+EkW0jJZSm/Ma+GBvSUjWp2f9STudfS
	EgLpYA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9fe4mu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 07:13:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d97955899so2947229a91.0
        for <imx@lists.linux.dev>; Mon, 15 Jun 2026 00:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781507597; x=1782112397; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMYIMAke9Egc/yVx7PIrN4xAB45Me7NI309julpzCAg=;
        b=Ojawa6U4kgpqQgiXohf+SE78veAN0VS/xeyoYrKMOgvXsLzY5yk4vg57c7/gZYBsjZ
         pVisVqYUeV6i+MrmYueYV/UeYoEU9jnV/mXrmpKSJV7ghfLrjeJsHb/4pBsCpLErsoWz
         lzSBqJChKMv4Wwlc6gcsfr8plZyXM6/D3DvT/8HPx+wd/JGIbrsHRSujqzNTHpAeVkTb
         NOH2GWT8ZMgvshoV1zsBkoUMv15Wf9NZOmskt45jr7/BEpoE790vZ5OLT450ag82LhZV
         uqEJduiChneXc5GHcSkRnaZTGXp/JIXU3Uj4EgtPSFuJUm99U8wBS4/GrGztrcgNKxYu
         g86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507597; x=1782112397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VMYIMAke9Egc/yVx7PIrN4xAB45Me7NI309julpzCAg=;
        b=ljeVfDm2Q1k/+fFrrddXADVT90IM1e6ioKxb+0+dI/Tr13RJgqlCrbAJur7IpsGcjM
         Ws3I/Eqv8t4hTEmr2b5hITct0ik7hIuM6P3k8KL0n+3tnCaRX3oOxwo719WbxVxkYSrQ
         AgfbR5GDoC5EpqmLF7VDxa/LyxVPbVFCmFxpAFj+WLMNXhgo7Ff6iIHxCmSViF3o6UPC
         BNiJAXkTHQlvbF6+R1T1b+kZTJ3Tl/KpOvPKqCjoiCAA8creTbrxYfIt4GpId8+/KypH
         cBPDF2Ou/3He1hYPLvZKhkHONmfkEW/OZGaZYdBPbe+ClwmsxJt/s+sbgeVIhoQQuYyB
         yqsQ==
X-Forwarded-Encrypted: i=1; AFNElJ/BJSiiXQINs4E4TgdMmAw9Mf9E/l3qFqa2ka81A9oKEIQ21OUXajzhWQ3DORcafhuh80U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2NceaqPsAlJublt1a3vDjrgRdJxj673mWqMd+51MtPulDnitj
	nwJ999/f33qYYAbhi4Ug6ydnGGrS2aILfiFKylLzlgfmek1b++xLWyaycviWdgl73jeIt3DuHWs
	Kw5cpzgaMlQh4hsMX25Op427yUL5LPUIRCLxzgZfR/+5wvm7YrZi5alA=
X-Gm-Gg: Acq92OG6HVY5CEriNkwSN/rCiLUFXbqvwl/kDUwdm8tjYETz58YQB/s4tEqoAub4bky
	c0xIfXYUT0E03RZfqYRg3O/MHFPLSaPmgA7XrnuFYrn7YvbGN4jfY069nRenqgLlvWLfQfN+tG8
	hwLqzrjfPKYkurnjTaRG5KYiGgZu29KkBivK9KKOR443QThjNSPDRZcG81b7e7o2VMkO1yLVWbp
	YHMCauoiImR7Bl6Q5T1fRUu/pVt//gyC3VhT1hq1SWupyLWC7bf1fIxMs50Mw8u81zVXOlQ6qiD
	Y1kjQcQBcq7Y24F5nvd1Vj+qAPP9IoHoxw3t3xavWEKT1JTag94/AaiJT1Emxtz5gRZZ6fa8eh0
	f5X7Dj1FxIXkMkPOoNx/5Rw9zuwmsPtjuHpQMmgli/J9QXuv4npgX
X-Received: by 2002:a17:90b:4d08:b0:368:b01c:85a0 with SMTP id 98e67ed59e1d1-37a035ed628mr13606869a91.14.1781507596571;
        Mon, 15 Jun 2026 00:13:16 -0700 (PDT)
X-Received: by 2002:a17:90b:4d08:b0:368:b01c:85a0 with SMTP id 98e67ed59e1d1-37a035ed628mr13606824a91.14.1781507596089;
        Mon, 15 Jun 2026 00:13:16 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2668cce5sm14867474a91.16.2026.06.15.00.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:13:15 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:42:16 +0530
Subject: [PATCH v3 5/6] arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera:
 Add DT overlay
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v3-5-8183481f48d0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781507551; l=3728;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=uTL9b6XbA0RtAXsYmfuH5ui5uiOY/IkXuIsNHvc3KvM=;
 b=IB1ghu+w4PvpyGH6m0Bdnutb3tvpsG7T2pM4eyAH//Ujm7h8j2hvoG5mLCD9eCaT/meO11WSe
 FQqQreHmmuwCpXhO2fvpzM/r8856xfGl5oUyy3yAlAdzwqvM1GBTdVQ
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfXwxGhdIGatZ8E
 UqDUHUfJAWUvlo5ViRi40YSuJ3J7BvbHS7GgvPpOuvw6fT3oeHSEYfJ5apUGOSIRV5fp3sc1Fql
 JQpLjoDRIvmmjJWd8PEHGMnbiiSb0RrWi8ZJX6f5wu9azmLdi0sJ6xYBgusYTzXrlyKo9qPNRL1
 wkmMJoEFdhtwRqeXPfbDs65fWtVm+c93F6GgzUgU92m5CCNcl8TlF3zax4scHNjsNu7Xgxr7K6Z
 K0nmza4fTk/w7dipJuxzKqV0Oxem4q3gOrVRees51FjbQRJAd0XodImHLHrObabMElm9+WlK19b
 17PFh0rq9i7OSB3ZOHehwIO5Lcfdr4lrbFBJEF310L14nJkJf01mhsujN3xpuZ0i1Ch0+x+R2R4
 rDIZu5fuT/hYnxKkd8lDkCSPg7Cc3eYoTNSgxnx/HGnexwgku5urt2k0vDfdQyrYamvaKQoJXS9
 awSqOU136Sfgvg+fc7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfX+6LtBX5ckbXL
 5LPl9+ZZ8KV3aOod2+L8vxdwOlbq+pF1XmCeltH7RDOPC+M7fGWXEgLqtjyV1fMg9xkKULTg3e5
 fBGgqZzBzf/AO2wqX/ZB09LSWC2UONw=
X-Proofpoint-GUID: 0VtHLWP3m67zOl-W4RiOJPskb05tI8OM
X-Proofpoint-ORIG-GUID: 0VtHLWP3m67zOl-W4RiOJPskb05tI8OM
X-Authority-Analysis: v=2.4 cv=ULvt2ify c=1 sm=1 tr=0 ts=6a2fa60d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150073

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
index 0000000000000000000000000000000000000000..037cef17ca8196ddbb5c1b0c301702e4f0ea3a47
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

