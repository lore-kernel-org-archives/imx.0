Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2076.outbound.protection.outlook.com [40.107.114.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9740F54775
	for <imx@lists.linux.dev>; Thu, 18 Apr 2024 04:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713413744; cv=fail; b=ZygRbFLmPGvZlhSfDIr+CG/X+TAObIwzVVk/jOr6x5KpPtJKzR/ZpKpANidT/75zGfusPR/Vff9KkRx2OPbvMF7LfXaIOar81AWHDnKwaJyLTDDzwYLs8Opc0HEp06H7zTpp0pzVHXl3NwkyzKpF9gVtW257QMVeHBpczUjgSTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713413744; c=relaxed/simple;
	bh=KIDthD1JiwM32XqCndudSaNjkK5KZd9LtKuvFi3i7gs=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=a6IragytZEszBkcHEMAoj1VlPYX+pdd1hYu13/kKpyPQL9PyeXQOXJGcgaqC3g6XbYs1iw3lPn9GGf3L3mfBrOY4Zz9ruwq2JVLgQ43jVmUuAyyDdsxXdvVBsv6gtJmTPxKC+VVzITD8rIQt1Fr3aUVzlRlmXOYGzL+1mPJ7SMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MJ5G+w5j; arc=fail smtp.client-ip=40.107.114.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MJ5G+w5j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7zM5Wr0QvVOAzqSLhZHjSd34jgXYrNrZ+bnWhlStYZNwUv0A1UNG7O9wpK/f0XNuKYPtUJptWk1U6YqVq6yJZ8MOLFlYCy1Wufq7vIExUd/FvT2yubx4+w7JFgtLVuZ+2wkislESWwr9QulRPYgs/cmG3FR56uFQt+CIHcsgocGOR9U58nbQFq4+lVX7Nob069WN7kuLSQTOJvO6Ch9MakUAIZyfGdBjPrNLmQdFAfD6F7B3IaLl8448A83RQlaPE3EbaqvyCIXc3NayADEDzn0wx+HSAvAopWGDDcUIk9IHTb2GPdTSIp6pGhKgVzVi/coUG4dvL3TKe7cGsLSIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTjMEaSiFKMZZdhs1cDCkfMy7kNOvDNlZqjLa03lFvg=;
 b=AN67AW6gtXokjkkCqTRCfDgdWMzPG3nafW8lSEkChrR85Newr3qP6HE8xKI8UuNisC5UbLrBxWW+rVrcSL1cVUHfsF2fZpMlpsNG3JJ//7hbDIDFPDKzjgZgUWMJTTJJL4fEMIRpeTtUikVyaSY+4z7AmLgdHGWmSoW3Y143TLPFkh0zd/bLRlEX+QGjUOnUQYQdh9UXrn+IbeMPOAtAP3MGE53Jy5fapJHG/Rja7Max8MaQXn9LZLVcQcPSYoASd3rXGYE1wcV1RS3/pQTVSNlP9oDdfihpdTkSyHfVy15XQEWp0rfB54vqSx2BBku+IjRC+W9WeEdJZs+cGV772w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTjMEaSiFKMZZdhs1cDCkfMy7kNOvDNlZqjLa03lFvg=;
 b=MJ5G+w5jWb4mc5El0eybrVkGLkcRHlEs4U5lnyKyPg+hfM1MOXGHUCUKPCPUQxiKmAJEUmuA5TfI6ac8TmRkmTA1PKC/9KRvR763K5/TbPA66Jpg1gNtGloyuGXFD+TSLpKxyL2R8hmVqfEFsIoXutj6fIODrDU58aaGZlKHYRE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB5379.jpnprd01.prod.outlook.com
 (2603:1096:604:a6::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 04:15:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 04:15:37 +0000
Message-ID: <87le5b71cn.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 22/23] ASoC: soc-pcm: remove dpcm_playback/capture and playback/capture_only
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Apr 2024 04:15:36 +0000
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB5379:EE_
X-MS-Office365-Filtering-Correlation-Id: a2955984-36ff-49f1-e2c8-08dc5f5e3323
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZNhQbFzBgdNuUTt6tFKlQ5JluEVySXQQ5GFL9k7F5OBcki4U6XuWd0QDsFlgGn/7f7RM++sQuOIXvADw972yFUI9lgjtgJ2aWNayuY4XSlA9QLUwJqES1vPHXXDLgSp/Bh7Hqris7tleOj4qOYbtO/KZGUO6+bTsV3+TwjAmpAG89GHkMaqcTuAflpa2pSP5H6j9fBEk/WokfdQ9e3bCpc32T8h1pfLRfHWNmEsx3AO476bszWFzEEN9bqFSJhRFSZcHw6JHwPUFTg2L3+/s+q2fUyChN9NRwA8yaTxj3DrKgm1xYxHB995JD3bsreF/goJdUd7xR2SfbmPBOZ4FuHaYAx0HKcZGoZrEUPdcsibMFYf5qhYBhnonw8OqcFpQT5mQ9DD/rrpiXt1gnWkHJlPBTRO7yTdJNzDIf35V/4LoIR3URxWZ1jHxeq6hxwvabAOtuzgYp3+nSRjMGJAVt7+fp533I6FzNDxMi/lsQc62APh2/0DfJ3gHGsl7Ca2FjjSGz/c7nPRrhSdYCWFr9+4A1C+b4KsGMH36EwUL3QYW2eIN9Z3meN4pnFY0aRWZTBSALqP7iR9K91bPTu3kpyaIoHo61cTr3G0Un1fkSEFQV+Kc3eiipuX2+bNXKxgRsEzI25uZBcs42JL0m6iBVjwPZyIy85TkLUlTsvSd1GLg6UvRanFLE/2iIJFJ/2hV2MehhbDeoJjPI++38lmXqkYZ1OgJG4czuO3EVkReGGg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(52116005)(1800799015)(7416005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bgb2+RWlr7HUBrhEMhloyUHj49R6pudwepEHxtkZN34HiDFEmFteMipa2Iqq?=
 =?us-ascii?Q?n/lZ9CdJIXDMOY4me3rt71MPU8djN9vkUZRydNUqdq+lwKWR1ehOe03DfUma?=
 =?us-ascii?Q?8iN1mBHD+YvLXyldidsf1v0dyIIEvmdr4j4lqRGWTAeDqg7F+nm0OhDW8QaN?=
 =?us-ascii?Q?kicDxLoW5m/ZTjbYGJfcBLR+kbbhnADLGnLY/wP3XRvRGfWFdEk4bDcAsUjm?=
 =?us-ascii?Q?pqYBZJjEJudTAxqsaWCNHLdeuxF6vZITviF4S5v04ccU7WaF6YHWEspj0sUI?=
 =?us-ascii?Q?D0hS3ef5apWeZHrUbAovihhHuxEX+zJk2tzSTJESF51137MQ5gKeBOvy0qSz?=
 =?us-ascii?Q?2a/BjgCAqK+p9Ism9V/GFuXu3BDpBL6dijbDk7GEZc6dEuX+LpLpL7Va1kRg?=
 =?us-ascii?Q?meG6+lJqPU9aayIqNYTcfeGpNIie4PIXCHVG3cqfitMjCL5dhtdrYQIlgqtr?=
 =?us-ascii?Q?EMe5ht4MhwanK0DQzFqRaOj7jc7iFsGgdfkjSjctoRcStnex3XWApzdZSHbm?=
 =?us-ascii?Q?p7pEZ8CIVds+LMNbaJo1An0+0fIGmD1tiXzyTrvuST21LSAQBvBug94uhi3d?=
 =?us-ascii?Q?YkkFTpcY1GAHU6QedqlQufHWm2tgrdXVAm6C6mi2J70xRYuDkdXHKBx/owRP?=
 =?us-ascii?Q?DQmPSLB9C6c3lODUG2Jce0AfdyohZ0oKs00dtFF/9sbjI3tmL56KOR36MYbr?=
 =?us-ascii?Q?JkpePb3p3uXyEaSWAcE02nzilQgu+MeDjcgiEelZfAn8vULmjDcPOP4c8Ian?=
 =?us-ascii?Q?6fcSS2YvNN5HMDGtnOG+IvHu4G1Bj8RdnbXVEhcgKq+RRv27op9M2NwiiSJ9?=
 =?us-ascii?Q?0HPPE8rwsv9QxJS1vZPfKeeu/ITWO76uVMabVHzalzWh8FCfg7kj0Kcq4kkM?=
 =?us-ascii?Q?W0v/+dD82MsKuNTOLQjoTG4FJrIoYgycKtu4EQOlJ/qLEuKAnJ4geN5dgUez?=
 =?us-ascii?Q?iQ8UOAtASD047I02LbgjBPyGzaV+exRTYB89EmYEOAzvHVfvLxvSDbelmBTr?=
 =?us-ascii?Q?e/QnyhHwFkoPX/BfR6HSqbU2Cs0DJVGFsM9GSrkPY1tX+dQwU3DSWZZDVkDv?=
 =?us-ascii?Q?DlEXjFuKNNHa3goVtHfc2MfEL4llnajI2ecGnK+s5W0IqtSrWdHiJA/U6TXv?=
 =?us-ascii?Q?Lgeb8tISyNoHevNgPcHMhZ+JM6zet8DccIATb2l+HIpVDbH5s/H+/mej3FoR?=
 =?us-ascii?Q?Dop5OG8MMxa0EaRIO3DZ4+t6CYORk7mOHySVucRInmOm9dHHBiKzs1kiGPfL?=
 =?us-ascii?Q?m+3svDOIOJln05IivnHV1nQLe6joJjAo7XMpamddt91yBEgM7H4c2NVSW88s?=
 =?us-ascii?Q?xkl7VtJLU1PxOjCGLXtI/A12K962o6Ax4BRPAlXhigetHRpdD5SbZdF2uqwc?=
 =?us-ascii?Q?UMC+t2ScWCs9DCcunLD4Fb4Y+Xp7nEZtsiq6jIk+/kxgibPS/iNXvWGwAUV/?=
 =?us-ascii?Q?IEG3qoxsSr8CSXMTv4N2ORrjfTrzLVgYrKTgclu7bDo/2RtvA1HTCUdMDPEM?=
 =?us-ascii?Q?zdFI8nC8KvrXjpGmYUm1CxifA9OoEsowa/Hz5ZjqWR1ZKt3lwNXzYHGpcrlw?=
 =?us-ascii?Q?hCptn/2uwTb8IDxVR01fADoNFG7+Mt+h7CBn1qR20Be7fCSWXwcDiDYKuWSR?=
 =?us-ascii?Q?6+SWbSkhC5sHxQDHsi39IrI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2955984-36ff-49f1-e2c8-08dc5f5e3323
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 04:15:37.0571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bVptRmgVlinEq82H07mo+ZqA3FGiR0iqCIX4xZZzMHSPUpOTCK406KVXYGw8+5TmQBKDMZcgQRH5C8lWorTR/sQxGKbJCU8TtU4Au0pkzC4+LarifpnlGfkwbWcpEy1c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5379

No driver is using dpcm_playback/capture and playback/capture_only flag,
let's remove these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  |  8 --------
 sound/soc/soc-core.c |  7 -------
 sound/soc/soc-pcm.c  | 18 ------------------
 3 files changed, 33 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index e604d74f6e33..37602141834b 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -787,10 +787,6 @@ struct snd_soc_dai_link {
 	/* Mark this pcm with non atomic ops */
 	unsigned int nonatomic:1;
 
-	/* For unidirectional dai links */
-	unsigned int playback_only:1;
-	unsigned int capture_only:1;
-
 	/* Keep DAI active over suspend */
 	unsigned int ignore_suspend:1;
 
@@ -805,10 +801,6 @@ struct snd_soc_dai_link {
 	/* This DAI link can route to other DAI links at runtime (Frontend)*/
 	unsigned int dynamic:1;
 
-	/* DPCM capture and Playback support */
-	unsigned int dpcm_capture:1;
-	unsigned int dpcm_playback:1;
-
 	/*
 	 * Capture / Playback support assertion. Having assertion flag is not mandatory.
 	 * In case of having assertion flag, non specific side will be disabled.
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 6667f34e875a..64270a4f75c6 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2011,13 +2011,6 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
 					dev_warn(card->dev,
 						 "invalid configuration, dailink %s has flags no_pcm=0 and capture_assertion=1\n",
 						 dai_link->name);
-
-				/* convert normal link into DPCM one */
-				if (!(dai_link->playback_assertion ||
-				      dai_link->capture_assertion)) {
-					dai_link->playback_assertion = !dai_link->capture_only;
-					dai_link->capture_assertion = !dai_link->playback_only;
-				}
 			}
 
 			/*
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index a79ca115f4e7..4ceca99e266f 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2808,24 +2808,6 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		return -EINVAL;
 	}
 
-	/*
-	 * REMOVE ME
-	 *
-	 * dpcm_playback/capture will be used as playback/capture_assertion
-	 */
-	if (dai_link->playback_only && dai_link->capture_only) {
-		dev_err(rtd->dev, "both playback_only / capture_only are set\n");
-		return -EINVAL;
-	}
-	if (dai_link->playback_only)
-		dai_link->playback_assertion = 1;
-	if (dai_link->capture_only)
-		dai_link->capture_assertion = 1;
-	if (dai_link->dpcm_playback)
-		dai_link->playback_assertion = 1;
-	if (dai_link->dpcm_capture)
-		dai_link->capture_assertion = 1;
-
 	/* Adapt stream for codec2codec links */
 	cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
 	cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
-- 
2.25.1

