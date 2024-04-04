Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7009A71B20
	for <imx@lists.linux.dev>; Thu,  4 Apr 2024 08:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712220417; cv=none; b=ssi9oIpijMy5mWETTQsLAyhid3wXBFkTkMqZ61uAlgUVGmOUYcF1gFqcPhvpQA90yF66VmtvqXvwg+4vlo7uWS+xqq7+Fu2gKTs5QbX6DvUiTr2Ctq1ZxEGfxbPSh4K5X19dFpn+XTeLj3m7wnigvIYoFZSq73zxNfJWHcP/sTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712220417; c=relaxed/simple;
	bh=Q9rxavh+3jGPYQmhPcwtJShwvPawHe7CzUPk3kXsc38=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=fEi3ZU2hzqC3fy/gLhdKjlda44Wevfs0BDnkgz35d7Of4Zuw8x1cFxqO3I2O7Y9aUTzZCypVBiwXD8YX/DNZ9HpMUupHZ8VUx74OSUXmwW6nsAmKoSCzB1oYW4f4zGeBtIPIfRsjXIzb1W3n9RNun7s0VQZrMpU8TuJ7fm1RNGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SVg+Zpnc; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SVg+Zpnc"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-513d3746950so844874e87.1
        for <imx@lists.linux.dev>; Thu, 04 Apr 2024 01:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712220413; x=1712825213; darn=lists.linux.dev;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=vssJvDsEm5h5nxOLNKKmfZj8jedONQ1OyiP3MNwrwU4=;
        b=SVg+ZpncMnyXpjAHzVUIkqgGVwQJ0+DJ6G2aG1DeIy2C7usaNvkFyxQzpGXJfklP0C
         0Isx97yIXpbqpRbfCDc6dhcN7/gHa02P+msJXS52Ds74QCGyKiWJGLlChqr5tW8JJEHY
         Yk1g7/yp0hEGqMfZL4ryfXxyf7PnxS3X0hkQ8ts9qSrTG+AXYVn6wQWypuDx07HLRFbK
         6zAS81vmuhGlKhbqcRhs2DrE0qyppijeDIZtAJDKxp95B2iRlz5NSGE7vqHE1VTaIUyv
         k4yte+zPhSL7y+/qHV+Ry/Q1yhRsQGMPYcZO8tmiGATWEHWULyHJY0mf8GGe6jnKEQUp
         Nhsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712220413; x=1712825213;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vssJvDsEm5h5nxOLNKKmfZj8jedONQ1OyiP3MNwrwU4=;
        b=ZjfVrccH8OmkCU1mmPe1Tk8xHTX9U40AuUl2VgxbMl3KN8FUgwKgsyMlGFE6eVUmbX
         GPlf0NnMMwys3zHx71ZG3vwPg/lPApkfUV1LDoEeq2JAW2ZmSjLqAhe11BjEQDBTJMTA
         PesFlBGDnt8ZSxkkXwplqDZjHXiCtB1r3XDJN9SXbokdJmOFttHiPxhE6C4TYMIzHfA1
         BnB6DMYW4xzqiCN7nTAtj9H4KYc2mUKXowKfezNDjOELTc6j2w9bIjc9RTchmr3aNEOn
         GENEz0l1CqQ116eSx6hi73mCLZyHBAILQfR+utbAoZqI2dv7gD9psJLHemRkH8BicoPe
         Yrvg==
X-Forwarded-Encrypted: i=1; AJvYcCUOiWK7zSJ/pxk+8J7mdEuFSsDKaBRk0mwnrglueArO5923TBC4GD4WN5n6sfj/UEaJKsD9+e1rU5astGfAOVgnB3Aq
X-Gm-Message-State: AOJu0YwxwZYvKUv78fuI7PIb0ZTSZV8NsPBkaAttwN+ODrjmk/NEaliB
	2tylr7HqzbLx3ktqoxbHq6UZ7ko1UOyCj3fYzcQbccJmlP9EFvEWA/eZaFD7g6M=
