Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2130.outbound.protection.outlook.com [40.107.114.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64130633
	for <imx@lists.linux.dev>; Mon,  1 Apr 2024 00:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711931535; cv=fail; b=H30HqAngwYlTfHMBMvHIeVLy/jHoGUsbQeB3XCH9E1V31KDLg7QGIr9CRLHiGi2WBMA2Q7bb0MvJ3O4KVeMD4qLz2WtNZNaIBbFDz69g3HwJHEeVt25TOlW3tH3jl6MOZjRnGpOP2OVSebJ8VNzCWKn5g/m20Bgga7fW7DjpHV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711931535; c=relaxed/simple;
	bh=TmlOvXBhNvphqUYJHWXsXVEKoYgYiZlok7JTPgJBQdI=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=Nv6sPKSrhVXF9gzSt3t89WkPL5jH1G8f5H+ZPuX/a86h6h1Jxoflh9hH7xgvw+Lhdzj5S4FoVnvWzrxDUAdZvH5VMBXsiblvR+RWcx+qhu+StgRyUAnbTK78D3B9lPAgCTTag9wt1kKFpvfJ1T+Jttpd064iv74cOsgF6sJd6zE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KRfWjik3; arc=fail smtp.client-ip=40.107.114.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KRfWjik3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPnzxOsTmvPp+3Kw9JksytEVOv9KHr5hBfMGaD4DugtqdD88lIlHGOajotby54J6ktnHWzpUtiM2mW3EAvfkZ1heJWA10Bkwsqn5N5XbHH1BpVXnflhkHLva8qk/arjFA5JGdQTxeRR35TQ31vFYy0G/uSZs9pUQlDU1R2pwLyS20d88TidKd8JZnQ2lOVkVQAfPta90/8DvP/8lAwoFRM5vSzauQrOAC6IF1rcdiZFYpAEO6Q2gPgTeNJK/rSeaQghyjdNDb3hCnIY0joEZFSOaf/K8HfjRuDPSKd6cjHlI8fIKVz7vo/in5QrPxlBKKjCo7/qgaCt7YpKvKv0vCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5EFcZ9zOsR2i5pVtLA9Ool8wMdmTWlqPquMYdfKab3U=;
 b=l8b/BZvM+vVHTNPVK3xxHFE9fXFFDaCPm7U8WsL8IhehSAGNG9gc1SxVk2CSYd9Z+yhW7f7VlcETkrLLeaKeHBsIjRaM0pCTTypVZK2zIJRL8ia6/Q0Ivk/wBmXZmt6aWx+/VJeD3qFeWJbrpqxjv/GLEMf8FW+vmw2m0ymy76Ged8BBnqyvwZP8h1UkanaQAOFOEJer6F3p3bOzqiK5iQ7YzBRH/dyLqHEibuTg4137qMvI2StvV/r0yj+HPpJtVTAgioRDhep96bv6+V0b6BM6HqlpB/xaRLOWgHTUaraTbTRbtwUn7SV6HR+HDwm5Z+FoAk7B3lPt1wWnRS+3vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5EFcZ9zOsR2i5pVtLA9Ool8wMdmTWlqPquMYdfKab3U=;
 b=KRfWjik3p1jWMnre/UoHnXOEEHAWTMwO5SIPWGUq52/Hv4kzfLnbvpHsJt6htDRRUCHhs2O6zTJFszf24J2xPMk+qqldc15IBPd8X8MXvZpjZD8fWs+dBHMoNZ0KV0TF5V85PmJovxoE1smGezbDCf9QUp7D+cnNbDJgPZ1bhrQ=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9964.jpnprd01.prod.outlook.com
 (2603:1096:400:1df::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 00:32:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 00:32:10 +0000
Message-ID: <87frw5udme.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 14/16] ASoC: soc-pcm: remove dpcm_playback/capture
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Apr 2024 00:32:09 +0000
X-ClientProxiedBy: TYCP301CA0001.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9964:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5irG6OYFVC9cnY4qro3qZcbpOC2De4BCULB2TMDbMRcnOEsxCCoGKpGr8YovuV+pk4imfr2zcot7nvkSj8dEl3Ku5xJAyKDZtQ1F0afUuGf1XkE2gREx4LgqKV0/aeYspAiqOUq/cBOR9kOG8+HOOoCW3VYiqz5Fk6Zv3AnX1Hswp/OcrnraKWE18QXAG2U4FdQcmP8hGL6fI4HFoTO6Kjz1j7cczWBzkZUSfEZ2MWV0G4gy+1aulo2Y0Lf/j2SSMo+9HBRq44SGODdgjQ/1Yr+Qn8LK+MXqXDaocmkw3GXuSXjrNVgR63XgA7ozpk2p6j6PrGQ9PxVpMUROSRTncOtkSNb4+v62Gyrhxcon9TrsIcifaqJK6ePLZPFcc0fN71KZ/PfJNjrunXjCkHWGjwt/Ed33+sTxPwRNzToRea6VyY3h5fuOAnfy8kmthMNbkEiknk/y7UV9dLxZ33p+78fTOSIrXB82EWXEN9ULhFOkSs4wXyEdErPVwIy2dML8YYWM+93B5IT8ExyEj5jIsIAys/IJ/T5Z17KPAO3HjgkIyYv6lsdbsj5I1Tt8oGfws4rS99Y0ydSBLHMchBq56fyCv8zYnLsMFxzQP2UiUSER3TNs+KSe8+ZW0uqd1jVmTNpZmwLgLBnabMAil/mYmiaZrh/3WXYRZsM0GUStPty5UL5gcD7ElOkmmFGNiVkWD5w28GT3tG/c+p+tEHEmMXT/H4DJdgEz6VNcI7ER3hc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(7416005)(376005)(1800799015)(38350700005)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IVDS4MrXd8qbN23OgJbFPRjQa+2H1epWI5dqDYuoNuFgJ/j54jFz5eQXQblA?=
 =?us-ascii?Q?aMVxpt/rHuy9zsfvEpLAxlnugxfm2MwAp8Y/YOKM2c2u65CSel9hIdPuIVJ5?=
 =?us-ascii?Q?/9tr04i38rnDaZboRNRnBtuv77bPiy4z6Lcu5AVzl10i7qMcx9R8bA9F3RFr?=
 =?us-ascii?Q?LbRE7k5oM/1ei5fsfQNrn9Lt3ibSouynWZ8zp2yH0smaUA38Rj5F07cf4NkN?=
 =?us-ascii?Q?qy9K+bNbJXxYmCNSrSuU3DQHQ/R22weGIgcz6K275QJIPgmU1hHKbIldCyDP?=
 =?us-ascii?Q?t+hgBijP+1G2XztMkW5kk4nCtYfSrtsNFS0ISH084oKr+h9BVPUtPhFno59U?=
 =?us-ascii?Q?hlIL2OyquAYdVIdgqpsrKfSbP1hIGid2koUTG7icYU/6EdSTQm9gpOQzu4A0?=
 =?us-ascii?Q?zAOoyJ8i6FLgURzOjk3XC+x8DYui878pq4sS1LGDwrAfV2ElBDrX4LSGdrvb?=
 =?us-ascii?Q?hmL7iujnSSfTpmJAihQQqN3XO57GLc17zuwAY14eI0eXFrSWakERQ3yn4AHS?=
 =?us-ascii?Q?ZUIQBSYUsYgpmX0PU9K/O+K7UkMOg5gf+7wa6NBUrliqyN1m+ywzXuBRLp9a?=
 =?us-ascii?Q?cLuD5J7jqPtdTQHmyKKyQ0VMVmEkvwP8D+2GUlyfIK5Sr/9LEVa8TLoMPfRt?=
 =?us-ascii?Q?NVR/IUbFOqMBZLZZSpJzKKXzg1JbMOlMc+f772DwZM2wFfjSnt2J6LgL8d9D?=
 =?us-ascii?Q?zXr8u4nMO3NWjbp52SjHAMI+7kBNhsq0BxIEsRwoWmKvxxEpoSiHKYsyojO+?=
 =?us-ascii?Q?n5plh7zzEEhvupXjr3Dd18rhrCOR0g7n2xau5p7Ef8qZlgvu6JZUl4/oqbb7?=
 =?us-ascii?Q?d95/wSi5i5sVfhYNyL3xHKLoXq8hOrIahzO/8s1NQvwwGxRePtfrRg9soDBd?=
 =?us-ascii?Q?W69KIWT2jFilRB3fqWz90jYuRSR8Zr7jXRpC5QcHbgqkOqxkJZJIjbB7C4bS?=
 =?us-ascii?Q?nFVUKpFcb4hi9XHFRg2sv+75xwXlayplkHgIshPq5FznB8KUP29C8AbUqxnj?=
 =?us-ascii?Q?c/joZa1dbsKGUMYjiCm3rL8W+UU9t0aedqdMMhB/0rToe/RTZDu/tyEf1x1Q?=
 =?us-ascii?Q?tVNeRoXnKWaOZlY4GoBX/t3S5ECefp1rwgmiCGhRWcyXSgcZ/Ta3DPnVPrIS?=
 =?us-ascii?Q?31nTW9uK6U3xp16z5AhYg6EDOCY6Wwu6aQB0KEYwGrNZngXFLqsLtT5+Cdlk?=
 =?us-ascii?Q?THEtyk8nOLNnBiqgtD9SVF4WPitqKU6SeQ++DmT0u/W1iJHfneuU2GKB9bO/?=
 =?us-ascii?Q?kFn7ZH+RpOtLmPS316F8jPlcnyA8gfbzK49nI3J4FWGQAIzfLN1vqF/XX9EM?=
 =?us-ascii?Q?kwAjtlNBL3U8m0U8hL9SKfEYPgRX/cKlDpRTeIPgLeV3dqjJ1nL/nIWLp1rt?=
 =?us-ascii?Q?An94Bcxf8Fr35FrbC2c0Jt+41AMxUPIDeFaUzn5ajCH9OrVwKpPOv+EMsJ64?=
 =?us-ascii?Q?xNgjtv52wH9zjyruI2fpJk8bTxtMphrp/5YgbduwgwT9T/V52H2UvUblUfVY?=
 =?us-ascii?Q?+7jqus6Wxo7jMMWgFkYLXWm+Iidnlmte8ktjHBEuexE9b5g0VPowRt1jmKuk?=
 =?us-ascii?Q?c8YBMf/Baz3JKrqicDKa7EeuKlXC/P3SYVoAyjW+OyvpklSiggUwzCQ/fQVr?=
 =?us-ascii?Q?9SHt+KCbZrl7UsozxrHRrnU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d23694-a62f-4edb-328e-08dc51e32aeb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 00:32:10.0582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EyUyM4PnHYwer7Qc/nXODpa08omezyMs43iSNrsUp8nK82oZx3HqfvU7kFM3rFxsv3cSIdwAgu7m3SPQJCCVIBiTVf9MeDvKKvUdu7MHkGp+EfIdxQ/NE8YL9LRssNxY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9964

No driver is using dpcm_playback/capture, let's remove these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h |  4 ----
 sound/soc/soc-pcm.c | 12 ------------
 2 files changed, 16 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 0376f7e4c15d..6ddb45dabb04 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -805,10 +805,6 @@ struct snd_soc_dai_link {
 	/* This DAI link can route to other DAI links at runtime (Frontend)*/
 	unsigned int dynamic:1;
 
-	/* DPCM capture and Playback support */
-	unsigned int dpcm_capture:1;
-	unsigned int dpcm_playback:1;
-
 	/* DPCM used FE & BE merged format */
 	unsigned int dpcm_merged_format:1;
 	/* DPCM used FE & BE merged channel */
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 8761ae8fc05f..ac42c089815b 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2808,18 +2808,6 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		return -EINVAL;
 	}
 
-	/* REMOVE ME */
-	if (dai_link->dynamic || dai_link->no_pcm) {
-		if (dai_link->dpcm_playback && !dai_link->dpcm_capture)
-			dai_link->playback_only = 1;
-		if (!dai_link->dpcm_playback && dai_link->dpcm_capture)
-			dai_link->capture_only = 1;
-		if (!dai_link->dpcm_playback && !dai_link->dpcm_capture) {
-			dev_err(rtd->dev, "no dpcm_playback/capture are selected\n");
-			return -EINVAL;
-		}
-	}
-
 	/* Adapt stream for codec2codec links */
 	cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
 	cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
-- 
2.25.1

