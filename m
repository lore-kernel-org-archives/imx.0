Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2067.outbound.protection.outlook.com [40.107.113.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18631C1360
	for <imx@lists.linux.dev>; Mon, 25 Mar 2024 04:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711341375; cv=fail; b=M6xluGQ+tozX8pyoSJh1/WHzplBk5eZhkCLdXPvUX3s5QrFyVAG6r/kZO48VfctnUl/YBj7z4o074swRtSDZ8ePau0K2oNnVT/REeIXQvPkJNDlVGkJLvyY9gmdzNc/5SsEIUFRwd6a5fY29F5QIbbrwl1TMUGY2RX1yNPDs3rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711341375; c=relaxed/simple;
	bh=k4h/PoOk62pxaDjSieSsv/A95jwkgPCD9LsoO8EOQ4g=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=rLTYm+a41OaZOjdmA93Rf96shmsRNgaGEWzdA3vCF5MZdtLp+8yaEoBpeUG29LiEt4REqE9ifyVtpLjZvkg+atxoM9x6xQP1EH+mlb1yAD3Dp9kk8qPVfo9fMHIEuz5i0l1DtnZXMM6wpuyZoZklWr6MorTaDZO9GkMRUmorGMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IB98QzW8; arc=fail smtp.client-ip=40.107.113.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IB98QzW8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLulJ6J/+LyhpyTStrwkfwqt2CJMbC17Am0L6dY6dmMsVxRoWYR8uwr/wrjnphl7Lr0j08BpM7CvIz8JOIalS14IBnMy/Zi+t5JuUeFxcVEowU2CiZZcid5HEpQQAI7F7Z9lQbrj0BGtqn16h3CT4lWdqvC+d8IABbDTEeB0hsknnSEkAFGvntwTbSJ/JpopX8GmV6AeLLWv4dhf/BUlERG4BMQUgk1HtfiNUKp1bhlQkNO7W2Ktwm5epyEWI4/Lb8reXejhVCy2qeJHexAEjEwByFnid6FRhbaK+AXHb7T/5SUZfrlhiObeQOLjI/fR67TlnaypDEVdb5rsVx9+Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCIf78DfRZi1HpBCdp3ABqBxydUBtA/1mzGbWu+Nix8=;
 b=nHH15s4ldi6njlbERSFt2Iu6PbfY/9Zx/NKgPbRW9lUZodXFyqDeEjBuN5GCz4eZ19oadCK59aWxX1JjKjjrl2C4LGafy6QCLtMfTl7PU9as8LI4QQR4GFZ1LB9O8iSOqvSDte72xrnBfzqTQTMzCoG9TucfsnzqaO9LcOFbXegkK/y/ia1opks+ectCXbN/sSa41mp2YeTuBRE2eKs7ijXn4/5ddtasWAXj3GhL5hVfsP1u9bmEXOeYfotjWHi/loI2n3aX2aWSXFaAGGiP4GxBb7E+McoUHIyTorxes2Ns+j8KLWHGvZTaC7NHxQp6zG5e6W3E/G38fgGjn34Dcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCIf78DfRZi1HpBCdp3ABqBxydUBtA/1mzGbWu+Nix8=;
 b=IB98QzW8JE9WjjSl7ksP8+OsMD9FxvXYnwTXbdxNWgEbYMmySH7ZUr/79IBWbgWvfFfcvXsijiXkIsFgm1LWWDYZEfQU/ud4N21g2sB+XouxUn39AU2HojX0shi7Nu+6OMvAGj94bE8bchoqIPdOa3zE8iZZu8DhtPYhADg+1S0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10698.jpnprd01.prod.outlook.com
 (2603:1096:400:296::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 04:36:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 04:36:10 +0000
Message-ID: <87msqn53ns.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 01/15] ASoC: soc-pcm.c: cleanup soc_get_playback_capture()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 25 Mar 2024 04:36:08 +0000
X-ClientProxiedBy: TY2PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:404:a6::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10698:EE_
X-MS-Office365-Filtering-Correlation-Id: 591324d8-a018-4459-ecae-08dc4c851816
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wXVQp6n9Pc+rEo6jugR4BWkU3X/HX2jF/ONT/9uPM9NxQloWfcXJzOZ59g9j/GTTv12G35a4Td5l17Ma8n3VyMDizL31kivOP7NU92iYoeouR9YceS7gekaY43hNCsq+2ncy7/VTjv7qXj8H45nXDn0PcONcw8LLAgK1PxwE10KSH/fpdVeAg6iSfBEkYz8k7cQsMUVFP5wHCFOfoh5B/eTm/FoKoSw79rmqiDU9WPR80TwZgqxq4CZmPNjtJPBcJSogrbuPTq3ZyOT5dv0m+79jngDacObS/KGcDtpnAagAq9V6YiCf69q0yzYNMfyjsPmpKoWKgtwZcznqlH7OXABE4nlRTN79jnarIkVIhfgdd/eSaGHsyeRY0iK/o5WDRz6CAlL6iQv34xT2vilHx8Jz8CDxH+PpSYsyI3k8O+aroPlI0cki1eycMiFUFZ1y+Xcc4YPGZemAzo4Sh9jcATVx1JyYYV2Iy8FnI9MbVmc1JEtybRUOttsGMyoyUWfmrA0PaYFF/35jR8/1wYeK6B1eoRLNGEZR2hI7QIPzScE9zJzetcnXKJL2AMW1VHNz12ndFk+sho8kL5a0w3jqePU0E3lZfmQeM9/ZDtJYf6AwBkVzHUCZ3Zq1dE2JIQryUS8ik735xEXuIYLlmMrav7nGyvVYxxekGpacxlH3MzQIVRb10SgWlt64SzcvCbXlucFlwjxqjVAfkPRDtg2HFfsy+iUGx7ryWXz72e40+tQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(52116005)(1800799015)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d3crGVKzTPpGVK74hBKvzaeK2F4CO2bdBzm3Xbq5Z1nvu7Rnrhs5ijBjvItw?=
 =?us-ascii?Q?7fEtR79SdS5mwEIAFoF53gPENF2GsRNeKj23XlYhIjTIvff8gUCq/azOFjeL?=
 =?us-ascii?Q?IktXkNc11OkUz2636auUqEZDybIuVToUDbdh9xIRr8dK9+jozVVNCAE6VkKj?=
 =?us-ascii?Q?W97RMtD1sZ0M2RehZ9ALW7QRzDxZ20BujDkfo7jNf15bnEzEf9Y7JCET1jwK?=
 =?us-ascii?Q?AiZagoL1POTBwM8GkD5LaDaw/d/dejuGHp6KjwJNwR6NtS8X2wsY45jKcj1O?=
 =?us-ascii?Q?0BaBwCoHp6V0QkQres3xBXft4rxZdSV5li98CtZWxiazH936IwkZVSLM1YcW?=
 =?us-ascii?Q?DdMGHZqm0723UwgcGyK5tpiOZisx3CO1OZ8hEfneT7KuyCh2zxt+jgiTapqk?=
 =?us-ascii?Q?K76L3zXomleq7rdRtYH8+YRa9OmBzmv0qEkB7BAFVhOA+/kbKKoIvBL/tYH3?=
 =?us-ascii?Q?vM5/HGDTkJUvST0vqE5PNd5MNLlN23ueVZ/mz+D4wZEoCXEjD7go9/E4BzyO?=
 =?us-ascii?Q?OqtfhKZ3gdfXuaTAPDWQ9mdZ9a7kuo7smCjqOeUHQhec+GWkE/K2ssQ38boG?=
 =?us-ascii?Q?p7jXjbAsGOeHSow89yaWiAfVORvWfyM+9VCo4VHI5XwbYXopF2FsQHePcQXA?=
 =?us-ascii?Q?vbZfqSD/ydbkbPpq57Sn0pU+BcCWujCQsaBu4RNYRrH9trDJGwNCAnxeWoCI?=
 =?us-ascii?Q?9D8goPeTcWj1qF5wOY947A3oyz39Ris6mfzLxmtHi0Ntd6wxUjsUVa2mbh/E?=
 =?us-ascii?Q?tkxKE2XtFrhaDl+niT6vGMrqkWz8j+zGNuSbHBbTmFtjHW7KG7amQW3fGkGz?=
 =?us-ascii?Q?OoDi/kDRmD0+wvJBeCVL+UqS12D3Wkxkxu2FZn1s+fCmBphzVvy33z+T3+rw?=
 =?us-ascii?Q?5rOQaQguMNe75FXtiFVZsuSGSzH+iU6hg3nnqYxIzBvVSCxS6CHCUfHdsMCR?=
 =?us-ascii?Q?lrNM2ZS+4XG233GvdsWkFq7Rrs1/IGKeHnqErJBz+WA1CfvX3ctx9UH9bwbj?=
 =?us-ascii?Q?00pApLzncc2LCkjdL0Npt31j55iIKoKqYDifB7NfgCeDgPGDwtkOlLKBdjHz?=
 =?us-ascii?Q?GWPSjajybCxsVsKqA1u91gTGpf1HsRfcDPUzVZ3BLxcieJ3gC6uhNNZJ+RzP?=
 =?us-ascii?Q?7T0lzqXCqQBJebZtx+BPBBwSrmG0MUnQasHKr60b6P1p5ZTUBTUG5VtXJja0?=
 =?us-ascii?Q?FItghskQUzbZdZ6PFBj5NPW/i2AlCFVf9oXj7ezbRMhcxv9c/sXC02MtASxE?=
 =?us-ascii?Q?PcEvz/hAKy2aqA0pcbcp28a7je25StyPEIbGKfQ5e/v/GpG79uhFiBbdnZNU?=
 =?us-ascii?Q?8ST1EJT+f8a+ByndUN4s52oLNoHdTjjalm2yClee9EMOCxnyQ5nkX3LLES3v?=
 =?us-ascii?Q?CQjeG7Wn3sbfnfX0EMVjN7kcYLXnKsqXEvEWrxFKTS+DO/f6GmrGx992ihAc?=
 =?us-ascii?Q?3avtZvUxSn9BZp/GYbj1YWL73xw2J7cCC0/sa/AzGjjRtYz05UhLEasqoGZS?=
 =?us-ascii?Q?r0k/CxwYqRjIs/61VBAg15bseeYPG3OSos+AdaujKc02Hjeb8wvai5gaMY8H?=
 =?us-ascii?Q?RQb2vQyEnTbR78HvbwAOGbuTSL44tjwlW0kjn+Fbhx6OoEDQgYUo98SmRlXU?=
 =?us-ascii?Q?99e7JOBy1RBtLpkFjzP/UUE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 591324d8-a018-4459-ecae-08dc4c851816
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 04:36:09.9365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l11wDSwKTbj8yR6VY3Bk4rIUTlrxlvirX+9LFTpTQ+W8wL5nCeh3YCRp9V8nzuvgfe4W10wqnXEu3p2oTgee6lQ8LiKe2ArwB0OyTJX4Pb/CGAeno3oqWvQTs520i9Jw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10698

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

