Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013011.outbound.protection.outlook.com [52.101.72.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDCD299943
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 02:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772158400; cv=fail; b=ZRDA4nfqgkLBbWqy6uNyYO9418YAtHOVGsBbjvo7z7qUP5QE9gzXwZOZOwvDXeijbDhFsog4dlCAIVGjA/ceTWACvbHtE5N+k6tUfb9rdA8+eVLdW1CvgcWnlgq0x5OoURkh8v+ZznGO5hEeKtVsoU6BTs+mzmF9ZwHuLPcDKb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772158400; c=relaxed/simple;
	bh=WJ32ACtVEdxnkHpUhAviOYVaX48ns26+pW+biatc5H8=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=Lh0/VWXOZ65mUZkme8G67lXa96QYxIKCU3jVjyfotwyMQSmBf3sxLXRlwdWhxJdNTu9mI4pwINK0tp86faJ70GeR5CwrHi5eGdqI5jGkwG3X2LjEbZFyewXEL8tXs29mSuK+0iS3/HrJWTBdKflk1rc8WAHWNFGBBtBmJ+dZr5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NR9WpCWs; arc=fail smtp.client-ip=52.101.72.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NR9WpCWs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TXzW8tKKmPJPJ8gbweFusw4g4qJpwg4fb8cAClWypOWZzEgdWXoS0+yNf7LLruSG5UHw6rorYyZAbl9Z1v7FRdv99+A0iCAp9zV0nKUbJvfm6ZRK/twl3PiWaYtXSFaAl0DymFdkRBQfFeVKdNIdzZmojXGggCE665Mf5TWJdDuMyjD1C4no5I7OG4H1HnIAEWJ3GknTyzsQqKQfirMr0NaRJswTeQBaXUBv6kb+f5EOgKlvYhnlz4m8KUieMUOeSxHUkfA1rvThd9PPcXltfVzwxdWKvHxpkJl0nVpvtAYZCL6lLRuNohGioKF5L2AWrDl7wp5QOlg0gPwJBAL5uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CwiITggZZ3DUqFS5K7+93tSGkDxyKa00N7inDZKcGw=;
 b=spJ01SInL2hf1vz0/ziJXvBcE5uEBaPLM5A3SAmfyyCsxdHOvWCgAyK3/RX4wzHXVegGFUxzm/u8SdalFrkxANlkIGcsk9QHVse98msUV3kLe7KbJLUnOGKaMM6bwJUSgeR6Sv0fZnn4O0nbWyvm1xSYR2D2UfxtWY55akpL4SqqnCsftv2zIO86V/W8DzU/hVsb0LOgZPKkz1zM2L1sJlM5uIqT9/zzdWXvmR1k98tX2tlQ6MtWznUoZL3/k9xcjV6+mjLWtZ9RGRHwY7JlyaOWCvkbFrWpM2Nalf1EQtz4o7Rr3u5Ew7ZddoBozDdU+zkwg1/+eHSe2XcLn7h57g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CwiITggZZ3DUqFS5K7+93tSGkDxyKa00N7inDZKcGw=;
 b=NR9WpCWs8GZrJrGh3qaJYCTSSmuO7nhAA93EZTrQup2ewzCXLvKLWmUQvO2a2UX0onQOsrzmTQAF3cGt8uUvGRFTB85iFs6Shdr+NHdgxh5mA4QpEfZMwyInCSRIDVpW3rNaOOy4en1c4I9/9X3n9T7hiTbcEgmuvzFEt66Lg/Xyz7PS9dsO16DYzp+aIZ7ovPfUuWGu5vdYny/e+SkleRvr/YYMcrbx9FsQaGcYwqLFmh7WQtnzwGrHmUl5EWoyKU35ycUqvAOF1B97w3maZIQbHqi80Rdvz6hYsXVOzlsnwEKqz8hlWCDmYI3MXFLPvPIzlpvdl/x+e+lbSfHa2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA6PR04MB11807.eurprd04.prod.outlook.com (2603:10a6:102:522::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 02:13:15 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 02:13:15 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Fri, 27 Feb 2026 10:14:05 +0800
Subject: [PATCH v2] arm64: imx93-9x9-qsb: Add ontat,kd50g21-40nt-a1 panel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-imx93-9x9-qsb-dpi-panel-v2-1-51d7aa63847b@nxp.com>
X-B4-Tracking: v=1; b=H4sIAOz9oGkC/4WNQQ6CMBBFr0Jm7Zh2iBhceQ/DAqajTCKltobUE
 O5u5QIu30v++yskiSoJLtUKURZNOvsCdKiAx94/BNUVBjLUGKIGdcptjW1u8ZUGdEEx9F6eaJg
 ax9zzMJyhrEOUu+a9fOsKj5rec/zsR4v92f/NxaJFJyfL5Ehcba4+hyPPE3Tbtn0BfqGWj7wAA
 AA=
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Baluta <daniel.baluta@oss.nxp.com>, Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: SI1PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA6PR04MB11807:EE_
X-MS-Office365-Filtering-Correlation-Id: a9a5ad12-34fd-4e25-ea95-08de75a5c3d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	y2a9rCQxoNxq8v/F5ZqrNeZJr+KcivJAUkt1/Mm1AYW+MhU8b5v1Dmw8azh4gBo7ZdnaHX3G532A2DyLgOUBmSnOaX3h9LZDOcZJgxTHVsJRp46l5HugjYKpy4RWmromS41wEkK5XaXCPEP8Kk3qqf5O4AXCCQ7KuJN6Ynk4Hf5YoM7HS5pvYIaEjh84cjze9KkjqiC/S4mTMJRaod0HxY6SdCam6+gqHMurdRJthR1zOCJ3oyDS+EYZmGg4a7kZiH+50lRFI1EmZnGEu+t5iRWEnw3uswiR5Q8HezF4BD3P4gFPUm4yQUV8YO4gg1w3Oc1QSNDXh89sTcrdduqI6VaVgMepG/01WRoE0nVeTNb9a02Q+3VivKoJJHN52p7ycbwcd+GBmdxfLkYBRHIV4FCuO/UT3yqw27OPK96ce6gv7CwwoE23As8EBtHUFfgS5lqpjFE6RbkTQl+0YmK+bgsH4fPAkJxBdX0oA8jZLUqsruTWbyN+BAGiogOMyga2vBCNmXbEOScDrmxNkMx5c2mniatjwc/LDEPjmsNM00onHRcAfAcgALJ3HqHbgFqBi2KoSR/gx9hCG5kCE1f0ZHSBrRlXx6153/kbgHiT46ByYB/e2nb9t5s0jfRSAderDokrnPSchVw184nhmlxoMJd5rJx7xeHqV7sVONCBBc5VW+q2GpVR/AY+mca1mkiyC04vI5w7dIwitrpAdmQoVV9ne74qacgeGBhfmaEdrbOZQ4+GB9SouXRcAuCDr8QG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWtka0hvZ1hOTk5FR3M1YXpOZC93c0NLVHN2SGMyaXIrOHVnRmtFVXcxQngy?=
 =?utf-8?B?N0NnM2Q3RlJVU2dFVzZlcjVWSUNyMkxPckhCWituR3Z2NmZaZnhXcVQ0QmVI?=
 =?utf-8?B?MzQ0ZFJlckRkdzNpdm9peXFqWkFkYlJ5emhVbEVRSWg3ckRaSitxVDBEek5U?=
 =?utf-8?B?L2t5MGpXR1Vpb2VtZk96aVAwek1ZblhoczJmUFdIc2tLcjE0Y093Q2pmVkRq?=
 =?utf-8?B?TUU3WmNMWDZlZ3dmSDMzZWVqdngwdk0yYXJYN0J5ZUMxRTRtaFpHZFJZdU8x?=
 =?utf-8?B?a3ljOVpZaHFvRUxtbmsxVVdYdEg0WjhaalVIS243RmFCbTBhVUZQK1pzaGMr?=
 =?utf-8?B?cjkrbHRRSm5RVlJJWC9MYm8zQ1N0WmJ4L0JRVEJ2aXFwQzBua28vdlVmbThG?=
 =?utf-8?B?bnN2VVNSTVQ2STdKcThOTjR1YW51dU9RcloyR005YWZLU0RUdEJzZkFoZGpm?=
 =?utf-8?B?clpNclFFWHVPM3hGWTV0a2owTFpyc0FvdUhiSHBPK09YeThYaDdUK2lEaWMx?=
 =?utf-8?B?T3A2Y2lVTHAwUWRxWk8ra3l3djJjd2IrZStsUkxvTUtERTFaRTgvNnc5dWF0?=
 =?utf-8?B?c3d0Smc4ZTRqS3FiOE1RVExDYTUzSUNzRHVlbDZ2MlJEVlBMbFZYV0pwSmQx?=
 =?utf-8?B?NERsQTMrTFhrWGxDQUxJY2habDVoNThNanRFREQyMitnVWwxdWxaNE9xWUxm?=
 =?utf-8?B?Wm9mT3RoY3VMYllMbnlVSElNYjNGck80bW5FQUE4STd0MnlSVWVQUE9Fd1dm?=
 =?utf-8?B?SnR4ZzNqcEZYYjlGcFJNcmE0ZEZvYlBlb25XT3ZicnFoUmYxSEcrelZQRktR?=
 =?utf-8?B?TE9PaDgrNzh4NFlyc1V6ZDQwNjBRNXJFcHpybU5RVlJocUQ4dkhqNGNtWnJQ?=
 =?utf-8?B?VXV0ZlB0Z1lXaWNHcDA0YTZGTXgzYitnUUxVZ2d5dlYwVGZqV1A4eGpmc0U0?=
 =?utf-8?B?V1NiQ0lDQjZOcWdDRktlcnlqaE5SNThXRXlYMUFOZlNXYUFPQ2c2OVMrelF4?=
 =?utf-8?B?MU5MM1d0cEpGM3lwZ2RYeUxZcHNhY0kzd0lqaUdhOEMrOEYxT24wdkUrc3l5?=
 =?utf-8?B?SW85TExob08yMGY0MEJ3SHJNVWxlYXp6ZDBPMzVWdU4wZ0xqSENzakhzYjlJ?=
 =?utf-8?B?OENYSk9rQlVQbkg0Mzd3alllSWhQOFRtZXdybm55NUVkZG5LWHVuQ2VHSDZU?=
 =?utf-8?B?TFVpWlcxY2xFdSsrYXYrZzU2bnF3SWErNDB4WW5ZQ21ldEc2RDFQYWlnNmF5?=
 =?utf-8?B?RDRMSzZpNVlnc0FKdWxXZzdXV2tCSVJGQzhDbFc5ZHlFRTlhZjNQSmJiQTZl?=
 =?utf-8?B?KzF1R3ZZQ0wrWnpvUDl4VTVUWmxnbWlTNmkzazZJTCthTk1wN2dZMEJKakQw?=
 =?utf-8?B?L2VCMmtvVFFWUkJxb3oreTRuTzB3YTlyZ3lLKzd3SEVhdlNBbTRiMHdCT0Ix?=
 =?utf-8?B?N05KbjR3NVdvRkcrYmVZbW90NFQ5MHRERlYwYUNOL3Z5eWJjWm42c2NPL0hZ?=
 =?utf-8?B?Y3c3RzBVWnppYWcreVJ1S0JoMkh4VG9XN21tSHZhYkRxM1NCVTZBRElvalJ3?=
 =?utf-8?B?cjR4NnJnV3hHWnkxUW5KVzBEZitPV2VwYUlWenYrTTIyUzZEQWRWRzhiODJU?=
 =?utf-8?B?bXNoWU9QWkNZNWRDeWhob3dydnIvaHJCY0RiRDl5bXNMVUozYzJGWGx3c05I?=
 =?utf-8?B?TnZLdFFBS1BlOFFXTzFFSWp5TmRFek1DVG1UckF5bzc4ejZCNVcxNi8rTHdx?=
 =?utf-8?B?UEJUWkF3TTdDS2hnUHJDcVZWZGU1OVBmWCtQUUc5U0Q4YkpmVnlZT1BSd3Fv?=
 =?utf-8?B?a2JYVXBLLzU2aEdTbGJrczV6MmZKMkJHb3Y5WlllZUZBYTlPUWQvaTlwSGNI?=
 =?utf-8?B?RkxrSThxZndhZXdvajFHZURtRXB0OEs1WTlTU2VTSHpSVjdFNFBSYnBKZU15?=
 =?utf-8?B?NmNIVFRKRlduSFlBNnVqd3hKQXBpeTJmQUIzdU5OdkthbEZXOEp0ZmVBSVRE?=
 =?utf-8?B?NE1pd3hSaXVYTlBXNDlQaUwyOC9ZVmFoL2JNZ2wxU0ZlREkwRHVsMnplcDk2?=
 =?utf-8?B?cXBwa3JuWEpMRWFrTlc3SURxd0dGTjdTU2tlektvMXBSQ1JrdzY4OTY1RDMy?=
 =?utf-8?B?MUZmd3AxdnoxTFdsdmlENUNadTZqNmptMUN6RjdJcklZd3VEb3ZlVXkyRUMw?=
 =?utf-8?B?OFhxUXZReHBYK3dlcFV1aStOVDUrNjhWbmVTYkUyc25USGVZS3FjWjhjTnRr?=
 =?utf-8?B?MmZkVDdyN1NYMTRDeWxmdFRWSExHdWtnT3F0c29RU1FSUlowaGpkR1Z5cko1?=
 =?utf-8?B?OTBtWXJxakxPTUlzZEgzc1VKMCtnejlUOEo1US9yL0hGNmhpUFp4QT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a5ad12-34fd-4e25-ea95-08de75a5c3d9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 02:13:15.0403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Og6gIhQ4ezH+/Uylr+poIVQttYMP0/NUsdxOEUfw+t6u9a7eZ4do1KV4lffmNjNj5vJvMBbxYdObnJAiDcYhCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11807

Support ontat,kd50g21-40nt-a1 DPI panel on i.MX93 9x9 QSB.
The panel connects with the QSB board through Adafruit DPI Display
Kippah adapter board[1].

Link: https://learn.adafruit.com/adafruit-dpi-display-kippah-ttl-tft/downloads [1]
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Changes in v2:
- Add comment about specific pin conflicts between SAI3 and LCDIF.  (Daniel)
- Link to v1: https://lore.kernel.org/r/20260226-imx93-9x9-qsb-dpi-panel-v1-1-de51c2d2ed30@nxp.com
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtso       | 110 +++++++++++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 8837d7ec4f3e..23fac57d975f 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -412,8 +412,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
 
 imx93-9x9-qsb-can1-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-can1.dtbo
 imx93-9x9-qsb-i3c-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-i3c.dtbo
+imx93-9x9-qsb-ontat-kd50g21-40nt-a1-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-can1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtso b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtso
new file mode 100644
index 000000000000..d167c9fc3b8f
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtso
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx93-pinfunc.h"
+
+&{/} {
+	backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&pcal6524 2 GPIO_ACTIVE_HIGH>;
+	};
+
+	panel {
+		compatible = "ontat,kd50g21-40nt-a1";
+		backlight = <&backlight>;
+		power-supply = <&reg_rpi_3v3>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dpi_to_panel>;
+			};
+		};
+	};
+};
+
+&dpi_bridge {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lcdif>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			dpi_to_panel: endpoint {
+				remote-endpoint = <&panel_in>;
+				bus-width = <18>;
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_lcdif: lcdifgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO00__MEDIAMIX_DISP_CLK		0x31e
+			MX93_PAD_GPIO_IO01__MEDIAMIX_DISP_DE		0x31e
+			MX93_PAD_GPIO_IO02__MEDIAMIX_DISP_VSYNC		0x31e
+			MX93_PAD_GPIO_IO03__MEDIAMIX_DISP_HSYNC		0x31e
+			MX93_PAD_GPIO_IO04__MEDIAMIX_DISP_DATA00	0x31e
+			MX93_PAD_GPIO_IO05__MEDIAMIX_DISP_DATA01	0x31e
+			MX93_PAD_GPIO_IO06__MEDIAMIX_DISP_DATA02	0x31e
+			MX93_PAD_GPIO_IO07__MEDIAMIX_DISP_DATA03	0x31e
+			MX93_PAD_GPIO_IO08__MEDIAMIX_DISP_DATA04	0x31e
+			MX93_PAD_GPIO_IO09__MEDIAMIX_DISP_DATA05	0x31e
+			MX93_PAD_GPIO_IO10__MEDIAMIX_DISP_DATA06	0x31e
+			MX93_PAD_GPIO_IO11__MEDIAMIX_DISP_DATA07	0x31e
+			MX93_PAD_GPIO_IO12__MEDIAMIX_DISP_DATA08	0x31e
+			MX93_PAD_GPIO_IO13__MEDIAMIX_DISP_DATA09	0x31e
+			MX93_PAD_GPIO_IO14__MEDIAMIX_DISP_DATA10	0x31e
+			MX93_PAD_GPIO_IO15__MEDIAMIX_DISP_DATA11	0x31e
+			MX93_PAD_GPIO_IO16__MEDIAMIX_DISP_DATA12	0x31e
+			MX93_PAD_GPIO_IO17__MEDIAMIX_DISP_DATA13	0x31e
+			MX93_PAD_GPIO_IO18__MEDIAMIX_DISP_DATA14	0x31e
+			MX93_PAD_GPIO_IO19__MEDIAMIX_DISP_DATA15	0x31e
+			MX93_PAD_GPIO_IO20__MEDIAMIX_DISP_DATA16	0x31e
+			MX93_PAD_GPIO_IO21__MEDIAMIX_DISP_DATA17	0x31e
+		>;
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&media_blk_ctrl {
+	status = "okay";
+};
+
+&pcal6524 {
+	/*
+	 * exp-sel-hog has property 'output-low' while DT overlay doesn't
+	 * support /delete-property/. Both 'output-low' and 'output-high'
+	 * will exist under hog nodes if DT overlay file sets 'output-high'.
+	 * Workaround is to disable this hog and create new hog with
+	 * 'output-high'.
+	 */
+	exp-sel-hog {
+		status = "disabled";
+	};
+
+	exp-high-sel-hog {
+		gpio-hog;
+		gpios = <22 GPIO_ACTIVE_HIGH>;
+		output-high;
+	};
+};
+
+&sai3 {
+	/* disable due to GPIO12 and GPIO17~20 pin conflicts with LCDIF */
+	status = "disabled";
+};

---
base-commit: 877552aa875839314afad7154b5a561889e87ea9
change-id: 20260226-imx93-9x9-qsb-dpi-panel-0c26dccacbb7

Best regards,
-- 
Liu Ying <victor.liu@nxp.com>

