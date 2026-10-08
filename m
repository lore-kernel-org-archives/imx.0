Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB934973AB
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 10:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456173; cv=none; b=Y/d5os0X26BJziBHZ+F7ROXHSGPsOQMlJLj2vGGMMq6pnNVat5ULlw2jFzyq+dHdMCxC3JvxJ3LHp37xQ44jtI0TtZHmqr5K0HkFI7i8BY5w4bwPknoklIBYSdg2qEZ+2HOrH7qO7+bV57vN5Sic7aHWD7yTK/hSfzQ3IrdU8z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456173; c=relaxed/simple;
	bh=5gdHEOl1guP3lKSItABKnxUiFa7+ruLS9jKThkThl7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=agUyV0fqpPDIB7mMXBum2yuOx2Cl0RpOnhYYpCRPrKj3UuWy5L1P2pI6BNnYGaikeTTMtJMuzihI//nN62WLJkeo7JnBitkOHR51YQzIlQ5v8NtLPvNiOsXvIbQd00IxNT0iQI2Y7coA0ugZqJ5RqyNjpTaJc4hbVLprnLz5xBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oriS/IEK; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oriS/IEK"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3515f9a5d25so4191763eec.0
        for <imx@lists.linux.dev>; Thu, 08 Oct 2026 03:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456171; x=1792060971; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzYVoHEdz3P+bsZXHKAJVN1yBKjLyzB0nPd+jwADmvw=;
        b=oriS/IEKe1oszP2VngtgfBMP/1bmF9b0dcJfOEhD1sLqVTfae4hBxd41RM6Lpm5dQC
         Tog2kJq6pewznYr91lPmGP8FP3LPDpQy0q8CKrAGtXQt2c5FPiT7nrmQC7eMzD+QagmK
         7Kb4Lyfwc4jVzj+68rKz/3PZ9x1S//5ImF/7VuZzM8aVcCh+/Slh/xMaRPBfqkd1rzdB
         QBkGtmE/FKIFh5N0JKB7HMJ10AKOJDXd20NQ+s4hWb53bV7FbXCfpLrywLSssJudNDI9
         l5ptSZSteidFN/JwgpqrmAmYzVhezNkpTCmVztBfLZIJljZDErijvOsKmlqYVMe7g9Ug
         +krA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456171; x=1792060971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xzYVoHEdz3P+bsZXHKAJVN1yBKjLyzB0nPd+jwADmvw=;
        b=YHn6tnOt1FJCE2B3mafDItSkDZMwKJLAumnKWhOpC9+9Qmib0BMku7sZnbTsi4eGcG
         ZW4Jrq8nKihuw5xnxZgUROY2yd1XNjbMB7ejzTNNfPazxz/kb952q3xIk5GvXdjrV12Y
         5jko8TitpZCr36/WPHqZEeF1y8eVOTOejhs2W63LWSpiahcEytC1IoFQpN6U48U5wjNU
         h0vWtrh4UR2MtwK3HymADQPW+4Nq2+Ri6kMFc+3QsO3hqJKQ6oErA7rAQiE18oFuGBXM
         q84lwGIOOOTtPLSx+lpunhxsUZt8DmlPpsqN7cg3oVj5nZtoeqgum/kjUlnETeyet6LA
         4uEQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5rl/9UeE9eH2aPVZ6ZI9dkhBCWOxrauLRqsMdUEaVI96fAU74I/sOLUHyPTHYm10vr7o=@lists.linux.dev
X-Gm-Message-State: AFuF++kXTs3oFcvoGQwGnCinNT12OEf6CEAWEUErsjrGDF6Ci0poVzWW
	8IPFWQV/gTGZEeroyA+cSulD52oh8vIHyPAELoBflji3zNIjYo+/ZtJn
X-Gm-Gg: AYBFou2jcuSTAoD7mCQ8y1kT/0kbjyBMi17nK5eMR+Tqn1MfzyuOqSYPjwNYY+otxWF
	mGbGh34t0Dv0y5nl6HfFsR/fIwjnL34TYF8DJ+QB4IYJIFKbTZsnJgMio8elkUgmkms8f/lYCX8
	7FybOxI/wkCg9rBJALOPGEth1P4Yrp+5hGtzZW0WbVJABtv09ISJC7Rt2p/lrHRKHobGJY2F14L
	AFYhf6jhUC27bHOxru+zvkhxsy1RDemkzAl+Jr3NgkPWuWvdR7tChdZLXwP3MbbUbWd1sfRLuRz
	tRM4KQCsly/rJFp5TSFyEevXKbg214a1t0ZQCOoi9FOl4Gsq5zldtD7ie/is6NzYlwbOv/oW5OJ
	6w/a2ZMdEF12tcOJx/5koLsdmENSo6Bt1I2ivio5/b4aZJWBlHp/3UjSJYwwI8VGin1SMPfH/Nm
	Us2oLYT8eGkSXeIzNXSRIN4l8htkXJOxVv2xLUI9b/Jd0hBe1qwuxMFCqTzixdXIKUvJ4p0vrE9
	n0twSmdAYguQMDSSt+0CZvjuZw/cCdH7AISwCG8fhbMrmVKC9pz7NCEdJcQ3K6/AIcCYZtgTESB
	rsq5mQ3KgJl9vA==
X-Received: by 2002:a05:7301:8617:b0:351:11aa:5d5b with SMTP id 5a478bee46e88-3515dde8bbbmr5895512eec.19.1791456170565;
        Thu, 08 Oct 2026 03:42:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:42:50 -0700 (PDT)
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
Subject: [PATCH 15/24] ASoC: codecs: nau8825: Ensure the DAI is marked as started on success
Date: Thu,  8 Oct 2026 17:38:22 +0700
Message-ID: <20261008103831.542533-16-phucduc.bui@gmail.com>
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
from nau8825_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as nau8825_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/nau8825.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index 63d927f31409..10bbfbb460b1 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -1261,14 +1261,19 @@ static int nau8825_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct nau8825 *nau8825 = snd_soc_component_get_drvdata(component);
 	const struct nau8825_osr_attr *osr;
+	int ret;
 
 	osr = nau8825_get_osr(nau8825, substream->stream);
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
 
 static int nau8825_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

