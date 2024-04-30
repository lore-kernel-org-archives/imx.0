Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22548201250
	for <imx@lists.linux.dev>; Tue, 30 Apr 2024 14:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714485806; cv=none; b=Fo2I4bOpeG7sNZqPs63zWZZi83qT93HwKBK9sOp/Pqt1sBVvBrzwX1c8zOJsPZcgr6hQvJsko++UJ/+z0m2DzqO4ZFXgBvp1AkwttZ9GPE1VzAplAMZI8kMeXgVb20LvMJZ9o3j1jL7RjIYQOLDmUt/4ocpyt1Lyuk/yWu+Jc8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714485806; c=relaxed/simple;
	bh=skJQwkduJ0UqVILLbpIVR8oru+2QUc2pKBYrAAVKHLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LRfmVrECEsIt1wUDGbV3BYaSn8nyaQ03hlrhiDAYiCq1BriWWGDd0z7RBXwSgf0BVqmj7B4dOeMA+CT4hsqAs+mgCPor49OIdm4jn/2Iuh5b9GxJgauAlkp2tUy5fo9TjmBKdJTTugkPWl0iuQQtvSjH9iPfb9LN9wqG8WJpclg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Si17irv0; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Si17irv0"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56e6acb39d4so7010756a12.1
        for <imx@lists.linux.dev>; Tue, 30 Apr 2024 07:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485802; x=1715090602; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yC31R3m8W6wP+grnNVF/H3dyhG6qnKQukTpoDRo2U3E=;
        b=Si17irv0TxsDXeOcHZS6Sud5gKlrAbTSV0cZ2CKJYHRJDTbsJWDltgdNacMUQ5GM+e
         1ltHIyZTvBxbE3NNgB2JshjOao51l+hNlFke074MVCSLwuaI/peqssggBDjvSy6mqVH9
         t4F1nFO9y+5L6kaXoooQ78/Px403AzVQy0RhmOgu0+RkRpHj9dor0wGPYpGXD0ZNlyWa
         a2k9HRi/E4HEeyImF0qJ3pv+xCd9qp7Eq6UmPkFnk+KgZ1jWewAeMdyTDW5E7Oh3jMqg
         yCgzZZcdZ4tRODbyyQtbs0tg67WmkOx4tkfSBb1BQTDJPck9zRapKJfOyA6nD/BeA0k4
         +FtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485802; x=1715090602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yC31R3m8W6wP+grnNVF/H3dyhG6qnKQukTpoDRo2U3E=;
        b=sqK8KgPmo/aAid4yEw+fzCFWl0lzoghsNyKGUzueRw8JzuqAZ8umP1PclC6Ge1uHTg
         t0XCI4BSiZSXoSvXrwTClv1Y1G+V6HUuZ79cl2L0UTN47mLDzVA3WBsaFYEZ+/B+Q7g8
         sx0BDj5T2Ae4r/w0Yl1/414YSTvdAcYokNn2dnmR8hcnOyh5ZniXSzZwLbEoPLyUJUFV
         XsX3B9gJ5xz5KU9Tv9KAl56/CWGpv1pMF8VwWqmx5PezSJV0vp5WVp2zTOJo4TpJ5WMU
         oB5XjtRiK+Z3qFZDYVEyuCPCE3QjufiRzgYeJTGQr6NNtLC0297B/JBt0sqMchcwkI5L
         k5rA==
X-Forwarded-Encrypted: i=1; AJvYcCWW1yRYqp0OXG2uO9SDUulYCksIUfXy1OAkZ+EIJLrnwQZms7t1xYdpPSCqcGEw0wu8BbwEBx/kpuB0x5WcLLNbSK8i
X-Gm-Message-State: AOJu0YzSRbzfKPttdDUz2oAIuQJpiR1qLBRwFqAQB8myzPJmAJQsM755
	Avc5M8x7xphHiFKw3IeXQJMkBIzuy1ZfA9jPYgNZWED8dxjmSgajdmTNBc0K+5E=
X-Google-Smtp-Source: AGHT+IHSymzbs0C8MGLs3EVai6AvWaGt9IGpYcAnz/QtQsZ0owRN86WOYk4l43txKHjNaleFCNL96Q==
X-Received: by 2002:a17:906:b78c:b0:a58:ff19:1bd7 with SMTP id dt12-20020a170906b78c00b00a58ff191bd7mr4814671ejb.24.1714485802359;
        Tue, 30 Apr 2024 07:03:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:03:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:22 +0200
Subject: [PATCH 13/13] ASoC: sunxi: Use snd_soc_substream_to_rtd() for
 accessing private_data
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-13-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=855;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=skJQwkduJ0UqVILLbpIVR8oru+2QUc2pKBYrAAVKHLI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPn42nKdNBa2rMr1pgKaAGhX7w0XUyPtyKW9V
 bUEsOjG4LCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD5+AAKCRDBN2bmhouD
 147DD/4ieg9gyFCb0g9PJBqL29gkEXs/qxtb2TaodG03VYLhq+fFzv2vOzJZhszAb1VOkS8eI0F
 KlbKY9lyGbdzA1h6zSNA0p/UgvlOtsdv4xC+0KT0yy7TXAza83A9DSl1qDnkNTdOFgc42e1+9FU
 eaGGfDloUavMXd6rNB7SRZMQRcm41b47P/mRzEa2cA1bjkAlrlBm6NwPeVLP5A/Kcr3Tb3EZ2pI
 HgLvCY5h27fuJYugwmxUMfqOjXMdWLx9SSAQ5yfhuYZZBgKU100MiFOvcW2nlDlhncmjU0WcU5t
 H7ySW9GYOdqAqEkELNGxb97j0Ov7StcHdE1uz4YmdansE+m8dNQTp3CaZ4LdH2+2TFF/sP4aynu
 H2GUeJKaC1N/Ng+cEI1h0gMDXKbR8qyTg+SjoM6i7+5UP1I2coCVMYrneh2dpEyJOp9MNFOvj5d
 UzzEQMRQeFilQTHwB3xynjKLIUqJbjhqfafH5A0FECh/lb7OoM+PTU7VciDC4L/s1Xl/NOiJCnq
 69WLOXnti2pJsaGzvUMsSHAlokIA+7NRIpUewkiHs/lN9zgB7QfsX/zvrQTookURZBTMehAN/cd
 yW7Vl73L2bSpn6CppvaD8hpkm5+NhqYeNWbMxnKsVdyQiMo84C2YNgI+3cBxRRpVQUYuh98RXgk
 h6j6UQIf5KNOdKQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Do not open-code snd_soc_substream_to_rtd().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/sunxi/sun50i-dmic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index c76628bc86c6..fedfa4fc95fb 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -74,7 +74,7 @@ static const struct dmic_rate dmic_rate_s[] = {
 static int sun50i_dmic_startup(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sun50i_dmic_dev *host = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 
 	/* only support capture */

-- 
2.43.0

