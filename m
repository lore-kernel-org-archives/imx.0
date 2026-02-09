Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010024.outbound.protection.outlook.com [52.101.84.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA2E280CF6
	for <imx@lists.linux.dev>; Mon,  9 Feb 2026 05:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770616649; cv=fail; b=Y7qzh2fPn/lCbklXIamt7YTUmKcD37Jl47iFiE6KAEyYvSE0i3juGwt/rrMhycr5PJBuSovo3Lpc7K0A78NWOmHly7PxyIvb36SGpPxKvDnoDY1TmlmqC7zWcfUzyzJPG6WDYM6BCqHLNNvjgobyKGTBj1HzAN4q+kUCif4Jrcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770616649; c=relaxed/simple;
	bh=79EgKcWU1EdGzV9SRMy9jxGHO/7l3H9mIuuSyPd6p4A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b7s7RiqnKMFnVRyTHFHs550LFvbthbQtIcNhMXuXwTMpJ07G/nFHumYPJg6+Pyys4Nb5pcDfVmgdJxu6y0FDi7J8gNKRN5hH8Ip3XFurlyEtRFYvy/vdSJ6XsKIZrIvto9+V0fM5mIpF23HwQT7ZyCYMYAPiYIMIpqtkIOvnd9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=H0ls0yyN; arc=fail smtp.client-ip=52.101.84.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="H0ls0yyN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CbUhtb1iHvJR55Z9i8AeyOjF+T+U813zwV9S4PZzYacf85+1HdGfDogzCUAwIrVAQd9gRDf0+sArO+bbDZGWJ1IPNXJHjdna9osEkfh4XTONp/QvZzVZzwvpdf/u7gGwYfuiG2nUEQKh2pQ4zozpMKVyAFn9vTTGLeQP/aBtfbNLhVheXWu9QsHtL8DL4Ggtbwz1C/tm6umzYclnzOTpj5/CMRsN2OtyCqtn9frmsh8RfMtuNpoasCda+1HbgI6ibznOVynOn5wWFx5MzFvB000HqQbfbIcpKreVL8TGog8yol0g62jowMRaslvo4oRBpjUiE+27V5KFI0ihHbnCug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbBxEVR5+liWhuWbw7FKa+GemtEo+q+DQTcvIors7zw=;
 b=BqHM1ywkYqPWE6QML8xXmJOii2x/FIHj7sbNXD9GFxPQg+D78X+oBptfqiJVtNoiHBCIBl/L/VLrqewgbQ0QGGfKSafNZ1yRRicDTYKrELI80UrD4J6hbZOmq/KroOdNsbqOjB/5xuzxvs290DFXvf6/WQoez4uvf43tmvDStWtpis7w/7oaxa35msRy2Wi8g6qwVV5mxyfICLUojPkmOuwrriiIE+LUmnoy8nmtgLtn+gVL2qAlG45oy3UrsV2xXEgd9+C9THnPh/2SagxyEidlnX4LEOaDLo4T15y/XZ8zRF37QZtN6FC2Lq3xFXra48VCtU8FDwg3eFeL3dVWuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbBxEVR5+liWhuWbw7FKa+GemtEo+q+DQTcvIors7zw=;
 b=H0ls0yyNZDSzGAQpu3vZnMaUio4rel4YH+xwpkbmr20exlr6fCFhrZGnOwxZHH2vUbAoTY52eMDs5wg5SNndSMujMYhAIL5YB9cirBycLviHAqeY9lUJ8x+f07C+7cpDUXot58eDkZCo3bZvKKzsA5n6I9Xaou35wEhBCGKO8amjtIYH09zr8kqsxn4+GyoeMcTjUFnojm2+tjlX8XlISkUjwIOVXmJ5dj+/0h3wm7WgRuo5Wgwjtp0UXlYIwlGd9wrjI82FcKH+btO4DiosGSgOeo0hMozSm0oT8G9mf9F6zB7T3JdRNCyTDWmqKDp4ldlk6WCsiJHR5MLIdtLlWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by AS8PR04MB8994.eurprd04.prod.outlook.com (2603:10a6:20b:42d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 05:57:27 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%3]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 05:57:27 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	sherry.sun@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v2 3/3] arm64: dts: imx943-evk: Add pcie[0,1] and pcie-ep[0,1] support
