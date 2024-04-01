Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2112.outbound.protection.outlook.com [40.107.114.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB6110E5
	for <imx@lists.linux.dev>; Mon,  1 Apr 2024 00:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711931478; cv=fail; b=XazGa1Z5Lal8qtKnsnJBKSjke2qOOzgC8pMDm4E+gySV6XmRI/OD4zTKm17a2VpmI9DlGiYZaygtGk8x9ogW1ei7XNe7SNS7J4RSglu3MSFVyxONLDEGPLO/rgr5/F4l9ICbpmACapZjtTSE6fvhThC0hL0VVVrAEBj0vxuE9TU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711931478; c=relaxed/simple;
	bh=DRJo5Zh7uoUsqlhBa9LN8X9mkwIp5Hf2eepH8DBYf3s=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=OgUmk9F+fsUBPMcD9Khgkn9yMumDLm6LLs+znRJ8q3bD3/I3WvmlyC7ombOTPze1+W1DXNAN83xLHuUPQAu5VbclRcxBF5g+7DY8OdGmXaN4iIs1SyIMtlYCii1cPPBbQUL1AM1qmdbBy2m8yBnZBqKtrHGeoVopPsi0hygaGxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LeunItvv; arc=fail smtp.client-ip=40.107.114.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LeunItvv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQNaKdXJfIuA2Fa0mSb8AhX0ImVyre6hXkbcrjgEbyVLiwREDo/20udigJ70l4E6SN2B1zdwkWwwsO2HjEpGQvXGj93xHbqCFnUf9PykVDmLQNsyJfAk5Iad9PUFdIOZzCmo8ZEB2Krnzxbu7hoylXfv0iok651MyM8lmMRqEgZkmkeHDCYCSgbDoI9Oad6rM074O7zXj1G11KZNHu+RFukYuMDwu1P4aJLaLXp4a4lWzBbK0cz+dSQhAXIx4CkH4NATE9hU6GGhz/alrhK1tIKWkOg5y2N7exMxEuYZjvvtolGo0Gdc8w0Vz/TLN4vduhMN4Fwiqyp4NHBbAfgKmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uz6U1imtp4A5ePlvKD0/SLhzN1hah03F7tGbrV3yCBI=;
 b=k3eztONAVCKMjsOi2VXmwEal2lx/ceX+krYpZv+DeMw1Uw/G5WFRqIHxQSVpsBgbER9o0tAj8W9C91atWvp2EbjIfF8P6SfXDhxdFbbfVRIfsiTRdgNIfqPj8ychQYpEgVl85YXy3bPc9+HsuYA693+SIXMAMS0CZYSog5E3goOKD1lpY9nwO3WJyXss0AvY8Oll1lRRm25muRVKgLQPxCzPH0EkgXXF91nc/POde1qt7Ze0+fhBkwHczKIZA5YP0CUmV+akYYppxLP+cP1zdLNOC8Bg9ToXkXGzK9oeMcpc17/V8gKGf6ZHC0eQwq1Y0CzTeJlO8tekMJI7/I/hJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uz6U1imtp4A5ePlvKD0/SLhzN1hah03F7tGbrV3yCBI=;
 b=LeunItvvjczu00ZNraQLUvj8+FhSReUlpLwRPDOuD7VNc6xM0Vy9eetSmqCgTpBTULDaeNUBct984DzGJw3yuxKr9mNaGxHsSnoNfmwd0Y9jKpCJlapr2+yIESTBEC0xwNp5yBNYEmSzjUM5OEMCXVZVQ1JIq45qYDfmtSR3Ec4=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8258.jpnprd01.prod.outlook.com
 (2603:1096:604:175::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 00:31:14 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 00:31:14 +0000
Message-ID: <87sf05udnx.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 05/16] ASoC: meson: Replace dpcm_playback/capture to playback/capture_only
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Apr 2024 00:31:14 +0000
X-ClientProxiedBy: TYCP301CA0006.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8258:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xvuMVwvizZ5GFMDpYuL6rotZdckUU1ayHIVcBYQkESAesk0ocLWkDHLMkdCBm90mRKE2kBivWBCtkZIyh25ZUQGWzGD5E7sVrJtoCZ/arocyf01GBe+TM1l/7rqd6Q+oT2AToWG2Jko0tgwJTksNCTS5tQWAku5mHygsdeUJ2Cw1JTCL/U2jA5l0apYDe7e8eIfXugNxSzlaU6hlZPvsLmWTMDZ/Gi6sCl/kJChrYeK5NRROzT5YVBnLXDpoPayvRuS0xuT8a1wUBVnJwpFCtPwOoNkFiIR0qI3tjvcgt1GJeutRY/OFOlIGXxAD+8xBXPsSqf071PLQHqja6f33Gr1CAHkK4izlbD5ilnV4nCgcfMLK47Eq4RtpqLoNAu2Otf4gSZkyUGbwpDAthw9JBlI53f6KPUkhwRABhlY50NFU/i711FcxfjeeLrTRoqVacMteWnldtm8RrL0yO+lB1AmNt1cCq+ZIYpSYrGpYiIGDeAomEfWr28mqantEezkrKbR0LSXUYnD3a4tHpt8Po1ZcrmL9lZpAqEYY7tnk7dOQvNWD5IDI1Bj3i+PKIlPRL/KFbzsM38cSSn+TjI1+OAzwJsVX0k/xVxmRZD7RA31hC7siuzSeX4vFPbk0rrb12KANNwv10WGKNbqZKA0/oSlcbfb1sMObwYSwMfevwzHSb2rtRzT3G2S9b/wbo81WvnibafgzZz64rPqeS+sHpTGoFrYRIDX0VBznA+pPX6I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(52116005)(1800799015)(366007)(921011)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eR+37oA1jvJRcBi5iKi/+H4GYnCPa3eJOGljkrk5F0MpOuxMqmDoLG8vQOBx?=
 =?us-ascii?Q?2NVjQQjhO9t8BkvXGv3uqaVstEjMjxV647k7TR3aSHFV1oifutnPeacMVTxW?=
 =?us-ascii?Q?MVZHWAPRifv/pph2E6F0ufwr++OmQcTFdu26QCcof1ZTtgB1/wjRAAZLYBJd?=
 =?us-ascii?Q?5SirwIRBllW6OGnEYn3mT75ByTwC95p1alpLuNyHSGH8fEK+VTupSKDvFnti?=
 =?us-ascii?Q?1Jx2mpZi6ZW9FW0Yk7k0FH3D57CD2vZrM9NJvcxBjwu6YKbIsiHB7mOHTrFi?=
 =?us-ascii?Q?dq0EuKHly8Ccj5M1Q5xvOVhfhDjxpgmP10qomlSwIcQu1rD1dHrfA5U8W1pG?=
 =?us-ascii?Q?YhrzbHHO3ow8GKGPek8ZaAnbHH2IBxicd4ou65UPadt7ayap09sYCuB0DDOT?=
 =?us-ascii?Q?ROZoqdzTO+M9KXtHlOSeXkMJSFQj5NP7NJ9KeD0P4LkfILtNgBPuzUPh5Jan?=
 =?us-ascii?Q?b9I564X4R8qRarSkCwrB/hrGRSQPlNNzSAZvXmmp0dEFiu0wc/Kll3sl09if?=
 =?us-ascii?Q?0hrb0xVk5alpmV0p+Crs3JQ0mvHJ0c4pCUBrE3ZncnuzBOihO4VpL+xvUNX5?=
 =?us-ascii?Q?/bThd/li6Nm5p9qrP2r/A9rRNWsjWU6YtgtYM79li1/xltLeQbgIw4sTEiwa?=
 =?us-ascii?Q?e56KRt3sPENEBdYscjgRust67WDSGvz4Q5BVhsoDxXSqpif5xEBD7U7izIm6?=
 =?us-ascii?Q?G0B2OeboPypl49vJQ0XYBiPUHGmix3EEJh2Wly1rJ3c0rypN/aP/3RCjF8xi?=
 =?us-ascii?Q?cuMG5V/7XsEBit57jZtX3oWiIWG9aK8Jc1y+clAjbOjtTeElkPd2yi8rq9OP?=
 =?us-ascii?Q?M2CQZT8P+n8EQP+SjE6yZxtXqyIs0Rwwh5xO9URRdqAUC3Ey6wtlffSKcJf/?=
 =?us-ascii?Q?TXtGzHFbMV56iHlVkY1S49tlZvD2oYJ6T9Cau/sofiAyHtzck+BE9Es9txpp?=
 =?us-ascii?Q?jBKpK7dImmj5QcGHbDxuBAAKrp9CNi4lYQlSNhFAmT6rdF6fYntacQ6kX4QS?=
 =?us-ascii?Q?TzaDwG0rqmHjtSYvdTl0fO9nOxiHd99Vt+ByHXW4ZERlYgvYXIGSWB+E3ata?=
 =?us-ascii?Q?Xa9UJIQQW02ffgIhlGG3j0WCvAAm5iCHcFR5G0JDAvI7+Z4O4e5wAYYJ+ZNE?=
 =?us-ascii?Q?qbvxOMRF1RAgVjcryWdfYANYFNP6NnIXaoD83yOl6OmGs0RpskZd6ynBUh6C?=
 =?us-ascii?Q?b1JPIrVxt8MqQ3HFehBgHQW9UfvySec9lvVxhM3Tsa+CwhfkFCESFNh8qyav?=
 =?us-ascii?Q?3VKPC3cn7xnLERhJOdz2Nfx3gL7xOU/M1mDZPAC1HkXhyh/SJS8p9IUN6Obe?=
 =?us-ascii?Q?kyTpTCCIVgYEUGHntrElqEDbFl2xbvgi//zmW68JQdbrXgzqrfAOtHOMPuUj?=
 =?us-ascii?Q?fcdVga/zpTQGK+MUgI4hT4/63nzEjlKRTSLHRAYdInd3Mk9Q6XhankLCiQJm?=
 =?us-ascii?Q?ynQ3lzaSWNWlGYfugAqQ+ZqbVgzTuajNT1Sx7PmSBidW8xXDDiVe9dHym4gH?=
 =?us-ascii?Q?CgO8yBM4S17g9BJnseqtjI3pNk4u+vNJcB/ZzIkQySsDKb0ULJxwmg+DNvtx?=
 =?us-ascii?Q?BerIwfgQVt5yD3ae0dmntD/tNSr6MzzkjT7bdrJY8AD6sE3qcPBsm/L5xx7W?=
 =?us-ascii?Q?jgr2CVvNwzRDxo190yaD0Q4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a577cef1-793d-476b-81b3-08dc51e309fa
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 00:31:14.8259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +A1HF3NTosMCRRBf2HbclBRSce673A0dGrrEAWwysvc7/wmtvu6xjpN1Bi66z3H2jB8WRUIUmryWfsZgC9oCEfoLBoNZJGDn+IHtEQa3Urc/TtRwNIlLX57pntz7O6Pv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8258

soc_get_playback_capture() is now handling DPCM and normal comprehensively
for playback/capture stream. We can use playback/capture_only flag
instead of using dpcm_playback/capture. This patch replace these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/meson/axg-card.c         | 8 ++++----
 sound/soc/meson/meson-card-utils.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 3180aa4d3a15..21bf1453af43 100644
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
@@ -186,7 +186,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 
 	/* Disable capture is the interface has no rx slots */
 	if (!rx)
-		link->dpcm_capture = 0;
+		link->playback_only = 1;
 
 	/* ... but the interface should at least have one of them */
 	if (!tx && !rx) {
@@ -275,7 +275,7 @@ static int axg_card_parse_tdm(struct snd_soc_card *card,
 		return ret;
 
 	/* Add loopback if the pad dai has playback */
-	if (link->dpcm_playback) {
+	if (!link->capture_only) {
 		ret = axg_card_add_tdm_loopback(card, index);
 		if (ret)
 			return ret;
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index ed6c7e2f609c..1a4ef124e4e2 100644
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
2.25.1

