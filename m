Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0B842A175
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 09:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330484; cv=none; b=NaCGLED58LeH4CLK436eAu01Ile2PgzU5KjsDLispmpjEHILuoc//gB90G0eBfdA4cVmN3ioWqM5IUxKcOkLi1a+hc7MouETi9wFj8HDejNisnpIEmYPTYzXjMojnZeozewXbRO7EtCU9I+6TUHLI387/YCbUdVrtOIv4cRWs9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330484; c=relaxed/simple;
	bh=8ldjZYhiyjIxVqUiT/sk5QZhXtZUNYS84Tk89mTd/rY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TuxDANEDa20VL5QCraPg1b7vNnDChuqHT3y3TyENtqYqgNsk8NimkJGWNbiD4OAzcq2u3vvTGxzJ0kdVsLV1RE+zJNwg8WA6Vj06V3Fp11C5BTqJjycGadZ10ohO7iBsAfbGzU6eP6aGTtIjkHS7yd7eGaQ8FJo/SDBAIaSiNW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQjF7seh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DkwOA0oE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SQjF7seh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DkwOA0oE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669QM1k184653
	for <imx@lists.linux.dev>; Mon, 6 Jul 2026 09:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=toWVgRfv39MfHURGB0PvHVquKSWmJfATW1p
	vU8rwSgI=; b=SQjF7seh1mCaW8jZ6zWP5rNM9KwrhSzlGjL6+1U8jyZa6jR8CF1
	TwGbEzHkpyvbcyQ6s9Ll4kWmziEjVuaBIHvvUFo4z2WK/z9AKhegkErxN7MxS3ac
	4Py4yKLwHV+n8y7f53a4pRZvMLMHc4okAVjRSQLcCY/kpJ/K4oO0hx2mQhf7fZis
	bImtw91qjOCAj+ava6vU1v4pQb1t5fZ2WCVWjnQ2b4hBYGS9WaEcn89ZqvdPQrDK
	ZMtqgxvLSn+xyijWmrfW5vNXQkn9sa4WNy7nOmVCKm7/oFE4vvgo8HdPhXwW20cK
	gs+bWAUt8OE14Z77IElLDqUaI5q8BkR3ZZw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpg139-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 06 Jul 2026 09:34:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ec3314f65fso29395956d6.3
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 02:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330477; x=1783935277; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=toWVgRfv39MfHURGB0PvHVquKSWmJfATW1pvU8rwSgI=;
        b=DkwOA0oEboQPnCraPhjs9lqO3w+43uGy9KaIKlKMVMYIok+YU+/BEoQHd36DqXOK4r
         ll482vyBvYvP3Z+3JDf9Vfe0Nk6bfKMZcELKOmEzMoTR8GhzJKAJWpw5dN/I43YDsPEw
         edOJ1TDLgoEiZJgneumO7xqYdiuvcBy4lIiFMeif/tOcFVzPUfzWuTgsMBFiw87OBVSd
         MY5JnDQCx3EU+axKD7vfAuIcbiMLIuqGZXMnzo2y/q4HiApvhxI5giPJzdEm9Xlckhw1
         n6zqv4ML4Syej1NxBWAUoPfUq9lnkKiKGuuCurfCa9SA/+Pd0+Jjno3vkrs2agKHOGgr
         P3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330477; x=1783935277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=toWVgRfv39MfHURGB0PvHVquKSWmJfATW1pvU8rwSgI=;
        b=BTWCF2JKd3sLeY6u5K0d+F1D7VsZrhNcAFgc8v/tMkO60OdeHVhUPjvBEQu8233hMM
         t7mvmlY/qrxRgJIBG87z1ugjzexePNTmzOzfjpZBe6qIJcJUNs7llXgpXARkPlTxUO2c
         HQYxKeVgWsYBfvadd6JzVU0rdsFyUKgrA2WYirxQMhG80phVLM9jwoCLzz1GBtuv6TlT
         fxffs5Ff+A8rz59MtptH312l038r9W+ewSGpdqMNub0ail2GU9twVv7TavVOsBsdrl8A
         ZHrOSi0XvLtTHg2LCeEvMGNXX/sTFYbcOpBf7e0k4sFwtT1APQT/rl2M79H/WlrXvBYs
         jwLA==