Date: Mon,  9 Feb 2026 13:57:45 +0800
Message-Id: <20260209055745.1545129-4-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260209055745.1545129-1-hongxing.zhu@nxp.com>
References: <20260209055745.1545129-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|AS8PR04MB8994:EE_
X-MS-Office365-Filtering-Correlation-Id: d3846996-4e78-4b19-3aa6-08de67a01a4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z9omqDn+OSMVchol1LynkDSncMgTMrU49rbXxzyjcsCE+Sild/bzq4zkgVZ0?=
 =?us-ascii?Q?rulpRmoC52zno/ydapKsaQQVVHD8GoVdDUZI1L4WETX9jh7zxU/47SysTnBZ?=
 =?us-ascii?Q?pulSP2IzTR7JP8tB8fpZWkjjhG2eZUcrTPkT4FlqgTTCNCtPnn6YYcKjJaUf?=
 =?us-ascii?Q?mi0lM14gabLerIzLxNQIl55KX9j+75lhqEmnOLhPVLBztLaGHVGYMy8h4uex?=
 =?us-ascii?Q?V9Z2d2MNx9Wbs30MrDVcCCSOcOfj/mBjB9VFHVsUKukPRDmWtJe2AnikMhOv?=
 =?us-ascii?Q?EYGWkKlz4EYSB/vbGTQiqNV4t0+p+mFNCi3hjGI2W/+OPkYzTcy66gC2q2bV?=
 =?us-ascii?Q?xUoY4c7ruF7nY+k3LU7eeuqq5LgtzMU1iHkE3K2jE3jON3vzssKWKav1deA8?=
 =?us-ascii?Q?5xgcyyeWH1pQ26Seg7XyZvVjp9XKSSG87jM7IPR/J5ggpS+PdinDfGGJow75?=
 =?us-ascii?Q?mMooY40MRYipdV8aMr89skTnPvZvTubnCdR8e2ARX3cCoNxazziUZ5FlXxmX?=
 =?us-ascii?Q?qGp997wOMxOJs3laOhKo5egj1VkFFyx2bDztvi6qc3K4ai5pNfTaal7j04qu?=
 =?us-ascii?Q?tphSr7tjhVKHQlc3hOzzYXOOGuFVGOHuVCusmlhcwICdlG2V+Z6Vu4nSaMOO?=
 =?us-ascii?Q?LlMAYROGZU/aLha0o8sm2oQMIpCy6+eFCchd123UWHyIoo0ZMFJdDxbtStQy?=
 =?us-ascii?Q?+vADJAbUArVgHSXp0+yRU6wbK5+BwIV7uzchKkbAKeVsLQ5Aa0YkACw7WzRQ?=
 =?us-ascii?Q?YjoKoypWEV7D2upw+fPS0I5l1iUVfdWl/HrUve6xrDJ+5MCQZidH4iq5E+uP?=
 =?us-ascii?Q?DoBQDxQv2U5tZ7LLa++iU84NhIjj4YIzUfike0eY8QIqrvfm8BqgsT+gHe0H?=
 =?us-ascii?Q?htREMbDJjDIweBFPq5SURuzURjXiURgwMznOA9cjF7m2KdmZ2OyPKcvd3W8M?=
 =?us-ascii?Q?ChOMeyrlX9QZFI/JctIitIPDvnSOtC/d1ctzjDYvImn4aqNgpFk3wu21Efwl?=
 =?us-ascii?Q?PhvYJUZyrDRPr4h795FMUD3LDfDJS1f+XhU7Qp1EI2wLDePsr+R0uadDz05l?=
 =?us-ascii?Q?PXooy0GI90bvqtivd+6p0MwKYYYVG0Dt0w73l4ksg2HwxYgnpU4zmV59paZ2?=
 =?us-ascii?Q?Ej24VMFA1JZVKLKRImYjqy9qoJkgFTWud3XmQx3DjRTU++2o5cUFDZTmJqHi?=
 =?us-ascii?Q?zEESAzP80kyUQ8hovjZRMcdug/9AgJybTFL65tIWVRACxfI/VUH+gl2yuxZz?=
 =?us-ascii?Q?XPxl8u0//c3Y8ufubR7oEkVK1VkIfO6uWk8msrkYnKAhMo1V/c7LWJbkyy4m?=
 =?us-ascii?Q?fvuNk1zvAE2lno8bpg3jvCdCIukD0ZbnmurG2KUmw0agICH39/P6w4XGtMPY?=
 =?us-ascii?Q?WdUn1RJAermzQl30zc2wd0ha0KvllbNp1LHktjtADa0b6uGuYoqi1l2MgZ4T?=
 =?us-ascii?Q?MKl8gDRVYRplY9gQucqjGBvHMN6SjEvSlh+0fER/Ro4idmzjd/fXPAfhwAup?=
 =?us-ascii?Q?fvdTynGeL20xPFxW8ToDwC2DE2oLDAAt3hTuJ6obc/MyjMgTXJNSI7/QkwaA?=
 =?us-ascii?Q?S2vDzcNHUWlEJZHwfSl24hPwBsn2QJga7aR821H74sbueM5jpO6DlG7k2pX8?=
 =?us-ascii?Q?TpA4EqR/qg+QgcH5h8QtBCU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9Rm7elQbJn8vJyLjLzjBaBf8eHnRXq0/zN8/ew9jbtsa1vtgXwRJwdxb1KgM?=
 =?us-ascii?Q?W5N0ZjpxEtNl9hoPgIGI+cUnl1X8oiSlsgTYT6vDvEqyRwohRDPxwoW8q8RF?=
 =?us-ascii?Q?grNxU6v5YhX2uxN7FZ08BqG6WjTyMUSNQxtZ9RSimu4J1sE1Bb/qtzNmx/Q9?=
 =?us-ascii?Q?F/cuYuggNOhlANmWwypLyiQxIqyxIHpktIEpA1764Bjo5pM1kZxTBka16DuW?=
 =?us-ascii?Q?wqgAoZswZRvsq3phZ37oDXxTQoiKvhZCMYnb7QFojlxrGBvWx/s0pstmTR+f?=
 =?us-ascii?Q?plTH0WYVF3jZ2g9wqrJUOHmeATPdkuDRLx0Kc+1zauzGLJWc9pLo3+z3zFIE?=
 =?us-ascii?Q?5hdrRUsG3KoLvkLnZuGlkWYwHoVYR+uWo9jAZT+70C+B3PPJvy5rBavyJoTN?=
 =?us-ascii?Q?J5YDgAjUTIMJ2mQhuzKzroOboC929pX6kaaEBhGxdl143OVwED/ELgvQ+T3a?=
 =?us-ascii?Q?0juzu/1cA+pK6e290QkRZE6y6Gn0n0K8eHTA9f2ULvwefX52X+ORv4etqUd2?=
 =?us-ascii?Q?sWTtFWjVXZxMdycT4bXcYVAMpmheBi4hLxWhsWBXfuH0ToEq3S/ZT6kOzY8o?=
 =?us-ascii?Q?1RPEjqo5fa9abCWU0a/RDiKvY2R6U6R/RQpK9nAtZpvw0MkwbWDKZADVBSDC?=
 =?us-ascii?Q?ARpbR0kPVAqJWSvS9DMbRdxQX6svmSAmsHQqqIhkRXucM0BUTOeg37HlOsOd?=
 =?us-ascii?Q?N7XAJMdpzhAQpnl/eEjL9OzrSjuMnRddwfSPIXlfyUSh0CZJxdQ8kDUOt6tN?=
 =?us-ascii?Q?tpdKwkDJnsevN5AoI4lFPKse5Ov4WNi75Bep6TvD1+tkdHTIssJ4bkz65pZJ?=
 =?us-ascii?Q?H7jRWzaBLcBgQE62wGZA+f0Zcq3SPZqjU1tffwr6+SgoJHnlqfu4TknZ4gqw?=
 =?us-ascii?Q?3IjkNFZD47nq4VdpTnNerxWy5N9x0za50OSVaFy8LkLlJD1oUtvzfqEY4G3u?=
 =?us-ascii?Q?dzJNixHGV4O5bbhFtwG2yaTlHjxMyLnUJ2Cb5IkIRFKHCTvji/7K5QWdbd3B?=
 =?us-ascii?Q?BqEsy+2bvbqUtaBsi8Qpk4f1qImBwG63NQCmP3TctM94d22pwJkDNYRuFu4V?=
 =?us-ascii?Q?29kU7rbS7n9mZq2ZKugZ0lAzcK6wPlIdTiQjINv5CotVWSM8cZ2NQOsqlU1y?=
 =?us-ascii?Q?M80HSlLnI08lgkub6lroofkGzWeuXH0+996CHsVdswdLVIN3Png06ocXoe/k?=
 =?us-ascii?Q?kmWK2hQQW7bsiTR87X5kbMCNSCw3bAqFN4Xy9/+eK3XmKCSCijwpQw/YhsyM?=
 =?us-ascii?Q?9d47J+zYdGG9LFCu6VWCAsHUMwizQjN4AmVQhNRqXBUd5FKsIiYCc72ICmee?=
 =?us-ascii?Q?u0FxwKiq7G5VURRTbxGMWVK8DCk2OE/qgE6OVhPefYXFgx2YJFFdQh+RcJd2?=
 =?us-ascii?Q?IWC+NMHTtYOmJZhvkzDb6luSrRt7Ye/Y/ap9CbmySvr79gwfBGKKetmG8AO3?=
 =?us-ascii?Q?Wn+FgPyjC4i6xCOdR60ZiIzGzZ1wTvvHaI2/bFDgUKfnnoUkSeF8BIXr9KZd?=
 =?us-ascii?Q?Vp2BihumoV4n7RFt0GaMb6Jy3gsDCmBH4fpVzDIno47TIVj9zvVTFHfZTXER?=
 =?us-ascii?Q?jlDHt/N0kboLGZNGbNUcjUL2LCMyn1VenEU94afSJbv9vh8gOJ2LLUFhfH8c?=
 =?us-ascii?Q?6vvuEgST1sUDBw+/iP66Lxg3Aca/vNIN8c61ZCHF8lmTxFNtUta52PHq8CFT?=
 =?us-ascii?Q?A5CChAoAnczks12lSB4Hg5X9ZfW/35pW/kRcxCGcpox/0wI54sVDZ7v/27/1?=
 =?us-ascii?Q?QsVomn9eaw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3846996-4e78-4b19-3aa6-08de67a01a4e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 05:57:27.0096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VSLeX+ePKRDaKVyI5k5E4yOY4farl/NLksq6io+P6HOpy5GVbYUwH/mMzAf6rB2BlhbmKGzDuMkLVqbDyj3ZMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8994

