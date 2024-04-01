Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2121.outbound.protection.outlook.com [40.107.114.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5939338F
	for <imx@lists.linux.dev>; Mon,  1 Apr 2024 00:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711931451; cv=fail; b=RO/RiFCOlW/73FiYqinmcFJ0MQ2H6A1SjO++0seMs8o98hMa/c/bAtn6DKCkWGixFB8tKbtK6GdNgfXTTAY/Ct5IXTJaYDBU3rr4K0daqOXqC/MQLFHT5ghedn+9Q1pRGgv2ZFX/ZT2OZc1+Qqp1+wushFQBTbn6GMPRO6OKhsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711931451; c=relaxed/simple;
	bh=k4h/PoOk62pxaDjSieSsv/A95jwkgPCD9LsoO8EOQ4g=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=XNQiu4zRy1zkjlMCRSXm79mJIXpCTqEsB3B5QlCPUz1K/eo8AyvGU6zTP7O4b68xNz3aVqpCOniy60RZp/UP2u6boo8EGRAsYzRVHfEVr22t+8TTlpPjCZviCvXjrIhZHDXgocNrxu1IZjQu39fmsLlg/VNIJ72ADya9MTAlk7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DUoX4IcQ; arc=fail smtp.client-ip=40.107.114.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DUoX4IcQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5ggZCDySXxmQ+g1CPCbcbfxJnM3s0TuP6mt+OPz8UmDEJXdl68KciN4jdc+pGO0ymFObZynIF9E2og1zjpez9yxhCIiG+nfq0Af5pkScmmwj6bWW+ptOovgM781gUsDkoXMROrcNwJRJCXiSgrm8rECPxswp17Y//OFTm+2eKaiqc6TQVn/UQWhsjeGSr8A4SqUGow45AxbL8v8iaIPgEX+vyTkAD544RHtSvmUHb22qPHkc3uTJrrD7qGt3VQ1CExEuBPZEKwccAwsXI6PPxkVmFX/jVOqSLIdflzbhEVE6WNgW7XYjblWM77Eo70nnRoJTxiW6Avw+9D6XYogqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCIf78DfRZi1HpBCdp3ABqBxydUBtA/1mzGbWu+Nix8=;
 b=G2N9tVKnRgMUN8f/0OjTW0/jaURGe1F3wv2y7HCJmLYrrhUHRiCkJ9C8ThAxJI1AVKbfBKCGtg7PmzEh9tbA3boi3koZI64ZFJQPdgouLBgwHw5yMUmFRLhnxMDh4uQId0VGROL0Jd6SRvudjocZ0H5kolwe2in/OWehV2gEKlj9jPX8Ay2Onph/2gBQ7rmpqL3u1tXS1AQQJDLsL9XOCkfZ24wCoCumG/K8v/a3oFopAU52pSQLqLYSVU3BYQurhHQfHLJ4BxEhx8T+llTVuIN1/SCNn8NDyaGQjU67yuX6h969zTG0ShGKqNXx106Kyk/Gudfn7zqh5jot+JjqVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCIf78DfRZi1HpBCdp3ABqBxydUBtA/1mzGbWu+Nix8=;
 b=DUoX4IcQGGltpM8PJ1K/8sqoxhL6LBHeOzAtKuuZ6ZZmXRrh3y/YUt81RWG20xxtGPrKAbY33FqSujUmJZDSBxGQimibyGBvMJ8zEsgxo9Iy2roZcaH0UAi5C/bU7/4SN1HXHCoOxhbYCM3VTtCm8wPgnxBJoSKk+GgZe2HDxUQ=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8258.jpnprd01.prod.outlook.com
 (2603:1096:604:175::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 00:30:46 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 00:30:46 +0000
Message-ID: <87y19xudor.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,	Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Banajit Goswami
 <bgoswami@quicinc.com>,	Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent
 Lu <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,	Daniel Baluta
 <daniel.baluta@nxp.com>,	Hans de Goede <hdegoede@redhat.com>,	Jaroslav
 Kysela <perex@perex.cz>,	Jerome Brunet <jbrunet@baylibre.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Kevin Hilman <khilman@baylibre.com>,	Liam
 Girdwood <lgirdwood@gmail.com>,	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Trevor Wu
 <trevor.wu@mediatek.com>,	Vinod Koul <vkoul@kernel.org>,	Xiubo Li
 <Xiubo.Lee@gmail.com>,	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-sound@vger.kernel.org,	linux-stm32@st-md-mailman.stormreply.com
In-Reply-To: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 01/16] ASoC: soc-pcm.c: cleanup soc_get_playback_capture()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Apr 2024 00:30:45 +0000
X-ClientProxiedBy: TYCPR01CA0189.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8258:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1++s4R9u97+n/Mr8kfOOMjQb9dKueE+E0NX7YIKeZ9iiyD3O0Th7TX82KWdj8J+d3zTPn34EvuoEmrr14zHOSbxWnEEG1uCbKRecMhjndy2JyvoEk5kydjJud29fPSi2pvJp3+DneRZ6frFJk2ZjjyKkP0oLIuSTdig/UVhIgleuNLo5EWBFCqQlFB0ZJgtK3yAOlcK0y9L4w8I3kKsmK+x3p1PRc5uZ5g8WNu8eAEiqxaZUvdFB1JUNm1+dQnvQ8FvZlPdV9QTW80txYbRPPone1GCuV4Lgvd/e2TivuW4nPK3DkUCciep/kVC8GzoTn9ZHTl7DlPEoWu13MS5Op1cDnMzGNgzHQT5tJ++hUEA+AsIZ4bJVJq5FYKloaIchMG70ZArWAHPYUI6+QJQwS5adyKq7YBQo4DLt6JMgriAYK36EWI3IV/LA2MnhhZzaETABcmg4lebjh+RlqbKZScpH6NATxsAhnTA0QZcrEvXwpLwCjWaG4a2CPsS32wCjzLv0Hm7fXjxktFOGhT5KL7VewzNWK9oLu+6myhZX+JzACWUwB5v5cogHevhsT7s3k1HR3be5PXbydx5lGaafD30wxdLckIWv4rIPRsyKaIQimWtkB2wUOIfWbb0aRaqJBmhq6r9sPx4ifAwYM8zNl0rJtX3mI3TYKct76eZQtvE+U+w/uR37pvCGRPsOyT5dw9LgZnegO5yOlxDkZSxN17qCCmbL3NhTMmW+SFJt11c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(52116005)(1800799015)(366007)(921011)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?02+J29oLPUn8MFmdJAi8cF6GNO581O4JtP9vqCbTUZMM8sMEMti7GdewCDLT?=
 =?us-ascii?Q?3G0ByW8Pv0MD5zfGZrN3qagndVOXHWefs8BNr4REfEcIEWE+AKMechLdjJZa?=
 =?us-ascii?Q?NwaUmY+vBFWUehUWy/SJaRsGHiZW8P4avyKqNtRUEezV3yOpkg3BezO+66jI?=
 =?us-ascii?Q?iTgynZhK3zfSWqYPouXMoeEetYC8X5QUzRU298zHqQKXajZ1RgLQYuWltWDf?=
 =?us-ascii?Q?eGyCpC1gmdi0paUAP9cg2v3zd4ZG0eX5MDtWseP31uhxncHJDZ2J3ZkgfYUP?=
 =?us-ascii?Q?tCb7M55W/PQRXnXVsUfBiyvu/V8ScaCrc/3tpJk6FPIMeH4GwHeGqXt4Ddg9?=
 =?us-ascii?Q?h7gX45S8wISsKVGbfbWE6lH7D7fesRBL13/8+RoQr21sps9+WuUvDrwBPMnL?=
 =?us-ascii?Q?tm43RyemhL0OGzMqLcKkgfYiTv0spkHw0uoSuSdgosQLjxUZ5EIfoc0Zpid8?=
 =?us-ascii?Q?EsIZgAVAmZAIyUEfmTZ2YM8TdB4/Ti0F2k5jihk/hVlYIPMAz5y1k00yy3sw?=
 =?us-ascii?Q?KjBAE1kUjQiwmdqwaFeL1YXaGrkuxDG4oNoyc3zPChWmtEcR4bsMYk7/EpS9?=
 =?us-ascii?Q?dCc4/yUmDEyqI+HYU21iN/onGhogGXKZt6wcTscYpfzVHZigUTXE4w/0G7MT?=
 =?us-ascii?Q?9Hbl/fXLsh4+6Z3iVD5HfYTzPnzqZ3pkEupy5Sx+JR5xOezPdBWmXFZdsXUb?=
 =?us-ascii?Q?xBdZHSzKZZGDe+FRy+xkho3p9cdABKJKxgS8tnPKSDmnKBD6UyAKZvFQPrrb?=
 =?us-ascii?Q?z4NbniiMOfFqx0mNazbnC6RZ+M5T4wIR+T7kRwGvvzazczB2j7GRffFKJPSx?=
 =?us-ascii?Q?Np4EOZ26gSAWglktNx0/SYo7dUgYkFn04KautyktxqAAJX17m6JDaqEx0rhp?=
 =?us-ascii?Q?U2CU2/3IwwSiuSgyX+GFbSX7p/B1Ih/oNKsLzxmnNM/pWn0BCRX71L1YSKUE?=
 =?us-ascii?Q?EH+pXUWYF9zT8RWDiBwIm65myB452TIQ6o8sHxYU0e+eUu8uAVpfiojQW59/?=
 =?us-ascii?Q?IxhyFP0Q6VkHhU/YKjeU3MSjms61N/RE4aAG6ptXMETKc/M+zLGFwPKlxZrm?=
 =?us-ascii?Q?SEyeRAaSBXCSOIf8iaI1XKc1lHwMxhdNHrazpmxwUnOCSdpO/LMwHaLN8Zgx?=
 =?us-ascii?Q?yZ6SMQf9TbDNiloS5YY+xNRFrx7zMGptpFLzkYi0TGaIKH98QhnVktx4jIhA?=
 =?us-ascii?Q?7a+TZNVI/zdOYfOQr6dwAvRNj3tTgk8c5wle1arkXIDQU+My+uXkz3h4ukrb?=
 =?us-ascii?Q?IuFyYDQAchlPdmLQv7T5mQHmefXjTP92w/awkXgm1+BLPfx/PTOt3Bk3Tveu?=
 =?us-ascii?Q?fbV8k/t/xo5/uKD8JMCJZNWGFj8u3vrJE8AYIdX+UASwL4io2/lffEljfC6i?=
 =?us-ascii?Q?8+4VGtZD4W1WkMY18HdxS8wc6MKt1jNCEtyMWXCa98Rg3IvztH7TKCp7oBdM?=
 =?us-ascii?Q?jmTdo/hNqfZ+UY+GHKrSWInRDRvkV7MX+WkIYr+jU+k0z1rNDDwq15Ow2VH5?=
 =?us-ascii?Q?C1U3NMruNvcviTOdPzB1DfhzT5iLFxDOdUpvLrEiaIwaci2Q60Ocnb0notgS?=
 =?us-ascii?Q?A4Im+8bAL4WEqVbjCEj5duccQ5ruIq+uwSiLVOs9hXD8nOoKacW0rVqOYm94?=
 =?us-ascii?Q?QnThI3WBCSYTZladGHqT+YY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f42b437-b18d-4399-842a-08dc51e2f8bb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 00:30:46.1535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vfus/xBNnx+NyEc0EwsW4LQqsheEx4V4njsFwWryao2NFpe9I8OhNGDd7rgBw5Hpm6WWk+f1O8F9HR+cAppIWJiqpH6Jw2t3R6ptEvX7alDAQrcvUqhkqUtQDx1n5AVM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8258

Current soc_get_playback_capture() (A) is checking playback/capture
availability for DPCM (X) / Normal (Y) / Codec2Codec (Z) connections.

(A)	static int soc_get_playback_capture(...)
	{
		...
 ^		if (dai_link->dynamic || dai_link->no_pcm) {
 |			...
 |(a)			if (dai_link->dpcm_playback) {
 |				...
 | ^				for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 |(*)					...
 | v				}
 |				...
(X)			}
 |(b)			if (dai_link->dpcm_capture) {
 |				...
 | ^				for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 |(*)					...
 | v				}
 |				...
 v			}
		} else {
 ^ ^			/* Adapt stream for codec2codec links */
 |(Z)			int cpu_capture = ...
 | v			int cpu_playback = ...
(Y)
 | ^			for_each_rtd_ch_maps(rtd, i, ch_maps) {
 |(*)				...
 v v			}
		}
		...
	}

