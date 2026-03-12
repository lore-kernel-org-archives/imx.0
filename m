Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DDD40626D
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343111; cv=none; b=Dt+W7qNxu9JunGZUOtspiLmLqcqydI9noJRwC3OKTzVLqFP00D50bJPpPx1hnCRzsFV2Zcvrt0wzCglnfqEiLNZBh+Iq3sJpeUKPtrE1Ecu2Y1qz009p7seQIupt6wx1yreCXP6KgGX09HPn0aLG2tWh8On9DyWbOPry1eejG2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343111; c=relaxed/simple;
	bh=ketqLeJvphOERTzcwSuzGEPndeI0EjSYQVG8iMUwDuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=La3IYV92bx0SwtDM65eGPmL68vfNIfBeCblsAw4wqmNryWnXcjnTdX56LwpDouLi84ol1n+XmCAmXpFNcDTtJU47V9js7DoYpgwKL1bH43K39+wyIWFtLRGP5qUa/04sYGxY8TAxuy44WYf8zbPs0ZD5EpPoWFhFYvIXqER1dE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YS17obd6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b2svaMbc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YS17obd6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b2svaMbc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CADavg588310
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tQF+bUvrjP6KDpXJchl5G1P5gPqcLe+6v4T2uhK4av0=; b=YS17obd6VrQm7rxW
	ijFUX6Pnwun4h7HgLMzk9LYLme4keBsX6kN3NTCUcp6YQN7YeJeULT5foWNpOowc
	Ae1BlxxuvfICMvRaXyVhFzahe5SUiC+c4oI1i83vPgIxjBuBMB6uegmYP1a+8coH
	WsxgszjwoLPRegzzeBXXjTqm094yoP8KOCDSC7F3DKosUOPFjS00DVjgR0kxAD1p
	m/2oKOD466jutLPTM6m9sRqBSA7MyoYw7Ad4QVwW52dnUqusBR8v1NjN8MTpHgJf
	O63QcRzACgggZZq6lsIod5TcMDpNYL9mVrt2+tYgSFzmVs6O1rvUBzMgSNCpxFC6
	q0vG+g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh5q3a7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd77bc8186so1274014885a.0
        for <imx@lists.linux.dev>; Thu, 12 Mar 2026 12:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773343108; x=1773947908; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQF+bUvrjP6KDpXJchl5G1P5gPqcLe+6v4T2uhK4av0=;
        b=b2svaMbcqkiXKr7WQGmk9wGaUmm58GrPBzFsClywdKKow4d+UWgN3agIT0PYXqSv7b
         YleUlb+euwqSM6qzImcfjT0DmiEjNFLcbUTVntYg4KndYmRfe+06eX/KAfGmCNiPRMd/
         rPUvbStsy8fSVSgGO8fR0SDkZpg85xTKiSHQUhHzXmchIeeNnGswUcaw66yiCmAxCBsi
         McxSXO9ZHlTIiUZEdiXf4CIhZ8d1Gc3+mqfIJMDJXrq8DE2QSJOEceQHUKQLL5rulGFV
         5Uz4ov9InagZaRDKlCr7lwOUfQd8uDGackyt5LP2oKLyId5mlyMEO1Ka5pinjBhuHG3+
         KXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343108; x=1773947908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tQF+bUvrjP6KDpXJchl5G1P5gPqcLe+6v4T2uhK4av0=;
        b=cUZIEjBagrstIf3dsNgsi3YikJuthwa60E4jrqsMjUv/J/vQ2PhOjq6bqeQgGt2xA/
         QbjoWgyGAFyfgztsz8auR0tH9QEYLTlTjBe6/2soPYq7YHien8aQbjNTzRp4iWn6wH+n
         OZHeYL4C9FLnUuuaFTbRHWXz9cDH6CEDDWUu0GS7kb2PnXujC0Wd6A4MKtV3wik2rpr0
         fgH4MQmNkKXmUcapWUgD3DZCebKnkfHKapdLFOhJiZYnBK1z27vlzYnQq3tSbE52mYFy
         v32smt4PTJzsdU+NYuzjX1cKAuhvlEB/PHbdW5qUmNh9BfFk40oxC05GOgBgeox/EQsH
         ZJ/g==
X-Forwarded-Encrypted: i=1; AJvYcCUcEfQaAKkuxFDCzvMbTAwfT+sg1/rwOUAhthbZ8eiRaXO8ebZlm4O3WrDt3rJCuSSE/pE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwneODJJ4pBSoY/SbujxpDCCH4+JsyfevR/OtdDDcbKdbx7AXfi
	pUPIhczQO86WJpNT88AHRuDbzwlh+W7e37j0+IseD6XLnhFi6VY0El5P6uvsbmSo8Q2ogmDpseF
	QzCFYxF5Lj0KBp7ReTLCoiNkwfyHUNva86xlyAjpoO+rn0cuVI3RPaXM=
