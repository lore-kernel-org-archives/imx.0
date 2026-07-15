Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013066.outbound.protection.outlook.com [40.107.162.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2615478E50
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 12:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118643; cv=fail; b=cg7izjpzp4G//gFEW6MHDE+u3sHfnO1GaTRhF6saiMJBTycVUlsJKAAmE6T1VjhI++H8bgaZaPOqyrtRaDhLv22m02wUhpLo/XUQD0Y6U0svFN3WkLPUs5zXpH8HbPeoq5s7GPG6fKjN+wFq9ua58+iPhD5C5nBTiLeQzGTozVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118643; c=relaxed/simple;
	bh=wVBYS56MXQIMS3pFkSrUTqAQjRGfujpgWwGOwYmbNSg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ASrpK1YqsV4Nhm65RMpTFidwuaFdz3FDilaR9yYTwZ/OapC+HcaQNqjzCCO8BdfFOV+/bU8JuyK0rfgKjP3sJAyOxCPqcICmNlD7u79XSAyTf4e7lLZp4y1p4AbyAdHjlRHJBw2N4QDDYX/xPCqBV7W0cLEj5kqnPDncKnhWWMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MgP5TIQu; arc=fail smtp.client-ip=40.107.162.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MgP5TIQu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HxqLuQwa0vg5DJFuVbjclKBX+XUGlMAPsho44HdnohtlrE/2UXDHYZdqs+1ATFuCX7y61HuBHfjqv91lZBTBuUb1i8Zq/zHBq7SZMzhJ1ZpxkFnq5YLKQVAvoIzDnqeUxzKjUBEueTsxkfVBFixGrfsb2Z3+Km3RtA6UChh//giVqcftpCUG6uph2AKcJRkNb5jIyuBvo6Khiqzv/CUz6X+LGsxd+twWqa+/qMxPAFKGPlTkgV9Uq02B5DWdhYWjI6lOw0Txg00DfzSt9j60HygGFAvYlZ3N6Z3fPvbNR1WD2389cVZanDpXAlyRH2QkqaUmoud2ULS2bPH2yMEc9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZUtZfOvz9zgEXG4/FVYmS9UPID3xb0hykZio6/VWRoM=;
 b=EDRnB3Ze6KMHBrwrZatEX/MO55RmeoTx6jsphS+FfcwmOBu/9RRGGmjr77HK15M3/6BwkY5KGH3vOq8B5hgQNWac3yj7BQ73Lx/sQk1r/A/uwkPGN9BgZLELBYbfm4lDPC9afCYUvrkQYHKjayScCLbyRcLCHS6rLJxOxQCNmuZKtgBxY9ESA7LhQV6dZ9E8mX+wC4v3/1WPAKB4OLjB/GcKdtKkSb+PATTGM+fXZHtdUENOgH6K/HoH5rmi62mhe4Ez6Naj6mOMmT4qjJauDgEjPmHJ4DeY6DjMwEuSRhdK+nad75BAirG3HH49jafUfVjLNJFRu3OWrqzQ0ha/yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZUtZfOvz9zgEXG4/FVYmS9UPID3xb0hykZio6/VWRoM=;
 b=MgP5TIQueOdMm0N6VFCQEKdKJOjaieuJEKKH/SUfULefjb5krq146p/aM9AKiSxv7jIgKuW4bUUUIBpjqkkHvsgKNAHaKfvCylaHlmyLbTK0tbTwDmbwoKeV6J1XTbV5KWxxlIBZv+Hl2ZXJ7ePbFyo8YFBf7C48fNuZo9JELG+7WsTNHPPBGdyBnyhvm20L7H+G+nD01mxy8v9O34xBoyhV93TtmYyMV5iA3M6XsH5VoOjO2HiTJLaQnipDd9XR7hzLrHo/fikUDLmSKTPNPIH7GINzQtIxT0wKdmG019yi60tm40oJ4tIDAU3nacKDAKn3hfiMqtRHHgzjSeyMdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by VI0PR04MB12133.eurprd04.prod.outlook.com (2603:10a6:800:313::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Wed, 15 Jul
 2026 12:30:39 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 12:30:39 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Jul 2026 20:33:09 +0800
Subject: [PATCH 8/9] arm64: dts: imx8ulp-evk: Change the values of some
 PCRs of ENET
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx8ulp-dts-v1-8-19651358b599@nxp.com>
References: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
In-Reply-To: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Wei Fang <wei.fang@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI3PR03CA0002.apcprd03.prod.outlook.com
 (2603:1096:4:297::9) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|VI0PR04MB12133:EE_
X-MS-Office365-Filtering-Correlation-Id: 94fddc84-e42e-46bc-f4d9-08dee26ce0c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|19092799006|1800799024|366016|11063799006|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	OYnjMetdddy83Zr9BhReuahk0GCBCl7+309d/rowtda244r5ugNPBzZk9Hj84TwWceyYL0Sv7WRWAhSQeqSQnVNkmd2TmSH5QAFCuXnrKEG7Pso/OT5CQdVeBbBlrdAm1ktGmv+dBJetBLW05btr2/Hw0AU2ALgqn6OkBvC8ipFn9LkLgnFRyegnzUxWshw+p3F4ToM8gIJacbvuh30hLXsKvLPM06KVsRq4bprx1xJUiPAiM9spLainrZHj6r0oRGfAEJIK9bv5HuF7KV0E9pR87S8xecLU63tnzpEa56/ODYAXzwgkiyuNXjrKD1IK7nu+n8ODQCp4Cn+2dNuWIeK8uyj1ayXPa90fnljWfUX76uuFopH9IjpxHx2usYoNwW8k9ICPbYgtEEBylnWIHL0bUwk1xJDrdmJ9h6efWbwv+PSB3OyNgNX3FpT1KE9tyLxG3jyxaoFuPPTCiA9A4JWoPandh4/U7M8hTHmIUfEmaUYWwAS9cvC7wHat8QE8QWDIr6D3jEIPOu1u4XtyzF6S1BqQgGIL4msnmo29Jc7iosLx2oMu2CyEgYotkbOvV+x7kHgN7Ce8La4u+9UD2rhPQaJLJKeqC8Xv0smC2AUTN53UBo2PNqfzq16CcXn26pe8k8cgpGATGzO3Nmep+DKytdu2yAnQSbumuJNyf24=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(19092799006)(1800799024)(366016)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1Bkd0xpNXpnekoyMEljYldTU0hsTHNnVkFiYXcvMStuOWdncHhhcU9ONTY2?=
 =?utf-8?B?bU1hbTZyKy9FSS9wQ2Y0SWp2UUhEZExhbVhKbzlXNXV1TE9EbThaQXJFald6?=
 =?utf-8?B?RkhZL2d5aWFjRkY0THBsbUtmVWgyYmJtaFRHUmk2L0lCL1lIT3VCcm9NajVG?=
 =?utf-8?B?TXl1bWFDVXd3Y29CZEhvQmJMS2svQ0JQT2xMVjVwbWFIOWlJYnhNL21nR1pO?=
 =?utf-8?B?OFEycGFoYWM2Snc1SlpURWE0T1Nrc0ZyQS9uUFdNRldaMGtsb0QwaU9uUmxR?=
 =?utf-8?B?QUpFdXJmZHYyMVNoM2I2dVhMK1hMTFVOVkZVNnNwODBQSHovSC8yMXdISXlG?=
 =?utf-8?B?NTR3bVBjNlcyU1I5enZ6eThrSVFGS0x0dUEyUmx6cytUMkI3OWxRSEJJZG9X?=
 =?utf-8?B?SC8rWHhZelRKWnNiRzV5UUh5QWVBalVucFdFK0o1ZWRVRGE5QlZwcUIyK2N3?=
 =?utf-8?B?Qk5LaWtSTXBaRGZvc2U5NnU3SGtlbHc4REZqOVU5V2sraFQ2M2hHcktGVEVJ?=
 =?utf-8?B?NGcybUZuVkpwTytmOFlFbCt0Qy9wUTl4VHR4T2ZzWms4OVkwUDZwN3ZoY2Zu?=
 =?utf-8?B?Z0FuVFlQdzRZS2JrMzdPQXhuQ0NmckM0ZEVMN1FXWXMxeDJzQXpvVTQxcmUw?=
 =?utf-8?B?VmU4Z3FWdFRTOFQrZWMxdmxVQXZUa2VvWElnSDBGT1hTSXhSYm1TbDZGSmJy?=
 =?utf-8?B?V2FzMTB4UVVBeUt2eTFIYmU0eFM3MDVvMGZ5d3VyMHR3bFJySGRtN1lqT25U?=
 =?utf-8?B?UFNqSGJsMVpIeFZqMnUyMzd5QmdSV0JKUWVWeVgvMDl4ZXc4bTVnMUlmOUxW?=
 =?utf-8?B?dlVrKzVVRHpsWncrQ0E2d3lHcFZWTmhqUU81TFp6NWtsWWxJN3BjSS8rS3ho?=
 =?utf-8?B?c0hMdnFkUG12UkVSZ3hydDZxZXRaRGhuWjJmcTZzT0FaZ1lMd2ROK0VQYkFC?=
 =?utf-8?B?VjJucUcxNjJLcEN2dXRRcTdMbGMwQnU0dVlHVzhxVHNlVTZucHlsYnAvYXdn?=
 =?utf-8?B?WUdlU1IyVi9heHNoL29TS2hWQkFJMFY0R0VmYithR0FJOXFiTXFRTHhpRmUw?=
 =?utf-8?B?YjFQajgxUnJldnh4a2IrQTNYcStqM2l0MFB5Z29QWUhYbDlSL2NlTWhzQWVD?=
 =?utf-8?B?cy9vS2tVdSszeGFZNzMxQkh1VmhYNUZxMEMzdWF3cVJDOVBWMHFRTkRwZmhw?=
 =?utf-8?B?dnA5MXovTGtlV3ZkdlNXMFhOcjgwNkUzTUl6TTJUWHJxcVJodnlVRjhDakhY?=
 =?utf-8?B?MkU0Q3lUWE9DQ2cxS1FzbW1jaE83ZzlZeXltSFdqd0dHcWtoNE4wTlZTelpN?=
 =?utf-8?B?cW4vSDcyc1lWamd3RlcxUTMyNTIxYVJmTVc0RnQraGVLcFBFbUR0aC8rVGxj?=
 =?utf-8?B?cUNUYW8xc2EwK05peGMwTlV2N2FMTm9uaDByWFYzcXRhVXY2c2twK3ZWeHBF?=
 =?utf-8?B?LzJjaElJNWJWZy9PWVF2dEtiTUEvZHRQNG1mUllwaDVJeWwzZVcwc2JRTnZx?=
 =?utf-8?B?YUowN2Erdzl2VkFUcUMvelllRmt2WE9XWU1Jc2NCODdUaVB4RWRVVEhNblBV?=
 =?utf-8?B?RW9sY2RoeU4rVTFNdzBIWnZsQ0J3MXJ6d2FxWG1od1d3SFVXVXBEYXc3U0lG?=
 =?utf-8?B?aUtWRFFST2RMS0Z0V0NmMjdidUtNb3V4NnhIMFk3MnBLcldmZ3dVMXRXL3lz?=
 =?utf-8?B?UlhReGowY3I0QTQ4L3FZVWZTeTdDd2I0K0M3K3k5RzYxSUE0M0hvM1hNZFRW?=
 =?utf-8?B?bWV5dGd0M1B3dGZPS01DQitqVEJWb2d3UGgzeFVXVXZ3d3lpKzJpcENLWWxu?=
 =?utf-8?B?S3RPTFgySnRzb0NpUVRuTTE2Q3BGNFNlVWZRWTZOZWJvY2RLTjMyWkl1UTFs?=
 =?utf-8?B?T1VYOTlKOS9aQnN0QlJ1UFBWREFaTzY2TWZNWE00Tm5Ua0JoQUhkQWJReWJt?=
 =?utf-8?B?S2h1cUNDT0lRU3hvTTBWUjV4cjZUSExkVHJRWWFicjNjQTJCMWFIMWZCS0pi?=
 =?utf-8?B?NVhNUVRJblNtek43dWJDQUsxRkNjbzB0azFhMnkwZVFOb09TditaRXB3dVRw?=
 =?utf-8?B?akZOY1p6SERYaE13clQ5bmRUdGR3WE9QLzJXMWNQQW9OeWJlTXBrS25Jb1Z0?=
 =?utf-8?B?Y0k4Wk14ZWo1bGRjYVRIYVZIaEVLK3pHZzRVMmNwSmxYYk5YNVd0TEZKRmlk?=
 =?utf-8?B?a1RnYnlmd3U5akEwKzl0Yzd3ODk5RHVPWU1DYTk2VlRIRk9XdTMrWWVxdEdk?=
 =?utf-8?B?d1k0enFxTXpBUGZOM1VyTHNOcWpFZC94TURDNzdUd0JIck1UVHRZcFBoa2pW?=
 =?utf-8?B?QWlIbDdWWi9oSy9kRDExM01aRHRlUDdiajRaVEpWVFBRQ2RDKzkxL3o0bi8r?=
 =?utf-8?Q?pK06sH+FThmRykKp4UM4mJaT9Q5bTG5Xp3wz0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94fddc84-e42e-46bc-f4d9-08dee26ce0c6
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:30:38.9627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZa0AAmtrIrd+WcAuAbFtjMpRnQZJmCHBYcIh62UPREpHNVSRGfvGGX8mzMu4+4WKRnAgk0cPgrzRKbsJUAK6/hLWpWB2/3dcPjibhIrpvtX9MQyDB9sh3QUvEcZS6lJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12133

From: Wei Fang <wei.fang@nxp.com>

Change to use standard drive strength and slow slew rate on
PTE14-17, 22, 23, otherwise the overshoot of ENET is too high.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 938ead54ff50c..81adc8a6f34cd 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -325,15 +325,15 @@ &mu {
 &iomuxc1 {
 	pinctrl_enet: enetgrp {
 		fsl,pins = <
-			MX8ULP_PAD_PTE15__ENET0_MDC     0x43
-			MX8ULP_PAD_PTE14__ENET0_MDIO    0x43
-			MX8ULP_PAD_PTE17__ENET0_RXER    0x43
+			MX8ULP_PAD_PTE15__ENET0_MDC     0x7
+			MX8ULP_PAD_PTE14__ENET0_MDIO    0x7
+			MX8ULP_PAD_PTE17__ENET0_RXER    0x7
 			MX8ULP_PAD_PTE18__ENET0_CRS_DV  0x43
 			MX8ULP_PAD_PTF1__ENET0_RXD0     0x43
 			MX8ULP_PAD_PTE20__ENET0_RXD1    0x43
-			MX8ULP_PAD_PTE16__ENET0_TXEN    0x43
-			MX8ULP_PAD_PTE23__ENET0_TXD0    0x43
-			MX8ULP_PAD_PTE22__ENET0_TXD1    0x43
+			MX8ULP_PAD_PTE16__ENET0_TXEN    0x7
+			MX8ULP_PAD_PTE23__ENET0_TXD0    0x7
+			MX8ULP_PAD_PTE22__ENET0_TXD1    0x7
 			MX8ULP_PAD_PTE19__ENET0_REFCLK  0x43
 			MX8ULP_PAD_PTF10__ENET0_1588_CLKIN 0x43
 		>;

-- 
2.34.1

