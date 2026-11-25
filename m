Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795599889;
	b=wfvsztYNyXIohMw7p7O+pp5jaKjXzDf65xdMohjoZsLd0e0+yVVGgIK6sw7KNJ0St+Km
	 Pyqarz7t894bRAWdivG6nBllaUS4/khlDu37yoKcJwGHlD0BcQzntu9KiLTJAe21OshfA
	 lTP2m6XJy1URWxL65djtpAFGJIgUxivnvuaIlJHnZ38qJFumftBTdy1RZ9FaqyLV/u5Ox
	 jzj9TtVfvR9zzAd82q74wZVk7+EIFkg6E29OKGy4d70aCZmEJVT+gVPQP8YTw4gRoeIkM
	 TT4VvRnF2F6xucaXhw4fzn7lsihgLd79T9KBAhq7SFah5pFMNVwtUdAOAVLrPcj8oZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599889;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=TkrnR4M5ShzVl0vRZK+2K4xCAbUV4Oc5GVLm/ZSOjAk=;
	b=lQSiLofHY3OL4XajKq+EX+heC6LRrC+DyvRZKApCnDluNY2k5Vt6wBE2FzCe7XFMwniR
	 RGSKKUwI6b7Ru65eiPQa4STtv5DgZt2yfCIglsHI7t1TYiWXaB1AVpUPRxwiYsvwvYWXW
	 NePETpU+DYfz7CTODlGalSYPD57T10FrUhQ6SgLK54+fb52v48Mz5eKS8iduIL/QDkExM
	 YaA1hEUiCFOXap0qU6GTJSSSvorWj5zPQztuUeSPh8fn0wcFf3WieQFakA6NuTPs/XqLL
	 JxtKJ5weZoCc6gt/hDwoj95FCOnt0WVXCG6pj76Liq2HsVmcKxCC+W7eFrLrH3OPkhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=SGKNeLqF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.63
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013063.outbound.protection.outlook.com [52.101.83.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C04C606A321
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 09:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C04C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=SGKNeLqF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hlAH5Q2RnYA1x8lmTfAgyn56QUvwsifuhN8eL3nV5WHXAjNuTZN9A+iITV1GGW/gpDEeKycrPVSKpLm2rNEh56gnbHZ0wDyFjxabDIGojpS2IH3QQ6AJHYmo8dPKq14Xo4tNIemWMoc4I0M1ThD/1cT0lkrmHqkyB1wZdjY+rjhVqotMkLABLsFtNYpul7WqIGSVW2MvkRV1dEXA1TKR8o+9SZc0jLQ3Ukwf/BXwrjd5qf4QlZUFwNFa1oVYel4NofPO6lGNI7sKOiiyNx/0KAcdZVlllQ6BUu/yIRtzu01AjDyCwfzWsrfyWo8n2QHN/SwcXWowZy+/dNAP70wfZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkrnR4M5ShzVl0vRZK+2K4xCAbUV4Oc5GVLm/ZSOjAk=;
 b=t7gQD0Uopr6gZ/a/okmFxGbQB4VlLZGbxVl5q4w0bhPgzSfJjyHjKfxC0idNGPuoNaeZixPgj+Hi0IFh4YwaFH5L7xI7fdQq1kJnd8p2UZj527NKzsO1YZiGpHXWf5XpGY2FTnixHUNZPXKaNPa+Z5xVzoUwib+J2FF4iyVCoeQ9JvycHq1cMoVZbqIn1XVxdle43P7/dBg6oQ2aJWLjXOMazEIBlIuGfKV264/oONE58MP1thCTp2oNKd4RDxnorlmBsVAgvCUWAnf2SR7+elGNaSimDgY/NSDAYb1TlpDk3bisGqNF2DyGaehKBAUttiwFn0GOzSxRjwf65XOoUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkrnR4M5ShzVl0vRZK+2K4xCAbUV4Oc5GVLm/ZSOjAk=;
 b=SGKNeLqFcN/etfHxpU+Aggdwa1XCG52R5L0tuCWvOvQEtA/xjQlvS52U7Chopm/sQWEHwMQzopxnz5lwWSFe2QzsBlzRuOsYbJvqR0mylKCuEC/8NFpXUCeLyjAdZb6F0ZcSqufgL8ju7zovyQ06TKt34J7oNEYH609F0wp3oMiUfvIPpeuEfVT5xeYLIXuFgMXFHH2lkfsGPPx6/CuxlJess3dHKCkjCL8546tvVRJ7oCkIuTUeFx/3y9awTU3c4IzqVZtEwy2PZVYFr5cR9jHSq1T/QBX4hoXUYMi5pex53Mry8jdHWXnrNECnGSEhHR154AP0zikJLopZaoY4oQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com (2603:10a6:20b:23::20)
 by DBBPR04MB7929.eurprd04.prod.outlook.com (2603:10a6:10:1ec::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 09:44:44 +0000
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0]) by AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0%6]) with mapi id 15.21.0639.010; Wed, 25 Nov 2026
 09:44:44 +0000