(*) part is checking each DAI's availability.

At first, (X) part is for DPCM, and it checks playback/capture
availability if dai_link has dpcm_playback/capture flag (a)(b).
But we are already using playback/capture_only flag for Normal (Y) and
Codec2Codec (Z). We can use this flags for DPCM too.

Before				After
	dpcm_playback = 1;	=>	/* no flags */
	dpcm_capture  = 1;

	dpcm_playback = 1;	=>	playback_only = 1;

	dpcm_capture  = 1;	=>	capture_only = 1;

	dpcm_playback = 0;	=>	error
	dpcm_capture  = 0;

This patch convert dpcm_ flags to _only flag, and dpcm_ flag will be
removed if all driver switched to _only flags.

Here, CPU <-> Codec relationship is like this

	DPCM
		[CPU/dummy]-[dummy/Codec]
		^^^^         ^^^^^
	Normal
		[CPU/Codec]
		^^^^^^^^^^^

DPCM   part (X) is checking only CPU       DAI, and
Normal part (Y) is checking both CPU/Codec DAI

Here, validation check on dummy DAI is always true,
Therefor we want to expand validation check to all cases.

One note here is that unfortunately DPCM BE Codec had been no validation
check before, but all cases validation check breaks compatibility on
some vender's devices. Thus this patch ignore it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 90 +++++++++++++++++++--------------------------
 1 file changed, 38 insertions(+), 52 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 77ee103b7cd1..8761ae8fc05f 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2793,7 +2793,12 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 				    int *playback, int *capture)
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
+	struct snd_soc_dai_link_ch_map *ch_maps;
 	struct snd_soc_dai *cpu_dai;
