Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011067.outbound.protection.outlook.com [52.101.70.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8834E535F
	for <imx@lists.linux.dev>; Mon, 21 Sep 2026 21:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790025047; cv=fail; b=ssfH89o5VrjtiSQtn1wPfH7gGNJHgH3ZB8vQN9R+mqfCOkNjcu+TMyqNZmLc2nUOrgg5s5Xi3K7vr7pjnoZtJtj6DM7LDCRfnBqFxg0V8Vr0dTQ6GHRGgiTZxmdN1hywKI1gIH5hR3a63J00wtItp+CHJcTgW0iYtGgDyXWXRB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790025047; c=relaxed/simple;
	bh=1hPQ5xLpA6gj27onwNbGciuRGJlVReBKkV+hRVwsI5U=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=orvcWKadR1fvzP3Y3oImqH7WDH6awz+CAIhcOd3qi1PMNPITHIKweey2wKho3MNX56ZxuQQEjq9OyksrXGCeGCVAYcGVxsyE/cL6u6QfT0EqXTblr2sEcTsPjwL2G3tlE1PMtimrq0YmjHQneYknbfDsAqpBInhjzz8bmfVaecM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cy0CCimI; arc=fail smtp.client-ip=52.101.70.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cy0CCimI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVJKzmzkBw1hHV9jSX2EGYY5d9/i/gpCulGDQZEBTbyqiebE4j/QIAvq5OvQnBvZP9jBaYkVg8Yzrd3OYLGxYKwtyBWpeknjvlkRRUkY81q7dzNK/3D76t0NbpsbQ0sFTDjQhdhNLpnLkq4+wEczQIMMAxyt52rMdwwvsInw8VkNwH5uFcdli2G2rkKSrYKS7w4XcywhmeU71iLEOw0LEBtG07L7nd7En4EAdw/G1FClZUwM3QpRVPdOdScZAwkfSFNWauKJbdgr7eEuV4fhLkV5yltW3i0M37XBeSPJIW1/efSIf1P2CcwIFwWTxzftTMqZrvRE1CfZuOJQOOkzVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvoEs2MQG2E2YKFgVwcyiinBBUMNmnsDVSa034/6kXA=;
 b=nQWJ6ZkX1phvG2++5l12XLOVJxdRNmUhDUBWSZ0vXegZkZgwz0nsi43iD2GiJV4sdhP4JqNNAzRLu4+cVixuij8YyjdEwq50rMhIUNQjunEZGXULANzE3l5VCQ6mPYg4jjPEQdyzSSfkjxnmTYOsK8oDAlkulnbovMK1dTrHTIRLq9RCdIXOfcg9efesWLSdSjYlRRRbSQivSE9qv9dfNtVpIPCHOxNshQxIme287KDUd/tpKLZADi2HQP3U6y2s2ct8tnZuwMSqidAjXdp1aw9KxQvyR1YO1lXpsEcPng7UcMm7jI3jZWHzfO+6EgIGaadJp2evzRRE/iiwOLcliA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvoEs2MQG2E2YKFgVwcyiinBBUMNmnsDVSa034/6kXA=;
 b=cy0CCimIH3Kh/3Oz4JpboUIdMiRkcbdcojXKmnMvyt8nPtEIegHtTc0D7KQDCaFvHQdSKs0TvTIRCfj5akdHVLEe3AD6DY6SETjUe+gGF9LaH4KGtY2IFaLFzf3CMz2NgcTnRtpzTikZ/CvMYApYGvS5UFbVPxmrnfOqHeKb0m8v+TN9iUEBOAmxL87ebCCoeANIOoBjubnLlakXmiiIi5epDcPMsKgQJV0Iks6JFRn+/RyIAakFGGYHWPar+q8H55RZk/DX5Sj6XKYnRf1fS+jQ/W2X2WPOgXwF1MwQCKkphnd+KMiVruTjOrtTq7fSACeMV+onMAIVNyL2/2mzxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10218.eurprd04.prod.outlook.com (2603:10a6:800:22b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 21:10:41 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 21:10:41 +0000
From: Frank.Li@oss.nxp.com
To: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Frank.Li@oss.nxp.com,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev
Subject: [GIT PULL FOR v7.4] i.MX NXP stage driver for changes
Date: Mon, 21 Sep 2026 17:10:29 -0400
Message-ID: <20260921211031.1408910-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR20CA0018.namprd20.prod.outlook.com
 (2603:10b6:510:23c::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10218:EE_
X-MS-Office365-Filtering-Correlation-Id: 16f4bc17-804a-49c1-a068-08df1824cadd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|23010399003|1800799024|366016|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	z+bOtBtUCg/m4u8FDcmUwnqM0AooLWN3pvRBQO7e0OYQZ/Y6q1pfjPjDqQiVMatZNQ+aDZqC6kR2YGkapm1y3VgjSaeOwffZWRO4pwZ7bPNr81rq09MI6j97SKh1fw+szvzDLyRX80/rokTw4Tg03VCdI7LvF7xl0x6TjGcKA/E4tzVntC5p0wPJLbx7Cm2H6IuLXorZDDD35KQsssbccipFh2Iy10/2za1XYR/wQKl8e1EEYxpEfCXpVarZAbtiyEJY56H28oUNKwLCzio+MjVFk0lBF93xPgj5GOwdmg2RSOeyrWkDjlLB/FitKg59VMB90V7IgvNajy7BttwHV8A5CGyJDAbafKks50Mc+IH+VZ70jbefay3mLLiTPtcDc/rrXp5G9nsjeox34W45ejH1/+BzHPVYc++yKx/gcLgHpXe8W2eIhpixyDq57GBTwyxLIiA3Z1z1kkEqjSrKKmtlYa+1azWxnd4egZQ2v6rUxWZNNmwOoCAUYzZ6+iXjFRVOK/PIdkH9rGXHxEVl85I41RcuFkoUXyrzdN++ef0hA9V5t9ttmUGXJc4fWrqdpH6ZiUstoOm5mFYj1HSAA8JggAz86/YxmPA8XdQfFw2fuNhxG7PxspOkUoHqdvWx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(23010399003)(1800799024)(366016)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3gWHmBr3NSjAkV7Pwebqf3j7MjZI45oCe4s0HW7EHeYO4+/OwO+KdVR1djAa?=
 =?us-ascii?Q?fCA7vbNuWmevLJkKUfdFRzFJQpXmaxJjDs+y2bP5U6NHA/TYJvwZ/b84KKgy?=
 =?us-ascii?Q?vhwaOFyImchEH0XNfgmMbylw/o1Bt94vQsgm5eW0K4hAnz9MfLQgSDc6Zsm6?=
 =?us-ascii?Q?QpfDwu1z6pwdCdk0bqTkskNWvMT8sImaW0rHF6oh/SIJmkGEdcq2zytkA0IZ?=
 =?us-ascii?Q?v0qXnxDrnEGwyr0pVjHIl24glawsM0zGESX67eSs7a3M/RvjVvrbSGKHQWNT?=
 =?us-ascii?Q?QFOmNaXq/SP0AyDyemY2Rxs22EyuUQXWc65QaKrUR8lMsLtcSIVmts5/XkYY?=
 =?us-ascii?Q?9bdjHex58SWLcDDDKdmLo7c2zmmKhRhP2jk4BuoCVWKJRzevVFPQ+8Mh7WEo?=
 =?us-ascii?Q?RFf5ZkxxJ/niRpamUPJOlZmyBsg6i8ko8a12pFJfphkgm3Iv1fYnrb/P3qdU?=
 =?us-ascii?Q?X2jrGQ2+UjIPAGh/uPilKvBShOz8itDxSd6UKcUpTnEkvf9NsV0c+4Oeu+Qd?=
 =?us-ascii?Q?yoviSmhFW+Nf6JTPM1kDIDviueWdKSRdn5OJRT+NYDo4EqSxCShjFm9RLqFm?=
 =?us-ascii?Q?dCXLgb9DjiSt+ICKZuv2tEDIs1bx1qsyN7vkp6suivCpGrahU63ukwaNEOD+?=
 =?us-ascii?Q?XpN3xD/oojDqyB6fw2ESHgJfrby6bh3D6q5yZmJDYA/Zmdca9afNLmtT3ndC?=
 =?us-ascii?Q?6stJb2S/QS8xtWFjiZhXlWkMARulhAfD6IOSUCsslL5Xki4T/lGxrun0cqwn?=
 =?us-ascii?Q?DRINJKOC8QeYWEKMMm2K474hQWvoW7btxSfrk7haHm4Rd6jfWX7cW7FPwN8R?=
 =?us-ascii?Q?xE3Tk29jPE4CmY0HjGgVfR+XntpiPIcEXCTCUITMLagd/52/fygNslMncXRG?=
 =?us-ascii?Q?CFFmrnRMAuk0797wKe5mm5iKzwKiPkxbSFmkICTpL/7Iz4bdYKhozA7RxxOp?=
 =?us-ascii?Q?WWltDzxlIbWU8qAyUisNrcWWoJSUy75EYZSPgN6NGvVtMVGrZL64xYe/gU75?=
 =?us-ascii?Q?OTCwcOb9JCAh4Bxr9OH78vh3gO/3mPW+/fc3+kwye3urHyRDynMH/27xXlYH?=
 =?us-ascii?Q?00AwbByMzFhq5eFRe184fVVmA6U5rGEZScn5/qOATo10qzlWN/aVg/15Vndi?=
 =?us-ascii?Q?21ggkuK/KqDCMIKFLn8JXil22uA+wOl4UCVnJkqvleaTAXmAynOMHXs0MpX+?=
 =?us-ascii?Q?7iboCVx2NA5gaa0S+Dh/aseJHM6aYZOw+KiKBgu2H2Hw3Lxj7HsHvUGtyc0G?=
 =?us-ascii?Q?Q0sB2t5KLhnM2z8/0uN1A6UHLOpD1isF9QNZEMWWb2Dl6EnRwGzRS/cddJ7j?=
 =?us-ascii?Q?l+gSIHUOp9VykeDkAAKXYxzUmR7pDWxXxBE6SdqWbbe6MalpMBQJYscoSv+W?=
 =?us-ascii?Q?gT6m99lxY9FZ7iGz3pYAJr6Jm2wwrRdC84WTIe2JMgibO6b60lgDKyxI2ahk?=
 =?us-ascii?Q?cnXhYq4SMa508nPO8U6KU9+GGqur0Hz6dFHJnePfGLel8eMX4kUZvnBODmqJ?=
 =?us-ascii?Q?r6Z7dL+Q8vFkB+GW7jj1QkDpCMucJHtYiNvWAvL2K1OTJFOcbe59Ly5+XvLG?=
 =?us-ascii?Q?A1vWLEldrs9flTqcaivhnO2m5x7nqqNi74MpG6ODArTZd/t7fZq1RFYEsKf5?=
 =?us-ascii?Q?YzMMHkQM5WRxoTkgaIY/d9S1qmfVcKmf5F7MXO3YoPzv2VIqc58+sG2KeHDx?=
 =?us-ascii?Q?oQ71JHlN9TrcAx6nWUSU5CLyM7pLSoNJ1cCeANOOYOGdMeMCZX92kd6jVtML?=
 =?us-ascii?Q?pOPuYj0EACFYWtFwiTl5WrSsRY4z3Yfl6hLd3OZMBl5og3gur3k3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f4bc17-804a-49c1-a068-08df1824cadd
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 21:10:41.3403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CbF/FHm98IQ999bCBj9CeSLgii2B/BsHVx1xh8MjEKimjsFiU9cpPQG/GeE9zudcraNHiGxps8A/EPMiImLi4Vy728MctLKHnSNQtgkjr0pyLBo93/VS72LhD4Ii7IAN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10218

The following changes since commit aedd77ea8168f00687c1248cdf115071e869cf93:

  media: qcom: camss: use fwnode_graph_for_each_endpoint_scoped() to simplify code (2026-09-17 22:58:08 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/frankl.git tags/media-stage-nxp-20260921

for you to fetch changes up to d8292d32467c55941f1e515b94b1c5bf119574df:

  staging: media: imx: remove unused header includes (2026-09-21 15:37:20 -0400)

----------------------------------------------------------------
NXP i.MX staging media updates for v7.4

- Fix memory leak in csc-scaler device_run().
- Remove unused header includes.

----------------------------------------------------------------
Cong Nguyen (1):
      staging: media: imx: csc-scaler: fix ipu_image_convert_run leak on queue error

Rajveer Chaudhari (1):
      staging: media: imx: remove unused header includes

 drivers/staging/media/imx/imx-ic-prp.c           | 1 -
 drivers/staging/media/imx/imx-ic-prpencvf.c      | 3 +--
 drivers/staging/media/imx/imx-media-capture.c    | 1 -
 drivers/staging/media/imx/imx-media-csc-scaler.c | 3 +--
 drivers/staging/media/imx/imx-media-dev.c        | 1 -
 5 files changed, 2 insertions(+), 7 deletions(-)
