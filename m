Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010058.outbound.protection.outlook.com [52.101.69.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7D52BE031
	for <imx@lists.linux.dev>; Fri,  6 Feb 2026 05:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770356960; cv=fail; b=QvzNs9qu0SIbWkFZBDqjby3w0JiVqMkxEdxC4CmWmi+5Huj/B0Um4tlEhGDUefwl3N+Ov30CCM/v+yppjUVykHC+4oTrvNJeel8+ujQWJ0xAsZuy8TjnSpxob0HytMreQPPAvneDX3oQcCB1AuJRKg36AJE631d/Cn2nYbhOpMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770356960; c=relaxed/simple;
	bh=B5zLa9doiVV60hE7OBWD+PVp9XsCwON8I2ilnT8fNyI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=koKJQ8ZEC/NaZQLleYRdjS0Kel8G1aCG8YrsH7pqigYBRQVFJpQrT62AcwsWg8klHKeOlHxSBVCgGSXJ7C9b8GrEZsXdlXQTRC6Y0kHwN0V3yfyFvJugiTIoubd2lTCjCD/1mnFtoThgzb4fb4ENNOrxS0QsVb7OHYPVPA7/XDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fQ9Vpr6r; arc=fail smtp.client-ip=52.101.69.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fQ9Vpr6r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mO3HT21iWOEB0S5hniuiRrV5g2WzOJWLl8ATU9MEJ3bh5BmQxqggTo+USUSoG4Zmx1oYeROPYfIwaOSzTKSlsQy6mFaorstK7NvQppmaSklwDprBEE66i+aY6fOMgkuGQ6YOHSotuOhgW0gDnEWkGYqa6Oyc+mLjv0Brnpnz1Oe/3TkjuVRPNyV11RCgMMUv1cVXBhhYGN1DzmkhFCN/rRcvT5nN+OKK/MPT6Xp7GvwoZnVr7Rb/yF/ckqROk5Jq6zxVwzKsbkasao4I1SYqm2AiqbcXG4uFDd5l3AqI5lCxhreFsmA+qeC0QxmJ761r4+vig6TvQBNqVZr7PQW9yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=otIk+bjorigoJFEHaBI8nknbUjtn1h2Ohm38ZZiQVJ0=;
 b=JzBDq/memnX8/IfFf+efRPNs7SszUTHp0EqTWIykYCUs8eBZyC92ddQQXTGJP7ko358hlgYuUARbK9apLo60Ks6QBqwLHyvg6PZDGERhpmd1UT6TG0hUzWeRe7Qbv9IKjJgxga77skh6+bfaYyN6d+qlvF2i1ldXblFoTKBp1hSqdwAN0Oxk3LGHa7SFPRdKxd9gZyDKdwjwc5g9qiPK4F0jEOKExtAPXLwVRn0S0qGQ0LgDDJ1f63GcXiRRkB3Iw/LkuOU1eLHoB5kK3v7VkZwLSkEzzigkDcZFhzkfDn5xTi1URttMh23bCvZzPy2RO83MoM2+6RLDEAZ9e6eQDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otIk+bjorigoJFEHaBI8nknbUjtn1h2Ohm38ZZiQVJ0=;
 b=fQ9Vpr6r4KTy44xBssIqVcnSXBNRlya5zq+Kt/cU+EsDSCLmbs5Q6Po2s15X99Eh8PvMt3OEM5wOHNDRDcN97Kr54+mW7Rfa+4fkbMfti2cP9+2lu/z/ktm4D0M9gaHKq7YjLMvo+Hi/CWlGsI41ssyyg6dEidoxoE+JVOoQ7jLf+wHwYugZBJE1EaIPChGAsWGEzPOsTV/DUvxvfi2ukjC4cgK1zzEZty5L8v+1qW4rq+kAUn5vy5tqOrYxRnp4KVvfEZXz72L2FXJoaoyre+DwgzBhwZ4WD/iJTu/emJjab5V8mm3AD3DyxZDwOB4xe9IRHBIOFC1oCO4Q99+y6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by AS8PR04MB8803.eurprd04.prod.outlook.com (2603:10a6:20b:42e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 05:49:17 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%3]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 05:49:17 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v1 3/3] arm64: dts: imx943-evk: Add pcie[0,1] and pcie-ep[0,1] support
