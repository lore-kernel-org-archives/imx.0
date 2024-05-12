Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C163D1C69D
	for <imx@lists.linux.dev>; Sun, 12 May 2024 10:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715509794; cv=none; b=ZzcF+Btept804vAW8sEmgDD0//35Q3iOEETdSORsumaK7r1/5OwLI28m/mHs59TZYx3hBvcURxMSyZR9895N9fAvpmhf3bvluXZzPXhUOkUU7DTXgAbJASdxscoTJGSPMEd7v4Qz2/t9rokAyuknvQZoJR5U6xDaUoq6fzaDxBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715509794; c=relaxed/simple;
	bh=w1o2Yaf9FLjop2xIK639KlJNpG8x0DnT26oQFPXbRo4=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=ectskHo7qPK/Pq2SCvRhIajppl3O8lvvLgas/gQUeFbdATchS1Oa4fXgunou1B9sbg7u5oDb1XoyqAS+Sd/WFoceTxpd7mPZVPaRZdJc0zULIMTHMX1FjbTNgWqpWyBqjMll81CSRk47gX5xsq1T8NiQ6LhtLOWunnirz7pnuFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2G7pDxXw; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2G7pDxXw"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e27277d2c1so44242231fa.2
        for <imx@lists.linux.dev>; Sun, 12 May 2024 03:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715509790; x=1716114590; darn=lists.linux.dev;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=Fv/9F0HfW1oXfzYNtDAB6hyBTxEV5SCmQBMM+iRyCeI=;
        b=2G7pDxXw4VyVGhVASVCfvw6hOTCXp2OdZyFX+MMia9vW6TQoGFgdVGjeAs+It4/W7Q
         IBQg4eyZ5bjtVpJ/I1QH4/CQeWQI0wljaAru/5q7yQyJFiSr1vkzdCFNtCNXUfDFVoDV
         T4hl3kdBFZIZwVD6jQYxOD4aC6OEKS7Gls8cRmdiqKRZMPhEkVE5Xio6H7Er87CiyCPG
         fCxUG8oq8OVBuIKXAr+bLkmeEcpZvOt9U3afkq5qFJYBmwNpQtO5StN5qtbgrlc0qoJn
         QU97/wlQnT5o7+p2P62YSeQCUbj4pioy8Fogass6yfZEa2wji/erZBre5tTq9r5Iim2j
         7vHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715509790; x=1716114590;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fv/9F0HfW1oXfzYNtDAB6hyBTxEV5SCmQBMM+iRyCeI=;
        b=JJNUUjwRhz8hiXcQFn+ZTTOIgR+2rSxdGx3ODstx4G3xU2CRqs5zHXXIZP2a/o0Ps6
         oV5cIro83jqak14nPPWnmLpjd2VW3WLKHHh+PsCIJc8iF1PCTOf74/PjLaIxZvS0jzaR
         YeuoPFgQl23k6dxPGcs1AxYfSVM59gJFdMTRM4kgbSh/R50qyvBdlNlGBXbUCbutZuxt
         /Htk8ec9ZB03cex8yz72PHa9ZeoFe/zlWaZyc29QOP2kZmZ4BzQyqFUPxeqrq2e318vy
         9o+GVwUs3vis55q/reNbwAHinSY1Cgv+kI9wm9dJ+37mozFP5TPpZQK+KpQkxPXHhGKY
         fBJg==
X-Forwarded-Encrypted: i=1; AJvYcCW2bihxZk2L8Qp/1fas89WrwgDRfHbPS2XA+wyRCoZII5KVd9RWjpEYSf240JdwLpRq5K0djqwlS1LPcMpv3LC6Vcp1
X-Gm-Message-State: AOJu0Yza/yuGsxawsE2mYidI4d5yIenaQV58nhLnByZTb0KR53oJaQS1
	TqZ2PlUm8Ps4ZCHrBwHTnI1/gWdmHspMdglz6zKfv1N0HyOV+ZCANVTMATn09YE=
