Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010049.outbound.protection.outlook.com [52.101.84.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DF63E3148
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 20:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783540859; cv=fail; b=TrztPiY9GZqFtmI8FhhCxoW8O3CdsIc6F7OJ+/M92hreGxPcU29qk+NbNxKdiqhhVoQc46/dq92kikQx66T14k4JQn6xTdB8yvcu1w+8U417rqPQ6rc4hZFvq4VfELSEHM/1t19JBtTC2LYYoZgXha0e2yDoeyAyOXaINtxskcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783540859; c=relaxed/simple;
	bh=SxQcRmgLLTm7MVqM13eIGGZZWNKifPmUVq7nRzS+PvY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ADgb60x6DviTuaFfJI4m+FQdan81+eyakaVec3EilOwmHvtuPVjYvHtYEJvq/YdLL99LbuGQh/kcfOsTb7RjRVg6tGnYZc1TqMT8352o+8X7ml+/Lghp0Fwd0KdMo+ysm25ed/yBjgZSsKomhwh06i1FkOVK9LnC6ne03Iltaak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=b7RZDvsC; arc=fail smtp.client-ip=52.101.84.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="b7RZDvsC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zWVWaWj/HQQtYLcDrwPuOPGUus3YcfmGq4zmJsO1jC/gmtu/KgyBdNnwi1OfVB33IqUQRJNKBEulW+yfA64Ph1fB9J5YaoaLZajKVEPgXRsNlr68nyjkcFX+OdagNOx6nnUMg7YNUWdUDJeKfhujX2JgpbRkuF4+xgbM46wWeyj45nOJgKq0lasDkOI+sW9O6VN55WUBo7aw87YhbUGKZ6grrwj4kQ2qu8l6R6+DI4J1CD6WgkTFGSBKHuhMY7MrWgzWA8eWLDtF9b8aTT+CJcTzelj+xFCZo5dFX69f8CcW5WWiRl6bk1hqiuC3+VZsMjjbv8wmphY85nII1E8yXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSikrLWfdaZMxuJ+grJilvCjaKrYEVI59+tM9RTg7Rs=;
 b=RFMDsseza97rzV99btOTSCyEIiqXIZJB+L0RPOsf25nMnEIk3KM10WrhmA8AruMhu5AMEj4hX9UPkjmVKFhEXMzAYX+IWxcOXSUxfIItmih/bVmLLKPV54Ze08rJBU/SlO7rHfochxNJZXOuUwOCcVtRNx+L0Dbl8aDVQhxj05IEMh6r/sZXmbvKmXbGj4uup+UxiiCDiZkMMwjgN3MU82BqiOLCzukAyFP+IffXgskELfZYasBRwJ3i58RDyA2n58sXbKelIdhr0kpck83Qj4V6rF03rxcZzEqwTR4gQHBZC3y/+Jy2ou13sEMUh06WyxCIczCTirrssUB/7Jg/fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSikrLWfdaZMxuJ+grJilvCjaKrYEVI59+tM9RTg7Rs=;
 b=b7RZDvsCUERbtiduc3btt8z4LoIQUyk/7tFYyjtonMewybFDK3SAeapWgQU6nkDBmbJ9QfHvBU+3FTEeKZ0yf1QqfA+YhOm9DD5GxPo4FG077tpASYtpiEZWP7BNlq1KeJOLqey19U/UQdGtmyOcDw805tniq1RufhCCamnjEPjvcDfsi4SE+4AWgLbIK2+XrJ4U6y+7d+57sLnILiiYUiN1JVD2ZfR1FMiM8JyDtgNLQeTb9CFGdjOmUYKng1L1+3coYA6ZwPU2sWMUlxLJiWDJ5p2oFlNFu/ykEGf9V0nZeosYyI2DV/8rzf8exgzyUjJPhAoeKiV88GjJpeaZAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DUZPR04MB9966.eurprd04.prod.outlook.com (2603:10a6:10:4d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Wed, 8 Jul
 2026 20:00:55 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 20:00:55 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 08 Jul 2026 16:00:44 -0400
Subject: [PATCH 1/2] dt-bindings: soc: imx: Add fsl,eim-bus
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-imx53-eim-v1-1-913b4559e5b5@nxp.com>
References: <20260708-imx53-eim-v1-0-913b4559e5b5@nxp.com>
In-Reply-To: <20260708-imx53-eim-v1-0-913b4559e5b5@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783540845; l=1408;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=1rTef4fPn+An7LSU+SNdTrLjo4FwYJWVzEyp1Tnh1pM=;
 b=zkmt/6lxBIE04DBujMUeM+VCZ0cZBxjIDEgvpsjBM8jYjnwzB/+L7oRKK5VKH9cfGh8p+0f//
 vKpniyp7JBUCajJNLz0UZ5WLVtlrtvgTj/yNAqIvcPcDBcAK+BKxdAc
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8P223CA0003.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DUZPR04MB9966:EE_
X-MS-Office365-Filtering-Correlation-Id: 64ebed15-d331-428d-20b3-08dedd2b9ec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|19092799006|376014|22082099003|18002099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	/b76qLth0XfHLcwkuIs30lhHXI8yAX3yxDS+cvnCZ8BGlP10F0NsxXTLgmm92v5hKiy9dRTT0g2RGhoYx9GMAvItoR9C+bCTqaf45Og4OaDpNEgpmL8wAZP0WAhj9++j6EK3CCIjTMBZ1oLzKpVPywc47GHmx2PcN6nClgMJQdTxt7UXAOUgYlNF/hhL9xhBIkA+n2Tj+MQ6TAL0RSU6IA1/VWvzFV8ZvOSOfAHhuKSnXhqzl4Sp8xIEH8cB3+5weNq0sNLkbCD64eRY1iMw2u41QDg8b5Qudljp3AfBGuR7itY2h5jwJvRUVwbbQDZBd9Xwi1Byh5e2BEmFHoSYxtbcZTIzmWYDrBsO99iQLvq+KcZqc5i91GB86XFxjQkkZIhOHRFOYYvGsQqK4kxnHYkniiap2aQ7R5y9kXWQxM3uv4sIvkisjI/NFEy1Yl31pDfLwRdykzc+gQvfliVr+iW3O9gMwnyAbUA1V0aCgI4TVJjTkOeJxbvH3qadxNNwHQh0zeZ4OOyjxlJUckIy8GRgmEJ9u+J3V2oGSvxmBfkcX+j8G10L9idlv4M4UUjNqfKqUacgRy+R3Hz4WsveKD0bsC+L6YeP+5rcpSu/G7BR0J5RCFfca1C/nMc7wzsapNKkrGVTfOq3+R5saqYsE9KooDHdRMQBTX3rl5bUL0w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(19092799006)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RENHbzdwMDA4SUFiV2J0bm42a05TYUkrcXN3bTZuek9HMkVTZ2dOdFIwVS85?=
 =?utf-8?B?U2xERkZIZGFVWWZBUHQvc0hGd0xablJZdVgrZkwwYVdxMmljQjAzNVR5ODlI?=
 =?utf-8?B?TElQZ0g3L2l4dSt5ajFpQXVmQXI5cDNlT0MxR0xsSytNQmY4SGRPN3phdDJs?=
 =?utf-8?B?b2Uzd2F6bW5rQWlDcWYzMjVRL3pRckFlcVRYT2NDanFGOUhMUFpnY1BRRU1V?=
 =?utf-8?B?eHpWVFd0bU5pMGdVWSt5aC8yeVBxTFlCa1FVVFdpNFN1eC9IeVhNbHFHZFJP?=
 =?utf-8?B?dDNSQTRuY3JxRVlsa3VGeU95dmhvMlpkY3ZCTHZXZVVIcXk4V1E5cjJYVzhQ?=
 =?utf-8?B?M1IzMjNIUGpZZEVHYnpJLzlQUmRZdTZHUFp6blU2YzhpbGtNSm1FRmY4VUtX?=
 =?utf-8?B?bzJ3SlA4d3RjNFhwT0ttVy9IWi91M2h0b2lzUk1Eb1prRUpWZHpGRWRoeFVY?=
 =?utf-8?B?L1NvbVVhWjRrK2J4b1ZqOTR1SEJzVzZ5eFY2RmdBbWY5NUY3em1LTGR4bE5y?=
 =?utf-8?B?aXlBc09WN0xvbjFjVkxMV2tHNFhEQ1h3RWlFblhOUXdQd0tSVVZlZXFHbnhP?=
 =?utf-8?B?eUhHRlduTmF2c3pnV1RyeThWQ2s1cjBCQ2pBVFppRXRvMmYvYy9nOURXeTNZ?=
 =?utf-8?B?LzA5S283Z2N3WVhvaVgwKzEyN1BIMzJ6VzN3YmNUYThBd3FKUnJGVVRrSitN?=
 =?utf-8?B?V1hWMmhWMlJYT04vWlVOcVZMOEoveHZ2K2R2TUpEeXNjWEgxTm14Sk83c2sv?=
 =?utf-8?B?SmluY3h0cVpLZGplbmUyMVVhM2Y3VTQxSVJCUWVYWjg5dnVtRzdDZTZoei9S?=
 =?utf-8?B?Nno4a1hodkpLdEZRUFpVS3BYZmdwcDUvdHVGMzYxTUFsS0x1L1doVnRGVjJB?=
 =?utf-8?B?cWRGMUJCTExTUEN0QWN1MnJxSEdmWCtNZUFrcFRXVzM1TmFzWXJkVFpYWXZa?=
 =?utf-8?B?M1k3YmQ2NGtyV0YwK1ZuTU5Zd2lLVmZuV01RQjJ1d1NOZXBaaVhySlhyYWFr?=
 =?utf-8?B?aWlsVjNRYXhOMk1qV0NRUnFnYTBzK05EQzZCSklSWUNvVFIwVHJXb2JiRFlF?=
 =?utf-8?B?dVFnL0dzT2tYaVY0SittY3U4RlEvclk0VXg3V1FRNndSNTJBRXdhekJYVlBU?=
 =?utf-8?B?Nm16WVZVcEJ1RmdvTzQ2SzNvZEp2eVMrbjdFeHJKTkxTS1duMVdGUlF3dlRy?=
 =?utf-8?B?Wm9ZSGNENUlPaUFiM3RoSE5XV2ZIQWp1OVphN2d0alh6dUhGQ1lqRzQyWjN5?=
 =?utf-8?B?bHZTOUp2UDlTQ0QzRUc5OGpaNFhpT1IyRzdWeHV4eHg1dTNDK21va014ZnRj?=
 =?utf-8?B?ZEtxWStVR3FtV2kyNFZka2ZqUEQrRFZ5WkFOZGRCQUdIS0NhYlJ3M0M4U0xj?=
 =?utf-8?B?MUVtL2JEdDhpY3N3UjE1OTRrNmROTEhEUitLV0Z3ZzNhdms1WWc5elZBNVJE?=
 =?utf-8?B?ejUxN1VGQVVsb2RvZG1YVE1wLzBOMzA1NnVNb3B3Q0FOMU5OajNHVW9wRHNx?=
 =?utf-8?B?eUl2MWVQVXZJOVBJU3dIbXZ1S2hwMHhkVmQ5eUxLdm5ZQks1aDlXbUNhN3kz?=
 =?utf-8?B?eE40WFpIZUxnTXMxR21VNFh1YVVRRnQ1a3JGSW5FUW1yOFdsVWhIa2JyNlZp?=
 =?utf-8?B?NUNFOW9oazcyTzl0SUNqOTNtL0RCNFZFYjE3UEx5K1Qxa3NlT1NBamUrdjZs?=
 =?utf-8?B?eDhhR1ZhcThYZjZRZGYvOGVMQkVKdlhCL0FPOE1SOGRoMzIxUkVPZCtjVGJB?=
 =?utf-8?B?dUZnRjY1aVoyNVRUL2JEc095NXY1VjlCeERCZ0p5VWlZWTFPL2llSGR1dFVJ?=
 =?utf-8?B?OFU2cEdYQzIyYlBJcEVFeWtqRzZRUldYdllRc1VCVzdPN3dIa1JQbDhRcTA5?=
 =?utf-8?B?WFk0bVNOa0cvbTUyTnN5YjhlWm40VGMvU1NaLzRnMlZRNklsbENwVURrd1Ar?=
 =?utf-8?B?VkQ5eWhoVmlmVWZISGNTc2pvc2FQcTFLanN6SmZRejFJODNpd2plVzZieWFW?=
 =?utf-8?B?b2dobVBVS0taZnJqRWhib2JITXZBcHJjY2plaFhYYlRvbkIzamxnVUFwMHFH?=
 =?utf-8?B?d09ocW1KZWRPNWIrWEwxeW1ZNThSN3lzRmZsZFB2L3ZYODI4bnd4ZUtsSEo4?=
 =?utf-8?B?MXkrNDZiZ2M3QWhqU0s5UWpvT0pjNWV0UE4vNkVqekRhK2NUdHRDemtLRXZQ?=
 =?utf-8?B?SW8xZ0ZyS0o0NTZpQkYyUFlIRCsyeXBvcmNGY0JLa3RLTG4vb1Y3SVIxTVlL?=
 =?utf-8?B?ZGsxdXZRYnAvYTZzanhLbG1hT0lKZm94RjlLN08yV0czN0IwVVB0NXZyZnNT?=
 =?utf-8?B?bTBxY3M4QmdxUlBsRjhrMHp3NHN2NVg4MElxbWZZbWZ6NFI4OTM3bjdWMHYw?=
 =?utf-8?Q?yJGfY2ukWAZRCO28zbgSswHfiJt1ANETHj46J?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ebed15-d331-428d-20b3-08dedd2b9ec9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 20:00:55.3287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f2uWumY6dtXwul9EydGtBYXiBO+xvCZYhScw5QDRo8N7JZud5WwEXqGYx578aBltmu9cpd3k7ZapaAjHZjHY2djkSUOgdRwjS1CLd+MDGAU073dgeq8V0FF/c6H4jthY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9966

From: Frank Li <Frank.Li@nxp.com>

Add the fsl,eim-bus compatible strings for i.MX51 variants.

These compatibles are only intended for existing legacy chips (more than 15
years old) and will not be used for new device trees.

Fix below CHECK_DTBS warnings
arch/arm/boot/dts/nxp/imx/imx53-ard.dtb: /eim-cs1@f4000000: failed to match any schema with compatible: ['fsl,eim-bus', 'simple-bus']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml b/Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml
index 4808065fc9115..5e872ddacaab0 100644
--- a/Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml
+++ b/Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml
@@ -28,6 +28,7 @@ select:
         enum:
           - fsl,aipi-bus
           - fsl,aips
+          - fsl,eim-bus
           - fsl,emi
           - fsl,emi-bus
           - fsl,spba-bus
@@ -36,13 +37,14 @@ select:
 
 properties:
   $nodename:
-    pattern: "^((spba|emi)-bus|bus)(@[0-9a-f]+)?$"
+    pattern: "^((spba|emi|eim)-bus|bus)(@[0-9a-f]+)?$"
 
   compatible:
     items:
       - enum:
           - fsl,aipi-bus
           - fsl,aips
+          - fsl,eim-bus
           - fsl,emi
           - fsl,emi-bus
           - fsl,spba-bus

-- 
2.43.0

