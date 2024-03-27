Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE1E137C32
	for <imx@lists.linux.dev>; Wed, 27 Mar 2024 12:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711544141; cv=none; b=iRfBq6LwIFC3OESwfnLmKE8KX3vyVtgM0n+DXLrFipfjBebqqQV+X5AbnrFPqJ2xMMkZp9nhwZ8CiSGRrYF5a+kiWYiUDAYlraiEpqHg2mWNhbLw62uC83YHSlQLRxXgIS9pE5zi/almR0HYaa2kOKs2sz148RYIj2vceg8m1fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711544141; c=relaxed/simple;
	bh=7tvzWOMU15U3qLtaG45FvaCp1yBq+rNh+P9CuovlHu4=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=sX6BZPbj0nv1FwI1/ODOymBwnLAOu4ycFWXyX1hiEH5PV24ez0QvjsMNiGFDfidaeAXcf9/ktKP4o8bsiVzsy5PH83nGoc04ToNCkGZZp4AoQWsy686irTIlEk/dEoGFbrgJQ8xdouCKa2Quu5JSoRw+j3qyPXn207HsrOYeefM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CplHEpRN; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CplHEpRN"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33ed4d8e9edso4919097f8f.2
        for <imx@lists.linux.dev>; Wed, 27 Mar 2024 05:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711544137; x=1712148937; darn=lists.linux.dev;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=Vp48KocudoiGALvWKkmTWkUXKZEVfSQEtoMbBwrHz/0=;
        b=CplHEpRN5ioaPX1Fib68zbuhfcdQhhASvszNJeLxwqZ0kcPAC4XFN9QVrruHDNjhwL
         xsGxKBEO4ag4EnblxQ+GFS1vkHWLtOp0KCbq+qRqJnoKVQi8gVh2URJ6Y3wsj2Y06AmX
         crhdamsHRfjFMfL3Im73ipxwwWhJs0B7PvsdYO8L3l5GWN/qujIa0TOMvYPlUh0xKyl3
         muHRLH6n84WUR7IwxpeEkNjRJ/GqkNGvrZu5ax6mBmdl3Aex8lTRMMzqfj+P1N7tm04c
         GNzqjJ7f7LeDq6zz7RkHAnrlB5k99HM6Jj/qH39DWROmqpcqtUVfbxj5zt9bEgRBXTg+
         5a/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711544137; x=1712148937;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vp48KocudoiGALvWKkmTWkUXKZEVfSQEtoMbBwrHz/0=;
        b=qJzk9pjjfw5fLH9dfkjwVN8co4e0DB+WerQOcCHKYw3opxmAt6wyWUmATNhCrC7B+L
         rkYb0jPOKgd7DltMtPRgFBMb/Jo9H4GgJcYqga5pDKygKeuA4Do0dzCNCa0PPBValiNv
         QTuJ9k8YAN/QIznjrMKo+sT08pcOtQmtRZQ/5GaUD+68bohkc16jeWpahCRQPK7on0UI
         6Ee8jQJNUi/dVEBsIrO8zOoNjkjYGXfGIhNDWIL2u9yWCz6aWiFBtCGRdzMe9pOAfL6g
         iKtrVm1yk5KJ53ZHgKXtCYtfcDNDIZJYTTIDITYs9NdtDCLhhICwObI3Snas6rDbKUZc
         SaMw==
X-Forwarded-Encrypted: i=1; AJvYcCXy5qz3mpfOw6b3Zt7bBvY6/7W8EcyoYLTezWuZbWWCMIlqlUagglrdvLyVS6KSUvZ7hOnVA9OIJjTYwEAwazA9sFbX
X-Gm-Message-State: AOJu0YxjbovD+sLs/0+8UYW3hrorQiqoh3FyonQtCk4BUP+DYs2v2Mfd
	BRONXoWQ7Xd5PzUSDwtaePHMxPKlOCBfaqYGoa03Xy6S1aG//V+TZuK0/GOOFX0=
X-Google-Smtp-Source: AGHT+IFNNxBDz2Tx/jpDPmwWEphhbXKgsW+qHx/Yz0edPYKGGY5dsGFKtIqCm7B13uhNEaK0FJ6NZA==
X-Received: by 2002:adf:a3d0:0:b0:33e:1ee0:6292 with SMTP id m16-20020adfa3d0000000b0033e1ee06292mr4235689wrb.58.1711544137249;
        Wed, 27 Mar 2024 05:55:37 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e2f0:34bb:2ffe:1a3b])
        by smtp.gmail.com with ESMTPSA id h2-20020a5d5042000000b00341c162a6d4sm11641186wrt.107.2024.03.27.05.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 05:55:36 -0700 (PDT)
