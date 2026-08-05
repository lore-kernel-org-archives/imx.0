Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CCC4749C9
	for <imx@lists.linux.dev>; Wed,  5 Aug 2026 13:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938001; cv=none; b=U28Zj8/V3Gl94w4pPrcwNZFvytb8+pLuG4HS/9CEsy1AsjbQnATavVoQ+gXx1Tfm+et0OcGcpvaisE4JRnPnaZrfpJ5OrPp4Shry3RpKhCVAr4oTFuN7iFnrmtJeVzGbxoZCZx9yRsBCEYA+deVtV6d2ZZzBaUwPZUcsPz5HevI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938001; c=relaxed/simple;
	bh=AQmvJX6Nuci3e5n5qvrcudWGnYySqxNcGkS/kJegtyo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UnGoe5xBUYA9MqUzgKJ8MLdElslW/p07wdBvhf2XWB5xXIzMh+l2Qde8ibxDeCzG48Z4wabDp8yUDGke3HAndZnUPvRW/LmfB2+qdfvLTrgUDHY7BRboaKkjiV9EojAQhJl/bLiPs14Tyq7MNiBelckg+gnN5Pl4mHr4VWsLLYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D6OQI39G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VlhemkHF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D6OQI39G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VlhemkHF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675DJj2L2776000
	for <imx@lists.linux.dev>; Wed, 5 Aug 2026 13:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WghKy2QgIFqNw57MRraz0/pbpdCWerjS4CjNHDDJT8Q=; b=D6OQI39Gs72VHY3B
	OUprlOdCdsBJPlPvLVqPnNxYfKGs68oaiT3NvSiusDpDVfBlzoC/hpQ7wcdeDbgQ
	sToq0pu/q2b5o+8xUNGYb4kdkw9A/J14b6xZnnfpUJu2XpWpAiVZrCra0wKWBuHl
	E3agT+ZrPgO7vRlUmqqkPaXFNG0SgRUAhlcKXVMgHfxXktrAjss0Pr/od8CVuD37
	gV+6JFRJsSb8zhkAkp12dvgHZJSBAf5sgiWhHp7kuJn9Y0kepoxjs20Sq7SwBXHC
	JRaYwuA+P5YGFJhLfs1+206qkhrnVkpvSMUvQ2wCaWu+sTZYUXPLu7Gn5mwx+lLk
	B0DRYw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x9r5w0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 05 Aug 2026 13:53:18 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7f5b54da461so14970297b3.3
        for <imx@lists.linux.dev>; Wed, 05 Aug 2026 06:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785937998; x=1786542798; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WghKy2QgIFqNw57MRraz0/pbpdCWerjS4CjNHDDJT8Q=;
        b=VlhemkHFrYxnc18fx63bAeYAZQaLZUyNE5otW5zbUK7LAqz3HUBuWbHyVn1xiKWym4
         IDS/4rdDCiOlYngPKNQu8wz2JmJdGSQe9VoeyyXcwdizwlBpBire8THYuJR/fAIquEpl
         7afem5viIFQFcY+OR2qoETKXH+hfWKjjjFP2DLaPPcsulkr2lrALsbvW6Ev3JBI1eunw
         2YCIKWnp1Q9SNJWYvAt3usvmzoJISkVfQUKZCNWQesd9woFB172a/V/nb9yT7E1lQQky
         2luSx+moob/5f7att6NZJwZ2V6nwE+3Rswjvd2tJSZnM5dU5TsZ2CcGSW0w7zsDh5OIE
         uPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785937998; x=1786542798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WghKy2QgIFqNw57MRraz0/pbpdCWerjS4CjNHDDJT8Q=;
        b=MprKMk7nR/wqK7CkuutLZJ/bLbhQPb6MIc1pLnIDwnsLGps0gvzcs5icbDmScGDFJ7
         HLeTZxMwRzCD4zDQJ6iQeWJhDBpWYgxyCuio5HgiyOzquUiXoc3aR8xBawbY+bBqvpyA
         86fCRW+Y6la6PfVHHSDtBAwQdjO44ktSp1S4VwfYcWREcK8sNzd1MO+SaSTk+xKLAiMi
         aRMAJeHv24ENmhACLsQMopFDHLplHZnRox93ZJ+PXqvdxW/6eZtGUQRoDur1lLcMOyCI
         TzYCqiTxnrP/FfskeT4pXW4++URDNps/6ZRGHThvr84ivfzWDvQXDsAtaoKn7n+LbSIs
         UxUg==
X-Forwarded-Encrypted: i=1; AHgh+RqgYjCVqPPiWiskoqt0bvgENiUc32ifZHRCZoVLsrSZGnhoR6Z/1grIAnpBXRtAUtsdM0o=@lists.linux.dev
X-Gm-Message-State: AOJu0YydFTfgiIz56zt6zoUQvwRgoFawUwG0fBaft/5wBeOpqNNOUxYy
	tKimwRSbePRlmM7jWCNFD+kka08Aa/YW7hGTueTydbKNyiW0zx6fM/qC6pEpzxYCK4QCclF0UNW
	xsLae86Y0zLLm3LmiRb9uWwJFQSMydGtyndhWnecYbXfglvyPuSqVwHw=
