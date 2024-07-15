Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011021.outbound.protection.outlook.com [52.101.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3CD18C188
	for <imx@lists.linux.dev>; Mon, 15 Jul 2024 13:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721049466; cv=fail; b=OWPF5Jcb1fl48cgKZKSlfC91LgryLJS6E1iANDrXSIlmrHiQF3B9N05SgCsgC4qiyi5vULNLq3PqZ6yp+83MVYHG9cr/NWmsT1b1tVOW8V2fs1hAzTEwZadXLf0xu+kEjEFv2a+5s41IitFh+fO1u/fIe3vDdUTLldZibjPi7ds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721049466; c=relaxed/simple;
	bh=fQJGl/ZiRIXqNlN5JBHTxqP9iRdsz9v+tM7v576RaR0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=UbBI+tQWyQoqrO0/xbAQl1eiiG5NsJbAGKFLgj18WZfL11KxB1dnw5ft4WRyywmmUd5kivfI5AgTxyzQijAQIcaqdwN+8dVyE1Zzxdnijd0JeVBUNzycirFNA+sxg4LokrX0wub3BqlHQqToetHXoredfdbc3IAIIiUIKT6HX/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=eaJJ1A/h; arc=fail smtp.client-ip=52.101.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="eaJJ1A/h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w2uT5rPXUjzQ+lBSm9nHS9LkbSYfvfq5m8d5HiHrK5xHRnLMhXDSkwJvOiLOZnQEjYgex9o2fjcu7H5OIQ1bR+w5qhe1ZhCMOq3RWJ8EwJu+fpMKPlgzrFSZQtANQZ7tsvEiq/AbjTl3FKUu6igBqEpIdS93whSbnPsZ5Zhl+5W6hMaiYDx1t51japn1NSkBWjIxtsytsPx2aKVzgZZLnnaGVt6cpvYK0rNwUBTyxTQoBVT1yGRVWMEZS3jEoVTweaE8u1d+9pQNFJ4iQirdrYtkxgLBCQixL3VZ1FSTnAgA9sNXZKzpbPDkf++r3WkqTX9CbilNtbswr3MBkk1a/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRhW5sv6S8SgfAF7X/HW1mHaiFd8BTr7wZDpXeneOoA=;
 b=HHW15lYp2cMDWuGVkxV5XxFjNFcm8rKcOxZl5wBUOfgaaAvohWMi0TF4m1RMykf5V/KqL8A+TD8z3HpiJhwKB7Nn4iNfVb/l5q8EbkQMQb34qHVpqRHfnxjSH816EtjC85IYZPH+cBQEduMmEwevlIxoUneb9KYN+4xWsH30NO7hhPBbqN2Eg8q5ybBNjm/e0mA+ns77lBzPy1zBjc/YLN79q/vRWKXSUF1WHKYKlXfHm431D8s2TtUPtEcx5/4MdiN8Ck7vQYPD0vA+XB3seXohupdC0ToPA1gyAzKwMCcWLDpZjl9Narv1qpnyEJNNoD7opEmpRcb7J6cCyu3XDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRhW5sv6S8SgfAF7X/HW1mHaiFd8BTr7wZDpXeneOoA=;
 b=eaJJ1A/hZKHoYnVPeBNg0xP55jnFt01ZN9+eq0OTJkx5H2aT8SYzKv9O/mTqpCdjGm5WKGDn2gXlgvYJ582T+nQ55RR4iZBGdn47aTeSCrCID9euMXsDhlpAPuIl3ecbVAsdhQk2Lt5tLwdHOkl7QwVHOTWOu4fgEcaW4+j6WIo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7)
 by AS8PR04MB9111.eurprd04.prod.outlook.com (2603:10a6:20b:44a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 13:17:39 +0000
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::4fa4:48:95fd:4fb0]) by AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::4fa4:48:95fd:4fb0%4]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 13:17:38 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com,
	Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH v3] arm64: dts: imx93: update default value for snps,clk-csr
