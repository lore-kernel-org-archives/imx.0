Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C964279FD
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769078492; cv=none; b=Uit5kin4mzkKH480hyLQg/O8qJv6lu+LJgUr/5/KPxzK0H14U+kDG5JJCh+xbnzyzhyd6jsGaV/G4trXJq0XFJHXovpa/HZthZhpTYLKwnim5vf/Tk1nfHbH+lkPTUU+Ugq6tA5KnillvpwyvRNXWUBS1kFbIb8PlyRlTbyrO6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769078492; c=relaxed/simple;
	bh=2WG5aoisKJwerkvnpytr8xGIA19LajXbCLZsav5MoQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X9uv1HiiSAB8mcINVO15ht83115F/oVFmvU3wtfTCpwHMeg++tRCH7+BCdN97XRVWXD1d8jUbUJ64/qqCS7NYxiV1qU169pBNp0tjc1OmufMfth/1GbIqVliZkVUAt1POcCjQgdfIBuzv8Wq3ManX8B2GCNRu49aIAL9j04MPT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ozmmkC5M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=joIuGejt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ozmmkC5M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="joIuGejt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M91t293463151
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/UfWtw5ZQfseqhZRXzgqUeaU3ggF8Gp/sL3W86n7mc=; b=ozmmkC5M/tEUYKvr
	pj9eip0gDDbkOzEihU0UoWRYue/7bH4BfLspEeEb2Faz9QoSWG2rUnXEbK1tMHCg
	ngMz0I4dBEbbLPOaQmzfmuiKd0CYyuH5bEi6jaujxL5bRPaO91Q+wuhL/AZsETGE
	0VAM3FYflM8XoaKQGNMbPRKLyTH4UPCMyt0BYVULynl4x8kuaR7fWWUmsfEBLcLR
	3G6rtPFUidYu5iNdyJcgD2QHCKR2Yepkh3I2b1uy20cJL9m+9cGU2hlPf+RBuVrw
	IpiFLxuTrTw21si6OQGXkFjhzFqCMtiRjxZA6tE+W0fAhuhfxw4pVqC9LyLwdI/v
	wS/SXA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu0653hfv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:41:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a289856eso543532385a.0
        for <imx@lists.linux.dev>; Thu, 22 Jan 2026 02:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769078487; x=1769683287; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/UfWtw5ZQfseqhZRXzgqUeaU3ggF8Gp/sL3W86n7mc=;
        b=joIuGejt8DkL5o1Q+wQM92G7Vjx4YJ3Mfh94AHHXQJwfRbpoM07y8pyRhvU99g9Gl6
         Q1OPAp/mBR7fU0YxlOhw7oeDKfc2uDfT0c+VsRx3d/xgu8MB+3V2NihxyUFPVhC3st4f
         h3EoO10nTQdCtC89Af8oRNRshrWsGp/7rVJXsyC5z3TmkbaMS1idbzYa4aM764XNHAFl
         Mz5qNwDaYcGFRxhrmcaN8UEUZrqgpfk+OgQX8vj1eGcim1Ay5GgI2hv1ihfqlrk38A50
         BKcDIZ9VH5A3I8IfIBRpQL8uupH0US4wBqHd0wZ3rUeWdHpre2NEc/raoZ8qYCaU/uG9
         RCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078487; x=1769683287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T/UfWtw5ZQfseqhZRXzgqUeaU3ggF8Gp/sL3W86n7mc=;
        b=i93FbIJB/WZgxi7Is7QKSzZam2Yq1crLGAPS8fOSqFWlJniGUMjrL0dEqsP3tyiQSg
         vIvu7T5tGtaFCaOGtrxqunyQgXNx2fQ/Qgq+VVkiG2VdZI+hMvtcb04QWVKvMI8oLgjt
         rGQ2dulKmvN/0Y0ouiffkDueEKNMYI48G0JPs24uQEcmYE6X8QGn8WxyqzeM21zMm/J7
         AOiiHu+De+ygpMwdENw8nhBP9qZXvbGelawtQYS1P1jgoYeAZOlhRyPAWuSYAQwjCQOd
         /xHtVnwMQo67hLRJdPlTN0Q/dZNeUwqn8ysnBH/EzcsCUXpQxHB+ELXysUs6n3jLFWq3
         IMCw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ/vMx4EXurwTZ9ns1H8DBwo/0h/8MOHqd0vpbsq3ZQCN5hK7W1qdXfXYlChqls01UVgM=@lists.linux.dev
