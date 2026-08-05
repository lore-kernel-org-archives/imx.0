Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F954734E9
	for <imx@lists.linux.dev>; Wed,  5 Aug 2026 13:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937992; cv=none; b=iGRxiBkeUBUqKSaPsI/vIXDXOSimV7Fi9cNhbNNYxZfu3N3pXBYPwllIAxNlS6OQQYzFCz+0Qf7qFE9QlDuU3Hyv0MMK+BY37InAvp09V1fmY8uX32rGZ+DFJRJAeznpcroNh71W4Vrcy7Dqvs+w9hbX3AaWIg2y/CCEMUwEJ6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937992; c=relaxed/simple;
	bh=ig1ML5YRxSKYBLnbyel5EiPeXH4lJTzPwD446Jp+noM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K2X3imvQ8jiHI5DooTFOvz7TfHH+4OsB80ODgOACBkAZugSGKGCb3gZH6lLGCGYShpdWqKLCIxu4imJgvlLV0Iw09vlhg6+J8ohm7/fdcMSKxxubNxdzsOuIaiq4iGjlSZrbt4SMkhIvz0dCo2ffFANAEMKA6snnBxYdokTaRUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m9IsQMs0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aEmAwgF9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m9IsQMs0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aEmAwgF9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675BvHhj2165130
	for <imx@lists.linux.dev>; Wed, 5 Aug 2026 13:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c7OIJdm3VbtrlxeJChZycDupxK0CtLDat6B09u3YioI=; b=m9IsQMs0rIyVN1y6
	JSJYCFnaJx64oDzxIJMXhLvg+xMpnnXqg2Ks0Bbhqi69vTL+u/l1xGrEQHTMeHDC
	f8Nvq8REhlZsXVSnrd+bmFUNMiM7ipRPiY6KPa8pVJLVoxb2AgdtBR+ts0nV6SzQ
	+IredQXIbAqQcCHD81GbE5HrwZ3WgOO5DMvbpbOR+f9pol4+JFZ3SKFO36qtEOnM
	2YY23Ww5cpPxb/dUCw4xnZ/Tuyp2u+p5IYCiXGB3EQWKyKuSlMK979WbObd7ds/P
	bZn3x+Z/fR1qm5aUsqCGwTb/x1IgVZEpA04Oub7bUHN7EhvLHFyMwIha+DYM1l6R
	f/ALZQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuwbqtfaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 05 Aug 2026 13:53:10 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81ebb5e11caso27647457b3.2
        for <imx@lists.linux.dev>; Wed, 05 Aug 2026 06:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785937989; x=1786542789; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c7OIJdm3VbtrlxeJChZycDupxK0CtLDat6B09u3YioI=;
        b=aEmAwgF9cdUsfacHHe48FZuUwPScA9xWNMDvTCIPx6rTElN5/v3olkTIcBSIYupbT1
         x6n1M/zQ6Q8rHHCP0E+lsoIvXolulASWU0yOmkGpB/7n1Aq/NTCGstai/TFokx1H8QJX
         +Zs2j5RskXGmFvJuiARO7MqZK1qhHvBKEGRkwd2aIiZpfeDnPUbPyWcJJjIADPznYG/5
         hliO2oLYTzUQSdiVumz7CIlIh08PIKqu6hPhJlbB7Y8HOX8hrKSRZYJ9P+CEq7BfhHNi
         6QoVduV6SmmNoQYU3Ny5bJr1p5hzo9vzSNCUZpcRClqmL4QmkUJEvJ4N9+NVXujUCDta
         QHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785937989; x=1786542789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c7OIJdm3VbtrlxeJChZycDupxK0CtLDat6B09u3YioI=;
        b=JmuYEeMpDamyK4KK0D55j5NetcS7XyVwsYICjmLCfDSiVqwXs/O3K0a31zzH2z+L78
         SshPCQa3QqWcEYPvwms5i2sEfgkggxrQ1EbV6WXv1o92943urYQv/rfn+QHJIY3FzOkg
         je8eBgi4N2W4aqj3IfNIU2d9K9FmxzzjAc8rDjAKoBMe6mrzt3OrjAuKUYZQAW30UTbm
         +PXbZrEPDAkQJsl9U2FKP6Kwz469TixN7yTK2wtVdHcE+FoPWKh3IYFNArTtcC9bxOQC
         9y6ak4eG3dPp7o4lX/N/hse6mP0/KXKNVsBVaGIo0mgf+acV0aq58GGseAPN1GfV8vH5
         J/pA==
