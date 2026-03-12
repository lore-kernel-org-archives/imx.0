Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2059351C20
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343092; cv=none; b=cHHisW0GgzJgj5fsmbwr6mQyScHZsVhrLG9U5YMMhLEGt4ZGuwudrrkoiXwP3hetmIf7pxDlCU3o6Ld2SkRqXeD94KcPdP/N7Hg+46/fvbu2XMpw/7d3qYFtpe0ex7ZhTFgRuBF8/rVCJm9KBCQYSoD78GwdRWj07xvIl+04KW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343092; c=relaxed/simple;
	bh=SsPV7daT9HJwMyMrg3BL/XIk1NTdhqQYvT/+ymScgaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FabAZF1maMJDSf5ChzZVJ9jon7VWiXrhfuULDLrOzFgecpt6/NdmC0Zm6/WnmuLtS+ytRLBy3zMPWYHNkV1NokhndS43Tjh77rrX+AyFAIsYA3S1ZQtsN21CnwkPJnyuGna+mSO1/nJshHCcrp6VctzYEcggRbdbZ+3qykuA3bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bBCyza6G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f52SglA0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bBCyza6G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f52SglA0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CDT2Tl1594015
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hn0Jom/dKDg9V+FpEaAQ2uZCrmd2rK7NdsFUGXTcB+A=; b=bBCyza6G/BGhXPG3
	g/oNxp9/ZwyCeqLuCUHehfT9e+yeDmz2+ki5gJq3zK0hPHMStxtnTGEX2Rh5vjlB
	ycFAt8CTTxGWQ+vHfO9dXXthVH7PLHYm4WJyoa6thkdPFy1IDOShTumbbiLsSwIp
	r661KrjbyCVJZkmLFcq+iRAkpRVLm6cvvUlHXfgTu1KNK0hLBr5nr95UFlkZkOt7
	qwrcPjh4xHj/CHhPx+oD7kg/MjzDp6etf6CNnI9Q459QdAoDGAIFcIjZOdKWxcMh
	Y+yptfqf0m9s8ajSFKFWz6Ayc9A/XNngZtJ7+jRUUcOAcnPJU0+W5SWtCDIvDm+1
	HLJ2Sw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvqaq98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd849cd562so859907785a.0
        for <imx@lists.linux.dev>; Thu, 12 Mar 2026 12:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773343089; x=1773947889; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hn0Jom/dKDg9V+FpEaAQ2uZCrmd2rK7NdsFUGXTcB+A=;
        b=f52SglA0CmeXBfikYfAKaSCDXEDfgrIOE6Y6oyStdF+hi5tKAk94mVvABNHE4UUh8e
         HkEM8Ljbq/IXuhqo5xbNPZenm9x5iM+2+iDr/oZp9ZAB9dM+5OE2tMhSI5FsS1cjq/FC
         wjBmNETwlsZrf/93RZLeovPl/mMz+jJUzK5zFG69MLrpz5McSqh9WkJ+tCDxQyiAVfxE
         VbCBl63UmdwBVjUWG+uPkWGKvbPnn0rDmcHgdBi/gG4I3VXtY1a7Avzs4zhw7tkveAn2
         CNzzZJQnYt/5YDBPXvYmjRg6+l0wsWR1/KuyQuUMs4+xRxk3CaxKFM9aiYxJmW0fRpd1
         /Yeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343089; x=1773947889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hn0Jom/dKDg9V+FpEaAQ2uZCrmd2rK7NdsFUGXTcB+A=;
        b=Unri3urffp2z4oolBc0VWKlpmEBZlYm2eAfmiioBp0uhLgSvavYswo7eEDZqH2mi6P
         vp4qj3OHtVlpqVdzlXhkvSqne57fVzvQSrvgh5yld6vSHjPhi+iO0hYTSxkBA+JygWMA
         fCvaxIT5T/NA5UjpZtuTBH6SwoVGww02OVrSIH+GPk4FyrbIvoRdiFzCEoMlV1Q7BtcZ
         9fnukcQHQfftzpyY/qGKSNngHdpY6+Sr4+a0d9Nt5vd4e/XzCRY2D5BS3CulqerZGrkh
         uTVDZp5Dq3iIs2jmz3MhXpfeeIfc3YgbCpd+zJV2fh1VBicyYZhxvINomWCpRy6Y8L3T
         hZ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUePHHTMpr64qHcRFv+WE7C9DiscMKdw3HJT+LZr89KVm4O0LJIq+wcmCZBsNsQzvDJJIU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYPRLYmVlIRE/2Y5L4zMIji2i8OM7HOLdzEPWiR+YH4TnfbKfx
	x2S3rlexQf0iV/YuwGQO3Yjl+yahE8cp8naX/3TQTuhiLxNssXNBqbgymA8OBHaOuiluSDubpyL
	GLpW7UMpAjPhhjBW0QB6twmdEHq+pSQopywG6iY2tUS/two2rGIAIwjw=
