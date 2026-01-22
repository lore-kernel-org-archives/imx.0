Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0133423A9E
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769078989; cv=none; b=BRfseyX4G/kzbkceGQL2ays++Bwq57ZWIyF/xqDfwHluFEk+K4xT++GC7CHmVkvmBOhUHJ128U9LIODf7O2lCtYX3ilCCeLpDI106ENmYrmqOBpiSj4QMbvK0U7Tub0e6uRysDZo8DO4mOhVRcuFoOtr1RFnEKfI8fLeOuXOL2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769078989; c=relaxed/simple;
	bh=+gPwHSHSjjDjQ2M/iiVDFIMHqWIJ4UsMUFWEKECMfi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O1sxaulj9U+I17Hx7JKzvgczbjURGd3WfEyE+RhE/iWP2jbwNG0U5uOaMI8tzlDU6u1R3EzOKMGeKnGwa2Kgga+1PitIgCTX058ytn6yDCEDu7JT2ueqBFlzysu+FaG0jFeyMoM2gk3o2tUfeH8G/gVKifPRT3xybzgPj6xo9E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UCtO8Bm6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YasfeLMP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UCtO8Bm6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YasfeLMP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M8TjrH3463810
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JWYcBPv/ClJ+iQbZUlROViXdeYZuC9cdTF1Lu36R6EI=; b=UCtO8Bm69Ny4fOWb
	J0CkmHwGtesADdLxDL/Ya2+HSp1NLkP69uroSxxeesjfP2GWuLn3uQXTIVFBjHP8
	RUEzUAIG42gpGtxDW4Sc0AdSjTHeOHC/1hp7Oh5JY83G8NhBDG6qq/7bvYOwpuvs
	CfGi4bbyQOnN8jk107jPj11XnCAVoOedTccvG+11Ae3Gmdcvs2lbywAu0NLc5+RQ
	imtbLtJtBj+O95YNByiglMh9vWwVJHw0IePtM5RWCQUe9vRmIYMqlp9h2Q29AIR/
	f9cwQRTtSGGel/ZTZIq5kbUzKwk84hHcvrEpDcKShKvhurRZguyAOAC6J0S7jnoX
	dXXIOw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu0653jdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:49:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a0ec2496so203786285a.1
        for <imx@lists.linux.dev>; Thu, 22 Jan 2026 02:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769078985; x=1769683785; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JWYcBPv/ClJ+iQbZUlROViXdeYZuC9cdTF1Lu36R6EI=;
        b=YasfeLMP/jKvHsz5fbyGO4N2HXdHXeCtRhRrq6VUak8OTDl0NJjhSlueesCV+c3iXa
         hdFGod2lMKY/qL24pXdRtKZDMOdubqfp3jJDfJI70RZRstG3dC1CJonFTUoge/J3sPte
         7F+Hpf5ZUGgoteAH2vGcqc81ppwLrUBUiV2Dv+H171Zrg78bOmDBXNUU52dTnRwqxfeW
         WqvtPGkjFI+3DzuQbJP0I17/Fg1JoiOeM33JeHwYwq2RMvkPFd4lu+gxj838d2DhRMKT
         zp7pluACqf2IJOxKqDO5geqEjm4ONue3xZqOsdOkzFDQeRLm4yAlFftayZOYAdQ2mZqg
         /w1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078985; x=1769683785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JWYcBPv/ClJ+iQbZUlROViXdeYZuC9cdTF1Lu36R6EI=;
        b=G3FFHC7rpco3mUJ6QtPD9KG2q8yzUk/kcWdT0ZNn9VrbrhVYKD4KUtae/RegfGbPB1
         RW7qwHSzj1aFelNNdV16BvItjzpp7yw0MgOSBErVdVCL8Kt9Yjd/4y7F8CDhrQTet/zm
         J2wkCisxj/6jKlBh7ySb3Nb+cFA5Sj9pvgFSRRceK8Yl8cfBf8lz140GQdEX8R7kRH98
         h7mxxE+5cuHONRCc9g9llwB6o/UT8FNKxYYwC+fy2UaYgpGBIMjQOjE+GCZefJG6W2Zl
         8DIkInIboLHE0hQJgjKbh/4ZHjHHaoDaNbmrqSlSI4JzDHeBdPnm25/S5mmugFS4PzEG
         aCvw==
X-Forwarded-Encrypted: i=1; AJvYcCUlYA/xNWLPPo17+ikswIcaILCURx+FpB8SogetT8N1cZ7snKwKC/wvjJEZMLTH/pl+xzI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz13iMMS00KnvSpYveiUlapIokjWmLVTOA+r9EfsO9eg0s79XH/
	/I9ZmZGMaJ0WiBaAqbceM0VvLKNngDhtas4yTORF/+0STgt+1XnMkc0TzCUusGRM6FO99NXDGSk
	Z4IwVpx084YQs5UK1JHoBdxDfFosCNZJBsTqbXUfsoR6XTdTqlLY3bKQ=
