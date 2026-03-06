Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010069.outbound.protection.outlook.com [52.101.84.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634C021576E
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 08:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772787049; cv=fail; b=h14tmcTLqafqX4QBUE7cL4FiJsbTattShLyIBZ2wnhpBed1ZVIrTJzLO0PdqzTq2SZ+QuWk66R9vp57n+Hrtomcu6NOOxZO+iVP9kXqBWlcQAYUTJyRjg78pKaqgMxqyhEAYLwocWTgzypCLoohYHFIumosd2DUfGX8wYJA1N5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772787049; c=relaxed/simple;
	bh=rFozy6R/0OMeL3PwIcOKj6CNDgEcrlAdDc6u4W2oqMM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=MG0xQTQj03OjxaLTzoD2uPlp7VPw55VokG3T+HKzCJ3wUjG0Eche9xHAw0qm8vY8jCjd6sbIptwaFutI48DSEwEl34QL0dphiLuwEjyv2dAs63E75r9orXsdo5AuHp7thVTvs5EG4FORGtDttpeuVvPKMoONL1wRcXurygnvfcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hCUIwnY4; arc=fail smtp.client-ip=52.101.84.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hCUIwnY4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SOmksP+B7oRNef5J9s1//3yA45mM3LHavBn9Bi/CF7Al6BbMPUS9NJVQcSU0N29wbI14fKMDJvVtob5FhTinNyMYTSPtMWWjj4zRnu2KRitVGuJLKgR+8YH26+7XNsMnor3rjdzMnEd847UNrFSzHN/Hn202gSCUlxGtS0ALmFDfZUeJ634CF4qFF3g37VEGmhK41HB6w9j84s49t5oDsww+jQ6Hhb9KWTGjtQEyX8KxP8RzD9AcKw6NKbPmnGsZw63WgaU90Oi6iqXlvvDKqnDKGBJUCC1Wu6DPl/fvOEr5Q2k+8GedrqcWl/qaMYQj9IyI6jA3ytmMyBfhvxLigg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gu+/8vqx3Y0fQedhAyZ7LwDMebugV87jj3FNGzHXIeI=;
 b=ZknC7IILa6SfmyOgaFy14zEg4wLkLsIfvB6TXiX1mPvHWo3oLtSBXcoaLUe1UXWY9J3ihv5HSRp/mZ47vxTs7+WUcf8H+Ly2hlQhM6uSK5dG1c/Hczrld0X5adoql1IV99y3/wpKjpQ0WoM1bFOh+rcA75XD0gY0tRUeyY50IuLhnbPiSRzyOY30RAYlUGvQ7bEfOQTT3i1WEjWGr1Kqfg56+o+ZHZSlDDNXjZcMwo2GoOAbWcADhUPeEfUK8yvOxpuEnHC2VPnS1VHzOcVzzAAkg5G7OXV8+0f3B11bT48ykbmSJXFD1u4ISC5GFj1sX7nxUg0peLATtbDIoa3q0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gu+/8vqx3Y0fQedhAyZ7LwDMebugV87jj3FNGzHXIeI=;
 b=hCUIwnY42jVlq4KnGz2yrvp+BQS+xYvDHmlu2wBlDVgtYOV51OurHzpEfgTcrW1/o27JYZccI6qMZmdC5Or9kkt21JUM5M3CsBmmhbo67fSu2nyFVx5oufXQOsM9+BOP/r+HQRF2w55z+zGeyBQu8gqjvnuGtbtNQYy0i1ZufdyM07wt9GfevzVJAxv3OJwSY89qkp+hY3XwMB+XnMKsm9bMl9rcahi1DpvYUjpit7N8LCvlvMbuo2I1jPloamAHys7cj7V7j8zluDi6SEHAzJhzgksJecJCHhrB49br3QNLASt/6OXlGCfRatd/nHSvCBhIdTVJXuZDCfTgJrljOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by GVXPR04MB12367.eurprd04.prod.outlook.com (2603:10a6:150:31b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 08:50:44 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 08:50:44 +0000
From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
To: daniel.lezcano@linaro.org,
	tglx@kernel.org
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chun-hung.wu@mediatek.com,
	walter.chang@mediatek.com,
	jstultz@google.com,
	amergnat@baylibre.com,
	aisheng.dong@nxp.com,
	jindong.yue@nxp.com,
	xuegang.liu@nxp.com
Subject: [PATCH v5 0/4] clocksource: Add module support for timer drivers
Date: Fri,  6 Mar 2026 17:50:17 +0900
Message-Id: <20260306085021.1231032-1-zhipeng.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:4:186::10) To AS8PR04MB8420.eurprd04.prod.outlook.com
 (2603:10a6:20b:3fd::16)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8420:EE_|GVXPR04MB12367:EE_
X-MS-Office365-Filtering-Correlation-Id: e222ab4f-e333-463c-385d-08de7b5d73df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	J2M1+wcWC2za9yUDlwx/UgnHx/SVgYNo0FcrKkaK22TqiRo9k1xBD+mTMLQLErFONv6HglnNx9KKGczRQ7vE15vqOb5u2Ubmgk8xnt9HPMeY4/nbeq6LywzWyo5CxHnVRtgfArGH3vvE4riwQ1Tzrsu8z9Thfj3+b5LQPvzqJRbKsHWPYub1aOSAKTG1cCuEL+95gVwembNh9Ui2eFg+gdmI2e7+DhRc60wiSPK9CkoFAIszE6MMCjAJpb5H7PjhQZ3bah03oSCvyTtVb4aYaGI+v3V66KK5aJ1v6wzRbCWjEKapfJ+jTmp6T0AUZj343dPsPjki4kcajbmSZ1ktrefD0KLvsfLYkmMpXlBn4k2ehZPeVgrsFHfB4PkV3ft63/sjUKFYnEQsnK/CmSVdnDFukqOuF7AhqS43qTdLBlPZ8auB7BNNDGAT524HrCV5vrrsrokw1bnMl1MHawWFwR1YfjSx81BQ2iLblj9Ve9fbwrLgVDOnfuY9/AulW5EJtPIYTq3CAWclwTjq4iaXO0XEVTaVvXAT8sII/4aqM/16UIRjNhmMZ1wdt8BshYlHA7ymPcJNQZA+896/IVYk/xlFkMkd6bsudY6jRJydkyEVFvL4UfAY9XG0gT5wJimkv0sa8Y/wqczVESRfniH5a9QpzLN1ILNPrvJn0sxsf1JTmiqfbMNqWeZafjzkpjeaeKK2R7nL4MCTQIRHP6lPWX+CQzehFh4LeC8GfeeEMMb+YlupgowLEIcjm/MOsZudQI25xFrMX0Cgir+OCBWZO/PiQnfKmewd9hclzey728E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sFnyLvYLCtdKgxLgZjvWsArkgKIBO2FRtQ979rpIU21y7VUU+xvLIjTcpN++?=
 =?us-ascii?Q?SY+oVJ3llt+NjRvV/xgqWMMqssUg4pKYUx31rD4rV8dwtE/WOntrlQzh+gBs?=
 =?us-ascii?Q?EjCuXWAAbGrMICIy601vSc63zbcwi0GBwpEOR2BBtLwENf8DRSLJjo5XRpDU?=
 =?us-ascii?Q?in7GsO3G/OwUt3o7g6QyIeOahaRC1GFCMCWTj92+sjDjAv369tajKdznM4aa?=
 =?us-ascii?Q?nfS+laprsZSmNzA7iJTqqffCz/2nWm5wYViwUAZfQfTwZc6K0Omo4bJsQC4B?=
 =?us-ascii?Q?SwDudpI+FwFxFa5S4gykjma0I2OBkeTj82X3QStUVA3IWdJQzVEu47okS0yG?=
 =?us-ascii?Q?rKCOTltaoeIA3nnpZFSNcCO3qipFdl+Vu9AF6BqogCL3EjILn9dYwzc3vzG0?=
 =?us-ascii?Q?dBuS/u3fgh6R7uQALIwwiAeSvvZ1sqmD3P7cWoElXDZa6PvmcehIWfZLElWx?=
 =?us-ascii?Q?OwXP8FMGJUZU97xMMCWbgnUqMA5UxD4R5TM6FqokB0pIsemKmtJs7PggJ2sz?=
 =?us-ascii?Q?UK0NIAThVkImkoK36xXpSfnY6smybtalNMWoEsVLqG+SE4nsgTUP8c86U/hy?=
 =?us-ascii?Q?kLb4omaWARVn0JbAjs+3fslyJXZiOHqc2GNwa7+MD67SDdaF1f6CE1irm4Yp?=
 =?us-ascii?Q?NUnEyRH965AWNV2N7T7tBJhKeuPbvBbWJxA1ZaaZ14bgYJIL0DmUbyMUH8DJ?=
 =?us-ascii?Q?G8rgRDenGVlvUI7BIARshQTk4rUATbWrs9Fbm36eGAHuVIRUVWz7gEXjidrz?=
 =?us-ascii?Q?pts9u9m8pXIDQ4i6nbszDn9QC9uBtR0m4+9KAfJvbObHw+36jdqi16UrHuTM?=
 =?us-ascii?Q?BE92qT9W0UtZ27kInusl7pQeZnblvKJyq3SFm+v6jNGU913KPOD9r/J71VR9?=
 =?us-ascii?Q?ElrR5e0Y7aVlwybRe5LWU6M9OSXR+4CY7z/1S7XJLicFOE2jLr7wKYEIODHa?=
 =?us-ascii?Q?FV4e96ma+nBgqAnUiTMHjiPZORPvaUgBJFUAO5c6sxc4KWTgqBs6bsP8BCCA?=
 =?us-ascii?Q?t1RiW6pbu/oM8+w2877Ps5S60R67PLOY4wkTcvWXEcxOEknGpsWMXsyLoRIL?=
 =?us-ascii?Q?1F7bZZJepH6XExrnEn67ntNdp73pN3ZI1IQ2TaU5a0qDdbbIQqqdAlEKUR3D?=
 =?us-ascii?Q?LDFfexlCtxmh63LtQbNEmYwZo6zTHvwKI6Cj84Bh19LGhA2qeA7r+03OBACD?=
 =?us-ascii?Q?qNY8xcfhBZiu7TGodVj7jB+XMtZ5mwSf26EmPWKM6MORLwaW6Bq7McrCt3Ie?=
 =?us-ascii?Q?RqlMMIqY/8XjT+kSlKDLyMmYkqpTUWMtGpfRrLTLVxdS7jq1M9F0qSmmj7aH?=
 =?us-ascii?Q?A1STUwU9NsEh6WUo8IE9wKoRJIoUj2/zOPmz05l0u/9I+TOqxbH0HXuvbViA?=
 =?us-ascii?Q?m4GAvT2xQFuhDNHze0V0iFxZSEPDFHTu8NUvFv25jgIoxpwWEKkzZZ//R18e?=
 =?us-ascii?Q?TRiNz4TU/SaP5FXpQYDZMOgPN9Oat3j9q6aJizJxb2V1y2DY7rxzWbXZCmHA?=
 =?us-ascii?Q?MBPPo5VbV1VMGqL+ouAJmf88DeJ47o7nkiLsePIQ2LAaCLlHCEjuuod58Qg7?=
 =?us-ascii?Q?QwmNgbqE9GNOYdRkt6hWfAq19vXDutB743gf5vorOhJ0USpHyR/4+Z6Q9Aaz?=
 =?us-ascii?Q?//sG/Otfh4cAo8MgmsA1vr9JWnpGuNljIqdFHvgYjjjvwbF5WnL9CDWHTWnt?=
 =?us-ascii?Q?bova3YKAj084k2hgGCfPXDvstiZ3Gw3cGgSrqesS0W5Fds1xGbmawF3yRhTy?=
 =?us-ascii?Q?a061/CbNWg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e222ab4f-e333-463c-385d-08de7b5d73df
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 08:50:44.1265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7XnySVqAe+X02GorDEeYB0uSGDgY3JPBkthTK8MWegSnKclJTwQTahXX2JRkmP0r8pfI9+WPFcSVIBavIJKpwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12367

This patch series enables SoC-specific timer drivers to be built as 
loadable modules for Generic Kernel Image (GKI). SoC-specific timer 
drivers provide always-on broadcast timers that complement the ARM 
architectural timer.

This series is based on the previous MediaTek timer modularization work:
Link: https://lore.kernel.org/all/20230517022557.24388-1-walter.chang@mediatek.com/

The series includes:
1. Export necessary functions from clocksource/mmio
2. Remove __init markings from timer-of to support modules
3. Convert MediaTek timer driver to support module build
4. Convert i.MX TPM timer driver to support module build

Testing performed:
- Built and tested on i.MX8ULP platform
- Built and tested on MediaTek platform
- Verified both built-in and module configurations
- Confirmed timer functionality in both configurations

Changes in v5:
- Conditionally compile delay timer and sched_clock registration
  only when built-in (!MODULE) to avoid calling __init functions
  from module code.

Changes in v4:
- Refined the cover letter introduction to clarify that SoC-specific
  timers act as always-on broadcast timers complementing the ARM
  architectural timer.
- Expanded "GKI" to "Generic Kernel Image (GKI)" in commit messages.
- No functional changes to the code.

Changes in v3:
- Reworded summary line for timer-mediatek driver as suggested.
- Improved commit message formatting (line wrapping).
- No functional changes to the code.

Changes in v2:
- Added Signed-off-by from submitter (Zhipeng Wang) to all patches
  as requested by reviewers

Changes in v1:
- Fixed 'unsigned' to 'unsigned int' in clocksource_mmio_init()
- Changed MODULE_LICENSE from "GPL v2" to "GPL" for mediatek driver
- Added i.MX TPM timer driver module support

Chun-Hung Wu (3):
  clocksource/drivers/mmio: Export clocksource_mmio_init()
  clocksource/drivers/timer-of: Remove __init markings
  clocksource/drivers/timer-mediatek: Convert timer-mediatek to a
    loadable module

Jindong Yue (1):
  clocksource/drivers/imx-tpm: Support building imx-tpm driver as module

 drivers/clocksource/Kconfig          |  4 +--
 drivers/clocksource/mmio.c           |  8 +++---
 drivers/clocksource/timer-imx-tpm.c  | 40 ++++++++++++++++++++++++----
 drivers/clocksource/timer-mediatek.c | 33 +++++++++++++++++++++++
 drivers/clocksource/timer-of.c       | 23 ++++++++--------
 drivers/clocksource/timer-of.h       |  6 ++---
 6 files changed, 90 insertions(+), 24 deletions(-)


base-commit: bc47b2e823914966c15a09422f8fc3aa98d34c1b
-- 
2.34.1