X-Google-Smtp-Source: AGHT+IGfmakMeTh3jAGVQJKJ+VTm2R438vkeBhF7L+wEWqOROEyvzepKwPfwlLVcE3mN6ey9Em+MkA==
X-Received: by 2002:ac2:4c8f:0:b0:513:d01e:b68 with SMTP id d15-20020ac24c8f000000b00513d01e0b68mr1237043lfl.3.1712220413384;
        Thu, 04 Apr 2024 01:46:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b7ad:8118:73f1:92e5])
        by smtp.gmail.com with ESMTPSA id p15-20020a05600c468f00b0041550e03bc6sm1869265wmo.44.2024.04.04.01.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 01:46:53 -0700 (PDT)
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
 <87sf05udnx.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?utf-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Alper Nebi
 Yasak <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Brent
  Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>, Jaroslav
  Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>, Kai
 Vehmanen <kai.vehmanen@linux.intel.com>, Kevin Hilman
 <khilman@baylibre.com>, Liam  Girdwood <lgirdwood@gmail.com>, Linus
 Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Maso
 Huang <maso.huang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Trevor Wu
 <trevor.wu@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Xiubo Li
 <Xiubo.Lee@gmail.com>, alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 05/16] ASoC: meson: Replace dpcm_playback/capture to
 playback/capture_only
Date: Thu, 04 Apr 2024 10:46:13 +0200
In-reply-to: <87sf05udnx.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1jedblplab.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


On Mon 01 Apr 2024 at 00:31, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> soc_get_playback_capture() is now handling DPCM and normal comprehensively
> for playback/capture stream. We can use playback/capture_only flag
> instead of using dpcm_playback/capture. This patch replace these.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Looks OK

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  sound/soc/meson/axg-card.c         | 8 ++++----
>  sound/soc/meson/meson-card-utils.c | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
> index 3180aa4d3a15..21bf1453af43 100644
> --- a/sound/soc/meson/axg-card.c
> +++ b/sound/soc/meson/axg-card.c
> @@ -132,7 +132,7 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
>  	lb->stream_name = lb->name;
>  	lb->cpus->of_node = pad->cpus->of_node;
>  	lb->cpus->dai_name = "TDM Loopback";
> -	lb->dpcm_capture = 1;
> +	lb->capture_only = 1;
>  	lb->no_pcm = 1;
>  	lb->ops = &axg_card_tdm_be_ops;
>  	lb->init = axg_card_tdm_dai_lb_init;
> @@ -176,7 +176,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
>  
>  	/* Disable playback is the interface has no tx slots */
>  	if (!tx)
> -		link->dpcm_playback = 0;
> +		link->capture_only = 1;
>  
>  	for (i = 0, rx = 0; i < AXG_TDM_NUM_LANES; i++) {
>  		snprintf(propname, 32, "dai-tdm-slot-rx-mask-%d", i);
> @@ -186,7 +186,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
>  
>  	/* Disable capture is the interface has no rx slots */
>  	if (!rx)
> -		link->dpcm_capture = 0;
> +		link->playback_only = 1;
>  
>  	/* ... but the interface should at least have one of them */
>  	if (!tx && !rx) {
> @@ -275,7 +275,7 @@ static int axg_card_parse_tdm(struct snd_soc_card *card,
>  		return ret;
>  
>  	/* Add loopback if the pad dai has playback */
> -	if (link->dpcm_playback) {
> +	if (!link->capture_only) {
>  		ret = axg_card_add_tdm_loopback(card, index);
>  		if (ret)
>  			return ret;
> diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
> index ed6c7e2f609c..1a4ef124e4e2 100644
> --- a/sound/soc/meson/meson-card-utils.c
> +++ b/sound/soc/meson/meson-card-utils.c
> @@ -186,9 +186,9 @@ int meson_card_set_fe_link(struct snd_soc_card *card,
>  	link->dpcm_merged_rate = 1;
>  
>  	if (is_playback)
> -		link->dpcm_playback = 1;
> +		link->playback_only = 1;
>  	else
> -		link->dpcm_capture = 1;
> +		link->capture_only = 1;
>  
>  	return meson_card_set_link_name(card, link, node, "fe");
>  }


-- 
Jerome