X-Gm-Message-State: AOJu0YznEF3B9dR9X4O4E/rKMgyyKmlGfb6uTP6Ly90nkjRWTMGA9LIS
	4Y45WSGxEYf8RSC0+u9g2VLrFksSnzZu/863BOPIF6uhfdXEFXWUJVNhBRS7ZazjE69FJzbJYLM
	F5QZkGFfF7dKfL0zrPr8T1ZS7dJS3gjMvw/eihHNaTQvooAwKSYwqLnUk8H2lyGyoeg==
X-Gm-Gg: AZuq6aKql5bBJphHJTj6s9rZur1FJuO5y8jEUE0gWpSZjL5/EFcYB7fP4WdQhqqQDiP
	NdNEm0/uVWQsla86ABiN5RIJ6IBxtCVOCNasO3REyo3mIr3K0IVMc+1+zLojaZcR2OR/Ok6MqEy
	Y1uhurbeM+kw2SZ1BHK5FRJAHWwXxJ2eIUdAxGc9wxt1eVN7tlWnHU+19KsF1orb+5NsWV+uNmV
	UllhXYocfMU/dSzTi4DyWaRDwZM1loTNHgUBK8NYbvRDuTiZhPxU12zyA1UN6Lak5OGL9gTnLVc
	hNQSMeROgR+7qdJHeu3tNR42rxlkWqJ8XDeWanj2aZXTkvTnJT/kFnZMHIJdyF9SZ46ZEebA2He
	5YHtaNFoEMYSZ8XSzhMlFufw2wnVYEfsFra1RNaBoV9X5mN7O0WnfIy2p2qCcOAjpC1s7IqC3JU
	XR
X-Received: by 2002:a05:620a:4113:b0:8c6:a5c8:fb39 with SMTP id af79cd13be357-8c6da87eee2mr272141685a.1.1769078487584;
        Thu, 22 Jan 2026 02:41:27 -0800 (PST)
X-Received: by 2002:a05:620a:4113:b0:8c6:a5c8:fb39 with SMTP id af79cd13be357-8c6da87eee2mr272138685a.1.1769078487163;
        Thu, 22 Jan 2026 02:41:27 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a7260229sm1387868685a.42.2026.01.22.02.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:41:26 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:40:48 +0800
Subject: [PATCH v4 3/5] arm64: dts: qcom: talos: Add CCI definitions
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sm6150_evk-v4-3-a908d49892e7@oss.qualcomm.com>
References: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078453; l=2250;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=2WG5aoisKJwerkvnpytr8xGIA19LajXbCLZsav5MoQ0=;
 b=t1vTSMWGXPTYqrQxSeJNFQegnAyafTbIj4gd43njXHFo0Sc5yhyBYN9CUxe6ejwaAaXhH0Z8P
 vNxm/R4ARtgCsjYeWoQfBsvr9wAP1l0UyFu+kWQ0/YQRcXsGVs+db4L
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=HOHO14tv c=1 sm=1 tr=0 ts=6971fed9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=szutk0iRDVHniUSXDBIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: e9pAupbyO-5WOTIN69b2hs5gOO3jxy9E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NiBTYWx0ZWRfX5NGKCiWoOhwl
 NLW4qejVWyeyC6gtHDCBFqEgyuFv97X5Ql8IBK0nmDPwpzvsGzbE5yXq1y3Lwc+5RDS7O+pbYaD
 wy4meni8l9/A2cgUkAvSy8ezN4OD7LvTjYQEle+mqOwZnWPmiemfLypq9UXGkXrNH2QAk8p0vYE
 gM05VMGm57tCackgciueGK1gvwTSuWayZzPEuRw87SmHtPTZPZmSVg0XHHXby+cl9RlSs90jI33
 f/MfrDelKRL1XK9HUQ70HhT8/i78f5siuW38tTF3UmKUYRxstaExf0u3KvB9bnJBWeguc9jImMB
 8B0yIyH4bCjIQXXaBWIaTixCwcNP/QxYVbs5HjOGiNgYkNEQCTyKlFTxsIZQAAn2dxH/F5e/p36
 pF0FjGRpvjNQYTnN7gK370iZL/hK+jgtpncVCVEF7h9ggmAsQWrpruRLdfiUCvqPcEjyRh3fWna
 SUfyQ7n1ruUBQyp7wXw==
X-Proofpoint-GUID: e9pAupbyO-5WOTIN69b2hs5gOO3jxy9E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220076

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

