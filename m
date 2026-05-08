Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5933976A9
	for <imx@lists.linux.dev>; Fri,  8 May 2026 11:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240470; cv=none; b=EBUkGT2ELHMtqw2xEMknrS4B0j4ydrdkkC0PInhy9H5QfN4LfsupnW6THgwoWaBPiHNUpDg3w5bKRWczffJYZN9er/swrxCsCfVYdNFhjjQIENG2ShyXl1eSCLxZulKAGNxm9MGNPTCApjOjo9T3dIVztzCVDXf9JbjNWzd6uSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240470; c=relaxed/simple;
	bh=wL+PFPuEZjGfoGr6iw7QtFmEgPFcLQXjULTTfexQiWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gkj/Hgb0tiAStCq3sbwQAVyEECZxUvqccSQ7GIzr4ZRh9ID5xbMceyKNokQwy16tVJS79wRnO+OOPW9IvX8uX0PAOgQ3izb3IGxBIigYCUBOdGuh361Ca6e9cHjEDEVndryRKGxaZPPw9dEve/HE4a+Dqd3u0HFVa+jkiA2hjK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WM8N0uOx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fuqIdreu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WM8N0uOx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fuqIdreu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648AKF2S2532163
	for <imx@lists.linux.dev>; Fri, 8 May 2026 11:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2QMZfo5GvIx279y7myj/MFns4ZF9kvnCOIi7ZALa51o=; b=WM8N0uOxtF7HrAkU
	77MJPHEkWvD5zCcGnwNlz3B7OvgUokhAQXyQHbdJcRXLiTru2CRxt0DxVkLgO+Xu
	KpCiSKGm1hhTUiSa95H8c8OgFTHVLsxSYpl1LHIRVm94OjAUEaOo7RYxBK/Hv9LL
	l0rbTercJYh3aodq2wgawgW6argjLv+DswbeVxdW1Z2oeacOjXnGkH8M6pj+q1MM
	sjXpjd1s0ytLk0RjDxEYIFi/y7xcl/EEDnbxXEqFPlVxRkFqbFmIrIdFMT8HxzLN
	tXBIwvOlZr7CGxrzktnWqMSQbmAA99tyG9NyUJRUt01bxi/hX64nVLF9MWiDC+Vi
	3NlSmw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10m9u6uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 08 May 2026 11:41:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ebc7ea2402so362933085a.0
        for <imx@lists.linux.dev>; Fri, 08 May 2026 04:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240467; x=1778845267; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2QMZfo5GvIx279y7myj/MFns4ZF9kvnCOIi7ZALa51o=;
        b=fuqIdreuATpRt3S9Zkv7b4hoNfzvtAybJBQLC0BJHl9T6KwKjb9A5xBLxVhmB2V1zQ
         BMWhRq90KY5SKtCYPKhWxCDmOHP3Tx1QylBoM4yWzg3iXg88fHUHD7gpZMBwsDBKmQrL
         15JvI0wOwC7oFPzz9/9Q35Oanin5XH6iQXmhXpYvYGyfMua3r4cclZXu+xBVLH3Eqc8A
         1ZwWaI4NbAWuJLAQrqqr27lwQSKnZ24yJkMgZQF3Groipc6J/h3J50HBZm2C5I7k/rwK
         Yj8K8zBUU+cMxvgQyc344QhqypVftVzArRT+bRRUXGmTwGw2djiAqx1U9QdEKEzv6Olt
         KuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240467; x=1778845267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2QMZfo5GvIx279y7myj/MFns4ZF9kvnCOIi7ZALa51o=;
        b=N+kWjHFf1q0s0zaKbUS/JZfs+g9O5zU5NJj9vFpwFpu1Jm+eY697sabAkY+9S/UgzB
         To6SMA8LdWORMhbqPYvju98ip6mpHe6ao3/ZiqBN++emtJBO2xieze/MTaDQ7NhbDmdk
         reqEIvgUGh2tG3JnMCxC1NBgCwCENsXE9NUU8fYhDWIvHR/17JIPNzIZlDlgqJQ5bHE2
         D7+2kAcdkstbc5Id0GTA86LlLGEseeW1fWDoxc2ohRCau68fKxRml4XTRByk6BO/JURq
         SHoOVEDXIfy8P1783fF+AOMl+uU8Qya+kA7yPuyCeLEbSWFwGTvBN8wyr1XX+5DU0p5z
         WEIw==
X-Forwarded-Encrypted: i=1; AFNElJ8AjKfS5nakEXA1AQvp+G/KseVM+btjJjyuxlQAfOqlQP7y5VGX7DN8UWAkyCgg4bNqKgA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVeX68wkayFiewKcXu1yr0vcDxUAz+sOAPYt5M7jYM1Zpxt7Vs
	kfz7620rXPomHd4kR9Sls5pvEJRXd5aPyYB4sDNvSXcmIpQI0ED1wFo+XFVz1UyS0+39G1HOU4q
	Go1L1SH1MjU5WL3WijKbf+cdJVCLAOOkkXl4JLMebPgVVwSSOOyhxZ/cKPcrp/so=