Date: Fri,  6 Feb 2026 13:50:07 +0800
Message-Id: <20260206055007.3995679-4-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260206055007.3995679-1-hongxing.zhu@nxp.com>
References: <20260206055007.3995679-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:194::7) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|AS8PR04MB8803:EE_
X-MS-Office365-Filtering-Correlation-Id: 736c0fca-a6e3-4f47-444d-08de6543777c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Upd8SgrzN9TcLCyYsB3YPQtsJt4vpr2arj5Ol4m+K6hJBNXj3MdnaJ6ekXEY?=
 =?us-ascii?Q?XcoZ81uMpeWyI/+6hwGcI4h0Nx8rXqlXb781vAueu2NaO5Dq6nzfAMPzRXAF?=
 =?us-ascii?Q?RFRiciB20ldREnPF+O1rm3MvGyMVfLdv87VPws/LMvv5fWq6bCj0qioS4uoM?=
 =?us-ascii?Q?A//VEItuFLo6n1Iudw79lG+Kz+pzODF6Z6jZVMsM5vI2EkInOPKlf06Wh9Ne?=
 =?us-ascii?Q?9IDwwa/3cFJItmQZt3ONeZqjqejCkv39KK93HwUJ8iep9oBxoK9yvCgve+8P?=
 =?us-ascii?Q?Sot73hxpUl1fRXG5Mz6fT/x3hS1mjFnhHCn95PhIRIWdIye+Bu9JYpxRCDgR?=
 =?us-ascii?Q?HDgftFZEGwCxX7z8iLipXFutYMqE3fs0DK40IQkbanoB0WQfR697V2F75YKE?=
 =?us-ascii?Q?jO8/O11/bx5izbttj16vILBVgbrSR+VK89c+v2K9bmN6iiEg59VEaUPEL+Dh?=
 =?us-ascii?Q?cnEWMann/XvDRmbHaC5HPfVXNx+QAHRSiVM8K9lLAmsmIRskfzwC32Pd9Iru?=
 =?us-ascii?Q?uevEJVFs1Lk7pno31zxIkFCosx+eXd1kHcIv0xy632Ya084j1bRccOLaRxqb?=
 =?us-ascii?Q?kJ0mIukmTgiXkvvrI+5mB/V34eahXOJgy3AnMoSyV31nESrgMpteco3tNpyA?=
 =?us-ascii?Q?/pztL6haQjQfPLkuUFdl6XMm4N6594MxjZ3to2f1lbNC873e3aDnW05nprw5?=
 =?us-ascii?Q?tLkfAMoZWpNI/pxwt0k+N21DUORjVNeQj0j9QAoLWiy/mrCASSn6+ptA9+SD?=
 =?us-ascii?Q?OQa82Xo8QVZ62s42YUjpBdY+QY6RU1EaadKkcCiRVSJXU+sxX/NkC6TPIFm9?=
 =?us-ascii?Q?nmdvXHqGt/y2mVSNdN0tx4F1CvUSd7oQWWHKSAIDnkS17mVuw+6K0yI6QJwd?=
 =?us-ascii?Q?U1Th8yQUGl1LT4/71T4kuJYl1wdAHef9RrnAhrgc6J/DMhvCIq1BYEFxr6vm?=
 =?us-ascii?Q?6MZ+gMfogmU9ZMtq6GAaL+EfxhAzT/YPQtsV1+iu64D1xmFncmt5vARd+Ty1?=
 =?us-ascii?Q?zF9k9VgN/UGB7RnYvoI2UdjgadAGDIYxga2WtDsPw8dAZqypAM6A1w+3l3dQ?=
 =?us-ascii?Q?rxmcoxmksO5lgwxzKkAeuvjmwrL6t6BmERCpKHngePSINyuRfYKXN0xn/jao?=
 =?us-ascii?Q?1IsZ8ilSt77t5IqSMiT7EAkZWaO8gIHgJZN+W/ST0CO68eO61SMVkS5E47Eb?=
 =?us-ascii?Q?MtjhtE8nOTA82NPcddW1tkBIuoGWGxQ9JmzvICKp9rmaYC4ikXwNNnaFrrZH?=
 =?us-ascii?Q?ktYqL2PbRR2XoC/Ezs1GkcIuRsxXb3yF6vUcgArwAGQxkSxbXfPzBlVo3TqI?=
 =?us-ascii?Q?5KUe/vS9GT4eq7IQEGuLmAJL82I5GbdjCcuKpw/vTpQKkzjAClAXeuT0MzIF?=
 =?us-ascii?Q?NcI3Z2ORJcF0x06+05oJ6YRfOxpVK04o/WbtlEWLsaH2X5qzxyhcLoPMrBaR?=
 =?us-ascii?Q?k61Aq/vLJZn72m2kBICGWZy04vHyVR0/ScDdWy+3kOnL4MD7w/Bh2GIkb0Jn?=
 =?us-ascii?Q?YxmwNdM0c1MFNgMqnP4gEgXiMTwdDMiZwCw74BKQgKg16AzHwwlAvZRpGPOl?=
 =?us-ascii?Q?WZCIfuxocjteVoUYHfgv4qq5cpOkYY5s0as1sQASYyoT74W0pl11+UyrQU6h?=
 =?us-ascii?Q?Pttg8nvmNrgNAOVBGnXVycI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Eyh4xMiu/D9uQcgHsIPV+LtkZZscJIzJboGWUiOEFv+cVbYceDKQvxhi3bt7?=
 =?us-ascii?Q?2QjSZhQCjbrxifDFLXfQeGJHoRyLRPcbIY2fnMEvbh4KiNgTMn+5NUAqeoNY?=
 =?us-ascii?Q?Us3bf/H0YXc//PYSNzTxe6U9qn5FJnSlTamYkORfp5Noaw2a+bEFS+YB5GEi?=
 =?us-ascii?Q?DNPaj7r5XyaF/lwuMCNdmUSsRelyw22XAWff5rOZgO12o8X2kEJUdyCLeFcz?=
 =?us-ascii?Q?yPOmY4exRu16mxMwaTQWS00pMJWwuMskyZ1KS0kYQH9x4cc45ygtuIxPsV8O?=
 =?us-ascii?Q?2KuR9xg7Khzp4SiQQurLrDNmprG61dav99Bt0qAZ/vb/9rTIx0nObhm6L7lw?=
 =?us-ascii?Q?MSdhK6mE31O7Rv8PYazgUc12TJ9J6PhH8YXGueidXsUWnoWMg65WLLl0rZbu?=
 =?us-ascii?Q?v+jyxtYasAcTMSZmCaRsNsl0KmDKKmGZf5reF68Eg3b7hnGnL3+/xopFG6jQ?=
 =?us-ascii?Q?Myjt28li1bSFaAOtE5EQHPe5Hlv01YeYS/oqnh2p0RIsCgGEVBR4c/05f/cj?=
 =?us-ascii?Q?vdkXXpl6+poikCcgVOVfu9FbjHl88316/XW1a9L6sDZWsajA93i2nkglHP21?=
 =?us-ascii?Q?nbEZI7RkY6AclzMOLCXpYN8KkmdToVb9sVoC8rnL7yLomHlX7Q+dDwHUZ6XA?=
 =?us-ascii?Q?kYkDimruGIEINxzfUXaNaoDOOUP4kIzfyHp755B/JRDpMCZjQ2KxxGzhLzDj?=
 =?us-ascii?Q?EohvklZKZawCr9boe3PEqG13dTnArJ5esejO+inLmfsE2vBViTqVTgPp3USV?=
 =?us-ascii?Q?eFQsDAOcUesiKw+T/YoA/GHMVJT5zGAFrqq8Rc0wOwC/bzmrplCCNjvhwsIt?=
 =?us-ascii?Q?576x3j+UI4IVQp2vavVkIMhqPYpGFm9tiqIdJX1MpBCAt9Ri2zdzFdR6zbol?=
 =?us-ascii?Q?pl3+2LtA4XGVs67rotATVVJ5Sd8ViE6aSng0PL25rfTUY0MFv0PfvbzWL3CW?=
 =?us-ascii?Q?I2/46lAvVOM74nytzCcpJTV0HtKLNNyGJ43D6l2kC0VgTX0hknQfiX7/TjiG?=
 =?us-ascii?Q?XslVmYbO0b/QI8E3drHNwzEZwDg+suJd/xkoAPV0B2fM3zH4HHBGUDbEdO9/?=
 =?us-ascii?Q?pSbdv+IPIM0Ea3b2zN1Hhs/Q0l/ZA2+gFRE5rSbYHqJEQt7Gdj6UIAXNFQ+u?=
 =?us-ascii?Q?jQbvlsMSHepe0fzp97kGu6vdNgB2ps8bbeYEbOA+TujbMXp2653nj/hB9yzL?=
 =?us-ascii?Q?dLC+JL8FPocl+b2WTMY3jPmDVCNV+iIPJ5s+Zg4xDffTXzeXuVAUEeRSOtDx?=
 =?us-ascii?Q?80bhh9kBAEW/1Y9kYzPoY34NJhrt6UR6agXw2CPkd6GJL0JsPWVnLOwGmnno?=
 =?us-ascii?Q?+u2+YA/VfVJvVGrEZJfAt8sgf2N8dTL7ehNFY7MkDvpjLLRr172cl1Bwfqkd?=
 =?us-ascii?Q?niwcC1HJRBQ9b4BbBe4TtOnSy7QsMCb8omXXUlZpMOFDZyPas7Uyj0LCDxR3?=
 =?us-ascii?Q?q4gyxz/GFledy7eKtOHej5DNbt/Z2rpv9t7BZW1XsN0FoGWY7yXcC2zNrNQG?=
 =?us-ascii?Q?Kh9FimogIsu9EwMKpUFn+aJFvSeOpV5eiXxvrLywe21OHPO4Tv2foQfXK+3v?=
 =?us-ascii?Q?UeGSpWZ5gArW/VCZV1es+xXn29Up29eDENNYzVnaKFRfXwo0npUd94+4S2np?=
 =?us-ascii?Q?s1IgEhwvoCtyaYCPX/yLr29vwfanFs8zwKK3kZpkIlke9KJEWCAf7PYWdUDK?=
 =?us-ascii?Q?mgie5LhQp+IKe53Ybr7p1P4kHB3fqOYWq/dC8GsRCl8oS2flhqI3k2pbOGK8?=
 =?us-ascii?Q?YxdeewMjOA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 736c0fca-a6e3-4f47-444d-08de6543777c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 05:49:17.7005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BVK2C7GMF9YgyU3UcKDFBgev4MP7GDwkytSqA5NJiFaimz98r2EtAeplfI+gZw1So20nrj3ChpQLyUYi0wwDYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8803

