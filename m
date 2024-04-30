Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18C7172BD5
	for <imx@lists.linux.dev>; Tue, 30 Apr 2024 14:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714485760; cv=none; b=F9rgEo9Pg1tvivxuPKaSQ6ZsXjPMxiZzToG8q/cBAEZC/g0LOf8j+zIpcKt8TYDFj8cYSyVE5DtyV07t9uOh2c6pg1cjBHGCqOJNwFod5+z1ez2ElKhWWO9nHjlYwsN4XaRyw072XlOVyBZpts+witb4AsPwzhQbZlUX1NsPah4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714485760; c=relaxed/simple;
	bh=nmVD9KKu0onQCo4+scSWvtThsneJsuva2ZwAC2itQ+Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HSi5U6OevATeHilpNQHhcPRE+nuMTJ3bnXPGE53+jqcmuYF3uEF96yhs2hR4PMqR2SQTCes6OHYj6rSlK4RSPWse9S302ZALjHkYjusbVjLkSS0Fbeq96nZEMLWtc7eW0jEkESEAULs9zQV0JBkqe+2I9hb3g1IFBpz3I8mhDDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v0lmPSB9; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v0lmPSB9"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51abd9fcbf6so9617044e87.1
        for <imx@lists.linux.dev>; Tue, 30 Apr 2024 07:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485757; x=1715090557; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ziKPpXLYR2zn3+NU5Pk66H9ism9mr6GLdkSFbxKAZ4=;
        b=v0lmPSB9R2auDveII+UkX0KLFe3pg+RYMLE8Y/kBgs6SAP6/eeYMMg8UpvEC57xNys
         YdLGZNKyljVF4UJTYj8Q1T8Z9IHEZdy4LtD5OA/ydFGpf2OZmh/zUKXa7W18ZklBgp9q
         DNTIPrxPRTs4G656xs7AGpU7YBAUIZvHB2r4STMRxyM4/OFJmLeXyNO3k9xKZqQGXoLG
         YQ4Qa8Sj2s1vQnfixYwO021RVUr6f6qSC0+tzNG7Rn4V7Vzt3apDdzOIT6LtDg/i0Scx
         p3a4v51I46v6y8csB42JQuPsGyPGZR7V/c9Cl1wdTOb0vcPt/NvY7p5V+FRyofJ1NMv6
         iksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485757; x=1715090557;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ziKPpXLYR2zn3+NU5Pk66H9ism9mr6GLdkSFbxKAZ4=;
        b=E2/BBwxBMCYK4mY8LpsiFeHy0dezzmy2hSarUYd5OmyS7AHKden1pHA4H97dgY9HpE
         6okFCIOI5vj4uVGf/OMCZrubDYp6FqF+BFyC7im/niN4wdWv3RsNxog/k4QIy2xb7ju3
         WMuUm/GOnc/g6iINSzERB2Vro4Ji+WRe0qFLD6/XP+E/T7F2HBBihB9T+CW2g8rd5FGO
         spXlTo2vYHpyj0n4bg50UTkFgq5HGvdfTVwhKqhQp6mEw+uVt/P3raWaRUVnr9W1+PHa
         ydXsW1D7o0rKbreGLM6ZNwqLRCpJSTI1i/60ZWqEN6aZn9mDj1cVZr44xFp5eDRcXkf0
         sFyw==
X-Forwarded-Encrypted: i=1; AJvYcCUxoYGArNMhtdvi/ganCXkGpeUebXoliJjqJMp17qhrQIQA7zle1pNElnwq4Hu8tgGuA1sfLH8O29TBQKXGUTZ4Ukg9
X-Gm-Message-State: AOJu0YzHlh3wrV+FXazzKpsEGzf+dKk93BrsCYmo33I6qBAeRPSbz2dF
	iitn2hhzyQSs+Mh+/p0mWmy5RZlwzn7bJJJHVXOpEYFPy1sgWbf93LlzUWfad+k=
X-Google-Smtp-Source: AGHT+IFxX6RMrPFkE+iKjGFWGX6uNErIhwrc6ioCbIidZRB0tmw4GxAmrC5NZWl96iLeoUrVLfRGvw==
X-Received: by 2002:ac2:47f0:0:b0:51d:70d9:f844 with SMTP id b16-20020ac247f0000000b0051d70d9f844mr5882908lfp.22.1714485756019;
        Tue, 30 Apr 2024 07:02:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:02:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/13] ASoC: Use snd_soc_substream_to_rtd() for accessing
 private_data
