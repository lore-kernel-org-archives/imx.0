Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7874A42DFF1
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079018; cv=none; b=cOlKjlNG2HRHP9FFkl4MoaIXzX4QM7KID7Baxwc/GkKfoUpT58APDcOJpqyg50D8pxa5zwuN/99YqnZX0Y5kX5MJML7p2D+bPKou/1fJ4Y2yYz8i304iQdXQwDu6cLZ5IjoLWIrfVZf3NaRy94FovacUW8Yx8+LJ1m5swf1rulQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079018; c=relaxed/simple;
	bh=urisQog5JZfbdirBxu5tGAO+ASUUaW9dPoY/c9Nj33A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h1BaIWSnnJBGnQEr4tQ119vInWj8oKw9kBS3rFp66JcEfDvNKwnqaw5tU9S1Qi0lpAheFfMzfUJ1VmKshkpPhToA8zFYsmZYiBIZnVletGAbxP1wK06fAzFV4JtFae9HjsX1SU5z3xlt0viVNThNkq9ycKeqwrW9U/xhuU3G87A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pXCFtWKS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MP9t1wf1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pXCFtWKS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MP9t1wf1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M87tAB2277184
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oYe3a+X8RQV757haNblqDrC0UCkSImr/La6BxbOeCBI=; b=pXCFtWKStN+tJu7A
	slfXABaU/YsMvnGguwvei3HFptmC3STtQRjRQuArIpsmd71xtHvBIupXnvrDEhk/
	HMhyW10V9h3wfCpcQqgx0R2S35qM1i9UTiZlWSFIM596axDZown207KKE39Ouz5s
	znemym+CjIADeKUXiCvJk94/7uhiHaD2dtpcpG0x+ELAfeAm9Lwu1GxZIpBSOogR
	7HhOmno+IEyqC2UrMmKZ1KdhmYxhD8SAPbVANDLhebjdJxnGXgI64wJROYIHW+6B
	suXkBJNTTIg0ed7gt1AgUIb1d52GYWxS+H7VGBkwgOvoreIYeksJxBqaNH2T+LNc
	WXtJ/g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7fat0tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:50:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50147745917so31411211cf.3
        for <imx@lists.linux.dev>; Thu, 22 Jan 2026 02:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769079009; x=1769683809; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYe3a+X8RQV757haNblqDrC0UCkSImr/La6BxbOeCBI=;
        b=MP9t1wf1tKWDFQPaHGD+1uEdULps6FrI7fAU2uEWFAgNUMc0Tf8odFtiDt5L9NbBqh
         VpeYOZxnJQ+MnX/QSIFGIpzSGKw3Onyb2KXcLQxS5luOmxtgntSlhPs4CZEGDtjtW/Xd
         9urlFwMhhhAjM9uhBz1pKaSo+uZMzsjj++Y8/E5Lp3gG3PQd4U6frwN9beVI2K/rOAf0
         YYe7EpvwCToWn44xzoYy8u/P2kTMfKlar1Em3pTPCEInD48SS5DNfRzyXnhPqn6Dr7VM
         93W3KbUN+ZgNvHktBqtGX8oSrwCKpwDpMD4TuoQ19FmrL2VPFhxP7PbpLIkOHT+CPhj/
         0wGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769079009; x=1769683809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oYe3a+X8RQV757haNblqDrC0UCkSImr/La6BxbOeCBI=;
        b=H0j+uVQufQdvMUESRCOVR/tvucW7l6iD3SzlRK7RsJYA/dq4L/6GorovXfWp6Qqe6X
         UDtxSn9efUZx4dEUq7Lb1uzyu1T1tzcJ67/ShWF3U/R7mXTE8o2SeqnMdQEAboWqlvcH
         zQKpBJxyiGuB8VMQfGFCwjsHLs5W98PZORm2AVtNWQSKqtmevTnrrSe77RNTSyxpSQpO
         jslXmjXjoWM8CHo8Rq3FKlafBbxPy65Z1lNLPjYg2EZgU/mh4A/zcty6cAFAD5mQhzLA
         L4GMhOAd0GGPj25zSD0i6iBClx+1YefZgpvBDHRYFGedUPrYhTS82m+MriLTmzTKicdN
         tOEg==
X-Forwarded-Encrypted: i=1; AJvYcCXmL/kKSvwX019fva39WhtTpPPHFKqsPDggo147RB68p9EzBqAmoFUJsRvg2bFbwl6Km5M=@lists.linux.dev
X-Gm-Message-State: AOJu0YySqe3/ZCypJiZAljCeCIaugyy95Q8EB3rASweA7LofZbYh+PkS
	pMXvAhYclnEf6NG+7mcOLdg59Wl4JunWpWeSI3UABFHYBtzbJsAAmFlsxmusyr1jLhTTr0AhGKt
	+ycjuqhplp5u79HYW/h3lqt5WT/bITmnmpJ9oydEr+DKWii+DKOpxHF0=
