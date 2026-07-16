Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D892EE262
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 03:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784173672; cv=fail; b=dPsrrBDcsHCjaIQZOaSBT3t13ZrMj18hzwMKw/CyLYOz3OQjHJTTtofI8QCXqHYltQvK9cGGq3vi7F3WFOYxdWaUhVTZHik+O8WdD6hTP44r2xV7T9vx0+0HusKhjdzPhezaeMv+ZPoIGr17PHcWtJcjev3p1k+eEzlSPGPz218=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784173672; c=relaxed/simple;
	bh=gvNnIp1BCmvfCMqBNvI1Ys7QRURenpVwg+5KOHTMPqk=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Qb6s0P9agie+nxJ0mO8qLA/9QFAxSmT0V5gRDN2vSocVwIlWs9897Ebr0UOt5L9t6rW8AkjI9SD98tCL/Cm61A4SwXce0D6Ea/JJuwT3VSku7jeOLV4DQQnOatXWbbT48cge/8lMoSRw+ZbDtBEv2+LvwzfsrLq5sXY0635d+OE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PPZbZ4Xd; arc=fail smtp.client-ip=52.101.66.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PPZbZ4Xd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLHRoYCtAyYVvNojGlnBVgcgZ2NyRbPM7ExAv98ujDTfENo6n0gG7LWCcTGnVMA4WqQHiCMKkT1DTCqLiRIerweFKCNu6IpIsCEvs1DAzhvUV2VCrg4dqT+HlrvuuAccYddH9rYJnPyr7F9thENDnO6Axf3lufg9v/Y0eK+OX53UUC4PkJ5YkZ4UrbvvxOb8iB7l5TCCHdtGw/JMrSfhltJHikM0YP8xA+EckA5w2laU3yYWdewMe8vvgqMzpU/UkbJIKrLKNf6SVhrahbm0sTmomaxNYlbnqyUJaXyX0TxbGiZei43qTA5bO4obuUMSwn6MIFMIm9AbqW4xZEaLQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16YLvy3cbq1qvp0HYtQDGY4NAEu7awq4Z1OjeRAH9qY=;
 b=NLt7ditLwfG46UN/KQ7RCbonfjOxPZuACwxs0v9/QFyF0OjHNNnVHhCht59bTjJ85oe8CgkmLjSh2wwDlwr9EyqNj4mi/Vdf1KMpyLRQQZh90SK1YVhPLIYiCoZUMc22CjI9iDgKeM/ItntWDn9PZWS/17qnIuJcEAEET9ePWc0lDw3WhLvpa+uyzdlxFUsOJ0wKNyCBBIFNbCAj9NmhTixBYiPHsXT6RyzGGOfYm5w4bTNh6KMKw/FxMD8uBhCbPH6WaikwIjqFTro17nPNKbjtGrELGLXT9E1ZjigP3Wnqie+QPK1IjU9mZB14hCSWBFIJ0aNdIh/Yy/0noA7jHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16YLvy3cbq1qvp0HYtQDGY4NAEu7awq4Z1OjeRAH9qY=;
 b=PPZbZ4XdicECQi3St6JkPBQRmvHHZUsib50kQR8cael/8nqyj6o1n/BaIKyR/KEMS4O3M9/gvHt40Qum6fgKnkMhl8N3acO0fopSGDQyFmlew/6jrbWAZoeD2gV5E2EItRInaWvOfA3f2TA5hmSmVWiubcTT+PaGgf6qp/czUCiuPc+PpDct8BAl69Z8bGT5f4KDzIN7v9Gzz5vI8Kk3i4xUiMrZIlU4PphYohh06PsFGsnTlxJnQBr4XmRTSnYRYjv9jRUXG6SoOr0Tz1zYhWspvckNQVkFSi56fy52gVjXODiUHjb7oHIvZYn+Ew7DMb7E/rIcxPR3S5ue8T9xJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by DB9PR04MB9645.eurprd04.prod.outlook.com (2603:10a6:10:309::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 03:47:46 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%4]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 03:47:45 +0000
