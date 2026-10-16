Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14EC3890F8
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 04:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123912; cv=none; b=HhxZNft6Bxw3SYInMGBrKYa0k0Mm3hrjAN61eFDfRk2hwDyn0pFa5y4S5W9Xeb2eZx1giWZaDfHAyefFZ69O0ipZFQYlTsb9tK5zk1RlsyKUkKsp90fG3RN1QFe3O2wF84QHNLNZAjSa9h6MaeadAOPyAs6neJqAaYpsHRxV8Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123912; c=relaxed/simple;
	bh=4ChQc4DpaiRpFVYZQOX6JdbhBOh/CN3kyOWjnYuDL7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GQ8bXvPw7vDexLKzg57EfD60yGyBDrTFdNSaMXfCH0nMOeilGmMeddop8r+x8OAe499p8Hd7bysuIKjwD/085DoFK+fuTLEPlkAaHhk4A1c+nc+RZNa8UiB43UQpd8qGdywGUXKMonIpaX1BOP+2HLITYWxIbG4nYeBAUPoYFeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7C3b7hc; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7C3b7hc"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d6e954afbdso13640805ad.2
        for <imx@lists.linux.dev>; Thu, 15 Oct 2026 21:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123910; x=1792728710; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DnS3efznOy4aR/sEoOKiH1O7kNcA8JAEG4dTp1VvwAA=;
        b=e7C3b7hcq+BCPXHUHAbTbTn40WOrKpyxZ++XJoq5gx67YZ7+sDhlxDfB7i8bi1S6ne
         vBd3vOznDEMKyCejB4MJREfvTdn43ylWbkfPcWmn6Q62pJK0i56l194GlnVQZ+7Vdy32
         18GGHWP5liXMng+QH5SNcjF1xCsSlqPi5XSn/ZR9hfdZYFGZwRgiwmVQdZtHy9Q2vBsS
         TN4DQZ1MS6pZzlaNiGDfC44Q3qyRK/NheBMm3VAnsPltb0qtRlJ+/axk9lkjtVu/QZ1j
         ZFUNkImtt4OTAz+wcZXxYpTnqCRWe4g8h/uVHASEptg4ezGq2AvKiXOIBJmGSIKLC/h7
         Gm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123910; x=1792728710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DnS3efznOy4aR/sEoOKiH1O7kNcA8JAEG4dTp1VvwAA=;
        b=gssthH4Zw+Se5NE4fas7NIaOmQSBU94qk22eDerEpgGmMHFCW1B9rL+RrtvuS1/f96
         9C1j1kwSyx4cgAI6/I9P5YNJsssoHzsISFI3Rr2+q7NkAMfNQBc8hFRpjjPNQ0LtRNzK
         0C+kpUKuWTZEe4KGWQJ/+qtj5UXOgAOER1KCDyww81tmjXXpKAIllfBhr5CqBlfotVe2
         BM7bmj5JFPyTI78xVQTzalKfUy7m1LnAa7r0S2/3VFOoaZ/AUQr9e7IFhZJxfAK27kmN
         sAEccLSs09c/cFgjVOziMPcu82D+K0gpNd0HO7qQ27OxOJA51rVoUtZ0b9q301MQwSTX
         ZsbA==
X-Forwarded-Encrypted: i=1; AKwUvBxJMhymZLpzi5saecUq/iwZy89aSl2dJT6XkiSWOWBaAxDQF2EnmFkjyzgFF1K+crKAV2c=@lists.linux.dev
X-Gm-Message-State: AFq9FYI9+GndffhFm3UIjE51Jh2tyvuuro80WlrvzLG8ldEsXiEdPJw9
	SbxXa0/0+vV8RG8Z7p8QUwX5x+O4kQkCl/hYNkFP5RAf/TSdYWDyGP8w
X-Gm-Gg: AYBFou0SVGnogwoFY9TLd8fgtpLHerVwEdvqhJUWJ0/gXbW103w9PYSbet4K43O1gKo
	05MHUexwpkPpcTarWM8gne2CCzMw/D0eFB0PfJcra7t8UmTekm9ruXAifiAt9kZcHxpElX+wFof
	XCkGkCgBomEDw9ZdCopaQ+b7+DMmWPJ9aNsfYD2MBHtA5NHlqF1R0MDilG3teJvNbfMWF9MgoE4
	4GsTVsrLqBIXXY+TSsUNNwkvZp2mX8JFfew6ZbmryxhGrp7hKs30R87/5Xx+uOcAX1KeFYYXuD+
	RQw6lQjgo6tKBTKQdUkAEH41WqkTRh6DxR/Dyvvgk9XmbGO6tk4Ww/CEA1ULoBsowcLiX/MrOOS
	wZ+T4ZB5h/CLV49A/yXmbXULHcK37E8bWT+wuYGD/6mof9pAlnTS+eK5oedBUH4oiLRM/Gi0D/q
	Y2WREyTRf56sAZUHJyrFY88a98R3FODpN91nNltFFKqy1Tk5e/eaZqVs1BM4pD5PGgez5tG7EvB
	+04GFTK3QrAqzUr16bUucHsBPSKW4VFmgPk3AvbBt0pjSmGwZPEG5W6eFzr+rSGtP4/x2wWeXUH
	hfAOM6L/tyObxQ==
X-Received: by 2002:a17:903:38c4:b0:2dd:c100:4257 with SMTP id d9443c01a7336-2e842f11875mr181177615ad.59.1792123910214;
        Thu, 15 Oct 2026 21:11:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:11:49 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	povik+lin@cutebit.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>,
	Syed Saba Kareem <syed.sabakareem@amd.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Neo Chang <YLCHANG2@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	u.kleine-koenig@baylibre.com,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Md Shofiqul Islam <shofiqtest@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Zain Aboobacker <zainaboobacker33@gmail.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Bo Shen <voice.shen@atmel.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-sound@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 08/11] ASoC: renesas: msiof: Remove redundant period constraint
Date: Fri, 16 Oct 2026 11:09:43 +0700
Message-ID: <20261016040946.521195-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016040946.521195-1-phucduc.bui@gmail.com>
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() is already called by
snd_dmaengine_pcm_open(). Calling it again in msiof_open() is
unnecessary, as the constraint is already applied and the second
call returns 0.

Remove the redundant constraint call.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/rcar/msiof.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index 9fead9a22cdc..11a6f22ec0ad 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -419,19 +419,13 @@ static int msiof_open(struct snd_soc_component *component,
 		return PTR_ERR(chan);
 
 	ret = snd_dmaengine_pcm_open(substream, chan);
-	if (ret < 0)
-		goto open_err_dma;
-
-	snd_soc_set_runtime_hwparams(substream, &msiof_pcm_hardware);
-
-	ret = snd_pcm_hw_constraint_integer(substream->runtime, SNDRV_PCM_HW_PARAM_PERIODS);
-
-open_err_dma:
 	if (ret < 0) {
 		dma_release_channel(chan);
 		return ret;
 	}
 
+	snd_soc_set_runtime_hwparams(substream, &msiof_pcm_hardware);
+
 	return 0;
 }
 
-- 
2.43.0

