Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794821885;
	b=X/2YA4OoMgIPG0PiaB5/N+fTqF+cGn8VRpcTTvjTt0tiy2wCMV9mYxFwcNw53bgFp7gS
	 Bsdnea4SmRLeSf4EPqzg4GQdWncPhUuYHCgV/mUFyOzjw3tFRMTgXBhoqUScFUPr8yaDN
	 cYYXIY/OYPIbTiJCeMzgdUkMUSPmmFIEdsBSdCMs+ARy8aYtr+sVlhIu50R5U7NQ8AY6y
	 8pK6uVXFE5kkAyRVe4PGteqetx/zxX8mfxqn+5nUVM65y/cUG8UaA6R1EP+4kJLUUb930
	 E6F0g4xhc2H/MYn9yv0PxacWfw5QLESBX6OhnRLmXbL0wmbQi3o14LTPjdscESsM2uA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821885;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=BawadLs7HUVGKozKsbFu9Gs70JPVAwiLlRprqTdzrtY=;
	b=cb2Ude1L0/0C4gR/51V2rQLS1FVPPl4KT9FwNjgzY7eb2w6ljesQj/5TrW+FifLqta0v
	 YrqKTtVaTYPOzmek4D1xlPdvOU6W4YnCIcaYtdwPlSlLj/svYcDf8dEcWVAq4TTJgSHSH
	 CcMcVnafMP85hGwk7wL1zbFjLitCMDQsYQdW9E/Sd31NyEGvvrbHTqYqvTHbuJyU6cmW9
	 mMnTSK9hJZwxmh0/rnpdIPDBA17QFgWs3Su0+xnIgca5un4OBdF9JLa+hUu99km5I65o+
	 5WPzNrP6HrdFfNQJPPKevPre+wI2yCdOea/xjX9ZTyb4NieGFCR3kIoJmYO8dFEDVhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=VeEqMLDc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.14
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011014.outbound.protection.outlook.com [40.107.130.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACC0606A31C
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 09:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ACC0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=VeEqMLDc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBDuoDcLMrwWyzmE9ZLr1oMdTYHWmaCLh/M2KTmbeSHBjky4G+8ojmxBResYLeHDBGmJ6in1uRqB8ZHKTV+yRTs07XvmelhdZCka14xGQgq+lvWpAATb6Qnvp1SfhnQQ/WIeZu6J+DzTY90iey4T9/0wK5teeWDCNzMwpBPMItSVTfOYArzW94xTdy68S8kmGHwVypbgpHMuNeA72bxvHL3PlWAvYubgWa40IVUe3Jkz+75RHaFXdV9N50cMJ58GVG9bBqrhaAwMUMUCvNZBsOPyb4+OmWCH1RvunDFoHidWSXRYm9PpTOHGv+GycAfIJ/pSJh4NU7rJ5SZbEoRBpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BawadLs7HUVGKozKsbFu9Gs70JPVAwiLlRprqTdzrtY=;
 b=aDDc1PgnplawowO2o8xljKqzdeQSBXukI5qbRjqmd3Rh/RcoP5E/7Y5b/x6y432CKzgSjF+1V02M02BR8vh0H1FcPVFh/5UsxZWDcT3yxC6Itq+HONxOJeUilKxhF41E3OSYDWGZPuxwzPASmGbyh4CwmwtJLGDGDsGtYWr7SeJuV+d++RBQU2VLk6etudRInxHd7xMw7Y7kKXK/GAz/6e5mVUsEpyIls5UI4n/dMuon2wryVu0Qq/t+zrwDLxEB54tQ1aJdMmqYQHs08HHKpmjvomtHzuQk7xKEeHWaT78rqMTCG+x5j47PkNydo2vigeBrtWQx1N+YD04iYweRNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BawadLs7HUVGKozKsbFu9Gs70JPVAwiLlRprqTdzrtY=;
 b=VeEqMLDccSbpCu3CSbmA/DAmNYrXLLJh0GAb2RDv4G+CAsXx6CqssGvpveRVxN7vG6LJRHggJm6Suporf/mdZAtn+Sn+9oLIoLUf5Z065LjL3nybnaNtY0oQCGolaH7ZYPLs2We6iZQK+0NAEXQf+QZGpbvVDEsAGETgV0I35CAUGDUT0LgGWW+ZiFvwv/Qpz8RGRCgToDRSk9RM9TO5xzdHLw4WhY1PQV0h2tZq8yp5o1h5OlleiptN8k4+plpGl5Y1M/TaZLb2YGqRW9D/exK40mRioEWiL7p4Jk1BbGVhsKtiPgREByrsXZL1ob8x3ncJ3FT5f+/C6PqlB9rHYg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com (2603:10a6:20b:23::20)
 by AS5PR04MB9853.eurprd04.prod.outlook.com (2603:10a6:20b:672::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:38:02 +0000
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0]) by AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 09:38:02 +0000
From: Stefan Ghetu <stefan.ghetu@nxp.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org
Cc: imx@lists.linux.dev,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Stefan Ghetu <stefan.ghetu@nxp.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH v2 4/5] ASoC: fsl_easrc: fix context ownership on repeated hw_params
Date: Mon, 16 Nov 2026 11:37:50 +0200
Message-ID: <20261116093751.138455-5-stefan.ghetu@nxp.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116093751.138455-1-stefan.ghetu@nxp.com>
References: <20261116093751.138455-1-stefan.ghetu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0021.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::6) To AM6PR04MB4472.eurprd04.prod.outlook.com
 (2603:10a6:20b:23::20)
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
X-MS-TrafficTypeDiagnostic: AM6PR04MB4472:EE_|AS5PR04MB9853:EE_
X-MS-Office365-Filtering-Correlation-Id: 36377499-873a-476f-d64d-08df43c54ee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|23010399003|22082099003|18002099003|260925021911599003|260925021311599003|260925022911599003|261009223027099003|261022105027099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|5023799004|56012099006|11063799006|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	9iCxX65yWMvgYhr1Kseu1C3MIkKvs968PtPxF9hDFRCApwy/XdU6YoNoee/pTtHTYcCTjapWsAWfObYuaQv+tiYxEGMBHhC57HaW/TgFurngA9Dqq4KQY8/PgnFBBWTV8lvYlgMX94k7PcyJMYKGJesLxFld3IvQDXj9jq2e4SWNGcbrv1dGxqMNcN07EhHoGaRb8FB6yNU8aqtD/QGsctuawyOhatJQq6W/UL2YZ62NyiCZk7jCTUPVtRwPECenWmFoHWbmbW2NsRHjgfqRGnfHAiT+yuvQbIcHmqB590EGJJKjSxDLRwUgcDgWIS++IHqGdoVHlSSy8NFMFPHnsKrYhHsajkjrzXl72zcody6yMLtWjwHNcJ1UGNi3CfF/xgT3LAK+D1tyfX8Oxrm/vaY98RkWXZJ87WY8ev1b6lmTBFDQ1zkZNUpiB8AjtLWyIpEldRBcS3dcnR0LigjqXIoroSNzUSFo2/9HD8dBzgGwLuL8rEuBGlGCy7KBe0S5dmGtDQ0RSsXaRDg91/gDgCAyaf8I/mhUta6bP0GNGbkOPiE7GMkC1i5CmKfdWsMCUYoqvRsikvWxTQP2WpFxMknwYPwaCVJV65Psx56yU+jNv1Y/pOe8tIu4erWHJEW3+vDOpK0LPZBCESjz+L/QJpVzDAkI9cKpdaexX0LhmIo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4472.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(23010399003)(22082099003)(18002099003)(260925021911599003)(260925021311599003)(260925022911599003)(261009223027099003)(261022105027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(5023799004)(56012099006)(11063799006)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OoHL3Vt0ylR+ErUxJrOauT68ob8hn93kH+FT9ta96l+lKQelHvdbmCq30zl2?=
 =?us-ascii?Q?rVGuM2Hy3tISSQlP0DD5yINCNmwD+qV+UphTYzKLp1Q/DJMXp173LodT9yhc?=
 =?us-ascii?Q?cwvTgFpvGX2Z47zEPybehJvKBGs2qMZ0kPOxa9fGkYdjW5iImRuvbdOXK/cR?=
 =?us-ascii?Q?ijR+Yt9QdWBnOHOZZrFcVn4oLe8I5XX6izB51stb2LEktgX6Zy0dtDbVZczm?=
 =?us-ascii?Q?KBy72ZI9vonIOTD19QVANBuWURu+zOM85g140hp8pb2vfxK66uPtyigu7NJ1?=
 =?us-ascii?Q?ynWB02J3MwPtgE33AGtNHrchwNbY6tNj6zG2sisSEvYNPjcUwT1hu4rRjTZV?=
 =?us-ascii?Q?0CAoGJ1Xf7QexFmikPukNouWcqDa4SGHIjo/+KpYPDMuosgSyxbVwf9jRYPm?=
 =?us-ascii?Q?81PFr+DbaKEWS4z4gg0ZjgzZbvw3f0grPlHs8z+qenC1uwjH5TyJ/WBDGyA4?=
 =?us-ascii?Q?se2m5zAO/ZVSYcEzvbt00CCQNFKGUnKsmoQ/xOPVidpcHbPqTIerZH1Vff5m?=
 =?us-ascii?Q?GWR2BZDgbmVt2ObPBcY5/UnC/OmrsDBUjWxn09bHDN6kIc3LFfPBmoxWXzW/?=
 =?us-ascii?Q?o5K/9opxJ/9EZSQspoO39tpToUeojcTJQmCSyyEzduqWlPS1MWnfvezb53PY?=
 =?us-ascii?Q?8qfNsi7aYk5wlctIeFEeeexRZ/goOU1sFJ/G7T17DMuNxrh3xsxy6hHloJKR?=
 =?us-ascii?Q?Irn9maZsAAPft69FGb1FFpU2NWIidNBmXuQRCDU/mpue14FLQ1HDzLSd/nnA?=
 =?us-ascii?Q?4vKhogYXq3K+2czua4XXOiJS5lYgdIttqqVPDT3xOLQr74bBRpr2PUbXZyV1?=
 =?us-ascii?Q?LIOoESh/7VrlrYpfMGBOzhNc0zCHnHHOpGiJxQYWOkXtJfSzLdoAgqa6DEzV?=
 =?us-ascii?Q?BwLAxQnUVYldlf/INKG4UdAMXUIQuTzkoVZUlrb1GU8A10ve7u3AXc/iLYaZ?=
 =?us-ascii?Q?JAxBXGmaVrj6YuDrFSFtlmFQEBz6CKhsywVUXfobR5BANJYjLCoIaEnw8zgd?=
 =?us-ascii?Q?+lZvPbDA3jH9DaE6VVZUoqlM31iFTuT5iDOPdF6pgwJp6nsm6KNtNSF5Tdzk?=
 =?us-ascii?Q?YJVkokMW0uTkLaqy2AF9bCQ5Hku+QqZaYohVaCGZax3cHccnQmcF4zVhSzOG?=
 =?us-ascii?Q?rQHgvi36iZpH5rftkhFjnwhvSiZwKJt/6BATLXrvYAAEo+W4PKu+sdsylY0V?=
 =?us-ascii?Q?/UFnwgu5subm8PTK79ar3cEnn575/xx21Hn3L8vkBcDSloGpGLVTSF3ET+Zl?=
 =?us-ascii?Q?m66bSNYOHox02/JgeXDnDSmthwJgIElSBW0gWIdD2L8HwjFMP5R5GrpNy3zd?=
 =?us-ascii?Q?OFVoLa1iePwYkeUTGQLKIvo20982X6UYd5/PlfHD8YCSIOeQisZ1ML31z+7D?=
 =?us-ascii?Q?rylFNd4zuY/WgprLKOyBVzst87k69nTlliAodWSwZFxLf6vSH2WjwfyKKgrr?=
 =?us-ascii?Q?OfMRBvoZhD64xYueFga2nWgbTtSFMMvF/j83tZUL/nmxlE1kAROfsJ1ZLiTn?=
 =?us-ascii?Q?NUl6AKSbOjJ/hjI0n9VFAoB2t47qQ4ZgbYXweEzvLh5jOdFzDQerWG7g1kqO?=
 =?us-ascii?Q?7NaRsBIW15e6NBXGlw9QT9cKm+Skexk8p41La4stkLLPx/aJPdfq6k8IgvOO?=
 =?us-ascii?Q?5ip8CC1Yheq/LRguDgXu2NWqiAqxRn+cyTbiCqJeW8wbtpjY+Vq1Vo+/h2pB?=
 =?us-ascii?Q?GNu0bvwRZ5kPY5mYHu0MsSmQX9POLl4cCTUhHl58v+tt8zljXlA0pJ6/SS4x?=
 =?us-ascii?Q?voSpwVny5A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36377499-873a-476f-d64d-08df43c54ee1
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4472.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:38:02.2083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qjed6az+sgAD0uxH3nFNZ1Ir0o0iXXUETdlHWC+UdpUviApCO2phxWNAtRsO1ZvaghtpwL4bqqGnxpx8a+pDdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9853

hw_params() can be called again without hw_free() in between.
fsl_easrc_hw_params() then requests a second context while the stream
still owns the first one, which is never released. After close, that
easrc->pair[] entry points to freed memory and is dereferenced by
fsl_easrc_runtime_resume() on the next open.

The EASRC slots depend on the number of channels, so release the owned
context before requesting a new one, and make
fsl_easrc_release_context() ignore a context it does not own.

Fixes: 955ac624058f ("ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers")
Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>
---
 sound/soc/fsl/fsl_easrc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index 5c5002537951..b7a429170794 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1347,6 +1347,10 @@ static void fsl_easrc_release_context(struct fsl_asrc_pair *ctx)
 
 	guard(spinlock_irqsave)(&easrc->lock);
 
+	/* Nothing to release if the context is not owned by @ctx */
+	if (easrc->pair[ctx->index] != ctx)
+		return;
+
 	fsl_easrc_release_slot(easrc, ctx->index);
 
 	easrc->channel_avail += ctx->channels;
@@ -1500,6 +1504,12 @@ static int fsl_easrc_hw_params(struct snd_pcm_substream *substream,
 	snd_pcm_format_t format = params_format(params);
 	int ret;
 
+	/* hw_params() may be called again without hw_free() in between */
+	if (ctx_priv->ctx_streams & BIT(substream->stream)) {
+		ctx_priv->ctx_streams &= ~BIT(substream->stream);
+		fsl_easrc_release_context(ctx);
+	}
+
 	ret = fsl_easrc_request_context(channels, ctx);
 	if (ret) {
 		dev_err(dev, "failed to request context\n");
-- 
2.53.0

