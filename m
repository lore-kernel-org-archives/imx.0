Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CE93E122E
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245317; cv=none; b=ko9LYi4OsNgybiY1PzlpJD43gNl4VuD2ZZK54j7E2xGZ7viI3ndU2ve+IYQHD6+NQoP4dKmMOv+sD14qr+8xE/JE/gNozgV3kZZOECy5XLjXU2oEJ/QbWl4nBtP/PogIwTsb+Nh9Cse7cBUD2jC+z7nzK9H96nCIHp+8u6GFXvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245317; c=relaxed/simple;
	bh=iLlqblad1f75c+77Eu7RwhDSX693PHnfY+OiiRU36k0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ifuWCgGKmYMoWUxL8+gFGGWaEwsEXsU9WatNeGqKG02RC8qos0MQjpj8bMmu+lGOTaM+ASJZlWQYDLYTk1nbU0penwf2BwP9RA/UilVUxxb3LRzrcteyJFA922KgZ5ibrb//6fKa7SXQLLg8MPuJLpLCnPomewajKL/X9r5z1bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mYimLgVq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LM/F0UoS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mYimLgVq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LM/F0UoS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BA34Gb2038152
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tQgim6yWE8jugbPfqHPbGso8EiolNoLvAlJ40f1fpWA=; b=mYimLgVqXOEVzRp1
	Uh794COu/nq31BACV0bOx8xETj3CsWBaVldFPnJ1ISCZFgiMnEGVE+A/GTIj/Cod
	EGx9r4kbl7WJG7ga+/rt/vpEop/j5ALYYUtCvzEPz0ASAmHPa34IGv7nlAzRBh0Y
	qkrbkeR1mct+/6aPk8oKy6vslBTSZigA3+etVIShpvUT3x6O1XYSOBeON/8Xwosh
	Vx3W4kaiyjaJ+45k2J5CUt6kl1e1gR6yDslVaxFUmS7y3GUeRJ20YCNyyXa9X58p
	5AEUIA41C6xvSNHa03ZvXbHpgOgsVBR+b2KgtoWk/6aLzgkujRdmh4lBEKGzPxp5
	XluyDQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu6a5hbc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7d4cc049so3999560985a.0
        for <imx@lists.linux.dev>; Wed, 11 Mar 2026 09:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773245314; x=1773850114; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQgim6yWE8jugbPfqHPbGso8EiolNoLvAlJ40f1fpWA=;
        b=LM/F0UoSYtvemhKCoAhT5dh+4zDKbXjb/GQ8iGV7cb4cQRNlN02g1oOROZAMLpGlx1
         K1LKr4QR1Fg4Vrmlzg01MLfRsQ60F/Q9sis+7jo8z8NrbL+fvAFcEMQS1mF59+LAgIDX
         vG9a/WngEhVLKNWnsPwxfrUqWIW9UHxWwP5g5E8DratKlxmMrDlkbHNtIqe4OAnU3G9z
         402jACrOTP4+d1szwkBxEbR14lxg2e4SVYoJuTWy67cqbZkB3qavUqpJvIUKn9vDiLZy
         hJdMT4okCpKD1txqoWKdTHwxQqo/msXXgWTjATSURupXNIQmID5loztSEvup3lQDyEub
         dDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245314; x=1773850114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tQgim6yWE8jugbPfqHPbGso8EiolNoLvAlJ40f1fpWA=;
        b=N/9JrueuaMOi13Pwo6FThYVWnwZCWv1ZzJ/pchWKtzCEcQ5YNAaf+1T2ftpxuf4tKJ
         WV9uwDSWpx6tYrTAe/NVyXdkq5oMwOeNh75z9Gi39heQS/f3EkA34eMQqtPl37+gJQ1/
         H/VLNr2DL/Psyack4JAmHhaKMkH78wC9hfazMeD+ZeZASwOVGVV/1cFKpTJUKK2N8uV+
         3Umi72gexEeo0PqpCCt4if5uu1e1uN8XjBTY6ZOR4LAWKQEEXWUqGXIi/bRcEfmp7Tcr
         rZw7mPcUgqmjVmeSTriqxs6q/VANmlRRpsy6KEWitab7Fv6wXtkgPLbH84jiZZO8XPNh
         NFtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzOvZ+tZ0rMLU/f2fOgMb1XcrDqRK+3GBrSqX5uZif0xw714R3IwCGRwmDFiz2jrEYgzY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3m51t2qVd0F5lWmy0wwA2WI23U/jERMKCZ+qp1MuWOSzIjJkm
	XOsWZ9R7ceHkvwF2nqV6JrpTplKdnFfP86RsYjtFfS4L9gK+3kAQCCk4j87NBj91Jcjwocq+dPG
	WxA/6YELnVGPbO7bIKerl6SVA8wI+LKwsaq4anEOpIjie8m72nFiBcko=
