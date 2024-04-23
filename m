Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2085.outbound.protection.outlook.com [40.107.114.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC051CAB3
	for <imx@lists.linux.dev>; Tue, 23 Apr 2024 04:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713848193; cv=fail; b=bmLpb7C5WDxr0WIOsXkltyVTkTc2NSTjBcK7c1olA3l4lZvHKEPB9HN1qRS0ekgjf84LWKlkdeXd+NdPCQeELCDBr9kQomaDKaS4qIQ1MlwJMsJ+pfNbUqIZXJwD0pkStzFAIpKrlMPYNdVOz3KyEzc3uNSrYWH214CyXCPYp0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713848193; c=relaxed/simple;
	bh=CG7/kc1aiuUxb6dMo+ZDyMiAsqawIm3K4NAG0z1Pu7k=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YExUt1Hp5iZQX8e6vmNch9ZTzjiTwAZHiNh8Rz52U7PZwWvATkmL4FWYi7tL8g0/2nnF8OVGkSXauE7mZRYuDd08JnBjHHKaNSmoInmhpQDiBGZEM5OKPu4aZndlt6L6EiEVCeOBlNXpzr3sJU90O/HBwOdGogPqqAv2SN6Yjjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ga/OiQLt; arc=fail smtp.client-ip=40.107.114.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ga/OiQLt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTDFOrup0QOUHX4WeLpKf+GQBr0PijjBjPNjLiY2eH/uvmXvOskX4Qu5XowWkK78G+/61HETiL8pdRJujkVO57LuMqPE0pFWLb9psoE2zSJr7TaOf6c2MpbV96XtaxbnsvDebTLipq+Q7HzAY6vos1MwRqyL7xbISJAbyHDqx/W178iLSwX/UOmt06HUfHo+X1FwVMEik9UcTojZ0QfhhMN0a29WG4LV+YfNzrvr1XrRgfH72TJAd5iTTa6j+Fusfwgrr+s1B82QtteGTBQInWTS4P3XNNbiQy4xdHbT+yzbzilq3FNgU3NULKAcaHfKItSv2D4XulZAS6NWQXRcwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5bzyS0ORph1i2L1DuwBlpNn0hP5/jTYGhwoxPJ1cNE=;
 b=OCKgqVuFbiOi5/87KuBGKzg+u1i5u1P/3OlGjj3i1SA3p+o0fKTO1cZwvrNeVAFEQgTW7kD1BUuesyyTssAzoCJB2Qh6i3fADynleDUMPirLSuogcFtyjBMQAh4883sv17BUE72/xMDtKQ6usrR55WKBnhQH3dOLMCIvbvoiszDum3eW8Qoh67lKw6cWxMbD/WlxSWLgt45TuwW0kpN+Md96zra/yIIAzuq2FsvdIdCA2Qli8DJJcG8B1EF+tP6oABHMdaF++nKQ/dBXbNmo40Vf4izEoWCEQS9xudSqPMTFrv7dh3UhbobJYlGZTs/zoZisqXhvqb5Mo9F5wWPpUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5bzyS0ORph1i2L1DuwBlpNn0hP5/jTYGhwoxPJ1cNE=;
 b=ga/OiQLtYkxX2cX2v8FECOrpmGYEceBsXe7UXYIRcUJ55mBFLpNL6xqvtPlFXXAEDXY+BKVAWF+UaVxrZjhCxb2MLMPtr+vPz0eeV+tPMsK7MzJr8QdcbmtaGIAGhRPU72DA5HQlD7GWYNtaBdi9cqWiuw9eSlrlDh4hd2BuK7M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYBPR01MB5518.jpnprd01.prod.outlook.com
 (2603:1096:404:802b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 04:56:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 04:56:28 +0000
Message-ID: <87h6fsisn8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
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
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Vinod Koul
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 01/23] ASoC: soc-pcm: cleanup soc_get_playback_capture()
In-Reply-To: <93294e52-97e5-4441-a849-867429da6573@linux.intel.com>
References: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
	<87frvj8g2v.wl-kuninori.morimoto.gx@renesas.com>
	<a1f63065-6d8a-404f-b4be-331d829f802f@linux.intel.com>
	<87ttjytayy.wl-kuninori.morimoto.gx@renesas.com>
	<92054f87-dded-4b66-8108-8b2a10909883@linux.intel.com>
	<87edaym2cg.wl-kuninori.morimoto.gx@renesas.com>
	<93294e52-97e5-4441-a849-867429da6573@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 23 Apr 2024 04:56:27 +0000
X-ClientProxiedBy: TYCP286CA0300.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYBPR01MB5518:EE_
X-MS-Office365-Filtering-Correlation-Id: 515f9473-1150-48b6-1fba-08dc6351bc3b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JAZbMaLcDjkuTAKPC4BwsdAfI+vGFLVORsLYmb3fqwTcVapd0YMoUbeMMI85?=
 =?us-ascii?Q?HdMKhX9sTeM1UfO5OAmgY7BGGqnicyt7pwzdge31YpgEijb8nrdYhcQteUUI?=
 =?us-ascii?Q?fy0IvH6AOvwWcz0zXghU0F1TjSPABDrXOBTYJ1DIB8JgSGYMtCaBdZE/NhUB?=
 =?us-ascii?Q?wBsT3mNXgGJVCKshdVavVWcweoUYPJMJCkQN8shNpbEjGhunJ9XjTOeRUrOF?=
 =?us-ascii?Q?QalBdNGwrkxUYUsTy2fEEDmXYFsf9YKlyzJbSHrUzGJ//WO2m5Wj8/rznDAd?=
 =?us-ascii?Q?o5IxoGWFVeo5ATfYUP+rPfy/o08uthY4gtfcGlH5YQGwF7II4Qc0sloM2dBm?=
 =?us-ascii?Q?dkPi6lDFNcWlw1O+KWfDFWzxvFraaaPWA0VIxa7QjyjT1SGMYwRsCtA83ShB?=
 =?us-ascii?Q?is4/16y8gT7r5waGrpVgbB5JdaQugrmrhJlWEzMqOB6McVegK7+wY09B9CC7?=
 =?us-ascii?Q?FcP5RcWikcXQQXGGUSzk4kzQxMA/SzSc4KBGWPqq2Eh7rPe4EM5dSKKVFjox?=
 =?us-ascii?Q?59caPHorP300NSgZl9t0xmsPdbdm5LgjspLgwBmgNJp2YH5uFi6cwyjGt82F?=
 =?us-ascii?Q?QBKe0aOmn2yyGvAoaup0By4XMdPpl90bzeKkCNPeGQibJvDUvcAc1yc6phNg?=
 =?us-ascii?Q?8eta2GV4KJ9c2RZdg1VepK4Ka/mNr3XGrzCsUeKOeLU6YxTZygOJA8yTFX1d?=
 =?us-ascii?Q?CCQ24TVwIImgcoiy2vjVhhtLCwTl3eTy6tDS2+NgXPbNbRu2iVeGPpoy5LRb?=
 =?us-ascii?Q?cKnAz7RInaqpI+0Zqi6dWVo3Ol7Z3Qdd0Uva1qhz26QbBBt9HJ7+7SM81Z7i?=
 =?us-ascii?Q?Rx3lCT0TbWcV2adjWDI07HnNh0quZvOgSn4SvDL9L63oCR1hZFaL1vtLxkrz?=
 =?us-ascii?Q?k+aQGguez4IpJEBJpb1wjDXUb29uw4zmImdX4BNfHImBgZ3SKoCbG/xyWXbl?=
 =?us-ascii?Q?lk+mZCk3wUBdh+KOO+am0Uo83UMi/k9X1fo5J3duAufkxLvEM/Yq0oiP02cI?=
 =?us-ascii?Q?20ENk6vG+h4STcH5Q7KJ07pW3Lbksz+tkEoEAzoguXFS4GGs669CgVpin8gZ?=
 =?us-ascii?Q?JEzOzaqClg50/K/2NbwvgNNIh3P+0t7qw1hpkfGDAQr7ACHyCqSqDSbDJ8vg?=
 =?us-ascii?Q?qnETuWHAq8G2Odc+hGP5Ud4n748478gRWMN1Du3LP5NtTOaEB70/PXrw6X6f?=
 =?us-ascii?Q?whYS0c1jaADHDm0hacnPaH7JBAJajiGB+OXqm63QlbUxQnCh5xqsMmdO3Prm?=
 =?us-ascii?Q?Z4xq8vegYGz0gGFQo3MvO1KOZKeTNEH2tHrHkC5J2Gb1vnWU+FT5DGaredON?=
 =?us-ascii?Q?C0KZgoKtp04bUmM6CczWRGuO/4evNHtgxrFMhVuAaHWCiw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(7416005)(52116005)(376005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X+oJBHOg+WUGPuQXXloHVFhGO3cJAU335UWeN2WbE+BQaMhJtur/I2zxZqVf?=
 =?us-ascii?Q?ezAPc1DW8wsmRuv+XTxdU1HMu2jXo1rnaSGkO9WblAZmms0HOsa7C36YUsJ/?=
 =?us-ascii?Q?p11KAk9jMagqF7h4TQs0FbL1diqx78UKR/qOD2y3+4CF2MGkWQr6yvuUEJGx?=
 =?us-ascii?Q?yiWJn5Ej3hjYcAGz2o+eeZC3I0r37wv2hFhURhDkzbNQ2WwPbQymTs5iUP9Y?=
 =?us-ascii?Q?Mv7s1h7gaWaICk+gGVLpVwpEb/7dPcV2Jz8KnvRWtyIHGS3LG4dfik6BPriF?=
 =?us-ascii?Q?xpvw7Hnes2Bknuu7KTMr0n6UKUyuFqktHZWZE732HzuXzTjAL0NS8m0TBK5o?=
 =?us-ascii?Q?8+CyUkJLQ8jiawtKD44H3w/auGgbQ4VCu+sVagQziWNhhuYUM6KQ77tkt6GD?=
 =?us-ascii?Q?spzPkfn0H1NJFYMJsqlgcmoE4idmcISizX7fzEvKOAdVWfK4eItMs820NY6o?=
 =?us-ascii?Q?FSJSTa/9JVS6c/vEA5aQX8+dPSA075juAfuHD+kgUv86Ave83NEsAX5zzPt1?=
 =?us-ascii?Q?nV6mPGSkksim6DrtnPF9NGZ71+EnqsQ1qMO5qKlu4ZC6oKrRLORL5+djq07m?=
 =?us-ascii?Q?k3cOziXp9dHtEufLHB0nQKdeNNTz9sYYpa/VNcx6gxUtgJlqkV9XYA7R/moq?=
 =?us-ascii?Q?g3F5nn7s7Dgo/8Yb8Z3ld9cu36qoXkP6Rm1hKMpDkFLPTBhqbIEQ56c65Srm?=
 =?us-ascii?Q?fw3ene3JJhWrEy0O1zMD1NEW7TZ88jvuIs4YdQDXLxpTWjrCmoVCuBkJZitQ?=
 =?us-ascii?Q?BbOk5Yt9aa9tLwySMtzDikqmNFQsCqxgcwS+AvKurYvZ7A9TuTS6t+n/4qwF?=
 =?us-ascii?Q?U/9l6xT/d0vjQxy4PaQuWTS1dJmfKAPGkCf749e1tulM4/v7EjMAFSNPSMPD?=
 =?us-ascii?Q?WS6KXo8CBu3lJ4dOf6BlDzYX2JwJs9rabV4n/kXvCLyLqhmTi3T3Bf9o1vLc?=
 =?us-ascii?Q?24XAAvm7fU9Moy+ryfUEBb761BKdx6Jc7CfgLPtwl9ALXau2TrT3bI2+UVcn?=
 =?us-ascii?Q?Zxwu3VhUT4jc7ic7kWCi0tIHLt5W9g1vYXQQaDLxLX/tJxSv/hzYyl+W6R6d?=
 =?us-ascii?Q?K3W9Wk5+6HDmoSM/z9nXJq98GiI+0oKGDV2QCNJUvP1AI4nTCeB3iusXZC75?=
 =?us-ascii?Q?RI6S/gVejggpWBsGCOWNwvlCkz4acrzghzqxqJd+x8TkT13Nw1rPX3yUnF9t?=
 =?us-ascii?Q?CdDp6s7bMXooemIKgqOoHLcyn7HKNEuGzG6923hJG6fw+ChBf3iowwMZ9qde?=
 =?us-ascii?Q?mFRFoB9Nf7JUEpJWvxwruJdbabh+WehD/Dcvd1hYAe6LQbXyR5HuAIrqy9GV?=
 =?us-ascii?Q?Jc5kvFNomaM2grBSPT+e6NITg/yD+GmEaX29IJf9APHbF/Jyb7ElWkXQJKYn?=
 =?us-ascii?Q?cZgnn2MyR8ygIeXE0jSNtHOQc9wc1p1AshXtD7lHrdHStXwXc2Y672d2Ymh0?=
 =?us-ascii?Q?d0TcfQY+0DKxmj3gAvy0yDDbvpYBBUhvfZFy5R6p1zV1nshcmF8qdiRdf3ZF?=
 =?us-ascii?Q?r3cyvuLtB5xLk78xUsQHXkjnc37XWhKorouv0MbG7wJKaiskh69zdyjcmRLC?=
 =?us-ascii?Q?Hcv0pA3UCSqHobmLdueVFh0zEzMv3djrzQjkuq3/Pslagh8Gf5fv8sJzjpLW?=
 =?us-ascii?Q?f/6g8NTCpOtMS7OLEOjynWk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 515f9473-1150-48b6-1fba-08dc6351bc3b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 04:56:28.2655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P8XXmfLErUVGP3OeIwkCdsZJk9s02jkB8/a4dpMdSXk/GRGPdElyoho0miUFfZdyWimiTtMUWZlrmVNQFyusoJWwKVW7vp2bmlwe5yglnT5JCl2Q01/+3i88FbycJ72J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5518


Hi Pierre-Louis

Thank you for your feedback

> > (B) commit 1e9de42f4324b91ce2e9da0939cab8fc6ae93893
> > ("Explicitly set BE DAI link supported stream directions") force use to
> > dpcm_xxx flag
> > 
> > 	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
> > 		playback = rtd->dai_link->dpcm_playback;
> > 		capture = rtd->dai_link->dpcm_capture;
> 
> The reason for this (B) addition is very clear from the commit message
> 
> "
> Some BE DAIs can be "dummy" (when the DSP is controlling the DAI) and as
> such wont have set a minimum number of playback or capture channels
> required for BE DAI registration (to establish supported stream directions).
> "

I'm still not yet 100% understand around this "dummy" DAI, but is it
*not* soc-utils.c :: dummy_dai, but some original dummy DAI is used
somewhere ?

I know ${LINUX}/sound/soc/codecs/hda.c :: card_binder_dai is one of
the DAI which is used but doesn't have channels_min.
I think it is used as BE "Codec", but code is checking "CPU" side.

Do you know what does this "BE dummy DAI" specifically means here?

> > Or if (B) added dpcm_xxx as "option flag", it was understandable for me.
> > like this
> > 
> > 	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
> > 		playback = (cpu_dai->driver->playback.channels_min > 0) ||
> > 			   rtd->dai_link->dpcm_playback;
> > 		capture  = (cpu_dai->driver->capture.channels_min  > 0) ||
> > 			   rtd->dai_link->dpcm_capture;
> 
> That would essentially revert (C), since the direction would ignore the
> actual capabilities of the DAI.
> 
> IMHO, we should really try with this revert and go back to the initial
> definition of (A), where dpcm_xxx is an optional escape mechanism to
> allow machine drivers to set the direction. I would guess that would
> impact mostly DT/simple-card users and Qualcomm, if the commit message
> of (C) is still relevant.

I can agree that above code makes dpcm_xxx flag option, and allow to
machine drivers to set direction without thinking actual DAI capabilities.
I think it is effective if it was around (C) timing.

	(A) : checked CPU capabilities
	(B) : uses dpcm_xxx flag
	(C) : checks both dpcm_xxx and capabilities
	...

But *current* ASoC is checking both "actual capabilities" and "dpcm_xxx"
flag in the same time, and have no problems today.

Around (A)-(B) timing, some DAI had issue (= channels_min was not set).
Let's name it as "no_chan_DAI". It should be CPU DAI and used as BE
if my understanding was correct.

Because "no_chan_DAI" exist, (B) was added.

But after that (C) was added, and it checks channels_min again.
It continues today. This means "no_chan_DAI" today have channels_min,
otherwise it can't work today.

If my above understanding were all correct, do we still need dpcm_xxx ?
because "no_chan_DAI" is no longer exist.
Just remove dpcm_xxx seems no problem, I guess...

> Then we can discuss about merging code and removing flags. For now we
> have different directions/opinions on something that's 10 years old,
> last modified 4 years ago. We will break lots of eggs if we don't first
> agree on what works and what doesn't.
> 
> This 23-patch code merge/simplification is premature at this point IMHO,
> we should first land in a state where everyone is happy with how
> dpcm_xxx flags need to be handled. We can merge dpcm_xxx and xxx_only
> flags later when we understand what they are supposed to do...

Thank you for your help. The problem becoming more clear.
Let's focus to "revert C code" or "remove dpcm_xxx" first.

> And now I need a coffee refill :-)

Enjoy :)


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
