Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010068.outbound.protection.outlook.com [52.101.69.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CB23E00A3
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 09:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787130355; cv=fail; b=UZFiHBbB/DrEaAXgsUkwseeHnnz7P1WhfxHOT4qFaT7D0+fhE6dNc0dEqnatm75t4B8n22u87YqmUBh7LgrH8OmHJvL/VgILC3wixPhJyP/7KAG4Mf6kp0rFmFhGmat9dA470GhoN17ONoTH4FjCGciTZdrpG/GFMPc4gM2Qiec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787130355; c=relaxed/simple;
	bh=KdafO3UQAa8uLWACwZPJmH4bTfLFHWsFaYiz93QUMuU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Js3/9I5P+FYrZ559o7yfe7uC7YNDnpoBW22Fjg18YNrSQgLFi0xwnRMSDIdVumpWz1YK6nJdicA6UBdh/JscrXgNevWC6QE8GflkSIN4Ho6QvEJ7FMfnjPUwXJW1dRvtJZCPMSMSErn0vHelaOw0U2IgN/tV2fFtsUgYR0e+y0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IQhAV8hi; arc=fail smtp.client-ip=52.101.69.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IQhAV8hi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ssJsXtpWPCJfm23t8LaspI3V8nWAdkI0hCRAxb3L+lQtx/GAMMpw2eaojXGdlR4bLGiAy/vG0i6O/ExkmvnJTGY6maxkiRVAkOSy87WTNRFL1iRV3XL0uw96OTGEtz/msOjoyue3YtHZd6B4SMD53D9XGjemwHl39Q+DzssDsiBh8dLmkOHvJbnbaH7Fcqa0LJZW5x+7U0Sknx4K0HnCi6RBlYt8MHh5BDPNChiTFxAUzSm+Ydx9Tfsk1IZVSwr6YrzEnjO9K82k6IDhq1R7XcegydsTbd7LGjYu5YVIoC11/bwKvXZ4pwmg2nfUsytjQIcA9AqapUCP6J6Iu9qyBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITSTQ7B2SYldCE8RvC54MMU7N4bR4gbFrtXiEu+D3ks=;
 b=q8vDGONxoPambGj7/tuqUkkDtWdIHkFFQO11opm1coB1o5EC2diyycp6pg0ouu2riZCNDxfBb6UUPE4YAqmOGmbTZQvzEeaFkLJhXfueAfFxbU//a1R1qd+YjB57hKF1ZCLhCkcAS2exSp6r9Xg2pfCrD8y3Gec7+hwaGCCv6cgveo/+GGv7c/ga83zGLHnQOq3mPIfLd5lshmxj6vKPKejmc5FbxW7sD3QV8ArbsBtooGiF/oQLsb0pbz/6Cwh5G+DQp0VuJc4XrNLEzAQESlVc6/Sj4bEW5Qz4eFRE2m5KNHX4sVuT0u2K4qs2mzeM06SDORPu7ydxDHI28v+jiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITSTQ7B2SYldCE8RvC54MMU7N4bR4gbFrtXiEu+D3ks=;
 b=IQhAV8hiRdYnuvey9qvye5v09n1vt/eiaYajRX1jcofPYaYGlCcENI/q5GgTWkKPPI6NIOKN5uuND21tPWB+XI4EQBtcBfD9hV8BLQA1M9xvE+Oyjf0vHBpLC86CKNzP/Yqbtp4Bn2TWwhvnhXOB8IWIwLoD12hq0OmHSnxWEbq30xEtB0dXbQpiPnEDVsuMijGv93lkqK7eEZnIOIa5zL3uEoCn6uM/m3rU6tw4s9kpYfCqWuAhXjIiSinEM4rp8DhBtccVPSPF4zQGHct4/Yd5jOfnqYiDWSPc7zIZMg3/RDc89TZUjoUaKrHj26rgGQtGF1lsKa7mMIkF6F0waw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by DB8PR04MB7146.eurprd04.prod.outlook.com (2603:10a6:10:127::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 09:05:50 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 09:05:50 +0000
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
Subject: [PATCH v4 0/5] irqchip/imx-irqsteer: Allow building as module
Date: Wed, 19 Aug 2026 18:05:38 +0900
Message-Id: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::8) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|DB8PR04MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 6860856b-e0a4-443a-0bcf-08defdd110c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|19092799006|376014|10067099003|56012099006|6133799003|3023799007|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	bWPfXLuZp72So/+DdfSakgoUn9NTDc0Zm9zxrv82MUtCzAzwU7YArNmBAWkNnR+X41rbfG3MfUvEJp+N13aHDFPbna+3WKSag43PMCGKQsuSmpdqgdybQYo2xA+ycFhZFYLgU+36VdIJR8puFcDL2MAn0bVb2gb91qlG2AEc1ASG04rx8QbeOypFGKb6ByXIJiMRnBkac3CphB6RJlwsgkB59neuIMvfBDbvdltEPtMSWi35fLSokKd2GFNR57XGH/1aTNb9ipr83CEBMJSGqdShpaIYcCLzXD9Yh3sX6WqKSUG5N9Dcv1hX9fplPmpi1aPAwTKy8moymphulWKQa3UMseiYBzBY2Gs4FZVu/+b74DMIZvL4S+Ju/WAyxWfAb9SDfS9aNNkTFxAhaEHXUMsxKW/cRolJTpmlO//XzRLnsqZpM7zLpruSrKR2ipD6OSsRN9JWTxzW9B/wajzGMp6I7jax9SJNm3mcmP+EQkAhu4P+Py320nqo1mDP9dYRVC8gw549I/zTgsk3j3a6Si/wPuMCDub+udnOiLudZEw4N+XMS3NKPyWVd6iFBEzm6e2IXAXi4X4k0LalbwbTBLyhQ72dXmzzLcIjMKhO3GdyIUsj3uBSBNZyPkWUxP/cs5QU3kEiX1h1D1ArDuhGnTh3X5WZgW5l/rWAGXYLiO8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(19092799006)(376014)(10067099003)(56012099006)(6133799003)(3023799007)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iNdybo9ZEy+dTfcqNOypXu5ybDjtw9sGZHKlbPnA8EylM1UifzI1Db/ytE2Q?=
 =?us-ascii?Q?NwnMNwNTfCZ59kB/7UDhRvjmf72UWrTat2NAlPTsObOn28BDnKSpDeDEzBsG?=
 =?us-ascii?Q?Nu/768uAI0XiyycKU8EBW6nV2wVJE3fdxXDIOB+4D6AwPd8pJXVi/6Bn18El?=
 =?us-ascii?Q?Wp8Z/3uhV7vHDFiJq0vv95v23fun3Ed0pR+EPzqK5CQg/i3HA8277uNpcA+d?=
 =?us-ascii?Q?ug6ImXUGUD1t/aOjjm5wUp90zeXgqc58xnn487WtKUkbDxsD5YY8FFO0DX8s?=
 =?us-ascii?Q?J85pgryMZw1w5je7GXuSQTnTDppkkXvlAjqwx5q11brrT8+FkKDZNyf1ASiU?=
 =?us-ascii?Q?y8g2s8nQi3Ud1Po1XulxglG84CV0KVfvVIjtmRHZNI2imaCffMPqvezhb5DV?=
 =?us-ascii?Q?eNCHwSdeupYPUZDVwoYLPO0KlQ/2WA8nOoyJXQY3y0KTjxkFHoSGTG1APCvT?=
 =?us-ascii?Q?Hz7VyQ8EmBBAUxAAVcssqCmqa+K7GkisfXxRQhhw4iWDBEfMIxxXrpClIfRk?=
 =?us-ascii?Q?J0Q02v3cpSXP2Lr/R8r0R0lO2ULCoxPPO3Lsjg4OTRdsLxDQd3REybEy1Tql?=
 =?us-ascii?Q?iiFzGwysCEZT/jU31iy3vxJS+nwuVvJJh8ANLXOpqLe8jLL43Dt/0rW8Cf1x?=
 =?us-ascii?Q?tFV91vYYbtxn7+31ed7xMX3RuVLAg6nwVnEVHG+LOmLN3O9BJfec7iIMeUQE?=
 =?us-ascii?Q?EfZI4s8ae2cnHN7Y80iFxvQcMyvIOSUCqD8IR3cz+AORPHounWCRKU8a0j3r?=
 =?us-ascii?Q?oJ9LtxLhqJK3FWnN1J7yYimNVgA3HLoMBYsu5bLv2EmN4kbmSfgmWg/DDRh9?=
 =?us-ascii?Q?Gn7kDOiK5U001FQGnBelLh4eDu4zxv2fKK8eK6121vugvr+0ES/4kwZHCl0b?=
 =?us-ascii?Q?qLlwshFaM1Wp49zFy25yJd0T6QhI2+IdaJCRsUBWT+GYep2vNklmLeV/Dge9?=
 =?us-ascii?Q?vXKoiDJGxJxLT4fHHPWgmjxJTbcDvDB6mVBHeWTVjB44kf8adm1GzKAYHJQ2?=
 =?us-ascii?Q?tIlfMoWANu9HJbUqRZr1fER3mHE73hi5Rh26ZukCdK63HNO9UM+kI/lz8Uo3?=
 =?us-ascii?Q?B826umrDH1Psomu+Q1d816QzXiEo1xr4vSg34aEnbRcD0MZ1/xGq1QMWIAJA?=
 =?us-ascii?Q?2foO2KhFwOrFv3UOnwkVs6T+iAaO5f8cjotv1F4exAfI2Z6Rz9riEIS+TZUP?=
 =?us-ascii?Q?tvPwbz1/aDCvyMnIEtJvtI0Ug/2drq7bUn4whBDOHWUv3KiIbvlfAs0hPzRt?=
 =?us-ascii?Q?gTJpKG6WnZjZOFzxIgWM0ITdlwzSw8MIBm5HhA+TC4K9Nf0/7yrE6FPDttho?=
 =?us-ascii?Q?N5X+7gOQdfvGmuLigtKRQrY5ycYa3toel1lixaFqsknmfrtSakuU89VfB6Im?=
 =?us-ascii?Q?5Ihw97Hk/Or+SQoOE2Krbi+deewcU+gM3HNCgmNX71I41ZzZRgleGFKRi55w?=
 =?us-ascii?Q?8tPBFMEkzG4mLHD0tbtZUElppai0fw1xVKK4tzs0c7UajOlGa+FJsqaMoYTn?=
 =?us-ascii?Q?OcF51UMgqXgeDWwmdNddJMbFlFwkG0wxnPGDNTlszhhiDeptOvxUz62uR1bw?=
 =?us-ascii?Q?wLojrlHgOggfQWdXSWR595srRBkON7ScBANhTxIIfTwus2zGjgXZRkkNZQVd?=
 =?us-ascii?Q?fkPShj+VNzd5bMKA+Uym2eHJcmnsN6nkCjBa6idiIMgI4lD9h3ed5QkjDKZc?=
 =?us-ascii?Q?FWsruNK2yMoUwJBzdJuY5reSUfFp7UAoFwYAlZaOiKfBJZBzzbbFp0Gsaofn?=
 =?us-ascii?Q?AxXuO8/uTQ57/e8sQGqSWE87TBfgq5/oyYfj+CyqKTazdsBbILBM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6860856b-e0a4-443a-0bcf-08defdd110c5
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 09:05:50.7671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bA74LwnPSkAua/KlUvArpyjEf+nTvTLnSKm3znbxfyfko8w0eTRlX3e2lM5AoIb3DnI3sQaPxfENB0Oho15OR3pQNYLHHqHMbZzDre/h6ILTFepIm883uKKhYFgocNXt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7146

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

This series makes the i.MX IRQSTEER driver buildable as a module.

v3 was a four-patch series: three fixes for pre-existing bugs that only
become reachable once the driver can be unbound/reloaded, followed by
the module conversion. On v3, Frank Li reviewed the unload-path fixes
and asked for three changes, all addressed here:

 - The probe() error-path irq_domain leak was fixed by hand-rolling an
   err_domain label. Frank suggested a devres-managed domain instead,
   and to add a reusable devm_irq_domain_create_linear() helper so other
   drivers benefit. Patch 1/5 adds that helper (the devres sibling of
   irq_domain_create_linear()); patch 2/5 switches imx-irqsteer to it,
   which fixes the leak structurally and lets remove() drop its explicit
   irq_domain_remove().

 - Frank questioned why remove() disposed of the mappings "twice". The
   two loops disposed of two different sets: the parent output mappings
   the driver created with irq_of_parse_and_map(), and the child input
   mappings the domain handed out. The child mappings are freed by their
   consumers and, with the domain now owned by devres, are torn down
   automatically; only the parent mappings need explicit disposal. Patch
   3/5 disposes of the parent mappings only, dropping the child loop.

 - Frank pointed out that masking in remove() touches CHANMASK while the
   device may be runtime-suspended with the clock gated. The remove()
   masking is unnecessary: the next probe() quiesces the hardware before
   it re-maps and unmasks the parent interrupts, which is the only window
   in which a stale line could storm. Patch 4/5 therefore masks only in
   probe().

Patch 5/5 then converts the driver to a module. As in v3, it lets devres
own the clock and runtime PM (devm_clk_get_enabled() +
devm_pm_runtime_set_active_enabled()).

Changes in v4:
 - New patch 1/5: add devm_irq_domain_create_linear() (Frank Li).
 - Patch 2/5 (was "Fix error handling path in probe()"): use the new
   devm helper to manage the domain instead of hand-rolling an
   err_domain label; remove() drops irq_domain_remove() (Frank Li).
 - Patch 3/5 (was 2/4): dispose of the parent mappings only; the child
   mapping disposal loop is removed (Frank Li).
 - Patch 4/5 (was 3/4): mask interrupts in probe() only; the remove()
   masking, which could touch registers while runtime-suspended, is
   dropped (Frank Li).
 - Patch 5/5 (was 4/4): no functional change; remove() and the probe()
   error path now only dispose of the parent mappings.

v3: https://lore.kernel.org/r/20260807072346.1222389-1-Zhipeng.wang_1@oss.nxp.com
v2: https://lore.kernel.org/r/20260728092219.525449-1-Zhipeng.wang_1@oss.nxp.com
v1: https://lore.kernel.org/r/20260724090136.3595894-1-Zhipeng.wang_1@oss.nxp.com

Jindong Yue (1):
  irqchip/imx-irqsteer: Allow building as module

Zhipeng Wang (4):
  genirq/irqdomain: Add devm_irq_domain_create_linear()
  irqchip/imx-irqsteer: Use devm to manage the IRQ domain
  irqchip/imx-irqsteer: Dispose of parent IRQ mappings in remove()
  irqchip/imx-irqsteer: Mask all interrupts in probe()

 drivers/irqchip/Kconfig            |  2 +-
 drivers/irqchip/irq-imx-irqsteer.c | 52 +++++++++++++++++++-----------
 include/linux/irqdomain.h          | 30 +++++++++++++++++
 3 files changed, 64 insertions(+), 20 deletions(-)


base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
-- 
2.34.1

