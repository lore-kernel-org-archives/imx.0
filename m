Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011015.outbound.protection.outlook.com [52.101.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92564480977
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 12:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118630; cv=fail; b=WBNn75f+0AzCYlXCTJfb9tsae7jluQNPnaq01QutwjkMEriRD0FcmVubU8pHSzRxVRZWD4yW6G8hQaykimOOTSsZXF80ECwYQxa2m2UvPhWjwcAyPt10TyWehsBgKCvfuTD3LLUJw1FlqnwJ1If7nYuPtHqqrudHjnZw9KQ1zEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118630; c=relaxed/simple;
	bh=sbreCOj1j99Vsrcf8m3AHZNT8C53mJkUUN356TvFBwE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RpJ6uTjt369VCoUZUFpKr77Mh7gbZuDfRJDUB4fAEdH64C9AGNJmRKGL1tpg0xVoZd1gC0jt2RHhY4hboDdFRRwXif10mPoXcnWsi/zH0hxQxK8j3wThuZAftg2ZWr255EQ+4WSSNixtNjp3xSui4dVQED7cNx9C6c0tCLsMn+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ppHDDm8v; arc=fail smtp.client-ip=52.101.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ppHDDm8v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVKToBu8uNELg2T96YiUZ4uiD6mT0FNbCeEJGNb+opIuriDSoNuELOUmlImTjxGz7kUxU3Y+FrVXQAU/vM+0KJBVSIpR7YJJFgng2dMaixK2//M1Oc6HTyEi0Trh35KQLguBUmJT+rtQE+5g7i/9KuH5G9VFfI1RiuuVvcCTlcsfLJrRBTdHEZKAyYofXJwlxbPZ04Tb728ElDZCB95/uhzXc1LdTx2mGgoidcMK+G/KO9xqjYGv8oG0WYOhj/l0jt3Z1p9heYk0OMOVuUCE+SzlcUObQALDXsLneM53u71DbO8NQB2kPkym1e8Q+SV3lxVOxGqvcEx5pajCIlp2Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jL+F/E+uwivP2AsFjYsZ627mA01c6NtbGU0SwjLmsHg=;
 b=qvTlyHQcXZ6kK9iXi8R1gFiso/P+mckxbBPbS00z4RGLBPyKChKusqg2WSjQi12QLTJncSKqYeATyKFnCNkl3XkyP9FiZ2YmN5oXWSHMhj6MXoB4C/Ns7C1VMhOoMRVlVsmnyJWcP0BcjEsDuKDK8U8WQvbmfz1GfhMYf+v4kNOcItWwuByJag/cKiEyAc53LvQrqS0M5sA8+tkRXUWiE6UdyFvzgdkYJQ0GrG0+My/qTjKnReN+Ue2XazI19BElw8fpu9FjW7S2pQ5vBNpZZzTj/hUZhk+cYWNuERlX0zssNFmYLTd4OgIVE5mPTJx7uDIMcZCAj0L47BKuBfpTaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jL+F/E+uwivP2AsFjYsZ627mA01c6NtbGU0SwjLmsHg=;
 b=ppHDDm8vWGmogxMoEg/30hsttENu8vyJM5BS+Ux10V5gXEkU+uKUH8lbeAwBYOWNB4L+j7OHKy8NFmtKok5dPIh6iLKlJuR06C2vATxMHEfSM2Q5Xv5aEILRF/OkJehI+zJVbRgs0rP4acUHwE3aqvSFt5txQj+znuepTF91Lp0tcikYjMPcNmcHRP+ThFlNpjKg+DTrOTCUSgMmrwzFQkFf1H+Or4WhoAT/Ko63WSthz7m06S283TcTjLsJ8ROV4uMXEWuroIjtJy4jz2t2b6JdMtdNxrmhXdZG80//E1n+ReDcfRagklHaD/rlfODXjeaQ+ggsalikK2N4MgNg7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS1PR04MB9684.eurprd04.prod.outlook.com (2603:10a6:20b:474::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 12:30:24 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 12:30:21 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Jul 2026 20:33:06 +0800
Subject: [PATCH 5/9] arm64: dts: imx8ulp-evk: Add gpio-keys node for power
 button
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx8ulp-dts-v1-5-19651358b599@nxp.com>
References: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
In-Reply-To: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI3PR03CA0006.apcprd03.prod.outlook.com
 (2603:1096:4:297::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS1PR04MB9684:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c592fa-5edb-4e20-a5ff-08dee26cd637
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|19092799006|366016|11063799006|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ZpQ53Fhs7K4YUFFEDm41qO1S0MEGv8UpUMf53KVXiySUqjsoZUf5xCorM5bKTwirZ+ZlM9ZNH9+iU/ERE4dl2VlYPGPTTZrBEyJscLQG6ElY/q4dGPbt3nhZWng4Gi2nklVpf+1Nd9ewGyWx/5fUfekTgJUuXaRKdfVJ6TQuEPCzPQLS1H9FmSha3ExqVC2FJm4rBzoSv1SXdTg3CS/6PTlXKjAT37ewiCNZglZGeXnxohmn7jIzOZpYU2s128ruE3idCzHrQo9L7XokG1OlIYZB/63Q8vw36uZEj4rjMuVxjAiggDV5v8SoNvwfNvua3OJ7PIU+6OTNjH+HrjceVRUOm9eHR4LWjlUZRll3MdGf34ZaEsFapyGc0sWNyx0ZN6DqKLxt8QkkxME8np1AsAsONPIOcvnrj6jNMSRzlGOO+afXUzCGCcHuy38n+Op96pyU5PztARgmWm995YYZ1UMHmSiU0RLa4AHokuMFkXa0OyBgqrJs0pGRpFLrNgcHmYLnpNiOkSkNUyGzaZr27Rebbw1WNEnHPDWC1Z1BgOhTrHGZCV6Tc0R8qeJ9tZNvB0KBkCYMDat5F0O53kp9sSbHpDIXdOGODSAFnLdROcQYWphnKF8ypnY3mCy3jPkkuuH/OlB+A4gRGS+AQlIdT3DY8UAq1FYBpXoZFpUYzj8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(19092799006)(366016)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEw3QVRtRlFJbjFoZFN2YVdlODQ4eUxjenB1cG40QmJWR25iMVo3U0c3SzRK?=
 =?utf-8?B?Y3cwRjg3N1JTZEFxME5JRkNKZU9XZFB5ZW5oajkyMnJSb2c1UkdodzA1Tzh5?=
 =?utf-8?B?YmxKclVrbUNHTmlOcHRrVzFhVjNPekNYR1YydHByZ29FMHhzd0tGVXBwNGh3?=
 =?utf-8?B?SFJlRVBuNWhvMS9vTHdXK1pNOFZTTGRDVlZtc1ZVK21XVjRjU2QxQ3ZPNEVs?=
 =?utf-8?B?YmNnL3BGNjRRYndNU1prVkNMMTFQMUR3VEgyOVJHVHlxOVFKVmhXeUpxV0s4?=
 =?utf-8?B?aXJZMlU1ck1oampKQzA4OG4yb0c2MFdwZHlPUXlSY2VQNFZjK0ttUWk5QzFJ?=
 =?utf-8?B?NXI2aXBQN2MyMCtneG1IMDNWeEdmd2x6REwydWFkUVIvWVpCK1FuVmt6T2N6?=
 =?utf-8?B?U1B0V3BlZVQrSXVyZi9Sbkxac05CUXRmdUNnNHRZRU1YOHptR1g0cnVQQnV0?=
 =?utf-8?B?WC9YbzJKejBuRkxFUkRpdTMwekd1MkEzaDhodCtYM09vRFREaVNETzlVVE1h?=
 =?utf-8?B?TDIyZ2JpQU81aUNyN29kVlZXV2hCMjJhQmRqejhvVjNMQjg1RGowcDdqanpW?=
 =?utf-8?B?S05FWjY2VENzZ1dyOEdxaTVNYTNMTE1wNVVYMys2NVV2ZDNrNzJZbmpVeFE1?=
 =?utf-8?B?MWhqdytoZG9GcktEMnhvN2pHcVNKa0F3ZWpNTllZT1IyMGRRc2lxRndlaTlu?=
 =?utf-8?B?SHZnYkFYK1FnNHhWTUs2emZ5M0pIdWZzY0VkUWVhcTJaSFhneUpndU9hZ2Vo?=
 =?utf-8?B?ekZJc3JSQXcrSC9YdFQ1d29wQVJCaUI1MHQrcDJVS3o4MzkzOFhrQlFpWWsx?=
 =?utf-8?B?TVdFdWV2Qk00YjNsemIyUVdLQjZSa0ZCLzJjei9OczgzSk5mRFh0WjNSUGgx?=
 =?utf-8?B?MkpuRkNRbndaOU9ZRnhtN1dnd2ZwUVdMbEp0RU1kQzVzU2RkMWVadTJXaGEr?=
 =?utf-8?B?emFHR0p4RVA0SnRmN04xbXh3Mk0rNzJGemhqK0hMWERuV3grMFFqaWQrRE5p?=
 =?utf-8?B?T0tVeHJxTVA3MlRHM3cweXZKOUVhVHhwcmdQSTdXWjluZ3B5b09xUmlaaVRr?=
 =?utf-8?B?NjR1NTFXNmtLd1I0TjFHVVFjaUhJRU9zNTcrc0NJQlhabFhQZnFtODczOHpF?=
 =?utf-8?B?QUFtbE9HR0M0d1J6OGhrT3lZbFZnT3VGUng4MjF6dlFLQ2VjbmlVTER1SnRs?=
 =?utf-8?B?VlRxeVZwMDJYTzVrWEtjb1d6NUhTbFQ2U3Eyd2hBbnBjclVDY3NyZUE5cCtH?=
 =?utf-8?B?aXRhRDFjUlhqSG1jTlp5QjBIM2JmOUFKbzlrUXNycEdsZytQVXV5bUJ6Tlps?=
 =?utf-8?B?eFZzb05YWko4WXNrRS9OZHdZR0FKY1F5OGhCTE5OYlVXYldaR004eUdoM1d5?=
 =?utf-8?B?cU9aV2NyLzJQSDFXQ0crSHd2RkNmdkltZ2JPZEJBejJGNml1WjFtYnp1VFZu?=
 =?utf-8?B?MjZaMWhYQVh4R1gycityTnlTTy9OdWJzQllOaFppTzdGb3gxbUs1VzlDUFpW?=
 =?utf-8?B?WWxYdGg0NkpSS1hBTkFsUXkwcWFhQmJvcFcyRTZOMnFFbjdYc1VYUkZNZmpR?=
 =?utf-8?B?S3NUUW5XOFEycWkzSXJGYjQwSXlmeDFPblVoMDdmMnh6c1ZNVkZpeDAvSy8w?=
 =?utf-8?B?L1VBSDhIY1B4ajNIMGlIQThmRGd1T2NZYUZ2TVZEcHBxQVU4UmhUR2pMYkRF?=
 =?utf-8?B?NTI4REZKdjZMMmNtMDlHZXJiOEZYZVZ6eUFmTUJIeG9oOURMZUF5V2grN1Ba?=
 =?utf-8?B?WndxVTZzNnhZWGcwZkNTNkJoQnA0RVJ0ZlprejR1bFBIQ3pKcUE2cXQwWHZn?=
 =?utf-8?B?WmxTSEJQcW90VTRLa2c5NytVMkVpdXRLTUQyVzFXMTVNWWtmU0ptUkpCd2Y2?=
 =?utf-8?B?aUNOTzZlR09wOEZVKzQ3NWs4MUx5K05YOFphQWJ5VVN6b1YxWUZyTG5pV09p?=
 =?utf-8?B?dkdnazVNdFhPWU1Xc0FicEgwU1hZZk44ZVJYMkxucmp4QVJvTDNMRC9MUTQr?=
 =?utf-8?B?dElFSTM2dmRUOUxzSXljTm42aTZMc3Y5N0xmNUFubkdyTndNSS9GekptQ3RW?=
 =?utf-8?B?ekpVcTFhTUxZdXMxSW03L0kzSFJSWEM2NlpxWDNLUHR4Z2JENzJpQzdTNUdU?=
 =?utf-8?B?YUZITWZLb0x2L2NLT0FnYVlicktkaFh1dkF2UkVqTGZRRC9pdWdiU3l1ZHAx?=
 =?utf-8?B?NlZHSlZEYnRmRWk5eHNhVzNTK1E4WGRUd1JObEN0L1FhK1RBY21pK2lXOU5G?=
 =?utf-8?B?TnZnRkZNRHpjWW5LZXV0Uk5xMDRwNFBlV1AxQVp3b0xEbXlQU1lhU05ZL2NL?=
 =?utf-8?B?bmcwU0UwRVIwWHlrQTZRTXk2VWJmOVU3QzlVZitheVFGSFJneUJGS3AwSHN2?=
 =?utf-8?Q?+k7olDa0vumompk0azPH8nKurkCGvEWbuJIJo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c592fa-5edb-4e20-a5ff-08dee26cd637
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:30:21.2539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NKClqATjeuB9PNsG6jDHhyEmOkFFnv3NNdvPnLRed01GkNG+5YvHlz6heFyoSBFfFIHwMcAAkmC+k9ucXTbNIxOOHu4+YlLJ7Qc9+UucaRCfoHwFf0j/YvLBYd9Ig5Rq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9684

From: Peng Fan <peng.fan@nxp.com>

Add a gpio-keys node for the power-on button, report it as KEY_POWER to
user space.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts     | 19 +++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
index 5497e3d78136f..af8f0d6087f71 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
@@ -10,6 +10,18 @@
 / {
 	model = "NXP i.MX8ULP EVK9";
 	compatible = "fsl,imx8ulp-9x9-evk", "fsl,imx8ulp";
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_keys>;
+
+		button-power-on {
+			label = "PowerOn";
+			gpios = <&gpiof 11 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+		};
+	};
 };
 
 &btcpu {
@@ -43,6 +55,12 @@ MX8ULP_PAD_PTF10__ENET0_1588_CLKIN      0x43
 	>;
 };
 
+&pinctrl_gpio_keys {
+	fsl,pins = <
+		MX8ULP_PAD_PTF11__PTF11		0x3
+	>;
+};
+
 &pinctrl_usb1 {
 	fsl,pins = <
 		MX8ULP_PAD_PTE16__USB0_ID		0x10003
diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 5dea66c1e7aa0..6a92c5ca9a412 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/input/input.h>
 #include "imx8ulp.dtsi"
 
 / {
@@ -20,6 +21,18 @@ chosen {
 		stdout-path = &lpuart5;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_keys>;
+
+		button-power-on {
+			label = "PowerOn";
+			gpios = <&gpiof 31 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+		};
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0 0x80000000>;
@@ -323,6 +336,12 @@ MX8ULP_PAD_PTD22__FLEXSPI2_A_DATA4	0x42
 		>;
 	};
 
+	pinctrl_gpio_keys: gpiokeysgrp {
+		fsl,pins = <
+			MX8ULP_PAD_PTF31__PTF31		0x3
+		>;
+	};
+
 	pinctrl_lpuart5: lpuart5grp {
 		fsl,pins = <
 			MX8ULP_PAD_PTF14__LPUART5_TX	0x3

-- 
2.34.1

