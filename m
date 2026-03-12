Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C10D40629E
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343115; cv=none; b=GLAjX1zzmj/fxR4QIH9SKNMCXQyPxN8o43j33SFbNUaRrdNEQg9lR1uWRNyw/SH8sckmAHUSrNl+V8frskZcTd77LK+fOkYey3r+1KFgwDruOxQQBu5g8XKjIkm/pxZnYesVRB+KzOxOfi8ldAlWhWTI14rj0wIfbPZJ9vMbNsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343115; c=relaxed/simple;
	bh=mQhGzCxvs3S3GUmcWZM7b/t2cMqdUR1t3CGSawFbijg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l/KrsGN5dddlAkeRA9O/pjQO7DROC9ep9l1O8/ohQNOokng6/BW+6hTFnXCj6Rbo6SuRn0CFuuWK3oUkZktne/GE6oiGRe3jtqDs1N+NPlaFcg95nkutgjrHFUXHOkOuFgkZWh5iPSnBWMWmsFtE46sehHN2rwWFsm5DF/Wtf2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sigd0/Hw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eYA3LVct; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sigd0/Hw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eYA3LVct"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CI4M8A588318
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rSnYdF3yntUL3R56pQlGX4piuC29cFagEaWXPmDySlM=; b=Sigd0/Hwn4YpZphM
	y6JWCPs71IXZNOP0msv4dWcnkTfVqK8wBSJHbTJby31zvg4UUy6l6siVEp/iI0M0
	KerkldPRVI9F4gMU7wsTmy+d5RoxoqPhV6//W01SslJKXFRAc6cVszs3l550nOC1
	GXSj7vVWdaicUchVeDYSPnbCZ2VkcHPPJ7En0WFdbWQ02PJVNqr3ofq0l131qpS2
	E/46rBpGksEy6shAPv6RMz0ZbaMp3j3MMdoXyBH4IQD8rxGlyqqJ0tebVsB0GyVK
	+y4DPsrDq+MPkWlWQrIxqKGAPt5NMCXFuOydsddrtKuK7ini4KZGpwjJj7jr/7kx
	8sAcQQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh5q3a84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd820c6a4fso1112451685a.2
        for <imx@lists.linux.dev>; Thu, 12 Mar 2026 12:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773343112; x=1773947912; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSnYdF3yntUL3R56pQlGX4piuC29cFagEaWXPmDySlM=;
        b=eYA3LVct9LxQhvkDnslvHPjy7fM7j5phq0yq9aOlevvGkojWxY6Yn72mJ8S9J8R45V
         de6onRp20vtK/R0Ub7c5j8euPSMkF/IWCs/Rvt+ptwCuGeFgWmP2iQgnIrYwXchrZ3p6
         ZRO//ver0jhPasuUcEQQYd8DqlkNl3+AsCf8EgXYsesYPdW8H04+Rvk1rdkSplu0gXDZ
         YEDeLLSyBCMCHIBzFgn/IuXJmkjW4oTiUFcD0C8Ne3KIeLLf4qYHoCXt1OY838PgjDKd
         oNcv+97vxZ25bsxyLfaTer30YjjFfvc94piQNQtDwP9OOQRUAHbqtYJqVInzzIwgI6WG
         NGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343112; x=1773947912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rSnYdF3yntUL3R56pQlGX4piuC29cFagEaWXPmDySlM=;
        b=jpev4I7ANOT8Lpp4K9vuet8jTKYIKKOdwvdnQeirwwOYMr2og9j2d1KcMfczPcY34u
         ND3r8bc/Q1Px1PwBiguG64A/TcAHUd6/57XCIqYdm36OmPyCjbN5W8pcIhz56ud3b9z8
         u+14T2vKSXEUvbtGyn53GeF6a/LhHiolCOMY+/CQEKENRK4f4aDbsrR6Tk8wA+MYv1Qv
         nL37t4Xhvi4dXEE1WPiKT3fWe2ZI+53ulDEkxIUL5vm5T4AFzxqPHViV6/tN3ztgcGh4
         UdLg+vThBsUUPBxB5UnGqG91FYm3w7KHRAh9NuuyL8FW9mBxU9jhZUSOiLQpm2zkX8LJ
         EGRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCSnzHbANU6ecy8Y26gwqRJ+ArI57vRoE1//1MSyxkjhJW5qp6TN8rOMESlZdbReaCVtE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6tMO7hHEcHRQxAroeWZFNdfDm0dhmXxkBvJILX8NW0GDjJyEl
	5HNOiRCP+C6rC8utxx9aStPKjY/ODGnB1o5qe5ZP0U3dPyDi20CFYfMzPzLZbWcbofTqd4s+xqz
	r62k2RoZQpOU6KTnxSdpX5/7zGUkuGOXi9R9fOy0VTOyh5CtarYc7dlE=
