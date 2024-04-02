Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11021011.outbound.protection.outlook.com [52.101.228.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4DDEC4
	for <imx@lists.linux.dev>; Tue,  2 Apr 2024 00:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712017269; cv=fail; b=q3hfM1Jxe22BC3V8g7GpwlS2jimYGrEmi81+/bLrFitHg4p46RZd4Nr0mSFGdTeWB0BU7X1h9Ogqo1qNUVfGhfT4Vpc8eycr7WrbG+aPhrpcktauMzNaKAwC1K4jBAb1Ginv/OPuIUWpInSNgcIHojJFFPVrGOef/vPjJ5FL7J0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712017269; c=relaxed/simple;
	bh=YHXHvMU3sjDgyZMOA0BWhmz9XDc5fCkwgH4HY7P1PE4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DDj+OH7jHLsKsB6FDUdeeMxrteOoP/QcSTAdBLNth/xDiL5dGzpDINOme3vLy8c/u1q69W0al1+ug2wdRVy9XS9RcP0cfvdTu8fqrvpOgZ1Ndz+8lwkvA3oFBZSSeDI2yGZz3XAFX9fLgLWFkrl5il/qJMTTOhF20MLHf5NZCb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GKc4eUHj; arc=fail smtp.client-ip=52.101.228.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GKc4eUHj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4Ruw+jx3FORI2T0smT2yUeZlK03mEEGXfQBKRwDNW0HEOUm0yPnIqoMT6g6U/+1Wxwl+xYBK5GDTQ+pFVWuQSapqo7vpgfQKCovpV1bgNsjLkwFvrAvPNH90rvQTq9wEduu63/exsWCns11CusBrG7YnI9c+/vwV06nGiHmGjuILKlrCrI5pHkzh7k8Fy3iY1KaSePHl/jBEuSICb1RRPzQx2zxnsKbbpDSL4xyS2z5UXrrIjGgyOjQvaIzVU8AeGXgf2yXRzm1tUiNyCL+S/DDjZIp6i3bim59NfYzQPhxFSSiUFlsbpJqUxYgOonkxku3k8+R/gU2kwt3jUyg5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PM7RVawLWV1O+VuDP300TaxFm+Q02mSdYM27S3REuSA=;
 b=oH8K6uKXdVmxes4bYcanePNBtwkzEbt5G3u5NlojmJmvZ0BFYGUTY1eddikxDUnTz25UVui0NczYTGf7jScYZrO+8hxK/aav8SJVK3SKZBTSuHtpyzVu1a9BfVxPsD7rYg8++sz8RBScG6qL5U2ahxziDyVs2yQc1vKRlCjJuTMYswkH4qxmTpGRatyge35BNw9jUedPRMDpG/z9QciBaDdBpCWJ6qqNpjSUfH+2x4w8i4Kc0QrZXI0qK9Iu3kJpE9hyrlQZJWhSLIGiul8DtgC5DVx46qgPxhIjwQVFe7Ko57UyP1Wc1CcH7pNffF2DgVOtODAVnayreH3a1WPoWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PM7RVawLWV1O+VuDP300TaxFm+Q02mSdYM27S3REuSA=;
 b=GKc4eUHjBpZKW0RcRbE4eItHRXm6HMq4OCW18xvmDZeubItncCwrqW4KqpuijD30KkzU968MbxShVcGReUaYnesOCMIMJPo9DbiBPXagbtA3vpOJd21AKsE5s2sWFqakVlOE/BLr+zKJxm7iIM37ZpRM7l0u8gJVN/Vz7ryciSU=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYVPR01MB11183.jpnprd01.prod.outlook.com
 (2603:1096:400:366::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.45; Tue, 2 Apr
 2024 00:21:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Tue, 2 Apr 2024
 00:21:01 +0000
Message-ID: <87zfuc7gya.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [PATCH v2 01/16] ASoC: soc-pcm.c: cleanup soc_get_playback_capture()
In-Reply-To: <b4b37541-b67f-4593-9fd5-fc6242a0673a@linux.intel.com>
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
	<87y19xudor.wl-kuninori.morimoto.gx@renesas.com>
	<b4b37541-b67f-4593-9fd5-fc6242a0673a@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 2 Apr 2024 00:21:01 +0000
X-ClientProxiedBy: TYCP301CA0081.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYVPR01MB11183:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mFdJnpWA0GoE8ALkikD4EeWE9nhIa4TvlC72LoZNfhD/K2vPVkl+FJP0JyWO25nn4GIZDy07HffzPyTuFQnfuS0gWdbt/Rl6meT4UQ5k88KbxW9cyfDaU02p4dcLAGfnDWjeHHTS+J75Ba+8JAyLtQMR1mBM2jGlNuv0sGDEiQlJYtER8ddcCjV2JS9H1HC9tjhLHr12cjdEfprM0zfAb8qleECxwCNDxJVLrqmI4ValSW+XyIimO5yr6uini4XeoPU0DzfXmEZHeKmiJYelCSNsji5xGC1pnh3BvBGGFRWtMXH3nxtHgpgy34Kuzm/8Ztdgh0O4aAaPL/QQPERBoeu4u7li2c/g7VcfME7zwfudf6xm3kLZHRm9fYd4ZnSWpFah8LNdGwd15Q74JjCcL91EldY0mvgTZhLw1D3MIpE4agMHqR9KDRGsG7X0/9Q9VKPfGiPkrQ6cELODTMjUcQpcwSEwp+WHmOf1mzJduwzaSSQfW8sbAWCLrJOV31n4lFXVDKO0SH6fy7wp2qgoVYvneSeW/T4uYFvpd7EYjgyp0uSgk8TLyFD1qqM8J+oUhO3+OU2fdtpo3FMqel7uwB2QG/s71OXGxMmjhpZe0o+ds6u/dOQ4mjDhZyCgbVE1lpM2HY7s30My0JpH+L4cod7NxiEnZWX6YsekEvzT3rj8lUvblyGJdfwqR0Hz3dDZP8tthAIyjBYfxg6KVI2RcoKpN0bcmexBlohu0fr2gDo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(52116005)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YR9Sra87GNMCYfy+Zvk6bngpX1rANzpcsGLfCBrZ/6jKNrVVjWUgCmmw6F+d?=
 =?us-ascii?Q?MnBUsB+DyeuOXtGAjDmhGDywPWuc6SMDk67QIPO5X2XvFe1+TZBaBp3HPE7f?=
 =?us-ascii?Q?CeUx7+B41G4d4yaMlWgMHlWvwW9C/ZdE5NPC9Ypj+L++OEGUSz8LiMrhqLCp?=
 =?us-ascii?Q?dFuNTcc8Keyv9dMCjiESY3BLdIR2IjEn9qBdxWPp2qa6CJMep4Mzl0JIQrnE?=
 =?us-ascii?Q?CpVoeP8fRryTKaBw5QUECRicf1MyzYap1wSjxYOlH6g830av11hDWdVaSXls?=
 =?us-ascii?Q?efi3Z4mkR6w5rCFoVYtIdoi9EP9MS8sRC9O6oJCdqwyHJlzeCVKRkFyKClDK?=
 =?us-ascii?Q?HLiv6HWrJGTQuwpGxTXDhsJlLNjvQZY/c1JE2MDbhG97Mc/PcTmLiQfKBSES?=
 =?us-ascii?Q?1Jud+IFdmaWMJ1ZHDI+Dm2qO5v06wVNQWb1IGXQOFpHZVt45r5AEaw9QkKDm?=
 =?us-ascii?Q?hUSInimHGsXynj1yrjCumLJVMbvwVUIQCUzYf54yBK0sUzxe1QDjhGrDiYgy?=
 =?us-ascii?Q?Ka4++zovhaEL+gbTD+XyM2tzngJVKL7QXDny8J6dAEZZHGtsvZTvDmTzHheX?=
 =?us-ascii?Q?HL0zvS7BQ14ewCqvwssNnuo960j6T6Pltu8QGzVWKD338MuV60uXhoT5yitR?=
 =?us-ascii?Q?mTVTtVtekjq1oyE+RGotA54S60ThxARgWwDijhRkOXT9GknvFMn2lk8cvk+j?=
 =?us-ascii?Q?RpZaFmt/lK/98gMptSgJGROtxcf7fVCQ5qpgPQQtRVRXFljzkSpM4VM2r6sM?=
 =?us-ascii?Q?9q9L7WZzrtDTA8FdwVwxWxxk/mrxUoFCblAHjzkLgproRiA2xMVQJinT8kh9?=
 =?us-ascii?Q?eSlqEwWULtCmoUc8QN4I/n64wEWwmRTpsUndCq80j2pVhr2Ipij1/z05J4jz?=
 =?us-ascii?Q?UZV3YPBNiB35I18jKWnoZqGFwPGyKEPcssXNRlm66/zlpbmmAfS5IpfuUJkd?=
 =?us-ascii?Q?QXSGVQuMKuE/YaK1BdDCJ8iFtvC8IsJD7DhRp4QJesIVjpcDBNhdAqZCM/TV?=
 =?us-ascii?Q?hWNoqulDiT9V7mCkYPfgBhA6eP1l+2LTMEqLYHrR2EsFHhfWbITU6Y5V+hVL?=
 =?us-ascii?Q?bE3m5YkoBGEosXS+xSOD8vThRJlnC5Vgs18QffN4zXoXKxJq4PvvURjb0m07?=
 =?us-ascii?Q?cxVtya2Sb8X6/fWkH4Y7TirK7jNRM2urid64EQMlZCFtDl7fYuNJSiOyvUJU?=
 =?us-ascii?Q?v/W73B+PKLaXTy0dw9G5A9/yaxdJeq1msEMndeqsUaw8pNR/nh1Ku7Pl7h64?=
 =?us-ascii?Q?ttPikoIgyv7bJr+rNwpyloHJtvAjqDaIvysymOPiXwWQbR4WxQwchNjWQpre?=
 =?us-ascii?Q?uysazcrhXeWsVkbQb90/4Ih5ciICvGoUUEk+KKjjxu7PnQpq0WqmoW5g05lI?=
 =?us-ascii?Q?6IiZJ0kpOyVUfuTuaobXvQUE52tId7TQ3ZDoBWNSDRCnPfnBRGEgcMjEkrGi?=
 =?us-ascii?Q?GLYSKBUXxWOvZaKES8Mo44/ZGXCltHpSnT1zau8qQA85SePoGq2JM5qWtKw4?=
 =?us-ascii?Q?WGNa29ZZSi3uh0XE8eh39aeVQZX3NSTHMNqwb/Ct/Snrv56EQDYWs9xFq+7S?=
 =?us-ascii?Q?MRpyIfqnN99hyU4wtsUXm5Kn87GmA1HXmT9ZYUHvAwmcs6V5XnWnEJf4VOav?=
 =?us-ascii?Q?mGvcO667K41QnSrLX174Zuc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb399b6-d1bc-4ca5-0821-08dc52aac6f2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 00:21:01.7149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U990PInmiQmSVDCz4n1cV25s1ArjP3+5ti9yIQ6mAGu8sMlhaBk3o4Rm4c4j6HQTwxvRpvLVT0WxqeE0rahfVEMvYSNxalwPb/nD5vQOV3LVyd1TFRdiFVImxLD5FSjK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11183


Hi Pierre-Louis

Thank you for your review

> The problem I have is with the following code (not shown with diff)
> 
> 	if (dai_link->playback_only)
> 		has_capture = 0;
> 
> 	if (dai_link->capture_only)
> 		has_playback = 0;
> 
> So with this grand unification, all the loops above may make a decision
> that could be overridden by these two branches.
> 
> This was not the case before for DPCM, all the 'has_capture' and
> 'has_playback' variables were used as a verification of the dai_link
> settings with an error thrown e.g. if the dpcm_playback was set without
> any DAIs supporting playback.

I could understand so far.

> Now the dailink settings are used unconditionally. There is one warning
> added if there are no settings for a dailink, but we've lost the
> detection of a mismatch between dailink and the set of cpu/codec dais
> that are part of this dailink.

But sorry I could understand this.

	"There is one warning added if there are no settings for a dailink"

By [01/16] patch ? I think no warning is added. Or do you mean by [15/16]
patch ?

	"we've lost the detection of a mismatch between dailink and the
	 set of cpu/codec dais that are part of this dailink"

Sorry I couldn't understand about this.
Which mismatch detection we lost ?? Concrete sample / code / image
is very helpful for me to well understanding.

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
