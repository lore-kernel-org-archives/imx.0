Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2064.outbound.protection.outlook.com [40.107.20.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF6B149E17
	for <imx@lists.linux.dev>; Wed, 22 Jan 2025 16:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737563687; cv=fail; b=azQ/dHzqZ5QXL8en7Vb+qk0If7qTfIlcFZfs4wBzfD2dIyqMcOzg4qojmLRqrRUCZ7kF0ulGNbVA8nHhd3A5vcXd1b4/lMkuwHpNfs+jrtdl5WnIKtYNXoQK7gUpEmudFknWzfl3roxpQNRBb4/+F3GgZseYQM3TQfDa/XEqgbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737563687; c=relaxed/simple;
	bh=vTYExf69UBAxZdhVKDYDjh0drp9wW18IKAkBgw2OSp0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ufch3jG/tHbHCPjsqIMF8+X2CdQif3FvnaakCKoNSx3yeJcVCgnRUeQT4vA52+Xps24vwRXdO1uzyjLhTlvtE9MTIJGp5yneMh7qiX558s/fc6f4sOPYQOXb8dWUCJAEfbansDSwHfB4goZfG7xg9iFvuhCzcsm11b6+T4LArFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mapYclcO; arc=fail smtp.client-ip=40.107.20.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mapYclcO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mO/2z97UkqIR2L2kVngAFfNJdBhYutgZwi1DboVwVqyudmEG5xgxJTFjtEE6AcS0fi+3JxggJYNrSXyXLNmxsbk1HJWEP1mzuapSZjQKdlVG44VRJNweLdWDxW3pd9D1WMVsUCtHpJ+yZGFYqDmwTjR5GB0/pwgBYx+vn+aKFoc6FMUjfM9PwL6LlHaMSrCkWhmr/bXyguI1SzM6XTDXRAYdI+BWfDQTSL4CVC1TPItrlwrJIDeV9TQeu36WxFtUwYckSCxiWBfvXFclm+rScWgyRCmBzGUQu6o9EUMUdM2ERkEC62KErmphd/pOG3LPO8u5MokmNp3iTfFnvt9sVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjwFfl3ISvjuq+j+7f0CLZctpnz/yxm+J10b9fNEAVY=;
 b=ZOYmnqAKztWZcrVywXbJ1gfb9guNsfJ4GwNiyPf37UkAXu6QVBxwVp2hQHj3DfbkFt6BHkxL3CPoHuCrMAl1A8RCeDHau73SHmdYUjJ1fTcOMo2OhHC8KpBMp76i4kfkKj+ZVKVe3+iIw69ILKJVBiUHquIJYf64tqPzR2zt+Fk+PdUsxDqnZRAm0TqQyUBTccOXUjSDUGkHB4wRUxZrvUAAHfxPQIu8d7D/ZO5VWqagXSVLzkCOH2W4nSiu6yKegRoT2wsAB8KNsRsScXtkNz4qssljvU8A9aXfAZL5zg/m2nO+zgcmjHH2k5qNTyQo4BWxDgrB1rs6EHuWo7yvkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjwFfl3ISvjuq+j+7f0CLZctpnz/yxm+J10b9fNEAVY=;
 b=mapYclcOx9U1PpcklOqcMYgXs11fHwyHGMmXqmWzn+0VNOlkUtPjPXK8tbHIBQmE8TLYfBvRhVeVnOST3v62Hi4FUEmolgjw0/XkJ7ZepOyQNiu3pvXMYKLhR8kfS91WPJlfCtceN4V/NkmTO5r+fwgbqbAp13Zt9BWPEEuv1CVkYQRONfygLbtrGDbzYVEC3m5qCb6wgqKN5d1xsAcPX2mTxHhKdWFXAITMJ6NG2XqiBdCgNngTAUIjKqWpVnpRstXLmW2XZubK6bdsUALMpEamOJy4DIoG/Z4op5OVknpKymSqCCZfP1Hxl+600x7V2MAMjq04eSR0qROkPuLrhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AS8PR04MB8403.eurprd04.prod.outlook.com (2603:10a6:20b:3f7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 16:34:42 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%4]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 16:34:42 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	broonie@kernel.org
Cc: shawnguo@kernel.org,
	conor+dt@kernel.org,
	peng.fan@nxp.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH 0/4] Add SOF support for new board revisions
Date: Wed, 22 Jan 2025 18:35:40 +0200
Message-ID: <20250122163544.1392869-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM4PR0302CA0005.eurprd03.prod.outlook.com
 (2603:10a6:205:2::18) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AS8PR04MB8403:EE_
