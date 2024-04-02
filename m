Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2127.outbound.protection.outlook.com [40.107.114.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0489310E4
	for <imx@lists.linux.dev>; Tue,  2 Apr 2024 00:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712017792; cv=fail; b=r8H7QXb4l5jOaqzJuggsk6ZrCJifsGbBH/3IGe0SXnovvP4gG0Osgi+6crAo8tGIULx1Y7myfEv0nN/zWJSwUmsFq4J9KPPCDIVJ44IVgi3NDA88ZnKTN/M83gyPpPEFY4JcRJhhbSb9zLELk2E1vl086eYwEFN6KZbvnim2uTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712017792; c=relaxed/simple;
	bh=cFS2KoV/81YDcuKEnZ3Yo0ObdaUsNP+zK3/fq29NRNc=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LoNhXrojI67KlMJ59mkN/v7b2rqWA32Cz/7TqsCj1YT73Ye58Ny3FkWqk5aLbB+2adGJTsSY3Rvbhg5CY0OSQ7QS/3BDL5xkT4EkOJ6dfqMdW5WP/cxfdv8cW9tyDIEf2OC2jwhkFs+WweWe7pitBT1OR8a+C5VjFvyVYA03j6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dwcW39jU; arc=fail smtp.client-ip=40.107.114.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dwcW39jU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQT08tDuaFSGrvmn1YB7TnCxHy8xuU/caLrwOY0b9W1eK3gfaW++tZWapec6pnuDyMp1rP3dYNgX3M0FcdxLZ9mXNN4JkAzcCzCdbW1hNgXj4z+AuLdjq/q3g50cgxVGgyrL1DFP6NF4yP0qoc9K0Pg89ZWIadmQPpPmQbEEfRHX1HMeMycioOX2trwYA3+GjSSm1YZW5mRjZzIbzyZwfZF0l8vpblt4Yn5RyPEESy0GIQADtJ61Sr7Hk+Ryemj0yNMP1+3DfZbiTQqwM0DbBNFCsvgffPvxW3ioKeYFpfTHNUs0mMns5izONJKfJrjcETAqiTiro6wT1gQ/x54cQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aglMljJFD/9xFavc230GGzpik1KDbBw7Q6sk5fk8Y6k=;
 b=di/gif6BiGzlfaNaSBnN5/TYwfoNGPKAPc2Rmfa5ihL3J5F4IIqILTxNUKA11FSaJPj6cGFvLhzC1jaHinnnWSa3YW5Mcl/9EeYLyxjJ0JWA+68Wy+1FGfqJfP5Q7obGRCuxHjvwwG1oqqZzqnHgrWn6666iz62pcxc2wq1l7scw0N7kTInkAf4Vwr7UR/yfln0U0/IA3vTMcHXkwpipzkffYAsieFeXURGebBvZutl5tnfB5+aWX7cH1zFBYY4zN0WvoMgWBcCnGrkJLbMwmkUbkAUQtllOKxpf89av70YUIcnuku0ohrnY1E3zDP2Mtps1p3OTfzgEmRCYCbfAVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aglMljJFD/9xFavc230GGzpik1KDbBw7Q6sk5fk8Y6k=;
 b=dwcW39jUGH/HRD62Q0NFwNqTPaFPtRo2NyRVrhhSkUBtIgCTmpyd4ud51Yl7jq7LgXGHw5buXvgi+du/9XKsoPGEmSu3poEY5CqM5I6zU8SEETUAxN/VSfQe6VEWoXVuZJjn5V8HlN+UfeLdaprg4MB6pprx+04/Cdg05mSzMKI=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9543.jpnprd01.prod.outlook.com
 (2603:1096:400:1a6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 00:29:46 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Tue, 2 Apr 2024
 00:29:46 +0000
Message-ID: <87y19w7gjq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
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
 <peter.ujfalusi@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Trevor Wu
 <trevor.wu@mediatek.com>,	Vinod Koul <vkoul@kernel.org>,	Xiubo Li
 <Xiubo.Lee@gmail.com>,	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-sound@vger.kernel.org,	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 13/16] ASoC: remove snd_soc_dai_link_set_capabilities()
In-Reply-To: <54ace545-8cdc-49aa-8214-5f07bee0e2f6@linux.intel.com>
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
	<87h6gludmj.wl-kuninori.morimoto.gx@renesas.com>
	<54ace545-8cdc-49aa-8214-5f07bee0e2f6@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 2 Apr 2024 00:29:45 +0000
X-ClientProxiedBy: TYCP286CA0269.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9543:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RBwmLp2KF+KJ3x3UNXWmRq8ZvLSoLHX87O6/YBBpGG95u0znRilVbuNL+NvuAEAT0inVTxB9H5g+WlaihWBPPXS7AIbvDycCljaCZ6KMBjEoi9z93qVQW3Y8VY6hofNV45uVdUgKw8eyPD8sEd8Ilo9acdFoStZKR+0nlx7K4qMxObTN1ZvUlUx+kpvLLuILv/3uAKaKgr27NMoF73qSnhlTr+kLGv2jSX3C4PsOVg24Otswd6V/fm1Jh+xhvTRHT6KtPVhvTsXfTZdKJWmFKnHK6I6/uaK7r7Dh0f6T6qyVWuShAjUSIQhSq9qR3izt2zBjbvOQ0wWW/cvvY8wJ5nzPU6JvbXNLQNMQ6GU0+PhG4afAyEQRY91eVtHTZx69YMUMrmwCOiFnqaP/xD+e9eGF1oEbHPkGpeNL0aSX5A8PV0QKayHHV1/iSMDshION3AJvnPSAbNLH5jZ6yWkyioDXlhPxkEiqTGa4JoiO1XCfyACurpkld/hSC9tOBQK4h4NgEMeREhhd74A+YtPm56L92eO+W53Pa8d3dMg+mJdVhnNapCJYRNSh5mhkIh/W5/6J8jzgHizVi0Pq3eR4gCxdl37r3+OywZDmRPesQ1XWCpVmsTUjOrMfYVHgmqUqJpM4JFCW5FqZ+zWSh7txk+OWiNT07T+FFEPha8tWdqn+/uU+HZWnR9bKgHUwoE6TYs2zSzYOQW2c+jo5qcrcQw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(376005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xsjJ91JnXXbDXRja8B+jqvtHSSPte7xZ1v/EYHx50dijtUFI3K8hMp+XLvkD?=
 =?us-ascii?Q?xPPx4Zw0FHJ9NIEQ98KfewPZnF/tGHBd8m3lGonTWQFMEk9dPR6Dp2X/wB3d?=
 =?us-ascii?Q?0PEJlxJ5nzpinyJtv4dr9RZ1jdtDzAd5xdRYD0781e7wlWz3ASW+kwCYr+Au?=
 =?us-ascii?Q?g8P6v4IhUGY8xFFqLxgJvyOfi6oFrZnNnBlC0GJ6uAwwoMIA+DzDV0BRJIv7?=
 =?us-ascii?Q?S3Ly83COJfAmghkC0mNDc+aEMjh7Yb0X0ACsFQrmqhk4NkNEfBdDeKOIGlhd?=
 =?us-ascii?Q?2rsHF49M/Ze8CmMAmp5Pp8YmMnqz4oIsBbUn8D0RfioKi2kM4nJV4YNgouAk?=
 =?us-ascii?Q?5gsrUdC/1VXUyAVcaBbVVrKWzeNxNTz6j+xzyADpDHJj5F52ysvJWcTVR7Dg?=
 =?us-ascii?Q?WhUhFKIjcyGeIykZLLdp1B92v9T7eFeMrqRpm9X3lbdtDOHVvu6omX8N8eP/?=
 =?us-ascii?Q?0q6QLc+wYbVsYwYizReujQ6xPu+o9kxFDMGcVsXgmU4Aw8Nm/bso3ygonxjs?=
 =?us-ascii?Q?srq2pcTuO1rSmN99eknImKwdjygsZm7gWoSN44XQWMr2gHnfzf8h7oaOR+ta?=
 =?us-ascii?Q?4RN5SMs6ahKNduzHR5Q+NFEMx0z4rlXfNCtBw8uMMa1fb+tPFtIts+i0FwcB?=
 =?us-ascii?Q?q4Zj86n7JXDWG7TRgqp9HR4h1mFm7MGFDe6DD/mn8mVZVZDB1YKk7uVWwepb?=
 =?us-ascii?Q?PSPqR8KeqvhkmYRvOJHDvkjaEyXJdQ17KURc/KQy5VoHdi3FUwMh9ooOb2pj?=
 =?us-ascii?Q?34AF9/SoNMWntLPwU9oBhLMfvOMQYv/sKTPHbTMdz1vMLCnen53Y2v5O/EZn?=
 =?us-ascii?Q?dVrQxbmG/7MUQOTbrPqBRBdQSqGX2JkS2FeWxc8/rsMOidHnJ5TKaDZ3TsVS?=
 =?us-ascii?Q?scx0TdeBo74gcJlWLml5VWe8HAi1dEhF2VG5czbmOVY/6zvc19ppwmqV9uSj?=
 =?us-ascii?Q?EDLtyE547l92IdZWDsKit4kyguDMsRVGEWVgkIj3awryOsQm0LnG8SbPQrlS?=
 =?us-ascii?Q?AqJTvSOMDzl22hVpYFUmXm0hFJRbTrboRWLFwYtJ0C0rUgRcexnjgqBAFauW?=
 =?us-ascii?Q?qbLHTekZeX27pjLJNxX48fY3Apfwrg8NccvoCAJvj2gyMyQkp1oHCjBf4msm?=
 =?us-ascii?Q?dM9tsAW5b6Rt9R4Bq7DqT8PvT1dOq5ic7cHhsnI8WQFmApHzRckKOy2ycA4P?=
 =?us-ascii?Q?JpUOErz5UZ2uD8PEUI616Ze7E8X3rxb/aolQGzpBwZuk2L/S/vLDldnkvunL?=
 =?us-ascii?Q?0ubcYnMAwg0XAmUWo1X8C9Rhz+c+TJ5sJRRpPYswFkd6fEwXVZ0dukVyk5ma?=
 =?us-ascii?Q?0vu+NoWrdRTThproG2JM8YDz/U0DxFaUwgKvD5COf2t8aiFH7jt6sV2p+XB/?=
 =?us-ascii?Q?YRCg7Wh7HmKMllq5HIniDlfHXjgucoUlW59xHDolA8Gx8ClUwEYDgylhhrXJ?=
 =?us-ascii?Q?noaMINQLw2ymqkK5gjdmLRqCXu8TW2d4jmPbBCgX6ko0ftvlgR0Tfq1qWxv0?=
 =?us-ascii?Q?Y5akcx3dkmpXiCcq77Qgp24TJ2tZGitwegjGxp5JOFYc0T0NDO92yFTc/i3Y?=
 =?us-ascii?Q?xJk4rGt2Ucpz6DoqnRZ9jZAZOLQvbYwssxbBAOzDV0hTUkW32OwYMVAwubC3?=
 =?us-ascii?Q?TKkreLH2YMulDZ9qLWlZhZ4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 363f88e6-04db-435c-9fb3-08dc52abff74
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 00:29:45.9908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zEKxkJE86HidTgHyB+Qcxo+HEpGYEudW/KttbFH3l/Z6N7g6MqJSK8G9ux7dIcMSj8ioG3HhaEvPnQ4ZJu1QpixVhoUckBg+pf0GSsfUvjw+md5gZb7Q2mBgVoySn/O2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9543


Hi Pierre-Louis

> > snd_soc_dai_link_set_capabilities() checks all CPU/Codec DAI (Y)(Z)
> > for Playback/Capture (X) and checks its validation (A), and setup
> > dpcm_playback/capture flags (a).
> > 
> > 	void snd_soc_dai_link_set_capabilities(...)
> > 	{
> > 		...
> > (X)		for_each_pcm_streams(direction) {
> > 			...
> > (Y)			for_each_link_cpus(dai_link, i, cpu) {
> > 				...
> > (A)				if (... snd_soc_dai_stream_valid(...)) {
> > 					...
> > 				}
> > 			}
> > (Z)			for_each_link_codecs(dai_link, i, codec) {
> > 				...
> > (A)				if (... snd_soc_dai_stream_valid(...)) {
> > 					...
> > 				}
> > 			}
> > 			...
> > 		}
> > 
> > (a)		dai_link->dpcm_playback = supported[...];
> > (a)		dai_link->dpcm_capture  = supported[...];
> > 	}
> > 
> > This validation check will be automatically done on new
> > soc_get_playback_capture(). snd_soc_dai_link_set_capabilities() is no
> > longer needed. Let's remove it.
> 
> Humm, this is really hard to review.
> 
> soc_get_playback_capture() used to do a verification of the match
> between dailink and dais, and now it doesn't have it any longer and this
> patch removes the checks?

Hmm..., Maybe I'm misunderstanding ?
I think this patch is very clear to remove, because it is 100% duplicate
code. Maybe this mutual misunderstanding is based [01/15] review ?
I think we need to dig it first.


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
