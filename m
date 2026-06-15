Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A963CF04F
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 08:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512470; cv=none; b=k+yu6bEHHSzIuMJDlTZE2nMI2oMVTARnDZxXMdI9zAoCUNKZ//GrPavvo+QbaiN7Hl2MMXbndF5UfnVPJoQ3KJ7lSOe/TuONTKnwxqfgJPgXVfc8hCFz/6QTKnrAOaobqJ5muVn/J6rfQ5pdoQ7qgQK22/LxzUWfvIsznhiVfaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512470; c=relaxed/simple;
	bh=FD/YYzeYflttpFETR8KNzzuysuLGEKsTDke9rdJBgPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K5xjIsh2UJ8nIYIMMGb8dZ3cvkuXbESxOzKOu+n93vwUuNMFyksOpdabtjThWf0NrYXy0udYm56JeDyFhWky4AkPCyMRPo79V60GKgQ3TrNVz/8+Qm02A4/xISfgeuSU8KLieC6DDCD4IYsyi2ozNRb34KlP/pPz9PWwKPsg+54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h36EGtv8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NZVMAKCD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h36EGtv8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NZVMAKCD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6IuIM3346571
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 08:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XeXuSTBUDtUckVxvoOvS+dfvJD3DA/ozz/evToIu/as=; b=h36EGtv8Vx0KQuJD
	PZ5IC27QV9rqS8hOCPuzi8adZ9hlXABwztMwbiGFplsxterTTY7eQ9lrG0sD1dp7
	n+Nb3P8885TdV+y/WbWvc+xAxXhjWJhnl4KHCez6JNidjz7vDBGdvxgBQalXT31C
	l/tIVgLFYBpzk/dvZ8pm6lDxUV7lCH1v5ZXev4tmJ8sWt1tslZQM0Iw8fbUuNMNA
	GxVXsBATQlZISgrdVJ5qLn9FeM9IbxcE+CS+NcKkbNz9CCUtHctHDXys2ei369PT
	H2jjniQDp7moJKM1vfTBHA2+2Pf8TqUhR6HGlTNoGXPGay/i2cMPgSRh6K+WVb0B
	GeiRhQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0g86eq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 08:34:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36ba24fcd46so2307835a91.3
        for <imx@lists.linux.dev>; Mon, 15 Jun 2026 01:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512463; x=1782117263; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XeXuSTBUDtUckVxvoOvS+dfvJD3DA/ozz/evToIu/as=;
        b=NZVMAKCDAw/PzmnBACKQbjdgAlBVWKV2kFILtU7hYFJZYTFFxQkfBcWkTghEMxt45L
         rjM5XkHXzjr8xd8jEEQS8g3+WjHD9b18KH9PYIr6Agsfyu6X1qqMXHVo+jv71/pCkIXn
         IvCpZv6HQsF/Vf6/S92eSQzZm99GWbQC+yVF32RuPgUr+BuErFVJE07upwJUZS1DqRLO
         FSptTb4jqBEen8nGqfJfA8pi+1yODOwCRyFFL/hHzHEJj2uhAqhSmE9RVCoyEMLWgIKG
         +SZGMp8O/8CgSGNXcZhEMEWwPQX/Ddvj4g7KfubtHqin9jQLTZR0cqIlWJSLvAQ37PZr
         96yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512463; x=1782117263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XeXuSTBUDtUckVxvoOvS+dfvJD3DA/ozz/evToIu/as=;
        b=rdwKTzFsibq6r9GtPoBRjv/S03E+MI483RWGXMmoAc10X5Ga7Q7ba0MQdRitTmB3FA
         VBqMt17NMgmqX4NG2fkVlChcoU/gqnQIxP2FRdxERvQ8tsDKkjSD1P7seZa79JfXyPu2
         AOFu0m1PvC4wiL/SUqV8IVkPJVmTWesI3FJwCi2ugigBcEIwhXfU4jt4GSQI/vPzbqz1
         hUGI05gkKky5FEkPtFjmYh2v4J4ZaVG4oswUzLIMb4WOBsH4TnqWzLUr9zo+S8+GPHIN
         /j4M7oqgUs6v1BfcnHUSJhzWaXwG3sI7Guf48tpU1NASeVQA/9jzQ/FQoIeoze/AOkt3
         zLSg==
X-Forwarded-Encrypted: i=1; AFNElJ84TpTS/zW3FvT7RUq4vxpBJ/RHrScc4LDWbuhcXm4E1NnJ2ftASzVFz9ug60/zali7K84=@lists.linux.dev
X-Gm-Message-State: AOJu0Yww8OoAzyjHEoaXqx95sOGHqFUwAQywW294IRT0Z3PKicKnsh18
	daj7KD+sdx5k2w5iecOcz/HbmNdzmpe5hbp2ctTm5j6JVdXexYi1MwSVKDLOy+pt1iDSMdk7OLG
	FGcCIoSYI3tFhJkE4uESrZKZnt1Oaxzsy1JJ0EyeKTWdmoLUPyP0Rn7s=
