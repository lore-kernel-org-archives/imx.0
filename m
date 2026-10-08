Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8511A4973BE
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 10:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456097; cv=none; b=ko/K+dCWbr1Qek77h6uqD1pkeQNgR5BJzp1kP615qpYM/+MnyFcpdhvDFEpce1d+y7khgdXFQhEhZRYbN3Y8b02F8U+dnIuKKNzhIIj4fvBI3Eu5dW8o/QKilPD2dW0fmzTlUAQQeoNNTnZWGRne3lqPA6c/++B/ApJyzKLqiLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456097; c=relaxed/simple;
	bh=8WzS97708KAARSjGgVArWT8GbYPNjIQBiN6ygCWPQv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IqS/zwhhCtS+UvRqNFiHFVo1xL1aMlUZQ/WEWs7CI643Qk44TswATg/KxSW7hUaLzZAeJgGMs1h+ZmbcIhaMOQd+euXttKMuO+oZumXJ0X2p8q1b/x4GyfoyhJsMjSNJPx6phdEJ/DaiUt66/73Ywo6cCKKNRzSSmuQo1kD2j4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qjz3YRjh; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qjz3YRjh"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35120d43ecaso7721181eec.1
        for <imx@lists.linux.dev>; Thu, 08 Oct 2026 03:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456095; x=1792060895; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/S64Lx6xVOJYbkzotXNTKtSzFgcjJur08r/Jkt4vOs=;
        b=qjz3YRjhlCqYHibcO53zQO5snAwNYqhDjYgDZ4F4LgyiDr6IsHphrsea+yWTpu9TgJ
         xbUJClKt+pDqWPf/KRRWCLvoTm29Wu3ixezyVMZXKDbQXp7kQE3NNapzYVwAX5NzMHU9
         2srZhKAwpT+3JPdwEfzhz/9MktYARAtsuSlRvX2KbyHg7lWv5QN2PklYFP8VFOGIOUBr
         jjJneZwczjTQB0HJ81jY7YiDBNI39XIKvQauzeUTbj/JWVwOhzTndyu5ZK/fkjMcwT5h
         Ub+maSG7XR15T/+GMGm4FRj0b7J/JCNmjfGr1hJLDuwsLXyFt7Qhdus4+LxyzIras/mM
         lL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456095; x=1792060895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v/S64Lx6xVOJYbkzotXNTKtSzFgcjJur08r/Jkt4vOs=;
        b=W/aGukLMTEaD1kVj+VCFRfI9uJ9NEICTAKGoWTTxHtSA/rcU3pWxDNQUzY7VwgpBpO
         phgh4hnJ5lO7+DEktMpu3X7O0+GrbtNcq/fdwJXOFgKtKCqYw22N0/ry+X0AXGqF4xjr
         JaguUz8n2nU5zu2TsMKsWqbNp8DwjD/UGXET871M1UDYAGJUFsQ4MgjoEsHlw3iPTAeV
         gKSuMUm5pp3WKnIAaQ9a9GgU+PI3uANL0ywBs+mHPUU/N4szVNBAmct78AHHfudp4SdR
         JC0vaDJGNLel02Dokf1NE9c5OAZ6YpP6jXw8fW1xj0lQdMLQEzYGllXA3FQ2nxLFTY2m
         jjzw==
X-Forwarded-Encrypted: i=1; AKwUvBw5WPthcMoN0FyvJR8wpIS6V/c5gx05GmgpwEHMRjgEG+lUDPsPpoyjeolZ4G2/PyVvv+I=@lists.linux.dev
X-Gm-Message-State: AFuF++ngoglP06cnY29hO+P2JgycShmttmiSF4JWJ2/C2S5XlUs6fx/+
	bIL5vCJRu3lwC2yo9iE0yoJcIxBm0FMd3OGpALdXeAR+lG2MQ+AN2CZd
X-Gm-Gg: AYBFou155LXtUVT3aTCbPkjkCxqAaZngTo1PXiIOAfdglZVwF+VTMcj3T22WrILQ6Dw
	Yv/pDQlzwhWel5g6PRiHYFurpmwkd7EaI+oO1en/f25jkjegJYDF09XXunc8Q90P1BsfqOAm54z
	7wsMIvOlr7qs6VpG/Rhtp/CSKf+zGRAdfUL9ounFLGnYeDWG34MJzIzOeEnjJOr6a1WUS5XmIBq
	TxavJHDodGgRNdHGeU/+7xphAB0T6TVnAQh9yr5XamGKhlGiPpX4O1e/KU8vHWM8XaDmzFo/LzQ
	Ah5Hn6OMg4FThzsJ2EFo93GG43nnnfQBvFi3rMMfGmMyLAhlj35ELXervJJ/aJGe0HuQuoAZt/0
	RPxBY1e0vDIKovNPYSB1/MuL1iCAn+RZ+GNT0/Z7pTn3Dewgspl8YQI3eIn/0M821Rdr00eNvt4
	lryiwS9kY6N1DpnMLeoNFgQXB6XEMZhfi2LhejQa2ST76hnJUOz4XuLspZwIJh1MsDrZWSak2MY
	qBZ8hzO+qCJWMEK0mzzJzRDcNasud5gSAhrgzV5AQJmfAOejRAsnMVAroCs1KYUBMAwInLRlDi5
	qgluqI2hDbM6aA==
X-Received: by 2002:a05:693c:895c:10b0:34c:7e54:65e6 with SMTP id 5a478bee46e88-3515db9c59bmr5695422eec.5.1791456094502;
        Thu, 08 Oct 2026 03:41:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:41:33 -0700 (PDT)
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
Subject: [PATCH 10/24] ASoC: codecs: cs42l42: Ensure the DAI is marked as started on success
Date: Thu,  8 Oct 2026 17:38:17 +0700
Message-ID: <20261008103831.542533-11-phucduc.bui@gmail.com>
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
from cs42l42_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as cs42l42_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs42l42.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index b5d69d5516a6..f6e4bf6206b7 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -890,6 +890,7 @@ static int cs42l42_dai_startup(struct snd_pcm_substream *substream, struct snd_s
 {
 	struct snd_soc_component *component = dai->component;
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	/*
 	 * Sample rates < 44.1 kHz would produce an out-of-range SCLK with
@@ -900,9 +901,13 @@ static int cs42l42_dai_startup(struct snd_pcm_substream *substream, struct snd_s
 		return 0;
 
 	/* Machine driver has not set a SCLK, limit bottom end to 44.1 kHz */
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_RATE,
-					    44100, 96000);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_RATE,
+					   44100, 96000);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

