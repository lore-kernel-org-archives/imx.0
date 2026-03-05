Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C48A33F580
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 09:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704125; cv=none; b=AW8TXKOZz//rS4DTgL2bKYH/Sz0JB8662PMf9kcIaZeTI7Z7aTXa8Yv/e2c2WhkMf5DR+6WKMBkVaMnn2DADpsRdKRZtSkQLU/4JqFq3Nm6fIp8Eip7wuVngDUTMeAiwTuNkrkTOpEe2y5HrTkBZqDryn8Ehr+uFmhJe3nb8ECc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704125; c=relaxed/simple;
	bh=ocMeB6H+TQusRD1+PzIbc5H+47Yxa0gXugM3y6FQ0/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dvhTi5xsCcthwHXiFf6aLWlQWMpKi5THBhQIx6rxDPknml/qP+HcRlPFg/9FQk4PVx8bZhEjWfBcydBjNEK8BuIGnlM3yFbsUFlC8Sbbi/EK3PPVSphMPoZSCX/JZOw00+2kkrXt4TGuwUPAJYZ+bfUotiPl4l+Q8zru7PmiHdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KZQzHGR8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CHpnCctQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZQzHGR8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CHpnCctQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6254KEAp1852927
	for <imx@lists.linux.dev>; Thu, 5 Mar 2026 09:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RNl9QehoQmMFloQ4hlvF/Qk1jGOkXZVFRf+hUaNh9lg=; b=KZQzHGR8Tot2iguw
	3/keQudGyFTqPbRXtQ3wPq3FpnTgqkKkNlwfZe5+eI9piKZ0SZP7jZtgRVV8EEO3
	uIme+U9rCxm7Pxcp+VbrsZc/IToG3i1RLRVd69cRzHSxDvgZ8bF8Udbw7CL3Npqj
	Rlr+vYJbVf5y5HOqnKgQSG2aVGcw/deNmedg5p8jxbVXt0k/M1sYIh5mwSHGaliI
	KpMSVAYtu7MmmBgwfXAX5MI1RmycyDb1dc0muWJBIXSSrD1dBODHEd5oGZfZW8vz
	SzbH6TaQ+mEMZMvEX9rKzeF3n90nPqgNvi15guqhKcPmWPPkHqTqJNysC8+VFNOU
	n4z8Iw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq2q812bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 05 Mar 2026 09:48:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-506b4005ab7so755221461cf.2
        for <imx@lists.linux.dev>; Thu, 05 Mar 2026 01:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704123; x=1773308923; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RNl9QehoQmMFloQ4hlvF/Qk1jGOkXZVFRf+hUaNh9lg=;
        b=CHpnCctQ6Xces2vxYdHPdy0bc6/ACVW+pRh/zLz+cJtauAzZhtVsPLY5eLNCK4MOyg
         OGSG+ZGCLIkI1H123YqknjQq3M9lUJ+VskvBd7ml8fnaSUKkx83NZme7F321mouQmDhn
         ZEy31YzJRxO0GDESxeLMx7Xj24cbsBEtbtJdCMhCEjmHZ0U6mEL8nnp/Jo1rm4dY0bOi
         5OmXKyzR4YlfYKgTfpExvHdKGf7FoAPCTkFMZnM11nq6vQR2IRxsm3Faqao29E3PBRad
         k8EFePhHg6g6M4wCIKqoAg0lV7pER8/6zBmJHuxaQloVPubRGM3uphTHUURpZab5Cg/c
         Wg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704123; x=1773308923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RNl9QehoQmMFloQ4hlvF/Qk1jGOkXZVFRf+hUaNh9lg=;
        b=GxuKC7/HriEUjrH2Iti5EkI/I1o6xvL9JomSyTYiUCxQRiSNY+WXNDDsOEEpKkyy3D
         /ZNqPD47QSoAHlljRih0DmvkDmucNfeypBpusfR7RBcXe8pzQLt8KqKITsUMyCSxLD21
         ij+f0l2pjSJ9h3ORvACGaKeXuZqvcvrFizLcD2C1yke3F7qrJ2UC4vWdtjbhRQ/jbhhr
         cl7ie1yevVPks0dA0wOZbWj7oNEoWsp2mBs0861/BPMRDUApMfjNwOmGhQP/n0DMcuBw
         DsRnKrc45xNiDzauWexiG96D0AaDnNh6f+WEupt49Dw94fFX4zDCGAQZpTTGWA1a6rXi
         SeXg==