X-Gm-Gg: ATEYQzxhHnksadJP2ajDjVl+7+jf42V9goD1Zk+py8YARWoyIkIvZT2OHEdFZKGUFGA
	lzSPlncdJZYglXBU0HCqShFDK3whrkYeFcPzNogpxINMMQtBOCiULfnhvcmkVAFPpm7wYa7CHtL
	0anNWbGkGUn9dIiJQdCH+aYb+FEyrTduv1XYGODOpYTw9ZwpyqYBFja2jNRAjUe8T0qUqRniIZe
	NmK8ZD6gdRyyu+/yUeuxsk8Hbkk652Q+pdi+tej3VaVgCkc5I95eF/ZE2+wrcFYLqBA4xyzkywu
	3U/6anxXPCDn8sHP4oMxPy/AUb1AJ/3J9P5JswxoVFETb3GqIwNICe48mz32nWwfmTCrQrKfDfO
	7DZd/38/XniOE/eVwHQ7TpJhwoWkF4tWbi8bD+YSiTE89
X-Received: by 2002:a05:620a:2943:b0:8cd:99de:6b61 with SMTP id af79cd13be357-8cdb5bfdb69mr127768285a.80.1773343107949;
        Thu, 12 Mar 2026 12:18:27 -0700 (PDT)
X-Received: by 2002:a05:620a:2943:b0:8cd:99de:6b61 with SMTP id af79cd13be357-8cdb5bfdb69mr127762785a.80.1773343107527;
        Thu, 12 Mar 2026 12:18:27 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485577835ebsm1874935e9.7.2026.03.12.12.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:18:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 20:17:55 +0100
Subject: [PATCH v2 08/12] arm64: dts: imx8mq: Use undeprecated reset-gpios
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-dts-snps-reset-gpios-v2-8-0d5040eb4a1e@oss.qualcomm.com>
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
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4367;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ketqLeJvphOERTzcwSuzGEPndeI0EjSYQVG8iMUwDuk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsxFnXSgcn3d011T7YS07Ob2bLGT6L/wEitz+h
 //phXY1q7uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabMRZwAKCRDBN2bmhouD
 11gmD/43J8iGdLsLnSAVQKjH1u5zpsQ/oIeg2wpSCHGwactwtUTBJH7dSoIxfufErPykpi7Yb8R
 LH+Y0pUjbxQst2H6TdTHNMsKQn0eRnbTMEzHLg3OzHHG4HtPiqeE4iCtE8s4/Aq5bc0mFQaq6BO
 z1p34Hh50P6+SRoFMQ2fgVkR92cDpSXZJwMuWxBEjvj1l0nDkR7/UeYVcxdus711FdVDdpLJHHA
 X43cuWrogOLL8DT5QVcRSiQo6GcnoKB02/X2D4R2SlyQhABpirgkjgFV9CgTqyaq1sOqk9DQxI2
 fWBwuG5AQsg8oQ52NXXdizlsmF9K50cNibIQVpMfPPGAHdbRDrtbWDjm4798cH8Gny5NqZK+vXU
 3bS2+mJr7LXgLxZUN0LaHNMDrb/wlAij8T6zzNDt6lcbazscyTVfb9O3IuwxYceC175NZb1CZBS
 ZMcpjiKQ/D+zVvVoMj2wHe26reJzVzeFG9qBO8YtdZRnvVF92dSocmhmQ1d3nFc477EqMdhNOIc
 js1Cf5pcSxnbfATEXMuVJndiyp54cO3X0PJjK/dg5tsWQRw9E+3Y+YONzCwHryR9oe+gxPU1fCy
 d/gvALrUZA4EBtdhicl8oiViy/IfepFNtBvbv47eI5LgwqfP1mHLg+kUkqVi5mAOMnM3O1eTPVk
 VNQlLzs5PwixteA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 6e8hYKR2kY8uMg4tngidIyxSt8RPHeNv
X-Authority-Analysis: v=2.4 cv=CIUnnBrD c=1 sm=1 tr=0 ts=69b31184 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=8f9FM25-AAAA:8 a=EUspDBNiAAAA:8 a=nTlmypLvTDh5NzCj0PYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=uSNRK0Bqq4PXrUp6LDpb:22
X-Proofpoint-GUID: 6e8hYKR2kY8uMg4tngidIyxSt8RPHeNv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1NiBTYWx0ZWRfX2X86s58GrjcI
 5ayCKPYBkkzb42Mh0cVDAyWwrJaOlri1iQK8LOBIFEFagcJd5IVlpIWqf+oRfzhip7PFMs0ZNv8
 YkVHRrqEz8UkIhnvvIqZMJe3MNPywC7nMljGe6uJxJK0nh9PBjXYZZPYSWWxuLDfftlyhhCmInz
 We4cImxbGuk+Pr1FEooX1/rQmz/MXHbn2cTUdw1nNlqDvbMFGa76d5xLHt0ztbFLWbPXpSxbwL5
 m6abCpbrAtJcvTcCzzA9nSonQqzmRSxzIPrEtHDoNsft+XFOnI7NaVypDZpUJHAgAhPa9PtQPGz
 4BM8QkZsIuB2ebIgOw0pIDI+K5ZDy70PLfNrFa2lGyIhefMGqaRCu5OrS9fCylyr8p9Xj3IN+f1
 tKkYqa7FajIAt/WIY2246hW66sRuneOD2oG/E/tur+lwVeMAai3QscYBDwZZN37eUNsC70Q0X4s
 FKa/5SIj4GpvTJPGZaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120156

Freescale i.MX8 PCIe host controller bindings, through referenced
snps,dw-pcie-common.yaml schema, already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" which is deprecated since commit 42694f9f6407
("dt-bindings: PCI: add snps,dw-pcie.yaml") in 2021.

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
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

