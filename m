Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010057.outbound.protection.outlook.com [52.101.69.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C21352C2B
	for <imx@lists.linux.dev>; Fri,  3 Apr 2026 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775210151; cv=fail; b=JbHBzY/S2STfc7GazUdRNRGBnfSz7vIi8EUbripgpjFzKVWCz5TlwI+yLQUSyz7MFG1nmjBYez+UoYQdsKujZ6mxq1GhegmmLplR346p+N2Zbt+xE5/bwzqRiwjAakd4mJI+MCrdUQtujrKOr0CfSj4E+95qjhLcSCE8L0myI88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775210151; c=relaxed/simple;
	bh=zNC/F/6G39+N4qwna1Wktb3A1P12P2cwz81CJ6a+gjg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=QhgwDneU2yJwf3Ej60z0QUYJsNPtguyRzv+lEoAnLYtQMEWeOGHfQhTRheAGRwgqupLFipwQfisRhjU4RmT979oMOLn3a4GEYS1lH4gAht0wglqgnUWo3w6askYoRmwRoLcYSOVQi1FvyZMRELQG6p3FGMLs52eRJIUzkZdMUIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JZpDAxAV; arc=fail smtp.client-ip=52.101.69.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JZpDAxAV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGcVmByhHxyB5T2HZ+EmjAxjlp4ty0XIlomPFP0ZKCfC90nN6tAKgJeNp3hUUAF38n109rj/5BB1qgqAE/YXKNAgbWAngRQfcMZTUrHEGgaBqLGRwa4jZ8Ca1JfGKHHzdMJn6zKv+i++ia6ewyFCS4M7ppBFqTz3VydnqLwP/ualz/+rv+NREYUlggHpUl5pkaic4X6iPmrwYIwd+Vl4Hs863zI8SM3t2VxeEsh44m8fW7MkWlI2WTKBw7jGzwjFhLbA5rubRoNiP7M5C9iUe7B9DiSa11S3qF0OUCcIM8040v7Ne6iaDtjK2Ud18xWv+FvnKU/yGT+Ye3A+du5NZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iajoSyGZP3spIX/q2Xd8HetCCBTjO8zpSFn/iFuCsnc=;
 b=PX7jIJi1O+ZELEcvxIwIGIllwCZzKAlIrNxD4cVoq1iIr8ZdxZ3FJVtgNlpjoF+Sm1JIEQ9AnHUKdu6LmEwTSVydE5MVEX2018FrlUCfvgT3i9f9wi/X3N7GWl1jxiMrcrIM3acFWznarJ4zJF1xz7AR9TTqi+AQXv8l1unkPOp5TuDtlPbAr7E0ZkqFUs/xCMXaEp16LXtKwH0vBNxouAxeAhEfrtRaUvehXEczTPrh+vjO67w80gJEbOFS0fKrING+YaB/46a7QjxAVasSnMBkW1yk0kDgIvuMkruy+F9pePN6ofZb+Rmi2a09TFC6a/Od9DXFKj7FedqDuRz0Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iajoSyGZP3spIX/q2Xd8HetCCBTjO8zpSFn/iFuCsnc=;
 b=JZpDAxAV0ft3FlyLKLK4I7QcaxrT2E3xzD+FnbeJ6wq6i+yg7bkbDGGj4+Q/KQEDOsHLSMkZbMWZpBlkE2fxolySWxw/xqlNNp0wvSaUzakuOTkxjfcbizYtye0857KH+WKyXVb/L8s+G/wjz+n7Sbyvm1IjNe8qXr7WQR7yYAM5rB8qKKrYkEepD4siSBtrNvG1CKLqJYDeUwxKVV+GOFe3UnoIkeUUGGxxQwmpUYLr018G2Qpc4cXzJr3fgB3F0iTlg44Vm7AHfdjABSwF+oPCHNkwoP9YDWBKYk/Zb/uWShO16UlCfdbr1bV/Lq0EATzuQrQmrydL9Fg672HeCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9928.eurprd04.prod.outlook.com (2603:10a6:150:117::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 3 Apr
 2026 09:55:40 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Fri, 3 Apr 2026
 09:55:40 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 03 Apr 2026 17:57:02 +0800
Subject: [PATCH v2 2/2] Revert "arm64: dts: imx8mp-kontron: Add support for
 reading SD_VSEL signal"
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-imx8m-ldo5-v2-2-53bb33d6b810@nxp.com>
References: <20260403-imx8m-ldo5-v2-0-53bb33d6b810@nxp.com>
In-Reply-To: <20260403-imx8m-ldo5-v2-0-53bb33d6b810@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA5P287CA0086.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::18) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB9928:EE_
X-MS-Office365-Filtering-Correlation-Id: 3307bfdf-f5ed-4f47-852c-08de916729ea
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|19092799006|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	L1dOdLXdQXgKUVfpWFJRkKG1A5gT6XdChsnFH9WI5+HA+8gG3c3Ea3iYthnDD4Ub76mK4OHDJ/6whu8aQx2quY+xr47TCE8hL844P3Ye7PzSWemBRIXIRT4LWJ54A5raec+QDiFYy8ftdYr6h8IkLcg/fj3f2hrFRIRKC99+kFDXIhasnqG10eXFrV4uCW/ghvq5BaEf+0aAWuJcyG0grgMQDhsyZeto4HwOgIQhfJBCYz+l1DHQALxejBFwGHYzUOHpBh/030nfak1gijCnEYuJVzRS1GbquH+K/mjz8CE5LrhpQHMetTMwHHxa1cthNnIAYCBhvAWn/UKEQpe2zy9+uPIfzP8Qp8YTQqNxLvQJ8q57TfWXewrR1MsA0/GLq2vT4YGMQqzAhNUUEXQIQgVsqonjxEFaVl7omQU6lowVRjbttBFxv9u9lPRD2E7r9L8qQHEvIXrII5XzNv/wYpWNwwOSwh1ntsJELWKSnSCdtpTfpJsmLUR6DOuYw2wkyn2aPhVQ6TI0dD4B0W0sRRamhMxQrzyeTAlaa/73Ayu3XQUYPXrfgHCh+uNPtgxG/S1U5xB+NunGay80wyV2u+MdJjZSvoYjLLO3QtWB+VmsVmpiAFKPkUxBcBdWJfBLzQbT9B9G9Jro5aiFhG++kvU583jKCrHARHK8cU7LEfNVGoq1YzKegXF6NppMob6GHuRLJ32Dz8yjjsSzE4AGYTVhMpIlHZlxnjk+HDS+z4IoNEMZUTh/uyBZxs8n1CohkukgHfyegJrVZg4ZgHhn9YUfJGtWev6vVVe2oUWIj4A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(19092799006)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFlWZFNHLzRteXlUWWszVVFCczdRRG96SDBNLzhBNHJYZ2dLMFRFOEQ3YW1i?=
 =?utf-8?B?MVlqKzI3MkZ4N2o1REs5UkhKaWZtaDdRVHdQZmdPYVRpRGdBdUdGYjVFbTVL?=
 =?utf-8?B?b2kxUmc0MXY3VTJLZUtEcTJBaFpWUEtxQS83NGtKdm4rZDlpbGhsazEvUTRP?=
 =?utf-8?B?Vm1XNDVKM0RyOVRjTklrRkIzUjc4VzFuTzJUeDJOSzRjeXI1MWs3M3M0c2g1?=
 =?utf-8?B?d3BreVhFMzk1U1UyZUlYa293bTFISWJrZjR0Kzd2VDdTSnBwdHdmUVZLU1hJ?=
 =?utf-8?B?cWZEYmVTVm5EYlplWmEyamdkaE1yMHRadFU2SHZLOS92SWs1bnRzOGV5SkNL?=
 =?utf-8?B?MFJXYWs3TEFIZjZ0TUNBaHcvd1I2NCtOaDhLQk40a3grVTVTQjB6d1V1Q0h6?=
 =?utf-8?B?Q05jSldwbkhtTThHckZ0WnFyVXlTMmJQU21DOVV3aVRYeDN5dWFGby9mSU5j?=
 =?utf-8?B?Q0FoN0RDUVJEa3lvVU5PaWxaOGJvdGFicVM5d2xJMFpKMVFBN3doRmo1RTFv?=
 =?utf-8?B?ZWIraDVSYzFvdHJ1YjJ3bGgxUjNnUmsrQkJXS1Y2TmdwVVBtcjlsN2RXRHZJ?=
 =?utf-8?B?ZTJncEtlcUd2RGRLbXo3MVVELzQ2dUk3SnR3WXRuWnRVbVpTUXp5bkw3Qjd1?=
 =?utf-8?B?Wkl3Q3ZpZzdZNkx2VG9ocW1pSUwzaTAyNDkrOERXUjVGTWNwNHRNYk5VSmhC?=
 =?utf-8?B?NWNQMXAzbjNBMnkyYVd1Tk1JQ243Z2FtZHAvMDJHcGk3ZFpleWxmSWJ5SlFn?=
 =?utf-8?B?anBQWXNDVFZFb2FwbE5FS3NBTkhrdThIc3g3TjFIVWJvWXdYeTlERDVDVjk2?=
 =?utf-8?B?djdXbU9BSnZaUEFHRXU0T0RUKzRPSUdsZTQ2bG5kN01Xb0lWTmY1ZTFQb01F?=
 =?utf-8?B?M1JadG9zdGEydVV1dElRUUdOQmp4Rjc5WDgyL0g3YkJyNmhoNFpPa0hRSVNt?=
 =?utf-8?B?M01MaFdxbU9lallIYUdiVWQrVzJIVVZaNmdWYzZ2aUc4YWw0YVVWVE9jbWJW?=
 =?utf-8?B?M0h6MFlIbUhvYmc1YTNrTGx5anBuYUdQT2ZjUFVBVWh1a1NzWnhzL2Q1STY0?=
 =?utf-8?B?aUZKTHpPenY1MkZHQXFyZlJDZTZIUjc5YXhPMk1KNTl4bW9GVWJEaUl4dkNE?=
 =?utf-8?B?UHZ4RnMwSm5aR09ZRXd1YXVlWHd6TURvakQyQmRGM1NIOXYvV3BvOTlkRTNQ?=
 =?utf-8?B?UjBCRFVlSVppZi9RbjBhcHpCdzZYZG96VTUrdzdlMXEwYjM3Q0RHQnFqRGs3?=
 =?utf-8?B?MEVhd2F4c3JvRE5WU3hUcTU0Vjl1OWUzSjBaZmNJSTlHRWRTSXNxdk14L1dP?=
 =?utf-8?B?YUdQcmxwN1lmYzZLQWlmM1BXNHZCZ1ZDUXZab0ppb2RHVUxNOHd3WmlYeXIw?=
 =?utf-8?B?MGxlZ1FIRDNrN2NBR2swa3haVGVrT004Y211bXdQK2hZUEgwbnJHKzU1VG4y?=
 =?utf-8?B?a3V3V3EyVUlKUUJYa0NTUm9RMkNnNms5UnBpZ3BNWkZmZEZRREFFU0RrT290?=
 =?utf-8?B?bEU1UmR2YmM2UVdId21xOWFMMVp4VHJieVIwb2ZnU3B2ZmV0SjRQQmpyZ25P?=
 =?utf-8?B?bitrcGFyTWJvaTlmWWF6WVBlbjV3aW9TTFFhd20vYTZiNlNNcjNtYmZUOHky?=
 =?utf-8?B?eEdsVURsL0RBYU1rVnIrOUhzTVU2aVBJQjl5a296RTMwSE9LRUpPbmlTLysr?=
 =?utf-8?B?WDFtZ1dsbjFTWHMwakRJV2twc09adFlIODEvempMQU5uRXJUWFBBNVdLVWpG?=
 =?utf-8?B?OWpvaThnUHlmZytPTzRDRUFaT21IUElmS25DQUlRaThQVG9nUW9hcXpHTUJS?=
 =?utf-8?B?S3RjbUFFaUxJZGpUWlA0ciswL3A2cjJmTVRZLzJvU3AyQno2bGIwbituSTg5?=
 =?utf-8?B?UFc5NzVOeU9HS2xLU0s2dzN2cU1Wcm8xd1BjT0pvNlZJVDVlNVdLWmJlYm1C?=
 =?utf-8?B?U0haMkQ0blhoOHlSZVNUZENQeFUzTk12T3N2eWh6RWZkWXd4NjY2aDh1QTNw?=
 =?utf-8?B?U09tWHlEcU12WVVaTnh2WnpjTUxXRDVjN1VhMGgvREU0UE8rekJtTFNGQWNJ?=
 =?utf-8?B?RDF5a20wQTZmNkhxUXk2TkJsbS9oYnNicjR1Zjd6aTc3bE5odkdPLzdySFlo?=
 =?utf-8?B?WTRrTEpUQmJpanJHYU9CbzhCKzV6MmJFRFFRWlhkeGpjQ2dQQVU4SEp6bmV4?=
 =?utf-8?B?bHRoSlRBRDMwWldOZDVoN1hCU1dXYXI5U1FDOVY3TDZjQXZUbWNmUXp1aDV0?=
 =?utf-8?B?c3dmWmZHUGtUYW05WXZJVysrVzdiZlJUZ2V2eUZLOHRyMkxvYi8wRW5aNmdN?=
 =?utf-8?B?bEZQU0xkeFNvbkxjNDJtRGxGUkFkZzJxOXdkbUcrKzZRYThPT3Jvdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3307bfdf-f5ed-4f47-852c-08de916729ea
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 09:55:40.5599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7drn/Y4BPZPcB+f5BQ0otZxOG4YplTjO2gLw4kTkbRhTmyPzBY8d+dpYUYHY5h8FmNq438Vqku+hj/dal+TlUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9928

From: Peng Fan <peng.fan@nxp.com>

This reverts commit 39e4189d9d63a0b6fc15458ce0136e99ecdfb1b8.

The board uses SDHC VSELECT to automatically switch between 1.8v and
3.3v. It does not use GPIO to control the PMIC SD_VSEL signal.
The original commit intends to read back SD_VSEL value from GPIO,
but it is wrong. When MUX is configured as SDHC VSELECT, it is
impossible to read back the value from GPIO controller. Setting SION
could only enable the input path for the mux function. It could not
redirect the input to GPIO.

Fixes: 39e4189d9d63a ("arm64: dts: imx8mp-kontron: Add support for reading SD_VSEL signal")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
index bc1a261bb000ed0e8071d214111c12689bc394d0..ea69c639b30b8f7e05bb103074c6481d88560c53 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
@@ -311,7 +311,6 @@ reg_nvcc_sd: LDO5 {
 				regulator-name = "NVCC_SD (LDO5)";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <3300000>;
-				sd-vsel-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
 			};
 		};
 	};
@@ -815,7 +814,7 @@ MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d0 /* SDIO_A_D0 */
 			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d0 /* SDIO_A_D1 */
 			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d0 /* SDIO_A_D2 */
 			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d0 /* SDIO_A_D3 */
-			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x400001d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x1d0
 		>;
 	};
 
@@ -827,7 +826,7 @@ MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d4 /* SDIO_A_D0 */
 			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d4 /* SDIO_A_D1 */
 			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d4 /* SDIO_A_D2 */
 			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d4 /* SDIO_A_D3 */
-			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x400001d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x1d0
 		>;
 	};
 
@@ -839,7 +838,7 @@ MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d6 /* SDIO_A_D0 */
 			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d6 /* SDIO_A_D1 */
 			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d6 /* SDIO_A_D2 */
 			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d6 /* SDIO_A_D3 */
-			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x400001d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x1d0
 		>;
 	};
 

-- 
2.37.1

