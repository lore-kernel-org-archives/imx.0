Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011000.outbound.protection.outlook.com [52.101.70.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D341526290
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 02:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772593104; cv=fail; b=dHwtoJqJlWI1E2561zWmfg5nBx8RzG7VdgAlPNK0KbxR4ykU2AECDEgDAkq6ayBpN/SiejfKmhgVHKLtdC3PHIxSdx/w+vAQHkVWD/iV4wjZ7RAIXdwwM1WC+kPN8yJ9FZzEEWcgymmLAQPITjkAqVHec3jaQgBmWsbOzosDxro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772593104; c=relaxed/simple;
	bh=O+nbiC5NuMFByr9ywP4lrluhv8jPwj6RlT69502n/R8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=hAw3h9W3bsirOwwRyjVvIqqricNN+pbGAhwaQqjCrU9k2rxELR/9Hu3YMpStIyqZ9YlqrpkveXul/uUtRpUjgOsviMbc/9PYvKJDsahthMxankV8oZs1+RMd1k8aQHFnv82zc2FJVIQ3Q7lUSYsdtwN5pM5zOwWOhAs9w69BZJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EhsvBEHa; arc=fail smtp.client-ip=52.101.70.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EhsvBEHa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVw94FsEyGRpXpEupTTrGjVBUsHILoULMbcIObn5SepV/GrCir6fWs2flFFmbtDyoccgd4BJqEjWJKq98heqym8FuAmLIpORyQvdElDNzh0lscUGIo6VxdcqWAp1zl8sUu7M03bqDtYQuay4oXBjtJnG/DMFkvBQNdYufu1fRBF+EKbJa0YdYFGX0UR3RUYt/phpkfpJ3fRjQYy2MTk0AIFrbF3l54Uq29qnX2aiXz/b8blTr0Gbr2PQ56Kyn8k5a1lu/mvNaz/nakGxGotwjehQfMB7VW1qV0zHbgFTNaFWBvj2K0dGn005+4G/eTUQYt0C38In+SWxFA6/Gs2Fzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGZVYJrvLwJdbsYFmZj+B2qvTXgkNKi++qVKx/L6YMU=;
 b=KSNv38ZUbqaS3g9AZqFQhj78jGRNWfNOczEQwh3Lyi6rlKAcggPZgy570038EhHHZJAIHS3KZLNI0RfY23yhF0MAPT+uTuGvTVOVIynyr0Bm9ZCkf+2W+kV0MsrhQFWeIry3ehMkSmQZc4dv0yzkLV9kx21s6ZLYIEpwoKb4eFs3Ig9uDD4m7YJNVmAh4yIBJnHmmSR6Gbw2uVR26wtdYS4bvsyKcwZVgznK5PepJxdwmBK2Vgl0ZJ6Xi642xFqSv27wuN4AzKbWUF4ufWZeVN+cavQI44tJY5/cMje8//8GgCJxEMzpRV3+Wr77XWTsn67R0cqXYpUlFfwwQhE28g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGZVYJrvLwJdbsYFmZj+B2qvTXgkNKi++qVKx/L6YMU=;
 b=EhsvBEHazr2moRWeFxZDiPvbWHuufinw2TjNIcHhFvonhh4hvXafcWTZ1DkTXCSGffHOCgFneRa6Cmc8b54Fqyi8gs+smPqPP4phYkeferkrj8SY1KbJLp76tOGNilv4n4h2gSm2FhqwfKdwh1NEN9WGdaKRmc4rL+6XOj+B4+It8w1vLAFJ9eCNAmoO996i6RUwV8BV12CfHXRekTQ/n16F6kf4z9icWMxdTcVFs8lHJHxDM1nVPQI8MR6tljnM7E4vP+6q1YAPEszd5tfp57EQypoy/5d7K6YdT6uiJj8YhNbipjGLGP6a1HuBFxVLLJj4Y1So0++BTGoa/OI4/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by GV2PR04MB11936.eurprd04.prod.outlook.com (2603:10a6:150:2f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 02:58:17 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 02:58:17 +0000
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
Subject: [PATCH v3 0/4] clocksource: Add module support for timer drivers
Date: Wed,  4 Mar 2026 11:57:16 +0900
Message-Id: <20260304025720.2583655-1-zhipeng.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To AS8PR04MB8420.eurprd04.prod.outlook.com
 (2603:10a6:20b:3fd::16)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8420:EE_|GV2PR04MB11936:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a4aa010-cd27-4d71-b05d-08de7999e2ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	eCyR9yLlpgVjkVmbobtO1v6YtryxyNDlyOA6C9stXx/yHzkkNhzIaLiF5947MoPwsqwz9oWLY2E5Am/5FaglGRJ/DnFO619ZaZb8swDrIB0kxwvuN/fA5uPC5s/76KBeB+1Hxk768zfwN/XZVDOHENd2Zsvs0JfWilDhYqgYezF5rDprNWu2RhoxFHI/Eq45OWjGkHggU2rrTLUzv9fT4U6FqpjhBgwwBPGRorvjJ1jIYb1NW+uHo00W1Nh4HeUkqikPczktO7cxej/bXBC5zmITGW6q42OOd0aB1n/ajjSJ7aBodZ7D562ISb5x96cfSxpjpHf6/Q80UfR/Mune9ZWTUGd9eH6FcSGZ7SjFSoN2teZGCNzOB8/4z6Jr8ybJInsDfAm74goZxQQr3gjbl1oG8TZxsQYzs3Ca253JrzdZJBXf0Mzy7OERSOBEXMP+Oh/PtKN5EETsjd41vFnXz0hyUJS66bDBN6/dtZ0P2zpnP22WEuibZi3SNKR18cTQrWMqyEB+8bJ2qZdLqPh97pE36OmBkJhJSh/wcsNbV/eiAzI22rYMEVNsv+gLKcXqWTcPCySqqA55Wms+kQvUb3LhkBXlWG52QLzXMewK2l3K8DRFV/Z7S/liXBa3w8anxbi1cHFVzMpUGyMklwgGbNteEnJu9dyOlVHY8pJ+XMVe6cXDhofqlEmpPrnbX5Sj/AAPpngQHRtSod1tMURwwN/3O7fJe8tgtmF4GjfTe/psiIoZo6J7Tx00bLJVeg2hlbNTt78HGSd+bnhQhNIX2+6ZbUMPQ38qGBxun3owJBs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OslnTp4+RZZ7qg1szACptwmKhjfaPnRA4xUhuDtDweLiQ1Xo8dCgZ1g1/RoZ?=
 =?us-ascii?Q?4ORassRslK2MqUfTCZ2FsxqyjvtOwe2mAaMSS6BLgfyo9FnmKx28Uy9gIYKj?=
 =?us-ascii?Q?qnzLds1aZRGgnI6Ei/zROsFURO9ZFaxtpf6lVbuQ6fOuipcBtzvmWg7RMvrv?=
 =?us-ascii?Q?jbNLm3VgZVoLbsvsQmC4R1WkzI/WAnkiI2eXS0gJ9FQK1OXFmuZmUI2L1hYZ?=
 =?us-ascii?Q?GXzbvUYiZ70EUmlQzmsSIuJqA9lc3yF7yH9BEqiIKp9DJHewlWd38xbmPLui?=
 =?us-ascii?Q?tlSo4NcdSW2BuXLKinV0KcQAEvxz/zfBT0zXPYadKMJKfuXO/afCW2UZspP+?=
 =?us-ascii?Q?m5Sv4I+4nN/dTVcQmVEgCBLOJGZ7KXEkIbyKVt884GUvC4+kwLkC7T7Pp2ua?=
 =?us-ascii?Q?bgj8AZkukKAqI6DZ75ehfzFdQN6hcE++YPZScmaXn0VVesHlisa5J9a65VnN?=
 =?us-ascii?Q?L+nufsc6kRZy9pL/ds4It1BsZYmuNbAeh8y8t88IgXVHg2QvhjOMoHY0Y+Mx?=
 =?us-ascii?Q?gaQggdrj4tFYNDrYwxYn54DUH/FSZ+o22gnch8NgIdKl+PcpG40x7G5yUSo0?=
 =?us-ascii?Q?NEfeE4Q5FtgMLGnOBaA/t1U7joycSO6R2NlwMlDNgVCzYF8zFabEikHHRMSU?=
 =?us-ascii?Q?sAry3w1IvOW1EvDaJeToFsoYm4vvKI/lkpG9vZ1NGNwg2Uq8ceZEpfLptOeB?=
 =?us-ascii?Q?W9V4fCC+jpxAmIn2S1elN1FgP2WsNrDLZsKStbBv8Durzx8kvN4i25iKcpkV?=
 =?us-ascii?Q?lfukG2Q4Zsf+/8sIzc3NuT+jto6ObbqdgWlwX1aebCXM7kcOl7TyrJZrlO7o?=
 =?us-ascii?Q?wynS3H6WufX0QHNHI2ufXAccKAs3aQTKEI7oZZZGRL/5QyevUgEO6FVkIIpw?=
 =?us-ascii?Q?oJJ6LTOLk17+wVj/hPjwZzdpCC5N+za1uzrn94TU5Gdtm/fggH8ZrGC8fDR9?=
 =?us-ascii?Q?WW6cdNGiEEhMx+asu/iPgi22y701PaiR0CTRyFzdUwJ41DPAz6qVo0zgMFAh?=
 =?us-ascii?Q?G8h5XYOCqVqSN4m9bsaojSScQiqnhkcspy6HoQng4P52Z5OnlaqcwRIEYUxX?=
 =?us-ascii?Q?uZ3NVom5+pxzHENF2lNWgt5isKiYfBZiF8N99J/UkJr22Bqd44oym2/n7KW1?=
 =?us-ascii?Q?sq+A2p/Jm4L2oFQe1D5qVJq4i0Gfhsx4Ju6f2bUEGlODLiSwI/Xk+vGRtQvS?=
 =?us-ascii?Q?nS8XriaXl8xB9n/kgAS1rhICfsxWVh4XNEFfgDTbDl/GhzyPRSf4L5F/fj0J?=
 =?us-ascii?Q?6/pXAGJ2+X4lzacqVVh2B6zNlJ708NCvm8MpHy1uR89TGwkNjHcyickk3Dz2?=
 =?us-ascii?Q?iKmnNe6ON7LHhQ4Fm7ZTrmKglrANVOySphhdX9jL/z8gpC//tn4UJRQ6jz2Q?=
 =?us-ascii?Q?kzwSvMVZL5Pc9cACyLCJPjQXPw1rLmsBNUZhqtrIxJemTcZrJ/ekWMuiFOGr?=
 =?us-ascii?Q?JHFVZqhJ9BTr1t4U3lQAZxzmn3Krs042AE2Wlgn1+exE15wmN+3sfyE0zw/o?=
 =?us-ascii?Q?VFSk5u67dZRF5en6LqhvrKSwXH+gEPHLhTNeVoVLU27M/aTIEfycSYJiP/Ps?=
 =?us-ascii?Q?HrOMAmPr5irnBeA/YzyojqGU28SVqNiFa+/1V3NDy7hO62Wr5VDcAIGsCYte?=
 =?us-ascii?Q?t84NnyNLIlrbEnmNkldk8CwIaGaMpFpahrZ6TYlTIIGtBC/4ZxTVK6NHE6ps?=
 =?us-ascii?Q?Ww5/JDkcEjv71bxOy4Vn4ybBbfntAY0QPMKkzS9vq0FWJ6NRAsw4hxJjk+DC?=
 =?us-ascii?Q?alUoNdGYwQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a4aa010-cd27-4d71-b05d-08de7999e2ad
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 02:58:17.4877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: msUJOHrjgr8eh8r4n4pap0esIL8U6hABefcI0h1kWYEO/tKrWVZOE3PZC53IdgFDXMuH70wZve/DiFHhpdF7Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11936

This patch series enables clocksource timer drivers to be built as
loadable kernel modules, which is particularly useful for GKI
(Generic Kernel Image) configurations.

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

 drivers/clocksource/Kconfig          |  4 ++--
 drivers/clocksource/mmio.c           |  8 ++++---
 drivers/clocksource/timer-imx-tpm.c  | 36 +++++++++++++++++++++++++---
 drivers/clocksource/timer-mediatek.c | 33 +++++++++++++++++++++++++
 drivers/clocksource/timer-of.c       | 23 +++++++++---------
 drivers/clocksource/timer-of.h       |  6 ++---
 6 files changed, 88 insertions(+), 22 deletions(-)

-- 
2.34.1