X-Gm-Gg: ATEYQzzTrbccWHtGpPv3dVpbU07Jxp6SidOOlzdaHpJZp4GQNxytZ1y0alJKDlj+P2M
	eBUKZGfBkvd40s21Xc9mt4r+I3Wstlm6MNMjx3oL/lid/O81iOT6Ye7bWGEDu1yvp64EKlmw+oc
	sySVXYe0BaqeShlYS4X6lctXIv/qvoRDCFOU8mXY7SHrojHVS9dU+BslH+EiH2ZWhLiQb/IDNt8
	L0ofGZuLTr/fv1BOHpB6cHd1Upfq/V+YJ0tODNrsiEYLCS8rp6T8hq6GI2oD6hCY0Wo/79aSPdE
	jFB/Fj3qeuY6/hdBvOe2eEhPggDeiZ/bncOuuSMUEmcmVVrmgrT6S1lNLFJfDRMfBOxApO1/0XD
	QPZCs0QNZwvmcGhUIRo25aBIt2g0vib6z+sYGbkB4XSVb
X-Received: by 2002:a05:620a:31a5:b0:8c7:1b17:e8fb with SMTP id af79cd13be357-8cda1a87c40mr428201185a.49.1773245314362;
        Wed, 11 Mar 2026 09:08:34 -0700 (PDT)
X-Received: by 2002:a05:620a:31a5:b0:8c7:1b17:e8fb with SMTP id af79cd13be357-8cda1a87c40mr428192185a.49.1773245313590;
        Wed, 11 Mar 2026 09:08:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1aa2c3sm184711f8f.13.2026.03.11.09.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:08:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 17:08:03 +0100
