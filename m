Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012024.outbound.protection.outlook.com [52.101.66.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3568F2BE05E
	for <imx@lists.linux.dev>; Wed,  3 Dec 2025 07:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764745622; cv=fail; b=lrpknBgADuCVzgtCIUtT76FkoYXROg0KHZk5VeZ/+8impOq8bICsP2W9PPnIbpMPvlKT2QNOytwi5SgOrZ8Vj3B4rmCUd4oTd1yGX4N6RmvT5Yu/+ekH09tRRXO2Ekj1Kfosz2UShay86HjzUOCHaaCdrs2hcC+ra2Vj2FsKkc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764745622; c=relaxed/simple;
	bh=OILt6FkrMeYh/RqZwyARUcWBVhA0qRyHPSnDzZgOvaU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oBs8pOzyemjz5+/gBIIfaYwfmuvQgsorUPMl+kjxgzaMp3yM62by2oqn+KpB6vRlxpJ89l/2vveI7shraFCXZzCHvLJaxnJLVG83ASWGfmRBXtGHwS+0Kc/0f0TaOYmdEnOf+c+ZbKVzlKWuikQcUmFryYL3+A1/pp763yRmMCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bb8lqH3Y; arc=fail smtp.client-ip=52.101.66.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bb8lqH3Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WbR2OXbfxzJGZ+8X2vo5AINvqX1EPZAzske5PWWYouShz05epulenAErCLygDL20nRVsdrdurooVWI/ETDfW6wozTVbg/PCZ1GKt/IFkmQEhRe1L6ykT2YxLk7HrC3dkh+USmvaMnoIzm6sVGTaKctkRUk29skPMn9fmKtggkVKnxMzPSv73ud0TQTuhvJ05QNdDxRVMedboEmsLc3waIWJi5SAHx9kshDH4hkbw0DdDLUEJGlHCx4yirI6kBcl+wkUjhMAYVnHuUfYkXS+Y+7pE3TTOBM1y04/gm6L6xcqG87HfwHH2Pyz60TceY5caKuUFnWB27pK+JkxEIdJ2Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcG2aKcL/yDKEX5hb0JiBxC8H25M9A00FZ5iOYB9NHA=;
 b=TnDlqu7J2N6cjNqpKY2wloo6eo5n7fuT5EsEuzkMFOrgoAkt3Ups0JP1wj5Oe3b6m5nB6P4QUSQ5lHTWCUe3H9ON18VR+EBzy6MDuGggpfaWznx+0i1B5KHZjvMFdjhHaXLLLY+8AcUGF1GGegezvK/IO2IzOYAo/dLhKCF59YsDiO3WrVkJjQDm4J0pnE7ppAjY6sQmcIxEfQf4OK/1bfOLLoKQR4wQ7fQRM2w9NdRWaXwaLBXS/LwyLVCWVzbwN94/2uWl/Ry10s++yaF+iboNf1DZtpDjnJ5HyGtWAKh1YnMLgf+hAElEwXgYHmRl4fwfqjZRsO3JRoARhN6kLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcG2aKcL/yDKEX5hb0JiBxC8H25M9A00FZ5iOYB9NHA=;
 b=bb8lqH3YI8/zol2b0fQ4syS34j12r6MAM2VGBgS/UchRFT2ZFqDd74FxKxdpPSooXrMm6MgAXlG37T2MdLzgEr6+J62wYNiH5K7yIJ5WNoo08EmT5Rg0VnnJGOWAN7xVFZHLGRQTcle4YpXFo4MHddVZz4zLsESh72D4wj0Ki3G/tXbQR2TpfRXuk61PrtC9cPEWfyr39aS/9WasELthjGSeQd6wrNXkD7enwsSx8ihxD3otsTLCL236vWDUsAxzgydS9p6u6kYKf0vp5/1pTYyywilN+g+/gs0+slzoTqnmm3hODq5/XUO7vJugb/kEXzV9uqDuU6NS0vwc+LRDNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by AS8PR04MB9174.eurprd04.prod.outlook.com (2603:10a6:20b:449::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 07:06:58 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%2]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 07:06:58 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: imx91-11x11-evk: Add audio XCVR sound card support
Date: Wed,  3 Dec 2025 16:06:05 +0900
Message-ID: <20251203070605.1868821-6-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251203070605.1868821-1-chancel.liu@nxp.com>
References: <20251203070605.1868821-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0156.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c1::16) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|AS8PR04MB9174:EE_
X-MS-Office365-Filtering-Correlation-Id: 605f671b-8e03-44fe-98b2-08de323a8cd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sgldRo9q8ZGqTlTLsLHkWUXzzw1EkiEs7ukW3qbkzGk8h/sEy7L8nSit/Rqu?=
 =?us-ascii?Q?GCpLDu4oZg7QirnAgOom5Auzda/us4ZiGNwVZcvffUw6H7/zs2gjLrQ0Dzju?=
 =?us-ascii?Q?D+vtOCR3tXJ2FQKSi/bbPz7mOT99zWCT07TU76Be769SGfEMN1+lh3kWaLYK?=
 =?us-ascii?Q?bqRTeSbal98TI+v8uRnjjCI7cu9pLiNsP4d749biLrn1jium+k10FiCmgGxT?=
 =?us-ascii?Q?g/GQydX0lamWZP8woHHBfclp//LVaPoG6g993YUkZghTThJl5mwNI4OaMnc4?=
 =?us-ascii?Q?eYjYm+Y1zQG1wMUmhifW/UxhIs/P9ejsmBfFlq9IlIDFRP/MWMHbJKP6fo+l?=
 =?us-ascii?Q?k1C4ScdPp+JsVsWhvHqcCT4HTiGRdMkFLwAYH1ztgkKrRkfhL/UtZDXC38c7?=
 =?us-ascii?Q?sMdzU7IyG+VAzjVIIrdSMMDg22eMXUKQDfNFO9WiFslm+4Kjvd2LC3U1Xxiz?=
 =?us-ascii?Q?9yOSJbuNmf6pHTf0jGQFB+xffyTBXJQltxlIfw93xFGZl/QXw/o6ql8qy8+c?=
 =?us-ascii?Q?TVlpbiy/GhEMZrqV3KH3iGynCYSTwAo5m0SByk4pXCGPYWt1cYH0BqUjWWxf?=
 =?us-ascii?Q?TzzfBVv7MOS8GMQh9/hhCVdSEGOEPMeAX4OEXHA69PFN98ZxRX8cQvQRgapf?=
 =?us-ascii?Q?Okw+xoxWEExMg9oVjVMJooNwldbUNPQHQcx1PvSnSYg5ycJUguEgVcjIH8uZ?=
 =?us-ascii?Q?0+ZNP0paeMtNyEQJhU8rZhWYMHYK9Zs/U8gz8/JiY6o5lBKfw7YqxmRCR6ab?=
 =?us-ascii?Q?hHTQKuh6xqoxR3Bw2k8SAmMCvqu8HpL6zTwrR5aSVr1Wy9upAvjRuSOAQuMg?=
 =?us-ascii?Q?ijNO1wYhxJCT6D591GQof7GFP8l/pJgKyvgkqDIm9MWNswJjiqS3UD8iOh1+?=
 =?us-ascii?Q?BYzljzsPUYZ+RbHNY4M9954KIvzLSM6KPj+8qwqvPFQMhQ3S7tAe6t57RRfe?=
 =?us-ascii?Q?rJGyn3b0dOXClo0aNbRkaB+oK97CUPM6h5TSHKEi2Xnx1A8L5EpbpBtgDFdd?=
 =?us-ascii?Q?PehisophOkt7Adwx6msqP5jyv5zH8X+w22843Kk0D3+yvW76J8U6sbOPmnXL?=
 =?us-ascii?Q?lLyxhsaXtN7Wmla9XaakDggoVjtjXv6sp2LFvZH9JpbjqcHA85YyNmEx4mXd?=
 =?us-ascii?Q?7ENMdSWEmxnmb7n2H5JQPdS4P2s6mYjDrkhMHgHcArJ9/VapbEzk5R/H7yKo?=
 =?us-ascii?Q?XWpOr3qyXAUb2otoUfV/svOo1MvLXwy+HxXmbnfku9MuUHkEW4eLR8jeeosv?=
 =?us-ascii?Q?PJ/pWzavTnwr/2VnUDhue8iBRxq+4zQpkEFkuPmq0/T3FZcvSjMYoT0rAZ4u?=
 =?us-ascii?Q?9DFVt1ARS15m9w+7qJOtP5lILlNzbFhHBVbqrQTTl3tXnlctMpUtEcoFN0BT?=
 =?us-ascii?Q?HNhyIGUhNXNeC4AVcjneUk3ZOlxlm+V8OdVqFOZh4OBYKdTrIlNK9g7BL/UI?=
 =?us-ascii?Q?tq3yiOZdDQh6SozrXb41X7+EcIN4CX/mGHmNm5Nkb7jFM+AqU5agr0Twcy0n?=
 =?us-ascii?Q?eIzIU2RXwlaV+NY/j0YQpwBDc2Oy7BwLrMou3qL9Ydpee75Xy/xDP+xRAA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JqvHj8vyU56jmuInmu9lKuYmyPKuyerewTRSLkl65wfs1bW5saxXoQ9KBz6W?=
 =?us-ascii?Q?nU0mvkBR3UpJelkSJWMdVh0X+PYniS0npqZTr9NAPTRO8NMMeE/BWB246sM/?=
 =?us-ascii?Q?2Un/v4O9nDYDszkl9o7ANzihy49xS2RoO6VMiNekKzNdIR8T1WRWOYFT1D25?=
 =?us-ascii?Q?43vTYYCpdYjEUVO6f36MH42QyNdr7SRQ7XacV1fdcA2yIBiuAC06a6ZK/YzF?=
 =?us-ascii?Q?4fbWJd/VLpaR1FeI47dXqjgNK7Gk/ehO4yqPvtRZ1Qwdr9MNfsDsnUkwpvtr?=
 =?us-ascii?Q?uDUy09Aki6Ejj/FC4QXl2PF/fcMu7nizX50147SNaycBYlOmz+zgg2ecEoPk?=
 =?us-ascii?Q?2oIbILomhhycbCMpViwvh9cvQWpY+pcjAdb3//PAOyqJCV032ekQpEZ7hYZ6?=
 =?us-ascii?Q?/XD5HkYAycPW85bkVaFfaicrTxILwtIwfYFg4rWY5c/B3u0yVarcfSLeTCzD?=
 =?us-ascii?Q?zNbEgnUitQQJmanIu5Gw31yJmhpWFfYNhBbB87iMc2GTSTFDOxolFM5fqbaG?=
 =?us-ascii?Q?BN53GT1LJbxvul2VES1JQ5fGiMmnXh5HRFsxU4pXfUl/NTVvzDgTYiG0S5jl?=
 =?us-ascii?Q?xLmfIUAU59UqWnu8Q/cJ7nm/cHHKzDSgOTLkzv674wj2SPgU1G/g+cbQIdfo?=
 =?us-ascii?Q?JyGNhwp3VRmGnD+YcdjTtyN+aN7oNZEaekoEbXf1Iua0XUKkxm3WvUaP+WBk?=
 =?us-ascii?Q?4bcKekRUZh2b8xS+3xk7kfVYIImLcfxDR+cUQqnjANa/rQ2v+KIPVdjKLLBy?=
 =?us-ascii?Q?7t33B+HdJyNZeeiIiqDDBeODOvLbUdQqjVCHi2UcMobkFNXm1plja1FvxeEw?=
 =?us-ascii?Q?3b9bqvZKH+fefaO/LE77y7qQGs8Qu0VyZWuBJXbqERl6x7NqjZMy4g99Zbmw?=
 =?us-ascii?Q?deOlrYbVgrpcl1V5I2GIkk8gJRCcKbybEBmLH46Ox9qukeJVhJocxqmwCJ+j?=
 =?us-ascii?Q?2CRkofg/HfOdeYzEDdY/XHZC/Agpj/XRVcVUnGqjJ4GF4GNCpSNSMUDtRmoI?=
 =?us-ascii?Q?zgrC7Y6QYeUru4BPFMYwsM+XicT26CC8EBcGrTi8en/wEW0h3WFHcmgvdjVZ?=
 =?us-ascii?Q?pp1se9MlzcFeScVpDhd6YxK3sV5E504Kg+Ubn5eJFWcCm/JPR2IfTLcA62ip?=
 =?us-ascii?Q?BpprodYHvTt0eLgt5CA8FRZRiOhS8/B/CWFOxRkFC+2fu+J3X5cpxdn5LBoA?=
 =?us-ascii?Q?FTLl5RPOfOSSwi2inauOQegYI1nkFBwlygVMOx9/8dlIciI3vKPaaTxTKk6y?=
 =?us-ascii?Q?PjypG4Jw3Xf+wG9xq4NHkluG3ZbRkHOWrvsAfxFVeM4D2VHhAEZubz2EoolJ?=
 =?us-ascii?Q?mjQ2DCLCE942W7xo8fCgDjolJUt3khBzJ5B3zOUkRlS0LFO+qS77k3E4mJqc?=
 =?us-ascii?Q?cLaeFt0b9wWvg0XSKs7IcdnqkxU/lJ7WMpGCsU6fCEgaH3r5RXuR4AnlC4mg?=
 =?us-ascii?Q?vLUB36IqJeQaQ9aLymxCzeseqT9/+TfNjwsLT/rSWsaabmyXHnmxNBNme3QU?=
 =?us-ascii?Q?AwQZm8G0l5Y2tBirBQY/VqCgTlVoORxiWQlmDIya5vApKwyvKiU2rPUGKuEA?=
 =?us-ascii?Q?UnO3uPDe93giLC1TuvpRXhuaZuETF/PXqZ2Rqtv/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 605f671b-8e03-44fe-98b2-08de323a8cd0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 07:06:58.6038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9mZ9z1iU/sgEv2I1vmhtsZ9vGOnMvlF2jWAMhozyGRJo7h2i+BZQYPrguDxP5LCFazD6KoGf2N7gJM9cs/i9GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9174

