Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011060.outbound.protection.outlook.com [40.107.130.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A031A28C869
	for <imx@lists.linux.dev>; Sat, 14 Mar 2026 12:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773492699; cv=fail; b=p0YKDwUNqkHsECMyyR5QIE4kGDJ4Ge03iHtlKf/+GuzRaMMqpq1lF8ErszULCWoTp5CKoFHhDHCMmzCU76aTQbHEkRnYZXKCmPRbwb/VqBrCf6dgAjf5Iulr57CWcumvpEd0t1I7myNFQU3Xb7TXqd43rfRyTXt/7rTQBec2tKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773492699; c=relaxed/simple;
	bh=+GaDlfhOCtoOK3CdNbiLe+UG2yI0RUJzC2YUaB88nz8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UuyJOENIyQqqfYZkY9PTs9jWGgvzorYlmd0qiGi13XUPdtxN0VTaQUJimRKOuFMcexfwwXpiZ8Jg+TO99fvOWSSOVyZORbRl/5/AJApAqmM8hiudst5BZjgleKETLEteMXaG7w4l/u4n8cAEcGp0a2uHpwkVw5p/RWeeGGuUkE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tULiqdPf; arc=fail smtp.client-ip=40.107.130.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tULiqdPf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NkSSJ8S1I6R4yaO+Vlid9rToAyzljhKz0HTHmRlqP+TGjJrWI3Q1uWUbqKmrEjGyhQyhPVPdiKLtUVrRwz9g6H8KBW+qJ8OdEymHHdNriIH1W+KRaEoA2fwZ6kCz60Ia+XKZjoamjrz6B9Hj32KckygoN5/umiBIjPoCrwyCedPJCsXTxzp3JuAcM4ycqeHB4e8Nj2f+EeV1jkebW/5GCbLVGPHqgrv9JN7LqUpJFjKuMcMz92dipVgcQUkdAtD6WUqMoBxcb4uk9vHJCF6l79la7OnNO0X9q90qVH0Cu90tuKONwl4ZSNMqwV0VZ0BmAOK/2W9l4O6udsQoHVJVZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNGS6nBV66U5LewhVscbv75Gofd6ZxYB0Ehx5tNA41Q=;
 b=tD5eVwARMg0Hf477k0VMQ1b53u0V3b0e10JenJOkOgJe6nRVnojtVP+3yABnySjHQaQl7rvKcVr4UKG8JlwQgUhwWSGiOvhKH6Rga3RbD+jtlW0OE2JcbLcApk9D5FkWhSCK8gJJoN/RO/bTNXBKWickFeYKCmQ4G8cWJ7YcMb7Jaw0dZ/gjoR/7pbwOmXSJX6WXEypq1rkh266FBQy6jF1kk9geZx+mUpWsVH9BxZHACfFdju+vIglcSEgmBBIkNVbP8IBB1og15dXr8eFHX0l2abBrABiXpDSY4cUMewCuboehjpgPLVFyoaeB+WtqRqfwhl40Kwqlba/GzNnY+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNGS6nBV66U5LewhVscbv75Gofd6ZxYB0Ehx5tNA41Q=;
 b=tULiqdPf4L4NRyOPFSr06LrAdYWcHlt7SEOCbqJ2QZzY6UIN2UGVLTKUZlGV4qflJm4PM2So/DK2rHRYVJPPo75G9HUiFDEk2ifHX8E4n+zBEDEm93+ZIYpMuXYpeoXKrEekn65hQ519KRxKo09jppNUh5ZMkCmUt3oZWoDEAGpkNJ8n5azMcQxjrfPtAgIjCjYNqBDOgG1w57UJ64PowTSvxoXJfGghFdSv9Lc8sfSN+fiPes8QdNGM6cuvgtWqgTKo1eVoHymwL5AMX80GZIOts5OC5jIzt4pMSsDu9Ovw3I5PLwGbxvePvwsnbG3//68n/5Y5VU6st5f41A/01w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB7802.eurprd04.prod.outlook.com (2603:10a6:10:1f0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Sat, 14 Mar
 2026 12:51:07 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.013; Sat, 14 Mar 2026
 12:51:30 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 14 Mar 2026 20:52:43 +0800
Subject: [PATCH 6/7] arm64: dts: imx943-evk: Add fan node and enable active
 cooling on A55
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-imx943-dts-v1-v1-6-3ba9b426863b@nxp.com>
References: <20260314-imx943-dts-v1-v1-0-3ba9b426863b@nxp.com>
In-Reply-To: <20260314-imx943-dts-v1-v1-0-3ba9b426863b@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Florin Leotescu <florin.leotescu@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA0PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBBPR04MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: edb3777f-60a0-4f9f-b7ca-08de81c86996
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|19092799006|366016|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	iF7TQ+Fx+xTit0kqfl+VRIgkQvD5e/YYAGK+gi6Sdokj8+zdXzQSvW6I29l4ct3lowrqoP4ESG3bXd1ZB4EzjvpVN7z5RkXlAUBQD2bkdmnfpcFXywF8lcoxpU/oDbmvoN1ULrJuNAYkvnf3ZMKTKLqK4aTeM7vT0mQbD7chtNsxTXGsHFagkWis4rvW8RF4bo2dHEeQkYhqKe/7GTexwnLUbRTTTkjgd1QERvUqrhuU0pNLw5c2JOE7OIuSh31j0J71KosMwxoBb0f9QyhkxKEPhP29aW5MNkZVHEiPQ3gLNMcLqiOYA4SQPbg9oY1BIVywlCfufzmjV+f6RR2gauWNX4O9ZLWY7PikkEmniOdnooVFJDwEZPlU355tKrZVJrFhDHI442+rkiohD/RQD4h4qSCLZB9ymIZINZeIk+8Vhl3axruXXTMrGwBPhtpLxYeVWIjcmUMGJo5d02B8m9IsFsIEOioX0iIRifo0EXRHrcKmJAqo9AuszabWU/VMulF1KUKtwGh/cmwN/Li5k6BGVQlLXF6aPMoCwawKQpcdWQdV5b3Q531HgFonCTQVTr24aXGjduoH0xRn8k7rhwQS1gczMTIgHzYqGZHWu+VwteLiXiWQqrYYellPf3/IAVRpNG82fR2NVum2m0GwLFdhK6brB5obEP1mtNBXs9hjp7EI5Gn6aQ+JHP7rNF+fs33QOAfob5UOJ+i9bSUYbeHcMQx0aNoDv2vdwBwSIVDC/DHj8TfzOWBRma/O7lDzfwE751SVCX22w4TSUer4nsvTh0Hb7jiJ5VAYj0Y91Is=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(19092799006)(366016)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEg2MG9iSkY2RmE1QlhMOEx5S1NXTXBsSHRia3RONDNwRk9HTnhkOWd6SWhj?=
 =?utf-8?B?bHYza2dmdXpBRXN3ZWZ0LzJSVVVIY3c3RGFwL1RoZFEvbkcyS3hSRlA5L3Jw?=
 =?utf-8?B?SW1kaWRGQjEzWUQ3Nzk3UTJEUGZPODU5Ym5udkZRS1FhVWFFdEUzRnZKZklu?=
 =?utf-8?B?WVpWTDRJR3RJbXZmeWpzYll1bVJPNi9pTEVuM2NoZFIwdDJqbHgxOVowUk1m?=
 =?utf-8?B?bHRJbC9VM01sYnRKN2xqU1pNeklURWhlZ3drYmZzQ1dGRlBvUzRSWmd2WStr?=
 =?utf-8?B?RXlGZkhLVVFaRFBqWVhMbHJObWJGVXJxMWlFdjJBQ205ZUxvRUFWelc4czls?=
 =?utf-8?B?V2luc09mUmozWm9NbjNQdnhWSUFuSEF0Q2VLU3gyQWc4UHd6Y1NTakFOQndm?=
 =?utf-8?B?YXFBWTVTcURFSU4rWUt2d0sza3NOaGl0ZE83cTlpaWhYbDdxTmhOQ2d1NlBN?=
 =?utf-8?B?UUcwSXRCRGhxeDVoTlh6S2djb28yZXVFS0RnTVpMUVNhTzVSNklvak1HRWg5?=
 =?utf-8?B?dk1hRnZNVUUyV1RUL014NTZuQWdYeTFNb0FiUnJobEQ4U2FtYitTOTcreE9q?=
 =?utf-8?B?cU92dzNRa1VaRmhickMwcC81R29xUmVFd0JQeGpVWDNMVEpDRThOM2pmakFO?=
 =?utf-8?B?VXFZV1BqRVMyVFVXa2s5OW1LVG15RnpEeGFtbW9wYjI3aDhhZVN5RUozQkpT?=
 =?utf-8?B?RkN2U0UvQ1RCakN2ZitPYlpOSVNnVmVIaXlDSkpnWkRtaGw3bnJCMnRPcFRn?=
 =?utf-8?B?QlJaZ2VyQ0VDbWRweGo2WmlLOGlhTzdTaWhYU3RLN3N3K1JGNjc2dEhIYnVV?=
 =?utf-8?B?NG5pczhuMkpjSTdla3ZsR0gwaHlRb1NkNVcwKzlhYmhIUDQ1NThaY3pUdmpi?=
 =?utf-8?B?UjRaSzdIR1FMa0JEQ0JnSVVhdzRhVit2SDZmNy9uMkdLdExuaEVMSG15bGhU?=
 =?utf-8?B?ei8wTDBtZFVIZEcveTVnajU0c1FkNXdxUU5SSzhFTGY2amh2REw1NGM2NjNV?=
 =?utf-8?B?eWZzOFhpUWkwVHQxeWQ2YVFxeDlNRkZmVUlSaHlCdHgzODFpZElSa3dBeHpF?=
 =?utf-8?B?MDFqT2V5aVI4NzVEdElPeFZvR0xBNVVBajdQalhJUXZCTTd4SlcrbnQ1WjY2?=
 =?utf-8?B?emZDeUFuWno3THJTVlViT21uM25NMUhMWE1ZeDAyUXJ4WXBTb1J5RDA1VEVt?=
 =?utf-8?B?bmxLOVY0ZGZ3bkUrajhRUFEvd2tJWnIzUi81OFF5OHAwQkJWanhkZmdDdzE2?=
 =?utf-8?B?WXJqOEVpbzgxSUZTWWN0OUFpek4wNTFTT0duMlYyOUpwQUF6bzRsN05IVWpr?=
 =?utf-8?B?R05UMzdwWTJOTGRkZldwREd4M1dVd3ZvMEFpeUlYODFQQXdZbFk5R3l0SitE?=
 =?utf-8?B?NWJmRlI2RUpvcGlPVGpRVHN3SFVIaG83dThRUUxFalF6a1RyaWJmNEVzTGdx?=
 =?utf-8?B?VWdMZzNIMU9SaEI4RUsyNHIxL25hN2pIVm93NzduTXppc3ZaM3c5SEYvTmdi?=
 =?utf-8?B?T25jUXJTVkFRNkh5eUplTVdqTzhPTTY5ZmlKOWdUQ2F6YTFJTUY4SjhZcXJl?=
 =?utf-8?B?Qlp2czBPWFJRRitoYlJ4MW1MajZvZkJudldNVFdQd0pGUzI3TlhGN25VWEdZ?=
 =?utf-8?B?dWVTL0U5QUpEbmNJdWpyZGFzSklidUk0N0JYNkhmS1c4UXZtWCtPWHg0WWJH?=
 =?utf-8?B?c2xmdk05aEd5N0RjTjhuZ2VKRWUyckFsbkMwT2ZvT1ZIM2s1cWorbUVXeFdG?=
 =?utf-8?B?UVNzeE80bVdSVFZvazJEVkhOU0paRTVCYmZEejFqK0ZNRVhIRlR2NWljMkwv?=
 =?utf-8?B?YWo0U3ZmQWlDNGF3bjhwSlcwSUc0SEpXTE11TVdkVXZreHB2T0MzZklmMjAx?=
 =?utf-8?B?ejhvcDE2RXZEQjFpTlQ3QzZ2Z3pkcHdva2s5TmRZd1VJVGQzT1RzMnR5OHdZ?=
 =?utf-8?B?bm5KZUJxVnJBdGE3WS80NjlmaUcydldNRE1PRElRbitHa3N1UjQzMzQ4WjFx?=
 =?utf-8?B?OUVhS1pxellLTFlwbUJ0NEdsZkVrY3lZa0F4YWVTcUs3bDF3UFZjY3FMNDhJ?=
 =?utf-8?B?ZWtNMThFOVZWUHFwOUVFajNXWmpmcDk4dE15RitmVjlNTkRwbkdpR0tkR2d5?=
 =?utf-8?B?dlpDWlFFU08vTGk1WGFaZ2gvK1A0ZG1GTEkrSXowODZ1Y2pBUmdib2JQOG5H?=
 =?utf-8?B?KzlJK21BYXB4Um4rclZGWWFLa1dLQnM5VENoTEliUUcrd0RteWlBRmIwRzVO?=
 =?utf-8?B?eGRRZnUwTldhZ1hhYlQrSlJVN1I5ZytVeExwYlBtUWwzYUIyNEVwdU9Dd3p4?=
 =?utf-8?B?d0QzTmJUV3REY0YwYW5LY3ZDcnRGdXlBcmswci9EYmQ1MXpKcy9RZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edb3777f-60a0-4f9f-b7ca-08de81c86996
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 12:51:29.9469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jFXW/XStEGjVYLDrRWCRg9MV/V1nVm8XDDQTfAbffqaw6ckResSy0TgYVYFcTmWqQ8RyB0QlOCWtbPi7qKFTWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7802

From: Florin Leotescu <florin.leotescu@nxp.com>

Add pwm fan node and use it for A55 cooling.

Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 57 ++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 36b76b3e27eedf76b80b1c19e2a152d42bdbe1d7..428a8dc1904cafa24d47a4f81dc70786f8516ef5 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -5,7 +5,9 @@
 
 /dts-v1/;
 
+#include <dt-bindings/pwm/pwm.h>
 #include "imx943.dtsi"
+
 #define BRD_SM_CTRL_BT_WAKE		0x8000  /*!< PCAL6416A-3 */
 #define BRD_SM_CTRL_SD3_WAKE		0x8001  /*!< PCAL6416A-4 */
 #define BRD_SM_CTRL_PCIE1_WAKE		0x8002  /*!< PCAL6416A-5 */
@@ -270,6 +272,20 @@ i2c@4 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
+			fan_controller: pwm@2f {
+				compatible = "microchip,emc2301", "microchip,emc2305";
+				reg = <0x2f>;
+				#pwm-cells = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fan0: fan@0 {
+					reg = <0x0>;
+					pwms = <&fan_controller 26000 1 PWM_POLARITY_INVERTED>;
+					#cooling-cells = <2>;
+				};
+			};
+
 			wm8962: codec@1a {
 				compatible = "wlf,wm8962";
 				reg = <0x1a>;
@@ -834,6 +850,47 @@ BRD_SM_CTRL_PCIE2_WAKE		1
 			BRD_SM_CTRL_BUTTON		1>;
 };
 
+&thermal_zones {
+	a55-thermal {
+		trips {
+			atrip2: trip2 {
+				temperature = <55000>;
+				hysteresis = <2000>;
+				type = "active";
+			};
+
+			atrip3: trip3 {
+				temperature = <65000>;
+				hysteresis = <2000>;
+				type = "active";
+			};
+
+			atrip4: trip4 {
+				temperature = <75000>;
+				hysteresis = <2000>;
+				type = "active";
+			};
+		};
+
+		cooling-maps {
+			map1 {
+				trip = <&atrip2>;
+				cooling-device = <&fan0 4 6>;
+			};
+
+			map2 {
+				trip = <&atrip3>;
+				cooling-device = <&fan0 6 8>;
+			};
+
+			map3 {
+				trip = <&atrip4>;
+				cooling-device = <&fan0 8 10>;
+			};
+		};
+	};
+};
+
 &usdhc1 {
 	pinctrl-0 = <&pinctrl_usdhc1>;
 	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;

-- 
2.37.1

