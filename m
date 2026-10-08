Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EB7493D3B
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 10:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456156; cv=none; b=BnKgeV0SyWvBU+wXmKlKuP6vrTKfZQMIYysRwc58UNwfkrmPz5jJjcwtWdaaxaEFKk6n2os83JFE5icroT9PxWLwAPDFoIp99CnlaOZIJWwTfnhpHvZqfquE1MjAZzariWqyq9XqWu8nzzB+dLPLFDSzkHe46AokIhatFPUSSlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456156; c=relaxed/simple;
	bh=jz760ztqgga0RO/+vAvDuVyLPPNpmX23pq1M+Bivpxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fU5efp+hEe0e3JJUO366XpX+hwgNaplDkTPgoWebk8lmvGb8zF/V8gt8d6+wFYzoU/0crpu+JbB9rqihVgbatpYUyTk2f7oQlDMC0kL5Ih2p+0UUtNeiN4+D9mHtG9DcfGN7KRKuYSuG7WwYkAs2H3X9xrHTvkcxnAlcCaw2YB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nu+eUiAB; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nu+eUiAB"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33fb4680717so892123eec.1
        for <imx@lists.linux.dev>; Thu, 08 Oct 2026 03:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456155; x=1792060955; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uc00trQPX7RuBM3kvjd0hrBbedJ5QhnOwvfpAMsSqmQ=;
        b=Nu+eUiAB2t82C4Xm7MklhKF9pY8m1kpG0dw+dF76eG88GRGqH1cNp2MasL0cNNLgzV
         Gr1aiZdxajWPHb4WKB7yg8mHWpVD7XT+4VhR81YQrU92tJRPZwiJcW4Adxs/RUD5RSOW
         cYsyV7Q4SoOtQ9z7oYAhCEg183D+RcL58j+gkia4w9b72UWa16igpvSOHiX/Iulef+2f
         c94XSrvIqDJJtvZDmh4Pi9F7tcg6bDaZ/duIch0XJn2de3S4LMGqQbwlXnt93z8W7bNM
         OpX5DhKIG19sAgQKK/eOLQzlvwmJh/YOEggc2bne0k9jMsa1RS3mJT07Vt4mUIAC+Hb6
         i+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456155; x=1792060955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uc00trQPX7RuBM3kvjd0hrBbedJ5QhnOwvfpAMsSqmQ=;
        b=IwBALPq76Eua0dbMTcqDB/Fokf0JtIUtixnzQrebSL+Y2z7md8qcJG+UPRZCjGMbss
         KEEIMkB1gENjfbEpkvGv8R1mqoJ4z24DJvOqB5emP07JHATA3xERVVp3PF44GILK/Tih
         nCo55TI1zZZi3i/FeoG7uAzXIndRg49YQVeMBFHRRASi+bxmltd/C6XqnXJGA13Xov9s
         f0Nx4eiik4QgXj/1kDg5gBm0uR48/dXA0dHh091Elt0EFh8RPt113uTb+B+evV9/igjq
         kiXoGZTVwjP3B6phLj/UZKpUtEGC96Vn23sgrUdDDQDpL2hKjoR8W1Q18BvddUnaCSps
         GTtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRjYRC05sdo9GY788yzZvuzcqnCH9jkaEuu1Rb21A3OUzkZnhVJnakf8/bRq5ykguxS0o=@lists.linux.dev
X-Gm-Message-State: AFuF++lFISfLUbN912AqLkztQhjtN1WnqdSPbeusfnVmxT0b5oOIYd1B
	/MCZunauUUzHX2iUZjvL5H0WXvyfHp+Kabhb9fqeSQcqGSLJDF+gomAr
X-Gm-Gg: AYBFou1qnkE1u8zNYpQw8zvRI2BaRV5bp+LN4hCIztXZmrqsCOw8fV0XQ7I0F4DhMrF
	F/5BD2pyrKVl1i5LWG9EQTMvTBcgJArllzX1s7sLWn9kF6i851Xm7PmD9NtNtVwflI7BgrwejzA
	N2Cxb9yLeuoRavTYtWZJtsnM53RBLVbV3GCRNhap5mLKILw8EP+mFzzw/Cmnrzg77ZCwjrvFEdw
	vGYfPX3m0trLKs0wkCBHGWqsazsXyXcrOvlHJM1X/LCtBB5wNYSW0VqLNpkjITg2aZp914lr8aZ
	UDcFQIPtOp3mZbXX2vk+vA2km6japzW3NsowHxRxc5SgFZjBs2gDDtvByfZLHd/Xp+xunvnFuEA
	ztnhvRiJFC3/tBKPHfMuK/Be8uABX5U9YcEPYpI37EMX6acwRPvv50iQvyU8xDa8eCP5+hox3q7
	1NA7qS1faLCAelLqICG3RNzy9ZzSf1yzATTvpJElDk6n8XrVdDM9TYstT/ndaJHrMLNq2iMIDAa
	c0fdLywjPoLiHyY7jQaFT5RyFkC7kEEJ6Hs4+6ehc6sEgMZa0MdBPdeWUJ5k1ac/v165SNP47K1
	V5Vnxp8627KB6A==
X-Received: by 2002:a05:7301:d194:b0:351:28eb:8cd8 with SMTP id 5a478bee46e88-3515ddee11cmr6279341eec.18.1791456154501;
        Thu, 08 Oct 2026 03:42:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:42:33 -0700 (PDT)
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
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
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
Subject: [PATCH 14/24] ASoC: codecs: nau8824: Ensure the DAI is marked as started on success
Date: Thu,  8 Oct 2026 17:38:21 +0700
Message-ID: <20261008103831.542533-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008103831.542533-1-phucduc.bui@gmail.com>
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_minmax() may return 1, which is then returned
from nau8824_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as nau8824_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/nau8824.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index 853eb9472af9..c89889aa420e 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -1061,14 +1061,19 @@ static int nau8824_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct nau8824 *nau8824 = snd_soc_component_get_drvdata(component);
 	const struct nau8824_osr_attr *osr;
+	int ret;
 
 	osr = nau8824_get_osr(nau8824, substream->stream);
 	if (!osr || !osr->osr)
 		return -EINVAL;
 
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_RATE,
-					    0, CLK_DA_AD_MAX / osr->osr);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_RATE,
+					   0, CLK_DA_AD_MAX / osr->osr);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int nau8824_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