X-Gm-Gg: AZuq6aK/SMFGn0LNL1WGllXVyAANrBsbZj5e8ZZIvsLE3C2JvtUgXRSNCgIOfaK+QiA
	y7Empw3KCIY5arSrKhmgLW5KNNaGgrDr5AZ1x5s6oTKarkTneI78VywOQ3pTNfPHcMrrA5ddlwI
	bWvFYPiRH5cXDazz+0bGMYG3jRa1+LV+HvOLDoj9sEv2xJUQueWbFohHRgONvofiKb0egFvLtnm
	g87bdI2d6ifJum+JHlGsaU2CaGAjGDeTyYNYaCJQZnrTzt0MZgZdGMLCF6L7ZO25ka1oYPoFggn
	rJpR4SUAuPZNz6dRq6A0e4AfYt18TKhJn/LYjrSvyq2dTqZip3U5D4x5bQ2GfS25kvCNV648fW/
	fSlG3Qnk3DeA0OeIHwYUPw/gYLFoJ13i9k5JkzIOyy9cSV+IFuv/YBdF42rNq9eZfdv0LW5TWHY
	WA
X-Received: by 2002:a05:622a:180e:b0:501:3c88:131 with SMTP id d75a77b69052e-502a1e05425mr286886761cf.22.1769079009360;
        Thu, 22 Jan 2026 02:50:09 -0800 (PST)
X-Received: by 2002:a05:622a:180e:b0:501:3c88:131 with SMTP id d75a77b69052e-502a1e05425mr286886531cf.22.1769079008952;
        Thu, 22 Jan 2026 02:50:08 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d9ee19sm121704901cf.14.2026.01.22.02.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:50:08 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:48:55 +0800
Subject: [PATCH v5 4/5] arm64: dts: qcom: talos: Add camera MCLK pinctrl
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sm6150_evk-v5-4-039b170450a3@oss.qualcomm.com>
References: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078967; l=1538;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=urisQog5JZfbdirBxu5tGAO+ASUUaW9dPoY/c9Nj33A=;
 b=8b2oOOOPX2SdYaNULjliR8pcPHELaBMrn0YzW4Aoq5mhdvzr1KSJ9jHs5y541HZm1Mu/hUPLU
 0xawCuOjhDaDEslehWSigU9NBuW0C/AQjJkIfSeruRcugbj2FeHIBZz
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=Hrx72kTS c=1 sm=1 tr=0 ts=697200e5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NyBTYWx0ZWRfX/G9mi5XlCF7+
 zOAuQU9qiRBQMTeKMTvB13CT0CER5ikzM4S8B7GVNVu1lKRTPk0f4Ca8L7iRLFJhDEDwNs1tSpX
 9dcUh+qnB8l7ldNiWBj44zz7sGhk4nnuFUS4bby4xGDBS5dXcGmvs2uv8VA8oXOcmrY/abfSKuw
 zkyNoB0dER9d/D5/m27isX96uiCw+EToNX3Kkn3lg+uhBAuDIqO9Z/PIZEqBw+yq/od0zoi0+qs
 InZJfZJCfuxC48eiRc46dh+QusayFU4djFF8gYpKRWQb3bu+X8iQ+reCcqexqBCy85vsYYal7U5
 3Q8VIv6mN5zo3F9b4uJTryhiPjCd0v7fOAqpHXj2jkl5M1ilol2X8ApJU09g5TTKudVA85ZK2Kt
 j+wisBCpEaqonTikVZdeN/IJX2dHc4agXZjIORlqR6RNBH36WhtDrTAgm7WsACTDpOm3geM8ArY
 GGom+w+4o/q8tlD6CVA==
X-Proofpoint-ORIG-GUID: R0qlINEA2YaIuFl11AcghFvN9Z2LkCbm
X-Proofpoint-GUID: R0qlINEA2YaIuFl11AcghFvN9Z2LkCbm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220077

Define pinctrl definitions to enable camera master clocks on Talos.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 6d28096e50546855bd762e479b66ed6214ec5d65..33897994d0ca8a193acfbc94a932551a09c712ce 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1553,6 +1553,34 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio28";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio29";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio30";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam3_default: cam3-default-state {
+				pins = "gpio31";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci_i2c0_default: cci-i2c0-default-state {
 				/* SDA, SCL */
 				pins = "gpio32", "gpio33";

-- 
2.34.1