X-Google-Smtp-Source: AGHT+IEgcXy3+rkFPoDkd2dXlLWKon0+QmAFexFYM6SBiDcP+Z+PJHXgIznf+cKpvly1xdBjKboa9w==
X-Received: by 2002:a2e:9601:0:b0:2df:a177:58e3 with SMTP id 38308e7fff4ca-2e51fe52bbemr45126321fa.13.1715509789596;
        Sun, 12 May 2024 03:29:49 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5097:b695:1c8:218d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41ff6fd7e73sm82555255e9.27.2024.05.12.03.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 May 2024 03:29:49 -0700 (PDT)
References: <87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com>
 <1jr0ee2ebk.fsf@starbuckisacylon.baylibre.com>
 <87pltxmakr.wl-kuninori.morimoto.gx@renesas.com>
 <87edaba5ze.wl-kuninori.morimoto.gx@renesas.com>
 <1j1q6b1gxs.fsf@starbuckisacylon.baylibre.com>
 <878r0ir1qw.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Amadeusz =?utf-8?B?U8WCYXdpxYRz?=
 =?utf-8?B?a2k=?=
 <amadeuszx.slawinski@linux.intel.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Brent
    Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Hans de Goede <hdegoede@redhat.com>, Jaroslav Kysela <perex@perex.cz>,
 Jiawei Wang <me@jwang.link>, Jonathan  Corbet <corbet@lwn.net>, Kai
   Vehmanen <kai.vehmanen@linux.intel.com>, Kevin Hilman
 <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Maso Huang <maso.huang@mediatek.com>, Matthias
   Brugger <matthias.bgg@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Vinod Koul
 <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/3] ASoC: grace time for DPCM cleanup
Date: Sun, 12 May 2024 11:33:29 +0200
In-reply-to: <878r0ir1qw.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1jwmnzz5k3.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


On Thu 09 May 2024 at 23:42, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Hi Jerome
>
> Thank you for your reply
>
>> >> If so, did you get below warning too ?
>> >> 	 "both playback/capture are available, but not using playback_only flag (%s)\n",
>> >>
>> 
>> I've checked. No such trace, no.
>
> OK, thanks
>
>> >> Card
>> >> 	dpcm_playback = (0 or 1)
>> >> 	dpcm_capture  = (0 or 1)
>> >> 	playback_only = (0 or 1)
>> >> 	capture_only  = (0 or 1)
>> >> BE.CPU
>> >> 	playback = (available, not available)
>> >> 	capture  = (available, not available)
>> >> BE.Codec
>> >> 	playback = (available, not available)
>> >> 	capture  = (available, not available)
>> >> Expect
>> >> 	playback = (available, not available)
>> >> 	capture  = (available, not available)
>> 
>> I'm not too sure I undestand this. I'll try to illustrate the case
>> raising the warning as precisely as possible bellow
>
> Thanks
>
> Because you got was
>
> (A)	axg-sound-card sound: CPU capture is available but Codec capture is
> 	not (be.dai-link-6) Please update Codec driver
>
> It is for BE. And validation check is for each rtd only, this means it checks
> BE only, relationship with other rtd is not related here.
>
>>     --------
>>     |CPU BE|  This is the TDM interface. Capable of both Playback and
>>     --------  Capture. Through routing it can be connected to Playback
>>       ^       and/or Capture FE CPUs.
>>       |
>>       V
>>     -------------
>>     |BE Codec(s)| Possibly N codecs, supporting both direction, or a
>>     ------------- Single one, or one direction each. In this particular case
>>       |           it is Playback only C2C.
>
> So, I think the warning happen here.
> The validation check is checking this BE only.
>
> As I mentioned above, you use this BE through playback only FE and/or C2C,
> but that relationship is not related to here.
>
> According to above explanation, this BE itself is available for both
> playback and capture. And you didn't get below warning, I guess this BE
> has both dpcm_playback/capture flag, and no xxx_only flag.
>
> 	 "both playback/capture are available, but not using playback_only
> 	  flag (%s)\n",
>

