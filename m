Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957B13E0C4D
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245321; cv=none; b=P9rEnQlbT0lu2zVjVcFFhkLV2fm1qwWndZoGU6P9TCsIACec9Gz/75kcMP/CceBxwI8mWOfGS902wc16i4hMgWlGzCDGonekmpN66S2h07FPdW8Hqrt/2AwexScL5HTCaTphNwGiphPCYgd9/A82rtmAmyIe8ZxsI+PRbtl8nkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245321; c=relaxed/simple;
	bh=aCTo7qYWKpC/S8WIFzwlUyvg97RNYhHTiuaNHSogOHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PoBpKqejmOZjdY50Bzbke/xdYjrTMPWeHNqqLbW4R8ccY8jbUlkxsoR1o+CDbE2AwlJAXhA+oOpwxspYsLAhXxK9GN0NJ47DXG0KvmrK6eF9QXVLAY4x3KuFu/T6C4pkKNboemTgBZAPBojUvV2kMhGE7C6cqJoBjUtNjvhiBzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e4Jh9EC/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FiyYWIey; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e4Jh9EC/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FiyYWIey"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BD7t2k4032606
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4MxioX+VhP5R1yYBziCk4kJlmeiQxJ9F1sgQjfVbVKU=; b=e4Jh9EC/bniBUb7j
	1dhSNvuiwr3o8RcnSgXw97XHYH9kMDjA0KBbuHKS8KXTqIeG6HJIkMQt9yQqYVB/
	2PHgg4vZXtg9Rx0KjiU3eMRsjViLyrQw4pTg/8nDsrUZ8ThaBpGpXTPaylHbOz6z
	QUc3iq7A2iqokv38MJairsPAd2zsAZdAfN1GUajweU52T8nW2sKws2ODihIvuXHj
	fidToV+jgKjLurSZFso9f5otO5xx9ZSILA+kN87ZOJCAuBVi912JjWmqj+/suaKj
	T4iSfbjs6uCqLi+UsI+JBmYEpTFtskTEKynEWFqWqRMA0eyL7yhDh8KiHj0pdC/b
	GC/OlA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu90t8qy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd767c51efso568506585a.2
        for <imx@lists.linux.dev>; Wed, 11 Mar 2026 09:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773245317; x=1773850117; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MxioX+VhP5R1yYBziCk4kJlmeiQxJ9F1sgQjfVbVKU=;
        b=FiyYWIeyOwnZzwmpO4z97OK1V4JX+awNUpN5PsRD9vVpgZY+MEoHLNCNdeLmFg4XnM
         zATJxaNz4eVI9ZFVkY+m1l8JY6XgAnnzpbmJvPYE1AwB6lwEjU+4empdqOmBIB3yy61n
         ISoDLh7SvrLGxhE9L5tCEwe+DQDmvbIfTmCNtjUcDePUx7kxCAiItGItPb3xy3KBY8sV
         1tucmbsSi34XCgiKzW1B+1zJIdFyJBJLGKViYNJjarV7ApUUKzh1gEbsyJ1eETfsX2gQ
         YKspcExWiyz4eHormXnd4yQpCGmdrQ9PBm8u3Oru5c8UL4oADTMEjMUKFIMspG2BooQd
         t4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245317; x=1773850117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4MxioX+VhP5R1yYBziCk4kJlmeiQxJ9F1sgQjfVbVKU=;
        b=GM2DLgMItPZ51paPtfD10GxbjaWe+HlbDcdUkVFciQHOpqs7wjoM83XzpfAUpnP/h2
         ISfDvo1IENE6pkYSSCmvwVTOWFKbXhL6PScxpVvor54oF1huFqcoNurYr4fH8lCA9cPp
         CTqRaW5L1npX4XK+GytRAnNdnVDc88GYdH666UXj1KlsfLFnejSuO3uvrot+InGGzR2A
         sMfqG24DBNzA23XGxJipE3knGBwgc7sd7LMc5uRnlSDHVaeLAiozhhNUMN09fhwpf6c3
         vLYD5yTQ/2+p/K3679ZgxVFBqncYoYmrKG/MMpgozpdyNDBGJ/iBHZ2r7i/jh/ydaajc
         JOVA==
X-Forwarded-Encrypted: i=1; AJvYcCVJV3MxRBiPcY/tIGhymtzX3kcBDY9MGAeewZpbxJnFgHvNr1zyF9LnHudYDSsjB6ufLDU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJZKBYGbfyK/LBnROqTeNtx/awXQ9x34RHnNXPy3BbWK1amJ2R
	UKh/8XDP/WO6eoU0l8ac4+ttlf6gFwX7k6wp3X/U+Rh79uwKu94Acrxlbw0+dc0OTw2I/29EyBO
	EhT0xiEht+JUvlxbSFrMrvWFgNC7ds3DnrLzJNv114ewmPcjvezGs9Ks=
