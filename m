Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011022.outbound.protection.outlook.com [52.101.65.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55342D7386
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 09:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784797983; cv=fail; b=aI0od6b/TttU76onMOKMFRCBfEAs4G8pSLrPfSCailGzAFl9G0Mh41m3nhPDdnrCeLBkYB8ASfNkxSIhGlLbleXqapCvXzLIJQpHKM3HQlU2krg8RzkEi2Hn0GMBtp5cdfrhU6sKeBz+yMiKKmDrYNGzOiguZ98ACq2tRA5X534=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784797983; c=relaxed/simple;
	bh=EjsagpwydBfLXQ5cq9FrJ8fN6LqLhoYX15UJmDPeH24=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=ELLgW3ce+MImeOULO2Udx+Ewg9va/DC88Qt8JuVmKZyJolWLgGuQbJsU8VXz8piC7S8AVcA0cpup7THjxeWPTrctDqD86coIxiOPqQVPXcsMe61Pgm6WKhRnMB93fUbQWrqb8QUp1TP/0czL8YgzplZyVHyMJws+Uh231tm5inw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mcuGtWMM; arc=fail smtp.client-ip=52.101.65.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mcuGtWMM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ho6PMjhEtPdLCNb3nMCiesQZBeI192r9xwhvrp4BSJTIXcSib3RlEdBLa97tbGw7hJqidjMvl6ABctsfdaC2IXYtuZ1/g6lwjLHTYaMYvCcT4FcmVElFT0+1F/tnHsq3OSU7t0AiOMc8vmoFfz+3ujwElbtUCaLzB9zyQOk9gFOnbiIEID6m45wDMtmwJqPlPZg9XfvLPDdrlOOMoNEExjmKKrdWnhS+Y1r98Mp/gOG8MzpNJE+4xy3WEWzlcvo2oh5YlYLChngZKFSPlUjdH4OAU2oaMoN1M9CeIWamPaJge9NcNHhRYAG0mMP0+dbZHWcwLvRwiAfxPd36aTibFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6WsCFBlYRn1eppH/r0p2GAnXcM6Tcve6Mk4y0UJSa4=;
 b=GHrlf+fv4e9h6DhbFG8L0G/rXpO9GF0OW4DVcsbj+GKUpKM3JX1b7+CsFNUI41ZYT3IzXhXvAw9t0hra+7N/MA4vHAyxo8a/6LDMCCgTlkOn5PdiMSJkWseURRgqaWZB43OrTc+abpCAZTCfGB1r9nSfBpGWmflp/LGbC4X4ShevExpSmN/n8Wl4l4ifwal1WZx9PD4ax7seR/zJMAjJsBka1k6xieULmDG4pm/RKN/bvqPkzx8VvAptgWH38mN+uVAK4FGbUVq95oJBHHY6zemm04/qPNayHTj4Qb2mXmP1wb6/QvetsU+mZ5uGRB4piJBn21348ulQU9rT/rUhAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6WsCFBlYRn1eppH/r0p2GAnXcM6Tcve6Mk4y0UJSa4=;
 b=mcuGtWMM/nW5tjK2hpKfv7otsNqUurcCPUatoe/S+JrwtMGoEAkd+OEPLaQrksdUGwvfxdjHOLB9tt1BoZbX0N0GS9toFHRYetXQmJ0Yhg1YcVxxzFDCfR1DGx+krnYKMzBI9Y0uscSGnj/5kJbeaPW+frwM8sOQCZrsRgWbuYuO/OqJ0rDPKWj7Y76O/Mqv1d1qoIRR9KmqdFH6JBtA2xggxd/gNydcLuafRK7Tm7RZmzeajRAPSuujN6CZQf5iwjkhuz6oQs531m3XJHiOq5Hi4JvRsqI9NbzvATfgwwOEt/C/V6N1QJsLe4IKrD3W7SRdWARta4t+Dc8nbp8GPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by DB9PR04MB8363.eurprd04.prod.outlook.com (2603:10a6:10:24b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Thu, 23 Jul
 2026 09:12:58 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 09:12:58 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v3 0/3] imx8-isi: Format support enhancements
Date: Thu, 23 Jul 2026 17:16:36 +0800
Message-Id: <20260723-isi-v3-0-594919eae847@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPTbYWoC/1WMyw6CMBBFf4XM2pKhtiCu/A/joo+pdCElrWkwh
 H+3YIxxeW7uOQskip4SnKsFImWffBgLHA8VmEGNd2LeFgaOvMWWt6w8GKJDqVEIZXoozymS8/N
 eud4KDz49Q3zt0dxs69fvdz83DJkl0s7qRmOnLyGlepyn2oQHbIXMf1bH8WPxYgl5ElIbaYVT/
 9a6rm9pbmKNzgAAAA==
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
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Robert Chiras <robert.chiras@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784798197; l=3662;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=EjsagpwydBfLXQ5cq9FrJ8fN6LqLhoYX15UJmDPeH24=;
 b=4tA0sUi19A/oWnDOT+R+lZ59nmIJ/U9nSUOqhe4doD3kLFyvsr1f+gAuHyEbMJGAjxI9TFICN
 Nkzod8IF7QsCjrg52Sx0R9OtQ71yp0zW8YStdL/IYEbZ9YdruaQyBDp
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI3PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:295::18) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|DB9PR04MB8363:EE_
X-MS-Office365-Filtering-Correlation-Id: b048d1a6-b2e0-4885-80e6-08dee89a9651
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|23010399003|19092799006|376014|7416014|1800799024|13003099007|921020|18002099003|56012099006|11063799006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
 OAVlRXZhTHySC0dXkXr2jZdj7BeCJrO/DJXPLQkzFoh90KnfQSQzaTyFR4ZXsxCWYkWNVVrSpYZJH5Bzi0tg7aW40F8qFLtZZ2e3vfpIQnlTSCk468O7+eL0HmXhhuqdhUGnBPNCfXl/bsY8fRAhJiOVr7ULt/Xvxj5WjCmEqdgDvr/KMtTSZ7ltUuJNMU5jnm7CESBE5vVf2I850a64gVk4+dhUIlVrCzGeUueSuNwdKdFBzjbfnqCb0iHs95PLjhYBJdap5gSA+Y3YsbxJluS22hQR4BRC8yTS/6EKwvi+hzy61CYI7GEmOe6Om6LnoBvVVQ9NkpvJdAdFwUe3h+S+yIv4jzKcFVJP2gMCNwuLz7KZFyJs7fxYRjUM2nCxl9d+R1ZJO7J7GHjnqELNPYtRuniBUXFALMwTe8y8Eb0l9/k2FQTL9FEBFbJfnzFmsDin3SHjYuGoGIKUhLW5TuIgZdONzF1+SlVSqHKXJCx2Jcy4fReCWr+nG5cwE5674iliqMx6qZIbKId3oRPyKde/E5qpreccf2fBra3rY3pL+93UtRYUn16PsPTBlaJbcYR53xR/KDw+Z7MqApdDe9PfNSwpc/HCD77w7hQjM6axtUWg++2BDiq5I42nxQ/XkmxiyxvYuLvu76lv0xvgeOs2+dG42OVrpvvhXwdSOv696ASJW9LtWhZn5bivqu/G78s82qouyOLPxJQ7JObPwQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(376014)(7416014)(1800799024)(13003099007)(921020)(18002099003)(56012099006)(11063799006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RUhUOWVtZVFzZFhybTZFQit4Ri9MbCszWlVIUTRRak5vZU83U2ZuTmRUMFZY?=
 =?utf-8?B?d3dGRlhRaUZqVGI0YnB3TXZsNFRxZ2tKWlkxR3VqYXJ0Z0w4NkpYTkZYTC9p?=
 =?utf-8?B?bm5JN0FPTDUvZkdHSmsrc2Y0UzkvTTAyVGFNYVRTd216UHhIRXZKeVJaN1hz?=
 =?utf-8?B?U205MzBOenVkYUFOWDN1cExRV3k3bUpWd0FJZmZCTDJlQkEwVnRSNExsT2JZ?=
 =?utf-8?B?T0hrRElsSC9maGRwTVVGQlFBY2w3dUM2Q1ZQMzVmUXZhaS9lWFY0ckVJVUpk?=
 =?utf-8?B?RUZDTEFLa3ZKbS9QS1N6dEsyL2EzMnFEQkxiOXdOTkRJSEdrQnVBN2NtRGtS?=
 =?utf-8?B?b3o2NUpHRDJxSzlzTnZHOEdjOEVaUHcxaXdOaytMY1JTRGl0V2hoN2pnR3Y3?=
 =?utf-8?B?VmZVbHhQOVFUalp1RFhRaW5TM1VFVzcvVk9MbmpSWUV2Y0pWRkFFUDJDWmk4?=
 =?utf-8?B?NGwzUEM2THFGVTl0MTh0S3kyOUxkTkVrV0RoT2MrVitTRDRFaS8rbmtiN1lt?=
 =?utf-8?B?VURyRW1sQk9uSktmeTFwODdrcVpDOThFZDc0YUs4Y05SSWhWYUx5OFR2WWwr?=
 =?utf-8?B?ZDlqcEk4eW5FdnpCY29TbU15TEVTUitSN0Rqc2pRV3o4SzFDZmpsYy9LSXJW?=
 =?utf-8?B?eFJicVRpbTJMWVhNWFFFNlpVK1hvOGhRK0dIak9DYWhCQ2tCS1NXVU5MMjFO?=
 =?utf-8?B?NlAxQUV3VW1yQjcyRU4wcFNNYVdQMW9GY2x1eTVwb0g0R0VMNjgyKy9mNytD?=
 =?utf-8?B?ZGxXQnBENUxlMEUvNWY4K1JTYUUwKy9lbndBN0FNSmNRajFPOGJhdXRmVlpi?=
 =?utf-8?B?aU5wSGdKdDRoQWh6WGVMNDhvVHBYZktHbGZJUFJ5dW5yM3FMUkFhNldpMWZj?=
 =?utf-8?B?aTVaL0J1SE1sQ256Rng0UHpxRWVndGxuUmhqV3lyNjZtTGFGN1JQMm9Zb1RK?=
 =?utf-8?B?enBTTk1UdE4vWktXd1ArSmZzRVB5QXFtK3FUOXl1TlpVNHhJOXlQS2JyKzdR?=
 =?utf-8?B?WHFsQmtPNmM3aUxQcmMzNGlpaEM1bDFab1R0WFVCN0F2alBpRzV4ODNEVGUx?=
 =?utf-8?B?Yy8wNmJkVHNOdWROUEtDajJ4SjFmNGlRQTE1L0VibytVV2hWRmdMc09LYTF4?=
 =?utf-8?B?SGVqMm9UL2lhOUhCM3ZndXhNeEpQZ1NDK2g5QnJ6UDladHFMOXV6dTNiZzI1?=
 =?utf-8?B?VU1RVEtRNnV4QWNzUEVSQTM2WS8rRTNzSHB0TGpTMG1wRmFiNllRZFA0RjhL?=
 =?utf-8?B?UU5BZVZMNmFzVll4blp6Z2hUejlJanpUamtyck9EZWxrVFR3amE2N1Y3RUh5?=
 =?utf-8?B?a2J0NEpYRkdsYml2d2p0S2NRY2hGaVFudHdBN3oreDZRd0ZoSWRqSW50R0to?=
 =?utf-8?B?WTlEb1YrTXFXUzZmeU9UeXZNeG9ZOUZ4L01mRDU1MjlyQU1UMHU2a2NjaFYv?=
 =?utf-8?B?UlBwN09xNmJiYkNxUWhKOTdRWUJ2WEhyNUM1YlZEUWErVGlQenhEalhkVmtF?=
 =?utf-8?B?TDZDWTdNL2l2dFVUeDlvMGpYNjY3cDY0VDlhYkliUlY0MzNkNGdFRk04RGlt?=
 =?utf-8?B?eDdhV2x1NmZuUnpzTnRFRmMrQWU4TTgwSG11SWtsMXltdkxYRTdUVE53K0cv?=
 =?utf-8?B?a25zTExEUi9pWk9MNVROaFpINGtGVVhob1ppTXR1S2VDWkVML0JqOXYvMXBn?=
 =?utf-8?B?R05qRW5XRnIwZFJsZHZVbzd3UnlsRWpoLzE2RU83dE40S2VjMlpkYVBoTTVx?=
 =?utf-8?B?alVVcHg3d29yeG1YVzhZenZueUZJYjNuZUJGVUpjSi9SZndZVi8rb1dkWXlh?=
 =?utf-8?B?bmk5SzlRamxoQUpaNktqMjQ1VVgxRVRuM3g4ZGF5dHg1d2V4dGF6c3M0NWtW?=
 =?utf-8?B?WjY1R0N1SmlwVTZIWU1mZitTOGFBVXArMFNmSGRvamYzcE0wcW5qY09VdDVQ?=
 =?utf-8?B?ckErYnZQc1VvbTE3dldwV3Npa2hxV2NRM2lvVWJKRWQ0R1dIZHhpeW1abUlv?=
 =?utf-8?B?WHVGdmVZS1pmbFhkbHhDUUFNb1JXcHdsYUpqdzBwOFd1L2hXZUpnVHRZWlho?=
 =?utf-8?B?eGZSMCtqUS9GQW5aT3lmY1IzVkwrVjJ3Z2o0czZ1N2FiNXU5NklVOUhXempZ?=
 =?utf-8?B?SkZtUDRGdTdOZnBZRjdvaVQvVmk2NFBTNURZNERuTjg1cW8rdGIyN0c5V2F6?=
 =?utf-8?B?TjdxclhBQlk1cjlzWXYvZk00VndQWlJhVTAvMjlNdVJhQ2hxN1hBcnR3ZFF2?=
 =?utf-8?B?d0ErRFVBdWdlT2tYZzUzYmk3MUpFTlZoSmRrQWdqSGlOV1U1Mk5mbk44TlVh?=
 =?utf-8?B?NGo5UTROZkx3WVpuWTNpWFZ5REZuSy9EYXduRUx4OTRVVTJNTEh1ZkJwRXVU?=
 =?utf-8?Q?MCahZFAmqCoIY7BEWF4Ih8jF2ka1OfGjN6o8x?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b048d1a6-b2e0-4885-80e6-08dee89a9651
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:12:57.9925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: THxJEDTmrcnMIbHtcrFxwHnj5GogfigAtiBOg7Kf2D9Qiehs0QITPX1t+4D7IoFOxBeT5bFh6CHoC4iRGCxUU5St3YPXzSwRA78hmmOzAbNtKmfKcRuQflNkhtLnb9DO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8363

This is a follow-up series to the imx8-isi bug fixes and format support
patches [1]. Patches 1/6, 2/6, and 5/6 from v2 have been merged into the
maintainer's branch (pinchart/for-next/media/nxp). This series contains
the remaining 3 patches rebased on top of the merged changes.

Patch 1 implements per-stream reference counting in the crossbar to properly
enable multiple streams from different virtual channels on the same input pad.

Patch 2 adds support for 16-bit raw Bayer formats (SBGGR16, SGBRG16,
SGRBG16, SRGGB16) and Y16 (16-bit monochrome).

Patch 3 extends RGB format support by adding BGRA32, RGBA32, BGRX32, RGBX32,
and ARGB2101010 formats.

[1] https://lore.kernel.org/r/20260720-isi-v2-0-45845bc5d4fa@oss.nxp.com

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v3:
- Rebased on maintainer's branch which already includes v2 patches 1/6,
  2/6, and 5/6 (stream ID validation fixes and color map correction)
- Series reduced from 6 patches to 3 patches (remaining unmerged patches)
- Patch numbering updated: v2 3/6 -> v3 1/3, v2 4/6 -> v3 2/3, v2 6/6 -> v3 3/3
- [1/3] Change from "Fix" to "Implement" as multi-stream support is for newer
  SoCs not present when the driver was merged (Laurent)
- [1/3] Remove Fixes and Cc: stable tags (Laurent)
- [1/3] Store input/input_stream in mxc_isi_pipe instead of using per-stream
  counters array, avoiding arbitrary 64-entry limit (Laurent)
- [1/3] Use UINT_MAX to mark pipe as inactive to distinguish from valid pad 0
- [2/3] Remove "high-end" from description as RAW16 is common now (Laurent)
- [2/3] Add Y16 (16-bit monochrome) format support (Laurent)
- [2/3] Add Reviewed-by tag from Laurent
- [3/3] Drop M2M_OUT for ABGR32/BGRA32/RGBA32 as ISI ignores alpha bits (Laurent)
- [3/3] Remove Android requirements from commit message as alpha formats
  cannot be used as M2M input (Laurent)
- [3/3] Add Tested-by tag from Laurent Pinchart
- Link to v2: https://lore.kernel.org/r/20260720-isi-v2-0-45845bc5d4fa@oss.nxp.com

Changes in v2:
- [1/6] Split v1 patch 1/5 into two patches: this patch fixes the core
  for_each_active_route() bug, next patch adds additional stream
  validation (Frank Li)
- [2/6] New patch split from v1 1/5: adds stream ID validation on top of
  for_each_active_route() fix (Frank Li)
- [2/6] Remove incorrect sink_stream validation
- [3/6] Use fixed-size array for enabled_count instead of dynamic allocation
- [3/6] Use BIT_ULL() macro for u64 bitmask operations
- [3/6] Use MXC_ISI_MAX_STREAMS (64) as loop boundary instead of num_sources
- [3/6] Remove mxc_isi_stream_counters_alloc/free functions
- [4/6] Add Reviewed-by tag from Frank Li
- [5/6] Reword commit description for clarity (Frank Li)
- [6/6] Add Reviewed-by tag from Frank Li
- Link to v1: https://lore.kernel.org/r/20260629-isi-v1-0-deebfdb1b07b@oss.nxp.com

---
Guoniu Zhou (2):
      media: nxp: imx8-isi: Implement per-stream reference counting for multiplexed streams
      media: nxp: imx8-isi: Add additional 32-bit RGB format support

Laurentiu Palcu (1):
      media: nxp: imx8-isi: Add 16-bit raw Bayer format support

 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  5 +-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      | 66 ++++++++++-----
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 31 +++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 96 ++++++++++++++++++++++
 4 files changed, 178 insertions(+), 20 deletions(-)
---
base-commit: 4d32fbba9d23f50d157ed4a37c9e8fbce61c904a
change-id: 20260626-isi-00f05b044ac9

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>

