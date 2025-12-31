Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013056.outbound.protection.outlook.com [52.101.83.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48AD277C96
	for <imx@lists.linux.dev>; Wed, 31 Dec 2025 03:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767151257; cv=fail; b=Un/5UddXKQUqJVFbrNo54OzE/Y/kwpM0sd1HJfwZKEm4+1JrzeAKH05vmZF1QDknKyY7Jk31Ry0kqrjwSv3G6kBJ+CYY2BxvCRI6uUpsgZl9v9T2dexzEOSxE1jfAyy0c1RH75DaLeQ/l9jJm9ir7tZoNfJKCPWNBzuwaEep7AY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767151257; c=relaxed/simple;
	bh=dlNh6rGNI/HK9HcQvky7LKA5luPQv6m7a2PuT+zOpA4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=lKyMHesCd7H8zvFoIhS0lhU+FnAPVquJR75Aspuyw0erbiwuKdPIxLDBwJmg2AMzwOItLz2boLWFzwZ/RLx3KvVJn45ywxo579UVw/VJXVrdN7kHY+T5s6LRGcPw9Ntfx+wKlf4Di7LG/R3Kl7fp/iU/LF2Y1fn7HGkXL4sjPs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QevmP0ZF; arc=fail smtp.client-ip=52.101.83.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QevmP0ZF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qj/NBo9XtfiqVveG5HrM7sIbygduRpRzimUb2BkZkkIBmGMsI1PWcMmy9lSC6Ix/1oKTLqHdm6iV29ovszqi2/Uk5+Epbdi+99WVjjwwrjE8T/LbdniQWRpyagGGH7DaegaAbM1aWv3CrFoLPlOZMHoIymJnE3ZDzGlPh3hsADRRRv6JIlcEtpiHmCclhTBh2pBnw8vn6bQPP+nHBk9o2/Iw3iuBLLTjV8wFYeF9Hp4gRWWv9QBZPrhzG8I+mgcu4PO4E9PF+i8DEgl4CTPqw8kEa1yWhOEOZvQ2CWpjhTFkaB5HMM/LU2SlQcT0yH6CITlpQs3o23mVgwf8YWNmtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=poigHwepgUoVK8/LNU7GZL+zrjPnm3r/HFRs5QNb2Jg=;
 b=lwycLiI+mhgbRtkND8SBKaGBIBSXSCrZxG29+ZeKaQHefp4Ik3hfij7K2Y6RqJB3RTD2Gi2UYrG9Hx6doFaQ6lutvmJlyA1H+rXO2NHNpu71dU+UWgS1P4dlBWD/2ain6plygOU2lJlcQOK940pEyu/TNv68/w9rK/kOBJI7oqH+IjxmkBidjvK9U/YTYP+wR3nrdGlyZvGB9TV6mBTwL3HsCTkV/EH2Ds50p3rFtQUkqj5RJwst4fWRtEuzJLrKgo89nT3Nd4Pz35xZth7zw1FcBRhTMg0xS8biqpcxkEWSPfJBN5fSryJvPc75+kfkYebClpewQ6wJJvwnpUPtCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poigHwepgUoVK8/LNU7GZL+zrjPnm3r/HFRs5QNb2Jg=;
 b=QevmP0ZFmTpr+9X/PSTwwF6fyUx5ie92X4vDKmFf5cOi5KRodlTM7TGfMylxq7ZIOKECHW8ylQRcO109XUlPzGCXjBgdaQfflRQyS7+ONe5ZWWq5HnHV+9kGD1ORNfTs4tTR1iEs3R6oeMfgl1Mm8OXLwIFHeT2fIg48qQemhDqrRaOalL/eBx1mItqpujqmP2S2ITtFATTQxbyk2XTSTj+cRKuPnMUtxS6WHg32wRUcMrduQVxmQq7HvHh4fPXWBiMEUOnruOEEPhL218uJdqBWr11Wc/WrE2ktn7iY5i8O60aJi9ES04CkJOFVOOdSJ2Aq/Z6zD3EJf1MA/h/yuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6948.eurprd04.prod.outlook.com (2603:10a6:208:187::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 03:20:51 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 03:20:51 +0000
From: Rain Yang <jiyu.yang@oss.nxp.com>
To: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	liviu.dudau@arm.com,
	marek.vasut@mailbox.org,
	Rain Yang <jiyu.yang@nxp.com>
Subject: [PATCH] arm64: dts: imx95: remove CLK_GPUAPB
Date: Wed, 31 Dec 2025 11:19:15 +0800
Message-Id: <20251231031915.752262-1-jiyu.yang@oss.nxp.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0079.apcprd02.prod.outlook.com
 (2603:1096:4:90::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6948:EE_
X-MS-Office365-Filtering-Correlation-Id: ae83d6d0-bb2e-4da3-b12d-08de481b99a8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1DIldPTwWVfHTcAtzYZDHklSRIyGqQcGgd9OIj+fgrMBhyDbnKEbdu8fumuJ?=
 =?us-ascii?Q?4DFzrXGUEUpAFkrOhK6wVykmugMkSK265pL05pMb0MfSemSvKnqiizW5qyvO?=
 =?us-ascii?Q?Pjg/7dhizuaI3QWMpH0CZx9nBVhTAv9nYRPtkf+52YLD65s1M+Z2OgdvS8xm?=
 =?us-ascii?Q?y6yPFC2VGkCC4GOJQ1VSan+H52VQuydw9gk9xT8hukfgQGx1plyEGwXZB7U8?=
 =?us-ascii?Q?+X8mSOL+gpPUzlwaRSjX4S9qMYYWzsC0RIBvN3BTq02Yf8+IIa5Sjq1JQJr3?=
 =?us-ascii?Q?LikF2QaF96B4BVI4whu+1MT+jvDLLYDiD9HNFtJItsnJ8xV+rJvG79EcdErt?=
 =?us-ascii?Q?BNev4vt5gr2SWR/z5ehZQ+ZRc2swhOcvdEO61Os8MWUT9Rp2mqD5oeGRSPqQ?=
 =?us-ascii?Q?m8hoUfWi5SjM36s0NMAJKLZrLRYQD5HiCeo6kF2SUps3CFaNldgeww1AB5Qz?=
 =?us-ascii?Q?m7p/gQWX/kwHF2XZPzUvTAEQvil/eKV1HH5EuEOMoiDJimos1Y0GpHJFSFOw?=
 =?us-ascii?Q?PN/MM4HO2lnIniUyyd0EBQ/CXT4fb6cjHCIrg2xE9slDWnqthuYf40R/XgSM?=
 =?us-ascii?Q?yIlKfpyjUT9rhP0qtxVSk8vJQAOSSOYS8FLbnjIzztmldfQJZ7a0N7e182H8?=
 =?us-ascii?Q?p2ALsaZOd+7+iqObWPTCaEmLgTiVkwqTKqe49tBHXXJhCyqF3Pf6o40m7zwE?=
 =?us-ascii?Q?cP0xhSEsHdh3fvRLf1vzowp28CsnkP1Ge+ymymNx8NyAIcsYakTjaoZCZItz?=
 =?us-ascii?Q?v2Ivh1q9fXSPZxzhTuu/FplMHW0opgoIoGyyXejScJp7hRTaYccIxLPbBXTP?=
 =?us-ascii?Q?KPAApeSjSxybQgNZjR7iN1mmjtRcgobL5cl5xe4rksIP7p2VyuRTGGSjchfn?=
 =?us-ascii?Q?F007pxMseiU5IMt+YH5+/qzhpnATcQHT0GjMeF97pl6blqjVd5n8okFAu6Hu?=
 =?us-ascii?Q?iu4eVgb7kXTuFVbQMBA1cspBbPHB4a2BciTrkyHovNZShOvqUiIOh+YKxpbH?=
 =?us-ascii?Q?BLPt0E6GDTi4oTL6eiQ3cci8Ry91bQ6R8Pa1wEXmClJDUWNVYu1G/fb2pAi4?=
 =?us-ascii?Q?prsXoDYr76BX61lfwXBHbeh0kwG6TdvX9e4WQt3XV5n9tsstMP0MQ/XG7ept?=
 =?us-ascii?Q?ZPa/bMlbNXsIe647aHPBjsL3x7lOXoy2BSKtPJ98DzwxBWQe1CwJb4buedWl?=
 =?us-ascii?Q?sDWZNqhzmzgk8kE6gOjZMubtWrZLLSthHURRcI0n1wGYqcwgu2JMXWXSAcbr?=
 =?us-ascii?Q?+h5wcffafwy80X2YMvg/knMQ8XEC/+rxqNnQV0ooHxa5uFI6kEqa9vzN/wbA?=
 =?us-ascii?Q?5H4kPUBs9J8ft/AmTLJgWkThJ1emnpflPdICca9Wtjumm7gfpaJlGkmX0NvS?=
 =?us-ascii?Q?yjabpGlvRKDZB/j/HHr2eCbxsk94FxlO6nkyMm94xLXzMxKshziNRhkUrfI1?=
 =?us-ascii?Q?OANa2+0ybFi+OQ+wsUFjhClQDDaV+1xeNEEUvHuE4tRXY0LnYaqDvbCJKJrf?=
 =?us-ascii?Q?P5T5UscXw9MYJobEPCS7A2usw4wHVEU00sId?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6yH1v9feTtNVDzgJv+O/UDXhxIe3OsU78imyNQ4eZfzNVxKpJDpDUmKPGAsA?=
 =?us-ascii?Q?0RmqRGg+ogrLJ6okl5cSk8DxMLOMd+rXj60Y4k5D0CbvfI3c6Wve63+3mPdO?=
 =?us-ascii?Q?ZKseLcgnxBKD9+qDDRrzd296RebG3irZQydQKjbMjHjsps71+uFvyLaSF78C?=
 =?us-ascii?Q?E6JUYgHSVcvYNnGR+lecB02tpS6D29mn2c/b6TCZnLvSbdN2uuFqIf9gbE3L?=
 =?us-ascii?Q?zUM2bQXMZn3ch1X5q4BZ0f40dJksIY3xJ7m2/Sew3oDkFrktszFUmQMGhrvz?=
 =?us-ascii?Q?qWwpBqHV1l+oH85p3RDS0Qfe7BqZP0/Zf0DGG6ShG44sbWK6Qhjd9egKdYEX?=
 =?us-ascii?Q?sBoM2N9hog89mggZ33JnpA8K289AafbUKswJ9hLqE3a33Oww/gumh+3mIjyA?=
 =?us-ascii?Q?SFWRktWe+3EXzjL+UeE6n+0qRkaV87UjZm7EStnkpmXL8aKD/kIGkEKDNGIE?=
 =?us-ascii?Q?orZ6HnZXZ//DM8TSsPInL9wPJ0H3JcKRx6UjrBp6EKeyDxMUIXUxJ16MC0ZX?=
 =?us-ascii?Q?HwuwYhHmf+ipZvC6j7H/eYGPla499n3XSccARR5UmSP2oKM+hRYsTZOrFsl+?=
 =?us-ascii?Q?LL2cgthJUMMaz3afn3laz6VQV1N2Hd9iZGm2//dOuIWPdL1Oslpf6ZVyfwpB?=
 =?us-ascii?Q?NOd/08OSpPLiYrxihp4CTLgxfriIFF3TdJDWpFhsAdJrOLyEZNeCPhKebqbL?=
 =?us-ascii?Q?U0wPkZy9nODPYIUbIyGfhlfxbW22OLP9t9lJghhNypfDJtPBU26dWv9ypn8g?=
 =?us-ascii?Q?2w0IFpVQVoLIpxY2hA5T4d2QnqDvZeCDD3dP/V+22XpgmoV2KY8iFkJCBC7+?=
 =?us-ascii?Q?XULT6RCTNWzDHwIyWj1tAjfhWuG1C+EKpNDYVkVnhVUQUGBWKqlHL+bGtkxb?=
 =?us-ascii?Q?cibYY+iXiscSzrOgsbypiq12aYI4dTiml7eNgL1oIdHSkmKGccI/pogpRtSP?=
 =?us-ascii?Q?RTEFIdtwNK0T7su+9gxW96dCx6YuXKfSjPRmFpZZr0BJWFZ5rGSB26LZEsTp?=
 =?us-ascii?Q?9SlieiE1jzI+clheJsTXXBqYjuTnvY/oNxuHSfMXvox+xI7Oi0E0HpYlgcCy?=
 =?us-ascii?Q?Fj0GhbIWgPYQsM2SWBWBoRno8oTYxZIkQ17m77opLULawYOr+WZK5E72e/nZ?=
 =?us-ascii?Q?Th8wPqI9DflUfNGMjICOSZEgSV6JlHSVKjp+OynJxZeLIOurG1tSJyPgZPsu?=
 =?us-ascii?Q?GxXdvjaT2EXOUHUIgV7g82V7Ar7GHEoYBbdq8mz6SZXNslQIxrCh3ZGZDqhM?=
 =?us-ascii?Q?erKYUXB7/R7xjmwRDiCckjirJvWIyhpuFfhBcdiIP5qKehR/ytgiE69V7c2p?=
 =?us-ascii?Q?+HqYH0vInbAO14M/FvMeYNcfiFEvgDIAzBY7x//zX8GYYJQL/vr+BLEVKwLA?=
 =?us-ascii?Q?5P6n9f7HHbY3YTyNhu5NA4yi6PunP7tlvdDdwUDrkUVyCqy+kkoaZ7OZlnix?=
 =?us-ascii?Q?Q3RrBWFPnYZwSo5UJUxiOXC2IHwENn9NU4gzbveaIY/5s/yWjUOw6jG/Mbnw?=
 =?us-ascii?Q?4QqMDy8Hpb61uXPQ4W+dJjDqYwPKrv0MJA9MThmXLCgma8e1li6e0ZH+MCsK?=
 =?us-ascii?Q?H3zcli/ZK9BHd2wMP+CdOWerX85VfkRRhG1qCLS+Qx/zmFlWfIJ9HAMncfY6?=
 =?us-ascii?Q?tZ8FJShZXMRrzajx4fwVMG+yWLMWltxuJkkrbLvJeq9a/59hUs1LUX/G519H?=
 =?us-ascii?Q?25SMrQuC0O9tEgm3gszm1GLeJiKGz+lsPby9jM+WHUpBGMCfJBbKoL1sZVa8?=
 =?us-ascii?Q?yI04Wbp/KA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae83d6d0-bb2e-4da3-b12d-08de481b99a8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 03:20:51.6240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vn0Kn9f5aVo/hJ3W8E9zzv1UkxTBmObJ3jfevv6dPGKPS9liPktaxZJGSF68D1oOHgAGbe9AkncYEWL/6u44Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6948

From: Rain Yang <jiyu.yang@nxp.com>

Dropping CLK_GPUAPB simplifies OPP handling and avoids unnecessary
complexity.

Fixes: 67934f248e64 ("arm64: dts: imx95: Describe Mali G310 GPU")
Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 88bde59e61b2..ab446aa6f73c 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -2164,8 +2164,8 @@ netc_emdio: mdio@0,0 {
 		gpu: gpu@4d900000 {
 			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
 			reg = <0 0x4d900000 0 0x480000>;
-			clocks = <&scmi_clk IMX95_CLK_GPU_CGC>, <&scmi_clk IMX95_CLK_GPUAPB>;
-			clock-names = "core", "coregroup";
+			clocks = <&scmi_clk IMX95_CLK_GPU_CGC>;
+			clock-names = "core";
 			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.39.5

