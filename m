Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B1A357A25
	for <imx@lists.linux.dev>; Thu, 15 Jan 2026 10:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768471997; cv=none; b=QyIeFnSOzhemFyqQo111f9hqk3yIrZYQe/vFiPLSP5IZssLQlgQfDwwKakm6Qkeqs/ZY0ZtqKL3Msxg7coVLUJ9aGupZeexnbTVk2EZMx8pVRS2MbBcD8UF7b3aFLmECKjLI7AWdZhu2go15cyKdZC3ED4XgUoD8ZMnZSoaZPtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768471997; c=relaxed/simple;
	bh=5Ona5M9uA1G6MtS0rXSl9JaevxMMrhBygC6kd44fLE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F/ixoDJngCEoqMdUR4T+elhLkpHUtDZohuSoUUsN9vgEd64P63n+ELCNWvjF9JTy9R/ZNkNhTVT2TFuqcCIT8G4iz9pqWZaRu6Ew0a9RPI1lzFnaoqDZdDAOuywlL9U3yhqWgLwAfsBN+Pyvo6ZQuS8SRnPvg/nmG8aBKIyweZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZRXT1g5i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H4m3YbHY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZRXT1g5i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H4m3YbHY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fs7A1851017
	for <imx@lists.linux.dev>; Thu, 15 Jan 2026 10:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PHcdJp6/TQDyz/DCPOcR6LgU6yYWHNz8joDLoergiJY=; b=ZRXT1g5i3GFxBgsv
	lmVUXC4n5/7A45oqdNVT5qmPytsbsxWtfRoySx82clfSDKTGcn5hyUUT231mEzqq
	rENDLcbF/u/k6vj7HtxZkCpbYt8R/Df7GAuPLPWAKO18EcY6Jbbnl79HESxbKRxy
	DfXNUXPTzoNeLjkJH312ewe+9o/sb6Z+C5CduIDpB4GRXrGyzOYEdKEP2z+8VR7M
	3Jna9doTASM1hFA9Fj5nO29eqevppbZ+tH3IfQZk8Vro1Nf27Jy65qbWNPLsntKo
	UMFw6dN7y2C7gnHUKOSY9KIdpoCkYPwSuT4Tt+82eL6Fv459/RYR4nYxOMRHkMaX
	OqdoVA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bprej12g4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 15 Jan 2026 10:13:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a39993e5fso17220976d6.3
        for <imx@lists.linux.dev>; Thu, 15 Jan 2026 02:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768471993; x=1769076793; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHcdJp6/TQDyz/DCPOcR6LgU6yYWHNz8joDLoergiJY=;
        b=H4m3YbHYTGpYUBAyYFpSiulMcbyDu9+p+u50L5MvRudAWURpwK/8Kn7EfN91ZamVSh
         rbMkkcxR4p94eYTr5mOLNSERVmUHsgjII1zLecJUPFynIncGs/JQ6s/8HEkh49j0z10c
         0VMWtDLnaLQK/+I2YrXWchzCHnL4HmsCZMQgcsJY9vNPLQf4L9QKF+130paRoxdzFjYo
         FOsffrvPr3lL4O2pnxlhl63XygsdSxq9RQ9LT3X6K7o7ZSDbsMNPW5T8uXh4K5YiWYFA
         qwa60e8MWgFgqALl+4IR9OIfptIRg9Eclrm5S0ue264T0mGkNOx8scjyAUYCYUoFhkuO
         la8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768471993; x=1769076793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PHcdJp6/TQDyz/DCPOcR6LgU6yYWHNz8joDLoergiJY=;
        b=JX17H0GfLIkIiSxi2vuvPN13Zn3tKWC5z7mmawHvEzAaU9Mofx2KAEujrciMF65aKM
         SQiXmY+urQCX/AYVdPfgXogZIhT0bds6+jljm4gCZM0NcpB+qqR/irgHxH3TNfKwO4vw
         Aee8ovqgHE5gpxmb7Ma7Gd0xWUy7z7D9N7bf0bRQCLFKofxNg0+8uLrjqlNUTw9lXrcH
         6QyOv5D2BrxZZYg6Bxh2TP0+bK5P9CuiWBCfcT63FLZlV+LvEFAooy5Fz48t6Jl2AJMZ
         i5wcAeRxNN33joNZbERZb5oQv5Z6nAtNDEapAnF+xbks7HCeJ/doqfxndGT0cWn5PLAf
         9SFg==
