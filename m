Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722E131F99C
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 01:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028804; cv=none; b=O4zKxZezmievIFcP/wuSu4k219ZqyrpdWLNiFOtsDFOSNcYaKy/Y2/JWqITB770SAaSli8Dun+SR5tJUcL9lWlQOX9cKFWm4gfATQAUguFREtqqqPLAbybUkFGlrVvpFLg0xAb+BQDF2I/dDVGJiu5X8TftgJSqw8DqFPcyRTkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028804; c=relaxed/simple;
	bh=HEnoir5YUU9pRtHiCZMnqTe7yfBh5BOFRRnUCPqrwfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nYQ2VlmtggdS/PUQOpQ1FNuJpx8H5zdTt5StIuh77R5lyAo5x/rYpfbUUH1TdYsNLxZVl81c0lJ5xyDEx/t5zRyP8qZeNrh8K9rNrmh1Z+tfDvPiOMMRtD46D2BPax7+mYgEr8lUAtvzLhrPhO8OevkxPs9kqSBZeRdejpalB8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iEGabYiW; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iEGabYiW"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2db710396ffso36899825ad.1
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 18:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028803; x=1792633603; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tNKaoas0suhXoNZM631qYPKJn33cxyMQnmMBR8n2e68=;
        b=iEGabYiWsLfHzj3llCzDp410Qog7s7BvmQrTBcEqbf6AavJIIe5xvvFMVFyMEfjcQt
         2EOPHnyi5SfE6uaURcYybcdrVrIXxwI3b94664yTclhwNeBIjI2ZgVsmFThnqBKyqbyK
         OICRpwd6UmoUk4YlD4ReB8OWY+Hl+lZoM7j1PxSi1usBmTjqE5tUqPWaEEhMdfY3AcBX
         uc5fcmoUvid84GakbfCluzZyEAi0g09R1A9r7LdIJ66T6Cme/ps55eeJ2vI2QWiReuRM
         MLJ+69fPUSx7hiqCTlD8yD2Gknm07XvuEkwKvv6/oLctxIyF861Ela92y9oRj1nR/kTs
         Os3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028803; x=1792633603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tNKaoas0suhXoNZM631qYPKJn33cxyMQnmMBR8n2e68=;
        b=KjfFRK3itHFdVvfxdXcDlFRwewBPCFnC6wtw0UOzoBqbcqlgCdvxJiuq7XQSjtQeh/
         ub4R1YMWhk4up0dmJktntVvon27SgKPUkcHMywFFDvRBkYbXmluB82bK1gvHj/gKzTzP
         OZRqYF4w+KEcQapfDOy+eU89h6l/4hvzBpUKJNG8J/173HSh9EQ1Hr4NP4OsKsdcy8cd
         IeecJI8B3b/hsbyEm4JTyEAqDG+gvaIs6VXN9TRiQrlBWyMJVhsMigkNmzEffeeRPPiw
         1fJ/3ZvP63XZlng3YBLkpJl6UEz+3aivFA9kLkXwdfDptGApr2f9SEfzIAQaDkgEZ5ib
         JFvg==
X-Forwarded-Encrypted: i=1; AKwUvBzzR+za/cB2v+7RXvCc7yKeYIIME1+zPBijYZNgvM4oYoWzBwoEE8Fve4q4YJ8FsJysW10=@lists.linux.dev
X-Gm-Message-State: AFq9FYIG1hwvYyTVHWki6b4GMx/0FXZvKUS3tXiFzESeIrgV4ipO1WVY
	67a/MuDqlGHoDc0RzZz0qn24g+lOBN3qhrtEPG6BRT4BX8IYrx/UvM8+
X-Gm-Gg: AYBFou0uoOmOmjtr9NYnYQThVrkRX0GNjsEAcOuiSYeRt3UdgML6VvzQWwNT1H6c+oq
	UwUWM+L0S45CCmSk46bgZ2tM7atolUtXCoRxudp/2oP8nwhaY5un6j5CWu//Irt9s07CEhKo/fw
	gafkwCC2wxxDVVN9sVrn/oMfqAh2etmkO02pU9QqWh0tX07EibFeAIQWb0YO9e4ICgmL50dPSCZ
	wwcRuw1tL9eYxOv5uj2DfLJ9okiWCXfI4MWjdvJp7LNJn2ztmXB390tP0Qgo80bMW40iJEPnvnt
	zErQzk0udINL+jqwbBRpAf0XmD7bYAp3V7aiXfcXAxjvR9nojKL+OVm62yvMp3jqOwjDcccIsMD
	Uezg/5sWxOnpg27FSVuwnukfGzOrNj5Pdu6fJOA7XFOyfnLn/+LYQKxBCnR97jWuiI56I4s6Lcx
	Kg6l7ywAtqUwRbX5r6uLPhzSJY6zvccjeDFQldNkz+8JYg2jkvyjnoRNp2Lfw9qJuY16LYFUfcL
	UIMi6qaJDMYVN8CdJMP5ZQZBJOnOwn62T1peKyyXZ9y1uwezM6BZEv6CbMNJl093WmAHFZSvqgu
	q+qYIusR+kWdgQ==
X-Received: by 2002:a17:903:37cd:b0:2e8:5857:b5f4 with SMTP id d9443c01a7336-2e85857ba34mr106063185ad.10.1792028802766;
        Wed, 14 Oct 2026 18:46:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:46:41 -0700 (PDT)
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
Subject: [PATCH v2 10/25] ASoC: codecs: cs42l42: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:09 +0700
Message-ID: <20261015014324.5569-11-phucduc.bui@gmail.com>
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
from cs42l42_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as cs42l42_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs42l42.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index b5d69d5516a6..18d6cb9bfa2c 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -890,6 +890,7 @@ static int cs42l42_dai_startup(struct snd_pcm_substream *substream, struct snd_s
 {
 	struct snd_soc_component *component = dai->component;
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	/*
 	 * Sample rates < 44.1 kHz would produce an out-of-range SCLK with
@@ -900,9 +901,18 @@ static int cs42l42_dai_startup(struct snd_pcm_substream *substream, struct snd_s
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
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked as started.
+	 */
+	return 0;
 }
 
 static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

