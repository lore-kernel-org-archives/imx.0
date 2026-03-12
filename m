Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED061402B83
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343109; cv=none; b=ERPqZel2F5JxvQTTCN2LJTmsQ14Dr+DEa0nGHMYKbkeRfnqsu8433vw6jPNXPO1PqZJYjYEkU7BS6pnVrpSipGxRYO9Mh1lAsO+PUHYgAqtYxKGaWb5qzuGt27qB85nH2H9uSJgkvBiDmuuvFJg/XpS5XS1CkqjBej1ag8IT+2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343109; c=relaxed/simple;
	bh=+OfYi35/mvFcBOT9a6DFCCxypeHl6K6c0paRCOWmHsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lb3GezlkETTet855k6BQ6U80M6P/m9iiTUBzP3VPEOH2eYQMLrmBVih7khNfB8361vKB6GSa3Ez4miOyIuirQUx0PasPJsuGxKJWFnll9jmlRiW1Gb6XmHjlku0hMiRwbc1YN0Z35uJOPIAk4hUxLmWywHox9h7FVNzB4IDQK1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IfIkcg1m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iroHtxcC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IfIkcg1m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iroHtxcC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CHrTKr4025739
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ccn/0QgAw+T2Kwh1hmiZq1U1PNoFAig87VYk0VegLCA=; b=IfIkcg1m68gKg+06
	3WZ5zEcwOKtIpmXyOGEL3TqKkQto1CBGecIQlzD1tZUHL2ew2x3GcGiadTPmdolH
	ic/qTzPGC4bYSx/zcmffwvyiTAy08QE65nqTsJY6fVZpcbnYKKOeLoOMeRoHl9ce
	T9LSdSTBTg10k1CO29XUlw9aoZ0UX5XjId56XCOm0wNCzIiSOFy68JqDlQ1cutsZ
	DUTobrVyoMeuDqnMjLgo2/KrsnysDXCyz+OGg2Ks0zZofKRyzi1U0GNhu0hwmu8s
	K6AixTRjIB7tUNTNybQlc8YPx8wKepXZAgTbK3dlOckA1ZesCp4dOwJjVjIQ7fyt
	LmBDmw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh50u8ye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd773dd409so237312085a.1
        for <imx@lists.linux.dev>; Thu, 12 Mar 2026 12:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773343105; x=1773947905; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ccn/0QgAw+T2Kwh1hmiZq1U1PNoFAig87VYk0VegLCA=;
        b=iroHtxcCz1snMBVXbO/iJFdipAMMHESOX3dYVzSjuIoxVjXQuDRFk9Fs7FMCuHaoIP
         wAl2zacz7vg48c6RR+ZFWJvPIZC4laXtQKH9MzY1eRZtHt9D1QkoxXQovruPnzIeQwyn
         rI3M9b9aSVML0qcnV/jucBMW9rYAkbFift2Y5wjLDKfpMJYyjh4LKE+k5ZEoKkD0SfPQ
         evqlvNax6+30WHdVxv01WLKXTgyXkCxV97h6/pqt8saPW7+f37jfiYRL6O5hy226nhlu
         XuK4IiPgtnIRlGAly3ktMf7mPIlGuWGYLAO1X0dCWFwa6eMVTtp4Viq9x49TvzzDNM8n
         4z2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343105; x=1773947905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ccn/0QgAw+T2Kwh1hmiZq1U1PNoFAig87VYk0VegLCA=;
        b=TAQmazSZGDgLt8fvhd7pZ0zlgnSg3U0wxeAIz6Mk7ul6yEuM+BD9e3ghCQRDpGbcEu
         CsdgJgOyXIpfjS7g4q+pCueNZ5J0JpzHjnoSybj4VhpnlJNoVQVg6G+4H+RLSURZh766
         KcKZ9NE/l53xAv+zghmZnfKTCTbyS7btDgQcy3sWc+YJR8AnMhjeteaoq4gQX4RvT3GW
         vgkxW4XNNk8xjtxV6Snfn2ndItgMLo3RJy4qK13+vKYU+J0zU0EVCDYYFJ9Hvb8L7ghs
         pFWW9RpR8TxkfyRMD6UvMWI7/Fj2fvgqQPaTRNBH3VUiLFcz5EX3vMHi+5QcywARIWql
         ESGg==
X-Forwarded-Encrypted: i=1; AJvYcCVt8OetEmM0cMHtKFTOjmKKSqHuoy7QUJkFVYGT2br7yaQnGsa8R0+Ac/FbXbyXiakoOCM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzk9z/DJwSsguwxiPpE/ysVZhSGAyMatz50Uac9nWzHgl+iSiT3
	qUsVvdnuLgucs7PG3Rw5lxAI+XYKjB4a9/q64hiwkozWwFfs9XWJVGpw/ppPOQT7tG4Qcus1glY
	z8Cxfjyy2VJRRmBwL0I5aCWJOqvZhEv3LxrfvuhNUHi++A+/Oo+JnN/k=
