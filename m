Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778E1279DC3
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 01:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028931; cv=none; b=TETzqgtc9xVNBHtAu5eVzb8V5i8IttOG9wQZrmRf7CwExifkRQ7YUHXHmFJfiNyEA/ERcgA7ItlBnpTDgmq9UoNqkLMPO2c8L+BVVhyjKXyR3JwW6eJ1ogOohKF8XF0TtBfr2fzId0yjr4oIHsXOVv7nsxWoqekmxXm60zrPcrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028931; c=relaxed/simple;
	bh=6J9ua4kM2AQ1AbmDRprUIZcBpH1X+E/0V7ZxxtKcoOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oUas1/vMErQ4Jew7tn4WTpeuNTOHeZfZTr/W7qczrOvcNtXwYbaiGIZAYU7QCfZLLLKUBeCD/SPJu0IaUAOoMKuWY2NeZT0On5s3KTSRZIlqw2O7Vz+qX8dmQA3YziVelrFJV8lmt5Rak2U7ghn+1M1j+ssacAszW7DHurOQS/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrkbsbKJ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrkbsbKJ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e831e86ebfso8954075ad.1
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 18:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028929; x=1792633729; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yU/tI1b3Chy6tvjhfXj60ZgAk9bekyFoLKnVljFmz1M=;
        b=FrkbsbKJTBzxqWubTNlASlKLmTTyUbIw4DNV3ChGVYbCVy5gK4wlmpFC8fGwYucZ48
         K8up39UudGZQXMRBfSi0pvBAHT/O+/n3GtNyX+Ztyt0sY4T19xjqHBHcrG160bFqGCVo
         AjWSuul+IqK+cu+O/vBxod8D/DPDEQFnPoruIp/KoA7yDMYcZi1rlmdQrxpw3Nc1seL/
         jszYClVFtqqh2cWxSnufDtVOwIaoyXFiSQgGclzdLbsbgS0vccr5Kq+UxnhdzerEuqf2
         fRljTwIiMVGEI3QaNnCwJoHmOzqj0hz0iVnktLCvUGLhAxYgTxtmIGr4l7SmJAKC3MmO
         V08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028929; x=1792633729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yU/tI1b3Chy6tvjhfXj60ZgAk9bekyFoLKnVljFmz1M=;
        b=ogyQsOXffGAIfaStlgNfcMOxx7XV9k75l2ia6iL3zDnY2dghQsaQNk/VAwe5vSUoJf
         y7diiY/rmByR779PFhhsGbdQYGV0mKbj4hQ1f3FVY7mruVHEl9hqHyP0NhZ0ensM75Zl
         nD7mmXnoXKcSfLPFI0MXanN/1RSZ9ewJio+w6ea259AHe0s+lN0MwPtA+yNIZWQqh2kW
         g9a/ITVMOgLzjI7F3M6gNu/hdLwAF91NYl7UrrMPfFvF2AuZbbM4d03nvb3bo8IJ/cdc
         rVWphyO7on0sn9U9Bd4N3XQIX8fTwNr1YS4SAa95aXF6JwHUKKj6K3oeBjoLPnvNjRGh
         +IhA==
X-Forwarded-Encrypted: i=1; AKwUvByaUEWTqBSAqkBD/mLEY6d039MEot/+Dkfws4NFLkBKsHoypaVmfRoOY6DAbZt6+4RXJaE=@lists.linux.dev
X-Gm-Message-State: AFq9FYIj+aOyH2CDQEiAO5jm4cel2ssDZOJ7DAKOF0PNzTqLZjGjCisc
	qhQXz4cKfWZR7X+/AI+ZUlULyZfvuXC1hgYL25GZQ+b2okOTcZbgdbS0
X-Gm-Gg: AYBFou20ucGMrqwbaXCFPTSZD0nS5yWCVB7q67HXA206U6Mrr00SqywVgsAX0oga+mo
	PiThuAAHC7mlo3fvO4rdvXQba6GbQqkF4WONmLpNcvF1WAzIM5OvJbaBXNvJcwCOKGUH/pwde1r
	+o88//VN6zodsdm0fPSQdZXsWiXNK6dtNkLdW9DvO8ZO27rJz9J6MTGpz61up4pp7kt1x/1Ar/e
	ETnxyUlsmUTgl22H6p3j4vtWne5VvichgOkjMofTWF8lo+GBWwnTBrJ0v9ePgda2ug5iqf0jb1m
	YL3+YR3x07fR9RYwy1dd0XR+dLV1YNfiy5ft7m4DxAaR1FOewLPzya0l71jkv+6dXj8Um1j87tK
	jCBGcS1vM6M6HdwNdU0O49BT3RTR4dkvVWStdtf6G7ScazZ0Y14EdygunDn77/XxrGtVBKl9F7x
	5sIIpkFrzcrEefQAmfNAOgKQ6WCB7SuDvrl7XiiHTYzOuFji0W18FsjXqNcngBl20Hy7kbXGPxU
	+wLruRAKqdwUwiRHjLou3IGqDFewip5avM+c9XI7oOxFmK7aKylCjzQ9ObDEMEfHoA/Gzz5FHN/
	arDawOZJCwz4nw==
X-Received: by 2002:a17:902:f786:b0:2e9:3215:c458 with SMTP id d9443c01a7336-2e93215c642mr37739115ad.25.1792028928882;
        Wed, 14 Oct 2026 18:48:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:48:47 -0700 (PDT)
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
Subject: [PATCH v2 17/25] ASoC: codecs: wm8782: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:16 +0700
Message-ID: <20261015014324.5569-18-phucduc.bui@gmail.com>
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
from wm8782_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as wm8782_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm8782.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8782.c b/sound/soc/codecs/wm8782.c
index 3a2acdfa9b85..cbf0c823c022 100644
--- a/sound/soc/codecs/wm8782.c
+++ b/sound/soc/codecs/wm8782.c
@@ -39,9 +39,19 @@ static int wm8782_dai_startup(struct snd_pcm_substream *sub, struct snd_soc_dai
 	struct snd_pcm_runtime *runtime = sub->runtime;
 	struct wm8782_priv *priv =
 		snd_soc_component_get_drvdata(dai->component);
+	int ret;
 
-	return snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE,
+	ret = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE,
 					   8000, priv->max_rate);
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
 
 static const struct snd_soc_dapm_widget wm8782_dapm_widgets[] = {
-- 
2.43.0

