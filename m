Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2083.outbound.protection.outlook.com [40.107.113.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD65136A
	for <imx@lists.linux.dev>; Wed, 19 Jun 2024 00:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718756404; cv=fail; b=dFVBYlc5jC4EhRODnkIKc14hL+Ny5HrgHSCJ5+dqkOucIHjEaw3iR1OnFTpd0bvrkYKDZdG51TVWkkiLZsW3JcUb4RULvTLZgKWOGPGqfRLFugpJFbKL8uiFE5pu5McQrYSz6rG6ZDpYsxFJv2kLjnoHl0PU24QkCfWteNR4HC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718756404; c=relaxed/simple;
	bh=zj7Jimic/OCmqYI3ZZcXQkEfbmKUdl1UJxICXnrcihE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=SVJSaNXn5Z1zM1qj5yxjsWhfBzqmGBFuAHiuz0DleRxl/rEy2GRDDkWQ/yFsEOHhC1op8oCkacY1seCbF4vArYjns2zRiGGgBMQGeFWNNSY2OW8DOJUMANiYqluI6y8iBiTlRnyjushhloO2gTxRG72iLy0L4bWQuivqWzp0nBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WxZ/U95a; arc=fail smtp.client-ip=40.107.113.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WxZ/U95a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1MRYBiqoLK96CFMllfftt6eT3OwhhzuSx4jFoCDXbzWHOaCkv4Nzi1N49Tszu5VfYUhWQA3AzYm3+Y3dwZF8fZ+TAsE1rfaPmVr8IF7pZtogIuqHJswG8k7g1Zow5dA26fadbKwDVYKPIrhCqbXoxt01dUPolR3ZkTeFFzfqVguRHG+HclaWHBk6QbNcqEVJhCU9G+Qq2bw9eMwHZENyIeJ+Z5fujqrkSFx8vkYWj7O//wklTaN5iiuQ96PIEdsm6d6e5ob7JpozLaqaGiwDnJIlcSqop+P8UhVus1w1QrxjcaEeP/NZc9wyxL0IQxbEXMjb5ZFrAuvT1GylmOIIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0jFt60dQe7vWPsbVc/vmXOegPcUfdy9YzPIcVCY9nE=;
 b=QMaKoHFOLJPb92QsWtRMuCBbtZ0me8J96ewNRsLDs9uTF8n7bWIoKHeAA2QW2WFSg9WsjYUxGEojEM5J2oI82Qic5Lq5mueOqazNbP+wich980ZQ+EdMlUBDJj9k30aLpuqvkTGxg1eEyUE1eKfA2HEbUXdIZrNn9MwbIZtnrS6n+Izk/2kLwDVDBPB/sq/Q35uv2X9ihZFJmMEyMWzb5TxR/9/o9nd4KKheetvKol5l/EpVxgl6sneAOjSxUBahbAU6mEiwyXD49TkhBnV2aeoQ+S3CM75+YJIDVyarVdWnhPNfUSEiVoKhGm1JIf6G3hSNrEYwYaXqpIQPqg/1XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0jFt60dQe7vWPsbVc/vmXOegPcUfdy9YzPIcVCY9nE=;
 b=WxZ/U95aoeD7Vbd81LINTOaPtrQA9qovMnjhhXtafQx4/vBdubIkAI5/GvZI3kBYUeKqpyZASvRy5fwr1eJ5suCAptLC0WDWN9zTLJKHECuihZWGvGoZj1vkhvoMFjlZQhEWE3AJPKleTPflsP/WIk1Ap8FvIASY3bK+fHuNL04=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11717.jpnprd01.prod.outlook.com
 (2603:1096:400:37d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 00:19:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 00:19:59 +0000
Message-ID: <87le31wzpt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v6 4/4] ASoC: Intel: sof_sdw: use playback/capture_only flags
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Banajit Goswami
 <bgoswami@quicinc.com>,	Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent
 Lu <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,	Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,	Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>,	Daniel Baluta <daniel.baluta@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,	Jaroslav Kysela <perex@perex.cz>,
	Jerome Brunet <jbrunet@baylibre.com>,	Jiawei Wang <me@jwang.link>,	Jonathan
 Corbet <corbet@lwn.net>,	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kevin Hilman <khilman@baylibre.com>,	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Vinod Koul
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: alsa-devel@alsa-project.org,
	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87r0ctwzr4.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0ctwzr4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Jun 2024 00:19:58 +0000
X-ClientProxiedBy: TYWPR01CA0036.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::23) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11717:EE_
X-MS-Office365-Filtering-Correlation-Id: 21ac47eb-591e-4d3a-4b59-08dc8ff58dc8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|366013|52116011|7416011|376011|1800799021|38350700011|921017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VrBv1+QFWB5/NhTErEsEpSwDyXzMwi6jRVkVo0NwSBhQ9hFkewG5RejK5T7U?=
 =?us-ascii?Q?OYis0m4UUFQoUCFH2Os5wGGkCLIhZGv7NAFTq+iI3ncIAjLF0gvsrO3dLMGJ?=
 =?us-ascii?Q?fH0RvK9/b4hOe5CTZnv6exIOEXwBJXK6x5mpkZUc4ewwaUsLPeXBYVn+vfPH?=
 =?us-ascii?Q?FLJuxF53U7RoFrgqX259ujNkvHBEdoU4vPYPsXvMLEhiY6DuLEzGyL2w4XbC?=
 =?us-ascii?Q?cnXmgpcq/8v2nSP0AT9iYsB3cHUN0BeFovk4zD4Go8LvNKWIueliIUjr+2Tb?=
 =?us-ascii?Q?sM+LiBT5h5Yj/L7WZ2u/pI6mkeXpCH0DztCAUY8aoEjLdfOfAnW95RiPCZW7?=
 =?us-ascii?Q?n9YFoiszVopEVpPBjriv5dvIddgEmPtCzZ9yhfXa6KCieEjDm50FaIl5xIBN?=
 =?us-ascii?Q?hnc4IUZhZMhGrhDnlEkExZUXORhE3CiXiKkd8N6Yagflcf3jV8Gw4VNaYY5p?=
 =?us-ascii?Q?Hfz+1nljXFOifgIYVGW2GhzmHgFzd3QNyVIzsChgzeQ5azYv15c2LLKpBy4N?=
 =?us-ascii?Q?5HSfqdHSnhl167mwtHCLZ/XFW6nXH0ej+GI1ceMw63zTazTMV0ViQWrbUpxE?=
 =?us-ascii?Q?8cJIqDhC0Z9wkEfr+ciTJuztWBCN73dEDI85moViNurTVLMFn0keBHGK1J0n?=
 =?us-ascii?Q?FrOMwgz9STWnlTJ1+ZVW+G+QMSYvBc5Wo0IID69T8G68ZrnaPUkXoln3K7T1?=
 =?us-ascii?Q?NrRcHdcUiQyvPEYyj7BQuUghkPmf8VIQDKjeXtYGihK2J7UQqEo9olJGXbgU?=
 =?us-ascii?Q?jtqlg5wwUqDLnj42x+EeSGBXSekcEEIGbg36ObV74NlItdTxZm+fwZYmA4DM?=
 =?us-ascii?Q?WauZyouv5Iyzs+XV2lodVRrcoYMHUlnZfyNEdP6z2KFfytU33CgV8+WSweuM?=
 =?us-ascii?Q?poGyTwh65YRSmgFuZOjSxJuEJZsyCrOulX/w0FAnmFxZ0kQMm776JWuUxv/l?=
 =?us-ascii?Q?BXOgW6QK0NfPQvvMtMs7kBsGMhYahKgnoenejf3dIODV72H9LfsljE4CTxvM?=
 =?us-ascii?Q?kRYTj2Dy/Q1fMZZXZXpTN0lvTokAFsPIjXRwK7ncWK0EvftaJ+gRf78W5aGz?=
 =?us-ascii?Q?v0fDEFbj9b6t2Qok+WE+YnjqIusbVDbUxBIlJkjCBhGDrlEOObEHFdbd7wYF?=
 =?us-ascii?Q?68RTY1he09mhODCYrS+pGT8LvIf4r2LhgTMf54DxObEp9lie3vlbDhXv1V48?=
 =?us-ascii?Q?2aSp1ZO02ld2HVnFVcNU3c8mPnMdEu5hTteeC8odmXYkhe5y0gvsDi/PSX9O?=
 =?us-ascii?Q?Ti0wMyVoKew/xfw/HbOYkvYyIJdWkZ3LwYj3Ptc4M2EJW3fuukg0OjvnZzHC?=
 =?us-ascii?Q?TTqKF1clk77F4y3dUu/sxElrEYNB0/1OfLFnkfl0iGZ1iEna86bBHQQPdpfX?=
 =?us-ascii?Q?uWPDQcXtfK8I0sOtUdmLy7Qq1UYi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(52116011)(7416011)(376011)(1800799021)(38350700011)(921017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h292Qvy1rQRvHbXDraBKeylKGyeZt4JzgxAIXqPXDuBpWC4jpLoH4FRn5RiP?=
 =?us-ascii?Q?czcfoNbR8MkkfFOtNY41mky2zlrJy2f5Y5JBHEwzA5SP9GxlSMnYajKKUoOZ?=
 =?us-ascii?Q?PartWJG4MosJKxKj2hGUgekRiugjrlQ/Ja8G0TUBoifgbzNIp1dZsbFOmO+q?=
 =?us-ascii?Q?bB6WwrAzY2edX8rd8xsRQWKTU3/qPKIuSRF4TsLMHEB6pYtvm0lO+qYXzYRU?=
 =?us-ascii?Q?Timz3bbnXDZMZITzI2v7dKODcTyNoeQ7dDQ3Y5SP/0l4Wai3EDJNJlHmr3iM?=
 =?us-ascii?Q?zPg4kku3BJlHUtditrBBfXDNwY1o99+eB4i1NTfrxbp4ZSFg6PmGMJqJKucv?=
 =?us-ascii?Q?1Z9XvPBz6iXwWrn8CDxebCgTY5w9K7BqdNx+ueX7lHbNRnCHI4lJegIlBOr9?=
 =?us-ascii?Q?VXzMVwBEpJjZG4f7OioSLM+yho+W1pU402qu7RVh0HpJjxZGszevUZiNwANF?=
 =?us-ascii?Q?ZacWYWAEAuG1mPGPS4KueI+rbS36jNSDqhbkjLe5U+/iyg4vCYa9T0jYXaJC?=
 =?us-ascii?Q?hxNvCbVW+SU0n/tf6Y15CtzLu6k60jDFNm/bSSG66zbIb7RR7G+qHK6VaWgX?=
 =?us-ascii?Q?ySqrchy9D1JUjQQWaEo/Vgn1jXWBT6ov9jk/Z7+QSo+XYJzz/PtD6KiR1Q8Y?=
 =?us-ascii?Q?Kpo5h1o9ezJVZzMSIWtAYGNhh6DVDxE4XVYLEKzCSGYuBpbtLHYZBX2z3Tv1?=
 =?us-ascii?Q?tQPXlW8IF99vF2LW9Dxxk7lNng8I3vhY4b1wyNw3IZsWHn8kLxjGAXwfAEGv?=
 =?us-ascii?Q?AMVg+e0/K7k0n2Om4Zkxkj4eZBYNWz0tq3VC810/frEo4XYQEr3BLjfVjwW1?=
 =?us-ascii?Q?3JGP1tTE2xbI6trfDim6/WiJ29+V9eJSF/xQ2m69AoP4+zH+b4gGryVjuHE9?=
 =?us-ascii?Q?9472k2ll1RqJ5VBQ0iaAHbRJEN9DgKAFafcCtU7Y13MhNuuuwNisuJU+I8Qf?=
 =?us-ascii?Q?m+Kkr4eq0ZKHm6TA5bm2BY7KhC+yVux5Tg8ndw/ijmTZ66V/DMLo19nQ1VBF?=
 =?us-ascii?Q?LEZWwLg4EqZdTvWSV2CZ1MEaL5XLdC65oREN4uh3ugEclyQhcpm2x8GwS3TA?=
 =?us-ascii?Q?nW2W7SD7abkhpUEwVuL0EtMDSrH7gs+dm5R3QGDUE2n5Z8AJqsdf3RPdWg+0?=
 =?us-ascii?Q?N90dp5+91JVPwr/0bqGn0BRpIl/6X8QRUnL/PFVnzgRWN6zRmufvAkjaG9CJ?=
 =?us-ascii?Q?xonSbCg/2KdZVZJAzzrZctByY7gvEisfk5rwIC/Wiz40y4wivVEHjrsfrAOP?=
 =?us-ascii?Q?JPhih1jPgQjLzfwfd/SCybPlMIlj9gUEEUFXvR70hw9ZZYDo6VfpEB6mdnGl?=
 =?us-ascii?Q?ihhxWWgcuYM7ZZxvHedqsL7ofWgmn+Zd+66bUdIwbPUf1QjOfBcqkNMQUkYh?=
 =?us-ascii?Q?fGO5YoL96GlrFzkoQR7KDpvFCmmctRd22Gs++Q8pehrA9U+tmj293lhAlgc2?=
 =?us-ascii?Q?Z0T2UUnrJBkOURknALf63gQmWk+KyE3YOS067dKJu5TknkTVAlArBPbPrK0y?=
 =?us-ascii?Q?hnWao0YoX35Foykxfq6uVljTLy32NsElCGpNv7XiaXAx55UDBMCDGaZOH0hL?=
 =?us-ascii?Q?SKbd3KXFCrOwPFLfxb79E1J5TVKlsuvYhdGtguyG4fa7YDkTYEhozEnIm1Gb?=
 =?us-ascii?Q?uiMWykLNGnCfQCBudk6otlo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ac47eb-591e-4d3a-4b59-08dc8ff58dc8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 00:19:59.0308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lp1iTOIzFgx4fdJNhSM8K/s9x5uoChAp+3XbSlWXagQyG6YAfR8T6lwIah1uV+ENpVjmAn2n7HgSrBV3f0bFaQLQD02U1Gbh8Z2YMUlI/IQivTwDXh7efThTHrpf30zm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11717

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Prepare for removal of dpcm_playback and dpcm_capture flags in
dailinks.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/boards/sof_sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index b646b32dd311..3d1171819865 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1271,8 +1271,8 @@ static void init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links
 	dai_links->num_cpus = cpus_num;
 	dai_links->codecs = codecs;
 	dai_links->num_codecs = codecs_num;
-	dai_links->dpcm_playback = playback;
-	dai_links->dpcm_capture = capture;
+	dai_links->playback_only = playback && !capture;
+	dai_links->capture_only = !playback && capture;
 	dai_links->init = init;
 	dai_links->ops = ops;
 }
-- 
2.43.0

