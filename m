Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2087.outbound.protection.outlook.com [40.107.20.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED43215171
	for <imx@lists.linux.dev>; Wed, 22 Jan 2025 16:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737563697; cv=fail; b=SDSVhYE/PpDUq3d70c3Ip8QZopmmCbk1lNl7LAw/E4lK42eVnIbOQDITqNpsUzRNrUKL0DqXqtB2lJuvM71KQhxXFzMjC50snB5fBMJZbV5DdSKvENOocQx+T4YJ+e8CrYhc+XJd5R/Lg0ZOAXeDiv9HUknIMD/qNMJRisrgVuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737563697; c=relaxed/simple;
	bh=SQbnlhGuq48ZklWETuAa6saM9OWNWx9l4lB7VbDyZ/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FG4FkRjgHGQ1TzoAKLLKFE/mUmVBX0VCpxAoDo211uO4a24eAhKMtiBYeEBLM+XaQCovMMrv+ulMS/+FsVcDkmiXZuGEP9QCzucy9x9RRtkEd3ewKkmGoAtnvAXBv90dkNLwjT+jvCqjz3lw35xetQsMAJ6ILtz12hy/uBVXh/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AoDpKGBZ; arc=fail smtp.client-ip=40.107.20.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AoDpKGBZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YrC/FmtboIqyNg71du/BaeSbl2ZEljvMe1fGtQXBMNnVKNluHiw5+SilwmDH9ivVXgF0ftHaJ7/gSE3HCvFV5BfJH0EsuqIGWTA+wmMXXx4FgTsLd7w5d0JGCdeyq3KlGIDe8Y/3MpIp6LwSQ3NjoN7aoA8l/S2xEbA2XiokzdePdUnDWwTfn7034ceGbos5nk3gEk4ON1amNinRVIhP3kXf6UDyQ/KcBg7vYewpPtn7btyQdJxMwFz4WzBqsKn5D4dVGUzakU6a4cA/tgBGz9K8XOZc7zkoIty/1ra+fhJM2xRc56letA0NZeohd+Dofh8/sM6j2ixf6UMecKsPPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kc0aNgzLvalPlqTWyfu6SmwqSJDO8yBp2Bjt+359HVE=;
 b=yI0Yy3jwKGEpWsW8jxu+Bt68ZQU80650Td7pB6VfHdGsNdIIgmctfcOaIGkB9ZsWs/T0fKBc2O2w+4UTj5V5IJhzTVVsYZt/yam1Wh9C0+s34aMB4Vn/96rjUEk5o9qbSv5qWrGKanVx4TJINpaECJJOZKv8ouuaTIGAvnv9yiw26h2jM0j5ABw2SkMMpnUkPgue5vBUdjFEe9aXClxSXQZnJZuZVp2fs35V+7KQOUGpj3SCsQb5CXvpx3+sesE91xe2p8c23RgyvnnbqvgNg9g3XXg+LSi6SNM9Eb5/xMJfKH/3KsewrFXL7Ki+I5KMptpUKd9MSMmc3s7mloN5MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kc0aNgzLvalPlqTWyfu6SmwqSJDO8yBp2Bjt+359HVE=;
 b=AoDpKGBZD8lKCVYcDlWiKPZVMG7jdMZfl1l1ttCos+Cqd0cmPfibp4RJoblC4DWcw5uoAqDsCHCXefjwtTXryiGTb2ElIaetZFg3mqULAMT8pliL8ocPwMuH4WXGOgSrJxLxs9sVsVCWL4qRTTWEVa74y7qjjB80yCLUusWN8CVtgflI8IR1Wa0BftrkkkbQnlgsLFwI/LgkORxjwteJrUkb0PQ+Mx9wAREFkAtQRYqQ9c/oXqAaWtI6ESZT4iTOe10yOPAGWR5vH1/T2RHPD9wUz16+xgKWz33LYprDWgHW+1x7d4adY9f5qxsFhMe3RYGHxy6Q/xtTQHvClLmErg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AS8PR04MB8403.eurprd04.prod.outlook.com (2603:10a6:20b:3f7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 16:34:52 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%4]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 16:34:52 +0000
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
	Daniel Baluta <daniel.baluta@nxp.com>,
	Liam Girdwood <liam.r.girdwood@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Subject: [PATCH 2/4] ASoC: SOF: imx: Add mach entry to select cs42888 topology
Date: Wed, 22 Jan 2025 18:35:42 +0200
Message-ID: <20250122163544.1392869-3-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250122163544.1392869-1-daniel.baluta@nxp.com>
References: <20250122163544.1392869-1-daniel.baluta@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7c3b1b09-32e4-4483-dd43-08dd3b02b20f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?abX0hZdAvRAKcJu42QDhDvyv4mhWRuUto4iGWPaa4OxGbgIyMUeUt2rRVheM?=
 =?us-ascii?Q?O4Ul1tuuZ7t3I1vgSvQXlP4/asz/v0gf5jW+XKGqQ+XY28bhHQ4MHBva1O2H?=
 =?us-ascii?Q?n/D7xZszk9KMWI2nKF3KGn0EyayZEhhxuNfr5aHSB59+6y9om0oKSM7T3e9j?=
 =?us-ascii?Q?5Dg6aEX9whfD8muKt6gjqqFRSoW8eeG7vTGt+FkPlEYJi/dH6xqdnRml0zaW?=
 =?us-ascii?Q?NBxNgwI1lARM1NyzgKXQxHX115aOWJ8xZFWUZ34iFrV63bV3Tjxj/5AL8vkI?=
 =?us-ascii?Q?hlPAy57qYjPLoLsuGeeIulqkWH5lT/OloVxHYC7aTyscNICF70bb0LqHEBOX?=
 =?us-ascii?Q?09sWGKja6wTHKP2Sggro1+ogOjuzo2b+o+A8PkDsu9bCae4sCW0MLXs++CNq?=
 =?us-ascii?Q?WmXDmdMZvUyNNw5CB264uAXAAyG7oI1M48fbyPscxpq2nJ87zgLtdz6W180L?=
 =?us-ascii?Q?/n2/yqGnYsF4g4Ytvd7frjND98vAcnQnmpYIazKm9b+eKtf7xNkPxA0qfBaN?=
 =?us-ascii?Q?ZJOd0tXopFKztG1YD5iQkoqJR5wSzanYhRrz+Iju81dxeXVHunzsdTlrp+LC?=
 =?us-ascii?Q?juAZ/Lao2VAt4U8V1s7EhZkXTvJ0RyIrLm0+B7NLwDt+zThjh2mFpkqCufuI?=
 =?us-ascii?Q?RIKVCqEpMymHc27e8eMp7ZkSMGMta18ydKGP0OTm5dx+biFcNDXap77FTXfk?=
 =?us-ascii?Q?xVO3JnWS3BULDIDwvUMbTkrY2RcrEKhE8dBGt9+YNLydow+35+PvV0PNbk51?=
 =?us-ascii?Q?7wOffh92Cmd4MGXus5oet/byApg7R+V7fYWdtaYH0iOtWuFpqrvQmzhZ4sX3?=
 =?us-ascii?Q?b+yai/nV7HIwSqmmXXA64ddVAyU2c6YgwCV9pv9EEZmQA7joeytxTktpH7MY?=
 =?us-ascii?Q?gfRu29BNncjnKLC9xDXHwThn0fHUIOjH5Xf8Rc331gy3/HpFjHuPnUO2WVID?=
 =?us-ascii?Q?4xEAbFcFBGWVuvQHsCawt178Sler7WGcSqVbDscqsn7NhcuvlOSoUZSx76l2?=
 =?us-ascii?Q?6UNYc7sqyKByjGiRyEjPf5ce3Cbx29WH/gy9oQDEfzkI90g8+eI+Yx6lw2nj?=
 =?us-ascii?Q?uGRQIVfT879JOKFj/sGmLPXMCRQsP27C4qNQrQJfi7RHwEqjQsj5JBZPUvSe?=
 =?us-ascii?Q?7FQDFEREuceTxHcSg2+gr4lWwd/DQa2XmgW2V49tIQEatnU5eRf8cN0V10qj?=
 =?us-ascii?Q?2vIGne7fyR2ieK9JnSqAs6MW6/D2tz6xWe43y+uawN5KS2Cu7/fNWdNHMai5?=
 =?us-ascii?Q?PdxPvjkPQiPixbZuwP9NAlgnL8sphJAOcYbhMBtP6HaIz5CryrJ0yI+N0/f7?=
 =?us-ascii?Q?ftEIPizI7pkNi3OSXD7qltedxnO3dBJeioKG+k1W7P2FcJNUFDtomhf2ybEC?=
 =?us-ascii?Q?1IFKgImpVlSVIRfyouM5Yws2p/EWTSvtiiIwtGmkrMeShuVUkv+7jsVUPMrY?=
 =?us-ascii?Q?9wcmxX/uNoh1V7gMig9DkFpO/a7UwapL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N2ces5tX7ELSU5FFkP95qm4BzejkQoy5B2H91rpzx1oeJOiIo+UYM7V1copd?=
 =?us-ascii?Q?SLRjnnMyjMPVqD1+RmX5fsFwWhVdGXP1Ze+0QCUwO8P4paI7QERNXdcEYNco?=
 =?us-ascii?Q?Q73HgJxp2kADK716b52qqRlduVMdM4TNKkE7XnPv1XOUzhFOjEXcEGPE5poG?=
 =?us-ascii?Q?MfyFYP15mrgMrpkwSR4vOXr66hYdr4etaJ2Sv6yZ+m1Uchlfms08y6HtGwyg?=
 =?us-ascii?Q?CW62NpfEMZorm5lZBz5sVnMjzTRvEOmZ7TAvZuLcSisYYGfFqu5GqSs959B9?=
 =?us-ascii?Q?2BjrEZyrKeZMJdMU14B11F1lSnm2tXF9CmB1UQjc7R38089GmhVcZAIfspme?=
 =?us-ascii?Q?4n4/eJzklzdkMMTxP5uEkrEVkZUFdiegIzk9kNoACjd2HVjg6vip598FxDa+?=
 =?us-ascii?Q?aniPtwYBDAP1krC8PkQCD8XPw82oiBw4/YaFeIBluELtElqjOWzpEH9wY/WQ?=
 =?us-ascii?Q?3dtdZtBYe2YC/9PwNdQHBZJMCOpcCwI7+fmFJRz5obGcmPQ84JzV+1YzjkMG?=
 =?us-ascii?Q?zmqmJ+7NsMNmaQRDvhoiEm9Z20jkl0NYtsB5RVgt9JFuVaUoppf1zzoYCirY?=
 =?us-ascii?Q?yjOLcbbh0eiVaGW5X3EYnLYhRnAveRJ0HahBuRpyBjTCS6AOM/FGxIcEousf?=
 =?us-ascii?Q?CQsl5/PNqvFxOHxXFS2wRH1TB3Qv6+yKHU+g4xu8tcf3qzS+QfhxJF+J2mL7?=
 =?us-ascii?Q?SmCFqBUrYiZDO6dWfqh4AYrm8EbEQc5bzsDHX+jReuiyTxDqKbzTkGb/H8am?=
 =?us-ascii?Q?VBuxrdgCRk2ijZdXOc2QnohNFU3i7DzeZqzXmoShiLsK3rrneg2zQz8Ksifq?=
 =?us-ascii?Q?IMfQlEFdctQj1FyThTrvFLpRu0oU1a7PYUvasI8N5QTcKWvDtRn8svEeufyh?=
 =?us-ascii?Q?PpzvV1+hLyp1PMtsndThSOo77mtgupRwRztbdgZMgHxzr7W8ASLfUgkOsKlJ?=
 =?us-ascii?Q?FOUXoXokrGq27vpw3r3IoUQ6h4HDOeENLDOQ/k7lUdoFADbbrRpzxXw0S+om?=
 =?us-ascii?Q?WLLg/mBMJRYav4P95choO5nFLVe3VelmN7WXpDT2Vn0neryzCY8lhhkfwBF3?=
 =?us-ascii?Q?URNNSJlEBhJOa/GI1JP9Yn0QeeQGYnhdkfhPhIPP90w/FZULvUbIj5dfd02/?=
 =?us-ascii?Q?jkBd06ZyMLUENVbgCVZTYfbPnoayb1bzDC5KF2gYNKRLFrsV/o+YkVgW60lS?=
 =?us-ascii?Q?HD0MyeROSq8tW4K/rs2iuCrJch93SaseHWwQl8aBJpZnkPvq9A/jDvQ9wjbr?=
 =?us-ascii?Q?1SfnbSj3W/oM3S9C8g8rS5IjDLj678usf6BdcIrxLr0l2RzLAWqpm2tBHnv2?=
 =?us-ascii?Q?w7dDDe+wQnaw0Za/lXdZfxha8T4JmxcCSfAxh5NJGSawD/xqtuE24l33fYSA?=
 =?us-ascii?Q?zFV+G47VWmBYWtmoVy7v39BnxpL0t0b1sGeMiwOQtbaSfozNt36RMeVU81Mk?=
 =?us-ascii?Q?Mtqcil1SlX5SF/uz3ys2iFhOHOoJwaeCi46LgDIoRXnG7bt2ClUuUByiEE/F?=
 =?us-ascii?Q?SV9KGnMHOa0LOEGWpnvu20Yg75bIhKR7HyfQD6cSp8cObvMOjChv8rRong/H?=
 =?us-ascii?Q?E79NhPF/jIsWhcXwajgkvqguXFGL4TKTcCB/CyLg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3b1b09-32e4-4483-dd43-08dd3b02b20f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 16:34:52.4459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G0WwS89PLGrc6K2N7DkBwtXcbKwMER1AYluDCRwV8NO4Lfd3sfhUezbjpNe1GlfN1kWykJMMDbME+YHUQm38mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8403

After commit 2b9cdef13648 ("ASoC: SOF: imx: Add devicetree support
to select topologies") we select topology to be used by the board
compatible string in the dts.

Now that we have a way to know when the baseboard is installed, use
the board compatible and select proper topology files when the cs42888
Audio IO card is used.

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/imx/imx8.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 0b85b29d1067..d6117a3d4266 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -611,6 +611,17 @@ static struct snd_sof_of_mach sof_imx8_machs[] = {
 		.sof_tplg_filename = "sof-imx8-wm8960.tplg",
 		.drv_name = "asoc-audio-graph-card2",
 	},
+	{
+		.compatible = "fsl,imx8qxp-mek-bb",
+		.sof_tplg_filename = "sof-imx8-cs42888.tplg",
+		.drv_name = "asoc-audio-graph-card2",
+	},
+	{
+		.compatible = "fsl,imx8qm-mek-bb",
+		.sof_tplg_filename = "sof-imx8-cs42888.tplg",
+		.drv_name = "asoc-audio-graph-card2",
+	},
+
 	{}
 };
 
-- 
2.43.0

