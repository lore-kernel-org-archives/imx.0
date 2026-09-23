Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ED83D9699
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 04:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790139492; cv=none; b=kbsQzMOB1hZhCUrgwxewhAg6xUsVXYDgUr5/FD5CXT2ysh0yh56E4PePCsdwRzFb9DmpOpo8D5zNav84hH+t1SZufwpseme8l10qYpcpMR06NqPOrC1aZldaHq40GoB8Wwsguxh2z2io45UL8lqTcbuGv60MF60VxYv+yI3cP8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790139492; c=relaxed/simple;
	bh=9xs6L5gfHSY6RV096mPtEk3wrh94zC1XZp1H1XF/ohU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nVdYXNlB7GbncxkABx1YZHoQ8wuWKrh+pslXShp+aQkE7VJJ5ecN7nL0HeiaENl+YueipNvIz+gonyu2m7fYFuW0Q3jkoweq4HbyoMr3/H8tTiN2u5VDXeg0OwL0zDCGWfyMRMyWLr827i6gF+a+7mihjF+t9Cau2nZr3GqnEBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kkixp3dd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfwo2apS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kkixp3dd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfwo2apS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3qxtP2389916
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 04:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZwzH/kmKq82Si6b4z1xfCq5OCxq2lvwBX5Dwr7r3gc=; b=Kkixp3ddWNnEuA5W
	Lc5FOZx7+iY4PnBXqXwxiImtPgsNhU60R51BS+NlqmkBZe++zOttyfqQcQ/42qaW
	GMJRbd9rMaT+z89S5K1mWETmtULKYe1fEJZWi/eSaP1YUrZbunI1BZkg50eTkKtS
	VLrDoYiHzQoO5KtzAylQvqlDPV39v9pbb9Jm1hnGFFpq10sZnaCzY0OsK0GJG+3j
	RJPjeC6m51N0ozLQ7xfc7JeZLrI9T7KO6k16pkQTV8M7sS8KQuQNUuKJAIU+DPIF
	Zkgg2bKfVZZ3fITa1bsVDnBjuCQ+3W3Z1Y8wOZAcnMz9zu/SQYDm14QIerQgOgiQ
	WgNtNQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n06g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 04:58:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3284bbaa89dso1976871eec.0
        for <imx@lists.linux.dev>; Tue, 22 Sep 2026 21:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790139479; x=1790744279; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZwzH/kmKq82Si6b4z1xfCq5OCxq2lvwBX5Dwr7r3gc=;
        b=dfwo2apSSEs55iBdTI6S/g14HlEGv4aIBnDiHTr2OciznyOJu1UcfOh//+ZwE2VIyy
         EPCpOeLF8Mg19gwiy7xDpuCGo2H5fu4DG82lmH3SWEsUYw1cVkvKgbh1hFRBNJ4kV8cp
         M1Ou0P86gcc1HXe9BUuhx+9EfFMKUaNb8YFDXUN8vOJU3Aa1Yz5U4lE3bwZyZY3tlucU
         VpEX7ustJj7J+l8JMdItEqjMZBMrt+0v/5ADtRPbcmmZEiW+yY/swVybPoD0abjQWyc4
         fWr/gsEJPcpVyFWLvZ9/s4G0Q4zebMaWbbRtVBUVuNoUI0cuxWBse8SzIbQslhUTTyOo
         NBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139479; x=1790744279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZwzH/kmKq82Si6b4z1xfCq5OCxq2lvwBX5Dwr7r3gc=;
        b=Kh0UPG+PvZ9pt2HX6FRhQfW6bBbzwPjDQoB4GAJkWoAPrrOrLFXkP/w3qo/FVfZR8c
         t/sOd9oD4G1T3LLwBiH6BeVrnkGz7BIGe1+Ree1wsllSJPQEXL85HfmDC0C4QUdgKmlK
         FRGDfhlCtw3aQeHbBkY0XtpY9GR75EY8VOJzvS9gQHZxxtRTh5t0kybtVvGzaKBPiy5N
         vn9kdpfIa8TpnPmLk7nXebK4/jnRh4+neOivGR16T7UKlnPkvQVNHSZbOFky94QQgPJ1
         0Hf53GMc+jlrCIet/GqxfNZmeN9aD7tvDq3BlsovkbimjhgF2MS6FiJMT4HiOAsbMuFe
         7zyQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9b4MSYtPCjxTfLIIIuLcZeQZFJGTr3lyr8TOXymJ3NZb8/kQif+IhNqYxQxUn+hhFflc=@lists.linux.dev
X-Gm-Message-State: AFuF++lVhFR26SUK7LrPtgR7t4eeAFeJR767VMG281s1pe3VzWXzMAQV
	GCVHpG3AqjyNTYPQ1IJSFx9BTj5zAOkCUEbP34n3e6DIPhumfOyOFzIBu3TcuxQPLizoiLRxLy5
	pbVg+WhVnhUlouox3790bgDzzVE+FqTksIYUFMOGEJR7fPVkCPvQO/uI=
