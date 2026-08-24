Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010009.outbound.protection.outlook.com [52.101.84.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394C237C922
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 17:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787592849; cv=fail; b=hsAYYiIiiuZyx4c0t80tGEo6c/s775ZEOKxdjT7ib92p7U9VgV/seuOwmgGaKR4PvI0KJ5WiFu/YoD7JTO2YYoigdcOdzvWlfee9bCUKh7SmA205Tk9xw/dY16c3Kna9rLSw9X73EF27mnKbD7K3GpTyVy7r9CfXwc+ZuomzB9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787592849; c=relaxed/simple;
	bh=oZQvScyA1zqJV4CC6foAQh/CAQe4pGeAga38F8pulH4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lzNXBaQHRPTmzea+5AV7hX2U+jd91lMWEQpnm0PocV603fk5DvTim95664nDaM4anxhxCVNCvB1cCxqRlhGiFh6Fwfbcntde797sOcmxKjZSlDMAAZyELq6rTeP8hJP5hCsN86Y5jiTFgjV2yRewGD1SeYKGnPV1+Ybvjp7Ydsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IMpuut9w; arc=fail smtp.client-ip=52.101.84.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IMpuut9w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPEP/vok6js2AjPTCof2TJlkExrFHwpvYy0MGpIMuoquZ3XtMYfvV9DNUDiSEHiIdhp/ASE02Z6xCvchhHtNeruM/qTY+J2sgbpebC7z7tVgvHV0gYQsLSv6iNmLBDfUVT+gdePLTxS3ifKPe2bH7xvnCjeoADxPpzdOdCOMgSQnvyWif6VdyQm3kxZsY7nlh9ecjK2P4lJmwSnMtYpmVp3cWAd+2/nX9A4U+83E3pco7A2U7s0+i2XUSMykDptQ83ndOXOM6+hAsdguIMzTYkyiYUYYI4OZrWY83yf9O2E/aicf0F0fjo0tUo08gQVYksa5KHO2nceHB3xt7kBeMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/T28Dv7KzFFE9nxv/81pMJDpMBM2QOQ+wFzcBBIp92M=;
 b=tR+vCr4Xr37zJ9x40Wr9coXSRaMcav41/hS7h1hlXVGZTMT7esM2ZKVacZ7sYBuVwIbDBkwlSJA+gJDyNxthQ1tg+f+8onfoNn9+SqS+L0zZKIRgdWgWcYg48IRt153NfFFYq1tbFOkY82mPx5HZm+2aKfyTjCzPol3QiA6qQqDfoPmNBbChMMO68NBfziMf8rbbUm5tr4CCJN6ElrSyrG02ZwSrPo97dl2sxazpSG7jDVmlcrQyUY0g3qmGuFd3uPyV9LLi9fDLCuhXMcwttBnZQa9YJGXl7KBJbgdn8h1ZYIel6tuNtHdt8ezG8fUcUD/l0bP3MDHJgK2c9fy7AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/T28Dv7KzFFE9nxv/81pMJDpMBM2QOQ+wFzcBBIp92M=;
 b=IMpuut9woctTsjpkF3nOivk6CWe/DaKo4g7plU82H48lUjxNcxjKotE5LFT4uPBs+AvLPYoI2Ig64OnmJ/I3OyDeV8Lsu1NuEV7wKW+3fbKR2+B+eXUf8RIrRLphlAA+q8oE9S5AKZjm7sRQq/a19GKApcyRs9RPM6ed/5n5ZvFwtimEyZqe3pLRJXdoDQSOZ8GtRA8K4qtT4mWU0qN394gOZHRHieEVY7OODDIcgG6Zqr04dJJVoMuv0plXYp4IN0KP6MPoSH45Y8EyiGLH8DSSpfxWvgECtJAMNEORNCKAjpIiTy9RPPyTC4XR/zRX+ofZrfKeuZl362a8dVBrfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AMBPR04MB084187.eurprd04.prod.outlook.com (2603:10a6:20b:7de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 17:33:53 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 17:33:53 +0000
From: pankaj.gupta@oss.nxp.com
Date: Tue, 25 Aug 2026 04:33:39 +0530
Subject: [PATCH v42 7/7] arm64: dts: imx8ulp: add reserved memory for
 EdgeLock Enclave
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-imx-se-if-v42-7-2e8efac0bb16@nxp.com>
References: <20260825-imx-se-if-v42-0-2e8efac0bb16@nxp.com>
In-Reply-To: <20260825-imx-se-if-v42-0-2e8efac0bb16@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787612614; l=2461;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=8LTJ7dQk+ZmHVQUVQ7z2QFEU98qQ6ZendsUWTwEehrU=;
 b=wyq5LGV+FjoHNy0SwUUYh91hq/iXLuo4lYPGRP17ay4kDfEI8vhOvRqFmMe76R830UxHBH5Y4
 TSmlN0oUY/pDJaSlrkPhIFUY5Uth+QNtL0BN1zflSvRi/w6UtkiqZAR
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI2P153CA0012.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::15) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AMBPR04MB084187:EE_
X-MS-Office365-Filtering-Correlation-Id: d8617227-93e4-425b-338a-08df0205de1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|23010399003|366016|921020|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WdqBQAvq1KLZMj7nw/8XuOLa0exZ9JVaTwt12RkPZHduSKunV8DuN9VdL0lX0p+7XeZZjo7/idwJ/KufupwmVrVbAcSBSHPMVzKkHEhOGNxnTHkLxSBLB86Pd+bPmaj0bn11sRZSKLlerfvp8saQYzR7byEOs/UaM/sl5KHFjbJ5QEFaoWc5aQmybHrTd6jFRXPwYzlANiQ651gucd9S/6Ywnwqp2jgOenwxThNF4jGQTpYdsOMqM/NOlrowEFm+WhF9AAjLVltVftbBmrsh20IUpTtqu3YhOQXeS4kw+GQ5jND9rA0w37/+1qD5g50SxwBG6aFEZwSCwKAZoTJxYqiamrrnpFD0Bq32ZgpHzRDEDsgB2QAPZaYGLCxDL6FlUyUfskXqOVxCJ3cQO8bo6seqeRtuvcs2pGAlhL1iQpmVGxo2y+qqDZEucOzCuJy2K5mDvGMvOgm69/brGXhcfpPuZ6ZGressqi+Ltc+ZW7UPhvswsOQpwgxBgcy6xPowMLh9r115Rw+Jn2NL4qplj54pn2wOuYeUUxmy/lLzx7F4IrC0njPEjBe0lMC0uKy/G3AutF6aeMvOCn56Z2tBPGKgaZVJDUK0oGpeapIMjFVWpwm3gNeWYtQIMgi9Ab18umjVBtdU60mcGEDs4syn5P11GJImRkbxHbhIb2SyPzQ8jT6X3ZYPUQ3FnEgh3DUzOg7BjUOu/eqpndzicCqKSQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(23010399003)(366016)(921020)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1QxN1JJcVg0WmJuYTdyeUwxWHNtY1NFS3JhMEoySW42dU1xT0k5cFdsNlY4?=
 =?utf-8?B?Qit1cnJnV3IzNC9rTjM5VDdtZ0RPWmJYZGRpYjdvMlRoY1dYK0NlSlVBTU9O?=
 =?utf-8?B?MnVmUmg3NTBucVlqRE5ZME5NR0ZpWU1OdDF0R2l1TmVMbWtiaEx3OVZiR2Z4?=
 =?utf-8?B?dzFQMEtCZnN2c0k4TWdTalpSejgxdVE2TWNlU1JrRjFrelR2L3pMV1VESm9N?=
 =?utf-8?B?VU1yemtkSnROajU1elVRd05GbURvMVd2Q1c0NmRkOHJqc0dKRExjNkVIelhO?=
 =?utf-8?B?cU9iTG1zTksyNDRJYUZoUHhpdVNNZWlRRGdoT2RSQjgxLzBLYXNtSk9oelRh?=
 =?utf-8?B?MGdzR2g1aUhZbTdYWlpjSjFhRUV4MlZ6Q1Q2VU9sUDFKamlCVWlEUzBaMS93?=
 =?utf-8?B?OTVLQ0NtZmcyY3FWWjNremI4MzRHQnlKb0xzNzlJbjRuR2hiYWF4aGZGSUdx?=
 =?utf-8?B?d2swRXFQT016dUlhUktaTitBaHlxWUoxc1BLdm1UZit3WkcwNTZ4YUpBWHNx?=
 =?utf-8?B?SnpxcUNRRnRwUzQ4SVlIL0ZnZWZ6OVJCbDFabnlmdXdBeGMzbmhkMmsxMlI1?=
 =?utf-8?B?N0VNQTViY1hhR2tWVWFNTHZDSDNSQStTY3dsL1VGbkZONjJoSmdFbGtUWEN4?=
 =?utf-8?B?N1hxRXFOWTNhL2pNMmJWZ1FYWi9NS1llaDZxYWJNT1NhaFZaSWRieTNIcVdy?=
 =?utf-8?B?Y2JyMkhRQnZsN3B6TEpCWUliNlNScDZ5Q2sveTlUQm1uOFBKZVgzamJsUjZM?=
 =?utf-8?B?TXZGaXYxeWowSXcrb01xcjBUSDdsa0paZDhoa2lwS3dDSWFGZ05PdXBRZko5?=
 =?utf-8?B?RHdZYWNXaW5VaG1IQ0txdUdsWU5aV2RZRUdaWlUzT3hTV2dSZGJGbjZGc0x6?=
 =?utf-8?B?MzJWZFJyTS9OQ3ZOM3lKanJHc0FZRncyZFV2L29SMXBaUzVjbU5PdnY0WEFp?=
 =?utf-8?B?bWI0Qng1QktsaTkxMWJzWURBM0poTk1pMTBQaVVldmVpVjhuelQ5L2c1YSty?=
 =?utf-8?B?U3k3cS93S3EwV0c1NUFDL05OQXpaRE5mdzBsZVdtYzlHZHJ2eURBMVczQnBs?=
 =?utf-8?B?eWtxam41UkpLNDJudngzVk9PaUVuMldsRVFoRDlibFcrYzZiNUUxSEltb09n?=
 =?utf-8?B?MytXM2xEb1E0MVY5R014eDZnaDNiUmNndGw2ZDgyZ1ZtTUVmOUR5ZG5NcUta?=
 =?utf-8?B?TFhLeHNLZGk1aFhaU2MzdWN0MGtsZkRFRTlrdTh3bWdmRis0YjU5YitpWDdv?=
 =?utf-8?B?M2NqcW1YNXBjekZLQmxiMUNvMXN2R0RGL1pzbFNBNVgyQk5jU0FvbGU0cy9L?=
 =?utf-8?B?RUlINTk4ZVNHemFDbm9BWDQ2ZEFZN0U4dEtRdmZjbUo4WkwrWVg3OERJeFB1?=
 =?utf-8?B?STl4L1AyekdjQnVjclhjSm0zNjd5Yi8wMnBiNjl3WDgwYVhNUHhpbVg1R1Yx?=
 =?utf-8?B?ZnJlYmU1WWViQlcwQUtaSW9keDhYd0g2WjNoYzhmeUtTdHdkS3paQjd0Smdn?=
 =?utf-8?B?Ny9xSzJaWEZrVkxhRkllZ3ZiOFk0eXBickJOMTVSekF5RUlqZGRlUHlBRkpr?=
 =?utf-8?B?Yk5wdGlDbDJEWDRTMEEyclZNbzE3MDVTN1JlWmFCK2tHQmkyc1JxOXA2bFM5?=
 =?utf-8?B?RGQ5Yzl2a2ZRNWRQL3M1Mng4TFI3cXpyamg2dUpWMGRLaWpYSEhubXNqa1Ez?=
 =?utf-8?B?M2tqMXJhaEIyYmFmVm9XVVYzd0wzallObUppUWFRQjhsU0Uwa2tveGRza21a?=
 =?utf-8?B?QkxiUnMzQUpIK0JCQXFIR1NFSU9zRHVsQSsvanp1NFY5Q1JZVE5Bc01Ta1JC?=
 =?utf-8?B?MytweTNRb004bU9aMU9yb3ljNFhNdGdPM2FuSnFzdFhRekdwWmkyK25sUmZ2?=
 =?utf-8?B?ZmF6eFNaVm5KeWtUMkVDZUdtUW5TeDFXcDBtSHVrYWxwamdESy9Eek9vWExJ?=
 =?utf-8?B?UUNjOXowbTh1alM3VkIwYWJsaWVNY3lTckNtcUE1djdPVFQ5b28vclJuZjlU?=
 =?utf-8?B?NHdPY3ZIcnRUUVJmMkJFS0l5a0F2amZDdGZkVmJWS3o3ek9NdzJOTWJwOEg3?=
 =?utf-8?B?bUJMbXFMK2pXdGtPT3hsTFRDMTMzRGsxUFN1aEY1WVVNRTd5V0Mwb1YxMTZ5?=
 =?utf-8?B?UTVsOHdRUjY0UUUvLzFDRjI1eW1rUS9DUzF5bVFPVzNPUHBiWnpuUnRkSDlH?=
 =?utf-8?B?Z0NWclp0N0IyZDExV0lVZ2pzNE1NcDV3MHRYYVNSaXdEaU41MXBYZWk4Rk52?=
 =?utf-8?B?cFJ4QU55YlY4M2E2cmxSK1FOY0RpcFlsSnRPU1Rhd21IRUVHTTdBcHJqdnBr?=
 =?utf-8?B?aldQTnZFTTRQZ1NoenpzS2FVc1MzT0R6T1BzSzU4SzVNUDlzZkdtU1BFaEsr?=
 =?utf-8?Q?XM9n4h89XeVdZCrvk4hF79yP1xbrjwr5nMY27?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8617227-93e4-425b-338a-08df0205de1d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 17:33:53.7153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ahEeKV/YrUQzyBFAvKecq6B+6saebctNKfm6v0pC5e+KvZXZbA+YU9Q7cSHcLAXA7OrBFckNlOTwAjFTUuvtjOExhj5Rzc4SqJ325C0qTtXAsbnSvKwfvmU+zuAQiQq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB084187

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Reserve 1MB of DDR for the EdgeLock Enclave. The enclave hardware can only
access DDR in the 0x80000000 - 0xafffffff window, so constrain the pool to
that range with alloc-ranges and let the kernel choose the placement rather
than hardcoding an address.

Provide this as a shared imx8ulp-firmware.dtsi that also enables the hsm0
node and wires up its memory-region, so every i.MX8ULP board can bring up
the enclave with a single include instead of duplicating the reserved
memory node. Include it from imx8ulp-evk.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |  3 ++-
 .../arm64/boot/dts/freescale/imx8ulp-firmware.dtsi | 31 ++++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 5dea66c1e7aa..885242fd07ce 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -1,11 +1,12 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 /dts-v1/;
 
 #include "imx8ulp.dtsi"
+#include "imx8ulp-firmware.dtsi"
 
 / {
 	model = "NXP i.MX8ULP EVK";
diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-firmware.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp-firmware.dtsi
new file mode 100644
index 000000000000..e4bc352f68af
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-firmware.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ *
+ * Default reserved memory and EdgeLock Enclave (ELE) enablement shared by
+ * i.MX8ULP boards. Include this from a board dts to bring up the secure
+ * enclave without having to duplicate the reserved-memory node. The ELE
+ * hardware can only access DDR in the 0x80000000 - 0xafffffff window, so the
+ * pool is constrained to that range with alloc-ranges and the kernel is left
+ * to place the 1 MiB region.
+ */
+
+/ {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ele_reserved: ele-reserved {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x30000000>;
+			size = <0 0x100000>;
+			no-map;
+		};
+	};
+};
+
+&hsm0 {
+	memory-region = <&ele_reserved>;
+	status = "okay";
+};

-- 
2.43.0

