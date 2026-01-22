Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2B842669B
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769078996; cv=none; b=kT6Ahl0DZDJ8t1k2FNJtRaLhkWEXlCz4LGYXH3yAz0KxUvBKvYDTBMCMTLWyjcBFC9Nw5sWY8SiB/sPwMV38GSfl2uzpOuSUlalit+30vPC7JGOJjTWV369OAI+wixVroMW2eEZpwmzE2G8q33xYKvptTVkJ+PzViGgLwjDQ7GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769078996; c=relaxed/simple;
	bh=B5r+Yo/9SDYaZ8RGuV/vWORvd/4+ohBj6uYfAX9/P04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DhjxoBux4zxXrE1enXVbfbOrJRuLlIXN2vLtzU3Gag4reKvigawchzap+jVm09t/vukZ0dyBKcHLCFVMiy+FB4hEqSM/FNQP2udx4CZdf9yWLQD3oMarnyCKMFphtZoyO8gVWwtvtC+pqXzk6+NPE19Wrw6KUqhNwZ4zshEC1TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gm/or7ba; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WGTqz/gL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gm/or7ba";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WGTqz/gL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M7rAam2275478
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eaVvPdxctaVfym/v4SBx0duzy99NPGMCqQ97rGguHm0=; b=gm/or7banhIUobRb
	Y6U5/fD5tQyaKKoOKNDIikR9TuSeUcdS5/zEsW4Cg4AONlMgCGCT2Iuw3WOMyx3Z
	EYzP1GYMysOjd4njJpv14m1U1Wur6HCgurSIji9cMS6BC0D7y5lzWyG8pkfd4Sf4
	NN5jbdbEb4Clfqc07BxewBRNT3UCDH06ZcmAlAmshlhVlGGBWUKMX2xzq6r7lgzQ
	SaMsnj3AYr33shWK+6JbuWOd+VOvxqRUvQ4UeKfbL5qv/eH2LgeDN+3OeXcHmi5u
	GRCsehfWzXc53zzUXVIvXRsMuzIeAerg1Bt0paTLWBIDGd3PmTWQQVOa2hoocwrD
	NbBl4g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7fat0rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:49:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a241b5cdso138318385a.1
        for <imx@lists.linux.dev>; Thu, 22 Jan 2026 02:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769078993; x=1769683793; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaVvPdxctaVfym/v4SBx0duzy99NPGMCqQ97rGguHm0=;
        b=WGTqz/gLPCTE7bbyA0wbJ751Igu+m50B6KK3LRKEbe62qQpENIZJuc8BrsBzSRAisy
         KdC0daRtlIORR9fKmpAI6IQqd/Osjj8JXDiAYC7uHiDFKi2egeHzjwQCtti/0RsAirwG
         XaoU98FAylROVwJ3fyMeMp0u4in0O0G0KAi5lfKiCjLBDMbmMmPmwdo+y2cOJT4xRKxL
         UJ5EGdz3W9gGAK3CLZZsFrwqM3ceBTu02+Qe9/tgcMUGJ3wt+Lf3pFCF7dIM/XkKGwsc
         eOy3g7DKEFQqviTabo6BBcTxwvarlcfsUxQbVZ2JY1z8WLEdzSoxRYUbLI8ds0xja161
         0i5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078993; x=1769683793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eaVvPdxctaVfym/v4SBx0duzy99NPGMCqQ97rGguHm0=;
        b=FAL7gGIX8RNZCALRCTDH2zbXTAUpk3dpOZAERHDbmJcsuAqT4kbmo5fHcuIoNmChiT
         OlvMgsnciGm+iOHagEApPURex+BdNRB+r0w1jcYpRhzVs86s2iTqDWfVHFydcF6xHd7W
         /x3cuUXVFN1+9uR+YWllUoQtrBBKnh91dVN5v11OeorrFnMl7hOxw8sIt3eXnzjSNnM0
         5MsmmV7CbNZXU6MkA9SH1C31ZllHciJHPfMowNSzdk5bAFP0BAF1twecFxh/+VsCAe4t
         dwIG5ideAuypX/Lzl2xKp51/jrG1S48bHE+TRBdcR08q5Kd85uYu/IVS970ALg4G9Hsh
         a3Sg==
X-Forwarded-Encrypted: i=1; AJvYcCV4r3GmRcdSqhQ8h0WbSSjpFAKpAy6UmDuYUQsFz6OGVNMsTJOFvEynpecWh7u041nHtuU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7OsW8qDI8k9BU3tBuGfVJW0Xb9ao0gkOwO+znTzMMVto1TKHc
	5Ula1MfWdNuXDjN/qxl52TjdzwWWWUqF+Ccrc6vRRvHYN+7v1PEP9dQ4FVEPlAxQyW+rmUw6zyt
	iWerpeGxdQw6f2czbsWKfmFHnyEJjAJzoL/o4BfWfm9I579T3+drZL74=
