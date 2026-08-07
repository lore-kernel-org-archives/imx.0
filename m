Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011035.outbound.protection.outlook.com [52.101.70.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B3B3BF689
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 07:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786087443; cv=fail; b=mOMdzsg6d2qWWHaNKVNAmZnlaaq6Gc6ulvYVUmBVFwPrOI9dyIZ8a5RQJBjBhkq3RCh19N5BfkCk6h4jn3vg5KLAsyO570eQdpZK8cJK775r5+Jimy/pBxywXsTdb53Mo/rqO22qCTcbZ0GxvLtw8if7yGTJC2FY08B90XyZiZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786087443; c=relaxed/simple;
	bh=Dz81QttF9fJ9hdyvjDj2edEuf6r4ZIYgnFG0C9p5Qc4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=qnRx+qVBPDfZ/mBopsTvLoPBDt3B+VRCqBKdwTge7c35r2LSekQnISdsm1bylF8ZQm3U7K/en+zKabbN/oKFyzmuKzd3XYwEmUbUaFuYyEkGCf7lh6QFlh2PmTHUdCSQdRzML3g94dH12OBGL1S3fRkZe2LiGAy2FuAnjuHI/uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DLE1uGYh; arc=fail smtp.client-ip=52.101.70.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DLE1uGYh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cykVp4xMw8kUhuSo4QqfJT27STkXhoRh5t7E7K2zZnZTYXfhPShClkxPzRj76OUM01LvK+Cb6PDwGJSIv6q4rTkcCIu8+24B9oCW4rDxshDd9kz3cLRs40142JFjyqpx29EMb1S77ohJdKJWV/vf9CXO9gcFsc31tS5QT3A6SYtaFcnuSQyigcFUR19yq7rjkf2TzD36cPBj2EzQbVoMrSYXb7g16oR1b8FFPxtX7Ofkm3TgIHHnDzXbeKp7CCOYdTRI3wxNgUPnnB3up0Qw4+EqlO6jVrA+a0gOxuY2GdN/ZYtRyzJJkinUmCFqw3Dmp7/3AA4kdbLbs18Tlb4mEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nnVQuW9OotSeuWCUKomkAcjODvjr3goMR6MA0Y4zBo=;
 b=htkACYQVelETGKFQqxprfVcyQX0wBKLR+j0jwXL8D19FMATvT9B3u+wo6iuI3DckNrdibB1E+k58JEtNSgwJTiGj3MNp8jz2XY0cj3GLUkyQkBgCvZZnCeWud5VbV6yRAy3okU0LOZGsYw/JGZVwYQDqm/V3HCi9/yGenRYGw7Iyb8gE2MkQtEUCSGF4td4303MFnnNIh85D3j36kxAIPi5R7YlaJe9JArT3Uvcu/KCAktCy9Zf2FoOiMgvjmzJex838lVLNAYIw3Hk/DrqjBuTnd4/cVRJMmEp44OftUQSHBIWr1j59WR5gGha7D/gI7jhq6/AqZe0/We44cpY+Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nnVQuW9OotSeuWCUKomkAcjODvjr3goMR6MA0Y4zBo=;
 b=DLE1uGYhmpq2S+w5wBUC+O6lURqXQe/6ikON6lCVUjJIZ/zmY+1UknCyyFNqLkX1Dg4X0IToaLvrufPHKc7P3dWwjS9RS6Q8QYvzuQFcBkfWjwo5tlqKYJ4hz5yeBngyrQw1ctSPNbtY3WCrZj2vxhka10d6d801ti+/q+OUy82LhjGr2wrobU9QkMPo2eUWVG/lkQOoP1+pjempAGrnhkG/+gt2YQDXhLaHJxHCQAuEfKLdRKnFjuzc6OJu3cO6WSESIuYNw+VYCsAvJN5PBn2oZvTfIjDQ98Ya6ERkIjh6m2OXYTIL4hC5ZUFwgWYFcNOVykDzXHzp0nRapXgETw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by DU7PR04MB11188.eurprd04.prod.outlook.com (2603:10a6:10:5b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 07:23:58 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%4]) with mapi id 15.21.0292.021; Fri, 7 Aug 2026
 07:23:58 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/4] irqchip/imx-irqsteer: Allow building as module
