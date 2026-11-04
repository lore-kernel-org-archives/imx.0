Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789328;
	b=eVOzbSIxoBvZaimAba1bZogD+UJIDTiS1KfYuPjNGS/DC/4c0WGCVsuyVgOy5mqtTJUg
	 HmVsUKRicHKJsEn1rggZschW7LXLj70i5SmQwLDY4tE5T/Fjep8UhgxBTVT+c3+7nhSqx
	 kHqTfbn5NfhFgvUDvbBHPgmDO0NZxR+9NxCo5frfWo2frOPyfQhyYyaEgxDH06aCelPuR
	 p+N2X7/uNGYmwD/IyNiySN72pBK8mCumY5EBI0tRRDHsB2cHnY6hDZ4AbCOILf3mwjBpK
	 67VC7wZ0DMbGyaSBGc4MwStQDTLQGzymQz9T84xnHJ21TCVdjiIWngeiIQkfyQiAUrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=QtbqG07ZqasrjsOtWvFMIUfN1oH5l3jO6rDIKIN7V9s=;
	b=EiZ4U4If5+paTk+49gOrQ8yeLsUo0uSxY3PYaSnF8jerAN1nrecEr6B6t5x4XsottxbT
	 cA1v9CzuijTZIyZ/4e4dzQqtzIhHvWxISIx0ooU38HThCqPqKBJIPJdqtf6lDRtmL5RXD
	 tMVTjK/btWcQFGllb/T0yThae0pB7BA4i7hE41vpujYSj/Uhcgo9E4r3lhcnWazPmZi3u
	 sX3DVuWRnWfiy/qPS0cgdW1bJDqIYepc1AxbND9GacMHgixwQHdakkQuknZtSOoz0aOPp
	 QBjONq2bwVbz20TkhpJsBX9zcyF29z/FPEhaRgOXYVRwC8NQb7d3x2M8XEwkLdce71w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Dw3b1585;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671BE606A32D
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 10:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 671BE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Dw3b1585
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so4683735e9.0
        for <imx@lists.linux.dev>; Wed, 04 Nov 2026 02:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793789326; x=1794394126; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QtbqG07ZqasrjsOtWvFMIUfN1oH5l3jO6rDIKIN7V9s=;
        b=Dw3b1585kf0KFwElcVsmxslDWFlEZljYrZGzs7M32h/4b6QHRsRT2Ieq7xJVWUBGYi
         90iJzVHwYrU8T4DreCNhXvPxZYE66AO9IybT5yHxFHbxsWygq9Es6aA3y5SbeXTXNdPJ
         MKyAVtJtAXD0wVtvsZyMo6Ex49u1N+smuwAi0KY+EFy+Is17V29PcmQqnQqCScoMkLuW
         e+uOhIVH3mTIkJA3818GUh9MBWKqMi6RACJoQWrSaQTGQmiR7BPSCYPZBAiXrwOefAMS
         wPfRNa0vt4O9965CTvWE1fH4iFOoibR+QVO0vB667AY8VHM1BkKMFs0VNHE/1ScYYHtX
         b9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793789326; x=1794394126;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QtbqG07ZqasrjsOtWvFMIUfN1oH5l3jO6rDIKIN7V9s=;
        b=wN/RLJA4WOptSXd5E9e/vzrZVDv3Is2hJjV+i9lKxoPdypR54TZBQQlYeiMgY5lYsl
         xqQsGQwF30apNdZCZmydp/hoQmKhjN3HO0HdMvQ66am9bxLSz6EL5Too4NgZO976oyfg
         M/f00TJYE/N4P2mdZjIPGvclPClwn9McltpzeNs3jrm0fDH+4orns/dGB3u+zj4rd/hb
         rFgBfzuWu0nIc6TtvtuYMyEEvcGUA+eua+7eGrBf2gvBlSm4yCfn9AcyoG+VdiTlMsO7
         bPqfT8AlhNSybZ6mApkHn7JQqFd0Ig/XPJKt0zpIcEcAjpNgT5fJRfsJw0y5AZ++NxKe
         FlqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQeshQm/ZI2QKnwdIEj/uoqQIABcwCe5RU5Y8oaZ7ivPtEcAnR3oVve3TOyHqh7Suaj1o=@lists.linux.dev
