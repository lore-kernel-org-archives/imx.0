Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA67F3E122C
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245329; cv=none; b=tjwPa4tsWGmDSTcirJBenTWw14VfC2Z3VwL+NbGGFhUCICXOK56APHJOzuN4hZ8yrsdGcoSWhGRmTYSTFmhhxuCz7z26k6b5mP3tNDFD5q9Ir5r4zThlgTUdRMJfPRrE0+gY/zXI7q7F8jNEHUSSBQ2Of9vxW/m1b9lh0/ItWFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245329; c=relaxed/simple;
	bh=6vE0pftOAilYpmSPT9TJLYPIm07vk2MdgJnwhU6W/RE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L6gXMpf1Qvhvz7cy2UoTvlq7TvUNV/vWsYuHhAX16y7KT9yds8VnYvI5Lf82QuHl0ek7Lk2wg1f2NFUpAElyDM6aHgHqo+Waz07wjpEpukXhXUItS6eBynHY/ljNx7T3hYZLnQwytIHSOK1emj4dl7QqMyxB9c7XbyCiPfpcNYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZ8zG5ce; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X022kAqc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZ8zG5ce";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X022kAqc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BD7t2n4032606
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fNQFmnJFRgG+YdNb9/+Q8Of8vcXnleS1G05qCl47NCA=; b=hZ8zG5ceXl/VVh1G
	CPUNXJlBhqcIt7J+7T01WUK9O5eMatmYIZxdkWzdt0ZLnaHf5J221JkVS5FbWb9v
	PmbKzQA5/6aXpFXxaKQMlN7c61Pg0hMocaWo8QPM3gwtZYcreVnEdoDKSSp9fP7B
	5eZMGRjY1hAgCE3KxK0cwV7wJn/Scb5iv6v6GA2Cfs6eaBzdMjF3suT7XId4BlZW
	91UeK6cdL0O8thgwfSvJ6K3Sm2z4eb4prtJNuw0tSlU+EJn6n/uKi5n9aVIjiAV5
	JWFfnkmHT9XqDkIwwEew+xZQm1YcuPmSq6MOwSRAvA03s595nwgTwzOlLw/V6WpN
	ckaGtw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu90t8r09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd98d96382so234644585a.0
        for <imx@lists.linux.dev>; Wed, 11 Mar 2026 09:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773245326; x=1773850126; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fNQFmnJFRgG+YdNb9/+Q8Of8vcXnleS1G05qCl47NCA=;
        b=X022kAqc58HMHzhJRo923kZVeX14vPttbjIOHFNLpePRrC+7PVk9q0I4yp0EfHTFr0
         2Pr0FrPlSJd8g2cn1GZZD3T7EjvyM/IMLZ+oQVhoXx3rEBXzGcHzOs0zCZJ9S7ZMy8cF
         7W9Z+lwdtaD+sn0desH2Fe92AFI9usLsjZjsKljBjp3t8sOqWqYtTAkN95j5qSHJByo+
         WmNrDZUVwa2E6C03WgJWssEmKS1l21t0mQFSL+V9sfvh+eB0EhpJ8QsDjwFB5RyEv93/
         jBjEh3ejHllRwysUN4cK+i/HJDic/ZP87vORb9lIzFfnl4ZPP961F53DYGfAFhy4NKLW
         H7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245326; x=1773850126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fNQFmnJFRgG+YdNb9/+Q8Of8vcXnleS1G05qCl47NCA=;
        b=BAkpZsMro4HDM3cR6WFriiqPOmA6q4SXM5WOhVn8f6vVHdaboDteDj+r6Wx4xeOa9D
         MpXSpuYAi2Bk0GPnTGMLBGFFkNnfwaPcqa7wPoDxryg2shiSRCAboyqMW0QexOp6qhGu
         JDU4FNNjg0RUvtONaf7q8KWUeI1qcZjH/sfr33qzRvtiEpOV/xt85OXrPKMxPhDX7gv5
         +jcfgAUtTXimH8x4qWqPC7QpnzRtD0c/vzENhPz3QxLCagOKLWPXSbf7PsfOu+R30nZF
         2fNqfKKtNaS2RFH/iyVRUNN+RIn5/VaIPHta1fHm5QC4HruETDdnkXpFjjOw4J/JlTQr
         dp3g==
