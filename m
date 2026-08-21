Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010068.outbound.protection.outlook.com [52.101.84.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DF047728F
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 10:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306943; cv=fail; b=kUk0p8PVUUzCkX98vYiO5j4kS4ZXR+KQJzZBoIbfLgOOCG59McTKaCMk9fJpNECbike47fZtQM8loajsySaJq/5XjaYFNeahxKnjeF3LRD9eXX1d8Aj9kUjRhdMN/Auw8bPNK1aN1dPWojgbkIv7pdbA5utVluPfHIIFqfZ+Pk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306943; c=relaxed/simple;
	bh=GFWsXGdAWlduSkYrzANXzpbij0j4QiVKwOYyOKPkWvk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=EURCRbHjlRCi1n5IeCSKxa+0TLqsGaDQW7PdcDiOIdgjrLPemntuMa4gDAYrsav5OU9H8uUquxViqGaxD481b1vx4wd5oKq8K4jP66YEssjQ0s+xy208pF7chW6rYC8wrWu7e4djk0liLzDAfYBDV3IL2aC0sIESPHOR63Rdjts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OxoQMz97; arc=fail smtp.client-ip=52.101.84.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OxoQMz97"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BCvE/IUx5iWUFSk7/hHBEuqRXJ4UIFaarpz5UV+atZbLPWQAPALSokrh0YMdVv08LAUNQLbkdS0BOwk22Ym5/LiA6zzUCtGQm5CsMqu1AKPJePhi/h8hvziqgzGWbdq9UPfcYEKuxU9D109SfvsVuAGTDmLJQw0RQ2tAXoGLsj2a8c5BDsTxlW0XrWlERh01DFMV+6DjlY4z6E4C2WtNVBrz//O1HsXlgFiY1rfXivrXGKBFW+/UC7owRPZ1eR0d/adVTb0Lu5IIbqVhUhsv1FucGYywcg7ROkzw11FzLi3a5TpqkKhxr60CbnkxPlE2JMQfmAH/6AQPbUUIugsE5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IR63uYHoQnWziWT9UlOpZ/D5RKxGF+KWJ07GGqpmO8=;
 b=iBrCXfuoIGE0OdRSRz2A7ik1psPtP8eYJ3dEa8xBlD113UjNUKQ12qX77lx0Fj+a9I7OPxIgyvzLolsO/iaLMF37e49CPiwlnM16y+INjoJa1Sh1U4q5DScFrHOPT33D7gWeIL2GAKxhbJVgu52gqrYYWWg/RucPXmuoiJN9lLjUKBewpQ9V/SW6kmMQWRDICfPUo9ZLNLxEEM28/48pY0sRGoSBLvbdDofEqahqMDV0HjxhY1I9bOrDTX1KuMP1INKdGgp7BBChLeCtr6r27st6xCw2v2s8NhHQGzzB6cg5FspO31SRxlAfDVIma6/k/P5lust/Mo5IR6k+/HPwaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IR63uYHoQnWziWT9UlOpZ/D5RKxGF+KWJ07GGqpmO8=;
 b=OxoQMz97hOlNAcSA34Ye2z4xTZANmLlKzQ9YFQL4A4Jqk+UD+BJOp2UW0y+ksyMhTNfDDO546h2Zne9g62+bDEAvVaMg/lbsb5MToO2yM+D4lQzGL21h0uYfry+y1/0UWve2qi4BzYjFrsLywuLVXgRDZ4IEqhTb8FbIJXSIaBk7BlXEp33SUbK+QfPFOzMsMsD2EC8kXBDTLLoXGDbj4XKvOnv87hzeLGwM6DWYUHBXd1631+COhupXivZ/9D36WaJcExWbvQGszEykRGj+gVp0HzYXI++jECliBoR/+59RTUouBsAJ4ypfvdLLEgCrEyI4zwLpzGhPrMLApEYJRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by MRWPR04MB12070.eurprd04.prod.outlook.com (2603:10a6:501:99::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 10:08:41 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 10:08:40 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Radu Rendec <radu@rendec.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/9] irqchip/imx-irqsteer: Allow building as module
Date: Fri, 21 Aug 2026 19:07:58 +0900
Message-Id: <20260821100807.4030550-1-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:295::16) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|MRWPR04MB12070:EE_
X-MS-Office365-Filtering-Correlation-Id: af3e86a7-de7a-40a9-c94b-08deff6c251f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|19092799006|366016|376014|18002099003|3023799007|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	0DOQ5UOt7DIujuN9yx/n0oWCUvQNcpW8W5rUsDhUM9DOEsrM23sABVAjn/Ytb9w7l5Fv3gT4a/0CMH9RNhOMIColbQjlHKRZDL4uilMhXjiIqcXXUhwVuf68A8CRWCLCyeD36VrfYggAj/L9skpOZUsFzD+gRvaDKm5pqiynpSng3n06NF2qkDRedW7hc8XygCEoqNPeRIx9uCgtPsf1JhOrMOlOrw8fSnAhnhM5HPygKVsjnIqL1pw99Ga26zOc0q5FwlPopjjJVeusj44uDywbgKdk+anNijXwQaZURdPxB3mmf5QDKFgOZfGqnjvlS8gnVUXUhSQtaMgBmRZptEgu28b1IihR5w6dMrKsbGLsCW4ETuTMxFg2WSTGzk2Op4hB5GXGjuSVOodefA7W5SxOCNLNOaA3p/eJzU/+yN2r5HfNtKVaYqBFq/h4VAHrxL5m83tbOWrf8//dMkIVthndhsj2FfcM+HlHUvueZzSRtP7UW3n0zzt1YPtN8U48fyaBj/myUtvyM/3p93WvpWV/2FwADaEGGQ667CiF9HMi+kQXuvvGIxjPcnn9XCsBGrDJQ8F6Le8JsdDvxINqOfh119gyzIK09lEhYSup6ufitm46QsnbEzv4YOQDUtr9rX1J3N1bsiC58fZDrU3FsjgPnQdBnPHOuWc57SHUH+k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(366016)(376014)(18002099003)(3023799007)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kbUma9dAugFzHY7MCWga3e4UI9W8mF94/11pARWCFI2DviN+64W3EqPseSJf?=
 =?us-ascii?Q?WMu5dpu5JpLOk1J0dcu8FsJkNac29yolVF76pc/xNrCrNH3sQbi+jQcm1Eyt?=
 =?us-ascii?Q?2AjCP4FPhuEdGuhseRSsFU7306/gku+51ytZDx0kwEKMM9EMsEIWzf/lGPHH?=
 =?us-ascii?Q?/W/0HWUM/OVWsYmzfUGz8X/16bWMXtDdGw60SlwHb+AgxTUvmIaHkmXUOrAt?=
 =?us-ascii?Q?aQAXvnCjt/R7A6QxVoaWQcp5P4yaLYVhslt7H5xHvIQxwBlYVrk6fo7iD0ry?=
 =?us-ascii?Q?jiRl7QhnFIEocHNM0jYDUFeQG9MzLzieHYc97r4UJAg61HgKF85nMQWdy22g?=
 =?us-ascii?Q?3w3nlqdCpMmLgpTmljjzZEWeIreVECYG6tMLqN14kFMw/zxdo9m1eQJM1dd/?=
 =?us-ascii?Q?pYQUQ5UVuNQsVuvf5mmD/zOVWjdnSlKVxVF+XlwWjsWfqfT1xUrUAt9umE6n?=
 =?us-ascii?Q?pcMYFRBzWYAZgp/6Ygs4SNwmhjasuk+H1LnLI6RUadjag4aKYDGEW8r5oipV?=
 =?us-ascii?Q?G1xtaf/i+/au5rftWJZ27e01AIp+BD75ivzfYmq9+AUWLcXfD67mXtCsDjQY?=
 =?us-ascii?Q?Onm7Z94zQkzK1E5McwEujETAj36Fc3U6fkR1vHDwKehxEjduRahQ8Bd2ncxC?=
 =?us-ascii?Q?8zRjlrKgLgOljlWbjOUgVRVoWeWRhNVuPWs6ZiZ7J8WvtidX8xPprv76hIhU?=
 =?us-ascii?Q?poKBvzfVKuGgpsmrSa+3xV0iZDb5dSLpRLJgI+pEusn3W6gJoLjR1W9iURsz?=
 =?us-ascii?Q?CB8VsOdMNuihzKq1zjKG0wVYOc442AMPoZX8dtT3r3xXdyGGiZehN0b7S+Pv?=
 =?us-ascii?Q?f15A+ZfDK2Nt5bTcdaNhhM5//2Op8DHxDHoqPXs2WVlX5gqAWHKlfS0H7zXd?=
 =?us-ascii?Q?I5yOroOdtgGOemsaX0zSKYehwdTXNdKGr96grteFHcOTB3G1/OKawXXqccUT?=
 =?us-ascii?Q?OP9XFV+VFMhx10OCBix6SDBRNHrkaziKmvvNcyBABmiWyzAWzE31evHlDMLs?=
 =?us-ascii?Q?7lZEZplRBLT7UIin99Qf3lryidxtibWY5seWHt72Tc2U5oXoa+7H8Jf9SxnR?=
 =?us-ascii?Q?GUIN6/kT3GqncjLFYKHjTZZNPLIEBwpxvaLeswnkPOmk4O4bLTFN5Q2GH0kt?=
 =?us-ascii?Q?lbB6wmiB7iABw1k1gt4Zf2GjrMxjRIOIQnZ6CVcqRcrIYzmMHcnwYye6YiIX?=
 =?us-ascii?Q?9vR40JDYVhhGbQ1gtx+ePsDc40l4lOpCCnVgkrxF/hfa9/tcmcdfanE4t6xZ?=
 =?us-ascii?Q?o5HpVbdjNT5lvcsbXrED4FnIXg0d3cnKua/nyxGCdVvnc3ShZffxnPcF1wrE?=
 =?us-ascii?Q?LHuDFuaHdDdaU3rIwxCsrQDNAtYWIbBFtPkgJiDcjFOQumerufbc1o99NVPd?=
 =?us-ascii?Q?uMaGXt/A0lYZGdGC9mV+gYf9tf4UceE5FyWn1nWbRN7wsHL4aJnOxUkjKLfu?=
 =?us-ascii?Q?UqMgiMKPM4qpt1d3nsRrZETJTvb7jGmY1V2pBPQ9QIYkYFa+X0T/dHk87kbZ?=
 =?us-ascii?Q?rW0yhFqlo3lVkDmrU0RCVGw47AmBZ8te8QhY3AKOTgiLDQjneXFC04XReY97?=
 =?us-ascii?Q?/x8CY3MD2kE6mZBr7JDhyF9ndDynBOcQxTwHQtABBMBWYCLuIYIzGeExlpQM?=
 =?us-ascii?Q?3D9dpO+X3cCYweuMQt93qIAQPKnY9P5uLQ+vt3jWrvlOtTla+FnVCyj60o2p?=
 =?us-ascii?Q?y9w/UWsdrek0tIC2poqVt+ZM3lz7OYpbTm89hG07g56C+IgsJ5XCsOT7h2+0?=
 =?us-ascii?Q?1kcFXepcCt7+tYyW79Z82cz57FNKL/07zj5fOe5nb7YnUX2f9wrK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af3e86a7-de7a-40a9-c94b-08deff6c251f
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 10:08:39.9421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fAoDx7mosjytlIaMmbgqoAPKugyFqcYstJRg1/MYnVk6tsKH5ADBqz1cv5hP5akxSs8CnSDX8D33e1OYqHPBNsa1wbGvChHDaGCF2VEA9MDJT73LwTvf4hYMgN6wJJtf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12070

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

