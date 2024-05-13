Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8D152F9B
	for <imx@lists.linux.dev>; Mon, 13 May 2024 07:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715586054; cv=none; b=GOrowfutnk8gUNnaA3dfvByth+vltJGRHeP1JbIeR71aRhLaW+KOKBXHMxMPyIjDZGISaUnAx4Fukipghj1iODfFKDD8er+lnTbVkhYlpqySnKXYEi03NA+MM0KBlor7PLjiNLPqvAqOXN6tBjqTVo3ozBW1j5Ke24/EczxkQ9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715586054; c=relaxed/simple;
	bh=bqeLw0EURFczvr0ROK0JvPzdR2l1fwgPdWTPSS0ztK0=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=tvTucu/EuQSVgXd2eRUbXlodwR+6NzIh25kPFX6UFlNp+jmB3BesLfWxIb7kVw6thDD23JB00rRmJiGaBCBg4nwtumIcJgWSPlifFBJJfmImqHqMnyP0Cgf0Y8aOChumWuqUHYxuYdfQvnPxCZnmh3yQaL5sXTX41kWmDiqVizM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SA2mrs3n; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SA2mrs3n"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-420104e5336so8052845e9.1
        for <imx@lists.linux.dev>; Mon, 13 May 2024 00:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715586050; x=1716190850; darn=lists.linux.dev;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=jxDvLqtM5HD3XxV36Sf1rEr7tbwcAskZhewDbNVJWu8=;
        b=SA2mrs3ncz1i5pT0O/VLar8SBX90KNfPtD12RRM4mW8DWIXLz1PfWSxs8wCQBLVxsS
         H8IFLEyGCL9AnSYYgo7ZE/rNJCcGMq6ay3DJhGNfz5SF6pfeZw9QSFMQH9BZmwECBC3y
         xeFkWNTsnYPG5LYSIjm72/juKfTZrSWVP6u8dZVaM+znXNo9JzRgMh0mYyomG6r1g45E
         zrUeICEKPfpujkHWepZtt6+iARI/NlwdeJI9uDjKqOupx72fcNT6D52rvFTb98I8H1kK
         cAdIX0zKR2757MG/um4rbcEUfbYCudn6CObO9TpbjlNpQEI1t8L3QnXSYGprsL/CgOUd
         3GgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715586050; x=1716190850;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxDvLqtM5HD3XxV36Sf1rEr7tbwcAskZhewDbNVJWu8=;
        b=V6IZeGWme3Mxsgb2t2q3eO/EALEhOY9DrCsIghlTw2WJwPsw77bHqS9kRHYODoBNLq
         wDnzNivCwCuiwY/VjQ5K18l6u58NNBokdzs6e07LVcumu9DMRZGz+1UjmHQmZb71Tv3N
         w4agAVr/Jzp4jIeeCNU0zmTwkq6X5IJ1O3GUHcjJZpGCrh6AsbfiEmaUOHGlNnLqm2xX
         bgfzObyRaR7v1wXfNCz21E+QolwV4vCr2gR/E42M3t2CP9EjeJaX/DWSTSARB2S4hlJ9
         ADSYLISr8FVym9WZNv+mLiC7Y99HVuOuRYNAz4Oa+mscZv9KW6yg//TvX+GZ0tNHAqbY
         2osg==
X-Forwarded-Encrypted: i=1; AJvYcCWDoFoMKVkx55anv5x9W/ib1kw77Pkqaxz3yiFaL5hHVB5Q6zUAs2imeYU/jeaZ4ctTxRtFgvwMI3wzhhrKRHmKJhy1
X-Gm-Message-State: AOJu0YzYJiexcnMbiUJGGbr2tm3dYcRMok62vAgNVfZ/+ThNlv5t9a6M
	0i8YCElOqxXhvp27DO58k5OX6hYUFOUfx3/EIC358JJ4EofhvSVTi2yG4aD46po=
