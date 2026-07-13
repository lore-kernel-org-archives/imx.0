Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A9C3E2752
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 09:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783934956; cv=none; b=TF5Zr44v4V0bbcPbrOUVFzmTwAcTMWBzv8CbkWCPA63BINmbo6JCgYM1aTalOVCj2ZI4a65PGj6ea7FxiGyP7HnAvip7V2pMMdgh+US54FG9mfRF3jnpC7eTdwvz98pUAg4hzFqSGaq8e3+xFCKLttWYiktA1dk6kV4+/zPFWQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783934956; c=relaxed/simple;
	bh=3DT6QRDlnKNLdhYLJ0aWsJwYiHRrU9kcv1vYTABy68U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RJ0dY9pmbNqSHmQAcPLAgIUtsz7gFwizo2L41PKioYMk2WEJT+UahcWQFu3T7wu3PJao5Mzr/UhdyoRQM5zm+/XvavnKnjlLBkOTPAa5M7EYG+3Vy4B0FOxyDUiBCU70c8P2HIYkVa4yC3hwX+QJa34AAWq0Y9FfEPdsSEMxXsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eWL33Yg/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j8S842DN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eWL33Yg/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j8S842DN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7Yu87794449
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 09:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XPZHmS6h/AcJRV2idSAJRkkNucwFXp3FnUZZxD2wUGQ=; b=eWL33Yg/FdDF8gik
	hh9Q5gFuv1X4L1wriQAXWuu423D5iDCwzwo2LrV4USpyiOLFNLg4MGc2WejsLyIA
	kVBgmZuoWjZGDeSYxUdg7+4bHnZnP52sNzC6amsMXsnp0TjwZbAKNUuBJntb8LZw
	vmJRqq50sDvhtWJzycyUQQfacceKJ1WZOBHMYI9z0L2WM63YMjRsE4ppA5D/OgPD
	ToOKd5heWqm7AEaKAnFl2rc7M6fyZSZqTVYS8GJVTbwNGpAFTJvwl+umFgfYSxts
	jB8Ig5xSVmhb3w5zJ+QXAcS/ECMNo+UITDGtpNt6GR7tf6CHR15H6wsq2Zwt58H6
	Y7CBNQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn0djc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 09:29:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cce406883eso28084165ad.2
        for <imx@lists.linux.dev>; Mon, 13 Jul 2026 02:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934950; x=1784539750; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XPZHmS6h/AcJRV2idSAJRkkNucwFXp3FnUZZxD2wUGQ=;
        b=j8S842DN1Hx/g4mCMV9YZAOfZmDL4zAu47eSrzc/QUU9nZlruZlt3JYQ1jgN7Dco0B
         YkMXSMbtPUdlT4Spb8G50jZzE6VO9go+GGNpwPkzaAcOaIHjJpImYrGWbuRvcHaefqGx
         qMrzdxptfb4rnF953HDGwMrdm6H1ZhsXgFLLztWXdmhQj6FzX0MRBi8QozCssU0pAPcM
         acraclBm/sfDNWIa3Ppki+w1GgipFMevTUcpFPYiY4h0gu0DAOlDa5WiPogwATLqaPXn
         8dReAB/6ogF4wNihYkhjol9x5jUXZ3yjejV0a/Vx8y4ENDkGvNYVa+6ZMi0miTXYYFX8
         vJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934950; x=1784539750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XPZHmS6h/AcJRV2idSAJRkkNucwFXp3FnUZZxD2wUGQ=;
        b=NM+B2ZmBKcmi914wEvL0GaWACMNNkJzBgbkZvcR1t04Svt+jq5+CmtmxI4DlgOkvwV
         AmzSnut9lt6R7Nn7QwYbyWdttvMXassAE6NuEKLLnB3qe7jpoiadcQuDyVe4Asn1t0P8
         B1ylV+XuNSGoEzgntpTk3EyhnL+drTJz3BpIiLjY27wF8yIA1j2NOfpDrLpjJq611SFx
         x850ySaQgAsvevUFnk2wccjOZRZfJBEYfdnKb6i5ISMvrB94P+hM9jfz5HfyiAxmAsVW
         3SxYYQ6t1VYvG1iaXla3zXJh5tUz1P0ohDsx7u1AJQBWLa4QLH2wTlCNL3iSniCPES7D
         Ef0w==
X-Forwarded-Encrypted: i=1; AHgh+Rox91H72VYN1yi1hmB6OQBVoOJPKVWQs8bOZpihC7Ub7lQ9WPy0WIKJVzXyGnl4aHBTfOI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVTj0ankn8UTkYVSv+x8fGVT5dbNN7Dkmy7ajl3Q9wTy+ew6Hp
	E6nqyKOMjbNYzDy+HZuz6oBb65aQo7HbrciipFZYbLKOLTLghn83+Q/WSPn0bUnSRznkJDnr7Rl
	F0NV4RIZhgO2ERBvBN/pUxWaybbPTAU6YZVMVk/REwzYoxpcKAL6h/Lk=
