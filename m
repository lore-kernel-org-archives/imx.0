Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B823BBFA1
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 07:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507592; cv=none; b=awVlBYP/aY5pR6K5/4QUHLIInp8sTkjR19fVCD8IuKHlAn7ZNBS99OyaXUPEd8mGEWbBLm31s8p1p3hcqiQVLp27MYdIXy39u7JiFXQP0VQnluMYCw8sZqQLqyqu7Gw1HLIyayCAyawHFfEXjP+kj0d6YLCQnkZJOawjdeP2L5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507592; c=relaxed/simple;
	bh=QUAOHVDW4Udars0Jbe5wX7sJIZNINY1ZT2YyhfvvXAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e0O8djCMx1bG/m0ZgKX3KHMJJpmgaPdjQJvlOyKz2/m2IfBLD01I2w09LK5M5+o3iYq4KDEpJWHO6I4ODvnz7qFH6DF5w0baKlS6jLSWFs7D1QQfM0OSo+X60Uv3Do+dIswbzaR8oPQK1kz0Iuon4Ybxj5K1qUi7kTejbs3+WcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mpaDXtKR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iHxDqbKk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mpaDXtKR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iHxDqbKk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6LjL33853247
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 07:13:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	au/dR6Wd3jTT560wWLDqtcWcjYZ7Z3B9jdL0VywUhbM=; b=mpaDXtKRhMK7OYTP
	RwOaN5Doek4boMEUJmviyJ9rMmt7btz0zrYzJy8L9NEfcTj7E9l9UPe0iZx8W1Ph
	shR/llTRbdUUZfpzCWfdAmk5oOiKSHs/M2gXSJlA+CsoFydSx6jm+pm5eNkRpbmD
	hLDwhBXjIweJKIfRzLip2z6YmhHfnDvtl9oMva4yQLMCt7zkOSy01muoc1jWxhEY
	CwelikNIKaRIns3MqeYpmUFFcR5rtcR+XhHIDHr7juGcgTsf0bgM4W2Z/zJlwZ3E
	48S10s45ofrJGIEdWgMzylGutOXWqXA/KN4fZwet4mFxwtjMdNBKfL2M9K5bKtYB
	liJPGg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7gx6u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 07:13:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36b934a336eso2458075a91.2
        for <imx@lists.linux.dev>; Mon, 15 Jun 2026 00:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781507589; x=1782112389; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=au/dR6Wd3jTT560wWLDqtcWcjYZ7Z3B9jdL0VywUhbM=;
        b=iHxDqbKkxbg5V9JIYVM6THU5ZLeRcLMmYWCUTM1Zwgc9iJIM3hfV5CsyvFKyn6u+uO
         mqErjRr+NNR69gpA1RWsw++oAJN4HFThwWAmbsHB2DtSmg6Q2C4c0wEOuU2FSzH8vA6v
         FY1Qxg+TKQ2214crx7VXFEEejYX7CZqKYpPEfd6vWKtTYPWKkspv+TwgPTqayO2rE5sK
         4T9wjK1p7E35YG5DlRDQOofn7apwQTDf2l2k1qHfeq9tN48Hlem15KCimXWGoKfu2Oi4
         zJ4lZBWq4SGVBpS7nFu9hErzYNb0N5aZ2jdccEpU2Hqqar5/zJR9cVcctVrz4pq+h3RK
         ULDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507589; x=1782112389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=au/dR6Wd3jTT560wWLDqtcWcjYZ7Z3B9jdL0VywUhbM=;
        b=AYc0kUfE/qXHOJ4Z8zNVREmtVEiniG0DroO62VAiI9oSo0+t1bJHJbw/+G+ltQ0Cv7
         RCDpteh6vcyJ3/qbsevO+xl4+fVFyQhMFFitP//uU436zKs78lW5TJBWkFd0s4hzF1y0
         k73Rhwa16pztqm5syZ2HIwWwN3tKwVP3XvN2/qacklQx6BOHxqOn5xc2WTvrRCuXFz66
         o2kbYHUzA1Wr6KyK/tKnH7b6fOzW9+60tJ2JHlhyWNHx58XxXdUv4ie4Mj2p16df+0JD
         5PM/u/kpc9Cqt9Hyr4ZgF7DHbQHs4QdzEarrihOXLImm4gSQpncbyLQX5TpSLxlmspbp
         fhxg==
X-Forwarded-Encrypted: i=1; AFNElJ9SBlGo97Ald6EH6/0l6cqOWtLBFLS2pQVSmSZmTlsik1IFHlcCCF5TsOZdx0AOkAwyxjQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuQKttfrGPNbA2PWES7AP8C7VEw8/mdx/UPPZmQ3iWKZEr/IvR
	5uDqZBMyiIedNvOmwYQGNbhZEle2eqCGoKdeKGr5xdJg5B5Jz8xbE7DBGqSO1QzB2X4cIH4KG2F
	/7b+93HJ/hUQrfZelwtPyz3o6O1LFtCSBbcRKdHvGVj9YBufO4n8BYkY=
