Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11020002.outbound.protection.outlook.com [52.101.229.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070CE7492
	for <imx@lists.linux.dev>; Thu,  4 Apr 2024 01:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712195614; cv=fail; b=KiyQy/REvv/4jjC5PlHdSNJvecSybb5vCqhvVB9BRdEdR0aBkrwL0Imd8i51QUHECiiDLK438WXV8nI6EcArEZPIZiy7zAD240a5SFMR4bQcFyH6CzXK68A4CrxO6yGMQ+RRNAe1ijiBiC1McX9f8ly4nNdOvMJIx9yxYjhZMLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712195614; c=relaxed/simple;
	bh=6goTYA6Bt94mmfmu436nod9n3lT017Grwk++9MA4QJA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WdLoo8N2YGsYYxxQurDUo9MqLlPplyVDnKSXKKDIwB83efbXATz38/RHniZs7tS7FLJgcraGm99P3DUbGteYWxw5AoHX8Q5MYLTkNypqfVdIsy3PmjbnGfDvjaqx+HvK9hKNxbvwgBYSulfkOOurfEXoCqdlYVgDkCPCDNO4FqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fHVKz7MV; arc=fail smtp.client-ip=52.101.229.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fHVKz7MV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AcfIIeMb+YY3IrCexG++eYO0ZbdTSfcnqDXt+NXWV0alz1PXJUNPT8WZWLe4iSnQQqBrB5eX5w4Sp0I2tumM9wSXCB1Sgq4CTQ2ojZBimgyjPH3rTUA8gC++CRhAK0ythnD5p/R9ea/3dhTqskiQR9Ajg5FJYX08kKw9dR5vOYMXKggi7dndH4GVz78kTFsEd5NWvOulv3XKoS49/Kv+ZUeNFBGI57LoSwjkkNVtHjEW6aWOTSUUV//OMI+Kn1vYD2uo6ZYUMPfOG/5LPXZLbymQ2sxBPrabxjGXAKTp7S+BO665N+l5Bxy5jzgJvswb3ipduArOlqy5FWiDn+ZqWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13sMi6rEc+KG/cJXxmjSF2/JxXQkkWMB60Lm/mCRk/M=;
 b=aXZLqxnaNC0QhBiRnE/eU0/lXStMNGYaqwM+v0+k7u0QuNW/emrIRAbG7opjx0rkhvB6IiVnFAmXlkLX1zs6tGp44i9MLXub8hN3dQKivcSwE9SHh3HGVJSdlF0tjRHMwHbR9IEiGExYZusJg0VZBR5tPqBAYs2mRB9PByild2E/9Ul1lhtmbcGTtGvD1GK1lgm1jIsyyDdY5YZ6l5NPrevtnVvkSp0ZwKocESS7V5eu/OWfJ7u87Jf2v3rHE3W7eg5ehS8IlK96Dto0y/vRsIYj0J3n2Hpk0cIO2ywdTSIkOh7l9DtIeODSgHj1vJnGQJc+5p6QXTTCB811ls6IXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13sMi6rEc+KG/cJXxmjSF2/JxXQkkWMB60Lm/mCRk/M=;
 b=fHVKz7MV7a162PtnOYgdPh/j7LsWAVta1gB03TibUBGFEdCZeeCg/LI9cc4esb7CBN8rYNrVtMcl1bg8orDlbHb9qbsUBKk8y6yG+RTDMt4RpJj05lBNIMrNRTS8M3sLe4cRJDs57yYA3CrY+OEHr1V4pKlwMVi2r36IxgGKQ3o=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8618.jpnprd01.prod.outlook.com
 (2603:1096:604:19c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 01:53:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Thu, 4 Apr 2024
 01:53:23 +0000
Message-ID: <874jch99m5.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <600cef67-ad90-4b67-8da7-2006339d430b@linux.intel.com>
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
	<87y19xudor.wl-kuninori.morimoto.gx@renesas.com>
	<b4b37541-b67f-4593-9fd5-fc6242a0673a@linux.intel.com>
	<87zfuc7gya.wl-kuninori.morimoto.gx@renesas.com>
	<600cef67-ad90-4b67-8da7-2006339d430b@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 4 Apr 2024 01:53:22 +0000
X-ClientProxiedBy: TYAPR01CA0065.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::29) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8618:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kJO7JsLbzXAH23cyJ5TkFYMfPDkOJkg9BcX7nZRmZkjwjz8PMCyhQXMbk2hh7Jesau1mFS+nR4gdEj7pd/OCCvPPlcOUqZMwiRKkQMC0X4HWQTUwa353VwWi0sSXv1kMQLdYUzEzJgRMBUXp5bI4GpCdqCyeDF+bXKdZFPe0Xa/sEKUjwJzeaCuGDXPPQY5tJYStrqTPsgA++tW/NMxtFIJw4Kp3k3/kpRt2B2RlEJ+qem36BDienSlnCQElPzipUHWdA4Q4xJBpSxDaFBN/WBjIu6tuSrTABWwrXqv9zrZSLn7trJpC+mqGE3kfICC8/tOyblzkt4xTRYdpfr7jk+cMcrRp49ULOqkjI6T8/DexuYiCEUSZHSszXmo6lBia0YMmG0zboGiYhAxE+lVPZKnhBFpEfsha9XeDCSwoslX5EaMqjJ5YyBx5nN2FXPY7tYTuZWV2/WvjNv5jSYRQg+Q8dMx8smER/OtGA/n9QlNHsCYrVXW57mUxQn8K3ARZdjZHW65O2PGgsSYQmoUn2OubUYi3KOmh2yJLKdY0QzthIS3RKY4f7dOetxkF1GgQ26ShbjUqzyo7LZhiYCBKyrAc/FjNShvC1dqNxj1pWPhqDT+b7XGYd29i4kwqjpjN6SWItd4pRGNq/b+LILua9+nzeGO9cy1qGM4oVXeSxsYqmw8eX97Az4IfPsAkNB84Qf/6J/ESA+Q5xa4PQZ6cll7gikriVjIBw6zBYzKhNew=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(52116005)(376005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rXDCxdHjQGmP0lEx4YRK8Q7nnaCQ2dwGOxHfGumWh1a1e0/EFkZXPpyBjjO9?=
 =?us-ascii?Q?of30HUCvEMS6fg90WW8aZYVQcjJypS9FCd6RrLIFeitUHepoHw3WxUdbkvtD?=
 =?us-ascii?Q?fQy3rh2VrEwXBPhl2Z/vf1bdNfaLqR4p/hs2SGKbXNy1dbSiKhLdIHI+MTsw?=
 =?us-ascii?Q?0FSlZOmRe3YbP9EGgamwrJrCGHXmrZNeeI8vSmXJ4ovw4dxYN+5FqDd4r2US?=
 =?us-ascii?Q?qu68f5xRkkOFEk3Rwa5W15DyGLrMMiz1fOci4rBMRkmWZGBbQpUK7PTTfcjY?=
 =?us-ascii?Q?Slpe8EePob2Q1AV16J7VIpErdWhzat8q2CpihPKo4X8fASRIeNfEUBg6BUEz?=
 =?us-ascii?Q?SlPo/NjrbIGN+MPTvT2PeFqq5Cu54pNxZs1ERiKGxbVX72raoIgBzLmr54ap?=
 =?us-ascii?Q?6A2Ga03Foq1FqUOnA0MG/dRXZlk2PFAx8Pn+D96+0WlVIsNPkYyhqoCDeZGc?=
 =?us-ascii?Q?o1Bt/rbP1KLkPRv23BtwszGQouYG1OBT/MkZ9Wur/JQ00XYiH0keL6yVW8Kt?=
 =?us-ascii?Q?kYRlNpCyIiSLhtyiwje44xD2fY0Qu8lSzOw0wEq/wGSzzGgnMhyv52LxE4eH?=
 =?us-ascii?Q?dI3KEriRT/aTFPrwKtbXHSQbemjTgoLlCDKP8+gH/8x8VWdsJmQgoHpmVCI8?=
 =?us-ascii?Q?U9ONBybneP+Erm7bDgAbuEIDg5W90L2m6jgd+WR4KqLFLuMzkp+WqSdu2yy+?=
 =?us-ascii?Q?xREvPu7FP15PHz/+DQjm/axC3ABqwUZdftvEPofX4HjrXTYZP4nGxw33bgS2?=
 =?us-ascii?Q?XqSZWeLq1/+Aikvapgcn76rgWm3tg8yIpGetoMvIZsSjuZS1E7Zi6GZRvKNy?=
 =?us-ascii?Q?oWOHCCKC6mZpmz1n6WHMibiVpaiu566gVQYgtcyPwNE+itU7iBYxWXmG6yny?=
 =?us-ascii?Q?UNdy55p0R0q9dBroSYwEYbezwzXQpBHW+XDWeuDBwTh7lLcWTjw8Q82/x81O?=
 =?us-ascii?Q?GnQLn1/oS+AfaRiOV5fGEQKagcDDHIm4CTMy1NPZukz2xTaHAzo3MkqQJYSy?=
 =?us-ascii?Q?EzPKIHUaUPyKm2Ka1axB3kHxUFYojjQ/qdlX3emDf9wbJF6ISGwnYqTsYb4p?=
 =?us-ascii?Q?8w5IDp1JWL4Npcy4kPEB0U1zVN6u1IJGIZt4LHJANMXXp+vqrLbnd8XRaAaP?=
 =?us-ascii?Q?yUo7SfvS9vNKsSaD6QaoYCncHjRqoXe3RX3VjrLlP6VrG8EadSn8HGpQbOE2?=
 =?us-ascii?Q?9E02hYF9Bm5hAc+80YXH+R9n0VuThu6AdqZe22liioQ24Ssr5OW2jQWap7Ge?=
 =?us-ascii?Q?pAJ5R7z9P6CAfqEW5ZoA0PKdQwLHEGa+psodSEyI9A8g3RBeBWssq5C/EGtN?=
 =?us-ascii?Q?+xQdIKnriA8tSPia+aEZDaBQofljjlI3p2p5Xy1yoQKvclRID7o/3lJX5CqQ?=
 =?us-ascii?Q?kWWH2KSYqNMMI/XRQjhAUxy4HGcaXT14+fqVX/Jcz813TXegQgfh6mBRxer3?=
 =?us-ascii?Q?Ghg3+yz9kY1vK2HQUnyGZMK/L59q4BlGiEX3CTCdjb6BUZlzu9291zCOsohp?=
 =?us-ascii?Q?ZqEUkoBLn7GqovychBQ6MyFe/m7/4rmsgN5We8tlJ/h6TX5eZHdJ/0HyYB+V?=
 =?us-ascii?Q?exSlf/nCDD5vvcLAJbrFcR+c3xdTnarRZMMIGRXZi1aatSCSCeynaAa6Hx0Y?=
 =?us-ascii?Q?90yM0x80G9qdplfB7AlyrTE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 119721c2-9707-431e-961b-08dc544a028f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 01:53:22.9364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fHNciZS7oyQGxUNPNpRvzJXQ0m6ypNxSbI4IBTkJhqxyiH1iNJOKt/p46bJHHJKkIQHVYPDSAyc1Vt0unG3tA5TBrg4Uv8jG444SSmQMtfrfQzIlykesiNvGv3t4erdw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8618


Hi Pierre-Louis

Thank you for your feedback.
I could understand your comment 80%, but not yet 100%

> With the older code, if the dpcm_playback was set for the dailink but
> there isn't any dai connected to support playback, an error was thrown.
> 
> With the new code, if playback_only is set but there isn't any dai
> connected, there is no error thrown, is there?
(snip)
> Again we had a verification that if the dpcm_playback was set at the
> dailink level, it was actually supported by the dais.
>
> We seem to have lost this verification. We only have an error when there
> are no settings at all.

Pseudo code of new soc_get_playback_capture() is like this

	soc_get_playback_capture(...)
	{
		...
 ^		for_each_rtd_ch_maps(...) {
 |			...
(A)			has_playback = xxx;
 |			has_capture  = xxx;
 v		}

 ^		if (dai_link->playback_only)
 |			has_capture = 0;
(B)
 |		if (dai_link->capture_only)
 v			has_playback = 0;

 ^		if (!has_playback && !has_capture) {
(C)			dev_err(...);
 v			return -EINVAL;
		}
		...
	}

In old/new soc_get_playback_capture(), has_xxx will be set at least
if one of rtd connected DAI can handle playback/capture.
In new code, it will be handled at (A).

And unneeded has_xxx will be removed if xxx_only was set (B)

Then, if neither has_xxx was set, it will be error (C)

	In new code, if playback_only is set but there isn't any dai
	connected, there is no error thrown, is there?

If playback_only was set, has_capture will be removed at (B).
And if DAI was not playback-able, this means has_playback was not set at (A).
In such case, (C) will indicate error. Same things happen if capture_only too.

So, old functions validation still exist in my opinion, but am I
misunderstanding ?

One note here is that in DPCM case, old function checks CPU only,
but new function checks both CPU and Codec.

2nd note is that in current version of patch-set, if dai_link doesn't
have xxx_only settings (= it should have both playback/capture), but if
DAI has has_playback or has_capture only, it can't detect about it.
I suggested it in previous mail, and will fix in v3

> The point is that these flags are sometimes set in the machine driver,
> sometimes set in the framework, and the open is which one has the priority.

I couldn't understand this.

I think "machine driver" = CPU/Codec driver, but what is "these flags"
which is sometimes set in machine driver, and sometimes set in framework ??
dpcm_xxx ? xxx_only ?? I don't think framework set these...

Or do you mean [09/16] patch (= it will set dai_link->no_pcm) ?



Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