X-Gm-Gg: ATEYQzzy0z3lcmX74i+tyacDciE9bu6bkzahOWgPol5xkJnavx/z+xaCiJYn62+9L64
	PGmOX/kECIYbZLt6Q7CvnUvBHNRLDhKQz1rEZTgbLyUH6PkzHcQj8r36BRo4ElbRRrMh8/st1Sj
	rpsmm9V9FynGBPr+I8mcBKd4VpZ2jMAVQT1BT5Ug7UrarY2Dlwt6zXxgK+2wQuTM4/9/wt0EXm9
	f2VwCBiQmSd1tiufidPwhmI/zzTma7piBWMV9k1HKBw9GEYeNVBB6lkQ53iAIWWusJIbWwrujSv
	RSy7TuoDu999qUS4++fH0ggle4uMXtR7iRbUIPxclPt5jRmcrqHBT0HSZOljN2LeCJV05sn0dKh
	JiH3haheOMtUlROq52dp2sXti4XrzvIIcWceBfvl7EEHq
X-Received: by 2002:a05:620a:6910:b0:8cd:b2d8:ec7 with SMTP id af79cd13be357-8cdb5a4c3e1mr127702485a.23.1773343105098;
        Thu, 12 Mar 2026 12:18:25 -0700 (PDT)
X-Received: by 2002:a05:620a:6910:b0:8cd:b2d8:ec7 with SMTP id af79cd13be357-8cdb5a4c3e1mr127699285a.23.1773343104574;
        Thu, 12 Mar 2026 12:18:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485577835ebsm1874935e9.7.2026.03.12.12.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:18:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 20:17:54 +0100
Subject: [PATCH v2 07/12] arm64: dts: imx8mp: Use undeprecated reset-gpios
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-dts-snps-reset-gpios-v2-7-0d5040eb4a1e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12006;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+OfYi35/mvFcBOT9a6DFCCxypeHl6K6c0paRCOWmHsQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsxFmnlATEtl+m1zswUSr6NuxTbAzYAaIffIEP
 LNS5mSU8w+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabMRZgAKCRDBN2bmhouD
 1+vFEACXIMP19bDRtaUqZN/msQld2xxWGze2xcEHHTR6Iiw0IJXNVSlvWGUzboTZ6MUNzjEE/mn
 7NH0bl5j9Ffy8ZlX4f1VM1+w0d/E4gRgiquRwmm+eUPPA/oZBddfzRYjw9EZPr1A0ngXT8j4dPH
 THdj/Y8RYLZdZNOxTroIP273q/EBo3+gNx9NNvI/d39e3MA3ITfGCSnmXNMGvFc9JzwHDF2pxdy
 lc3UFgQ8VCYBSpk6KTyzCLH96WO5gTuWClJMT0MeXhrgMGq/dm8DjzkmW/rijLc9dojfIJcpYDF
 ryCBvxkean/bPGfRJ2Q1MSmZ1+MTYbJmXDKm4TcIlAp3FmiV0OlyWrZvpdU2zy4EaTgfkReOmsp
 NXB8kDmEzvIjnRUEqVPm/tRfUrZjGxG+b+P2+xDwJFl4lR71lUU5I3lbRC3FczJQuE93d28Mkgy
 bQMHMSO+aXwdMJm4euVo2tFEP14J1QKtsdyM9pAWE84FUcG5RPtntMkC4NYBkEZEo5U4LXbt3DZ
 MHWQwr2q15LQBbkK8bVaVc4jD8FBiZ7Cvy8FX9DFD06SQ6Q5pFEcDxz/brUGn/VdkjJa2uZvM1G
 ZYmdOqEOBSsAtVpuxIVYfglcZFrTU4Ye2gdhfpkvQMhnovk6TaF50H4cUF/tC2F5WCTKjvRw3Fw
 z030qKVG9FOBHdQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: D1MWDUptNPVu2AIJkkeP8L_khUK-uMMa
X-Authority-Analysis: v=2.4 cv=LvKfC3dc c=1 sm=1 tr=0 ts=69b31182 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=cw-Pq11FuC5Uhxb-6mwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: D1MWDUptNPVu2AIJkkeP8L_khUK-uMMa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1NiBTYWx0ZWRfX76e9Vc49WxiJ
 84sjJMqITrSIchyBnMo2lbi6tUbOaVF9nOwUnVomGeWGTkvaiyAZhWbnBqmunN06tILSIvlE3HN
 XMMoA3hHI+/eyGpp2tL9taWWKEw665VWkIqaULWU7YMOy2T4lq0O+sOioT4N/NrxzseP9R8nuKh
 bnabP+4VOamNOnt9t7ppoYkVTo1HMh2jsn1Ye9o2U3BZEcls2tie8v8mz9MCDEl9sfpbtUeseI3
 TvtiSywGEj+KkvcpT9+yyqFRD7pecVRGP7R80VhtsNeWjDsExgiWmgzy+KW8POCMv56cW41CDgP
 mmixZ9OQqLkVtJ+d1aOs/OdwV934sSJDZkibgQfV9GihiopnjuAEXmGrAbFZ8IRjbMZ3nJBa7LV
 ijO9PRTbiIaSplzFadfauhiRjeAhUux2r0KhWkkGei9dO9CCziw9C/vjKLXBHv81QBWSIAB4Fcr
 mddb9ysoquqIx+bL9iA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120156

