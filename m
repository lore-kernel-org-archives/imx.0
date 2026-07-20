Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011026.outbound.protection.outlook.com [40.107.130.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3103955DB
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 03:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784518259; cv=fail; b=saXD4I09ewPfQ9pLVO/hW0ZC+gMH5gyv36utjfoiEjgFBwIVCcFceN5AmsvXyg5rjOnSoWBFNc2eN81xMaDQJ+WqWEboKO3k+MGXbT/rKR/gQWlP2+ruCUf+mbQuzEg730SDaDB6YjqXmiuHYHi0epstW50b7JkDRWQCgw07CZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784518259; c=relaxed/simple;
	bh=vqoQTW3AsjK+jpRqCt4mKDvBNEmBeSojpmcuZWx9aKE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Yzy6lLIo62KyWHfnw8IV3ygC03DwwzPfYXySdCrT3Qod0ArcnaqE2ae9jyDC4h4+LLU8Ck4N9/WRum3pK1b1XlSWAAr8kgoOC3k4vXKu52eNp5hWjOlRKjb8X1+xZV1/Pd8cEdLfxUe+G/Kiz+WeS/MBj4i99j0lAQlF10lMmSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZD+vp+DV; arc=fail smtp.client-ip=40.107.130.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZD+vp+DV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TjBfa9jas0V27armPdTL9Y6gob3e2r6JtJXayaA1moI8UAYueqyrIV0JqGVhAXiDDMZJ5nE6WujU452BigvLv5SBC0rnA5cdDPkeEfJZpkobDk5/TryXREFKP3I5muG587trVpyOvQYktIesIZ6nQfrzn3iwnxIUSdjoxwHbIhbsGtwjliKda/vl77Km537oKRBuLWJUhTWp35LULcGdmB4sI6kdVumUBQlx6OD927hc0KK5hNcdiy/NymUa+NWrv/zrhXBjdiIH5hQh3Rb4B/2cqGNAz8zm4RI1MGmEAUnCYSjQo/4mnxNxqU6PyInpYoNr34Fq8Xlbzw2dq/EeiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/xEOc802GWkYRW/M6eaABDmmcOR+x5Rj8iVO+X9AVk=;
 b=tXzCjuOcockFomZPYkntvBs5lidaC0+VOmChXavmDvOMZBXlmb0CAG637Py1URP4E6VGw5Bo7x7YLxBqL1G652R7HfATcs0lZrIJ+XV4kbfmjOarIciplYQY+wwnRGgwjsPmc+17ZmLjRZS+r67kF9ePVrh2rqQKTM3rjZ9Y35ROAq5YJGjnqyjy/g7wyzepLjWalCYssU0TvFlkG2pJUT/pjvL6AQxxYmWCtVd7qGup045UCU3G6+p7KLELLQ0r3J6y6dYS567ZFRp+yJyAC2uvg6WOOXDrtN8haHLeTqQlD3euYhY4Fs/WH03pmatInzWeBIQQ9mWVsQfZASwmqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/xEOc802GWkYRW/M6eaABDmmcOR+x5Rj8iVO+X9AVk=;
 b=ZD+vp+DVjgygrBVxIInRb7tS1MlYTDeo0AxRJP02VgCd7OlnQUwr5ZtlEZLaA27XeE0Ez4hMfIziUPRsY9VHy0g2VFLJd+wjR6uArXOK1caJFz1F7TUiXqHhOKqJYbTY9fRXBb9kRNF58I9cAj9LUmNNOGjdKZzDlgoEMN3jQxvbb9w9jIxstZYiwAbNCTCjvrCZ44lNnEDXVyOhVVAwnBbXMq/WeFW7pcmRJEmm5vixMK7gmYXYDg9jkoEERcwiJ9zmfTqct58lmKkkg6931tE2HAJEurEL30s0PAknsCw3mzlJirjYSi2n1sjISdNPL+6Iz1wLwZXP62rUqRRBGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by GV1PR04MB10534.eurprd04.prod.outlook.com (2603:10a6:150:205::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 03:30:54 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0223.012; Mon, 20 Jul 2026
 03:30:54 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 20 Jul 2026 11:34:04 +0800
Subject: [PATCH v2 2/6] media: nxp: imx8-isi: Add stream ID validation for
 crossbar routing
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-isi-v2-2-45845bc5d4fa@oss.nxp.com>
References: <20260720-isi-v2-0-45845bc5d4fa@oss.nxp.com>
In-Reply-To: <20260720-isi-v2-0-45845bc5d4fa@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Christian Hemp <c.hemp@phytec.de>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784518456; l=1771;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=vqoQTW3AsjK+jpRqCt4mKDvBNEmBeSojpmcuZWx9aKE=;
 b=Sn2u/R/9MLJDV8AbSIO/n1fA00pju+yFMzF0qdolEIiaEu1yRMMGoDZ5VUy+NBtYBPuW6mAwb
 0UzYVnXY+MgCQw8C/IY0gBbp5+gpSt76Ksu8TTyKuKwSisHiM6uMrt3
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0029.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::13) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|GV1PR04MB10534:EE_
X-MS-Office365-Filtering-Correlation-Id: ea84e07f-ac7a-4f8c-542a-08dee60f4dc7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|376014|7416014|366016|23010399003|1800799024|921020|22082099003|18002099003|3023799007|6133799003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
 O0wOknKsOXUO6IAnB1AUEYW1ddSA3D08vROSc58SkxMNJgcTLmaMgsNMDXGRQmPhZqTySJqZQ8F+YeEyi7C/RMTUvqv3WgNl2Q5eGNhGOZe116aGe4YOLHdAhYmQYaQTYBrxUR9tAhn9jjnf+q8dsfOwOs6lILFveUDoIcV9JOgl2PWg4sEZjyng/mlSsWPHlULjZsQafCBS9bRJh9y7XLIQNhx9XXyzsgI+TrvbW54L1jIvn4GEo5I0u2fqQG9Q6hHTx6L61+nMi9sty84HyTD1RTHYF1A3nueQ8rYJmonpbS3M3yrOc0448KrtO3cZdW7+iIzHrh65VXEB1lwnAYwkk2vRqRLlpvjPo19gSkC5CHtiFsg3gaodluI/9K5qlGx/SjPSaXFtWou9m3IGhvlMN/6pOIFj9+du0xqBSX6FTkW+TW9fTImyf8a/w3xQOzdqLn3nJJFo2GQIyasJIrijAl8hFtciMtKGkupe+uAq1VsQfHJXNSDhqJ+YqnwLpS0GGRWh59Z/BAFWD+nwyhR5TxSLY7TY18puXOSuBgimwYL0O2apB/ij0Er1bAJ25pefHlNpsique+Z9N3jQ8oWApzVEyd8QKKSz2a+AEsw+mLmCQxU6VOaGXpvBDHuqQA+eb6sfGJ1dxysbKfd6zqfvSr9bliIA+RZ/nY4xWoyPYJVM1SwEVDZsr1kjzU837cyeEZCJZgr5za9nFDAf8Q==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(366016)(23010399003)(1800799024)(921020)(22082099003)(18002099003)(3023799007)(6133799003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?THdNK3E3Q0pDL2Y4dzZlSmVmd2wxWWJqclJMVUFWVlRpU3ZySHkwSTRQbHk4?=
 =?utf-8?B?YS81STVlcDhLQUl3enNYd0VNVjMrVkx2aHcwQi9HK0dZSVRkWSt2ZkdvZkN6?=
 =?utf-8?B?WVc1bWlTT25DVEJiVFRaN0RwdGdTMm5vQnpXRGRuMDE0bmdPdGE1cFBkU2RD?=
 =?utf-8?B?Y1AxZkdwSnFVS3lTb251Y1pWa3ZvRHovY24xcXJBeVlQWmcvbkROTmxsNDBK?=
 =?utf-8?B?Sy9BV2FNclBvTTNDQ3dzWEIzV09iTWVEdHh4MkxiZTh2QWhqa0tpYVV0Uk9S?=
 =?utf-8?B?RTk0dFAzaTYvcE1jK2JuWUJmSE9LNW51K0lVandtZ1MxckxueFpITi9rRkpY?=
 =?utf-8?B?NVpJdnBZTmg1Vm8yQ3FRRWZMaUNCd3FlZ2gyWGlQa0JTN0NFTThFdHMvTTdF?=
 =?utf-8?B?LzhyTXJGbUtMOVZBcjloRng1RDBFMWZZalZqMHlsbW91RmNrQnMvTVBYS0Rl?=
 =?utf-8?B?elZ4VXJOQUtON0tRV3J6eEFCQzdIekF2YmExZDk3L09pSGlSUW50U2REMFpt?=
 =?utf-8?B?WnVFUU1UU3IwQm5MUHdKc1U4QWlDcVFFTUx0bHRUOHFsMEQ1ODQ0dytWbWVt?=
 =?utf-8?B?K1V3TzRocHN1R1dxQ2pPam9ZV3BpQW5qZy9IcmlTMkZxOGNFUTd0Ynkvb0tC?=
 =?utf-8?B?QmRLUEhWbG1pYlJZN3BFNmRnZDdVVm4waEcxTDB0SHdhVUxsSGVoQW9DRGtD?=
 =?utf-8?B?bnJSK0RqKy9HbnQvRDdUcTJRSU5sY0RITkZMNXRDT0o0TnBxNHZQd3VTWjc4?=
 =?utf-8?B?ZjJpUVcvOW9HajRVV1hNVGE4T0pXY1JFSDJOWlRKTkJ4M0sxQzUvVmlwb05F?=
 =?utf-8?B?N3UrM2M4RlJwcGhUY0NPK3pPYnFmb3d0anF3T2s2RGtFVTV5QThvblFrKzRZ?=
 =?utf-8?B?MWUxUGp6ZG9EVmZ1WFoveWI5VVFGVDU4L04ybDliLzVJbHo5K05RQW83bjBS?=
 =?utf-8?B?TnJYZmFhZ1d0NFc1RHNYRWNYaEN2c0MwK0FydC80TE4rb2tSOEl1K09YNDBY?=
 =?utf-8?B?MTlxMnJQNTNId3V5S1NPbTVzVnZvcU8vVDlIYjNRMktGNCtRcnltRlRySWsw?=
 =?utf-8?B?am5EL3BQUUJTN3pETGRkcVMrY0M1V3p1cDh1ZERmNTI2RUt1Skgvd204VzVn?=
 =?utf-8?B?Q0JvVW5iamMwbWpFZXFXTThvVm9pM0N0U1ZrRTl0L21uTlBTblRFSkNnZmIv?=
 =?utf-8?B?STZSSFg5RUhKTFJqd0t4SzBmOUVsRVhrZ3ZiRURmT3BxV1BIT1prOWJ6bFBF?=
 =?utf-8?B?Y2VJWjdid0ZIaHhOV3I2VnFTaWVxOXdrRXp3NVpheWRicW9VbC9jR1RkenNJ?=
 =?utf-8?B?OXloa3UvVjg0eEh5aFJzQnBYamJST3l6bW1NbUJteis5bW5LVko5aCs5ajRX?=
 =?utf-8?B?bWgxQ01TSzFaUmE2bnp0MXRhRUllQXhQRWpuVGtGRC9Zclo2YnRoM2o3dE8w?=
 =?utf-8?B?RmhCbmhrcmltUGYzeUw0TTZ0NnpRNS91ZGpyczhQSFVXZ096ZzdJZXZsV24x?=
 =?utf-8?B?aFBXdUVGbk1ydmNITmZXQmJ5bHEyNU5jdFBaaUZIMVFNNUVkUnR2Y0hCZFBq?=
 =?utf-8?B?dVV5eGl0MzBwQkw2TWtqSS84bWNrN2R1ZXMyN1dyZmF6a3hreEh4cjFtc2pE?=
 =?utf-8?B?ampqcjFNNlE2akxVK3lZR1BOUStlaDhSbnlXRThseTd4ak1KQkEwM1FrR1hW?=
 =?utf-8?B?M0lYdTNKK2dmemlFdXFXNWFBVzRVeVgwZXhJQTV1Q0xqeXVnZ1NVWFVaUEMx?=
 =?utf-8?B?UENuL3l2TFhkS25uSkw5cTNCT1dkQjYrZDB1cmlKY0FtUkpmZnlUS3pCZWo2?=
 =?utf-8?B?aUxhdk5lM2hPODdPV2phVEZ6Q3hLN01FUVhKK0Z2SHpia21OaUdVZ1pkTjA4?=
 =?utf-8?B?akdPRnBZdU0rRmpFSjlEYTE5Nlc5K1EyTlBLUjlldzNUSGo0aFFMakZETHdj?=
 =?utf-8?B?d3lYdkl2bnhwL213K0pTdit1bGhrOEtTRll0dEh2UGlJSEhmNTdWalVMT0tT?=
 =?utf-8?B?MldYUTVadGU3M1Q3dDFqVm5ieVI0Nkd4SS96TnEwUUkvbUcrVy9pWWFxZEpv?=
 =?utf-8?B?WGtGTENjam9TZE42UkdQcjluL0ZFNkZZSzYyRmhaaFI2cFdJbWtGQkN3b3J4?=
 =?utf-8?B?QXBKY0FqcXNva0NFMkFMWGJYbjdHME80VDhXK0dJMmxXT09rUjdYcTlTcyty?=
 =?utf-8?B?RnhxaEFWK2lWdDdYL08rQ0s0T0hVSHlDdjZRRzYzNk1SMzdaUGdtNGJab1BU?=
 =?utf-8?B?Vi9KNFQvSDBIS3hYMWNmMm5SdlVjWmt4NnpRYWFIcFJyTXdHdEZVb1lCU3Uz?=
 =?utf-8?B?RWw1QW1TZHNGblpab0hFRWNrR2JoVjNwVzVUa3NpZVF5OVdDMGJGL1FvQjJp?=
 =?utf-8?Q?4bMmsdhDj0f88wQ9/dnpCRc9n0/LK8rK8kEU/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea84e07f-ac7a-4f8c-542a-08dee60f4dc7
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 03:30:53.9644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ArgDeXSB8cnlFzGwltvHNQZIP50NSu0pCSp6ZjJx8jIrOJdsO+J4s3cEEZCXHeJUWcyqIwW7IDq0d0Sda18A6P0gnblj/CvKzVKz6CEoxCtB3ipo8JHFuDx1qln2jDIc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10534

Add validation to enforce hardware constraints that were previously
missing in the crossbar routing configuration:

- SOURCE stream must be 0 (ISI pipes are hardcoded to stream 0)

This check complements the existing memory input validation and ensures
that all routing configurations respect hardware limitations.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v2:
- New patch split from v1 1/5: adds stream ID validation on top of
  for_each_active_route() fix (Frank Li)
- Remove incorrect sink_stream validation
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 84871bceb31d..328d08a278ea 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -106,8 +106,20 @@ static int __mxc_isi_crossbar_set_routing(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;
 
-	/* The memory input can be routed to the first pipeline only. */
+	/*
+	 * Validate routes against hardware constraints:
+	 * - SOURCE stream must be 0 (pipes are hardcoded to stream 0)
+	 * - Memory input can only route to the first pipeline
+	 */
 	for_each_active_route(routing, route) {
+		if (route->source_stream != 0) {
+			dev_dbg(xbar->isi->dev,
+				"route to pipe %u must use source_stream=0, got %u\n",
+				route->source_pad - xbar->num_sinks,
+				route->source_stream);
+			return -ENXIO;
+		}
+
 		if (route->sink_pad == xbar->num_sinks - 1 &&
 		    route->source_pad != xbar->num_sinks) {
 			dev_dbg(xbar->isi->dev,

-- 
2.34.1