Thomas, apologies for the scattered irqsteer patches over the past
weeks. As you asked, this version consolidates everything related to
fixing this into one coherent series: the three separate series/patches
(including Fabio's, which conflicted with mine) are now merged here, the
overlapping runtime-PM work is reconciled, and the patches are split by
concern. No more piecemeal postings.

This series makes the i.MX IRQSTEER driver buildable as a module, along
with the pre-existing bug fixes that become reachable once the driver
can be unbound and reloaded.

What was previously scattered across three series/patches is now one
series:

 - The three patches carrying Fixes: 28528fca4908 ("irqchip/imx-irqsteer:
   Add multi output interrupts support") are now collected here: the
   parent-IRQ-domain leak fix (devm-managed domain), Fabio's IRQ-count
   validation, and the standalone chained_irq_exit() fix that was
   previously sent on its own.
 - Fabio Estevam's IRQ-count validation patch is folded in with his
   authorship preserved; it supersedes the ordering that previously
   validated the count after the domain was created.
 - The clock/runtime-PM rework, the module enablement, and the irqdomain
   helper cleanup are split into separate patches per Thomas' request,
   rather than bundled into one change.

Patch overview:

 1. Call chained_irq_exit() on the handler error path - balances the
    chained IRQ enter/exit on the error path.
 2. Use devm to manage the IRQ domain - devm_irq_domain_instantiate()
    fixes the domain leak on the probe() sanity-check error path.
 3. Validate IRQ count before creating domain (Fabio) - validate before
    allocating so no domain is leaked and no dangling host_data is left.
 4. Dispose of parent IRQ mappings in remove() - only the parent output
    mappings need explicit disposal now that the domain is devres-owned.
 5. Mask all interrupts in probe() - avoid an interrupt storm on reload
    from stale CHANMASK state, without touching registers in remove()
    while runtime-suspended.
 6. Let devres own the clock and runtime PM - devm_clk_get_enabled() +
    devm_pm_runtime_set_active_enabled(). remove() calls
    pm_runtime_resume_and_get() so the devres clock teardown stays
    balanced when the device was runtime-suspended (Frank Li).
 7. Allow building as module - tristate Kconfig + module_platform_driver().
 8. genirq/irqdomain: Add devm_irq_domain_create_linear() - a reusable
    devres helper.
 9. Use devm_irq_domain_create_linear() - switch the driver to the new
    helper.

Changes in v5:
 - Consolidate the three previously-scattered series/patches into one
   series (Thomas Gleixner): the standalone chained_irq_exit() fix and
   Fabio's IRQ-count validation patch are now included here.
 - Fold in Fabio's IRQ-count validation patch with authorship preserved;
   validate the count before creating the domain.
 - remove() calls pm_runtime_resume_and_get() so the devres clock
   teardown does not underflow the clock enable count when the device is
   runtime-suspended (Frank Li).
 - Fabio's "Convert to devm_pm_runtime_enable()" patch
   (https://lore.kernel.org/lkml/20260817190621.335492-1-festevam@gmail.com/)
   is superseded by patch 6, which uses
   devm_pm_runtime_set_active_enabled() (as Frank suggested) and also
   lets devres own the clock; it is credited with Suggested-by.

Changes in v4:
 - New patch: add devm_irq_domain_create_linear() (Frank Li).
 - Use the new devm helper to manage the domain instead of hand-rolling
   an err_domain label; remove() drops irq_domain_remove() (Frank Li).
 - Dispose of the parent mappings only; the child mapping disposal loop
   is removed (Frank Li).
 - Mask interrupts in probe() only; the remove() masking, which could
   touch registers while runtime-suspended, is dropped (Frank Li).

Changes in v3:
 - Split the single v2 patch into separate patches.
 - Add the probe() error-path fix (Sashiko AI).
 - Add CHANMASK masking in probe() (Sashiko AI).
 - Let devres own the clock and runtime PM via devm_clk_get_enabled()
   and devm_pm_runtime_set_active_enabled() (Frank Li).

v4: https://lore.kernel.org/r/20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com
v3: https://lore.kernel.org/r/20260807072346.1222389-1-Zhipeng.wang_1@oss.nxp.com
v2: https://lore.kernel.org/r/20260728092219.525449-1-Zhipeng.wang_1@oss.nxp.com
v1: https://lore.kernel.org/r/20260724090136.3595894-1-Zhipeng.wang_1@oss.nxp.com
chained_irq_exit() standalone patch:
https://lore.kernel.org/all/20260807072626.1231517-1-Zhipeng.wang_1@oss.nxp.com/

Fabio Estevam (1):
  irqchip/imx-irqsteer: Validate IRQ count before creating domain

Jindong Yue (1):
  irqchip/imx-irqsteer: Allow building as module

Zhipeng Wang (7):
  irqchip/imx-irqsteer: Call chained_irq_exit() on the handler error
    path
  irqchip/imx-irqsteer: Use devm to manage the IRQ domain
  irqchip/imx-irqsteer: Dispose of parent IRQ mappings in remove()
  irqchip/imx-irqsteer: Mask all interrupts in probe()
  irqchip/imx-irqsteer: Let devres own the clock and runtime PM
  genirq/irqdomain: Add devm_irq_domain_create_linear()
  irqchip/imx-irqsteer: Use devm_irq_domain_create_linear()

 drivers/irqchip/Kconfig            |  2 +-
 drivers/irqchip/irq-imx-irqsteer.c | 70 +++++++++++++++++++-----------
 include/linux/irqdomain.h          | 30 +++++++++++++
 3 files changed, 76 insertions(+), 26 deletions(-)


base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
-- 
2.34.1