X-Gm-Gg: ATEYQzziQM1wwnSl7obho2JrX4v2JgWAZSfZOz9aSGvCylO6Tl+33vQRk5u3wtwC3vq
	hgKL8Qmp1dhDlWWJCTkvz46enBiypCrgFRoMuS3enTktDbNNcxg2OYQItRVpjp0Qn693eik/MIp
	SkJN0Rp0spKg+gz1uQ6khslZPnObVIVYydJthN7mz1rehfruytNEdDiRWZFE1DK9ckfeNGfRzl/
	L7q9IKt44Z8NKTj51NrOuZJYCxZcfJOlp0+X5ptmoTLv9cFjaJF2pVdf8m5JEFUUmX/ELI+r0B8
	SgrkWkrXvyNkwMDysqynQzmMpD8b5nDR1sq1NoDzMp2WKtK0AL1PizFuGOP0KZ6YhfI3PV7sUhF
	tItutYeWaRpDuxL0uOVY22Vvj0Qu9clzwrECk47EmFaKs
X-Received: by 2002:a05:620a:29d5:b0:8cd:8f18:d1d5 with SMTP id af79cd13be357-8cdb5a8416dmr124948085a.23.1773343088873;
        Thu, 12 Mar 2026 12:18:08 -0700 (PDT)
X-Received: by 2002:a05:620a:29d5:b0:8cd:8f18:d1d5 with SMTP id af79cd13be357-8cdb5a8416dmr124943585a.23.1773343088396;
        Thu, 12 Mar 2026 12:18:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485577835ebsm1874935e9.7.2026.03.12.12.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:18:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 20:17:48 +0100
