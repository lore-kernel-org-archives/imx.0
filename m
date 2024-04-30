Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC08E1C65F4
	for <imx@lists.linux.dev>; Tue, 30 Apr 2024 14:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714485796; cv=none; b=IKKPHmYlDs817dSyd/4visaoKSaV9j7RJr7sripGyNwkoNS1KYC4scmI+VoJGy/bFF/dKNZRakDbScCHtNgje1xnBTyawCSyT24YgBaRDps1qvAsogmZExMRY/siFdeVgYPx65z8CwXxVjHoJ0+tpd0J7lnBdmVjQ/Ok/BDoMi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714485796; c=relaxed/simple;
	bh=b6kuGLsh7Fncnab7O/x1sZHKoAE2to9yOPoWLkFWFoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=reIYQz5FfIaVROm4e05NalcdAtQpktR7peT5Rl9S+C8/zz6oCGkqO5YN45pFCtONUyD2ebgZMo/RGPh9HYnJhf5RNgp3X5SAaKmsgyxLpFA0k/z57DoN0/oSJgg8HE/3LYZ6dkKLW3jfKtbQoPj6Cy+mQEqqr2Q/mHaWqCQe7U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mbDEK/1E; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mbDEK/1E"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5176f217b7bso10096557e87.0
        for <imx@lists.linux.dev>; Tue, 30 Apr 2024 07:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485790; x=1715090590; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HMdvqht5zOkDrEgl++6w26ILXUpiKeLdEJgBolPMUp4=;
        b=mbDEK/1EAd4VxU+zlxO0ptKKh/BbKnKbk6QMFrgPYUNf7z7Z/DFq1s40mSSWslo5tX
         g/Df7xATheZPQTEIMQLz0EanUma6N6pDNBlEXfppjk61ydidtJz2YLEs6H51U0RTLDR9
         6THgSkodrGxDrorks/hcZe6lx8cDXQkg0MlibO+40VuFj2tbhHbxWZbsaUYdys6+A/9l
         wQ1iq7Q5Duz0sHxrt696iMDN2eTpjYONa6pEqLXyvSd7R55BIrAmkSlY9CJ6UuOoVlSA
         fHl63w4+NsxqMjIT20icD/z2Aqxk3g1bH+CXH+WP+ixr18wWuLz6Y066/fSCMM0Ov+ow
         1H5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485790; x=1715090590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMdvqht5zOkDrEgl++6w26ILXUpiKeLdEJgBolPMUp4=;
        b=hWLyU3itGu3+9pAs1p7krG7b7gfAmA5fJ2GEawxOu9hqmpLVkhqqIQnb8A00NL8acm
         NfzCA7Z973+m0JSrjVIKXCqr1B3XmXy2bv6LEi/j6CKfUF64zcGRE13QlmDrNEz/xmo7
         MEuGIP10TOCdcnFFBq8XgnpJ6BLtT+QECgWRGAFxhdn8vuabIqnApeeuWJttAr2yt34Q
         mXGZA7nIJHINATKD74MIOWisEsKXqU68zwmsfdq+gQofN4Qyq7xsTck1nJrOYt3OcUx5
         q6qXnGy1IZr+2xqDpxcgl4ZsXcCuCSdzorNeX7/3cDwKCzbVLA3s0Py+iJNpZ3gZkquT
         JG9A==
X-Forwarded-Encrypted: i=1; AJvYcCXp+oaHYaGiQteIHvEPxlW33Uv7Mcz0X1+Z0pAXNKnLXPPhEVLhSOURGvpFlbMhT4hJvlZ71IdADEbZ865PIy6/L0Zd
X-Gm-Message-State: AOJu0YzelpSBYv06G/XXfXmFqgHF3xBxj2mwy3kIvOUn/u/161uvsp6u
	OGk4ydP7xBjZlXjmo3teer/7JDbD+R8UNovv0GrYZzUkziWqXR9JxI0Uopsa7x/2kdV6YhvEqDB
	lpIE=
X-Google-Smtp-Source: AGHT+IHF9BCm3Hpto4qRWqGnR6LWsHIvsR6psO89D0oVIbNwL85POL6TwPmXMEZNmxvO3lf19inFfA==
X-Received: by 2002:a05:6512:3982:b0:519:166a:d217 with SMTP id j2-20020a056512398200b00519166ad217mr13782162lfu.32.1714485789720;
        Tue, 30 Apr 2024 07:03:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:03:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:18 +0200
Subject: [PATCH 09/13] ASoC: loongson: Use snd_soc_substream_to_rtd() for
 accessing private_data
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-9-6f8a8902b479@linaro.org>
References: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
In-Reply-To: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=b6kuGLsh7Fncnab7O/x1sZHKoAE2to9yOPoWLkFWFoc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPn1MXBzjTFYW1vw+HGX+bgAlb8xjIeAN12qT
 8heTgZA8qOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD59QAKCRDBN2bmhouD
 18asD/sG4cfwm5/cvMuyWs/KhNg7FPcNnM4eFOVtUPz5xnRqVF4pt6jUcKqDJjRfrq3s5JoYJ3c
 vBUD9jgSmkuB8tYCeWM/fFAOimxAXRa1keWd3xM/+KL3qsLAqkpXIdkHwS20hkhT7fIF+E2cU34
 35Ajyyg+q/q32ZXoeF+z7chz0oMLOUq3jDN4mGTO2PE/l4xWHZqC30HaBVtVZLYOr2WdfJN14l+
 YsJUUR1UBA5aXsr++f01Vf/m5pPIFSvYtRQcrp5YyZeaWVGm24AD0kDXcfdaYuSD6hlnoVB1j9K
 LlP/ODUgDC6zWb68dtVEkLXAfru4YUdiN9M9PLsBzBz0IIoe1aPihWRNB80Uyu2Z/lWy8ceeaX/
 rMUdGMoXE+1AcbqrE0sZvujjGVmL/5axnumRcAJRvAi4jE27qyDapAyfgL2FTvrC5fHHC0WF/Pe
 zkWTZpTx4al2ZotNljcAD9imjfQSGKB+Iovem2sQW+eZIGnWm6EeDiADskK/J5bROpHvWbfLRMM
 rXaqxY9WzOy+EFocuuu+Vq9ckAOOUcikB/3Y6YS/odwg7AZZA9hLSefMdTXWrnaJnScqKcP/bAw
 gRWnITyzDhtzuAN/vsyQ5gi3lbBmCYNL5XhK6oDlLe5BamoqScRwdbTHBthRDUiaLtaYXHQGkXj
 jOwKVSiBpozJEaw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Do not open-code snd_soc_substream_to_rtd().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/loongson/loongson_card.c | 2 +-
 sound/soc/loongson/loongson_dma.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loongson_card.c
index e8432d466f60..fae5e9312bf0 100644
--- a/sound/soc/loongson/loongson_card.c
+++ b/sound/soc/loongson/loongson_card.c
@@ -23,7 +23,7 @@ struct loongson_card_data {
 static int loongson_card_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct loongson_card_data *ls_card = snd_soc_card_get_drvdata(rtd->card);
diff --git a/sound/soc/loongson/loongson_dma.c b/sound/soc/loongson/loongson_dma.c
index 8090662e8ff2..4fcc2868160b 100644
--- a/sound/soc/loongson/loongson_dma.c
+++ b/sound/soc/loongson/loongson_dma.c
@@ -226,7 +226,7 @@ static int loongson_pcm_open(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_card *card = substream->pcm->card;
 	struct loongson_runtime_data *prtd;
 	struct loongson_dma_data *dma_data;

-- 
2.43.0

