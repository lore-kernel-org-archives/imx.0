Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7AA3B27EF
	for <imx@lists.linux.dev>; Fri,  8 May 2026 11:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240484; cv=none; b=Wwy3Jajzg+lrgWF3HZNOkeeBUOCrUMKJGECqEyqtOLtX6/m3cAbj5Cxnqu0flJXRuzywHNM4N0oyjyBD/dtB6DyFEyzto97gaRhZMlKvclwahh4KNNlug1qA+VWdn79H95/uh5H5D8lGnkIA75IQKUyi8zUp3o2wgiKplVjCfDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240484; c=relaxed/simple;
	bh=LrVQzvK3aaFPI2VJ/t92Tum+Ag4s5MXEloeYF6b9XwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cMj79sJquOgJ5bjvjTzmc6uEQRnl68oQ2T1ELcgSn6RUYx3qAe+xv17gZ9qMtNdvAXvggalDv1HzX+fCMsJLk2KKz9uVG0TSRKGr1smmhwunYNOztKk84YnSBdFwfwi2GCn0/u1Ffo1tU7uL8fqOF2HilMVXsi2rgxI3LZnkbT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xebmvqyr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X4gtEsXg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xebmvqyr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X4gtEsXg"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6488Ffsr2384216
	for <imx@lists.linux.dev>; Fri, 8 May 2026 11:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3lUfbSzHokBAbhf+FTi5ZKM0wliKzbivz6yle+r6Q8Y=; b=Xebmvqyra6sMtzTX
	swcqjpfSqrvDMUqUE+Q3d8+0LuBvOi3FSH9SpZ+rMsHP72xE+bDtQZ2qF2GCTD9t
	iYbXpzdA2RIOyS+ykSFhon/g10NsJ1hRNzEoLjuQ1SYyc0jT9Bl3eslORXxAyQKU
	sBHy2A3g4s8Cg6Uc41/K6RXpFvmu5XLeU+n9gRQqxzAFBDc/G6QdEpC0b59ZSb/w
	FOY0IbpkvSfz33D4jFnPkx77ABTrPhDsaVVGKJ2hov6CttpuipyiGQ4u1CqHbkgX
	wm1RFdWKjZRAYtlTxk4Ve42+b8HJqoCx4+7PeVWJjHaA2vSjB7I2yFSiM/o9/C3x
	yD8y3Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0wwukwgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 08 May 2026 11:41:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8f9e55c40a5so214465085a.3
        for <imx@lists.linux.dev>; Fri, 08 May 2026 04:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240482; x=1778845282; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lUfbSzHokBAbhf+FTi5ZKM0wliKzbivz6yle+r6Q8Y=;
        b=X4gtEsXgP9oTvTK1T7TbCGXZ1yM8/dmSNgZsF5pUPdz0otDaJK/shf2gdTMj0PMLcc
         ugVuky4NNSBmCU2qekwESKSCMjHJ2CYH1Q2gT9Fm/XirbDvCoAkdy+W9chWytWaOfsP2
         9/wgD3CmXCCiALGSjLGfCQL8qdf/VTLHGkQyO1ylm6fejgLEKn7mKk+mdqaZHUg0lf4r
         EiFcG4cHFhkrbUPVbIeP5upHAktFLmdKDik+0gRPM339jm8mbNhl06NJizq60UOncMVw
         L8za1Z+a5nOKbURbkP/puzjSU5XFCJpo2snphKaoPBmFU4UuAASTY5kuvXMZcjs3JAYY
         E6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240482; x=1778845282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3lUfbSzHokBAbhf+FTi5ZKM0wliKzbivz6yle+r6Q8Y=;
        b=s58Qy9aqfM+FFxp/RW9g+ryc/ezDjB7UT51K7LnyNduVeZr12+fdStTO6e0qw1Jgei
         5bTqIgtnF86OjS2i1PiX4oI9KdKLCEPl19Locq0IX7GG0MD/YJ8gh27P/JPnqRZO+Nrt
         LbpOBTa2uinE+kNsmFHF5W017ZOrxVfYDOry4DYjRHy2tHpeTZOXssoIKmdXBnyy/uUw
         N+EUjeJGk79qASrN6iMYenvRqvsucA65FTS2SEu5kxWA1i6FAvzzEfggXx4dHq349Bel
         UPUHDvZk2r5/1MIBh0C4Ug0quLkfsRdcIvVmIdevn7KXkyNRPugyRqNlG4qdGrLkqgqN
         1o1w==
X-Forwarded-Encrypted: i=1; AFNElJ/4dgzn1fOijpFUarvFw6R08MteGHqNC2BmmP3pjC1sJ/4nnINt5QmZrImsnQiYCm3KSAI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1YwYix/b4F7ZjvxenWM6J6k3Wpr8Wiu2O8g6lqdLQVlIAP0N7
	1IYytZdCWn/Ydrvv+5ZgcHbzxGRrGX4vucaap/JqNO8zq0i5EvE98LgZkFBBljM/njDPyXLRaA/
	NO2rWfLCcKVNuyYxJqqcCevN1oM4A/XxdWWMXa20sBx9+H76ReqnIK5w=