X-Gm-Gg: AeBDieslATwKCycSDpbORhONAJ2cViOZkjoHyayEwfLEFfgPEqJ/Zuk1xdglNjjdeDe
	9zGRdQLE4SYGbpdtcKcPLiq6z/rF4mYj9/BD7BAtSTT67CkBTyNcDsjN6cZI2LFGPmsDMHeZETR
	eCsIkINlG6wRFGS2IsBMWMn+CkgSa2XJNwLagQUc58x/BjNEOPXPdy6kX9XPDezPrmHQuwCSVIM
	Zdg1E6T41WO95V3TFMZj1UW6EgGSY/ff/enLNVBH2LFmK0WtmLWsA3s2EztEKHZu+1tEpx2t8BZ
	pDyfWdk42Zff4gV7sVdVapSjTAo3nxBmU+xqKbLuEH3L4JG/CJkU2SQoy06eLP77i+evBlZIhEE
	TthLkQ7+IbzllDgb44G000PK7GoVMoQiQzKH9Nco10wZG+B+sG1u6rX+hXvxm97aVfERNR9Cn8Z
	80qX9IjYCv29Ep
X-Received: by 2002:a05:620a:294e:b0:8ee:589d:5dbf with SMTP id af79cd13be357-904d68df456mr1788516185a.46.1778240466853;
        Fri, 08 May 2026 04:41:06 -0700 (PDT)
X-Received: by 2002:a05:620a:294e:b0:8ee:589d:5dbf with SMTP id af79cd13be357-904d68df456mr1788512685a.46.1778240466256;
        Fri, 08 May 2026 04:41:06 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:05 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:39:57 +0800
Subject: [PATCH v2 1/7] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-1-3ebdca3e4ae2@oss.qualcomm.com>
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
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=2779;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=EgoG8dYeMOUsaStegKZNiGtsdNqb8ep20lln6yJOD4g=;
 b=gplcoxsXbwOQNprb2mtOphiyAsN4q5dxQl1NJCfFgaExg+NyoXXlMSSE5kuXRYjIG3/OjJ1B0
 BRszlaW/QF2Dwe439yzT1VZJvuEXFAs4f253ypvuNDIAZeusLcrQNx3
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: hg9lTNhORMrEc8avJ2BVHpCT0pspzVlL
X-Authority-Analysis: v=2.4 cv=VP3tWdPX c=1 sm=1 tr=0 ts=69fdcbd4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=DGnd2QOFyrMO3axh9N0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfX6dge5omsyx/Q
 fXRtgjH6GvtXLgMJ6Uqck973pABI9AwPp6U0Trhkvj1Pd4BoOfAbfPXnYSBZB08WaWRyuc8+7xu
 B2FgsKXl4Pgw7l6IltKsGDbgF45dp/+qOMUhjmpX7U2Q0Qv02IVM067AUkEjnIyyoBZ4Y4M9JK8
 XM2EXqUYXES7Y4G3eOs30Q7/+S31FNsyJwsxoKlX2OtBlwSm0DKu5MjR+0FpIfbPgr2LVTfF3MP
 VjfJrNwHa2F8lVOHIy4oFUnkhflIuip9LfeRP/qFJokELm1SIWr99h0I22y/9PGuJZ5kigiu8q0
 JyY3lkceJboDQKHdTVLtEKCt23WlfK9hXEBXTPqWfgX168f8gQMm7wBzStBlTsiuS7G8xchpPoI
 peV3b4ez26mZAtzXxxlvFAyUNbYjaLuYQj5+FRl/zpz6w8qym0vnC0bJTk5Dy6+3B2LxfdXqiOX
 imMG8thkmJShIbyfLOg==
X-Proofpoint-ORIG-GUID: hg9lTNhORMrEc8avJ2BVHpCT0pspzVlL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080121

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

The original iommus list included entries for ICP and BPS/IPE S1
contexts. Only the five S1 HLOS stream IDs are required by the CAMSS
ISP hardware: IFE/IFE_LITE read and write, SFE read and write, and
CDM IFE. The remaining entries serve other hardware blocks which will
be described in their own nodes as support is added.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 2d1662ef522b7b874a3e308e374044255bce5bb8..126400772d028811c9efbb1443144ff4f264fcad 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -104,7 +104,22 @@ properties:
       - const: sf_icp_mnoc
 
   iommus:
-    maxItems: 8
+    oneOf:
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
+          - description: Legacy slot 0 - do not use
+          - description: Legacy slot 1 - do not use
+          - description: Legacy slot 2 - do not use
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
 
   power-domains:
     items:
@@ -332,13 +347,10 @@ examples:
                                  "sf_icp_mnoc";
 
             iommus = <&apps_smmu 0x800 0x60>,
+                     <&apps_smmu 0x820 0x60>,
+                     <&apps_smmu 0x840 0x60>,
                      <&apps_smmu 0x860 0x60>,
-                     <&apps_smmu 0x1800 0x60>,
-                     <&apps_smmu 0x1860 0x60>,
-                     <&apps_smmu 0x18e0 0x00>,
-                     <&apps_smmu 0x1980 0x20>,
-                     <&apps_smmu 0x1900 0x00>,
-                     <&apps_smmu 0x19a0 0x20>;
+                     <&apps_smmu 0x18a0 0x0>;
 
             power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
                             <&camcc CAM_CC_IFE_1_GDSC>,

-- 
2.34.1

