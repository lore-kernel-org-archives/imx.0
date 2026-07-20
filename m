Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011045.outbound.protection.outlook.com [52.101.65.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D488A42B33C
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 14:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556548; cv=fail; b=f2PEC4eyS1w2FH0cBjboA5MgPDeF72LsRErvyHnxPeBInSZ2vk8O8nyJumlKovvpQldqY+3AE5SP6ZYB3YkwO47P/5EOp4zw+JY7KaWwrwQBCBpjms2iARr1c2ZDsw/ipettGweglxSpdJ6ElRrozxh53xgdqF+c1k86GZZKTuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556548; c=relaxed/simple;
	bh=KdEeH8SY1s4CEHfKgq3VjPykkVg6XUBa8jbOJPyXOS0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AvefG6xsID8n/cvSnbj8Y3WFvxTBDj75HILDTOdi9e2YQ7ExkyqtY74aI0XMuo0hPurAH4WakBOb5vIS7RXFEmCeeM3+N7ALx+8r0CDNdzOjuGeFClXP38vbOoZSxOcwyJC7g084HoYCy3rZkCK5NrACFYzVbKQyvMz25FyCiys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dJGRDviu; arc=fail smtp.client-ip=52.101.65.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dJGRDviu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEovlY+XPFRGm38ASt0+u9ACUeNocztiYjuUpIQvEWVuMbbVXCnFvNKYcr1wH9gutB64unYX5/Cpy0M5m2Yzi3tAtG0A4Y2DYDAb8/3GTJT6urmideSP/CesiJiiDveM1JHMN6Eui/UMmtqxkKODa/L/G7Rrgwfxc2tzsHAs6rUZkmanHkG/YJoHHXDszqC7SP8B1IzYQ5HXw8VTYKX43rrxXIM8//CjsoDqDU/Ly2dz++9p+qNePeJpiEVhd7zGhURqOJppIBlgIayBcGC/r8T0akvcohi+Q/W/3yMf5qNrQMQkBD+OxyEw9Re1B1zzpbjKkMhl+lJ1M5Axn6vsag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JP/FlKmWPu0nWlWwf+GC+9dxyf8bmBCGH7uPB+LJDho=;
 b=CyOdJ6aMV6YtwQGuJ5TLma0vH1K+Mh8VgO+etyX6bIKA9tBdaUpvhvein/yZhyhCgu8Oervfgpp8iiLjoMDvVvlej6+GWvilrG8zOTm5/riW75c8vW2kH98+5YXhOdDLDb9vIs4U60DkBO1adnjX1bUO/Z4dA1Y5qjXjISlSpqcSOdmIKawMxsCj+mPsZbrIprmRjfKk4EKVT/h2TngtW5eLMhydI6xyh8rs7MmzTY0vAU240VI8FYYGPZYKD+gFGk7Fs54p/e+llDp7Fgj2cfflunbBA2T+kjTZ8fAOF/6vuYJ/wQTL5iQgpnmqNuVOQ774h9bjJUi0TgxdvV/8Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JP/FlKmWPu0nWlWwf+GC+9dxyf8bmBCGH7uPB+LJDho=;
 b=dJGRDviutyVBDlnlBSEyHbPW//PDENq5T/a1qJaJfkbTtt1tGMv67f6DEqqx2svtjbnqKPqoU1G6LC+xrOTaT++gQ9JOenYkGPDaReJP/3Jh4dIXb7dIDamictbJfB8jfROEDm9VvIukxH2zBNZEG4k92naRE57FPh7lutCQG2bPQQ7jAh92/VBA3PSZTmn7DrMDUUzsxEgKziMB1BMaTBW93/PrY4wkqUO+WiQkaQLz6W5SWNL5Wv0mQqg24RShITT8IVhf6JN2JQHhiUpESQnUl3TqQ8Uy26xXLPcj4aK1LT0MPu4bN5ewPtYLa3+ZyjlxH2mPRWibGg19cn+FcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS4PR04MB9412.eurprd04.prod.outlook.com (2603:10a6:20b:4eb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 14:09:04 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 14:09:04 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 20 Jul 2026 22:12:12 +0800
Subject: [PATCH v2 4/9] arm64: dts: imx8ulp: Add assigned clock properties
 for LPUART nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-imx8ulp-dts-v2-4-d05c67676f53@nxp.com>
References: <20260720-imx8ulp-dts-v2-0-d05c67676f53@nxp.com>
In-Reply-To: <20260720-imx8ulp-dts-v2-0-d05c67676f53@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS4PR04MB9412:EE_
X-MS-Office365-Filtering-Correlation-Id: 7121b60e-df00-4f83-a467-08dee668747a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|19092799006|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	u0OUOrHDjvO29S/tIT+S17xKeQEDc7THjKnIHFCo6bZwoQNH5zlZJz53oNoWZ408ezfS74wb74oy8BxcXxFq+V4KIEs2MzMLLgAqGFlY1t+WyxeeiFio/vOe20TjBrPPET8vUYRjNYkZZslsTzMlV/04yT/9OeOyc3w5eXOxkbGraZsEd3LrNb3hGOlHy9yvghP+3MskwkLSBhjwEX/D+MxKoIXEIhEXsALW0b3fAOB1nZaJzfPYui2t4uUk7MRoMwctdRVYGlEV3s7mvYrGQ7IaufiHsnU0W+e1z9Ma24/Fs2pOLLyFs2A93iA1vQnzylFslxcwpMgXRBFB6xDfKglkRyyK5MvRTEWpryVL9TsPpLY7XRKtx7lOaOiPOh3OyKlxPW3f69U+c+QDCzzTxqgzC4cPyzInGMKxyIJiLkngLAMB1/LpScNSsuXZgm/orYWq6WykQIqF1ncYZGkhgFptJ4C4WSnowzJ/O4SWGymG6eMg5mjYIGSeE9x5Ka7Uu5WlT9qMAm9ssIduvXQj+/POEWJpsddfEFw0hdg6Xz5P9icHdVX3Pns/1aJ0oWfgIBT167/WTjml2B0MG/7j64Wkk5api5nunDHN06qAq77lo3CZG0QWdFJ+5hD1b+ILZmfIZUi+9whpQg6u9odiZWusrOxREyc+3Difoq4iIY8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(19092799006)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVRkeTNXdXB2SmZzYmNtNHdYRWgxOXJIVVRNUnF6UGM2eUdsU3RMNEsya25i?=
 =?utf-8?B?WVAvQlhqdThRai85R3hDZlNMU1JoSFJRdHhKVFpyNUNCdVpkMzVrM1FjNVFO?=
 =?utf-8?B?SnYrM1I2TzA3OTRqS3dZSGNGVmZGTFloeGRwcTdnenQwVmNwQ1NremFBcm1u?=
 =?utf-8?B?ZUQyMGIxcGdZMC95Q1ZFNHAzWnBIc0hyM0ZyNDlIRE9haWJ4NDNGclh2MFlD?=
 =?utf-8?B?dk9FNTFVbnIzRlh3SnBGcnBWT1c3NlI3S1hnN2Mwd0RKTnNaV3VkZytwcERZ?=
 =?utf-8?B?RVRnV0Vmc2V5d3o3SDlJNVNzV09OaEZKYnVFTVZtMDdxNFdMK3JzdnpVTzg5?=
 =?utf-8?B?ektUeVo1VDNtZmx4N0RDSHJUeStpT2FFbTNOdy9Pd3V2Wm03dGtGQS9mM0dK?=
 =?utf-8?B?MUpFaGpsbVA5VkRDVXNoNVdraktiNXh6WmNuV2plTWpqWVBSd2diNmVLaVpN?=
 =?utf-8?B?UDgrYlQ4MVA3RXJQRWt5b0xydWpmUWs0STJTMnQxN3dHeG5JNU1PY3BsNXBY?=
 =?utf-8?B?cyt5YlJ6YkthaEdZZFE5K3NXajJIeitpcFB4R0hHd3ZXaWpWRnN2QVVTMWcr?=
 =?utf-8?B?bXRlS0hZL0hMcTNXM1NISWxrbU1wYkp4eW01ZVFsMlM2YXM4U0hoajdXSith?=
 =?utf-8?B?VzdqZEtiMTE5dWE0aGpONTBVc0pqcmFSNmErcGRPamZuTlN1YzVxV3JYQzBk?=
 =?utf-8?B?bkJGMHdUaDl4MTV6cUdpNGpVZnlEUG5PblNSM3hPSzJVOWhDdnh1MDBUZkFJ?=
 =?utf-8?B?TEJ0UVB0eEljdUNLcXVKL1MzZEJmSXFjRzJiSTVtZmVYTDRsQXVpNi9NM29U?=
 =?utf-8?B?Qm1kVkdzS3N1cHQralQ3dnJiOCtNZmxUaWNxcndkVHg3eTQ4WXZLWHRxNmx3?=
 =?utf-8?B?RUZDVFRIRy9ia3M2K0djTENOQlRvL1BqanhKMHdDczQvdEs0YVRlWHhzQWFL?=
 =?utf-8?B?d3UwQWJldmdGSkF4eCtuRHpwb3pMRXdjYVZYK1V6bExFSS8yNjVpSHVTK0Vo?=
 =?utf-8?B?VGJMeUJKdnZjZElSaHpBb0RiSFlOZWlkZHJMWXQvSUxOUFhodTJLSzdIUk9Y?=
 =?utf-8?B?M1JvcVNXOHJUNWlkZEJodGlhM01EN005aXUrMnloOWFKaHFkNFp6akF3WlJ6?=
 =?utf-8?B?SVh6MklMdStUSHAxT2ViOU5naVJ4MGxiaXphanZXalhZT2g4NGRCb3ZGK0tw?=
 =?utf-8?B?cEJnMjcrY2l0N2UvQk1ZVGgxLzg1UWxqVTg2ODFZZ2J1SldEbkFDT2lKS2I3?=
 =?utf-8?B?MlBQc29UNWxlVHp1cXpTQjRjOThWUjAzNGpZS3Z3dmM0bmplWmZjU2ttdEla?=
 =?utf-8?B?OWZtVkdKRW5KMkNIZ2dKRkE0cHJDdTNYYmx2cVE4ZDhnenNRN210Y2UzYndR?=
 =?utf-8?B?ZUt3azBVWmVyNlhHUlNONi9MTEUrSVQ0WmdZZFFJbkZjS1J2OGJVOXRxWEFk?=
 =?utf-8?B?NmI3aDlzay9nNUYwc0w4TkR3MHRKL3dweURuWUQrM2VSd0tmTTdheVlva21D?=
 =?utf-8?B?OVBzY0J4dDRCWGFBbXpzNGxLYmU2OGJhUm1NUURVc1V6RlhlZHZHTkRqNXNz?=
 =?utf-8?B?Mzk4dk9RR1I3NFFIKzg2bTVCbHdPZXNNSGpCNk51RWt4OW5ETk5vcWdPTTg2?=
 =?utf-8?B?d3hRMWl0aTlKSE1IS2gwMTFZYWxDRGtEZ1F1dU1aUGhHRUFhSnhpTDI5UmI4?=
 =?utf-8?B?OHVSSnk2VHVNc1ZWM1d6TVdreTdpa28rOGFyWWZtT3JWcFlqTlB0VHM1NUhx?=
 =?utf-8?B?Q09WYzBaKzlINGliMWl5TlVWbG1jaFkvZ1ZFWkVhU1dUbzd0WXppK2FySWds?=
 =?utf-8?B?VHRkMXRpYkhDRXhPYlNRdXVPL3loYTM5cnJnWnNnckh4a21GT2toa21GaXlE?=
 =?utf-8?B?Qm1IYjZmT0RtQkQ2TWg2SU1DTG9INkZnLzJaa0ZoMHhoQmR3ci9HZEdCSlJZ?=
 =?utf-8?B?U01DM3Q4VmxnbVBwRCsyeWkzMGdiQ0cxbW1NcXo2d1lZTysyNnlFUGhPUTMz?=
 =?utf-8?B?ckJyeEYyL2VFMkhLL0p4bFlOeU1lZ2xuVm45QWVpU2Y4ZDdpY0F4MGFkMlZ1?=
 =?utf-8?B?VFB4Z2x6N0U1Z2hPN2h3M1VmOXBidlMxSWdma2RRWG9JdFdJdlE4MXorbTBE?=
 =?utf-8?B?SXYxYkdVY24wTFFnRjAxOHoydG4ycURmc0hNUFlJZGJ4STltRjE2bDZscWNk?=
 =?utf-8?B?Zk9rY1d1aGdvQ0tIbkxRU3M3VTBJYnZwQW5ZT1RDZXNNUlhGV0RKdlFiUitH?=
 =?utf-8?B?MXRaQ3ZKblVLc0l4SjIvNHljN0lhcklsZEZJTy83b3Avb2pSN0dBTit1OGtl?=
 =?utf-8?B?T1dBRWJ0bTM5ekxjQzZrNk9JdEdoNFFNUVg5dGVGb2VYSml2VnExWHhXcmlE?=
 =?utf-8?Q?P/7znaET/aM0U+yPWeWFG0GzMCsstiEU51YBD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7121b60e-df00-4f83-a467-08dee668747a
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 14:09:04.1211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rL3oGyg1S8OZ8zh8EUW85NUrr+TWVhBeU1e/nkmhQt2EQ+ySJkbWeZDqs392a2fB/YBVRG+z5AL2xkv2xrYoqCckqP9PYUrI/sIctlwOuth3FEt8U4k5F9EwVfR4hLm2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9412

From: Peng Fan <peng.fan@nxp.com>

Add assigned-clocks, assigned-clock-parents and assigned-clock-rates
properties to lpuart4 through lpuart7, so the LPUART input clock is
configured automatically by the clock framework during probe.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 7d00fe8360948..777b89ed68490 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -413,6 +413,9 @@ lpuart4: serial@29390000 {
 				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&pcc3 IMX8ULP_CLK_LPUART4>;
 				clock-names = "ipg";
+				assigned-clocks = <&pcc3 IMX8ULP_CLK_LPUART4>;
+				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_FROSC_DIV2>;
+				assigned-clock-rates = <48000000>;
 				dmas = <&edma1 55 0 FSL_EDMA_RX>, <&edma1 56 0 0>;
 				dma-names = "rx", "tx";
 				status = "disabled";
@@ -424,6 +427,9 @@ lpuart5: serial@293a0000 {
 				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&pcc3 IMX8ULP_CLK_LPUART5>;
 				clock-names = "ipg";
+				assigned-clocks = <&pcc3 IMX8ULP_CLK_LPUART5>;
+				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_SOSC_DIV2>;
+				assigned-clock-rates = <24000000>;
 				dmas = <&edma1 57 0 FSL_EDMA_RX>, <&edma1 58 0 0>;
 				dma-names = "rx", "tx";
 				status = "disabled";
@@ -529,6 +535,9 @@ lpuart6: serial@29860000 {
 				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&pcc4 IMX8ULP_CLK_LPUART6>;
 				clock-names = "ipg";
+				assigned-clocks = <&pcc4 IMX8ULP_CLK_LPUART6>;
+				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_FROSC_DIV2>;
+				assigned-clock-rates = <48000000>;
 				dmas = <&edma1 59 0 FSL_EDMA_RX>, <&edma1 60 0 0>;
 				dma-names = "rx", "tx";
 				status = "disabled";
@@ -540,6 +549,9 @@ lpuart7: serial@29870000 {
 				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&pcc4 IMX8ULP_CLK_LPUART7>;
 				clock-names = "ipg";
+				assigned-clocks = <&pcc4 IMX8ULP_CLK_LPUART7>;
+				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_FROSC_DIV2>;
+				assigned-clock-rates = <48000000>;
 				dmas = <&edma1 61 0 FSL_EDMA_RX>, <&edma1 62 0 0>;
 				dma-names = "rx", "tx";
 				status = "disabled";

-- 
2.34.1

