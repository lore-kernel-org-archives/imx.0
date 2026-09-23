Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655863EEADF
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 04:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790139510; cv=none; b=Z3IWH3b8JK/g9ZijwtNdfcJIycrCd4E8fMkhMz0KBlD3qKyVzy5GFXdKDeIykKTK4g54BDc0CPPbK4FzHa70eRqZV88Qiq3BwOIgAvEfHYekn6ncbJQs8esvbp5S1fImSrQ/yTf0002wK8qKiW3eHtetwSfDhiooxk7WIF2DwWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790139510; c=relaxed/simple;
	bh=oFU/9yPXbZMIVmz7A2FIB8gBUn8jREr8ifXNqaMGDK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fKxnSqABH5w+s3QQ8cX1jfpf2+FDlKY3bDAULaz+7NY17toWkDSZC/FXCVReH88BiJSdwWIKdHsG6kcOnhggj2L6o5gLKkJsfqWghUZpiAOQjiZA6F1kjmFvjva3dfCDytQev0+at47dTyK+cQmpm7hrDD8TV98DK9NQBSZCJ1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C1M5y0fh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gocWWdBZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C1M5y0fh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gocWWdBZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iXcs2728537
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 04:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tYbeAaBWwMNQyA41pglGGE2kILDe8d01HKFX1vOZUNk=; b=C1M5y0fh0hFUgnu9
	qhDQ/pYNNM1LifxWbumiwvgC1iagBuzhYm2rdrKKGMkS4H+L0gkKc2aQRwcVm26k
	xohm+W6P/7VZ/FnmrNkTAfxl5831JPdTdiGJvTNLnhIW4F9oiNftPBKsgeA1EK3z
	cMSMrePk6ZOHmsOlFYBqt9tfKzl4PUPN7LR+2/Flfzaf+fD8xGw5o7RntYvQVvKQ
	AlYhDREz41uMaBgQOVMejJF4qWfKyYKnd2uBFKJkb0xhLXWYYE6HgfAxRhfFLh1z
	UjoMsH+baac7fiMjvBdj+XXJG0KC7OLM6WA+3/XajLclLgsRk9n4NAUYj7bj8vcj
	6RN7uw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xtjau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 04:58:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3286d2bac04so541607eec.0
        for <imx@lists.linux.dev>; Tue, 22 Sep 2026 21:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790139491; x=1790744291; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tYbeAaBWwMNQyA41pglGGE2kILDe8d01HKFX1vOZUNk=;
        b=gocWWdBZqxjVwMkaQQuHp2kwSSsNKOyOaE13Q+8Bg5cwqci+u5ZpfkHCY0XGsh/AIn
         RGDmvkYMZv28zmnmayIJnJHNRm4Lw8O0Rrw+P8m2QuwdsMduW3mLhEmsap6BYh99scO7
         xDAJXtpv6zC4gwRaJf3jelODDnRPejvd0HRzd202E8kLcalJSIQ5Oyewmqw7YulPArSJ
         f4L0dZdFsMdeLs/1z8GgoTANMqeIqKlERRbs0QH6992psFOM8DF/DzwR37J9GcCSgJjC
         FbqtX7LhmKzVyMFiIQUcU0dwhG+yts2BAbF8EszvazCijP0x7/Yne7Gr+DtjUdZmk+1f
         6afQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139491; x=1790744291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tYbeAaBWwMNQyA41pglGGE2kILDe8d01HKFX1vOZUNk=;
        b=Zry9m4LdBhpXs5RYNdVCngZ2sUf1UtH5mUIvEXY/DkeR+Wzn2YcxrAzqW7KUA2bqYL
         Yq0IbZWhpeEvi93DQnJEE+I5hE+3P2H7GxvR5aCyzG8JPytaAry2RrccIdFw2K75euL6
         bKZl1seR2FDxP/LH/JEz6fJLDmziseZdZln/yyFxjyOB1IuK8tIrGV2sz78qBgGuxlAl
         j7jeQ2paz0X+XmeXEZqGXW9239L8OvlIYgeRy8HU154916V3cEBUlSS6sB0mnQ5DqMvZ
         S6N+jK+EeweFgNSHBjbHtxnMsNpeNPnKlqpgeeu5RQeYd68cY3m3wWHhI1K/co5vOWdQ
         HU9Q==