X-Gm-Gg: ATEYQzzXNMmPv1t27QgNQuUv/MMwbjuOLbJtdTGXCCH5uZZ8Euh9Ex4KNG6AKup2e3t
	IhhoWZfCfC5vUqwtGrJusl/e1Pl/reVtN3lI9fU880AcnJeIpC+V8KUazwS7tW5JYNK/Wz7cBf/
	mTO1UlLc6kmHcSZ4L1dmFyNz5SvKuBn8ucfxCdWCRJTdBGS6JojRhr1YOcsiBfehGS+tqXasuK4
	QYEylPRLZZun5oDmP0R+8hg8P1oXZbzSSoyGCaDNftdJsY8XMPlLn0DRrbFB0cHAOw/eGageGXW
	aCJpu5L63/4PlX9Ouq6WxvHJdXLa4CHNm5OJN8jPfr1q4ENsghgDyH67BvxvjVDbTkfv9mWcQzo
	0uZiziqr9x2BPXSHrXL+eTZ6klQIBhYS/mLB5AXoYkMpm
X-Received: by 2002:a05:620a:4081:b0:8cd:79f2:dc48 with SMTP id af79cd13be357-8cdb5a9751bmr131726085a.28.1773343111771;
        Thu, 12 Mar 2026 12:18:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4081:b0:8cd:79f2:dc48 with SMTP id af79cd13be357-8cdb5a9751bmr131721785a.28.1773343111273;
        Thu, 12 Mar 2026 12:18:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485577835ebsm1874935e9.7.2026.03.12.12.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:18:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 20:17:57 +0100
Subject: [PATCH v2 10/12] arm64: dts: imx95: Use undeprecated reset-gpios
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-dts-snps-reset-gpios-v2-10-0d5040eb4a1e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4317;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mQhGzCxvs3S3GUmcWZM7b/t2cMqdUR1t3CGSawFbijg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsxFpECtLe4fmQO3jsGZ5daSUkWr9nLat9a3vr
 ylRqvkBJlqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabMRaQAKCRDBN2bmhouD
 1/pqD/4zt45RTWOxkdx6kNYSDqz1Ilg6uzpxgtNeflvTp8ahw7W3nw+qZO/ShDEK1kN8J+0aTcl
 YODqsk/KHnKG9bLXoIWKiiTXTKhU9uyeQYywBX26E+bjndpq52wPUyKsJB7Jj1ZXtn2h7NJPndj
 DA4YzYS6qbhK+yBeKiHrcO9STLNVT6P47QYWjqfZwPiQRiZhTTS/MOJy6RW1Z4a0Zaxa5L2hLL1
 33S5XKErzbmIUT6H0xAUQUx/CWzWETPR8eJbqaWRz+YaEmoVHH3t90tVIWKcKz6R1qrF3B0pwVn
 QUi/Z8/MeShwVyHyw0uRiuUtNdp1yPpdIrH3Yn5USmIhJguzlgdWfv62lDlNZqztejqmVv+2Zoa
 mIUTAktIhCJEmcqEbHtU6NkepgsK875dXG2DEAhQcyoCJCL+r3tU8Z4+fRjod/Ds6LoT0Tn+Maf
 3Sfs6hWqQ+ahQuiFAGIOk9ZDtp3yuHOXKTItxcwD4wa1kqpMf9sLc7ihandIsUNUJVQjBBmH2/J
 /2yQlCN64SQXL4Q7L0IJWRHXihxXLOpcNeQogzmwJPPZP6ybv3GtONQaWBAsw91nvMThA050AbJ
 GTrfl4A9BJyj0DVxShb/+w9gx9g7p1m/Bbl3DW2TH9JmIOldZZjmRE4itUDVY78o+iVB4gXZgRg
 qfYn5jbDD5wpm6A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: ltvp_gPNsp52qEv0_Dsv5t4Yuzo2-lUX
X-Authority-Analysis: v=2.4 cv=CIUnnBrD c=1 sm=1 tr=0 ts=69b31189 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=jGA75YajJU-kK98SflYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ltvp_gPNsp52qEv0_Dsv5t4Yuzo2-lUX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1NiBTYWx0ZWRfX60EmVuOQNZlq
 NN0+Eom4diIbylSjKdP4QtUTm4KnsozWzaL7N48RkzyrGC5ClQZOuAIFeQ5RTtQ1LMj7VHbCmBG
 xpQeHs2ttbFwrpHslq0Xy0a1L14GWHMgBqod8Pmebsc7WbKhfpzmF8xE92B47ZBGPLLNLTdH6bD
 ESBgGtEMTzyxh573imq+A0Rimt+Wy4OTDKBaK6S+pmx825d0c2iVMz9AlKBTFQt6Z5tvFrTyXHg
 APbgxmdA/n7sDpuSOeaR3bLRHGvv7cwwm4K/Cke+5aMcCTShZ6lMLmhrf4kKjzUvdbbx8H3Seq3
 hpUPjvVHHNgssx49Ywm7ei2bX3+hpR4kzDbJ/ZhLL+tGCHxy1hiVahqVTe4Nc4FmLFFI3h/+AnL
 5ws92MdtK8wQ2Aa1+GVF2h4LSOIzFKhRyOckIsZ36B3TgXy9hmcAOuLPEeRKBh8FK9tLFFt2zyq
 9dGpAErgKnas+5FKpAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120156

Freescale i.MX95 PCIe host controller bindings, through referenced
snps,dw-pcie-common.yaml schema, already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" which is deprecated since commit 42694f9f6407
("dt-bindings: PCI: add snps,dw-pcie.yaml") in 2021.

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

