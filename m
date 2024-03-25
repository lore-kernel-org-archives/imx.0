Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2047.outbound.protection.outlook.com [40.107.114.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1061A1C17F3
	for <imx@lists.linux.dev>; Mon, 25 Mar 2024 04:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711341450; cv=fail; b=N/c4QK8Wi8biw/EnoXWjf5FpwFM6XWTpFDlEA2f3NBo3W9HMdGSIi3d0rVZMLJISRmstXtKe4N8YWw0OLXIsCSv3isUR8FF7r5nRBnDLX+9vx34xb8g0ZYdnHDw3sgROL57+93l5htVSe9YkaqgBTGIL4QcJDnzLfRfgc7KiFLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711341450; c=relaxed/simple;
	bh=dE4OTLff5s0nGdK0Z1DdYvM0TJziWbSJtrQsp/xtzRc=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=RVNn+ZXxVAKhn0Tyros4Xeb8jzPLn8huWM5MwUkRl6B/J/8C38IxYJm9UMy6u3eYK9/sQFhxxHyaMaXdfj7mO/ezYWpKHN4yoW6F3tT3ABq5dhMvMEwh4eRujePUCWuESd+OX2q53i1qe3a+z0gJnx7CHLcaeQTMxvUXlpoMGX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dfeeIrX+; arc=fail smtp.client-ip=40.107.114.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dfeeIrX+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUEzFH/kfHz6aYsT8M8npIi9c3zSJG2J35H6p+uau3l3GKE1x6le93u+vC6ZAb7rWHP1RAxEIIVPbl1ksTDs5fPN55g2jY9DMHsyLIUicNrU1NqkyRxPm8qzwNYK0R7Qq9GJXLtVHJVL8Qtw0JU0LyoHffaH97rFAQcM3XN7uQjxre/N9kh1melDZI7s8QQ5WJ6mQaSAr7kkAGTBEooNtm1exNu4EgvzHr/LxZKmq+kctI/I5zyRV+86kCQ655c60y+eOSY2Z4nuTxHZHV97/sTRYp1YW9RZ0vVDxCTXCfnqSR+mCKWlQl/hMzEKv58BKxfPK34umuxu1GtAQnZI3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUJuONhtk+CoJSLUPvV7RGgRtyI08EfwFKyO690Tfok=;
 b=EUJlAsVWEEogi0pbYqjjVFTRNN8o9SsUcXS7wvV/sZu3BNQ1P14QMSuR3R73FSsvhZVf/IdXGXReUWBTFBwd9wFP9EAl9HGVrGZSCoFFk/k4qe0E3JFacV6gFkUknjMOjSyuMSub0ppmuJuIsM9fiqa4qEXhBAHjfPfk21rvc5yDGQIzxzNUigP51agUgnIFcIMYuFXzqW8raXOVAeqnzWO3wmQ2q4kf7u+Jps1V2acgYl6xMZkOyZ5tuPqcwftTXWB9SXcdVO7ygM3+8epGdNf4A9VPCAX+YnzWFMaYqi+QKiTOGnFmUQtBqX6plN4y/V3g9gLOhNu5jTrpEDwRmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUJuONhtk+CoJSLUPvV7RGgRtyI08EfwFKyO690Tfok=;
 b=dfeeIrX+mY0h+cd1wE1j4TCQrY2vhtZrHj4do84Wj41Q4kDmZRz0RvuP3JIrbAJHEP4By/pxoo+28+dotgqNcbv8c6KEv3PRYq3Kx+1JY33doehQtUIgUZkc452+/1FwYm/zdzCE4d0y0tewHehKSYW9g6M7J/iEKeRWZhZdBLY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9512.jpnprd01.prod.outlook.com
 (2603:1096:604:1cb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 04:37:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 04:37:24 +0000
Message-ID: <878r2753lw.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 11/15] ASoC: soc-topology.c: replace dpcm_playback/capture to playback/capture_only
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 25 Mar 2024 04:37:16 +0000
X-ClientProxiedBy: TYCP286CA0046.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9512:EE_
X-MS-Office365-Filtering-Correlation-Id: b716eed1-0328-45f9-b9a0-08dc4c853fbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PBQ+SDMkXgPGyW2ejo3tpO+xUvC9DMh4aBPe5xgh2uruWbcGe8B1FZYPZrsgSLhOzxCWKE+OVi1V7TODi3jCd7sfXyh6F5cWkHY9Sbn/BNpoclcLdN0vqGfozAo+iCwFWysa40MTj653yDWrzgiFXWVyZrBEkZkmIgeVyRswr1DSXj/jjSWqgaRiZ5IdLuWMGgLPekUfHVHEngvLmTT4IfMGweG8TpitfGsg3YLl/THnSpNGmkBkyzVPE6C7mUMVfIcPhGkscljtEiqx0Uvz0/ZX+NTa+ezNnPMJVciywy3pBilRNoflmM0gTKafcVlk/+3WWCRRpKX16LCl8Ur17ZXXHmkK9GAEs8cR/f4b0YCnF9YGZTshwH3Olqpi0YWXl9Y/FZfn5jCtd0gaU6ZAWd2tECassRazcnVk5SdogQVhcYPylBtuQEk+LH2idtEZexh4wXFKyw3JCk2zCO8HsaRay2bIoCLlOmkKviQmQfzwzWT9ISgo6SAi9xzIehVOuyjM2In8EJalVR37OGk0UN8K7jN0QujXV4U/5qMdV3bWg8eEOszZzwdnMMN7lJdJoJAyCEY2v4noOc7SIB9Tgs9JQfMS1O7d0VaQXGjFuHp6qhzN8T5uNOiDI+G4gc3CyVOgUezgDHIbYgQJymXPT3TpQsitNXRcUr0d2iARCV0khQ2rnGbHNGj0d+XynpYGjWhjARUD7BUkT4mcg4fiwexEzx1OV7Nq+fn7FyJN7lU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(52116005)(1800799015)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j8EMkBBX6j9HMlixkchHv3/DGIJiPXKQww66j+bbRg1Tyin59rFOWqADQDa/?=
 =?us-ascii?Q?tsq3ltlOkqmSA/Nxx+be4ZpBQtmPNi/nfXCJvgSrQLsjPc+3/nSJ8DsOeu9i?=
 =?us-ascii?Q?8ZfrHr3EXNMLZFPgLUQmh76Jn/ax6ALTZGJ322mkaE1Z1prOh2sE8vMzIfHo?=
 =?us-ascii?Q?g0bguipAdz/ZpLza1QDF4GEbvq4RxVR8VE84k5lGohG68ze6i0tnZ3K9Ocvz?=
 =?us-ascii?Q?VUYIKoBJv5ZCmIzcj0gcw+aENAj/eLf/bmIqtP+/Qx87pD2IbfCw/Jam6ThR?=
 =?us-ascii?Q?PiHQue07rjzSHP0ZqHzBNav/YdLJ4xHIBjgq8pDPinjjeqdeMbOR7s9gOnbe?=
 =?us-ascii?Q?6dUF7RPRTJ6gjViWGsTBx4Cq0DrBzZolO/eKstPbAP7fQSmKFQKC0ElIeRpr?=
 =?us-ascii?Q?FesOs4ZlMrqgiLdbMfpPpAiDXQb+FFjZNefACR2y8JzBwE+wd4Cgsrif3W3q?=
 =?us-ascii?Q?N5wBVaVtNdEFF0KO7Wlaxi3H6YGkDl5czdtpl74/jRqqLrWkSGF2o+94ku3p?=
 =?us-ascii?Q?n8+YLowWKiQ15juhcB2CB8mzTsIeiY9/pANVErMaQ/BuyArZLVhH23BSUS0P?=
 =?us-ascii?Q?5cVq1iY5ZxlFUHWsTnasvsqiZox0zmUUib2ZU8TSC9OTFKtwpbSSbtnJUKrU?=
 =?us-ascii?Q?sk+Fz+5M8dFOqxhaIEMtrtDoc3ab7Z7/zcbvPD/zugKEcJc6Pzo8FpoaXmS5?=
 =?us-ascii?Q?x1N3MvV2VcuzhTD98yxzZJT2YLLqgyRkQVzt6YfdBDBx/zVVaG85A44tF+YC?=
 =?us-ascii?Q?DvnPRppUfu4vOfPB34rjeRUBGRBEviftNo/txaQBHJVERA4si3bn/VCkFzr6?=
 =?us-ascii?Q?SckURN+NO0MXShsrv8sYEZrlN/CMFQ1s4QFy64fLlu3pXvUaS3ij005BQnzC?=
 =?us-ascii?Q?bmLi9n44GXbnIIIPFTM3iOe5E4jHf8JMqdcUBJn5e00RLYFPKNsO3ZGnpj9Q?=
 =?us-ascii?Q?aDSaorSgiW7PCfW0f70NuKku9dTkNJ+RsEIEu/BzkKRkupXQs6DsG5x4FW82?=
 =?us-ascii?Q?KY+fju2gsucL+VfA0UvccUTJKJVpsJAzO6cgvXC8JgWF3/zrnTaMbeb42kWE?=
 =?us-ascii?Q?HWxhO39/X+DkoFSrxf8xg719uji6Oim1o1EibKIEHM0Dz2zKBSr68V5j39o+?=
 =?us-ascii?Q?DId2uWlkIrhTWDtSntsvO+uMvmm9QRsWbXpwaAuiOkyJOeavMQW1xweR3rc3?=
 =?us-ascii?Q?xzcLdZKFOVJ1ZmwbBg6gFrYBkpNDenhvSYSi+/6J+8Vu47z4EbCuOmiGNe5O?=
 =?us-ascii?Q?3c8mkazEWb75Ay44IAndWT0WZOnST/FhsYLYhPguHhI3cQ5yWvUcX//BWwmL?=
 =?us-ascii?Q?3x0iM52G1Aauef9r46dH9b4+EJrRlhoYN1dyrpkaKkbbmT6bUpjjfYCb9XpX?=
 =?us-ascii?Q?dsGrct4sq8pAS67nyIMaMBu+cjRRUuPSzswbUhZrkKo/phSRRYvhzIlcPBW5?=
 =?us-ascii?Q?D47/D4HPc1IF/7gN5C33Kp+1saxD2NlRiuij8uIHK4VC0z5Wi+0rjN6yE91E?=
 =?us-ascii?Q?erh2GGqQx8Cp6ViJNgk0XaGpI9OIfVCQyWX6Swgvhp4lOlmcq6LtLMXKAYMF?=
 =?us-ascii?Q?p3Hyqh5Waze0jOdgHUrJhtNtAt38awjX7zYfqTdrblD8YVfxlH7rGybMrHkF?=
 =?us-ascii?Q?wEfHwo5skeNdYunb+QlmZ8Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b716eed1-0328-45f9-b9a0-08dc4c853fbe
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 04:37:16.4356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RNfX96AZnxXilUaJbPSUdFaU9m5SR4BZ20fqqh3/GLdefhPI9Ks2ZuVzKP5lW5uEx346ZTCYITAGghidhxhlE8ZmO5UtW2U+rmC0DKlWhxR8bEkO8m+x6CZWYBMzYYVM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9512

soc_get_playback_capture() is now handling DPCM and normal comprehensively
for playback/capture stream. We can use playback/capture_only flag
instead of using dpcm_playback/capture. This patch replace these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-topology-test.c | 2 --
 sound/soc/soc-topology.c      | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index 70cbccc42a42..fe6a4021b350 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -88,8 +88,6 @@ static struct snd_soc_dai_link kunit_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(dummy, dummy, platform),
 	},
 };
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index ba4890991f0d..0b84569dc438 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1720,8 +1720,8 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	/* enable DPCM */
 	link->dynamic = 1;
 	link->ignore_pmdown_time = 1;
-	link->dpcm_playback = le32_to_cpu(pcm->playback);
-	link->dpcm_capture = le32_to_cpu(pcm->capture);
+	link->playback_only = le32_to_cpu(pcm->playback) && !le32_to_cpu(pcm->capture);
+	link->capture_only  = le32_to_cpu(pcm->capture)  && !le32_to_cpu(pcm->playback);
 	if (pcm->flag_mask)
 		set_link_flags(link,
 			       le32_to_cpu(pcm->flag_mask),
-- 
2.25.1

