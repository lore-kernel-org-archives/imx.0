Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013029.outbound.protection.outlook.com [40.107.162.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D743B3C11
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 09:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562234; cv=fail; b=oDfOuSfOugSD5i1z9KioNpmb5BDPe3KpAstO3uSELZUBjPQ7TwLCvjI+lyInFjbxWnX5o5Z8z8dxI23dZnAnucXsTaThvm6kGzLLxPM1UJDlVWsLHrp3eETiEprRCFT98/yxzkGjCKvU0T6S+w3nzmaBLDvbzDGyaVpUnpQIEvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562234; c=relaxed/simple;
	bh=oZQvScyA1zqJV4CC6foAQh/CAQe4pGeAga38F8pulH4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=vGrmbNkvIw6diKTedL+P6AxARJHWqx+J54MgFauLAvmeDwlDjcvEOokIa+qvtg5/b78ICp6un+Y+csi+VqxmbSDs7d58sM171px6V4f4MHtmcNuifTh7tyynveTt76zRY0KzFLfMS4/7VubYvOJVabvyXMoCfuOfyamxNhC3smk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gamdjcN+; arc=fail smtp.client-ip=40.107.162.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gamdjcN+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OT3erkowA0wa5hnKf4vTt+fO3QZ37zvUr6/jbTLhDQeftBW9SINZBiswV2M2FJ3FXkU7i+WvCr6pSudOfH7RGWCCr6+bCtHH7vXItE52Q/Y8VzunI1M0sYbn3zH89BUkrIch8FY/A2JFVkkKAaIArD8Wt9ZBseShWUYTzrsadmMCAjxaFKrqWrRI15FFMISPJfv/Qd/J2V1xqiOwPpURIfgL7iSWG3We79BPB28msYnvtWRXm1nkv3SWLd4u/QFrd6BQ0cnqwXj/Z6HBbfVrkDJmVu7Pnz8zus8avbwjXjVOC9eQvtw3x+E10LsLCwvOUfeFHou920f/t57b0MNatg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/T28Dv7KzFFE9nxv/81pMJDpMBM2QOQ+wFzcBBIp92M=;
 b=R4q0OcE9n6spVfYVSCdmnh9NfeS97ICmjWqAUDqqAwIyKkted/Sc0PXqXIu0TFt38yhXRN7XwrgsC8FsINBl/HwpwKGCrihXItQwiAOMOJ98WIKvv9pFxXDYMZt6/jCMLHtdy242qmn6xIcLHkU3kzSrictWke3b+dki34POAbUYFGT5stJEs6ugCH3n1en9Db1phLDVW9jGv/XApRgxHt/2nws5EK7jXfELqGKnl7CrZlsjq+cEQqoEHmlkHQSp5TMfVddJ0y6fPw2xCsPo1ygzhCPeG9hYbI9VENHaX9QYXndi9oMMdQ6SY3gjbo5++BS3nSNG1rOy14gQb4fRjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/T28Dv7KzFFE9nxv/81pMJDpMBM2QOQ+wFzcBBIp92M=;
 b=gamdjcN+1jGk5MsT2K9yBJOhOsFGCaDvdpcMDgyYkE5fwWoEcjGDeKT6uEOdS/4GaAimMlA9cEBxnX+iv9Y5UK0F7HtNwgD3fxJCLWZIfHfad8C/b2Tll2zygyxSXSezClPkDnB2H3H74dZ5VQIkE/YLO8zyMCUzVrBN0wzDX5V1zhMXpqK3Y4ChwQOgaUCT+YnlHkjpqGS6vfm7/4LxPNO9uiKdEBPp6dPpKSOmJfOWxafIIklnWClFuBePZZJ83mfbiR8O3MOcdsuv1aioF/6q97w+NIwFnUKttcsCSGf0jJ8Ni+pmp1xzQ0P/hduw5xHOLPMlykDPNpiTTGMdEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by GV1PR04MB10478.eurprd04.prod.outlook.com (2603:10a6:150:1d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 09:03:47 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 09:03:46 +0000
From: pankaj.gupta@oss.nxp.com
Date: Mon, 24 Aug 2026 20:03:32 +0530
Subject: [PATCH v41 7/7] arm64: dts: imx8ulp: add reserved memory for
 EdgeLock Enclave
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-imx-se-if-v41-7-29cf129e4d86@nxp.com>
References: <20260824-imx-se-if-v41-0-29cf129e4d86@nxp.com>
In-Reply-To: <20260824-imx-se-if-v41-0-29cf129e4d86@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787582007; l=2461;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=8LTJ7dQk+ZmHVQUVQ7z2QFEU98qQ6ZendsUWTwEehrU=;
 b=b7s2iKdb+EvpHPIl/CsmFdIf/uMp0ffbQN/UzjI/somd5J4XRL4CwcHZE0DVcjXy36YWS2FfH
 FcRvaMUPoJZBqt5SSElE1VUP7ECGb5wvY9CB9jPpIw3C7qzIN3+4a8t
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:196::14) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|GV1PR04MB10478:EE_
X-MS-Office365-Filtering-Correlation-Id: ea1bc8c6-e107-4853-7e01-08df01be9b1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|23010399003|11063799006|56012099006|10067099003|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CuBXuK0MxhMBW+R5DT1pY2pPpqfa1RoZTL7A3ub94hZ7IR1vsGdiKNQ7v1lfm/e6e3kIiegOqq7hMtoZ15Iud6rTfAFI8Fs/GKtgdrWdSRb9Has4qiNYmhSmEN6Ndq1D1NmihhSb00TaeyRH7eek+F83SjxXgEHb/ibNCuJ70i0PquwmFsZ4GSiui7mGxfl0qos4BkM7Dqzjn03IpODA8wzNH1P3U+zt/hnueTG7+lvBNHfpsBkTizhNLBFh1XyFzs/vWt7pvV0bDUJgfDPVHuVdU0sUpg+t47Zp0D0KmYxvvpAlvnhsXA6+a13OwiAj+AWmJ5l6fR1UUEQZlMUS7dg2mdioIjzYJVV0gdTVf/0X5mT/wHmwr6fzotQBesdro22i9a7Qov/f83+5cXnDd3u5ena2pKgZml8iNJ5eL6Xi/NrJpDwB20BtS6ELjZC8K4suOQS0uozI0nA9JREg4hW7Khk/8cdo7cafLQ6aPpD0dwcAk36k9Pr61xyAgY1TumYVTnLHOOWqTXPjS4QnDOPePrtJnyXZg1+/oP2/1c4AOjwXk4i8EVKKMYDbqap5Ho8zFFOML3N0d26xerlvxwimDD3VQnPetUFMshMgP/se38qEno5GN9W9cVRAi/GQefZHdJl1pUKE6HkRBJkmrhQ2/ce0seiKIwnWVQQOtCVjRiwql7uaF58k1cNCvtZSSKx94rW8HTlDwsTLSOBw1Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(23010399003)(11063799006)(56012099006)(10067099003)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjA2eDJoQVNHQ1R5MCthRFJtNUlyaXdNaXdVZU5Cd1VOVXNBSC9kT1FkOUlM?=
 =?utf-8?B?YWJCRjJTU2RyMHdSNUpyUytWZmJLL0ZPUytUdDdzSUVsUWlEdms5OWJCQVhH?=
 =?utf-8?B?dndMckVSNWhZcHhyMXpjR2JQTUFBYXFlSnJ0eHVhOWVUSDVqSSsrWXVVdndw?=
 =?utf-8?B?U1JnOVd4K0QrZXhob2o5Ulh1OWtxOXdjSmxxY2p4ZE41VlJMcllwanhxSm0z?=
 =?utf-8?B?QkE0VFY3cjJRdWNOdDlJYmEzbWp5RGxaNlh1cFNuYWtNbTloK3ZZMUIra2JQ?=
 =?utf-8?B?UEVpSFRPdDcvKzZHc3ZCcDdLTndNdHFuN0l2SnVSRnI3QTZpU1hyeExpQldR?=
 =?utf-8?B?dG9pWnAzb3IrQ0RYZzQxekZLSC9Ienh0WDZ6REgvdEIvcjcxUjB0OG95Rm0x?=
 =?utf-8?B?aG8relkrNVk4aVJaUzVsYlNMOWNXb1FSYmNTSlE4Szk3eFkxcHVvTGZGUVJy?=
 =?utf-8?B?d2JNNkR6bmZpMzRZSS9jNHlweE9TOUlvZE90NVJWc1BkRk1tM1lYVE9qekhE?=
 =?utf-8?B?Uk9HR2oxTVV3Z0x4OUV2Z2ovR2xBOEN1VlFpR0RnV3N6TUpHeWlVOGFyZzBw?=
 =?utf-8?B?L2NSa0c2dmJ6RGRLd2l0NFJYOUk0UEpMcUhuYmZSV0xFbG1uREluRXNGMmdD?=
 =?utf-8?B?ZXBIS0dnbWxxSjR0b1lkSUtZQnhnK1VHTGpTczErZEJGb1J1NVhjczc0N0Jr?=
 =?utf-8?B?bTFCY3F3anFzbzBSQVpIdWlBOVdIcThUalVZaTg5d21lZWJHdVdKZ1ZCS0pp?=
 =?utf-8?B?Z3c4ZVVTYlBZeUI1S095cEQwaDdSUEQvVDZDVzZDZ1ZFY0VrTG1mejdkK3Z5?=
 =?utf-8?B?VVp6akhsU0xnQ3hpcW1PTmJUb25IZGpidTZ2ODI3SFZtSHFSd1dnaldPUHBL?=
 =?utf-8?B?Ly9xWm5EQTFFa29zWFBvcW5FRVBlYS92THhNb1ZWQzB1NWxTT3ZocGhzWFBj?=
 =?utf-8?B?SXY1ZlUyaGduTTR2Q0RBSmV5cDZ2MkFpT0t3c1BjbWh6alZ1TzZZVnRPMWpl?=
 =?utf-8?B?OFhtcWtOdGJmcG5UaWQzNUhZaHhlRXRCc013MVpiMkpmTGZCRGFibnJhWUJ2?=
 =?utf-8?B?T3JkRzFKTm5TVEs2M1FtdEpjdXNhRnp0QWxKZXZrZ3MvOUNnNlc2bXZaMGJJ?=
 =?utf-8?B?Rng1UHFqSjB6MWNyaUNGdHF1MDhCYkxyTEg2K1k0ZFpxc3cvT1F4RnphbUZR?=
 =?utf-8?B?NG9PRGw1VklzbHhMT1VQM1lTdGF1NWpSU3o0bUMxMlMzbkRlY3pGMzZhMWRh?=
 =?utf-8?B?bEZDaWhnZEI2Z2lRMHRCZzY4U3dabjdyZHRxTHlTTDhYQmU4U003VFAxMGN5?=
 =?utf-8?B?d1Zjd1hHdWlBMFJFbUhXZTA2YTVrN3VWcmdVVVYwK1Y2bG1xcjY4RFlEWXRH?=
 =?utf-8?B?Tkw0NHpsSEJ0VGs5bTFibzdnUjNsQ0Q2NlNNb2FuenhQeW9taVkzWkZzRnU2?=
 =?utf-8?B?UEVqNHgxbDRCcC9UY2tKQk5JTncxLzNsRmNubjJxMnBrbDR2S3lrZGFaeXFD?=
 =?utf-8?B?bERhditvVzYrRk1CajhxWU1TSCtOVktVUlhZZnNTc3BWMnFyTVhYbW9SZy9q?=
 =?utf-8?B?R3llV3k3c2QzTUM1UHV5UkJCS0dCTzA2emQ5azVwSnhjVnpwK0JnUGoxbnFj?=
 =?utf-8?B?NHg4bVZEOVRBc3VKYnVnWERMaUlZNzNLM0RocUVBbGVyWk1EOWdhNXppbUov?=
 =?utf-8?B?N28wOGhiMjUyTWhobFNGVzJyeGlzSE5BcTlFTTViaFBlNXJpQU9qVHF0bnBw?=
 =?utf-8?B?b1hnOVVDc3A4RUhGV2Y1Y1Fna2EzbzM1NTN0M0wrUExHWXh3SmQvVWpmTXl0?=
 =?utf-8?B?MmNkUUUzY2JlZ2pvMnhNWldPU2hwNk0rOVd0K0lFTVk1Z2RWTm1qOVJ1MW94?=
 =?utf-8?B?Sko5SmFZT1FMK3NzU3pCWG9qeU1lVGhJNkNES3cxcVlmdjM0bWVnUUNCeDRN?=
 =?utf-8?B?RG96aU0zdTBKZFBFdTZ6R2xrUmRYeE5rWlo5THJaNjQ3Ykh1Zi92dlQxSkJ4?=
 =?utf-8?B?K01kOUdkLzBmMER6NjB6U2ppd0dWdTBIU0hIWFdqMWhjSFpZTVdFamo1RGtZ?=
 =?utf-8?B?eFFGNWUrdXhDQnhETjRVVGVhZWpwUFN4OG5nVG1TZjhNMzlUSHdBem80azRi?=
 =?utf-8?B?eWlhT3Z5MUFxdEF6QVF5N0xLR3MxdW5FTlhqL21TcnRqWFp1K0pwMTNVSUZt?=
 =?utf-8?B?TFRscU1HN2ZJMjh6WTNodW5YSGx6US9JbjU4NUY4dWw2Nm1BNGdSQSs0bHJr?=
 =?utf-8?B?cFp6R0ZWTVpwTXB4bE9JSzU5WmZRMHIwSllhZXg3b1paeTVrN1pKNnFoK2xw?=
 =?utf-8?B?YnMrdGo2MnhjUWNlcVg3bXdBcVhSQjI0N0M5SW5udkMvK1I3UUF5YWNhUTM5?=
 =?utf-8?Q?XzOfYpRncJCaxHe+KDiEIwQCbElpGweuMWbcp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea1bc8c6-e107-4853-7e01-08df01be9b1d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 09:03:46.8825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A20xOSebqy9S9YSxuERVwh10XjYaVzzrXxhuTZmkOVFvFNCXOOlf6iZ0ST+IgJNtg+c2cmUyJXZ6tuEmSbFOyqTUe/vUUcW9ZYe9NWIHS7Qzsw3ocs4udG/z12mugGk/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10478

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