X-Gm-Gg: AZuq6aIEXSRzaDMNf5Bh5UUoRRLFbQ2/fooWwI0MjwTKLVzC1URqY6jPGdsAxrvHGWO
	TMiM2BxN7Hv8COpG64ub1XmrGwYmup4txiW1XFLZxRUnYi4cv3GPNgEwlJFmLcoHrEDWLiqXh3j
	os6gscQ2o5sUlJjWE9nT1OjFfGaT4rlomMc9ZGBX/6vq76rt8uOd+lA/MqJWx5SfIOzBBNJ4w+l
	3PWFSRMwb/mfS8Djq77Hcl4X4U20XshBW8XBwntPZIw8Y+4WrAsLnVL7alC1qjVzkWX5pUnp9G8
	v0HUdiN6UIeJIPX3iYcDshLzX15AoNJXajg9cAr8NddGpcOJEo+zIbrNmIFl+fWXYdzTbJp+uxq
	AM/8AfLFdj+q2cRXMERcyTbu/+SFQL2tMVuRw8hFGLAtGN2AsaMxXY/QUMfoVD7FrmmIe0lK8S0
	0z
X-Received: by 2002:a05:620a:4081:b0:8a2:ee8:e7cc with SMTP id af79cd13be357-8c6a66c8477mr2937672585a.5.1769078992850;
        Thu, 22 Jan 2026 02:49:52 -0800 (PST)
X-Received: by 2002:a05:620a:4081:b0:8a2:ee8:e7cc with SMTP id af79cd13be357-8c6a66c8477mr2937669385a.5.1769078992452;
        Thu, 22 Jan 2026 02:49:52 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d9ee19sm121704901cf.14.2026.01.22.02.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:49:51 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:48:53 +0800
Subject: [PATCH v5 2/5] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sm6150_evk-v5-2-039b170450a3@oss.qualcomm.com>
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
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078967; l=1158;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=B5r+Yo/9SDYaZ8RGuV/vWORvd/4+ohBj6uYfAX9/P04=;
 b=avAvsXrSsBDrajbBbVZwDtpKrzztRYABQg9Drw+sLt8tWOBjUKXYhyJd0Aj5Lwaih2O4gak5g
 XLgbYhMHt2gC2zhOC+GhVdTii6z7WSaE9dVle2ZyLXVggnaU0ACmWXT
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=Hrx72kTS c=1 sm=1 tr=0 ts=697200d1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=MV-VTd0to6NmDFHxSyAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NyBTYWx0ZWRfX1x2FphgYbsKy
 KkgpyceMd/CGXG2GdfJgdkbHNiFyhSHXG+V9BbTOjNps39M7lU/oGrAH2mbuT07VhSMicRfdM7d
 MpGoWENX43lTi7XvDVs5p4g7a1wm0yzLGWFxrRy6Ftpn/Z2LOb2AjvtHitfq4/b5X9GKPmMac1p
 LCdqFzjBlNJGe/t4X8e2n1CYkmwhOOaveOHmEhVMmIOh68u0rX9HaV/9f+n1IisMUTB4PoaO84f
 rHyH/sGphhnBy4WjKQT7c6BfkWFZwtC5tHmmCiHB7EKOZj72zCNvzdPdvNqcITeFuIZZ/2+kKrd
 omb4O9bcWgLmDWgevC68WZjlPgKiGLfYbXqam9fZ4L4U6lBwWeRVeKl55nzPwKNZdQRIfQkJH8K
 9GaV2b2idDmpPvj7wAMO1dgAVdAod95i5IiTRIhfI0DjT9EITKbl9Kok4liW+t3+aVSVXLA+jux
 qDbHXvArwrUgfzITTgA==
X-Proofpoint-ORIG-GUID: Fs5YYQQY7Y85ih5-pWpLGXiJ2KTQOdoT
X-Proofpoint-GUID: Fs5YYQQY7Y85ih5-pWpLGXiJ2KTQOdoT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220077

Add the sm6150 CCI device string compatible.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..d3f87da54fcc14a8f808f34c94551583d8deaabc 100644
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
@@ -249,6 +250,7 @@ allOf:
           contains:
             enum:
               - qcom,sa8775p-cci
+              - qcom,sm6150-cci
               - qcom,sm8550-cci
               - qcom,sm8650-cci
               - qcom,x1e80100-cci

-- 
2.34.1

