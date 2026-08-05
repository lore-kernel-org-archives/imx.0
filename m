Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013026.outbound.protection.outlook.com [52.101.72.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C9A388393
	for <imx@lists.linux.dev>; Wed,  5 Aug 2026 15:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785945566; cv=fail; b=pj7TjQP7tf6cTGX8TX1OBpuNfKAG3aLyrbdyTBJ3c1rdN96KBg1Kok5Tv5vc++MRw7yIoZHwRmUsPh/LNATy9niU+cEOOri9Jkztj2wqYaOEEyIOApxBEtPwPgL7y4wKYGUAYaHSyIRA4Wjr/a2e+qGsn2c1Zq1MD72si4Bs1vM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785945566; c=relaxed/simple;
	bh=oZQvScyA1zqJV4CC6foAQh/CAQe4pGeAga38F8pulH4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Hhy7kH9EbcUkcZH3sBobQOwWKmcKxadL9OcwJJeDQgTgThJ7OAPnjctCUDtZ5vtGxHv+53/WFr/0QyM16FPo+eK3hvI/vPWomyUNeTyyn7sEey5MHN49GRfNTAGgNUqWMgGE97DXttEhshpl9967B2ODuuftz/UtR1lYFgqUpSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=F1RYLByj; arc=fail smtp.client-ip=52.101.72.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="F1RYLByj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zbrgg4LP1xLmPZcsxttFQ/i8pVGwGuRCYAyXyV45HH/hPslOow7T9Ea6VWtcSWM2oSYCkjjRz5eR0PzSElWgB5b8YGB1fwWQQEtdiObPQNq/bg2muipR8B/gK9c/CYilOH2eqfBELhabmkvPXRkrUwyMkI9tDgv16vd7nMN3CX65SJvipfgzepzB0WRqQd1+PlF3sDhrJ95bhdj4+B02EPlEjwPLPS4zreD4jv2CLFY5YEKazPe97OiLzCQfGZI0kNdx46NYwForsKkyuIRWmbnJqUNh51gX4ChbCiszwIz0vXD+Jw3g4oYhndxsRYeX1c2+e6XAZ07tLSLwkhvjcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/T28Dv7KzFFE9nxv/81pMJDpMBM2QOQ+wFzcBBIp92M=;
 b=BuTn6sf7wy8SHc9/3fwt6a5DC7iVPBeChA8ivNtacxEX+ioG78oMwlEPOPOc9sfvzg9TtvE6KgvNA8wsm0kCrowfG4njMHhsx4bxYl5V0P9gpAW+p5JoFNKw0piNPLa+Zps1ui2ici6T3yVFeW1YSXgwofn245is5UXg4QnPignW9CEDkCpS/vNcv1IXLMZj/BezUEqzkS1/0l77yy6XGyEHd5coiktE53fODM809euH/x+LFrd4n9nlaCIoKrpHAL+xCPWbCW6BHoFaot8BsviDrLih8sMmWoFlLOx1D4Qk6vxMh0YRlv+fxygm9EjVmzegmme7/rdrIuaWUP/NQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/T28Dv7KzFFE9nxv/81pMJDpMBM2QOQ+wFzcBBIp92M=;
 b=F1RYLByj1cu/Ain+IDB413keOpCqRhpiFnlg+tHGL+azdczqW32mBC/Wdi8d5Lbh4dFuUmbTfbMclv9pwiyqELgjMtyAqCgKZ4cj8Vkh3Soaw4cEOEr4DOFkYwi+0xGbaoAPz+HljSnqTzgAxBWPBZoDI9k6tCosfLUL8nhrdwGn7uHf+Pa3k85CHrvfEXhoIOMw2kWRdWTncR5CZBz0Zl3cBfjGrHz89wWgfvesROyZKdmS6aFYW7R8c8aopU8wZrq+uMmuimlvqyRxu4J4qPBnv6qsQLgkt8RUlewa2W/r0QUXJJfnRR/fxnDAGhg0z6m3EtrMg2dA9RFjmuCBQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by PA4PR04MB9295.eurprd04.prod.outlook.com (2603:10a6:102:2a6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 15:58:56 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 15:58:56 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 05 Aug 2026 22:18:37 +0530
Subject: [PATCH v34 7/7] arm64: dts: imx8ulp: add reserved memory for
 EdgeLock Enclave
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-imx-se-if-v34-7-7e4713d14e0a@nxp.com>
References: <20260805-imx-se-if-v34-0-7e4713d14e0a@nxp.com>
In-Reply-To: <20260805-imx-se-if-v34-0-7e4713d14e0a@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785948512; l=2461;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=8LTJ7dQk+ZmHVQUVQ7z2QFEU98qQ6ZendsUWTwEehrU=;
 b=91ZoZ5GwYxRNHsrUHVMJIkdJVOc8a/PIrwQ157f0GiNMDiWstMq/7yVDanjhmVtQ01br/uYqr
 6FhP6phmSI6D/YGPmMZYmLHDvIOAwCXar7qiLkePtbdbKzXpMH6Sl4t
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI1PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::19) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|PA4PR04MB9295:EE_
X-MS-Office365-Filtering-Correlation-Id: 71c5bf35-44d9-4667-db2a-08def30a7465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|376014|7416014|1800799024|921020|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RtZiYxRB/efzwtiQfINrsPaF/x+aaZsW7wB4VA/K4FEST8TV6VHwlfm5ufCS8lIQdNJ59UqK12g0/o0TrCjNZQSkQAazSJn8J3cUOYD05CHG+92MmPeVbBnkJfZEu8NlpYuDR0+NuhdMt/z0qcgsOTXTtnmumMeFZ2r16x+kQxC4FNBGCYO7aZMO+rUnG1un3eMleCA/J0SCyB7JUNQ3x3Bg6p4+lY4GDTi2vO/JlKIQLjjSx3TBUDUJV1oiW0/4L2PQzLt1QoEYprNUnpLtALkHUcS/wnR1QJ3pcOUIVsqHlRoxsTusVyWuqIRZ5Ada/EmZJAUC6cEKGBdvQBG/tMpWtQG9BW0+Ffp4LtKc2krwhIpgjs+Y4OmSnDewt3i5aoy2YazH4N4DHHXLsTDFHKPDqQyHWJCNeQYsrmDRxgyhPLYGxf6cR/v1RPKAMgSBQ2NPlcRtdwaWJ6HsOz0Qz1+irLXGqSglEgT7sEVAFmAyjRn+KBkS2kM9kxrrkOuwFXsKMWABCP15kQyU2DI1wdauF629ghvxjTPf6TvYT1vuGWqSbkyd1pD69iEWn1WofxQfCOXabLbxoewivsPjBNlgQpIk/NduohKbMP3b6shPI/dURZGNxcABejJIPut7Cca6JcYCn0eKzMLQGafQvHNNMGi4YVBtw8JbnYqCR5iO+w1h6XebWJv/wy3qH82I6BiyLeru5neG66MITU8Zfw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(376014)(7416014)(1800799024)(921020)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnQ1TUcyRTRETXZQYjhsZ202emdqNFkxRDBqREpRcXQrTU5CWDg2N21iNEFE?=
 =?utf-8?B?L0pjZlVlUDZqSGlLYWxCWWpzZFZRamF3NnFlZWdDZkg1S1pBNkdoNXNOZ05t?=
 =?utf-8?B?b0FTd0xQeE9ZelIxZE5PU0V6U05QMHZUakNVdHdlcDVWVmpSaDVDOFg1Q2k4?=
 =?utf-8?B?Mlcvc1VMTlNITmFtWWF6Q01ReWg2YjJwQi9jd2plOXB2U0U0enJLSzZSQlJL?=
 =?utf-8?B?d0R0TGpQekpHKzdXOGQwTGdxOEpXZkxkTURNWWtMRldMSGhENS9QeHArN2tI?=
 =?utf-8?B?ek5PSURQLzFpV2U4VTFLYlVVS0ZwcXJ1Y0dPV01tSlR4ZDFwTHNOWmM3Z0hR?=
 =?utf-8?B?N1VYZFVQQmNQRDIreWdteFN4cloyMTUrTkhvMUJlZmJ6UDhHdGRoSUZCSC8y?=
 =?utf-8?B?WWxiOWFPVVJ5SGdPdnUvU1BWNWMrSEREelpZZGNCSTZTSzRucEsySDdocS9S?=
 =?utf-8?B?T2V5T2IzdUVxTHJyWk9lS3BrU25TSHRVL0NjUzBGSGx3ckd3U2pGQzg2UTdN?=
 =?utf-8?B?QXZyZnJPdVRUd3R4a0w2V2JuZXRjNnVWaHdWSmQ0SUhMVmc0ODI1NytBVjE0?=
 =?utf-8?B?cW8zVW5Ca3BQRmRBdzM0VG5EaU5QWk5FWmd2b09IRGthSUcvU3ZPQ3cwWUlI?=
 =?utf-8?B?RXpLQmlBa3kxdTdJQWlnbmJUc1BlYm1CWEsvM29pV3B6VHFVMU92MEIwNkdQ?=
 =?utf-8?B?djBiOWlCc0dibTUveUcyMXJoZTI2c1Azc3lOL0VubWhwa2g2Qi9EOWNoc2Z5?=
 =?utf-8?B?anBuYm9lSTd2Zy9LbXJkVkpMcWlxZ0pPekcwSlpzcG9UN1F2QkdZVkpCSVJB?=
 =?utf-8?B?NEd1RkpCeTJHQnZFaTlJbmllRnJrKzRFeGh3NG96TWwvMGdabzlxM0J1WFR3?=
 =?utf-8?B?YnpnL2pDN1JJZmZsUW5SS0x5NzJrN3hzVHVhV0lGMkhPL2VXbHo3NE9JZEo5?=
 =?utf-8?B?cDhFYXpLbmdIL1NPMEFWYnJwTUE0di9yMEFFQng4OFlrMkJqaTAxeGFNNjhx?=
 =?utf-8?B?UEdpcWdUTzlXREwwcTBLd1plNHVJcXppV1lCSWdFWDNiQlU2V1dBZVFMSGc3?=
 =?utf-8?B?VERTRjlDa3IvYVZiSzI5Nis3THp2Rm56Rm9IKzZxYzM3MkxKTHkyMTBRSWZP?=
 =?utf-8?B?UElZdmJFMGkyZlFSREVwcHN3cnZMN0VWRTdPMVRESVk4UE5TWHAzN0tkNGtS?=
 =?utf-8?B?bkRLSWVjRGVJMEdxTCtIa0tMbCtORUZYeFRjTWkxRHRqU0dFQWMzd2d5Y29t?=
 =?utf-8?B?YkRsc05keVVLM2k1bGd3cXdRTDJnQnZlN1RTY0tKWkJUOWoza1pMWkdXc3M5?=
 =?utf-8?B?OE5FWi84Tk4vd2htZnpSREdBTy85bGxZNW9PVXdxdkhSdXkzdkRueEZtMkJW?=
 =?utf-8?B?MlViREFMTWVzaEtVOU92ZitWeGNjcWtRSHhIbkw0dDdxMDFwK2VWM2lzN1My?=
 =?utf-8?B?aHdHTk14VE9ERXd2UmZHSk1oRHpyeWtpSFhmdDM2M1dsdVhzejJXRzJTVzFR?=
 =?utf-8?B?RE9oTDFJbXlNajFoV1JXMUZRLzBFY2RxaExnMGViRlAwaUtyeDhMK2dxbmIw?=
 =?utf-8?B?NVZ4YjY1bDFIZWVQcEZWZ1FtVkx1amNoYVZsTVgxTzZlU3RKR1JRSUVqb2V2?=
 =?utf-8?B?cW5DaEpmU1A1a0VuNysrbUNnZG1vSWRYcXY1bE10bU15K0h2MkZVczZZUjFl?=
 =?utf-8?B?dFo2Qk1vZWxPWFZiUGhDbUtXWjN4bXRTZGI3Szc1R0VZZE4yZ0YrSDg0Sy90?=
 =?utf-8?B?ak5LbCsvNktHVVo4dEVhWHQvZWRNOUUzc093UHBlaWl4UVh3Y0R6SllVZHl6?=
 =?utf-8?B?TXBWREFmbEl5a1hndEpveHZoTzlOdms2Z3NnNTFWNGM1U3E0TzZacTc0TjY3?=
 =?utf-8?B?SnQ2aHBFdU1GcTJIZHVVMXBwWTdYM2xNa3E4c0t0QWxSL0RmOHlPMUVSMDBH?=
 =?utf-8?B?TzMwdktzUEdRaDV4OGw2ZU83OGVKdDk2V3V4UEQvTEFWYW01d0x3WjlSdU5J?=
 =?utf-8?B?c0dyR2k3NDM1emYveVc2cHl3R2kyK3FTRktPNENEazZqWkVnUE1mdzRvTjEw?=
 =?utf-8?B?MTVYWEt1d1VJWllUQWxlK1V1N28vQTNmcGhEUHZoZlgxS05YcU82ei85VHlT?=
 =?utf-8?B?YzJmU1VhdDlmTWtjSXJkZXFHNDhYSThYcGZmNitpVEpyQmlkT0RoRUNPMmJo?=
 =?utf-8?B?dkE2TzNpRE1ZeVZuQUlFaytRWW81Q0xUSTJob1lrSHhBaFBDNTJJb1RDMnRr?=
 =?utf-8?B?U0JnM1d5aXJTY3grb1FmcFhYM2R4bHJ2aUY5NjBwRC91c25BRUdTT1JKVk9H?=
 =?utf-8?B?cXF4cnp3bDJic0NlMnMyME5oT3YrTWh5MkIxVldoUTVrbjhvMW9BeTR6MUtZ?=
 =?utf-8?Q?s6iSlWDWr12unPpMnPJz0XZXamOlRDshvpW2V?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c5bf35-44d9-4667-db2a-08def30a7465
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 15:58:56.2110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZcW+eGp9Yc2tKhc6SgzLMR7J/5dLaEPGeKNnVVFvEbByW0FGX+iJiTBP/yulBXmT9JtfFlB1L9cWwncHtp0QKMhcnUkS6DO91S54z1ja4l1M3Ry4TKEBTiL/F/Jfq6J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9295

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

