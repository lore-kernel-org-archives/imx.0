Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD003E8685
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 04:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790139482; cv=none; b=gU1zVrCaUNixE2Qupl3Bd3eaxVt7XxoyHwpQTSpwwxVLXG+otr71PEapq70/LBjpD02V6A3G5wXszXXv+1a6VJYeRRMGmiU86o0njINU+nau/FxBZ0ZLOs3kf7MjHfraPdmtIg6gDtRd6ic5el4ujPLSF/mUD8a0FIeETYGoXaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790139482; c=relaxed/simple;
	bh=7YcT+Mp4N9oUEJJb1R4A4tqL2v4DNSxfSMin5F8lmwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CzJEqq0WwGFns2ptiVTemOtIiQ8DZixD+kD/+xfTnT9HOaF6QNdZkbAACn7+B1+MU8osWe9ISeG6O38niXoPOKdREmRBS4d5c8mhitjvJdOJQqZOA8V/6POTH6odvdJ51crZObhiy16qSk7HszdA1gJURyocFIM29dcKaa6fHXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nKChpZ11; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L5+wdraT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKChpZ11";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L5+wdraT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3ieqI1986388
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 04:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rXD3jwzeCq986oj128eoetS+pkWm5i7kbLJxsP/VRok=; b=nKChpZ11djQ5vCPs
	9kfJuPao5qE+xpQq7lxInnnSkwIl821UKTs2+cAuWdvCw0TZ60RpL79IzSApnpBh
	v2G6PPjdyzG1jftbHTD0ihqbw9gmCfguyJvV05xQh1/Q5wP9Hwfgv5m8DH/Rl95V
	JOxXcqZN7LmK/y/SJz2v/AsFl0Tuz0yC0Ouwf7VBapCHWKVsWVh2k6zsuCmkoYrG
	qq2YEa2oRDm2lQn2NgjE1ykZ0dVHoiYply0kGTDzixGj6YLe/jNQTAkAHWWUnyJZ
	21cPOW+7SVyFKZUbI0/2JUxxxmmIsj7tGfhL7vxLs8Wpov1OofCID8JCrpbaOA1s
	ltaasw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv33191r6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 04:57:51 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso685521eec.0
        for <imx@lists.linux.dev>; Tue, 22 Sep 2026 21:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790139470; x=1790744270; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rXD3jwzeCq986oj128eoetS+pkWm5i7kbLJxsP/VRok=;
        b=L5+wdraTFFUv5otlXqsxZBFGrqulXpBk9hNXMymFBEvl7UJHzyqbBEcEpUBjh9TmUk
         yCGbq+KbZnev8uo8zF1JvuiOnthf1MXdggdp4mToh05HNQNEwoIRDCrSHBBb4gLO50gT
         WS6XHj07YYoxWlQi3ItkgJftAtzu83w2dX38qaRCn4efRlhGWIbYq6xo5Hmb4oU+rUSp
         eYR9Ay808IJB8YlYBarlYJNNoJIXBulx9XkO6zzIwBIHT7CYe/2oUSy9n8DsOn6Cgkhk
         rhjSlHAZhed/FFX+F01mgRTUFRN9BHC08QKf7I+eaMstTvRzsTY4X9oVpk0Szce5JVac
         EqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139470; x=1790744270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rXD3jwzeCq986oj128eoetS+pkWm5i7kbLJxsP/VRok=;
        b=lLpIKvLvvz1h0TGAXRmb5nWm1AqTityAfLkqreHsSDmVU5Bm6AV11bc1CI1mQgEXvx
         6yTYO8km1qG/c+IsqF6KgwnUzqIXwTmcIoNQ+DX9XoAKIJgHkEZ+q93mRhfTQ2aCJDlW
         p7WhPPlB20e+vjKg7outOeZM+hvrSJbXoOj/3og0UTSOyd7kfVJnWb6R+pkeNHGZQLak
         R4osZz+xpRTWo7e9tknlCm75WfsmsipNhrB8zRFEXH8a0zZRdlPFM3zSDvFTt351SJkT
         MDoZCl8KkItV+nLYnfw1AIwUV29IOU5tBH+1E6haKIvXmyJivC9eOyBKQCPEceakSyfY
         w5LA==
X-Forwarded-Encrypted: i=1; AKwUvByCZRwK7+yKeBD4qf0VjEblKpopFZVVWbykZX3bCpcv2w1JN+OCSWjlk9ILmVZ+Tj8pt+8=@lists.linux.dev
X-Gm-Message-State: AFuF++m+iEqLOlU3l8pUkkyYlIEgz2KK2FDrv7BnoFuUtcp64+dl2mrV
	llVsytG5Ki95YPnrKhM/cWBrwoplhhV8scIp/AYiPMZYNTvg5GRHdNWErF7I4VvxRa3d4NRoQXT
	0NDdCIlfcS8eBCcLQMIaxhp88sP0F9p55F5aXSbkprtZal6QeRcAQCbM=