Subject: [PATCH 07/12] arm64: dts: imx8: Use undeprecated reset-gpios
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-dts-snps-reset-gpios-v1-7-ea1cc09fba84@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2815;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iLlqblad1f75c+77Eu7RwhDSX693PHnfY+OiiRU36k0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsZNkkCgi79yXjssmbqsDOBlmEM+iM+233kd5Y
 yIQ48IBXkSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabGTZAAKCRDBN2bmhouD
 1223D/0cBbQUE36jrFXET4DyV4UuMhIvtbdvtBvRPdhBwLlIkYLK7kteE4OCh0euFw6whFzu+67
 1vHW2F0uurogdT/HUtE9n6dt3NO7ll9oibFkdwpmxUE/7Nde/rARs4dyhHAUh8mTzQIQ2KQFO0x
 W3MlUay41GR35UpbIxAqhlPUhisFz70ohnI+FgIrhArYdsb4PO/lOKJfle9aea5P4flarhuWZ5W
 dVACrEfesRfQxbGyROForjNVRcMkh7+S/ZiygkrF+IlXnhQ11OD1Ip9rSzsRGyvROP0dM0fbKqM
 WdOxCNb3c/F3UKDuUstP6KiFdWGZmcMMSYtKqwCcossfD77++ijC8jtmeeOH5MLuliZtpWR5qyq
 CMIlXEM/PeqAwklTU+wiBZhPdlU41rHPXHvaU9oIU93jfS6z/5WjRFVJ6pG6joFSE+0TgQqMgtu
 d48pMsXm5DEnNFzaM6Gw1uqc1/FvLI4U6TpW87VLggBW9harxueKWyoMhV4FbdOnyWBiHFK6Yn4
 HDfq7PoB0pS0mUwJ7N/JNfT8Ymrobhao2BR3KS2Qx6yKAaf+DkT61OXQgEjVw2etkezHENus17q
 s1BZt7lDUxa2TC1GDefFEXpJmUrCd0v5bKdowiZ1RSHmugajogP8hcKCh63MY3YnEP8X8inAqLz
 5I6lbpO2aB7F5vA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 6QxzQqjPunDicYLggOtjhItQF8FfuMhu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNiBTYWx0ZWRfX2zIfgN56RnT9
 qq7aaJhfgBa3yOqOC+AiSIsGnjkXtaSCgJ2G185+OS34fxVbGU9n5ySE8+5zxpCM8vzwdXMzA0t
 Gw7lieXjBqtdd6PWjr+tkwEC28VfUVHLbOpq6cNQ19u7NX69IAk6XXPn6sgvr1YI7Si5VaQUY8B
 qAY9tz+oFpksbEdp9U+RFBsnZEjJtS9ciDZbIesgDZjghbS9O+7zyfR1peBlC29qGDxdSWYwucf
 wyBdjC3o7y/G/oGgz8xMyTycKfLEU+KcqSgBlT7V4500Nkc9ek2QMezvOVfeFBoKOhLU8Dbz7KQ
 RcJLaUQ/f6ST6hzrU9W2TJ+lkqx+llQssquHxco8xLRdcyEaHnhrGUDT2QljnmBU8GtJqbZoHp1
 Q5JiSbicRg/0gr4QReWp4zkEESRvXAnZmLZMou3OoV/qtHQVBzoRE9w2jn8AA1iiBzA/jYSHzsJ
 jrklvpPgpzWjmHHNrWg==
X-Proofpoint-ORIG-GUID: 6QxzQqjPunDicYLggOtjhItQF8FfuMhu
X-Authority-Analysis: v=2.4 cv=TtLrRTXh c=1 sm=1 tr=0 ts=69b19383 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=J5n0A9H0bXRu_Ym2jYcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110136

Freescale i.MX6 PCIe host controller bindings through referenced
snps,dw-pcie-common.yaml schema already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
add snps,dw-pcie.yaml") in 2021.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi | 4 ++--
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts       | 4 ++--
 arch/arm64/boot/dts/freescale/tqma8xxs.dtsi         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index 6fc82b5eb58c..6d8a57ff56c2 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -806,7 +806,7 @@ &pciea {
 	pinctrl-0 = <&pinctrl_reset_moci>;
 	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
 	phy-names = "pcie-phy";
-	reset-gpio = <&lsio_gpio0 30 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&lsio_gpio0 30 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie_switch>;
 };
 
@@ -816,7 +816,7 @@ &pcieb {
 	pinctrl-0 = <&pinctrl_pcieb>, <&pinctrl_wifi>;
 	phys = <&hsio_phy 1 PHY_TYPE_PCIE 1>;
 	phy-names = "pcie-phy";
-	reset-gpio = <&lsio_gpio5 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&lsio_gpio5 0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
index 5c68d33e19f2..bdd1dbc6b322 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
@@ -651,7 +651,7 @@ &pcie0 {
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pcieb>;
 	pinctrl-names = "default";
-	reset-gpio = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcieb>;
 	vpcie3v3aux-supply = <&reg_pcieb>;
 	status = "okay";
@@ -662,7 +662,7 @@ &pcie0_ep {
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pcieb>;
 	pinctrl-names = "default";
-	reset-gpio = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcieb>;
 	status = "disabled";
 };
diff --git a/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi b/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
index bfc918f18d01..677a05b38391 100644
--- a/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
+++ b/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
@@ -407,7 +407,7 @@ &pcieb {
 	phy-names = "pcie-phy";
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcieb>;
-	reset-gpio = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
 };
 
 &sai1 {

-- 
2.51.0

