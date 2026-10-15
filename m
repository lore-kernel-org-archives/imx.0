Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0852F39B5
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 01:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028857; cv=none; b=tn+6Y9jYVGD9fJeom/WbcM3x5UpTkoDAQnMRy0kt4eAhWbxoH2p4gcdRzsV3fpgUDmCYjm15yMiq70BALKREiIkj1upBC+6L5mDHBQ76S+lLq2hhU/trjf0Kazldp4KAhF/ON6z/lwDLzHQb3Ra+BTgaUU4j0SYlQ8J5ohTRtiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028857; c=relaxed/simple;
	bh=gbKxRXgxq8DVqFsIIwbQbc//22j1RiqNWHX1MLDGpQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HIGkqH5C6bnqoXYs6cFcJxW/b8VzoOaw6vJd4PdIV8Zt5DwUrFHb0YBqRxF+cYFHVIyXW7vPu1PH7HGqeYSLw05LkpCRUypQxDydigc3RAdDk1JWFs91Ct6aHU9wmIQQ3A6ovAQNIFtRqVCtesscwlyf9yisPqwHd5d9reFrGoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0wJiLwo; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0wJiLwo"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e8fe8e343fso18310025ad.2
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 18:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028855; x=1792633655; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvYpMSlsoaD702JqdWz6T2bQ1dialbnMpsVm+cSYlj4=;
        b=I0wJiLwoInljfw64YYx/Kll6VugXOFLE6+cBwsWAqCfkkXIhVfxcijNyLPpDIRxNmI
         0zr00Z7a0JFWL9gWpyThkktHVdW3T3EFZa/j9ZSsphu8YqaN/S0uDsOm2CHkNLs8jcKD
         QgxUG/NzXzToCjFm1YSQOPgQy51qIiF8IbbA3jn1+mKGcHLjou9iGlFplXSNbESDoVVL
         QKXDQlQmz6er7oH1hnES39yvt8o8nxQQzjswmR57vV+gTYWcZ0EqszX8zZe8Fd9gcVUS
         M8B9nVokFXAzp09yAKV+YQNH+jxsfd+t9mNg+ARxW3tX57Dae9Tfv26hpWR/6+OprZpj
         uEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028855; x=1792633655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qvYpMSlsoaD702JqdWz6T2bQ1dialbnMpsVm+cSYlj4=;
        b=tJEnhygC82lDpzzvNjTOGnfI+4ABBOC/3wZUupt1ILaTP3sWM0+YD8xgLQe+lBaBDQ
         SgK2OTLO5EWjkRfS2rrA6TXKC3G98JyZ5d00+o6i8fGVtKe7q1AvlvA65+BGy+H3lZlE
         vjEfaYwSAEimRiTdjSPtngjhGPKCsQgiTR2roiQQeLCxzWAMgpObbjGuiq5mUKNBCIiH
         iRnkjE6iDiufiktF86TcfBSBKWUtgaVXASZ66BbsWcyo3FoyWV5XgNVQFeDId27AxJ5M
         CjiDU8jjRF5rBPV0RJLcKLDGw6osTrJWUFJbQyB1vDOFPgu5n0/71ImY32/9mx0ELDNi
         G/jA==
X-Forwarded-Encrypted: i=1; AKwUvByQZfTZaAZjPcmH6lmO7fGiG3S6hl33XAuy5Z7NuP4LUr++xa2hcFimHAy0YX44nQAZhjM=@lists.linux.dev
X-Gm-Message-State: AFq9FYLaYxjvY5dwRAvYYs4eqVydAnvgDrxK//QmkMd8Oc5o0Mghoih8
	q5mDYRnRhjRTehcW3ptRvGVI9jAlu8fbuk/1fzwwgXa9MAkJX+Af8ExC
X-Gm-Gg: AYBFou06MQE0CySEGM0ITNtqZZiB4Jgttegvpo7EMTGJG0eJvEZjFGhXEo+MLTeO7/I
	tPpZwqzybQpbwkVtctrALpAFEkkmyS67eO1DctSdzFLveF8OhhXfW8yJCX+yFAxVTeA8FRG8/ca
	G/u67T4v2UGLayMHO9+P6wNy89u2FMzdvP3ZsGrCLLjxvMC4fugjrTFkG2EYazQWN1VtpInCr4u
	g5khUj4ovl6g6/QeS85TFkwDNkmNOD50sPiDL3aNIL8q5inrDW3H4E2NmholXKEohsaScJ3STjL
	794/fhcgeEZwrfvkcQx9c27XH2OvDQso3UeNtJhRVC76BbJIKMCY+u4n3TUB9/2lMyJBvWBOON7
	kkFDiRrSc9rA0B+OyRWsUc9D97wZLR3zo67FUBBW6vJKv1bpd2e5ZLBreXNn73GC7CwElJRrhLP
	QRo9Uh2lGEuTK8xSv3md4l8OWjuLbImaJdbTK0tPPkVSpN9ioR5Atx+39AS04czECpdv6MjFcUP
	ZbUg+hrDXynhg8yRUiyBibmkgqPRjsWEVZ+C9/uFuLX88gYtN5Fd3FvEwqZesxI5tSvwCy6cB7s
	84kwWwgGphQnPw==
X-Received: by 2002:a17:903:2442:b0:2e8:422e:19c5 with SMTP id d9443c01a7336-2e842dfd28emr133980465ad.55.1792028855139;
        Wed, 14 Oct 2026 18:47:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:47:34 -0700 (PDT)
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
Subject: [PATCH v2 13/25] ASoC: codecs: nau8821: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:12 +0700
Message-ID: <20261015014324.5569-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015014324.5569-1-phucduc.bui@gmail.com>
References: <20261015014324.5569-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_minmax() may return 1, which is then returned
from nau8821_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as nau8821_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/nau8821.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index ecadbaee1037..7b88ee3159d1 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -829,14 +829,24 @@ static int nau8821_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
 	const struct nau8821_osr_attr *osr;
+	int ret;
 
 	osr = nau8821_get_osr(nau8821, substream->stream);
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
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked as started.
+	 */
+	return 0;
 }
 
 static int nau8821_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