X-Gm-Gg: ATEYQzyDbitxs/HTJT7LEE+j8qJlzPg6HZST4/oF+yulBg6kfdEgnbkeA3Cr8Rfv8VC
	hRl71err7ItIWDVNJa2OT0eGDFxkwR50glBv4n5jEqxUHzdLFYBAltv90CrFEQa4g7pSRAlpApU
	laODhGwA3vl8+pxeFfl8d1BKYC5SbYrU+d2xXN/pDeqYn5haqrjeEStLeEfyQPyynlgEzocjEol
	73dJwlzirmRV+3ud1nmPpyCUAkrBtGJOhelRzR7CEzpSQFFh79YnOF311s0sJJ4ow9Y26YEemxq
	lxiDGT/vMka0jr1YLiO4v/1DcyOCUPBZ7d1expo7Gm9Wp+0xaWvdF6/1rzufuIUXORVEN0/YEAR
	2ox3BHSqW/KXYoImt+IgCIzVkEnoVJroY67iyYNfKqMcL
X-Received: by 2002:a05:620a:294a:b0:8cd:95b4:c523 with SMTP id af79cd13be357-8cda1a2d933mr338460985a.37.1773245316504;
        Wed, 11 Mar 2026 09:08:36 -0700 (PDT)
X-Received: by 2002:a05:620a:294a:b0:8cd:95b4:c523 with SMTP id af79cd13be357-8cda1a2d933mr338454385a.37.1773245315887;
        Wed, 11 Mar 2026 09:08:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1aa2c3sm184711f8f.13.2026.03.11.09.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:08:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 17:08:04 +0100
Subject: [PATCH 08/12] arm64: dts: imx8mm: Use undeprecated reset-gpios
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-dts-snps-reset-gpios-v1-8-ea1cc09fba84@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11906;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=aCTo7qYWKpC/S8WIFzwlUyvg97RNYhHTiuaNHSogOHE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsZNlhq6V2EWU3sta6PKKGGb0xMqfYQn+ZwkJr
 I8PP05dvl6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabGTZQAKCRDBN2bmhouD
 1xvoD/9V7qgL5AXnvDWXF3gjlopbF+vNIOBY/Lx+jYQqa8eN9fL0Tbq9s4pOVpWixfxLHBwF+Mo
 tQx639Orfsj+YzXtlN41LJppNkMZI6MsE/08WGUQOChT9M0sMGJ0252JPENY4cH1+3K8vbP7SRu
 pByzYq+n0H0wRxvcc3X9lTAuxpIsHRgPr8MSBe2gprJAfJx7ySz60JV9xY8rAF8xB5vjaAf94nZ
 QxsMGy5mdWv0Itd2w0gxHhighfypg62L+W2Jy7SpvzFyOtYBdwhhM+fJ8g1mSVDYNzdKi9ERCkS
 NfbVFqbMjxmNfOHaJ3tS29AiscHw3c5TvakVW41ETrq6VxYEb9RA6eWLFXpvNT9aLgFPWDsHtUy
 sz1SgIPQgo4kUMUCGbshZROcI9nwXsZRhmg1FAaGIXQ/cITCbl11tWyAoGfFxGv3DL9A5fbxAlm
 uTRsYk1oUG5YERD0ulJ6qE5ibyi1C9SyEwpJyu5zN2RONiXCg+jAJCDnu+WGJDAJ0lsBxcrYwtI
 J/Z1VjDx2Dv6xlr9VfOr0sFgHZj84EDrJyl7shJXB9oX7Tuvs3sq+uLThcIyPgg2UimZIMevEaf
 0RAGrPzE3xgmAWvzqSX9XiAYcb2ZdsoNtK++eq147bxidc1SWJLZ8WAOTZ1zwNtRWlhNa5V7Q8O
 3Q1UkLn5qS7uWNA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: vxVMulZ11nJ3eg9dZ7nF3NURkMN_79fB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNiBTYWx0ZWRfX5wzePuIzRLbx
 +nwWuHlJfzMgD5ifGwd1Q38M3q+Dxn/E2zcRLsC63812PZF21W88WiCd3urB7sGi7ABXh8Me7zc
 FE+2QbExC03tzjSk2RyUrkNSiutkx0hdii5WRmdrJAg9Zy3zph7W1QGMBOWhpnQg5pdq4s/ag8B
 1WJh1O04wzLlh9Hw2tOYqhDmZglt8P2nRfTzGg/76673pb/0fohxeIs4Qni6a9ZlBuRRfsgm1Bn
 DaUotp9xKbAzaYWKQ7eAQlF7MVjaEbI17iMGE1cZhTv9sC09ZdId8TagTjNVBrRBAKBQ6//pAWc
 EyK6GtpmyQ4qZZRa5KDrEkB1GM0rlTW0HCA/xq4X80GCHeR32kDTzpyv5FSvNKXD3qN2gvRkFDs
 CB1P11rPqQGTn0nLUusBTbfPWpRTq8K2dh1k/qS1cznLfr/Vv2XWvE6L19gmvQ2al8rdiLROn41
 zzQDBRYv3FHiTe/RLsA==
X-Authority-Analysis: v=2.4 cv=DfEaa/tW c=1 sm=1 tr=0 ts=69b19385 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=n23Nhokuvftmpjnmux0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: vxVMulZ11nJ3eg9dZ7nF3NURkMN_79fB
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

