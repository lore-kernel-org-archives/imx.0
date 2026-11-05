Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793898333;
	b=rjFZTU2yTQT/TioFopfqs9ZsNLVtjRkuna9ciPn74NKNc9mY8qRc1/7PxgSC2wxl1jC+
	 I5tbAQbpdkM75FrXqDksRaqTZT6yQvacpYnSSwyMzSbrlmJDO5Akrm2jCnAmuFJGm1IDh
	 1JOSBJWxAt+D20xorIA9fmCiWTAmDi9aW5TWu4QbvewsnTV1fbYGLGhSNoV9jCB9QKiji
	 8l4TpRP57tHfOXexzmAZNapHVoz3UhALJZvjGfuL+PH/fhx65fKPGaYhryUpoMllWgnE9
	 pschYDd0oSe2wGG2Tt6xCSkmZUh5NkuiM6cOJQoJoxJ3ceOhvnZ7ied+ePWI4nR8vKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898333;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=7yrBZqbYLUu2BOzx3LZCiSeK+QMVMtovqNSkK6b5pRg=;
	b=VN3k6BCb/bt1M3KLZcnqpEWiFjb+kmP3/E/9mic3kh5JZ5TblVoVfHA1j7LwZKADB6gr
	 BKixeCTGPj9000E6bvzNmn364n3NOVkk3KaM8cLW8CSqA6gTOUrKz0lV3T0pXse00a4gO
	 DAqqeRvq4Vk+jO4XnGdZwNAAqWqnlZa/MrHqaLAMnhBOzqPZ/9TUkB3MVc91NzmfMvDex
	 BGxU+QzSA82jpkefTEvXItT5+Oo9EbVvpY3IhKthJ70kbAYqaYSQTq/O4lKmyu1BGM8nj
	 FNRqIOl+5uAn2pTgXixQnKWJXuo8Yur4Yr2Rdn1O+MFafOgW1Z6t5gXzzHbNEM9MOYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vdJc4s7j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.11
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013011.outbound.protection.outlook.com [40.107.159.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220BA606A332
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 17:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 220BA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vdJc4s7j
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmiKerjo1lZEzguBQVj6fzndim0+7vfpMYT5GJVhEk+dDSvJCl/5JeEHPT+iJuySRaGRYrH3n9DrQP4W3u4pSxIhaUTwszawt/07oCd53Abf+mUa7v9U0dLcASnWyYQlLXlYNmNJOwpRayBcAqLfy11+NRZfztomDLYCxQTdGecKl7z+qtpNl+7KXD/94DrSssPMYOsgbJFAhkq/cYH1L5WnLfg0CN7L/OteA5Cf86hBE0w3jwqQorg+utqxh5IG33R1J3xH25H9iNJz1XzpGdXQwdfVgD7um/lYcH1m+qV6IQ/SJZluaqJNRgUtD3nHXbxdTRmrtyALi2TvrmxN3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yrBZqbYLUu2BOzx3LZCiSeK+QMVMtovqNSkK6b5pRg=;
 b=O/f1IU/YFmm6kBJFLqJvMp83yHJDhwyYNwZJoiaOmo4trB72YzvfIJgF7mdGnUXAfx3vY8r5ACWe1MMqv86PERj+TKqZ8lcbtpDYxhsGMc7ql9h+EvfmhiDVmvtc5TJ/87tOd/OwI6+FhShj2t6E1ZhaU/jXCd6izo+myjYKV2IXGLeQTVEDRInOim+5zcdHaBT3pkCFEkCIaHzHeMgKAqipaYSHU35ZvOHli1mPrR+O0+HOu80e5TznDNuSASSuosgpI+AYjWSlk+ySknwFNK9U1HWMA12Q/aWbqxuC+ndSxoqZslILPiV5ZVEKknEzowuDR6UpYAGpoC4YIxcbCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yrBZqbYLUu2BOzx3LZCiSeK+QMVMtovqNSkK6b5pRg=;
 b=vdJc4s7j80WsE6td303hTxFb0knr6hofecjbZvMm9S54NUHvm48oGobuxqtZfdpAn1Il64Mx5pA96i1M57gNMw9eotdfCRVwmoaVHHHjFBXEc5NYNznAvKVOyKfwNvsJaaEQg6rB8geoT3l9lWdXOUMSMMJqViP7cG/r4SF4vjlZRJZnSnAfAduAHMmVjZA6Kbh8J6pj4NtNTJU2OiuYft/D3HYwBBDKHWjJdA0gHyxjpKWExaj0K80Vyw33LP8IpqpCNqdHpNIkmeFvYNXhfBrba5Uvg7ZN0cKSHim0HDcCLpvj3b1Zpla4hg3PNpbIEjU/w/+DmDm4w+tCYBsOSw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MA8PR04MB391102.eurprd04.prod.outlook.com (2603:10a6:250:7c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 17:05:30 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 17:05:29 +0000
From: Frank.Li@oss.nxp.com
To: Matt Porter <mporter@kernel.crashing.org>,
	Alexandre Bounine <alex.bou9@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	vkoul@kernel.org
Subject: [PATCH 1/1] rapidio/tsi721: include dmaengine private header
Date: Thu,  5 Nov 2026 12:05:08 -0500
Message-ID: <20261105170511.1262005-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH3PEPF000040A8.namprd05.prod.outlook.com
 (2603:10b6:518:1::4a) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MA8PR04MB391102:EE_
X-MS-Office365-Filtering-Correlation-Id: 3221788a-825a-4147-ca4f-08df3b5efe9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|19092799006|261022105027099003|261028144727099003|11063799006|56012099006|261021123027099003|261009221227099003|261009223027099003|261021121427099003|261102123227099003|261026140227099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	8IQdyVBGpW2HaouicolPa02MBRz9+CADOL3WVorbBNhhF28+lyjeJZPPJsxkNcZ1yAMQqLQavlPbqy4mELJcVK5dLB2qTORn5LhrKQn8/3g+Fb7tX0U5zcrlIM6XU1I7wbWHiBHPu7S60MKaBnQDfAQH5nmB78mdJFJVYaarhMnIDLwgi5hw4Xi3KZBmYTtlZd8MYMoKjO8AZK5TP8VZRU4WXG06oi3uXeopjOAA7JDDAdiGIVqKXhywvga0M6w4IsNazZYKmI0ggGApXz+xVGdFfybfRd/fYMyYqHQZ4Top0figQ1PM1HTABqdWjeoLJsyAZ9Fh3cyroxqJMTeijlycTqFcEXagCv8rCzGyIpP5EwSGORXpp3RxdmTUIEcCutl4Qo4RTPzLGo1f3044NP94CakNKPXlojhaDSxtwVo1WAEjbvspemc3R/D2COIXTvqKYx+h95ofR86OZ3EVNoermZPXTOFVlpZeYGY+z/N7OsUCwVgfkichzgCSDF2pHlFxPIuoWhxKtcotWwx91rIBMTcD426Op2e97qXW0dYp9i5OPRAxs10HxxEbgQ4NTJEdSLY2mBzKAlcDyDzeoGplYrZOl4to5zB6E07tae9zyMUh1VRBtLeMoGnZ3bWrU8mwnSB9NAKM99kFX7PnRm8o8eyig3PFk3IPqIkuZ+E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(19092799006)(261022105027099003)(261028144727099003)(11063799006)(56012099006)(261021123027099003)(261009221227099003)(261009223027099003)(261021121427099003)(261102123227099003)(261026140227099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OA/bPvsRJQVJXqDpfo/kaB4lemOxt51WXtvdLUblhOB99k+iE2ztSv5A51PI?=
 =?us-ascii?Q?q7GaUyAr47cRXc8YthpORxXvw+2KOOLuF33zlNVFPxYqq3JGM9PnJyknxS9i?=
 =?us-ascii?Q?hNAjODtNIHYU9h3Ogsd8RZmlmOhQSYiILfuUYwzo7kRTCeXwIXcoeYsDaZBT?=
 =?us-ascii?Q?78v+JkaIInhftNS0J1rwIKmceo05FMKAJEF0u6PUeM25Cqdi1pDaDJE80XUW?=
 =?us-ascii?Q?EPYB6Kk0d+zJ6uN62eH4Jxd1mIx90MOz4Qlde5IzbF1nE8Piv2/p9ss2UmsW?=
 =?us-ascii?Q?yDqsOUrZ8xJyfvSU+YvLN48gky+pNq+HtyKGkSYGqbyCwR6s8gwHf2HQji7R?=
 =?us-ascii?Q?YfFBI0jopaIjAcqIppdwe/h5Mvub5elJXiX1fOx6x/x/8H+xzcDsrg9ClDuV?=
 =?us-ascii?Q?PBCohaem21xZj7GECDB9B6A8iJqA5qzpOSgsSa244fID9qwCrt3eB7lCOihl?=
 =?us-ascii?Q?ZVSPJvqkIyN3WTIyELs7q7/XzV3Kjeuq1d0n/NlaqDPP/8J/tQvRvOlro+hx?=
 =?us-ascii?Q?2nweSBRVm/nTRTQHeBH5BcklABL6mLpg+IbcWwN57azLYoAS2UYZeF/AkfNA?=
 =?us-ascii?Q?skwiS5gam9BQ6J8s6DsVN8NSBnrn1CbSNq0HoB8erKag3lU+CmE+ILqMGXV3?=
 =?us-ascii?Q?dypa9/jFpuFkxuPOxqACqXBdGI9ji8DbPcDVlBpA7ttm85UWzpa0Nj/kt73V?=
 =?us-ascii?Q?fAP758DAclbTCcYrtO00OZnoxw3j6+HFJkiU+cnCTMz0emG0JpEO/psUPTqN?=
 =?us-ascii?Q?8L1n8oX44J7nFnPckCcGGXmU4mD8mLwPjanzmb1e1G117I8q6Eaf8CiHU7f+?=
 =?us-ascii?Q?j6NQdhC3SzYToLkQYQMW1XNM5ztbTxaGskvWrYJ4VdnuMG6JIZSpkbvMvfL0?=
 =?us-ascii?Q?t35pkF5PG8ldURu2obbJRXCDDR+FsxMFhiLm3pnV8VCTkjCrv98gPUDS3Ypo?=
 =?us-ascii?Q?HUFMhTHZOluOtIz4aAZxt2q14Kvm3ZPaAVhxQaJQ5/NnQd7mhxaqvMi0mpFu?=
 =?us-ascii?Q?7qNS5phjo4jzbJBNNo6jKWXjZupOmZGdgJOBP6YUGepDpynT5t1H5Reuv2wo?=
 =?us-ascii?Q?5mzdKOwOayZtY93IX6jTMYwCtfI7lljNK7wj8l/B1C6P4zMG7BqDkTmA/KB5?=
 =?us-ascii?Q?2IAFnqEC8zFyiDGx5D+3DRnnUTVMTv7JOMY+Gtj/P/OG5X8Xj7QZwyRhNW2h?=
 =?us-ascii?Q?/ZvAkoODSkluTqqp1j8FP0fSP7OtcR4mZ0XblerHGn8/OZVGRmQTL3Ry3FOl?=
 =?us-ascii?Q?uZ27ne7nIgrJ2O5nqXWR6vu/v+GIcf8yNptqp2pQBGiY7Ee+jIOlSj+rsky9?=
 =?us-ascii?Q?2Od9EcKVuCN3x2y7wapDrj6T0KCqhNZ0wQRD4w3ARuji9S2eK32TqUog1/EK?=
 =?us-ascii?Q?TH084YH10/wXHCU+JdtIoYRiv9VjC9kNoN1/hAQiu+Mckf+UD6IZR+7tMek4?=
 =?us-ascii?Q?p48pMofyI2KDsfpjld35tZNHwmyIhzZK8BCcvtI9cISYlFIjidQip8I6qapp?=
 =?us-ascii?Q?LUlUT9/cnzYNU8OoT/d7Dp5crqvlt43a2zfFYkDrytdy73SpGEwU/DeNQGml?=
 =?us-ascii?Q?JaaA8C25bvqSkUt7cfTQdq7lcKr4lBefzbWXDFrHWqN40gvoSpRoJvocIH40?=
 =?us-ascii?Q?3oKJ/Wcb2HOBPqXZH83zcXbVudUFxRoEEdfwm+dHEF0p1DMZ0L5YT10fda9v?=
 =?us-ascii?Q?g528MH+AdtIVpvoHAQJYm6WyPlQNO+Yf5GC/JFwYg8r+4JdtCLqYLbjLfzNy?=
 =?us-ascii?Q?QoxFnTJLWCJU8GJ+ySPoODoCBOpeDwmpbmcwNEDzRLrTpkVnkAS9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3221788a-825a-4147-ca4f-08df3b5efe9c
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 17:05:29.5430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PO/Vx1QNxVKUrijWRKdQ4r1oJzLrlUSeoMvPtaZVkgfgI8UweYmVMhXTCEHivfFHUeEq9FMzqzaDqLPUn41D6iewXHqisNBOyPeCU2YO9HEZxiORB36jv8tDzktOi772
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA8PR04MB391102

From: Frank Li <Frank.Li@nxp.com>

tsi721 is a DMA engine provider and already includes the provider API
header through tsi721_dma.c. However, it also accesses internal DMA
engine data structures that are declared in dmaengine.h.

Include the DMA engine private header directly, matching the existing
usage in tsi721_dma.c.

No functional change intended. Prepare to make struct dma_device private to
the DMA engine provider.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/rapidio/devices/tsi721.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rapidio/devices/tsi721.c b/drivers/rapidio/devices/tsi721.c
index 71b87bf8c31d8..0953a39459584 100644
--- a/drivers/rapidio/devices/tsi721.c
+++ b/drivers/rapidio/devices/tsi721.c
@@ -21,6 +21,7 @@
 #include <linux/kfifo.h>
 #include <linux/delay.h>
 
+#include "../../dma/dmaengine.h"
 #include "tsi721.h"
 
 #ifdef DEBUG
-- 
2.43.0

