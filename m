Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28185497382
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 10:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456126; cv=none; b=qg+5lcYN57/E04Xmzymhoq39Mvy7sIy1zIhpNNuAoNDunPkKaOZbQn7a8qQtGf/4036mmdEp/djKxNMv/0o8LWEtort0C1jo3Q2hXPOOSXE0GYAs/PimH4RSxTBGO7MbYIjNJQxg24Hz5MNTlCqob9Ji+KNB+iEvDM97wDsAJek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456126; c=relaxed/simple;
	bh=TY5nLnS6S9uHv32PdSTxcUN0ZHO58ghUjGE/8k1kBwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=he/cJN0ml2SczMW2Ipfj4vpGQ6iiw8rczptxLseI7HL6LqQmkKHqWgLSeR2gUdZeIZ2NNx+YIvgS+Pv9eUjzASqN9KYaRvRM0N+bYRSsYFsMaq9zOjAqu8+LYH7B4QcfbCiTU3TnDPq1SzA/qaZCTmR452IRQk/vctQcyE1LbA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pUgF7/63; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pUgF7/63"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33c2520ad38so6665082eec.1
        for <imx@lists.linux.dev>; Thu, 08 Oct 2026 03:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456124; x=1792060924; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+TNcAidsp1/YnKu0SMvrWqoUUNkBNLGyi1C+4A88wdo=;
        b=pUgF7/63zR0oGocG1+aATfwJ2dsDz6yJYTiVgs6Ls8R06pcHnCoFzaGjuiLrUjbTYj
         vT3pUC9e5jZUiZaut04WB04bsRhJpytoNJ39TKtiG+Vf/8cJI0TU/mHHhD1AHMxy2O54
         HcnUH1DMUtSHc9il7oRArNGEGMhA4grtyb9PquVnGj2+U1NqsjyBYsdyI8YuJDIsIFoK
         T5BkM37XEVbx+9xvR+eyIVbjVE5qagoHajh5aI1vfup2vudpvZvOQebmz7hJJSRmHNvI
         4lMvol3mTV10Yur2RkSEeImaERZXEt2qe9GAv9/fHxkHtLeJTU5fbRPDvrqqZr57Cnqp
         M+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456124; x=1792060924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+TNcAidsp1/YnKu0SMvrWqoUUNkBNLGyi1C+4A88wdo=;
        b=U73TAHyWPpVxIkLNz4y7w/JvwgGrSqABAQOTj5PJzIpfaogx80fUBmKDkGAGTuH970
         DXFLFlddCWSB1NPQk55Zaqnb1F+rdO+T33hPogNnphSgOhg24sY4zy0oZzVxPR5/4G25
         bUD41FPL37nVoYHOMiYWEvFCjADfWB4TK1/mBxACgZqJWBQBOmXSKrwtBsKczPQAUqro
         GEux/igPQZK6Av2qDHT36bb/cw/A2WIVvGkMiXZTLl6zOB6VjmiskvRTehpMoORVROU6
         RLguUuXD6NiNKHTZrkXkmtjEEMzzQDmeVG15sij8l4l/ZW/6qx0Q1BDOutHMyXja6I3y
         q8Tw==
X-Forwarded-Encrypted: i=1; AKwUvByKP0VNIZbINTK93FmIh/95XlBZ2wDW7awRRi/irXJt4dNioscTioDDIsQRVXoasXJsPeE=@lists.linux.dev
X-Gm-Message-State: AFq9FYLgAx2ZYl15BWXd6OAso8j8JSPtzGLLifnUwNCGemlig71VgFSN
	7IBNSVrxm6s4WOKhf9bU7/Jt06Og07geBi9DNCH87esD5NcO9lAbm8pB
X-Gm-Gg: AYBFou3ku9uQ/dPt9selmlLmDSBH1VSa3+EoP9kRqhPZkuv0w5T/4XyFnE+TaGKZRLf
	aOQLARGlTHNzS1daWVnAH8EE+D2+HVxdVPR4Qv9Sg7bfO3JQYTFMjgx3Y1Ex30dZvjsyRmgXVKx
	GSNOSR4Gf39HuPgXRVtDWCDEqnV1DB3r+jU1PE1MwCiUtdNqCX5fps5VwDTlqSmVERnEJHHCWLt
	JCPXpM9FkHv89tx1QknwvgL+aiA3nLI9ajwE1H62n6asRBo65kM6Wj41j8LdVECMoAQJy9QFXjo
	FP+Lyuf3kRbLaGaQ4iLY2N5c+KKeroip3ieufWGU9K79PA6lFd4xJJG3dIt+lRs/kcxIz2YHHQI
	b/ji2kvGm33MgojCgn48yVweI3Cuctvz5Hmdpf89j8X/aZYUEv7DrJpKBVbjncjS/ejwi+oUnhF
	DK1g8pgrNO8DQTd+kUBAXQmScqt7fqvSRWj7FZSPRuszdoE5uaMh6BoXVOVC4JO7sOh7juRDGlS
	ry7BAyspqK2W29dOopjYenrT05CgFxeWWd6yxoAmqsuUZYmXbr5Yc2YKVQWTa3LHTA7mZoi8wog
	S0V3PAZeWS8a1g==
X-Received: by 2002:a05:7301:7a0a:b0:351:1230:5087 with SMTP id 5a478bee46e88-3515dd3322amr6214040eec.12.1791456124010;
        Thu, 08 Oct 2026 03:42:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:42:03 -0700 (PDT)
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
Subject: [PATCH 12/24] ASoC: codecs: nau8540: Ensure the DAI is marked as started on success
Date: Thu,  8 Oct 2026 17:38:19 +0700
Message-ID: <20261008103831.542533-13-phucduc.bui@gmail.com>
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
from nau8540_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as nau8540_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/nau8540.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8540.c b/sound/soc/codecs/nau8540.c
index d4211a76b096..9484388ab262 100644
--- a/sound/soc/codecs/nau8540.c
+++ b/sound/soc/codecs/nau8540.c
@@ -419,14 +419,19 @@ static int nau8540_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct nau8540 *nau8540 = snd_soc_component_get_drvdata(component);
 	const struct nau8540_osr_attr *osr;
+	int ret;
 
 	osr = nau8540_get_osr(nau8540);
 	if (!osr || !osr->osr)
 		return -EINVAL;
 
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_RATE,
-					    0, CLK_ADC_MAX / osr->osr);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_RATE,
+					   0, CLK_ADC_MAX / osr->osr);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int nau8540_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

