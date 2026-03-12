Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA552402449
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343106; cv=none; b=mNyiHHTvLaLgPTDb2/6OXMWzKC99OWUSO5yBSB+XmZS4ZSaWxfJCRmIXguhXaYSMhJG00tUCUCTgZUEHoyxJEB2J80V407FJFtSNQQKkjP2WCqIdqIn17MRI5PuZQfo2wEqULAzF3yUKqT7KlNHVUpouOy//Moe9/fTtd+cojyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343106; c=relaxed/simple;
	bh=sCSn8EaGxkJ7RiSv19pVk9Xndqm5kr9dkfsOD4kkNJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D+TMSR2B4pUoqKidsLu83q1cjnpRgNlHgPKRhHSyF8hEgTPbKlQyorVicKAb6c1WhOpL+4QibjGidB7C+WH/i7rQrR/tI+BrL2gPguAe8XdrDEVirJKutbwMA/vU3IYHd04crjlQbKgzjaU+gp0fs+3mc7f8062qhPFodZ/rYNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KliSlHdf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iPWn3stm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KliSlHdf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iPWn3stm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CHhNcN4132906
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aOg1TvMt5mwIozSwq3v3obDuc2Lhso1YJ9tDY6h6AFU=; b=KliSlHdfu5J9+2wi
	NHl3lJPdQmB2h73Icay+jPPcgzvwRprGrhm+bL2idjTTVo1C0GaNmTZePCSLVshv
	pHy1wj3YqGu6tBXNW/2ZuxX7cKBv9KNYgz3h/ERFMk1ZVtC847kh+5GYfhy0lvJc
	ESTzLfonPOoMGnWt11vh2CffTFWgKBrHqvspVVA/sbO7JPFfR/XbpN1mltlIKEkv
	4gEXJ53E0R8dc3pqpf9jlyV+22Qf9aS1kHdT1O5TBQ1KV72PZ65hnL7MBKE71sci
	fxQAVm60XVo+Z5zjj7DdPa++FPQHTRxNcTRLKJmU+eoRPbd1QzrrADdHpYUnMZpq
	WtRoLg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w3awk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cdae902bccso493307385a.0
        for <imx@lists.linux.dev>; Thu, 12 Mar 2026 12:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773343103; x=1773947903; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOg1TvMt5mwIozSwq3v3obDuc2Lhso1YJ9tDY6h6AFU=;
        b=iPWn3stm37w/+E4sQ1FpoBicdien+uFh/h4TiZb+Mx6gGWhZFxr5DbXYf2zcZO3T6J
         RD/1dUSN+nPZxFFoWwA654bt+t59MAzUdZ/rYo4DIZCfrnZ73GZ3c0H0GpVQHYOybx7K
         We2ebbLsGBDsiM9sz/NqBfJUDX8Nv3igWMIWCYa9CCzpnhwwNKgsmnmvLzL80hJbDfyp
         iY1Sib0y6PtzAdu7GbeYng+of7fZtkPqDJceinTtkvAIY8HiiggmCfvjng0ePeTfGXeu
         Nht1EEKe8KfQrA7xM1VhWYcUqbSd4NrbGr4W4WeupL7ISMW37+tC6KXIxvZrFvChu/sR
         MznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343103; x=1773947903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aOg1TvMt5mwIozSwq3v3obDuc2Lhso1YJ9tDY6h6AFU=;
        b=XhgFjM3X6k2L5uEqVGtGIgMMH9WK5lyV9hEsdRle1+lNdeevt7SLCxTGIIOOMUJCYq
         cT6ysskkrSJ7bfGskwWV9DBwOIREcVAY6537bVJUcF6TL/gvFOHG5hrE9gY+rYuXGtIA
         KOyFguv0L9FqQJX/9R7GC2QUj0MM24zaure9EHPThf8b/GIn+9CnPPCsDewQoicumMXn
         QeLDY03TJFDugq36som31THf6mgKHI333Td2poOfK2e5P2u83qymE4fK0pOoDNo0rW/5
         rqay9Ush0lTXvPoTYCOG+g3KLBm9rPuSXvJFZ5HIbnamKia1IWbA3SlL5EiN/Ak8A4+2
         Th5A==