X-Forwarded-Encrypted: i=1; AHgh+RoZjjqFae3zRRc9sQ67VWk+vHAWbt2ZA2ksgOzimXzpDankh6e693ohWiDSDRIRUipHLLQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhqkWZd6Wd/FekAkWhONYewzVTlIXCCTZQV+XAJXUDBoaQShAk
	5TBWI9TKbJArtZgYe2S+4ohqLIkhjaFZg74fZ3/6wMQxjORZuba4fwXe6DFVnAF2z1bBtFMDJDJ
	fqjLBaZ4AcGp/5B9F1E/pJvzhyqle9A2NO41gMcm+3m+b9sBYAJgoqIc=
X-Gm-Gg: AfdE7cnHgaDcUPNxce3CXA/OgpmirXvL3qWu/nPaXp635djZEI4n0JITxQnI5kaTSsS
	jeqEVmwGBtLQsqAc9+KenUWnAK15Q7PcblKSrah6IDYkX0Hm82aiXXuvDiwIaMXmJ5eogDz7AmE
	97J2kOaWQy7dx2rfAFn5MjMB6Rs/1mg9SWUpcd5AQ74gb6wNUgSKmJOgCrwDxMCqC9vLTyGETQt
	XtsxOKTtsC0FT6KzrEHLS0QCAKqy57Pe84jmHaQALPANatVBbllSMfkULV97oEdOU55iVZ084z8
	TdCDv5RJWp3JTusMt+iL41yf+t0W+dHCWMPJmsySmQVbq7hqUPT6IOOBaof61whhupMejtYdU8p
	ClMzlSc7ZJxTG69CtFISZqZ9BJEQ=
X-Received: by 2002:a05:620a:472c:b0:92e:6a8d:38b7 with SMTP id af79cd13be357-92e9a35bbbcmr1302176585a.11.1783330476898;
        Mon, 06 Jul 2026 02:34:36 -0700 (PDT)
X-Received: by 2002:a05:620a:472c:b0:92e:6a8d:38b7 with SMTP id af79cd13be357-92e9a35bbbcmr1302172185a.11.1783330476287;
        Mon, 06 Jul 2026 02:34:36 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d7801sm23938339f8f.16.2026.07.06.02.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Chester Lin <chester62515@gmail.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
        NXP S32 Linux Team <s32@nxp.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: imx8: Correct indentation and whitespace