X-Forwarded-Encrypted: i=1; AJvYcCUw7DCQUJrHme+eGIIHewRFtGHZSRyzuMGeqrKE7R7bEOd+gWbfs9CbYFu+TmAZKy5Wu/o=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBY5brub4POi6Nb8vThxJyxbxnVQw0HhjJYXreX2XuYTV9fAOO
	XK5ojIo6g4pHqqfkl6+2VGvI5K6BCE1yJkbveJiuzT/sSsU9gOubio91RgtG/eoEX3fimenqi0H
	U4gCrm8Hxfe6qWNhC7POuzYgYM5EaV0e0gFdmuyywz1kfzs5rCpeRSCc=
X-Gm-Gg: ATEYQzwR0EooXouvhv2uquSpEFYFBcNTCpSuktoQqA9QdQiysi0BOF+ogYdlk/OUjpO
	NmvDDUtskXEoKzgykyPJYaA2VZciQvJP7B7C75pJgujh9jes7UFzwS3jW+FYWH/bBCKrRy5rP7k
	st+p5Ri1fRrGa5GkRveykVm2drhB7PN+Zwi4MfeQbPy19qeZHAJmgKYtK2drltR7zvxI0lebG11
	0X4XQ4/WC6VaIyxapv2RTNdJ4lA3potsO3nOGCPM3R4NVNne+ApvumE54MwWmgs/5MZFQUfy4WA
	JzIwywPjQ7Cwr+AUbQEVFoFPtvSgpkTBBGT7WIfDPq//5yowLsw4conu8pk+tb0xm2KxGjZEI3F
	sj/lk1ZIoMZ+c2TU8jFvyJW4JboZDl09UZGZiHninvxz+
X-Received: by 2002:a05:620a:6cc5:b0:8cb:4ba9:ccec with SMTP id af79cd13be357-8cda1a7ceb0mr372426085a.72.1773245325471;
        Wed, 11 Mar 2026 09:08:45 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc5:b0:8cb:4ba9:ccec with SMTP id af79cd13be357-8cda1a7ceb0mr372420485a.72.1773245324790;
        Wed, 11 Mar 2026 09:08:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1aa2c3sm184711f8f.13.2026.03.11.09.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:08:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 17:08:08 +0100
Subject: [PATCH 12/12] arm64: dts: imx95: Use undeprecated reset-gpios
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-dts-snps-reset-gpios-v1-12-ea1cc09fba84@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4305;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6vE0pftOAilYpmSPT9TJLYPIm07vk2MdgJnwhU6W/RE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsZNptbaqelLdHazTMlTA+tfAvDcbeiYdkVhlp
 PL0hIgCCH6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabGTaQAKCRDBN2bmhouD
 15B4D/4/yILQphVlInojP5P99PiGVOzSDHrGO4wXjrY0vQFr3DDNLAvMlZbUpqA2urIVhFA2oOR
 8WJjQND30mywAvxXsBEqVaGwPoYECIJAUY//BRxrT+HnppN/P4NxBL1Xe1EaCMCn+mJF9oI2ra2
 WFYOrwY99EIjoVB6gjlQLhWAAIDyGYBmA7commxD/ei/0AVrGUfPGtGHrPCfJHz7JVMwZ9nfaXt
 D3QO7QiJMss+zTLPpqo2fqe94NyxtYx2vWBELs6aUHPuY5Kqov6YoB0Fzyonl5ak1J9CPnNBdmE
 2iBy52gAmAmCw8IzF/6nA18nrMEOQSfRGAzpusX/XwLHHnrwbKzpfUcWM89F7R7ApX+q0+BVqpf
 6VvgpkmgkbiNnWKEtlPt2mEU4xosd06o7PWc6fTBqmm8ExBKHqb9LAfmNkTtLOmu3P/6HhHAjcZ
 rFs9lrhLvO9nLWPovrZz8RtXiPuKyOgTesUg9uALtKjx5MtDtXjGOCl3pSt+HDfdOWOOFqRSwuT
 qlLKRlbn6bnolVEhmWxCzmm0zQrXN+R7WGFa3ubnEv7EU7/rPafRyFzXmuEpY0mTEBHQvhpzG9k
 XvPybV+47lv1qODyvogFVgMl2f4bnArvoFyKErSNJBSeuF6LEUyhzLdKNaXKgDUDTv3moQF2b45
 onkIvvVH8Oj/sbg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: QIR06aWa0HQQGNPRjzJAWHhMyWMF-5qH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNiBTYWx0ZWRfX2ECyzorn44mK
 U/LdaHCr9Fj5c8ciuft2bTsNNc7UwgRRF/6eJiiLIRAfipRYnTEDxplKF2BSV7K1yI0aGQX+aBN
 9Kh5Hrn/Pa6GkBzBh4CM8GoEZMOwHVHwNEbi7mIY0zgSQ2wN43P6pypoFGmoX6IUZxoLEV+mLNv
 IeK+sW70PRsbfRcUO4zt2QRNOoRcDCAUWrfJoK6uEhBCpY+31+GH35oPe0sOLdBhHrjX6PAg63Z
 QrSsNdpUtMA85rBJwQ4PbCj4npbf9SmWbL8atpafJFblgmRLklTV1WdJxtJ+XcA6ThthUVkrEJE
 ctYxardCPLN4y2UtfaPToANoage6da62S9wg3yoYMLPyGWYSbhgfhoeQg8yIvvJysFzz8E6ilOm
 vYsbSj1oSkkiGemZWC46VsyytoJP+/8Bcs4WaUsTsUNn5VlRgGU4Mg9buSK8PeS7vweYmJWQ3v0
 zD0t1erhv+xd/GHkiuw==
