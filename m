Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012002.outbound.protection.outlook.com [52.101.66.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1B4335571
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 07:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772697223; cv=fail; b=AsLraGdJvaufzFKWhdjH6BVu2gNFxhaIBlU0TygyCui22JZkH+mGbOU2jByEo4CGdPOzqJpHLt8ct/K0yVMkiK8ckdajhdIFpChMMxB3puWQeR20Sssw7lCmwNgx6mXr9c/ftQ/DRFe2K8DZeX+xGkCgAdydDY+5NSOTP9h6pek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772697223; c=relaxed/simple;
	bh=QXVpxHu/gUUkdSL8Iwz63KJK9/vjqSAzAWrYb4E0ID8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=L+p5+TnQIy7LLpUqkDgD+lyHyQpO3RHoNlcyH9lchcn8EmH+1i2sEc772DShE8NEYDf2fKVf2ucp1D051Ty+YlDGVnMKiwS6hYSYpi8wFnWGRrngkcl1mm12zDn6stIEJHjs5ts19p8WJzbzoXOpqXmM4k4I2MurvfETaiitl6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JLlcm1JK; arc=fail smtp.client-ip=52.101.66.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JLlcm1JK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fgdTDUUkURIFaylLgYef95Q4CRHTyqW9J84CO/s2759+aUhE1qKIIwKIhNTi0NbFUbFiRedSrJZG7J7rIOYXy1va4ZpMD4HqWYmopzrirzA85uFrJm4tJLcLCe/hC7QeD/nCE4c0hOZ7K/ykubzK2sgwKGiGSdf1iDFD+8CKOnEU+dDGjg2OrokxFdgEK4MnKLkJMbCB5+MSAA9Xel8YCcG7xO2Rb9MN0/74rUrJ7j00NQRHJEwyWxjo+bSAjnNiociWitiVNdt3e6viTVw6d45XSfdOpfyYuVwQBLw2zIHXqul3bYEMBmm8Fm9ObH8arX2BZr5ey5B53NKjv2zvRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfc0G+KEA4MQsBfisTH3KuY60V/vsB5Z3uStWz2dAmg=;
 b=l0uZddCTz50WCumfi5l01EZOEcUeY8QiYkiurq5AIrYuy/xL5azTxDI9X4JL5B4byaRBElxWhg5UgQJ4a2Rr9yQ/l4Bi8b2X/mVFb4qGXzaYDkpA43CintKmramaFJtvUZU0HlNh1Ec/9dCO5DdQtu9ck6iNwoNlVHmlSIGfNeof/WhLomDpi0t6b6Qy4BcnrlMm48YuDDyffLBsKKw9cCLzPAuhuS4Wwg/P2UT1/GiWaYO7aU/wB9E/NWofcPW2K6pc9hPWdk2RGoui550kVudQyWZo4P+vJGJQAzf4f7fbZS5gKhXqG1akoIoxtgtAujiVbqztoFusfJKG9rQlsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfc0G+KEA4MQsBfisTH3KuY60V/vsB5Z3uStWz2dAmg=;
 b=JLlcm1JK1CGnupQVO3C4UWlF7/+YHApGXNcDeNdEnS5SRBAqeE1m3P94aUGBFVBVt0HSKyGvPq63OPlpes175RHZwvnDSfuP/tvcp7GG5GZ02dLrvZ7+28cnoR1jHhmgg4/X/j+/e/NL+QJy2Ik2jG9quHFuYY7EOYqTblwHl4z3+/FzqKi+UAngqLVD+pMRF7I0XuUZhLWn6W6a8PrEHfiyIiZzpdU+KfwZTUSToZZGotTmzCAX0qwgVwlsqwh7BOJtkUX3VoYgvK2gL3g7spdiw4m05yMbHIlECTV/Izd1y5rq/hHEE/ELHIYYFoHkXriJgri+EprW//MdtGnmPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by VI1PR04MB10051.eurprd04.prod.outlook.com (2603:10a6:800:1db::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 07:53:38 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 07:53:38 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: [PATCH 1/2] arm64: dts: imx94: add USB nodes
Date: Thu,  5 Mar 2026 15:55:26 +0800
Message-Id: <20260305075527.1116943-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::17) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|VI1PR04MB10051:EE_
X-MS-Office365-Filtering-Correlation-Id: c7d79f5f-d396-4b28-162b-08de7a8c4f8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|366016|19092799006|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	O+11BLLlWejcnz2SLNhdzWxSqJ+gNhH7+V1Xaj7KhONr1s9mDRbe/8mz3C1D6TLIo69Ri+R+llQ1T5iXMULS9q8bmmo7IdWXh9sst3NSpaCVh+Xx+uD1gJ5yT9UFp/H/WSXsHwmGEYm4J/meSxDBvmHHafoJlmwtzxi0lQTZMJ2Y2NB7/3sAQPx4NXMHvpv9g4d5rxFF8Evl1egII11AS0HuLpro5V4fAwT++ESG7sK/IKOr98KEEr3Se0KLzU/SoQT55jffLW8OK6Ah8+c5e6XaawkjSyJMWyGpnYFnA29Vv7gqDzVqmajgqwbu2u3H04Ub3v5TgFLa6N7gDB0RQd4n1+pRRsXX1uxQ6gWpAQ2/gCj7NZTfk5dtehdCZ/L9mn5rXUqupJ/X30AbEofuOu+AiUEsD5pQBG709ZlQla+ecoX56ax7QKkvzIRCXsEEPqTAPsuDgc5aL5SqR0kcB2kJ/2saPE1hxCLlXzTKDrB1TY0cDasZEHYp7DV/wWrEnuX9dhcnr3m+4KtqY7T9ASfQZF688ME4XaYHADM1L8KVTtZmnIBEEoLtmXOaLH8mZe7IDBDftwvvHk9KPfamNf6XIs3gHhyB7yAtiqDdWAh5MkZQXBgEsKSHdN3n4iMEzoOs0q67Mzt/GijWorBfmT69A5tgFCipH5+RsbctyjKckNTn2Rdf//u6dL3y6NVTTs6eTZFC32Q31rqsjWsVhlEMvuxLUA5FP8ze+/AfLPsa0ml+oJnUC8aoPM3LK4r1k5RekSdM0U7SbZBZo0sCMiFdMnJik3bkRn9XAG3AYsc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(19092799006)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aiDZBBk3pBZc2PJXxlfq0y2g/7+chCcaLW5FG5tQP3Z+Eqty7evkyjDtbSKp?=
 =?us-ascii?Q?KgSP4k67td/6RnBBbFS2YqlguaseCj7tliQ8oVXSl2lojqiwd65lUxqNeDL+?=
 =?us-ascii?Q?053wXEwvfvR7yAkpCiW8LBinVBlqmFjSXZCKmgC8SdxbL20iOqpyXZclm3xv?=
 =?us-ascii?Q?JXxSVZFSy9EHlFA4KkfRO0S+g4aBaxW4LN7W0W4YqmdzJUcxoyLOOAp+qJKp?=
 =?us-ascii?Q?Y7ibsWlGReY2+ddNVrBSulmraPylmcSP4VN+n2mA/okvqenKiG9+5NYpVfPa?=
 =?us-ascii?Q?s8aLekUPbImlDvhTOQgNlYQvPr+Wny6TpTg5NK97JO4U1zn8oeWdSItQr1XI?=
 =?us-ascii?Q?khQ/bqtepqnjOo/TK1pVb4XPBlUKopdvCimw4RQgMACWbUgCvPFf0O/JW9Ma?=
 =?us-ascii?Q?Sx1xtDuxwLcXxcfCjnB3XRhibe7c7x7U44KG4ERHZ6z1jCvbnqUEnpT0FCcq?=
 =?us-ascii?Q?3REvoFmBgkOONJpIxj47ZbsAIb48ZcHGzZHScyxgkNTKeChIZ6SQh7mKbqw+?=
 =?us-ascii?Q?03JBEvocdj/3r70spykbgMen9amHha3+XCk5TgI+nQDMyTKtA0t4yo85vWUX?=
 =?us-ascii?Q?BMef7c2EOqI2YgeG/f+dZg0g4564LVt5+qGFHWZ/rCq2VgtUzhJa8XYSwUJI?=
 =?us-ascii?Q?YOk6eltBZUem08LobeJKF0JLk589QSJQLXBErYikuRqhIdAaMS76KuOFWMZ3?=
 =?us-ascii?Q?cBwWhnFskPurG+MLb40V0WHxi7z6Ij5C/wHvOiKelN2bU7swTIoasq/7+hXv?=
 =?us-ascii?Q?wX8tNxCzUPC2P0kacZPgAHDSU+zAgdVRHfZnW+LVyBqDP2iD5kuQx5KZESPv?=
 =?us-ascii?Q?Hciir8xTKa6NOLWra4U3HT23wE0XNQDwm/AGu7HhAold8NE5Zu4GKeV1hiHs?=
 =?us-ascii?Q?mEsulNW7PqdQXLPlW5h+taTpQV9TAMeju9nihk8xCjxCtk7bOU0aTYBpQyby?=
 =?us-ascii?Q?nyam+LtfyA3kPdLV/uu04vA953/uqnkaBHp6NRTkdXn/ORteBU0/WuJjUshy?=
 =?us-ascii?Q?DSiJlad0rdXG0rHjsxrauze4sw+JTo1d3tW47tSj99vt9n0EMunwv//9+Yh9?=
 =?us-ascii?Q?tYAw7LlxYnvUdIwhVzFOSGF7Yug2dpKeVMtYzIi8LjpChOwJJZZCQA0paGBW?=
 =?us-ascii?Q?nWJv47nBC1qRbALUB8NhvNMMeOg/rLFO6t1Wzw6h0NxQOztMFOChfzEUIYez?=
 =?us-ascii?Q?NKxHWk8Pp44RETZDJRUtG35cwe10qZepxSHMydD6tNslrJx2HEsp3s7sKkq9?=
 =?us-ascii?Q?klR79wCeGpPLW/CCKByozXNx8hWwBTrImTggEd2EhTE/FPb9umrnfNnWE6P6?=
 =?us-ascii?Q?ab1htj7pUY+L/kNdHYmq/moOOJcV0KndUZD6E7Hy4SBeUlSnzcBv9vtv4xRt?=
 =?us-ascii?Q?hp/lff8d7YnqTdRWT+xLUI4B/xoeOTtgoV+wSlwH58DA+i+R4Ukz83ovMXOT?=
 =?us-ascii?Q?iYVafib9TRl17s2Q1aABzbhZs/2AfUBDnzownQZvyycQeitMftggwSFOwTgY?=
 =?us-ascii?Q?nZ4mPCYjkwxxGKNqv6dzmVNK+AuwV1kTxsM/9fdoL0mAhJhIRCG/gepRoSsD?=
 =?us-ascii?Q?Ok5OIB1EvIFRJjEbgru95A4XQKRBl2fGMzNDTWUEtTCQnLOqLnFLdZtaUyeI?=
 =?us-ascii?Q?vQIB6QbV7+1iS6+I3l/nyLhbGYTOhSGtGfOShMK2o0dp/hlIIcYFotyP6pBv?=
 =?us-ascii?Q?fYApaPM3ZG6CjOkM/pzl1Hy83rH/YUNGtiR+/JSoLisLxQFtGXghlp4ibvS4?=
 =?us-ascii?Q?ZZ6AP4TNnA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7d79f5f-d396-4b28-162b-08de7a8c4f8d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 07:53:38.3090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrj4EQL8r69rzk9tgnGwdCwafgvQW4Bs3FDh1TmBGRQp+2cWhw7DalmVAOzxXIxtzB82MRAFlO8HhK+m+6CH0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10051

