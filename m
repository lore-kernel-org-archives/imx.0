Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795144594;
	b=zAjjs2EIlhAsPEhGykdJABBWVcNJPpbVMNHBls3sKAy61hsNWtYoldAxeEhebYjNzoIy
	 UlAIJYpEEVD3raVkwe/5miYH0s2kIysNfoty+f+VuNRllC/XiMK7oCIPjuYCsa9cjlcMK
	 FQcGn3hR7W88PK/z1zIKw+CQ8ebj+lZrmLo6jKKg4ymml9Xu5ZC1e8rmtqiIKrh84NEol
	 TtMqhHNLZ1KClAN1VQe/gB2B32H3ZGGLXYgmRWxHW2G7rF++DBNpaoZGCHOPvauVo/m5a
	 L2EAzMp9vpfZfDK4jh4y8fUhmcTkKbSnTVX18rzEkS3zN+J0cnvCMAdtM8dghL74KgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795144594;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=S8pqMmAXTDSCGtLdVqbEd5eGxD9fSM/hCFBDV6GyZWs=;
	b=MZP1q3c1oY3t0nrUH1sykDF67bSgbVzIgUvcR/dW15cIhYYji+UfIU9fmWuanxOcl39G
	 wmQaUMnXoZQJSsWb8C0OCZsSrIT/014AeBnbjxcLuYmfAONiL990625Zix3HnDrjui/t9
	 poJqi7+dzMYreCGPnaJtAXFFAbhPlsN8Fqsp/5Yd7j+PRwN7gFTMzCUzpuewI/4CmGY+8
	 7sTXQ1J9D1e3X9sD6u90M2aa5UmiVCmr/GiKsXWu44GevSsTcXEiaNH4xeIaoxef1V5Pm
	 qJp6g7kAPsRORv0pTU/WQlamAZtUT/Jv0trjpUtWzKue17kWuKZxmp5ZGA8X3xVTQng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=uManA72r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.70
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013070.outbound.protection.outlook.com [52.101.83.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A42A60A2600
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 03:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A42A60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=uManA72r
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFGQgh3dv2hC6iS2bmzuWgYRh5BWrkXefEXPpK20VE+H9KhqdhhX02zTpTf29QDY1pqru4v2aSkGL2CSwGbvUrTn0xS+i5FBSu9SB8CreiJCt3mgSJp1KsuadRzMpdqv0k8CBZgFL+HuQmaARUMR4FnqHZR2+UL62x1wgmhQ92wbqPUJqXM0b2F5tHxH+gJQnrS/bqYfnCeRuxbRB5OzmlyzU6p5/1dKsMJzScch9NrL+ZwnMsESAqNneoh1eEA0S1kjxzaoo9GxnmYMOEeXJKxMRXO/AQPeCtwwAchHxsQh4aZXnFND0lgx/gpKeFr7ACJdmLK9DiBJBEWL1FD96Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8pqMmAXTDSCGtLdVqbEd5eGxD9fSM/hCFBDV6GyZWs=;
 b=oqhnU+M8O1jskeRZOvO2d5kvWfSdtlLlI0GJV9NpQf/o34jCPB0ZLi+v4YCA03OPV+38OVrnjB9WAp5xHDWpuAVD7EQwyubFgabx+6vHsshFx/6UkEbw7pa98/tFRWNgFHAMMFA14B/Pzolbzn1hId1cr3TvjMYagFQfYimfmRpxolpBSeDqn++I7WFdMdHnoYQkg3/GkhuVCuk2E/QtmBzExQulttukhYuST6akbZB6430/KW1LgI21C8kvBF0cIFnwO2UQyU2m4Gzvb+ulUxbA834ggzUalOt1c/IUt0XlCuBjJk3t6yodUO69j32tVVRftNO70hi3xJGmBjfBKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8pqMmAXTDSCGtLdVqbEd5eGxD9fSM/hCFBDV6GyZWs=;
 b=uManA72rdvtKFshU3khYxKC4062DGNIPr3pFNKn1iiNBB2Voe2KRs4T7KsCT5EqQNWWyLcqTBjGgG9pnfvOXc3C+NemQOlyWCQUjuPsi5hZdPQDHcneC3bMUqMcHrnAtcMcDevQvOBG13V4cpjfNwzAXVWGGKcCUSmLkgNGDciGz8ugzdqBfPtYKN+TMmtP9Hc919XBzEcdhrAidZ9O0g8EPMJz+uw34TXcMnB/qvnHzEBxJnl9IG/+2RlG+475dsvmWRdBsvk2Q0nrwoWCKOQmGbSCu+SKBRLxg5wzGvTNSwgrbb95MzCw6Uj9/l9vixaAhhTEKp3civ8XaELUZ2A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by GV1PR04MB10522.eurprd04.prod.outlook.com (2603:10a6:150:1ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 03:16:29 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%5]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 03:16:29 +0000
From: shengjiu.wang@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	daniel.baluta@nxp.com,
	chancel.liu@nxp.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/7] arm64: dts: imx93-9x9-qsb: Add DMIC codec to replace dummy codec for micfil