X-Authority-Analysis: v=2.4 cv=DfEaa/tW c=1 sm=1 tr=0 ts=69b1938f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=jGA75YajJU-kK98SflYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: QIR06aWa0HQQGNPRjzJAWHhMyWMF-5qH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110136

Freescale i.MX6 PCIe host controller bindings through referenced
snps,dw-pcie-common.yaml schema already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
add snps,dw-pcie.yaml") in 2021.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts        | 2 +-
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts       | 2 +-
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts        | 4 ++--
 arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dts | 4 ++--
 arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dts   | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index d4184fb8b28c..d0f2d3beb72b 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -554,7 +554,7 @@ &netcmix_blk_ctrl {
 &pcie0 {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	pinctrl-names = "default";
-	reset-gpio = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_m2_pwr>;
 	vpcie3v3aux-supply = <&reg_m2_pwr>;
 	supports-clkreq;
diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
index 0f43e3be7058..7a615b1f6199 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
@@ -549,7 +549,7 @@ &netcmix_blk_ctrl {
 &pcie0 {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	pinctrl-names = "default";
-	reset-gpio = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
 	supports-clkreq;
 	vpcie-supply = <&reg_m2_mkey_pwr>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 041fd838fabb..4439658681f0 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -540,7 +540,7 @@ &netc_timer {
 &pcie0 {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	pinctrl-names = "default";
-	reset-gpio = <&i2c7_pcal6524 5 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&i2c7_pcal6524 5 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie0>;
 	vpcie3v3aux-supply = <&reg_pcie0>;
 	supports-clkreq;
@@ -557,7 +557,7 @@ &pcie0_ep {
 &pcie1 {
 	pinctrl-0 = <&pinctrl_pcie1>;
 	pinctrl-names = "default";
-	reset-gpio = <&i2c7_pcal6524 16 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&i2c7_pcal6524 16 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_slot_pwr>;
 	vpcie3v3aux-supply = <&reg_slot_pwr>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dts
index 2b0ff232f680..1f2240bd21f8 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dts
@@ -305,7 +305,7 @@ ethphy0: ethernet-phy@1 {
 &pcie0 {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	pinctrl-names = "default";
-	reset-gpio = <&i2c7_pcal6524 17 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&i2c7_pcal6524 17 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie0>;
 	status = "okay";
 };
@@ -313,7 +313,7 @@ &pcie0 {
 &pcie1 {
 	pinctrl-0 = <&pinctrl_pcie1>;
 	pinctrl-names = "default";
-	reset-gpio = <&i2c7_pcal6524 16 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&i2c7_pcal6524 16 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dts b/arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dts
index 26c2df9b1b60..99ce38df4538 100644
--- a/arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dts
@@ -243,13 +243,13 @@ ethphy2: ethernet-phy@8 {
 };
 
 &pcie0 {
-	reset-gpio = <&gpio1 10 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_vdd_3v3>;
 	status = "okay";
 };
 
 &pcie1 {
-	reset-gpio = <&gpio1 14 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_vdd_3v3>;
 	status = "okay";
 };

-- 
2.51.0

