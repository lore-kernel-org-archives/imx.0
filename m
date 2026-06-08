Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E8F3C6A43
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 14:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927640; cv=none; b=jy8hOGHy1Ps3PqK6UjvBSi02mfa40ReaYQP9FwFsQ/2KlfFh6AlisJy6TGjrE/5VodkxDly2esyfmdP4TuXk11tyqJtQJ0+g5WuixK8dlmE19xVP7kkQWKJfqO/yQAdmx9ndJoAdmK9vVvZWdUw09qUklt/qRpZp65iqqxrUSoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927640; c=relaxed/simple;
	bh=ldYjYAGXo9AsC38/Eko4nOrSCJF7kUU15KKBuwcyPE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TcEVWZqFz7B+egCbQFaSLNc9SMyzk+u5ZIFgUI1ozGbmOOCpNlrdECveRyHhKCm32+0mK+5Xve+pSZa2qaoBvM97etopPK61Q2KYSs0LVr7kNgHLfC8lzBsnaYpxMQU74Cn/SLtFjiqZse0RL/gicd3JoWJxHIb4noen24/nWhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OC31Rygo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aRmSJxuF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OC31Rygo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aRmSJxuF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR6uj3300403
	for <imx@lists.linux.dev>; Mon, 8 Jun 2026 14:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vpwMI8a0fnitJdgxCYqYUwu0ZDxpU+HFbaXoqZRi6Q8=; b=OC31Rygoa1cYQ7UK
	9AstLNJhmhLKmaQa0VOgF/+XRdBFUCC6UwS9wyV/Ktb/FolVJv2qtrcqRBUUKEhF
	vrky0DBCWlGUYjlCFT/IyMCgbFBN35Aw3nWyzA4aWzjQL6BF0wrTbY/MswV4R6uh
	f0pijpz7YoE2Rea4fvPIRjDUs+fdGP7Ltj0xxkfEXfHTP8WnoM7ermmKDDca1Rhn
	6bID3VorwtqOeOXbsP9sh1U1pRZJ5mPPEiP4x275t++Ds33TWXvANm5awMSgBQxF
	/B2Vh+T6t7s1kY8jxEK1mrzk1NEfSRsEq2wEtKMn201qSygK5uX61ncJLtfOnUIF
	4MpTcQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuna9236-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 08 Jun 2026 14:07:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c1e08848so60764455ad.0
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 07:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927638; x=1781532438; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vpwMI8a0fnitJdgxCYqYUwu0ZDxpU+HFbaXoqZRi6Q8=;
        b=aRmSJxuFJN1A4nzGVq+lR77a+TmlzWcsgcru69okzWgI9RmsDhUHeYGWP+fuHUr4/T
         si97VVtzbnhCFsnR0wWJPhHYRta/Sc/+o/UmLaOqZ8wrAh8JBCDAqaI84jz38/8Q7i0K
         gEIysuZVVw1McYKoKYaHG4gSATIz3hBfOlh4ugaomJ2K92ZZ8WAVDVWBAuyoj8ByerV8
         t3PJSSS7uaoRi88CcvarHkrXuHoLYphcG01MzWUklX6XBKmUZTcds8TlfA6H0i594v/H
         WfHYHZPw68vUravfcqhkRbroeveXXZwyN7R8NkhVpIuHaHVoGUeuco3xxvjXZLjNRiKc
         XYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927638; x=1781532438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vpwMI8a0fnitJdgxCYqYUwu0ZDxpU+HFbaXoqZRi6Q8=;
        b=YxCIQYUfGLCA5MphZvGA2Yr8m2JA+hiSP8MOO5sz65xOFXTZLfdPjiri2y/OdMEePA
         bbCCf49EkBA5ANeULTRqa7iifPXnBndxI1rA2z46glqfqaRRyrv3W1PlmzOGMxWJQ8zE
         9k8wRMXXTYo8uR7Jue1XPOWo/Co5DG4QKU3kqfsIByGzoavSPLKlcYhhdbw5fC5p+4uh
         Ea2HrPxdfRAeZM2ZruSozsPtFC1KzCAw7zmGrjKW+IPgdoiuXhg6qvpCk+hnVRmHvXU9
         0A9HjgEGUR7JJzUiOgeeq1D2378naHtvIWKgxRhmppRP1cMnlp3jnwG8BXDorlE0heVh
         zj2A==
