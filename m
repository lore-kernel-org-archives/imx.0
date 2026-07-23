Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B3239182C
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 04:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784781875; cv=none; b=pOaLxBDllU9mKrfU+JKqmdomD1Bi9Qh0MXmWKieJ1kFNPhikQOk9JF8dShkZ9/KqSxx3PPcSYp0zBwHvP/DX4CfXviUuc3blrQb9VTcvVDs8k4/lnO3cvh2yrXNz1aJetCBErV7BZPVw/IioE79wbnLdif24n/XDnPiNXpkKZKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784781875; c=relaxed/simple;
	bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gv4xYKaFBeT6Ybo+FMLRhnGpDQGzNMCYYXq8cu7av0B3Eh3S+o0iYUkVaJPxh5rafEpPlPBEhbSHsbJZvXLZGvjQq/Ps8G34zgqHKg0FoTlRNc03qgA5QOhHxbTGlvaaiMEnUETWgMuDcnM9hPwIXn+9iou48xX1Mn3SpFskdWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KmEayScr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B1RmpPH+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KmEayScr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B1RmpPH+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0WwDn2477612
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 04:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=; b=KmEayScrLrlkDk2L
	8TEFVvYxrvJmEBp01zyrP3qLf6KDGLpJJtb7jUzpdVqnRdcWyRDVoQpH2/9W8ew0
	jmwCis45gvpZAkqnnG1MBYB7yyEWnQi2tGh/rykWMnblOa1cEPR7ZgJvV4A9N67d
	g63QJBfhdNe2AkJ1pj+ldiYIq9JQYi73Ioy+5HCJMMYUy+ZgbftDkMlUutkB8UBr
	uuSCNKupRYZU2me+UDKVMpfiqNGoYzJZIvS3XBD6mJmzUXqL/2nClbv+S9uqSRCE
	WC9kvPwnud2z5CHOWEBm407rXYmLT23UFS3DvYLkv71JDm5ZTofgRcDrG1nyKnzb
	uZBu2w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjuu7c3qu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 04:44:16 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8484f26852dso259969b3a.1
        for <imx@lists.linux.dev>; Wed, 22 Jul 2026 21:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784781855; x=1785386655; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=B1RmpPH+Da82f0RYU2ciqpSoSNlxq95xhxR81kndMf38dcfYy4AK6bdZUBok9CuoFL
         Alv/EIppvnRD6GzZSW59CumBEFrhFfcklZrOdl+VUDi2Qu9Uw4XVQrH8Zn/SGwNOGk29
         xk6XY0J42WUK+KWQ00zN2yfk4ofv9xUo9zq+7sXWPAOB4fK8LzWyItBctirx7TelR0dF
         ey59RVUYFhsPUU/Qd5BYJiVjUTS2USh9n8GkjKIdyfM/N+5q+PrGzgthqUIAsLVPxk3g
         /YGCiKJ4+BdoYAn/xhgEnZoaGMqv1OI0jad+ZelVcvqaYZ9ZHxnPtqNwdV7/s9K2neUj
         YcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784781855; x=1785386655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=qNJgT42Kvfslzt4UTBD3mAImpUjm8Jmcc+FIJdoOpQzCk0XghLTBR9rvoj3hMy8tDH
         C3oCYLwKw4MkAoIYVsy0GHbvuJhpy7PbthigwsOXzKX+//kbTDLax7Tg4y+mmQh7gHqF
         xP+0NS/rTUAWi3AkWKKxVUxquf0Aio0xV/NanUm8N7QGzsl+6YIxMtL8p4zSxgACLNYp
         o9lTN0Pgt/iziFmnqVtde9fksERGU6nqvoEPKWYzNbUU0tVX722XJGHM7z7QSdKmXdtV
         C9nlf+lEU9O6DZr1SH4Jt0VxidvClnRsEMSrRj0yHcRUVTBtGGOm9zBBfLqPf4ABkH8p
         I+3A==
X-Forwarded-Encrypted: i=1; AHgh+RpuCeSinyObdsPbhFbhGV1yBoRBSKJwsn3WPqSVwEKpSG3vZ/uyxXpsiuTcTczZeNtzF24=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmnK1p1vQ/TaGYqOLjP1dMsMNZMQh54X0FnrPDI4Td6nIUwHde
	S5Gll8GuSfhV7+Pnys5ZiMKfxTTqNyUJQRKvJXQBSN8M5jdRa0MQdPNydXsZj2sbl/HwGuYEvW6
	Y+tzbVP84pwrAFKZ3Um/j/PIA6hv1VetXGPc1Umy9GKpthzFy77shEMw=
