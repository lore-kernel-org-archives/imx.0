Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2106.outbound.protection.outlook.com [40.107.114.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36011633
	for <imx@lists.linux.dev>; Mon,  1 Apr 2024 00:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711931517; cv=fail; b=MJXm8EwggD4ht8k7tvGYVoFkuAVeNpq2hQjURCxvDHg+A/O/+TW/30lRLr9+TS5LQrjOf2SnP+VnnBxLWzanS/dOmBNqTZcgsYX/DVo61yD5e9KfWJb1n5Rbk75eLHkam95i6wYUTeJCmr2nog7LK/CoYDuYdIz9I8NVDqgiM7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711931517; c=relaxed/simple;
	bh=YgTWv1vhfUdk2t+lbs/HS8Ry7stgMNoX6aOctFEpjRk=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=uor7Q+ykL81ABrH3ybPEGO3eF338FkU7YHUOiH4gLClQZWjPUbWZ49tezXSBYqtr+wEXYdCTgYzfU/wj8yT3+AgV+PHqKfeN+n9I7WWK3k+15FgEWjXlujFCq+KsF9MpZmE/JO3aPQ5q3hlPPwAXx/kSccLgo1yyUhPy73xGSms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=L1ZiQmR3; arc=fail smtp.client-ip=40.107.114.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="L1ZiQmR3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEJjANlZqAMUDLel1ao1JcooJG3UO2HnyAyJgZGp8h9Z9o63t5b7JE7btoLxQHsbnigHA85c1jN/RQQWnhhusiZvj51bF/Ex8x2tMjKDyT3YFBNiJZtRFiMetnUC7FZMbWsvKGFFYo5lUo63flEZmxZuUy9VsRL+RPAYuaJbVe2jhLUvJhaoFUjylSJ4h1tRZ6N9Zb+w7eEMD7jN7VHCrVNua4lu5IptPLVeVMwM9PgrZfbhmMccSOnOpgiU+VbN0TrSGP+N50qKxVDCK9esJN1igsHlM3s3bwsPBd4G8mjwzYxodzDcwkB7vDPMVuXm1XjdkrufYTAZb4BFiZX/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqhqoTJF+tm8QauwvluMseFaT1V2WJovxDaDwefjuKM=;
 b=V4h7PB3JxDTs2gOY8WLP43wXnWtcWy8kF9iQ2N9zXo/pn0sCG9uY26kIXB+7Nwy/LE6qXzpXnezNu+a0Hz+P/wNVhEE8z87O27/OkrUVWBRyBRxNzp+O/obKt5wY7y3w5VIWlz3fA6UaprDfMgr7NzoflcouG8dEXeMuaI/bQNttk+s3xngdgM9ztOK70rv+92M1ss9XT+WJfQVbY4xqT5dzM8PTpKUKFZ9PFGInoZ3ue4URqG5pETj2/ksIq0yz0ZAeiYfgpcSb5jmIiBijqiM0aoQEvnL07TlZT0x0e5Wmb8mC8exi6TDsbFIuhwa1iH8+6cl1RBu5uq0xQRI+Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqhqoTJF+tm8QauwvluMseFaT1V2WJovxDaDwefjuKM=;
 b=L1ZiQmR35sXxt7paCoq3tCjYWCc32DKdvhEJAEG/CUdk5LAHvrWmQPF39rMCkuBBg2RzZ3cQ4DClWdJDkH7JvNd5wBUKm3xvPH48+9wDCD4twgxAP/PTyjlhJkyp1VYTIAv2tE0zkdjE6uNIj29mD8DaK/Yq2JnUCuU79ZqAWJQ=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9964.jpnprd01.prod.outlook.com
 (2603:1096:400:1df::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 00:31:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 00:31:53 +0000
Message-ID: <87jzlhudmv.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 11/16] ASoC: soc-compress: Replace dpcm_playback/capture to playback/capture_only
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Mon, 1 Apr 2024 00:31:52 +0000
X-ClientProxiedBy: TYCP286CA0194.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
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
	8NVOZS33X1eE2acF3xt3FBiD9PrFJz6jV8USY5L9qeKRdg0JHkXsxLrWvqrJDiIjQ8B/b9foD1T7cbETFDcx7Bd5Q/2olPWht3Cc0kPbeaK6swC3S7LXtvuqXOkfplHiM0PNc/m+GGz+Q7xXqE6xr37OCyksKYpujuSCNuK6RWLR88oowAtNG2ZfPz3m+CMDEwLBaZvQP39n7IdOUEz8AxqGkcM1aYbf8/gFdx8vViFLkyozLEKYrOwNgz5G4PqSlHxtGE+rB9kyrz5PNvCR9av/4PnZ4E8K6GJKQxtDkh0qwuPIVTBcH+5PU7fQ3vrvR1H+J4tTlQPpZEMIAXpmAWC3cNMAkQ6ASYob7tRoj8HarxI08VRjY7lAMHnZcZ0zG6kJNnIdv3Od5umiNTOS73ot71lt0ktXCrTbQMpN0ci2A+i5Otpw0ckV/eoDGRsNeGziA5iK4FNYFd+sDC8KvCTISBxC15A0uZUDKtdFpZwBJrtmY8/C+Lw6WsXAAKSjFbGoh8EZL6vqVSoLHy69RcNBqtJtG7skY4DcAqprKvwwa4bR9AQeMB1wiO7wbiKzE62PqThTRpqGySBhZyzihccT2ryw0OLBWxHfKuliy/zX8FJJx7/OE6OwoRQkDpta2VdV/xwHG7kvQhG8oKFafNRSyKLpTgCisk9TN9rWwQdCWI4NnxYpNpifBYiTmG+MqdlTzOLGCTaFyjSn1cGCc9EUm4W230z83gIhR5KWZZk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(7416005)(376005)(1800799015)(38350700005)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?g6YixwG45lkokqYva/gCJu44aCtArNgS3qtQSxS9N/g09z/CwMlvTvq0Mx?=
 =?iso-8859-2?Q?5qB/9il8nbJbg1etW+AAtimZHWw46OdIDNx0/E4TIxSzoNwicQZOGkB5bU?=
 =?iso-8859-2?Q?HeLhASJONWt3fTJKQNIcW8cKasJkYDkwnluVtFynVUrzXanJqZ1Mi3QfGn?=
 =?iso-8859-2?Q?B4cgoRYPX11qGFsy5MY9yHx6FDMhyCS22G2/3NEr2DLIj1ZOk3GRXqrkVi?=
 =?iso-8859-2?Q?abop/H0lICpfDnF8g971p/HnYwgedQtzHRIVXSTwIdzPFnnR0V74CDVP6z?=
 =?iso-8859-2?Q?cJ1+p2k5ohvGHyx35kYS79JF9fmImWMlszcJgCY8HcCmQdTsau80qSB/rT?=
 =?iso-8859-2?Q?rgnxPEVyAV6xeHscL7OfwN7QVhwDR29Ho7+vnYHkDPZaomkQnHA2skteMV?=
 =?iso-8859-2?Q?O77hjTeii1giUgSWF6mxiaLZ4jr3ptBMc5w1/Oq0/QnIUlOBpd+nCiGpeY?=
 =?iso-8859-2?Q?M5tFfgX+fnCnxbauTD2BMJS09FXIN1bDhq2NYQAN30QvwfZRYxRyuZlBii?=
 =?iso-8859-2?Q?eofBhHzZ6rQ/6dVahBECjhtJxYIU/KO+sOQdZv1IGwIFa2YedE33j8YD9U?=
 =?iso-8859-2?Q?Z/pExC9uXQxByv48yTTbs2zlIZS1Ol+zfm9uuAkVFnUSgVGvSPK9sXN8nK?=
 =?iso-8859-2?Q?I0rhEgHnCAazmTK1s1Xgmlx5rwYe/nmwBZAqSOef7lp2TtYWewZVAeHFQN?=
 =?iso-8859-2?Q?xKZmYMfJvp+GGlI6+MLY3Qy/XBCFqTcPSEqyTJnQUMbsoDz1WIqBKHyWSA?=
 =?iso-8859-2?Q?j0HTi1Gp/vWPqlVyEeq37h20vT19c6IBQUQcop9XNCgQekaZYmrFrjDzcV?=
 =?iso-8859-2?Q?Je84G6o+cG2UGbYp1bbK4XNaDPBqw3N17editvUIIfVTxqoAZ0xAuqg5By?=
 =?iso-8859-2?Q?p/IwLYvdvnJ0Q9HZUwzel+KOjm7Xy154AAoLckOlg6X4SbIeEwPJCb1Llo?=
 =?iso-8859-2?Q?IYQwJHQHWeSPXfFuHfhm1Ibhm1+vtLHvG5deRZRx0wgtlUvgWCTQygOHi5?=
 =?iso-8859-2?Q?3WuzPXSspVAYMqzxCwk2yBh95E03pYeqpKw6P0gqN4LH3/lBzsIjTDv3T5?=
 =?iso-8859-2?Q?rAZLJ02J8+fbdAozcdBannzcqWLWfUYY80AE9eYtWBN7JC9W2auVkdTkOO?=
 =?iso-8859-2?Q?l4Hiiz7QF3fINtRI9uEuAlR/xfGS2zTpOLiPEjZzmYHwBZDpvg4UHpTc/2?=
 =?iso-8859-2?Q?eQKD5DMNndtx4kS1UB4+s4NcKewc+TIWXfGDOvdCN+9mCcnCsa2ek6KzJB?=
 =?iso-8859-2?Q?EIv1J71c6kXec7n8w6R0o0uJ6D8XIRAorXzS8JIVj+Vw3Jpox8XOC03dpG?=
 =?iso-8859-2?Q?CGpmhHOxMGIXlY5bZw1ftNGs1JbDSdgx1pFSra0jBE2QbShhgdwpgHS1EK?=
 =?iso-8859-2?Q?XrCvH6/8z85MmCblFSWWtYVS3z7W2MMcs/0NDIgJLIPn1hsFz1LrW678Ap?=
 =?iso-8859-2?Q?pspw2A/xmcOjSCju1ZkO5zLTS/b2MCptLY/0x64Faq7h7zUDYBokC6bLJ2?=
 =?iso-8859-2?Q?WJEMVzXx6pwMY/UIeomWCjJHfF1CGvm3LKGBigvx+MRJs9X97oqaAioPT+?=
 =?iso-8859-2?Q?xdryn/6teyCGEB8up08qt2j3p61eCqx7qnmt9o/7BtW+dv95REBzQp5PWs?=
 =?iso-8859-2?Q?4MVlzjYrJJ6r54EOFG5UplhnQWF828WLLBDuiygqJrZNv9XNsX3fVkJF3t?=
 =?iso-8859-2?Q?X+ueK03siCY5WrMKMg0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e1edde-8d1a-4400-8879-08dc51e320ee
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 00:31:53.3003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Wr52+d67jU3ftkmnnShvKuiSrwk2/NAShK+xClVx+0c1FhQLhHA1bpwIcwXtDezVBYRyHmKGr2GP5RCBuUXPL4m1i7xzpEKAIfGuut1SrtzPGRFempG4dlKV0rVjlGc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9964

soc_get_playback_capture() is now handling DPCM and normal comprehensively
for playback/capture stream. We can use playback/capture_only flag
instead of using dpcm_playback/capture. This patch replace these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-compress.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index e692aa3b8b22..b861c2bc62e4 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -606,12 +606,14 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *=
rtd, int num)
 		return -ENOMEM;
=20
 	if (rtd->dai_link->dynamic) {
+		int playback =3D !rtd->dai_link->capture_only;
+		int capture  =3D !rtd->dai_link->playback_only;
+
 		snprintf(new_name, sizeof(new_name), "(%s)",
 			rtd->dai_link->stream_name);
=20
 		ret =3D snd_pcm_new_internal(rtd->card->snd_card, new_name, num,
-				rtd->dai_link->dpcm_playback,
-				rtd->dai_link->dpcm_capture, &be_pcm);
+				playback, capture, &be_pcm);
 		if (ret < 0) {
 			dev_err(rtd->card->dev,
 				"Compress ASoC: can't create compressed for %s: %d\n",
@@ -624,9 +626,9 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rt=
d, int num)
=20
 		rtd->pcm =3D be_pcm;
 		rtd->fe_compr =3D 1;
-		if (rtd->dai_link->dpcm_playback)
+		if (playback)
 			be_pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->private_data =3D =
rtd;
-		if (rtd->dai_link->dpcm_capture)
+		if (capture)
 			be_pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream->private_data =3D r=
td;
 		memcpy(compr->ops, &soc_compr_dyn_ops, sizeof(soc_compr_dyn_ops));
 	} else {
--=20
2.25.1

