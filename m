Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012044.outbound.protection.outlook.com [52.101.66.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AFB33DEF3
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 10:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768819966; cv=fail; b=o94zDLUr0lRoSqx6564SCuUnETZpCDzUWEcLnoN+EdyhTlNc+oL92Kt7JSDtOWMVCOeOPPJcW56Z9qGkRXr9s+J7dKeZF1OIW+/MYTdVEpFC1R+7envJ03c0ImrxTCkncZxqUNV1nHoEclGFw8TeAtObXD+MBIGzkD3DDXiRt8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768819966; c=relaxed/simple;
	bh=MBf5eXNGlmMTh66lJ7dZvd1+MvGThX4j25owBdxiRKI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=V9shw9aV9W+DxD/ANKOlbDmx5ibn6nJzX/V0bNcoplwDat+GoRFcMqFPA4EBro1iUyeAnNH56kxZqdlNIUdKHriScybrnNISV+QNmPyeadOFBqqna0TJbGCdH9igfpLhUhkMvtjFp/m8UEmPlFi0VL6UrDrQxyVRwEp2DCaYn6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Q7KS7Xro; arc=fail smtp.client-ip=52.101.66.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Q7KS7Xro"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ts1sPV5SFjT/5YLbOa5zPUyMxP7VbQM15n5Uc0Jkjijf1DEAJGdriDBp64xA5eIEFOju51pT+wI6AuuH1Nrx02PK+ra18VkqdRX5yXd3zjbvlC/TPv8nc9v+ASrum7V9BLm9NPQNI6nzMUxlwZffmyhpJxNl1MELWolFzDBlPZxtejGrqexXu4FSVQwF0PKFNnxs8HIfeWiEL5Uazwx6RjIEAeO5rbZODiwiCHvmifS2fQExxtBHallqIdhmsLrrX28Cqw2Cxqf/8b3MHyh7R3WOET/0GRyoBT5WXaVOKkpd5OIaUxSIlXDrwjNqPa573CaQSXVy+cs8Xblp7ZdQTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9OMtaeAhX5lNw838j//N6H+3E9iZAs4KclZpvBOImc=;
 b=gZPpazfXYixxipSiOq5j3BAtWgO8X9LlqBfo9cX2dKv0LGwVz0Hr3FxpziPsNlvVojYbzL67QYuHvlmfqwp+EINAIaQFqZiOiHvMaVoCvogw1QD9QC/qaLP6cFcZTkAT5qEvAmqjQGPD5hPAoUiWfMUFbTBPPFYIQuPEhhHHUF2cojbAsYw8ScLZFi7ZYGWjuhLvZDkDOcNy/IQAZkzRiKwLREJpU5u0OhVDq97j2iT4/DpyqbQJJ5Ggvi4YHEerv1RyMRiAVtvdaMkflUIb82aDIFnS/JN+doBH8SOIwKLptawISRZnSaeO00xRQjVCrzaOTcJNHxJiuygg/gW65w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9OMtaeAhX5lNw838j//N6H+3E9iZAs4KclZpvBOImc=;
 b=Q7KS7XroQNrB5t6bknjb/2xXKkv1GCHZ7y1z8b3s7vcSbOnJx1+uXfDxA3ktT0ldKJsFdT168ji1AWpVjU5O2IEmf3Iu9V2pRmQWZ9jwQvE3lf1f0RfmNysauy9yTAnbn7uovPalIMfvlZSsC1MtmiiE/4IgYQam50qcnFNfWSxq8nmMsDSkkzi1NId3npCYxajN9Bsr8HTjvxjnZZPAlXHFxQBMYTzFyWwsrpulOzvDNKwi5Y1uU6e4d/8oGxajDoulJVtODY2eoVe1B8RJ+ukxvqW8ICjIcGc3x0HmaQB+4MpkpgI1TgNbF2cFKVxf4m6wQ2BgployIvpweLvBgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AS4PR04MB9550.eurprd04.prod.outlook.com
 (2603:10a6:20b:4f9::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 10:52:41 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 10:52:40 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx943-evk: enable lpuart6 for Bluetooth
Date: Mon, 19 Jan 2026 18:52:15 +0800
Message-Id: <20260119105215.1238855-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AS4PR04MB9550:EE_
X-MS-Office365-Filtering-Correlation-Id: 035e9d9a-8a9e-4860-d385-08de5748dde1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8TSIjZidBRB6c32RJUsfamcWNQ6Dq2399oB5NV9QtikhOfu3N0k147gAW7ZD?=
 =?us-ascii?Q?XV71Hx/bvjOtuIdyWNhjznwjRJd4T/8jtxi8gw0AHcoelr1ZC40SJ2Kl+eWn?=
 =?us-ascii?Q?CpkNQNHIGBEZGiXzEaJGK9rTETuyjKxvtemaUhkbR+jfOmGhW7mGV7JbnyyQ?=
 =?us-ascii?Q?T7qEsKN8i64MwACBNo3XQuEL6EGQf5MbBBLJRD8XvEzH7qfLEXoenSKAqASO?=
 =?us-ascii?Q?cYvjtvFPHcJB8cXTDjn4iw5oFOxOtKWG7FXt4Oj2baEKyxgpkxXkzHP9oaKS?=
 =?us-ascii?Q?v71i90MTKHG39DIZY88EtufKmMeaH/Kj8+VdLcDta3CaN39rDM9WWT9gYAWB?=
 =?us-ascii?Q?7D9rEisfqHLlbsl+L5I3SdMK9EoH9MTYR2M+9js0mgWyLWDsjEb4JiFaMBeU?=
 =?us-ascii?Q?Ja58ElKnGAyZFjk/TjoP/u8yraFC0WQheknibfPA9BFVsakeE6dAZQhpTvqO?=
 =?us-ascii?Q?Jp0g3o52iKI7a+NLAy+sql/0Gvr+zZaJqjkQo/uAT3hXgXDkQJ8lterNdq/S?=
 =?us-ascii?Q?HcJv2nHHC//vt4flFfhHbbaQxopf10ybFietImbv00Y0Y4GSTCONbhK6iOZc?=
 =?us-ascii?Q?V0EM8f7wDiySP/H6gWvqHAGv0e5CrSK2PL/Rd5RW3sJP22TK4U20kJb06/pS?=
 =?us-ascii?Q?gjzYpDEfIADZcUBe0vR/FrgGfdcycpIYex3hsuW/o1JsIF22qMlQIvAHbItr?=
 =?us-ascii?Q?qpmfchwQkh6p6bLpzrb8oJ9bd9i93vlkgd9OVYr9MkT2f+UUdSqPoeR3sB4H?=
 =?us-ascii?Q?7D+wWOBSqe/mw31zrY5lVMdKIg9+HAhcMef4n1vP4SMMx7KYqfEziM/IpZGO?=
 =?us-ascii?Q?x5tNCC9N9MRAlMmGrWjdZCe4Ni/LgQpvlKBIE4EhWu/J+ZBr8X0KcF2pDcLd?=
 =?us-ascii?Q?CaveWX1/rpA4EvAzZ0dyIhM2UNmCq8wA4ghTcyuzTEGoP+CB+wNdzHtYDidT?=
 =?us-ascii?Q?dIS5XguiPiWWXOgyyXqgzIuhpNbBpTOhvtOrUBcs/qE3Pgo5vwQDOKxCzM7u?=
 =?us-ascii?Q?FJVeuu+OLt/enWCWkjqahuegtcxr6GQf6y9zhaGb1+pVSS+8vkOmRooC0TxH?=
 =?us-ascii?Q?E8h4O62+VneRRregKQLaKAmo+zSE9tKAgdJPwYOnLZIADpfu4MqNrc0IYONB?=
 =?us-ascii?Q?CrKb6fFHVqZzyBj0sybhpE+tqiFr0AGvtJFtI/PDS4nYAJc0goKDW/XcqAQG?=
 =?us-ascii?Q?XHDsr0oqwuj/lZvo18hYWBfWsIyeu+xqglg8Rpuqphn4ElkNcnqVZCYZfQC8?=
 =?us-ascii?Q?aPvTrw25EggJxf/hdF7aW8xNOlPGERDotFWi+fF7mr0zu3x7DYyBt0n+g9HJ?=
 =?us-ascii?Q?2FBZ7OU65wim9zkp05dPX7ToQcSCP/tHRrw+n2gURCnfrnYazG9Y42/TanjP?=
 =?us-ascii?Q?IUwVbaqpqv8JIlAYQ+FEsgOEWLoBTwuHD8yzFl6RvRZPmqzVtrZpKeURCVBa?=
 =?us-ascii?Q?n0JKG7kaN4UZdlaxEPTMa3hGDG8niO3H9L699z8ZZhXUyoJZCnoXmlbXBvj9?=
 =?us-ascii?Q?jvL/6MlDhSaCaXsSiNg5mgk1BU1kCaGb/p3K2O2x0lcNxy1aAYeFim8wnlHj?=
 =?us-ascii?Q?t+n/ECaoSQkSUAFR+JqMLfeqwKARr74lHxyEgbMB+wCCYHj/44w4eI4MVed1?=
 =?us-ascii?Q?/h24wNnyFyTN0EN39Ctk/OI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zDEPpxxKJ5mZQoSNz9l+F+uXmOBPLVbSSHJZXFxwZjke5pAKlxmv5z2Uzxev?=
 =?us-ascii?Q?o4hMN32xCfqI/OgTnw3orEeCr6B7E/tco1l45XOswdScvPQoMKBHmACA7bfc?=
 =?us-ascii?Q?Svga3k5FX7kp8miO4ElKBV8HUaJ/v3sbnJ7ICwlIqu/vkWeqIQSsgHh0nBmT?=
 =?us-ascii?Q?0EmpkRzWSmncQS9tvET+50bVG+81p1iOCKmCjaOI/3N/Bi1tKT+KO+fNHNcY?=
 =?us-ascii?Q?380lPS1fn/sud7db9ud8gbaCnONs5ma1P1qMNkRidQQkRgUK4wTZ8rTICV9N?=
 =?us-ascii?Q?KJSu5wTr2RFk2m7bBI+DBNMsqvFTSnTVpwA+B9VsU3B14E0ZClABn2jZquNZ?=
 =?us-ascii?Q?ykSwGY51ty/OtOCeEYJRbM2BBGV8niR50Xj4/u1FccoMe8WdcCSkpufruHS4?=
 =?us-ascii?Q?4S7y+g/fg26DgGToOxB/RNzlHRDKXSKdyZiFs1+djV9Dc2P27yCyEK4Cn2aq?=
 =?us-ascii?Q?jxUiUVkKCR/YrWluFH0uHyggXygx6w9tvk2jGpEcBiAR/sn8i4/Cs6ud5bTq?=
 =?us-ascii?Q?TZMIZSHBtNebaOhBHsfrLbkuboPsmtX9IrXpJiEiGhku7vRg9yEPPjm4EnII?=
 =?us-ascii?Q?ckOj7XvqozRQ1JzhKKTyW1wT4hsyupiU1p9/gPDQwQsuTN2c90OKOeP1pHmR?=
 =?us-ascii?Q?6G+zXgzR1u0EQiSXFH2NWYwV7j80tmPg8s0I0mfntVOdsdCMxHPdtw6jEI0z?=
 =?us-ascii?Q?4rdxP/z+J3rCPF+D9TCi4cd71HzZZJONUm226WV384wA2ps6LbtqMs9QLZeE?=
 =?us-ascii?Q?htR+ZjhEsVtn3Sixel5VnMSvw5ycmOnh/uOW+ztoS+8oEqXJHGCC1OdLBv+u?=
 =?us-ascii?Q?phN7LLv8poiOPZobyTJTI/KCT1H3WGeKSFeaskaDCWp0ZU5f+uplVvTzfEx5?=
 =?us-ascii?Q?aRE+vmPXWYCx5D4a7ACPyPF+43Krf0EwbvlgBkgA6RZXmXrLDlRukxYrtg7k?=
 =?us-ascii?Q?Aa42zIAoSib20iWNc3hcYEJYEnQHp2z3aDabkB7KumEe5PZMs3SErSWsX/db?=
 =?us-ascii?Q?nzVzAIIey+oo8d8qNixjjAsMgpBhOciEP+VkQqqQb7AnbsJ/wwS3pxxfTu9j?=
 =?us-ascii?Q?ENoyop0T/t7afaE0m4FWzr4uZJ7LhFtgVKxdQcHISrxn9mJMkMsemTke8wuD?=
 =?us-ascii?Q?ZdHot+njOWL8np1mBcQFxcj/EPuRcZO0yy92TZ4Rz/0ALI41z2FWmgK75Tak?=
 =?us-ascii?Q?9PlvWJDia0FKq7gMEx6qtPsrAgv1EwJhWmaXUwkpbK+qqimvi1eDB9hTcAxZ?=
 =?us-ascii?Q?H+8HTCSg02McVD+HuicVZDydoccPz1akxBJwBjrOmZmwta2HUaOvFTPUDVFw?=
 =?us-ascii?Q?v7nx3PCWWR34asdYJKM1ZhkAEULVL8XIun6i8533seYF7XcCXwwh5bstdYXa?=
 =?us-ascii?Q?AF2CyvPLHvPv+Dz1z2R3L2er7Fhtc0XtlyNfvOMI+OyZ1P0cQAVFig11Uq2i?=
 =?us-ascii?Q?PHoWzQL+UtYF1PHGq7jT7eoFrfMZcUYrchZXDkZogWbfu+bJyy9EIbsj9K80?=
 =?us-ascii?Q?Q31C7GBqz8Hakhwwslbfjc8SqYxsA0O1J1ArhEDNuGYa2vqIIL6ukpW4EMiY?=
 =?us-ascii?Q?x2L/uJ/0F6V2TGm3Yc5sXq9fZQlUIgkCuyneEP3sbGzC6AWBYHA9OV7rvJA1?=
 =?us-ascii?Q?ITpRXhxU6ttiRct4+nOhFI746ufLYJ2jpwWNW6BT+F5T7v413h6jkrcKXBlc?=
 =?us-ascii?Q?+DXk5UZWDz1yRuiq+ql64bFpS5I/uLnD8Nq5/+wVC81yTFwh6ii6sUpgA9qB?=
 =?us-ascii?Q?jwDsyQ2fGA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 035e9d9a-8a9e-4860-d385-08de5748dde1
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 10:52:40.7720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /oP6d+L/d2bM4KunZtlMtGV2kIPy6faxhoK1rBRf3wjeNFKbz8DNZUHL5SW3TTXL53G0Fsd+3T8bGKIpDhXvdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9550

Enable lpuart6 for Bluetooth support.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 21 ++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 31fa9675cee1..f54404c9bfc9 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -21,6 +21,7 @@ aliases {
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
 		serial0 = &lpuart1;
+		serial5 = &lpuart6;
 	};
 
 	bt_sco_codec: bt-sco-codec {
@@ -437,6 +438,17 @@ &lpuart1 {
 	status = "okay";
 };
 
+&lpuart6 {
+	/* BT */
+	pinctrl-0 = <&pinctrl_uart6>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
 &micfil {
 	assigned-clocks = <&scmi_clk IMX94_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX94_CLK_AUDIOPLL2_VCO>,
@@ -643,6 +655,15 @@ IMX94_PAD_UART1_RXD__LPUART1_RX		0x31e
 		>;
 	};
 
+	pinctrl_uart6: uart6grp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO04__LPUART6_TX		0x31e
+			IMX94_PAD_GPIO_IO05__LPUART6_RX		0x31e
+			IMX94_PAD_GPIO_IO06__LPUART6_CTS_B	0x31e
+			IMX94_PAD_GPIO_IO07__LPUART6_RTS_B	0x31e
+		>;
+	};
+
 	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
 		fsl,pins = <
 			IMX94_PAD_SD1_CLK__USDHC1_CLK		0x158e
-- 
2.37.1

