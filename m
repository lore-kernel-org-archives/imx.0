Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2811B3E16B2
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 09:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783934970; cv=none; b=GZxT/WpjqUcoizNKCjnozNpRL60FLwTqqCZA0BDPBnZ5qySHdR5JNdojpHnfXmACW14DZAz8fVwCdUWt1JBM6zh5r5xVavtjmWzx+CmIBgpbC+gqWBc4gFqlGJ7vhtCiFBEHqd9G1dnC+KyFts3jJ8yXTl1yPKPo01iCKR9mjq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783934970; c=relaxed/simple;
	bh=H9Q9S4nCxWb1Zm1udfcX8xIsLkHTU6m5iJ+3MH4b0h4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A8JkPsPZLiJ8GywxSQ2SHIpoSmcDBnc14XvO0uN15UIIGzqVR+z4+zzaKCfk4xVjTYpIt7AQE/Se29C33ckLzNa2qwuLWJuhENuupikX3DzBm8NnR3APf7IT0FdbG0e9ICdyvgsTZG3cfrYPvxBETVDvBJgSTtb3xJuzTcZrGpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7xNIOg6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UtutJbM6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7xNIOg6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UtutJbM6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NfgY731613
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 09:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sSZ7t5V/1PHtqZoF8nlySg/mPA+7I7GC9LLE6/wWuss=; b=N7xNIOg6XHYnBa7P
	BcyAYoQtCvjgZjqfB+qSMcovEVT/UdJGw4KaT9NaTSfVSwnDCZOVCsQX6b0G9KHX
	1qT7ftMycWobPUf9mJV7ZpMSI+2yCXv6Niym9CubAodkzJ2Y6j+tHPWKLpFLTidl
	a4LwRU5DbOXvX35CTl2Yd/bwydC1LF42r7jTrZG59Aw5pNc04SrfnIxbassmjgGT
	PGTc4Zi8spdGm6vJxmeYRTtnW7C1w/ffneCP/JCBC6iZc3nopTcKGOyCj03egX7J
	zRfbERtdt1TbMIzN6IwI0qfpueNdQo+akuJiTPuuz70eTs/j2aSH07ocTdrTAtXn
	OK8rxA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn39ur7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 09:29:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cab041eced3so2762896a12.1
        for <imx@lists.linux.dev>; Mon, 13 Jul 2026 02:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934966; x=1784539766; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSZ7t5V/1PHtqZoF8nlySg/mPA+7I7GC9LLE6/wWuss=;
        b=UtutJbM6cLTcGj+qO5biuek9uDxl4EIQfMQIee6Sy1jXswqPnskxqPUK1ognHohqWw
         Oy2i5JxntvFAa1kDrJdPQCKcxgEPRm4Qa+/n/F2Ljj5MyWVpFd/9RySaqhwUP7zqBadk
         B3Xn8XJSmKd+SzEZlaN18hdEasGVk+g8UoH2QC/6et5za24lB0r+15mD7/6+SQayX092
         L+ED/CZS/msNeS096Alms2Kc2rYoGzIZ1HpJOhrPkVyg114UlBTpOdniYyk+MS/POkFT
         ko34ortHC2fNFXzM7sloGrgNf+FiQh6XtoVD9unuJ+xXUZ0CvPGXd/Di2fhP/7fSdEk/
         dxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934966; x=1784539766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sSZ7t5V/1PHtqZoF8nlySg/mPA+7I7GC9LLE6/wWuss=;
        b=RmpM0HG8HYupoWJVqsFnA7wpl0GBZq/xYj5aPhZJZAcK32t8MU+oc/hOfVv9A8e5wk
         eDtHCk1UPbeNPvT3dfm0TiTFKuncAPFvchAt7/g7TqmsDVKIpC+//A7qaZGP8YqqEBBB
         JLHnGkMGzbM2pXTQeRM+ZFIbhhTDb2ej9qVyRQluqNZsmqx6EFYnCEzCoD8/4fFIgwD4
         jDFhDAozCkW7RHJG1ffPuZYDHs8X0bLU7QnI2tDLqwC19twBNxbnbpaLslwxNTT4wS5q
         0TL/FuRP65ndnbXKuOvng0L5eC8X16Dwws2DywQOH7p8VPmuI8YV+oJ4t6Ty8ZcCj0ZH
         Xf8A==
