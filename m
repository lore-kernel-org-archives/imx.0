Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D3C38424F
	for <imx@lists.linux.dev>; Fri,  8 May 2026 11:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240476; cv=none; b=ZFCdksn2Sx5qPJqfXLYV4/pVBISEQURzLoo3fVsLMVKnUXRjciKailXcI9ldM8ix7LZOqUWTGpm0t/+z3LUwj7gjlXbt/kVODTBXQvASH8WmSoZtRl+VYlfzBtQ04tXQJlRl7mJm7Dn8VfLf3dyJyfQtPdTYL3Ad7SUwMMumSGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240476; c=relaxed/simple;
	bh=UpO0rU0mi9erTIQVebp4pdEk7Xnc5TEa+Cg/sUI09nw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KQsGPQES1EyD0bzWc0gmajCM8ZM2BdYbpi5T2gwpUrGqdJJh4ak2IusppGiiH6c9IEvZeFCjdx2lPmjfhjrpqs2mUX5eDSXM6Hb7yvddaH2WyYxzpXDhOf76dqPUpWu/NR++Xr80cSbkszolq+yg27in5mASgGIA7OSwX3lP72U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FNyOayMQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ScR8tSCb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FNyOayMQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ScR8tSCb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6488Auw72384213
	for <imx@lists.linux.dev>; Fri, 8 May 2026 11:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ghOFHSQuRa6Ho3W8UeptFZ9B3PI3azR3W1imEZjn6dA=; b=FNyOayMQZgekDSWV
	wwu553aUT2EqbAY+oCGT9hGUfsG1DdscEMmYi/ew6eTYyRF9kEiHGev+XaUfYxwc
	9mZXX6ICNv8w+crVOl3XUK2WIw4rZhEcSe02aCLdbdeTQ6BHp8D3pJcUCMWRgtP1
	UIuXmEoKk856ccQtD9SeT6FsRoO7I0i5zA5Y50IqDh40Cmo/3YY9eaDkZDToOL7I
	7yES11RmInFD4u58t06y49/i59R4ch8JqIubO1Wh9KY62EfJ1OCxLBpzLEeQqhGu
	0X7VwUtxmMNSkSBWkrrFuaHNSkTHzQnn+jQjZaas3JD6TX3spymmAWDN17K85uB+
	B8DX0g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0wwukwg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 08 May 2026 11:41:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ee9a11aa75so429429385a.2
        for <imx@lists.linux.dev>; Fri, 08 May 2026 04:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240474; x=1778845274; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ghOFHSQuRa6Ho3W8UeptFZ9B3PI3azR3W1imEZjn6dA=;
        b=ScR8tSCbU5+XFQPk9zMy2YrI0A620KWAVgHddW+IizWjV4iThZnb2WytoEVLxL5BQ8
         uHRw6/3D5HYePsybrjUg8v3V7YXT4qeW3R0jpSrudDDqigwRJtXxaLn5P0S9cfkyrptV
         dokRt6Ae7IIWuY7FqMdpFF7+tQKnGFfHQAh0jXiwipkUfZE8X/bLJzsxKKm5SWq1aEV+
         /sc1/Bme96MUCbG1MUFBtMrygA6x4QaMbWcqCYXTP29XTW+26nklSpN3Bm2MBA2574Ib
         yGK9nXYBWInq0E34dEHBwKh017/Rf5m0xCZ9VCUoiq782F8nHcQeZqF2XRu7e7TO1g6m
         augw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240474; x=1778845274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ghOFHSQuRa6Ho3W8UeptFZ9B3PI3azR3W1imEZjn6dA=;
        b=a79HY8nUl18WS2oO10J28GBTHr2WLCbQWVGTNUeqfP4o/4Z9u7vtaCJKdUiGYQbHVk
         q9MZ6P5SgAOhG7Xds8cE31sk+ovy3KNTjCOf3ecnoWEIHiB2SP9P8XH9CxABRk5uQ87A
         ByPF3ExqiQq5FsbnIxEGFkX4pdeUIg9ikZ7yyTqUo/yaon95I9dngriLARWj7Nsjswaj
         uo9bQRFlun+IQSUIO2+qlbtX38sJzkKRGAZgNzYc4bFFfcWGEvChedLP06Xm8d0F5xQZ
         7XsKhJqntXgUvXy7p+HEHE0hUFDeiYz8o6h9/hKioCeIZkZylgsk5ykQqGd43dgKWyi5
         qLGg==
X-Forwarded-Encrypted: i=1; AFNElJ/FlyWXWlPt7f42UeZDKLY1AfLKXOTOoHTqUhlJXnKrJ/++mk4phJ4Z37CfkU/lQxSZcVE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6zx9H1A274tgUY3eeDil+44koRLowRTXPnMCNXIEWh/4ttzo1
	ZXWp4eqzkrn55mClDhGk5KZeR72poDCq4WFJteQ4MFJNtYq/Dsop21l4Wznu/HbN0OY73bC136m
	x0LdTbBsXjmicBzzhAW+kkoIbL3KJfavfHGD5+XZl6f1ebvCf5PEdWuE=
