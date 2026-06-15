Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595833BBFB2
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 07:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507584; cv=none; b=JpNjCmjbmjaKB7ZiM6WJy7HjPIXqJteekZMFf0p2cxPBlQnq7i9NwbMcmeYfW1nmE1xjcmg8KLEL5A/L9HiPo4NQiglKCfQLYeGYQAToWAOBYRfsC6MjDmL6T3EUIqzw6H2FoWg/Jbkn6ExSG1eyKJxXrMpv6zCaOm6/lhm+kOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507584; c=relaxed/simple;
	bh=dD0P2j8Nr28ZbmLTZrfr3Iys+tRkC7smVwGCVx5OZpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LCWYPQjwo9SBLKPogdcYypBsEdbw+hhqkaj0wpR2iNdd9AK5oZe45Z1ORulUIDCVhP4M0t17pKyY+wLV+KdP4CrpIzQBKW2fC+efZT34jWLCDuSba635gllQRmO/ksBr9VevW7D3N91Kbnq8KeFMoO6eXPPg4yqBYNtqVQ1af/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gV3FlwnS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HeHUQs+D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gV3FlwnS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HeHUQs+D"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6KuTU3828083
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 07:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+V1+Dvn3cDeatOqG+XJiqlXl0JvB6Pajl2d8bHbdmnE=; b=gV3FlwnS+mMU1ZWv
	NefsMOoZi0YvbHjNcmXp1y00j8ErfHcA+NDQ/FbqApJ0LQpSJjVRzVh8e1HDPquL
	OZHwWJ9/E6J31dvmgifx76e2BDyOtAwm+C9AWjujwPNfpN5+bZqgGId7JDZFfQao
	VYg3bDcoktnId+//Lc6vusY6XTiIkAc/6LB+bzry3tClfHU5Rawmg99XCIDrrAP4
	Rn6Swe0so34bQzfsMMvuIQWGFi5H2ND2gkZAFmpR5aDkSetiw9lBlNf1PpcLc7oV
	a0PT1JAKz+3Rs/2lOBPmzN3XN/Pk+pAnJf7Vse+killgJ54VQpl8ikNMwtqoTVmH
	C2pTfg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7u64dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 07:13:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36b934a336eso2458040a91.2
        for <imx@lists.linux.dev>; Mon, 15 Jun 2026 00:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781507581; x=1782112381; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+V1+Dvn3cDeatOqG+XJiqlXl0JvB6Pajl2d8bHbdmnE=;
        b=HeHUQs+D4UohsgjBbSoqB0IWkGGiwh41+k6rKcnnidTg2aXjZgtPxKkL/v6dpId300
         4DPZQiRL1F643VAyZInhF1ErV8zdXCO85YWWmeFFiSi+CCH2HHK+5v2MxJsDyrIzp/U9
         b9GZpho9i2GGyTXELAJ5XwPsZueAssXjw9y3PG6W7KuGMHDd3yVCI4mWRT5EuxV/yy4c
         e4kgJkuYiEd67DC2Gh9IO81JIC50yJehiSAMIuklG4kBPETHFjcTG8RhcIr0PxdvaYuz
         9ZIYsaFgKq4EZmGJg1hGlyEGIVx562D2PyKVYlln5T/GD5mLDs2iaHL0fJgIXuJtWLy3
         zF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507581; x=1782112381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+V1+Dvn3cDeatOqG+XJiqlXl0JvB6Pajl2d8bHbdmnE=;
        b=WuD7aBOtvpDkLwvY+qxzReMu69TteA4swLvUo9Nn/rwuRlNW9LjAqlgdC9NIEJbtU1
         LY96RO3NEIK9Xh2EHv3wUsJD0SbAYTvcnCb9e9DJcqC1iJFgoLGFG6/wddX7/f8hGdV5
         7EAUwP4h1x8Vy6MErrSqPLdy0QYnziJ98N7f5n993FTz1e9eZAHDmor0T7NZDiDaQy96
         7us2rFFiIz+CAwrqPmbmY4OodDN4I2HyJ2nA6ah/ZJgcd+FKZd47uXCFuFPVlwdkQQZT
         NCCee7fSYj/iYTbdy0qge+jt9uWEBrgf+waTbnu8U69IS/Jqqd+k1FtBd42pg2x1p2TZ
         0mkw==
X-Forwarded-Encrypted: i=1; AFNElJ8qFkqGSwq92sfEfUk4lTC/LiJnxqDy+MweXoz5FKWoxHJr7oZK0kEKU/JbOSkh0RQOv10=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzq1OWogEk7Ek9qOqKU0YrENuK8kCkOMBgjDcG4EM7APputse6U
	oGGs5pk1V8veEA9UYD9arAaW9HfgedKLdQ/7lBleEmMLA7hCiBWTHLp6TRFrmNIhxUaziALjjqa
	0BtLZHTbWsBdKTZrV5sNAZZcysbxNuDZz2E9zWV89QOMI0nr20AokYcU=