add USB2.0, USB3.0 controller and USB phy nodes.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 61 ++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index d2f31c8caf6e..8384166400e9 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -161,6 +161,13 @@ its: msi-controller@48040000 {
 		};
 	};
 
+	usbphynop: usbphynop {
+		compatible = "usb-nop-xceiv";
+		clocks = <&scmi_clk IMX94_CLK_HSIO>;
+		clock-names = "main_clk";
+		#phy-cells = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		ranges;
@@ -1223,6 +1230,60 @@ wdog3: watchdog@49220000 {
 			};
 		};
 
+		usb3: usb@4c100000 {
+			compatible = "nxp,imx94-dwc3", "nxp,imx8mp-dwc3";
+			reg = <0x0 0x4c100000 0x0 0x10000>,
+			      <0x0 0x4c010010 0x0 0x04>,
+			      <0x0 0x4c1f0000 0x0 0x20>;
+			reg-names = "core", "blkctl", "glue";
+			clocks = <&scmi_clk IMX94_CLK_HSIO>,
+				 <&scmi_clk IMX94_CLK_HSIO>,
+				 <&scmi_clk IMX94_CLK_24M>,
+				 <&scmi_clk IMX94_CLK_32K>;
+			clock-names = "hsio", "bus_early", "ref", "suspend";
+			interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3", "wakeup";
+			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
+			phys = <&usb3_phy>, <&usb3_phy>;
+			phy-names = "usb2-phy", "usb3-phy";
+			snps,gfladj-refclk-lpm-sel-quirk;
+			snps,parkmode-disable-ss-quirk;
+			status = "disabled";
+		};
+
+		usb3_phy: phy@4c1f0040 {
+			compatible = "fsl,imx95-usb-phy", "fsl,imx8mp-usb-phy";
+			reg = <0x0 0x4c1f0040 0x0 0x40>,
+			      <0x0 0x4c1fc000 0x0 0x100>;
+			clocks = <&scmi_clk IMX94_CLK_HSIO>;
+			clock-names = "phy";
+			#phy-cells = <0>;
+			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
+			status = "disabled";
+		};
+
+		usb2: usb@4c200000 {
+			compatible = "fsl,imx95-usb", "fsl,imx7d-usb", "fsl,imx27-usb";
+			reg = <0x0 0x4c200000 0x0 0x200>;
+			interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_HSIO>,
+				 <&scmi_clk IMX94_CLK_32K>;
+			clock-names = "usb_ctrl_root", "usb_wakeup";
+			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
+			phys = <&usbphynop>;
+			fsl,usbmisc = <&usbmisc 0>;
+			status = "disabled";
+		};
+
+		usbmisc: usbmisc@4c200200 {
+			compatible = "fsl,imx95-usbmisc", "fsl,imx7d-usbmisc", "fsl,imx6q-usbmisc";
+			reg = <0x0 0x4c200200 0x0 0x200>,
+			      <0x0 0x4c010014 0x0 0x04>;
+			#index-cells = <1>;
+		};
+
 		netc_blk_ctrl: system-controller@4ceb0000 {
 			compatible = "nxp,imx94-netc-blk-ctrl";
 			reg = <0x0 0x4ceb0000 0x0 0x10000>,
-- 
2.34.1