+	struct snd_soc_dai *codec_dai;
+	struct snd_soc_dai *dummy_dai = snd_soc_find_dai(&snd_soc_dummy_dlc);
+	int cpu_playback;
+	int cpu_capture;
 	int has_playback = 0;
 	int has_capture  = 0;
 	int i;
@@ -2803,65 +2808,46 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		return -EINVAL;
 	}
 
+	/* REMOVE ME */
 	if (dai_link->dynamic || dai_link->no_pcm) {
-		int stream;
-
-		if (dai_link->dpcm_playback) {
-			stream = SNDRV_PCM_STREAM_PLAYBACK;
-
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
-					has_playback = 1;
-					break;
-				}
-			}
-			if (!has_playback) {
-				dev_err(rtd->card->dev,
-					"No CPU DAIs support playback for stream %s\n",
-					dai_link->stream_name);
-				return -EINVAL;
-			}
+		if (dai_link->dpcm_playback && !dai_link->dpcm_capture)
+			dai_link->playback_only = 1;
+		if (!dai_link->dpcm_playback && dai_link->dpcm_capture)
+			dai_link->capture_only = 1;
+		if (!dai_link->dpcm_playback && !dai_link->dpcm_capture) {
+			dev_err(rtd->dev, "no dpcm_playback/capture are selected\n");
+			return -EINVAL;
 		}