X-Gm-Message-State: APuU4Z+oHDA9kPfwZAVhlZxXJXgcLjTfull61GKQY8/KfNaobe8H3tYG
	iX9cJQczZnshfr8+++4fJBmorm+D2cTOBHk/L+GeRVAoKppQyfTdTf8bdKQBteS+6+M=
X-Gm-Gg: AYBFou1j/uyj/Dif4VD1fufaenWy0FpATDkBA3CNbOhgyJGr7C0ceP3ERBm0k9TPJyf
	dxicL5zVBuc0JMaiDq5mHbmA4wcoHG0pK/sFI4xDxsvwvGl+6lSDfT7CzJxI6pCuJOZ7iyilAGv
	2RalexG9fo73If6Dw2PmIZD2CcVJ607Bc1YFs+0jqjnDDf8H9Ho5c6Q81QSraHiprraF2zR96P3
	m9dOlNYxQEELr4iYXt7wE+dN1R+XqbQNTkq4Rb8Lxtw9liGe0yRqo3cTZfL8HKc7rFHl1OdtXtA
	Mra3TmploOiqwIYlCUydUCI08VmdA53d3xFhZ/DRU1y5jEuFpiU2tovYzI1R7btQMJG/GIoPgDA
	S2aUSWsAhPRNOrLS7AILMwjymASLfJZZMsiDwFZ5ZDKF3WRWXwj8iG2RJOZDW3a+CUjnaMZGdKm
	S1qbbMyCdM7CwyAJNs+z83UV9695eZmbG32Ml3KsGfwPW/mmJt5km68n7UAYrxVxlGyms6rmXX0
	U6lcrXtmCJhIaadznXXaWE/vbWJo41E8cwAlu5Pdo4+IA58OFLYArUC3by4pdSpEB6bTuGPjbsj
	rQYdp+9dGi8kYF0rmu28N9pe0Y1zfsVlV/ylaqz18Z1mQDx6
X-Received: by 2002:a05:600c:1c23:b0:4a2:47:b79c with SMTP id 5b1f17b1804b1-4ac180f2addmr415568325e9.32.1793789325659;
        Wed, 04 Nov 2026 02:48:45 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a80e184esm136455625e9.2.2026.11.04.02.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:48:43 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
Date: Wed, 04 Nov 2026 11:48:35 +0100
Subject: [PATCH] ASoC: fsl: imx-sgtl5000: release codec clock right after
 reading its rate
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-imx-sgtl5000-cleanup-v1-1-62739fbb4a25@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAIIN62oC/yXMSwqDQBBF0a1IjS2oNn7ArQQHpn0xFbQjXRoEc
 e/pJMMzuPcgQ1QYtdlBEW81fYUEl2fkH30YwTokUyFF7ZyUrPPONq5TJSLsJ/RhW/jSODRSohp
 QU0qXiLvuv+21+9u22xN+/b7oPD8+32steAAAAA==
X-Change-ID: 20261104-imx-sgtl5000-cleanup-371e704e5de6
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3504; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=ioLvTLPQ9whgkMJcbvVWkeDAXZlfFZobCdzIe0dI7xo=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmvedtyLG/E7rQ9UKBp77CEsZNvw7oJec4JDyW+H73J6
 9v/OHBPRykLgxgXg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACZyXoLhD7fllU59pXtZbBOD
 lT4ud685XSI5347ReNq5A1fjTNf+usfwT2NDfkjp8+tNc9Z93pHCG8nwgMk66xf/V4fK3NnJUcw
 P+AE=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

