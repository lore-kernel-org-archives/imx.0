Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FB7486437
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 10:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456282; cv=none; b=Cl0rcPm9JqQ6xeXitQnT2zgIhzbS43ifrODklJ4R/T/BE6k4YUsSSTCEVQhsIQJgI5BWx9n2hL8LpoYWsLOVRufvtsZ7q0+5HOyYtab+UHIdgw1ItGM5WKop9Z3wrlSGoE29xPOUfw74g/RtJcVtsl84CogTnH99KbNkKw1WhGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456282; c=relaxed/simple;
	bh=/jRAX7L3FDhAWoeg1edR/HgTCfkk5hY6WPOCZODpekU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wh1vss5ADdxY4qm6xk3OJl/zvbLKoGBy9ygxhHN4PtxRv3FGtNTrk6Gw2v4eUrpA+mgBwwYW77Al8EcLpXKkSu3x/SvZK+TmP0zUN+GDti4TNepJj0ch+H+V+Lt+FGMnG9tB4ZGhUFpWF4utYzj1LUvWf2/fUu4iSaeUCd7SAYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r4oMgX+m; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r4oMgX+m"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33fb4680717so896220eec.1
        for <imx@lists.linux.dev>; Thu, 08 Oct 2026 03:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456281; x=1792061081; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vINDjRMMYaX6AakE2nE7lJ054HdL6sHwsDn4uy023fE=;
        b=r4oMgX+mn4NpeRaqCT995Dw9RkpThDv9C2dP1X4xMdFOY1XL7hI8UNHKTW3LrWGKJt
         d8eo1AJqq5KqgydykEWgtmO+PZw3k3hWVKjc7omYnwWi89UaDCeM8Y5RyTk34h8PGxJr
         9lDdjoowIi4m1mVfMEjHF9tG/+w8eVHQFkfEv7DhGOJfNEbb81bsN+hDjxsej1Vjt/Vz
         eBlgS7lYcRm+O0Gc5q7RiEIE2q010aD1ESK7wmrGa5gWm+rdBnGcg6MPxqqicYM8/kKY
         VE25tYRtBUqWuZpLj0j64+BsFCCWVA0lJTmtP0aV+RdvAv6YvIl5niCMfytMC5g0JQdc
         /cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456281; x=1792061081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vINDjRMMYaX6AakE2nE7lJ054HdL6sHwsDn4uy023fE=;
        b=gtKWo2EPSp8oxxQ+wotflaC+MW+8xC1pLwVY37h1Xbi0BugA+/S54NIhxRjv/zCUtz
         X5E8V/JRMMNRHUOeyt1OqHBvbb03bnCqmqme2+yrrVvGlXGqsPcZxsYGrF0EvHA0IdS0
         dO+Tf27kyIvBbgP24Ng3GYgMqDXlp7TuHkKsQQaDTGht3JgvCI0ViiUM9CJkbngTRket
         wppR662hcoi4J80cSHTxNOMjqjE17J4VWHG1TDsRKSjUXQdBNB/Jt2D6pTDm5PqeA1gp
         85BlWOKdYv6x+7agzCSI4OIcqPUd98b83SHyl6F1rwHaR+bdDP02MF4NOOohv3lkg4ko
         7uXg==
X-Forwarded-Encrypted: i=1; AKwUvBwIAT/IhY3nnwhMOLcYKFLQvzGe/fjZdSP9/iJ8w5NP3Tx+xqQHgdGCIe6jjSDj8EXjYFk=@lists.linux.dev
X-Gm-Message-State: AFq9FYJnyTXZaO4brOH3eCzYRevR1w4lWqs9jRddyoYq+qDKHDTE2bVn
	Y5sM7CtwWB0blvI3u5IMdTlgwzi3xL3dXQ55PLSIuAAF+mRHunUlYWXS
X-Gm-Gg: AYBFou0CC5YYxs0pGL5YRXj+yzuzpDL1Oa3Hcf9nXY+hhZ6JYrOREtl0qOo8XLt2Akw
	uEiCM1lusaLZnxT2x+Xkwku3k10Fxq9p+3051L+3iNUvfKwz7i4oCnasfBvV1/VlguZ7kIeIolN
	xwvPz7d0ebn2mrcMDvlsEJK97yT0k1FlmwjjluS/Zbv1NdfwEXyR2mq1bg2S95liZdEsVW3vIY0
	yBTmC+XQo9xR9l67WAti1HfXUGlMAoBRkfs1gQ+QZp01bEtTx9BSgZ+555tJh+ifqiOYBmHwifM
	nx/OP3i0UFpyQqygP1p3jNbkdS6DYfLSbX8u58QdyTwmJoCHuLKoDiMFXTc1+OUO8KBdsialQSj
	DF+bqQvvrceiIa9L5DKveQlJ3LbCbmM2UJ7hDctLhh1qcvid5RXATB6TNm5Yny2ShRxvEy277ZA
	eKrcZ4mOHDIQjReOyme+V+xMX+4oi0bfwxUhs6q+B5KHiInieONZ+0lvMycPoFU1ZPVzd7NUnxu
	367zD6dfeE7lDJe/uiGIox0gpuAx9lpzi8ZGDmrr6dCE4uT0hn/50hnarAKG3H9w9e3sFs9FGnv
	zmYXSOVVSIh7OWRwQV7LW0hZ
X-Received: by 2002:a05:693c:8801:10b0:34d:861c:99b8 with SMTP id 5a478bee46e88-3515de37354mr6607922eec.21.1791456280856;
        Thu, 08 Oct 2026 03:44:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:44:40 -0700 (PDT)
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
Subject: [PATCH 22/24] ASoC: renesas: rz-ssi: Ensure the component is marked as opened on success
Date: Thu,  8 Oct 2026 17:38:29 +0700
Message-ID: <20261008103831.542533-23-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from rz_ssi_pcm_open_xx(). ASoC only marks the component as opened when
.open() returns 0.

This currently has no functional impact, as the component driver has no
.close() callback. Still, return 0 explicitly on success to match what
ASoC expects and ensure the component is correctly marked as opened.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/rz-ssi.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index b1587f499cb8..2e297f721bb6 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -937,17 +937,29 @@ static const struct snd_pcm_hardware rz_ssi_pcm_hardware = {
 static int rz_ssi_pcm_open_pio(struct snd_soc_component *component,
 			       struct snd_pcm_substream *substream)
 {
+	int ret;
+
 	snd_soc_set_runtime_hwparams(substream, &rz_ssi_pcm_hardware);
 
-	return snd_pcm_hw_constraint_integer(substream->runtime,
+	ret = snd_pcm_hw_constraint_integer(substream->runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int rz_ssi_pcm_open_dma(struct snd_soc_component *component,
 			       struct snd_pcm_substream *substream)
 {
-	return snd_pcm_hw_constraint_integer(substream->runtime,
-					     SNDRV_PCM_HW_PARAM_PERIODS);
+	int ret;
+
+	ret = snd_pcm_hw_constraint_integer(substream->runtime,
+					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static snd_pcm_uframes_t rz_ssi_pcm_pointer(struct snd_soc_component *component,
-- 
2.43.0