-		if (dai_link->dpcm_capture) {
-			stream = SNDRV_PCM_STREAM_CAPTURE;
+	}
 
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
-					has_capture = 1;
-					break;
-				}
-			}
+	/* Adapt stream for codec2codec links */
+	cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
+	cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
 
-			if (!has_capture) {
-				dev_err(rtd->card->dev,
-					"No CPU DAIs support capture for stream %s\n",
-					dai_link->stream_name);
-				return -EINVAL;
-			}
-		}
-	} else {
-		struct snd_soc_dai_link_ch_map *ch_maps;
-		struct snd_soc_dai *codec_dai;
-
-		/* Adapt stream for codec2codec links */
-		int cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
-		int cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
+	/*
+	 * see
+	 *	soc.h :: [dai_link->ch_maps Image sample]
+	 */
+	for_each_rtd_ch_maps(rtd, i, ch_maps) {
+		cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
+		codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
 
 		/*
-		 * see
-		 *	soc.h :: [dai_link->ch_maps Image sample]
+		 * FIXME
+		 *
+		 * DPCM BE Codec has been no checked before.
+		 * It should be checked, but it breaks compatibility.
+		 * It ignores BE Codec here, so far.
 		 */
-		for_each_rtd_ch_maps(rtd, i, ch_maps) {
-			cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
-			codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
-
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
-				has_playback = 1;
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
-				has_capture = 1;
-		}
+		if (dai_link->no_pcm)
+			codec_dai = dummy_dai;
+
+		if (snd_soc_dai_stream_valid(cpu_dai,   cpu_playback) &&
+		    snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK))
+			has_playback = 1;
+		if (snd_soc_dai_stream_valid(cpu_dai,   cpu_capture) &&
+		    snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE))
+			has_capture = 1;
 	}
 
 	if (dai_link->playback_only)
-- 
2.25.1