X-Gm-Gg: Acq92OGa/2DpmLJSMOUBvBbAAMjhUJqwccQFOZGv/rCf9McjWcA7A/ORmuJ2zHRXsv4
	4j9trtMdprLgkUurfeeVx8GiOBi9Bx+oTOu8n/qAlDYkIdVPmi9Lcwmtam4OC93al7qo51PBufp
	4Z573TZcIRpJY3s3QImgRWjLfQsGLgTvePHTKkzwwEfTjSfPPtiAJZlYrqePqZJ3S+W62i9czBk
	nO33x/em5UulGgLyfya1KiFG8g8qgzj0MChLtlTcE4+lnrPxSAOwfgNBeK5XufIPsYaq5vgcplI
	Xzcf7HC24qOf5zXS7eAMu6x5Zq8zWjgaAh97AVw3m4xHOfm0A9VsK4A6tgV7aHy/McCxQMR+fry
	HMhQJBEkOdKMMl0HwhN1ZtiFgZqT/bojVKLde80kNyuhj8zBa92vM
X-Received: by 2002:a17:90b:3fcd:b0:36b:91a3:6af3 with SMTP id 98e67ed59e1d1-37c2bc6534fmr9768861a91.7.1781507581233;
        Mon, 15 Jun 2026 00:13:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcd:b0:36b:91a3:6af3 with SMTP id 98e67ed59e1d1-37c2bc6534fmr9768837a91.7.1781507580798;
        Mon, 15 Jun 2026 00:13:00 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2668cce5sm14867474a91.16.2026.06.15.00.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:13:00 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:42:14 +0530
Subject: [PATCH v3 3/6] arm64: dts: qcom: shikra: Add CCI definitions
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v3-3-8183481f48d0@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781507551; l=2667;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=dD0P2j8Nr28ZbmLTZrfr3Iys+tRkC7smVwGCVx5OZpM=;
 b=MiksEv4dAsytiqn9yWeQj/J3Y6aswxj9dbZTN7SqEhZdVeiE76C0aTVUL4+2Glq3iaO6ojOUy
 YlvQyqQKU1MD6aGx2ZSjsRezHKfmluPRHuZvZS53PBxBi78BTr66Oqw
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=F8BnsKhN c=1 sm=1 tr=0 ts=6a2fa5fe cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=s9wsCz4ZXjtKvCKk99UA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: surqequX391GkrCm-fkGPKOufGG-T_xr
X-Proofpoint-ORIG-GUID: surqequX391GkrCm-fkGPKOufGG-T_xr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfX9LwgZXwejNox
 6EqtURB1Uon9ks//DBAgRXGv9x78Khpi/1t3Dg7Dg4AkKTXL5Aa2Nc077QtyFzUINiSZOONRiPB
 tbxrRcvNCe1Y0IwPyU7kzhdLKBDQMcLtyDoceEdbZvLKYqpHIdNQzD/4fu/4ixdce7Wr1zxqufw
 77XnQm/nUuBp3rPWTOT52RycPRYd8pmMKAawB7qills4NUzaL+9+woKxuvVBcoUKaznsN6d3A3g
 Q2qVEDtidF44f1MITCAnytfyDnCQT77UV22/XGqNsvTQTDTvuz/dJvuM2fcvzklxK1zPXFUiOUe
 vRHi4xO6ow7DZ+QXqYk21y99hLjZq4pewi0TBWnQVoi4lpLQKnq7/eNMZv+uvPGa6G54ehRQO6C
 kNEf/vOW1cUrxlz6KXixdaSDadE5TiiV2RukS0PjbRX2mrTtmKQI2LHfGhbs+wuZ+zktWASOwt4
 urUfQ6qA0Q2/jEF53CQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfX6HEgZmqClxk6
 IbxrNWv0dK78dxt3CakDdOoKjF3+pNpPnFeqzZ8mva5xC57LbK9xIwk15QdcIH78CFnYIh/0Ct/
 mppY8ZN+MGsT8u1VVqjgJ6tQkjnT3V0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150073

Qualcomm Shikra SoC has one Camera Control Interface (CCI)
containing two I2C hosts.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index f0e827996609dab2c09834857a1bffd9560155a6..57732804a6c6a114a407a4a541a1cc7af7635ea2 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -348,6 +348,38 @@ tlmm: pinctrl@500000 {
 			gpio-ranges = <&tlmm 0 0 165>;
 			wakeup-parent = <&mpm>;
 
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
 			qup_uart0_default: qup-uart0-default-state {
 				pins = "gpio0", "gpio1";
 				function = "qup0_se0";
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

