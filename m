Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012035.outbound.protection.outlook.com [52.101.66.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EDC48F838
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 13:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787317767; cv=fail; b=Y47VyIIaE9by73b5S7AdIA2xYWGqxn+31DoZRkGPf8gmxhymfGt75w5fBXBZqJxUM87LRVkpiKbwsFReJzA8BPdWie2DtqZQ9mn+imViBazxSO++vUoG2bRcDsIiR7qSesMggxVKpeBA7Ij79oF6rRWyRTuSuk3g2Xa29HvZrfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787317767; c=relaxed/simple;
	bh=oZQvScyA1zqJV4CC6foAQh/CAQe4pGeAga38F8pulH4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FK4z3oMNSL15Pat+J1kmrMKkxHVkoQmVEqUuxujkD0pmc4MdAy1+IChZctgMNuoNe+7RYUjbeObWufWKL811qEQhRG8CzH2JiFQzL2OmSxoDiulhP6XFXKfojXIeYv91pOOhv7wOINZqbq3NNGJkeoZmDg93QyjZTZgmWI0pW5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iKiXbNYw; arc=fail smtp.client-ip=52.101.66.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iKiXbNYw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dvt4VONrHuWercTqgDK1UPQenLUMejP1cZJcIjcLPeYWN7AubRfsSB8nGb+1wJijJak5G/A9WmcJjTflnq7+yPbzZO2L0sHwGFYn60mWq+7aHZggM4D/32HmEIC4y+REYNVFxVXe2AH/Hx69JIE/eH1KtHQvBCaHanFOTk2724rRwZLVb3kfVcAh9KKL7yrazu3ivKZslAONdUBftSC8YuFj1tCjYHXYZEpN4L/44P9tHmsElwdabDDXkKJdinLEAamYYDiqsxop8t4Y65/ig13jqn4kXcum/K9XLhSGvut/AOGXO+pSIIqyhk4JKwYT20w8l2ZNiKMUrVITOVF8Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/T28Dv7KzFFE9nxv/81pMJDpMBM2QOQ+wFzcBBIp92M=;
 b=NHoikT6MXjkF5hY0932pXKVHhERaaPIS5xXgdFugojbF6Byl8IkhI7oUVDq3BOPrSgFES4OP9v/ebi6bbgqbFX9GOS75efLQKkZbOpW7pftqDTxtALFUf6QR+q4OtmKTpruxrMJXMZxRZfwZw6IuAxtF4c2UQtu3NWfSN+7s5hAF10hlhABwfqVXa226yXZJYJK45rbFs+1uMByvOSlvVM6Ds7B60Wbyr6vuRPplDntmbhAihE1/a8PUXRQJ+uBtUgJFXm/+Ioeh5jFDhUzeRooQfNvkgZwLPRjmRv1ZfBCAmoCuYyWxBI4sYRxlNOlYBhH0uVwd/Rdh1O0dR835oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/T28Dv7KzFFE9nxv/81pMJDpMBM2QOQ+wFzcBBIp92M=;
 b=iKiXbNYw0zrpukZTIV5RcNuOZ6120WMg633eMphhaevIN9/2DFQjrRT8OFcOdinhDUQTc42VuL4UwrslLEo5gUugqhswRK/pmNcbIh2M0RNUxGj1sQfkJvy1SY6CBjPaQxayOujVnmQMzVzb4jLbE02y5uh4sSYIiDME27c37bh0hBdnWx/K5yCrgg1hZJ5RnC8Xj3efVGyOWbWBYPajgBUIvyMpU42eESzRar5C1tFh8Ldr2lPZq1Y2mZ9goanoBzgsDqvrEH5h0E7298NE0AaX40W1cJ/8c1y2I6OqABcxR1PflVrW2xw2hQ6/fViziHbMqPRSroATfU8IIq4AQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AMZPR04MB191951.eurprd04.prod.outlook.com (2603:10a6:20b:7c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 13:08:16 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 13:08:16 +0000
From: pankaj.gupta@oss.nxp.com
Date: Sat, 22 Aug 2026 00:06:14 +0530
Subject: [PATCH v40 7/7] arm64: dts: imx8ulp: add reserved memory for
 EdgeLock Enclave
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-imx-se-if-v40-7-74fbce2f2f95@nxp.com>
References: <20260822-imx-se-if-v40-0-74fbce2f2f95@nxp.com>
In-Reply-To: <20260822-imx-se-if-v40-0-74fbce2f2f95@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787337485; l=2461;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=8LTJ7dQk+ZmHVQUVQ7z2QFEU98qQ6ZendsUWTwEehrU=;
 b=P2p5qBfhcatMvNMB24Ia+I3YSqLnIrzeL0xYc0wPUqvGKODX+4TWCmrqKtL+HYlQUmoCWk0xM
 +jKIF2aPd/aCxvQizAZDzgYlJkcRqk41/miVDWNZcSEUG/i6gbOuh0M
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI1PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::15) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AMZPR04MB191951:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f4bd3af-369a-4ba1-372d-08deff8543b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|376014|7416014|1800799024|10067099003|56012099006|11063799006|22082099003|921020|18002099003;
X-Microsoft-Antispam-Message-Info:
	CFHCW0YiLsbyf/iNcdJ/hZvChgawoIxnCd8VR11TPQNNzxY/t4YDWtwfBOCenKUU/JglQKzvS7M08FkA5LO5RkBMDApDAAhxxhkvUFx5ySEPi3ks/38qHXt1Wq1+159J4MVS9fHYgsX6W+lElwe49XS5xf+/XndSUVgfE+KsM7iIpa/JVisg/Uk3a1GRa3g8M7QbUtvBn7mP0ZzLThVwP+dwhnPmTRxtCan9bfQC+2pmN1aU9Th63s/Ri10yP2lTxiwnQtVvRmTpLXVuIf3fuPfbdqkVS7jYfJXK6/oxaPuA8u/Y+DBu/P2NNTqN8U30/d2frqdno0MyzzmfkdIz+p3/bAbn6ufaTiPdXVvztTjO6EYSRa8knNaMff5CN34UZC7GsQwHiqv+SUkW4yUpNSyZphXvgKv5T7hwJlzyjOkLFnsqmH9ADhg5MZcL5gL4wfIcg+2o6FGyPS8vLJ6YlWrBNjxCCnXTtdKgfOInyvjN2FvMyA+7l+y1FFj7wCwPJgU475G1VbyUZmq6Z/p7nowNXopex0ve70tjd7La1NOBsAI+U9ZXF/sKsZjcGJ3yWawnzkGabPGeHdnYxn141bim5U14rAOh1/G4P/jInqfiVtY5yYZ4oDHRPBEzJlcobR9DaJS/k53JDiYHMJ5FFSMJ26qNCpo/Duk/snxA3bQqSOwKic4Gf30dqZr+r4HOzC0eiKgwppdA1qqsqHqzYQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(376014)(7416014)(1800799024)(10067099003)(56012099006)(11063799006)(22082099003)(921020)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVczV0JaTThFcG83WjAvbzZtN2RPVllrd2NTVGx2dGVoNlI1eGkvbDhaNVNY?=
 =?utf-8?B?QUgyMzdOd1lxWjRaSW93TG5WQUhmRkxyTGRUdlFJTVFDZGVTU1FZQVNzeXpI?=
 =?utf-8?B?U1c3cENCS3gvR1o2LzR3WjdHTUN1aUNGSzRQNDNwaVlpVUd1NnNtNFNTaGFh?=
 =?utf-8?B?QnpwZ2dLeDhqT1NBUlhESG5IQkpDMDl2ZHcwa0JZNG5COFE0UVFvWUJQeEJs?=
 =?utf-8?B?U3RIQ0dxUFJOQUVDM1BNVFA5b2tQNUUvZktrSXhXTXE0MWdlNFRIL0ZyQUNB?=
 =?utf-8?B?dkxReWR4dmNGdnhoSXlIMVZ0bFdXdTE5c1pqZW4zYTkvTWpRclQzN0Y1SHBr?=
 =?utf-8?B?K2Y5a2hBcmVCZlE1U1huWWNsMUdWQzJoZTRySUI0aEkxdDU2NTU2bllEL21V?=
 =?utf-8?B?R0xsWGMyM055KzZ6WUJUNTNaamNMakhuNGR3cDhEVkFiOFVpSXJXb0FCS3pk?=
 =?utf-8?B?RGhpVCt0MGZCL0tvLzVRSzQxVzlZdHFTdjVwZEt2b2FpMllrOEhTMjdtd3Nx?=
 =?utf-8?B?T294SDQrMmYxRGhDT0oreTZXUmVZMU4vQVZHbUkzcGJEL0ZueEMxbjVNZzA0?=
 =?utf-8?B?bzAyK0FrUnpqbEZ6bnVTNW05Q1p6RFBhellMVms4ZUx2R3lQMXpzT0Fmdk40?=
 =?utf-8?B?NHROR0x1OFYrUWJKalJoVGZ4UHBCbUZKZDkwclpyRnpiM0thVmk2OEFMTWNu?=
 =?utf-8?B?NmpLbk1mK2ZEbm9nKzBLb282eVpEejlHZFdKWXNmL21NMDJzdmZQeGNFbTRu?=
 =?utf-8?B?QlZad0hkck5QbmJvUDM0Z0hJU2FGRnJONUJkcVQ2b0VjNTU3eisrNmVHYmU3?=
 =?utf-8?B?MktQeVQ2VlUwM3c2NVNZRC9wb3p2bDhNSGxGdlRJMFhSdlFRQ0hya2tKR2ZL?=
 =?utf-8?B?T1V5bm9vTXdYWGNFUWVIS2dCbDBEa0JEWVk2U00zVVlGQlJZZU0yL1ZZc2FE?=
 =?utf-8?B?TXczRGkyYUJvSzZhdm50TzFSNjdWckx0aVNiRGE2dVJjV3lnYndLblBvTjcw?=
 =?utf-8?B?ODBxSlZraks4bWh6K0psZkppMEdXNGdib0JmWDZsQUV4dlE2ZFZhQkY2aEZ4?=
 =?utf-8?B?aVlLa2FDTWFVWTNhdlphdk5pUzQxR0VTbmo4L202eHJDblppMGczZDRtdkJN?=
 =?utf-8?B?aTJpSDFOU09Na0lIZGMxRjdoWVNNRXJmTGthVHFISU43b3lIL3JVS1ZlaEVh?=
 =?utf-8?B?aWNyR1VkajRYWkFhNEQ4Y2p2WWRYN2tjL05LakY3NmJPdUhjUTdVazBYVFB3?=
 =?utf-8?B?VGFvaGNkdGRMRmNKVEdYaGhoWElZOTEyeElPKzlvdlB3YmdRWmZzd1dMZk4x?=
 =?utf-8?B?ZmNrMzlKTzFkakhkeVgvTlNMUlZDZTlCeUdxOU9RK1BLMW1tYmQ1c0VpQ2tr?=
 =?utf-8?B?QWZLb2VhOWZSTjZxanhxMklkWEJtSUVzbDU1bi9qdkVYbVJiKzk3RkJyR3Qv?=
 =?utf-8?B?VkRmbDZPbjYzQ3lzNC9hVFJObFVMTklYV2lTM2NxL2FRa1E1QmZ4TDZ6SWNS?=
 =?utf-8?B?VnMvdDZjRnlDbHdzS2EvRHBrN3BXMUk1NFNYVllwdlNsckJraTBGeFlDdWdv?=
 =?utf-8?B?R2ZmTGZaRkcyRTRKL3FvUkRFb0RmRi9MRkhtRzlDM3JZbmhFSjRZa05ld0V0?=
 =?utf-8?B?d1F4aW5DaHdQTUhlRXB6OFp2NXdLWXdvMW40MTJHYlFHcmdHUWdzcXM0WW5v?=
 =?utf-8?B?enF5empNR1ZHdElRWFA3cEFUOUFKRzV3SFhQdkJwY0I1NmtWRit0QmFvVVFa?=
 =?utf-8?B?eEZPb1FJazkwYWdZYjhhSkpkWWNucGdEQWFiMGZEWFNCTkxPRWxuY05OelF2?=
 =?utf-8?B?NEdaeUlST0M0TzN1Y0QvdDA1REd1U3J4QzU2eFpCUDlGVGJ3RnJha3RLTUV3?=
 =?utf-8?B?bi9ZQy9xWnFHcGJvSXAvcS8vS25DU2tSaFdFR3ZieUcxeWpNTndzQ3dOYXFS?=
 =?utf-8?B?L3pSZ3ZhV0x1Y2R2WXFrNmVtMXdPaWZDMXpUUk9XTS9aUTYvUEJiaEpDcGtS?=
 =?utf-8?B?N3NKSWF4RTdKQ3lJMFdsOGc1WFpvRDFUZmVJZXJUOWtVSUtadkVOekpUKzN6?=
 =?utf-8?B?c0xqTWFyS2UrVElnUmtTenY5UWk3NTB6eEV5S1FyY3ZPdTJZd3hoUnlIMFUr?=
 =?utf-8?B?TnpKdHhOUDR0ak9wcDdNbVBJNU9TclJCMXBFZnJaSlNXT3FTSGJkSnE3Z3pC?=
 =?utf-8?B?UHRUUXNUSTcvZTdVVnZPY0c4U09KQk5WamgzWlFOcCtvbkgzL3BkbHczL3d4?=
 =?utf-8?B?Q1Bxb3E2K01MTk0xbE5YdFM1bjdFZ2FvNG9mTUdSL09nbjg3bmlqeG9TRmFr?=
 =?utf-8?B?NlRxeTJhYjdTWnhOekwvb2NEMkYvL0gvSjN4Y3BlMWpRdjkvR1JiOExMMzJ1?=
 =?utf-8?Q?vMU5FfuAWmTmN9C0TuQKZMs4iTp8K1155Z5GE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4bd3af-369a-4ba1-372d-08deff8543b0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 13:08:16.7334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQOvjSKqRpn8fltGjbDKAhaZT/+DZgcYQeYOPmqbk+DjeWMekIqmREb69yozp7Vk9RMhDGhbqU90wchQE+Hf2xDjQMPn2h+dy6CHfkwvD4u0lpHWGOnK5hvnrDjel1Qy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMZPR04MB191951

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

