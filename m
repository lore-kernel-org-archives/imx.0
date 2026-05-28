Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013059.outbound.protection.outlook.com [52.101.83.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109502EAB6F
	for <imx@lists.linux.dev>; Thu, 28 May 2026 02:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779934100; cv=fail; b=KGpRRd6EgsLWhy8QWYdMxBs2mL76nrurs0byKmF0bo/0D1Cica4UMfygU3U7uwKGiozttJ7+NPgs7MXWS9d2upVqupKgQ6ppX6fIxcr0isWqu4H6mTkg/xmM0OS80GTLF1mUeIe5+2zs4R0kALVDVmrpvIVD4vKS+Vjjl2jryfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779934100; c=relaxed/simple;
	bh=Hd7iSa6G5tQ+UpY6+fF/uEKZL2g6Y3OZLwryhvskuXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nVnJWcuWnHBqrahSWeQfnXlz5Wfp91JBIJ24MsSKeLbvTBTSfmI4+EdlK6uIdz5KjRKd//2x7TyTmZjmunHIA1LwHuU/Dx3FvbqTWzqixpGnV6QN9Kb4pmO6g09/i6hITuz1RPBo2cpTVqJeqHqdCIEGvSP4KSAYLut1oEhfosI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Eb5XcXe+; arc=fail smtp.client-ip=52.101.83.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Eb5XcXe+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yc3LKEytzuWTbvBKSX9ycaLo0ZHXRGArOnTaFhrKTJpfx+cOt2o6awfXjQy5wNZu4l65byMoie0XzeQh10GMFmkkyK2DV1+MDeHIuOtOi3zzsrN6DhDWV2QuquwxOPNH/m3fW09sZkhiHn3joFLpCXuirh6cDESnMa26Lu4IutXuJXr1t9HGl6cd+4YBnpsnFxDH4WaEzVcaKyMaKH/yFqsF+6XUekwtaBEdqeRDDh4Apks76tq6+xhLa7fARydWD4INuQ4quSDODIqMjSheMhib/8GI4ivpNLJj8s3X6sK6Ua0d3d5CUpms0CFWoHsSk1THAk1zz/ZsJgiB9PC20g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmPi0NXDPyCh0gbUdtQhtJiuBmL/Syko2ed8wKZTqYk=;
 b=oDtEigb33fWbMqqyarmttPN2Z+GsGTHcmBMZZVJCeXDGTy4gjrhrUTsAEOd9/qWQdWJKb2m53+yhjkvSFLHHwc0Vw+uQQeFG/GIDUHZNQV9g+8Abims0AcvsdcZLjw0FPUGyHynKqJNXUDsZq8cUKxsIb7zdI+1XcDcxU2S5v+tVxiTg23GHNHrVIctODYVjYXxOMuSel6PA3oFY4iNxSh0pBWt3tx3v2cb9A8JdQD9OUB8i0nAhrZv2cjGN8SP/Am0RgV5ZTCLNFRW9Y0PyIT8ltjm88JZL4dBVfO9yDE7JNkTUhiqkNfSiNlBeYMNwsj7xWIw5vNSlhiNAPIIeNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmPi0NXDPyCh0gbUdtQhtJiuBmL/Syko2ed8wKZTqYk=;
 b=Eb5XcXe+xO6pCJ2KyZ7ow6HpubNqn78CoUF9VNDMibBG0DysIRMumz5i3mcfiUxKhjGHvvDQPHFqZKXCyVNzyynF78Xwk2ashuQqSLDTSK2DhvR1E5Ke1V6SfoUgSHB0yi0KMO7G+RwSKtXqE1UMD0Ps61Lgw2ThmjjGyIilspkEunKHwL51mP9LIjU2lZxWoYONYIxcJEENFIJ3Xks0gJjZELOZ4k6odU/P9OYdmGYkr+cM6XM/HYqBCsPeuWrCwtxZ7E+l4Q+sAtbURwALYeQk33TGgkPLfUx8wueU9KSQHBI7xKCT+TEPEMJdV4Fb0Yj1RQX1fVvchbiiiTDGmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by PA1PR04MB10985.eurprd04.prod.outlook.com (2603:10a6:102:48a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 02:08:14 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9870.023; Thu, 28 May 2026
 02:08:14 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: shengjiu.wang@nxp.com,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] ASoC: imx-rpmsg: Add headphone jack detection and driver_name support
Date: Thu, 28 May 2026 11:07:22 +0900
Message-ID: <20260528020725.2265321-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260526053815.140008-1-chancel.liu@nxp.com>
References: <20260526053815.140008-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0122.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c9::9) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|PA1PR04MB10985:EE_
X-MS-Office365-Filtering-Correlation-Id: 3173e7e9-61b6-4a79-16f1-08debc5df96e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|52116014|11063799006|6133799003|18002099003|22082099003|38350700014|56012099006;
X-Microsoft-Antispam-Message-Info:
	3BX2tpxTtV+I+dsuUktTkMC8lRDEMWgDWtlpyGQFXiezkiS3H5GwaDSK9NpjUBGma377s/Fg/yrM8Mc+GPKSO9skvTJmG4Bs0nlIKbdDLmIobqlwLKULk6n9kH/RQRVq8ApJGa+KPzdOlliJF5+oFbVocB2ho5ZwhxnIKkjYs2V5o1e5PjMnsFHKCzgFar/3T/Fub+eGFZytrLh0TTgBpfUPA6wlKhDrUKkE3sYpu2jV1NywnRsAB/foe/DLRZQ7ruH+AFZRgqqJAMR5Xk7gA9h5VKgWL/YfDGKyTDCJVFjiu2e7dJ2jc9ln030MLAfPnImKXYOcBqRsMy2yIT6oOn/hi+akfpkwdj+vWhW8qV4BUZYmb5e3rUc+bIGnN7xIFArAZ4GI/p3kiBDLy6PKDwodYgX9VbGlmMLRE0GRLHgqWBUXu6KnTBzY2cxUTbDSTFhoHIEgQnV60MgFwXGbQilHFoeugkFaTmJuM8aE+uE5hLBDp/eERlppyYlqpvxRbnhR7ucY0F6UGUgLHFn5EMAlqm8/ovrHEVsVOFUXuTcdCMOC79G+d6Fzx1Ts77kRzvOqsmfRcesVW0eMS0UjxuNl24vmgEDYjqyavtL0qlaHpxr62CeszRb2rpojUd+O91K+0PQjCWmbYeCYlaDwSYfrcOaJv/RyekBRwhQlQN6+7nHrMBBXcyCiwdhlxA0BStFR9j2PR5StfxxMSDZRoOweBLevIp5PNeaKdhOdw5qJLwszJ3eaG13gHzhAMwKH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(52116014)(11063799006)(6133799003)(18002099003)(22082099003)(38350700014)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CUe07MSbLx2qU7SzQ8d1yEFHFjhqZ5jf4j7zG3g/Gq0uYGj2/bGjJhuMozLY?=
 =?us-ascii?Q?rXkephbJGRYRgswlJVFdeGSBJj1sIIED9acelQJsN2GxKcemgRp8AuxHYk28?=
 =?us-ascii?Q?Z/EHosf0RUmviBDrAT91SgJq+Ch3VEz/eooB4sAKFfzoTZJYafEsDY4/LCav?=
 =?us-ascii?Q?BhWqWVZ51l0LwG/zvhKnysg+JUKpJdREMuLUOOud66HWWVSyBk2GpYKrbFvG?=
 =?us-ascii?Q?k5dsfN7MPfgMfcgqOeSEtVZnYHBKgGS5laYLLgufLX6Zf2xvFsjWL/sk3lQk?=
 =?us-ascii?Q?5BPB3g3EbFUoQiGlhUTFnOUoK6m3XCDf8XCe/FYRmU1WxGrpRfrDGd9u8/8B?=
 =?us-ascii?Q?ZR0vrNNNzp0hsGFzhjS4M3kwfQj+ehtdCFHQoUI3CK4YndVV8FFiDjDqs/9I?=
 =?us-ascii?Q?y81G5rmaI0abzsAiu8X799ZDc6vWUoAyReDmDjJ5hEjr4RhMvS/wqd2aOZHU?=
 =?us-ascii?Q?6+ftHMa+DNedJq0iarWoNx2pmalEfAIzwJ/90zUqCAmm2I7ZiXVxmrnZKjr/?=
 =?us-ascii?Q?INCY/lRjo+8BTd19HtYUH12E7w1UN9XgDv++xzV5c6qfB7f32EdmcSQB/Xij?=
 =?us-ascii?Q?keeYSyLaTw/Vup11wkAyjxQBilHLjx517DqL6Vs/yTZYoAZd8ocL+hyd1u8X?=
 =?us-ascii?Q?cAaw1RiZIg4B72uh1h6C2KYMmlxmGmTFB+HeAEYhI2Up3m92MAclBV0kcRJk?=
 =?us-ascii?Q?ScXvGSLUitroCtzKL41kuHuSuRWmZ8emLYgKVisfbvlgkKcXzh+KIf62jiEF?=
 =?us-ascii?Q?YAO/WC2r3g9AUg9aYiQaRxqP0AK9giklVXjNTujwS/PP/7nLc5PmXbBZAG1l?=
 =?us-ascii?Q?/TeglpiMADQVkVj8e+6XBM1/4ujbCVzFP8bONB2Wooy5NNvbUqCBJRmCyabN?=
 =?us-ascii?Q?SwPb6RwXSC/sqQ+eBMDn7pnoru3Bm/PcZ5q+JasdEbXZqP9eUVjmHuONCVqg?=
 =?us-ascii?Q?7ooF3Sv2k3ojKZtVTjl8OBNW2oq9kdGoNTHJ49fdXH4PWME++I9MHQ9lv4KP?=
 =?us-ascii?Q?Tt7uZlB3/YoA9nQ1fdQ4zlNVyva0pe10wok5DsR5/0FCQ8Ek0l1jDAQmaHtZ?=
 =?us-ascii?Q?bwn9qDMPecMLpcflbslis379SWJuX/d/tGFVIY3PyUIPmxwGLDMrUzpt1v+4?=
 =?us-ascii?Q?gAGl1I39e4GbdGpGrZDzmAj4O8wQnfuvFHM8lalMoxZcxXRxG2P9799+6TaF?=
 =?us-ascii?Q?KTznBGsUBKdOMQwagMmzJK/mUnXzdxENZpIH/hRxSj67Yde68t2NkkI6Suhs?=
 =?us-ascii?Q?vaFHUkZOhcOn1tAeAgYFC3Igv3KedwSPtQtPui/QnEFQ+hBm5ixNxal9rUDQ?=
 =?us-ascii?Q?OuO+CNM6aFHwOBS/3kgHpegxxI8C+GjTvT90SHl/46X1/rTWbuTatiEaiavP?=
 =?us-ascii?Q?eWhdAoq3e42irHvSY1NHhg5gU00NO8F+UxxraPlvxx+y3PC5iLe3C2xM8o9T?=
 =?us-ascii?Q?WcHMuH0EcDrQ0jt93ebuohjR2BBMQgohn9J3aNbY9V0jCtkTXFaemnUXaSId?=
 =?us-ascii?Q?eZCmhHTdO+LhyQfHlsXVrPEJrDMEHN9FtQO7GHgKA+Fz9oSPhwrCr3qg9R7J?=
 =?us-ascii?Q?wTKDAPp9gbG3M0FSnLyFejS9qkRlcWsPEqcl58orqki/HIevQuSA6pFO00m5?=
 =?us-ascii?Q?kE73p17H3bZJUDlyooNYxMiUYI1AC+zfZOCBXh2SiwmseCUbVz3osLrtebSX?=
 =?us-ascii?Q?IwUAb7hGQ8bNjfbD85umyd8fOheMuYsBicdUOU3m6qnquVL07Axd5GEdVJIM?=
 =?us-ascii?Q?820GsvlD4A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3173e7e9-61b6-4a79-16f1-08debc5df96e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 02:08:14.0590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 41vg2gYUNhkkkr0alXBA2kpGwdb7L1JdzgdCc9s5ER2Wz5g+zqLzM08VGnth7G1e8XtWfwk30puGoR2N6cObGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10985

This series adds two features to the i.MX RPMSG ASoC card:
1. Headphone jack detection via GPIO: Introduce the "hp-det-gpios"
   device tree property and use simple_util_init_jack() to
   register a headphone jack with GPIO-based insertion detection.

2. driver_name assignment: Set driver_name on the snd_soc_card to
   "imx-audio-rpmsg", enabling userspace tools such as UCM to reliably
   identify the card by driver name regardless of the board-specific
   card name.

Changes in v2:
- Add Kconfig dependency on SND_SOC_SIMPLE_CARD_UTILS
- Moved headphone jack initialization from probe() to late_probe()
to avoid interaction issues with deferred probe

Chancel Liu (3):
  ASoC: dt-bindings: fsl,rpmsg: Add hp-det-gpios property
  ASoC: imx-rpmsg: Support headphone jack detection
  ASoC: imx-rpmsg: Set driver_name for snd_soc_card

 .../devicetree/bindings/sound/fsl,rpmsg.yaml         |  4 ++++
 sound/soc/fsl/Kconfig                                |  1 +
 sound/soc/fsl/imx-rpmsg.c                            | 12 ++++++++++++
 3 files changed, 17 insertions(+)

--
2.50.1