X-Forwarded-Encrypted: i=1; AJvYcCXcsJB+Tt85sPfhpcphIb6VVoKh5soQ1tSHJ5yGuICXKngvSglBCyejzF/Pjex1JKANxwE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzk8xT6gKYa5Uh65guglkLW9+XTb9wis1hu561ZVJCvQRmqhG4L
	wKEkXJMQ8WpqrP5wYj2vK3L8/iLKsGpI+okEkv6fILV1g+IrnBAJK1/+LXgkgu/840lVS+jddlB
	iKe3s53/X/r0R6nF1Qa5TAOuHynTge2nQMyiYbf5C/emx/AYTtwtaQS8=
X-Gm-Gg: ATEYQzy5N2Sn0ND0AlmtkT1E6s0h/P7ZprOG1sKehuw600pt7BNSBi+nRPcs8aGoHJE
	xBF+W7abYNRq/daHXw++LR/1y3SMlixHSMGKxn6ZuaV+i0DAqkJyySew7NNCSnaxzPL0DWNHd5I
	z3bt9Yd7DBPhLX/H7Nrdi3dTbjsJqHeocdQ9smjXfwMcMXvfv24hLEMA+aW/QNTjmt/+pZ+FtwR
	fV1AxdveqsLIZKSgDZneTfmanEpDzKNfC8mvYIeP4dbEofo2QJDC65C4j/zo+fkQvfUBGiA/GOO
	df5czsMNBLmDZuvhiYGn5JL2KqCca09uDJpGJFZDYbspF39CDsoW0xMCXcEXEUm4N5+ZZW+b4G9
	az0O3BP3mScaMR9hXLPjd6PJXvzc2hwnkMgmphDFUyMHA
X-Received: by 2002:a05:620a:6c0d:b0:8cd:9231:8b51 with SMTP id af79cd13be357-8cdb5a176fcmr119088185a.5.1773343102885;
        Thu, 12 Mar 2026 12:18:22 -0700 (PDT)
X-Received: by 2002:a05:620a:6c0d:b0:8cd:9231:8b51 with SMTP id af79cd13be357-8cdb5a176fcmr119083185a.5.1773343102255;
        Thu, 12 Mar 2026 12:18:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485577835ebsm1874935e9.7.2026.03.12.12.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:18:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 20:17:53 +0100
Subject: [PATCH v2 06/12] arm64: dts: imx8mm: Use undeprecated reset-gpios
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-dts-snps-reset-gpios-v2-6-0d5040eb4a1e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11981;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sCSn8EaGxkJ7RiSv19pVk9Xndqm5kr9dkfsOD4kkNJY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsxFlzbqEAUQEwbYJpQBlH0V5JVv1IwRXLtXfl
 F98jRc0UAOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabMRZQAKCRDBN2bmhouD
 1zUyEACILJNe9W63El4gdsnpg064Tjij1fLDF/xadAM/dLeJD9+oM2dRRhPKNMPhps8tmW/McOV
 wZjNz3ekcdhKfHugq/L5f+sZB4Fo8ezo7khehDDdQgxidmU/Kukr/C6gP7doWTEKSvE8w6wKTjs
 ti7sRk/bqMUSNX7JFISqw/dlxba9FIGlEVoMP4Iil0IFGrECc9Zl3x5yBhZY5oZmhEgNDM7XWLl
 zEfpk5xTtMkJixWzxumcLLFw5AB3Zi5zoQWzra9AuZhhQM4+R7aYguXLA+pGOTt5z8DD6bhCiJq
 V4smAU0x6/QviQo3cjf/XWnGIFEp6c6ETQjfEfsFtcF3XXxLAqG8Bkv/YPE9UIrBppj1RXRX4lP
 63zmKrDMSGaXo63sl00Tdq+fZV6IRxVH/774skkcT/WBZvSOIwZgz8ZRhU1vmIwAgBq8lkMVy79
 r2PLFVBw6JdEk7hqHnEswdSOamcstErn3jhg49CMdfEWxUT9cyr4hdUQvNEm6VTzAf05sy9bJQd
 ju7KQbkVhEAZTYx56xSl/XIuqN5MLKUcR564oit2LY7v0Px5Sa8I1k+XxJGIChANocfw5u8Roi6
 SH9hmZMkczM+DFvJrgG29GKiSVwE0N3eHpXT/0vlfFQsvdsk72QPi33kEk4tUMSyJZEpz9zlFOz
 oskb7J9SJo5SVaA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: EUyjJ0TP7M4VgmqR84Bbs1QFB8wHysHc
