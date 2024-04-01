Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2126.outbound.protection.outlook.com [40.107.114.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8286633
	for <imx@lists.linux.dev>; Mon,  1 Apr 2024 00:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711931506; cv=fail; b=JKoNaikniw+t14hAlNRak+zi9JIGy34qb1j/y/Hrhl6/mnBJvXkJYv/H52zqxUlbHN3bJYYQURavks7/W7JJUKu+EMWTBp6U8CBicKJO8A1PcmA692Dj5VkZxQDFcoRPIW8jYwWhz64vxXhip3KnUcL/qamIODODm2oJIYiC4so=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711931506; c=relaxed/simple;
	bh=SyvIOYvFFFUZLeaqlQoWm2Gkpn2rQVrEmV3CUOemY9Y=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=My/qwm+h5cBnZq1tkIpnRnn9EQEOy0ie2NkUkKh8jryGfKn4gouvBbKsXi0g4ykFV49kTX111qgrv2gfINLp+tQlCadA06/DBcaEbJDKq2H9f7C8OBnGNdOwqV2ZNAre/Fp0FOQKdWo1l2S5oBs0ZfhrMsiplqwG+hM5PlbxXhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=J3OdAoHN; arc=fail smtp.client-ip=40.107.114.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="J3OdAoHN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiBagbIqwZaJlYeI3drSGh6kULDbxzvA37f4Q3TPe/K2toxwfPMEd9IrXHTOAd1CxUcoV53llL+qJ/agH9bl6umATzSaMITPX2V4TCOyVwkZJosAeIU0qp4I+H4QfvlnDNofPd6HVjSu0ip6Bm9L/jnA1vWYfhAHTk5WRjQUHRBmEOh9mfnZS1r4TuxyY5Zh/NAqrOOF+fvog09JEk1YcN7F4wL5299IN7aWl+D/BKru25RABnQQQX0Z3nOoM3keot+NQ9FcwTOUrBpndafLItMr93Fe0YEGV7q3hvEnzW02AJGOO9FBKWhXKRHU2t8XUWtKHwQUj/K17OjK7lwEVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hsz7TBTOE5pxjjwDe3m5NzTme77ondOE7PRhgSe/YEA=;
 b=A4Ed4mdudPJD2sPCxffzablvfNv6znd6k4+IctoqXUUZdOfVbUBSI7CufwXRUckB3EgCKWhFtsRHZdicIJo2gbW9AqEm9wWX4CNt1ab5aCA4MVlDuvoIvVxNYobpRrZu/2VA2csq157E+JGisXlb/eNAciadA58a20AgGC+a6ohLgNv6qImR9IbK7gyg+9MFXbPyrJ4/iI04aZ7POpToNUgWhv3BeB3EL2VqBF9lmrq6aJDwd0EGqWRvSbnY/r9fou7kbQRpTlLcDREo0oEb4dchtnx0FyL+7t9kQr9ihuT5V/bbcm5R7iRuLM24ZWlIspAUrCHBqb31/4sRcZxcRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hsz7TBTOE5pxjjwDe3m5NzTme77ondOE7PRhgSe/YEA=;
 b=J3OdAoHNxQ1XrjYHW3LnbOh4S1QacWR0cmD7ejdbeFq08AVAolPpnr2T3WlfoF5GcB/kh4BrOa6Aqq55kMyqRfRmqukK1DWXsB8I/CY9Gws+cPvftGmiyt5UWK4nXMufT1uWMC1qMHD2KRNFLS4JMszb6gL204h3lwLB7zM/JQo=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9964.jpnprd01.prod.outlook.com
 (2603:1096:400:1df::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 00:31:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 00:31:41 +0000
Message-ID: <87msqdudn7.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 09/16] ASoC: soc-core: Replace dpcm_playback/capture to playback/capture_only
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Mon, 1 Apr 2024 00:31:40 +0000
X-ClientProxiedBy: TYCPR01CA0169.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
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
	QE+Ln//J+z6KLnZwRIAubVV5bBNZcQ99BZT2sPU/HKGWasepsCFUhYXE20fmvj8NMvjvjjYw/p1Dr+vu686hNdSvKF6bfDVM4Ky+Aq9VPS8bU1gzBvFWzt19TXxk54iE4ly3wuyGaPPcDwaEFAGf43eZY5YL3DGwsY4ngV6T8hmtMGVMtvftg/5w9fsXW/juuBm1V9RyOgRn9OBfS6x2Fe+T0d8z8Z2mD1UGgnjqA+xDHBAzPw64MZ777Tk7m7fvOWL9u5TA9QOsjoPgGvbIbA4VEsTDDJPdROpQDmZ1mEIU2yVb4FNi9NzOW+iA2iJhip8JT66++7ehesYApJM2ziFwlWlO6E8a6JiR9U528WAreIIEEtHuNAzrz97r3JmeNoCoDX9DFaGm3r3EfBkVLTxfIcK4Qzcs2CwAvP/tWmtnSgkHieeV+XKuHLCf/8RcJtkUjUwL1QKza2v6tusBgeeA+36fiqyszwyuEtsGdSzsRcm27CIShoMiy/D5aCnEsWLfHvHddJz4uXZowsB0JU2jGKdM/1xpdmaXj9FamxoNFFqmvTBOG8pGVVIk81gzl10AQJA0eaRFvvBfIV07cHzceHLGp9RsHu8/SAV5hwk7K+Q0JbTroIjEiEoJ4rVDvv/K4y1eq5OKF3CE5Qb9praSqwfRSXtX09GQ5oZ4beOdnSTPXTmagJ0O6H/piXtlNSuNbF2Ut7ysfpmWxWOdRpY4jdFaQPP8T0u0LZMQv4E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(7416005)(376005)(1800799015)(38350700005)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?QiQ38+HXM2a103a6NkhiILSrQa4+J3h9UuQmr9ghq98fSTif8kpynvYBSr?=
 =?iso-8859-2?Q?Jc3TBFmXUcxywo55OMkTb4d8WLcQlYAXrqsZRykbL3zz9nTgFpY0DfLOe/?=
 =?iso-8859-2?Q?1elYywtL14F/7bTinBE8CbYsJ1AQWy8hBb9iWtf9WL9eGCIv9wOtrinCxK?=
 =?iso-8859-2?Q?lF7S8+L5hUfTszGKmdcwLwc4Rb3Xk2+EzCBHrG2IXZtsy/WNK9GrezAa7H?=
 =?iso-8859-2?Q?LepBuh7WfS4tpHeHj6kP6XLLsEMY2Fu8/k+WPBVKWspAE+U5amH8L0dU0L?=
 =?iso-8859-2?Q?07g/m7VQlo8fuc77ZPO46BB/4iV4G0E2beydKuD405T9Sjkm+CVGUudvAm?=
 =?iso-8859-2?Q?DXc36D5I7h62mrlb6fkVs+BfzhwG6wzUf/UZ5C86IV670PGZ5sVMdL/bfk?=
 =?iso-8859-2?Q?qDuEff/WidGmxQLvzK9+bTPUN7EMK120vvxfPUo6W6M1ZrZP+W3qZ8r6Q6?=
 =?iso-8859-2?Q?MoGdakI8jYIMHXzhKDcaDzvDAGOD7xVgTq/riLsjP8XWHe4LVN/busJDS3?=
 =?iso-8859-2?Q?OcnsuDgo8V5XVhW6+HF1+/IVlGQQuEp/otfkJ8kqGnY8r5wS0YhSfiw/c2?=
 =?iso-8859-2?Q?NcNZZPWMy4SB4TgUm3Dbp7DW9sf+v3rqLZgDVXSv+A1Uyevq/3M/uWwS07?=
 =?iso-8859-2?Q?5+HplgknLFEpDoF//O7qBxPeNW6PIBlPOsJuYbf23gqxSC6hiCirt1QVv8?=
 =?iso-8859-2?Q?TJQTYZ1iLkwTlsYTyXHoGZkvdEevzwdtMqiJRgA7TTynN35IPBdAsFvo4Q?=
 =?iso-8859-2?Q?nOZ7VreNL38porE3eF6yKskmpxPQjsykgiFCQRd/PLOCfpERTdOIwaktqO?=
 =?iso-8859-2?Q?WQC58natkxvFTClhF4N7Yb0guI10h+erktHeJoKvuisyrm+7QPCG5qhqAG?=
 =?iso-8859-2?Q?khe41uvEPbtFcwVB7cERnUuZ2ebidcisAhUNHuUif1TgafJDpRLcUGPfkr?=
 =?iso-8859-2?Q?YUqnPBdvN8wtV3o854ynB/WOMtKW8ACb/Uc+9UIW/UMZoOaD784j3tzFxj?=
 =?iso-8859-2?Q?MGljU8dWgmy8NhroWMhjktY1Ovq54xsEXrgwsKiBL9YTormEiVEnUSP8Mn?=
 =?iso-8859-2?Q?g5DyeYmrymiq95GWRdotQEm2LRmFRgp64vADO5zg+hbpIbKDGCZrK5pGMO?=
 =?iso-8859-2?Q?eAAmXXIoEyP5zuGB6u/5FJn1dfzC00+dtjEScQyF9rdj0b/4c4n1V23MCa?=
 =?iso-8859-2?Q?7wzW47ytU4uXDRfOJ/jptxEeC6TVgHWldeZmpWA0+9K6D80RfmjU8WpMCL?=
 =?iso-8859-2?Q?/kvVzrVem4I6G6H9JAEMJN34iWbRteukhK+qOIZz4qvY5ikKj2aM4uKD8C?=
 =?iso-8859-2?Q?eiq1xz72o5PjYMCynXvAoReyyDnygkwEwYkBJWaGPXcU7/y8bsL8AVCw/Q?=
 =?iso-8859-2?Q?j8YOvJAOmpvMskF2uhb5EE9HjlrOsD4rL4JlTkDd3HHHk+Jq8WbRexfdKp?=
 =?iso-8859-2?Q?tDIrXDz09J5DLzhtMr8ivf4KQMCrFe1R4qSQuIysUXcRK9FYB/g5qW6QNT?=
 =?iso-8859-2?Q?I62YLMXPa8MgW5DpF8epJlGaE5i+JkUqA9dAYf2WmiukcnrFamzvUqJuau?=
 =?iso-8859-2?Q?/dMinm/SgGsrOsWQ/uskYxhmJUApNkoIyERjJpTeV44oM/c3vqr5aM9r83?=
 =?iso-8859-2?Q?tU340rkzbrCUfnqtDPF32BlzUFYBHLQyMfF7+V+luQ9Wsnfob21qstiP2t?=
 =?iso-8859-2?Q?ljwoE5B9jFc/qLZHUfo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 442574b4-5bb4-429f-0273-08dc51e319ad
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 00:31:41.1150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cyFE5pgOZGFrMOFYE2M4Jc6qJqn7Vuv2tE60vnX9bLw7VCQOHX3j6rXIaqUWy6kNGDgE3AGmdxiVch7uO3VxzSsXB7A++wP016kLlUYo9cxQfRfA+ExjcdsJWn9EHaxp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9964

soc_get_playback_capture() is now handling DPCM and normal comprehensively
for playback/capture stream. We can use playback/capture_only flag
instead of using dpcm_playback/capture. This patch replace these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-core.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 3ab6626ad680..b168cf642092 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2000,25 +2000,7 @@ static void soc_check_tplg_fes(struct snd_soc_card *=
card)
 				dai_link->platforms->name =3D component->name;
=20
 			/* convert non BE into BE */
-			if (!dai_link->no_pcm) {
-				dai_link->no_pcm =3D 1;
-
-				if (dai_link->dpcm_playback)
-					dev_warn(card->dev,
-						 "invalid configuration, dailink %s has flags no_pcm=3D0 and dpcm_pl=
ayback=3D1\n",
-						 dai_link->name);
-				if (dai_link->dpcm_capture)
-					dev_warn(card->dev,
-						 "invalid configuration, dailink %s has flags no_pcm=3D0 and dpcm_ca=
pture=3D1\n",
-						 dai_link->name);
-
-				/* convert normal link into DPCM one */
-				if (!(dai_link->dpcm_playback ||
-				      dai_link->dpcm_capture)) {
-					dai_link->dpcm_playback =3D !dai_link->capture_only;
-					dai_link->dpcm_capture =3D !dai_link->playback_only;
-				}
-			}
+			dai_link->no_pcm =3D 1;
=20
 			/*
 			 * override any BE fixups
--=20
2.25.1

