Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4D242B720
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079006; cv=none; b=Sam5mE7ODUEhEL9RA+G+z4KlZ/IXQOQUzrNUNQXMRoBCR2anS8uan+nUA8OmcMpOg9ydXQef0jJJTsasvqGFnP0yensvpAn55qjUSr4PVXqnLnW5jenj1mxL8wy1amZo8Rtzj/huqY5zTKE19bnkdwmbbwOiJzrNFN6n5ODEf4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079006; c=relaxed/simple;
	bh=2WG5aoisKJwerkvnpytr8xGIA19LajXbCLZsav5MoQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IJoJc+ls1w/g+fwaWaVzcDdWUdTpIDl5Wg5nvAr20BqHKKDNkYkS5LFxhmB0K6ngUBP73Y+KZqJs7K1dj1r45Nbz4i0Ee0mRY04gwqkpw/6+jXGtdE+ULXlJbkwZUlgPonBQxvpzW3X8ID/XD0gQU8TV1yTSiG9ak/St2fH45mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zv2rITlz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gTUOVDkl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zv2rITlz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gTUOVDkl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M76qUH816110
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/UfWtw5ZQfseqhZRXzgqUeaU3ggF8Gp/sL3W86n7mc=; b=Zv2rITlzggNvS3KE
	HJ6wXwDfRMydyGn8W0+KaJ75ZV1lf2lijfbO7WT8i+TcxiG+w5v4jOaLRSZ0M9PN
	+gV4dk2kX7hPQzc7cL9iU/+Cao7nQ8mMQ9fwgrvT6r6SCY+fz3Fz17hDCdemFgyN
	zB97T0tb4p8HYKMgfXJyAWKl/zcgV4Q8dp4JCfXpLyhSKYu+gJixBDsg/j9VyRWa
	VWT0iIwCMtkvPw8pGtfeyWNBJZg8NoLoqDTNibLq0v9hyO1Tn1QMc5r7/kNHICV4
	AGQTbW+pLaKAZIxKkKfjtVVXh1bGGg8TU8sUfdPVg8WUhIdQ4cq4CoMQPnHLZO7/
	Ymlz1Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu65v270h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:50:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5014c472ad5so24056081cf.0
        for <imx@lists.linux.dev>; Thu, 22 Jan 2026 02:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769079001; x=1769683801; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/UfWtw5ZQfseqhZRXzgqUeaU3ggF8Gp/sL3W86n7mc=;
        b=gTUOVDklco33jGHgTEmeChJ4JVWnZDicOr8dqTt6TgDAB+rdg+jonw3ghUU32DrGvo
         603+QC5pYLJuQuChd0jnGEdu0Z5AA07MpWXGJYOZKHUnvMdpYD3VvZzjcL/yQkoiUZ3h
         Wl+2IB3LJjflHna39By77Xi8Drz+t4XpWn4mfHZ8yL2ZiXNkvlt3/BZReZdEGwvEMM0k
         XiFEqU4TEkDnJj5TqT6O6itAmwfzT8VUh0pZfdH2QNOd0MXZTyl6ahA8U63LxM1apW8K
         3q1gFUqHL2PH3BkZWhW2H8nYSQxXPwDrKskZj4KIUZ94O9sBkCkTycb52PaOrAgmUJnR
         yLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769079001; x=1769683801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T/UfWtw5ZQfseqhZRXzgqUeaU3ggF8Gp/sL3W86n7mc=;
        b=Xvn1gMcOMH8IRdBuCeOvope5Nm0UadH1EaadP1oxLoixSOR+FCF5jL+ITXoxAZn38j
         ELGNq/eEBqWTXiQO8HDu2Tvjy0aJL9avw8zGqZArJ81ygc15I3gJB9iivCMbTiKvnMon
         Y0WoKeaTc+gM5xqFwFiRuMH9gIRV+4ZO0n5RP0RnjukuTEXq7RXiIeHeyua5S3fA9mek
         WgROM8mGMNFCYbQ8ya80mjpYjdUEZ0HXreTnn0pQdjCi8J4HSSxTP/cbqblxONztFGAO
         3Z3kC8a+L/W6+/Ij92SXXMHoS0G4eSGd+rqSv3Pr0QKYkKFZJiuLBbqxELpxdFnKO3gV
         fY6w==
X-Forwarded-Encrypted: i=1; AJvYcCWvi0vpGcAFpnBiBxSuMuG2Dx7tBZ7unxpjwYC/050Q5HViw2eD4BjIQJqmoqI2m5Z38fk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0XN17/g2Mo82LmZftk0O3kLWPhgrTDLklt+bOj4vNlPX3PwJo
	344ue0qdQ4PIMOKEvkD82NIUkuegTElN6+t8T3c5m30Z0fe721w4aQVi/dpB7pBlTUQZyYAYvzT
	r43WL+U07REyD49GH//XoZnpRIfob1YIx2XE/yXcpGQuzRA19jUd5HaDp8RMydBNhuA==
