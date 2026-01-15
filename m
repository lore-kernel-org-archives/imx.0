Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03491D8E10
	for <imx@lists.linux.dev>; Thu, 15 Jan 2026 10:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768472009; cv=none; b=JbDNCdxBAkZoF4S3dI5CvYsScxReTn95kR2Ibmr2KQqx4LG9JQOLIYsXLotNGKwlq7oFAldbho0QIQe4/Dvn79A2+oE45ABEsMk2imKGTssJiblRVSe/80VVu/B3Ec2ba7OMB7e1fuNHxU5nZIIQ3rCLLpWesjUDZS3xc7P6eMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768472009; c=relaxed/simple;
	bh=M5+8O8yCjRisazGnwCs6jTZ5OFgWEq0sYZmbzH3kaMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sy0zLh2maOKwqXgYwyTKMwQpRgwTrOEDzp381Exvgp9tNcZKRmDXrh4/xDL7s+WicfGZuaPTFmL5EDJty7Fm94Oam/qFIX5hmMBOexVyRhIGrEOASQfiNz1cOBWxuaoK0nozfbIDVb3HhU1RuwQ+ssXKu02FMqKAyyhAM4MVmaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OaN9SmJ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZjxWOiQ4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OaN9SmJ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZjxWOiQ4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6gIOq1172623
	for <imx@lists.linux.dev>; Thu, 15 Jan 2026 10:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CwFjJp0lmv+laEGzitcJx/xcZfSaGwmjovEDoGkonx4=; b=OaN9SmJ/H3lNT0zQ
	yhAHmML/R7Yq/CEZIqgCDd6z9zQU69N7vXY4n0mPIz4gmCKrmFRIYlDS0okxda0h
	A1i3HKy1N94em79UsG5l0/jye9qOWs4fTun2HmFdk2HzL3FwrbMVvFTxQpSx5YbR
	hpY/fIMQHGH1hktqqzkR+zENDMFa319bxJiSEPMiR+lFRysxbKznYPKnkfRRMow0
	bbDDHtlTlIPD+i+AwdA7yXBOhr4r38laM+b2M4Qch9m2BJsJV3UpceAyHavcjBgG
	KOi3kD8iHnSSzIOTu0Yiptr9DBCN7TMV0BIRgXoLDLdaR9gsJ6v7aNp6BuW+2xOa
	9nAISA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpg84ah3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 15 Jan 2026 10:13:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5029b0c3786so8048591cf.3
        for <imx@lists.linux.dev>; Thu, 15 Jan 2026 02:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768472000; x=1769076800; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CwFjJp0lmv+laEGzitcJx/xcZfSaGwmjovEDoGkonx4=;
        b=ZjxWOiQ4vwmpXtkVI/+zeAaq0dtHxF9WNGDJ1evElkaRo4t81LGq4kTcAuXYUNh1R0
         ivvnBVAEocBrZ8Iyhnj0VggNShbxdTyQWxSKAiS+q5mLZHDEWNxt3YkmQo7GXnDgoc9m
         9EnEbWqQ4VEescCXlabndgHi/HRLikUVIv/eQ+vJ2JLk9TbnofLS5n9uz33ae5uiFoHQ
         zSPsj1VAgRu3dIfGO2R+jzzgS3NWfZlsUvp7jzrUgfBYdtGixHcmnxmBgYWR2ai9eVdD
         m+7cr1nrgzIef+2menEYBYTsE/B2hxAbvi8zgS0WULFHFcGFzq1PUUmLRo+XxIPDwQaz
         CB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472000; x=1769076800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CwFjJp0lmv+laEGzitcJx/xcZfSaGwmjovEDoGkonx4=;
        b=ALZE5HudbOt6f5d04cSVCfcEpyuM3yIbssXeEr2TS0zAMgMZ5VDtdTVT0KrKE2LOO0
         DOcl+dtLpa357JSt5D8TecpP9Yvj2p2Z2ywGTRbJ4cRA/TuefimPFfYm2cVymkO7j+m7
         tZ8KzXGmdfytsbxEiPlNctJsp+Ngo9P/3J3JujcKrbzdexWzmU+e3uRM2VIUSDF5UJBH
         OAXwXcbBVzB/sD7UKWM7kmI1uvzAqFuxlG0Hr4d/mVhVbSv91u4gyooxVYyZ3UerZ8+n
         i8+jdmejSOK7SlsqpCQ4XOX4Q/1yo0q3xfbnQUZs+Sf6SSoVZA7TahQEqkg5t/gdo97Y
         /ctA==
X-Forwarded-Encrypted: i=1; AJvYcCX1esMbvrue+ntZBhxvzsfvrExgabxGFF6gIVQ0OdEnvffD7uezkjFTCH1dda2kdjJoJBY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzdh0PZ2BQTVoMKj0Hsnxqtllkjk6nbr/KMPPa2HWpSfPc54OW+
	RjA3cDf2Jw/nABjlt5ZMkm7Y2PXi95rubDZ6fCgt6cZB3MnUo5pUGOB+TvvQ7rpapNROh/nXfaF
	VPHl9YqR8pB67oxcgqrU1V9JMXDqY4utLITIo/f8i26Jx2VKhYkuHymloNjdeZX4=