Date: Fri, 20 Nov 2026 11:18:49 +0800
Message-Id: <20261120031853.1175454-4-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
References: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0138.apcprd02.prod.outlook.com
 (2603:1096:4:188::12) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|GV1PR04MB10522:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c33cff6-5b8a-4724-9692-08df46b4ab82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|23010399003|366016|18002099003|22082099003|261009223027099003|921020|11063799006|56012099006|261102123227099003|261021121427099003|261026140227099003|261026121527099003|261022075727099003|261022105027099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	PlP1xnBTmNIRnA0quW6gnNUQ5S/Yraztn5FU0EfrHdhLpx+qrRYHRocIcbmzSYvskfmh+bk1Liz5UWTqwUykI9JNkOI1Zpmh+jSqT7yBK9/ImxM8wVV9+fy+9FIC2rYwiYvC/ShoTNfiGVKBVJQTH2tm1WGoOGaZJLETkdXiWQ9e6C4h37IFnXSUTevnr3Xtgi8v2Gwyd/7roLxfZESCQ+Y861DkrecpZFjYS1wRW8e+5HdOUPTTNt2NMa1Tg04A8nlmUmYy86+Br2DWAcnnvZdvhJorko/4Ss7f4kDByMSFhE3jsYB64WDlde82MEpzog0ACAXOrzXwo/Ik9h/WUrubkgE3xh5FcPJrzS3OUA/ta9xGxVPhVDYscEGbnx/t+H1/vVoh/hoxhG2lXXHHoMeaZqyBDyn4kOKTTsYKw4BzSRI57kgQUv5LWqPgiiJLd9oU3JwSgMpvAtW2/ErBBTejLPR5fhPXM61G9Cw0QiwaErNdaoTmtk7O2KsCzoD614wLmLIiuCbeQnmxA4BarRycEkGkrlmkRHYT1YSO11u3bGZNypzLPMWNU+jcrW0oSUzVYBreIOYN2t4LB8F0WmytyjVIEIO0ZrNAhktts5KrCpnyJT3zrgUMUaF/SnA6vYw97v2kFmrr5EKjvIdtw7rVp2oT83N7ImcA/bOuRg/rRCUxYv9lb8XscFdXS4sRe/hSNo7/2T31k8OEDlpEEw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(23010399003)(366016)(18002099003)(22082099003)(261009223027099003)(921020)(11063799006)(56012099006)(261102123227099003)(261021121427099003)(261026140227099003)(261026121527099003)(261022075727099003)(261022105027099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eLdypQxeLZwLKmRVsonKUdSE4S5iZRU630DihWFo0HTlQo/y8og/OtZ5liCV?=
 =?us-ascii?Q?f9dyfM1GYZBPqOBVdOGt0oz13nDhUZOPi8NaUHSwZBVihRrtu6c87viBGdiI?=
 =?us-ascii?Q?G0A/Tbzwr8sqgHldwEnypLU0ARP5TgOBAS7i9yfgCqtuVX9YfatKYOi8wUDG?=
 =?us-ascii?Q?PpkgMWS5MnKChQqIJr9h8J2Q5qvWpH3l8j0dIvIxTgi14cjMG1Y+qv8dBOFQ?=
 =?us-ascii?Q?QfLaNtnBvkq+1+U10W/78NHO3ctjUOrdT1RNECTeqcRoqEs1d5J2UaaEg5q+?=
 =?us-ascii?Q?QxpLytYN0xPJ4Kj+OOqnEz55gfxCvmOnWn3qF2k5WyQpM+TEiw7bhu4Uhw+Z?=
 =?us-ascii?Q?3fRdLvSXGzJHGkZYsHv1budhZNZmO9LYxFhuReFWqaeMkZA4yMn6tiRF5A1q?=
 =?us-ascii?Q?51AUTvWsxkoR37qAGhF04J4xWpvPfsdna3Lq3OH+r/a5iBLb2TkaNqCKDZd0?=
 =?us-ascii?Q?PEq7OFzqdJmjMLQwArvrZ7tml7vPZgKKlQTnOhU3llipGuJS1ihqVEWsw5og?=
 =?us-ascii?Q?H7hOgIt7PTIAO/Z5a4+vc1YDGj1zlN0aRVqG+gmagu/z0ktQpeD6HgjZeYTw?=
 =?us-ascii?Q?URAUW5ybCRrZRADpMA05QICKZJaWvvo9J1xVsLzZx6qfPCqqJDAHSrdR1+Et?=
 =?us-ascii?Q?BIJAiVhu8fminqO4b5j1crwYqJL1/qLl3k65HgW0Y+qNT0ngcZTU+CMPvhv4?=
 =?us-ascii?Q?zkyYlrVrB6uUMldXWrq9Ig92UcCHriEjGFmVX+2n/wKb3/VEagIxxrGpd+Tv?=
 =?us-ascii?Q?Zg+fSFA+fZ5hzrph0L5nymtPEXuHmEmr9Qo05x7kZPewpSK30IkGxIHjR/OX?=
 =?us-ascii?Q?woFBUv/IxzkUzE8a/KXWVKor6Wr1poVp4bLeqP6r8kVNgJghsmvq4Cm1M9Dz?=
 =?us-ascii?Q?K31awUt/KNFQnzYyTC206BB3dq4J0dnWlIE2ajD/hm7U8jBHLEizSXv26NAL?=
 =?us-ascii?Q?9qLNkLB3trE6GfsV8aPSDalJIv6V/CUrtdSzp7lgWPqclEKC84beA3xU1KCJ?=
 =?us-ascii?Q?WDw5ptKIgW6lGdViASIU962tDGuGlwTNQLNgNRpa0y8sMCPYZD7/4Uw3P1ax?=
 =?us-ascii?Q?sHeKaH1FNPjMQ4NvA4Gqujcxo3tpUZxqGRK1lB3u+WU2gI/mZF8tXL1wkdlS?=
 =?us-ascii?Q?dsPgXlPz9WpF242uf6lWxhCNL4M9TGun2QJQrwOh+2x0VRq1yG1pt+1o50tk?=
 =?us-ascii?Q?6PPAuZw+71vPLUn4ad9SgOwkl+QW0+4JTFUJQYqGmQwPB19xeC5s5gI/tUPZ?=
 =?us-ascii?Q?Mp5neqt7nAjE+cblLXyQu/G+YQiv6kGTW4CgAAM6lPu7ktjfKsxtiGuWDf5m?=
 =?us-ascii?Q?oPeYWWsoGLmG3duyK+RDflsUFhLa/jbWoIcoFgmz6S1Wo7qPO1RaZ0W1lBRz?=
 =?us-ascii?Q?40pkTZg54G/UKqgS9nhVJmkw5SAoccyNGPzdoAXQOg1/sKuzfQ5IuxG7CJg9?=
 =?us-ascii?Q?1ByJLCRoDjDEnVnZ99r7YNSoC7nFMfOTS4zFhQw8t//wuDKUHbZcIgttZTZb?=
 =?us-ascii?Q?5e6Jp3AhD5wB4LlYlVdZrVzBUV9a806hV/xZ2CY82qqvHoouy+z41WYw72F4?=
 =?us-ascii?Q?ZAgyxDZkl+fh1XP0RCTQTVi6mMOEaSssTLJUaX9P9qHtM/sCvHVAzCy7E/AP?=
 =?us-ascii?Q?w01m9JYzUPJHQWl2AwhlWNIahT0hCVC/IzZthFwkjx9szKj6YJl7I4jxeA3x?=
 =?us-ascii?Q?L/UV48lHHOrJf/afcCraJshCGGZ2Lips141eoG79WdhwExVl1K4yTH/v5/AT?=
 =?us-ascii?Q?kj+4KkgRs2D0bzEdStiqc+PHbSpeEwTS+ySXtYPEDhMKggqZMRUa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c33cff6-5b8a-4724-9692-08df46b4ab82
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 03:16:29.6756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YF3YuZbwjN2XKtgrK1F8OvwMbHUf6whg+K1cbJhc0GpZJAU0z+el8LFjSYjGCMQYI7wznMAFz8MuIqRV8yVZ/BN9o/Tp0nvN3oy/wQIDTpT+aaEhl15TTBOcQ8f92SI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10522

From: Shengjiu Wang <shengjiu.wang@nxp.com>

The "fsl,imx-audio-card" machine driver uses a dummy codec by default
which does not allow configuring the channel number according to the
board design. Replace it with a proper "dmic-codec" node configured
for 4 channels to match the DMIC hardware layout on the i.MX93 9x9
QSB board.

Fixes: 31b2f4e4c4f7 ("arm64: dts: imx93-9x9-qsb: Add PDM microphone sound card support")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
index 3be5bf4bc101..8a97bc58ec37 100644
--- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
@@ -40,6 +40,12 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	dmic: dmic {
+		compatible = "dmic-codec";
+		#sound-dai-cells = <0>;
+		num-channels = <4>;
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -175,6 +181,10 @@ pri-dai-link {
 			link-name = "micfil hifi";
 			format = "i2s";
 
+			codec {
+				sound-dai = <&dmic>;
+			};
+
 			cpu {
 				sound-dai = <&micfil>;
 			};
-- 
2.34.1

