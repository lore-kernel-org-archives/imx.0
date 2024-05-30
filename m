Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11010000.outbound.protection.outlook.com [52.101.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA56B134DE
	for <imx@lists.linux.dev>; Thu, 30 May 2024 01:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717032573; cv=fail; b=eEDJUHCaodXijOjufTXAwwzb3b0kO9StZrhQGRjfuOt7mlw0Drgk1q5zNYBuVyRArS/cblSPZRtJYd3hbvimQroL2E70vRc6S2CaWTwL8JcgjpPNNWgmjVP6JqKFDR8/P8nsGJo9sfKeGN4hKpKC/W9Tb6Hf7harxLx9kKjC1X4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717032573; c=relaxed/simple;
	bh=K7GizF42kiXKUqUbu/98dj6MkuY1pUVTD6FpdRg2aQM=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pfQaPlsNG5AU9WDLMi1yQfCRLjVe+kfLc/kBwCqkhrsdho48E/FJUzosQb3L4lZb7+wpenNg3Ot1kOh0+ABrd1iDmseolQaK5FPQxy/+z96s3IE2lX/BSmIw7Y8P96/8aeFU00SKMA+1xi9MaxirjlUmZL4nm26mtPpcl2rsuSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YweU7Ob+; arc=fail smtp.client-ip=52.101.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YweU7Ob+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ClU/6OpSR6x8NqFQB6JLDXsWZb+D4nUrEsrYhPSvX7IJIf3DfmojknHQ1uLoo8RQC0mNlTUTmzC1SrH198h+y4wfiFYm6HDu076bgV9C6Q5Z8K3Vk8slx0F7TXjBrBT+fzVRbmp9od4hEZabfvCcirM+RmULZVBCnV4r32FXub6dMvUiMIDWTY0hbJSWHtnvnWMsx8ppjjp/uitgRD2NpXKWxAvgBgcs+R6K9pQrO8r6MFu2k9QV8M91NVdz1O3Uui2wO4ufDlZQkCPW0gMBzg8E8gVQpuO/eG9j/ir8IzMOUqu4r93+HDIg/s4IPjHwX+3doFCBEUW1bxjxvjUQow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IXvJb9QCSi3hFo3NOma/jaNF5a4oYsLOGIYNLZH53o=;
 b=TCpG7Tdkmi8R90vQKpNouX8d/0K5xbpWGSS06LNHIEyfQvrQAc+5P2nDccYn40rxbti3pluhUlg5oDsA+tI0YO3ExQ1cJEfzDOcgWMVyzLHh9/M1hMVH1LXRFmpu+/C3gIjWVDms4sVYXmTCA1gJKN3Q6ZZeKFVXEb/At46VMDoVLWDJL/wfIPhFVtGng9I6FWVpUoXQrQd/ezLJz7b2YroDZROT5dDd4+x7ywK4Frjyd3pCDUqVj8VSGiwGJsak2rBPqEqCywWEU8JlkdhBQ8LUT6D64zOTOrtRfIU+wq+APSu65PbU61jR9CgdncdtojPDxa+0vM/X1Qb/0qnK0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IXvJb9QCSi3hFo3NOma/jaNF5a4oYsLOGIYNLZH53o=;
 b=YweU7Ob+rmyM8kiy/wUuAnHIJhtDl/ojqkUzxOXcSBNHpShB6oilnn+rVanBKk+BSTy9f238n6hOxwCl0uG4l+yfB4LjM6c/dCzgiaemyxttxNvU0kqHN2PoYAn6ALKd5Rr27L64VGKuagbw0aLOrSHKFmhPVwwbIjEFLHcqzDk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB5524.jpnprd01.prod.outlook.com
 (2603:1096:604:a6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 01:29:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 01:29:29 +0000
Message-ID: <87ttigozns.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC 07/12] ASoC: soc-core: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
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
In-Reply-To: <874jagqe9w.wl-kuninori.morimoto.gx@renesas.com>
References: <874jagqe9w.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 30 May 2024 01:29:28 +0000
X-ClientProxiedBy: TYWPR01CA0037.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB5524:EE_
X-MS-Office365-Filtering-Correlation-Id: 681bc06c-37b1-4911-a24f-08dc8047f32f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|7416005|366007|1800799015|52116005|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?402BN9b6Rcbbq6sOZu1zC2RzG+Qamoc/8LaflJRwnE3VV7zRR9KDiJRLpyPp?=
 =?us-ascii?Q?OYEgT/VGPQmvJDqJEU6sFrmSjvPF1bGpn+qr9yFA5PHJ5A3us2q8SzBiI/jR?=
 =?us-ascii?Q?DocRznAdCiaP8DTheI5Z8s7koZMB0VGdOxQpcbAFblaYZybhxPbpP1ySDwDi?=
 =?us-ascii?Q?qnhvnv8UdaxEtrDAMBAQvTy/rtatQ/dQ8rbysiUkF2CA5IfnzgQSI5sGS2wt?=
 =?us-ascii?Q?ypfYUmPVbJSMurUOIRnX6W7ObRMy4pxvnzxy91zIIC12NwnW3mbfOeJcGQBR?=
 =?us-ascii?Q?XLiIe6iiBjF/7EEdQxZzks4UuECqDTXNf3Urwf9MkIUZyMOIqT4dDuFDKThi?=
 =?us-ascii?Q?wYPZqX2JV+Z7a8EobyN4o2woyWa7gsbux8r0KAiQ0gbme5j958ubkgUN5Lbq?=
 =?us-ascii?Q?zqTnm0+wS+0v/sdlpmY9/PsbQNQiV5Gi6KHijp4Z5tzXwZ7oAu3sjLTQHIbW?=
 =?us-ascii?Q?ZW/JPr18S6Nr5iY6JU2/OreqgiZeWPw9paIel4lxqeR+mr2tGrC3Fxr/j3Sp?=
 =?us-ascii?Q?beUEiZTyACjmIFgrrOj6XLRfla9kgkJNPZ3MOdeQ2cSq3lsVEUsUgRbmW6n+?=
 =?us-ascii?Q?B8q6Pfw1h0HBoUBatlHs0l3SqZZwql9r+5xiPvwK2UBuAB+W3udsycWZwCdg?=
 =?us-ascii?Q?FZGx+jHi+nh3DuGOCYL5fNjc/7sWY4QipswrtANf4Es5FzBwbhAuHuo4g0oC?=
 =?us-ascii?Q?LB7lmpgSVjY8PTtlR42jBYtEKRUIwLaIB7ks57UHMDgnr2LgXqbYFB+2RnPR?=
 =?us-ascii?Q?6WRjMh48cMe6jqJxIv/MJHwYVuCJ5wnzcDILyqS6iOWW9oBzPJuoRVhYPIpy?=
 =?us-ascii?Q?COgfKXxQRHyPcfwDoAF80n7HETNHE0DRHUXf7t6nK84AiDGAfoQa8d0C45Nu?=
 =?us-ascii?Q?6a7bOtHGzFImp9P3xv042aijUj2KzV/fWGqWUZGgeQwjdY8QePCqKEZmgWCi?=
 =?us-ascii?Q?fIlev3y5Gix7ReG5/RGY2XXfpS6O2EziUJJv95IwiSX5oitodEQMeUB+718T?=
 =?us-ascii?Q?mSHbvnIQuHuRDAVWNm6GgK9cNieMogw4Z3a0rbZpST7Lv+QSAta4l5M2RHq1?=
 =?us-ascii?Q?cdtmCJqmrSgY4pSEfjKazCofnc8aUl9gkL58arGPopt2n4cgCWKou2+LcLxx?=
 =?us-ascii?Q?2ewq6LP6UnKcI7mvTjd4+ayI7/PsW6lUDX1ha5fevQ/0QJnpiMD5xUJG0uUx?=
 =?us-ascii?Q?IrZq+CzAvFOyemeKCDh9O35C5TtIPmDATGxcO11iA0zYrwLfLuSkvVZHx0Je?=
 =?us-ascii?Q?otLkGvLWQdT37+vZRNVIx9corpMRVEGUkTwj5K4DBIAtMKqlOXCKvWzeS+mm?=
 =?us-ascii?Q?K7jtnLww3DDNv8r4WCI5lZKTQqW3f3dwrRQs+cBKNoOez39Q/D02co2RJt9/?=
 =?us-ascii?Q?1OxvpFo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(366007)(1800799015)(52116005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?63Ap8hua6NGZUDF8iYl+K/MZ9/0YO1HZYntf9PJwrk1Zgkbgzphtfbbgw/fV?=
 =?us-ascii?Q?wIU7TcY2id/18fel3eoOwefjpovVq9QXRVN1wgiVn2C3TWOuLqGXSOR2c8Bw?=
 =?us-ascii?Q?DrzSvRMTCyhUfySV8n8e9mXyx9LYoVqAOGBDWXDHQL4Ww0T9w8KrEdp9o2Bg?=
 =?us-ascii?Q?78trc0gmbtO6dDLvz3SV8sWfgIQJa2OIVer7PtSdOS+k1BUcWg+8+w26bpbi?=
 =?us-ascii?Q?vqPn4Bcj34WNMh89uZCif58wflKG+OwVtgt/nijg0fFM2hgcht5ZDBT5fpbd?=
 =?us-ascii?Q?MYOJXxF+fckmSi67pIGLs3pOSmk9t6MRflY7yuOf95FMH2W7OqRRJFjjbChG?=
 =?us-ascii?Q?a8E5LW9nsFm5xa9p/gBaP9gNnkAc/5guWOPhgx/Lru6kgTT6AZ3I8LON80Y7?=
 =?us-ascii?Q?eB8yhpNlHsI9NDHfEw8nJs5Vi0EFJPvZPiwO9tm1QjWfzADJ9qcrI+CcnrkP?=
 =?us-ascii?Q?TXdPGri7I2aom68mv+Rd6sw5B18O0rHxQf+A12TnDMTabTiw0YDndPrtjuKZ?=
 =?us-ascii?Q?dPMFrhR27zdtBqeKemA/iPZnkczjceh5JSCnrG4fU7+DsoOLjqlH6oywkver?=
 =?us-ascii?Q?hjQ4C/lCM6AWpuNxODFITsnC/4JK6hHkPfPMbe7VjYHj/1DQwEHUm4vDda/D?=
 =?us-ascii?Q?ySayX854s9cxRJWk3l/FKvn1bCaInXe49SpEMI/fYuBeYTpn7Hy9WC/Nu7ax?=
 =?us-ascii?Q?W30jHNt3wPUKHpPBzBWNpHUydnv7RC7lMjdz/I+kmUxVR4Kr6knwgBPyQqhG?=
 =?us-ascii?Q?WrODp846EPYUWxJcyms4LkMmCKszqwF8WPQRYkcdsY7qmc+U6GyVARXOq45S?=
 =?us-ascii?Q?R3e+h4dK6FWBmBOurYx3KJNEcujvMHJvb8/84elzS2ceXf52xMUvV0Hg6SZO?=
 =?us-ascii?Q?PjnR/bj86RFy8gZ25Fch05QjFBXITfyFoi5NmkaDyd+rFDExw7OvgRt5cz1/?=
 =?us-ascii?Q?uz20HcDJpb68OVNd/iZClytsrOqp6gQEp97tHVcodxXOrroFQ4wmumeM3ung?=
 =?us-ascii?Q?sgyTaWirFHoV41xBHe0KHcJdYY49BLxjyQ890udIPqNCJ/mG9JkQ1cCxjJJk?=
 =?us-ascii?Q?Jic20NdHywCaU6b+FSzs2VAoVOJ9iwV4ionPavTG15Rh5NDJYUlITHXr6lBA?=
 =?us-ascii?Q?Xir3qtdZnpylSy8qvmVKESHtr332VFN8E2MYStZawwbLF+3KjBfOKqEA8wdu?=
 =?us-ascii?Q?rcKHMntaJrpO6PiQ2Qwi1xhQBzhF161CnxDANSveYxqOdOh/8SQGc+53qDyG?=
 =?us-ascii?Q?LZImyHnDVVjgSVr2tFZRIUd0v5O7sknw+JmNIRYY1xoADSO76E15VxV4TUhS?=
 =?us-ascii?Q?bHLhDViG4EGXXMJkwBrwotAw5A4t2Ckw1fRvmAeP/4Ol6PCakJ3dG/1dpTfv?=
 =?us-ascii?Q?7qD+nNO5VVOBGyx/Fp+FlwHlF7LT5WncUHDuqztxUliyBQd8o/b5wFWvTpNv?=
 =?us-ascii?Q?T2wPpySwcRwoJIAUVo0k2YGIseAs5k+s8M7xM3FmwzgHr/UyVG3/brg3Hwil?=
 =?us-ascii?Q?a+HRrnhxMmYgm4irpQX0WDwcjLUSDVyuRASjzlWqWCNUgYaGb8pm5fs9o/zF?=
 =?us-ascii?Q?0y0JMVMA4FLkuZlqymX7SL3TrUHyc7axN9u1gPhoXkK4lYykEqm+kE9VKrjR?=
 =?us-ascii?Q?YZjNjfCXcYQdgEDY/mT7P84=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 681bc06c-37b1-4911-a24f-08dc8047f32f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 01:29:29.2038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNe/2eZ7KSzEeSJmgl0rVC4UJ8BA5ViXUgbQ69He1wIyFAgllryWDSLYYeTB1Wu/nesMUKBIbtPe7vE+zVm/8N6EFMqCyLHiPhVG+XULanlfej/zE/V9K5VaQZFbNXo9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5524

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 3ab6626ad6802..b168cf642092c 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2000,25 +2000,7 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
 				dai_link->platforms->name = component->name;
 
 			/* convert non BE into BE */
-			if (!dai_link->no_pcm) {
-				dai_link->no_pcm = 1;
-
-				if (dai_link->dpcm_playback)
-					dev_warn(card->dev,
-						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_playback=1\n",
-						 dai_link->name);
-				if (dai_link->dpcm_capture)
-					dev_warn(card->dev,
-						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_capture=1\n",
-						 dai_link->name);
-
-				/* convert normal link into DPCM one */
-				if (!(dai_link->dpcm_playback ||
-				      dai_link->dpcm_capture)) {
-					dai_link->dpcm_playback = !dai_link->capture_only;
-					dai_link->dpcm_capture = !dai_link->playback_only;
-				}
-			}
+			dai_link->no_pcm = 1;
 
 			/*
 			 * override any BE fixups
-- 
2.43.0

