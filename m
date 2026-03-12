Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43EA407107
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343122; cv=none; b=O026W408CAB5INUYxEjTmlIUaRrukXbJ1xdZKGCfkzU0U/pcl6g0RrqG/qx0OzjvM7B3ifRl100MaGGvpbC4UwvSpw9ScAz8+7lo3fDIvzZgaKiEB4YLjFEtkaAVvEPmUWr3GQDlT/ePClQAqwHFQKtyo+urME5UuLYni4Y/D+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343122; c=relaxed/simple;
	bh=2eJBBKN0/zvfDyAIv7Teb+AvDJL+jlkPxJ4H9aCMwlA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P3uepxsX18xgHuqhlKsKhHPsxNxZovjWpioIT9tEu5LxRujIsAKghsJ1AkRrADkQ85U/ORKfRmesQe1LXQbV2NSLf8yOoXgqudSXt4+goZNfX0jeCOiPuF+B6JwqvV+y6TaxUM365FjC6YPC/SSbfub38t2anxFt44u8M2k+nq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hgH3Rvsv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gt5B/Dpf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hgH3Rvsv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gt5B/Dpf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CIK2TD1922768
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	abY4X5u7ICIcUlo5VuQ6hpE443JTr5O4WzNv1vb06ng=; b=hgH3RvsvjOt4n8/V
	fUanCzM6FZQFo/+wnURym5s5k/glc4Iz49n1zYBZm1AekOSAkCOtEFPnxEHSlnMd
	0vqIw/RLpsGULaYtLErCPxKyowmoya8MTo976N5/f8iDgmxAVWI8QdV4ptm122Rl
	GDEcq7ts8t6yRxIS1i5Zxt81Em2p3IoqHzgSGCDzinEau4DU+wiaKyHcNwlGCB0x
	C1m+uHnCpQU2UmPv9QBNOavbEsgocemEhGyfncqz2Ob+1RX4QSlQ4aDlpCFXZngA
	Z71rBpR2gz87SKc/5w6ow56fBMfmD9jJYWmBApUskKj287QvmAPThObjeIsiL7eI
	t0myLA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4wuat0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd827a356aso860108085a.3
        for <imx@lists.linux.dev>; Thu, 12 Mar 2026 12:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773343119; x=1773947919; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=abY4X5u7ICIcUlo5VuQ6hpE443JTr5O4WzNv1vb06ng=;
        b=Gt5B/Dpf2PHXBL44icfS/VLJBcCo0A/Hr1MTFNTmJVag9YVWpAZoDLIa2TrjjIs4bV
         Vd/YOi6veVGAsjK5FPYcgFAFSobM2xWBZDb0m4fQtfYeG5uaQ815IAPgLpR/94pbprX6
         +J7p3Ctpb05EgYSsdiol2NYsrRmaS56tTUpDnLgpGyzPiefMMTuoMZlxdFhwVZwB87uv
         +sLyGRrm4gIHevJso3dGqbkN4w0jc3/3+249tkAASmjVNpItXtAYE8ulwYRRF7+GKXsA
         mhm7t8XGpQZTvEAppDpU3lEYEQ7ptSLS5zDjHmgy6OKB5QdLPmy/D/xur6n7/GD07YGV
         GliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343119; x=1773947919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=abY4X5u7ICIcUlo5VuQ6hpE443JTr5O4WzNv1vb06ng=;
        b=BbvSyLI4OoLdXRwJpXH7No98d92Q05nCBgWYmPj49FbALXEw2wMisxXNb+PqKuUq6e
         L9RAaCVfDCF63T5fdqknTft9EUI39ebAKROvROrr/yTL/AriAsDLdf3pgzwwIUtvfTwD
         1sRRU/aP+hbZac/r/+REZfeCCecSZlqHZmDs6Q2Hy1bgE06cVEiaeG6tBm1tkqRS2uwq
         /iYrFC9YlQXkxQwHWgQnsQlW10iSfQEURYa9kvQtPc7Ir0jzczlcSO1J7vM8qJi9ZlnI
         b3BVGlmnhkDmhTUOA246aM6aYjJT8GJS5T2jUBbcuvop5t522kmn8PFUrC5qiXG4rubx
         ZnGw==