Apparently so, but it should not.

Before your patchset, axg-card.c (and gx-card.c) relied on
snd_soc_dai_link_set_capabilities() to init dpcm_playback/capture flags.

That was done following another semantic change on those flags:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/sound/soc/meson?h=v6.9-rc7&id=da3f23fde9d7b4a7e0ca9a9a096cec3104df1b82

 - 1st problem: I see that following your removal of
   snd_soc_dai_link_set_capabilities(), the dpcm_playback/capture flags
   are no longer properly initialised in the amlogic card drivers.
   That will need fixing.

Then, for TDM backends (like here), the tdm slots are checked and the
direction is disabled if it has no slots:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/meson/axg-card.c?h=v6.9-rc7#n171

In theory, dpcm_capture should be 0 for this link which has no Rx
slot:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi?h=v6.9-rc7#n218

... Sooo, that is 2nd problem

> Before my patch, the validation check is checks CPU-BE only, but it also
> checks BE-Codec after my patch, and you got the warning (A).

Yes I've got that. I was not expecting a failure on this case TBH.

I was more looking for the infamous 2 codecs case, each with a single
direction (which I did not check yet ...)

>
> So, I guess your BE-Codec simply missing capture channels_min settings.
> Please double check it, or please tell me which codec driver this BE is
> using.

Here the codec:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/meson/g12a-tohdmitx.c?h=v6.9-rc7

>
> 	static struct snd_soc_dai_driver xxx_dai = {
> 		...
> 		.playback = {
> 			...
> 			.channels_min	= x,
> 			...
> 		},
> 		.capture = {
> 			...
> =>			.channels_min	= x,
> 			...
> 		},

This codec is not meant to have capture channels.
I think DT description and the card driver settings (before the removal of
snd_soc_dai_link_set_capabilities()) are correct.

IMO, those check become too restrictive. We are adding a lot of code I'm
not sure I understand what we stand by going so far in the
consistency checks.

Initially those dpcm_playback/capture flag could be used to just
forcefully disable a link direction, regardless of the CPUs or codecs present
on the link. It was just another setting and it was not required to be consistent
with anything. It just declared whether the direction was allowed on the
link, or not.

It changed this commit, and the flags suddenly needed to be consistent
with whatever was on link:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/sound/soc?h=v6.9-rc7&id=b73287f0b074

I complained back then and I still don't think this change was good.

If the flags needs to consistent with what is on the link, and we have
the ability to check it, why let card drivers set it and then complain
about it in ASoC checks ? Why not deal with it in the framework directly ?

I think the simplest solution would to just go back to the initial
meaning of these flags which was just the card driver declaring the
direction allowed/disallowed on a link. Then ASoC can mix that
information with whatever it finds with DAI drivers and figure out what
is actually possible.

It would give a clear and separate semantic meaning to those flags
instead something redundant with the DAI driver info.

What we have currently is not straight forward to set and check.
It makes the code unnecessarily complicated and difficult to maintain. I
think the difficulties with this patchset are a good illustration of
that, unfortunately.

> 	},
>
>> But I noticed that we want to update below. I'm happy if it can solve your
>> issue.
>>
>> -	if (has_playback && !has_playback_both)
>> +	if (has_playback && !has_playback_both && !dai_link->capture_only)
>> 		dev_warn(rtd->card->dev, ...)
>>
>> -	if (has_capture && !has_capture_both)
>> +	if (has_capture && !has_capture_both && !dai_link->playback_only)
>> 		dev_warn(rtd->card->dev, ...)
>>
>> Honestly I'm a bit lost in all these flag :/
>
> Thanks, no problem, me too :9
>
> Unfortunately and confusingly, there are many combination exist around here.

My point exactly ;)

> But because of your feedback, I noticed one missing pattern. Thanks
>
>
> Thank you for your help !!

Thanks a lot for all those reworks !

>
> Best regards
> ---
> Renesas Electronics
> Ph.D. Kuninori Morimoto


-- 
Jerome