X-Gm-Gg: AfdE7ckiloQlpsXc6lWjqogSqXFmdmQt8yN5kEsPxZQIDhCFnIPenLlnsGbTWqwg4tx
	OKFhg9sr6jSBv5LV4R5QbrptzOiRXzLjdCgG/zjbl8PedZjxTksCTEpV+lHGIS+OoBMglNGFc2V
	Dl3xQjjuxHyKTHY7RxA70ocnF21qQDFLcYidvP+bjyHnWpwsDILomjcP65wEbXYiFjLFgq06WpA
	xA5sDMZDdJvxEzZYTWvYkaNbmJLuzY109pjFoSmgEJ04j8BDZAeKldWVO9PdAbU4A+U/mb9jUKK
	uu901yWDdPuuo+k3jJqx+KUlCnOh18zmIiPSYfaOScpvg47PugCvJuYdgw+PBY+hkrLO72VT9YQ
	0MjsrqjNuxW69ElrvildySq1lnjbivv5idPeGZiROCQ==
X-Received: by 2002:a05:6a21:7010:b0:39b:dea7:5626 with SMTP id adf61e73a8af0-3c110a73f8fmr8546315637.35.1783934949633;
        Mon, 13 Jul 2026 02:29:09 -0700 (PDT)
X-Received: by 2002:a05:6a21:7010:b0:39b:dea7:5626 with SMTP id adf61e73a8af0-3c110a73f8fmr8546286637.35.1783934949195;
        Mon, 13 Jul 2026 02:29:09 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm47495569eec.24.2026.07.13.02.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:29:08 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:58:34 +0530
Subject: [PATCH v5 3/6] arm64: dts: qcom: shikra: Add CCI definitions
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra-camss-review-v5-3-db53be15dc4f@oss.qualcomm.com>
References: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
In-Reply-To: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783934917; l=2621;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=3DT6QRDlnKNLdhYLJ0aWsJwYiHRrU9kcv1vYTABy68U=;
 b=G28wrDzWu2NzTARFJ54PJ3XxhPcMa5sc5Ppjqr2j6H7OiEQ6JhJ7NsLaMX5AT2fjmUeLDnYUz
 kaenrXUlaSFCGevPMgLBSABMYZai/+myb/fnRfHumo/yKYXSWY6FdhW
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: DzPouVQPa44YF-3DHH4CBJvEMjZiwlnP
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a54afe6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=s9wsCz4ZXjtKvCKk99UA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX48TJE2Y8bzfr
 QAthOjM1oLWHoKnrXt79qmUhWEbbzZtcfusUt0UI3xXfV8rIxf3yqF+REqywJhTKwUZzVI33jWC
 LNS553pHkYaqIwoDmOhwuRa2FRBsLb4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX0rnaLlvmQPM2
 dvt09RCliQ2NvaVw0ZksHkKDWuJAApeXhevGSjnXEkLaOO+SILruNAVSgzCfeR56Ce9uk6kfXIQ
 uB/KdZbJ1jDud/+Fm2dUyAI8kctAjCd/d4a4c7NRjRO6hzEcdQhP1bmJSRcjiJNi8Xz1/9G2E1F
 bv+2awZwqpzdjwMu94FTlnlhpMSvDBO2qcv+xngNoYbRiEZi6XkyR5CHClWs7dnzZhhH2AMhzkx
 wpDX+fZdIjtVW42HTtjp1GUojDdjQ8l4XObTTAcm07g7M4H+tOWaedhwAUeEQTomiBBX7weBQ4L
 6mb1AyHyYQI4WpoA2b13+GhptLYYGEw8Pm7bSwDAbZzmMyOzjnifPHuGIwK/WE2bGlPPkAxhxwj
 Zf8FI8POcVQT9Vex/+kyc2DUcodF5b0KH8gisrQiYXc0iwCz/jk/oFmYpa/8i24TPOiU6gobzAi
 MpVrYcNt2pQXJociIFQ==
X-Proofpoint-GUID: DzPouVQPa44YF-3DHH4CBJvEMjZiwlnP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130098

Qualcomm Shikra SoC has one Camera Control Interface (CCI)
containing two I2C hosts.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 6335caca329808ee04d9067f1f95e8075e2fc3ed..18da1380e52acdd8813625eaceac796e342efd16 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -355,6 +355,38 @@ qup_uart0_default: qup-uart0-default-state {
 				bias-disable;
 			};
 
+			cci_i2c0_default: cci-i2c0-default-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c0_sleep: cci-i2c0-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci_i2c1_default: cci-i2c1-default-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c1_sleep: cci-i2c1-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";
@@ -702,6 +734,44 @@ port@1 {
 					reg = <1>;
 				};
 			};
+
+		};
+
+		cci: cci@5c1b000 {
+			compatible = "qcom,shikra-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x05c1b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING 0>;
+
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
+			pinctrl-1 = <&cci_i2c0_sleep &cci_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		qupv3_0: geniqup@4ac0000 {

-- 
2.34.1