Add audio XCVR sound card, which supports SPDIF TX & RX only,
eARC RX, ARC RX are not supported.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx91-11x11-evk.dts    | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index 605b1d10513a..3cd9808fc332 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -131,6 +131,19 @@ cpu {
 			};
 		};
 	};
+
+	sound-xcvr {
+		compatible = "fsl,imx-audio-card";
+		model = "imx-audio-xcvr";
+
+		pri-dai-link {
+			link-name = "XCVR PCM";
+
+			cpu {
+				sound-dai = <&xcvr>;
+			};
+		};
+	};
 };
 
 &adc1 {
@@ -523,6 +536,18 @@ &wdog3 {
 	status = "okay";
 };
 
+&xcvr {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_spdif>;
+	pinctrl-1 = <&pinctrl_spdif_sleep>;
+	assigned-clocks = <&clk IMX93_CLK_SPDIF>,
+			  <&clk IMX93_CLK_AUDIO_XCVR>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>,
+				 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
+	assigned-clock-rates = <12288000>, <200000000>;
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl_eqos: eqosgrp {
 		fsl,pins = <
@@ -668,6 +693,20 @@ MX91_PAD_GPIO_IO26__GPIO2_IO26			0x51e
 		>;
 	};
 
+	pinctrl_spdif: spdifgrp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO22__SPDIF_IN			0x31e
+			MX91_PAD_GPIO_IO23__SPDIF_OUT			0x31e
+		>;
+	};
+
+	pinctrl_spdif_sleep: spdifsleepgrp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO22__GPIO2_IO22			0x51e
+			MX91_PAD_GPIO_IO23__GPIO2_IO23			0x51e
+		>;
+	};
+
 	pinctrl_lpi2c3: lpi2c3grp {
 		fsl,pins = <
 			MX91_PAD_GPIO_IO28__LPI2C3_SDA                          0x40000b9e
-- 
2.50.1

