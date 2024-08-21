Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010041.outbound.protection.outlook.com [52.101.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E6553370
	for <imx@lists.linux.dev>; Wed, 21 Aug 2024 02:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724206169; cv=fail; b=qHTpL3J7hMKK9IL+Z053JyJaVhtcy1TlAxMNdsur52YbdZO69bEIJFu6N5D/db+3wFSim8VOTLfXj5lSwvpCqKqFULey3aXoTj2SDai7Z5YIfu+Q2KoWz/h69YOjuyQ90W84aZd0+1dzUfMa37KR4iSneYXWnVSV6nWeAvxeA/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724206169; c=relaxed/simple;
	bh=YPryaofCOdmKdQisDZH95mHZy9qN3fj/segISoxEEfc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XuhrKOkGH1WM1rk1lgNPxX4if66/fMxdZH+nAEHrgxMThBi2NjEASbybH88UrzB6NGaIBZ/ZkJeDYsQX0Z4an60JBSa4oMg9QfNwW/hHNwoLC9YUFyhXK/rti54rgnKH2cyWYIaje1g+26dY0NRGOjIXbw4bPlOHscw2IeLWcMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dy2ff+ut; arc=fail smtp.client-ip=52.101.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dy2ff+ut"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i8dff5hVFBa7NLVq9CGTt45gRIBP62+Xo4hP5iP9zuEk9pwYq1+skgFENQJvLTvI0mmbpIUYiBxaj1fMAelTc00XaaokCPffHyAsXM5pyp7ZoJKi7oj/jKuFjpswLrg/thApXqqdUVeZRQwA3q/isL9wXAULt90+aYpBMbudIgepBu9PC3tje92lPy5ta9XcU/2K7g5C3X6+EwW9TmKs7LQXdfFpWA8jlkRkfn+K26nLlUkY2l/AjpdSNHT+SB5x1ZUEeCx6LzmRFWbA5TIbzBVbcHcHIoz2Z0btmq8h1QXFlS9L6O6w1qHEs47D5iqInp5Ca/GlADIvjJgMlpJG5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17n/MLdL5Wvtqd+c2yn/3LLyqzFLbYmOUqrBBwKE6uc=;
 b=fadHSoiFTfq3ibrDAjkDkrcc+aPGuagiEYm50tesxL05gq9XQFvFvAhfxo/KJ4+W4i8azaRNWKBEbh2zXn0ttLeGqabjJ90f/AWhBnMOjyRoCdO83VRz6vU1ADk85LxeJ4j1+YPvtSRzn2EPYqIVRLM6CHuJzn2RzGmPrpEDf+/0gUbP74TRf57nIh1QN5Qgn4O/tcdUnuVPqpL+aAhUAiaeU15c0dnUeRoTvmBissjV8SJz6kl8UapKd+SAlT///TZ5x0u0UP6tWbNzDlMKJXzNB2f4aO34xp6klMuBlsZJiv92jOUrTjR0/pcFD5Yyc4eLmIHkyQmNxh1dD16smw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17n/MLdL5Wvtqd+c2yn/3LLyqzFLbYmOUqrBBwKE6uc=;
 b=dy2ff+uth3gmtkCvDwBXhtygMpJoEQZzA9IHQvwdMDX4GiXSf2bdwnAAh8eknPIyJIM6lKw0EOtZQzNPncFSREv0wp0xYfJIctq7WepTiVTDk1dvXZ9nDUR8NnFyVunoVYOfZlhERft+l1Tn9vZrpBMKBKflHOdTWKdgBjqOFDE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12133.jpnprd01.prod.outlook.com
 (2603:1096:604:2e7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Wed, 21 Aug
 2024 02:09:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Wed, 21 Aug 2024
 02:09:18 +0000
Date: Wed, 21 Aug 2024 11:07:32 +0900
Message-ID: <87v7zuaasb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
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
	Maso Huang <maso.huang@mediatek.com>,	Matthias Brugger
 <matthias.bgg@gmail.com>,	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Vinod Koul
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,	linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 4/4] ASoC: Intel: sof_sdw: use playback/capture_only flags
In-Reply-To: <ee24e5e3-06e6-4b74-bdbc-2127ca3f181e@sirena.org.uk>
References: <87cymvlmki.wl-kuninori.morimoto.gx@renesas.com>
	<877cd3lmid.wl-kuninori.morimoto.gx@renesas.com>
	<ee24e5e3-06e6-4b74-bdbc-2127ca3f181e@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: TYCP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12133:EE_
X-MS-Office365-Filtering-Correlation-Id: 863d779f-dec9-4794-88c9-08dcc1862ae3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IkbjOIY4/TWuoY0WeCjHjJCyYhkhWuHyHlhA+e7tFFrndc0Vw4JQcditO3dd?=
 =?us-ascii?Q?re4XWbCNW7yAPoh7ktzig/7zhp6aEsVGL7knKXIcOUfHJGQf3vIXP+4J5O5e?=
 =?us-ascii?Q?CzRbT4s+x3nbq7yf+vApf7EqKudwbBGhCGwviczR8hMaHY2BhpyPkArnnh3+?=
 =?us-ascii?Q?3VFVOMUnEdOK5NdytPKg1zXA96o4fBEF+d4rPEXhEwxK4OIbJtBy64W4zr95?=
 =?us-ascii?Q?aY1rV3U/URIk4e/8YZislsifGXZc8nRB7lj7uCuva+/LoXRtKAbITb3GSiFH?=
 =?us-ascii?Q?9wa4Qmgso2PZxZOaqYGkn6i15yF6uhE/17roTMFLZUaVu0xso1eMBK04ZS1T?=
 =?us-ascii?Q?gPXkCas3OKEnBlnShO8qsYVE3f7QTiRJBxslTxgMuHquDueOT1/RIqEy4hJK?=
 =?us-ascii?Q?ubTm9zBOTNcwE+lJE0//gaPoCtkrL082wqMOdPxsEuMruKzgZHKWr6E7wwtY?=
 =?us-ascii?Q?TxvmrZbXjHZO0neJC3sjv2HleeMQV+8aY167I1V2lXcvRrEbu7aEs0lw2ngA?=
 =?us-ascii?Q?meNis/roJaKBrU28qIs2Sk7qzw710RTpig9/XwxhJ3mhiw5c8fX0Nmccy1Ey?=
 =?us-ascii?Q?ppEGJtDO+/LQjr7eCuRU6JLhDIfwyn1Y5fSwtUaYqrBgdlgA3kJtNuf2qq7K?=
 =?us-ascii?Q?vQUD3rTFkHhwfdC2VR6/jQAdg59iM5doOMDER/WIjENI3wkVXyEcudYshvOG?=
 =?us-ascii?Q?nnfCYEPrR4t8kFcgIk3p1ETkU1j1vLPSpWJXXhqgh/EwCk62lIxJcPKAlMPy?=
 =?us-ascii?Q?MGsiSscJNYCEnnsaqd/Jj3BY596uXnDq5CA6+cGLNz4v2Vs0k9TMc5PuIN3s?=
 =?us-ascii?Q?1bxthREYmAEAGEnbuJEI2btSOM7YSrgUaixk25/rNAw/IQznBjbUn+qhgEMa?=
 =?us-ascii?Q?TLGeVv2L7pwJZjNWUR7zWpQBAvKy0UFVQeipvfscGIKrw0mLCdu3FzNjXdpW?=
 =?us-ascii?Q?Hp7tVB40XYiMl0PB+xoWV30adtOFO9/Iuuc7fmSTOAy+jSmCx3Yzq2X2mmKc?=
 =?us-ascii?Q?2eIO7AFU1G58fN0TIL9Jj5qW3Wtx+MaIc49e/ZQHXIlVEwKrxGcCg+9mbZm6?=
 =?us-ascii?Q?JdzWT/ufTTgiurG/6373aeDmubdTLMGYZ6hK8r/zJKch5pjdhnj8eSUrYTZp?=
 =?us-ascii?Q?dpHb+buFIcnl1bv0kjkoeT7r2D9TsvN9MhAYKU1nfaenyAmkaiNE06F6raxN?=
 =?us-ascii?Q?R+GFDkvExSE8+Y0mdqgABSa5K2e1XhmMnty3pwrVl+/GuMGFvP97HVWSsN+X?=
 =?us-ascii?Q?f7RajoYEBTuPjhRUsO1dE9UNuiYqdHs4sBdIGAxhpAN+ACJ99QImR1aDmi2q?=
 =?us-ascii?Q?YFpRhaTjK4CMzVkcr5HLDqNSZKgTHodL4SLyQNdmzmqBZ1yrYuGfksKXBwQ0?=
 =?us-ascii?Q?oVs7TT8Grq/u+ZKitE3BLLPWMYlO+smA7p8VJlTTaHbFjK/3Hg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q9wvpz1NJrjfwVol7lzp2hoi/dn5WFDclZ3hr2XeMBQzH163HRby+bI4t8xt?=
 =?us-ascii?Q?YyHJUrdMC78b0P8SasZzlTHGr0aFUy9oHv0//gv6uWIrwQQz3Irji8PodQA1?=
 =?us-ascii?Q?HbIOMytdtsOPAxKM4xqpOPPjwsjotRWxHp6UNkE8zlMwGk8pyhXa5NngHM9e?=
 =?us-ascii?Q?btTnyBEhcdKdtGWQTv6OiwMaZk1Q1GiCZvJK3mgYwZewk9i/AyCFBVKOcOuQ?=
 =?us-ascii?Q?cOO84s7Sx+XZeO7hI80RCp0GyJy8BCVNPGJ0XLUux/+q+49nWALduMqdBriP?=
 =?us-ascii?Q?0KHiB8PKYg+kAhkvcxt2yh2yZSi+mUChmfA825nPEFjuiwLAqBg2ySOzoW7I?=
 =?us-ascii?Q?ouEaH/Y8EcSuPN0/2kWeASrKa9GwPedJOCRUMplzliNd27vUvDW6wssIasU3?=
 =?us-ascii?Q?GW557dq7VNxpnnza07RMmHax1MmzFCVTW6e1G1ZnmrrLiAksqT1Siiuj5Aum?=
 =?us-ascii?Q?rueU2GkWFIZKyLqY4waHVXo3ooV1Y7WB4B2dmvSJm9RK2LNyOLnyt33gM0lt?=
 =?us-ascii?Q?Yi/4csjUbeY2h/ISbpUUgKQvcKvN5jAAAnjhG974nRXSXaFNQzY5FcDtD8Z2?=
 =?us-ascii?Q?qz26g4wYVrc0piU18Ch/lWVY1pHu4VdZCno0FcAWmjmgn6G5WlhnyisdrJ9B?=
 =?us-ascii?Q?6sg/V70ayzESqKD82pMQkxVpa20wuOGrt9l8V4LPQblcU2lQj0fPUl7ryx5j?=
 =?us-ascii?Q?uQhUcVohCVD3+cJz33y2Fk9sxAB+SOeQkobCAS/9lLS7S3jycLZNsqqxn3Ms?=
 =?us-ascii?Q?dmhL0A/WEMeVbAOTvFc13KU5bMo3AFyT67nbQWjtakUzkJDgXmBn6xBJ9U+n?=
 =?us-ascii?Q?YoqJiFNXrSKNjJPcOMx0P0Rx159q9iC+y+PjCTOG3Lkc/rtg2yPCBwKvrpwL?=
 =?us-ascii?Q?TBFHHwlMn7OP5dVeU/8KNlaGh65W7mdRO+bsDcOaS72oZBBYGUFejM/G8c3q?=
 =?us-ascii?Q?QpzBmitZElKFiZVM3IQ4/MttU6X8aCZssGQlkoW2mj47KY5P9a+suy+Bsuzy?=
 =?us-ascii?Q?7kpVhWqnEiaDwN/+9QQZ0zKFnLwFWB84EWzJUZ5WXRoKb896aSBSNfCYnB2x?=
 =?us-ascii?Q?rMkOTMb0YuNqijuo5N9XedtbIOeFQl2rhKd+4ENETEkgYSZ4VYLG6Lg87dh7?=
 =?us-ascii?Q?NpOxhJVE0rukCw/BGCMcnWKnqnzZKhqHuH5H1HKgmlLsmP+rJaAlJP4/fEYN?=
 =?us-ascii?Q?ccHIkT8nzmSLhPaa9KFFHAtCpJvHhwg35u09/EFER/xVcP7u2odYNjvM1AQa?=
 =?us-ascii?Q?upkznQeJ+/7QrYa7aVrUNh20ZWKOU+pO977GWge/saJ5qQQQqfSk3vyS7oWC?=
 =?us-ascii?Q?O97EfqvS0IxcsDytTVKG6uwifPDijS4Rx5kPD2HYg83I5xhbV2vLpUGHJAR9?=
 =?us-ascii?Q?w5HdsekzgofVT+Qcl2DWJSJtMs6G7OHpfCPru4pR/P62EIOngNOhdibUz1nv?=
 =?us-ascii?Q?gOScW+0rgG/RU/NWT+DopBLdx8Ahn4LFltaTU6SNUnpbUAZwvj3ZlI4nPHx4?=
 =?us-ascii?Q?0NIK3/LwJqhw/ax4j5BpFPyYxG56LOqHbGcIc37pmVjPms8e7g4V1YJJIiHM?=
 =?us-ascii?Q?rPz9D1jtZ8DlvlKGpbQiIi3xjaJQw0qQ2k/HGdzJjjiEUt/08G18L7DAL9BA?=
 =?us-ascii?Q?Qi81h6A4av7Bc8X+ojA4rX8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 863d779f-dec9-4794-88c9-08dcc1862ae3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 02:09:07.0951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k0S+tqdKng2cEqwh+3ckccnyIygveNkTMEAuZV93PCjkdAoa5rBtVcfIKLzGjiWIJuYF9rzZDCO+Le6eMUX7+/UQprF9wOhQsQPrAL9I6Fl5qlLo+Z2geEJFhnQ7BCaX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12133


Hi Mark, Pierre-Louis

> > From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > 
> > Prepare for removal of dpcm_playback and dpcm_capture flags in
> > dailinks.
> 
> This seems like it needs a rebase against my current tree.

It seems Intel has big change to shares the code.
I will post v8 patch, but I think Intel want to test it before
Mark apply it.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
