Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8675B3D8906
	for <imx@lists.linux.dev>; Fri,  8 May 2026 11:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240492; cv=none; b=tpdLvrtvf2JUVCiqHK6dptMvTG2MUz1Xqs8A33IdDXHCj9/hb07q7TeqBd0IcGLgzOVD6wLuQ9ClLP/nnufvsscF4L/tpNPUdzUr/WAeUeDJsSexBGBXUhcUKYs0Ns46aHM9NGmYlZv/K0k+yXYRs2RVxvQEPGraaFfPFNRlSbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240492; c=relaxed/simple;
	bh=UW/XrYAgo0pzL3UTVQuEqQdZDs4G4W2BqvG+jSGjjVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UFX1ZpEVUEtyLuOhbvTqvJWNQzGJzYoaHtgn5sDE3+efA9ZW/NMHbbEGpPYIdIWxwF5zqyLSaj2jl+IhXGfV/OBqgyPxq4eIpCcQ8Il7GNu7SNFh8cPwFlNO5dxqcOkTtyPuTms6j/L68Wpr87kMQitTLwSQq3hluFp9bsY3C7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lB5PNY7o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hY2N8C/8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lB5PNY7o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hY2N8C/8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64867GGb1173914
	for <imx@lists.linux.dev>; Fri, 8 May 2026 11:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ij6VwFxhGsJZ3ci27QfiE//xRQ65VYL2iOQjr4D6LI=; b=lB5PNY7oCQAKy0lO
	Q+O6f+8nEa5+kaiQQfBlZ1Z6gkG+Y5dPmebt3L9SXKdRDWEEePucckJlsyoN0B+Q
	L0JfndWQgxT2tagMAJjzkiK84oVFaHrUOXCjaAQQe+i7uTlzFBLLxoSQit6tr+TS
	IUiM3l2c+JuwCPqYErZqsbGx9/IOmGO9ZjUWT3KLJjVyUl7TexEHNkkAK6fYT/E+
	E0aviw/2hb7svAEix25btL8y6i3mRtmXNA8PDtl2/SKygfzGuijtfrIgajfici4R
	JWph8TsFS53fmcHtYv+aAKqYCjx9mDyUqfvZwnRRjwlVP2jclRfX5hKXN7pi1sVn
	rlwqwQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e132haq0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 08 May 2026 11:41:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8eaee67d1bcso130056885a.0
        for <imx@lists.linux.dev>; Fri, 08 May 2026 04:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240489; x=1778845289; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ij6VwFxhGsJZ3ci27QfiE//xRQ65VYL2iOQjr4D6LI=;
        b=hY2N8C/8qT7OWY0YOAEm+AkkRyR+zE5Xm+r6vpniUCwdaeUu/Rujj8q+qqcskQKrGY
         RcP3Hq6BPzyCWzH0/pDWZIvhBhSG1A736bcmFuwrjpROObxe23AbL+D2qrUsrPdUQUTj
         gKkUmWVoiMXTho6CEtIFrSaLbiZbLE/81ZXhXwqHpedlJezSce80Ev0p0DqFNsl55C2L
         Aqn+nKe7diSNGgl1gRzrd4WC2kCz8Q/24f52or3rd5BZyEYtpKawPipneZG7/Y42Soct
         7jV0m/jL5hviL3p2Q+lYsPFKGFTaN2NHf14EkxrsFbBFfHdJpNRdGUT6dBuxSDvn/+A4
         twmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240489; x=1778845289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ij6VwFxhGsJZ3ci27QfiE//xRQ65VYL2iOQjr4D6LI=;
        b=qQ20MyyT/WZqCsfKa/imqy828ByO5nioiXUbmivzQU0R+Z9/ZRlFttVtwIb27ocGOy
         y9VMdLdMM1oICAhvXIsOCBYaKcyFwCNcvQfW36oFQBXcC+VNkN6k36m6GHrUgbkA2Vlh
         uJbPTsOAheX9YrgINHvuBnhn4jTgpmVYPTskAqAxFm+Fmtm3gMW7ECC32yWwUmDnNSFZ
         BSOo9qoIuDhnCwuKAzZxSv2tRn+gboyIG30THWFJ5MoPqdqQ+Az1irx0uMF7RCvdFbjX
         zMUaeZo1jGFWe94oAVNehwRRYiaed/hEmZg+4qbTz4BimGTQF5Bn5C43AzEm+V5/VUcI
         Hm6A==
