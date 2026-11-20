Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795144586;
	b=5CL/5yOHXAKc9jsdo1EsZ2drEh2q3ce2WxuF7RpH6v6OMHh/MFbqJogq4gwA3GqUaUxc
	 ka4Lxrec5IVTNXKTo7ehYFuPN/bZfHyiCV9wntVkCp1Pd3cJ7lOS8yW5HK47SAV21mS5/
	 bGpt+rIN9KxgLhl8UXY7R73z0fE8oR8/Am/Kfizo2ALWaRtkRwoo/i5BR3NsstB63uYrB
	 ws0b607xYwRam2cF4HGR+Uo//bicnhzme58a8MIT/R745agDfl3Y4PszEh7XhZWXR72yh
	 kC95DsGxtdXfFFD+6NOrMC+pm0zve3uHjBXR7MPxmObpcPZWBGL/n6DpI0D41AnvN2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795144586;
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
	bh=uwduE3BcafESCSkvGEBC2OZamEzT9bPFfSVPpKtjn3Q=;
	b=Sw3wGS/NCpG+3k4b6ZqtVciGzQSWmfEDM45NfkmUYnzRQzfAX10EUu8ARdTiWWDRpWmA
	 A/a3QK5asOrK9dRySETYT93DdWm4Ftgd/hAzAmagk0AeJos4Mt4IxeVBsy6m94QTMEzl5
	 l2Hdob7cIdTcTUzkk+vgi5TqzpahncHU+S/eGf1V/Ult9sG/wjaqrtJOEYrK/eaksujrm
	 y8+3qAqCPBPVzsp5JYFXSp/4l/ZtPG66QsKAqzBfpxnp2DT2Z/ng8uS6LQMR8OSLi6hHb
	 aCVuZqWWcLWjQGh1jxn5qtBZoo23+TiYREaHRc1v1zUsAX/r+hFkJ8JxGy12J6ws97A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=CxxXb3PT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.62
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012062.outbound.protection.outlook.com [52.101.66.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2B360A2600
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 03:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C2B360A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=CxxXb3PT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khWUvRmljiPFdoDok2589Jo+5rTeyZMHCWZRMh7+KaQJ3i+HqHzriIpyk3ki2wGxMd4WslkG9gryJUlCugwZLfSsoRNjYADa4iZ3afrKZOODr1E4m+z1gwyDBnqmYYdodXrFsugsAZ35beh48FIzvwW1biji0L9vF8/eIKPcILHImQSP4Mt3QaXUHfJuik52J1Y/mKnGR5cA//56nXx9S2D8CI1UJ1OUqeObz0g128vr+NmpyVTP8M7JCrkLtWvSFpLoCUAGV70c0B4qeYLL6jT9tm3tEIg17+719P9uGsCUR4uv9QbL7SnEn3uW06Z9+2pnb1DKIRAhiuCPXFadbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwduE3BcafESCSkvGEBC2OZamEzT9bPFfSVPpKtjn3Q=;
 b=uuCUdmova6kHx4rJCnpMCTboBB8lDAxMuUjyiRd+VhyxT84b1dADPhCaNY5tCqH8pglgq4N4n63o5r+lOSVDL7zQC+I+U+7Thbv09kk371xONX86IVVMns8QqzH6EZoc3uro7IakDp2yuIQEuzq06xtHI8fYNseTpZsIOlSwZifH+5Ccy2EM2MoENVmkQoC4eclC0LJ0pDgQK68i1CVReUZMiQIeWfgiVhB2VxFDoEE75mOrKS30LIf5HVJBpzvPw3Orwm9RRl5aTZAOpiUcxXbo9tECp/Nn+SZDL741jDYmROY8cNlzQDX4lG12y9qzvVHU4iIzWyzgvunLIUiNvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwduE3BcafESCSkvGEBC2OZamEzT9bPFfSVPpKtjn3Q=;
 b=CxxXb3PTXQGc3cLgFm9lxrOLk7rq41I67SDbt4dKeE/YYJVygWJEo9LWvTMdH421DU9Q0cSVc9ga/CNuriWoagNwgkC8sSjIqIP7/kiMvh2fi4WzhQpTtvid2cAfs/cRZ7umdbnRQu1Cqun7kWkf+NYbE2yf4T5qVaBdjKDDbQFF479QelYfacSTZG5BnAVgTSEr/+4Q7BYmQa4wSWl+WMeIY/rnk3kV9d5nM3jM2K+9AI6Uq/hAiA7npxLdC4cfJ+QShZIffw68e/PbelBScE5bEdQqfX3Xl2kdw9OjN1P2VgFWe428x91jlLXlcLsAMdFHC5jXAjMwvFLPEYDRiQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by GV1PR04MB10522.eurprd04.prod.outlook.com (2603:10a6:150:1ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 03:16:22 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%5]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 03:16:22 +0000
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
Subject: [PATCH 2/7] arm64: dts: imx93-11x11-evk: Add DMIC codec to replace dummy codec for micfil
Date: Fri, 20 Nov 2026 11:18:48 +0800
Message-Id: <20261120031853.1175454-3-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
References: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0016.APCP153.PROD.OUTLOOK.COM (2603:1096::26) To
 PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
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
X-MS-Office365-Filtering-Correlation-Id: 7cb2a546-7c48-4b18-144b-08df46b4a73f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|23010399003|366016|18002099003|22082099003|261009223027099003|921020|11063799006|56012099006|261102123227099003|261021121427099003|261026140227099003|261026121527099003|261022075727099003|261022105027099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	xK7wgBCMLhC8xiazYM5r3S5S9l1HTxyX8oG49jwYozUgmqSMWlxmdTrOPO0y+oG28pB8dz1tpFGs6mDoRvobP+WKw2x4mwK9GjR4USMSmdfX8TQVu6piw3GlQuuRLI6NZkSxvHbUS4oGnEkckZxKn5tu9T6lNEdb2hPptRc1IrTYY5x8zNcrh17VzarJifQJltFmMgzrb6LBCl69e4fPaOE6pWsxlIsBPs0SlJgIzKEAGi/mlOX79wK6YMN9toBZBFbTaBGnV8Ba0tW65DHLq8hzPMz21JfMF1yAuiBBAwYwF02Bc+8sj9mafWKdCsiyysmAkGqsbGTbUAjA2nRohWBsZs48518M8uy7kX8azit6U5s7O41qkj1YD0MfVoWlu2qMb4HLubST2TDWn3CzYY7bMowTkZe9OZ/L30DKbvZZqi2QQ/GA83rjwOXVNZbxfMCgs9YPe62eQvRuV1YD+KwecOxNm2Q2a/swz140C20pGH+jcq3rpi5ZEsvLhNDEY3yQBehExcTmXcorFfm4fCLTngg+DLGiQaHFCrTtcXJZ6w3KWy+t7O+zs/qXd7QXNtjJioHf1nZIRbzWqj7TBCB5h7knohb/djnNI4UMwEGtwiAoNC3zsdeEjbioc5GXsRlmgiXFBg11hEHCypF239GMzZf1qkHmS6sulBmrm4Q29qamd2bfvliu8JCt/CoRjwuENrsGyfbBnZOMN4nr4Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(23010399003)(366016)(18002099003)(22082099003)(261009223027099003)(921020)(11063799006)(56012099006)(261102123227099003)(261021121427099003)(261026140227099003)(261026121527099003)(261022075727099003)(261022105027099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g891KUOuOsSgG+2rU2JuXS+U3UU02dDRgJu6DnE8ZaPfEemaBiV3a7bgwkU6?=
 =?us-ascii?Q?flxFJEeuCgCFVm4zbd79QyHyqE8qEcbvVIb9hb3PVn0Emhb83pxft6pYv15m?=
 =?us-ascii?Q?NG23uONnu+z1joy17JOFcI1P07n6O+JKmls3a4GsrjnOb73XYalkeEuBTUEJ?=
 =?us-ascii?Q?/R6dD/rA8vf5kxkf0LAF1ykOXv2j6ftxCidMos3pTCY7wMzXbmGHK0jQBNoV?=
 =?us-ascii?Q?N8TIdHI7ENdYjSNUHyV7qhZ+rIOIskFC6dBts8PiADO1RIyuQJWBsAFuuIkj?=
 =?us-ascii?Q?6t9bPKiMYs35H2+hXDYd1XuxNj6gQlXJJS0GOfDVovBpY6KJMkIsyKG8Slwi?=
 =?us-ascii?Q?x/357BtcX2IbOW80G4rw5xzcYSrNmR+8ixN760PLJwCNzQvaacEKiLeVhrJC?=
 =?us-ascii?Q?1dsknlb2ejOzmQM4cgFk7gcgkX68Rpy2jCD3snKxCP0iakzkT9r5u/dmNI3M?=
 =?us-ascii?Q?YyncPk1l98USetaqFLl+8OQu+i2KXvT0lUOduIecZge2GAc+xjbHzuPk8VQC?=
 =?us-ascii?Q?c8B0X+pxa9jJrYpGOYdQRVz2FPonnsFGZni+6t2DMt0mg938frTc16aCoOf7?=
 =?us-ascii?Q?3yAU8zH3vM78e6LdG9YdIQ8LL65RBVzQ2+HN6EoPfGhT5EeCrP64n6CP0f8o?=
 =?us-ascii?Q?pJvCtNmjneeXHSglddNZDWaCtxf7J37zgYDAOMBdK2Lj6xp1poN+iQ24788x?=
 =?us-ascii?Q?cpLmfiijX+DLQ+Z9YOwBSqMMFLQVII21DFtprVOyi+rqd/RhnkS15l6Diz0w?=
 =?us-ascii?Q?+SnaoorjPtMlOKLx4toC8Nt6Lkvsk9RYBEjncFLz9iCH7x0UPuoSuuN1u881?=
 =?us-ascii?Q?q4GCmiZ72kRULZE1rOV1pPijuOd7Y7QQVtLcUKWuZv6IlLQKNvzxi6/y7/en?=
 =?us-ascii?Q?wRdrrt7hhfWd8L3TpwXcaY1b2dkJHM7QzM+3dN4Vjspa4hBA9S6GRo5ET0HF?=
 =?us-ascii?Q?Zpzv386f4qWKYqslIl9fZGgBQ+vAEoo2bDD7aorulDoZbO3ne2G7IKX7e3QI?=
 =?us-ascii?Q?Chj+k/KzkTMERzqY12w8e0Nwj2Q051fdd8Vl6qbel3Zg2ONkIpzU4bgDgTZy?=
 =?us-ascii?Q?bQBT8NXlqWstCrblCSpCDa3wvP1ozbpTagnqF5fRoqeJHg1VBSD+IKQmXFbc?=
 =?us-ascii?Q?Xw9/W3XpRRC+ITO980vyFgXllY8EZ+k08bUn4i/bH+uO7N+IBru/HGiyWyPk?=
 =?us-ascii?Q?/dej3DcGRmO80bPODjNGETUCAD5haHsPhSO4BZt8xtMulOVsrG2XX1ATvKO9?=
 =?us-ascii?Q?zw8vRgptqgyk5b9/Jc6gCsPVgmL1gOb5zPcdSC8wYYKzWtyw41Jzas9HmlHM?=
 =?us-ascii?Q?MW6pQ7arXYDtN6H9cKNYl1UQuxaGmnsdbOXy4xXyAKKkTtNHs+hu06EY57El?=
 =?us-ascii?Q?+7KjzCthw1pELkKenFhibaA2j5LmKfpAMXqHaZFhRB/WDoU5hO+nWTDeyPZE?=
 =?us-ascii?Q?WN09mkY6fmn6117Pxv/sowuWQI75nLGv8vXs5AIRaym4VePRyzHARKL/M9Nu?=
 =?us-ascii?Q?FDLvh8ZtwmHMfFPGbk6GAKUwIYcpyEJknmOURWK0hrMnE6+ImbjXX4Oc7/E8?=
 =?us-ascii?Q?wj98KW/B8dFCjWhQ1G3DYKEQfKuol4h1sXlnvNEwO7TRIyJNG1V86o09KmdG?=
 =?us-ascii?Q?N48oTYgOHGuPE4r2NNWQTh3DRq3ZBvonX7XnMSB15ZOwAxXBqh3WaUJ/4Sbg?=
 =?us-ascii?Q?vWmL82FhwXID3CehcmXgpabY6mpM8uDi0kpcIiHPxU+Cs3IDzQkCm8/OVFw+?=
 =?us-ascii?Q?KT7YjcF+6siwbUlMpmv48PlQFUFrRms4HpXKqMa6Txi0mEXhSA0j?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb2a546-7c48-4b18-144b-08df46b4a73f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 03:16:22.5333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dDp5Xg8dB2oZLXjTS9b06CwXBV89GKyPi4vt8RNSlFTWecJdrBfFvqhBYc2Z/LcKzjU3Nlb6MTF7nn/2Altq9XJPVjtXt+WpZYPHYEqI5TNuuf4L2F1ZfwZGKwrGUIYD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10522

From: Shengjiu Wang <shengjiu.wang@nxp.com>

The "fsl,imx-audio-card" machine driver uses a dummy codec by default
which does not allow configuring the channel number according to the
board design. Replace it with a proper "dmic-codec" node configured
for 4 channels to match the DMIC hardware layout on the i.MX93 11x11
EVK board.

Fixes: fcfa86b3e02c ("arm64: dts: imx93-11x11-evk: Add PDM microphone sound card support")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index d3312093f996..b6cf5fd77c04 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -22,6 +22,12 @@ amp_mqs1: audio-amplifier {
 		VCC-supply = <&reg_3p3v>;
 	};
 
+	dmic: dmic {
+		compatible = "dmic-codec";
+		#sound-dai-cells = <0>;
+		num-channels = <4>;
+	};
+
 	pdm_mqs1_mux: mux-controller-0 {
 		compatible = "gpio-mux";
 		#mux-control-cells = <0>;
@@ -111,6 +117,10 @@ pri-dai-link {
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

