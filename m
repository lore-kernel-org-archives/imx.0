Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65FD1AF0A8
	for <imx@lists.linux.dev>; Thu, 24 Oct 2024 08:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729757182; cv=none; b=fvXZb1TlIvUp+YedfbqjCqvkuC4092upikwktzAak9i4tHwge5LKeyKdxkGKoH8mtx7WhsgGwJebr8etaNMjUk20+sckJuN60FLuybgvxnJnxLEeX2iOc552JL24hsT+KstUUFOKxrry0155JdI6dKjVxAxsmd1n22FOmBSkl1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729757182; c=relaxed/simple;
	bh=oPU8wiykirsXlfsK3FEHZM1SuFheE2lq9GeofLJroZY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=I+WUC1uLJOsHezahSyPGBMfbDAMVFq5FcuS4v701rdPHDR3Iz7m+QI7emZK5Hu/GQ+/i4QTioApeHlUH4lppKPA5Pjha4b2HTVwcLCAJlgsHbDaSQLcnf/poXMpUApMwKSNDut7plj7HEramYb6dkI2kierlw+sC4Q83AH0nvXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pLytsr+Z; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pLytsr+Z"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d5689eea8so432336f8f.1
        for <imx@lists.linux.dev>; Thu, 24 Oct 2024 01:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729757177; x=1730361977; darn=lists.linux.dev;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zMW6I0sTEYqubA9v2uS/l/YanQ/0kwQs3KpAh7vOnLI=;
        b=pLytsr+Z6crS0c3CRhYbZW9VjQ9RD6Mo2N6zIuwCWo/UuojpBFmAAYdrPYjC7LHTcj
         5xCbeVjuUfaXE5eUusegNTilu6buz5Ajgc6VKFgac5Zh9M77ShJsZch0M9Cb4+wvjiAk
         6y+TmXByaC9NBx5DY1JaeWAiiqgSuK24cXofmD28vtGp4+s8+dyEmd1U/acp2/wN+nff
         Py1GqOwqnU8QJMgHE3IJbgigTw1Xj5PE/p45nX2HyW9rvcPVryrpVOvyov6DpmpCOqhW
         pzRu2N/WP9GIfcvSAzQPfwvG1fEILgGuH/BTvNB1Yb/wBQ9pe5mad2nAKM0vaoXZv7WM
         hd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729757177; x=1730361977;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zMW6I0sTEYqubA9v2uS/l/YanQ/0kwQs3KpAh7vOnLI=;
        b=WVCi2/QgJzSb5ZIIVoBnFeIfqBAraNz6nZ94t/mpu4sFiZsQX634167eZjl4bqfGLG
         DsoQGqxdYusbH3ocpgMzq0Kgu5iPmICrUf1wYNDc5qU7+sKUIvznZIF1gMIa5T4HJOGK
         t6hoq4GEFnNNKRA0GR3S+RwYBNmIBox/mXlih4cyOiQoKDqkYgkviGarU9l+caDehStZ
         VH1Qj/bo3ngA9YJv6T5nehGYGrWm7xSARLkIiiQv69Qw+UofIVSIe7j1kz/EQWHuzHuL
         /zwOdmwL+4uiSrEoSfPBjLvr1uVNV0i+3p5DBtcRPvaRj/EFGX1AOjPvoRO9LejyCW5f
         Z4aw==
X-Forwarded-Encrypted: i=1; AJvYcCXejbTwHZiplXdWk1xfuwDLa9JtGCcEjkPgrYc609k8iJgpJdBOzU+jvtvXE/HjQRCo7uo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoLJaYlfOhPtnYaUl+uMOJKckvEXqqEyo8GF6MiUVU2VWHc9m+
	yFCcidJqBv5/oTf9IN9/GoqBl80HM+AdmPRpn/WfohxdBmgF2zbSa2wL1Ubr2KU=