X-Forwarded-Encrypted: i=1; AFNElJ+7SClPXlSkUgC4JrnZG6IF60vnXBuBPGT4HGGPf7vwVehvvMuFkulFih964gU0sdX82DU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVFkkrdkscEpgQkJZ74SjbzVsTb727rzVvP5JTPHBEvBqDwJkS
	V/3iUITyC121QlNvzGmLVPXZA6Ru7OJOun2+sN0HPXHL1L/9+njsOqe27SHw7QawF4yJZeLxJUL
	USvNCvv6vrKmczXWUJ9+tP8aSbNkkPRqWKfVUZk8912JLBp0OMC7mAjI=
X-Gm-Gg: AeBDiet3QE9eQHZJEOlbCJImJ2BpWWG2Y4Mvb/3VjI20SguU/Rk1vYIXLgCpoPAVJZ3
	sWU8BWD0ImuHE7yfoYvIc9K6VdEHBnxEBJDj6Md7si1/1JVwvP9yHvnos2jeeg87b6Or88tR5Az
	XeVQWsffobjyv1AOyHcfr9MK5g96IzxnUNvQE8OVpnBkZFPBAqWR3q3mrQ/JRJCw61Gp6zRuSHG
	CBScaCJucA5SwFoah6HLN5qUAcb0ugHgcfQqTHSh26IpwcSIkAZd/Lao0fcMsEvHwyKJHOXoAe3
	JwE5kKC7dkFap/Uk3MsLcsSZPcNLeQea+F9FTOz5AZvbwcfNgw3YS2YODNWf/M8SbDBfLkbtoIP
	zqLroaU+83X2zXwQ1OdcThadYQawrskIoFu/KfUZ/TjC8O0T1msK3uRw9fqYmduXmLGgJJwKnZP
	RJQ0u642HTR2hg
X-Received: by 2002:a05:620a:2586:b0:8cd:9665:9eff with SMTP id af79cd13be357-904d4b58e5dmr1727695785a.21.1778240488757;
        Fri, 08 May 2026 04:41:28 -0700 (PDT)
X-Received: by 2002:a05:620a:2586:b0:8cd:9665:9eff with SMTP id af79cd13be357-904d4b58e5dmr1727687285a.21.1778240488181;
        Fri, 08 May 2026 04:41:28 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:27 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:40:00 +0800
Subject: [PATCH v2 4/7] Add dtsi to describe the xe180100 CAMSS block
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-4-3ebdca3e4ae2@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=6089;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=A99zg/2bpxRpuNCcBtMFYja3yXbXdYAWdmH7vko/GIk=;
 b=fdWcVDUqxkTe0eKXZKIV7iTnh/6zEp9yBCVxKbdDx2md3UYa1G0rOPABhgoh2f2pPH1STjwDL
 5x3JMmXhf1iAfV3mkR0w6VI3dPtzxguLlKK6oMESm4v69C3ZJDIYssF
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfX/SE8AW+BFo2K
 H4Sl/b2KvwkqAfi3qrjwSL024IIYcqh8Ha89GhKbxfY2dXT2ApSAeTfhYt16dKnSMfPTb7ZLDEv
 FifzNtsfVP4C9cgZwYMvuWQkWyZlobLTSnEIAQ+uy3g2dj8kokPOrAcSL2t0YtGL9yWp/cLILLk
 YCXfgHIdvs4+xCiyhuj4f4J1OjhK6MkGnuNmXgFArAASI5BtyVGDCtUCBBxFlVFGwHnG2yTgnC1
 JglPrjUB8lf0Bq0rkF3u0o8OCc5wfIF99ZXzV9i71DUaWLLc/eKiImQM97kE2w2um91v59JK6DV
 qDOBzS+HNKGEHuqLo1FnQuPJRgSOq5WJ0RM7ZyGM9lBh5XMcngNAz2fNN+kIYCT2+W9FgGT/Tg7
 bsfe8nzIa3XTUiQRFUX5rzzA0fyyb4jX/2/uk5gcIffLHnmBd/jDff1mnnCVocJXNMrMUyiR5jQ
 PC7CqRSL9I41q74Y4wg==
