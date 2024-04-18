Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2073.outbound.protection.outlook.com [40.107.113.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB88554654
	for <imx@lists.linux.dev>; Thu, 18 Apr 2024 04:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713413645; cv=fail; b=eyJ2sjpz7Hyhr/K/owMTvx22vVTqq1Wuqb0nNZCpThfZaN5sfAP0uwMlKiBHagnTa3Ar3Z+I3ybia+eG1KsdqbCNjb+6hknRRrTupwh7ijXZ0PWxMqEnznv05CwHz0b2AeuXI5vlcG/mJbjX6+2K7T5MIBA5onLVgd1rU2sZdjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713413645; c=relaxed/simple;
	bh=1U4CWtBNm6EsGD94I847rm0io13JlUXTmWY9gWAeNVY=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=HeAYLrN9Bc2B5SyOKQQsi20ewxXIHju/1hRfPIOhHvU9Xiu89g0qf/qdXFJpP6yeiRcBGcmjVUu6tKUpj1MnRWrc5fdySqQ1zW0Mnh48rtQg9O5S8WRPXoUeV8ABAbruphMXiYLkD3Axd5cRkR7bK6mHnRQPDOhJ2dRBXcXCUko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QBl/bVWT; arc=fail smtp.client-ip=40.107.113.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QBl/bVWT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hIxU+qc5olPuhyQjo1s6FmMQqPFLmvFa3+J16wFURkk6prFPrud7lncjBvh22On/RVkH1zen+vrCiJdQjBLpATYGEiNuoLZVumwEgLM6CyKXCfRmrcOjtA9muwb9gYo4hKVPg0M4M2wknTJrmL6GVxAnUJDfRnMERTckHxmYHZ6uKSIKYq4QYgaTEohgb3lDumubO3IIoWbe0Ghdxgfe8AWKL1Y1WZ3mjb9jwYXGOpVjayQlVc85E01JTr+Oq/utQzCTC9bAjEd1iq+AjZAPVVSw5CzFnGFTTektXrAYO4NhCh8nySEjbZ6AMwvsNV3NFurXNoFAwPUKk4+I/PBd7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VO8PmWflB0Bcz6lVvxi0M6iYvJlB+g0FNV9m9DkwxGE=;
 b=asM2AEXMpGU/f7uxoNGNv0BRHiy0HQKn2O5BGCPpCOEKi980ObrEoLTbaUA/f18jWHaEQLxDobH+F4nDfnuhz1BtD4rVdOszwHdp+bPI+FdZQsEtv2rbAugvIKBU0ExelLkmLZZH4bO+Da8JWm+8Kni7qAKllOTn6tJZrFB/v/M+nB52mDb7sahkinySILrbU9v0SYO3yXAVfx1C4xaKPKQdRBUaq5k58nvGK2p/5ukVDcI7KzI3Rn307ZbZBbc/NLD3tHqCxzSMBJheoqwZbz9zpOerfVCeP2dCxtlwbm6BU954/xuUJZaI5xL4ATJ8TBybffR6b7JoLlqg8Xhklg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VO8PmWflB0Bcz6lVvxi0M6iYvJlB+g0FNV9m9DkwxGE=;
 b=QBl/bVWTDuMgkKkqymCqTWjDYE+8DY9efjgXPpV9GwBaK+9l15K+61UKJdYUj/BjHiFBqCAmDOFEGvkj1L1tFn88H3dIyhS/fyEIUhjWxNCyA6maDEpjOkAUnKkI/SoK3F9jG8zn/r6l7wklNHuHBzhHV3M93d3bcYIy461I8eg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSAPR01MB7397.jpnprd01.prod.outlook.com
 (2603:1096:604:142::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 04:14:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 04:14:01 +0000
Message-ID: <871q738fzq.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 11/23] ASoC: soc-topology: Replace dpcm_playback/capture to playback/capture_assertion
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Apr 2024 04:14:01 +0000
X-ClientProxiedBy: TYCPR01CA0205.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSAPR01MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: 35ae6a11-c506-483a-a0bb-08dc5f5dfa4e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SXtwwyHFFD1vOYBZ+ebxM7/KOO4oTt26v5/dFImI+ntd1CqmAhWP49sJNKeRkdJulAqcLYa+814LyQDNTzhN3zEixyfkw4lCdtw4VcajjfZGfdiJ4vmDi4PgIpiWTnT2ZLPvSJxcG4uz7esOpBruTJLuFX/ucGM+POySEyGBSOaa4CaouEmTmHKsWp+2Jnb/KT3PAUA2dZ2AfY8zk9ckFWCHORpYAHcaY7QRJkp78oSYJvW+2+39H2DDkvL/UbQrRIti58duRZeboE95jfnVfgN91aqTzwQm1UKzy8j68J9a89fDWtnlgoqv+0AUYUFWKrInKI3vMnLNcn4FA/lQrAv1+sivag3UcNodl6zJkQKqylMI88vJCaO59ggfSDjdv90xTF5OwC92yAG3lpyB23zV7JkXMgldPXE6TnFPissT7pnl9VGF8Wjx+ZU1Vsv3OwcR/5i6w2z9Z0umHmWeSSXMGevcK8GKes7HvcVd0+W782lkt9pyk9mOMepGG+HGAxWYJcb02pkwhpMvob3htpRx89VYGsLkDlt+pGCIn5YkWbAbmzpzA8PX9HvTanfWdI5I9cX4qj9CeDcF7e5H1zBkQOFzoFjgoMZPlTNhJmLMK32OTP76W2S4FWFaF9CHNvYuTDPSLBpKMZtdn/R042prGJ98K18H9ltztzTcUzxIOosIWpXIMczPUaFm/IOHqDLbU9X+tigcVXpmi2+GhtEzfVOmjfhkf9BDJiZ2iR0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w93jOkYvg5HlX9Rwo2wrURmybFmqFF2DjU3sNojTO23WeEafPavA/Oq1qL2y?=
 =?us-ascii?Q?mcuhpWJWcZ5dzVUFiTeHhNTgmTkJaxUUVHBd/WqQKDTLbtqi4Fi8bCNBu2Yt?=
 =?us-ascii?Q?cJ0WOHc1sBY6sYnRCjzikFO0TnH0SWWsDalC45LbhDpN9tGckGee3nMUkwQw?=
 =?us-ascii?Q?tYY4cwCIXR9rAvRuQK/4/oFwdKM6MKNV2hX6N4edHlyKJE2Ab1GjS3pcyCfF?=
 =?us-ascii?Q?7UryEcV3nWceTskrxTXF7ltg3lp/ojdD++7VPLen+WYVs5fc7dTUSCPxhKzk?=
 =?us-ascii?Q?2OSgbtkcvYHUoAm0VMpqbHGK0hRZI7FMnViENOmFRrbCYo0xAlh2XmwLOaiq?=
 =?us-ascii?Q?dm20/Inyhs1nSpv0HnjCvex52//pKMmQx7YxXJe7uLKffJfyI1ATpHd0uSXv?=
 =?us-ascii?Q?u1oXF4Uv9Zc4wFix56Knrtyd2PnUgbLBMOTFkCmdh6UnGcKc8EqDLgLc94G2?=
 =?us-ascii?Q?3O3BQkeNbC8xfkQL7HjDtknSomzEIGR/iXavRgD979pG33K8WTGxGjIXZley?=
 =?us-ascii?Q?osQswJcX2MaadJ28Rm7psn5z7vusiNph7k6MKdSZLLtm/kf7abR3h1+KQc81?=
 =?us-ascii?Q?E5dBNMxX4v6K3TTaxkFBnoPMAZcz0TVWsXU64KhkttIOGiVty5TcahrLV0Vn?=
 =?us-ascii?Q?stPSy8tXDHC+nUCH5F1xKTeXDEomcPI3uK7JpngWL6+yRLA8CXqsP+qZTVg1?=
 =?us-ascii?Q?VEAn225sXoxasYhCdeziTgoWfZUU0pdPYoutaWwN3Kugx51djDMxWvqoBSus?=
 =?us-ascii?Q?HfA5AwNjZ0z420VtddCktWZcMLHJn3vrJwCOj+vXu0e3LO7qXJ2+7/vdPIJ4?=
 =?us-ascii?Q?GMsUtsJjW5daM5h6BNf6gn0Z2mdyIEtyKhJD10Th8jkiFUEq85fWDyoppc1E?=
 =?us-ascii?Q?XkubQPFeLbwvx0+6S5iqSsp6b6ypRmHq+5kP2tSkWGIvG4zFyFXdoiWg3xAv?=
 =?us-ascii?Q?VdvprLqwC8mk6eB/tAZ6/siJA5AsP7nL9pEmC5Xn8T8e91lMPG8K/EjJxocY?=
 =?us-ascii?Q?i1DnRFWUgSGHNGEmzRgIfzby+shVVYcE/6hM7PRA3c1Qx4c6AcmTwdBHAFsl?=
 =?us-ascii?Q?BqW7ataeqorNiabeHt7uMsut2JPS+4tOR/S7OWyqh+TxOzbdNGb/Uk3ffXaM?=
 =?us-ascii?Q?+tCL9jfC5iiadW+3atqsYi0NPUovjyD/GdSU9SXuOiPZEtn8CxAcbCLMQR3X?=
 =?us-ascii?Q?iq38lbycWFEoXdnuHXYL5MICZbujyptXpJXjIf/MI+scHL3R2HDj3mcnKwBn?=
 =?us-ascii?Q?GHFbnxshd3ELYlvKFfXrcDcaewJeHqKoRIGONh8vlOqMY+Bo7oUQ8ni67WA8?=
 =?us-ascii?Q?AP6E2rb5ciF2oCvoey9wNRj1WBMGMbuYZhDbm1cfieCBtzo5kVlmn0tCsLot?=
 =?us-ascii?Q?8IhkBrQ9TiaB+PYYPch3vBqZMW9xGgaDYpQGDKIO3Gxg/Lfn6jMAx0fRxJfr?=
 =?us-ascii?Q?Kn7mn/JfA/gHXK8tqUlc4hYPubJ8fwwuXRhh0TZRouvciCqZKo7cA+iQo0FY?=
 =?us-ascii?Q?IlMkJTAtZqdPfLU0PKopMz6LayJhS6n8orSo2fS/MkssJ7ctcflkEVmQTZsf?=
 =?us-ascii?Q?QOWbUGDtuxGpRjTRqK1sin5lw/Tfd5SAqeQSiIwnkkCCkTUXgoyHd1TNFJOV?=
 =?us-ascii?Q?Jn2qW3WXxTGA8RDNiegk7No=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ae6a11-c506-483a-a0bb-08dc5f5dfa4e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 04:14:01.7147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1q1m5EujjQrVyLRuieDk4JGs7AAX80cQpIUlyGgSXXiNLiyC7rlEfF4FaJopxkVGFGfyHJ5uqC6p9Yt6ppIY8dh/U7VFrUX2FwwzwRgv4F3JAEk+tU19c7Ahnk2y5Zsp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7397

soc_get_playback_capture() is now handling DPCM and normal
comprehensively for playback/capture stream in same code.
This patch converts dpcm_xxx flag to xxx_assertion.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-topology-test.c | 4 ++--
 sound/soc/soc-topology.c      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index 70cbccc42a42..2740576cdf24 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -88,8 +88,8 @@ static struct snd_soc_dai_link kunit_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		SND_SOC_DAILINK_REG(dummy, dummy, platform),
 	},
 };
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 90ca37e008b3..7d356765d25f 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1727,8 +1727,8 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	/* enable DPCM */
 	link->dynamic = 1;
 	link->ignore_pmdown_time = 1;
-	link->dpcm_playback = le32_to_cpu(pcm->playback);
-	link->dpcm_capture = le32_to_cpu(pcm->capture);
+	link->playback_assertion = le32_to_cpu(pcm->playback);
+	link->capture_assertion  = le32_to_cpu(pcm->capture);
 	if (pcm->flag_mask)
 		set_link_flags(link,
 			       le32_to_cpu(pcm->flag_mask),
-- 
2.25.1

