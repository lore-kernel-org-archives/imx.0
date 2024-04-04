Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11021010.outbound.protection.outlook.com [52.101.229.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDA318AF4
	for <imx@lists.linux.dev>; Thu,  4 Apr 2024 02:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712196304; cv=fail; b=aNBoE2jkPf7IHgv+PGQmdr6rJMDgTiixaS7nihWqY6U8bLzvrIj2YCVvg5W4yh+/qW9n8LAqVnhWrhkiGHALFoogVVsZ7+HR4cXAodBUHU3XelMHsKdeRCwazh3g7A78L1b0qtjebL7vEd/iX/i3AeBZnyST1pJkO636IRB+srU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712196304; c=relaxed/simple;
	bh=Oa7p4B5IJzgOHW4kYKNuGWE0IOr/s/K3q8NKmwYWvjw=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HWH/MTRadLHjkoX5TiUY/J5N58tAQ9JBkUaJrwrA9wt8OfLRTY1m/n5YoDkZQhbMR93Pszkf0G2mLs3XWR9jPvxdxwa2oGsBsymtd6/QtjOOmAayJfdnUbMNJHp8nCQv55CujZs00Wlfu80szHTYva2zEtXgJDO7VL2JIyRg3eM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ENclGJe2; arc=fail smtp.client-ip=52.101.229.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ENclGJe2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kuOAK6LGPBYTs4UN+hhAES2l/1Il363/WgZvhE+DIsP6R+9+cnid6HrjT8YfgZ7Mb5xUuR6zNPZ5jJlFEZ/twOXxQPGCbjlpjt2ktLfUfp5nWSLjgiosdrDtifp+Eci+U3+cRFh7XSMMsezV+ydByea+ezWbu3/9KasxXQQ1/o2fhOHj1GVVhHybRM36pSaSDYVR6d5jxRRe5Prq57LSjRMeT0mfM47JNABBcLQAaKw9K9oVtLTiUj1qZ0mWGEN/F+e9qh9bZ1uLLKGcJ8e/bbW0WDlmVGoe/5Sd8PRm46Xy3DjEe3i6peIVz2mkqyuDsi8PiHA9Qooki7/9OvxsZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTNDGNNXBZQp7DlIK5wj5CMMKS+usETk7bleN7Uaxmk=;
 b=diraMcta3XdKmTNHbaiNEYzmtVxAWs/G+o6p505cGusdEoIj/wUChM677ilLutCy0X6Pzj5oMIsnLoQALww+w+cyXGB6c8rLCjrss+QvuDc3kjluaTwoU/tCDZ9e2VrVxucRrQyZN+mH2gQb3rS+aXC31c+Z8+gH8n67OKEbffJUvewxOyQyRcsi9sf1JdvRKHOlDSFra4o4I2subrkpWJm6vSf7kDHTwp1hF6swURnWb7Ykyoli5sTqgZUzhaVyNb9ZL3iaz6YfDiLsBW8C7meB9wek6A4bSAQc/shkgZwVdsl/sgCM84ykTkczxbJAaG26CoFoF9Aidk2lzEsEmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTNDGNNXBZQp7DlIK5wj5CMMKS+usETk7bleN7Uaxmk=;
 b=ENclGJe2+46FVYNdWaA9w5Q0fFjR2UZnl401MVAan67n6QxM17eY4hBVouxc6iSwNZORazkGBJ4UknOvh9uw5/OI6Y/d+mLYPgVeFlc28jMOxUwVoHgDM/aXNz/BoQn+R6W8JOpO4ZFt9Q1KlZORW2Z2hQbWtDZOLju5nYi86ww=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5606.jpnprd01.prod.outlook.com
 (2603:1096:604:c5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 02:04:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Thu, 4 Apr 2024
 02:04:58 +0000
Message-ID: <8734s1992u.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [PATCH v2 09/16] ASoC: soc-core: Replace dpcm_playback/capture to playback/capture_only
In-Reply-To: <2cb2f96f-836c-4816-86f8-2262c2dd1ce3@linux.intel.com>
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
	<87msqdudn7.wl-kuninori.morimoto.gx@renesas.com>
	<1a42ebbb-1e1f-4ecf-a1ec-7af292f7ff96@linux.intel.com>
	<871q7o8y0d.wl-kuninori.morimoto.gx@renesas.com>
	<2cb2f96f-836c-4816-86f8-2262c2dd1ce3@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 4 Apr 2024 02:04:58 +0000
X-ClientProxiedBy: TYCP286CA0227.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5606:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NU1k4+9RZVWpRtoJejkp32ggrFDVAW0q650i+EWHPdou1N8OcltATgd2DojTvWaQEjSkLnEvBSyYiPWOiZKSKC/muEOUijVl/q8dn9uXasQ+UtknZ4UMR6Bj9jUBONucYF0PgCsamUSZ2TJpOIQcx6Lv0HYySgZXhtmnRiEPAjhuxhTIseM4HDxHTSHWJD1ICdslY4t7Y6BgEHZ9kuTe1Fk/lqpA43ZqgkuFYrV2G8XwtPxvlk93nFdj2f9+KXaBj+okpYdUXXy2OBFVbnPpXgDGC9C1psbxZAS6hR/BOgIJi3pPLopI61dv3E7y9E71PgIvAeby1T4oCG16icbjP5lWKWe1JXFnN/sfhVG8TemA7TGbTXEMInlNUmV9/g0ucIF36c0ujJ0FKxi6RfpKHeNxYltglaWb2FyY+tsn+YctvruPXTAEOnbYQcSTPzMTwYwm9NizQmXYLxiHEuaaDTbasDpDmWz7fgR3Zw7NerW6/uXYsXfA2BVNq6/oBakTAGbxixPIkgsJmARFqayxYXWbSISDZelPPc43NxQfS981NZro77Ls5Dpb7MYu1TlsV+uA0EWBppQ+7DB5pD1b2auYBqS8gMOoFkhzFh8AAlGO0GEq0kOhCKhk771hx7AH/uleIcgtcwfbqqOGZTBvGzu6he0XGwMnYOAArFWaZdAacgfsbnY4KIp2cV9v1JGHXd7n6gF2aYfFKxn4rHnmtoLmP6/a2GspBi0Eh5liYh0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(366007)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QG89SgvF6LRwthmTOPWq0iWQNggS10gEPWXbA5SjnnHPD6TSL/9RIRHkVWT5?=
 =?us-ascii?Q?rExgNGtRNsaI21NaeOF7Pl/N6ITYdsuiRxouCPy5XCOGAsIitV7LJxEgl+yw?=
 =?us-ascii?Q?EFn1nyMkbN9D338yH4PkWBCx0qnrnRqCABxxwZ2PsS5nJ0T0UYn/dHgoF9ZF?=
 =?us-ascii?Q?3oKFKiREI6v24OMn1Y+54RNvW5E4kx3BUVN9bBeYkXiqTJPv6vCVUfkzQLrn?=
 =?us-ascii?Q?sqEhtJK2bIGjc2qV/Ng7esVAcj27YaPX2ZT1PuToC30qjf2rgnXjodqSk7MF?=
 =?us-ascii?Q?moCtqVlCTRaVCVbyzYFdL/+fbMjsrgd3ZB67QQDroWfeRBwlYoUxyin9XOFl?=
 =?us-ascii?Q?Cu2bZW77VwDcL4fZLP5ObfkhpRxjwgAV41w7N7iuMy1jBMfjmBbumqXwKmbl?=
 =?us-ascii?Q?vWRF9+f6o/qd5XAOHCD4jXlMBPRYediMN80QSDFrueANbqnn1EcrjCuJiRQU?=
 =?us-ascii?Q?K2F3Ai7F67DMHVOJ3YSDjDQHKbWG3xIXA38jrwQTe7owWVObdcPiCln5A8nD?=
 =?us-ascii?Q?YaWlzlafuEXDPlH5Lv93V/OR0YIJGF+f7KvwqjYMNOdx0resdVK19C5UHVlI?=
 =?us-ascii?Q?srW2pUcA78Ej2y5W3mQyvyS3q+YHKKIliPQnuRTj/DXCDfxaOJK+PLV4+/uR?=
 =?us-ascii?Q?2O+fIA1XzD7Yy5ZHAyvh+VPJYhdHC06zP/w6YhjViI9KDFB+StDZG8tY6AWf?=
 =?us-ascii?Q?dmZ/1DtcaOk0IgZpkccc7hk5TWcQSOfIn56C8f/rqqogOaQmtTnYM1hBqQ1s?=
 =?us-ascii?Q?Upo6hNLlo1ZZx4rZ6f5BOhcc0ymE8hYUarI7Kv2lDXB2KPUa2q3rsqmOaQGJ?=
 =?us-ascii?Q?8/Iw7sn39YJW2eueU3LXM04ue9LpdDQiXhabGsEjwGqbK7aTB5ZD7K4eJMne?=
 =?us-ascii?Q?MLRMd3rk3x511bvCUnahG0TJ4eRpLN1RrXmg37VpBLesb5mz7sbmHu9qxHla?=
 =?us-ascii?Q?MCdYIZzRyc0IJ4Cb0/+4cdlVL627MSkOv2sfHSjztXREBpDQBssfOQ2aXVLA?=
 =?us-ascii?Q?3Qv0He/hvuga5YVy7QYEMiTH+5pnwy3ukaYP/ahziGtGWYYWwaYH6KuIWkYL?=
 =?us-ascii?Q?GWF846ft1WHqjweJOCqzwo3Gj8mEem+1QI06NYwtow+miD1svuSYhRT5lCJu?=
 =?us-ascii?Q?754lZP07seTMYtxZowxMo/rZAB2YAxqP7BiVxdFrlnfxoIxnZJkUz207tEWM?=
 =?us-ascii?Q?ySsliDnaGByPJcFcHfr7tBEqJdGjt1GwPSFBbk8c3W77sr22cnVOjbmlaWRC?=
 =?us-ascii?Q?owGqM5VRSeokR9RyzSNxRYbCfEnpsOXHUoTLImwLcUrPaCh/ZQiN4Vq+dNes?=
 =?us-ascii?Q?wSwO55M5HItLL+vX7FQmY5T44S7ww6PPYLpNfKuT/ONVwKIHhJma50HTR3aq?=
 =?us-ascii?Q?5DlYymAajchb06joiLjuue+t5LzdiAK2RgZBeGYmLHve8bmwWQMVZ5ciSshr?=
 =?us-ascii?Q?PAd0QVzNYMiXfnwTsn8PiY9+T9ckBMWAbrCBtElGzz1CiPEfJl0DMqpltrHI?=
 =?us-ascii?Q?ndehULOHlYa/gF36fM3D6A7bD8UdOFZC3WBaq/O3jh7C1XwOWrcE/ZfxS5ze?=
 =?us-ascii?Q?adhSdJ+b75kUqU/jJD0/UaW+e4x+OF6PHRK79hybAkzzJbiTYq8ie4vzZcjM?=
 =?us-ascii?Q?EjcsCEUF+F5g7oMj9vuShpE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97051e59-f75a-4ef5-4628-08dc544ba129
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 02:04:58.5978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b4jWx7f67wSUkNTF7GlkXVblE7QIkPHxPeYlukwZ1eooh8SC07ieNuiW6Y71k/cPqblq4X5R58C6wveAJEeMUdiFTEg3u5eo7RnYm0rW9tEMpFNsNXPt5TZicn7V9ycO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5606


Hi Pierre-Louis

Thank you for your feedback, but this is also my understanding is
not yet 100%

> >>>  			/* convert non BE into BE */
> >>> -			if (!dai_link->no_pcm) {
> >>> -				dai_link->no_pcm = 1;
> >>> -
> >>> -				if (dai_link->dpcm_playback)
> >>> -					dev_warn(card->dev,
> >>> -						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_playback=1\n",
> >>> -						 dai_link->name);
> >>> -				if (dai_link->dpcm_capture)
> >>> -					dev_warn(card->dev,
> >>> -						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_capture=1\n",
> >>> -						 dai_link->name);
> >>> -
> >>> -				/* convert normal link into DPCM one */
> >>> -				if (!(dai_link->dpcm_playback ||
> >>> -				      dai_link->dpcm_capture)) {
> >>> -					dai_link->dpcm_playback = !dai_link->capture_only;
> >>> -					dai_link->dpcm_capture = !dai_link->playback_only;
> >>> -				}
> >>> -			}
> >>> +			dai_link->no_pcm = 1;
> > (snip)
> >> It's not clear to me how this is related to the
> >> dpcm_playback/dpcm_capture removal.
> > 
> > In my understanding, if "dai_link->no_pcm" was 0, it sets no_pcm and
> > convert setting to BE. If no_pcm was 1, it is BE anyway. So no_pcm will
> > be 1 anyway after this code.
> > And then, dpcm_playback/capture is no longer needed.
> > So it just set no_pcm = 1 here. But am I wrong ??
> 
> The problem is that the patchset is supposed to be only about removal of
> flags to align on one set, but then we also have "simplifications" or
> removal of checks without explanations.

Do you mean it need to have/keep the comment on the code ??
And/or what does your "removal of checks" mean ?

I understand that patch should have enough explanation, and indeed above
code has if (dai_link->dpcm_xxx) checks, but dpcm_xxx are no longer
needed in new code. What kind of comment are you requesting to me ?

> It would be far less invasive if we only replaced flags and had
> iso-functionality. Then we can discuss the merits of simplifications.

This was the most difficult comment to understand for me...


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
