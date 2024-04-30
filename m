Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25FA199E8F;
	Tue, 30 Apr 2024 19:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714506837; cv=none; b=L9hRyOh3Nk2sNpVyRTYxbo/wSoqVkQT08OlnqT5AVyEWm7cYES6WwILC0qYpeVOWBFwkuYhwaHpy27KLC5WJeJzhXFbZhsqWG+VNF7AdoohHLOyV0g+woNDesnTa2YCc9xUEbcN4px5Ot0T2juZRP00UvUmluhbQKd/wGFOnYbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714506837; c=relaxed/simple;
	bh=/57uI0NnDO2LrGAjhLyCD8a8uhYqBrJbnu0u7FZxjEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b3O0DVF8ndm8QqMWbjuEi+pd8UHExwW2/vU/lVEM6eIXAeNa4b8eCAWbjPj1ZOVgbnUFNkBhysNSdK6KRIykioor2hpO2W0Pv6eLuSIfv91bFRTsoPb7k34W/S9DibbiJaz6+qmm7iOeF+uRmyH30mbXW9B2V9sQbwvipyagJGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDuAYcSS; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDuAYcSS"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a58fc650f8fso336825966b.1;
        Tue, 30 Apr 2024 12:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714506833; x=1715111633; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQq1oWqrCF0TfrogSNrGXKQjYOwjvsMuDYhQTiGCeqo=;
        b=GDuAYcSSlh+rc2kUIrxilLqLaWg/8OtqHwwYUfl1mB+Xm/8wxR4eTTK8X4WtaTKc9W
         dvrZXJo8xfXeXS0s4uQgznBMAfP8JskDkGxhOBfZbxyMdqR8RnI7e0OLDG6rQ3GfbTY8
         UZV5vEzu9+/1AUuGhpxknNsN6/Diahobfcs1BaRC0CBj8UWl7scBV5FCHEMAFKglDwL5
         KoJ+vJBRE3kdsewRVueyCryuj2PKqT0P5mkaXUwmXT9W2LoHfwjRObOQr2NVdYcDf/Xf
         slklUyyeRuWh9fn4qumWwFccqsHOm+Qv1tszE1rnUJXczHHHFAK6+KfoUlYOf10XND0W
         adwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714506833; x=1715111633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQq1oWqrCF0TfrogSNrGXKQjYOwjvsMuDYhQTiGCeqo=;
        b=NjoUiwffVk6yp3kHuNNwfHakvx254IcKdVFLxfuGh5jdFPUMKUklIQbKoP9SD5+Rid
         mtlbr+glnzqjOjOrxS3LV9swKMOa0PM/rLWte6++t2+cXqApX4aNA/F3yH0OTH3NfOSV
         PwWvEPYj7KNTSu46DdR9wFdb6q2A4qU+5bqEhQPTRW0fz5iQIw7DukY5STuPM3yl/k2Y
         vO3HF9xg8IX8ywA6zGu4IQBH958oBCbHNzs6UQDjWBqzqka32I3EUiybFRyxJAYKqVP0
         tFycfnbsFNfAa64abC7DkG4cqL799mR+vU0SHO4HnuxGOWo1dBQWEfdTQeo66v0l10ba
         q+aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp23BsqThddj2E1SV2RLOgoPQDrf/a3IJa9/K1BC1Hp1bDizX/SNLZQKj1OnKeckRA3RHZURyngTI340Taj4jn3KGYirGu48OvgOyOB7kw3rwt653hyepUZZCOQpYcMUA=
X-Gm-Message-State: AOJu0YzJS+faA+eW28bPj5O4LGyWlNg927w5GoSh4ZeTrnN4Mu4f0NbS
	GfRctI7g227b8YdF9Iy/UnvkRD8MiIX7SkfEuPPXoRObMrWOpHTI
X-Google-Smtp-Source: AGHT+IHcHyFMebv11hNczXbfOSBPzOfPEK56ZS5IQDWu8DzPrwNQuSSocR8UcDfVrVvZhY8lrKqE1g==
X-Received: by 2002:a17:906:a084:b0:a55:387b:eef9 with SMTP id q4-20020a170906a08400b00a55387beef9mr455005ejy.10.1714506832645;
        Tue, 30 Apr 2024 12:53:52 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 13-20020a170906058d00b00a522d34fee8sm15418045ejn.114.2024.04.30.12.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 12:53:52 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Ban Tao <fengzheng923@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject:
 Re: [PATCH 13/13] ASoC: sunxi: Use snd_soc_substream_to_rtd() for accessing
 private_data
Date: Tue, 30 Apr 2024 21:53:49 +0200
Message-ID: <3292058.44csPzL39Z@jernej-laptop>
In-Reply-To: <20240430-asoc-snd-substream-clean-v1-13-6f8a8902b479@linaro.org>
References:
 <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
 <20240430-asoc-snd-substream-clean-v1-13-6f8a8902b479@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne torek, 30. april 2024 ob 16:02:22 GMT +2 je Krzysztof Kozlowski napisal(a):
> Do not open-code snd_soc_substream_to_rtd().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  sound/soc/sunxi/sun50i-dmic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
> index c76628bc86c6..fedfa4fc95fb 100644
> --- a/sound/soc/sunxi/sun50i-dmic.c
> +++ b/sound/soc/sunxi/sun50i-dmic.c
> @@ -74,7 +74,7 @@ static const struct dmic_rate dmic_rate_s[] = {
>  static int sun50i_dmic_startup(struct snd_pcm_substream *substream,
>  			       struct snd_soc_dai *cpu_dai)
>  {
> -	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>  	struct sun50i_dmic_dev *host = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
>  
>  	/* only support capture */
> 
> 