X-Forwarded-Encrypted: i=1; AJvYcCWy+dW5h6XhIcqLW5/86ya/uMDVCTtA2GqWwgCbC/1SszxLlkcyV6uACYhz+p/wh6xZP48=@lists.linux.dev
X-Gm-Message-State: AOJu0YwgcqeXUzKvKBVDERPMocHfPSOmFkCsJrnz3sOe6+IoSHdwe2nx
	HML1JdyGxFWV0asGhw9EuQADg/hqb7w+P8eIcEZWcS1+6hEze3acOl2OK3L/dY/whE5cdRqA40z
	Q/9xHvjECXKm/npqOXcLdKPe18KVTkVvfDcZ0g4PIzzfOvlxsdAdYTiU=
X-Gm-Gg: ATEYQzxTytPJmlBDuP+0aHls9heXL3xiwaIEipdqeO3jfeg5b9DnSpCoIsrsjwW6I3b
	qhfRPdeEFXdllcvHxvMjfeacAbpBNJogSVBVPMNhHVMzcgDgArLBsMIYqQFJO7XqrKkparg9x6N
	jSULsK+0W6ND11++r018Bz6r2VlOGmNdt3l6R4rn8Oif9WUVKrpOPmoMgBOiYl2Sy24m4AVibqN
	bRW3MRHaRukRSTwuZgvasLkyecLvNq5VZgGuVoNhscv735D78WJgty6V9E9lxtxur/zdJd43TNd
	aVgxIqtFPAiiS/6492XZoPrP6qt7L5gxuK82t40yTR/lsUVsk3F71M5gCCtAIQWZbGIi8rcVa8C
	JoYl03D3p0T+V5DThCbvSCBVsYpHVzq1c6mcqDp939QfkIM+ZaMksHYJFettU/kAnNJZhaJKuM9
	ak8xIF3lfUnXId
X-Received: by 2002:a05:622a:28f:b0:501:423e:fe0d with SMTP id d75a77b69052e-508db28a748mr65557001cf.3.1772704122696;
        Thu, 05 Mar 2026 01:48:42 -0800 (PST)
X-Received: by 2002:a05:622a:28f:b0:501:423e:fe0d with SMTP id d75a77b69052e-508db28a748mr65556701cf.3.1772704122287;
        Thu, 05 Mar 2026 01:48:42 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074496300fsm177126211cf.2.2026.03.05.01.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:48:41 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 17:48:13 +0800
Subject: [PATCH v6 2/5] arm64: dts: qcom: talos: Add camss node
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-sm6150_evk-v6-2-38ce4360d5e0@oss.qualcomm.com>
References: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
In-Reply-To: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
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
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772704098; l=6743;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=ocMeB6H+TQusRD1+PzIbc5H+47Yxa0gXugM3y6FQ0/Y=;
 b=r1eHe5363dGkktsWBQgmfDY0cwOEKvk+62PE8e02/Z9CUDDDGixmXrU/gxV+vhRkka2SeuPXa
 qzTWyKZvESvDoyhiUaOHfn8pLsIFBSTrjEhuJc1c253LDCwUozR2+7U
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: KfMhvW1XQni2nAO79BXm-11YR9uQD9uw
X-Proofpoint-ORIG-GUID: KfMhvW1XQni2nAO79BXm-11YR9uQD9uw
X-Authority-Analysis: v=2.4 cv=GecaXAXL c=1 sm=1 tr=0 ts=69a9517b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aV1HOqfba-nwUXNNIVcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OCBTYWx0ZWRfXxFhRAvsm8YTS
 FfVEcb9NQXxAYEMB7MUrsFbViiN2lBRRiKUZQodXT0X7/Q0SY3UlC0Og1PBcQcAsizdgU3ZaUM9
 J4qotm7PdxArNqS2nYkBvSJomOwkPWdi2kHI1SVBwvVGdOTyuziPgiU+9hAcKdjVvvmvKod9CR8
 iZKRcouUzBYDwAfBLJw4cXE7YRC0NNIQdiWjbZMmcMP7NpeAEEEF5BacMB9aR0HXzzbPTGOXVQF
 YPaZbRRsWiH6V5qEQgL1dwlFqlB4jbhJJOXsn6P7YjnRop4REalYSRh4usUscW9P2GyP+rT2MON
 g01RWIC+9EKxZ2gSl0OQ/iZb1ATWJCQkBq6v5EcaGZhfIR0Qr5Zqwe0gVAEfWJznErh2r8RCc7M
 OprzfQ/j3A9pEFCvCR+EBQAbOVaBVG8lKBhKD6nMDXmmprxGdJKG87fuel7RNC4ybZf3hr0w/hk
 SL+Cr6fKp76q6QWMy5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050078

Add node for the SM6150 camera subsystem.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 200 ++++++++++++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index f69a40fb8e28de9559e8ea53394b86ab7188d6c6..054255a65c7fbb51e6c411d10252270bd7ef1522 100644
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

