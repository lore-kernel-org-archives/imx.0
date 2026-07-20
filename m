Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010027.outbound.protection.outlook.com [52.101.84.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684E1429803
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 14:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556535; cv=fail; b=mu6Cognz6eO3lMW+l0X1K28lrXO02ksrnkE+FI42Q6g3W5whWX3io82Ak7UtsHHDETFYoaO8oouKyl591pv7B6DP0aa1iGEmi+crto5B0kRnaISSkeC6Jgja11Bm/u2Do0rcJLkEL/SLplt4dkVKUXnzxPrqbDc8xXV/CGAZbTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556535; c=relaxed/simple;
	bh=yzgsCSecoN/XwCP+NLfJj8ze0FiO4Jteu/Mjkc2KvK8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=EZq+YhA906vkiWnLatDtm46wDp8b88+aLb8OR8A8s5w3HIq7flDHbA9+HXTfGtkZ92GQ9ql3S6WWYBOMtNjPeDky/NUeH156Ki3Rm6IHFqjzZHHJOCAYCBT3mnFaMXMVbRJ7vQoWg9nwtYgGvI7QUG3gbD5geG7+cd1l1kZpppU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MMPporT2; arc=fail smtp.client-ip=52.101.84.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MMPporT2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r3jTB5rMwtuc/gZFe+kJXnuC9u9+wcccjpGKpy0IuG5zCduWxy2vlimv20Ms3lVAYAHhigMmJSAR4Vmp3mmBaiBFhJLq6Cx8434cPv6EvM1NDyJNaVPGngUe+lm669/KTMJPOYOatnLiQqx54gMcuDLpwDlba+LchqUWkGKazWNbmFYx9nYdqHCWsU97y7558QqwLJdbq1in9xjmunGXXcOMHGO7sv7zN6pOi/ICW3g7q6hkShn9U+dvSDRoua69XvWM4pdLrwbpVbVWb1IwMa0EI4RO/qK3xkpm7jq7MpddxHR177RmkUBIvXWhr/kya7fxnm79TFci/hNChCWBHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bnk55pUPlTwcHNORNqQ3WL5pBixBjqhc7eNTBx5iesE=;
 b=qWVmjKnhNTGFD+XHJMcO/u3dADEbhQwDOItjCEcqYCXPa0mhvhU4hZIAe0lL44Ys6DvMdgrxQZyl0lW8N8D4DsPEoNABHHXMWc5x3J2Q+bntXzExIG2TRbNRqBsI8cyQPVKtKDqGo1tlPObbLfxiOHGZJZpWT7YWidv++WMG5uqaMM1ZjrDi3XgkebiPzDwTuJRQg01NcZhNRaeb+FIm1D1D3gWyblY7ml/JxCC6HqAlYWeu9dHootuf9iB9GzSi4ENayS4aXNvpitWTTMxz9a3N2JQ5UujmHgqBru3viujKBwMj1TaGCNBy/twX4/FgWPpDrNEvFc9pYCqSSBzJXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnk55pUPlTwcHNORNqQ3WL5pBixBjqhc7eNTBx5iesE=;
 b=MMPporT2AsONa+P0A1uZ6eTAP2O/wBYYHrd3+a/GOjsKAKRU5+f4t+LSh9I4zXyUOAhYB0PXSoD1zwY5mRO2GfkLwDmyepiNTQb63NnMuZPag4V6Xw1CpeZoNxucOHkoAmajbjOS4N2iWEYAelaLfMUZ4hGskIL0gRMlVXOGcKDfMosbeb6cFufLYYdGnuV1Az6ruXXCUNm7x6/IWURz3xDEoHh5sQICcbyRx3Nh7MXjBRpiIiK58xVzPf3Q9fGkiqu+ZeKW5tKGbV3/S82ZR3ZbAm/kKwpojrysbYKiNrBqSuS0Uj1UZrihXTChJ4Di+voVU2rLYjzRbdgZyUrgdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS4PR04MB9412.eurprd04.prod.outlook.com (2603:10a6:20b:4eb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 14:08:52 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 14:08:51 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 20 Jul 2026 22:12:10 +0800
Subject: [PATCH v2 2/9] arm64: dts: imx8ulp: Add I3C2 controller node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-imx8ulp-dts-v2-2-d05c67676f53@nxp.com>
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
X-ClientProxiedBy: SI1PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS4PR04MB9412:EE_
X-MS-Office365-Filtering-Correlation-Id: 80b305b4-78cf-4bff-51b6-08dee6686d41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|19092799006|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	8NegWlLpDXx7CHvfeWIlBbAOCVYmWFdKBxdBHH4MezlSdhXsO3GnKsVdhso6drECI49grcy6NJG/unC7whjR42CW1F9M/WSssR1nOfK+N3mQa2/SG0ueGvnqjzSITasLPGvGlKoop2BvTve1oybq0tFi9lJJXrJTVdj3LKGOMtczXQJHhCyR/SxkLNEmqjIoTfyXsx9xgu81QlJPJVyPQKd/cjZIJDLk0k1Vzib+bC+K4QxmbRObc58vQYvFBiV73iC9FRQdfFvhmFlvsp3sfD1jiwI0xqeKfM8b3p+BQqPjRkd4JSlobZ2ry4/kxQ7xDnsuXc9WlJ7obkQhz+vxb2ADdaJdvh3l7S/axA2Zy3K/+Z2fszMYYxzhP3emeG/Vvy7Oh+hjS4OK/ktTv/WaXp3FbWRk+CtF6rsrd86BnHarjN5Vv8rdb3uoUmEbbr66w0Jqg/swpivJMoMvnVHqn/AEIcHSC7Jo8uLL5pKjJz0sGP9nBk1Qc9dTSlPJisQp2Hi5rCKskJSLCqwKMLDh7ClA3AoHuU/t3I6r8WfTWh0qNNe78nsU90f6oKT3QVTLIM8YRgw5qZYqDjsxwdC6x51atACUpCGtEbKQgL1lZAFDVDuc5hecx7zoF9XGaHu+EFMWGdlURWaSuZn6KnH2vc7MLKAPsktZVbfARDlLPy0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(19092799006)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3hUWFNCWCtaclBJUm4xb01yUC9GbEJKSzFXWWR3bzhockJGNjdRWjR5eStS?=
 =?utf-8?B?cXF3SHZvUVFQZXhQOUpYaDR6dVhaQTRiVnMxWXNRYVZ6N21pc0l3bjBDNm4x?=
 =?utf-8?B?emlsNGg1dEFlZXVlUHIxR3JrM0hpZEVwZTRzTkVxbk5nUUpXUDBWeWZyelkx?=
 =?utf-8?B?amdNNit0V2wyV25XcTc1WDJOY1N5dHhkV2gwTXQxcUM5ZmorRjNjeUNaRUpr?=
 =?utf-8?B?SVhEeUtJTFlDYjZSQ1dObTNtY2IwdUNrM1NNNG9BdE5JaGtDaGdkQkJPOFF1?=
 =?utf-8?B?akdOR3ZjVEk0TWtVMEUzMVhCWC9pS0dlbzRPOWZBdXdHNzVQM2hiSXR3OElD?=
 =?utf-8?B?OHJybWJxR1BQRUNDWEdHTG5KYitndTZ6OXhpV2diNWZUQTlLcTRIS0VaVHdC?=
 =?utf-8?B?SzVxall6UnhMejhIRXp3TUF5R0kzQTMwRG5ZaFN4QjFueUJVS200NUgvdGpL?=
 =?utf-8?B?blp4RlhJQlViU0o2dkQ4dzdqRituWHBtaEpvMlArNEF6bEVNWkdmWGxwdGhk?=
 =?utf-8?B?WTd1RGlmMURrdHV0c1hRVUlSYkIwVlFaek5JVjZDRnJtS3pMdEdrcWZGQlRR?=
 =?utf-8?B?MFhpZUh6a01nZkRQOUtyc1cyRUVUR2VydjFsZGFkeTZ4elZtNENPbDhEV2tT?=
 =?utf-8?B?cjJPUHpLMVNEbW1xYjZ3K0lxWVR0dWdtUmpUeFNmbndacTdIUW1YNFBSazFp?=
 =?utf-8?B?RnZFWElvOVA3RmpSN1lhektxemtNSzJSNkZIYW0yN3Eyc2FMQ2Z1eXFoRk1D?=
 =?utf-8?B?Mno0SUViVis2OFl5N25oSUlSUDZqUHRzT25NVXI3MEU0VWRnYWYxSi9qSkUy?=
 =?utf-8?B?TzRDUWppK1pSNEFyaWFzTWgzVVBNWnJGSE01YUZ3NTF3T0oxTnhQRElrOFpC?=
 =?utf-8?B?OUhEVFhIVUVSRWdHaVhFTzUza1o1d2FXTXdhNFMrQjdJMXNFL3I0Uk5Cd0xU?=
 =?utf-8?B?R291RUk4L24vMFJ0L0tTVWwvZ0VaNnRXSEo0WEZhN29QZUYwQlg5QVpnNEx1?=
 =?utf-8?B?M3YxTXVlMmdxYUdaTzM3OW9aWFIwTnNSQlpNK2JyWkk0UDJjb0taZ0lLb2xM?=
 =?utf-8?B?YnZIR0JOVkN0dkI5Q2d4SndaWXVmWkNzK0hPR0VOOTgyWkVIY3h6cmhLM1VN?=
 =?utf-8?B?aTl3MkNYeFl3T0dNREQ5MVN2Y0Q1NVhOMFFXODk3RnV6VDZrQzNENW91b2k5?=
 =?utf-8?B?K2M2WEZ6MWxWRHVjenBpbk0zQ3hkNG9udDFTQ2JTQnBWVG5kTkkxaFVGN1lB?=
 =?utf-8?B?d0M5bnBUSmVVME1DMEhLRUlUUE05YVEyQUk1NFUwdWxaRkhSSHRjeHpPRmZj?=
 =?utf-8?B?NE5SK0lQTXpUWXJ1dll4YXY2ZlhKUVh5NHgwSjZKV29JN2svelNISVZYR1Ur?=
 =?utf-8?B?YkpMWUcwQWZla0dwUkh3VzdFcW9kZEZzeGhnTmN4NTNoS3p5Wk5aYWVTRHdO?=
 =?utf-8?B?TVN3U2FiRHJMSDJhNFBkOWc2NkxVNFlRUGxJWjFRbjBlRWFWRWZCWWlvZnpk?=
 =?utf-8?B?VEZ4WnpEQitzR2hzclFpcTRQcVhRNnpUbVczQW9NSHU1d09LRVU0aWg0UExH?=
 =?utf-8?B?QTR1MjBheC95V0U0RlkyU0xFdjZUckJJdGJ3Wm5pai9HeEtxVFIzZjZVUTlJ?=
 =?utf-8?B?TmVKbWxZUm92TUFDc1g0cjEvYlN3bnh6VGlIc0QxdnFJenRyZ0pnTEVrTTdr?=
 =?utf-8?B?VXZ4d1pNaC9xelNnbzVFRGlqTzJ1Ti90ckFYay9pbnRwc014WkFoSUpnS0Jw?=
 =?utf-8?B?SVdQU2RuUjQ3K1k3ejkrazFJVTJaZmx4M2VRenNIbkpySGdzeVpEMTMwUVBs?=
 =?utf-8?B?MEJ4R3VNd3cxWDh2bndoc3RZbjZnQmZOQlZDb1FRd3ZIOVBwNXJoOGtaZmI2?=
 =?utf-8?B?bWZUbEJBRWVZdkxrcHp6MkhyaEtIVVVGNGZScndTUkw4R3ZCcWJqSkU1anJK?=
 =?utf-8?B?ZkNnOUdBcjBjUjlKWldURTkxREhqRHJacHFVMU5za2xNdks2T2JJaXUvSCtz?=
 =?utf-8?B?V1hxUzRIUTNuc3cvTHk3dEpJL2plY2lpcWpqNVMwRWxkOWxETVI0aWVMNGJR?=
 =?utf-8?B?S1REVGtkNm9WU3BsVThacUY1L2J6NUFxcVUzbmJrQlBhT0VHNEUwSHN2d290?=
 =?utf-8?B?UUJBdjZYWnFrcnNVMlk5VGhpYmNlQWwwaTdjWjVhNmdYcTlKL2dEY0dJM0F6?=
 =?utf-8?B?d1NIREhNOXZVdVVHVzNqRE5FK25CWVVRcklHdUpMSjZlejNUVVpuQU51aTh1?=
 =?utf-8?B?TEpSYVd0Uno3UkJrS2dzY0JlcHlnaFgzUzQySkdvNWN5N3c4enpzNDJjaitT?=
 =?utf-8?B?TGJ2cUNRbG5DaGZBdTJVa0RLL2tCNEMvQXovTSt3YnBhV0JpbWlVVG9OaTN0?=
 =?utf-8?Q?ZWkL/RYn3onAqfOIT/t59oFHHDh62BP7OzZP5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b305b4-78cf-4bff-51b6-08dee6686d41
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 14:08:51.8531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GvkH62s2gyg03Vyyehwzf7bppJBrwokVoLiKUlD1zGt4NB/01GeelrVjzIeIxh+YJB65iCAeevls/UJsaolP+tEl0KszCUxxk9LDe6P0fT3JV+LW8DK00G2UVAbDRYyz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9412

From: Peng Fan <peng.fan@nxp.com>

Add the I3C2 (i3c-master@29360000) node to the imx8ulp device tree using
the Silvaco I3C master IP. Configure PCC3-gated clock with SOSC DIV2 as
parent at 24 MHz for pclk and fast_clk. slow_clk uses a dummy clock.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 1ab4ab270dc2d..cb0d73327d86c 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -361,6 +361,22 @@ tpm5: tpm@29340000 {
 				status = "disabled";
 			};
 
+			i3c2: i3c@29360000 {
+				compatible = "silvaco,i3c-master-v1";
+				reg = <0x29360000 0x10000>;
+				interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <3>;
+				#size-cells = <0>;
+				clocks = <&pcc3 IMX8ULP_CLK_I3C2>,
+					 <&pcc3 IMX8ULP_CLK_I3C2>,
+					 <&cgc1 IMX8ULP_CLK_DUMMY>;
+				clock-names = "pclk", "fast_clk", "slow_clk";
+				assigned-clocks = <&pcc3 IMX8ULP_CLK_I3C2>;
+				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_SOSC_DIV2>;
+				assigned-clock-rates = <24000000>;
+				status = "disabled";
+			};
+
 			lpi2c4: i2c@29370000 {
 				compatible = "fsl,imx8ulp-lpi2c", "fsl,imx7ulp-lpi2c";
 				reg = <0x29370000 0x10000>;

-- 
2.34.1

