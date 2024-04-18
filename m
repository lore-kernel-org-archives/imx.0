Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2072.outbound.protection.outlook.com [40.107.113.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C527254654
	for <imx@lists.linux.dev>; Thu, 18 Apr 2024 04:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713413600; cv=fail; b=UpNUtlipJL8Mbx0iKfd0EGNrtLI1cRCD32V7abPWcggIkG1doBJYmdg/pxLvruuq4VxqjoDnbITyjmlqtDaNRP8qShLtNQyPfU+RBMZPWm6pR8iSdnvdZ79Uh9ZpKwOCMqWFo0QNnvWT8UOIETuDc0l2a8p93OwK77ZzN+sVT9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713413600; c=relaxed/simple;
	bh=4QQPf+rNak1+oyb6tYMuChsK5JTYWSp9fqFMWjAXjeY=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=sGMgenyZFhoMg8OMvgfcHCNhJI/emaV+rbzl6/sbnAezXuGOWdOLrE/EoaUZO3azLjp/uzg+r1teGz6878lqqr83HLBAOZsyWGj+oP/zVSR6M1FWDURK38wCxgM+3+lptWTwOgFY18SIsFE46jtpSO2FrQ6v7BO4JpY7htCSlWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hJpP1xNi; arc=fail smtp.client-ip=40.107.113.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hJpP1xNi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cUvL9p5IcTD2UcVWOvEmujpVZbUykjUOGBirq22Gmces7IRyI6NGLM97fAqg6t4fGcRIcT+AacPYyJqJni1JvJSeIfXACxEmy5ysS85E8rcf9H/HEptLH6Ysutmf8z8ZgftyldZ7Xq6DZ+kLq+pId+cduakChGJ3+NP9VNjIPT/wIDV53hjR+mI0zki1bQLHOWS6WvENin6Nuu1Nym/fSmgykhoG8mG/WKwamGNdoJaxlsdVRelhDTcna1Hy7FhLkeKN+A4DK7pYRp+n1pMYfYPfJiHuEffAGtuG/aX+yJ1mMQ6JkpWYGcWaJnDYepLR5Lt20a/jSwe/wb6lPy1wBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6V+ySoxy1tlVAenMQTwnKcIWflZsPX4CFCnRWWRohvw=;
 b=kvwR3BVpAp+JGsiMb4bu7ITclarp+DZwwzHaDqTFKseaqwKP6rDbrfsOTMtfDLlTqC0HC2Z6cTdrXtJ+8OQH9c91Tl0l5uizW3JKMQT0ssXwk171I4BO7xcIVkv93lerHvKNMGyCwdOb+Syjshg5MrlUcQzXXj/jJw0OBDue6eYNDmXG4ysfeTmCpAnTMkjwe0wgiQ9FgIdsZJl+iu/3cGWgEPKHxVS5wf1A2iO0PpU/aBm1TXlcrT3UqDAcUZR/DNmfiMXp9JB4OQWm6I1Vt7oxkZG2Bx4XuoB2UsJJn318UjqxeSaxKysvwXyiDSELpyMMfNrqFiLeVKKRKyIH2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6V+ySoxy1tlVAenMQTwnKcIWflZsPX4CFCnRWWRohvw=;
 b=hJpP1xNiXvGMr9usa7miJH2YV0EFleZIWB8HpMYIwrxXtczZl2HZVKQO7FWa/iPpOMICxDR2GluZJ3RP2ueymsR3hjpaKetd8PWwgxsGOFk8uak5n3nZJb8w/hgoZ5epTcuopQzfBc5z2P8am6Kpm9xLgsnKGz3hzwXCb2qcjAY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSAPR01MB7397.jpnprd01.prod.outlook.com
 (2603:1096:604:142::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 04:13:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 04:13:16 +0000
Message-ID: <878r1b8g10.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 06/23] ASoC: sof: Replace dpcm_playback/capture to playback/capture_assertion
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Apr 2024 04:13:15 +0000
X-ClientProxiedBy: TYAPR01CA0119.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::35) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSAPR01MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: 5179914b-33fb-4d80-0b39-08dc5f5ddf18
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iTxC/Vw5+9Bvv9lpe0WXhMtHbDkVNs3vL9JghtcqK+s3gi2hndQu+mpUpW6Gitr9QMwkNg71KHVeswwuKfcTnpRy0dLfz7RrWE/9Xv3qcrQthiA8jG01v/gp+5PJuN6JVCvnuV0YoBG1dcQG0cpspjwU/GNSx30DVkyn8azmdgBzx1ur+gP/OFm9c8siq1vZf4S4K+apt0S1uFfZM1NRYEWsRefOsUGqm8AHI15SJ+g1wJquky8vR0gM2D6brQ3wc2g1eIXwIwONfIRdzEWGQH9BuWltVaUTi6B2EgPc0qsVXTYAOG+1Udzpu41iRyCSxQJg1UsPbzy1OPg6HWDVeFY4xw+cYPOFvf0Jf0Vf2rMXPeqHw0J5HUh0spTOddsKAqZBpeWooIlWwgssnWpk1FDssb7BQ2obrmVSf1EUBSTyeqBnpMAz2a4GjYn+7szlBRBeTgT22cApHdEM/h3u13TM2GWYKZJNuWez885lxemlWh5irCK+zgUehLHjQt6HHQVg3gwAgZ/WNxYzJ+3SsztP97qbPKymSJJczjTtA0Atq1jLOhyIRKj+GGr9qw6R7pPrME+D6Hk/bAqtbncu2m9j7QRzlsobm3OiFvr0rWZN6UPr/C3VIbv/pPSbJRNbb/E5NLdSbh4zy+5JqnzGSw50i+LUpWWzWpaLj7uFzhNulabfNcbOXZxQdswfbWlfufS5O6ThWsHB4oLHZq/wIf8xuIKjD44d0hoUChV8beI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?phPtYoVxE7t/1hFhvXDaN34h15wDO4obTQNuBK2k3BWCmOyX5xVHjDggwXC5?=
 =?us-ascii?Q?eajDH7IA9TBqYhg6XxtqxrYXHfRFJLSF/ikMEOtQPTt95z/PsNqUZX8Begmq?=
 =?us-ascii?Q?YToTjaKHyUPLZ5yZrFp4ZqXh34b+KwiwGodKXMGrxWwU7aZxCAXkEp0b0SJc?=
 =?us-ascii?Q?K/ZStmNU82DObDSOqeTbuaQK+lhC0JLeEfMX6qvlIxplWXwmJjaMejN3aN3g?=
 =?us-ascii?Q?3QWY61I49Zl7qvMjRvq4OLaOTFrhVio+0TMAp1M608uEii7P7rOJjt7riCvQ?=
 =?us-ascii?Q?mh4sNz3NUR5BoA+MAbpd7fkLIfd5jP4wL4ozTBDvItMPHd1PB+vz+UqkwySz?=
 =?us-ascii?Q?gh7Mz15S12Q+IJKerlIfGh4HNBFBpaPVSGEPA98s066x7riuDNizhK8VrZNb?=
 =?us-ascii?Q?b6dbIV0zJP03J2SMmacOrI+th/K20tQDNKKXG+/bBX6kK9xHKNgS3s8mlwmF?=
 =?us-ascii?Q?cCp9i/GRxSwf8KSFlw1y7+XkiDbogVYczL/sH+BDNNaATFp+XErCKMwzHqRN?=
 =?us-ascii?Q?d7KY+mfjTQyS61Z8rGW8kM6qj1DEC30rf21N7Y0b2iBr0JoHNwhu3jqFpoOY?=
 =?us-ascii?Q?YmaFb3Q75mDp27F0NRusCj8NkD0Xc0T/3kUk4C9SByLPo5YeQ0rk/yaFvnt3?=
 =?us-ascii?Q?kK1KrmzFwOg+mlGtIlGUnSeDoeqCp5F+Y/xCbMv71D8P6N1ZfIuqIa/aFluY?=
 =?us-ascii?Q?AYwICxge0iyzrKydDdRLFxk9EhrKbiWFZZ12hblf4oULzz+cLbQP3mcwVTWG?=
 =?us-ascii?Q?yODZRcxekCJEMAx+OwhoM8+rlRFlyre3iTnhOcfSjxsgVnNea1bk+R7HxuQV?=
 =?us-ascii?Q?pHS8FyY2WlMFStJziGuLfc/mEsqcfhb55IqDKHvJs544DM4Wk/ylQnQ6zPny?=
 =?us-ascii?Q?i2FFpkiVldQzKp/uP2cDdQt7UWe4fyvOfrt4wKsOi02gY+crhg03IHyIMbYA?=
 =?us-ascii?Q?kYo7dJxoME2UhhZ+l+OMLOJF37JhG5h0HhsphlCvYJy9BXqfOZGswGOSZR53?=
 =?us-ascii?Q?vfRSEfCytOAR9nTYI1pBtXn2ZPqDBB2wb54D9Jv5/DfCgTOXcmiw4MefGIyF?=
 =?us-ascii?Q?ZzVgabZLuZWXteGkDPenrltp3XsyBWbK90ea6Nbqm11UOsoohhoY2eYO0Cfr?=
 =?us-ascii?Q?Tmyd30ELxfgDDZAvJYZ4Jo6inKHlTtLa42g8o99w8y4aQiDhO8mHQXmjQdJG?=
 =?us-ascii?Q?/pNV4m6H1oRHTzC23GH6tJT2dQa64eTpw72TkDqqGKM+ZVG+ej/u52D6hNFs?=
 =?us-ascii?Q?SLNSIeKcHPddOozPsvAC/r4OwhnJRDGKpECq9Ykz7iODBzudXaXA/2sYGdKy?=
 =?us-ascii?Q?+mfmQ2pyCCf4xRisUV6q/zFZuhalZUNCIdguce3droMXgEo7+k15AKPESaMv?=
 =?us-ascii?Q?QrmXhKT1vDCzX/Jvpue7xD14Ewi2W3TPsrmTooeITr81xIRCzJtKH53T9Pg6?=
 =?us-ascii?Q?waiKC+GrNn9MlHmxGjcJbe9fkWlJj2ir8Duqsqis+1W1uGq7blilcemd8qw8?=
 =?us-ascii?Q?RakMMNXDKg2m1EDi5CVxL25FAGuL+SiUMrkkbySc2D3VDFtk9uEot/a61ICh?=
 =?us-ascii?Q?3Gvh7P5gI+6CL+UGOpKN1H6T4jSI3NUMWZ+UMYnrmeEWJ3JFtMd4jA808LGB?=
 =?us-ascii?Q?cfEEsNGohJb2u7qu75Afp08=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5179914b-33fb-4d80-0b39-08dc5f5ddf18
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 04:13:16.0144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJY1nwjt3RBe/NJNN3q+UMaw8TRDb2g85XhEYs1Rozh5lwAEdwS7puh/TO2CJeRgf60Mjkba8NTdq3lInRUwEndN4W+QOW7Nnkc5MOVCeQIyHgkUBsPp/dcOwiv8bVrv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7397

soc_get_playback_capture() is now handling DPCM and normal
comprehensively for playback/capture stream in same code.
This patch converts dpcm_xxx flag to xxx_assertion.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sof/nocodec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index 34aa8a7cfc7d..0f0632456398 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -56,9 +56,9 @@ static int sof_nocodec_bes_setup(struct device *dev,
 		links[i].cpus->dai_name = drv[i].name;
 		links[i].platforms->name = dev_name(dev->parent);
 		if (drv[i].playback.channels_min)
-			links[i].dpcm_playback = 1;
+			links[i].playback_assertion = 1;
 		if (drv[i].capture.channels_min)
-			links[i].dpcm_capture = 1;
+			links[i].capture_assertion = 1;
 
 		links[i].be_hw_params_fixup = sof_pcm_dai_link_fixup;
 	}
-- 
2.25.1