X-Gm-Gg: AR+sD11cQh+c1BPdmlKXq6gkonF5MUEoQ/P38HPHFJX/qkcNqkDV9CYCFeaxTO7uBGZ
	hFgf3nB+TC2xiF5pu1zZFMiSsu1XU1/Hdz8EPfVq09gXlcvq1BHrWuiANwMA1N4KNmd1K5ZSS7f
	8AjckPuu0deunEX9gK1IEuqeAn9uvh4bMhf93s7L5NimS/r8PAH0sXolfO498gUGORZh+a/Te+5
	2HrdmmfQPTRvxEPCHCcCTlLKgS36z8qju27qo9cIO1JZa2fhve6X4+gANZ9sIK354CrheTi0ZIm
	yE7MMxzGqy+U4tSVRKdeMiEsmeNFsLbpxCmFcXkrJqhcAaHNMxvtcwDq8p0I5bu9mfDlHlDGJnw
	tAC0g7AM0YsZ4b4vO9VP5nNM0R1mEsOA=
X-Received: by 2002:a05:690c:23c1:b0:81f:b410:b214 with SMTP id 00721157ae682-820224e0f36mr36672407b3.27.1785937997902;
        Wed, 05 Aug 2026 06:53:17 -0700 (PDT)
X-Received: by 2002:a05:690c:23c1:b0:81f:b410:b214 with SMTP id 00721157ae682-820224e0f36mr36671977b3.27.1785937997363;
        Wed, 05 Aug 2026 06:53:17 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8201320ec71sm20892517b3.12.2026.08.05.06.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:53:17 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 19:22:47 +0530
Subject: [PATCH RESEND v6 2/5] arm64: dts: qcom: shikra: Add CCI
 definitions
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-shikra-camss-review-v6-2-a8dbc66f0d87@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785937970; l=2668;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=AQmvJX6Nuci3e5n5qvrcudWGnYySqxNcGkS/kJegtyo=;
 b=a/wikjRFPxGG3nl4SJTiUqzc0Ku7M1qEAnrloJHSLS5eLVpA+ur2kXi9sKevQB5LgmLo3IcQk
 IEKoapUU/R+Cwo/07PwujCGvGWLTLFulI1t2tV2DnYjF7zRfvsilRUD
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExMiBTYWx0ZWRfX6FyRMfBJWmPh
 v0TdPtoJAu2HX5CDc7f1ZOgsHg+GL4XCJ2Xrb+HrX4pLlv4R3pzqV/WP2KruM63zxMdPdeYHset
 2BSaIqK9q6h4DkFs6iknAwLT7V1YhK8c+CEZsm9XAVO9aC6+3unCHqo20XADOJ71dUf7/93UyPS
 hC0OfN9k3mdv39fWGllfuuQikk3Gd+3Cxhizimv9oMsUmKJ8Jm7+IVz4DEFzbEGMlc5hlcERtZu
 676Zsc2PTJNkkAkTMXuKSL/0sqx6C8DuKbW8vVkImM+s1xqzzjuYU5vl6N1vmuIf87U6ywHbJVf
 dO/L5Hlt5Zk1lO7W9NRE4D7UsbRdoIAIYTpegVaMvcvhpBwTJbNTFin7EzsoaJV0y3jyiLQCzTT
 VxcZR6oD+sngNR5I6BavXWYSqdAyVBP5PtOjDUkHJ2p5h/+SU+kaL881uIU/YqN+a+1/JE3Mf1B
 alJkUab5uWzBqxo0qow==
X-Proofpoint-ORIG-GUID: 5JmBPjf4CzlWOTMCvTrVywosP-rPzZLh
X-Authority-Analysis: v=2.4 cv=BMqDalQG c=1 sm=1 tr=0 ts=6a73404e cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZbC1Des45MQyGPwI-hwA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 5JmBPjf4CzlWOTMCvTrVywosP-rPzZLh
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExMiBTYWx0ZWRfX+XUoUuqTxHeV
 PBXeWTgmTYB+N/XKk7PfCICdaG4aO+mIPGWN4KPB0ud98ifhOU69PFL4HjL9UHM/PdxYFtHtLHQ
 2uKwWFNy6B2b+1n2mA59oNzbllXE9eQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050112

Qualcomm Shikra SoC has one Camera Control Interface (CCI)
containing two I2C hosts.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2e5976861253f4402c75509f52301c21e3864d1e..ddfcfb137bb29439ce20ba6ebf3a76693792b56c 100644
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
@@ -738,6 +770,44 @@ port@1 {
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
 
 		sram@c11e000 {

-- 
2.34.1