The 'codec_clk' is only used in 'probe' to read its rate, which is then
cached in clk_frequency and used by 'imx_sgtl5000_dai_init()'. Holding the
clk until 'remove()' serves no purpose.

Release the clock right after reading its rate. This allows turning
'codec_clk' into a local variable, simplifying the probe error path and
dropping the 'remove()' callback, which has nothing left to do.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
While reviewing [1] I realized that the driver could be simplified a bit.
'codec_clk' is only used in the 'probe()' function with 'clk_get_rate()',
so it can be a local variable there. Also it must be put when no more
used, still in the 'probe()' function.
This allows to remove 'imx_sgtl5000_remove()'.

This patch does not depend on [1] and they are addressing different things.
The two should apply cleanly on 7.4-rc1.

[1] https://lore.kernel.org/all/20261104022815.1484320-1-vulab@iscas.ac.cn/
---
 sound/soc/fsl/imx-sgtl5000.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/sound/soc/fsl/imx-sgtl5000.c b/sound/soc/fsl/imx-sgtl5000.c
index 8bcf54ef709e..032ea3e066bd 100644
--- a/sound/soc/fsl/imx-sgtl5000.c
+++ b/sound/soc/fsl/imx-sgtl5000.c
@@ -20,7 +20,6 @@ struct imx_sgtl5000_data {
 	struct snd_soc_card card;
 	char codec_dai_name[DAI_NAME_SIZE];
 	char platform_name[DAI_NAME_SIZE];
-	struct clk *codec_clk;
 	unsigned int clk_frequency;
 };
 
@@ -54,8 +53,9 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
 	struct device_node *ssi_np, *codec_np;
 	struct platform_device *ssi_pdev;
 	struct i2c_client *codec_dev;
-	struct imx_sgtl5000_data *data = NULL;
+	struct imx_sgtl5000_data *data;
 	struct snd_soc_dai_link_component *comp;
+	struct clk *codec_clk;
 	int int_port, ext_port;
 	int ret;
 
@@ -129,13 +129,14 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
 		goto put_device;
 	}
 
-	data->codec_clk = clk_get(&codec_dev->dev, NULL);
-	if (IS_ERR(data->codec_clk)) {
-		ret = PTR_ERR(data->codec_clk);
+	codec_clk = clk_get(&codec_dev->dev, NULL);
+	if (IS_ERR(codec_clk)) {
+		ret = PTR_ERR(codec_clk);
 		goto put_device;
 	}
 
-	data->clk_frequency = clk_get_rate(data->codec_clk);
+	data->clk_frequency = clk_get_rate(codec_clk);
+	clk_put(codec_clk);
 
 	data->dai.cpus		= &comp[0];
 	data->dai.codecs	= &comp[1];
@@ -185,22 +186,12 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
 put_device:
 	put_device(&codec_dev->dev);
 fail:
-	if (data && !IS_ERR(data->codec_clk))
-		clk_put(data->codec_clk);
 	of_node_put(ssi_np);
 	of_node_put(codec_np);
 
 	return ret;
 }
 
-static void imx_sgtl5000_remove(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
-	struct imx_sgtl5000_data *data = snd_soc_card_get_drvdata(card);
-
-	clk_put(data->codec_clk);
-}
-
 static const struct of_device_id imx_sgtl5000_dt_ids[] = {
 	{ .compatible = "fsl,imx-audio-sgtl5000", },
 	{ /* sentinel */ }
@@ -214,7 +205,6 @@ static struct platform_driver imx_sgtl5000_driver = {
 		.of_match_table = imx_sgtl5000_dt_ids,
 	},
 	.probe = imx_sgtl5000_probe,
-	.remove = imx_sgtl5000_remove,
 };
 module_platform_driver(imx_sgtl5000_driver);
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261104-imx-sgtl5000-cleanup-371e704e5de6

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>

