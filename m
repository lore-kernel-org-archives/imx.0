Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2055.outbound.protection.outlook.com [40.107.113.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAC854676
	for <imx@lists.linux.dev>; Thu, 18 Apr 2024 04:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713413658; cv=fail; b=T5Qep7ipnpCtyev4sqEiJBuTbJK2ecfv6gKicBqEAczQDQjPLH2nTZJaNYRfo4h4QxX8pxA7VkmTOPcHE97d7UvrA7XDduv/sr8SPRkDClQppf0L3jB+rVLTGu8AOr7eEWZ7ZCJctXPmaxY2zQ8f1IvmI4lMeR+ypG9ATMoqdUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713413658; c=relaxed/simple;
	bh=93zGtpBHa207Ijy7uSdU7+d6fx8AEOISx8TYwaPaswQ=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=G4QfETKzN+dIdaDez6FG8turP6e3xzUb0aac5r7mYNIdAYQyFUS3AuW/5oytTHsUaYY/9SH+EwUAEkurxvAw3CMpAu6Y0/4qt+yZ8+l9J7DRpEeIbqz8KFIX67+KrgdBoJS66DPWYmZZuYyD9zc8E4ac0v3epB0XXt0Gzsb9P0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=P19UObev; arc=fail smtp.client-ip=40.107.113.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="P19UObev"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Use11NmyVKk5IYCx/y6ttl8FRcumxTLTfdYirJbVkIJ4TrKksHHVJNFQbtX8CIuOMp2KnYLQQ61JTYIhCv5COmp81oqGqT6s+6YcLeyCvqfekFHngh2M7ZG0z0aM3jfMGJYHRq74bd8SwV/bmHHUbyo3fmwY8Lt+/u1LI5MJhRv4MfwmEnLwoyJAcicqh2TCoURGeXaR18XeQekjIx9CPuxE9m91mw8F1YNppE97hAXOdryKeZ6l/AfSQ5ZChZN66UI8Gl6cxTMR+6GVUYxfafq6HId9ae0jz3OPEKDg0lcLDXICd0C0sm6PNf8snI+mTyYgUzdwWmwwOCLKpQ59PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0dOwLQbiWSj/npH2cmb+Ck7k/lzeXjY0mNBmAUWL3o=;
 b=b3yfHrV8Mk+GZFH7FrLRHTnLkTmnMTi/w03wG6LZ79vK6tQLhL8fZnWCqJmRMDAZGEoJrI12AnoLDLGiFAMp9m8jXczonVjCAoEFn/wUIa8numAf+6vDksPEUtwZARnVmzm7UpnY2RBcJEP7kAL8Eqn857pYdH64JNoBjtdTtenG6mQDRh+N7OILen6aGSCjluTqcZ0whwH6c+A0YuWSH1VDILjSnf/etDTqRKEJmswBpHg6VlgNkz+kI93jrYu1DJIwRWaZUkuRmoKYpWPJbHe8qjXjErt8mndHtEmqMDH6warR4DrLfbYhv9r7M6qLeVBolRX6KXD19wH4vH90bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0dOwLQbiWSj/npH2cmb+Ck7k/lzeXjY0mNBmAUWL3o=;
 b=P19UObevhac28JXQxObwJCTVBoN/xX+1Pz5UwzRWxKGBHlvJLA27olE6bOzGeHiyzo2u+JbNLjcI4M8XgDLC7e/uLKQBRrFZh70vKvIiGR4BA/gW6pWG3hERs87k0NQH+eVtLoTzeFuQiBbfKgIzegSieqGr6832yacnddglioU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSAPR01MB7397.jpnprd01.prod.outlook.com
 (2603:1096:604:142::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 04:14:14 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 04:14:14 +0000
Message-ID: <87zftr71ey.wl-kuninori.morimoto.gx@renesas.com>
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
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,	linux-sound@vger.kernel.org
In-Reply-To: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 12/23] ASoC: soc-compress: Replace dpcm_playback/capture to playback/capture_assertion
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Apr 2024 04:14:13 +0000
X-ClientProxiedBy: TYCP286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSAPR01MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: be1e9416-f0a9-4c64-ebe8-08dc5f5e01b9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MHxJ6K0EzT4BhP5yqG83VjekTQ3K5FKU0/k+MJzCeaEs/iQPOw+/7iY5pG/aWjUHa8K2cwbgHaKGU53QoeMhFlvYXrc+gO7OGXnugksrHgOE2L/JwoVehpXiF4Hrh5Mm4ZEq8l2y5hliYJPgFqHqalWnprmPeulB1/qiLpQCp9uYO3MdsLtxj9JCNNk24lAHlERpi6CqYQGZlsr/Bn+0H/ie8dDu9Rd3TeXXjHaS0OmIvwVpE8x3a++f5XXLTa8Gn4RF9ZrJce8pwKit4z81pkGjlyxfEhpiRau8mTanhB+8exR37+S+J1kqDSBZw6rU22pRm8t6ljnGxeQjZxa1foik3dMxCWJnNkZR5RfmwwOiLqn7XoBUWG6o9C3CPb6ombwRvAyZ0iH1gCi3EHeFyz/xBLGiQqMa/coNNpWEs9IkZ+7dZS+aelutZtnqPyygRRarujoaih1rY2+1MdVtZuj8//yzA5JlvavO3rdTZwujsJ2QQPlPcNZLWI2g2jv89keHh6+ZNg8w1/L3NKY0C2dYKceYr0uXcniYdZdUG01EYca4MC3KlrVvsyGCeuZFYpzsNWVSSEtKvZUeeMABi5JsMpfIRv7Rfco6EbmhXzTZNZbDFkpsPNvuOSyTxTo2PfXVioJjdhNdfjFd1wYVR+ckTjKxiYl/oZx57wurdGlUvRmC9uvzsyZHoaUi7EqjeWwpMhdJ5dmI9NQB5XCwxzeomYSrHnC+a0YqDWApLRA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J5gnfMWCKXiXbo0+2ztBwCX73Vj+VSKTE37jynKhlCfK8Gsy0PdEBpJv18+H?=
 =?us-ascii?Q?NPXEUYE2g4Bu8qLOGR2D2III3Qf3QZRJEekruRcP/jfgK4epb4i3M1io1jHP?=
 =?us-ascii?Q?xZbtJmWhIqdos0tFP5vO+wg9+BvI6RQ8NnmdLQQqP3obKZKAGmr05mLJF12H?=
 =?us-ascii?Q?3NSxqLSxedxeEnpOHzqGTMlK6VJ0Rn63HJ9q3kMqxw9q9anNKC8yWtnOhrOA?=
 =?us-ascii?Q?t2OTNT2HaPmzjxOhM7jKPU+/yqNuX0yQiLTPOVFKuRbReKx/GMhzW4AdTHEL?=
 =?us-ascii?Q?7HVU6NIRJ+orEYmqMNRuLlebZx7tbmRqUIn9E54QEdPO9b8o/cn+G6xqcidk?=
 =?us-ascii?Q?Y4hn5uNf6Gkow3C/UU+OE7S7oIPpxNBbxp4+qvTC72PzFsFKYSmId0kdBu7Z?=
 =?us-ascii?Q?jX+BzkgxVvOIqoVnX0GCBHt8Hrfsoh8aCuqOq5iOtQEASiqJ+JuaAjm+iq7l?=
 =?us-ascii?Q?b8/LCajDP8DL+dfJfvBO9P9H6N6DvBPQSkjaDOeXvlJlidjR5JeEhHC3v+sZ?=
 =?us-ascii?Q?0PzW9ukBmnfyGtLsCodoJ1B9pKlFZiLwHJIG1Wi4OVPCt3eaOC75YKUQOeG2?=
 =?us-ascii?Q?3lby146bzA3XWVgjW8vyLmpmldLPiAiR5fmms3eDCGGaN8EeZBPEt01v4E8m?=
 =?us-ascii?Q?3qjHkl1YfXRCDyy2VA7kIGhVMXQV9IcDeiXfITI38RYfaHEihvcBR+QygCag?=
 =?us-ascii?Q?Hz/DFxMfPtRWSSVlzNscjEZvDYIryX994Vav1FBhiBibA906q+RjuAsJA1yi?=
 =?us-ascii?Q?rvsijfwDG5G3Q2WQikjUrqRzwq6RxPmJ5BZCdPkCOe+8jPW3IxQyJQIfZs/S?=
 =?us-ascii?Q?mjyvlNfw42sEp62ASjiUb3Yylr0debYGwLmSd4yBo9gTAPqr5OSxochIhar1?=
 =?us-ascii?Q?7Ik6rApMKUmTGsh+jBoPYCkLpOlCbPhjHDBv295I3ryaP9fvX7IdV5eBaDGx?=
 =?us-ascii?Q?xIH8rmGY5YMaXtB4xE4ZASdd8riSoNGC6DD6er54hm8OEwlgLVVPYpSGsw7H?=
 =?us-ascii?Q?3wlI+H/1g5Q4PwfWvcjvymh3ETPNlGCfxyvw8jZdiWb+nbOrIdCbgll94lS8?=
 =?us-ascii?Q?hdCqyJFt3D3SEQIkTchNtRw6ov4fFyC3DH8jVpS9hu6oaWPa+o74iZrnCXVW?=
 =?us-ascii?Q?6+uYttBFZaql5yFEmFb0cnrFt0geJTrFr7Noy/zmXlNI+kIehOodSS8FxCgp?=
 =?us-ascii?Q?mQX6MCP6gQSs72eXntAyFmfl5aRbrrtcF2XZ7jz6jmPMZRRFp9dUMGSYUL9k?=
 =?us-ascii?Q?WzJJO0tfEUTCV34p534Ynkuxm8xMBbNdfGXo/Ro21+b/FhghVT+agX0DBWE3?=
 =?us-ascii?Q?zg01goB+K0OJ9Z1BqPH5xtvBdLbY+eoj6mOZlifDMkk4Y6EBUw+5eoE9oKqg?=
 =?us-ascii?Q?6C5ogtQkffFAGnUtN3KA7Hj8gZcdUeeL2aRFg6GKRsxbZs2SSvUQY2jdvvzo?=
 =?us-ascii?Q?pMxbEA4qzLFYohr/ArrRxBzMVu+G7bmQvSTIHFbtcMRK6C/XlTqze9ijuuEq?=
 =?us-ascii?Q?qy7TVjVpXoKClsmgXXqHykc4RY8RwdamSsY49MQPUJkoG4O5RMTW5xxHk3jC?=
 =?us-ascii?Q?A2kEo7LKcZ4iPATbGm+EVz7Ec16ffeboHVIUJ+WxmVsuCAbudkAGFS1PNe3M?=
 =?us-ascii?Q?iow+3kLmK1Fjjlxkm8iLUII=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be1e9416-f0a9-4c64-ebe8-08dc5f5e01b9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 04:14:14.1335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gPDBqitxHKGC1xhq8oRZypTI7xgwhBKiJxF327HoCD7mEiZa18UwdTpngqRhvBtNQS3Y+Nc8ez1Ypg3ycAljPEZPLPlYi/HdaJs/O9r8YOLnJdfh5FflkCeVdkp4Ytfy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7397

soc_get_playback_capture() is now handling DPCM and normal
comprehensively for playback/capture stream in same code.
This patch converts dpcm_xxx flag to xxx_assertion.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-compress.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index e692aa3b8b22..347189ea30f9 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -610,8 +610,8 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 			rtd->dai_link->stream_name);
 
 		ret = snd_pcm_new_internal(rtd->card->snd_card, new_name, num,
-				rtd->dai_link->dpcm_playback,
-				rtd->dai_link->dpcm_capture, &be_pcm);
+					   rtd->dai_link->playback_assertion,
+					   rtd->dai_link->capture_assertion, &be_pcm);
 		if (ret < 0) {
 			dev_err(rtd->card->dev,
 				"Compress ASoC: can't create compressed for %s: %d\n",
@@ -624,9 +624,9 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 
 		rtd->pcm = be_pcm;
 		rtd->fe_compr = 1;
-		if (rtd->dai_link->dpcm_playback)
+		if (rtd->dai_link->playback_assertion)
 			be_pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->private_data = rtd;
-		if (rtd->dai_link->dpcm_capture)
+		if (rtd->dai_link->capture_assertion)
 			be_pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream->private_data = rtd;
 		memcpy(compr->ops, &soc_compr_dyn_ops, sizeof(soc_compr_dyn_ops));
 	} else {
-- 
2.25.1