X-Google-Smtp-Source: AGHT+IGyShzaHstWPtHJJ6LRI/e/nWyJHEwUq6cM85MqUwzsSvsHegJxxu5ykS/QCDfvcEJlaBd6rQ==
X-Received: by 2002:a05:600c:3112:b0:41b:e55c:8dc1 with SMTP id 5b1f17b1804b1-41fbd1b2e40mr93356095e9.20.1715586050311;
        Mon, 13 May 2024 00:40:50 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5b77:3e5a:a808:339a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b896a1dsm10367679f8f.32.2024.05.13.00.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 00:40:49 -0700 (PDT)
References: <87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com>
 <1jr0ee2ebk.fsf@starbuckisacylon.baylibre.com>
 <87pltxmakr.wl-kuninori.morimoto.gx@renesas.com>
 <87edaba5ze.wl-kuninori.morimoto.gx@renesas.com>
 <1j1q6b1gxs.fsf@starbuckisacylon.baylibre.com>
 <878r0ir1qw.wl-kuninori.morimoto.gx@renesas.com>
 <1jwmnzz5k3.fsf@starbuckisacylon.baylibre.com>
 <87pltqzi3n.wl-kuninori.morimoto.gx@renesas.com>
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
Date: Mon, 13 May 2024 09:36:03 +0200
In-reply-to: <87pltqzi3n.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1jseymyxa6.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


On Mon 13 May 2024 at 00:11, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Hi Jerome
>
> Thank you for your feedback and analysis !
>
>>  - 1st problem: I see that following your removal of
>>    snd_soc_dai_link_set_capabilities(), the dpcm_playback/capture flags
>>    are no longer properly initialised in the amlogic card drivers.
>>    That will need fixing.
> (snip)
>> This codec is not meant to have capture channels.
>> I think DT description and the card driver settings (before the removal of
>> snd_soc_dai_link_set_capabilities()) are correct.
>
> OK, I see. Thank you for your analysis.
>
> The problem was my patch checks CPU direction vs Codec direction only,
> thus, it will indicates unexpected warnings, like this case.
>
> Thank you for finding it, I hope v2 patch should be OK for you.
>

I'll check

>> IMO, those check become too restrictive. We are adding a lot of code I'm
>> not sure I understand what we stand by going so far in the
>> consistency checks.
>> 
>> Initially those dpcm_playback/capture flag could be used to just
>> forcefully disable a link direction, regardless of the CPUs or codecs present
>> on the link. It was just another setting and it was not required to be consistent
>> with anything. It just declared whether the direction was allowed on the
>> link, or not.
>> 
>> It changed this commit, and the flags suddenly needed to be consistent
>> with whatever was on link:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/sound/soc?h=v6.9-rc7&id=b73287f0b074
>> 
>> I complained back then and I still don't think this change was good.
>> 
>> If the flags needs to consistent with what is on the link, and we have
>> the ability to check it, why let card drivers set it and then complain
>> about it in ASoC checks ? Why not deal with it in the framework directly ?
>> 
>> I think the simplest solution would to just go back to the initial
>> meaning of these flags which was just the card driver declaring the
>> direction allowed/disallowed on a link. Then ASoC can mix that
>> information with whatever it finds with DAI drivers and figure out what
>> is actually possible.
>> 
>> It would give a clear and separate semantic meaning to those flags
>> instead something redundant with the DAI driver info.
>> 
>> What we have currently is not straight forward to set and check.
>> It makes the code unnecessarily complicated and difficult to maintain. I
>> think the difficulties with this patchset are a good illustration of
>> that, unfortunately.
>
> By this patch-set, it will be handled automatically via CPU and Codec
> driver settings, Card driver will no longer need to consider about
> direction (like non-DPCM), and I hope people (including you) will be
> happy about that.
>

If it makes things simpler, I am happy for sure :)

However, I'm a bit confused. If it is handled automatically by the CPUs
and Codecs settings, does it mean dpcm_playback/capture flags are
no-ops from now on ?

Should I update my card drivers to ditch those flags completely ?

May I still disable a direction on a link from the card driver, like in
the case I described above, when a TDM link has no slots for a direction ?

> Thank you for your help !!
>
> Best regards
> ---
> Renesas Electronics
> Ph.D. Kuninori Morimoto


-- 
Jerome
