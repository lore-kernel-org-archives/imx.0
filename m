Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011013.outbound.protection.outlook.com [52.101.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE545212542
	for <imx@lists.linux.dev>; Thu, 28 May 2026 19:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779995171; cv=fail; b=C3bu1+2r+uh9y0nxKy00MwxG3KNbbrLww4tldlNc8hhuG7FLnvAHHmMYqH59Z5z7lTn6YEbKZxrRJnkqp4yXd7ZfAEYpTmy44lKOgIZEr6nLQ9ZMxX1cxvGz1sVUM4N6Mpdhu64+ZgByB0GJWYbQnWYWo3bpkOkQIwPvoztZv3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779995171; c=relaxed/simple;
	bh=BBma5DXizRNHQbCtahwADWiTWYJ3CTfrLEI9+6t6eLM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=To5ZqMSqeDv8VXHnMrGB8nBiQMYuLY3BriHPjgdW+MaZyl/8f/b2HceBA5If/aF8RMSTTov/Jzkq91U7rwku+hG9pYjAepDwjVWKyX08y3kt/zNrDvcwrxeE2zKaKag2xaDoW3QviDmO+tLZ+rVvmlPxx/ygPWZrFSpjHHoIZVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BptvbMii; arc=fail smtp.client-ip=52.101.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BptvbMii"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kt4QbWSvFmN2TtgRifCf9p1ubDLKHtnB2FnR0srOxyWrNsUhjNDrLq8h/odt5XI7GuuySkedUm0+ZNkx8JxCAqpIYpPygg6XXXbmS5MmH8zS1nO+osLK02dXv8PZxyGDKcoclYuiT6r67P4OkhEpRSb2/YGrooCQm1aCmBBC8bdRJoHj1nAs1/LbMfWn1W96qkKOyRnAkoCKVvV34wpW8xZtvnTFbFhgEGKgIwRgXNhPUHaBypFyxf+sv0HDRqMy95sXBlRVdaZoAs1C834JRF/kBGl7+BmKhRBvyMu56ShnGJCN1LeKMFukpityyggBN5bEtdgKEuX5hxNeh6MZaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1W4iIe4KJT9871AJ+CGVZKyZxy8lmO9TsDISEYQezI=;
 b=FO75eioqf/ukXo89e1BOpj9tSZj+Px2cwziYTSrNR9BDWrGndGC4AAJ+ursE5fY3hVyoDMhYHdnk/d+BFusAbfaRInSU0gR0AqTjvMFAgQx7TutEsyzKiUV/Jn6SnE5wWigxKUxNEMKN72xt4IPvlZ6btVW45SRdxjrieJ6PJEDtOHaxdqy1Fk8MonpTYKr39DvLi+w1eh0eXn5CW1FbC/5izxSW/tSwvMd150yEpTrJ/TMtc4kvxMysRh1xEyNuOn510z+SKVXjfifw123/rP/3B7SZmzyi/UmI41Awe/+MhXvQ5cFyOTlmmOaVr2jYNdJ+wS94+X9vPd3p8qEM5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1W4iIe4KJT9871AJ+CGVZKyZxy8lmO9TsDISEYQezI=;
 b=BptvbMiibOB4noyJMEhbGULEY/iAs00p5B6JN3f31VwYdYPkWFRUVKz0i09eQHtJ0Xhek02xMLNbz16w9/7m1JiwDUQXuu2XBAWy9OMV8hZmyWaCdtA9tgBiY4nnvr69FThpwluqgiy9hlF3o6pG4bx05vCC/A30ST3vjC7KRsjXB3oG9OL+rCuiFyGQ08ZRzXmOtl3e5k/fj4rsMPadQA3rjwEi9tuZJyvtRfCVlQI3ayAJdGgDhNo9FMDZJp6cD7l/BPNt8A36NSY4BwWnKZ2hNxvObzWnbPgZ01eAOCTvSAcGecuAB4pwV5+qTV05g2sVybQagYtQHU0WC7Jx+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB10669.eurprd04.prod.outlook.com (2603:10a6:10:58e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 19:06:05 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 19:06:04 +0000
From: Frank.Li@oss.nxp.com
To: soc@kernel.org,
	arm@kernel.org
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX Soc fixes for v7.1
Date: Thu, 28 May 2026 15:05:50 -0400
Message-ID: <20260528190555.3779280-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0086.namprd04.prod.outlook.com
 (2603:10b6:806:121::31) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB10669:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f0bff8c-01e8-4ccf-546d-08debcec2a5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	FFWIVzr7D/QaBq3kFw8R+L6XTHTMXnvfbOm1x1kR0n2Av1CnvLh6mZajMPVdqCQiwqPijHB/VOcoS/AD/b7zfgvF8dNfhJtU1zQVebcBnJ6rJpygREAauBcpSNPLamcBSeVlUhccxdmDuPg7zlLtJqK4SGsYSIDvv5QHl5uPIgmz8xVTz8XCjHTcOFLew27mx660vD+uiFbeFJHm9xBTtg7YE+BCfcrOwf/tA8KoWOp7ePF+Hp6YXkQjHfKOZA5k7N0vxRJoUZixCJft9zXco2x4guVqVGNS35F+F0Hl6HfW7jFcNx0PEAqvPgWtzqiHl3BHeZzZR0lRk4N8NVR5IwYThAP2YTaCLf8/XYesnN2eYApjApgD6nY1Qc1KICqIzcjmKpcXdfbvhdihGJcXcqKjQzJ/cykRXvRKYcRTHdqqssscqgtVEGZgEhMpa6FPRO3+u68mHbTKNbxF3w700SvQJK3XhcaN1LnzmqMV0aHyFMi0UjsW4C/ojeNiFfcX62Z083NXW9s5EUPZMFAShhB5vJMT/g6pADw5Id0dSr796n64kyoaaxWWd65bFWLSH/VzeF1lZknt7BuzpB0NiyoOR+uwDzMrnF2854nVi1nzG4N5BS8d+9hoEyIYVsovFQ3DqsAeCd15hMEmE60X7oY+OWRYb7x8qxoD2Ez6F2jQB20zZVnpTowLLS86QX4P
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ox8vuyRTXvsg3zNbxge8fyosLf9J+hRaZzocsqGUulXqOCLfVyLXjTPhPy0J?=
 =?us-ascii?Q?O7RxID2umQsdLiQ0wRgYoXNtW74eBEqQZb/yXm8Umx6Y4lZG+/t4wAZNL7Bv?=
 =?us-ascii?Q?b2f4rjtYo01pyMpW46lyQkZNJz/09xcDzsd1PnXh4OixJ6bPwZ45keGUMte7?=
 =?us-ascii?Q?OUCEatF+Fuvke2hWuw6arNEq5tGXq/QQFuwja1AEbbov48B9NNHwNlUnKEOr?=
 =?us-ascii?Q?5AhLIQXf3T/hB0jo0iGDQwCfJETsoQy6g7BIVP9N4U+XGHJFoFDEFw3lZ7Ge?=
 =?us-ascii?Q?X0W7BqvT8kKZky8xzrVqZygNFHYHTxwuN/QtVmJM4MUP1rlSFq4UBD2NWjzA?=
 =?us-ascii?Q?Z7deVzmWnzujEJxqtktjTHirIsKDKOKZimO3PHsqOIGbgmvjobkn7MqCFsdR?=
 =?us-ascii?Q?mH8fB781UFkui4Br/47kJOiNrAeXKgrJf6tpYwa7RjA3LPLbrR5nEnhhSrKp?=
 =?us-ascii?Q?v2TfLknBZQ7S5GBQ5+8u1UBOCwSYdcJPZG6NHPBMFKFMqyXbMlSu+NS5vRTS?=
 =?us-ascii?Q?8YBYf/SX1WGdi4tn0WqfSmIuCpqEvaYqvgO51B+msGroJnpKIihLc1n53LBO?=
 =?us-ascii?Q?QwnKY46Ubc4fSjOwMDseEPZPA92b0SnDAFgIDkBK5gYGNsD74F/47y7v7KeO?=
 =?us-ascii?Q?5Rhqi+3CHmyFcGKaj1vAI28380KgWu7J6lxLkmRkh+hRj/bmqNApYrQEuAFi?=
 =?us-ascii?Q?FDw9TJ+Er9o8LbtLd9SFf6pW9OYTxZtegar099s6GYVeTtQAWJ0/01MB5N4s?=
 =?us-ascii?Q?lWj9TMzzP4cJAP4zWqSwcuF1pfDgWIQNsrKhfkMwbi5dcB/xuYaku1l1Z346?=
 =?us-ascii?Q?7ZGeMrMv/JetwRK0HAJpNrXd4rgwj3OJZ+Ct1hk5+lQNkv4Izq6m7xcqfdhl?=
 =?us-ascii?Q?UGo4iCLMnPjf1BhzbByXSCa64HMx39KnPZ5FKKKm9MQ9RsiAh9jsicPg7U6h?=
 =?us-ascii?Q?S4oHmhuJLX1QMQSQl+PUydHsfb3sWL+fcdryROE6B84pycuJT/txec2KuE21?=
 =?us-ascii?Q?AmIqih/hjUpll2hB5RZ6QhhCc/CQTXSVe188ieb/Woo/ofqJDaWRLssyVk/Y?=
 =?us-ascii?Q?xOGaOasi4srPjVyX2UlCp+F54qoA9W+QkyDqnOCcTReRxy0eG+IadCanbGgC?=
 =?us-ascii?Q?TGC8ya+IrTnlYegRECayn6ds2SUu6VX3LitzWmDq6RjcNEyMKVlJ8ChLQfJa?=
 =?us-ascii?Q?lOFc17u6lG5sFIeVpJLTYNxJD1QPgnTbiFE8njpb87uwoFlM+z21ltbg86mQ?=
 =?us-ascii?Q?vSoCuUv7JY/Zb8xnnBRSdEoWtO8IQpCn1LyGXomJuI+6BfM3sw12tJCnk558?=
 =?us-ascii?Q?EBawGpp7lxUzJDbgeB++QiIxzLOWPtnOQ2azER4+bDvKGUtEWfUHrUJ1tSIR?=
 =?us-ascii?Q?JrpAnpkP3dFTVJ4m77O5RmUnx78xmmqABvaDUps+mCxfnsTOqb4EBfHm9lmY?=
 =?us-ascii?Q?GckThbvVmyBNqTNNkByl0sTL/RmTN3wqDyT54DuKB8oTLyGMo2vKrM0UiTbX?=
 =?us-ascii?Q?S1sVcTG7HQnGl/Pv372eYE7p3zezuM53ekcpAgtTR8PdC/P1PtATda/skoq3?=
 =?us-ascii?Q?OmuceiHKA9UNDMF/OZtQVRzdIRgf/fM0OLGw4+IgrtjSbL2mL+1v7BePOO1l?=
 =?us-ascii?Q?6oK8+vtfevx4WR0VgxCrQn7sKVORvteQF0w2fR+FqqJudADXERjpJAOZlx9A?=
 =?us-ascii?Q?/hpQhaZS3i+F778bkkvYCz13x1vMqblb/PphWNAzEKZiaxNXmIzhMwfp9aYS?=
 =?us-ascii?Q?v7VKmK4aDDANS4PBrO5UuBTU7SQgDaSxACzlnoLBk/IXkjtlyalB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f0bff8c-01e8-4ccf-546d-08debcec2a5b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 19:06:04.6848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I82aUNjFQOB+GeogN2eFKOGtPmBlwR+lb39yGH1Cx2BrxnIj7YvVnrT1J8wPVFYu1wNYRESfAWZ/PhXwiC1LTy8X1u6IgDDub0wWJWbx6xpV2/ujQqOzH9aMmJHYFWw/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10669

From: Frank.Li@nxp.com

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-soc-fixes-for-v7.1

for you to fetch changes up to 2c6821657ce3b3c85f92719ea81ec9f9ff27df11:

  soc: imx8m: Fix match data lookup for soc device (2026-05-07 11:45:36 -0400)

----------------------------------------------------------------
i.MX SoC fixes for v7.1

Fix CAAM driver probe failures caused by missing SoC information by
retrieving the match data directly through of_machine_get_match_data(),
which provides the correct SoC-specific data.

----------------------------------------------------------------
Peng Fan (1):
      soc: imx8m: Fix match data lookup for soc device

 drivers/soc/imx/soc-imx8m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