X-Gm-Gg: AZuq6aJqgfcW6loEy3WYlA759JNf2VIdbB8htInKrZ+lILAcu9MSNNUlN8qoKOkWDSt
	WIYlLsFtwqTbOhu9jy+BHcQsMvlRFwFAfnNlwdo9c4tzHyrGHMX+jN60w9ODv1Si9zkkvkuxGPR
	9OPHly1pKE9339gfuYfAy7HWjePK8lPcl8lD7NdGkZX/axObvvswjdpGTUKbrIXXdAdB1ln8mKM
	zS75s7GF8zVccFSVW8Sv27Cr+MLdQrZblkAxPAVIEgDGeKfOU6u/hS7gAzSuWvIhH2Ly9E8YEcY
	MAtW2Ooz3lgmU7FQUy0tpkmIWspZHrZfDLkpaEwOAwR/JObVRmuqBJPibXNvRJGwg/pCqA5YnZt
	x4X5ggUHkUXz+8EJMVTxjCJHRlMcpfigB1Ae4K8faSlerp3Q3BHDQmnfBY3Qjfz3EX0l+kINCFA
	hu
X-Received: by 2002:a05:620a:5593:b0:8c6:e11c:5eb6 with SMTP id af79cd13be357-8c6e11c63e1mr4234885a.72.1769078984547;
        Thu, 22 Jan 2026 02:49:44 -0800 (PST)
X-Received: by 2002:a05:620a:5593:b0:8c6:e11c:5eb6 with SMTP id af79cd13be357-8c6e11c63e1mr4232485a.72.1769078984006;
        Thu, 22 Jan 2026 02:49:44 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d9ee19sm121704901cf.14.2026.01.22.02.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:49:43 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:48:52 +0800
Subject: [PATCH v5 1/5] arm64: dts: qcom: talos: Add camss node
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sm6150_evk-v5-1-039b170450a3@oss.qualcomm.com>
References: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078967; l=6743;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=+gPwHSHSjjDjQ2M/iiVDFIMHqWIJ4UsMUFWEKECMfi8=;
 b=92Cldp/yWI6Eyw0Ll5MAPL3353hogHAsehrpQ1GhxVaWYVgDLLlWGvuXQDCCrWqu3eepb56lo
 YGHssiBpdLiD36OPmB8ewOdmsbT/mZMdrDEGJDPuWZOQl96NfIItbEa
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=HOHO14tv c=1 sm=1 tr=0 ts=697200c9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=aV1HOqfba-nwUXNNIVcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 52PY2zG34eHBx9WVwk17eogla-zO8_v3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NyBTYWx0ZWRfX9c9cTFVl4eU6
 iSuMzgt87sf95MvfRccCUhbLAqCM8pHyB8zZvy7Fd/uAkFKNtuz18KHkKX/9VXWcGJGoiMMvjlt
 RbA3HuHYR+awvDedOBEh+Uc9BQwLFp5AqLaaSwDkw3XP0hA23esza6HErUnjTKZU183FAlchMGq
 JJxyodD5jHXDHuZbkKd983DKMHjqVxGhL94gn4bgu2jaqmrnp3/p7IkhkriaglCeZkXIEqFC1Y1
 VWTOU37kVvYUTdplD67qPzVwdSSSFC0K650iQXsEZl0oKcbW8WjSDEwwwPF2Br5beZWxh8Q+Dnc
 /LgMyH0ve3hh05+7MoSf03+j8YI+zWiqovxVzdFdtg2ZOfC3a40Uu1rImPoYmTyGLKq94kOGfPE
 o/Y4MRSs/E9V9BaC40QhEtqcz7bIMBpw7kPBT4geQPFOAQgr0lN1btDmyTXY/YQSX0MHUiDxAi3
 7N5mQ6fYP5XgM4aYuow==
X-Proofpoint-GUID: 52PY2zG34eHBx9WVwk17eogla-zO8_v3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220077

Add node for the SM6150 camera subsystem.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 200 ++++++++++++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 8491a6269c32e679faf0e4a40b451432ccd89237..3e1d85b6eacb90b48496ddfee2db27c586f3331e 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -3789,6 +3789,206 @@ videocc: clock-controller@ab00000 {
 			#power-domain-cells = <1>;
 		};
 