Date: Tue, 30 Apr 2024 16:02:09 +0200
Message-Id: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOL5MGYC/x3MTQrCMBBA4auUWTuQxEhqryIu8jPRgZqUTBWh5
 O4Gl9/ivQOEGpPAMh3Q6MPCtQzo0wTx6cuDkNMwGGWssmeFXmpEKQnlHWRv5F8YV/IFr8YGp12
 a88XCyLdGmb//9e3e+w9CANGvagAAAA==
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
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3547;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nmVD9KKu0onQCo4+scSWvtThsneJsuva2ZwAC2itQ+Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPnp5GgNlhBx+/I3aG9tNIg/czLIulpjsgqB+
 gIo9+t++USJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD56QAKCRDBN2bmhouD
 1/7LEACEfk8kijEA2LTMQcsqwb/zKSF+KUnI8xKuCriVzrabC5ANnLec53cOfXlJiZr0ORRQZu1
 470KfeDgCK0rPa+5rmHArn0RjNORLJGv3UY9o33TRjgnRKnhemsjjVBOY2q2aSGa12PGCdgZZ2W
 9lYT6gbghyhPF8NwejTYWU67cXXHzw57qZrigi06wTI2UMEzGCAPqjVhM2lDMHiEyCTYsFh5fZC
 rR2QeMZ5pK1z03KZd5SaMByAHa4DJKQOESKs+zVprbQfv5lzpQpn0EVjmxu4IuLRoQxBzfNJhPt
 36FgoerUfQRcpNoGC21+oBlav8jvX4KPs07WDOuNAmbmOtgXCpWnMgFcFwHmF3waXKQHwzOjK+/
 2KrHGzOUV9Xbz/fFxxDvcrJ9KdrqfbWpHM0xl7iwulLPWb1KsQr+/NFKNg6MfijGBKz4sC0Zqt8
 vQP4on/GzYRbye0DENyAmvUZGrWaBcF6ARh875j/Wtbgf4akwjlz1IziblIY+5XW/H1pl10EmuK
 rZVUZawHpK9VaDDe13ybwYLFC6jLwchoLTS52Pq2adjWzHJ+DAX0kMA60ACfugVQyPnugr0zBEz
 B7kqe01ESwCaFe3059W+GzYuXFpqQpOOJOqIoNfu7R23l0QqyopaR9hd/2Y62EwfsI/mkovGRET
 HqyQWjcO1YItmKQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Hi,

Do not open-code snd_soc_substream_to_rtd() when accessing
snd_pcm_substream->private_data.  This makes code more consistent with
rest of ASoC and allows in the future to move the field to any other
place or add additional checks in snd_soc_substream_to_rtd().

Best regards,
Krzysztof

---
Krzysztof Kozlowski (13):
      ASoC: qcom: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: tegra: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: ti: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: arm: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: amd: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: fsl: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: img: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: kirkwood: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: loongson: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: mediatek: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: meson: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: samsung: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: sunxi: Use snd_soc_substream_to_rtd() for accessing private_data

 sound/arm/pxa2xx-pcm-lib.c                 |  4 ++--
 sound/soc/amd/acp/acp-mach-common.c        |  2 +-
 sound/soc/amd/acp3x-rt5682-max9836.c       |  2 +-
 sound/soc/amd/ps/ps-sdw-dma.c              |  2 +-
 sound/soc/fsl/fsl-asoc-card.c              |  2 +-
 sound/soc/fsl/imx-card.c                   |  6 +++---
 sound/soc/fsl/imx-hdmi.c                   |  2 +-
 sound/soc/fsl/imx-pcm-rpmsg.c              |  6 +++---
 sound/soc/img/img-i2s-in.c                 |  2 +-
 sound/soc/img/img-i2s-out.c                |  2 +-
 sound/soc/kirkwood/kirkwood-dma.c          |  2 +-
 sound/soc/loongson/loongson_card.c         |  2 +-
 sound/soc/loongson/loongson_dma.c          |  2 +-
 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c |  4 ++--
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 14 +++++++-------
 sound/soc/mediatek/mt8186/mt8186-mt6366.c  |  2 +-
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c |  8 ++++----
 sound/soc/mediatek/mt8188/mt8188-mt6359.c  |  6 +++---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 10 +++++-----
 sound/soc/mediatek/mt8195/mt8195-mt6359.c  |  4 ++--
 sound/soc/meson/aiu-fifo.c                 |  2 +-
 sound/soc/meson/axg-fifo.c                 |  2 +-
 sound/soc/qcom/apq8016_sbc.c               |  4 ++--
 sound/soc/qcom/qdsp6/q6apm-dai.c           |  2 +-
 sound/soc/qcom/sc7180.c                    | 10 +++++-----
 sound/soc/qcom/sc7280.c                    | 12 ++++++------
 sound/soc/qcom/sc8280xp.c                  |  8 ++++----
 sound/soc/qcom/sdw.c                       |  8 ++++----
 sound/soc/qcom/sm8250.c                    | 10 +++++-----
 sound/soc/qcom/x1e80100.c                  |  8 ++++----
 sound/soc/samsung/midas_wm1811.c           |  2 +-
 sound/soc/sunxi/sun50i-dmic.c              |  2 +-
 sound/soc/tegra/tegra_asoc_machine.c       |  2 +-
 sound/soc/tegra/tegra_pcm.c                |  6 +++---
 sound/soc/ti/omap-hdmi.c                   |  2 +-
 35 files changed, 82 insertions(+), 82 deletions(-)
---
base-commit: 82415cf72c7e224be7a6496f3a53c0b365c2fe9d
change-id: 20240430-asoc-snd-substream-clean-924b717d8f54

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