X-Gm-Gg: AZuq6aIZOLKxbJd1JzfNCb8kY3HucJZlGIT3iCj8HQB277YhUiNsHmzDC6ffqao7zhB
	4czZqlGlH2SaLPj7ZHc+MH1nXgLg1A1S1hKXz2sbHzlf7NchMYTobU2DqvczcLysJAMMwmLBDNF
	+71o/7v/a3Zl8BgPCshC9FcLAqI/BGH+jbCNDgOXwHpNDYNgfkv4BX+NIFeAS7JKEmRXxRoBRhp
	dTRUnEk/bcX4xEqHnwXtDTAdn2XtgHka73IwEELLdm/n4Uc0VMwWkx5UHzcIfLdxnGqWO4v5Swl
	W9RKvQUn/hcYWWNWmHW5N/M2c961+Vb5oagC4/otQeEA+YCIEEghy8u4f7WTRAZfyCy4g1Raxj+
	nYf8aXDDow3JKBM5zzt4Zyks/TrMP73QbEWFF4/JCzmvxsP/YXa+AEZdLg3Ep9P0TbR8DSQsOAE
	4Y
X-Received: by 2002:ac8:5a08:0:b0:4ee:1aab:fd6 with SMTP id d75a77b69052e-502a15e4660mr293697591cf.3.1769079000820;
        Thu, 22 Jan 2026 02:50:00 -0800 (PST)
X-Received: by 2002:ac8:5a08:0:b0:4ee:1aab:fd6 with SMTP id d75a77b69052e-502a15e4660mr293697361cf.3.1769079000440;
        Thu, 22 Jan 2026 02:50:00 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d9ee19sm121704901cf.14.2026.01.22.02.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:49:59 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:48:54 +0800
Subject: [PATCH v5 3/5] arm64: dts: qcom: talos: Add CCI definitions
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sm6150_evk-v5-3-039b170450a3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078967; l=2250;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=2WG5aoisKJwerkvnpytr8xGIA19LajXbCLZsav5MoQ0=;
 b=D4j93r8djlEVFvPHXUNxrEEMUPi8V2DnJbU02J3SwFN91DYAirb6S8cKc2/TO4Wi8hzF3ZLYt
 j71PwYeIltuBT7izRRMtbrZ8CkPgnc4JNgREU7urfXhndWGqqpfwO1U
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: FgpRzBr9on-ruizWo6YMUMVVdhwUPoRu
X-Proofpoint-ORIG-GUID: FgpRzBr9on-ruizWo6YMUMVVdhwUPoRu
X-Authority-Analysis: v=2.4 cv=J8qnLQnS c=1 sm=1 tr=0 ts=697200da cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=szutk0iRDVHniUSXDBIA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NyBTYWx0ZWRfX6YCOut35xAh+
 YfQH6wj8e+I9gY6+PJHue5UfCHK1PHruax4Uka2h/64E3TWIUW9lxlA27AsDFl7ViLd4zDZmQgW
 KcUxxPYRzYHm1qm9OCxJL07iLaEP7Ywj/EmVrKuieY7U/WMq/v2p0S1dk+yv/v7y2KMJ9ZL5A/2
 OMFYOuvbrylXx1IBqMWNDIDJto97kknXvVhOzdEVosoKFICuP+pT7bpLHfGPi+awhNwgf2XGsP7
 +qCnn1/0yxXmyYfvDyeDEKQPFJAYBchFYdv1DhwX6jlIKswZZ70KmNeQFOWWJ8amaJZObiC8S5S
 A6/cFoYE5LxPFWS0WersBrjHM2ED0SvEeS4Ci8f7AAsT8dezNN4NKPO0uOui8BC8JeeMuxRimKf
 yy5VK9vZTXWYFUjPq2sCnHqqLaBGo4UuHb3M3knLF8Kbdl92XvOxoRCbsj1vHh8dJrgMVXjsc1r
 Fmiu9LPSEb6xjNOqXKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220077

Qualcomm Talos SoC contains single controller,
containing 2 I2C hosts.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 51 +++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 3e1d85b6eacb90b48496ddfee2db27c586f3331e..6d28096e50546855bd762e479b66ed6214ec5d65 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1553,6 +1553,22 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cci_i2c0_default: cci-i2c0-default-state {
+				/* SDA, SCL */
+				pins = "gpio32", "gpio33";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c1_default: cci-i2c1-default-state {
+				/* SDA, SCL */
+				pins = "gpio34", "gpio35";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
 			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				pins = "gpio4", "gpio5";
 				function = "qup0";
@@ -3789,6 +3805,41 @@ videocc: clock-controller@ab00000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci: cci@ac4a000 {
+			compatible = "qcom,sm6150-cci", "qcom,msm8996-cci";
+
+			reg = <0x0 0x0ac4a000 0x0 0x4000>;
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING 0>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: isp@acb3000 {
 			compatible = "qcom,sm6150-camss";
 

-- 
2.34.1

