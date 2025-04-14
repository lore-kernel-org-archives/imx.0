Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011022.outbound.protection.outlook.com [52.101.125.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0197101FF
	for <imx@lists.linux.dev>; Mon, 14 Apr 2025 01:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744592456; cv=fail; b=O4fd269XlS4YBmRbHAfzKcohXEjLe2wBt526n+vqcm04vK3kmG50Z/y5T5KEM2fiiRS8ugzlv0bzZZ7YiNWvCFZHE3t8EXTnqrMq5HT6wexnIQ4qAarPp+JM0ndfxIyYhP/gezclD240jMksQLaWm88Pm7dt0PO0cgaz443lhIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744592456; c=relaxed/simple;
	bh=MALmIYe75CkpFrb6acGCbY5O6tnUGKwrNA8SgfDw2QI=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=EWZyqvvWLZOflNe29RlospE3WRa1tqTKRm+4uWt9AkITFRiMt4IWcY8HlQmIu6PRkVr3o1dPlYD+pGsD6iK66N+F8NtlwNMKuW18pvqIUs/yWWsO1bWTLXlE9bELQx+r0VUDOnZ2PxljVFPyO1OI32t3uyBsWxzog0yhfJ6WUL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LPBg4MVf; arc=fail smtp.client-ip=52.101.125.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LPBg4MVf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mr0pS6QkW9uQvMxMUgJtaRKrr5r9zztavCUoYJyUZvLs6m+EItdL5862vCDRXO0vWr05Y2QUSoW//Ot99ljDqbnMhKJQpqGp+POaxGWf2MlgmoAQvIv83LYsDJue9KAKD8QWokBfKXSftaTbli48RPCXfolIqdwM2jAGRJEMs7buSezRPcm6ntcIcZI1WoK8cvRg9lYdvF2qbRZjuifx2Bu40pAOaThlbBXlGKNOwt/KFO/DPigC+3RFeK/7wJ1b7dEm376cYNO1fWza6C6gE334pQg+hS8PgclLtG31O2yo8HB5LPU4Hvk2QJzSc5g3dFGs8goDhf0JnO2z8OROPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/fINZFFQ+TKA26RFqUi9EKOjVASMsAjCJVbEBhmg0s=;
 b=L/BQhgaVGx58xnazk6KUgcWXYHp1HTmcahw7ewi5Ok5U5+sCYAbvEh6G+Lh+HwDwiO4GfjD0iYkDMoA4TEdW1JKWdHHzQqYLx3He1TFFTtRxMTvUHsgqTYnHWqPCi62+7mwkYdM2JKZmpYSmR7EN8YvaCBgCARyrrq/+ce2JzabfYsYRq8ecLUdsUTqqwAt0/np/mWKd7+lb5fTp7ZSJQr5PcKyxgrq8QfQlj0l8uuEYFtXHhXGDq7+9gU57mU7QHCY3IaOu+4d6klN3rBQxjbb7nc+Xy7s4W1MShQu7pLYbvftE76t6xY343+dEhbt7p+mGCdN4Amn9NxupSvVOYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/fINZFFQ+TKA26RFqUi9EKOjVASMsAjCJVbEBhmg0s=;
 b=LPBg4MVfM9NqgdOYzCY7aTOODR46unca/cmGk7eZ+Pax+U7C1pSdywV6MRdn6QaByBQMvaNgSQZwBm4lJ7nU28lQZ29L7wqkBbmJJF9PUFD+4EQ7FVCTGGW7x8rGTFRAGaYdpzA8Bf+8qc5YZit8n/NcidflcuI9T0/TYtusxk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14537.jpnprd01.prod.outlook.com
 (2603:1096:405:23b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.31; Mon, 14 Apr
 2025 01:00:46 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 01:00:46 +0000
Message-ID: <87cydfr1z6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Fabio Estevam <festevam@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>, Xiubo Li <Xiubo.Lee@gmail.com>, imx@lists.linux.dev, linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: fsl: don't set link->platform if not needed
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 14 Apr 2025 01:00:45 +0000
X-ClientProxiedBy: TYCP286CA0279.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14537:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e51224d-65b0-410c-967e-08dd7aefc9ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z1VUVLZSmguIcfPQb/G04b9zMXC7YkGe2qqQrqtgW86H7kD28eXZqX2SAXqY?=
 =?us-ascii?Q?/LipHSIxURZ+cNLkyltyJHoXEs6G29GxOyaGWQFytvOYts0+31heIExtI05e?=
 =?us-ascii?Q?Y+NzduDsK/STYzzivS7zNA0acrDajlSTGtAqTXSWDXgSFq44y/FMQ5lff/kE?=
 =?us-ascii?Q?fcTS8wGa0duWqvMwsLV4g8jEkcoZV2TsVfj/FAgzgW/WuX6VhDXBMOfvCZeE?=
 =?us-ascii?Q?b7om9+//c8rxrKy4fSM2opKp2boc+FZd0tyFStvHm6nqNWpd4r72nbQt2cmH?=
 =?us-ascii?Q?o1l4chFsXxAUyG7iC1tuQUw4tx4Gz5MZLYJYOJPsHhyfn3SEGuq8Ox9/GlPp?=
 =?us-ascii?Q?GoXVdrh5boDoBY4i+WKZFdsB5opBL1cSRHQEqxkaJQppYbBJwwAUiDrolFEg?=
 =?us-ascii?Q?k8DbFyLMliHRWl9YGIjF4T2DDK71KgNu55XzSqBxx7ko5P00lyBRj1E58NPf?=
 =?us-ascii?Q?NjsX90jLNEMt0qHZBu6/YWHGmM4eKk88A1Z/bR0AbUQrt4zedT3zssbirGAf?=
 =?us-ascii?Q?HW3JfAuNJDiQFN1/pjam/ovjFzGQtYEo9y4dgEDUVkNZlfp7zfnmWllhPcno?=
 =?us-ascii?Q?pwlkv+N1N20Ut+/KCsBfCUiIaFyeYppcp1OrD8GyINSxDboJQXYjm+ljFVfh?=
 =?us-ascii?Q?kshmXzv+hc9+/5cP1g2DtStRf27ZfdJWqHHi/dEl16nTkwVZn6/RY8q9Eut8?=
 =?us-ascii?Q?Re2SAxtJLfP0D5g9jovS+KJYhINw5AP5aLN1akbkX5kQDPQuSms1ONhm9Dr4?=
 =?us-ascii?Q?DVT3NwP8ETS7+vN6kQejS7W/f3CHqFuDMdnFmFf1g/5kbARlOU4AxuQl8F7f?=
 =?us-ascii?Q?BkDh10ZXiVYiRGspG8xUFEgRs5ZJW0rC6w78dxwTIbVF/p2ugTW527It/c68?=
 =?us-ascii?Q?PKYTVQwFMsgyOtR0uAEPxucjoxXhToYZf/2wwZVvrrlxGsoNixyCPBmguNQ6?=
 =?us-ascii?Q?LVtJywYksRWfhY+jF1dis9GjAOyJlJDptP09QCH3C6ePJghQxHuej+XWjFsK?=
 =?us-ascii?Q?AZtpt0/+RgYsHV/3YJnk+m+/b7rAynMuMDFn2EBE4RLdOp7Twv43RbTWj1gh?=
 =?us-ascii?Q?ouNvwNh3CsWtUwBZwjTzi3T7GO8bmM5nZG+gxH9vUNWAkVX09lSmNApkS7uI?=
 =?us-ascii?Q?ihmbEtGN2qMiE9cBqdXH42qB63h3ryFz1N8hlXwP/n5iUZJ3qVbeDx0ILs78?=
 =?us-ascii?Q?A/7YM9874tzWJCpGM+e3X9zppj6aAFBT6G8HlUULuOuuXDEYTXssGACT0/d6?=
 =?us-ascii?Q?gaNwUHDrFfwWDHs1UdU71lunaoSmZVWjk1/Pnonm6VF2ooaX1gPf8DRBMJpK?=
 =?us-ascii?Q?hOWrgQUIX/0LLGFaMZcUgZ+6CIIAsBt9kv7DVVF95AkUVmNODLb/0Is8qp43?=
 =?us-ascii?Q?6UBOBvZubgOnAi2C6+REcvKRWQZMcu5X4YuHppH6/N4SE2a6iw9Awf3xdhXJ?=
 =?us-ascii?Q?pcUYkzT+0EHGU0CdqH26a40UOG/j5aZaPPTS71JUJJA/qfVRvD2wjovKI5BH?=
 =?us-ascii?Q?1llcuVJNicPEJVk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?55a8gddLa4euoCnrRAq9lwQ8bJMufpZ7H+aTdfZwWMOKsAmCVX7F0HNn8ryP?=
 =?us-ascii?Q?UmHJZ9cpISyvPxC/Yvv+IDeaX5TeMg3+faJxqrRL7t/pASruO7xWYTnQ1rsi?=
 =?us-ascii?Q?l3VtBQNkIsGtMX6OnfPMlllPtu097L3QIrbQ/41tl4Pghqtb/XbUXeICKOeF?=
 =?us-ascii?Q?zLiI5f29fBoUcaITKj4sLRVfpGMqStAoJ/iocCXnR90QWqaf6iduznRapTPd?=
 =?us-ascii?Q?2w2dj/LvMcfYphO/ZjU+xJbgPn+gdDaO2zSYp0SDm0S7SCSZPIv8oJ78ootQ?=
 =?us-ascii?Q?KW6tvBVz7SD88Kxlm7ACfoOYIpIEigL8bUX2Ra6Z012ZldwjDhUIAnnavFGG?=
 =?us-ascii?Q?fsss5IEKawFAPF9h2pFN7Bu1VoApQc7rRt75/FUZFJFL9jdE4tDSkZNBhJpW?=
 =?us-ascii?Q?QXuVAMKzJxD7ifEoA8tgIyN/6aCoohnNNYhwM69ztg6tNI4HUZnBWnWCG4fm?=
 =?us-ascii?Q?8Op7Y542POfOK/6gPubWHKko6ozLmR8t9Ze55p7yKvktmK8KOt2JQKW1b11F?=
 =?us-ascii?Q?mCIkVMvAZTT5Hf0dZUVyOgbnMo1ojrVz8ThLilsdO+GUSs80Cl+BQu2Zu55h?=
 =?us-ascii?Q?xEPLMxMrIzhu5pEJMA6za7JILI7rLsWCW0YlmM47g51pKYXEgD2pvit5s8gF?=
 =?us-ascii?Q?08lhrMCaqR0Dq3Pf0ihXVDKoVpRYvaNGL0drHXnK9ML4FBP3/WgJCb32gbXV?=
 =?us-ascii?Q?TV9VSZ9kggC6hYx2hFJYLWCFgJPd0XLoWfP3lEBlek+CPyHLPHnlBxSSaNE7?=
 =?us-ascii?Q?pBg3KePbJAQeD8SgdTgEqYTcB+X8vobni/fitCwViJsjnYa86bYxU8CbFcoX?=
 =?us-ascii?Q?8vzOrOBe/l+86+j2akgKaXqo33HcnNpsfENydqdUiiCPUVyq+KnWo+qKbaXq?=
 =?us-ascii?Q?j46xFwFv51J5pO5gfguvbxCBQkioN3zlMjsaHuuT2kTJhmSEP42Va6LM//kN?=
 =?us-ascii?Q?kLqjDbVVXL9n6OC91oeE6bqo8DlUtBfqA8jF8EGdXOCmRbrgTls6ats0lP5J?=
 =?us-ascii?Q?QPaw38gz2Osr9kaPKh/TNAEemkTUojqCdvmuqYdeohKvh9w25Vr1+BJzJU7m?=
 =?us-ascii?Q?SqpXuYBn5nbcERGskAuaMjqE9KYVp3vBVq/noBo1gs7r4V1+dNdm1CXWgEzq?=
 =?us-ascii?Q?/gw2IuOKRDF4DyZZRhAXXW5P5TC358d+oMIsFhs69UXU3VfNwCqZfTsD7joE?=
 =?us-ascii?Q?BvQowlAVMMeVpsb73gNxwRFN4jUD0t41V+qExJwMce6PpHbSJDmSuD18kkJO?=
 =?us-ascii?Q?iLVhDux6cM/7sll3M9UIZWd8omh425Y6dfTaLWTtAaa+UzkmM3kX8wrUFxJt?=
 =?us-ascii?Q?U1NPVkCv7qJtsf81WCxxyR7mh352a9cLLEH+hphxy07HMM+6Efj+VRWAobUn?=
 =?us-ascii?Q?ruCb7z61nitkfoc+hMGHI0XI35+LqkYoWCdIiIT5nNmcZF6Ds3wYHqiDSfiE?=
 =?us-ascii?Q?Qr9a23jrM+9RpsF6CXpjc6kUUl3H6TbRbj1i4CA6VKHaVRLakJe9VhSztl0I?=
 =?us-ascii?Q?+enyqeJ0Ggdp9pX/6cCqWzQjm5HxHkVSXHYhMt3Cx6fhWLnDE08Noixtt4hw?=
 =?us-ascii?Q?rqHbLc+wug4oWLEcHaIAcAi80nCWdc/XRsIcsMxf4svvqtKrPMu062eDdlw0?=
 =?us-ascii?Q?5WNZbTLOd/KY1nBKRbcxm84=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e51224d-65b0-410c-967e-08dd7aefc9ea
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 01:00:46.2091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lM93OhBZ89HKK5BMBw3gxFDeY+4kXIxwglfpZMPdkpjN+fnM9LZzD5fMoqA3QAYagecGqix4hYk1CGEY3hCAF1AIAXgLEyAE0R4Fce6L43VnKK23KYEErM7C+GYHB0Cz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14537

imx_card_parse_of() allocs 2 components for CPU/Platform (A)

	static int imx_card_parse_of(...)
	{
		...
		for_each_child_of_node(...) {
			dlc = devm_kzalloc(...);
			...
			link->cpus	= &dlc[0];
(A)			link->platforms	= &dlc[1];
		}
		...
	}

The link might be used as DPCM backend, in such case, link->plaforms
will be not used. The driver overwrite it as Dummy DAI (B).

		} else if (!strncmp(link->name, "HiFi-ASRC-BE", 12)) {
			/* DPCM backend */
			link->no_pcm = 1;
			link->platforms->of_node = NULL;
(B)			link->platforms->name = "snd-soc-dummy";
		}

If it was not used for generic DMAEngine, we can just remove it.
By this patch, created dlc (A) will be just wasted, but it won't leak.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
I have not tested, needs Tested-by from someone.

 sound/soc/fsl/imx-card.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 3686d468506b..aa72a56d4796 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -670,9 +670,12 @@ static int imx_card_parse_of(struct imx_card_data *data)
 			}
 		} else if (!strncmp(link->name, "HiFi-ASRC-BE", 12)) {
 			/* DPCM backend */
+			/*
+			 * No need to have link->platforms. alloced dlc[1] will be just wasted,
+			 * but it won't leak.
+			 */
 			link->no_pcm = 1;
-			link->platforms->of_node = NULL;
-			link->platforms->name = "snd-soc-dummy";
+			link->platforms = NULL;
 
 			link->be_hw_params_fixup = be_hw_params_fixup;
 			link->ops = &imx_aif_ops_be;
-- 
2.43.0