X-Gm-Gg: Acq92OG8/DnhIXHZXQVDOtjRgKBcoggZ9TjQykQYd2qAfcH2w8MzhNpVfpq2xAgYRbP
	MP91rBBiL3vlB9bUX6TzzB3NrhQsWJJMcHevBHI/cTzUBqM29A/pLUUzu8+GsujquBJF2pfGxTw
	rKRYXAuBgoI4tNo7cZtt1vKeVn5ImPgVFdidmgYGKS5s8OvkvscRHaKkpEfMOZ3ryAGuO0BDYVU
	EjTYXOTM+AroVhe7/xTaf1scuAHcdmg13oYLRUjS6xCuA0FPuE1TlXVABRd2w3FSHPDV6VQJP4g
	q3e3pqyN4J2D/k5RidhkuhTuXzbHz0a4fqYKzuxIj7jL49jfWkJJgaeqgen6S1pp0o7OpMfaEKm
	mroR14Wo2bw9kl0g6fy7qfO8YekHc86mtriasRuv9biLjruOHvKhQ
X-Received: by 2002:a17:90b:3fcd:b0:36b:b06c:30a1 with SMTP id 98e67ed59e1d1-37c2bc42814mr9470960a91.1.1781507589232;
        Mon, 15 Jun 2026 00:13:09 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcd:b0:36b:b06c:30a1 with SMTP id 98e67ed59e1d1-37c2bc42814mr9470940a91.1.1781507588775;
        Mon, 15 Jun 2026 00:13:08 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2668cce5sm14867474a91.16.2026.06.15.00.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:13:07 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:42:15 +0530
Subject: [PATCH v3 4/6] arm64: dts: qcom: shikra: Add pin configuration for
 mclks
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v3-4-8183481f48d0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781507551; l=1517;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=QUAOHVDW4Udars0Jbe5wX7sJIZNINY1ZT2YyhfvvXAY=;
 b=BUXma6q9Gyn2swW58JKf5dAcZV8fecETY7r8PGWQEBejEnOm6JzM24v7xnDk/1CRwSH5xQIw8
 Kyn9H8F/NuJA3m0GP83IuA5KK6byXRSK8tcHmhsiOsKBH1ngD0WjUAW
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3NCBTYWx0ZWRfX5tz6tLL+nzhG
 f/PUGGHtz3zBPDs506t5NnDo4X+KyfWqRBFLNScYjhiGWR1Aykyx539E2OpE2xXSmHc7OpqmPFU
 Ur5QFOMJ1CaIOfkc0I1i4/WvWt+mfDs=
X-Authority-Analysis: v=2.4 cv=fLYJG5ae c=1 sm=1 tr=0 ts=6a2fa606 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=hvkXKTiNP6R-ltmIA9UA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3NCBTYWx0ZWRfX/dV/rlc3O5eV
 j6oTo8XvYCgB85cksawQ//BK5/eLYCC1Wn1q8wUEkiErlqK1lkIbGVyXeuxlbQxwGcAGcuaCUKQ
 HnzScFM/yLwJ6i4r6jP6RB2zjyCMY7Z+ibCsoKpL+YKc7y3NSAkcWAI4Ivpnp+w/qpwR33Jstw4
 nkO21Jvo5fFnAkArsZyu5+ayYf4DJcw1HmupfU92YRxXpX6FY5C96FmogxGI8lyjpomSJ7e4r1J
 zDdbUlGPj8zPd652K9sHRvmORD/uirWehdVPUmw+NIPetN9HzOLD0gTgrM7fBYDzvO/oaCaiNxb
 xzG/Um21pnr+pHW0x7TJEp+H+uNT/yacadnFNsDOX8Q1QnRFp2P9hAAaURYmh5dDYJB2s0kgd1w
 axgPjitQNLBYPTVf94exDhnvy/PGEQsSQ12te4mUz+iICB4XmQldKe1dKJnckUfqTFzOH0T41ap
 O1/Pcvth/3UFNRcaPXA==
X-Proofpoint-GUID: 88_v-TzutPvSeHuyKAyLZ1myrusBZdUN
X-Proofpoint-ORIG-GUID: 88_v-TzutPvSeHuyKAyLZ1myrusBZdUN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150074

Add pinctrl configuration for the four available camera master clocks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 57732804a6c6a114a407a4a541a1cc7af7635ea2..16b547131e8b14541abc68ff7cda126ba777ad80 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -380,6 +380,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
 				bias-pull-down;
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio35";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			qup_uart0_default: qup-uart0-default-state {
 				pins = "gpio0", "gpio1";
 				function = "qup0_se0";

-- 
2.34.1