Date: Mon,  6 Jul 2026 11:34:31 +0200
Message-ID: <20260706093430.273703-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=24488; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=8ldjZYhiyjIxVqUiT/sk5QZhXtZUNYS84Tk89mTd/rY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3am8G2+QzrI13SWg4oOXT0swLQIHDRWQ+H02
 +fdey8oeQ2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt2pgAKCRDBN2bmhouD
 1848D/wN1b3sw9oj6C6cHLvPelvmrjJLFnVf92nxBCDRc/+eAcbh0HfhkQmOs4doPhWvI2j5SUU
 nuAkXMPBAOfRvDoQN7qfzxqgBHrPu27wtWnqw215HgI8ZLHdnQX2QmACWuAudeLBgj4P142Zvj+
 V1gVTTLRHxU474G9Nvvc5g6qIfMAoQLjsAytQ8QdViHIka90Z6/7cEibSgGE55Tcs3dtvatyOLM
 voWJke0jsbUcKolmGR8xLuXsDv5NrjE0mdd7Ch+a7L/NZFJV4IsHhaQsUMFmoy6xaH55TzCFUe7
 DvgMzf3WPYcSHy27sT2ixdMDxaoIBTrJ0mad1xJeICkyc0xyfG9WfLLZqMHMCUoLJKzy1MTrsoQ
 a3SCdJWX3e6NBdm62b2VHw59m+8jyvbrVZoKdjrgQ9mlTDs/9o5fMJlnhb+o18oFB+ClZivSbOy
 wm2l78srDahkVPauNMcObsDvFbDTXhCpNJZZM6KmBOmLNGQlQZBT+YgUJpi0OERffkbaUBOP5LR
 /OSOWpgbXR9z3eLdhAOqpViLFzr+xKypRhZJX/rdBVmQB9iGGvA+xantLIG+PpImw6E41vJcKhD
 zDSeMEe3p5gNXjbd/FWspse8wYwhV7KiMwstwDfkZtiObsi1UaJH/BuBV1egY5lNWn9pjP0OhY/ LY/N82Vl4hh3aUA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4b76ad cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=4cpoy4PqZ62PgoR6tdkA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: XSD1sfBx0wxUuYaATi4hNWTStGbsfxzK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX86Q+v2Lj24rV
 TUApALPga7F1zYuBFiEsDiBSk4SYjlFD56QLEetwrTf34dDD7DkLV0U7k8EzdeFw0hWQEUEuWjn
 AtSHZWExixLPnugYlha5XPqUHcOJrUfhF2vcg5lcFWyN80MfjQgPb8Bll7KrvdqXR12qzfjTvkr
 RiJL+xT2RaeZqBKh0slyQkqKTWQt7ufM9otCNzIg3Rb6KupRainhEIxvhoqptHjZXfrjA+WOif4
 ugLbbS85xlCEgKtlECI+s9WjO6o920efFuLqkaoUdme2FjR6y/YuEogLyoTJhnaczUyL1f/cy1m
 to1cAHwU0oAWp0SjKeahXSwh9dmh+R+B6E1ArVLB2zSiNSEtRiImz83IkYsRnFPN6b76FO3qgUz
 gHWHZmGznFjxdrQfarswqMV4Ynj5GLXA0Xgx04zzr48PXuZeWGjLrtMZnl/9mxOySMIOA5Z4nM4
 CT3Zs5ON87Pj0uggEOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX0wx/TmHjdfCJ
 S6ZdO3rKbjm/zhA46704jzXY0T8HUtmMS7Lo8oMmcr4HMdKqyKII2So/u9KYT2n0mxeXxeUO+Yl
 HSrrtxLTZPgu97sdRHL0F1IZ2pGTz34=
X-Proofpoint-GUID: XSD1sfBx0wxUuYaATi4hNWTStGbsfxzK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060096

Correct spaces or mix of tabs+spaces into proper tab-indented lines and
remove other whitespace violations.  No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../boot/dts/freescale/imx8-apalis-v1.1.dtsi  |   2 +-
 .../dts/freescale/imx8mm-emtop-baseboard.dts  | 301 +++++++++---------
 .../dts/freescale/imx8mp-evk-flexcan2.dtso    |   4 +-
 .../freescale/imx8mp-nitrogen-smarc-som.dtsi  |  82 ++---
 .../dts/freescale/imx8mq-librem5-devkit.dts   |   4 +-
 5 files changed, 196 insertions(+), 197 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index 6fc82b5eb58c..681f24810d52 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -423,7 +423,7 @@ usb-hub@8 {
 		refclk-frequency = <25000000>;
 		reset-gpios = <&lsio_gpio1 2 GPIO_ACTIVE_LOW>;
 	};
