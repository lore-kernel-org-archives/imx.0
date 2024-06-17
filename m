Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2079.outbound.protection.outlook.com [40.107.113.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5808029B0
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 00:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718585453; cv=fail; b=Gzxyrb31UgbnnjtSKeinu4CFe3HQG/j1YWDYoG6lk27s01j4CphRBv39FT/J432uUanxtYITxxKsry9vEZdlD58mtZ/tb9ugMwMBvVK+bnacKmk1/otpOJaGB9NF70MTfWbmX+fu+JtGOD1yhe63y6VBGkz4giOI72Li9M4J2hU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718585453; c=relaxed/simple;
	bh=iSU3JJsNU5z33Am48uwyctCzLsp+FdUOPoHqbrUbFKY=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lDt6YniuigsxiLOxI61IGNJ9wtzlKn6492l7aSNo42ybyUpbkRIRxFwSshobOr+SGgr4MeRQmY96q6iUVrcNMd/qE/ijuo8uvLqNRhLXBaujJ6QnvATYc+RAuiN7YS/7X5wM/xU66JZ1X9lJY/6oivhf/UjMVorqSziWMeBQk+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=F8Vj8LZq; arc=fail smtp.client-ip=40.107.113.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="F8Vj8LZq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCfgznIDo6egccXxQwVUTGftcPfvPMr6yyl8mIuLMUFvODDGe5rCERiVDQ6Ko4FZZnQlEypPIkd5ZBWeYNrkP2UJCQjdJEGb3EAMrF2OdfMfr/XkkJLuFeDBtP6xvb9ocqJvUo/gEKS+GiXXPxT5ioZ/IM5bOM0nddmzvhkKzDiHCdCABrObupvndfBEEKEGvfa+4lGF5n1hGAIWXnkQvZtIhyKN6j4GfZl48NcGW+oz9Q8HzdMUSFjm0jwaB2jn7FI4zQSZLPYxJZcW+zlniauFVU8UIYtEw75N2YnORFjCTFQ1Rqmqc/8GiflEjcxsi//r+32c9NxMlnpoqxHOuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W38nidIvKGQqFNX3kjmn0/hAzSh3plyKNuEVs3DX0iE=;
 b=UvV0nK3CestX9bZNyTJxa2yF37LlXEB5l9BD4zEzb22mPe86oSWJfkZbdQGb1wjqKQnwpzk5XDNm6xlCqFkI02fvYxCsZ6L4sIEyKWfLJYuiLjTje2tzOQDmE5X6zga9UB+T7oY9lif57AoTZ+QrUc88txRXUCnShrFdhs1oElMtv+WelDQXydTtB43ebp3/cp800/Jgs4EfC82+pP8/e2Ml2h/fjkcmEtgA2Z69PTx4SkWRCyQBlgE9E3BpcPgIsQOw2XcM+592nhr+QEiWbWwYWPdgk8LCY2cAuP3H5NWUi8y/4LUQpNPN1Xedh2wme8bT2nRwM5WL+qKlLUe/BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W38nidIvKGQqFNX3kjmn0/hAzSh3plyKNuEVs3DX0iE=;
 b=F8Vj8LZqmBS9YAoR9TMCazW6wQ5ZvrLv5mg6I0SxFle/BzY2aD24Hjho6fdL70Vk5ByT0EhYa2/Nz6jy1fI6jfRfiO4vbZ0TtUtiItQ8+6RlljorQ6G3Ny3Tjr6R3Y1ycmNlshtZYDKdhpQfmWtIGmeN6LFBbxuvnYxDfeTBsSQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7897.jpnprd01.prod.outlook.com
 (2603:1096:604:178::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 17 Jun
 2024 00:50:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 00:50:47 +0000
Message-ID: <87y174s87t.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 resend 3/4] ASoC: amlogic: do not use dpcm_playback/capture flags
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
In-Reply-To: <8734pctmte.wl-kuninori.morimoto.gx@renesas.com>
References: <8734pctmte.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Jun 2024 00:50:46 +0000
X-ClientProxiedBy: TYCP286CA0285.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7897:EE_
X-MS-Office365-Filtering-Correlation-Id: a5357f9d-84a9-40d1-d991-08dc8e6786f1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|1800799021|366013|52116011|7416011|376011|38350700011|921017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6zvOBqR9n3TSwnQVVukorBBMPK0A/rVoSdp0OuF4WWxcpac9kTgLbfh4T3aG?=
 =?us-ascii?Q?mmflhEnXYvXmVYQfC3t+YNBNa4qAOdlPtdJHt1O3+TAZRfzYx5ia9KhOVtKD?=
 =?us-ascii?Q?L3YfnEVnhwCMscS2k7nPcfaptKdZtHe2F3IEMMg0DpGR4vCDd8mzULQ3uLtL?=
 =?us-ascii?Q?YbGi8S1tDeR6/yhx6u8UILV6QzTBdAaCNbwLFkAXgCpoIxPnY2J29h8nNTFf?=
 =?us-ascii?Q?jK05dQKta5XNqs4f0itEi+olYu6U9fE60t1EkrtqrqvPDRmmfeR6daTfqIvm?=
 =?us-ascii?Q?u+EQQFvunpKDzWXq3+jlAoCIP/kR7EvdQvHP61gQpu8T1XNOB8geBz2bD3P0?=
 =?us-ascii?Q?ypKRIb0YakYTSoSOT31KA+Q91rX/s4f1pqmOm4eLOCauK/CjAnQcEaTf1X5B?=
 =?us-ascii?Q?03OfyNUvFPkWLxCL6QiAhBBZr4UhP3q7IoDa4oWvMRPEPxsMTtWXi7W+6cgN?=
 =?us-ascii?Q?dCqHUWRgQj2c3tv+ODMElQwBfqgzY6QcsSOi1CGqBNveZpp1Inmj4svUYCGR?=
 =?us-ascii?Q?JadFL8MYrsX10IyGyxK89TqY3CRkHx7izvyfjj9pJnzY95RqrHtrwRf9OgAo?=
 =?us-ascii?Q?sYWUU4h8ragcOL9LrdVA6agETRW41b/cpgzOYXRErxz3UTvrgEm5tVs86ddD?=
 =?us-ascii?Q?ahGAk6iDugh1vUjXDrMfwXtcIO1fdi1HElapxxB7wXf5ogsTZByMWyxi7x1+?=
 =?us-ascii?Q?ws+OjAuii28k+GS2RmMyWZueBsF2wxCdnB3wBtxb+k8cNWOg8c7b7PTc8RJ5?=
 =?us-ascii?Q?q3UfEtcdNR8pM27Gtv3PL9UIkf5WHsIfGNa6K7H6b2do0+KbWll5rpc9LNit?=
 =?us-ascii?Q?dtpe5pG5wUAPcUQ10X+kk/NSPSnJeyh2uOp9MjI/lDGbZpTbRA6nMF6fGkAS?=
 =?us-ascii?Q?gq9UPdqH57QgoSF+o2asrL4HfYGKfIeHMiVY/Jv0F0bx0aAOi7NLdCaPHhtW?=
 =?us-ascii?Q?lA/CPeoVnUiSkkCy3x9OX0WNlpWLllM5Hwdif8+FjPBrgiRd7hwex2vsBF6G?=
 =?us-ascii?Q?nGCFOIwgKWzJcJt6yAGxMZd0h5khqRtaIXRa7jCg/z8Kgmd4M13wyzchYNaH?=
 =?us-ascii?Q?puNUVlCy4Xt/OCk5dxIkvpLi/SP74ZGf9+iHLEEnIcbZkOp1v9L7yoBYlpI2?=
 =?us-ascii?Q?lID1+4g2nSeXKbNwjn30EiueiEu+LhhwMGbEeGzdImStSbSJiP3aTnXT67GX?=
 =?us-ascii?Q?5/NoP+daWH9ZqDIDvpSYw/LoASEQL6XdVH2gbLfyJPoSywMBuFXwJ6WIpA12?=
 =?us-ascii?Q?hvfL4DRin8YCr6TgIhHXKFHGgGbU2+FrE3qIJPIfZwlcSN5bsqalWfdvpSEe?=
 =?us-ascii?Q?cDKLzqjPUr+Xz8/sjeS9aMGnF8mOx9Ue7/aYXMpvBDGEQb0PZ6nWC7L3g9Ab?=
 =?us-ascii?Q?OtGxLfq4klGnNh9i3GHzIpI/KuON?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(52116011)(7416011)(376011)(38350700011)(921017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yvxHwVTEqapeLXxJZ5UZb0e6Rk34hnG4AB+7wEIZ5Zs+d2z/CRJlU0n4exaR?=
 =?us-ascii?Q?Bkx/8MlCCt4YYgq3K3tcORz5Jmqy0gjfSrGAkI0fGKPxjBSvxYXMojglmOzB?=
 =?us-ascii?Q?71oOukRvKx4dz78zhStodRI/pgJomkF2vQsvm0LzMKvj1Z0UN49E2zXrLunf?=
 =?us-ascii?Q?ul6OXU/8M/DDVUHF9ZyC9ujSYtx68WB2IVmI8xDoQJ74ljdErhEcsv2agGlq?=
 =?us-ascii?Q?ISwFZ5R/bkZZLzDDAucpLNDBI5og5qhv3cMJKVKqYBeT37rzLqEC8/3cjz3H?=
 =?us-ascii?Q?GmrIlyFLhePBPiumSvmanDrHforgWt7WW2hbS/ppC+ZWn28V7xRNDX93v1I3?=
 =?us-ascii?Q?kcMd9pyWomkEYNSPmYc23nMFZBYMnb7D7VcGwFvA5746GS+kgulKcyOAa9xh?=
 =?us-ascii?Q?ogPMoqKyedXfl8s9ymEeeDT79AjpmWYL9Kel4GpugMpVKen6uTrSWoY3VvRW?=
 =?us-ascii?Q?uhECNkTKziPTFJEpxuqhP+HIc6nznlJ7b5I9MWGUiFtlqXrZ0NAVt1YNA6Rt?=
 =?us-ascii?Q?u4mcZUMoQzotaPSL+kXOtLW3RVlqCZVl8JDNncqVnk27SLKHIUeDroYvqKWA?=
 =?us-ascii?Q?kYr71jvbkPBD7LIl/g3zsTrZPJG/i/U5E3KF/hIEXiwM0E71WUYLyKinXUb/?=
 =?us-ascii?Q?zkhs5O4OXtgS9o8WojIkx0djJa/xouEJ4P5fkGmK45YzhbRlTDjhxxdIPsDb?=
 =?us-ascii?Q?Yioc/5bdtriHUJDQqBcK+9wPilfAjjBnZqirc5UvPIJvkwQoxVT7FvfW88Lr?=
 =?us-ascii?Q?7Mmg0pgydJaVTtswjRcY/rj0euB36PdABXmD7OOwx/+DiDhsE+MRZqBb1LOA?=
 =?us-ascii?Q?/0dEq+aoxXsdfOZ+dx871HxB20SylFtYLfnCA1yIJZCP/wVRhzjzuGJAkX8A?=
 =?us-ascii?Q?yfvkmi/1QoHyPoDt8B+Xv0dKvOe+NrQTMn0vGfrs6qCTICexTjCBFPboZnI7?=
 =?us-ascii?Q?uhqPNsqwe5rB0qJZBOKjp50dJM/V829xlkZLFjLv8y8Ep6bP/7gJQltuVBqh?=
 =?us-ascii?Q?d+d+xXPi5SZatrG5Uxzfjy3Ak4pZFW0mA0+Y5RTo8esUMYuIqyvN/4J18sc4?=
 =?us-ascii?Q?YIZHIkXJWNblitMuAdBhIZxmC5CatpV+K6lKt3tEhKowNPoK7J5PcGuXF234?=
 =?us-ascii?Q?TSWyiQmH4omfrm6YYy0REcGcyiAAj+KvDI8PgQSDrS+C1/HW+ngNIPpf5jgY?=
 =?us-ascii?Q?gQEMmsNx5nf9oUJNiq0bbeCh8j5hrMU94ls9Io8ZxF2IE9RiJB2xWJppYt5T?=
 =?us-ascii?Q?7ZsUlqCBLfnpNUZgEPIRh3Q5v3acE7QJLgaxq58R22aUwY6rD6CFDQoA4L+Y?=
 =?us-ascii?Q?IzaWOCrAh7ZxJuJMIRq+akoxCegAnTdBZAV+49Bnryr+dqxhv9pLhn5vFCmx?=
 =?us-ascii?Q?sArS+BGetsOVuGSnftl4aMT4xBPLdnoOLXEF6XcT1k73+vx6a3hWDiYJE3XD?=
 =?us-ascii?Q?oe/U2KbG0UOWHdvC1GSBXgCv/eik8veVn6SFqdNP+SmXCCol/ftrsbv0/Vvj?=
 =?us-ascii?Q?Mn88zmivihgUdZjmeNACapXsRqEuf6hjWgL/CJ+mp888Q2dEuskdPlphHNDM?=
 =?us-ascii?Q?oC3Lr6p3mROZ82Na0oYaC29SKlX5446Z1sOwPm9ZrxuB0W+m+tYu5XhZAIm7?=
 =?us-ascii?Q?h+bSBtL6Js0mpgNY4Ud82K4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5357f9d-84a9-40d1-d991-08dc8e6786f1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 00:50:47.8095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90gc3c7TYqRAmPgRwFZTgzKocJwY0YJjgDqLVprT7TQM1fotyLodB9hkJBY2NKfkML7c26Kh9uMgy+Rud5Y1p5t+QA1uxUsLucdUskRXfNy7f7R9cjybf4WUmQ68BA8d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7897

From: Jerome Brunet <jbrunet@baylibre.com>

dpcm_playback/capture flags are being deprecated in ASoC.
Use playback/capture_only flags instead

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/meson/axg-card.c         | 10 +++++-----
 sound/soc/meson/meson-card-utils.c |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 09aa36e94c85b..646ab87afac24 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -132,7 +132,7 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
 	lb->stream_name = lb->name;
 	lb->cpus->of_node = pad->cpus->of_node;
 	lb->cpus->dai_name = "TDM Loopback";
-	lb->dpcm_capture = 1;
+	lb->capture_only = 1;
 	lb->no_pcm = 1;
 	lb->ops = &axg_card_tdm_be_ops;
 	lb->init = axg_card_tdm_dai_lb_init;
@@ -176,7 +176,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 
 	/* Disable playback is the interface has no tx slots */
 	if (!tx)
-		link->dpcm_playback = 0;
+		link->capture_only = 1;
 
 	for (i = 0, rx = 0; i < AXG_TDM_NUM_LANES; i++) {
 		snprintf(propname, 32, "dai-tdm-slot-rx-mask-%d", i);
@@ -186,9 +186,9 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 
 	/* Disable capture is the interface has no rx slots */
 	if (!rx)
-		link->dpcm_capture = 0;
+		link->playback_only = 1;
 
-	/* ... but the interface should at least have one of them */
+	/* ... but the interface should at least have one direction */
 	if (!tx && !rx) {
 		dev_err(card->dev, "tdm link has no cpu slots\n");
 		return -EINVAL;
@@ -275,7 +275,7 @@ static int axg_card_parse_tdm(struct snd_soc_card *card,
 		return ret;
 
 	/* Add loopback if the pad dai has playback */
-	if (link->dpcm_playback) {
+	if (!link->capture_only) {
 		ret = axg_card_add_tdm_loopback(card, index);
 		if (ret)
 			return ret;
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index ed6c7e2f609c9..1a4ef124e4e25 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -186,9 +186,9 @@ int meson_card_set_fe_link(struct snd_soc_card *card,
 	link->dpcm_merged_rate = 1;
 
 	if (is_playback)
-		link->dpcm_playback = 1;
+		link->playback_only = 1;
 	else
-		link->dpcm_capture = 1;
+		link->capture_only = 1;
 
 	return meson_card_set_link_name(card, link, node, "fe");
 }
-- 
2.43.0