X-Forwarded-Encrypted: i=1; AKwUvBx9wVjW/jXoI013xN6wXrND/fG3Msp3exwi+qolKHhae3DJgPM406sVl/YHaFAXNjRcgVc=@lists.linux.dev
X-Gm-Message-State: AFuF++lunYvi9RsVVgo1vjt2uhTLVI9ahlF7ijXR8nbP0YefqAK2564n
	98xi9mQQSKwYpEjTNH2VofcGCj8QjTjeeG/kVwpIHU0OV/X+/lH9TMqmFbo1tMWDb3PC2jF9uUI
	fzbn+lO8Z/lakZ44rHeiiZILgsKqcNQ63soyDe36ERSs1/7hABqdcr5s=
X-Gm-Gg: AYBFou04RWWQ0wu2yzEnQwgB9RUzMhnfXnB0aBPv1yultNN9FBCzgd9N7tHpqIhK/qo
	X4JOPiehgD46MACTMHZ3W6Fs3Yoy3a4fLli6Gbe5Unj0kZfwzDKOabMzYdkNbfjpgIjw7w711ou
	FRpaO5y5+eEucumvo7XbAwa6U/7iw28vU0jMtpz4BbV/Sh7Y1TRymK21wA9m+3CgyHNE+hBlF90
	ke3t+tip+/L5vaPuCwP4krIrmvSNdlTCNNpF/3nXzrSXbpSqDSWZAuxHS24hmHxMTt+39TIVNmj
	52x/TzVI6kdBLSFq731ViQxkKb4GAGjYW1HXHWiF7wzlFrCzEagRIq+l9V/vHExYJ8AALDJPna6
	9iiVVNeepkqUyJjq+jEd37vbO1eXmFw==
X-Received: by 2002:a05:7301:4393:b0:33c:1b80:8ae2 with SMTP id 5a478bee46e88-33e8ea84a8amr1335488eec.39.1790139490914;
        Tue, 22 Sep 2026 21:58:10 -0700 (PDT)
X-Received: by 2002:a05:7301:4393:b0:33c:1b80:8ae2 with SMTP id 5a478bee46e88-33e8ea84a8amr1335426eec.39.1790139487882;
        Tue, 22 Sep 2026 21:58:07 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm3168907eec.26.2026.09.22.21.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:58:07 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:27:30 +0530
Subject: [PATCH v9 3/5] arm64: dts: qcom: shikra: Add mclks pin
 configuration for Shikra
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-shikra-camss-review-v9-3-09f5fbea1309@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790139451; l=1600;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=oFU/9yPXbZMIVmz7A2FIB8gBUn8jREr8ifXNqaMGDK4=;
 b=cYQTvjOakOXRnxQNaRT5qnq52PSjoCveEleIHVwfp+U8xTSS09RmcpVRgqjUiILafLCZa6+6v
 pWU/uQDTAVwCJjt87ewggNrsjGJyQuO1rWfhdTti11jI5FgLPplQdfH
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: H-rDsWQ_8pIUVcxFzkFepOPo4JlTIE2E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfXwN1L2cJNlFyQ
 JUO5Z9xBHQnD4NkCaXeYqQLjVDLZzLSl2qeJwZF4xbLBzccoSFP/3HWHyCnV80EJenIy0N9uzfd
 eiyAg3q7BKWNLLvBmfJ699BP3qQM4cj7RUfz7Q0FoKYINLD5xqMtXilsWwY7RBW13AJ3MTEvhFT
 Rmrc5F+vWGYLkGl/NzXoV9PTQpQaxePVBtd2a7uU836epVmtlnNfB3uGIlvJi1D5ZfQirJ6Fd2e
 Hf5rLpwjt1wIbvLoZFBJ3TdA9iu2lnL3jKub8B3hQcBLjuNy1fRlJ2kPoy4kctShXKDoBMRLn4r
 DU/WIw6JG+w8bz1eI2kO3L3d95tzGnQrFVe4/kJqLmH6vIVYkfJdeB226CO2lKxiKBYFaR1ox+D
 a/ID8i7Df276RKnyUVNR+A+DEvXlJMoBO0B1YU8XZNJYOGAqqiRgWHrsFF+sbumNME1JfuzWI3L
 UpGYZQy1JpcRXOwefXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX77A3m00eH1ZS
 MN21DLAUZAfsu4oAoQWQcDVvIYVj5TcyNSmjGv8mn9gRn/avshUWNGNgAQsfQ4SEFSPc++L/WAB
 MSPhx1sBpCcB/0cfMEd+Xbvm9ZK5emw=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab35c64 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PMLJDkNcKfHmOO-cHakA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: H-rDsWQ_8pIUVcxFzkFepOPo4JlTIE2E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230019

Add pinctrl configuration for the four available camera master clocks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index ed73603c3dd81d92d84c91b57e33154a6fe5b470..580114806ccd0209cc5c4e4b05b9f321e6f77cfa 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -924,6 +924,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
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
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";

-- 
2.34.1