X-Google-Smtp-Source: AGHT+IEoZMVKgD69poA0dFC1qIUTHJdJvAa3Cg9Ax/TeZWkK7ol7nwHmrhD5d8D+xQZ2BLd9/bn72g==
X-Received: by 2002:adf:e903:0:b0:37c:d001:856f with SMTP id ffacd0b85a97d-380458ee3fbmr839512f8f.56.1729757177038;
        Thu, 24 Oct 2024 01:06:17 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c04c:f30a:b45c:dbb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a64daasm10701229f8f.64.2024.10.24.01.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 01:06:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>,  Kevin Hilman <khilman@baylibre.com>,
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,  Liam Girdwood
 <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Shawn Guo <shawnguo@kernel.org>,  Shengjiu Wang
 <shengjiu.wang@gmail.com>,  Takashi Iwai <tiwai@suse.com>,  Vinod Koul
 <vkoul@kernel.org>,  Xiubo Li <Xiubo.Lee@gmail.com>,
  alsa-devel@alsa-project.org,  imx@lists.linux.dev,
  linux-rpi-kernel@lists.infradead.org,  linux-sound@vger.kernel.org,
  linux-stm32@st-md-mailman.stormreply.com,  patches@opensource.cirrus.com
Subject: Re: [PATCH 3/8] ASoC: meson: switch to use rtd->id from rtd->num
In-Reply-To: <87wmhyb85l.wl-kuninori.morimoto.gx@renesas.com> (Kuninori
	Morimoto's message of "Thu, 24 Oct 2024 01:29:27 +0000")
References: <871q06cmsl.wl-kuninori.morimoto.gx@renesas.com>
	<87wmhyb85l.wl-kuninori.morimoto.gx@renesas.com>
Date: Thu, 24 Oct 2024 10:06:15 +0200
Message-ID: <1ja5eudix4.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 24 Oct 2024 at 01:29, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Now rtd->num is renamed to rtd->id. Let's switch.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

Just one comment: I understand why you have split this into multiple
patches, I suppose it will help with the review but I wonder if it
wouldn't be better to squash it all into a single change before
applying ? To avoid exposing the intermediate state. It might be
confusing too. The change would not be that big actually.

Just a suggestion ;)

> ---
>  sound/soc/meson/axg-card.c | 6 +++---
>  sound/soc/meson/gx-card.c  | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
> index 5ebf287fe7004..a2dfccb7990f3 100644
> --- a/sound/soc/meson/axg-card.c
> +++ b/sound/soc/meson/axg-card.c
> @@ -43,7 +43,7 @@ static int axg_card_tdm_be_hw_params(struct snd_pcm_substream *substream,
>  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>  	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
>  	struct axg_dai_link_tdm_data *be =
> -		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->num];
> +		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->id];
>  
>  	return meson_card_i2s_set_sysclk(substream, params, be->mclk_fs);
>  }
> @@ -56,7 +56,7 @@ static int axg_card_tdm_dai_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
>  	struct axg_dai_link_tdm_data *be =
> -		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->num];
> +		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->id];
>  	struct snd_soc_dai *codec_dai;
>  	int ret, i;
>  
> @@ -86,7 +86,7 @@ static int axg_card_tdm_dai_lb_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
>  	struct axg_dai_link_tdm_data *be =
> -		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->num];
> +		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->id];
>  	int ret;
>  
>  	/* The loopback rx_mask is the pad tx_mask */
> diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
> index 455f6bfc9f8fa..b408cc2bbc919 100644
> --- a/sound/soc/meson/gx-card.c
> +++ b/sound/soc/meson/gx-card.c
> @@ -32,7 +32,7 @@ static int gx_card_i2s_be_hw_params(struct snd_pcm_substream *substream,
>  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>  	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
>  	struct gx_dai_link_i2s_data *be =
> -		(struct gx_dai_link_i2s_data *)priv->link_data[rtd->num];
> +		(struct gx_dai_link_i2s_data *)priv->link_data[rtd->id];
>  
>  	return meson_card_i2s_set_sysclk(substream, params, be->mclk_fs);
>  }

-- 
Jerome
