Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA50149C7C
	for <imx@lists.linux.dev>; Thu,  9 May 2024 09:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715246343; cv=none; b=XnFLB6E+a23b6rl61xiN3G8EFntWwSAMpS8Kwq3Lo6L9lTsGMT8g0FTsLa2sX+wgdbw5WUn1cAEpG9l/EjpXng1n/GQALvy9qPn2Mb4RSD+hOY5dMtUkwisO2f/bQLBkFZiZZwSy4UwlM6jsnn7yHMpWPIFWn6HKruW5FJbKebw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715246343; c=relaxed/simple;
	bh=lcCQnxRMRJTW7GYII3BN87nmQecfBijYHLC7JbXBtcU=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=L7Ftm3MNDN9HoY48uZYUlXeIOfK0Jl3+wHofDbZ4mMlAGZJLWYKatHbhbBT4wGUUgqGl2711AlMBbejFJo5CkA8KRzv6vvfJyFlk4NM4uBj1Zb5+pgC17vw8Tc73RSEWFak30qdpjPn1K0DVQoWvR0pqYZG+pFyMfi/hAaOOjqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PbgVk9Sh; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PbgVk9Sh"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-34d99ec52e1so504175f8f.3
        for <imx@lists.linux.dev>; Thu, 09 May 2024 02:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715246339; x=1715851139; darn=lists.linux.dev;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=bLpM7TJDjRcXRO0i4lYjo6OZAM3sE3CuEsmwQ0zb4mw=;
        b=PbgVk9SheAF7uKM4PGSJadOnbRiC0SMlb9Ax18t+oXhlTl2qgDVEDTv/eOKweDSK6Q
         l/JIEe2/v60nm9//sncJ+v+HB+Nq9PiBqhk5uqaFDSW7HDA0cox+xscDQtWpjWbq7iZo
         U0CWssxAFZEXe7xFbnNdQdrITcmPnZ6KZiWffywf/I/KWG+F0+C/JSKWY9a1wBh5lgkP
         sEPUmOYIbgvF2ERFrvkvf5TsewMcD+0hGlYIuJU/uAb7dGXUpxfzRWQe1PqiX0YPFZS/
         OCaahub+qbAuSBoAVkTliV8RkoOpQFTVpT0Sargzd4nK26tFC0AH5Go7N+cJhdXkQnJ9
         OIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715246339; x=1715851139;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLpM7TJDjRcXRO0i4lYjo6OZAM3sE3CuEsmwQ0zb4mw=;
        b=No55l92+Kfmp2EdGRw1vA4FmKmVRZXxUdOmC2lDyHO/KBQt6rzlVs1N2ohve+07npM
         cxf0JNhZLryOPtsbkgEqunnD2oiBdq+LjoI1oqMP+3ks8+Xc72cExpm4KzJMsE9v2hvX
         YAoWQtJ/sfg3Oi26x1ko9fU52JD93XJFGYCWVc2wOwuis+kLot3miX+yPxxSm80/BvJC
         TePlsPvqNqXW+Ixf3ZTMYVQuh7sGVX8Po5qhDiLanjaYk6HY7XM63WcNhNZjEMnKZgEd
         wXOPhQ1EFwYi78abJIA8zU3XLlRZnNJenASrootKwIivOc6wfE0uuGOJvdIPgIc/xlSX
         8qLw==
X-Forwarded-Encrypted: i=1; AJvYcCVhBvfvEgOVOIxkEzFIxZFpo0seaopSM1e8+gjYDuDu7HynOFegvwkrqtUTskK+ZMW7yiMGR/qR8xVP9ZGhlEsBE/D7
X-Gm-Message-State: AOJu0YwkJApSsJPynUzQSEb3Cunonbo90arH05aoAr3A7Ne34ttWcGhV
	2680Xnix1kD+y8E4Svoso72uvPtpLBUjhfyQ3ITdSFZ3mzM0Om7NrPum0A2cIQM=
X-Google-Smtp-Source: AGHT+IFsB5wyyg9+udb49eD6La4FDSf5anjooXUEPEJOhb5hbaV1MWw6t5Anw3NkxndfSAwplOMP8A==
X-Received: by 2002:adf:ca90:0:b0:34d:ef22:70d9 with SMTP id ffacd0b85a97d-34fca23f9ecmr3576359f8f.15.1715246338692;
        Thu, 09 May 2024 02:18:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:87e6:73a1:526b:a411])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b79bd40sm1179386f8f.4.2024.05.09.02.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 02:18:58 -0700 (PDT)