X-Forwarded-Encrypted: i=1; AJvYcCUnrmPRd+kcNCpOfS+tCNV0Jc6tk0hFFSxZj7ISjr9U3i5NWRVXfKaMQJQP5jgoKluWcb0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9MO4+IMQtpvcbqHO47tt4kX83NFXj6QtOAifX/jbKVub+0uIf
	vQ/YqgmLuNAKxZqO8NwEWfKlW65YdW2g7JA9ViNclegNVXMdDdyuefdJwUgkx83dk3b8SkjpGlI
	MHFsqjP2uojLu1HOAQxzraIf/v+eowHBFtCMQim+3U47QCqcPHPJbd3prCBMXOfg=
X-Gm-Gg: AY/fxX6BtsbGZtU7Ievei3jMyvJ+wT3KFMh4ZaooDgF/h3PHWeqwnvmo5OuQjb83QOZ
	zV0VgS9N5WcIcFer5YvFVI+2giZ3ZEr2f6HqbobC7poLlbJ9TcVYTuNpH8fFVpSkRXqDFjlVb9L
	U59KbX/iDlERbXRqD0sZLV3Rvn1Isdn3VVtzWjVzMo69Jby6Et03Nl0o+nvt9l+mRRLXuqSVco0
	XA6aDkHv3MvK7qF/QOSY2u/8obyCbiL9P+FuQgSPGbwXjMfFv6QNu0C6kkFeC8qgSOZWQVz8TAa
	zFyHcF2H042PduKiADS88V4FeZAi3+n403rDb6biMctOqkWRdeX6ViARxvrcjt0Z6bZpSAcx9uF
	lRUFGIZ/H385SRn8lpiikn7V6q0OJqKqcg7X0UCTC8NtdEtOrMjgm53Z285bc5SbhiOtjjkN6Vq
	0K
X-Received: by 2002:a05:6214:629:b0:890:808f:c262 with SMTP id 6a1803df08f44-8927437eeacmr80974926d6.29.1768471992508;
        Thu, 15 Jan 2026 02:13:12 -0800 (PST)
X-Received: by 2002:a05:6214:629:b0:890:808f:c262 with SMTP id 6a1803df08f44-8927437eeacmr80974536d6.29.1768471991993;
        Thu, 15 Jan 2026 02:13:11 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772340b9sm199959576d6.26.2026.01.15.02.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:13:11 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 18:12:37 +0800
Subject: [PATCH v3 1/5] arm64: dts: qcom: talos: Add camss node
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-sm6150_evk-v3-1-81526dd15543@oss.qualcomm.com>
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
In-Reply-To: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768471975; l=6743;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=5Ona5M9uA1G6MtS0rXSl9JaevxMMrhBygC6kd44fLE8=;
 b=KsWUpHDPa0GAvVQQny03nZ0vabHvwBJyTZexH6E68O2XuyrrMRWAUYZGCWmR6RjeovSYLHzIJ
 fYkcSBnEdGaDu6D9gxPKNcq3J1GRtYD0HwyCld0MxD+oY+/VSZyR9rm
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA3MyBTYWx0ZWRfX7D8QOzjK492j
 JRqzClT5PzZTeCGRj3o8mjp8wL3Y5Q1Vc+XsvyWLvEP5hn4fLhfI6ZrsM2bStFWsWr5ctyLsgxj
 6dL+oP946RMOzNpnP692aIO9kReCuoYdKAh47OVlKVoKih1COV/KDCxXM17aqrIY7FmWuZ1k70o
 MiH4FAK4fPO2hePbKce0/GSN8OPRUXLaM4aKwUPwKpzt8xHa1aULrACvk/6gPsP9EmLtLTt4gA8
 crxLK1sc1xk8zwHUbZ5O7OvGhmDUz9S+G5Lc8RGtlWfYpGVLH4n/5Usfa/DpG++1uiH9t6cArt+
 hAKcds8zYhd6HEgvnhCL8ic4qY/PMbWxCJACX1BNCtb+VjtDIVmoAbF2pK36gSnrOuu8fdBTY90
 FMwNDqJu0sR9O72vsdDSBFG0Txl44030wMdHTgJUvTd01PfP1oAtfaa69cQQZPlbj4S/fxkh1y4
 3mvch7VN4fBx96EA2SQ==
X-Proofpoint-ORIG-GUID: yjQplRtV0fBA7dDqaaPRfzovcfamvgq1
X-Authority-Analysis: v=2.4 cv=Rc+dyltv c=1 sm=1 tr=0 ts=6968bdba cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_q6n6E3gDzqWkXQ7FWgA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: yjQplRtV0fBA7dDqaaPRfzovcfamvgq1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 clxscore=1011 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150073

Add node for the SM6150 camera subsystem.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 200 ++++++++++++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 6b9f2521d718eb5c9683393a2e5b67928631d96f..fe59975d56d6e65163dc7fcce8e08c50fadc3786 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -3790,6 +3790,206 @@ videocc: clock-controller@ab00000 {
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

