Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB1D493D3B
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 10:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456188; cv=none; b=BAXh7Iw7KVNScI2Rb50IFcztH7VyjvJjLxcxlfqEG3k9MFjLSTIx2qvOn4KWu9I/E/5elX3WJowKKmt9b1QflYjlvEqlosDI8GVnxfJZmoekKxtWM9Liol1hev9jeU1pGTw4m7MPiJ/gJL6JvqbxsfTuJdOkXxaBinnhaBvN4f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456188; c=relaxed/simple;
	bh=4NCY4WcF1QlkYiyC8+OHrV0PoUi/1+lM3FPBnwvgx8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OAl3waJPKZ8GiDTIIrbCkm987q/S82tv/CNWGRt8b2FMjXG9gLFUvGqSz0QoIYW5yPV30smtjqGF+UonLLMBigfy1DfNDIKszTSRURkHaSxNKUGkD4KzuvE6Ce5j6/JUMtubHANccXUrI2bHD8Y3uyierURuYVYhWkgoSAWIFR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ul64DrsI; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ul64DrsI"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-34ca2d54925so7790493eec.0
        for <imx@lists.linux.dev>; Thu, 08 Oct 2026 03:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456186; x=1792060986; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T/ErUb+BYhJoBzVefBGuzS4rmfVbIr3TqgsBxZ+R3Yg=;
        b=Ul64DrsIVffM+ulPY4Fzsbjbf1Uv5yW0fFiv9Qnq4kxZRGG1+u2NzBB/FNnizNSliI
         8VKswpdgZQEyGgrYR0osj5R4pX/SKbWjZ0EvqWqYb9ii6RV1EKi+nRpqmWZ97O5aPXsY
         prSntx5p29mSG9MtVpgf4yM8kZT8D0HzNYQ1ytxDorRXQCBWiwgtYlJWGy6KKeRpOf+S
         eUHquokCckVaHbJWyfzc3SgLCHmIgjxIt9V3kiCeWUUpdnMnYTjhrQ5RMNQYSWi8lTtC
         ICHl8Swc5rHIbI7j0lp0c5J/KPh1VlzigwzHW35a1xPd7FmfqlOk2ngyk2EaUYNU2w4e
         v7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456186; x=1792060986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T/ErUb+BYhJoBzVefBGuzS4rmfVbIr3TqgsBxZ+R3Yg=;
        b=RIxlIjvtcUSTrxMgNjdONxh8U1oRzqkJ8AFCtyrxKYCSeioQgKyFZt2vaI0ZK+K/Hz
         Gw51pIqJoBGW+v+cv6mgpjo7YpUSUJYu+IBMDN+5yvcBeyZIxzwLsSaAWhZqUsoa5Urd
         mqWJOdFFdsVFss4MaQfPugNBLVsVQIrCP6UXcLhnTwDZnORcZHbNvXjPe4x08uCOWQVm
         eqbTyrQ7gok8FKWM8E/ZxsQzofDcuJaybaiPfukaV8Qd7IMdT109OKXU8+2g5XY97AFg
         nGk4rFQwu3KrzR4Uf4n3biPz9QmgG1oOT3rVQ+HnuteP8lnI68fni+Oa3sQN3fweJpIk
         YVzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPxk2B8lCNtd7SKk5667LdplE8fFaF7vLu/tT46m7ZGfJV8dxJBDTRL7oq2gvTYCHE73g=@lists.linux.dev
X-Gm-Message-State: AFuF++lZvSgSgyGHda/uITlps2qKYEPVz36go5oHvFrdaDt/jIqFBR3i
	7PFl0i6/ZkU7E7foVrZDXOKz40DUcV6hKjUp4uIIUK9a66KIeWL3GO1S
X-Gm-Gg: AYBFou3+68ZtlzFPf5VipHcCLMDfV9eEUJ0kPlO5QMBLJN1fSfVgJ4TlRjVOGwpDOZ7
	PEltLTK/V18ceS7Sr4ICShiflfbyBlN7sePkjb0MVQu44Skdj/oNGNFiF/CZniPCX2MbqjJwnF9
	ld2HatykWZsQJohy1BF5CwNHGbrZhGknP7obKlbxCYkSomUZmygiCX4zhVbmBLk8rQpP1iGHXT0
	Mu6kX6WXszqZDuVCfCxNMrF+N8nK/HW+VXni9gZJ6riVH3XO4CFYpp4v6YyVuW8syuyv/wa802w
	zXtdaJua01qRcx72gI4UmLjxOeb6wkMvSs0s5tAEzM8VKK9EymKfm3f4EXrg6Hd/9dgC1a3AVP+
	dXTZXtAGWpMuiz8v5IqOtjYBKemATBDGui1mICIq51jz+GWuRDHOH9d4vc5NgLXefqGO+ycaTO+
	xQ/fjpxmJLQcnX/roeQcGT+1nHprCNoULd1F+I0kECKVZIP5NB3A3SXfdz48kdURp0PBN/YhGJm
	bJUwY7loCHG1wlHMV5pDeLHFTCQFamUNkK8Qk4E20i7gaYBw8UGyNfmemM7OxQGFIYYMna2DhuA
	37RYtqMgVHjkRqL+0WoM0wti
X-Received: by 2002:a05:693c:88c6:10b0:328:3944:ee53 with SMTP id 5a478bee46e88-3515da28859mr6108352eec.2.1791456186115;
        Thu, 08 Oct 2026 03:43:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:43:05 -0700 (PDT)
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
Subject: [PATCH 16/24] ASoC: codecs: wm8580: Ensure the DAI is marked as started on success
Date: Thu,  8 Oct 2026 17:38:23 +0700
Message-ID: <20261008103831.542533-17-phucduc.bui@gmail.com>
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
from wm8580_playback_startup(). ASoC only marks the DAI as started
when .startup() returns 0.

This currently has no functional impact, as wm8580_dai_ops_playback
has no .shutdown() callback. Still, return 0 explicitly on success
to match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm8580.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8580.c b/sound/soc/codecs/wm8580.c
index 9bc5d1e795dc..5343d445c322 100644
--- a/sound/soc/codecs/wm8580.c
+++ b/sound/soc/codecs/wm8580.c
@@ -852,9 +852,15 @@ static int wm8580_playback_startup(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct wm8580_priv *wm8580 = snd_soc_component_get_drvdata(component);
+	int ret;
 
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-		SNDRV_PCM_HW_PARAM_CHANNELS, 1, wm8580->drvdata->num_dacs * 2);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_CHANNELS, 1,
+					   wm8580->drvdata->num_dacs * 2);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 #define WM8580_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
-- 
2.43.0