X-Forwarded-Encrypted: i=1; AFNElJ8NnmJZA8m1VuJra9HFLU1fZtkayJ4S4XyQbqRr00vzCcUiv04/c3BKAhU3lScZiQ2Xgec=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeSJlpDdU3eZpsF7cLMF7xRa62Dv0WhW/aSvw5mVj1fj8Pb5AO
	SEjiaKPG6MfOd4nHB/YTLr0NtxPA9tWi3fxz6zwPXmeRQ84LrqUkAJBuXsKv8+gmPvBFl4L9O2U
	kw1BGuhymJ6ag+Q+9bG5co/tIl7bm4Ma1zFv1ZstZVXrGTLsqZ+ShwHg=
X-Gm-Gg: Acq92OEIHSz4Ksay4lTfNasxskojiHfM0Gcge+VyDezCzBABzIz6gS12jNwG3wn3n01
	xdwNZQ43N07uDucpFGswPtCxoqWwgGZHAiMVa5W+cGK5p6auTm9IGSFJX1dAeIoJ0x31dBXCkqc
	fqDoMobef7Os26XvYbhIn5AxKWtiWR/hlHCRqT5jJ8vJo0QIDZt64QTwXFWl67PlkAttRT0WdOc
	9NDUbvImHXJWBmlJ2FmZc8cNcgjHP1IaIzxKVeTYmcUImat5bEwTlR7bU/h7T4B/j+4aXG9wtlr
	oWEVXbpHbwFjbs7sWodImhDoFt77b5uknac32Mwt2KAfATjpMU+75zNVZdLXfLqrCCKFIIiyanm
	d8o02TXuFdmTQoEG791p3KUxYD4BvB8OVu4zF/W0qBQ0wa4z/j6aAEJX5WZPUzfA=
X-Received: by 2002:a17:903:3845:b0:2c0:a711:539 with SMTP id d9443c01a7336-2c1e7b3fe70mr187867405ad.5.1780927637561;
        Mon, 08 Jun 2026 07:07:17 -0700 (PDT)
X-Received: by 2002:a17:903:3845:b0:2c0:a711:539 with SMTP id d9443c01a7336-2c1e7b3fe70mr187866695ad.5.1780927637093;
        Mon, 08 Jun 2026 07:07:17 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1646e5c51sm183935955ad.0.2026.06.08.07.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:07:16 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 19:36:40 +0530
Subject: [PATCH v2 3/7] arm64: dts: qcom: shikra: Add CAMSS node
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-camss-review-v2-3-ca1936bf1219@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780927607; l=3808;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=ldYjYAGXo9AsC38/Eko4nOrSCJF7kUU15KKBuwcyPE8=;
 b=mJqkPYbxbRsScJQJpieQcSgJYF8xfF4BRtw/Lj10jdnv8SKIh4KRJCE4LdjY0kpg5zUwH8pNn
 /0Xgj0KhF9PAINqKk2urbc3bNU6KqB1yUijwzwn9HrUSDaWSKExfPm0
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMyBTYWx0ZWRfX0+Fqg53vYW7J
 Ktq1aMlr9mufC/q6CzqMnPWxFyTzT+qGZE6B3ogxJ6ofErDWs+BezisANd6vYO+tkMhwtdnN7zM
 8ZLvzsw/xF7K6OUAjukPmNUsi+wBlEKHGXlcRifQmUEl5HWX0FzfvxxkwpQnETnKJqtpbMI2NJV
 M9n2xt7JY4K53xDqzpJMdriWOz8S/KczTqaDf+t+B3SVtOg1b5O5xSQTUynClCDqVXKyeMgUWHR
 KyfD9vdXFt1fD57lWAmbQ8GxirmssYUOXLuzyhs5EgsTnro+Y+cwLUS6DYl0O2rbzpwJFkhsZGP
 W33FvWcKKzRr+r0GFsOqjLY3qWinuKQtEAyIvQKhUg28b7JPhO1uuakQM1vv1kwgLYcv1aY6KaG
 zIQwQUU+deh2sQmLjzvV9kjuvhEFazADjzi6k5tGsk0XlBTcChsEM/5TPr4xcWydHwWeKlmhQTv
 7VNupHdlOjZHKXCvCmg==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a26cc96 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7JZC8XBhqYczC4Ahd7wA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: rOtHZder0JQmPR9hG8i26PoNgpWjFnF4
X-Proofpoint-GUID: rOtHZder0JQmPR9hG8i26PoNgpWjFnF4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080133

Add the Camera Subsystem node. Shikra shares the same IP as QCM2290
with two CSIPHYs, two CSIDs and two VFEs, but does not include CDM
and OPE blocks, so only a single IOMMU context bank is needed.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 99 ++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..b93ce4a92a998ea5d9d4268d2fd46030fafc4084 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -604,6 +604,105 @@ opp-384000000 {
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