Add pcie[0,1] and pcie-ep[0,1] support.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 108 +++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 31fa9675cee13..37a8349bc7905 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -53,6 +53,13 @@ dmic: dmic {
 		#sound-dai-cells = <0>;
 	};
 
+	pcie_ref_clk: clock-pcie-ref {
+		compatible = "gpio-gate-clock";
+		clocks = <&xtal25m>;
+		#clock-cells = <0>;
+		enable-gpios = <&pca9670_i2c3 7 GPIO_ACTIVE_LOW>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		off-on-delay-us = <12000>;
@@ -74,6 +81,41 @@ reg_audio_pwr: regulator-wm8962-pwr {
 		enable-active-high;
 	};
 
+	reg_m2_pwr: regulator-m2-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "M.2-power";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pcal6416_i2c3_u46 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		/*
+		 * M.2 device only can be enabled(W_DISABLE1#) after all Power
+		 * Rails reach their minimum operating voltage (PCI Express M.2
+		 * Specification r5.1 3.1.4 Power-up Timing).
+		 * Set a delay equal to the max value of Tsettle here.
+		 */
+		startup-delay-us = <5000>;
+	};
+
+	reg_pcie0: regulator-pcie {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIE_WLAN_EN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_m2_pwr>;
+		gpio = <&pcal6416_i2c3_u46 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_slot_pwr: regulator-slot-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIe slot-power";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pcal6416_i2c3_u46 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reserved-memory {
 		ranges;
 		#address-cells = <2>;
@@ -144,6 +186,13 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 		device_type = "memory";
 	};
