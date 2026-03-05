Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010007.outbound.protection.outlook.com [52.101.69.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806A03382DE
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 21:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772745826; cv=fail; b=Ho+d/wlvGcuESm519+OVIGZ7BXqWO/wDzuANIJkYx0PZs7Sjc/J0vIgE68+tu3FMNFrIu5BNtrAp1Kxq3yVOtAqurceKF7wD4GBBUJ9yw82tsbVgPf2uZS+ly7gsoITDrGuMNWI423LQtfWU6lMxo4Ee9ri0HW/ALySZiCy4NRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772745826; c=relaxed/simple;
	bh=xi12vRhyWtmn17DYcwvwysOP0xWCmLlhIsojA2GWU8s=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DM5qEhdLnGrI3caaUsj5VI3hiESYTCadycgLjxzc2GdES8J/DTKcnLdLVMae7U2WD9UB7jm64Hfz+Yrld6/BvueOhGuDYZoDZrcHWsVZRMj4oeDQG4xBPQgadGgTSAuj+1B4TRwLAwWVNMvsZXkY0UbJKq8rB3vCkwedMPMZipE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aHQ1aG+R; arc=fail smtp.client-ip=52.101.69.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aHQ1aG+R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ov8Xsfm1sC+If0CNcjYedl6A9jdtrXNQSfyxZXyPCZHyJC/445qLWn8T4A+ZgfpLAmXd2Z8HCKmD+53IaKRPo6ErAYDkuc56TYd3iBb/RaH/Ef+2LVC/iZzP4ePZeonfFS8tckwqUn67GWjNg/LVPL7udxNMdwraoSBeonuHD7vV+UP6S4YOxtS7OkMl6kAKry/aLKDutTwNtV0oNQLFg6/mz2aq1k1bHkDNujvlP16wYUVTpFOJkDVu7cv6nr0P3JzFaxu93wr4oenAcyak2zKd0LII05lWoUXOrj2QTytkOzWwvf6WT2L4jhCsruQe7sjvxdfE3EK90XgEuS5ysQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V08C7C3y67v7AFclWE6WysRN5uqY1xM+PkTeN7lrjX0=;
 b=EYsgWQI93IH2HChvl3/CnB2XZeJnFqDprLnjNF99Ua2zEPx3o4ZErfMlu6P/fdS7AwCuHva+RDihZkUe4g9p7WUdmGdlVawx4nv7p6Yb7SujSYxTZjuWMJHGJxc20O/ps4TBMPrTBbbJ9Ni9WYbbXtOkI2jse4G4lok/LcneF8c6x86AWw8dwszIto60wpgqXjfHsI8Zu4/KjneDMPhPxuBHr4I5oGUpPJLn6WHe+YRl0BH2D0s0/fH8ZL95KoDfZKW7F/5ip8AJrHnrVGXfv0oERpuILJ+h6VKqjFxooILlBrt4hjlY/S6TKN0JG0iQDaynhWyCfc03LzoDmaqAag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V08C7C3y67v7AFclWE6WysRN5uqY1xM+PkTeN7lrjX0=;
 b=aHQ1aG+RIhh9uLpSW/TegIB6mKmYM+11nifT3c6oep8/bwjFuYxdEnDi03HIzYpZK4ievaLJkv2G7Wv2ptEovuFQlOUhZWOKlE/BoN+fS+CJBedoYecQ1YOjd0Db86PyOJXoi8deU7dotbKc/DaJWKd5OF3FL8IaFxqs0aXa9rCcCwmp3POvTpuyvjN8YoH7AHd2top+wERl8Qz+CLK5XJ1P+KxDYvSM91reeGBujVoBaqGSUtoDJV/quDM4bnh/ER3RY0wW6UZ52DQ0dxHkuyblPvDW7kpY8x5Y4Rx3fvTiU8yUz5DicGNcY/wF+V9exMJ5VfzfbMr2B9r73t9L1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB9750.eurprd04.prod.outlook.com (2603:10a6:10:4c5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 21:23:42 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Thu, 5 Mar 2026
 21:23:41 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Liu Ying <victor.liu@nxp.com>
Subject: [PATCH 1/1] ARM: dts: imx6sx: remove fallback compatible string fsl,imx28-lcdif
Date: Thu,  5 Mar 2026 16:23:11 -0500
Message-ID: <20260305212312.4053922-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::31) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB9750:EE_
X-MS-Office365-Filtering-Correlation-Id: 21784b7f-dae0-4ae5-f48a-08de7afd7959
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	E4vhQpkrap93hGaHjPp1pgjHeWYPT2fUJxb2MO0CvgJG0az/kGJdmWBIelr/LB0C09SzoYdQQvHUEo1CO49lmsapdJKfm/YNEDIabgHs7idAdl0/1/vLv1qP/SCPTQDIJYY6XwFuSHM1dDj5dJ2unkBSN5LsazC7Dyb5pGdDLoMlJQeQ7vHP6eP+kMPo8QsfEnS8EVKMK2tTH6/nujOHCF4xHqpF+uzP/wRSl6OXbbfTCiVdOtq88YeCDlPp8WquajsKhj/AtRzvrvyDwQ0/tFMRzhDrbEbLZ4kKk/g5DwDmkiYeGXbt985cg7DxOMYRHn6v7s7bh0WT9sTzn4BYrhQAbK3AzdVEWbZfoRxSgQJnnrzYV9HhWd7axZ48q/O+gOSa0J0CUKUWfuuewaYZDX5XBwuk/VA1Bw2/SCvr3rPDrau1TdKgJtIoM3r2lbExTa7lma2bJOZo3nN4rqzwwKI8jC0Ot+U9xju3V4Vn2JnNHx6ZHZ+OA83L4ZmeSSHEeNeZWRUHNDW8ivanGherp7zGA5JyU5k7mkA7B2ZpXbRk7iyiDLzRolv6I9CrVlNy09xN9Jn9liufDAKhTWZfrSNOI1qViLJbV725/V2CtxSp3xckPenJNCcd3PAwXcjpYebr9t83inBaFgHe13f9Z+Fs1UYnnMSv/Cc5mWDxeJvXJxaLkcnrGvYWLM98tq5wajGvsqxrIbbNa11EIRYdL9rckqRuNrs3I3RKohgsleV+mAc35U9N7gHAzo8rl6XRL5wsYy5DWtKvSEOV0HY+xk/upTf7vi1CtgTDSTCT4vgnfSe5MAHDzY23DcbYAGaP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WiVmlqVYWAsJRkwPThXgaTY1JQa7fNU8IvwOaqDWLMADF5td0h7fllBx+ukv?=
 =?us-ascii?Q?/fmDyhNS8R1FDbEgxKwpqscnN7/+HAJPoZ+gHwD3SfkokQOqUqjCP4pXZ3t+?=
 =?us-ascii?Q?sPqrHZujdG9/V46w+iMrJWJ+GfwhEa+l+Jxn12x5MK5yTbCHTUhBqR2+0bDX?=
 =?us-ascii?Q?zfBDFj68QRciyaoN/wZPkqkAUtsxFx8kq4RfG9ocijzjGJfObIQesKA4+IUk?=
 =?us-ascii?Q?xZDNZI/SXFiolfjoq1Di95a57Y+SKgGyJhob/f5JImp0VXBGCJsCY3zPM9RF?=
 =?us-ascii?Q?NXjGCGBiOZpLnZgiJ2Ngq909J/MJUaIC5kp51shepdDI9RgOik5Jcf60eCUM?=
 =?us-ascii?Q?YyJV4+qpHyEkq+gGgriDD3SJksCVctgv1TECg6wYy+jMVWqniprrtiru3pFk?=
 =?us-ascii?Q?sUftFhgglxKZ5kDadTmZIsI07FiPgVQgkfqtvfqShsihXXC8WrNkU93XW6pW?=
 =?us-ascii?Q?dYQU0X122qXTSqkzlyGJ8uiE3GOA1AGZk32aIuCW8DI6pAkpDdS5l5Okxuer?=
 =?us-ascii?Q?45G13EOJcLIE6YkfPHjOyaWXbwzkk37FstC5QBxGGptgCV5tPJjhu59ezsU9?=
 =?us-ascii?Q?i/gH+L3Mo82rbavmZPEPhAGPU5GG/dP4uqx9KMKTF4vyaoxiSm8lhiOoRd59?=
 =?us-ascii?Q?GhcNqHPKaiIJV3Gtz1ZTFWufKH2VPwrqlL6iNor8T6Eo6p1OoI5WuU1KXvGO?=
 =?us-ascii?Q?rpS8BR9JFPlwLL1v94OU0z/a/lhPOG7Qolg41Gv39MEIynRmuUJkztEU5Ypv?=
 =?us-ascii?Q?a36PRJTdxU2/vx93RiHi3ygdz1b9dXjGQHE7YYUraBNAHNtSytyuJGh3Lckw?=
 =?us-ascii?Q?nOYlid19mJeQMUQzyZdI/A2+9AmZbe3zEda5Fou4MgnfynURG1LGcgLfri9s?=
 =?us-ascii?Q?+mM4S4govPP/BeCAcMno8z+VV6MYCoXn9udEDY6KY+Zo6DwZNahk3KI+TF+j?=
 =?us-ascii?Q?EWxexqaR+nDYe/6JfaGIpQouKUCVxIxD9AyaQmL+D0HbByckmaKX94RIJOYe?=
 =?us-ascii?Q?/J/c/gQaxi3cUkvDZ8zzrKFt7AThmRTR0h/xnNmLsmwUe/90fJ24GiqLhF+V?=
 =?us-ascii?Q?pCLc1RAUAv+PNXF+r562BnNzAzACNM7bufZOJ5GbgsIUkiOYBejGGT+PEXq3?=
 =?us-ascii?Q?Doi/9mcduch3xMv2k0t2scoJXuxt7JlWalLSNvf8axBKxAYomVhhXIarFeq0?=
 =?us-ascii?Q?pEGgPky8LBKe4emgSO/NLp6Q1TlM/Fnf1/5pM+qKkJT1e9iWHxYFzPJFrLzt?=
 =?us-ascii?Q?q/4AUzyI5V25G1Iq1UiPbDbEKEDphDtzXAZ7B+wlQrpyN2L21IhO7GMQNFZM?=
 =?us-ascii?Q?2c8mynHi5hunZNsJXL/TAdp9FQ82ptkaNqgCAtf4cbiExJl5c7ai3tk1IoAf?=
 =?us-ascii?Q?sVwGh0tj+M8gIdGgK0VBfLee+z/yuCYEl7mm14gZXNj1ZF1K/pBaQwUv0nd9?=
 =?us-ascii?Q?KCyt86jI1LEKRN/9kscDoGwm+tHvFuTywPJxuMwk0C6BJ3yCRwgOcKYzXJgl?=
 =?us-ascii?Q?o/oL3yS0jpEZ7G0QAOlKiBz/dbtJPAUtMkDJEH9xlJKUW+LE7vVyc6Es4aQe?=
 =?us-ascii?Q?erTrhjRZcDGsB7PuNnmtiVee3Wcly39brIY1xTOAIdRy7W9737CYGGnEGlGN?=
 =?us-ascii?Q?veoZ+WuBPwJ3LKQKjlue8Rum6n08STSvJWyvQrqNxp/Ny9CTH+sztyh3Jgln?=
 =?us-ascii?Q?aug/Q6WPXVjheErdpGSuCEJ5+Qd16XyDd9rnTtFskAtzSfMIbF/Sm+Kia1r9?=
 =?us-ascii?Q?QqOlj7hL0w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21784b7f-dae0-4ae5-f48a-08de7afd7959
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 21:23:41.7534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QbyLTjSkHLOe0X0/Cs4jTEnw6ubsW75KJpgtKj0GtD8u+DSRzpZF/fv/gYbJL3LRTfi+x74rYwngHHg8Sy6Q1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9750

i.MX6SX uses the v6 LCDIF controller, while i.MX28 uses the older v4
version. The driver has supported the "fsl,imx6sx-lcdif" compatible string
since the initial commit:

   commit 45d59d704080 ("drm: Add new driver for MXSFB controller")

Therefore the fallback compatible string "fsl,imx28-lcdif" is not required
and can be removed.

Fix the following CHECK_DTB warning:
/arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
        ['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>
Previous Fabio Estevam work try to allow fallback at
https://lore.kernel.org/imx/42eb2d42-47b0-46b6-92e9-c59473113c2d@nxp.com/
---
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
index 1426f357d4744..aefae5a3a6beb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
@@ -1304,7 +1304,7 @@ csi2: csi@221c000 {
 				};
 
 				lcdif1: lcdif@2220000 {
-					compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
+					compatible = "fsl,imx6sx-lcdif";
 					reg = <0x02220000 0x4000>;
 					interrupts = <GIC_SPI 5 IRQ_TYPE_EDGE_RISING>;
 					clocks = <&clks IMX6SX_CLK_LCDIF1_PIX>,
@@ -1325,7 +1325,7 @@ lcdif1_to_ldb: endpoint {
 				};
 
 				lcdif2: lcdif@2224000 {
-					compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
+					compatible = "fsl,imx6sx-lcdif";
 					reg = <0x02224000 0x4000>;
 					interrupts = <GIC_SPI 6 IRQ_TYPE_EDGE_RISING>;
 					clocks = <&clks IMX6SX_CLK_LCDIF2_PIX>,
-- 
2.43.0

