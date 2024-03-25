Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2064.outbound.protection.outlook.com [40.107.113.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738D11C1376
	for <imx@lists.linux.dev>; Mon, 25 Mar 2024 04:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711341398; cv=fail; b=ipqWA++FFqbU9yEDjUNUhhhpRPvVG4x78jKvo/b3n3iKzzBBZPs01joAXNs07Ca17j9vBP9hZfHh4k7hUnJr2EluQc1QbEm3f7aee3Q0ugAUv8Og6/p/bH4LDOt7D7h2S12pFRlcgKQTC8ECy5yk3rME0647WJHbHMTo448oNbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711341398; c=relaxed/simple;
	bh=G7Q7w/Ss/nQN6wmdkT2Xu2nhjtfxuqpUea4yFIfT3sQ=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=qwugqIEQLyHxCAhzXjWv1x8seDiQq0Hvwfkve/BO/6yQWiWJoUK5DX4mJdZSl+poZAWPWkVv6ubPwqX94DgW2Dg8urSVosJ7GopFyI/HUj63ifXOrWCeL79UwHJ4xCCr50MDKpF5B4H7S6GZGtjmc1CfZAT8tcob6swVD6q3srw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aZujubCv; arc=fail smtp.client-ip=40.107.113.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aZujubCv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PIPt/2g+h1Hc7QmtMyDfKDb6XIa342h8iZVeln1L/vKRk+3jY7YS7gKBY/OImI1PRUmFNBB5wNF+jv3mhEuRfgiz6gx/GfzPm9iVa/cbB3JAiowQwsr+L1H45rzonE8MBaLrifLh+TLyi8MU87olwQZiku11y3JTZ2Qez58yQ5g80qOKSUQpYSrbz/g8KPFw9m1fY5aweAQBXWphIqr+Sf+8mU9d03+baqxbMaJ7RdccJHAQpudHaWFo6pF+tmWZqnd+n0OV17UlE8So4cnnBX7/d41vhbklqOvK2QrggcRMDPH7u1EVFOWr0KCY1F+Mvil1NShcu4T62YfzZMgsfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9EWyQeR690weBVNGhlFiX0+X8nFlopGtJM8dti0LeNM=;
 b=HODe2udzDKrIOqKVRLQSyI5mroKNiXFTVlo2hOo1qH5kgwRhiGmMxHDe2YKskmlTEsy9YDNkHJ0Wf6obKU3uhwNAvKrHDjlAVu6ymXalaYPQZVHgkGfQDcSbLnOGFIkkyzPj4L6lc2/VXtMuJRloivDLsBBrt4GX7YjsaWAfSOyn+EPjBFx7FPXMJdUy00mPfxy3INPPnWCAD6kAHMUFJuIOZEiJT17U0K1TkXh/OnJn88Fp+gYxzNdf9u2Y9KylWhpFpYhpR8sD4kUiNfQc5u34s5tHHuv1iAs3npcEFYAOpKb1B7OMp9TiqoCspRkHk6vWwmOQDGAyHCblvQH3Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EWyQeR690weBVNGhlFiX0+X8nFlopGtJM8dti0LeNM=;
 b=aZujubCvc4wanFhuagsqe9yy/WyFgOQCzOKALi2vVkxbbU24txaj2b3mABkVqIC9y2AIc4AsbMW52RSexR4qmfWfoE7iFa+2bdowYiJYFVroUrUd8/lV0NO2kWCz+doaAhk3bSM9HajYup17bDmKcXiOHsdIV+heOBC4GD3tH7U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10698.jpnprd01.prod.outlook.com
 (2603:1096:400:296::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 04:36:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 04:36:33 +0000
Message-ID: <87il1b53n2.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 04/15] ASoC: sof: replace dpcm_playback/capture to playback/capture_only
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 25 Mar 2024 04:36:33 +0000
X-ClientProxiedBy: TYCP286CA0057.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10698:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d959bdc-08c6-4aed-831e-08dc4c852639
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S7GNRZ3+ZU+EyQ/MSwwXPvx43pE+bgSCDhQ/czJVtSb87nvsu9JpuAGHwDeEVTT0s+Jq3OW9Dr3Ph8N1jKgeSgrzGTut2CSi+YLxljSoEsAMUuF7vLS7UUFDqW7j7ciFmXPD4g32oMM5vBlI8hyXXk46jDlRvAnERdK38R0lTgGwvShVMB5GU66fokNV/koH5JRDoBdSkYFIi1uIS1vIsaqo0nukt68jCEs5TZ6k4PJn6+yqPai3sdy99KWQO9MWwLlYTUTXfb98ezs5JFt4LRY8qu9OWgqXRtYSrleiVDUwAM9SnmFm7Rkifeu97eFbkVitpZ0e4jYtMWh++oEU2zoqHCCTgj/jpVdJRHtSvd++qJx9oHq72n953x/Oc6FPyxq+EBf3e9br6qBKg8MbADCG8i5AAsntuqhqLgk8+1JFMTFXXBkABKKhKkHfwO3SQFsY3mXm59N25vDIlPfDIdOC7KcFS9RBeJV7TSDAfBKu0wjRx3miuu7e/inmUE81Hqva6OIC9yq81nrlFGHhxjAdkcuyRYBM3gbcBwFgVzOqwXKDpFkl38Zf7wXz7b5PYaZn1D/eB6kl1djSJbK6lguHnIQLf5KqiKUxmgt62SO9BppaOYFd9Ad9sYGiVnf0feAUC89thVPB99o8eY5U+F8eTgEX2bvdiIUR805a7N0Cf+GKcesAyzfHuYPQjgnETqd06E6gskbwZKwsX8BtQxgJt8wqzDe/j2yE1GALBLs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(52116005)(1800799015)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jCWVuJbvQveuAtqePIHnJGkxITU4W2vt3+gs0KBYqPx1Sjl32m0Y9gf9h7Wr?=
 =?us-ascii?Q?67xh4E9VnoXSn+9Xrb4l3BNvWPDdGdbWZ/cyMV1mlSVmNIXCYmMKq1UCkDxY?=
 =?us-ascii?Q?Vrocbhr8YA1RWhSlE3DfTH39oTNBTGKjT7bllIZdEyxn4pv2Iwg2F2i2nAfF?=
 =?us-ascii?Q?Lar9qHgrvaMG8eFdk1qkQgFQyZq7AKMfZCpIc0TN0irUch/r9lxY8A6K8SWl?=
 =?us-ascii?Q?DgTrDyaG7kRtOx+3my+HKGivMuI1gGmNrLk1XNJFNXKL6F3ikteOgUrf88/v?=
 =?us-ascii?Q?zkbjYUHR4EX5eKhrAlHtzCW8w700VqA+Z95sj3ZY9tbLrXAJJSxWc0F+JWIm?=
 =?us-ascii?Q?Yh+6T+dCoWdpl7OqJmyyWrRkSBY6ISPbfiC1nHETWpR34653JOqW0tjwXqJX?=
 =?us-ascii?Q?ndEOTrxiObCA+TZp55QeH2dRPQX1ISbUHXQr3pu/JDckl6RNOkTQGROMY73x?=
 =?us-ascii?Q?50yNgjLMoIkz3L6kSyyoQnPsk1DNebuOP+eSMOoFOC77jjpaKf2pRGGP8RRU?=
 =?us-ascii?Q?ZHc06FkEYxxIBgW1mudZ2ljqGq/H6NhFp5dgQ3B4QPiD1tIXbaUfjC4o6p0N?=
 =?us-ascii?Q?5fazJPVGCS+GLeW1xoa1h63Qw8lpa1KcUokOA7xVuMbIx8VcOPi092Y3P6mI?=
 =?us-ascii?Q?3XOVDShrXwkV3lpKybw8V1MkJcQc5ulNRMrRN6hW+gKRsdTY3Bbc5maxRSof?=
 =?us-ascii?Q?aGDpaMzsG0MWJ+qs7QImD+zjwdlotC+jAE2sWbsuS5pFSklo2n9MAsnrm1sj?=
 =?us-ascii?Q?KG3u3NsMwGwgWfhq/hLW9Ld/RwbeLPDIXafuwu7cdqU3M3c5JZ+vqtVQtZdx?=
 =?us-ascii?Q?3/mWnTqsxxwnO+jFpreujYHm1wgc36bhwaMgWSqE+wsIG89nId2TZmZQ1Ev3?=
 =?us-ascii?Q?6jH3hYYqcDpGNLuYow0IQ7IWrayPhCr6txxEoAYET/NRABJ5HLm3JNJuxNGL?=
 =?us-ascii?Q?M87/OV0nHu9yXu5UiTrJAEHTDxf1frTzTRw1dMYa/8Vu/pLZhZhs4+qQYzm1?=
 =?us-ascii?Q?Km2qeurkLowfs6cmC4PPLrD9KOVck/FnpQsD8J3YbvsctFXLiRi3ve7vlOnJ?=
 =?us-ascii?Q?1gKnRMq0cm5V0O4STmuiRfOabcMDhCyNCNXJZkxKz17JiGb8+ayVjPo9Hico?=
 =?us-ascii?Q?s+tms+afyiV01lfOG1nrpviFiw7J+RyaaDNRykgYODnh89k6djcfQ846Lh8Q?=
 =?us-ascii?Q?yyFaz7fOo4eds+sT4+lLpzJDaFI2eH05oUYZYgeQeTAcvp2W8d0FRzxP15ir?=
 =?us-ascii?Q?FWjEhuvgMZICEHo6ZsRAsc6Ws9AaQIAN7sdcfQeUaucupM4Iz4NwvfX99P+q?=
 =?us-ascii?Q?2Z7sXPmgpenf95LOjxSbNRP8VBjEm+FTPY1ysy2FNCaF0UEdv3H6TghskX0G?=
 =?us-ascii?Q?7+GrMNXAKm++7YNXGpQTnvFJCz+xFAZF8BnYo7jPvBG4aDaHEJaCucKmT6Ro?=
 =?us-ascii?Q?wh0rf3epWfhHw9sRZLt+Pi0orOsvxsL7yZI0LFuBTSI6msQarQe72DBf36yl?=
 =?us-ascii?Q?fVorTIW4d0uWsEwc44BhN8KF6cjwj8o9wdESgm4ORSMX9G858blhNgHhbpBq?=
 =?us-ascii?Q?2s2NddBTi/Xjhnx4H6+tppM4IaicGdoDfASdBVpiTa9KSFs/mkQQmoGOcyY9?=
 =?us-ascii?Q?XvX238k2eotGqIq6AeBZJTY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d959bdc-08c6-4aed-831e-08dc4c852639
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 04:36:33.6157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TjPRh2HtJzf1yt41iFGKZmaf0zsF5HYCzKj/MmUfQtgvXDYaowOU1i4BvhDOrQiDI3PkfQhz/zgxNoO+AKJ7v63Wfo9GerQUFgADeoFR++1160naaMxhVgECr23K7e4a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10698

soc_get_playback_capture() is now handling DPCM and normal comprehensively
for playback/capture stream. We can use playback/capture_only flag
instead of using dpcm_playback/capture. This patch replace these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sof/nocodec.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index 34aa8a7cfc7d..a0105c31723c 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -55,10 +55,6 @@ static int sof_nocodec_bes_setup(struct device *dev,
 		links[i].no_pcm = 1;
 		links[i].cpus->dai_name = drv[i].name;
 		links[i].platforms->name = dev_name(dev->parent);
-		if (drv[i].playback.channels_min)
-			links[i].dpcm_playback = 1;
-		if (drv[i].capture.channels_min)
-			links[i].dpcm_capture = 1;
 
 		links[i].be_hw_params_fixup = sof_pcm_dai_link_fixup;
 	}
-- 
2.25.1