X-Gm-Gg: AeBDiet31oBB8eOk+ASR4JbeKyBAUjt4XlwIRAiM/hq+v1NR+VRIQN1ChAMv77N1wtY
	sXtBzgBVGqJU9U+RpD1SpEmNAgxjuuuOE00eh5b5EIrue1QEG791QCJ8Fyqiq+rI2vgxUjJynv0
	ZjmjVX9WRw12gBreWVpQE0Qe2xxH4L5HJU9mQqqGmrMU8b1WSQ3GpjXlB9iepVuNHzQwE12sC45
	ZJV1as98muOd4wl2jnHZAcHk1yf2ZN3bUdCgHTcfcDTx22CkxSjlpoutHw0vgNI1Y9fIMonjXj0
	TP2UBgn1kymmJzofsUoUzR+9r0Ekf85XbQCm509aAXXr1LIUVSTlPe0qSY9w8HL9XWTb0hEzJeb
	oggoalo0Af7TcnuX/ljmHhAeSkCzXh6hC4N5AmZ82SGiP9RkrHEHDlnrjf+xwsA2lwVta2rY2yY
	1BTGI+n26+t34H
X-Received: by 2002:a05:620a:f06:b0:8ef:b8ea:ef21 with SMTP id af79cd13be357-907bbcb5509mr301027685a.55.1778240473830;
        Fri, 08 May 2026 04:41:13 -0700 (PDT)
X-Received: by 2002:a05:620a:f06:b0:8ef:b8ea:ef21 with SMTP id af79cd13be357-907bbcb5509mr301023985a.55.1778240473393;
        Fri, 08 May 2026 04:41:13 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:12 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:39:58 +0800
Subject: [PATCH v2 2/7] dt-bindings: media: qcom: x1e80100-camss: drop src
 clock
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-2-3ebdca3e4ae2@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=1837;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=UpO0rU0mi9erTIQVebp4pdEk7Xnc5TEa+Cg/sUI09nw=;
 b=1N5m7IXU4vcqQJsxsnYsp0BMpMjLjRx9B4fnHZosjGScLcw5C0SgfrQ/U1KxDULZ1OQulzVc8
 1guV2e05li3BYyqi9EsJrtel3LOtrNg7iR+Lh3fDZ3JiPLyMK1MR64f
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: 02qCTqrWgfTLEQdGx83fVpqAXPB2XaCd
X-Authority-Analysis: v=2.4 cv=Nd/WEWD4 c=1 sm=1 tr=0 ts=69fdcbda cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=5wa7HSqufaon_BCSTwQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMCBTYWx0ZWRfXwk6/sSu2GI9w
 +A+iNAJwMxZU8zbbJlkQP4moRsR/WRntFrv/Q3QbTobm5CO8yQ5XkPLNhiV9jSBsT4eORmQF6LT
 hLidx0yOnBjo0qS+TPQZRGKoJDQSANXtgFjCYdj2mL2OU31q9rY2TxJNEVw6kramyiVYea0SbXO
 rxHwwzAiWD82ZtC89/AMiLOtvgxZ2XiZv7jh1rSdQHKDTQtZP0uBF+rT27s+unf9ZC8FKzvdwjR
 gtDtWlGjI2ZCwxKqgWOsPLNrI0HL3kZgbSwJN3qYzKGekmF3LSMrc1jrub5Hx89l7M8K0i+t0Vp
 BHDHtKWpow+ysZ91ck4gLsgm2eDSfHZnPuIKXmJGzWCJX+1m04zQrDW19TO+Fpg1Th6EQ0gOvfL
 lbwBawzY9I9oL5RR8RkC8WZMnAjKebih8KvcM4YC8I56vdoipkoQGgjsUflDagNhwoSOPJlIm+B
 HEE45D1Ly0uar21X9ZA==
X-Proofpoint-GUID: 02qCTqrWgfTLEQdGx83fVpqAXPB2XaCd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080120

The src clocks are always-on parent clocks and do not need to be
explicitly listed for CAMSS consumers. Drop cphy rx src clk.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 126400772d028811c9efbb1443144ff4f264fcad..afb659b6105f018214a5eaac4dea7fd51c0d42bc 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -40,7 +40,7 @@ properties:
       - const: vfe_lite1
 
   clocks:
-    maxItems: 29
+    maxItems: 28
 
   clock-names:
     items:
@@ -52,7 +52,6 @@ properties:
       - const: cpas_vfe0
       - const: cpas_vfe1
       - const: cpas_vfe_lite
-      - const: cphy_rx_clk_src
       - const: csid
       - const: csid_csiphy_rx
       - const: csiphy0
@@ -252,7 +251,6 @@ examples:
                      <&camcc CAM_CC_CPAS_IFE_0_CLK>,
                      <&camcc CAM_CC_CPAS_IFE_1_CLK>,
                      <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
-                     <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
                      <&camcc CAM_CC_CSID_CLK>,
                      <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
                      <&camcc CAM_CC_CSIPHY0_CLK>,
@@ -282,7 +280,6 @@ examples:
                           "cpas_vfe0",
                           "cpas_vfe1",
                           "cpas_vfe_lite",
-                          "cphy_rx_clk_src",
                           "csid",
                           "csid_csiphy_rx",
                           "csiphy0",

-- 
2.34.1

