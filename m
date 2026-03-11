Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699063DDDB3
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245323; cv=none; b=GbTXIytsyTxnuMonq9QAK7mkR1nvsZqTKOIcMl9viFnFWSDMyNjezekRaRZ0eAu7Djk3l+RgL5NB0fEUgfusEh5gmsdHngJL/NLGssH842+fKjdS4qjUZOI82jBH+Bl9PkAGQ8dH8v6ZhyjDQlr6GjBStmK00JQn7A0O9IsH3Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245323; c=relaxed/simple;
	bh=A7AgCTNHOUuBG/1ldgBi4qaF6lQTEZbJE3fUOTYefj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fl+dTFODQqn/qIaOj/xjXo/1EjZ+a3TPcbMT8TtYEb4tMj8R2agOy5EQHJiYE0CZPPreHi0W9hQQAqtPg0AUGqS8CWGbwTUPCQFoiloj47vhG+m6/zFCFCAYd5o22mrzHD02yfmKR+IJV8VJ8+JPFgw5fpHn6YZOgRNmS1o5nYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XNjjWnPB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YVyJPubu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XNjjWnPB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YVyJPubu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BAvEBC2622228
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VqgqpLsdGTD2GkM4HPXhpFG+RergPXzIGdNet5/k1ZM=; b=XNjjWnPBbwbg4f/u
	fdJ8WIaP62Mb9MDNpPrbML8yLfg5pXq4CDRRlGh3iZwhuPUkFl0glVXLTQbvFmjy
	xsYlsA1/LRkIw3pDIP76VcrPCe1mSRd9VRXbTaq9cxhJrxxDW4UcjWRJLZdFN3so
	rZ6MtNtXWjesC+Am4eRSoJLZ6xzkdLrK+8//OsCK1c90iFAClxsO8RU/Ac1T6qEh
	28KpnKPYadl9Fl2LLIwfMn2FKla2MPuEl1v3MT6zY8FOmKmqR7js/GH/Pf6xrfby
	1jA4YL0jKufXgSiM5QR1W0Adw7uQsC/YOT1xaMfR2bRpq73g64vFZYGwsvoxS9id
	d82oPg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu73h1578-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd858e8709so3441807585a.3
        for <imx@lists.linux.dev>; Wed, 11 Mar 2026 09:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773245321; x=1773850121; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VqgqpLsdGTD2GkM4HPXhpFG+RergPXzIGdNet5/k1ZM=;
        b=YVyJPubuAAf9Ioitr8nlViRIfLVVph0ZRS7yaltsyZsL6PqSz63dDZUR7cQZJJ9Dtw
         n7GEiEwgBwDAScMXn5ymEIzMLyZpEwvt5krZB2+zz+nOzi66CLTvXxY+0NuC0j6n9ILE
         ASzEVr73jZ6LMuDRAH+UTy18hzx7pEmGmE8qwv767fVJbh3jrvYqAY8+VN6BMMuAqbga
         R0kLmuT5vdjEkgYVAxBTotEqkpL8BidWQjPpSBYXpr4ghAlp2ulvbE/hmWwFg6XyPNfm
         L7myxCEUsQU1fbHZ8tjQk2KgjsgzGcAOwlrqIANuXA0mAquE/tu+/8HrtctSvzH35QJM
         Cc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245321; x=1773850121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VqgqpLsdGTD2GkM4HPXhpFG+RergPXzIGdNet5/k1ZM=;
        b=xAY4Vzsde1STOAlb5rMFimj2IyCrV1W3tF0bQ8FiLWhxMx3dWoYsju2uTSYngBW2ye
         L81MGqkE4tlyBmD2Hu8g+5a3DbVNe/wFtXAB4fyJv+bDyo51PKuxcG3op4XWEVqHCbvZ
         Gq2O/kDG+3zcoC4g4KWjBHfulm/5yP74Bpj7KxdxgUodiEyzc07oY1QQFt8tzwPO7bst
         a0OwiFn5PHhM1tB9E9m26NB5daK6kVajx2v3NtZvGDXfkn7FxqPCcfgaoPoBQEmBRQDv
         VN/jL6DV/iz81mF5W8/rQUSJVAPfJX8dj2gQhwe6yaPcTgX3vXroXBp8HRAN/AOUvp5l
         3Rhw==