X-Forwarded-Encrypted: i=1; AHgh+Rr6DhtmqLf1xDKzMMprMuDCCBRS1ePra6xNllyf7DFqOal8DlEaSSsGiX3PhUIhsSp27as=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywof9cCeoWP/UWfgK3MZHMbAjDZruaT+uPszXB5idqPOVBgmuPT
	ZpQQl73xAi4BzrfpozBGPOAUahzCPlSQbjWFQbjz5B1JFTVAKesG4rL5z82p9C83lfrL1HMYyIE
	cSy8owFS1zVlPy41cbXQBsX8vJcBX+IBUL2antks8Jppj0rw5mdyLl40=
X-Gm-Gg: AfdE7clYxuqjhUhqCxLGi8TVAMOQlxrwnxpAWAjEkF9Bdk1hhv5c1U2EqWHFh4QCSlG
	U938OtYYvTsqdXRiL1SnPkFvdrGDMkmn6QUwRdwPbesXlbNDG0MJElrohCxwLMlEEqkUnCagwuX
	kL3h8aKihG8M5OJrZs1zaLD3NKXXC5OSt5E2fb+jQzWWNF9pTTRGXksjRtg4kEGFN9OPqy1dCS3
	GE86/jagy9IsTcyychA/LimM3DldScOrMxlsbHScH8NWz4sG/IMVuCyrVQL5hcla4jbZN/Yi7En
	9qhKY9V1UkNaUIMxWc80bAe1JVDNRueSP60YZ7/QENPqPm1Mzwe/VJxroFzKenDmomLGT9qDyGB
	1L+xJpUOlCeuAdtRaDHFjNHeP+sSvziJYKve426ZfjA==
X-Received: by 2002:a05:6a21:7105:b0:3c0:9c19:658f with SMTP id adf61e73a8af0-3c110d3a4e1mr8672774637.73.1783934965660;
        Mon, 13 Jul 2026 02:29:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:7105:b0:3c0:9c19:658f with SMTP id adf61e73a8af0-3c110d3a4e1mr8672742637.73.1783934965170;
        Mon, 13 Jul 2026 02:29:25 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm47495569eec.24.2026.07.13.02.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:29:24 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:58:36 +0530
Subject: [PATCH v5 5/6] arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera:
 Add DT overlay
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra-camss-review-v5-5-db53be15dc4f@oss.qualcomm.com>
References: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
In-Reply-To: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783934917; l=3728;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=H9Q9S4nCxWb1Zm1udfcX8xIsLkHTU6m5iJ+3MH4b0h4=;
 b=n6NGtWx1z0UwRlU/KynoW2KeIaBqayHnbWyDUSFlDl3NEIs+7ENUg3o7YcZdvwQK69ZseZugq
 fixPTl0fEILA2m/UmVn6vIMXeEaPHUt1o7ygjNeBlrSfIR4ifbwG2ec
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX6KQFkgZxucoX
 UdujLWRPbjZV6k2KDEJjNrETk8ARqQ7SR3KCRTD2ISFYJVOq4JguTz2Huymxr7MSRp4mvwglXmr
 p4oNGZld8JiV1ZU0On/OsDyOzgoNnPkeIcVuTUei9+fE8anxCgbQ0r9clwQf2/U6yMwOFVRSEaM
 /jkElLzYUjYDSVRRl1iHAWI+u9CcuN+v6lpTbC3+8gdbOjoDuSg6U5nchJ8/YtwIv91lk0HFIIx
 AucvcpumV5Zqbn0R+wheywAjF3YPiXIvHQDwFkY+lXnR1NN+djAnGawGE8Rh+cANRGmI9oK3VCc
 nOdkzh4Bbo16KPvOJn8v5BoLcDBLLz2EgLARj+lCzqIrHougqAdUFdIZPIGiWeIhffzc5HhC1NH
 o5ZA5SNifO+B6iGnG6BW2mm18qCRa7nRKPd5DyTbEmFvkgJCLlLVPf/5UTp8yVLUaz0OewuL9MM
 eaqG8vAVYFY2qNX3CHg==
X-Proofpoint-ORIG-GUID: VmWL0fokIFzMgPin4K-tNjjyD95Y9YMC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX7QJTLpIKF0eU
 cfY42SjuoDuVNzlwgSmcLD2b1o4xYhZJAvVLyD11xicLjNqtU9uj6gkhX0PkcDufzoKz7cGEE8F
 yBHRuFwMNoxNVBGpN7L01pNO9HjKXCE=
X-Proofpoint-GUID: VmWL0fokIFzMgPin4K-tNjjyD95Y9YMC
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54aff6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130098

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
index 33e9199511aa1c229de79f8f1e8bb598a31e49c1..16e1701b6b338c2fedcd4aac4e331336c59780a6 100644
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

