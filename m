Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013043.outbound.protection.outlook.com [52.101.83.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04BE3A1E66
	for <imx@lists.linux.dev>; Mon, 29 Dec 2025 16:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767027114; cv=fail; b=jbDd/VLMKw6qIQuj2tLfgEWjqqkyYjKTexYsQbLPK1s/0seCf62TNe66j//yXSzU1A2eJkrcJ7cgEGRws/Ecvs9Vd6d1sHsKo83ceK12epMbTb1eTHT/4xAll0kCx4YgyH8QibiaSEjHUoXM4/KDeDmIZc2omrSyLAUZ7ZoRi+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767027114; c=relaxed/simple;
	bh=ajphW2bjLsO8Uw9DUEaelUOFRfNTrVV6liGPcZ6VWl0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ez2HJZyU0bl00Z30csUqR5dEBMnhmuGKIGK4vCQf7hE9aVAOl5fcnB1uujf+UkTL/SkU0lHetH2174M28M76VDAFl7K5s6Rqikt1sF2EPFbm/Vtey5IKlICtypTCDN0epAyH6xSm43V/1xi2Z6pziZ4edqq1oUHnnstJyMyjLB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dRDyi2dP; arc=fail smtp.client-ip=52.101.83.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dRDyi2dP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFVcY4D/uxX3Gvs0nBkXQAOd1wLPmsL9YKFfZeIL3P+6QWKaqf9QxlMK9DQYiF4WhP9Q9YJ+SaYLR/0Jpw+BTMuyvejDY9+N0qAQqi5UL4sJ68XdCZ7sTwfQ6r6/SNVoZ7ZzHWZHTszFTOq5qsWd1L3NNR8/ks89QBa+ijFOfuO1mJCh8prNAfk6XB1x6zs67mKbFgbOuMJDbPI+tlpzWEVCPE0NHF3Ig9GT5Lv/yT5vjZQ0tm4Jrivk4E2pA6jP0HbiegfD2y0n8NZg3n/e342nK/42Qcc6+lItKlTosMiEXMnuWGx+l4ObpQEGs06c/i/sA9kEfB7tq3qSYtva9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQjhwWTj6zWhOTJEHiiKfW5Xk9CaaMthFTjKfV4AVkE=;
 b=zHL6tH6XP2u29Xh5EqyyUGNYFS0BwpjwbNowB/PdiRz6jIABSaTNNTeSgWlqTQeEhx03MlR+bv9kvwic75xcFzAaZOKIbfDIZ9ctXWqJX0kRksJOYnytcCxxZYPJ1PfJv4Wxt6P9pO1QSDBX5NTh9Kbof7w5nFBMyt1oBkxcXglnNCJTQnceqef6+bDdWRIbKtYFCbyIBhkGCYesACyb5UJB7/MdFHiJEyJMiDLWUZzqy/qqzs7NbTVNsDEtYPWQHPiA3Ty/p9xFkHduCv+if5I+PM9ktR5utA9uI/0l/OMZfNYuc/J1mi/WRiKps/M9kIGmCUQybBYtloKBa3+DNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQjhwWTj6zWhOTJEHiiKfW5Xk9CaaMthFTjKfV4AVkE=;
 b=dRDyi2dPgRe9lyTp447gJdYX6Be01GWtcEQzGa1QV6vyn4X1fxPe5l1qsA7kvGw+xwO2rkxhm3nJ/mR4bT5h9yO3HVQRPIgHF05qLDYuhKo179tw6eIyhbIPobGJOYHJCeoCsNc2BcLkj5XCRwnUxtxfw9fI1j3APnRZeWEJp59Nv4mN/SQU8VeP7AOwj4kgQxcSZKdo9D1JOruks+mz3jyYgHQeHLpDkT/BolpviQjqHhksWqQCMH8CUSASHsehGK3ejEzGQ/4h+IWRiS7Wc0KkMC/1XERJcvqmSOBhu4KcHV0Nx12mdBpP0Q8hUFb3qMtWl4qE+vc9hxyk3tGfPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB10611.eurprd04.prod.outlook.com (2603:10a6:150:21c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 16:51:49 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 16:51:49 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] arm64: dts: imx8mp-skov: add pinctrl-name 'reset' to fix CHECK_DTB warning
Date: Mon, 29 Dec 2025 11:51:27 -0500
Message-Id: <20251229165127.4006134-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0110.namprd05.prod.outlook.com
 (2603:10b6:a03:334::25) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB10611:EE_
X-MS-Office365-Filtering-Correlation-Id: f1a082e1-602a-4133-bb5e-08de46fa8f2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VJ+OvrU3juxxZj4b8O/rTk27xOPM2YX8H3LF/RrfARli9VTMZ+SYvfiTjf8E?=
 =?us-ascii?Q?yVVAfwtHJbGv9xs5uLT/eOGUv4EWDeYrq0BNRBc/ZpqnNLw86ED81LhzcoG8?=
 =?us-ascii?Q?1Asy5EhYVD+yuK1deN1ZdTFIHssyOCWry2FLVr2kPQ0HXvFBy3CSORzW4Q+m?=
 =?us-ascii?Q?82+XsuIEggEzHHe3gIeF9UrUqHpNN0EtIzUh8qKkmRjrDUSF4+R+mz+gmzGv?=
 =?us-ascii?Q?nTSbaePwyzIrBLWGXVrfXTmR1KTt+MJL37wIqWWVRi29JsB6mIg21QFHHKwJ?=
 =?us-ascii?Q?akBwEdKE7U0GFS08YH9xNI92tQ9egPEU9NAUJQPlDFcD9vnj/BIBPVkf/7uy?=
 =?us-ascii?Q?pfNQbDPC1QioilYSUZAgng+5ksv/bxTsDMSEBPpABxXiJDr/Shcn0EdtAi55?=
 =?us-ascii?Q?CqQ4LAfQEoS7uNE3J/HEKUKMkbFH1wiWMxRzBJxGgl0RmbxnSs69wXsuBbBj?=
 =?us-ascii?Q?Es54NqHEqGYFB5TbBJJ8TZUYDabQIDeu3iCWwBEPfuJWGVslymbgXuLl1YrL?=
 =?us-ascii?Q?gGdgdBdyI+R7QmI1Z08Oz5rVPEQ/RGpGxZqMwlU0lCTcHOsm4S7WecWdDuLc?=
 =?us-ascii?Q?50XHEZAv3BTSXQEZF5CApq+sD8uXe+3KNUL8aIDihZdyBfnruvKEsxgihOnc?=
 =?us-ascii?Q?PX2Ixdor6MgTxtbrfi/D6ywHpwYBYPmxtUJM3ruu/mFRDf+AS9ZfSVFtJaD0?=
 =?us-ascii?Q?/MGHhkd1KrPGcz8uodlqRzmPcWA69eXfiCOqLY9LPi+p4qVeQp8YdgHTZj4l?=
 =?us-ascii?Q?kpCjjoV8IiPlY1MFyiezCvLgZmUfA22lbpv0wItYVWpcKT8C8WlYqJqwo3LG?=
 =?us-ascii?Q?oFqKeqgvqHVnpiRDgJH4/Jfgr+ai1y2izXk9Mph93L+NYovVsNtl4exWSRjn?=
 =?us-ascii?Q?hodxvh3T3uRyOWQ1i7ACjTZcjNlko1S/RrHNQb50opyHvJ8lgPQgB0MGBpMy?=
 =?us-ascii?Q?gXr4yQAfhrQxzSfY+uvexXxYCArkAY0EMwWTjhxaJtHmAqM3zK1lcrDnWXDs?=
 =?us-ascii?Q?aG7rtHoVe4aucipE0xc9QYNn2fVJgL0blySPsf5vk5mIJD/qTGH2YZv8hc8s?=
 =?us-ascii?Q?wIMoTeqOnubmCIUrNePObsZBvrgjOAwdcPjlLGQ4k2MnzmU6wvCfKRyiik6c?=
 =?us-ascii?Q?b1bw2d6pY9fQQFRBe4BjWNxYywXAmm3gO2JppakSPRch3wW3Pqe6TZJ/adIv?=
 =?us-ascii?Q?Fq+3faSQlcq9PZJntjKIl+THY7BAIhBLj5aFwt6OxCYoGmRhLiNOr4eaYkcv?=
 =?us-ascii?Q?vbyiBTlrYEPq7emSZIhNNU1yI92vYhzPQMJkZ9eGlIizLk+OhFX2JJ+5gfAk?=
 =?us-ascii?Q?p/xLEOUnG+FjxnGTGA8BgDjuUtP8eDE/61/GLS7ZoSyyeIHhkgKgcEUZM08t?=
 =?us-ascii?Q?9cuab8TSw2Vw1MPh6iwuJZGxjs6sqInKX2FgfasHWP8henubWdTxynQAlZPQ?=
 =?us-ascii?Q?m9ZCMxa9nUaXEgDmlZCitMlTm5pUGOqI3WjI/pIbjB6CWvyCzZPiehYRSbGG?=
 =?us-ascii?Q?crHuGaqo3lwC4NU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(376014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EiTN6wuoL8zM8BFyHqAh+VoGPpFDeelVmqEjeT6uQ6o1Qqh/piq+BPj8QiDE?=
 =?us-ascii?Q?d1CLHqytbz8CiqW4LDyAZCdeRs9YEkJV/g8oF98TE905+cB4KMD4bTCUbJPi?=
 =?us-ascii?Q?g6eLpBG88HvXj1OTynGGUZQON/PbqG9egP51bntgPWj7yjYmyOgkASXiw0vt?=
 =?us-ascii?Q?+SstCs8Y5LvB3mjubqpczQaZtoXNNjV7rqU+duederdo3Y9JwYvijgpDKwgj?=
 =?us-ascii?Q?z9aQVVVkoKb93RNtA1/znwdCJPTIBc7sZPPDoGYc9KPEYryBOx5NJNnI6al5?=
 =?us-ascii?Q?sfzbkkqWGLdovZYeIKHN9ZjHP0uRpVvD0014uL/5vpZzw/8NTgYn5oNvkIQA?=
 =?us-ascii?Q?5EZfzS6Cm5Fk7vP90fOfFnHkBShpkAWCEEiyDE8U4vONnKey/Jd6QynoH89w?=
 =?us-ascii?Q?PMLopyyyNGd80y/A89fCP9qKf5aD/Oblzdm7bJyds7D/Ipp6AK5YmC5IJhrs?=
 =?us-ascii?Q?17WU1UheVb8sigdhXjpqC46Dqbm2vyAUR0hsILdCL8Trg3v8c2zE/GTut9C3?=
 =?us-ascii?Q?q9IXs0fljg5pZu9VWeJZo+pci27RTNR5+Vb6jLr4IapRVEAMV1M9NqhGgWhN?=
 =?us-ascii?Q?OqnM9xm3bxC6cLM/Jqv8WtwXij3IE/p/kqsv0u5DXIu25brzeQIieoDqOjeW?=
 =?us-ascii?Q?JttyWHQ6luLhlXKg9M4PGwHdVZ0leNE55iOik0rNeJuJ9NKdGzLLmjKbFXWY?=
 =?us-ascii?Q?NBOqmPz7oaHP8NKE9g3ONqnvgCIMhUtmOQY4/6GtISdRTvV+yxGpsWHf0bF7?=
 =?us-ascii?Q?arNM+lYkev87q9DZe31pqu4IzWLIeEq2DXQAfquusE8FqMVVch4aCCRO7bAb?=
 =?us-ascii?Q?Zv8li1nsTGV0BVJGoRZ6fDrsvNXJZw9/4lsRlVcmcMFnLLjuZXyIEU1YhwbP?=
 =?us-ascii?Q?zjyRTonvjJz73q+k55YtrSO0fR1d9hC/Rib7l9kOsbrdY7/y7jWyCleM/ljh?=
 =?us-ascii?Q?xKYWMeiwdUxtXvisWSpTsiLuWSGdbvswbj5NEb722ktoIB20ivyrLoCLE+fi?=
 =?us-ascii?Q?T3vk0OMlVH9ruR8BXtLOW1DoryuFE8ajO725h8bb8DzjMhdlDEdPkTYizdFT?=
 =?us-ascii?Q?lvGwagM1YkJBM0TA0xfxc4T+zQ6Yxyz4mxn3OvcmXH3sH95H1ogNlLtxnjzS?=
 =?us-ascii?Q?enflqMmaRuK6+U5nrZBEBCvSk7Yr3ySPQa6uDlG0gnQ8sg/eL9aLaQbJMmE7?=
 =?us-ascii?Q?Cxh9MkIc8b685GmFBAkzjutc0fsnY/uElxlSWoqYJBffMGZ6bYtamC6k4mi1?=
 =?us-ascii?Q?UIrsjqczIIE61GHJtaRwe6IuAiZdc4CUOeJWLUpeoT6kywjEvIne5ADwKELY?=
 =?us-ascii?Q?oPvapAoUXYJy04nhEn84PMhIU2nL21T5SX8rp5dZB7FPpImNbCkd93OVfcfG?=
 =?us-ascii?Q?jLYfuIfKI0XIPPBFs0qGYc8fWunLUMbNe3652qSfHwS3X0u8MEO7uOYMKegP?=
 =?us-ascii?Q?G90fbSZc3l9R8CO3f6qI7PA+hZL64FzkFfNGe0+SD5SV99iLXY8yDxpaoWZL?=
 =?us-ascii?Q?4JKajiecI66+5KnxAwj6RppoO1akEq5qFHWOJda6hnc7h/dtxQRikpfZfVXI?=
 =?us-ascii?Q?x3wF0MDNKxAW7m1qzee9oJzFJC3dYj8HzhGZ5bXORjIURnwqrqxI0VpK6mre?=
 =?us-ascii?Q?k2EAsls+L2H6LuC7TKd+P8oXh1BPr1H9Jua+0Qi1J2RdGsMiAPIbnEfCLC0x?=
 =?us-ascii?Q?YxZCk1sy+xa5t1tmK6KgxYHBoy5orpb9kg/LZVBWV0GVEjD4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a082e1-602a-4133-bb5e-08de46fa8f2c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 16:51:49.3907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7ilF8ntOT6GqXqNsAPpNxEeXPwc5xoAvx50hTDsn6bVb++loun2QQiBCXmnNhbBST16h1y4iQCtWY3g3zMdOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10611

Add pinctrl-name 'reset' to fix below CHECK_DTB warnings:
  arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: switch@5f (microchip,ksz9893): pinctrl-names: ['default'] is too short
	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#

The commit (e469b87e0fb0d dt-bindings: net: dsa: microchip: Add strap
description to set SPI mode" force use two pinctrl-name 'default' and
'reset'. switch@5f doesn't use SPI, so it is safe to use the same pinctrl
setting for both.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
index 020f20c8ce667..7d2fc5fdd3bd1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
@@ -373,8 +373,8 @@ &i2c4 {
 
 	switch: switch@5f {
 		compatible = "microchip,ksz9893";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_switch>;
+		pinctrl-names = "default", "reset";
+		pinctrl-0 = <&pinctrl_switch>, <&pinctrl_switch>;
 		reset-gpios = <&gpio5 1 GPIO_ACTIVE_LOW>;
 		reg = <0x5f>;
 
-- 
2.34.1