Date: Fri,  7 Aug 2026 16:23:42 +0900
Message-Id: <20260807072346.1222389-1-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::7) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|DU7PR04MB11188:EE_
X-MS-Office365-Filtering-Correlation-Id: eb736e0f-46b1-4726-bbb7-08def454d834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|18002099003|10067099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	u0emES8BuCTuv9XasM583qSACVcFEHi/Pnj3uttvbzLfb6ftGpyjsupCiuAFpyyebJXL2azlcrQXeXPW2Oy54EYLhyxewtSbo1LdrWBZbqMQQselA/A0spoj05TNdJTY0Luq69MDEANlr8ytdS977O3h2o/cOkrOBz4G3Kc9gKQzjboZEzkkTJBCjZ4Ym2fPcUpcD91ITeWeGVjOCeTD9bw8DGrPoyOxef6U1rPD4OuMoAKRQrXD6XcGdeuKMvYh/7J1Da9KBrreixigf8KAETT0juc1vfIsbMacTpB8bDTZDEHngTW2HCgVS7yeseHpDanbz8Wv9ifgDt3pdvr61pE13FTXs+bQoDYNTTlaMHIWt2FY3+0IjugZUrKfloWyR1QkbIrjw1mTYO9xiWZOQ3/IjNXXhWSZAhOTAHeKTrhpbsosvwgRxuWavWKMJsW8peRjRqb4mW621445GgYukcbmzc1wlEGhBF/VZo678wfyJSxU6rcfTL8W+DANDJzVQL/rDWpGh0A69ApkJs5+ZSccCuu7lDoMQFmHcFY+CPw2bLDZwnnYb3VXxNbZMQa5IbX9GlAly6kyJqy+RzbEQJbtNE2l7wPzJalejYXmRq4ASlQqHCeAhhlK1zaugS99Bm0luRhzl5epTOGAPeW5Vm8lde/y2RmmBsjWB41Dak8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(18002099003)(10067099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sOiptwcsHMluD6PiMYAG+urSru5QgeepdOQdAMAYf+lNQBxgtVD7JIi+Cpms?=
 =?us-ascii?Q?+XevbBZzlhCqxCPOeasmkqK8SJbgc2XJr0fWdAme0IMAt8fEH5LTTHZIErM+?=
 =?us-ascii?Q?3V5Uf4H251cCEo1EyYlg9RtbsTU6XUTDbBpRkCFWJQF/2o4AfouA6VYk2x+A?=
 =?us-ascii?Q?5+/k8wuJiEtB8+8dVGQ537c4EfWBUOENhHqnvqbcqpTC8CAzAtyu2/pTYVzF?=
 =?us-ascii?Q?EyMHIIiGbV9oFJ2/gwR50PYZEf7xgX6/Dy91/KdH4HycfGlkh4svzrHQ0TJ6?=
 =?us-ascii?Q?NVWxnbCR4bTscdqTHCkp61qmt/gT82FLrL51mGl8QFe09zMbYYKMBVVx8zaW?=
 =?us-ascii?Q?o2n4vggBbmBAbijjm0JQQvYw1sbYFE/g4IhLXS+uA+HGjIpRg0rsT6241Im0?=
 =?us-ascii?Q?hFudCpKmlHOqGh4B4/9pvvCEITas3Uf5FGyAQ2FrvjmkadZmsQ6VGWBtTS4y?=
 =?us-ascii?Q?5b2v2Ia0V/kTf1/jzx4fXjlGuGlBcxzJxfqZxwyrsp4jDxAw3JVLeZ30waqO?=
 =?us-ascii?Q?+D+hNdLURBi7JkpUOUBt/859hSDOSQ05zbfUhsO4iKGh00bWHr25PAdjApRu?=
 =?us-ascii?Q?iAlqXCkcqme5GIW+rLAcP5809Gby+T8CbJA0T0pX+OAT7IRSDs2n/BpdHANY?=
 =?us-ascii?Q?lXRpNo7hs7rV/v+EW1qHyfdYdPdAe9QYldfMoELAtVMVnfibLgZRJOe78IHw?=
 =?us-ascii?Q?KpsDHy+bHbue4aRjVcr++VCoxuJRjH1d57AkXa7cro2BF41dqlbkaBP6sXDx?=
 =?us-ascii?Q?//fSL6swXHlS0NSbm+qL3Th40hhuPRl/qUVmtQVfJPfHrSoPCJyxaYbWoJUX?=
 =?us-ascii?Q?m2Az76EfkC1j9UkXa+RIwUFlqVM3kZpwhI2n5Ji4UH4c1LfAqazuaiRp1//X?=
 =?us-ascii?Q?n8/t9ebxjPW1YgLlQCyxwlqHD6cPawMbH6i+i04BWMJ0GVzU31Ai7khDh5+d?=
 =?us-ascii?Q?eb7ttqYfRMpJKcmbt3/3diNvGJo0YwM8NFL2h1dv8dRjuDOurG0S/UOS3f6B?=
 =?us-ascii?Q?AiqmR6eFtdHb4oM5HJDw9Aa/x/fi3FpIEgeB1bmCmC0k8zTWczyy4e7jJ02u?=
 =?us-ascii?Q?x8/dz8gLBo0zukaAGR9Ezx88RWd6SleF13LHaB/TjNK+zTyWJe3fLIDHl4zb?=
 =?us-ascii?Q?jZE6j5g8OJa37sWyLVMgqxfCDR/HkqKqqoRAie5uMiTSQH4h+Bg58xXZC5v6?=
 =?us-ascii?Q?fEIb8gmZs3cES9XqTfr3Y5YyLkYcJ3xSnKHdHqMjI4Kh+m/gZRCOeVupO8V9?=
 =?us-ascii?Q?nEx2cKQmj5t6Y76UOr+PsZvjRS8/tfXywP+CFnv9a/vGO87fAFUyJN1Nsd6I?=
 =?us-ascii?Q?YYEFw84lPggTzSb10Nm2Dd9lGwUp7xRnwz9qnGalBUPwzTcOv2vO/rWBAJo9?=
 =?us-ascii?Q?a37iiKY2caKMHATbIlVEf2HMB8ooaNPk5LJ6SrdxRL4BOOCkMw5A7ZBtNcBw?=
 =?us-ascii?Q?yI1sOwEyKrH+Xy/JzXwoUaSYB+1MmajuxehHPwsC9asX47ev7cyEhVXs3uTn?=
 =?us-ascii?Q?62FXqhHLkKVGh1kZBfgdleeOmpHYZ4sEy4vj5uzjoQNAP1N9Hzt/ROID+MpV?=
 =?us-ascii?Q?N1MdInIaJQRCn9XCJxd/QZ4Ck7oP7hvpHjz8cIE+NzYp2gzzZ2LSXQ2uRebJ?=
 =?us-ascii?Q?O4I5pLS9jYdQ1MuiRgg0P3WWR1mdUFaLunBPM7DNLmzAQm/0Ti2SvW/DIwnt?=
 =?us-ascii?Q?jOuvBxdJjyLIegS0L9+ulx1L+238tp9xFwV2VtDhfYKcxixujXe7dXHhgn2w?=
 =?us-ascii?Q?tmppFXIQeOYr/wqpjQ/4qF9WfzAXuK3DPX+x0gbQbhESN7GcJiPc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb736e0f-46b1-4726-bbb7-08def454d834
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 07:23:58.1054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xcRwFx83QUdDzzrSzO9lVc2L5DOECTKVG9UIWmCccdNGzSVJ8ZX8L9E6NzpB4/Gv4f9SP09bVOZnIU1kKVK7ZkLd+8Dle5PqlsMcM/t2k/LfcIgbZNz3oHc3RxjmYQN9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11188

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

This series makes the i.MX IRQSTEER driver buildable as a module.

v2 was a single patch that folded the module conversion together with
the unload-path fixes. Following review, v3 splits it into four logical
changes: three fixes for pre-existing bugs that only become reachable
once the driver can be unbound/reloaded, followed by the module
conversion itself.

The three fixes address the module-related issues raised on v2:

 - Sashiko AI reported an irq_domain leak on the probe() error path that
   turns into a use-after-free once the module can be unloaded. Patch
   1/4 fixes the error path.
 - The IRQ mappings created in probe() were leaked on unload, and the
   child irq_descs kept pointing at the driver's irq_chip past
   irq_domain_remove(). Patch 2/4 disposes of them in remove().
 - Sashiko AI reported an interrupt storm on module reload because the
   CHANMASK registers retain their previous state. Patch 3/4 masks all
   interrupts in probe() and remove().

Patch 4/4 then converts the driver to a module. Per Frank Li's review,
it lets devres own the clock and runtime PM
(devm_clk_get_enabled() + devm_pm_runtime_set_active_enabled()) instead
of hand-balancing them in remove(), which also drops the manual
pm_runtime_get_sync()/clk_disable_unprepare() dance from the v2 remove().

The two remaining pre-existing handler issues Sashiko AI flagged (the
missing chained_irq_exit() on the handler error path, and register
access while runtime-suspended) are unrelated to module enablement and
are out of scope for this series; the chained_irq_exit() fix is sent
separately.

Changes in v3:
 - Split the single v2 patch into four patches.
 - Add the probe() error-path fix as patch 1/4 (Sashiko AI).
 - Add CHANMASK masking in probe()/remove() as patch 3/4 (Sashiko AI).
 - In the module conversion, let devres own the clock and runtime PM via
   devm_clk_get_enabled() and devm_pm_runtime_set_active_enabled(),
   dropping the manual runtime-PM/clock balancing from the v2 remove()
   (Frank Li).

v2: https://lore.kernel.org/r/20260728092219.525449-1-Zhipeng.wang_1@oss.nxp.com
v1: https://lore.kernel.org/r/20260724090136.3595894-1-Zhipeng.wang_1@oss.nxp.com

Jindong Yue (1):
  irqchip/imx-irqsteer: Allow building as module

Zhipeng Wang (3):
  irqchip/imx-irqsteer: Fix error handling path in probe()
  irqchip/imx-irqsteer: Dispose of IRQ mappings in remove()
  irqchip/imx-irqsteer: Mask all interrupts in probe() and remove()

 drivers/irqchip/Kconfig            |  2 +-
 drivers/irqchip/irq-imx-irqsteer.c | 60 ++++++++++++++++++++----------
 2 files changed, 41 insertions(+), 21 deletions(-)


base-commit: c0a27675eaf08255017b3cabc28c99c0cd71f468
-- 
2.34.1

