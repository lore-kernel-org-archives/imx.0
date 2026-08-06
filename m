Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011016.outbound.protection.outlook.com [52.101.70.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D397544AB97
	for <imx@lists.linux.dev>; Thu,  6 Aug 2026 11:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786014098; cv=fail; b=EgdQfhVODKN+N4Hlxsqjq+fEFfBQn0qxnBXcFZrqLc6TRufkwvPO4R810wCkKJjzKFweX8JTMGu5VlDZccArDM3OxA4ttVlVCvp6MfnJpixtBxH0H0iimvnFvUkbylatJ6fTxmBh6vf8zazgFJLLul3Ubjb84WNUEyCedNdykQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786014098; c=relaxed/simple;
	bh=oZQvScyA1zqJV4CC6foAQh/CAQe4pGeAga38F8pulH4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=X4XatINOP2XoFQKKga1XODQFO+Bd1WVEzhI0+6jHnMo4PpK5y20WkHDlP/4AIDFQufgiMSa9UqbVgUfQyeGOfjq5W6Lt29lWIsyCK8P+F8vM84gEzot6fP95xVjFpPTxw/nT3GKBiDXf9ggLqJkR4kthQNE1OnKRu/akdAej8Qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FV6NCoki; arc=fail smtp.client-ip=52.101.70.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FV6NCoki"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hwJbpWES4vr/U8mqmQr1QMnY4bPxsI5UeantFgRPfsHFSTSf+lYQigB6SJWcLiH5bGHeuYrGnhlvbF5Ao79ETFT1riCMVsF9iBMhAL2aHhefz8jBlXPdUVtmKbwCS4NzssR3CFsX369VN1bUACRaIDwGNBjR7rjDD4LWgqbXcUID/tu+vvFKNbNguwIC4ng1XjK+stuFc2JtlxeEAeK4xgQV0mPkjj3D2epDtoYyRxFxEk6IxEEMPcnixzgkCyYkU8a1VixLXG5U9DpqvwCNXufcHPr7/db+qb/K1W5J8nQQ/qv+PUH2KDuQn2vPQm2iRcGt7nOfQiZP5uzI7/eWjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/T28Dv7KzFFE9nxv/81pMJDpMBM2QOQ+wFzcBBIp92M=;
 b=N+7YMwOfpH0iunW2KrNE6sddxS2AwERTVbU+2p/R5dalgqvS2HBfbe4hZp8bxG0INKcJ5pxJnWr64gorrRJth5D8TLOGU149mbV3hwYdvfNPtDwZmob0hAYd8xXpST3foMsVtCzhKydd0dR9i+Mkju2ZHCulVocMz5j9/8ua0DkMYZ4eAJhMfkSdtFyphBDNiLy37C5I6YicwHayFfNe2vsSt2bgLTWOWIT2MrM5jTWQ8cA74umXVuZ3G9Z7N+rpQUce78uqoFTcqSN/E9wwp+yEy3WtrSUSj16etwbjX8BqXzSSUCCKgrRv6zn+gjF6p+rb7ETjhwJbf64+9Weq8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/T28Dv7KzFFE9nxv/81pMJDpMBM2QOQ+wFzcBBIp92M=;
 b=FV6NCokib8sDEtnmeY52u0AycfvLAfxXevEkcvkc1SrH/P8OA0JhyXL4mwfW5sA/Y2DtgEL7hiBPEu1g/kyEf2K/AFIHRlBUoeShz11cJVXygvXukw/Vsy4+/dDJDk0wtDbxyFxWvrCV9crgvemnfUkVEx+ILHgGuPsvM3iCajgoeatYE8C1ELpviDlQJVBqJ29QpqN/tV60OLkaMrIZJc1M2efi7i+jkPN4RLJJ2EPdUOuybTQCKT9ZKmE70Me4PERzRimh5iphjneF2JV3D4XOlFzsC3Z7LZZeUe5CSG8XTLKU+GaSNWA2inpGrYhunEGiGNicntlnEOBAwzK3cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by VI1PR04MB7007.eurprd04.prod.outlook.com (2603:10a6:803:13e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 11:01:30 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 11:01:30 +0000
From: pankaj.gupta@oss.nxp.com
Date: Thu, 06 Aug 2026 17:21:40 +0530
Subject: [PATCH v35 7/7] arm64: dts: imx8ulp: add reserved memory for
 EdgeLock Enclave
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-imx-se-if-v35-7-11b25bb308ef@nxp.com>
References: <20260806-imx-se-if-v35-0-11b25bb308ef@nxp.com>
In-Reply-To: <20260806-imx-se-if-v35-0-11b25bb308ef@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786017100; l=2461;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=8LTJ7dQk+ZmHVQUVQ7z2QFEU98qQ6ZendsUWTwEehrU=;
 b=9c0ZYr416VSLaonlDDQ8/+IA/WP2jwjhskXZEjBpxRqUeaz1zYP100EsBHERkDQR93axyYAKH
 VdNMBF5ohZTCC8y0zCQf6XElBkwT07LSOFyX1yfms8wSE1uGrS8oslq
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2PR01CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::17) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|VI1PR04MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: 19e113df-1617-4fae-f31f-08def3aa119b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|19092799006|7416014|376014|11063799006|56012099006|10067099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	chRxqHg61Z5A88sA9TfT2lb26niqOT+Txc2JI30ybbnkQm1Iz+OdGnOZsKC+i21Pc1+RGbhpqcpjFBAulhKueVMlQdYgSQST4gsrT4WsZbUq7Krz9Hu4UqGfprlpSAj46Cqq3mS96M/0zzplMNsaTVwLLX0K5LNT0+9YtdZHVAGY+xCWaU5kzQzFtTLTGSNXuuJnVv5ArllI1xf2e1MIM0cGynvir75OUuo3ouag5ivabJ48kuUdavEu4/XbCN6WUlqdNySXQTHRTSFD6M9BnmEpgQxZj8Mg3Gm1BpkNNpG03aviZHucF5ZOdCspNG+++FakvYAYiGprq9BtZQqPq83bU5XCCSh+oODbdkDpehX/Bl9NqUPH5ULttil/Bbo5jPH6mw6Hvn9DFm8xEvjSnBJNpxmJGtDUoFW7qurv8vYjphnVGNUgzTtBc+fgfkzOMjzSQhcWP3EZoeTpoo8cEiwAOdlZzWvXjzfv4iyU+ZIt1skulWvTTfmIpyD+04p8XkE91X+6j86/MMNX2zN9no0l/B/YrQ78HhOWQMkGjOOQpMnmPGTfEqYzKoFff0nEov1nwPKJlcbHRbApvmHNygkBxc+mcDz8g6c5Qqyo4h1iUv8yB/hvTHENfNTyLySDvqY4WDOgKyJKzvcJvHC0r8raByOenWibIFe8jQjzcoPA/oz/lqP9ukIT1hXqH/1rUrs3T1kt/ANJrjGYOhQ2gQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(19092799006)(7416014)(376014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RndNc2lwT1g2aFRBWTJnck9WQlROdEt1b2xveUlDUUQ3L0RGckpBVDFSUlgv?=
 =?utf-8?B?SEJUUTl1WUx4L0NjbHNFb0VwdkdoeWRxNmQ1elZZdE5DcTdLNW8vc05CdHRu?=
 =?utf-8?B?azNNMVJwNVJ0cXYwMUFGVDBSSitUSElmWkpocG9TdkVKYXFiM243bTVYOGFu?=
 =?utf-8?B?TVlJNk1CNWU2WUxmVHNMait6b1ZldGtZVmQrZGJQalNrWHYybUxvdVNaRWVT?=
 =?utf-8?B?WXE0MlBUZnJ5UFRPWnRFWUZpcXRmemN4ZUMwRXBwWWZuUTRhQ3Bqb3RUVURS?=
 =?utf-8?B?d2FrZ2VHVHAyZHNGY1ZXSXdWakFRT3F6aVpUK1UzQW5wUEZhbzJVeFFNckFH?=
 =?utf-8?B?TE1CTE5SUHVuTFQraHlyR29OSnY1aTJnVTdZSzk2RVFBa084azM2ajRQTE9B?=
 =?utf-8?B?S2FPTVlLTjRrS3RsQm5RbWZGMUMyRXBzUTdNZ01adThtVzJpWTN4Y2k5UTNC?=
 =?utf-8?B?ejR6RmNkRU5XU0xvQWE0eTRuV3ZpRXFMQlEzRCtlM0pTdUxyYjBLWU9RVTBj?=
 =?utf-8?B?VFFMbC9nS0ZsZU1UZ1JFUm9SVkRkTHhxK0hLVGJ2NDVtWnJuZ1hEVWRKWThS?=
 =?utf-8?B?bDFDRFoyMjhER1FJZmUyeXNvdUdTVStidFR3QmU1dUpjdEQvSHVERWxaS2Vy?=
 =?utf-8?B?K1loeE1ac1JyVFQ5emg4OGc0WmNNaGc1dU44em5aMjNXSUZWbFAvTVF5VUo5?=
 =?utf-8?B?N1FOS2VCWUVaWjVqWFRkZ0tlOVRQVDd3VEZUTmE1MGlmenFkMTh0MjJBbE05?=
 =?utf-8?B?NGlPNms0dUNlODVzOUZLcnhoNzRuOHVxVHAzcG8wdXl1ZlMzdjRKSzErUlVQ?=
 =?utf-8?B?VjU0UnRyTnZVeGNiRERTTEQ3MjczRzlHRjFONFAxTUc4UE9FYVNTclhlbjcy?=
 =?utf-8?B?NlBwazVCVUMyYnU3OUdZdy8yc2xNTU5RazFtQ1MyTjhpSE9jWDdaTWg4L1Qz?=
 =?utf-8?B?bDZ6eE4zT0drTFpEUlhia2NZTHBrZlZKd1VqNFRSYlBFczRWV2hkbzhxbS9F?=
 =?utf-8?B?SVYyTVdna1V0WW1tTVoxMHZkTDFRam9FYStVdE1WKzZJSTArOHBxd2E1azFr?=
 =?utf-8?B?ZVQ1QjN3dXhMYlZWR0w1Qnh0TVJtcmtFMDJ0Yzh4cFprQTg1dEwzTjZzUjkv?=
 =?utf-8?B?SlpoWmRSNjU1TUtRMGg1QmdiTHl4SkJoT05sczk4cnRCMXErbngydnRMaG92?=
 =?utf-8?B?bzlNUHdVWDJWQ2ZHOUVyeTlCTld2SFc4WnlFR0JCY3dJUkZiSHk4cmFNbE1H?=
 =?utf-8?B?QTgvRWw5SGtIV0VrdVk3ampGdWo5dG5UWVN1UEczdW11cHpJeXJteEMvNFA1?=
 =?utf-8?B?R1c0MW9SZUhRS0U4ZmZ4aTdYNFQxUnh6b3BvL01UdUZLakk5NzNlUEdpS3lh?=
 =?utf-8?B?cEdzNHY5VDYzZ0RWV1NHcmxxaGs3RTFVbEtOcEkzTmZ5Z3NqNGFQcUd4SHVy?=
 =?utf-8?B?QWhFM3liNitvZnZwbkFjYW1TUkhQWE8rNC9WTUZJaVV3Y3lJMmdVN1NKVVhl?=
 =?utf-8?B?R0VKY2R4d1lDblY5UVFlNTRxbm5rVXJjcWphYXZhTVdhdnhsY3FwUm5CT2dW?=
 =?utf-8?B?NExtVnpNMGt3SVkrU29CL1BiV2JkSTBTQk5TYVZpY0lKck9Tb1QwUGMvVGdF?=
 =?utf-8?B?N3V6L0p4TlRtSXU2a2FOa09QUDl1MDYyUmpMVEhkS2REL2pJVk51YTFaT3hP?=
 =?utf-8?B?b0I1L2dDSGg0SjIxaE1FUmI4L3pxVFFNV0E3cDZ4RnR6MWIwcGFiWEdHWnNz?=
 =?utf-8?B?eDVxOU9JS1c5NXN0aHUrNXdueWYxcGI0WE0rSlBXd2lwVVVSY2xJUmJDci95?=
 =?utf-8?B?czlEOXhhS0VZRmhqVE4ybUpFK1hYQ3plODFLRHowZHhZY3Q5QS9TeGVBY2R4?=
 =?utf-8?B?QzJMb1Y1cFpvMU9zblB3ZXpYOTliRDVOVmgzN2VieG9vNHZqS2txYnYxMW85?=
 =?utf-8?B?S1ZJL0xhcEZYcDIvU3B6d1Rid0tUb0E1YmNWZnhJalNGamVQOFNvdStLQ2VD?=
 =?utf-8?B?VSt6czFqWnRzRC9QRjB1a0I2SHBrN1NVNCtHc08yOEZXOEgwVk1CRThQL0VD?=
 =?utf-8?B?cUJCSTkrcHVLUUd0T2E0RExvT2kza2RETlJrVkNtZ1k0WFVzVVpRbmw0WXRF?=
 =?utf-8?B?TGhHVG5UOE1GTERCcmdBbEZKWG45Sm9PaXlqU0Z2ckk2MWNpSTRPQ1NCQ1BH?=
 =?utf-8?B?NXJlYVBNakhMN3dtR2hFRTI0THZVUUthMWxKK2Yrdnk3YjFsa0MxVmsxQTlw?=
 =?utf-8?B?L0JqUXl0K1NwZE96ZlkxenNCVnZGamVZK1lHZWFYV0gwZk5WVEdZT1U3SWo4?=
 =?utf-8?B?amFER2hQaE55VkVJaE40TkJkV2JIOUZpaS9GdlRhR21QVGUxV1FIYWtUOGli?=
 =?utf-8?Q?IOHFdcXHPxwv7EF/x1d/hFsIPXumzPIHk4Szn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e113df-1617-4fae-f31f-08def3aa119b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 11:01:29.9693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9zxn5nvFMWIMsyin1hxhEQQDAgvYF9lebCzDksSSz38mzv4UyIbPx12Nb/n/5mbsxGdTBx9FVUDp6klRMw09L4mnkOWw71FW97B7XcpKJmQh15SPMJE7DiTVIvYOMXzx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7007

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

