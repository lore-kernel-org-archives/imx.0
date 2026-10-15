Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD8A311C36
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 01:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028873; cv=none; b=Wxi1CuKhKgLEHyvtkeLNw+zK4mTj3B/AaDfKZYr+XFykZWseXdZ+2fjsVkEjEB6wSe27W02kqWHeHnfsRswgaPU8ykCkjPGnmoTgIdzFCh10TKHOXr8aJDXN7JOHE5QB3x0wFbV7tDXh/msfMC+9vo+Wt1GFEuIT9osCWiOuvRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028873; c=relaxed/simple;
	bh=lTLKa+91g0xBOu/fagB1HB+X80BcBi+hkbX2nHYkS5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b/3htilYmaTNXypI1gHP9Q7bfKA+E4I6WKAcxidKvb5Uj9b4j8lZcLXxwIvMKEQcF297srJTOLSkmzD0OxFkMZLsRwNmFRzFXtUelmKpUz5q0YwlPVFwC83qTY0yfDIR+PXygDYVAIcLHEsXBhjoJdQqSCrKKb1O5W2ZKAA3Oqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pvdhsz9J; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pvdhsz9J"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2dd76b1361dso11009115ad.1
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 18:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028871; x=1792633671; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r52r7lHoOPMhC++VZB/BAS85K3dCRyowF6eP319pd4Y=;
        b=pvdhsz9J4glgUHxGljjD3uPjtCbn3yPR+e0yv+GDK6tTBoZY1eSCgAvqgnN3Xrlsiv
         TYtB1aEonYwNWw0B246VcsyLkVVXvOrlPbNVPGcjJY7INwzrsoDSpLTTYVLWA0ttasj2
         L6gEJzxy2HmfPzybajlmjyearYbYna4CCwRmEDEl3QbWoqCbRFXGOyDsrWsxkMWfgt7D
         5aBvqXt6vuqw2xsexBqAhYIUQb7t1j3HCHaaCUMb73YjjvjeE/p6kuYDgZAzQmA258f3
         sCEVa964ea4m+FMrs5brbNz2+9py/5C6ejrw+ZBThHpxrynHFqG5S2BFG0K78Ot6rWeK
         gDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028871; x=1792633671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r52r7lHoOPMhC++VZB/BAS85K3dCRyowF6eP319pd4Y=;
        b=aGxFBZp2aTsUagKrpAcIdeKDw9/w2d9sgYebXHwSDVQIpZGUZpM5/h+v/JSdCaMeQm
         wDMGDa+KqsJRU2xZeIh4diWHq8N+aN2g5KZoivHJFSpA2xKKS2IfwukHTTPFZlyHDZ4A
         qTf9LtHsAGsICdByNTKWWC0HlzW6RsQcm+JKhJDalv+zFB7aQU84SmzEo7gJTCcPR2JL
         HPk9qzbj4zTVYl7SfpiLophBmtLPIg6gkwS+/cNOw+6uxi3Z4WQoRgQKHClXwKx5tm7V
         Ix4roeqah4Va+UqD3byuBGA+qDqWWwFVDHOz4+opPypfmUk9hGNWSgU+ONBazSwvFu60
         rHeQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5ANk2n/No669NsEsnDrtUFcFy4//JMI9uYpdZ+UnFFKIQQD2F6CTk1lMQbTwvoN5P6yA=@lists.linux.dev
X-Gm-Message-State: AFq9FYKkvcgmFo+zPMall5ftE33yZMRgHSS+M20fDR5Pnh4s46/MVyCZ
	mJ0kHcfi/4E8c2zeYXs+jdDF7wTafRFv5zxlwJI3tmlcgichJ+2YIF52
X-Gm-Gg: AYBFou10UG4Sezx2JjZLyxpq6t4MnfuDlRnVXCDMgnfRdQC6QHld+XjyI3AI57xxO27
	YkMUOe/Kv63GJGodyG774qFSEALADx0PRN7ynZ1UgMOWZFCJ2A99Teaa3ItH1O2jiO5x5NAm+jd
	tuPfMoLXFuZdmxdKwuXSRlkE+i5eoZPViuosdEKrg4BOn/9mH1MYSZQxUt9Un3rv01h3X44n6D1
	ZfFKSh7vCsxpXIGOOl6SQyNxNooQo64WhG/tMS5bCfK6ZpvDlYKMAu2lGZz+UkzceaH9IuaA2z4
	5MyYseRV3Gkk73YXIn2jRzeOm94GOqtgJzQNTDaGhQeDMlLPDZ4Nvyz/PeSFLamGc4xsj9h/Q2h
	3oSwf0Y0yOyBk85MhMrJBl7HTa34FQl6OY+m27Pt6m4sPSLemz9mz5uajqYc0GutYVVvT/A0QZO
	l3bCp30umeQCKS6k7g5WGtTPA29vwQ/2VjYmkcs69gE62lYuuzNnAZ4RuC/0KhZOb7ulIjGt02t
	HkqRZMx+q4ScIwh1ZJVc/PjQtvm8pl/0Lzurb7YG8D7E3Sju2Yt8Zqc83NpLo+57uamKp6Tf6Af
	Bdq919cki6MpedY=
X-Received: by 2002:a17:902:d4c9:b0:2e2:dbf6:3744 with SMTP id d9443c01a7336-2e842ce7d6fmr143717775ad.42.1792028871192;
        Wed, 14 Oct 2026 18:47:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:47:50 -0700 (PDT)
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
Subject: [PATCH v2 14/25] ASoC: codecs: nau8824: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:13 +0700
Message-ID: <20261015014324.5569-15-phucduc.bui@gmail.com>
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
from nau8824_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as nau8824_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/nau8824.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index 853eb9472af9..046cce9192b7 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -1061,14 +1061,24 @@ static int nau8824_dai_startup(struct snd_pcm_substream *substream,
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
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked as started.
+	 */
+	return 0;
 }
 
 static int nau8824_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