Freescale i.MX8 PCIe host controller bindings, through referenced
snps,dw-pcie-common.yaml schema, already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" which is deprecated since commit 42694f9f6407
("dt-bindings: PCI: add snps,dw-pcie.yaml") in 2021.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts                 | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts         | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts                 | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts                 | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi                     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts                        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pro.dts           | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse.dts         | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts              | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi                    | 2 +-
 19 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
index f654d866e58c..7d7d96f0642a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
@@ -568,7 +568,7 @@ &mipi_dsi {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio4 20 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 20 GPIO_ACTIVE_LOW>;
 	fsl,tx-deemph-gen1 = <0x1f>;
 	fsl,max-link-speed = <3>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
index 31c33acb560c..001430130e01 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
@@ -530,7 +530,7 @@ dsi_out: endpoint {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio4 21 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 21 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
index 7e46537a22a0..bf6c53700057 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
@@ -614,7 +614,7 @@ &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
 	fsl,max-link-speed = <3>;
-	reset-gpio = <&gpio1 5 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 5 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie0>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts
index 3d18c964a22c..68a481965cf0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts
@@ -237,7 +237,7 @@ &pcie_phy {
 
 &pcie {
 	fsl,max-link-speed = <1>;
-	reset-gpio = <&gpio1 6 GPIO_ACTIVE_LOW>;	/* GPIO J */
+	reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;	/* GPIO J */
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts
index ef012e8365b1..78f0ba14ea5b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts
@@ -296,7 +296,7 @@ &pcie_phy {
 
 &pcie {
 	fsl,max-link-speed = <3>;
-	reset-gpio = <&gpio1 6 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi
index 3f1e0837f349..1c8a380dc01b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi
@@ -310,7 +310,7 @@ &i2c5 {
 &pcie {
 	pinctrl-0 = <&pinctrl_pcie>;
 	pinctrl-names = "default";
-	reset-gpio = <&gpio1 1 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
 };
 
 &pwm1 {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index aedc09937716..fcfe89cb76cf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -769,7 +769,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio2 7 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio2 7 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie0>;
 	vpcie3v3aux-supply = <&reg_pcie0>;
 	supports-clkreq;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pro.dts b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pro.dts
index 36cd452f1583..a09b2dc34429 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pro.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pro.dts
@@ -34,7 +34,7 @@ &iomuxc {
 &pcie {
 	pinctrl-0 = <&m2_reset_pins>;
 	pinctrl-names = "default";
-	reset-gpio = <&gpio1 6 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse.dts b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse.dts
index d32844c3af05..8e87a9543382 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse.dts
@@ -57,7 +57,7 @@ MX8MP_IOMUXC_SAI3_RXFS__GPIO4_IO28		0x0
 &pcie {
 	pinctrl-0 = <&pcie_eth_pins>;
 	pinctrl-names = "default";
-	reset-gpio = <&gpio4 28 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 28 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
 	root@0,0 {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts b/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
index 2173a36ff691..393cca39a0d0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
@@ -187,7 +187,7 @@ &pcie_phy {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio3 2 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 2 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts
index 86b8c5af4153..254d6930eca1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts
@@ -243,7 +243,7 @@ ldb_lvds_ch0: endpoint {
 
 /* Mini PCIe */
 &pcie {
-	reset-gpio = <&gpio1 8 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_vdd_3v3>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
index 0fe52c73fc8f..7a4681578b24 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
@@ -264,7 +264,7 @@ &pcie_phy {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio1 8 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_vcc_3v3_sw>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
index 9317e62304e3..1c2e5be5ed9a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
@@ -123,7 +123,7 @@ &pcie_phy {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
index 76020ef89bf3..89681b21ed36 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
@@ -154,7 +154,7 @@ &pcie_phy {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
 	pcie@0,0 {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
index 5eb114d2360a..90d15340f935 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
@@ -166,7 +166,7 @@ &pcie_phy {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
 	pcie@0,0 {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
index 7662663ff5da..e37f580fa90e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
@@ -680,7 +680,7 @@ &pcie_phy {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio2 17 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio2 17 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx.dtsi
index f90b293c85fc..efdd4b0231af 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx.dtsi
@@ -140,7 +140,7 @@ &pcie_phy {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx.dtsi
index 2b86cc62a41a..fb12bfaa9b77 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx.dtsi
@@ -237,7 +237,7 @@ &pcie_phy {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
 	pcie@0,0 {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index d31f8082394f..0f5f924b6a6d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -801,7 +801,7 @@ &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
 	/* PCIE_1_RESET# (SODIMM 244) */
-	reset-gpio = <&gpio4 19 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 19 GPIO_ACTIVE_LOW>;
 };
 
 &pcie_phy {

-- 
2.51.0

