Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011007.outbound.protection.outlook.com [52.101.70.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644E238BF67
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 10:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307068; cv=fail; b=Fe8TFcjkYzt4Q87qy6Zj8+vk1qx/k+1lZQJ5tIv1XlBZu4SzOXRuuXClrTupKRdu2hgPtChiJysx4S3npR/A/zXDqiX3QwS1IjbKFjk61D5wGw0Ihij9JfOHL3uMtxdvlMiE3nYdzq0XB90zEgpRozIQHWuJuEKtsD1994/uSns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307068; c=relaxed/simple;
	bh=GFWsXGdAWlduSkYrzANXzpbij0j4QiVKwOYyOKPkWvk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=qT0/aZ3VT5Qoxow195nHcYN2vAI8ryxYTVROjwCKOBVsOjRCqD5z2g7lUaVZ8V9UcvkaLWXQcmViLbaY9rDrPTRcr9jlAc4L+cidVsHMX7dHwULwQ/l6f26I0K8oP1baiR5Yj5kfU7sgMe6BzGtJph6MCWTqaJWTINbsOq9N5XE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=llhtG/q3; arc=fail smtp.client-ip=52.101.70.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="llhtG/q3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OuZCMW64WZuVnwwEy964UKSvlvs+yEb+rKLyzQ2tmZY9qUiKBq5BPbGUVaRjldPJ59SOqiS5P7/xRIUGtLv5rh3csfNCA4fMX/g0FP+xPuTtY7sTrLiIWXCGswVE8Vw4nIurd1j+ohKHBWcnKZVr0zhzB5ybgJJL2+aMe3REHD2Ssb7uO658kiwpGHAaz9QBkFe6fTXfdb9B1ofHbbfW89qMD4xNigvlp2SsVUrYYp54OXR0ryiTQFidsCKL2n89qih9OxnHyBcdjBV83VgBsW3RWFWDcg12kq28dJ2B4bEX4RGz67G5PkrzqfjDJTI7amVcyce1DjFC+sK3gcZL9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IR63uYHoQnWziWT9UlOpZ/D5RKxGF+KWJ07GGqpmO8=;
 b=jSebZTLM5w+yoR7V9FxN/kKdvlqzhcf5++IgK3xnuQTmy9JvYIl7zDtJmIWqn5r+s+aORYLKXMyLDaSLGJ59PVltzwgbW3xKmBE5Ab8mTr+4FFvzaIOEceLEsrXGpGg+GfgpZ/FDl+bWhiUKNwyWuJFuSbov1bk8gbcitQbiL9Q+ixpgoNAZDTPoLl6LCqDmXRimNzm7b8ymQAyn9XSaJY+KTYjH2phux+D0F7bbFQ/OxsIXdXZNueXxU5Ko4JBqD/2Gdg3wEb5poESt8IzH5qpENzjTryjEuEwgaH/SGTuYr2EVzLR6depmCThDXe1SnldXweBQwmODnbiblCeVdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IR63uYHoQnWziWT9UlOpZ/D5RKxGF+KWJ07GGqpmO8=;
 b=llhtG/q3BWeeCTHQEKYMfZyA3NOQ8FyabGB2sNVsoeHcf0GxG0ANA66jIkwKw0KZBURfEYEIWLx7MZfcR0hHc/GrYhCLAE/6uQ2Dig7jmqsXNMt50aJrrA3UI6MS2fKgS9TGk+491GBK5/qhSca8WkS4Wc2oI4MU0CyHLGgcSB5CZC7FSBDHOzzbyqgsk+xrN+AQOG4xUQ76u3d1Pxs38h6Mpvrd2RTrEN4MqrDILeVMsoveCAbUXr+l0Y4MzY+NA58b1tBodfwEqz9pOhl8IOGhoZnm0+lXpGhIGIgjLITHLh/gsDY4SZH2VY3aqdCEF7BPx5K8+qUv1PG6pDE1cA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by AM8PR04MB7971.eurprd04.prod.outlook.com (2603:10a6:20b:234::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 10:10:59 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 10:10:59 +0000
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
Date: Fri, 21 Aug 2026 19:10:30 +0900
Message-Id: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0009.apcprd06.prod.outlook.com
 (2603:1096:4:186::17) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|AM8PR04MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: ba2ea22c-e71d-4351-7f4a-08deff6c7f0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|23010399003|18002099003|56012099006|3023799007|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	4yxKCSPcdO+qb+GCTLwJhEYGAnohyUU7dW4xXK2l4Xeu0rO2aoZwlgI1aepg9Rukh5WiF2maNCSjIu7vLcifLRIjl2D19vYAm2VXgZ6daDllxHEEH6BZku0xOZ6opbImL358m7XBFib8HVZt0doT9N/FnSOk1Y/AG9nmg6Q5P3tN5ah6+pxZHWgEMwCsL7spwCSSyhP7Y4vI3vLYvyn74MiFjoTaGu6zh+D/w7Dk/0cg2QjHD1mFV4SUP4nnmBiMFX0i+V6u49dVBZAoSs6tNcdDtd2U3NG5CSpbJ5qlzlNLoX1HPRY85YKtI7B0jiA7RI4hhPXjh/DPUkzK+P/MAOtBZiq83jFjPeHuUxzGq8hwDSj3eN5oYW28wZqqhxCpEMVdoD53iopxQDtaJdb+SEu53X56rui8NPC2x7wv2QNeTb5tHU+PUUZj+fwA3DwdnFCIG8yjNOM8fditahiL5uQ+DZTMcWScxmY5KeHZyt7FsqTcjBYod9n1AoPQYv4rNkbWIIFWPE26bqoVGw4VwgNCVG3U6AG6RDo+vul4fBDAiNbOltHjjLhMNwDx9Xf3HiurXBeIkrMgG5phBYU5Mn9LDAIwPgLyeHhlL4MSfx9YBpUcnJ1qkNZGr6qAgYEYlHdW72b/Wvp43zP4XPBaKfVbH1grJ4m3rm3SuHenrf8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(23010399003)(18002099003)(56012099006)(3023799007)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WOk710/mKHa7+MVuiVqaxaGa6i08zSMJ2gkHYbjBU6do+WzRImZAxyxxH1mq?=
 =?us-ascii?Q?4qApQJaaIBSuMB9iN0cRTxoYF4PWGuAxvmPOEiwsOQVyoudG7jZb9dyhOE4M?=
 =?us-ascii?Q?X9w2L9sQx3JGOpnlUl3DUmnVcXJEKMLnKZEf+r6YT/DottB7LkSNfPWaGIp6?=
 =?us-ascii?Q?KUgEPs8VMqVar4gq10+gLgvnVjdJlw+ryCHrih90AVQ1SDDXE0RypzNAcfEa?=
 =?us-ascii?Q?b6wTWYlxCuiOO267xzfO71iDOppMOnBRa0qMDgR2iEc20OPNRymUgSFqrnLv?=
 =?us-ascii?Q?ceVbj33GPFaDqu962HxOVA82BMvjwTgjQkdCdzRlPio5t9ZtA9QkgFHEYGWV?=
 =?us-ascii?Q?UXUknbwesFaMThE9N1TMxDHbSGO3ENPmCBrkth6J5oZH70f/dX4XK0Asno+4?=
 =?us-ascii?Q?u90wvZgh/UiQUZbicBezrGTZnIkXfD61g2rd91U/O3QW1+JOe8tD95kBybaN?=
 =?us-ascii?Q?mQ/S9iI1UIrsEtkWRgtOrx3vKph1VmQ6oQp7PNO1S5IsYAXJs1NNglRi+RFb?=
 =?us-ascii?Q?v2T210PaGfUhzXugTf/uC6eSkS8b8BuJiNoC0lkolJvoRWq0cKitNjPXvqng?=
 =?us-ascii?Q?UEb5YfaGKLPw6wK1QgAkOCwIVJsn/shjgoBukwKbMx+KmPkxk0C1Qt34z5qL?=
 =?us-ascii?Q?jkT4Cy8wbxg8h2g7lQyZuk2H+i7mGlRadGzUTI6UpMB3Kj7F/4kZZbE/63C9?=
 =?us-ascii?Q?Usu5egIXWR9peIKQjk8qPn+9KCqj2VpG98sPEl3VKfBVhNWpdzxkpfoFfnZF?=
 =?us-ascii?Q?HDwzskaTDHdFTlIo22Fr+/gm9D+Y488Fr8w5cwo9N/jKn9IUVXzAlSIDGtw2?=
 =?us-ascii?Q?98GFCeO2eXJbURgfqBROa98Ji+I0FJBL4Uc77DCEvHyxMNAIHH9JJnw1G1uA?=
 =?us-ascii?Q?XKw2SrvEbkSDe6F6aGhNgFypU7IKXURGyznKNe8n+ZsvxEAuEdZUyp3w4l1x?=
 =?us-ascii?Q?H5DCNXMRjJ0DQVvA0kJgEW0QLlmCfvkYmAFtRf2PH9zxuB7B0emF50nQHmO1?=
 =?us-ascii?Q?XI07wsd77PuCSlSD+ZSfAD+xac+y9CXMgoPFjPRrmJLj+k+RQKcEYfgu3zdl?=
 =?us-ascii?Q?2OaW+h+Pvd0OfvGHG3KPoIUQ85rwAg/QkRSUtcIgeneNoY1h/Lcvnziwd25c?=
 =?us-ascii?Q?EwbAuA/PksNRQY/fNbMWjYplPp4OO6JJmZN8r+8qJ9sVXYP/KRozMWeePM+M?=
 =?us-ascii?Q?j7O5ZFc3n1+H0vGf7NAAn7ca1KFDZXQcBEkrDMffPLsMuvQP2AGl6SSjlisI?=
 =?us-ascii?Q?jpXQKJmclVPzYka8BFexny6h6U85hf77tQLFTN2hEoPDxopRtkr4MkuoRhTA?=
 =?us-ascii?Q?ZvdIRy2qqd9bn+Rtu6mM8MBFbxQvg7D/BHA23Wkq1nkRbJItIcoVATNfRJqm?=
 =?us-ascii?Q?a+UCAutavxLn5N5Gxa1kksTqCcruw8j0qKDJ2fwlnFSv7sjBp2SgpNpt46Yw?=
 =?us-ascii?Q?AlppdIlsrm9gSSltkLIu08f1FwOSHCJKxwfHseK+lpc8rbwhWsG2E9swraVK?=
 =?us-ascii?Q?oxDEeCC2px0lHDAMI+AYFNhFAEEFNwKW/JqI5uJDqOtvl1cX++LDfCtZEh9Y?=
 =?us-ascii?Q?uEg0EZ7tYHzDvk3VR7c+q1htfu2pYECCGcoITGxVCT+qKKRsq7MG5GT9Ky2y?=
 =?us-ascii?Q?0vCAk/d4ezaSA2YLXYd/GUnrGKhR5uhEa6omxuexf7ybraoDB9CUN3txpouy?=
 =?us-ascii?Q?jWvjtjKREAZNdT9ynFhYilQ4x451uISwkiCnZOwiQlrbeqya6gSpdEPKdd65?=
 =?us-ascii?Q?5KUfJsChM1pkUKXuvrVx3+hfq27aP8zYl2ipjXv2Px1E6SwW4Zes?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2ea22c-e71d-4351-7f4a-08deff6c7f0f
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 10:10:58.9099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pn3VHILwuqngKDNDexpHTU7rKkafGQOT0Hgp/z9Puc2peSDSZKfoO52LWbJQpUZxh1DvH+M9QlQMu0gOTHKRLpRxrPho1oEcDxIQX6st0McTxDNGMMg0XzGoUGNhfdkM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7971

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

