Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2FF17B51E
	for <imx@lists.linux.dev>; Tue, 14 May 2024 14:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715697233; cv=none; b=IuVD0jxvmS97tkoWKCEupIm13Kq1/EhE4H5qp5vFdd4zjMEikUiUBOaP7r5319FLF5UCzTeYw1iP6Vbzk1CpAk+teScPCKCiQakuS5vJ9hmMh1QoE4awyD0bqfBffcE1TDDSSBXR523OjK0BPENbmICKuoLQMjY9x5Z6MhMxQgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715697233; c=relaxed/simple;
	bh=+IxW0MEtemQ59ohxen6OsJDtFiyIBSyf4pXlzCYNPeg=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=TiFteT8Ao3hQP1ZpGftgtkG8rUifhZb417UsvKIRVpcHPTdig9nYHNMK49sQ7ueEBzul+DlSdnHF8JgpmX9UTfJxC6nd3lCoU0e8WKTqIUbfXpQ20zq9IqcIrQOX7e4Y0VjEflAAkSrlaiA4pk3NBcIxMogFF4xEpVgEgPyfOho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nUyXgREj; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nUyXgREj"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e45c0a8360so59268121fa.3
        for <imx@lists.linux.dev>; Tue, 14 May 2024 07:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715697230; x=1716302030; darn=lists.linux.dev;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=2HpNVPq3YKqLVtMUiQ9jyLRuvtM9nOeWOTnThXBUYyw=;
        b=nUyXgREjGnctWt7XMmuqEHciEdTutOupoukXad9RdQFpm1THPSTptoQybMOix7CEbk
         SXS57VZDkP+L5ZXuk9T2eaH6l7lJ9uMYas4xPHCqYPnQ+RdH1jWJLKZzn64OgwbUDsCm
         bQQat3TZ++ode0mm+pNjmLTvuQQFEHXx+D2W1PLcLKIOZmj6rM09wIImKeAimePIce4j
         ijX3/CSPQM9yjaCuTvDJBnODQ0NfzPoucbRd9tB0atmWs/uloZsGCdEgdNdvvwth8VX2
         G/IuwIzZLwfcg9hhnGxvKRVSy7RTsYHV2njoCoy76A8QnsXhU+vh4qkYRQZEX/CeeiIH
         A6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715697230; x=1716302030;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HpNVPq3YKqLVtMUiQ9jyLRuvtM9nOeWOTnThXBUYyw=;
        b=WD28F5WS5OLYWEx1V/RVhVV9pinbLUqsqfCrSdv6c/I8kUsUruofqHbNq6Sj2snSdw
         MPHTIgBDsP3UdXsXWU0oRtboKsA7vEnpuD/BmCTfuLDDVoj0uP+8hZA3R+Gi9OWcOVco
         8xqTdmt/wdCLkWPFSDlv8s0gPYtDo7wIn3YpLPgE5EqUFC9hoLCKwUCiMoe3AHCqK0/I
         63sGYrYuN2joboDmT/WFEEGpZWXiGoWws+Ey3kcvVBPgSKllMQIV6aFKrkseuYKoBlMq
         /4b27xVuZUeWaln71ZrIU/uGEvp8AMu9nGHCrP/I7/4BlN7e/5vOY3ilsASZMspdVr85
         NljA==
X-Forwarded-Encrypted: i=1; AJvYcCWsq/FAH1Jqopck2XkIPgFUe/MplxSZX8n8fTuOotV19XKFs4vf0y8Np3Nmy2IJM49vA7jnA97aT7xt30fbhkQcVF6F
X-Gm-Message-State: AOJu0YzcpsfCKdfVAT2rAVdtgCAzuPj/Pt9PumjeHRA80C9h9mu/sPF5
	2nMHQT6keBLk1x8ObkCA+iXzW/ZiMr+a5icwJ8xDBQGFpmzeCee3QZOi4RYISOU=
X-Google-Smtp-Source: AGHT+IFD4/QQf7DSCFn7BpKaHqZVvWjrhBM0s1pr0jlg9Ch9ima5C7dw+J80WKNKg5qjzUacSgKW4Q==
X-Received: by 2002:a2e:a175:0:b0:2e3:3b4e:43e4 with SMTP id 38308e7fff4ca-2e5204b2ed4mr86104081fa.32.1715697229984;
        Tue, 14 May 2024 07:33:49 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3f47:f219:de13:38a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b8a76e6sm13856362f8f.62.2024.05.14.07.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 07:33:49 -0700 (PDT)
References: <87o79azh65.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?utf-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Brent
  Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Hans de Goede <hdegoede@redhat.com>, Jaroslav Kysela <perex@perex.cz>,
 Jerome Brunet <jbrunet@baylibre.com>, Jiawei Wang <me@jwang.link>,
 Jonathan  Corbet <corbet@lwn.net>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Kevin Hilman <khilman@baylibre.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Maso
 Huang <maso.huang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Vinod Koul
 <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/3] ASoC: grace time for DPCM cleanup
Date: Tue, 14 May 2024 16:31:55 +0200
In-reply-to: <87o79azh65.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1jttj0xy2b.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


On Mon 13 May 2024 at 00:31, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Hi Mark, Pierre-Louis, Jerome
> Cc each ASoC driver maintainer
>
> As we discussed in [1], we don't need to use dpcm_playback/capture flag,
> so we remove it. But we have been using it for 10 years, some driver might
> get damage. The most likely case is that the device/driver can use both
> playback/capture, but have only one flag, and not using xxx_only flag.
> [1/3] patch indicates warning in such case.
>
> And because of its history, DPCM has been checking CPU side only. But it should
> check Codec side too same as non-DPCM. Some device/driver has been bypassed
> this check. It should be error. [2/3] patch indicates warning in such case.
>
> Because dpcm_xxx flag is no longer used by [1/3] patch, 
> snd_soc_dai_link_set_capabilities() is no longer needed. [3/3] patch remove it.
>
> These adds grace time for DPCM cleanup.
> I'm not sure when dpcm_xxx will be removed, and Codec check bypass will be error,
> but maybe v6.11 or v6.12 ?
> Please check each driver by that time.
>
> [1] https://lore.kernel.org/r/87edaym2cg.wl-kuninori.morimoto.gx@renesas.com
>
> Link: https://lore.kernel.org/r/87edaym2cg.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com
>
> v1 -> v2
> 	- tidyup Codec check warning output condition
>
> Kuninori Morimoto (3):
>   ASoC: soc-pcm: Indicate warning if dpcm_playback/capture were used for availability limition
>   ASoC: soc-pcm: Indicate warning if CPU / Codec availability mismatch
>   ASoC: remove snd_soc_dai_link_set_capabilities()

For Amlogic, with the change sent as RFC on this series.

Tested-by: Jerome Brunet <jbrunet@baylibre.com>

>
>  include/sound/soc-dai.h               |   1 -
>  include/sound/soc.h                   |   1 +
>  sound/soc/fsl/imx-card.c              |   3 -
>  sound/soc/generic/audio-graph-card.c  |   2 -
>  sound/soc/generic/audio-graph-card2.c |   2 -
>  sound/soc/generic/simple-card.c       |   2 -
>  sound/soc/meson/axg-card.c            |   1 -
>  sound/soc/meson/gx-card.c             |   1 -
>  sound/soc/qcom/common.c               |   1 -
>  sound/soc/soc-dai.c                   |  38 ---------
>  sound/soc/soc-pcm.c                   | 110 +++++++++++++++++++-------
>  11 files changed, 81 insertions(+), 81 deletions(-)


-- 
Jerome
