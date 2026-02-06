Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013043.outbound.protection.outlook.com [52.101.72.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF51247291
	for <imx@lists.linux.dev>; Fri,  6 Feb 2026 01:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770342455; cv=fail; b=JfCm1HD0P6Z0NfT0GdssEcbVi8DHgsFrcs9Wo04bdhh4Rll1+FHds6Yk2xRBjmPXA+IDkgWLxCvxlj2K2hhVy3yRNBf6kbHPJ5HCSjh8891ww7pp9EuNZ3bAAOMYDoaLFSuxhsuVYB0tzv9YNfqZu5tV81InkRxUUvDqDRgzkw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770342455; c=relaxed/simple;
	bh=r5AaE5twyHT/YcoSa+F5EAM9ic99n7N5stJe317CMUk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KzuRPuzZuIVTK32xONIt3Qs3e7DmTC121jK2GBNu8jUEWgAPd8hgDxXvayAAr0Oqi/5KCERNzuIr6RlJw656hh7YJVwUBTXlxn3ZSN5O03Ej6TfjRDU5FNuchYXOOafswqXImRgWl8aUJCm6IuxtfXeutv5k1O+GC/FD56zJfj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=K5nvC2fw; arc=fail smtp.client-ip=52.101.72.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="K5nvC2fw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCNGyTvj0pgOJP5jhpZQ+4/+9fRsSimOZn9BfXSnM3Kg8VrWuq4kzqN5OdTZ4FU9kuTXZBE6zjINnW+0336TxP0oLM20L8dpzLEk7KgK5YZnKXxwwzsboZg/2dh8WGOxn2IAG2SIXa6lRk9iwz/7sZcryAHBFvnwCROfGRcYkBbG66QU5c0+lt+LOrB1bgYbfPxYle7jvt3zClgbORZwci0c6ZpB8wxcmX6UhEQJP6Z8Da0hAeBzfZsHgRL93dUpWoxuHZUmMJaozn/a2gyJ5P/paz4/Sh9TV1YZY/GyPeihEmjdhIBnbOcxCiGyXLA266jAWfNgoc3gybZgs1grNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PS/YsKCnFag21cpRzwog9SXf9avOiRpKoHHLSrI2p8Q=;
 b=Cz7/KT3hbh+CBnthBEdHxlY8y+N4DsNkPbSuz/tOfZTWO6+ggZap1+MQ4Y6xrKpPEVCOoHC87Gtfo5M2t86uE1eQrduWakGJ7fj9QroBhpK6fHNsIjzJTMVyrtEcMLEYek6fYAqjpVjZIvlUosjvYarAdknJLDYtw/Qxewv+cOctwBKen4jjqLOgazZuI3BudttP2cZjcgSMfWCCYLiPal0jn9Z40ntznq3BuWBLu7I8zm11E1E7maT0HE8NGHFnKTBy3wilV+HBRyVXRjkpaITO5nLwM7v8k2LOxLG0ZD2qb9bPiqj3qAZ/JmNIxpZNjOGdVSiz4KssmogVfieMkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PS/YsKCnFag21cpRzwog9SXf9avOiRpKoHHLSrI2p8Q=;
 b=K5nvC2fw7ylNjpcfOFngKRRopcNaD1WIpR4qVvxl0i+qPFmAGDkOzfa1dds7Y8eak0CBa8NN5gGU0J7bow6N1oV1Mlwh58m+bPHAcoC+ElOkg9tUAdXqg0GcwVF8hbIug3/KZircfuEkxPHBy49u1zNOPAaQidCaamvtmKUjUhHBjzzeiJjIcTY6G3XRY3IiQf/BETvGG6q13DmnusRpVdAdPF6CEnfxeO9oe61iCk79PPmAyjMZwPHbGT7jOyizGG67qVE1BKINcnDHUdnhV4GsCC6qZ8IY6RpVVsI/48jpWobISoRM43TSIJ7AKKnmzfyrMQrWrwGLHTt6xwBeuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by VI0PR04MB12210.eurprd04.prod.outlook.com (2603:10a6:800:335::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 01:47:31 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.9564.014; Fri, 6 Feb 2026
 01:47:31 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
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
Subject: [PATCH v4 4/4] ASoC: fsl_asrc_dma: allocate memory from dma device
Date: Fri,  6 Feb 2026 09:48:05 +0800
Message-Id: <20260206014805.3897764-5-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260206014805.3897764-1-shengjiu.wang@nxp.com>
References: <20260206014805.3897764-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:4:197::22) To VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|VI0PR04MB12210:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f4d78ed-a2a1-457f-2d76-08de6521b138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P3PQh0E3ql56u8Z+LtgflGOQVPsEuFKLK8t8qyj0J2ZZWFm5Vt1LWABDv7gO?=
 =?us-ascii?Q?g0opI2rI7wHJ0FVlldzPD6F8eMviq9qm03y1yJrnv0/ilpLxtGZAiuTHDbVC?=
 =?us-ascii?Q?vea5bCi4y+2GsXYiPPuyEKXoOHb48oK9f00dBQEIlXETov+SbHKnrZdV+7GO?=
 =?us-ascii?Q?6qMHaNWfGLlvAgLFnTlngX2OHRKad7ThygKTOyqF+cvc5eyZZvDDPxtk12ym?=
 =?us-ascii?Q?mLK5EqOVsRcv0m8okE5VgwtyZegypUSqrAnkW2tPDIadM1/kqn+ikPJ3Kb6m?=
 =?us-ascii?Q?k5jcI++AmuG0pboWcm57uALapD15TPNCA+Jhx8eRQJqgE+B5xAcRHOg1kiHX?=
 =?us-ascii?Q?RCt7UQ8OoMLZvJU0X8MNDsrp9ZIZsq06VluCDwHzGZ5M9rokUVjNS3rCZQcp?=
 =?us-ascii?Q?0wm3BIuR3DKEpse7ToG90+inyymbeZYpGMTcsEcUuhdZdqQnBu3ZGk8Owias?=
 =?us-ascii?Q?LAJ2AHcALEJ+D1H8OqewTM+6Ul4S2ZQwQQZiBKUDVwKvepIa3zYQKUKJRUpu?=
 =?us-ascii?Q?I/DdAHxzcjcMrfnXu4aZawUV9JbmGGTZeMaVeg0aYUxnyM/Bn7Em+K8D2oLU?=
 =?us-ascii?Q?XzM+IxJRFq54v5pFYDd0N+WilmhV0NdT3sdcv4PMkwWrOt4n4Is2WhapHhNe?=
 =?us-ascii?Q?nggszfxoZzzXTW1xwZScpXqcHvbrIDwvKozEYwLrEDS4IK1Yx0Gxhb/+fNR6?=
 =?us-ascii?Q?ZygI0CM42an+IuTukHGt6hByYsZ1SGEq8SmA2Ihz5r9HNbCENhbxTe+VFLR9?=
 =?us-ascii?Q?J3Ugnvc9Ak+vTeO/iDfZgPCHzyccVOga+rWDTCwRjmoY3DhNwc5F0Qj46eyV?=
 =?us-ascii?Q?8V+0uzS5FT/74T3lSu0FJrftypJNqd+pLtMqLHECrWJbKi6xlTfbxOQe+83d?=
 =?us-ascii?Q?u2SrMlHUDNaxza92Pei1Mirdb07KPaiqHo1NlcLyRHvZa81duTVCjeT36xdn?=
 =?us-ascii?Q?2G0wJ8vCXfROGfkrxmjGCEz3hff0uUvYrXdJ0+BKZnKQZ7f72wgogb9gWBKx?=
 =?us-ascii?Q?CN+0gq7Z+L2VywTVeLBp/oMid5alsu6SCoDg8paxyCIz5TdTVwv0MTPxJaoz?=
 =?us-ascii?Q?ekgraBgM/b2lYNkuQ1RLX7/wqgucaFBtiWCOrkzPPAjr4cXtZ2reA8z5uzy5?=
 =?us-ascii?Q?u0GsOcDI9K53+gSoDIEheJVZaxOlZNrhL1yomRuXQ7anwtkGoBzjD1ORC2in?=
 =?us-ascii?Q?vEIsUmQ008gyawHEHh7Jyv+HXPjelD3x9VKRj4ghn2dQn7J+qs8samnjGNlb?=
 =?us-ascii?Q?qNJwB6UTew5dkzsgaO8EhHeWT04AB/IBpbWlHu7Y/93X54zSpKabuY4UtpVD?=
 =?us-ascii?Q?E8xGPkqhpz7EupC2wkqkMaiKnckmdwA4Tjd/AXlFpMVvixvhQcfoVbBlMDWS?=
 =?us-ascii?Q?vM69XjQGYgWqNt3r5VRUmswM1pbehxB7fofDH785Ll/3u0GTISqh6g/kA/h+?=
 =?us-ascii?Q?W1wlJYfAnsCEl98WieDQUkHumK2hJL43MEQGIhs2x7U79unFoiMSNdnmQHOq?=
 =?us-ascii?Q?Y4LjHNXOvvVPEhD1DPH/jS0Cfh+HFPFqVtFCW7XiYTI3/JDf30ijSRHO4ioz?=
 =?us-ascii?Q?rESsF98RmB0zPqi4BFNkvWTMUERcvOLnkpjFuEAhGL9jgWgEzIujVq5Oljm4?=
 =?us-ascii?Q?wM7ViOBtUReWOUfSGTqIEh2nzcc5PVfNH7QShsO/s23p?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6FFMGkndI5359mV/nOwiXAoosQy3brewmjT7Mkp+SevAdLzVpILEqJOfxicd?=
 =?us-ascii?Q?iFcMyKLa56JqQhopaxGVzQBx+e2eJ+B0NPj1pZJD0PH/IdIp0dlO/p/zHjvt?=
 =?us-ascii?Q?0QdTzUUnhX+VNBo0rwHO1MuBw6HBI3ICyCqVpdAMzX5jtWEjKliHXlPEeuGh?=
 =?us-ascii?Q?/mPz5LhUw+r0oI5iXVsK2UFpwO7ksU3LckiqIEoRazXaxsxk4UU7aUiJIHN4?=
 =?us-ascii?Q?G1Ad7U2rCISflH9weNeaVlsQyglBXTbyLBXpT1BvJMvx8q6AXYlgLLFF9vEp?=
 =?us-ascii?Q?nzQDE44WIhmf0s7Mp7+Pf7MINg4i8mNy+hlsFaZpTTHrpFOhptMBTmcyFjth?=
 =?us-ascii?Q?bw1NG2/1CiZvawKwyjTVBS6xOqXgXMM/AZH7CMbx+6eLEv1YC+p5H8vxWrCM?=
 =?us-ascii?Q?ysHv88zGlSjTiew7tYONbwcmARdcsPdw8YvIFpD4zDE9PAgt/soKcj9k4jDz?=
 =?us-ascii?Q?O4+RN/3Dd0eNHYY5xdoVcVaPbRPQFMb3i6IOv8waKGL7DAY6PTzu0PnzZG8D?=
 =?us-ascii?Q?B8ojdrepg7A32F5PJDgTrZQmYNJfsBCH98xl97edWLPi0k1eov0o7Kw9HAxu?=
 =?us-ascii?Q?3ZTElCbpR9DF3NmUnEBuThWkTuvDg9554fcAD6eedEKih0tmTII6XAEVJcTh?=
 =?us-ascii?Q?mo3FJkUUuagSurK38YhJDa4mCnfM0DfKMoUNpaLKkrX4Zqm30GcgsvyD+Tnr?=
 =?us-ascii?Q?YKi2+2lxB0UD/O+22ytXwNP7By8WpCUWKX8oIeq6op/p/4b/5u4PrZkFe8s5?=
 =?us-ascii?Q?uceQQhB86x6rSY0Gqq5zFazrPrfkxJBhmnokbmuz92LYBdtaOwx0fiaWxau0?=
 =?us-ascii?Q?33Z0eiJ6Vp7g00XDhUVI8D1JJ+neoiTeThfa0uIlBZ+L0TMNlc7uDbkbGqfB?=
 =?us-ascii?Q?tEUDnjz6ghvah+YsfH2OaoKELNFF/VFPtV/NaXoHMbmO+3lDr/ktDv+lLWcz?=
 =?us-ascii?Q?AHHRqlgGn2CExRcxtNhM74zvicJ/xj7r2a4PduN01O7DmT0Mk+hWmmdnze3v?=
 =?us-ascii?Q?GzBBQjr6dblKtZBcuutPL/3vXa/oFRIc2yrh/KHkYBUR+zD0MyWsz6c7342b?=
 =?us-ascii?Q?tUZ2OtD0GPIhasIO5CMkGvLqYw7IrOVhekvHXPy6x+CiORUZRGujqbAssly3?=
 =?us-ascii?Q?YkTckYxZS4vlMSyU5lUNS3jhyjc68Woo++9KmWD5FTlpF0HxopylBHy0/MlX?=
 =?us-ascii?Q?xsK3nmmOq4sY+m4KO8IgofDw4NoI8TiQjlCJlFMS3MT5Uojt2e40ETrWjMV3?=
 =?us-ascii?Q?9BxWaq1jR9ND0dhxHnER+ScS0EtwGWojYzdSbE29OwvaO/ZJkolq6QoPyxd9?=
 =?us-ascii?Q?mq1ZyHswyR3BNgjAMSu6H5mm6ch1Bnh654v9tVnc88dsqSulVxrovybad/IH?=
 =?us-ascii?Q?DyjHTIfu04PKTM7hFNamVLUFWycheWAw7NoeJ28ezPwL4bDX7XorwSWdrFOo?=
 =?us-ascii?Q?vEBUvbLxm9hotFJo3onLAfM4eTkJPBCTEXF0+0Fmegk8Ks+xG00LW9b2aJpu?=
 =?us-ascii?Q?ogTR2Rhy4Tn8fxySpSCNj1KOXuzm/hnhTlXql6pB8FFGBikCI0PTdUMKBL1/?=
 =?us-ascii?Q?p3q8k0zYrI+LcUKx7hYnyvfAMgWQBf1eM6IlWbtX9GuyvL9iODe9QNQtKFJg?=
 =?us-ascii?Q?azufBjLWuAMRbC9fTEhdUFua276NO8ds/8qAYRTTf2+g6Pj9SxPq1SENxRXf?=
 =?us-ascii?Q?ROyAg8JbcoePuLdPH6YESvi6ysF3FVrEK17TAE8UPo/mHfBGLVjJoHjfBPDQ?=
 =?us-ascii?Q?/CxKeEWVIg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f4d78ed-a2a1-457f-2d76-08de6521b138
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 01:47:31.7443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N5Zw+0hVPEh+wroXdr/oTGrSMOVXf7yIEQeXOwFcpdxEhrH03mN67BvsohfMOvzMvmyBVFQ/+iEG/Ud9jOwHEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12210

The dma-coherent property is used to indicate a device is capable of
coherent DMA operations. On i.MX952, one of EDMA devices support such
feature, in order to support the EDMA device, the memory needs to be
allocated from the DMA device.

Make this driver to support both non dma-coherent and dma-coherent dma
engine.

Remove dma coerce_mask_and coherent() because DMA provider already set it
according to its capability.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 sound/soc/fsl/fsl_asrc_dma.c | 48 ++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 7dacc06b2f02..348b0aabfa68 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -449,18 +449,52 @@ fsl_asrc_dma_pcm_pointer(struct snd_soc_component *component,
 static int fsl_asrc_dma_pcm_new(struct snd_soc_component *component,
 				struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_card *card = rtd->card->snd_card;
+	struct device *dev = component->dev;
+	struct fsl_asrc *asrc = dev_get_drvdata(dev);
+	struct fsl_asrc_pair *pair;
 	struct snd_pcm *pcm = rtd->pcm;
+	struct dma_chan *chan;
 	int ret;
 
-	ret = dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
-	if (ret) {
-		dev_err(card->dev, "failed to set DMA mask\n");
-		return ret;
+	pair = kzalloc(size_add(sizeof(*pair), asrc->pair_priv_size), GFP_KERNEL);
+	if (!pair)
+		return -ENOMEM;
+
+	pair->asrc = asrc;
+	pair->private = (void *)pair + sizeof(struct fsl_asrc_pair);
+
+	/* Request a pair, which will be released later.
+	 * Request pair function needs channel num as input, for this
+	 * pair, we just request "1" channel temporarily.
+	 */
+	ret = asrc->request_pair(1, pair);
+	if (ret < 0) {
+		dev_err(dev, "failed to request asrc pair\n");
+		goto req_pair_err;
+	}
+
+	/* Request a dma channel, which will be released later. */
+	chan = asrc->get_dma_channel(pair, IN);
+	if (!chan) {
+		dev_err(dev, "failed to get dma channel\n");
+		ret = -EINVAL;
+		goto dma_chan_err;
 	}
 
-	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
-					    card->dev, FSL_ASRC_DMABUF_SIZE);
+	ret = snd_pcm_set_fixed_buffer_all(pcm,
+					   SNDRV_DMA_TYPE_DEV,
+					   chan->device->dev,
+					   FSL_ASRC_DMABUF_SIZE);
+
+	dma_release_channel(chan);
+
+dma_chan_err:
+	asrc->release_pair(pair);
+
+req_pair_err:
+	kfree(pair);
+
+	return ret;
 }
 
 struct snd_soc_component_driver fsl_asrc_component = {
-- 
2.34.1

