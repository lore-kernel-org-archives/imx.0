Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A5F3D3308
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 08:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512489; cv=none; b=OTkBpTCAgrCfO4cAMohrh3TPi6kTMWXyRmiX+uqMuSU0T8a8Om5kPUN2MiEW2NnUYBAY2yfW/bRP5eLn+YkzYynkPsu9vgtye6LraQ8QpsPXLRVv46iAoAAVWqFX1oNiXnUUkMUBd/ZXE3R8ZOb2u/E34n+iK7aZQazP6fQ54Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512489; c=relaxed/simple;
	bh=QUAOHVDW4Udars0Jbe5wX7sJIZNINY1ZT2YyhfvvXAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gMCI8CXSlWIuR7eT2cT88nva9o0VtlOLV3kXcLtzsbTJtUTfN5PUG+XCPoTMbEyvzEIBrQVKVl0EMbj7InTkHwsk4Lt/ejYXsKeZhGJV+X9sLYU38vgbFMmLWqZRheeQ3LWmYVHybp/OLAnKPxdtQjRupCC3/xUOqr2ZVlUM1Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C5bCOD31; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bPqItlGs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C5bCOD31";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bPqItlGs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6Kv433828099
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 08:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	au/dR6Wd3jTT560wWLDqtcWcjYZ7Z3B9jdL0VywUhbM=; b=C5bCOD31o9X8JCPB
	EH2SV7jxXq7pOagOvmzO9qdzXMV1FzPgAgfTTe03s8GZtVAC0R4ARKpnb9Aur9Mj
	euFZsY8I13LIJlZYeBDbhlDLmuDi71OkTV/D73twgXMIEcdZ1V6Lw0ZlwKU632D3
	L4FJv5d7s5xXZgfEdhf8S6sjH+CLxMSMBVHljkwQMZirYPNFRzrWV83blw19li5P
	DOyU80Q6zRXw82R8F0SRWD4yeAG8iRcEPio1kTTpo/4QAFc51pg1ZrIWI5KKLjTL
	dYTDcKktDUTmn8TzNp1VMdYjuABtr8OKdee4cdwnpmoc7Tb+UNSj/6BuaJIeixLP
	UmDp5g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7u6dvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 08:34:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0bfcd629eso37094805ad.2
        for <imx@lists.linux.dev>; Mon, 15 Jun 2026 01:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512477; x=1782117277; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=au/dR6Wd3jTT560wWLDqtcWcjYZ7Z3B9jdL0VywUhbM=;
        b=bPqItlGsIek2bJrsn9UDgNj50UsSW8YzacKxhwpKsDYNb3cgvigoQIa7o1Qs45kzjx
         gy6q2mfSp03cD57DHGNA0hhWmqI9WDmQn6xi2NDxPJpjWy89EceNB7MiNkiQWRAv9Y28
         xmO47vN3iHgPdWMrnKGof1rTVu+IKmUHnOQo9UKz2hUpWQzGXLMLbZBzblOnZC07Bv0h
         QEJawUaGXOhVDIFHDb8Joug4lrFOKtLfojJ0BqLo2hDWzJd8GjzOhn4ALZFErb89Vzra
         q9WNCzGIo1iqkbM86b12j/JUsUewtBMgbsIZu9/zElgKxcZ7ywfFxcr+w9nqcApniL/k
         xjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512477; x=1782117277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=au/dR6Wd3jTT560wWLDqtcWcjYZ7Z3B9jdL0VywUhbM=;
        b=n7tZvKX0SXR/RpuKv0PmtORs6kSwIeiQ+RvDJb214c1srmLo0eK1qStIH4J31bUXeD
         GvLdHEKSOKuDgc8Ccho4oxFQgHvzM/9BqdwCaCFNRn3C7KjPfJzRYc0MmxKmh/NP+jZE
         qApeTUCPAH/ldmKsAabiKek/aYwx66y3sC5JipnsHamgnq1u9YyYeMve77xPTH0K15aL
         9jGvnI2eJtyaO6Owp5B6eiK5z2hHWWFQvW2qkiCdZ13mNSOlQBZhSELCfPXpJBEBy8js
         cngzCpLnxFKjFTj4osa1Rv1xvB9cE/rcO2FOi88ZNL/8MM9dj4yecPGR8ZiRPNzarflw
         Qe+A==