X-Forwarded-Encrypted: i=1; AHgh+Rpd3Y8vA2tmTws5FrF/Lpk9SRxktqdLHh9qNLTEOeRsV8KL/vDjbshHR8E/JQuYfat9LNM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1aB8GHqTRb8CojPc13UWMb9z0v6Qjdt0KqfJi2upj6UG03JX5
	Nn94ZzB5sN4TCToSR9+QfUQxRklwxw2x+g0Rxq40LqFgFK65CTTRZs9Fhso8c86DvOVTryeccd/
	mARIi0YFA3miNFYfFaegPQOB23VT+Wq4TKHLsds+B3FWfMeJtrrvKIQk=
X-Gm-Gg: AR+sD13z1qZeGWUzZfL5B5kxzH7yPsKrt0smp0PazuA7GVenqMmnWHTGZEjnnBgZ1/0
	0675Zyovz5HbF+rgXYB7DbmlOxcfoGkAJgVG37QYlv4gwG8SqTqum2n4cZfmcgvIhPRHOcZ1XXD
	IKvLPjVQliT+asxMCvKbh9wT2/aTYI5G4ij5mna44i8ZLL3oQPSzvYqEsVYNL3aSqFH0ZXEilJ0
	ijBIrWMC/+AGJ9vVa5iNyy3hl3lA65/fqHmdsIvXNQ8ZfV8I3Oyf4o/slPbvFaIyfZF8swZrAxO
	h1Qt4NoBVHY8l0UpZMCvo9GAz8KIl/BOcaGsnpguEBp5iZuP65XE6CRGqwLgNQOsc0m67rAec1b
	q19xXb3VTmOys5cJcuwT3D8W3qAq1vmA=
X-Received: by 2002:a05:690c:e3e8:b0:81e:d8ec:d86d with SMTP id 00721157ae682-8201f0c1475mr40011927b3.2.1785937989230;
        Wed, 05 Aug 2026 06:53:09 -0700 (PDT)
X-Received: by 2002:a05:690c:e3e8:b0:81e:d8ec:d86d with SMTP id 00721157ae682-8201f0c1475mr40011277b3.2.1785937988569;
        Wed, 05 Aug 2026 06:53:08 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8201320ec71sm20892517b3.12.2026.08.05.06.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:53:08 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 19:22:46 +0530
Subject: [PATCH RESEND v6 1/5] arm64: dts: qcom: shikra: Add CAMSS node
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-shikra-camss-review-v6-1-a8dbc66f0d87@oss.qualcomm.com>
References: <20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com>
In-Reply-To: <20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785937970; l=3966;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=ig1ML5YRxSKYBLnbyel5EiPeXH4lJTzPwD446Jp+noM=;
 b=Lf8N5eVjJBhYzRlwMotuU4Jml97qt2JyamtsHpbZZOPT+DCMpdZAJdgTOPKgvKtJSykRhRJgX
 jVgXX4L0/XKDRhKL7bxxmapb9/0jon3V+L9wwisnJgGO1dPMpIlqI1x
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: Xbmh0F4h4Y6k3ZSHQdKDwMuIYFTtPmxX
X-Authority-Analysis: v=2.4 cv=B+uJFutM c=1 sm=1 tr=0 ts=6a734046 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ahKksh3eZu5pIVwncigA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Xbmh0F4h4Y6k3ZSHQdKDwMuIYFTtPmxX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExMiBTYWx0ZWRfX+N+F77e6nsqB
 GS895NAkbNVG2EudmAXsAb9rFsSL8o6wi1PVisfbVgFF3SKug2sWTZiHkTKsUuTfK+vG8+bwlyS
 vh7bjzPNGjaAtYDDDx0FfIqFNJ89B6I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExMiBTYWx0ZWRfXwhWncqgCelq+
 9gxaCJTRul/2RQamd0DgGf0qVlkgPlKeL7/uQXOHJepu81NX4RsNqJ7v3n9RjKGjLzqStjl5zOP
 LF9+hfL3kM5GewZYf2ainsI3x/zWi43G+L5ezGAubmgpxJPU6YZHSnQqiGG15mfMmwkRDENnNxw
 kjl+/OfdS9pT0zyDA8icObBke0qL9oy0q3qSVA3YsBrChYF2RlJxwYF2v2P3oCJw0pbfvx9V2TC
 +Y/TzRn9wQPSaTtyCDiVNXBS2e4N9SJmpawHQHp40HV1oouzAhX6yzkCTlVKUbHmkYHs5QWB6og
 cVLzs+YKj5kO/RTAN4xMjuZStRcCk7ExAEHcxyuX2C6Jxcv/jjSTJPnGbNm5ODRZIZm4ncgiojj
 1pl9/Y5R+ICA2HsBKJ7/G5k6ojiNAhJXUAnI+yMGRWOKomcTfBHMzjz/LY8NZOd6svCL0XuoMWW
 Hjq8M9r6Rced6E2WldQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050112

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
index 80e8045282d819f14cb816b8b924dbcfbfd866ec..2e5976861253f4402c75509f52301c21e3864d1e 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -640,6 +640,106 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
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
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

-- 
2.34.1

