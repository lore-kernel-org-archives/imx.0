Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795165286;
	b=UsmaHVzk8waRTS4MMCiIaH98vKpWx53HN3zgaM76W/x6xzvuXamwYHfQnpJWiuHqSPVj
	 kNpm8l/L1io2EoZZ6v5YQ4mFsiUAd5LMBSoLjwkdNcB/05/+VAChgZdU7YWE9two+B3Aa
	 nN42GUDaxsELDZBYLWZSuPmXwHTvDJG//K9BUSK6tgiCTSbboxKjPTlX1g113x2HP+CuH
	 TrhTWgVqhsbEqsdqVgA5b3KFq2WxZpsjqRb+LIryYf7YtNhHg0tUWZYqN0vAhfg1yKrDT
	 qNqtmRzIVi2p9S+LzQklCi5VDuwbJuKTGrT3c1f1GfAS2b8kD3CSEHN9xDdPMyF9svQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165286;
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
	bh=hRyyrcw8NG36P6l7uuBMaXuQFS8N37UEqIhWnsys+LQ=;
	b=wIhAmYvX/dZhrV8gfRetV4Ii9xx698MnGxCbknuh0BZ7ATNbXJ4wJq7RWwjZz4nLWKTj
	 W+rYk9fdFuKTxUj7K3/MuqHSBnA7KtnmwCADjpmveWrqBmj8vIKDSRCc2jm1p7lpC5DNd
	 RJ6u8pzsSaSM6bXj6AY+TM0JIaDV87Nrdv7eP5QGHWqVqGIUpzEAwlzoYfdJrtM2ShomH
	 dTGXkrb+wsnLmc5aioaEik9eMBPS1BCkxrc2Jx8vNOsMLgKiae6GwsMhrY9B3ZjTdBoHU
	 YRtgqpI6TJjiRK9EpXALxnycYDdQHs8mFjJy9TlWW3Zhh6e8119tOG2WyT88SUz7t0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WvMh7i21;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.46
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013046.outbound.protection.outlook.com [40.107.162.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FE1606A338
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 09:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22FE1606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WvMh7i21
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NGgmIekGJQvxqY4/oAdE63geH+mEhSS/uyQ59OLP9wGRGkMbm2WdObYOw54l5Z2i10GibytivV1qqbiCGHMopGQ9XtbyWeU8mvr4j5EoFt4s+rlEyFgspJYhd/w5Se7HYwOmHHRizwe/o9sdwquhiIgpMckcLxWW2LezwERGI3oz1PqByjNN3CZkw2SWqPna7J3zvIxqq42PbBCsMqbUrP7OnpcuspdBOJGlJJHgMWEHMoVpkoD35CbEPgGwEPjan8Qpj8U3DQzE1hMzqNEJjJPTHaA1sGVqiJnCYwM35zUlgfa7p0YSnotOeZ4JNcb2UOXr9YDPRcOLDWe1uCHv3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRyyrcw8NG36P6l7uuBMaXuQFS8N37UEqIhWnsys+LQ=;
 b=JZw721jz0HygIHZgFDfIVCi3wVTFHC3li6WX+wx9z0/Dzam1Cl9ffgsXXmCldzO3AozMFioPUMUBY8wznqTImrH6JPzsBGudZ2iiJO/boQdL8TuK6cENDpk6tdUVJMOCN1taMCudEBRYipL/+0KqgO5Y+fG+uAqD9g8EEAoNYyR+8n1xYl9Oao5Df/qOl7WlwHMsQPbo/pBPZb/ANZMydpA/lenWH/trvHlrB1Xz6+hjdzgCVbCSU3qdata3URQoObxhqz/o7kID9S48y3pyAAwH2dElRzVq07g81USjXTeeuk3LuLfMPtP9e1M391rJ78tLrYI8RbOZ3MNydIWhzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRyyrcw8NG36P6l7uuBMaXuQFS8N37UEqIhWnsys+LQ=;
 b=WvMh7i21FDilna4oM4EkDxexAB4hwbNbuLvigWLRhtB1Y0OBLaFXPmeuYlBQ1Mm5GjWfRNuUryNM9e6HxWkfBxwHmZ5VHNMC8ToFItfJEAPrZJWWHwZ6NOFbgiA0N+7e1xY5D6+rIqZD2Qh7pPJyRErNLA3lUsInV3wKVb+BqU2FaOk+QH4Y0IbKPXPKTnQxE2TPfr0K89HGzKbXFao9aPsBgDpehuXu0durfmr32yUx9FNMwBXTzIPqOD9uaozhJ7X9F3DBY+6d/ZMLWXKYcAaVbDcHVetOm+hODrxxWk2MIJTULlCsNVtfUUzR+4sptkpnbgA+3PyIWYWYpMmBJw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by AM9PR04MB8083.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 09:01:22 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%5]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 09:01:22 +0000
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
	linux-arm-kernel@lists.infradead.org,
	shengjiu.wang@gmail.com