References: <87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com>
 <1jr0ee2ebk.fsf@starbuckisacylon.baylibre.com>
 <87pltxmakr.wl-kuninori.morimoto.gx@renesas.com>
 <87edaba5ze.wl-kuninori.morimoto.gx@renesas.com>
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
Date: Thu, 09 May 2024 10:51:59 +0200
In-reply-to: <87edaba5ze.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1j1q6b1gxs.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


On Thu 09 May 2024 at 05:50, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Hi Jerome
>
> I need your help
>
>> > I have tested this series on an Amlogic device (vim3l)
>> > This brings warnings for cases which are perfectly fine.
>> > 
>> > For example, one of the DPCM backends is the TDM interface. This
>> > interface is capable of both playback and capture. It can be associated
>> > with any i2s/TDM codec.
>> > 
>> > The codec may do playback and capture too, but it
>> > may also do a single direction. Then usual example is the hdmi codec
>> > which does playback only.
>> > 
>> > In this case I get:
>> >  axg-sound-card sound: CPU capture is available but Codec capture is not (be.dai-link-6) Please update Codec driver
>> > 
>> > I don't think this is right.
>> 
>> Hmm..., I'm confusing
>> Does it mean you want to use "playback only" on it ?
>> If so, did you get below warning too ?
>> 	 "both playback/capture are available, but not using playback_only flag (%s)\n",
>>

I've checked. No such trace, no.

>> If not, can you please fill below ?
>> 
>> Card
>> 	dpcm_playback = (0 or 1)
>> 	dpcm_capture  = (0 or 1)
>> 	playback_only = (0 or 1)
>> 	capture_only  = (0 or 1)
>> BE.CPU
>> 	playback = (available, not available)
>> 	capture  = (available, not available)
>> BE.Codec
>> 	playback = (available, not available)
>> 	capture  = (available, not available)
>> Expect
>> 	playback = (available, not available)
>> 	capture  = (available, not available)

I'm not too sure I undestand this. I'll try to illustrate the case
raising the warning as precisely as possible bellow

>
> I need feedback from you, it is still not clear for me.

Sorry. There are some national holidays in France. I'm not spending much
time near the keyboard ATM

> But I noticed that we want to update below. I'm happy if it can solve your
> issue.
>
> -	if (has_playback && !has_playback_both)
> +	if (has_playback && !has_playback_both && !dai_link->capture_only)
> 		dev_warn(rtd->card->dev, ...)
>
> -	if (has_capture && !has_capture_both)
> +	if (has_capture && !has_capture_both && !dai_link->playback_only)
> 		dev_warn(rtd->card->dev, ...)
>

Honestly I'm a bit lost in all these flag :/

Some for BE error reported here is the full picture

     PCM
 =====|=====
      V
    --------
    |CPU FE| This CPU (FIFO) does Playback only. 
    --------
      |  Because of the CPU, link a playback only one
      V
    ----------
    |Codec FE| Using Dummy here
    ----------
      |
      V
    ~~~~~~~~~~
    |Routing |
    ~~~~~~~~~~
      ^
      |
      V
    --------
    |CPU BE|  This is the TDM interface. Capable of both Playback and
    --------  Capture. Through routing it can be connected to Playback
      ^       and/or Capture FE CPUs.
      |
      |
      V
    -------------
    |BE Codec(s)| Possibly N codecs, supporting both direction, or a
    ------------- Single one, or one direction each. In this particular case
      |           it is Playback only C2C.
      |
 ---- V ------------------ From Here, it is specific to HDMI -------------
    ~~~~~~~~~~~~~
    |C2C Routing| SoC has routing has mux between the different TDM
    ~~~~~~~~~~~~~ interfaces and the HDMI controller
      |
      |
      V
    ---------
    |C2C CPU|     This is a playback only CPU for HDMI
    ---------
      |
      V
    -----------
    |HDMI Codec|  The usual HDMI codec, playback only
    -----------

Better picture are available in the SoC doc.
There is publicly available datasheet here [1]

Audio paths are displayed in Section 9, page 807, Figure 9-1.
A TDM interface in this figure is combination of a TDMOUT and a TDMIN
(axg-tdm-formatter.c). The axg-tdm-interface.c joins them because they
use the same pads and clocks.

[1]: https://dl.khadas.com/products/vim3l/datasheet/s905d3_datasheet_0.2_wesion.pdf

>
>
> Thank you for your help !!
>
> Best regards
> ---
> Renesas Electronics
> Ph.D. Kuninori Morimoto


-- 
Jerome