X-MS-Office365-Filtering-Correlation-Id: dabb5b9a-cc5a-447c-e77b-08dd3b02abd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+EzOwzM/4oL7drAHQWR1qjHzZ9rgp1nb9ewdQm/wE6W1jjHgP9PbuJYtlktj?=
 =?us-ascii?Q?kiw/6+13Fja0MEr9VtRukoOSZZto/VoQlaq1I4tSZWG6MWRtpMjvzscDs19r?=
 =?us-ascii?Q?6FKNlhRdA/+A+XbY/s0hP+P8xpmxlP1i/7GwVs643TZ0ECEyMLGyvi9AdxN9?=
 =?us-ascii?Q?d+pfVorf9jdd+xadqMGsCGLgqur/jcPi3LyW/C45ecBQIdazeGHF9+loG2yf?=
 =?us-ascii?Q?KAOvmeKr5W8N+VY+INJTC+rIrNFa0vYrgcg2UZONnaNjEKY65ZbNRhktoeA+?=
 =?us-ascii?Q?1yT3dkc9qPMPhfzH4r//iuJL2ESnuEuqlKRflz+rQ4EYVnA140JsId4QYyQC?=
 =?us-ascii?Q?XNrFCfujBLrk6iMWU9ntRwO++mxuvo88S6MRjUReA8LShdx1pQRhcxcAY5Gk?=
 =?us-ascii?Q?WdAbscwhsDasszTT0CvRha9MA38g85ZpaDnUcgFK8bujhQrDiaMhyamA9tvj?=
 =?us-ascii?Q?d64Sx7O8Pp1B/8GVf0RjzP6G8O8XcVuVAhiCy2WSJTLS4C6wyH0KZ4pjjdp4?=
 =?us-ascii?Q?7IPQ9rlQzTB+aMP10n1pY5hTkOfbmJTgx3/mWKxoZFrwBocvnDpYXQZaJzhK?=
 =?us-ascii?Q?Hb04KmwV2gH2udchuNZLosgkF4AHB7m7JEKbARkkjPTRn08AYksB66Mq1EFk?=
 =?us-ascii?Q?7Yiqn8TCRdlwP1Iwv2tOcaJLJjR9uEOEcEnVTVh6oHd87C0ivFsHEkHUmqon?=
 =?us-ascii?Q?juiH1lqMnU8519F3xMSrk1D8RFaiWMEsEYbAq660lJAIXZU9xMPK3QPqGUIs?=
 =?us-ascii?Q?FZQO6WOor9UGucjlr03IyzTvpiSl61M1fsAbk5f4P04c0r1ESNQyizsqDq6a?=
 =?us-ascii?Q?f0PHxzr3Fx8YnERMFKQAyeYq4p6+va/WrEL57/HTZ51rfJA+OEyn53USk//a?=
 =?us-ascii?Q?Tk90CGfpygzqhMVhFlHcTvw+Bwo+W3mHeZWkIEmfdj8rKiM6BljzX/3JlK8R?=
 =?us-ascii?Q?mtAZPmex74B1beBopgcFLXnORwD0bAH2PXyC3LwpnhTERsMmNMum+ArdrcYr?=
 =?us-ascii?Q?dFwcD6Wp/ySCfIbZKDuJkeN3YgqmqkBhZjG7hlbk2EwxYyfEKILA6eSkXx1a?=
 =?us-ascii?Q?xxjQvCcFf4fzMqZmEPLrLX68aaj5QZ5b2in0MiCHhyGa4mgDNCFn6f3X4O/N?=
 =?us-ascii?Q?s/8XnNxglRSEII+X2Xn/GHu15J8h68nH6BU61Unk8oOCenq492FhJnDnuhBr?=
 =?us-ascii?Q?eTNka4zt7/rMeybzbkzcLwKfVP9mMPt8cOX/hh7OS+vkFMSW/MysKf5+XMJX?=
 =?us-ascii?Q?7RmoBwkzUwFGWwn++cy+0yEPOW+zcRRbJlV04csTH/d3Ua9jstQFu10IO5T6?=
 =?us-ascii?Q?bZhUkpiq5vbg1acVbjE9LpFYpaA/W3LSt/7AaQGZOdSM8Gf72RyN8RlaeQG7?=
 =?us-ascii?Q?MOPUGPNIXUgN0Lank5q+Y9hmGdjvAvsGuiKEwx7IBSkOCMKhOOnejd6gLP/9?=
 =?us-ascii?Q?XlIYFnqKSQM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mDBIpvHnRsdV/4sRFcdYjkz2iU83M8JZKCJEn17YfP+asYfWOVHnVdzD/pzH?=
 =?us-ascii?Q?t5t7JuyW9BTarNMCeB7p0TfceWfkx+fnHj6pIxXpvVQwirqMZn/9YDQ2H3YQ?=
 =?us-ascii?Q?QMJ/r6PefOQ25LTGVTq4Wumx+HT0gQbRC5ztlTF6D0gOU6v0U2K9W62CQxNN?=
 =?us-ascii?Q?jy0UwpeUaW5zs03oJZaS4lTf6tJB/zPal0Got13HbTrNTH0BlRxN8stGbhp0?=
 =?us-ascii?Q?J9q9o0qS2xH6opYAAD0wcYDoGqY1RIMdFdt2Al5ya/RA0mjFmQEoyLts+jWs?=
 =?us-ascii?Q?eL1Ti6SC9cC2/eBmKJ2EUHhmoymVQNcwoIOsfR9ky/i+C4IAH3v79WCwgYKy?=
 =?us-ascii?Q?p4PNFPfFGVV4Tzap+K8Bs9IU6s2zD+SxL3ar5Oc46vW4zlpZHtVZhTn3Q/Lb?=
 =?us-ascii?Q?qPWJHXkkX29qlrKK7XqmEIEbotXczP8HGGtvuHql0F+YVK5WQQkgmt7IArHV?=
 =?us-ascii?Q?dDyZcq263EPYYmhaXWXvRD2EGXLtVmsYCNEbxV2G8CjoPPeglX4M9/OyUfet?=
 =?us-ascii?Q?WQyl2Bh3L3Wf22PzXjbG7l6nuabYmgyvtq1gRLojDEyJ6rK0j5fLHyZyjrya?=
 =?us-ascii?Q?XXSRWt8s1R9sgn9ZNiUV/P7NipjPiNflBhMI9V3OzDEUcDiZsD95vXMgWtK0?=
 =?us-ascii?Q?oo1n9tRW0pX/drZ1eHunmBmSF6wCOzY4uBsz/NnU1k9HVQTJ5r9Tv2RafzOk?=
 =?us-ascii?Q?kvKzY2nT6Y5yvKQ96wH3bzk6EutHrengP7YIGlOFfAdRmZA/uGOiCpZzUHnj?=
 =?us-ascii?Q?uudP1wJUlEqYKhMTK3gkjINT6R/cXfisbzXo7/+/AmjpU7zzrd+OkIPU7W1Y?=
 =?us-ascii?Q?22ury6e3BbaRDhwJOqEloqQR9056tPHtnBECE8wn+h3tfIuEr8m20tYkFJsY?=
 =?us-ascii?Q?9S8WgQHxUj5ZBS6Q0fdKVEQW+vNfWxxDCtQfOGmRH8ukeGnHOIhJFBIk9eyn?=
 =?us-ascii?Q?jD+v7n0HR4sE52L7r2GHUnIJ4+n5vS03hBCW3l9v0iZnwohz7n49rug9Ap/c?=
 =?us-ascii?Q?cA1xsRj8XFB9lycyDQtpI6FRGTtRXOCqdmwunt1KaThh4l8ATsXqQpJ4PV70?=
 =?us-ascii?Q?o2yy2bP7HdCjuh8dWnl3EfmSW6p6wo8MXE7bK9WyJwI/9EPe372s9slobTK/?=
 =?us-ascii?Q?4dA6UFAx06gko+8gmGJtx+C60CFA3BIwFBZpU/7FAR9Kt+nhhD2fJj2FR1P+?=
 =?us-ascii?Q?YpPyhMs/rSAlRQyHieiQq4HH0FNro05SazsNT36Vb3Rwut5h+XMkK7ByEBLc?=
 =?us-ascii?Q?O0rYJwqvTpRHngkxOPWgZL3vwSjb4N2uu9uhd+UQs51vk6RzIkL0twwbKz+F?=
 =?us-ascii?Q?LSr4geO0BqrerNiidPYDXQ686uTz2v8/7I6sQ65RnN0SkU0WLFsNrdJKhy6L?=
 =?us-ascii?Q?v9xyi58ApjZrvL6d7rd2d5+RMUO2tccVlEjjN2ZYLh1VT22lELLAludhO0Zb?=
 =?us-ascii?Q?UmN5W4Dwfs9M/Q5Qu0i2EZ1YnnmoV+a5SkUl7/lDWG/g0TvIDhhd22J43nZl?=
 =?us-ascii?Q?PUcVkNVYSWYDjYpa0op2QdUMPwgsd1aKgyog51KXEDFFXj4kGu6u6HzOYVGJ?=
 =?us-ascii?Q?ZdHHufUt32QaTw/KBcEqH9x8A0HkYtH2vABPeMuh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dabb5b9a-cc5a-447c-e77b-08dd3b02abd6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 16:34:42.0976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IvtyuKSERIMxxuXKUA2en7Gb+JFJ8o+7mxNzhMO7wd8lq72ExKVIhuZtR2EQAynq641zMMA9sYO1omph3bAxow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8403

We introduce SOF support for new board revisions for i.MX8MP/QM/QXP
which wrt audio they replace wm8960 codec with wm8962.

Also add support for cs42888 codec on i.MX8QM/8QXP baseboard.

Patches 1-3 are already merged in linux SOF tree and they can be merged
via asoc tree.

Patch 4 documents the new compatible strings and can be merged via DT
tree or asoc.

Daniel Baluta (1):
  ASoC: SOF: imx: Add mach entry to select cs42888 topology

Iuliana Prodan (3):
  dt-bindings: arm: imx: Add board revisions for i.MX8MP, i.MX8QM and
    i.MX8QXP
  ASoC: SOF: imx8: Add entries for new 8QM and 8QXP revisions
  ASoC: SOF: imx8m: Add entry for new 8M Plus revision

 .../devicetree/bindings/arm/fsl.yaml          |  3 +++
 sound/soc/sof/imx/imx8.c                      | 21 +++++++++++++++++++
 sound/soc/sof/imx/imx8m.c                     |  5 +++++
 3 files changed, 29 insertions(+)

-- 
2.43.0

