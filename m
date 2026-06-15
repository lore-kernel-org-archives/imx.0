Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5373D091A
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 08:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512478; cv=none; b=Jp0M4uHtT0qKS3uPqn20k4A0D4IS/CFXLxgOD5BvG8cLW+jRTzPLMu5isCWxyOrPsAWvDwMx+gK4caFxZuw0RaRYUSV8cit0vGlpieV4AOhK0OTI2OlMApPjQMYLRVrgtTqsj0yxTlsS0p6C31QQV/40jCAiDPGMa0DOX0CY9tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512478; c=relaxed/simple;
	bh=dD0P2j8Nr28ZbmLTZrfr3Iys+tRkC7smVwGCVx5OZpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r3xRxzj53U2EZgyxqUGoGEuW1Zsd+N1kJifztaQaKBvkgSKCbeggbv3T3vXTvafK9HeDhxaNeQZ8ciCsrLBS1myq2e9lMXTUEbxV6g+9uyMcQRDeDN3FCrWLACfwdZDLsJiGRJjGSAkUMvm9Ob8BbsNtzgEY+QHto0mLHec/L3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lv4pIcee; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PX4D5G2V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lv4pIcee";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PX4D5G2V"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F7Twei4091260
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 08:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+V1+Dvn3cDeatOqG+XJiqlXl0JvB6Pajl2d8bHbdmnE=; b=lv4pIceeNxd5cu48
	UH8gJsf0WLoHM/FTmuj3jRY6xgDwa5DBOTmyukYf3a+eEBOMxwOePZsLFP/suSht
	jSSbgUKDZ8W77L3wahFrUb5CN0bJ/Ws4+cu8CIvvbJTwrIMqn2AOn42x/AEm5+Xr
	RcQmsxVHUy3iI87JvBlCvksPeJBFrcnnEwLpYmRFF+tE+2dJVuf2RyPu/18GjuFS
	XYJpkvcQW8Kv6Jq6dagOiPxAGBMw2gHLNtIhuHG65YfLoR9rCkKzIFvyc3DdprW9
	peGfGV45/U9qJM0oOIABgggJ2lhhBlYaXkRSPwVOaSSRS6onX4YZxeJyclubHUlZ
	TTZCNA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etd2c87xp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 08:34:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c10cd7df22so49060405ad.2
        for <imx@lists.linux.dev>; Mon, 15 Jun 2026 01:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512470; x=1782117270; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+V1+Dvn3cDeatOqG+XJiqlXl0JvB6Pajl2d8bHbdmnE=;
        b=PX4D5G2VxzdFggwQPcGpw76bQotKUqyISgsKQATtrIiAOmIZK5GomClwveloQ+DJ9b
         I9xbSoHFucdxQPbc47HThwYMN/BkDyoaEeTL4xyQ9fNl/PxZj6nhMrIxAXyU0g/Psoub
         ZOrQ0ncBbw1qlb4/7EKQNyVkeeAphq/3ArhAP1ECIq0pN21PAag1SIE8Y82cNc2RKuTc
         nf3lAN88qQJu8IWoM4mDJX6SE2EcnlmMz1VHlfdNqz9SWlieIif9TmOgIKzmv5uxHSci
         BM4ZxZ5Y6kLuW/j6Rj7ZMz2ravAtusGJk1Omn4cwvBfHbw3oCUq7vmt1P366RfOO4MLi
         /QWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512470; x=1782117270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+V1+Dvn3cDeatOqG+XJiqlXl0JvB6Pajl2d8bHbdmnE=;
        b=f6vZKTjzMP8yCITMf0Tox8ppPP7udR1xYMMzsUWm9KRk2eDeaxQGAorfkuF54ylpgh
         wCYFnVo0tkkHa1hXWYelaWkNGRb8p46vxIq5wmfdFaPdgF36DRxB/6zGTMaVfZEfPWfd
         sCwBb7UnxG8xsrHaiV+oTuRS9YbQCqWwQvjP/dLJzEoBz2C1MstxSa/0vsD6fxouCcey
         jXJekTEB2BKpQVB4AxWTQu3+ZM8iF6DCEvAe5uDitscpgFuozKyeZgbtA71DFyw4yGzH
         lTVj61HYkTFofYJ2kRtjx3So+9Jp8n5krMJLFH6J0YjIIugzde+gyEqyCtre1m0HCSiY
         kZvA==
