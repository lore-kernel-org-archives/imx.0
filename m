Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010048.outbound.protection.outlook.com [52.101.69.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B633BED5F
	for <imx@lists.linux.dev>; Tue, 26 May 2026 05:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779773973; cv=fail; b=up6u4NXZ0YLJWY8CYUGQsgMwsnFU9sGcNb8+DCKdHXAb9vybxW78BWFVDh5I91Xo/+PHpiyezuVOjNqXclXdJIjHnDl/TZkLacrnY2q24H3HqqsknO2ZyMHL8c5n29VaPXuSUS0iSq85rko2EUV4hdAxZhioDqFwzKr8H9zBajA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779773973; c=relaxed/simple;
	bh=cNzUFUlTCyit7dYWBA12Fe8S2IWk6iNyzjNsOD8kB1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n5iyvxxU7WCc0/g17rCDDH+zxLE3nSCmPJut83ywuUmHA9sKA/dpyktIEy+WsE1LtugRj8MDXNQMi4N9PL0EMQF2TVis6G0Co1wUicg4X7PP4loyzRELzp7j07XeHnAW+1XCVWApTc/21JJNIVWVRjhNmijF+G82IXAbyhF5NHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GKTfqUEG; arc=fail smtp.client-ip=52.101.69.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GKTfqUEG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MG1V1bhhHNzxq+oDjg9ppkdZ/I1YklMDExYAgeFfYGDvv6fJmW4qHdIJhWmKoYApzN7JeoGbBDgnRGnqyIx+UcTCyqVAerHlo9oprIhCq+Oq7kqfp9Loci0iwiIHjpGEfg5btCKH7IwKqOdzoJpbzFbwA4527Io//iooRBYQ7Wkva2HXJ4E35E8fx0UI/2JznRZ1MwxWzU3ecdrtnyL+efDoUWWcQG/C8PPxraivHLf4PWiS1ffMPRdYcRe5c85qyxbUlsju4P5EpKycSn5fzyTb4vriIrsTwY6oG5SmszN6JEtL0ieH2PpOlu2U9U9eLmsjNKFV5VaAFz9K7cpm9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgUbShpGThhQQio5YVY3mcqYf1p0US6Pnx91TBEOWm8=;
 b=bbOnf+RUm51jSlELXk/0kBdWc6q4OhwELoYGfyrEazPbyErJYyOJSxgXhbnmKjz171REaob1K9UIV8aZHAgUyjr4eDS2sbt9rDEy5uSccu48Icl9SigxtMASx700jNtE+l3l4EZdpFMowbGT9sKM84XDI7aWBizqWRS7J/KeM2OApeFoaY1Xyk1gGZd/VlGU6mlou8raccrRKYRJBgKi37DvslULoxz0CwEeJd8HDYy2TvBd5WbcpqlgAjNVbq00HLmnPc2lNpTkdazU+sZ6NTJSqvTT3f5WNXuvMNIghMI106xyHIk6DdeBEYthB/+Rd9EQUCleTnF5ZohDmTQElA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgUbShpGThhQQio5YVY3mcqYf1p0US6Pnx91TBEOWm8=;
 b=GKTfqUEGe4RRb27tt7wFSVkytaZjWs7J47PFwXzf8SFbCGC8aHJRRZGlB4xvL83b3PN1vNhBuB4EtX5x60RmgxEfsyObFgHt8z8I6jjrTCjyt9Zcrk6IXVNagvKtrGMH7rd3Hg5phZaaW1mNLgYqr/Uj5GuJFWsXR5PEJD+fn0A722LiSK4d3prRPjiWTISInkrY86a/vRMS1tAoJmSXZ8UlAwZJuBvUm8GZU8Qd2MjBfQ2a9bX1v0hk2/IYv+KtxkE8chZtkBEvNFRXp5IHsgsD0iLzy4wuKMpnEQV8CRVLU/jNec7WNYcDUr0bNUk4dVpbexX5uNxVHFxP88EqMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by PAXPR04MB9708.eurprd04.prod.outlook.com (2603:10a6:102:24e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 05:39:28 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9870.023; Tue, 26 May 2026
 05:39:27 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: shengjiu.wang@gmail.com,
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
Subject: [PATCH 3/3] ASoC: imx-rpmsg: Set driver_name for snd_soc_card
Date: Tue, 26 May 2026 14:38:15 +0900
Message-ID: <20260526053815.140008-4-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260526053815.140008-1-chancel.liu@nxp.com>
References: <20260526053815.140008-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0082.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2::15) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|PAXPR04MB9708:EE_
X-MS-Office365-Filtering-Correlation-Id: 7355a45d-0ae0-4f72-8bcd-08debae926e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014|52116014|38350700014|22082099003|18002099003|56012099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	serK7tn5kGZalxS8G6cFyVr0oZnUbiKnO/nnyIatwUX/YidM/tGnHxHMVJJwWAjPXyQMItB2Kkb82JQS6nnCN5gL4krh6oDoseRBFxxKNyXNMWAN0esqS53Z6nWSnmcU2KlfUiraCXprPgZRJbZwvG3NPlJ8U9+TAhMqOnzPcIEnC6RUdXpnxANKjIfXFsYViJbCqx+IeVTBCdInqCeqgPB5Xm1+VKukOP1bneOvfCrWjt2eQGM5thC6zGGXbNW+uLAgakwjjMD8J9jAGjHTz1MfKihE4jLBY06aQKlbAHSCc35hP+rHiCT7xp2lUhLlQXqnpabfpJ3cYtJzn964qili4c5+xhBw/JojU6HJAziZtBRVcyXzV2iXaKPn5uGHnAOIlp0jcf3D2rE1HVCH4dKmpN3ev2GpGXNy6VJN1WMPGmn4vrchDb7pXw4pKs/RgIUO/5bbuD5j51nmJ3WuXwawgqZ+5GBSSitVvsQRYDrRX3791xkkBWEeh0MaaXtl2CTcZTgni6F4t+th3uzkLeQWkfI4iMefEPZysPWBUD3WVrwzlLCA0Z38xkKdDkdDfPPtGdcAaCbq5Zr4GNsFBJ9GT4U8WssIpOVqC2akKK1BFSLosuUXn0M/hShbRGiCkbx3on4zut7Lfhconp8hWyFhd1p8cjhqvMwLIfasRRJgRQNJZfRmsKNbtEY2H+M86WveZotThLP7rbv30Qd01mItBSKmSC19pIB0zBsb8RcZ75r9bUT2DNkRVl8l7eVj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014)(22082099003)(18002099003)(56012099003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uMffD1OCS5XKSjQJ+y1lhTauYTYClwAOePoGvaneTN+SEB14Pl0RQfInLViT?=
 =?us-ascii?Q?Lp+pzWj2XsQUBydtBp2z+GYxate2+pRZO9HW7HjJPPqhXkyUxvnH+jXnLoc0?=
 =?us-ascii?Q?gQhS0ZudXWifNgpwH6HYvvGOVE/weYft+4YZ1pJ6O7SrEGgmmUogZZFa5pn8?=
 =?us-ascii?Q?CCz5BuBwdmVCmyVxkWK1d0SZHmL/S0O2di1IF0slWy8Ox1CO/J7ulCVvB+dW?=
 =?us-ascii?Q?M7nU/3vkL3gSP8ecKExhWLPR2UHK4dJmiNqrWEEklgMRXZBcBTLkxa33btsd?=
 =?us-ascii?Q?vWlRKt20E2ojY2cRIOm976qoikdcAAl9pQYsga/rEcGraPK/GW3nNu2+rrGr?=
 =?us-ascii?Q?HXTMkvaBS+r5rS0jEiFIHARCTj+thXBinQCXngjWFUU/U4mdGArYGdWyUKfv?=
 =?us-ascii?Q?Fq1DAQTok5ABd8nHDuVU5pWKzo+Ha5jCFnkol3mDXcvW+zP5D3oLajqW00KK?=
 =?us-ascii?Q?ev8n5LO0Dx5HFdN8Lk2XIcZRXyxQrLXxIqlhSUpGyQgWVXxZGTOC7N9NH79L?=
 =?us-ascii?Q?Dh5XRjHnkxyehSFugjiL6U45X+H89byGKA97bCAx3zj4JGrKx/RvvaPBgtn6?=
 =?us-ascii?Q?DXVnd5UOdx/GzmJqg0GZOI7mbH61fIG5umHYCWsKPwY3tYSWQmMeTwMZuZGH?=
 =?us-ascii?Q?UWVHIPwbJ84ANLOLMsnHpkJEi/enn74Bp9WPfQh3PiV3Ck+M4u4d11w9/5ZN?=
 =?us-ascii?Q?UYTpuOeBYjqGIJtBnMEaOLTqZ5IFd5jfyF4yv+7JEZc7JC6HM2+S8qlriMiV?=
 =?us-ascii?Q?I0BfuAjliD7xHUVnX7stRZ6YtunbgXcZaTCjCjRsn2tZknufBhMLPlx8Zb+K?=
 =?us-ascii?Q?/yVl6VbUDxIPwppNCTz+OywYlb1m21sxexUrd9zPisCn01m0RaU3X6EfeZLz?=
 =?us-ascii?Q?WjMo4lhZ7Cvw889NDLzsiYDTjy6Kjn63D4R64C3heRuwy81He0758RviIZrI?=
 =?us-ascii?Q?TNgrqSSZLVZWpwEhHBz4DUA8I20SqpFotq4gAtR0wK6+A4ukrYkSV4JJcR7e?=
 =?us-ascii?Q?Ri3l21TTd57NE9jBVJxRZbiauONTnP+T2o7XHd9B4hFlbDv94oK3wPgKHMdP?=
 =?us-ascii?Q?koPse/E+qPn+9vcSu17nzr6HSrBBg2hdMGd+qNigWobv2qAMjprpmCg26qY3?=
 =?us-ascii?Q?rKbBBOn4bh7J4VVP9ZEMhv6pNRk7p1PqOoqFAK230YG650F6zE1VGXgrK+zt?=
 =?us-ascii?Q?COJaHSDRHeEdXRt6vk13TdBy5lcIeFrmKn4c1pe3ARTWghJPutaIXzRNMr8L?=
 =?us-ascii?Q?GgL8OxQ2ZcIFgMCsjeTQTZdkW9M0NvQ01Dxg8oauqjMxmlq3je5k196hUi02?=
 =?us-ascii?Q?5GY67jpV+nNJ+zSWaLIBLOkYJwCLGVc7KdGwJfyRTEJL1C+MpNPertZG1wtA?=
 =?us-ascii?Q?5CxZX0smbqy9+mvFGrZ1+FfGJys3ztWdW4UZi9d8tpJH+f9dxBbf9YApU1w/?=
 =?us-ascii?Q?MyBYsr+RLkukCKSPMXA5tulNOhT/RdPhs5h6CB+9CswX+8NI30gwNriP7GiB?=
 =?us-ascii?Q?/LL9AFenT82WA7Vm7DkhYyPB+zW8juCfSg6cwdX3S8UXgXf8xrbd3QlbftJI?=
 =?us-ascii?Q?tGGJF0dRGPkYvHadsaIcPYRV9Kh837o8PJ+Z4vhTlnPfJ/EhBlfIGJhUu11f?=
 =?us-ascii?Q?HU1ZajbiT9cGppiRA30iV3tDQihKk8xHNHJSdYPaeqCVUMeoHkoLst32X1Jx?=
 =?us-ascii?Q?VhuR6fKOKudfk1rEsHMHz6SU53OuKPYlsiOgjtGHyr6BkMGDMWSQGswhqyr9?=
 =?us-ascii?Q?uL8YnGso9Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7355a45d-0ae0-4f72-8bcd-08debae926e6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 05:39:27.9570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AiGqotSY0Xdz0kIMhmaT5RkuT4Pmmh1nD05z6Db4/T6zNQtqbnXM/epi6y2QGZmEgUz875P8zJzxUQfGB71RLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9708

Set driver_name to "imx-audio-rpmsg" for the i.MX RPMSG sound card.
This allows userspace audio configuration tools (e.g., UCM) to match
the card by driver name independently of the card name, which may vary
across board configurations.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-rpmsg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index e93ca31e75da..14adf55d9cb1 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -241,6 +241,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 	data->card.dapm_widgets = imx_rpmsg_dapm_widgets;
 	data->card.num_dapm_widgets = ARRAY_SIZE(imx_rpmsg_dapm_widgets);
 	data->card.late_probe = imx_rpmsg_late_probe;
+	data->card.driver_name = "imx-audio-rpmsg";
 	/*
 	 * Inoder to use common api to get card name and audio routing.
 	 * Use parent of_node for this device, revert it after finishing using
-- 
2.50.1