X-Authority-Analysis: v=2.4 cv=Cpays34D c=1 sm=1 tr=0 ts=69b31180 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=8f9FM25-AAAA:8 a=EUspDBNiAAAA:8 a=Z2WWPTJv0FA8N6Tej9wA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=uSNRK0Bqq4PXrUp6LDpb:22
X-Proofpoint-ORIG-GUID: EUyjJ0TP7M4VgmqR84Bbs1QFB8wHysHc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1NiBTYWx0ZWRfX/AZY4P1Bviz0
 9vZLeyiP7rfe3tlKEJxyXcYXm6BoKvV6gA19Cu9LGY8Y7quGiWJndROqyYqAiAit5iZeglyPlui
 fnRRlcsUFd6kqk8QQbJw+EiV/ntqB5nidaZObXuCG4rz9KRzRkpC6N9p/J5poGll+WR0jIt9x8s
 tD5hokqPGJEdlXhTOraUUk88INS1vfA0Fpd1lzhJHwcRhKYblMk2rQzLo2cmlj9R1LXQCQA2G4a
 f/obcz4abXP/DWMT/GLMMrPGHDI5RKi+rZFRx6JELHwOVdjRpvNk1neSLLOYN3Jp6uTztPrY9P+
 9pJuXmKvSr8Azo1NH5CzN2MRdl7zNfuJl3UTvOni9vHHkX+gwXrr4zH5JVQDk5tkjAdser9tEyH
 UZaCL+ZUm9Lg5cr++67sG84wRszPCrlNt3J5HWReP6o6CcicI6OXjOve1TC+mT66H0YkhRamYtI
 wzz+sKigwZgD6Zx0SUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
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
 arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi  | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi               | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15.dtsi     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dts        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts    | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts   | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts      | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts      | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts      | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts      | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi            | 2 +-
 17 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
index ea1d5b9c6bae..5642139ebaec 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
@@ -301,7 +301,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 21 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 21 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk_gated>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
index 472c584fb3bd..6a874f3ec22a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
@@ -919,7 +919,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio1 5 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 5 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcieclk 0>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
index 8be44eaf4e1e..31052ca1971e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -533,7 +533,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 21 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 21 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15.dtsi
index 299752aa8277..7eca9127bb9e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15.dtsi
@@ -209,7 +209,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio5 21 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 21 GPIO_ACTIVE_LOW>;
 	fsl,max-link-speed = <1>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>, <&clk IMX8MM_CLK_PCIE1_CTRL>;
 	assigned-clock-rates = <10000000>, <250000000>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dts b/arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dts
index 370558a8ba46..e5b8415dbe0f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dts
@@ -137,7 +137,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio3 20 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 20 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
index 6043e7d16306..0165ae04c6ae 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
@@ -205,7 +205,7 @@ &pcie0 {
 	assigned-clock-rates = <10000000>, <250000000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio4 9 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 9 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts b/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
index 2ecc8b3c67da..a5f3dfe06a4a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
@@ -182,7 +182,7 @@ &pcie0 {
 	assigned-clock-rates = <10000000>, <100000000>, <250000000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio3 22 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 22 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
index 8dcc5cbcb8f6..ce785b103a57 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
@@ -90,7 +90,7 @@ &pcie_phy {
 
 /* PCIe slot on X36 */
 &pcie0 {
-	reset-gpio = <&expander0 14 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&expander0 14 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcieclk 3>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi
index 320806d3d073..bb441fd4aa23 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi
@@ -122,7 +122,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 6 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 6 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi
index 266038fbbef9..184fdfb26cd5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi
@@ -147,7 +147,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 6 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 6 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
index 2aa6c1090fc7..1e84c365b2cf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
@@ -167,7 +167,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 6 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 6 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi
index 53004c4a13aa..e0982b4cb663 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi
@@ -152,7 +152,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 6 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts
index 272c2b223d16..a31bd864c022 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts
@@ -726,7 +726,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio5 2 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 2 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
index 468c7e993c52..4c839dfa3ce0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
@@ -626,7 +626,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 5 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 5 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts
index 636daa3d6ca2..ea67654c9ded 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts
@@ -559,7 +559,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio5 11 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 11 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts
index 99572961d9e1..7028d028657a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts
@@ -623,7 +623,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio5 11 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 11 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 1594ce9182a5..3b656f8a81b6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -672,7 +672,7 @@ &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
 	/* PCIE_1_RESET# (SODIMM 244) */
-	reset-gpio = <&gpio3 19 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 19 GPIO_ACTIVE_LOW>;
 };
 
 &pcie_phy {

-- 
2.51.0