X-Forwarded-Encrypted: i=1; AJvYcCWU3lauCWMJk1a0sazme+tfeE8LrtIPOmdFvZ1yiM+QoCvlXZtXEXJsJxfmnRlirJxefJQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzzhdvMGZhD+XXSYs9zKJl4MHSCt5UyGI+7nmKw8yUrTB2F4zw3
	0yZEHt1TWo2/Ig5shiQlDrIU38qNBwD/2X199pUUMJkHxStxJZegtE2a9j/pzYl61TsP6DeR7fn
	1SI7YEquq6KXAQBuNPLUwZxv1b7UT6Je3ON6WfIIXFRR8OB4IunBoVyY=
X-Gm-Gg: ATEYQzzklSbyf2SVd+CI0LgabIySWmn6BFBWRMWW7cYMyWJ5no3EEyxDmEazzmwNXA/
	F3pE2Ysc+bwk+eykyXnI+Uak3gIwWHf0gMHohkZooN9/tfdwHTcjC5wsfStMAUew4HGOIo5sRW9
	2gW2k15siig8TGwDFaTzge1A6J6I16eRResPbpjdv685n3x5PgH2+gG1yNVJIhr7ZYfSUgUKaFi
	Hu6p8zY2MnXbxMLcw+Sloug6C6o/xJRFol+rStA4Nrro+kimrJcsw+H5SUmPLhGBvPRRrJ9odME
	0AgcnUTMZSo7JKmirwWs4xMagc0VCw0m/emj6S3wnU2anvmjJwEnmpBhT1qEwla9gEPdjI0t+1e
	3Yy0b+T0rQuIV80ph417t8BXPCuqC2KS369n9U1Su08YB
X-Received: by 2002:a05:620a:1907:b0:8cd:8889:227 with SMTP id af79cd13be357-8cda1ac6ea0mr369653585a.73.1773245320795;
        Wed, 11 Mar 2026 09:08:40 -0700 (PDT)
X-Received: by 2002:a05:620a:1907:b0:8cd:8889:227 with SMTP id af79cd13be357-8cda1ac6ea0mr369646485a.73.1773245320228;
        Wed, 11 Mar 2026 09:08:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1aa2c3sm184711f8f.13.2026.03.11.09.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:08:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 17:08:06 +0100
Subject: [PATCH 10/12] arm64: dts: imx8mq: Use undeprecated reset-gpios
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-dts-snps-reset-gpios-v1-10-ea1cc09fba84@oss.qualcomm.com>
References: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
In-Reply-To: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4292;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=A7AgCTNHOUuBG/1ldgBi4qaF6lQTEZbJE3fUOTYefj4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsZNnT/X5v8kltDvli+cG+fd8bBen4PJ5f9XLm
 kl7ClPP+yKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabGTZwAKCRDBN2bmhouD
 1+NTEACAM+QkMfiupfxi6WJwvjz5n9xYJWtCXl7A7ZDl9c7S698OfGyVJW6ywapcUUGsiOppPGm
 Vi37CUBrKO6VYQ+h4a1CKbrVtZUNsbAzRNcVFmRy+Wcp6T61gplJley4SEgBoapd8dtHuTHVFVE
 MvYDDm2RrSNQwn0MWE7fw+7M/5rCQnVIzfgzB4LFONiMy10I3pq2ppL/m0rVarJ7z47Q7tloNnC
 NHtVKOG37G9YVJLXdGvON8hde9c6u5bawVBtte24QPWrVzv7iycIvUjC0uqtCt+f0Y8bHBx7w0s
 RdJ/H6R0z2YkV7PlJRTuX10ggA297RttVjt2UXA9XnpPavepvIdGkKrgqffGXUi8uGFytjutmys
 03nAUoLs7u4DJefH5kERSUaG63PBylP96JzqSrhWXXdKux3ZDxT6tqEulT+229WclE0KnIcouWQ
 QS4Sjngxtn54uO7gRmQtEKk/5Ql9thONXQVfAMxpqVuHr1hm5s501UlHreT48qLjY9UJZhp//X2
 7aXgjslHqSD3/uQ3e2+bpGvll29eu5MqIU3Ht4M5nhK+JUCPlmxT0Wjdut9XNwq55xz1GqhaOKp
 J2weGMt7yjR27p3aBJpgZh286lHDdVCQGXZld1f9y9P0WYecBWfyz9HRe1zWextvob7BDAJIP78
 yIrAb/Xs9BRc8qg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: CxJEC_2nf8SsElFagokIKCc8JGANmb-E
