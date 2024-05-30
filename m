Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11010000.outbound.protection.outlook.com [52.101.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9784D134BD
	for <imx@lists.linux.dev>; Thu, 30 May 2024 01:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717032548; cv=fail; b=YSUm8kpVoev9cuV3SKzCeAGw6DbX5SDmk3vE3mIx2MoxTk8Nq90LtBXhvb5Nd2T/17imv+vM/zhS5zIsdwg+Vtv8ZSumxnjjG763IdAKiNvmA/6vbBoSGizRtyNZNHeoLREIhpjJRRoTFmzc/xxE5dc/lNhAjEb8DwqU2af9p+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717032548; c=relaxed/simple;
	bh=eILeiAMb+Ubl4xNComhxX18cmxFQ7llSQXwMlofEQQM=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ThjTMYRbG6nybrpVisL10q8FU/sun8fsksuYWudmSZkMnjYxj5yP3v2r3MI38VIMdkzBEWJxTywFuqNRaU2fRWbKtGiRIfnJ9XxYLUOGrSNbtPVv8YFa88hou6zTKaLskwrvpQ9xv/pdgbp/UdNWcqq3Zp5KvH+svzEuMv2/5PE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=giJmFyrB; arc=fail smtp.client-ip=52.101.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="giJmFyrB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LN5EmwqxyvjCtFMQstYX8x9JzZFWmUMghuhEP1u3y5nfkR60SGJNVNugPMX9D9xb6pLi6WPNEmEuFtOHtKGilFFHQmzOWsnjYX2OyJaqcCixDgtZh9MP+tHIM9pNZC1QoavPoln7w2YPXAPJeWvfKVuMPvDhAYcz3j3xymuvUlrusBQQScqJNcw9Ka0Km3XI1K7PTWudFREU076OQe75zkzzOvVXn9uPOuKy9gwQBVN/GMjl5SK6E1L6HHRrDi4R6WUr8gmuqMv1rid7EUOqlmkJ3nNIgryU09Svhh7jkXxR6MI1br3dzXAJFJPXvNB+UzrznxYKH7U/RdIQ9J2grA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8TJhmaxwFaRg8PrJ1q5iMgoxY0YkA0fCzMwghB8iqI=;
 b=bLNtdFTOgHDm0EvhHa+2Xl2btcvbG2gyVd0oaM/lGKmhMKdDzcYTouOhMk3muueOwCruA3WOb0KhFqPh3Xn8o4GBxozYZlbtLg/uLDcRL7GFG2GGPFhfUcTefFZDRp+ty2jTxvpkgDidmHsTA9LDtNJxkcMIOfyfwqJzueEKA/sHSg/K5CFgf9u8xktwN0Afpj50LczUpy5P6wuOg7COxej8AEKB/cTfWYzu8/YK/y9z4ggDstn7xLIIsI6LuM/+4NefWVdfSAvewalDWETES4cmUMPLCrSJCm/NxmCwNIn7thga8TXlmhZj2F+GLxlvVU4uVlJ+wTByvwrQqbmtCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8TJhmaxwFaRg8PrJ1q5iMgoxY0YkA0fCzMwghB8iqI=;
 b=giJmFyrBvErHwz09OUR48AQs0kREB493UNNp8W54Yvs4cRO+fiF75ZXL/VMtX0R3pI12JOkij6jtY22hLc6jAGX2F5p8476MHJy2V+Bk7+SQCeHNYrr/YFHgYFdjnVUMfckddWbQ0TUmDxNWx3Fiw546pSvCujH3ulWkdciY+kw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB5524.jpnprd01.prod.outlook.com
 (2603:1096:604:a6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 01:29:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 01:29:03 +0000
Message-ID: <87zfs8ozoh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC 03/12] ASoC: sof: remove dpcm_xxx flags
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
Date: Thu, 30 May 2024 01:29:03 +0000
X-ClientProxiedBy: TYXPR01CA0061.jpnprd01.prod.outlook.com
 (2603:1096:403:a::31) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB5524:EE_
X-MS-Office365-Filtering-Correlation-Id: a7ccf8ce-89bf-4b80-62e9-08dc8047e412
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|7416005|366007|1800799015|52116005|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b2CWZblOn9hSqI9gkUunFamZEaZ7Be3UHPF9a07ClQ80Gr0+1FU9iIbFMNEF?=
 =?us-ascii?Q?2sO3EWtB/YBv0R7Yk6nJSK7LIj1J1mD6qf+Pm4xx0iFaCz5Zl9nen5WM/FF3?=
 =?us-ascii?Q?9Nnb6uH4Y8YK7siHSgkZS1C4aej+oq0UlYBbvux2koFSGLUl0SL4toPKmRGg?=
 =?us-ascii?Q?fa6nKmruyV3RJcJom5z1Ad6I5OpiZzOp/6TGOpFgOjxeO6KxA1bcmb+u+DcJ?=
 =?us-ascii?Q?ipp29q0vh2L0rrO4DNJKoAlUfa7Y2+fHSzh3WwRbiosamZIW+YA3MzOX8qEk?=
 =?us-ascii?Q?bVV8aiGNvTbjW1dV4aTwV23SrGUoyprxu7HO3vkh7fOKWF4PgJVj7UUdTMM4?=
 =?us-ascii?Q?RncXY1ogod4j6LYhNtYwsyNYsHCJkj5PaIg53k4FKMrVR5quqalMSmdMIHVs?=
 =?us-ascii?Q?GikD2J2V67SwCgi0B6HVYTyokUbOv1CCHSqUiaMaN2IFTXeEM7wQ6Sj3bjxw?=
 =?us-ascii?Q?tibfraSFIcqEgSigyRk2K4ohtHUw8Fp4qCn639d6g8RkKpH2JpEChVKt1WaC?=
 =?us-ascii?Q?xOqdJInGRsnCGYDe+yPMTNLtd7+Sn+t56uREyjrVrvPTK4FURi4L7deQjtGo?=
 =?us-ascii?Q?l7AR03Nhedjo9C1oa1wWKdf/t0V3jqGr3ERZjr4yZ1UUu6xGQq9bM6591hKW?=
 =?us-ascii?Q?PlBByJ8u0ShiSZsTImaGkNd37jvQiqT6oZXCXcFkn4oxttOZXMQ/H+uNM/BN?=
 =?us-ascii?Q?aXOkV8ouAQ1k4ZQlqYk2JKjCXPK4anaEMBniRkO9QJu5a06Q4Oa+VfsyseQO?=
 =?us-ascii?Q?7ZrXOVSXYioKnanFYATlKZgj56aeclDmZ8RvzwgIWzVvZOH12bzW1hhPYmFk?=
 =?us-ascii?Q?FDsxveQ+VEEI7EYNy2HojgHFztoNrRYsnx4d3XiwzU+1FrqqsRLt/ZqzETaC?=
 =?us-ascii?Q?ulS2LnknO/6WPCbLpldPePklYNdUNx33vZxWC+2KWesoGFLzXWRjS4ibRhhH?=
 =?us-ascii?Q?/oXe1Vj5+HQGTsHYSl8wqaKUDNylMINyA2arOhiol7UNSNTtSpR/dwx0p2nb?=
 =?us-ascii?Q?mOYplxWq9jRINepi9K+i3WOlS+NL7zJOtd267l0nq9Fyk64bTXTwuvHi4K8a?=
 =?us-ascii?Q?nLd8O+cQy3QPBK0SWr6VXsHtqaeUC3EoBrc7MmWneqmxdvr9w0qICVSpX7Hu?=
 =?us-ascii?Q?whlwsVTLO4yIoK8SEeHI4QXhWCc/7NNqq/Wt9HbcMDgNmO6HquFj9ny4bLlU?=
 =?us-ascii?Q?8jSC7Qs1UKfNBMHI56Gh11ZdJC+47gFuXndWo8e19P+1UCOCoyz3tB7C+yfB?=
 =?us-ascii?Q?1Oj06+HIwGIkt4aZjUI/qPCf6M3Cgj9mpbtVYw1BguetyFzvY2GeNrKFGvF6?=
 =?us-ascii?Q?21kz796aJ1ctlIo7+vuYYYwXnggL3zv2ev0RAUxzb9rewEWYMbpwIdSY4KJi?=
 =?us-ascii?Q?THQhClo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(366007)(1800799015)(52116005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+fvehtam29/DCNsOGC9Ky5OWmauHnWKm+NM9U8MSuSvRSjPZlTUpOvEirgjr?=
 =?us-ascii?Q?DfJJ6FVs+4UE/ffXusWlJVrDruh7Q5b39QhwyfPz4AG74Un3g7rvPU/d4UWi?=
 =?us-ascii?Q?BlhFO7sXmKMxp/NmEgLr28l3RJjwwAEMh6oAUaexPexNM15GK9A/zqEeFyTl?=
 =?us-ascii?Q?jbM7nX5X5rHbEva239/01lBmbZqodhfqwZ1LPGgXjTOJLls/r3qxzHNOL+HE?=
 =?us-ascii?Q?g6nErq6WjvqPTuiWuYjx1iH2ym1q5ozskf78Q89RMrYKPHzJ2xgDF1fIqciL?=
 =?us-ascii?Q?DKuz4JExnGJZQzr2JX4BwPXVCDocS+vsgRr4tQ+hCjwizo5VjKTXqoKY0dz2?=
 =?us-ascii?Q?war07ofwsnAFdB1mMYzNjl2sp97H/E4XOFTdcQCwPY5uR/WwOD3HqBy9H3iS?=
 =?us-ascii?Q?8JHSvfy/tyh0dx6DEako+RULeCcLgLxltydQeOcqovxSzOhVT1mT4zm6Bd0z?=
 =?us-ascii?Q?ua5JJrsrWIuBz8AWRKb34MwfcWxQwBLRqoGVPFz+FluDobv0wgY+xTjEcw+x?=
 =?us-ascii?Q?+af7rFy+AzamKS/hcRkl/P0M7jw6P+CMVSXHjy3yBqVvLSR+gxpcHzK9g51t?=
 =?us-ascii?Q?a19raaok5oiFwBs4fmy2cZzNo97Y+VByc1pi5GcmQtFLDNWCGqDLhfDT+aAu?=
 =?us-ascii?Q?ksgjhArtIgfYv/jbLt9+PYmELrlu4kZvgd47nlArnMUBsMuPRKvwY91S+QHz?=
 =?us-ascii?Q?F2KZqKOUvK7IkTBG0Tf0nKtGkdqlOlSJxzMuoKdYHO0LLYhshUnk22SVhytf?=
 =?us-ascii?Q?NkVMmMMCaLKuSgXqQ/TnVYBohIV47yabRZhKBOzg34QinAXRGqVI4a+j23Go?=
 =?us-ascii?Q?Ft70KPn0YCkyaarZHlaDr94Kbnx3hEQzfTq8qIM2w0na10t2xmu8j8Atn18V?=
 =?us-ascii?Q?4mWy3BrbBgnbK+Y8SY5SciFxBP0GHbmwj3xMsizJoGnJwn/YtT6pVW2rCOX/?=
 =?us-ascii?Q?f6HMbilL5ZG/7+ov4DzZluQvhUMvTq2vy8moF17SV+8jJwFAAGTZhrQeKqzV?=
 =?us-ascii?Q?6d+YuqfDmFYWxAtEzKHYRdp8hDWKKAP/4bwsmmfyCQ/9z8Z29mw0GpBXtHYE?=
 =?us-ascii?Q?4GHilzR8avp9RQKTwBmWo7yyGMQLtVuhPP7Ig+gOy3gYtkRO1lg9hM4rCyJe?=
 =?us-ascii?Q?DKgyxm7O1drrAVK4YfJWxN0aN5Duu/TEMvHQzsP7UmmGtRaM07O0mq/xNW5q?=
 =?us-ascii?Q?Ffx7TxvUdQg6ZVOX7hQ7jhbijGpGuNWUBlifGE6CcCMrMvm4veyY9sWFGdm6?=
 =?us-ascii?Q?9bOdJOIy0VAo1Okv27w30URdS1miIpQK5GK5B1Hm7HXjFaWCvXlIkya1KRkm?=
 =?us-ascii?Q?+ET0XRpdbmUKGPNwl/EVQYlp5BPiy4BO5fpl5Az0chIqcEcKoubRj3yv2W6/?=
 =?us-ascii?Q?2QA6O11/sDa59ITtCy4YIgUByB9+wXYVyM94yaSUCWRBVo3J/jFytUL9EBqK?=
 =?us-ascii?Q?wT2ohDWprs1CulM257DO4Y/5kpQj+k9BVm6zfogQTGdULlRwrbdSPmmewBVL?=
 =?us-ascii?Q?KVMtIOmL3jnsCrlt08TUuxixREJx7V9gQjO5GuHOsz1OLqaebbVZ4thwNeXe?=
 =?us-ascii?Q?ik8x3Ydk6L0k8xQCe8KEJR1G9cTxlgKwxvmIac1g1P+BkQvI9M/hYK4RCWVo?=
 =?us-ascii?Q?204d2n+dv53GlslH9papFyc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ccf8ce-89bf-4b80-62e9-08dc8047e412
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 01:29:03.8813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7XyDDsIJm2Z9Yxa/A9uVXtH86IwZA23xoo4AnvOhkx7Az+udHTLtTJcNE6PQdRwuTe83nKIlun9Y/bAZuDtLgP3Y9OU4OZaU2S5UD1fmgEQQ0024meJSJPGWhi1NxlNN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5524

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sof/nocodec.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index fdcbe33d3dcfb..305eda51d77b9 100644
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
2.43.0