Subject: [PATCH v2 01/12] ARM: dts: imx6dl: Use undeprecated reset-gpios
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-dts-snps-reset-gpios-v2-1-0d5040eb4a1e@oss.qualcomm.com>
References: <20260312-dts-snps-reset-gpios-v2-0-0d5040eb4a1e@oss.qualcomm.com>
In-Reply-To: <20260312-dts-snps-reset-gpios-v2-0-0d5040eb4a1e@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Marek Vasut <marex@denx.de>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@dh-electronics.com, linux@ew.tq-group.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2713;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SsPV7daT9HJwMyMrg3BL/XIk1NTdhqQYvT/+ymScgaE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsxFh3kr7vFwIZ6KFp22omprbRLHlu3whIPYnE
 2e/tE/iGDaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabMRYQAKCRDBN2bmhouD
 1/EdD/4xJwYh+ss3JAxD30YMdqX+iEMjvJ6b4lHXGuwjFRcEWUE0FT3AxGj9VWxpqFG+RdyfZLx
 PAphf1jtpUUNBCaFyQxYSJTDYMrKzoSnawew5PInETgqiJ5rxYEMTt3pEnGd9+Wj9t5xcauvUE9
 kfMxKaJNaw39zgSB/Vw96Msdv3aRV4je2cCKzwMTq3TLCcr1hv2U9Bjol/M+Ti0KotLWrSFHQd3
 b3PorS44XD+h+T6Bx2LPDZAFsbmp/itwBqsze8aKylTj/+Ky4uSH1eGDkMjSEARcz25ONWqI2yM
 YTmbYgGOsqKUe6pJKCpplh/u91ndgHa+g4Zi6M4QxrP3QhVvOtz3+PrNMCrlnCdL0ATme5krgap
 hzRl/XtE+eWI4or2XtwNf4WA9lYDmXSBPky1x5NKza3P2tTMTV0Q+yVa4WxA8UIs3/ArsmCAkFO
 a10dixxtLcD74eeBx86KiMJiCN864471Tsine1oR/v7gBIpqa/8S+Pc/eqZw8YQx8aQSwnAmsFb
 v4FnwJYN7GJZhZAb2yVremuyAbQaJzHX8DGfP2eRYOg673o16X2CIUQEPJXDz8tPlRvUbfV2gzI
 D+3SYhVgCa5oHpR10aacxgSKXOwa6jOg6z2POza+3r+/8GFBW3oAxizm90b1c/5el/JUxRob+Os
 SQxRaHIdA+djXCg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: WM5eCvyNzxM0FgihwtNZD2J2flOxLKwI
X-Proofpoint-GUID: WM5eCvyNzxM0FgihwtNZD2J2flOxLKwI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1NiBTYWx0ZWRfX/nwczjjtUUnb
 e3gsREET7XNEuZov8xYCZNMaDnaGRYWM8+uvQSpeP84Z/cg5aVpFi7eLYp0OQMejrBk9O1cQrMW
 2bndSnjBrMrJdIcLjQTlM6LcTVTxmsD1iTxGX4kDdfWlCH1jTAYJo/QrFWEo1xhf6wODOOQgVGE
 O1YFv1nu3zdMIrFzKGkT/0yHXQbo26X9E/zgyq8KXm+oWVAb4UROLbv94ixKHbvlbWvVQ91NNey
 wwaJvXJAzbE0EyL7n1N/KLQLLo7z38cyOA4EQe9PwikFhgqRixxI/PjD5SfAP2JWypNJ//1VJFA
 77yU0l2XMwpTEuijnbBqL4CpDcj8uoF9zGhE6ZKn8WYnPfBd5UBJmrTeYNl+yyf2arFAoq4yRG0
 g1VMpyluQ3t531s19glPX1GDWcc7cHe6VG0EFKr8emSIIohIG/w3fTqFlqMsSclSBaDKWD/hHQ6
 Yj1uxvRNRnpn8JvcYjA==
X-Authority-Analysis: v=2.4 cv=ccHfb3DM c=1 sm=1 tr=0 ts=69b31173 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=lgRk19EvD0hfQEPH5KAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120156

Freescale i.MX6 PCIe host controller bindings, through referenced
snps,dw-pcie-common.yaml schema, already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" which is deprecated since commit 42694f9f6407
("dt-bindings: PCI: add snps,dw-pcie.yaml") in 2021.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi            | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi
index 1e0a588b2a15..a4e2fbdc0d0b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi
@@ -318,7 +318,7 @@ mipi_csi2_in: endpoint {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 9 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie>;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts
index 5ed55f74b398..7b4c16e3fd5e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts
@@ -321,7 +321,7 @@ phy: ethernet-phy@1 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 20 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi
index d5baec5e7a78..de6473a0d262 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi
@@ -271,7 +271,7 @@ vgen6_reg: vgen6 {
 };
 
 &pcie {
-	reset-gpio = <&gpio1 20 0>;
+	reset-gpios = <&gpio1 20 0>;
 };
 
 &pwm4 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi
index 4a5736526927..d4911fad1d79 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi
@@ -571,7 +571,7 @@ &ipu1_di0_disp0 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie>;
 	status = "disabled";
 };

-- 
2.51.0