References: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
 <8734sf53kv.wl-kuninori.morimoto.gx@renesas.com>
 <1j7chp9gbb.fsf@starbuckisacylon.baylibre.com>
 <87v858cwki.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Amadeusz =?utf-8?B?U8WCYXdpxYRz?=
 =?utf-8?B?a2k=?=
 <amadeuszx.slawinski@linux.intel.com>, Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Brent
   Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>, Jaroslav
   Kysela <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin  Hilman <khilman@baylibre.com>, Liam  Girdwood
 <lgirdwood@gmail.com>, Linus  Walleij <linus.walleij@linaro.org>, Mark
 Brown <broonie@kernel.org>, Maso  Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Trevor Wu
 <trevor.wu@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Xiubo Li
 <Xiubo.Lee@gmail.com>, alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 15/15] ASoC: soc-pcm: indicate warning if DPCM BE Codec
 has no settings
Date: Wed, 27 Mar 2024 13:30:32 +0100
In-reply-to: <87v858cwki.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1jcyrfal6f.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


On Wed 27 Mar 2024 at 01:06, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Hi Jerome
>
> Thank you for your feedback
>
>> I'm not quite sure what you mean by "should have validation" and what
>> setting exactly we should validate ?
>> 
>> I know I should be able to able to understand that
>> from the code below but, somehow I have trouble deciphering it.
>
> Current ASoC have validation for ^^^ part
>
> 	DPCM
> 		[CPU/xxxx]-[xxxx/Codec]
> 		^^^^                   (A)
> 	Normal
> 		[CPU/Codec]
> 		^^^^^^^^^^^
>
> (In many case, this "xxxx" is "dummy")

Yes for many DPCM user, you have:

       DPCM
               [CPU/dummy]-[dummy/Codec]

FYI: on Amlogic it is mostly the following
(only considering DCPM, omitting C2C ...)

       DPCM
               [CPU-FE/dummy]-[CPU-BE/Codec]

With possibly several BE instances per FE, and several codecs per BE.

And there is even this for loopbacks:

       DPCM
               [CPU-FE/dummy]-[CPU-BE/dummy]


> By this patch-set, It will check all cases
>
> 	DPCM
> 		[CPU/xxxx]-[xxxx/Codec]
> 		^^^^^^^^^   ^^^^^^^^^^ (B)
> 	Normal
> 		[CPU/Codec]
> 		^^^^^^^^^^^
>
> At first, in [CPU/xxxx] case, "xxxx" part should be also checked
> (in many case, this "xxxx" is "dummy").
>
> And, because it didn't check (A) part before,
> (B) part might be error on some board (at least Intel board).
> To avoid such case, temporally it uses "dummy" instead of "Codec"
> before [15/15]. This means (B) part checked as like below.
>
> 	[xxxx/Codec] -> [xxxx/dummy]
>
> Because "dummy" will pass all cases, (B) part is almost same as no check.
> Yes, it is no meaning, but the code will be simple.
>
>> Where you have a CPU supporting both direction and 2 codecs, each
>> supporting 1 stream direction ? This is a valid i2s configuration.
> (snip)
>> >  		/*
>> > -		 * FIXME
>> > +		 * FIXME / CLEAN-UP-ME
>> >  		 *
>> >  		 * DPCM BE Codec has been no checked before.
>> >  		 * It should be checked, but it breaks compatibility.
>> >  		 * It ignores BE Codec here, so far.
>> >  		 */
>> > -		if (dai_link->no_pcm)
>> > -			codec_dai = dummy_dai;
>> > +		if ((dai_link->no_pcm) &&
>> > +		    ((cpu_play_t	&& !codec_play_t) ||
>> > +		     (cpu_capture_t	&& !codec_capture_t))) {
>> > +			dev_warn_once(rtd->dev, "DCPM BE Codec has no stream settings (%s)\n",
>> > +				      codec_dai->name);
>> 
>> Taking one codec at a time, would you trigger a warning for the use case I
>> described above ?
>
> Oops, indeed it will indicate warning in your case.
> How about this ?
>
> 	if ((dai_link->no_pcm) &&
                         ^ Actually my comment applies to all links, DPCM backend or not

> 	    (!codec_play_t && !codec_capture_t)) {

A codec that does not support playback and does not support capture does
not support much, does it ? ;)

I suppose you meant something like:

>           (!cpu_play_t && !codec_capture_t)) { 

Then at first glance, maybe ... CPU and codec seem to exclude each other but
that will only work as long as DCPM is limited to a single CPU per link.

> 		dev_warn_once(...)
> 		...
> 	}
>
> Thank you for your help !!
>
> Best regards
> ---
> Renesas Electronics
> Ph.D. Kuninori Morimoto


-- 
Jerome
