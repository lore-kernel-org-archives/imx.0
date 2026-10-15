Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E013E349CDD
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 01:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028777; cv=none; b=nI/mlzQOISKMQQEfNKv2z6zhmaTEiKdiPEMucgWv7+Gi63es3laA14j1cEDgeKc8+wufDyMoSGKfvG2Q48CY9e/q6pYKpnmA1IEaJclHm9LDfIjnQWSE+JEiFQOddXh1caSKXdISmLCVvoV9xHHRGV6Y5IksPlGyASBJ3LkJ5Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028777; c=relaxed/simple;
	bh=yyOhgd07c+cxIzNpWT9aCbeZ38F5m8HPqyV963AJgU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T3xD0d9XVrU4c+v/YtNg1qKZG4Lxh0NNja+iwyLuNoRGEY9uW8hP6IxDF3Dx739dcufHDfR5d26xenHp3zXdaeZPNGZg/Oea2d5/tm4GUsxbC41gZIDTUUUo0UhV+iXAk1rd83vqQUcDTH76Qfgnx1HeM0HXrOihltDxotE+JjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bepXdn8R; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bepXdn8R"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e86dce4510so24244465ad.3
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 18:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028774; x=1792633574; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kUuyyTReTSIMtXgKEYicRWK2Sg4dljNH29dcQFqlL0M=;
        b=bepXdn8RUVOfdd4NTtmQkZOBtWzk6WLE/batMAQn/A/yzWNFwY3c4kLjGP8QaitGY6
         EbJgJzyl/02OpXMsis4kQDj1Ki/XIYB1WM4NXRNAMVOT4Py1kkSu0lI4Xguwf14B+mPg
         t8rn9oVE2sdL9hBXEr6+xQMcHyKiikle++YGjBruyvuUO4R4cQeOOEIE21Vki1zO6mg/
         m8CAyZqGxEgRWX6LlpJd46GyEJ/Nc34VoH16h6beDzlsAuMhZ6EsO04xy6j/2cWJfXdC
         25BBfYmHEKK3BZd7kL7kJlHfTfqzSPQoanOmG8zgXpx1Jb+pd1+h/VJqHV3WHmiITCB8
         VO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028774; x=1792633574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kUuyyTReTSIMtXgKEYicRWK2Sg4dljNH29dcQFqlL0M=;
        b=MwgMSkjuXtXQqo2iVckR3Xzd5OTzkeN0t5xk6UCRIcGClk8P1lExenm+gDfbNsnY2d
         H6biUx45Jk5qC9wlzBvshAEjRhcSNsmroK/gehJHlyooAQ1aOQ3wwruLscCneXUcyAIE
         bWLKeSmz/tcyC1vcz/YmqX9kSy2OyC24DD39un1xD6fjMoaTxJyxGW4Y30qcJ6qx3Pw+
         cOalGbpclRfT9k4VYu6p+7Be8jqrtFZcxboYw2bZn36I6CHDL7JtkqZeSQ83klNY61IS
         1XENxnPQmL1Ax04StMGlE9TNaw5d6kaU4eoz6j2GsGoyLJtEobnggt9eDWwcI51IBs/0
         4qOw==
X-Forwarded-Encrypted: i=1; AKwUvBwSOFF/5s3rZQ7hykrsLx5GahErXtLQv10MLwXdmrisZmnxEsalC1FGHEWN14jGje41YuY=@lists.linux.dev
X-Gm-Message-State: AFq9FYJSImkJzi9ccGwS/i3Ph/7h/k812bpunjMDS2IjRLwFW6/9+ven
	gzthTK26kCVi/xu7IbtCqUUiCUvxAzXPOHJl7Gu4TIgp8lRCUKysmQ3P
X-Gm-Gg: AYBFou3v7z4gNUy7rXDFHM3R8xh76Ti05ZY+axyVdoJjySBfh+tTnmVBvbUyeebXDJQ
	5GBjjOSVSQgAYI//gsH1uzlcT50l72SogV7KPAD0g7Gj3GXz54TjvGdzWUNKpClA++tsl4xGQzJ
	qqjV7VRaZywsJ3iYIv5iELE874dgfUjJ8Y3/2tLTH3YmhCLX4fBjp49gHWF7oNUN94khrMcxA2y
	Gxr5rF+MishmF6weRqG67p1CK8mK5ezWb43CpCF6S6KucIdTCcHHLVWazVTjD0vqqb1Yt9mFy3b
	nco/7m15SgZw8io7W6e82FrmCEDWf615ydH+f2bx8iWJvM1sEDFC7S5FUF/38w1ox6MqpbqHlTs
	GLPaEo8zjNy7eMRxVarCpYvhlvchr//MVin7hvyDYkKMMlA1w1HFxHVLwZ2Po4acMV+1qyeRNDO
	Xzg7oMMaZH9b/PamKKzvFKe6TyRSNZqyQbbOKaafaBR6na7jgG6zlouZtALkuwipEjgJRbHINYu
	rRndPDcMzLQaE6qwxFLz5d5OpjMjtQ7qXJFwOr+FqTvnZR+vt6IbUCdiZUglnhmtbphdu0ZXi9b
	6e9+AwKjHOu5sw==
X-Received: by 2002:a17:902:cec2:b0:2dd:c0ff:e72b with SMTP id d9443c01a7336-2e842e02a57mr138459075ad.61.1792028774224;
        Wed, 14 Oct 2026 18:46:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:46:13 -0700 (PDT)
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
Subject: [PATCH v2 08/25] ASoC: apple: mca: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:07 +0700
Message-ID: <20261015014324.5569-9-phucduc.bui@gmail.com>
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
from mca_fe_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as mca_fe_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/apple/mca.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index be702b2942a5..26022a42a95e 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -516,6 +516,7 @@ static int mca_fe_startup(struct snd_pcm_substream *substream,
 {
 	struct mca_cluster *cl = mca_dai_to_cluster(dai);
 	unsigned int mask, nchannels;
+	int ret;
 
 	if (cl->tdm_slots) {
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
@@ -528,9 +529,18 @@ static int mca_fe_startup(struct snd_pcm_substream *substream,
 		nchannels = 2;
 	}
 
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_CHANNELS,
-					    1, nchannels);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_CHANNELS,
+					   1, nchannels);
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
 
 static int mca_fe_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
-- 
2.43.0

