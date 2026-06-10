Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013062.outbound.protection.outlook.com [52.101.72.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B363D8138
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 09:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781083513; cv=fail; b=RfICjXxIoPTR/MPSmBvQ9v1F6uvae48sSOGCpvxAZshaKjvPdj+GaZy+Qiim2HLtVm/huTH+qqo61HZQbLJYT6XM4eBT+KHpMf2c1YH6hfCgTXNDEi78C1eD4dsx/aT7SrUIJy6Yl09ulQcP9O+IDCnSADHDohYmvjfPzHLMLWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781083513; c=relaxed/simple;
	bh=8xJnbGsEIJuZEvyEFkJQ84Hdtwi4WZNfGdaEBfMTQeQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cfqSeLC7kEqO1whoRfd9nV3zzplAHWzTODkHGoSxJ/CRUwH/pFLdZx90gDeri04L0wPu6qQRHLB4DRYR67hIjCz8y9zG3KYdIRLp5adVGS7uSx2W2DhRULZCAVIwbGX6p8BFO5stls96AzO9jyP651t9ZSGROpKB+EIzmQmFEnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=anYu5oK9; arc=fail smtp.client-ip=52.101.72.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="anYu5oK9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uttwHHWN+WJDqZzE2s12HoDJ44Hu/0a09Wpj6yjVsltXM8R9titPC3vI9Imk4UxFAto0RPVIaqgAet844mkq+wSoACRLnZyhvVkkhqq5rHjBYqNLsDneFFli6PvTM9A6NM2fyPhlBOTgexaty6mgatO/F82zTG9lbFymYy5GWWQwoRyDFcBzL3qDwUwR76QebItw+j5jPYDRCXd8313QujdoHbspXno3GQY+wSS88djgxqJ3A140kZPAz7B2Pzpea+urrWofZPXXC1aMKikh/QeqXwMyra0rkU/+YoxD0MabAs1NYnWvNkylhdcUusDmPuXI2AF47AuIVd6DQA57Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YaB9xj1MvxQDYjyA5zyT+jOopAc8FY7shUuMjpNMZdk=;
 b=FQKtSDn1olZrOwWRx3/8duYaHJRo5t9NANmfnPpSoqfu6Jy5y9tkJHKltKuRbeMOotAznGn4ulJaPDRigNs/qzIYJUGHQefgtHh2wC/jIv2z1M+T6uWYaWqBduR0ASn74phcle5B83vF2gAKaPIZe+lPH3uzIUoLCIoCFAmGIctCacpOY9EG0LSiQnXK7c8AFOMeUXsfkKRE3uQgHm6RWp1bTKxfgS7Fg+Wmw7o1eGlB+PAF8y4/XjEBPytiLG9Rdmq7lVM5VRHOFzpMg3dfSfpNowTG36aeqjVxUvpvZZ/Nf0uHr9w9SwLJx6sG75YwIM/BqcKrUnPryZb3lR/0Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YaB9xj1MvxQDYjyA5zyT+jOopAc8FY7shUuMjpNMZdk=;
 b=anYu5oK9NQd8rMRLXYRAz9e7a7lqpgzSoM2ImeNedIQnultJKERkwwwrmTui6kUV3BOZg0SwyK8T5ALsd0Y6Frx59KlP4dcjQZEgX2bO+nzWcnYMi9V/FphoxvDMmiUeBntgNlPQU2n2jIvxFRwHyrKnC7WYiqwCISkMwYIzSABe1bBA6hOt1S7mtqAzMZ9YfRWgXd9dRgb6l413cnFPj1fHGe9I5bPnL0KeqW3c7I+0G8Ukp8wM/QcyxaejnZfPjQg6aWavtTC2HLBP4FWiTE/C8Nrc23GPmbip1jO+Zrq0lO9tWA8T/BjdNXs9oiVSeBe4DbDw1JnwCPy9Y7S8QQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by AM9PR04MB8860.eurprd04.prod.outlook.com (2603:10a6:20b:40b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 09:25:08 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 09:25:07 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Wed, 10 Jun 2026 17:26:22 +0800
Subject: [PATCH v3 2/3] arm64: dts: imx93: Add LVDS Display Bridge support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-imx93-ldb-v3-2-c9b65d742753@nxp.com>
References: <20260610-imx93-ldb-v3-0-c9b65d742753@nxp.com>
In-Reply-To: <20260610-imx93-ldb-v3-0-c9b65d742753@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>, Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI1PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::9) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|AM9PR04MB8860:EE_
X-MS-Office365-Filtering-Correlation-Id: de5e62fd-187b-4d25-c5f7-08dec6d2298c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|19092799006|376014|366016|1800799024|22082099003|3023799007|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	WV0yrJfjyjg6OOBtlk6jgpg4j+VQ6BvoOnY9XxQEBUSbe5Zc9CRKT1W9jFCbduEIuN/14oOGxHBMZ/2KYnf9LHTja+QPMgGYk97BGj89qqwprnlZ2beHQV6sPodyWjaRaED/vtRtRxPVuZNhFgxq6JGzNyJDpRFwx2upi7+01wU8as7wlQgNq0sPYA6cvWERhC566tgLDp+p1c9NZXAUOKrVFwhDghVRoj1v7RsEm43RB6Tu3Ky6Ip8nJ8IX2C87MOGZ3KHLk5CXHS7GUAwPCjlpdvWAgTpHcBX65OkkO56rVU4/d4hh07lXc/1d8u8oWpkcGJEL9WJNIyZEuKcW8bx3ndFXVnKR43mcYNxLSbZs12kSnvWw1sdLcqkad3UA6/7C0i+eSAuts+6uFz+17Y124BH6ln2fvjTKbJw26/q/6rfNIpkEdtMgIBCs3Q2/Lzn+9wMjMKkuxuUl6bICtI7a9yy6xlO8GBOAv1XPVIFZOmVNu4SCrEtQqCukOe+sMqyrPGtQ1w0tXbFM2nLTFdyYjqzotRQ6U1huMxZ8xhauwdYGcjmbPYE4pGrYe11yF1ruigLr1vlu3CKfxnFNbJuY+CHSnCPhCcV4LT+W8Ptve2YE9l50ca7Ms9Flp8SeJYJigFW0lrbQ1pzTIQtAlR7Z6iFyyTal7usxYRHZB4KTa/MZrJYdjx3hbEkLDiBJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(19092799006)(376014)(366016)(1800799024)(22082099003)(3023799007)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnN1RHlzZVdBNFZ0dU1mSmVoVnh5UXVjblIzSmZGL0RWdXhJWWVaVTRXWFJs?=
 =?utf-8?B?ekt4cm9PcUtvRmp1SitHUDMrMG5GNjVBQU5ZN3paa0Y5OVkxMmtaUi9mNVNt?=
 =?utf-8?B?ejNXMjJPcEZOTndTYWhFcU5oOVc5Szd1ejMyUzNSeTNzSm45NE44RmlubkFo?=
 =?utf-8?B?Q1M5RDE5RlROaW90cGZMZm0xRnhrVEZpQUM3TjBvWUdQcDNYOGNveTZUa0JO?=
 =?utf-8?B?U3ZXaHNYZjBXMlFZUEZXc0lRQzhTZVBtUjUwVXF4NitGeXZ6UjViWW13NXB2?=
 =?utf-8?B?eU1wRHV5dlZYMlc5TFFiSzFFQUV1NGNGQWM4RmVON00vbUJiSExqZzNGQ1Bh?=
 =?utf-8?B?OW1qMVFBOWJnbWNrUmJrZFlkbG8xSkExaStHemxxd3YrYm9mUnNad0gwb1F6?=
 =?utf-8?B?T3NVYUNnMkRxbkdITjE1dThBOUZRRHhVR3FWVXc5c3hscjRNVTN3am92dnpr?=
 =?utf-8?B?NEt2UjRhSkpET1pTS3E0OGJCWVVDN0FidENLK1cvRXNwcFFvb3NiYnRyV3Jn?=
 =?utf-8?B?aUpkNlFwdUFQNFFJZ2dXUTJ0Z2MveTdYR1pYMzdxOGMzWFVIMmxiWmxPMUFj?=
 =?utf-8?B?SEtRQzdHM2dKMzdUcG01cmZERXQ4cUFSbnpwZVhWWm4rTHhPSXpNRGtmRjM1?=
 =?utf-8?B?dGhQZ1ppSS9SQ3l5QzZuRzNEQ3BHdTBnNEhlV2lIdDd3eEFWRHJHOHBONFBs?=
 =?utf-8?B?RVFhaElTREV4VGplTWlOV2FVNXcxRGtVWkt3THJ4TGVZcVRMSkIxSGZ6TlFy?=
 =?utf-8?B?eWd5WEFpQW9PRDZDNnBBOElIaS90aW96QjBXTEJybDRsdzVzWHJwcWhKWlZq?=
 =?utf-8?B?NGJNSTNJRHNQUDk4blZDRG53dWVTYm5ZcWpkMzVtY1hQWCtCTVVKeUxuTkFP?=
 =?utf-8?B?Syt4L2tKRHVlSzBRd0czdk8zZXpzMVJ0K01ueHBmMjNLVENnazRDTFRheWp4?=
 =?utf-8?B?QUZPWmZhWXJZR09TaGxRNElEV3JvS2NkcE0zUGMwWU1Dd1JJWWppeWZJcTdt?=
 =?utf-8?B?RktuY1NuK1JOTHg5YTZLVWNLRXhsWTdzV0ZzNDdVOTRHSHJOOXd3bkNXQjN5?=
 =?utf-8?B?ckFjWXFOWFMzR1lrbFRNUjYzNVN6MVBzVGtiM25mS1R4M1paRkxGZVNzL2ZY?=
 =?utf-8?B?aWtLZVNZbFNzeDk1b2lUNU0xcXpoVjFMQ1JrQ3ZtN0pKRldaSWVRNFpiWFBN?=
 =?utf-8?B?L1RJbEovV2lqZUVXNCtzYlNLRFBrV3lRWVZGOVJRTHNvTzM5ZmI2dEIxeE05?=
 =?utf-8?B?bllrclU4WlFhYWRsaEdKQWQ2d0U4SFpianBCdG9kOEwvbE9pZklKd251amMv?=
 =?utf-8?B?NkpxZUpsQU9FeTVmWnZHNlRwUER2TUZWdTVjenJqNER1b0NLSE5rc0M2WWZ4?=
 =?utf-8?B?TmFXc0hGbXpCOGR4RXVjVEVmL3c4SzlHTGdGcjB0cVBJVE9RNWlGUEVaZ3cr?=
 =?utf-8?B?SUVRQ2tsZm0rV0d4UXQ0c3lTZ09NOTBCSDk0S3YwYnhnOFZTYThFSjNCeUlz?=
 =?utf-8?B?SWQ5Y29vZlcxMVFyS2picFoyL3B6aklLWHhBRUwydHhkZU13cE0yTzRvZmpw?=
 =?utf-8?B?b2YxTnpVSzZldkRvejlXRkYrY0ZHWlZENlh1MFlkcWdZT1FWL0d0alRFMHpT?=
 =?utf-8?B?MHFqKzNoTzZhZWhDajQ5QlU3U0RWcnB4Zkp1ajRYNDNDYVRhSFVGQXBrSkJI?=
 =?utf-8?B?MjVZL21mMWg4MFRmSVhjWTB0NFlVU1p0Q3ZuOGJUeWZsb0h6WEtoMkFQQ1R1?=
 =?utf-8?B?S3k0VmMzSlBGNVllRmZoNVMwQy9qUUdzcXVZaHp4UjVGMnhiS3gxR0dZQXdU?=
 =?utf-8?B?eThlVVpHS200K0xLZmtUaGM2L0duSWRTWmJvTGxWRms0RDBPaVZ4WXBLRXZo?=
 =?utf-8?B?OXVVR3hGZlFmcFplTFBsTVlKRzltUW5EakZCVHFXdGtLVCtSU2JZNUwzODJN?=
 =?utf-8?B?NTlJdnBaenQ1NzNlYjdySFBvVmR2TCtGekdnRmRZeDhnQ3lKK0tBVUhLREdy?=
 =?utf-8?B?SUIwMFNKeHl2Vld0ak5xaGR2MUYxZEg1Q0lqcXUvYlNWYXRRaTNVM2xmY1RF?=
 =?utf-8?B?emV3ZHljV3BlaVJ1SlFLTXIvNG5rRlcwMFlzSnRjYnFqR2tDb3FFbzQ2SFRQ?=
 =?utf-8?B?Z0FzR2cvVHpRK29ES3cremM2TmcrSjhQZ1BFbm5uWnJMRHRFNGtXVUdPTVNm?=
 =?utf-8?B?eStzREptZ0tNRGhUMlpBcUtuL2dSMEpYL3AwK3hob1MydWRDWVFNeC8yQS9S?=
 =?utf-8?B?aklPRitmcUtCZkc1TnZ5aXdNeG02c3BZWTZqN283WjJBOWdTUGFzblNhN3U2?=
 =?utf-8?B?eEhaelhaR2ZVcVlFblRRblJRY0tPNFZ5OS8wNTkyZHNCVG16d3Mvdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de5e62fd-187b-4d25-c5f7-08dec6d2298c
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 09:25:07.8726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yA6KvkWzkHFIlecLy+IhkL1s22QUsfYtAX1ky6rPMJ1CIRche58rn/Ds7hw8lCRdNZJRxbOLvpFdccoiICpENw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8860

Add LVDS Display Bridge(LDB) child node to mediamix blk-ctrl node
so that video could be output through a LVDS interface.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 37 ++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index b9abe143cb56..79fb4a15b733 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -178,6 +178,7 @@ &lcdif {
 	port {
 		lcdif_to_ldb: endpoint@1 {
 			reg = <1>;
+			remote-endpoint = <&ldb_from_lcdif>;
 		};
 
 		lcdif_to_dsi: endpoint@2 {
@@ -186,6 +187,42 @@ lcdif_to_dsi: endpoint@2 {
 	};
 };
 
+&media_blk_ctrl {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	lvds_bridge: bridge@20 {
+		compatible = "fsl,imx93-ldb";
+		reg = <0x20 0x4>, <0x24 0x4>;
+		reg-names = "ldb", "lvds";
+		clocks = <&clk IMX93_CLK_LVDS_GATE>;
+		clock-names = "ldb";
+		assigned-clocks = <&clk IMX93_CLK_MEDIA_LDB>;
+		assigned-clock-parents = <&clk IMX93_CLK_VIDEO_PLL>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				ldb_from_lcdif: endpoint {
+					remote-endpoint = <&lcdif_to_ldb>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				ldb_lvds_ch0: endpoint {
+				};
+			};
+		};
+	};
+};
+
 &src {
 	mlmix: power-domain@44461800 {
 		compatible = "fsl,imx93-src-slice";

-- 
2.43.0