From: Joy Zou <joy.zou@oss.nxp.com>
Subject: [PATCH 0/3] regulator: handle regulator late cleanup race with PM
 suspend
Date: Thu, 16 Jul 2026 11:50:52 +0800
Message-Id: <20260716-b4-regulator-pf01-v1-0-8c1519d54bd4@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABxVWGoC/yXMTQqEMAxA4atI1gba+jPoVcRFq6kTEZVUZUC8+
 1Rdfov3TggkTAHq5AShgwMvc4ROE+i+dh4IuY8Go0ypPrpEl6PQsE92WwRXrzQWvVOZdza3lYH
 YrUKef8+zaV+H3Y3UbfcIrusPZ75wZHUAAAA=
X-Change-ID: 20260716-b4-regulator-pf01-5db03fba4a92
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Joy Zou <joy.zou@oss.nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::12) To VI1PR04MB5807.eurprd04.prod.outlook.com
 (2603:10a6:803:ec::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|DB9PR04MB9645:EE_
X-MS-Office365-Filtering-Correlation-Id: acf8939e-5db4-43c9-1122-08dee2ecff1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|366016|23010399003|1800799024|10067099003|921020|6133799003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	hsbNjwOyd6Ix1nVvj0o8K00glc95KvnVcAW4U6s9TXLLj7wO/qhdI6Cmc/7nmDEoWHgK128UCLluPIeobHCVrVmgI7nqcBNzV3lz7BJbbVARFhmM7hnXz3V5qeNi1oMwC2ifB2eH8jHu9L7V01VYxF4cDpFbHukAD7rchKOg2mX3oc/aFpq6ig2zuaFHNgsT2cNE8vSle4W7l7axbTDPovsjZVxWyxKPwO8GLTI4RXYAcWDT6TUTRNADTgoM+RyN03IUWpsomGRF3SAs7ibihFWdHCUMlY6ThvY5iH8HXA1zPAUre/QLpuWSPCRJf1lygoSUZS9NX2lwP7IeEH5PVDGqHbXnGV3DoseTRtU5GGqcdavyuFfCrFAxJw6KZGJOb8AC5iwvGnu93XwdMyadE48cooqaOd3/OI2dWt+09B4tMhVTDC0Y3Pq1BXBO9yFVNac7yUnAk7R9QkDTG6Z9kv/rrJEjHqEEaxE6i+OK1rN23x9tcp+jNySRu0W3NcFSqh7BZ/om7xiVLfuduUHJMSD2RE8bSUuMFRqwrnSKg5YqVlxnnDVQ3rh6vTvqZ997lernaF1ZdkND8vP4k7aq0dXmiF7tLlepmM1rAiDA1B8Xhb8H+xQcrthsmDcXtTqTXzJNdffHYRh0q0QY3Yc9VzwJH47On7781nO7bwJhhhYVRObQ+l6tSXs3acT5V4ha2dYYr+SRs0XMkmVoZphzPw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(366016)(23010399003)(1800799024)(10067099003)(921020)(6133799003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dklCZnpOZHhhZXdPMzhzS2ZUU08xcVBCUDNNMGN2VUNiaER4WEZDc3RnY0pG?=
 =?utf-8?B?bS9EYVlwSGRCVy9HOTRyYTUyUVMvWUNUcnN6UlVNQ1MyRzJhdFowSzErcSs1?=
 =?utf-8?B?RkFQMzNxZ3hyQTVDaUlVQ3k1Y3ZCZ3dTVkZhdTJ0RzI3b2JadFJKRktkaDl2?=
 =?utf-8?B?WnMyM3dYcDUyeXVoazNjYmhuU3FrY2M3L3pBL01CWWQ5RUJxbGRiNG1leVBw?=
 =?utf-8?B?S09hckY2N1l3MGlIQk9waERpR0k4blZ4SWxOYUkrbHJQaTQ3ZkZLRWJsQjBX?=
 =?utf-8?B?MmRmQkhlRW5Sa3g0VmhES3dVODI4Zkcza2JnNkgyeUlNOThIZmNRK3VMOVVT?=
 =?utf-8?B?SnpEQlJOdDc4bHVBeUU0UjhjQTJtWks2N0kxakllbWNDdElDaDVrOHlXdXlX?=
 =?utf-8?B?S3ZPVzJuMWl2SkFIT1FlTzZ4ZTJLcHdockgwTndTOGVFYytuTDlWZzQ0MEZ0?=
 =?utf-8?B?NFphVnFMcGtzczRWcm4vVTI5alUrZHJFbmVMbmpnU2U1dmppN3hxMXhtTmZW?=
 =?utf-8?B?Sk94ZjhET202Q3JqRWtEelNzRVpkM0tKWVlQR2Z0Q3A2YVpjMHRNN01MLzZv?=
 =?utf-8?B?MW9FN2RHeThkSWthbkFlbDJnWUtkZnFlRmNIUVhyd2I2Nko3UnNVZ20vRVhm?=
 =?utf-8?B?WDFLVWtZUS9kZkw5U09RTkkyMmxWbWxjSEZuQUcvQmVoaXRaTUFveXJLclI3?=
 =?utf-8?B?VkN4anpQVU8vc1BnQ1l0L0hZeVNQdGQzWkdQZUNPMk04UnREaFpvZ3ZqSW5U?=
 =?utf-8?B?eHRNRnJlS3NxeEdHZkJreXA4NFN0ekFjSmtWc2lsdGpEKzFhUTNpeFczeWJE?=
 =?utf-8?B?bzFpQXFIMTU0VG1jYkZjSTdtTXNna3BUUFdQQnl5QjdCbVUxbXhoK0dIYkpD?=
 =?utf-8?B?dldmbDk2bGlnYUtxVXZROUhDMnpwekZaRE1vamNIRHp3ajZBWTVseXlieUFu?=
 =?utf-8?B?dzZVTDVYdGpCUU84bHMrYm5CNnlqbUdiZHhtYVRqRnQ4ZXczVXZBOUJYM0Zv?=
 =?utf-8?B?MjFPcWF3NUovMGw2Mldlemo0V0hvVDRtZTZtblpjRXFaN3ZjVjFvV3RZN2h3?=
 =?utf-8?B?dlFRbVFzTi9sbEl5UXpXWmxuRGJlQkVxTkMvZFpOc1p1NDI0UFlCUDVxMzBY?=
 =?utf-8?B?WlV5aERPZHh3QzdNT2pPNnU3aDhpekFuREtVNzJvWW1QWDg1TWxoOVJ1MDZY?=
 =?utf-8?B?NmxYYnZBZVNpdGhoczJSd3hvNjVrOGlHTTI2akFNRDFoaUhqZjZyVnlEYzVj?=
 =?utf-8?B?cEpCemNNamFWZzlrMXJIYklIRE1UbWNJb3kyK1c3Q2RsQ3ZmMlBEdEJudnRL?=
 =?utf-8?B?c08wSlVZVWZoMmN1azRlTndOSkZPVkgvYmJsbmJqUllwdzhESURmNzFjelJU?=
 =?utf-8?B?c2VRM05kN2J6NlpFYVRYUFVKZWUyRlJSZzFMQnk5OFQyQ1pPdjV1ZERrTUdK?=
 =?utf-8?B?K1E5emltMDMzRHJMbCtlZlVQS0JYNzBPRk81cEJXR1Y5Y1IyR3ZaU2Z1bW56?=
 =?utf-8?B?VW5wckIvVno0T0EwbG1idmp6d005ODAzcVZCeHFiblh3TTJHczM1Z0llQ1Q3?=
 =?utf-8?B?U3p5cUMxb2pEa3dyNzkvSlZzY3Z6cjM0L0dqK0pnVk5tRWY3WXhoRDBENEpM?=
 =?utf-8?B?MnBFQk9ocUgvM2w2dnRUYjZ0Yy9KSU93NnRzeHk1bGw5MFMrbHdpajBOSGFw?=
 =?utf-8?B?bXVRd0NmdGdlalRGaTRjWWo2MTJEUElJV1lJc2VWbTR6NWc0dGNJMm1YdnBl?=
 =?utf-8?B?UWxnRXpROTJtbkM1R0s3RkxyMHU5VmM2QjhQWVVJbVpVR215M0E5WkF3TW54?=
 =?utf-8?B?T09QdVZ0R3BxU3QwOG9GM0pRenlnQkZwY013aVBBVnNYaytsL0hVUmovM2Jp?=
 =?utf-8?B?REFXYmxIVytKR1NNNzlqcng1Q1hpK2lLMUMrbGF0UEJXaFNWbjU2K2FrczNm?=
 =?utf-8?B?SklOMzNhb0kxYS96V25tTC9Oa3NCVllsUHJ1VmV4aXJUT09wWlhLZXpuOEsx?=
 =?utf-8?B?M0NpM0p1SGdhejJmV2ZLSmRVWE5hQzl1VldFQ3FxRExCR2E1dnNyc09ISGdl?=
 =?utf-8?B?R1ZxeVlWM0UwRGhvSys5TzRzcHhJa0VYN3lhSUl2bDFGMlI5eDczL3RBK2pp?=
 =?utf-8?B?RnZmQkVRMjI0R2l3SWlmRFJVeDVkRHFqZnkyY2Rtd2pUYWQ3Vm5UUEZhaE02?=
 =?utf-8?B?dER0RG5UN3VwYU1XVFRkSkJhK0N2Zk5iQzZQUEhnM3M0UjMvbVRUYU5TUXVO?=
 =?utf-8?B?STZyUDd6ZGZOREFQeVlEdG5uK0Rha21yeVpCaTQvRk5ibmp6Vll6VE5xdHRo?=
 =?utf-8?B?bU1pSUxNdUVkcVB1aitneXk0dXh3MHRzaXMyTnBwOWZWb01jNmsreVUvYk9G?=
 =?utf-8?Q?LFKFlCa07wgIVefCPodQqBexCAdUh04hVXcCn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acf8939e-5db4-43c9-1122-08dee2ecff1f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 03:47:45.6569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iMH7PGhWq2isr/GmwadHlTKMgoNNVNy8/LuJvBq7Z7K6zz7dOgUveeUaMLKXjG3DdWfwMVPwhzzzjLv/zi8AaEMvX0B/qe8PJ7Y61PGQCijU3Qd0FldYf15mmny2YIN1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9645

The regulator_init_complete_work fires ~30s after boot to disable
unused regulators via I2C. When this work races with PM suspend, the
I2C adapter may already be suspended, causing a -ESHUTDOWN warning
dump.

This series addresses the race and adds proper suspend power
management for unused LDO regulators.

Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
---
Joy Zou (3):
      regulator: core: use system_freezable_wq for init complete work
      regulator: pfuze100: add set_suspend_disable for LDO ops
      arm64: dts: imx8mq-evk: add regulator-off-in-suspend for VGEN1/VGEN6

 arch/arm64/boot/dts/freescale/imx8mq-evk.dts |  6 ++++++
 drivers/regulator/core.c                     |  6 ++++--
 drivers/regulator/pfuze100-regulator.c       | 17 +++++++++++++++++
 3 files changed, 27 insertions(+), 2 deletions(-)
---
base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
change-id: 20260716-b4-regulator-pf01-5db03fba4a92

Best regards,
--  
Joy Zou <joy.zou@oss.nxp.com>