Date: Mon, 15 Jul 2024 08:17:22 -0500
Message-Id: <20240715131722.161135-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::22) To AS8PR04MB9176.eurprd04.prod.outlook.com
 (2603:10a6:20b:44b::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9176:EE_|AS8PR04MB9111:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e518670-c91d-41cc-8dd3-08dca4d07f88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ytPmn/NrYutt3d+0WlJGomq8dGsL3bkQyIi7E/h9TpdktIDcoYUooLHPm8A+?=
 =?us-ascii?Q?lsMTnDJgNTiiaQgwtjoFVJM3xIqTvPpEr00sZ1RkA8pkMXKZNqizUM7OSy3K?=
 =?us-ascii?Q?ULDVnZ7oZtKfPWNvZgBnUWeGro6n48iFfBoeYLQnIQ4zZhaA3lWARiW8AvVp?=
 =?us-ascii?Q?UsfeGbBtFOitZmPpx3S/N9KKXDK9v6KcG20Hf10IdRpEZ+NQldc7BmR06o/F?=
 =?us-ascii?Q?bt3CdsXCK8KC4RVXzIRg2cjnQf5iLc8V3DlWZJd7ebAa5ZJw+G7mGCM4EXm1?=
 =?us-ascii?Q?jnfHuvWj6njARlI4pguu7PM9K8JUMDpfW9YYdJILUMSMUEU+I/D015kdDyqx?=
 =?us-ascii?Q?/qps97HJ0bVjU3SxaFvyR0rsJZGUH4k5tLDnENrkOhiysSimnUicmFgZVDHk?=
 =?us-ascii?Q?lx1ozuwM6er3fLh3Is55AMU5TnpBC6QC9JLA7I6wSmAFoO3aQW0savcMF0Tm?=
 =?us-ascii?Q?Y1UU4pja2gwRsqm0Wgjk6NoU0AkDaSC+M+J0+trNoAMcmUYEAnBGNgN/rKPt?=
 =?us-ascii?Q?+9lTrykXJgyx29s0Ijm/V3j7YBxYIaY7ABJKkSb4nFZKpIYZkI8Z5Z9w5PsR?=
 =?us-ascii?Q?DJGD2npiSLtxN+41mOUlGJqkdsYmgt7SWL+qZPBBxpKV9fqbzLn4lpzQnCKg?=
 =?us-ascii?Q?pwUb+0Uj2t6sOv1OivY1s849Nt7ORntck/qVq+CsLVSmAlhVF7nQIJ7gzGFZ?=
 =?us-ascii?Q?AN3MU2SdfdfzULpJRhWjEjx5u9BIYLMxEBWGXKp4jjCv0+kKLlfBrkY3uZup?=
 =?us-ascii?Q?8uPK0fEugAAl9sd8FkboAIazq7zhvxgyn5aMs6r/LDu5/5eo+zziLdQuheGs?=
 =?us-ascii?Q?hzwD0+r14KATMMsxYOths/R2iDRF6exUYmrYWOpNhVNR56W1iXUQAY3Lvzty?=
 =?us-ascii?Q?1ytGVgetb316KQoBX9zTWFn7U4WRY/Ps9ddhEBSQ1K4GgCUVIfJEXisMowOD?=
 =?us-ascii?Q?30rloruAMBeTnTFT675t5Zp3vB8kvSNXQ0s03qR+KGKQLIb+/TFLRY4z2Nt+?=
 =?us-ascii?Q?jNSwdsa51rXY14OzGG5dpL3myxXZDV1WovZV3BSMarmew5hHhsEAj6IshU4y?=
 =?us-ascii?Q?E+GP4ONoOxdSRTWbXYPA1qL6vyvDWSzS3HmEzI2WNilmBDlEuBwJ34LZTzEk?=
 =?us-ascii?Q?EfYUa6z8eTwLA+xHy+79SawCSqgL1sjwAKLKNp5MKL6hTHPlgtFUnHGg63qu?=
 =?us-ascii?Q?wudOZiXQ0qexxWbfACrapQebR71J5XBzeDcrOwJLBv79GPZz+Xzm5HJVw5td?=
 =?us-ascii?Q?g/eb0/teqjrvaO+GJOcyJvxr9mOZQVUq9FjbyqcGC6VxMn6DNhWTOKEuMrzx?=
 =?us-ascii?Q?BiuSqnz5PeKbg8Ndkp7h2n+GggPENN3lT+Z887LG/+PobDmreThRmSmfue9Z?=
 =?us-ascii?Q?XXwYg3Sat9zLaTjxQcRf+xvuXJ3llEK8QpBax4sSryDLYOXe8Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9176.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RKd8TxM1Y7XnrUYGZTVUJb8A3ds2KD6KQVw86UWjO004smE2O3YWucK+i9JI?=
 =?us-ascii?Q?dnjMVtB+SqXFuEnRkjxdRj6eYHrgUbqJI3W7R6zxCrkbGQbXAT98asEhkXos?=
 =?us-ascii?Q?Jmql+Eu5xjl4RcWeg4T8hmp2yAnQKWgCoHIVcNXqZHTrY4viW4HFFKRnyfh1?=
 =?us-ascii?Q?QZcdECaWeclKOi2hwpehnjDeaV6P995M/Hk11qWf8lYMzM7JWo+R2EDOk6vh?=
 =?us-ascii?Q?5NeqEcGKf+IjON2duf9J9GcOkoYnvrVGydknV6xKRaD5EvMoGd9TBmoxv5IS?=
 =?us-ascii?Q?s9+JC8nBs1hT0gLaarBs1VcyGyF/LYhvfSPN4CEjaIECzLUq4KTDFrLImQKA?=
 =?us-ascii?Q?gxdKKuPTYtadi/0z37zsgI1Uv9RAuqdPnQ8CPOjwUXoct5QA7vHnGBKXNdu6?=
 =?us-ascii?Q?j79HgCR5adayvmK7oM4lMSSZWH15wi+bN4rbu9nbF3eebvkK5C/F22faq3Wc?=
 =?us-ascii?Q?9P42oP7WHXLDBsRwK9HTTYdY1lSzlx6ZQAbgaZxkuJC8ruTgV6lqiGyclBtl?=
 =?us-ascii?Q?sJR5L+iiOciE6J/j3J3W+5DkoGG7fe3n+Ttlu/QKj02BTec1bsO/71xWc8d1?=
 =?us-ascii?Q?hCUmiShtHsNMBD2WbYL0hqrc/u2joLq7VQAIGqEuoSa+CcNLCZMMA94+x5N1?=
 =?us-ascii?Q?rp7CPbn8lQeMx6txh8LhF1uxvk+hSj4mqfwtcnb6dqYIrfr3bC0wLz9thwg+?=
 =?us-ascii?Q?Z4QfvGNPou0nYYNH2FEEanY3vxOz9o/M9z/52A5J4Dr6/nR6tDov24zyKuro?=
 =?us-ascii?Q?PEwajzVd1kFpymiaTsGlOVQGff0E39g0LLzpSLgNqvCIWV3MS3/lan87aRZi?=
 =?us-ascii?Q?bgneaoR8EEBAy8KanZeWmkr7WTgzxMipmP26pnRYfelhNnSZFyVMqB+nt6m2?=
 =?us-ascii?Q?j79cwiHHLcmdlXr1WYn4t73z4/yg0ZYei+yMla+TZYcSTQTFPsMhu7mUyihY?=
 =?us-ascii?Q?2ZcCDuu8pabHflA1JmY7QGi2o4tjCFDrL3kRsP2axdd0PAI7zq/IXssJ/Cgt?=
 =?us-ascii?Q?Z2WiIz5ySm5IoEHfgKzyHpaCzNpAaLVA/F3TE8vrkkfjLZYLRDPj9U4MsJyG?=
 =?us-ascii?Q?Pxd6cHyumVrM9Q4MNq59ggeNaM/ycBDuI3q2mPgQCh32Flgd9Dmk6LRRQg6r?=
 =?us-ascii?Q?cva7t0wwM+q/mQ224S3jy5+E8ktZAwS7CvavFs8MrGSgnJ3pKmDxsReN+p2g?=
 =?us-ascii?Q?aXkkbc7gXJ9STwu8ngubKoWsIUvqL6JvDhQcZDU2hXSuTgRfDkXT8dqzy0H4?=
 =?us-ascii?Q?IFZpOL2sX5KRfV3BjenqwRzvISi7DBYeo2fiTYJeVF2rQTmUZoBboE4i0M5y?=
 =?us-ascii?Q?KlzVU7a0sbazEO7Dg914IJ7/AY1RuYE7hg7XDNw5CSeU67gVDvd/BIbhwG0c?=
 =?us-ascii?Q?o74K6v4mhhLiId2wcDUF8j3cmp42Tgf0uL1yT/yZBiPDbT8gisYFtvP/GDbY?=
 =?us-ascii?Q?QyLOnO91Nkg8ML98VKNFjuH3lEyBOOKEzAxXWhWFysgvtCmkU4MWIm/rZE8X?=
 =?us-ascii?Q?vE7G7KXBeZeK+XZACpP6DNXJtuUSV2DAJ4AfYBmKrTIVJuUmW+mJqML9l2eI?=
 =?us-ascii?Q?BjnOelWSXVCmFtaK33MIIDXo1N2fRsUNhaGyvADS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e518670-c91d-41cc-8dd3-08dca4d07f88
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9176.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 13:17:38.2667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sRQg9nF80zOQh3Sey3+Znkp4JnDHOkvi7La4PGaU7ft9iMzfK6PnVY9tkEtPjYerlJeF42EhEkqP7opZU+Ycxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9111

For the i.MX93 SoC, the default clock rate for the IP of STMMAC EQOS is
312.5 MHz. According to the following mapping table from the i.MX93
reference manual, this clock rate corresponds to a CSR value of 6.

 0000: CSR clock = 60-100 MHz; MDC clock = CSR clock/42
 0001: CSR clock = 100-150 MHz; MDC clock = CSR clock/62
 0010: CSR clock = 20-35 MHz; MDC clock = CSR clock/16
 0011: CSR clock = 35-60 MHz; MDC clock = CSR clock/26
 0100: CSR clock = 150-250 MHz; MDC clock = CSR clock/102
 0101: CSR clock = 250-300 MHz; MDC clock = CSR clock/124
 0110: CSR clock = 300-500 MHz; MDC clock = CSR clock/204
 0111: CSR clock = 500-800 MHz; MDC clock = CSR clock/324

Fixes: f2d03ba997cb ("arm64: dts: imx93: reorder device nodes")
Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
Changes in V3:
- added the fix tag.

Changes in V2:
- improved the commit comments per Alexander's feedback

 arch/arm64/boot/dts/freescale/imx93.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 4a3f42355cb8..a0993022c102 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -1105,7 +1105,7 @@ eqos: ethernet@428a0000 {
 							 <&clk IMX93_CLK_SYS_PLL_PFD0_DIV2>;
 				assigned-clock-rates = <100000000>, <250000000>;
 				intf_mode = <&wakeupmix_gpr 0x28>;
-				snps,clk-csr = <0>;
+				snps,clk-csr = <6>;
 				nvmem-cells = <&eth_mac2>;
 				nvmem-cell-names = "mac-address";
 				status = "disabled";
--
2.34.1