X-Proofpoint-ORIG-GUID: xOaRHfvyHRlkSgUiGrCfwpYac7c5Bb-b
X-Proofpoint-GUID: xOaRHfvyHRlkSgUiGrCfwpYac7c5Bb-b
X-Authority-Analysis: v=2.4 cv=McxcfZ/f c=1 sm=1 tr=0 ts=69fdcbe9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=oZ4ORCjJA6TcenDLY10A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080121

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

4 x CSIPHY
2 x CSID
2 x CSID Lite
2 x IFE
2 x IFE Lite

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 183 ++++++++++++++++++++++++++++++++++++
 1 file changed, 183 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 74d6e4300506645a63e09490883eabf749829e58..086c94217eee64756b734f436f1f0b49d49dc582 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5629,6 +5629,189 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		camss: isp@acb7000 {
+			compatible = "qcom,x1e80100-camss";
+
+			reg = <0 0x0acb7000 0 0x2000>,
+			      <0 0x0acb9000 0 0x2000>,
+			      <0 0x0acbb000 0 0x2000>,
+			      <0 0x0acc6000 0 0x1000>,
+			      <0 0x0acca000 0 0x1000>,
+			      <0 0x0acb6000 0 0x1000>,
+			      <0 0x0ace4000 0 0x2000>,
+			      <0 0x0ace6000 0 0x2000>,
+			      <0 0x0ace8000 0 0x2000>,
+			      <0 0x0acec000 0 0x2000>,
+			      <0 0x0acf6000 0 0x1000>,
+			      <0 0x0acf7000 0 0x1000>,
+			      <0 0x0acf8000 0 0x1000>,
+			      <0 0x0ac62000 0 0xf000>,
+			      <0 0x0ac71000 0 0xf000>,
+			      <0 0x0acc7000 0 0x2000>,
+			      <0 0x0accb000 0 0x2000>;
+
+			reg-names = "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "csid_wrapper",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "csiphy4",
+				    "csitpg0",
+				    "csitpg1",
+				    "csitpg2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe_lite0",
+				    "vfe_lite1";
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+
+			clock-names = "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "cpas_fast_ahb",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "cpas_vfe_lite",
+				      "csid",
+				      "csid_csiphy_rx",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "csiphy4",
+				      "csiphy4_timer",
+				      "gcc_axi_hf",
+				      "gcc_axi_sf",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "csiphy4",
+					  "vfe0",
+					  "vfe1",
+					  "vfe_lite0",
+					  "vfe_lite1";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc",
+					     "sf_icp_mnoc";
+
+			iommus = <&apps_smmu 0x800 0x60>,
+				 <&apps_smmu 0x820 0x60>,
+				 <&apps_smmu 0x840 0x60>,
+				 <&apps_smmu 0x860 0x60>,
+				 <&apps_smmu 0x18a0 0x0>;
+
+			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+					<&camcc CAM_CC_IFE_1_GDSC>,
+					<&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				port@2 {
+					reg = <2>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				port@3 {
+					reg = <3>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0x0 0x0ade0000 0x0 0x20000>;

-- 
2.34.1