X-Authority-Analysis: v=2.4 cv=T7uBjvKQ c=1 sm=1 tr=0 ts=69b19389 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=nTlmypLvTDh5NzCj0PYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: CxJEC_2nf8SsElFagokIKCc8JGANmb-E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNiBTYWx0ZWRfXz6Hy91Se5L2Y
 tvfnp0jJJDeltfrx+rt6wtxOMktxBaNNOmPOkdSVpy83Xg5KQaUNo9lcO5JunTzLKs1+bwoD8Oq
 K2jeMC1Lqqp+0rcH/YnDee76bq0u0vu++1gvIx8BjeQZQJN0A/zxl+eXbX9NjzEcOZXV7iXce/v
 eBuRpLWycL2JgROiX6BDVDc6Lz2vYqW4woEvsnpkZD5bUI8yrGFJ7Ew2htw4QWFGbeZBfa6An1t
 WAll8n/19OZdSRY5kRtdqqk8quAnWYMg0LCTPnnxdTGOjJuUI0ZElrmdpF4yf/hqy8Pbeagjfkm
 rKY3/doASdF7D6Ny3YouxRSY1zg9N5GB/jTdr7nklWkEPIAExmbQxF3cko9YYLb7WofhkeOER38
 AVMSPjd6Oh1kT5UzVy/ZTHdVQe0D+i9KaBdLrFWg+DwKZOmA3qdS5o4Ll2t/YDOYfIAzwSSMNDC
 pECZoonZdgGHpQP1IRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110136

Freescale i.MX6 PCIe host controller bindings through referenced
snps,dw-pcie-common.yaml schema already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
add snps,dw-pcie.yaml") in 2021.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts                | 4 ++--
 arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi         | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index d48f901487d4..54826420740c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -369,7 +369,7 @@ mipi_dsi_out: endpoint {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio5 28 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 28 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE1_ROOT>,
 		 <&pcie0_refclk>,
 		 <&clk IMX8MQ_CLK_PCIE1_PHY>,
@@ -392,7 +392,7 @@ &pcie0_ep {
 &pcie1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie1>;
-	reset-gpio = <&gpio5 12 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 12 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE2_ROOT>,
 		 <&pcie0_refclk>,
 		 <&clk IMX8MQ_CLK_PCIE2_PHY>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts b/arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts
index d8cf1f27c3ec..2296ff065467 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts
@@ -243,7 +243,7 @@ &i2c3 {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio1 9 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE1_ROOT>,
 		 <&pcie0_refclk>,
 		 <&clk IMX8MQ_CLK_PCIE1_PHY>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts b/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
index 3ae3824be027..09f2fb1ad57b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
@@ -195,7 +195,7 @@ mipi_dsi_out: endpoint {
 &pcie1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie1>;
-	reset-gpio = <&gpio3 23 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 23 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE2_ROOT>,
 		 <&pcie1_refclk>,
 		 <&clk IMX8MQ_CLK_PCIE2_PHY>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
index 0165f3a25985..aa54182def4f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
@@ -93,7 +93,7 @@ &led2 {
 
 /* PCIe slot on X36 */
 &pcie0 {
-	reset-gpio = <&expander0 14 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&expander0 14 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE1_ROOT>,
 		 <&pcieclk 3>,
 		 <&pcieclk 2>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
index c7bbba45f368..f3d0ebe98d5e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
@@ -547,7 +547,7 @@ &usb_dwc3_1 {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio1 3 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE1_ROOT>,
 	         <&pcie0_refclk>,
 	         <&clk IMX8MQ_CLK_PCIE1_PHY>,
@@ -559,7 +559,7 @@ &pcie0 {
 &pcie1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie1>;
-	reset-gpio = <&gpio1 6 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE2_ROOT>,
 	         <&pcie1_refclk>,
 	         <&clk IMX8MQ_CLK_PCIE2_PHY>,

-- 
2.51.0