+
+	xtal25m: clock-xtal25m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+		clock-output-names = "xtal_25MHz";
+	};
 };
 
 &enetc1 {
@@ -609,6 +658,18 @@ IMX94_PAD_GPIO_IO28__LPI2C6_SCL		0x40000b9e
 		>;
 	};
 
+	pinctrl_pcie0: pcie0grp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO20__PCIE1_CLKREQ_B	0x4000031e
+		>;
+	};
+
+	pinctrl_pcie1: pcie1grp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO23__PCIE2_CLKREQ_B	0x4000031e
+		>;
+	};
+
 	pinctrl_pdm: pdmgrp {
 		fsl,pins = <
 			IMX94_PAD_PDM_CLK__PDM_CLK			0x31e
@@ -756,6 +817,53 @@ IMX94_PAD_XSPI1_DQS__XSPI1_A_DQS	0x3fe
 	};
 };
 
+&pcie0 {
+	pinctrl-0 = <&pinctrl_pcie0>;
+	pinctrl-names = "default";
+	clocks = <&scmi_clk IMX94_CLK_HSIO>,
+		 <&scmi_clk IMX94_CLK_HSIOPLL>,
+		 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+		 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>,
+		 <&hsio_blk_ctl 0>,
+		 <&pcie_ref_clk>;
+	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
+		      "ref", "extref";
+	reset-gpio = <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>;
+	vpcie3v3aux-supply = <&reg_pcie0>;
+	supports-clkreq;
+	status = "okay";
+};
+
+&pcie0_ep {
+	pinctrl-0 = <&pinctrl_pcie0>;
+	pinctrl-names = "default";
+	vpcie3v3aux-supply = <&reg_pcie0>;
+	status = "disabled";
+};
+
+&pcie1 {
+	pinctrl-0 = <&pinctrl_pcie1>;
+	pinctrl-names = "default";
+	clocks = <&scmi_clk IMX94_CLK_HSIO>,
+		 <&scmi_clk IMX94_CLK_HSIOPLL>,
+		 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+		 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>,
+		 <&hsio_blk_ctl 0>,
+		 <&pcie_ref_clk>;
+	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
+		      "ref", "extref";
+	reset-gpio = <&pcal6416_i2c3_u46 1 GPIO_ACTIVE_LOW>;
+	vpcie3v3aux-supply = <&reg_slot_pwr>;
+	status = "okay";
+};
+
+&pcie1_ep {
+	pinctrl-0 = <&pinctrl_pcie1>;
+	pinctrl-names = "default";
+	vpcie3v3aux-supply = <&reg_slot_pwr>;
+	status = "disabled";
+};
+
 &usdhc1 {
 	pinctrl-0 = <&pinctrl_usdhc1>;
 	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
-- 
2.37.1