From: Stefan Ghetu <stefan.ghetu@nxp.com>
To: Frank Li <Frank.Li@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Ghetu <stefan.ghetu@nxp.com>
Subject: [PATCH] arm64: dts: imx8dxl-evk: add missing dma interrupt for pcie0
Date: Wed, 25 Nov 2026 11:44:38 +0200
Message-ID: <20261125094438.820864-1-stefan.ghetu@nxp.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0039.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::24) To AM6PR04MB4472.eurprd04.prod.outlook.com
 (2603:10a6:20b:23::20)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4472:EE_|DBBPR04MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: b07e386e-d5ba-4fef-abc5-08df4ad8bc28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|19092799006|10067099003|56012099006|11063799006|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CyaciYvDu0q9njJ/JQ3+uGlq9RLTQyiP0JvwAhlZ5YUVtMNjNnMB669a/MWnG0Ft6Qdoi/vtXPalTj1oXWJ51wtz1L+HXD0v6iRLNQRlueY8wn/HbI3w9U5yb9BUdTLyRhnpSfFufSFqIMrKXWOPzI8+nO+nu31mR6M+4fz1S0IaEY2pyZz3+4FPUnb4k3btBYnbwRVKYdy30niZ8gzSrB5zQFxoXFgnmG0BpnkMvcMV30jmUizv7DEoZj0SFlZVaw1OZUONamQ4VKO4SMUiHF2nuCp8W+xinYvhJQjHPAuUURPixHGmHUvp76AZ6L/8l/amqHCWSNTgvkjfQlvVHOgsWJvbpkEFMc/x98LVs8QcYvz0goUgN0w7zcRCEKHyQK4XS6CLLESJA1MKQx691iOVJATVTUo+VWZRyM+NzxCS8MhdRj3O7zKrK5FohjPteMI0GLXM5bBf+a8aRuxkEN9kVxCAh6g/tC8VJOX42XTfYwLD7rc92tYHnsjXvKZfRmT3TIFdjMz6ww/gUsLpxt63aCqQagy8Ny8WougyduwNe2zM0GPk4/8LiTO6NTnbaET1TD3OJbwWW2nvOyfsPks+z7IMGgK6QtZ0k9CNoyTUFhdmBtk2i2APw9EHYVnZsRGsEcMYMiqXwIcO9RiCI56MT1OcdCubM3Y+T9Yxbs4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4472.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(19092799006)(10067099003)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yc2kqg1CB9Sfpnnc0T5ZESQmH/Ke7UOUf/wg59zdVgbLeWiZx0w47ncmWiQ2?=
 =?us-ascii?Q?8vGDBaJq/Uc+gRp55JU15vFNHKfX/D5X7INnCuYDlJhPVB9OQWWL1OLaH9Ps?=
 =?us-ascii?Q?YixhiZ8JYL8PpAOFyNZT2LcHAg2m062gL8iRrcvWFrEr52Z98C4kfTL7e7VT?=
 =?us-ascii?Q?7cR8D+JAowrLUMJ3QurFmJ6IID37w3MwpKKIAuYELfuQ0A3KQASK8TkjPK5V?=
 =?us-ascii?Q?r80XMriEG62LRGB2wVVK6ZqZ9VAermMJS3rtZmpGcJmn3R6xKXuC+64//qrj?=
 =?us-ascii?Q?nl5hZIJ0gF303oGhQMb4eA3xzkdtSLLFzPpydN+Y4H2P01ipEpz666GMNCPa?=
 =?us-ascii?Q?1u4TTqU0vlf3PStu9fr5FIkhZXmDKIl5k/I80d4DeufwN8qqzhICvG9QeC4Q?=
 =?us-ascii?Q?F2y4/4VX1tOL1OcVKvzJ9H4gyOHnHBYPtB0hKNz8pUVfJiDkS7LcqQf6ISks?=
 =?us-ascii?Q?Jp7aUuZRXNe5aKyhn58JRrAbZ/RhzUvLQ2Nl590QINUfhIEnax3pVCiEIZ/v?=
 =?us-ascii?Q?mBN2oY9GL95s11Ldd36xjV60NltuJ+eOWEYf0PbhRh3So6NTCXtFHG5ZPPEA?=
 =?us-ascii?Q?VRcZQrZWdnav+QJsHVc5Rlx7x0kFJJSnw50+HKYG4ydUr5xIx9cFSndHYub+?=
 =?us-ascii?Q?icSs03Yva2U/9tgPDGJoBLZ/WepCqR/ldKiEh9dY9ZKM081ItV7oiqNmsjVt?=
 =?us-ascii?Q?hf9AubOYL7UaA3DzrL4OD4YQDkBqqS0OZGq/j0zVSx6fedYix3i0kbNUu919?=
 =?us-ascii?Q?slyI+O6jbFh9Z4x+WoWK1sxChYbuOLLAWMMM6lIh1+Ww2KT8J1+qQd0/mtO0?=
 =?us-ascii?Q?6PmtSimWvkBzmj7u/ZZK2DTpqGHl0l0RuKlzbMcgjSGkmu309c04H1Jq1+Le?=
 =?us-ascii?Q?pln9RKIM2B62Pm8hrx9x85H+YTn9uAc26dLUEfnywXdcGdDWPfXNsfc6Vlig?=
 =?us-ascii?Q?dRkCbI+Q5KfXzVkOWzZ1cny+cYF8Ts8s/fq/A8Mz/llDIeJUtoha/LmEHJMw?=
 =?us-ascii?Q?t8EIjd80ZzB4i6OJyn+g9Tc0Xl0AknJNFC2m2iCuL+/IU8MUkHLCSO8b1Mnl?=
 =?us-ascii?Q?F5OYD9rPfYg5Dju9fVlVoQlcfZith4kWpF969yQNRfaVep6oRQrTCzqewa0N?=
 =?us-ascii?Q?H71v7ltldkgBrO4AcJRLuS5o/EuyMrM9l9vEh8ECF61X6Wvo9xUSGc4AJbbL?=
 =?us-ascii?Q?zPbrM9ZF2k25zQfJU+6d1mUaW5d7IhYbjyT+W7foU9flFD4/l7xdyyvW0h+i?=
 =?us-ascii?Q?MeagBOz7sUFOoUN7rID2frP8qHUZeHuIiTIDzA+AvotBsl6UViX0oABD2ZRC?=
 =?us-ascii?Q?zFmimkTRF29mOMUnbL2R2XD75KhcgZNHEj9TOPoVLGN1kA03IuE6KAem5hsv?=
 =?us-ascii?Q?YBDmcWgZAz3nUm9O8vW708g5BPYAbHRqXeaOO0CbO4YFxqY9LSIAiK+IlqJn?=
 =?us-ascii?Q?LZCldt04fXVP1uxoIOX/1uJ9SGlWsGGAz6QKIsLGV1RO+BPW06BcPdz8pUPP?=
 =?us-ascii?Q?BHOMIpnWKnsiihPwY9mvJHVTlQISmN9zXwTgQlkGaHH/m+HAgty/jSnkWRRG?=
 =?us-ascii?Q?igZ6aMtRLrB3qeffIpx8xf9eypoGhjJnK81wg35OqfQjj2LcBJIn7SqnSXqd?=
 =?us-ascii?Q?BeYNzrjChopKOk+CWV/ACxPd21uTtj9KJ6uqCs1E//ZEsHfVjFo102k6ZMgy?=
 =?us-ascii?Q?uBFhZLL4EiV0jvg3LZhE+DJ224G0vAnaGqfmvOC9Fb7R67X4/4Snl7Uw3yXc?=
 =?us-ascii?Q?dac+WCGEHQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b07e386e-d5ba-4fef-abc5-08df4ad8bc28
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4472.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 09:44:44.1331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2LCaF8PtxipIMuwwaxPHdONm93deCuygF/jG4Z/INz9kxiyL+WO3ik389S5l10QNxTGDpFIC8PyCdr1QVz1MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7929

From: Sherry Sun <sherry.sun@nxp.com>

Add missing dma interrupt for pcie0 on imx8dxl-evk, otherwise it may
print "Invalid eDMA IRQs found" error log.

Fixes: 9f7053f67c8a ("arm64: dts: imx8-ss-hsio: Add PCIe and SATA support")
Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi
index 5c0d09c5c0862..6045ae9b40d7f 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi
@@ -40,8 +40,9 @@ hsio_phy: phy@5f1a0000 {
 
 	pcie0: pcie@5f010000 {
 		#interrupt-cells = <1>;
-		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "msi";
+		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "msi", "dma";
 		interrupt-map = <0 0 0 1 &gic GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
 				<0 0 0 2 &gic GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
 				<0 0 0 3 &gic GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.53.0

