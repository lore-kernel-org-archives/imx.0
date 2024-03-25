Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2083.outbound.protection.outlook.com [40.107.113.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE6E1C1392
	for <imx@lists.linux.dev>; Mon, 25 Mar 2024 04:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711341417; cv=fail; b=iNurpDrUT3vtejzleHjtS3NxyiFc3vOhOWaS9AW2Qj/59zMGmZxk8wErI8Kkbb2lLLS/EEDene6vTS/MlEFKSchCOl3iZPEVDa85v9f0BKw/7A51f3bpo7OHnFe3yoxgSlPBjiF6FR0AvyiPT2EFaf2G8tUzNtFxA0NHo2Qn4hs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711341417; c=relaxed/simple;
	bh=XfQ/Gf0iqHN0LHI/gSaZgk1OmFdidkxU6r9s3zicDOw=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=Rks0OYQnVmyGfNdjtnLs3j7+PqvrGSnrFpVZsnfjUuBiVPQusAl/cgRPxE1EAIrUFSepIOrrsm0ZPTZ6t+6UBJXuyjl35QF491DARO86HA9ZT6LCPqZPSufAehw1doRIFFbppy4L+14s5rxijNO88gFhMAXslkI8BV8zIMbiomM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=miNa/B83; arc=fail smtp.client-ip=40.107.113.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="miNa/B83"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dgXCuFsBfyLRtzdwjgpSk3F+C/9KlFkfyYxQor/XODwmGXz0Jyhv8BlJTmUuv74aGcOZ8UpW+FmgJ0l86xvCZ7regxBpvsrGOshnB9bvA2SOBX8lu9PaJw+OvQjHs92n1xtRHujI7fWcsN7hHtlBAzybYL3LzBcAv3bwoCP0I3ePir00xN+lV+zhRtDITJs1TDMpoqEmcGOdHfzDUTODDBLm4WNHQ7gmTLQ9kkxRNCMEFv1joAYb79aH76NAogPKanCh0w8uzuZsevoUmk/SnrZSdWLVRcnfWR2ErcF3cDjJsaE7pJkBcQlCn5bEsC3jZDmIP+GskNVXHfBozOlJNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7P5eVuTinS4Z/q4ZEULSNv9I1XS5DDdnlX1GbB3ufI=;
 b=RPjZ9IMynhuha5FF+FzB2Ier0WhKIiRY+kHvR4r575UOJuKRdqIXdlHLw297nWBPgdeAjr3pNU8nHK5xveHdrP9xURTANJCFv69RdU1h+g75b9aVIdPm/ZTjT3G3hXqd25XnyHG+6OuKHuvJNdrzQ6nj5E6xpTFR6VmMkfR06cIB0eQmiGG+b7WKhBOvkcF4/p8ZDJfmxwAG2MViQVQwhw30L9qGP3mgugRst4auUwaXVoxBTxU5YdQxOsUryY0Q6gIWJciTNC+BrOKT7hzLh6LFgiXvTp1bOnadCaL9c0/RpSPa905I7iy1lBA0LIzcZDiufM7SzIe9USZRupeo2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7P5eVuTinS4Z/q4ZEULSNv9I1XS5DDdnlX1GbB3ufI=;
 b=miNa/B83idLmWj0iklDJwN5brvuqWg+3lH3kBmMFkTQadaFdivIAHSMSriAb55cKTkaWn8MLGmeU4Z97EKe2m+01KKY2aGMltpPE9eI9278XmWRs5TbGK60RYgGzZb3bBTI/bRY/XjcxzDvoPxEbG9on+7NkBkGJbs6mgdcBwj4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10698.jpnprd01.prod.outlook.com
 (2603:1096:400:296::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 04:36:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 04:36:53 +0000
Message-ID: <87edbz53mj.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/15] ASoC: samsung: replace dpcm_playback/capture to playback/capture_only
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 25 Mar 2024 04:36:52 +0000
X-ClientProxiedBy: TYCPR01CA0144.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10698:EE_
X-MS-Office365-Filtering-Correlation-Id: bd7e8c67-1829-44f4-2657-08dc4c8531bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4PH5qF9OJd1pdtUV+9Msuv0fYVzH2ztyVIifHI1dcdfXFeoVpK4lGiQXHzac84RRn7plf2neHm+z6fdKmQ+tR4K3otn+VfqP+K0+9aoXFywIR+5+TGf71gV7NxdcsCHu2/l5aCqE2dn3m1BKMzl56YPhC9QJ4yk7ZDC6ECmed/v8Z4iWvzhsEWXipL7PE3RVk32yJbt0eC4vX4XKE8UFTNueBGlu85SYxJClTvnVHacd/TxTuwf26TfeVfupTC5vKF1Mu7gj3pCnsKpd4RzUAnUdooOaj00rl4G7ykYCaOLaKK6UmAKVZI/JxaWmjYxQFyopga6yxIDaaMJN7GatZcATtQp9r5Borg3qb1znMaldOOfcw9HT7Up5NXmjXpkPxcg7PmPPAk6pP16BGKRZCii8s2WYXVxEvdpovP00Cir1EsDkaLDdRb8EFZh/1IjscfUp+tt+UiHP7yh7tvS1MPxqGCGSUJHJvYmufvziP8QWo0pNW8FtlOIHovpoZZl4I/XdyGSI8A2lgPqdmzH2WN+T3ur6XMWnIER+yv9NDn0Fi+DbzZ0LGI1h8vpkQBxLmw5yEc2HmpY5z/07lGwNq6LzlJzQxgx2DrOwtlTVDwqGo8c/gYSYqaj3cbSZlh9QBbW0ANcodxT7Lgjcgk1wJZ5HSl+sUZCR+1YsPWX0XzWSSJKBxHkjF40nZpqquggmJbIkJO+GxMAkwYVyPz+bl/vbx9sR2dcLA8mFksvfk08=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(52116005)(1800799015)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mGhA957YmjevWtksHYcUaRyYPxSGtQXWfDAzXFRhiY5lxL875idhnFoiVoxJ?=
 =?us-ascii?Q?l77NOBLK9eYYWqLZiOgRjT6G3naA4I5crQlE3VZA1+UsA2n4HHn3o/hUpbeI?=
 =?us-ascii?Q?fKAv4UAIx90C/iFppDwCGek9m0eeh02Cj/S+nQwh94jkrm4Po6ReWHZ3X3w+?=
 =?us-ascii?Q?GG2/GrlORBBaXth+WpU2HhauIbJeeVTPMkq2i/tC92LZtDrrzkNbzlzHOjxC?=
 =?us-ascii?Q?R5K9esc+u4/07g207FRvEKIVNVYblBU29Oqjncd7oWB/fCCXYpUcVF5TBsUV?=
 =?us-ascii?Q?yx7aoOCFuX4403xtRMZUovYjzHiJLj3sVrXYIc7RzijwX8mUrI87KEd9/VMo?=
 =?us-ascii?Q?Y2UTEEgyNplkAcdyVu0iJwJPqyLg4AA9YuNEaRzpe8fRxkL61+sDw49zZz2y?=
 =?us-ascii?Q?uiyiGxGlIPVwmdimWMdUYJK6n0ySi/MLr2RfqBabjlalFkX2TT5frg4f/4jR?=
 =?us-ascii?Q?XBSRWDKELZml9vd/Nzpjg3OauUlRzAWbt2xdbiHF7VaaSRLQPI95UGm41S8X?=
 =?us-ascii?Q?uYLg9kTlKM7zK1VQL3A5vwuWkMAcp1weifYCGJD8eyoLSfaOx89z6C2czFmc?=
 =?us-ascii?Q?J9TyEZvROcshUaw4zBy0tmDaLOrL/RcQLKxms/XDdDOdFFghLp9C7z4NN+QP?=
 =?us-ascii?Q?d+HcY3hNDdobTOzDgTD5HA4aqpwpENf+qVtHupavRz4NeYXIM8air56MXf+F?=
 =?us-ascii?Q?DZAlcsKFo5zFXwcN9zwy0VkxK/do2xyjxSWy5mZ5tcDiace/ASod0bwVyxjt?=
 =?us-ascii?Q?c1bGrGPsBPygg31Iw/eA54PQZsIz1ULL9Y3lEHHietzYEAUEzgMdxPvbl+wG?=
 =?us-ascii?Q?5kTeGqD+cEpoqDzjSq8QjyZ50fJjznKz4QaQbLlw3ykbB86ih2/RkPWMPWO1?=
 =?us-ascii?Q?H1ZnZhkQ64+Ot5PXbVZZHS8/05fEcXs37s7ydsCCLx/Du1pLWe2LFvPxGre1?=
 =?us-ascii?Q?Pa0XRjjVmvU6fJmrRnLMlZXt9DFfPiRzms4BdGaM3bqix8uu8cfJ4XfSrljT?=
 =?us-ascii?Q?HXUY4Ht94LLzzRxKUgwsgXkw/fixYshXXz6Ogm4nbxUmiv8ljnx/SA0aq1Zv?=
 =?us-ascii?Q?Fp5yeQSbEjob7eZov8Bojtt1csTMXTUoBG8j+SWg8GgXJj9Tk12tuULmMxLe?=
 =?us-ascii?Q?d+XDNhfO357wLWTTrdOAkI5NcVAAfix1NEFL8QICkIvMpHKWgBQO78L5+H9a?=
 =?us-ascii?Q?kGdkw19XmGFDYl8UI/Va3VUKkrnr3ZH7MEPfMTrwN0IDizNFNGqOI3WeWU4L?=
 =?us-ascii?Q?iWojxaByp1GY9IZBKHVE7x9ubLd14nA8vnFOiKfaU5Y3GdYA1Wv4erUd01cl?=
 =?us-ascii?Q?qw2UdpbS5xfVyTmIIHMoX2P1v1ixMYiqwR4IepUSrfJsHc3FCJwmQzdJd701?=
 =?us-ascii?Q?PZu0fSAWAUyOWZ8USOEI+A9RZ6t6JW3CNVl69MHCYXCqIe/CyphkrZXgUdFm?=
 =?us-ascii?Q?GW2RYec5JZlV6OuxKQq9EQ25xCI0N7zyTN4lDlfK0+uZ+AoPwFXIUZpzR8gG?=
 =?us-ascii?Q?mMDva7hbyPfJwa4dumYzwXDhANr4sEuLM0riXHW4eOKZOZGogb/kauEtfCUs?=
 =?us-ascii?Q?mBkuJD93ENUKZzoqNNes1iu5NbKMTmafx1gu7qNMQciAYYtlq7+YxOFWcXK8?=
 =?us-ascii?Q?RRg6GzQ0GcTm1U3ofD+3ALQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd7e8c67-1829-44f4-2657-08dc4c8531bc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 04:36:52.9496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a42r9GdSpTtQzBg1tD7qsIK49+/PxMvNLpexEPTl704ecJf9R2kWif2V3ATHmJ/lCGv0SAKHCZIteH1FZxPiE5oAurU/LHpjUXLpqYS5gp9q5SiBeyqZiBqzyGerxjMw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10698

soc_get_playback_capture() is now handling DPCM and normal comprehensively
for playback/capture stream. We can use playback/capture_only flag
instead of using dpcm_playback/capture. This patch replace these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/odroid.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index 110ae14dd7ea..6cea197d62e6 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -171,25 +171,24 @@ static struct snd_soc_dai_link odroid_card_dais[] = {
 		.name = "Primary",
 		.stream_name = "Primary",
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(primary),
 	}, {
 		/* BE <-> CODECs link */
 		.name = "I2S Mixer",
 		.ops = &odroid_card_be_ops,
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 				SND_SOC_DAIFMT_CBS_CFS,
 		SND_SOC_DAILINK_REG(mixer),
 	}, {
 		/* Secondary FE <-> BE link */
-		.playback_only = 1,
 		.ops = &odroid_card_fe_ops,
 		.name = "Secondary",
 		.stream_name = "Secondary",
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(secondary),
 	}
 };
@@ -278,8 +277,8 @@ static int odroid_audio_probe(struct platform_device *pdev)
 
 	/* Set capture capability only for boards with the MAX98090 CODEC */
 	if (codec_link->num_codecs > 1) {
-		card->dai_link[0].dpcm_capture = 1;
-		card->dai_link[1].dpcm_capture = 1;
+		card->dai_link[0].capture_only = 1;
+		card->dai_link[1].capture_only = 1;
 	}
 
 	priv->sclk_i2s = of_clk_get_by_name(cpu_dai, "i2s_opclk1");
-- 
2.25.1