X-Forwarded-Encrypted: i=1; AJvYcCW7kmv7zQqqrIa3E3NkJeLGB883zuMZa2pyOjyBcwokhisaVumIVG4gzF/r42ooUANG07U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6/jkfCOasWQYbzF3oC9kAI0Q+rFe4OhwI8MTG4ANPp94/cxzH
	t5G1qLiWx+DBzwbLgVz5DnP9ZdlBNfELyJ/fE/Pgj8C2sYf1uCWfLgek7AS4xlzTxL5M/7iEn23
	ebq07HU5mN7eVk3JeiBchLw4fS4h0jAe93DjW8VI2e2WwyeoUKP02WiE=
X-Gm-Gg: ATEYQzxKjJ+ad0zH2ViM7bQtu9qRCqV11H6NoSe06y9cRoC3E5gBqgNmWY0ZaSG2REG
	mpqbjPv3H/HB2PzCCVloDeBOizAI2dsklcBIQhFElYWfMDTqoy8bDZZjJDQSJ6QMAAQxBSaeiYC
	RD3gXzqXh6pOBS7q4m5pDzAte2kd/GoPOBn4NMdx9kdJovsoIBAbn6xWrjTuvxf8DxhsQYgYYQ2
	cww827wzOdJ/VXRuJZPxOuYR4UYG1PIqclms8WpxDvBqr6FclTGbzYDkmBAAPYIJ7cDJF7ye5ag
	8w8nPGESBgH3Qc9EpZ1hmv+VIqbHCYIOnW8um//vi/Kh/gYy/9LDkJMTE/nNNir3/9UI9AsWdvf
	sUyLGG1Ya6sWLlhsBWrBkuRLsIH12LvPkaVbO1Dsv0HpE
X-Received: by 2002:a05:620a:a1db:10b0:8cd:b644:5ff5 with SMTP id af79cd13be357-8cdb64460d9mr66146385a.80.1773343119221;
        Thu, 12 Mar 2026 12:18:39 -0700 (PDT)
X-Received: by 2002:a05:620a:a1db:10b0:8cd:b644:5ff5 with SMTP id af79cd13be357-8cdb64460d9mr66142785a.80.1773343118787;
        Thu, 12 Mar 2026 12:18:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485577835ebsm1874935e9.7.2026.03.12.12.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:18:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 20:17:59 +0100