Subject: [PATCH 2/2] arm64: dts: imx8mn-evk: Add pll8k and pll11k clocks for SPDIF1
Date: Fri, 20 Nov 2026 17:03:24 +0800
Message-Id: <20261120090324.1220501-3-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261120090324.1220501-1-shengjiu.wang@oss.nxp.com>
References: <20261120090324.1220501-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR03CA0012.apcprd03.prod.outlook.com
 (2603:1096:990:6::19) To PAXPR04MB9351.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|AM9PR04MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: e280d3bc-fdbe-4ed8-5b47-08df46e4d93f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|19092799006|23010399003|22082099003|18002099003|261009223027099003|921020|261022075727099003|261021121427099003|56012099006|10067099003|261102123227099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Up8kuwAwzG7qv0Dym2kAbiLOpBwYERpNOVh3AheWTjYDqmrTigZWc7p11jUlg8D6nALFJImXuBg7TAFl6AaK0OoLDVy/KaojnEyqjlNWFduQqJ+dsLT74HMqqhZ6EYaSsiyvduT2yRg9m+Xm789czWpo5cPkcwTOhqvoIVWjXjVdc1HmDJnqc0EFbnBfNz3G8Eeg3yt4SQV+I8PrOk3toKqU39avY2d3P/fo9lgbXbzOZA4FhRhTwHEZDsA7SUKGc8hGFH4wZjQwRZkrV6vKDxv+LMNzang2UiZD95fE021JSZGNj/9nIxU2bNbJvgZ2ETdPS5EJgKw+4XTUAtSyf8ViQG4jZAogi1ou7kPYpDqNVD2WjPPbs90+UeYr1cQYRFdh13luC+L0GCwjIgzzsitEGqqKIS56I5phbrOEnyoEhQhV/T4F6lDNqlklS+cxbCpsUZ2VIw6v60kzPm/K2WtaMBP1kDgpAsgSDbPsblspAsDPbvbv4e4SEnWdVBQzol2OESFeiAiEoW4hZyA8YiF9CPCffVqAZylO+sCYJigdIiUpDJHCJwfm0cpi8CAwLAN7rpfNQ7V/y/pEvaNWya53MxK52cdr79fE/IZOVi4eg5UaxdU+9Nfpe+GOAxHuD8dlJLq36TfdRwsi3CvEwdgVjZJ/n24GuEdwE/DXQ8F/1byeZCl5vZAehbnElv7TWs9XLHyZEgHsF1bgvBekAA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(19092799006)(23010399003)(22082099003)(18002099003)(261009223027099003)(921020)(261022075727099003)(261021121427099003)(56012099006)(10067099003)(261102123227099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yVIA1lKdqSBNfLMzAa2n+C/z8O5KaaWWfThyMlwXkRCoVgWBrQL48YGmZQRS?=
 =?us-ascii?Q?hlP8FIzKTv0N8t/K+SkpVlU+mVqzPs0442uK4PiF1Uwqdd5Ml6WseHYiDllK?=
 =?us-ascii?Q?hvofsUVwRdMXvRERfLmDSM6DdA7m45aWp3j+aJFQvv7XzxQNoU1v67q3v3sw?=
 =?us-ascii?Q?cFCqJss7ZFQpKnyIyDaTCElEJhrTYQEfkWKNvwTJn/+zZyh3QbHoUkNfqqU1?=
 =?us-ascii?Q?x1UF13A5xdxyZ6jXmJNCVdtWa+oyA64mpIO5h4Dw10LXm2udMmV75wjuvDlG?=
 =?us-ascii?Q?LH5F35quMvz6G9y7y7q1Y0gwhHG3xbulfogKV7KvheN94zIBP0ON7EcWHlL+?=
 =?us-ascii?Q?1syxasSofAph+l3f5e0YRmHQVM7tAUr2eKlEkKHQ4Yvr+gfOKm3PX4o/Sz8g?=
 =?us-ascii?Q?xy0kuQN6NKUqnKAVj0ZuT3WI7XQoprDdgBvRd8G2eFfPLYoZ3oAH3YGYw3cE?=
 =?us-ascii?Q?XEte+oi0GAVoAQvwnaSBoyA3XX718kykVUtvICwdJ+F4vdsTUtlJ++GwJKKe?=
 =?us-ascii?Q?3DhrYphPMvk2+HiTgMKLZWznO3DHNZ9H4R8xkxAeaSDHhJvRCshyM4B4os/q?=
 =?us-ascii?Q?tvaPYL3RA2Sy71TdBCsKcE0DlAooFnW0OzSbvuteB/wSB9k0HMcy/W/f9+Zo?=
 =?us-ascii?Q?cGe9AeylHdOfXvMs+kfWNH2AfShRCfbOZXQnAo5JV7MEtPMrW7+IXOHbP2DF?=
 =?us-ascii?Q?Yjsv+E8qmRNjdsM5PmY7e4scuedkC1tDWb7/gRJIDL1GIDcSNXHuV3EJoUon?=
 =?us-ascii?Q?1FtMxyZUaE6vrShY2rzTMf0RBtlc+KFh0wB+mhGFbcQe9nz+xCJDCUreAt3y?=
 =?us-ascii?Q?vDcgu10Kr2lK61PuDVAigvqkY2agn7wQcNG4dTzARoC9kZOJ6SWSwkex14Hk?=
 =?us-ascii?Q?1Vv3TVCTQiLfau0xNI33LnSaewoSQb+UwHgy1fQFNKA4ULdaSf6EAabakPqL?=
 =?us-ascii?Q?K6kNWV9hEqG6JQlJnVWQcFc/BgGAUkRX8C9obEh9FmV/V/Aign057x2oAlSe?=
 =?us-ascii?Q?/whWJQon86PPtOTkI+R1Zc+T+1R3+tJFY4grV/Tu6A/bjKPm87lo0jXNWQ+f?=
 =?us-ascii?Q?XJD/YTAALPMR5cYZwv6xQXMNh/WUI7oWArTjiQLZekBsJdemBMS4qXYawF0E?=
 =?us-ascii?Q?9u8YYiuin56PEMndTN9Rd+OmKJ7eEFHJqLU0DeiYFDzMaW+DWqCtmiGSjZLA?=
 =?us-ascii?Q?Tai6uBmsp9/fUQGH3pNUdMihIksK6JefIEi47JiR5BCTnV5jKbBBk8TIEq9x?=
 =?us-ascii?Q?rT/b2ougR//hZiLlAy5Lc6siFKFQSDxtRUhUHeYaiskqGO9DMEO5opKkCB7W?=
 =?us-ascii?Q?ahhRpkR6Sgcs2cjwolY/WLYU89T86gWB8HuKRIDvsIjTMLef7QxiDftJVmte?=
 =?us-ascii?Q?Elf+8lFUxkwA8p8CsrnOlhbaEFRFwzA+JL1Y5JdX08Njr8pskQPncSV6Zrmo?=
 =?us-ascii?Q?GeaW7AXsplSsJhmjBDB4uloePeXCEqBG9+6UgDtW3RASaMA5GJypczYES/ig?=
 =?us-ascii?Q?oVsIW/JGhf06IXXmDiCjk8Uhhevebjdxtqj1VaVpRXMcLlbQq/xl9kxD9QK9?=
 =?us-ascii?Q?OPVuV/9i1LeQDcUYHMB+eb2OlAg/P9VSML1ByhBhSVqhIQ03voLnMUZ+LOms?=
 =?us-ascii?Q?lSSfI/xUzAFoaFOzQWLi8QdPuXm0l2wUhTn2k61X2O3QTGyYYoFmJfs78sgt?=
 =?us-ascii?Q?fXAEnImE0L938ZdXQsQkSooCcjL0smhE5XhdKG2yuwTBKNCyX8Q9H6Y8llIG?=
 =?us-ascii?Q?TA9WdwB68QfEaYxpuUpLL69BZRhuyPCtrncByayCOpiY5JQfNwd3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e280d3bc-fdbe-4ed8-5b47-08df46e4d93f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 09:01:22.3926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CeQhTC1TngiIvQWGsndxh0sNIiSZ9BGYbE34NcB9dMTLHq1zGqqxu9gWaC0s3EHenFFGd5FQYmJJKpVAd2mFCGef+M3L1JxUAS4ydP6aoswYqk4gZbxAQjEdFEz66xCv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8083

From: Shengjiu Wang <shengjiu.wang@nxp.com>

The SPDIF1 node in the SoC DTSI only defines the base clocks. Add the
missing pll8k and pll11k clock entries sourced from AUDIO_PLL1_OUT and
AUDIO_PLL2_OUT to support both 48 kHz and 44.1 kHz based sample rate
families.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
index 036afa0f6990..a24ac05ff02f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
@@ -405,6 +405,14 @@ &spdif1 {
 	assigned-clocks = <&clk IMX8MN_CLK_SPDIF1>;
 	assigned-clock-parents = <&clk IMX8MN_AUDIO_PLL1_OUT>;
 	assigned-clock-rates = <24576000>;
+	clocks = <&clk IMX8MN_CLK_AUDIO_AHB>, <&clk IMX8MN_CLK_24M>,
+		<&clk IMX8MN_CLK_SPDIF1>, <&clk IMX8MN_CLK_DUMMY>,
+		<&clk IMX8MN_CLK_DUMMY>, <&clk IMX8MN_CLK_DUMMY>,
+		<&clk IMX8MN_CLK_AUDIO_AHB>, <&clk IMX8MN_CLK_DUMMY>,
+		<&clk IMX8MN_CLK_DUMMY>, <&clk IMX8MN_CLK_DUMMY>,
+		<&clk IMX8MN_AUDIO_PLL1_OUT>, <&clk IMX8MN_AUDIO_PLL2_OUT>;
+	clock-names = "core", "rxtx0", "rxtx1", "rxtx2", "rxtx3",
+		"rxtx4", "rxtx5", "rxtx6", "rxtx7", "spba", "pll8k", "pll11k";
 	status = "okay";
 };
 
-- 
2.34.1