-	
+
 	/* On Module Audio Codec */
 	sgtl5000: audio-codec@a {
 		compatible = "fsl,sgtl5000";
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts b/arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts
index 87fe3ebedb8d..b031a9308dda 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts
@@ -35,9 +35,9 @@ leds {
 		pinctrl-0 = <&pinctrl_gpio_led>;
 
 		led-1 {
-		        label = "buzzer";
-		        gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
-		        default-state = "off";
+			label = "buzzer";
+			gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
 		};
 	};
 
@@ -49,11 +49,11 @@ osc_can: clock-osc-can {
 	};
 
 	reg_audio: regulator-audio {
-	        compatible = "regulator-fixed";
-	        regulator-name = "wm8904_supply";
-	        regulator-min-microvolt = <1800000>;
-	        regulator-max-microvolt = <1800000>;
-	        regulator-always-on;
+		compatible = "regulator-fixed";
+		regulator-name = "wm8904_supply";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
 	};
 
 	reg_wifi_vmmc: regulator-wifi-vmmc {
@@ -68,13 +68,13 @@ reg_wifi_vmmc: regulator-wifi-vmmc {
 	};
 
 	sound-wm8904 {
-	        compatible = "simple-audio-card";
-	        simple-audio-card,bitclock-master = <&dailink_master>;
-	        simple-audio-card,format = "i2s";
-	        simple-audio-card,frame-master = <&dailink_master>;
-	        simple-audio-card,name = "wm8904-audio";
-	        simple-audio-card,mclk-fs = <256>;
-	        simple-audio-card,routing =
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&dailink_master>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&dailink_master>;
+		simple-audio-card,name = "wm8904-audio";
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,routing =
 			"Headphone Jack", "HPOUTL",
 			"Headphone Jack", "HPOUTR",
 			"IN2L", "Line In Jack",
@@ -82,45 +82,44 @@ sound-wm8904 {
 			"Headphone Jack", "MICBIAS",
 			"IN1L", "Headphone Jack";
 
-	        simple-audio-card,widgets =
-	                "Microphone","Headphone Jack",
-	                "Headphone", "Headphone Jack",
-	                "Line", "Line In Jack";
+		simple-audio-card,widgets = "Microphone","Headphone Jack",
+					    "Headphone", "Headphone Jack",
+					    "Line", "Line In Jack";
 
-	        dailink_master: simple-audio-card,codec {
-	                sound-dai = <&wm8904>;
-	        };
+		dailink_master: simple-audio-card,codec {
+			sound-dai = <&wm8904>;
+		};
 
-	        simple-audio-card,cpu {
-	                sound-dai = <&sai3>;
-	        };
+		simple-audio-card,cpu {
+			sound-dai = <&sai3>;
+		};
 	};
 
 	sound-spdif {
-	        compatible = "fsl,imx-audio-spdif";
-	        model = "imx-spdif";
-	        spdif-controller = <&spdif1>;
-	        spdif-out;
-	        spdif-in;
+		compatible = "fsl,imx-audio-spdif";
+		model = "imx-spdif";
+		spdif-controller = <&spdif1>;
+		spdif-out;
+		spdif-in;
 	};
 };
 
 /* CAN BUS */
 &ecspi2 {
-        pinctrl-names = "default";
-        pinctrl-0 = <&pinctrl_ecspi2>;
-        status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi2>;
+	status = "okay";
 
-        can: can@0 {
-                compatible = "microchip,mcp2515";
-                reg = <0>;
-                pinctrl-names = "default";
-                pinctrl-0 = <&pinctrl_canbus>;
-                clocks = <&osc_can>;
-                interrupt-parent = <&gpio1>;
-                interrupts = <14 IRQ_TYPE_LEVEL_HIGH>;
-                spi-max-frequency = <10000000>;
-        };
+	can: can@0 {
+		compatible = "microchip,mcp2515";
+		reg = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_canbus>;
+		clocks = <&osc_can>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <14 IRQ_TYPE_LEVEL_HIGH>;
+		spi-max-frequency = <10000000>;
+	};
 };
 
 &fec1 {
@@ -177,29 +176,29 @@ rtc@32 {
 
 /* AUDIO */
 &sai3 {
-        pinctrl-names = "default";
-        pinctrl-0 = <&pinctrl_sai3>;
-        assigned-clocks = <&clk IMX8MM_CLK_SAI3>;
-        assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
-        assigned-clock-rates = <24576000>;
-        status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai3>;
+	assigned-clocks = <&clk IMX8MM_CLK_SAI3>;
+	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <24576000>;
+	status = "okay";
 };
 
 &spdif1 {
-        pinctrl-names = "default";
-        pinctrl-0 = <&pinctrl_spdif1>;
-        assigned-clocks = <&clk IMX8MM_CLK_SPDIF1>;
-        assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
-        assigned-clock-rates = <24576000>;
-        clocks = <&clk IMX8MM_CLK_AUDIO_AHB>, <&clk IMX8MM_CLK_24M>,
-                <&clk IMX8MM_CLK_SPDIF1>, <&clk IMX8MM_CLK_DUMMY>,
-                <&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_CLK_DUMMY>,
-                <&clk IMX8MM_CLK_AUDIO_AHB>, <&clk IMX8MM_CLK_DUMMY>,
-                <&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_CLK_DUMMY>,
-                <&clk IMX8MM_AUDIO_PLL1_OUT>, <&clk IMX8MM_AUDIO_PLL2_OUT>;
-        clock-names = "core", "rxtx0", "rxtx1", "rxtx2", "rxtx3",
-                "rxtx4", "rxtx5", "rxtx6", "rxtx7", "spba", "pll8k", "pll11k";
-        status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spdif1>;
+	assigned-clocks = <&clk IMX8MM_CLK_SPDIF1>;
+	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <24576000>;
+	clocks = <&clk IMX8MM_CLK_AUDIO_AHB>, <&clk IMX8MM_CLK_24M>,
+		<&clk IMX8MM_CLK_SPDIF1>, <&clk IMX8MM_CLK_DUMMY>,
+		<&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_CLK_DUMMY>,
+		<&clk IMX8MM_CLK_AUDIO_AHB>, <&clk IMX8MM_CLK_DUMMY>,
+		<&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_CLK_DUMMY>,
+		<&clk IMX8MM_AUDIO_PLL1_OUT>, <&clk IMX8MM_AUDIO_PLL2_OUT>;
+	clock-names = "core", "rxtx0", "rxtx1", "rxtx2", "rxtx3",
+		"rxtx4", "rxtx5", "rxtx6", "rxtx7", "spba", "pll8k", "pll11k";
+	status = "okay";
 };
 
 /* USBOTG */
@@ -216,8 +215,8 @@ usb_hs_ep: endpoint {
 };
 
 &usbotg2 {
-        dr_mode = "host";
-        status = "okay";
+	dr_mode = "host";
+	status = "okay";
 };
 
 /* Wifi */
@@ -246,26 +245,26 @@ wifi: wifi@1 {
 
 /* SD-card */
 &usdhc2 {
-        pinctrl-names = "default";
-        pinctrl-0 = <&pinctrl_usdhc2>;
-        pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
-        pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
-        cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
-        bus-width = <4>;
-        status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
+	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	bus-width = <4>;
+	status = "okay";
 };
 
 &iomuxc {
 
 	pinctrl_canbus: canbusgrp {
-	        fsl,pins = <
-		        MX8MM_IOMUXC_GPIO1_IO14_GPIO1_IO14              0x14
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO14_GPIO1_IO14		0x14
 		>;
 	};
 
 	pinctrl_ecspi2: ecspi2grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_ECSPI2_SS0_ECSPI2_SS0  		0x82
+			MX8MM_IOMUXC_ECSPI2_SS0_ECSPI2_SS0		0x82
 			MX8MM_IOMUXC_ECSPI2_MOSI_ECSPI2_MOSI		0x82
 			MX8MM_IOMUXC_ECSPI2_MISO_ECSPI2_MISO		0x82
 			MX8MM_IOMUXC_ECSPI2_SCLK_ECSPI2_SCLK		0x82
@@ -274,125 +273,125 @@ MX8MM_IOMUXC_ECSPI2_SCLK_ECSPI2_SCLK		0x82
 
 	pinctrl_usb_otg: usbotggrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10		0x140   /* otg_id */
-			MX8MM_IOMUXC_GPIO1_IO12_GPIO1_IO12		0x19    /* otg_vbus */
+			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10		0x140	/* otg_id */
+			MX8MM_IOMUXC_GPIO1_IO12_GPIO1_IO12		0x19	/* otg_vbus */
 		>;
 	};
 
 	pinctrl_fec1: fec1grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_ENET_MDC_ENET1_MDC                 0x3
-			MX8MM_IOMUXC_ENET_MDIO_ENET1_MDIO               0x3
-			MX8MM_IOMUXC_ENET_TD3_ENET1_RGMII_TD3           0x1f
-			MX8MM_IOMUXC_ENET_TD2_ENET1_RGMII_TD2           0x1f
-			MX8MM_IOMUXC_ENET_TD1_ENET1_RGMII_TD1           0x1f
-			MX8MM_IOMUXC_ENET_TD0_ENET1_RGMII_TD0           0x1f
-			MX8MM_IOMUXC_ENET_RD3_ENET1_RGMII_RD3           0x91
-			MX8MM_IOMUXC_ENET_RD2_ENET1_RGMII_RD2           0x91
-			MX8MM_IOMUXC_ENET_RD1_ENET1_RGMII_RD1           0x91
-			MX8MM_IOMUXC_ENET_RD0_ENET1_RGMII_RD0           0x91
-			MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC           0x1f
-			MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC           0x91
-			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL     0x91
-			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL     0x1f
-			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22                0x19
+			MX8MM_IOMUXC_ENET_MDC_ENET1_MDC			0x3
+			MX8MM_IOMUXC_ENET_MDIO_ENET1_MDIO		0x3
+			MX8MM_IOMUXC_ENET_TD3_ENET1_RGMII_TD3		0x1f
+			MX8MM_IOMUXC_ENET_TD2_ENET1_RGMII_TD2		0x1f
+			MX8MM_IOMUXC_ENET_TD1_ENET1_RGMII_TD1		0x1f
+			MX8MM_IOMUXC_ENET_TD0_ENET1_RGMII_TD0		0x1f
+			MX8MM_IOMUXC_ENET_RD3_ENET1_RGMII_RD3		0x91
+			MX8MM_IOMUXC_ENET_RD2_ENET1_RGMII_RD2		0x91
+			MX8MM_IOMUXC_ENET_RD1_ENET1_RGMII_RD1		0x91
+			MX8MM_IOMUXC_ENET_RD0_ENET1_RGMII_RD0		0x91
+			MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x1f
+			MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x91
+			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
+			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
+			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22		0x19
 		>;
 	};
 
 	pinctrl_i2c3: i2c3grp {
-	        fsl,pins = <
-	                MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL                  0x400001c3
-	                MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA                  0x400001c3
-	        >;
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL		0x400001c3
+			MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA		0x400001c3
+		>;
 	};
 
 	pinctrl_sai3: sai3grp {
-	        fsl,pins = <
-	                MX8MM_IOMUXC_SAI3_TXFS_SAI3_TX_SYNC             0xd6
-	                MX8MM_IOMUXC_SAI3_TXC_SAI3_TX_BCLK              0xd6
-	                MX8MM_IOMUXC_SAI3_MCLK_SAI3_MCLK                0xd6
-	                MX8MM_IOMUXC_SAI3_TXD_SAI3_TX_DATA0             0xd6
-	                MX8MM_IOMUXC_SAI3_RXD_SAI3_RX_DATA0             0xd6
-	        >;
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI3_TXFS_SAI3_TX_SYNC		0xd6
+			MX8MM_IOMUXC_SAI3_TXC_SAI3_TX_BCLK		0xd6
+			MX8MM_IOMUXC_SAI3_MCLK_SAI3_MCLK		0xd6
+			MX8MM_IOMUXC_SAI3_TXD_SAI3_TX_DATA0		0xd6
+			MX8MM_IOMUXC_SAI3_RXD_SAI3_RX_DATA0		0xd6
+		>;
 	};
 
 	pinctrl_spdif1: spdif1grp {
-	        fsl,pins = <
-	                MX8MM_IOMUXC_SPDIF_TX_SPDIF1_OUT                0xd6
-	        >;
+		fsl,pins = <
+			MX8MM_IOMUXC_SPDIF_TX_SPDIF1_OUT		0xd6
+		>;
 	};
 
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK                 0x190
-			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD                 0x1d0
-			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0             0x1d0
-			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1             0x1d0
-			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2             0x1d0
-			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3             0x1d0
+			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK			0x190
+			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d0
+			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d0
+			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d0
+			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d0
+			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d0
 		>;
 	};
 
 	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK         	0x194
-			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD         	0x1d4
-			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0     	0x1d4
-			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1     	0x1d4
-			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2     	0x1d4
-			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3     	0x1d4
+			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK			0x194
+			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d4
+			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d4
+			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d4
+			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d4
+			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d4
 		>;
 	};
 
 	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK         	0x196
-			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD         	0x1d6
-			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0     	0x1d6
-			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1     	0x1d6
-			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2     	0x1d6
-			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3     	0x1d6
+			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK			0x196
+			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d6
+			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d6
+			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d6
+			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d6
+			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d6
 		>;
 	};
 
 	pinctrl_usdhc1_gpio: usdhc1-gpiogrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SD1_RESET_B_GPIO2_IO10             0x41    /* wl_reg_on */
-			MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9                0x41    /* wl_host_wake */
-			MX8MM_IOMUXC_GPIO1_IO00_ANAMIX_REF_CLK_32K      0x141   /* LP0: 32KHz */
+			MX8MM_IOMUXC_SD1_RESET_B_GPIO2_IO10		0x41	/* wl_reg_on */
+			MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9		0x41	/* wl_host_wake */
+			MX8MM_IOMUXC_GPIO1_IO00_ANAMIX_REF_CLK_32K	0x141	/* LP0: 32KHz */
 		>;
 	};
 
 	pinctrl_usdhc2: usdhc2grp {
-	        fsl,pins = <
-	                MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK         	0x190
-	                MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD         	0x1d0
-	                MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0     	0x1d0
-	                MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1     	0x1d0
-	                MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2     	0x1d0
-	                MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3     	0x1d0
-	        >;
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK			0x190
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD			0x1d0
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d0
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d0
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d0
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d0
+		>;
 	};
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
-	        fsl,pins = <
-	                MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK         	0x194
-	                MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD         	0x1d4
-	                MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0     	0x1d4
-	                MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1     	0x1d4
-	                MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2     	0x1d4
-	                MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3     	0x1d4
-	        >;
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK			0x194
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD			0x1d4
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d4
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d4
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d4
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4
+		>;
 	};
 
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
-	        fsl,pins = <
-	                MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK         	0x196
-	                MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD         	0x1d6
-	                MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0     	0x1d6
-	                MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1     	0x1d6
-	                MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2     	0x1d6
-	                MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3     	0x1d6
-	        >;
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK			0x196
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD			0x1d6
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d6
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d6
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d6
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d6
+		>;
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-flexcan2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-evk-flexcan2.dtso
index f7d2674c45f7..d87119842027 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk-flexcan2.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-flexcan2.dtso
@@ -7,9 +7,9 @@
 /plugin/;
 
 &flexcan2 {
-        status = "okay"; /* can2 pin conflict with pdm */
+	status = "okay"; /* can2 pin conflict with pdm */
 };
 
 &micfil {
-        status = "disabled";
+	status = "disabled";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-som.dtsi
index 5da0f1b3ed8a..347e1bc13b3a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-som.dtsi
@@ -32,29 +32,29 @@ led-0 {
 	};
 
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
-	        compatible = "regulator-fixed";
-	        regulator-name = "VSD_3V3";
-	        regulator-min-microvolt = <3300000>;
-	        regulator-max-microvolt = <3300000>;
-	        gpios = <&gpio2 19 GPIO_ACTIVE_HIGH>;
-	        enable-active-high;
+		compatible = "regulator-fixed";
+		regulator-name = "VSD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
 	};
 };
 
 &A53_0 {
-        cpu-supply = <&buck2>;
+	cpu-supply = <&buck2>;
 };
 
 &A53_1 {
-        cpu-supply = <&buck2>;
+	cpu-supply = <&buck2>;
 };
 
 &A53_2 {
-        cpu-supply = <&buck2>;
+	cpu-supply = <&buck2>;
 };
 
 &A53_3 {
-        cpu-supply = <&buck2>;
+	cpu-supply = <&buck2>;
 };
 
 &i2c1 {
@@ -220,7 +220,7 @@ &wdog1 {
 &iomuxc {
 	pinctrl_gpio_led: gpioledgrp {
 		fsl,pins = <
-		        MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10                     	0x19
+			MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10				0x19
 		>;
 	};
 
@@ -233,15 +233,15 @@ MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA					0x400001c3
 
 	pinctrl_i2c6: i2c6grp {
 		fsl,pins = <
-		        MX8MP_IOMUXC_SAI5_RXFS__I2C6_SCL            			0x400001c3
-		        MX8MP_IOMUXC_SAI5_RXC__I2C6_SDA                 		0x400001c3
+			MX8MP_IOMUXC_SAI5_RXFS__I2C6_SCL				0x400001c3
+			MX8MP_IOMUXC_SAI5_RXC__I2C6_SDA					0x400001c3
 		>;
 	};
 
 	pinctrl_mcp23018: mcp23018grp {
 		fsl,pins = <
-		        MX8MP_IOMUXC_SAI2_RXC__GPIO4_IO22            			0x1c0
-			MX8MP_IOMUXC_SAI2_MCLK__GPIO4_IO27             			0x100
+			MX8MP_IOMUXC_SAI2_RXC__GPIO4_IO22				0x1c0
+			MX8MP_IOMUXC_SAI2_MCLK__GPIO4_IO27				0x100
 		>;
 	};
 
@@ -253,15 +253,15 @@ MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14				0x1c0
 
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX                            0x40
-			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX                            0x40
+			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX				0x40
+			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX				0x40
 		>;
 	};
 
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK        			0x10
-			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD        			0x150
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK				0x10
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD				0x150
 			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0    			0x150
 			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1    			0x150
 			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2    			0x150
@@ -277,8 +277,8 @@ MX8MP_IOMUXC_SD1_RESET_B__USDHC1_RESET_B 			0x140
 
 	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK        			0x14
-			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD        			0x154
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK				0x14
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD				0x154
 			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0    			0x154
 			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1    			0x154
 			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2    			0x154
@@ -293,8 +293,8 @@ MX8MP_IOMUXC_SD1_STROBE__USDHC1_STROBE  			0x14
 
 	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK        			0x12
-			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD        			0x152
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK				0x12
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD				0x152
 			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0    			0x152
 			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1    			0x152
 			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2    			0x152
@@ -309,34 +309,34 @@ MX8MP_IOMUXC_SD1_STROBE__USDHC1_STROBE  			0x12
 
 	pinctrl_usdhc2: usdhc2grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK                                0x190
-			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD                                0x1d0
-			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0                            0x1d0
-			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1                            0x1d0
-			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2                            0x1d0
-			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3                            0x1d0
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK				0x190
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD				0x1d0
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0				0x1d0
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1				0x1d0
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2				0x1d0
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3				0x1d0
 		>;
 	};
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK                                0x194
-			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD                                0x1d4
-			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0                            0x1d4
-			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1                            0x1d4
-			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2                            0x1d4
-			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3                            0x1d4
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK				0x194
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD				0x1d4
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0				0x1d4
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1				0x1d4
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2				0x1d4
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3				0x1d4
 		>;
 	};
 
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK                                0x196
-			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD                                0x1d6
-			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0                            0x1d6
-			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1                            0x1d6
-			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2                            0x1d6
-			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3                            0x1d6
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK				0x196
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD				0x1d6
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0				0x1d6
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1				0x1d6
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2				0x1d6
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3				0x1d6
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
index aadaeef928bd..0c3f1b20b3d7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
@@ -215,7 +215,7 @@ vibrator {
 		compatible = "gpio-vibrator";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_haptic>;
-	        enable-gpios = <&gpio5 4 GPIO_ACTIVE_LOW>;
+		enable-gpios = <&gpio5 4 GPIO_ACTIVE_LOW>;
 		vcc-supply = <&reg_3v3_p>;
 	};
 
@@ -856,7 +856,7 @@ MX8MQ_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0xc6
 
 	pinctrl_wifi_pwr_en: wifipwrengrp {
 		fsl,pins = <
-			MX8MQ_IOMUXC_NAND_CLE_GPIO3_IO5         0x06
+			MX8MQ_IOMUXC_NAND_CLE_GPIO3_IO5		0x06
 		>;
 	};
 
-- 
2.53.0