X-Forwarded-Encrypted: i=1; AFNElJ/U+/bnsqVdG2F5scJN7na3Rb6gnim1H42Vx5bven2RQBk4pj+WOuIJFQr8nZ0LirC+NIU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlCtTYnWaHKh9zg1RAyv7lTKyGy6LdRiXaAWZFxn3ERcgqQzjd
	O/PddJhXAbwq8OK8Ftbq7gr6Oz8UD0u/Rv0xcGrgvqvRBBNe7n9+kpvwf2vfBX8wdWcQi86hiez
	c9HC/BSnaaNNHlbIXTDmBqB9m1mi6W7eZ/BzFeoEgpg6D1bgUc45TYfA=
X-Gm-Gg: Acq92OEQqYFBN4KbrdjhDaOSQmHrQHp/fpFCKxfUgtjsDkn+guIc+EI9giV7UP/V95o
	JVb8s7UYSNVuoKeIHNwD4CgV00rNEtiVQvFUa44hW4HscFl8tfcz9IgbpIZns7OrDd+SjhIY+7U
	Sl1r6SoWO2JYDqxesc2n7ksEtGbHfc/Zu3mcNdOyPdJ7GaQfm8ZbgRefdSqmWluY4HaTJg9yCem
	8t4u6FKS7xovAk+JnSoBvOGu+0Y/EoLsNyqV3TKOIxVSJh5Af5k/Oa8nnKLxqIXW/X0rggYOc1a
	ePvMeg0ZOBa0ZKKNoSHmwugDCCDV7nptDI/zZph9zU8EDsHJnMRy6/z2kYGN7bOEYZ4ysu91H2R
	AzYbqAFz/zcxO+BjbFA40gUvRYIArdyg4cmPA9pKH6EyhBQyLfDYG
X-Received: by 2002:a17:902:cf0b:b0:2c0:c262:b917 with SMTP id d9443c01a7336-2c4109ed1b4mr154920915ad.5.1781512469867;
        Mon, 15 Jun 2026 01:34:29 -0700 (PDT)
X-Received: by 2002:a17:902:cf0b:b0:2c0:c262:b917 with SMTP id d9443c01a7336-2c4109ed1b4mr154920495ad.5.1781512469458;
        Mon, 15 Jun 2026 01:34:29 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c70easm122789235ad.25.2026.06.15.01.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:34:29 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:03:56 +0530
Subject: [PATCH v4 3/6] arm64: dts: qcom: shikra: Add CCI definitions
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v4-3-bcb51081735b@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512439; l=2667;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=dD0P2j8Nr28ZbmLTZrfr3Iys+tRkC7smVwGCVx5OZpM=;
 b=Cniw94I/IeuLlJ+GNuZeIQ0xTcT3NSx88I3wNJU/KukWnT79nHfA3XKcm0P6UDN9oZD8m0CuH
 UxBW8/qf050ANTXNPa8VDLV6JEP4odbMobSTjgfvNB8SJRoaZWqpIQ2
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX5zpwsi9ECx+0
 HN2y6rUmZOevsZ1SO8TP/CZAui3xqFInwBgH/W3oICXZOyTy+cNXFXymA1ii4Tk46ftqaJ7/JAp
 yHcb96J3pQT50yDKnBceTyRibpSiAubCA0ICvpYEurvbZvETbTY5vkL2t1wILIjTIkt+YDk0O0w
 ssZm86il9D3BoUkeg0auOvw+kLGZrDhWxVJlDKSf2YsbElitvfaZOPG9yVsaXfU5uUfUpPewguO
 bZ7/GPBjTAPnuvh6TkknR0+aVB/lCodh++5HxG2LuEtiBcHNEZ4xtAm3Zvo35DEx7s/EY5+49AX
 JSevru32+Q/6rcPKPkHi6IvpPXXfpBjNniDvV07GCDf43WrYIqezA+3vZmf9Nc1YI7ELleHCN/O
 TEnBWLVmMVRg2mkvaCQ4ne+tC7V9QeFlhQ35CxoJSf9N92zJE0vnUU/fw5v45X93u9BRMmJY12H
 gVU1eg+Jq5fh2oyNKbg==
X-Proofpoint-ORIG-GUID: 1TV9nJhYB0sMXlARZwEjC3KY5ccb5SuO
X-Proofpoint-GUID: 1TV9nJhYB0sMXlARZwEjC3KY5ccb5SuO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX0S59Vo/F6Id0
 iYkuyKcAQKQHK2IKBk7yO7sWWYB3gT5ndYOzC3ykboeVkVIzdz2Qi8Qqszt6e/odawDRz94Fzv2
 nWTRsxqPifZVIuQCcsPPhjznIpOfSws=
X-Authority-Analysis: v=2.4 cv=MsRiLWae c=1 sm=1 tr=0 ts=6a2fb916 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=s9wsCz4ZXjtKvCKk99UA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089

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