X-Forwarded-Encrypted: i=1; AFNElJ9XhLUt4MOLQHn3wxm9J3mbSJfo1HvGY5VFpoH+09yt43sW3mimHwBpP9OoZulRXhmWR1c=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZk30t4ysEwYBZpOvigbRlUlrahdJ8ClgdHWfrpTwxYOAT7XEo
	TMjdcolVODaoBEbvLszq16p3VGHwwBruCQHrXPNBkIpfDri3Q4V7WHfvRg2MK1u9nMspw2DY8Ad
	zc301Fl0S2IucQt5jW/uRO27onj/SwQPjJeygfB9LxEcQJ3fT03vcXRc=
X-Gm-Gg: Acq92OGpEVhNoE2RHmsPN/5gbAMtk++tW0yyZHb2b9Q+cuqKDDIe1WH69AEoCIMKO6m
	z1mvXVkEaWpZXZ1UmZGi11moh9T1uvYv/GIzWu1AcCXl96Ivq6KmjtLx4AFCjNLmxEwWKLZ+hrL
	UTjniIw7nQGYb0kiYevRA6S3ln0aVReBFHViUgEUYTpGS1Q1SUwXceYgTNxGrDGtDrUt8zvl93c
	L8hRL1Rj3NKUxeUj6FigTqU5lIpyESH4ci1Gfjzx1S6HTJmQKgA/vJJX/wLAYrcRAyMx32l4IEm
	oZ2LcUD/FO77M4X7BCfx2D0liGVrFbD01X9Agov1a9QiOKY7zmp7qRQTqcHd17LPjXxKIUVkFsM
	1J/vAB9exrrEwH18WYOeShU2PxmND8bs2bHE7WErKuRm93GebKM5m
X-Received: by 2002:a17:902:e80c:b0:2c1:f262:4962 with SMTP id d9443c01a7336-2c664242d9emr117854285ad.20.1781512477201;
        Mon, 15 Jun 2026 01:34:37 -0700 (PDT)
X-Received: by 2002:a17:902:e80c:b0:2c1:f262:4962 with SMTP id d9443c01a7336-2c664242d9emr117853835ad.20.1781512476725;
        Mon, 15 Jun 2026 01:34:36 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c70easm122789235ad.25.2026.06.15.01.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:34:36 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:03:57 +0530
Subject: [PATCH v4 4/6] arm64: dts: qcom: shikra: Add pin configuration for
 mclks
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v4-4-bcb51081735b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512439; l=1517;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=QUAOHVDW4Udars0Jbe5wX7sJIZNINY1ZT2YyhfvvXAY=;
 b=/pRrOKK556VJkn2xvypB+WkA7Q98Cm4fvxRg787rFyzv9ZMhta35uNAd777+FV3JUGfvNTb4L
 we04eBxSkVqARtkFVUcK1QgfUuGB183k11kRiNV/HxlK1R5An9FDIos
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=F8BnsKhN c=1 sm=1 tr=0 ts=6a2fb91e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=hvkXKTiNP6R-ltmIA9UA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 1MHAPGroAsTb8q2wdAE41YXsjnPnx0j7
X-Proofpoint-ORIG-GUID: 1MHAPGroAsTb8q2wdAE41YXsjnPnx0j7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX2b93CnQnj39F
 I+1oykg2BG1t32/iR5WnFflJNN7gWohFhEmkOp3CrAqQWNoUbMUzjwF5fXjNzqyR9ZneDskq4ZG
 ALa5tNxHxyXZt9fMO3AnzGRYwKnfccB0HJRtEGfv+RbSn8JxxqYZVN93p8OvnK9ETcQx/84hQZw
 NGp4XP9M8upXyEZgtxKjVkrtqV0ffH34EIoumFEJ5l+7Ph0relDt0o73r2TmhPJb07MC3NqoDXc
 YbyRmziAqe+KUOBMXo29sjX2bWxY0t0KZFOJfhXkomNb9MpxwXnQ95O6VvXP5E76PO6T01SBJML
 AG+Twm88OFbFVsUfL/2KyJ8cP/J1pX8zTnEr12CgUyV901e+0xmxWnJSHYcS/KslskKGdbngENS
 zb/xQeu1UiSMncO84BvmmvxJfXteqJupWGcAd8fLkOIsf/bh4hIbAbe49tORrf1vnqAulDCq+Co
 OHGD6EQooyrAANLpXuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX+bycMvL+KCPE
 TZ4G3iUuLpkrQO3qjNR4eN57iv/qwuxovaJ56ckrtyz+0rBLQ33TlY4/I8B1k8k0/TupeC8mgJK
 PXJK9BFOPl3PAGir8ejQiIgpZh6c99o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089

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