X-Gm-Gg: AYBFou36LnXF3c3GBsArppxjzzWrHPo2VzR6zY5lD9UfyZeX2j/AcJ1eJ5JzhOJMxDN
	wAZGEB3UUWsNeurP/QVsULuhUlEdJ9nKNKNd7sa/X9c1XEyUG9aejkVInRRT8e13XKR38jAZ4ox
	IafS6Y+wvLnASCesvNYrJazt4MlufBzfcrKqRMNH4DucVGGnD7EngId7RkzXtvvPm4KIpKF3XOm
	msc0e4z8W8EsoLE9OX3oltvOt5kbhS1XN5XVAm6jSejGytSVKxBIB8XBrAo95x5bEJKpbQAeol+
	ebiyJVXKcMxB75SBdvBF1G/09V8rm/dbHk0eo3ndo1e4o3FiolTTwy4HLnLOliJhoq7lOWk95HC
	2DCUJ4c/vb1euAW9JNOZD6tUtQpXmYMOoZju6jSoz
X-Received: by 2002:a05:7300:e9dc:10b0:33c:fd92:a7c0 with SMTP id 5a478bee46e88-33e8e3b02f1mr1606971eec.39.1790139479294;
        Tue, 22 Sep 2026 21:57:59 -0700 (PDT)
X-Received: by 2002:a05:7300:e9dc:10b0:33c:fd92:a7c0 with SMTP id 5a478bee46e88-33e8e3b02f1mr1606927eec.39.1790139478690;
        Tue, 22 Sep 2026 21:57:58 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm3168907eec.26.2026.09.22.21.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:57:58 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:27:29 +0530
Subject: [PATCH v9 2/5] arm64: dts: qcom: shikra: Add CCI definitions for
 Shikra
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-shikra-camss-review-v9-2-09f5fbea1309@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790139451; l=2875;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=9xs6L5gfHSY6RV096mPtEk3wrh94zC1XZp1H1XF/ohU=;
 b=smun2pIGogLH/CJD0TSq3e3BYkkj5MIp1ViERJnL9Tmq5aniQKV6AO1lx9QdXs5lfGep6ktpl
 C8uYzB6x3vKC5/RhqrG8XKAK9a24+7/QU4HP5EefYVHW/PlfOPs650h
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX+hs9t1hRlYp9
 XpJTatKr9vSmmWHorRX7hOWxgr8ZHMakLc8VyMujsNXe6tAAQm31UWBSCwj6NbU0V2aIfhSSrZq
 vsGdIqCFooH4N0jIsaLNQNsVTgFqlzE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX762Lguky/7MI
 AK+pmUz+4EOlaKQ0Tb1VrgiTcUIC5qN7Nc7nNa+11RvjDfxEzXteezZsWrJ4/KkaUXmHYvZEU+m
 dk9CnXazLv4q+hDCX8/wsC+2McWQrYDsL48Q4sAeLgfHs8HXK89yrzjErS2EAKVnS58fvDkTOqt
 y5JugXwHs6TXlcBmHS6SLbfj9rmHcW8GY5wGUGEHmy8D5lzLKzs9ULDCrW8A/GKXD7kK8iRGHYN
 SnEFMp0cSvKb3Cr3b6M3EgthiQ54GiW5Wcsvl7YiF9CYGxn/4M3E6rW+VJp4fSEwJOuv3jb103p
 qzVMjdOHectRozty/XfvTf0hvu/D5eXy0WGd760sBPpq7Mv2t8UaMyRVTMr21VujaZa4wN5ydJI
 1FeszSVKI+MqxNgQ5XeZI7y4j2jk194JMozYNiSagce3Eqmffh9S4K4/aa84kIDqCdhtATcsJT3
 foCVrgB3jfg30T/zyzQ==
X-Proofpoint-ORIG-GUID: R0zG77Q2UQ-I_-48lISkeXEypmPmMhGW
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab35c58 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZbC1Des45MQyGPwI-hwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: R0zG77Q2UQ-I_-48lISkeXEypmPmMhGW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230019

Qualcomm Shikra SoC has one Camera Control Interface (CCI)
containing two I2C hosts.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 469023a22818962abb394f3ac02752f816efc839..ed73603c3dd81d92d84c91b57e33154a6fe5b470 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -892,6 +892,38 @@ qup_uart9_default: qup-uart9-default-state {
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
@@ -2077,6 +2109,43 @@ camss_csiphy1_port: port@1 {
 			};
 		};
 
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
+		};
+
 		remoteproc_mpss: remoteproc@6080000 {
 			compatible = "qcom,shikra-mpss-pas";
 			reg = <0x0 0x06080000 0x0 0x100>;

-- 
2.34.1