X-Gm-Gg: AR+sD13ELsj6JpVuhNVNbUiE+3frNU3eu6RPVPrjAOgaa1pi2hDakUVrJ4jmRA+42sv
	/9JFvc52Qhfx6BJlwCrtce65Hsyc9y/jHsmhed3ZSt+P9/SSeVar/cNKr7Lktk7QESzgSQoYLoe
	ZNFic4RvXeOSTbYbpk9Xb5Vw8CC98ruuPbvSyMTalZ3QCe/qwg9Fv4YuLc5RqOEMnh/neDX7oTN
	g96tamyqg/koS1Uqc/NCkHxPD9VROxMsRMtKniLIdRl7I7emjM376U6d/IaAuGa/Y4t4z4zREfd
	+us1SXuU6BV1h1cz3lk0Ps0tU4u+r8+ebZNNXZ6Hnt99Rst/r0ltNEextxY/fEzd0Cqr03qJPOk
	60PoyJHKE6thviqEX3Ct3/Va+tmY32vo=
X-Received: by 2002:a05:6a00:a20c:b0:848:2f74:1d66 with SMTP id d2e1a72fcca58-84e2bc191b4mr1845640b3a.76.1784781855233;
        Wed, 22 Jul 2026 21:44:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:a20c:b0:848:2f74:1d66 with SMTP id d2e1a72fcca58-84e2bc191b4mr1845596b3a.76.1784781854753;
        Wed, 22 Jul 2026 21:44:14 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175aad1asm2327922b3a.44.2026.07.22.21.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:44:14 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 10:13:55 +0530
Subject: [PATCH v6 1/6] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-shikra-camss-review-v6-1-7c46f9bbb4db@oss.qualcomm.com>
References: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
In-Reply-To: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
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
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784781838; l=1799;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
 b=2a+i34b6L4suWBSaj65sVWFwqZeY1Qa0wKJ5bBToRjvGqa9hw98ZhfM8ZuXl1Ob00IrzH4lN6
 J3e8fg1VKtMCUmyvsCfYDSwHZToBmpyFnHVGTdq0GdZOqLeO8ZCSReU
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: uYUIiYSW3vUDmcHQGCwWYTIOtNgODBj9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfXz4tqHZlwZNDH
 6SaHz0xHuqwdBP1KZu+MihnxAW3diJqWzezaZVue6VWmq8RaWg4EAVM0ukWjxHYEU/hI52tiMZW
 4xF/bMQm6T21CeNgayL132qz7t1DfRY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfXyEhrdxVjXNnS
 EiCTGx3ojTkN4Ul7YtQ9iVSVwjhulSo0sqc/scFqGR6ENECSxZuvTKsgehdNGV6q3XN/1pBRqMj
 6WaiemO3kDWXvC1PRLnkkd12IxPQpYOlTwnB8ths0IltGMZ7bx9jzw09eSvfCwxHP5RIbXm59xm
 XXqNg6ocAK9D2uTN0d6A/fTrL9sqA1TzNaXBvjmuSCkmu5qkXKM4OZ7bG3xn/cB+dvgj/xjjx2v
 Ohqg1LsIEUTAMP1dkVaTLlqcZ4i23HbCR8i8hdzOM1T90h+RTG8D336jFSdJ/qO/rLA5iUJNFqa
 +1tgi4yyIJE8c1dDm/8VTxmX1Xt0+akpvXtGAOivSuvHjfn+GQpUdSrVXfOGqgnHbu1BlrIhGc3
 2g1gjqLXljLfHkfVjMvFcCuZpKHBu7nipPn5rWljesARu45fYEe5xVIfVV2Qj36lEowjSjcYWvS
 0cITMSVWAJeuREKTJ/Q==
X-Proofpoint-GUID: uYUIiYSW3vUDmcHQGCwWYTIOtNgODBj9
X-Authority-Analysis: v=2.4 cv=JuTBas4C c=1 sm=1 tr=0 ts=6a619c20 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230045

Shikra contains the same Camera Subsystem IP as QCM2290. Document the
platform-specific compatible string, using qcom,qcm2290-camss as
fallback.

Unlike QCM2290, Shikra omits the CDM and OPE blocks, requiring only a
single IOMMU context bank instead of four.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss.yaml     | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
index 391d0f6f67ef5fdfea31dd3683477561516b1556..490a7f3a8c5ff9c624f46150ee651793811823de 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -14,7 +14,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss
+          - const: qcom,qcm2290-camss
+      - const: qcom,qcm2290-camss
 
   reg:
     maxItems: 9
@@ -76,7 +80,14 @@ properties:
       - const: sf_mnoc
 
   iommus:
-    maxItems: 4
+    oneOf:
+      - items:
+          - description: S1 HLOS VFE non-protected (VFE only)
+      - items:
+          - description: S1 HLOS VFE non-protected
+          - description: S1 HLOS CDM non-protected
+          - description: S1 HLOS OPE read non-protected
+          - description: S1 HLOS OPE write non-protected
 
   power-domains:
     items:

-- 
2.34.1