X-Gm-Gg: Acq92OF+oqyd1HlOJaO0WaT7Ml5QyAedTcBf5O9+SCLkYTU/O/eC9MGeKyFOXsgrde/
	j9LX6yavXdTVwRo8V53llL68VwpPm8CHCdmQrr60cjgjT6juHhSOGoCQx+2WKJ3eyaQlG3GY+gE
	vQo5LcDzecBm8sSWlGbCRhDatAlai6QvXrrhWDPdG33st8VjIMAjEIR+wjQcS+D3V79ezGjIFJl
	+WSO+GGDBU0lj8zUMUvujYut1bzfl3uxkFwokHMUIBUcm8IGkYpuu4M7L8MHgM1aF+UJKU7PJyT
	F19UQEVFbwTrh8eJ7k4mvBJg8DKokOphyRMxx+GXdEdc9iuy9yy8qFtYdu2CibDgU+RqkZms6cX
	gN1w6LMkUZgSOT63WSIF/sHppz5nvPjS86DIH9mvZrCYs1LNx17rI
X-Received: by 2002:a17:903:2310:b0:2bc:ac76:c1cf with SMTP id d9443c01a7336-2c4136e81d7mr136315005ad.24.1781512462602;
        Mon, 15 Jun 2026 01:34:22 -0700 (PDT)
X-Received: by 2002:a17:903:2310:b0:2bc:ac76:c1cf with SMTP id d9443c01a7336-2c4136e81d7mr136314725ad.24.1781512462126;
        Mon, 15 Jun 2026 01:34:22 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c70easm122789235ad.25.2026.06.15.01.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:34:21 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:03:55 +0530
Subject: [PATCH v4 2/6] arm64: dts: qcom: shikra: Add CAMSS node
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v4-2-bcb51081735b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512439; l=3937;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=FD/YYzeYflttpFETR8KNzzuysuLGEKsTDke9rdJBgPs=;
 b=S+g3AVCbFZadW0cTR3VKyGr/WyTEp+9L5TnSb1M6ihwOPpO9a5hWKeZBoHRpo14yQvnGDguUA
 sDaldeY7rINBJKtG0qa3JAYOz+R0/fS0KO+jnsBqbCg8PVZFhry85FL
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=OOoXGyaB c=1 sm=1 tr=0 ts=6a2fb90f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ahKksh3eZu5pIVwncigA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8sZUxxFuaAzipaAHQuDyEgYK5Q1qaFWk
X-Proofpoint-ORIG-GUID: 8sZUxxFuaAzipaAHQuDyEgYK5Q1qaFWk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX0Vpl1Kq2l9/T
 8tDKF9QsiblgHgU7TKKu7vSH2WuoCgy37K85pfnOA4+kV+PkOdgnKwtGkrlH9NjE+J2StR2q6KM
 huAHg8sBWynChGx4qEc9O05rPJay1i6i9rNpzZHTF4Rha6IlMAa6sv9M0PXNIwsPxr/fIlJVNDy
 LOWaXeDtA9jTL1Vuhoyd98haOXIU9RuAJNYhnIM/SVNwenZQkYIFnGKsZrWpRZhq10Lr/CorRPA
 1Z8MegRpeRvvc8UCqjCTijlc2yvyD5/blpVS0NXS4/N5i0jARqo7le0aiEL4YYG3MscgfYF7btS
 CFQIZO/hJxOgUFIBM31xU/hTQmicH1qQWcQOEFvLR/pwDfZOoqJBQZsxSV6EuF/HKVq6MeJlBQ5
 YGMyi7Ke1Df8gP+HJWXVQIl8XZl/LWU+jUG9SbMYKgSGi6tSKG2OdUJpefWwUuTUVOaFG2tFwQ5
 ZfvZflp6wvEMhtC+I0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX/i76ONszTfua
 Ze0bxIXDTuv1MsCDR3pPh7loR5I600b5WBhI4aJ5esRQGlrmsVZUPtqa22GkppWmcTP8mS7XUoX
 c2sJVL3IYIstQF7xNVhoDixor32/rBc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089

Add the Camera Subsystem node. Shikra shares the same IP as QCM2290
with two CSIPHYs, two CSIDs and two VFEs, but does not include CDM
and OPE blocks, so only a single IOMMU context bank is needed.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 100 +++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..f0e827996609dab2c09834857a1bffd9560155a6 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -604,6 +604,106 @@ opp-384000000 {
 			};
 		};
 
+		camss: camss@5c11000 {
+			compatible = "qcom,shikra-camss", "qcom,qcm2290-camss";
+
+			reg = <0x0 0x05c11000 0x0 0x1000>,
+			      <0x0 0x05c6e000 0x0 0x1000>,
+			      <0x0 0x05c75000 0x0 0x1000>,
+			      <0x0 0x05c52000 0x0 0x1000>,
+			      <0x0 0x05c53000 0x0 0x1000>,
+			      <0x0 0x05c66000 0x0 0x400>,
+			      <0x0 0x05c68000 0x0 0x400>,
+			      <0x0 0x05c6f000 0x0 0x4000>,
+			      <0x0 0x05c76000 0x0 0x4000>;
+			reg-names = "top",
+				    "csid0",
+				    "csid1",
+				    "csiphy0",
+				    "csiphy1",
+				    "csitpg0",
+				    "csitpg1",
+				    "vfe0",
+				    "vfe1";
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_RT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_0_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_1_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>;
+			clock-names = "ahb",
+				      "axi",
+				      "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "csi0",
+				      "csi1",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "top_ahb",
+				      "vfe0",
+				      "vfe0_cphy_rx",
+				      "vfe1",
+				      "vfe1_cphy_rx";
+
+			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 72 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 73 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 309 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 310 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING 0>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csitpg0",
+					  "csitpg1",
+					  "vfe0",
+					  "vfe1";
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc";
+
+			iommus = <&apps_smmu 0x400 0x0>;
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		qupv3_0: geniqup@4ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x04ac0000 0x0 0x2000>;

-- 
2.34.1