Subject: [PATCH v2 12/12] ARM: dts: imx6sx: Use undeprecated reset-gpios
 and drop reset-gpio-active-high
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-dts-snps-reset-gpios-v2-12-0d5040eb4a1e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2852;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=2eJBBKN0/zvfDyAIv7Teb+AvDJL+jlkPxJ4H9aCMwlA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsxFrMte27J6SRtK9+CWbx3Z06eGmGDG+WO3l5
 c/TjNTCwyqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabMRawAKCRDBN2bmhouD
 1wUIEACTssPNQiUCrJej1xy53FJ+Rl+xTZon+RDEzfqwv9hf2EDgUb3RCjRfvZ8SfbNDdk68vV5
 rbhELbPJOi7opn6rvtX1D/uXWswMT1TShxTVmMmPK+aNWQYI4Z4LRDOgSLfzPyxcFHndTYu+jD+
 RCP+NYuV+vE+ShmSckXFL5BnKTW3XWBVn361wa53tf9NL6Sjj1OJGRBSm031yGBLLOV6VYW0w4D
 LCcpAJ+E3jEKQY/rLuF6FewkdZM3aXuDH1sS9j/k78FLv+r0g9R1ba+JLNtWv+FuIXGpx0GrJmb
 8b/i4eqNQwf802adrjXmBRaTFcwL0/Xw/UvRgP/YUUQIxjsUnIPnOR1373sIDhL29Yv6WwsOMIA
 zeS5UZMFnc6HD+tC7qpXRlyM/n8KDzgW9Nsr08mT8Br5VZ9OGvi9VYEtp0BeO/jK8Tfe+c1IqA+
 1vlXPK6tRwgHxlO9+0IF+xgXxn7P/L03ks9J7K/EY0EVUiJw29YwWHZ5QYbumTPq7wxsLvicJyr
 NkFxhCzxz+SKjnTmOb7b/RSeD8DzIPhNrV5lZCjxjL+K2Hg/TqTTw+3OX7t35UBrquX3kdKq5RB
 AcxNBcf3xmd05I+IwQxnDZ5s5XVrq7pFloSzoV7h6wZo2GyTzEylcVKV36lK4TK7Cl1ZmCfryQi
 22vFcWTgYQb5U8w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=GcoaXAXL c=1 sm=1 tr=0 ts=69b31190 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=uXk_wYd1RWWgzoKNaEgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 4SMXS6rXk9_i9TQ0Jy9Gjar23LbCW81_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1NiBTYWx0ZWRfX7y3AiMqVGytG
 u5cCW57wFhtk95lxc6BboJ7p1Ih/9eDrn6e6uJn0eFYVfpYVFWs53D4BFknSLhYgWuhYUSPhfZy
 tMTrw+eiaxeQN5oHqo9ko7RDyDQEACEelCjIy1vqxxEgJ14FIld5/l45VP2E1nIaZiup9sTbZzR
 9mQRuas/c0EW68jDCEDIBpBUPyOWi05VLxP+rsTlDqYBiKbPAtw2VI5gO6Q2m2KUUahPP2DJyfF
 JLGNkHo3UUUv6walBgGMHEEXzQuWRjzr3wQP06HTPg/weg/N7LuZllJown1bNzptEG/JE+AaiD3
 SIGSM/8yyxXEJ58hXffRq3kvH54wEG1KJddQCtR3ifEIBfScipW0rEyjSzIc3omHGoxL3ywwzgI
 BTsDkseIy2fW8Qj3R5r5N2YhxugT2xXenW1j0mAnYpqYnPBQLb/NFjcQrVXOzbY9j6UnkDSM8jZ
 WyLyGiINJZRSvLz4YjA==
X-Proofpoint-ORIG-GUID: 4SMXS6rXk9_i9TQ0Jy9Gjar23LbCW81_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120156

Freescale i.MX6 PCIe host controller bindings, through referenced
snps,dw-pcie-common.yaml schema, already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" which is deprecated since commit 42694f9f6407
("dt-bindings: PCI: add snps,dw-pcie.yaml") in 2021.

Linux kernel already properly parses GPIO active level from phandle
arguments, thus we can also drop "reset-gpio-active-high".

However this change will impact U-Boot, because it only parses
"reset-gpio" property for imx6q amd imx6sq.  Intention is to update
U-Boot to work with newer DTS, but any other out of tree user of this
DTS which did not implement undeprecated "reset-gpios" will be affected
as well.  There was plenty of time for these projects to switch to
undeprecated "reset-gpios", though.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Fix subject prefix
2. Drop reset-gpio-active-high, update commit msg
---
 arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi                | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts | 3 +--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts b/arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts
index 1c1515a854c8..6dd382cffa3d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts
@@ -224,7 +224,7 @@ &i2c3 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio4 10 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 10 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
index 3e238d8118fa..11e8efcc1fce 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
@@ -282,7 +282,7 @@ codec: wm8962@1a {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio2 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie_gpio>;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts b/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts
index 2ffbe2df4776..9be9ee92018f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts
@@ -499,8 +499,7 @@ MX6SX_PAD_SD4_DATA7__USDHC4_DATA7	0x170f9
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio4 6 GPIO_ACTIVE_HIGH>;
-	reset-gpio-active-high;
+	reset-gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 

-- 
2.51.0

