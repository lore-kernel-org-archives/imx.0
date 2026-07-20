Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012071.outbound.protection.outlook.com [52.101.66.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1743D9023
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 09:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784541104; cv=fail; b=qdirnlP4fGgU579GB1eJ3+nLIynzA4A+Q1ftWhnJiTrHC9xJ4eeFcd5zsAHt/ECVFWa412jrjD0JIxDDnsMZkKlsdaZ/VqK/yOcDiogEdfqhI2+pWkM15TIioU+GJ/kRyIHv1FAlFm5QCU1nJUeFV2N/kDjD+0J5Vz0QztKbzW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784541104; c=relaxed/simple;
	bh=q8VqYNzLOJeD/FJRSYbsG0QiW7YfIviprUvXcAEEzDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dc4k3na6y7EyiBM+trPcpVYAj1QuokDVv1jP03KeAm1IEbCIOf3UPuOMEntBZKaa5LuGpWtDe2bxcyC6mu7xnetSPZM/R426kgNOgJRbXmxcpn1o2E9FluxIDUmS/hRz5M/lgHDF5MxOkDMYiRDO76Nocqk4xNUFV7nPr1QRv0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=P6iMheR8; arc=fail smtp.client-ip=52.101.66.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="P6iMheR8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJ3JVOGFa6+RB3FZmE633WjVHpcFHjKGh0PCXrRG/Hh/dA32FdMhq9NaXwEpkdAJvZFsTpyHb2AXQurfXlRxtejC0ZNyM7FMlMgLJldyzzx9l38s9PD25dNcMke/XFB1PYCG21iRA+ZFV2uP7LZCmRAQKowxNZ4QhtB8x2I+o2jwt/YAKr7fHHh63FXV/Kmjr0K8OcDo/+2G5sAOEb7+27rcyA1i4lw51xhRHNn/8F+ZKeCGFBlbNVjMGFoMoCOj1/Ar5AEuEtiwBiWYt2ZPNGEInwOsN6kXdmEO306DZH6niFOjfHxPcTraCT7XEscNlH5RiN30qOMdDXs+0rh2kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPPGQwc3PfT+C4VBhWiy0S/G7+Xy+TuZZ7wv5vN1sqA=;
 b=gtQjJVTefqZ3368963oafp6zCoGKdGuOmTKdpd8gKya8vzjpzVSeeDvkJcHdg4nw90EkXcOSoOykoTv49LCDW6AbDPP3LfWOxRfHc3LGt+O8RzLrVsOjPQl7muy9bxNJZ9+1Mul8xRZWwr6xExrdL8KWbps8mhiVXMfqSE1+QeilwONvloygKCckAxtw/3xwRQMqd/5+BogHtqfQyCusL3zokEYS9DZOCEmv3akEht53nLUmqrZwlfW7SmLcdYeZbraPe78S377ifSgwkEjl2isHJscnMKhSyFfsvVwClB9+EnsS5G6y2IvS47rzy5ZvY4vEWRcouQTUUxEI5UkKoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPPGQwc3PfT+C4VBhWiy0S/G7+Xy+TuZZ7wv5vN1sqA=;
 b=P6iMheR8TIgyiFRrjT1jyBDa2/knAmVv0c+dwruZf/2uRjXEDIOQGMWQBjnLA0faRF5jsc9YzKQN4jf60b6gFldF/wthZPDt79jX4QCweTS4YQ2VO3vjJpB4zLjXpj1VQC9GxMD+oaQlHrHpCes2m6x6jK+htlHR8ZMSnajigNLBuzRAvVOp43p+dh7f5sLvg8ZHPN1qm2y6ZW6w03cycioolVS2X3afy+GsSMX/NrtaGeYEI1e867FXGHJRovEacyr5ElIgTDfHnMIhij0dm0eLnI6V8wb4WtCqvWd/ftTHS6htfKbQA4exCVshOph2Q53VDKJmFnyfPNv8cIXKrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by AS5PR04MB9800.eurprd04.prod.outlook.com (2603:10a6:20b:677::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 09:51:39 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0202.023; Mon, 20 Jul 2026
 09:51:39 +0000
From: shengjiu.wang@oss.nxp.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: [PATCH 4/4] ASoC: fsl_easrc: expose individual DAIs per conversion context
Date: Mon, 20 Jul 2026 17:54:50 +0800
Message-Id: <20260720095450.1618747-5-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720095450.1618747-1-shengjiu.wang@oss.nxp.com>
References: <20260720095450.1618747-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0266.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::13) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|AS5PR04MB9800:EE_
X-MS-Office365-Filtering-Correlation-Id: 506eadd6-98c5-41f9-3a2d-08dee6447e8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|7416014|376014|10067099003|6133799003|56012099006|11063799006|921020|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/og1Ky46OeAYVgh+J4a/o5oktCC0sK6cKUx2xdym8ZovdVgp6qMVMCaOh0MPhnnu42d1ecRxJnxD2eFCyanjcIpjEAunTvc3INpgqCoisL+xFMlQPjyAgwwqSlqycKDcnuZBxJPJO3+ktmiNThMyiTxYhNWb9d8BKvuR0+TVzC/DdQgS34zRrLHBIyM6i2hkh4jk9IKyhkiv6Zstrmu1Taz7DyMZ3+FzbJbg9Q0iltWpy0ziTOazap9uT27B51j6DKXF/GligI5O3fKd0y+zbZdAZQuMq1bXO+Jyr/U7XHd5vQpSZzxk77LyLA7VYtZOo1iRb1H49REivH2+mxnf3zx9pFDAxS0euJXAzVp5+AooxyKTajYjx45bTM2zPXovAVQhnlhl7e7DIraa//VBfDLzwPVANuBynmd7+n7QuiZ45Q5yki1rHSQAIbyCEsgdn7VBrqMBeZvISDnTvkzAVSKDTFjPyp6RT+RuSxzotd/VOmEEEe0BkXVSB+gjyMCtqrfcdAVy4l3l+tNclChLJBfpfQqUrW92W0tZAfiyeRoxd7eaKbd+2xRKNKQNELNvMBHEIrfGDSHVFDml6O4DVjvYnU9Dk29JMQLVzgwZUb2CsTS3wdljYUD+SJzfwM91/BCOtipsIYIv9t398W8cn0C5+IlSVBSMn+nZs5wwg2SNms150FFeR0jhDoCKxOOqCC5aMdXENgqgtB95pIPWJg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(7416014)(376014)(10067099003)(6133799003)(56012099006)(11063799006)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L3whorcaQf9lOTRY8V9rt5b12FxQ58JUjc0SZ/3WHWPZJu+hiD6ur5erN0/o?=
 =?us-ascii?Q?8hgFhdl/2wkAbuSMbwr4mpOvxwWgxCo5iX7R5/K6kzFfhi554o30x3AlYp37?=
 =?us-ascii?Q?WnvwXlf1CVf5ok06SU+ebV73kZ6ANq6VrgJOt7Kh485ipklw52I4j4SkxxqE?=
 =?us-ascii?Q?BOcJpm9P33oyPLq1izO+cggET4advWun9HcfwdF2I3uA2zc8c7ltE8Jf0IMm?=
 =?us-ascii?Q?9ksiWzVdD0NS8FpKMrz1lPSP4H/BfwKMFH2ZuR9CyPXn89sZlPKhFiex37iV?=
 =?us-ascii?Q?Dvc+aRbYUkd+SzFeXHgsUx/cxf9kbUmedH2zBG2+rViIv3Se2PLvSWDbFcOu?=
 =?us-ascii?Q?fBNFLBEzOCFC/P3SkJ9vU7kMvadQ24ALICGbjYR2D23PgmxooymG9bpJbjeP?=
 =?us-ascii?Q?r3u4kLX+Oe93ivaG338qG1VaSxkDyzI1AIjhpF+AZ0njRnWRZe3NhvZpv50z?=
 =?us-ascii?Q?SNROis2WyvnVUhN08K65SQo6UPpTZOKV1kN0gJgk5E9jdP6sS8ReHuKi1EqH?=
 =?us-ascii?Q?8tYWW26Grs90Fy0nJSVnm4AmcaSvWen7a1cwzROneY0lRTTT8Uh4uPe54//T?=
 =?us-ascii?Q?/83Qm/kvLUOlbn3aeVJLMDqckkxuJQe/hjjHL+J6OJuks9vxOgsucRZEmOqD?=
 =?us-ascii?Q?8PFpqtZWfXCvcnPMTrO/GdzgafLmDdNOHb4Cdwnd4PtaTfihQi/KDWXiHMGl?=
 =?us-ascii?Q?M+wi2pAcfgdoLiAWgbATw+2SXUF8RSFzY2OsiAAeUmEL9Zdem6A7R6jRxZDB?=
 =?us-ascii?Q?K0XkXGmCYMkysMEjVq/uVw2RBbSamubw7OJJGXacqsFCpmbwsERj1jA63EoO?=
 =?us-ascii?Q?1V0RbB4fZ29sHqjF1Z0ndDPCs1m2crvwbBq/3xB27fgmx7jfsBY+er070Oq0?=
 =?us-ascii?Q?RHLGP5jRyBrOrYeuFtaSHu6/FtHIPG8GeI+THAtyozJDG6twb0p+z46GlZgl?=
 =?us-ascii?Q?qgQS5KtlhMaE9EShNn6A3yljwqC9mPRdRIhx3ICE+iZlguqJNWt5ylQ/1Pye?=
 =?us-ascii?Q?Ujc9QrWwbZK1je0dwFEeZPWeFidCq9gPUOMDhI8mECFOFIVLw0gP5vxZ2jTz?=
 =?us-ascii?Q?vBG8Tsfw89E2yUMg+NZqYDGVGqWmUlWpzH4t92pHXDxo//xvnH7eVWigQwXq?=
 =?us-ascii?Q?5N97qjhvaF0STaeyLLgs3QY1fRcbfKfTwlZ6FogXLbzX15bbkQvwQMF0P3vY?=
 =?us-ascii?Q?MyjljggN4JTa9utgprkpC1fUb6ABJxz9SBatAGuRuJYD64ycMP78lgI+I6QN?=
 =?us-ascii?Q?OwerPFAG8BNUETKZqATCNPmtSqvhw6vKxOJmYLHFa03fL7nt9gZPdd4oebmK?=
 =?us-ascii?Q?9O4adNJhJrbzQD6FJlUIbVKvd4GHg/EjntQWB82i/auhAJwDn+lj9wOA5iIE?=
 =?us-ascii?Q?PIFbkYbSbnpmN/ZaGb5E/5Hb4KsP6hFto99H6EyHu3XAterdS9399v/NHy3A?=
 =?us-ascii?Q?4CWh2qYsbLPnDOiB0jo+gS5O9z8miZ/bnkQUIZMABohnrOG/YdO6M79Oc40X?=
 =?us-ascii?Q?qqYQi6bCdLJcgrm8v7hcjht490is6pbwcJqppt8PDaQV3PwyZXVNZB5DQNTP?=
 =?us-ascii?Q?Xjwk9Fjft43nAfhYU5swFcCHkW6Yp2Z8vPFqE9BalUKfLXuXUqSS2vMdTINt?=
 =?us-ascii?Q?6eRnTVLcO1GnKUp0itzHhhUrYQjbZlq5XwcKG9aQ2pQSNLljSEdVdgLGuCJq?=
 =?us-ascii?Q?5q8dovrM4QayNRRyBp8oZsp+uLBTDTGhrjzLxO8yfVpo1UnGYZ14hD1AFzct?=
 =?us-ascii?Q?L8/to4sWsvZ0a84xtPsz1pq9c2tXI7zLtNnCpRnF45As+fD++VWI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 506eadd6-98c5-41f9-3a2d-08dee6447e8c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 09:51:39.2118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZYhzmz5MyW9O5cTSoTviKxoa9rls271pxlOOII0rndck87U8oJOrRnoOO+6GoTfZMWN0IancVbFAyKVlu6QBsZ/kxiCFypfawZhqYig/huhXAlvbBmxVzUMROvh2M9k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9800

From: Shengjiu Wang <shengjiu.wang@nxp.com>

The i.MX EASRC hardware supports four independent conversion contexts
(A, B, C, D). The driver previously registered a single DAI with generic
stream names "ASRC-Playback" and "ASRC-Capture", which prevents
individual contexts from being routed to separate audio paths
simultaneously.

Replace the single fsl_easrc_dai instance with an array of four DAI
drivers, one per context:

  ctxa -- ASRC-Playback / ASRC-Capture (backward compatible)
  ctxb -- ASRCB-Playback / ASRCB-Capture
  ctxc -- ASRCC-Playback / ASRCC-Capture
  ctxd -- ASRCD-Playback / ASRCD-Capture

Context A retains the original generic stream names to preserve backward
compatibility with existing machine drivers and board configurations.
Each DAI retains the same channel, rate and format capabilities as the
original, including IEC958 subframe support on the capture side. Update
the devm_snd_soc_register_component() call to register all four DAIs.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_easrc.c | 112 +++++++++++++++++++++++++++++++-------
 1 file changed, 92 insertions(+), 20 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index edfd943197a0..3c5303d9b9cf 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1600,27 +1600,99 @@ static const struct snd_soc_dai_ops fsl_easrc_dai_ops = {
 	.hw_free	= fsl_easrc_hw_free,
 };
 
-static struct snd_soc_dai_driver fsl_easrc_dai = {
-	.playback = {
-		.stream_name = "ASRC-Playback",
-		.channels_min = 1,
-		.channels_max = 32,
-		.rate_min = 8000,
-		.rate_max = 768000,
-		.rates = SNDRV_PCM_RATE_KNOT,
-		.formats = FSL_EASRC_FORMATS,
+static struct snd_soc_dai_driver fsl_easrc_dai[] = {
+	{
+		.name = "ctxa",
+		.playback = {
+			.stream_name = "ASRC-Playback",
+			.channels_min = 1,
+			.channels_max = 32,
+			.rate_min = 8000,
+			.rate_max = 768000,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = FSL_EASRC_FORMATS,
+		},
+		.capture = {
+			.stream_name = "ASRC-Capture",
+			.channels_min = 1,
+			.channels_max = 32,
+			.rate_min = 8000,
+			.rate_max = 768000,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = FSL_EASRC_FORMATS |
+				   SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE,
+		},
+		.ops = &fsl_easrc_dai_ops,
 	},
-	.capture = {
-		.stream_name = "ASRC-Capture",
-		.channels_min = 1,
-		.channels_max = 32,
-		.rate_min = 8000,
-		.rate_max = 768000,
-		.rates = SNDRV_PCM_RATE_KNOT,
-		.formats = FSL_EASRC_FORMATS |
-			   SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE,
+	{
+		.name = "ctxb",
+		.playback = {
+			.stream_name = "ASRCB-Playback",
+			.channels_min = 1,
+			.channels_max = 32,
+			.rate_min = 8000,
+			.rate_max = 768000,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = FSL_EASRC_FORMATS,
+		},
+		.capture = {
+			.stream_name = "ASRCB-Capture",
+			.channels_min = 1,
+			.channels_max = 32,
+			.rate_min = 8000,
+			.rate_max = 768000,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = FSL_EASRC_FORMATS |
+				   SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE,
+		},
+		.ops = &fsl_easrc_dai_ops,
+	},
+	{
+		.name = "ctxc",
+		.playback = {
+			.stream_name = "ASRCC-Playback",
+			.channels_min = 1,
+			.channels_max = 32,
+			.rate_min = 8000,
+			.rate_max = 768000,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = FSL_EASRC_FORMATS,
+		},
+		.capture = {
+			.stream_name = "ASRCC-Capture",
+			.channels_min = 1,
+			.channels_max = 32,
+			.rate_min = 8000,
+			.rate_max = 768000,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = FSL_EASRC_FORMATS |
+				   SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE,
+		},
+		.ops = &fsl_easrc_dai_ops,
+	},
+	{
+		.name = "ctxd",
+		.playback = {
+			.stream_name = "ASRCD-Playback",
+			.channels_min = 1,
+			.channels_max = 32,
+			.rate_min = 8000,
+			.rate_max = 768000,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = FSL_EASRC_FORMATS,
+		},
+		.capture = {
+			.stream_name = "ASRCD-Capture",
+			.channels_min = 1,
+			.channels_max = 32,
+			.rate_min = 8000,
+			.rate_max = 768000,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = FSL_EASRC_FORMATS |
+				   SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE,
+		},
+		.ops = &fsl_easrc_dai_ops,
 	},
-	.ops = &fsl_easrc_dai_ops,
 };
 
 static const struct snd_soc_component_driver fsl_easrc_component = {
@@ -2245,7 +2317,7 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 	regcache_cache_only(easrc->regmap, true);
 
 	ret = devm_snd_soc_register_component(dev, &fsl_easrc_component,
-					      &fsl_easrc_dai, 1);
+					      fsl_easrc_dai, ARRAY_SIZE(fsl_easrc_dai));
 	if (ret) {
 		dev_err(dev, "failed to register ASoC DAI\n");
 		goto err_pm_disable;
-- 
2.34.1