X-Gm-Gg: AeBDiesDtL6SIc+jkuATgZ771PagBVqjFtcfmtrk+AATXU1VFImM37/hxnvFdDP+5zc
	X25MNzs5NqxkmsyCz7V5dI0Bsv+1Ju6ia/6EiXHveTcweowJB7OHX+QoppTapltrrkKqLTJXRfL
	P8/UNxqnEJmMaMkt/xDd9Q1aVNT0fXdnYsp/0A4M6UIpPtgHLRv6HYYO0UIYDVgUn8sMPMWTl85
	eLhVuRjjO57Yjix+qr1McbOenysL2x7rpLZkB9QZuOLdkKDD3oLLnZFF00Y2LLiXr4eNftU0b71
	I6ewmDFbDCMY1mCURl/Z08M2ye+DXCcqnZs7WXx+XEjHNMjw6nYrNZ07T2zkt8VRU9LkIimfJpL
	JgE1maVoTLrBMfSOVWcrE3yP/0C+qwJuZUH6eeHvOeJ+a4me23xE05LTeCb2hvgYn8+JAEyqtIz
	vepgobBIsx8Xej
X-Received: by 2002:a05:620a:370d:b0:8d0:27b8:fb7 with SMTP id af79cd13be357-904d68e0a4dmr1850236885a.46.1778240481428;
        Fri, 08 May 2026 04:41:21 -0700 (PDT)
X-Received: by 2002:a05:620a:370d:b0:8d0:27b8:fb7 with SMTP id af79cd13be357-904d68e0a4dmr1850230785a.46.1778240480777;
        Fri, 08 May 2026 04:41:20 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:20 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:39:59 +0800
Subject: [PATCH v2 3/7] arm64: dts: qcom: x1e80100: Add CCI definitions
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-3-3ebdca3e4ae2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=5190;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=/I0mDof07x8EifLd7501yc6I3MTWZ4BBdf4ShwpUlpM=;
 b=CqwPvq9TmB48DqZyALYSV4F40gjNSmgNzB4Q9Ok04YbO8qTyGp4xqlb3vxMKLnirJRHw4MFZd
 pdss89cjjQyC/IzDy04KqUE0vjKKMazgFQA/K+rIFFMJQRDoChTfW6K
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: c_4sVaZgxqkHw4tc544yrW-OhwMNcdgd
X-Authority-Analysis: v=2.4 cv=Nd/WEWD4 c=1 sm=1 tr=0 ts=69fdcbe2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=EFDngOt3UxJXKfoqbMMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMCBTYWx0ZWRfX6XaLMqBvfKA6
 eIFoAIsCYdispl7BHo1StCGoBdyjqqnX74Qc/CmPVsV1bP9ZbFzf1P3KChfZbg0rcdb05R/REZu
 0tByDGcYS9zn8VLaIYF0I1V+knL6e6ISjnksbaKuwh28wv9MtpWgMJaXA7JigpuD/2mr1i+qXQr
 OadayyLcptmV5IRj/csu1DjlydGfqbKD4TNbqlSfPK0gkAPTB+YYw3yRfXuOeZqmv/8acayRj2Y
 ST4ux7cNVx9pVCW/JBmErNYgs15A4t36AS5FTBGRlf2g7UvXMbUZssjps2g4abOnWRPhhrzGQt/
 hgQDkd4/OIRH73JRv64y/K7WL62G5qDDL+gZSNQldh5gg22EqeA40Yj/OhCF7xI6gb1w7Ib2mph
 51lAdjtZOXvbiU9A6gUwU/p/7v2nbirTATRUmhVT23jeGZ+2nC07WlcGmFBNCxVF+k8l+yfZOv1
 q9ybzddAhk2EdYgpLEA==
X-Proofpoint-GUID: c_4sVaZgxqkHw4tc544yrW-OhwMNcdgd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080120

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add in two CCI buses.

One bus has two CCI bus master pinouts:
cci_i2c_sda0 = gpio101
cci_i2c_scl0 = gpio102

cci_i2c_sda1 = gpio103
cci_i2c_scl1 = gpio104

The second bus has two CCI bus master pinouts:
cci_i2c_sda2 = gpio105
cci_i2c_scl2 = gpio106

aon_cci_i2c_sda3 = gpio235
aon_cci_i2c_scl3 = gpio236

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 150 ++++++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index c31462ba393fd77b7124db2ce680663945e7fee5..74d6e4300506645a63e09490883eabf749829e58 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5551,6 +5551,84 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci0: cci@ac15000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac15000 0 0x1000>;
+
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_default>;
+			pinctrl-1 = <&cci0_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac16000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac16000 0 0x1000>;
+
+			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_default>;
+			pinctrl-1 = <&cci1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0x0 0x0ade0000 0x0 0x20000>;
@@ -6201,6 +6279,78 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 239>;
 			wakeup-parent = <&pdc>;
 
+			cci0_default: cci0-default-state {
+				cci0_i2c0_default: cci0-i2c0-default-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci0_i2c1_default: cci0-i2c1-default-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_sleep: cci0-sleep-state {
+				cci0_i2c0_sleep: cci0-i2c0-sleep-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci0_i2c1_sleep: cci0-i2c1-sleep-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_default: cci1-default-state {
+				cci1_i2c0_default: cci1-i2c0-default-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105", "gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci1_i2c1_default: cci1-i2c1-default-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235", "gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_sleep: cci1-sleep-state {
+				cci1_i2c0_sleep: cci1-i2c0-sleep-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105", "gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci1_i2c1_sleep: cci1-i2c1-sleep-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235", "gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			edp0_hpd_default: edp0-hpd-default-state {
 				pins = "gpio119";
 				function = "edp0_hot";

-- 
2.34.1