X-Gm-Gg: AY/fxX7Fm9oN1/0fEobvN4pbOmQlwVXYLSHp0kviHreZQoYE3iJAWIyIcX03kpkXus4
	Iss/ufJzZZknwRMgkMuEuIk2F2iKGGjzOHh269h7TyT5+YMwVtxAB4KsL15giz/gf2AAP0tvR5A
	HH2UGu233ZN3tW226CHypSVJL/dqiJVFynNXPwtTfhT/ie7CZoqT0FnvHZWqsCotvW1UlMIGnFm
	6vssALcO1P5WSrNAfELJBjog1efi8i1M+mrvfSwS9zR/QDQY4kZ5v8ZKv+vkZqt6Up2gPRFe2BL
	04e3lAHCB1hIp9B5H9hzcgtsj/Kz4oUtPQ1PUvuHX1vquvsw2sin3kyD7Wfi5gSyVL6kdJHe08B
	VzwFKWVBB7HlR1nc6Ky8xgeTTYP9dmxQRJNueALvRFaIWxC80ZcXaCCTO+y+nY2FA2zyhhJP1Hp
	jv
X-Received: by 2002:a05:622a:53c4:b0:4ff:c0da:5a06 with SMTP id d75a77b69052e-5014a91902fmr72422871cf.20.1768472000269;
        Thu, 15 Jan 2026 02:13:20 -0800 (PST)
X-Received: by 2002:a05:622a:53c4:b0:4ff:c0da:5a06 with SMTP id d75a77b69052e-5014a91902fmr72422511cf.20.1768471999685;
        Thu, 15 Jan 2026 02:13:19 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772340b9sm199959576d6.26.2026.01.15.02.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:13:19 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 18:12:38 +0800
Subject: [PATCH v3 2/5] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-sm6150_evk-v3-2-81526dd15543@oss.qualcomm.com>
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
In-Reply-To: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
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
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768471975; l=1602;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=M5+8O8yCjRisazGnwCs6jTZ5OFgWEq0sYZmbzH3kaMA=;
 b=mcgnYzGzT8fjH70t6p9m5FammsN5vwFrN1bKnlE1VUTzkmRGRIeI71ZRJ0Wmbd6DwFqy10lqm
 byH7WP7ANBsDw1LBOx5pl0N8vq8ioDboHxN1RFC+BWUikx2yvoJRpdj
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA3MyBTYWx0ZWRfXxe0VhqfKd8J9
 Dnt0RL0MQSQ6+L68o673PuWLZbUd26CvnuPYmrgohbEw5Fur9P+CvvWH9ZP/s7BpouShOUj8+ra
 Enj0Uo96P4oekPTBN5pBczLNojQ/+u/DlCkmZEeaZXWor/25ociiuRRlLxgngAbdcSqNc6gsYUh
 KVziN7HN8hR7bolIbXKjkQkoTrb6snJddGeOzm+wGhM1Zsn3AYMrQLnqygE/z+NZearLCAUirNh
 wp/x1fxpn6KkbKlJG5Gr++jpAzyoRx8Sv1fQOOpwY/396wahGay8Nv3g5QNvG3JKy9GGXOpwH3r
 ECneXqfgh9Q/LLxQOxFnDiri8YRkLc5iSJ41m/GHN+Qm0rjhNw3Anb/ESy9p/9RIFBhOBqt43b9
 I/sl5qU8guIWcpz7UOGGPYAMaauwzF2PkJgP0EMS8jFw+iMLvr0lgybxGGkA3ehUrA3sX9gBON7
 uhuBaKIaDS9bGd+p+8g==
X-Authority-Analysis: v=2.4 cv=IO8PywvG c=1 sm=1 tr=0 ts=6968bdc1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=E-b4n2RehmlEprTZI_0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Eojszn7djOCd6btCEy6pih2ZmnJ_NRSl
X-Proofpoint-ORIG-GUID: Eojszn7djOCd6btCEy6pih2ZmnJ_NRSl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150073

Add the sm6150 CCI device string compatible.

SM6150 include three clock:
bus: Bus clock responsible for data transfer.
iface: Interface clock responsible for register read and write.
cci: Clock for CCI core operations.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..3472670fdc908ef8f3b3afc68ff437c0435b69a7 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -33,6 +33,7 @@ properties:
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
               - qcom,sdm845-cci
+              - qcom,sm6150-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
               - qcom,sm8450-cci
@@ -263,6 +264,23 @@ allOf:
             - const: cpas_ahb
             - const: cci
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm6150-cci
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: bus
+            - const: iface
+            - const: cci
+
 additionalProperties: false
 
 examples:

-- 
2.34.1