X-Gm-Gg: AYBFou3NjYHofUqIm0Qu0IKT/ses/4B+9P5oouhLXh9AXF+L2H7T//b93A9uNMzkz/F
	QztjGv3CtRTzUkj9EcFtseSaMK6PYgr0Rgjtq/DsbycvanrA0NTn1fuDci7XgS79+OsEhq3qJkm
	aIGhhxnkbv/lLjLbt0ljS1oAQbcwMWftu7oqkXmK9Gy5V9eoeUjwA+nK7Jlgiajh7RIlfu3j6UC
	0aQm+Bk/gRyJPIodevAuZYdzOsmr67mrEF2K0yxt8afDr0muLd2dH/KueWctX//CYTlpbRjtv6C
	Ahr/iTCvrWue4D/rO89lmBFb3EOqZY7UzZbxnq5LucWNi5Tflz5/FzyU4Y5GHKO2iVRmeQ0mqzg
	RVl9rMvMa1qIC3mwlOv1I2apSBbil/w==
X-Received: by 2002:a05:693c:42d9:b0:33b:e75b:cc42 with SMTP id 5a478bee46e88-33e8d7d8b7bmr1164959eec.19.1790139470214;
        Tue, 22 Sep 2026 21:57:50 -0700 (PDT)
X-Received: by 2002:a05:693c:42d9:b0:33b:e75b:cc42 with SMTP id 5a478bee46e88-33e8d7d8b7bmr1164928eec.19.1790139469640;
        Tue, 22 Sep 2026 21:57:49 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm3168907eec.26.2026.09.22.21.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:57:49 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:27:28 +0530
Subject: [PATCH v9 1/5] arm64: dts: qcom: shikra: Add CAMSS node for Shikra
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-shikra-camss-review-v9-1-09f5fbea1309@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790139451; l=4132;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=7YcT+Mp4N9oUEJJb1R4A4tqL2v4DNSxfSMin5F8lmwc=;
 b=wI17llcRZ6hPMzQxO9isLCj/ZIjozRDvqEMslZcpq/PnsYIBKC8Z09mL6WHI+o5U2d2RpD3gv
 f7ChzzZJ5/vAuJny62EAqok1ig/I7UQnY6xJgJAd4DQ99hJwJxWuLtM
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: kA_rxwoWtUXgPinz_PIqFKwIV_kB3KDH
X-Authority-Analysis: v=2.4 cv=HdaB3SE8 c=1 sm=1 tr=0 ts=6ab35c4f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Aep19VGDvhHTtQhRaYcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: kA_rxwoWtUXgPinz_PIqFKwIV_kB3KDH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX0O1fxtj4dhZM
 G/d4PBEihdhXgzRxUHv5Cc7W3yWS4+0IFYjaND8kYqA7GrBMC4vYTswU72hbMZsc5JhjrI4GlfY
 /D5RL/wl2GuxKyO/muijSW0jxRjBhO99/HmNlKd/ZG7ZT0nh56If2Y6J3X0eno3LuOzYAD30B9D
 SavINlWcanKMAg5wz5oLzJGp5vZ2oApO+973/ZpNDzfDB+zY8aBZEnBF/P6DL2HmNpk2x3l+gtJ
 oihlYGK1rZl2amDpYeFhUCPxKyZM/k7jMk7OgJMiCAajKB3YynbdJ1g2xMz0V/7JD/vj07A4pBR
 BQwEVyLQYTKQ+WApy0b9hXB7ynYKVQRxMkm7YKmRCDA/sdDw9ioIba56FT1APH/teGAAPsgU4yl
 cSSMNoONvH8JiekH2HGURf+jSeag9zomAbbcI26qOgS2fCUX6/ocMeM2OJjus2h2BcX02mO9YtN
 ZLBYgeG7XyYDp8ADYMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX+0P9mOliHhpB
 42ipPg1lwvzLwH1Ac6QXOECYA2wOJPPQrGQcM6m9aAb2PzLRIRhFTLJ7SEcUJAjM0Znd6q7NtLq
 J7XvAI4OeMgu2JgLnWrEAbdQV1q514g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230019

Add the Camera Subsystem node. Shikra shares the same IP as QCM2290
with two CSIPHYs, two CSIDs and two VFEs, but does not include CDM
and OPE blocks, so only a single IOMMU context bank is needed.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 100 +++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index c1f06f692f66452c6ee1b10f3ef12c20e201b5ce..469023a22818962abb394f3ac02752f816efc839 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1977,6 +1977,106 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
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
+				camss_csiphy0_port: port@0 {
+					reg = <0>;
+				};
+
+				camss_csiphy1_port: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		remoteproc_mpss: remoteproc@6080000 {
 			compatible = "qcom,shikra-mpss-pas";
 			reg = <0x0 0x06080000 0x0 0x100>;

-- 
2.34.1