+		camss: isp@acb3000 {
+			compatible = "qcom,sm6150-camss";
+
+			reg = <0x0 0x0acb3000 0x0 0x1000>,
+			      <0x0 0x0acba000 0x0 0x1000>,
+			      <0x0 0x0acc8000 0x0 0x1000>,
+			      <0x0 0x0ac65000 0x0 0x1000>,
+			      <0x0 0x0ac66000 0x0 0x1000>,
+			      <0x0 0x0ac67000 0x0 0x1000>,
+			      <0x0 0x0acaf000 0x0 0x4000>,
+			      <0x0 0x0acb6000 0x0 0x4000>,
+			      <0x0 0x0acc4000 0x0 0x4000>,
+			      <0x0 0x0ac6f000 0x0 0x3000>,
+			      <0x0 0x0ac42000 0x0 0x5000>,
+			      <0x0 0x0ac48000 0x0 0x1000>,
+			      <0x0 0x0ac40000 0x0 0x1000>,
+			      <0x0 0x0ac18000 0x0 0x3000>,
+			      <0x0 0x0ac00000 0x0 0x6000>,
+			      <0x0 0x0ac10000 0x0 0x8000>,
+			      <0x0 0x0ac87000 0x0 0x3000>,
+			      <0x0 0x0ac52000 0x0 0x4000>,
+			      <0x0 0x0ac4e000 0x0 0x4000>,
+			      <0x0 0x0ac6b000 0x0 0x0a00>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csid_lite",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe_lite",
+				    "bps",
+				    "camnoc",
+				    "cpas_cdm",
+				    "cpas_top",
+				    "icp_csr",
+				    "icp_qgic",
+				    "icp_sierra",
+				    "ipe0",
+				    "jpeg_dma",
+				    "jpeg_enc",
+				    "lrme";
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAM_CC_BPS_CLK>,
+				 <&camcc CAM_CC_BPS_AHB_CLK>,
+				 <&camcc CAM_CC_BPS_AXI_CLK>,
+				 <&camcc CAM_CC_BPS_AREG_CLK>,
+				 <&camcc CAM_CC_ICP_CLK>,
+				 <&camcc CAM_CC_IPE_0_CLK>,
+				 <&camcc CAM_CC_IPE_0_AHB_CLK>,
+				 <&camcc CAM_CC_IPE_0_AREG_CLK>,
+				 <&camcc CAM_CC_IPE_0_AXI_CLK>,
+				 <&camcc CAM_CC_JPEG_CLK>,
+				 <&camcc CAM_CC_LRME_CLK>;
+			clock-names = "gcc_ahb",
+				      "gcc_axi_hf",
+				      "camnoc_axi",
+				      "cpas_ahb",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "soc_ahb",
+				      "vfe0",
+				      "vfe0_axi",
+				      "vfe0_cphy_rx",
+				      "vfe0_csid",
+				      "vfe1",
+				      "vfe1_axi",
+				      "vfe1_cphy_rx",
+				      "vfe1_csid",
+				      "vfe_lite",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid",
+				      "bps",
+				      "bps_ahb",
+				      "bps_axi",
+				      "bps_areg",
+				      "icp",
+				      "ipe0",
+				      "ipe0_ahb",
+				      "ipe0_areg",
+				      "ipe0_axi",
+				      "jpeg",
+				      "lrme";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_HF1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_0",
+					     "hf_1",
+					     "sf_mnoc";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 459 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 461 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 463 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 475 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 474 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 476 IRQ_TYPE_EDGE_RISING 0>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid_lite",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "vfe0",
+					  "vfe1",
+					  "vfe_lite",
+					  "camnoc",
+					  "cdm",
+					  "icp",
+					  "jpeg_dma",
+					  "jpeg_enc",
+					  "lrme";
+
+			iommus = <&apps_smmu 0x0820 0x40>,
+				 <&apps_smmu 0x0840 0x00>,
+				 <&apps_smmu 0x0860 0x40>,
+				 <&apps_smmu 0x0c00 0x00>,
+				 <&apps_smmu 0x0cc0 0x00>,
+				 <&apps_smmu 0x0c80 0x00>,
+				 <&apps_smmu 0x0ca0 0x00>,
+				 <&apps_smmu 0x0d00 0x00>,
+				 <&apps_smmu 0x0d20 0x00>,
+				 <&apps_smmu 0x0d40 0x00>,
+				 <&apps_smmu 0x0d80 0x20>,
+				 <&apps_smmu 0x0da0 0x20>,
+				 <&apps_smmu 0x0de2 0x00>;
+
+			power-domains = <&camcc IFE_0_GDSC>,
+					<&camcc IFE_1_GDSC>,
+					<&camcc TITAN_TOP_GDSC>,
+					<&camcc BPS_GDSC>,
+					<&camcc IPE_0_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "top",
+					     "bps",
+					     "ipe";
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
+
+				port@2 {
+					reg = <2>;
+				};
+			};
+		};
+
 		camcc: clock-controller@ad00000 {
 			compatible = "qcom,qcs615-camcc";
 			reg = <0 0x0ad00000 0 0x10000>;

-- 
2.34.1