Add pcie[0,1] and pcie-ep[0,1] support.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 82 ++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 765d9d05e489d..524bcb5951151 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -49,6 +49,20 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	pcie_ref_clk: clock-pcie-ref {
+		compatible = "gpio-gate-clock";
+		clocks = <&xtal25m>;
+		#clock-cells = <0>;
+		enable-gpios = <&pca9670_i2c3 7 GPIO_ACTIVE_LOW>;
+	};
+
+	xtal25m: clock-xtal25m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+		clock-output-names = "xtal_25MHz";
+	};
+
 	dmic: dmic {
 		compatible = "dmic-codec";
 		#sound-dai-cells = <0>;
@@ -70,6 +84,15 @@ reg_m2_pwr: regulator-m2-pwr {
 		startup-delay-us = <5000>;
 	};
 
+	reg_slot_pwr: regulator-slot-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIe slot-power";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pcal6416_i2c3_u46 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_m2_wlan: regulator-wlan {
 		compatible = "regulator-fixed";
 		regulator-name = "WLAN_EN";
@@ -641,6 +664,18 @@ IMX94_PAD_GPIO_IO28__LPI2C6_SCL		0x40000b9e
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
@@ -800,6 +835,53 @@ IMX94_PAD_XSPI1_DQS__XSPI1_A_DQS	0x3fe
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
+	vpcie3v3aux-supply = <&reg_m2_wlan>;
+	supports-clkreq;
+	status = "okay";
+};
+
+&pcie0_ep {
+	pinctrl-0 = <&pinctrl_pcie0>;
+	pinctrl-names = "default";
+	vpcie3v3aux-supply = <&reg_m2_wlan>;
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

