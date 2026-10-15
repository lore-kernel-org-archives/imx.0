Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3620F231A23
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 01:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792029039; cv=none; b=vBdBeBk1Y4ksdadZ2PuSEqoH8k76S8b24Xwv/beMKP4TbiOtVJMGOhHZHDAPB6OL+cLnPmS424F/6kvvm+xCieDppPgTHbj9o975wsI0J70E8JQRXuzGQ0g60/1sV0alY82A/vz5QaVN2gBJGQYn04IEx1k9/XoNIL/90aO4m0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792029039; c=relaxed/simple;
	bh=/x4wgoOpRrlKj8g7RinhirGMQW8lTujhGHYMYJBcDDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ar/0Hnuhl4eLl8yoUoJ2kIu1htjDGiE+AsTJt/yVUHa26lzs4Sq2J0xea7/8bjMtaM9UiVE0q8st9TF2z4Qn7GW5xhZhhCvMGwJ4JMy2hG5QQIJxY62eUIviG2mU5h2cMBltx7YKLKJQQu1H91ZZURVQHkSinagt3cSopuIbCBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YoBI3TAX; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YoBI3TAX"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e86dce4510so24258965ad.3
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 18:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792029037; x=1792633837; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lmt1bwfRxOTKjQOsp9tkvpG9ehM8yzZulL3eFnlXWR4=;
        b=YoBI3TAXDYkoTcIZcAR3YO/Pflpv5Umy0e/DQATlq3lM7uWwEOjhf8hNqysPwZAUHi
         hgvaJZVmNRACT4hYNIfZPN0ESTBgmWE8s31WJQBoML2VzVpNPzJmJkEvzniXh/cbnw5c
         ZzjR60af9V8Liwc2O0LZBQqEl/zW7hNpQg9yusRy11h3WK8Ks2UXxF8k+xWLPNEZrX3U
         jBNGGKGxBsrxQLc66wSCeG+eAgSAnSVgqtmG13RJfS8dphvFqr3b3EgTdAMsw7jjsp4E
         A0LNGtY2ZFBn/Gzp7E19vmxFtWYbooOuXLqICe2WJleYJBVyPq5/ymXu68+02NEr6dLK
         bsRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792029037; x=1792633837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lmt1bwfRxOTKjQOsp9tkvpG9ehM8yzZulL3eFnlXWR4=;
        b=n3zg9MEKwCXNwHKg6gDJUctTxORXGMkXXQR1gtD1l/2njRYzCT0/5rOAGNBXn2k8jJ
         K1T4R3FArqExfYfFz2vrA6urtcp8IbKicEtlo/iK0gLpOkjO8LQnJWEFyyV6MT4pvXxn
         ERZZtnlg6qcwmfBFVZ9udyT3VbSTeyrx9X9KHdYtuuvl+af6NfZlmW+e2Na/j/AbdrpH
         Ytkny7mozV6sAj6PUbdozY8pISWQnGNqknmIBkmQQ/AqQb5keC5dB79NnP3jnqPpTeV9
         +J486D+O8jhJTOl1UIFUv0cp6pVOirXSAgkmFMl/jnGrfK5RZ8FIpsyupBLb0B0hYAXE
         aDkg==
X-Forwarded-Encrypted: i=1; AKwUvBzzAkYGDclMj0j2NuQRtzYBk0ZBBAmwfoYnXiz89MGdrV7NhjNf/Wu+9kYYJhZUmEqlelk=@lists.linux.dev
X-Gm-Message-State: AFq9FYL/2jjymMzvIFS7Ew4hNefojJYDJ4nJLndAh222RQWA5nusQ1tQ
	PyBDF2UtAtAYRCrD6eTVHBvcahYTZW4rIaUV91rRch6qB2HO/pfUwTPA
X-Gm-Gg: AYBFou3uOfRSYggdf6z+jmt7Kw9jl0fNGPZ77CPxLSSv2Vl/b1qQG2KzYeWVpUxk/EF
	zF/Je6+uUp/Frf+KikrIm6uzwCzG84fOD3ek4IG3za0+wKWY+8B8jODWA+pAOdsigRLYBYXe/MB
	YBGcJXNQr3eYAZ90XE3XBe5lSxXNdL//AlxX4xzxvzNeLlbWNK9+t4k1p6e5/pxzSDQW69wqp/o
	5+9iS756tk3JQMTqlJz56ZMTm3IST6IufIOsuTSzwU96YAdJxIHdrEUUMJDYj9Zmll5naCe8X8h
	omKg7V9jIFJwsz6XqTqbOHaGHvn8SWplV5dFLnmBE+KaYiJzGr3RAXR9oUYJpIk0CFdCLqd2oo4
	RSjj7AJ28taBRAA5HSYy76bZsCUKFuySs0SJ8dzevlflrMIrLAgzJ4CZqSyUVUybSqUTYfZoz1E
	nDxWYEhaKtfwQMwQ9oN3T8505aWNouN8RrE5mwQwn590WUFUdffRuiflZ5Mh8asfs4Z9KGnN/QU
	g9pURuMgB8kU1Qw6K/CPLnTd0mvML4o8XWe0kF5GgcEwpiN7WhIlJmIqvLYQSXSCZwIrzvje90z
	PiokMVpajAL3BA==
X-Received: by 2002:a17:902:f706:b0:2dd:c053:82f1 with SMTP id d9443c01a7336-2e842cdb110mr149481055ad.40.1792029037428;
        Wed, 14 Oct 2026 18:50:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:50:35 -0700 (PDT)
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
Subject: [PATCH v2 24/25] ASoC: rockchip: rk3399_gru_sound: Mark the link as started on success
Date: Thu, 15 Oct 2026 08:43:23 +0700
Message-ID: <20261015014324.5569-25-phucduc.bui@gmail.com>
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
from rockchip_sound_startup(). ASoC only marks the DAI link as started
when .startup() returns 0.

This currently has no functional impact, as there is no .shutdown()
callback in the relevant snd_soc_ops. Still, return 0 explicitly on
success to match what ASoC expects and ensure the DAI link is correctly
marked as started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rk3399_gru_sound.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
index 04e7bed8275d..d4a0daabfb42 100644
--- a/sound/soc/rockchip/rk3399_gru_sound.c
+++ b/sound/soc/rockchip/rk3399_gru_sound.c
@@ -258,10 +258,20 @@ static int rockchip_sound_dmic_hw_params(struct snd_pcm_substream *substream,
 static int rockchip_sound_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+	int ret;
 
 	runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
-	return snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE,
-			8000, 96000);
+	ret = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE,
+					   8000, 96000);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * ASoC only marks the DAI link as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI link is correctly marked as started.
+	 */
+	return 0;
 }
 
 static const struct snd_soc_ops rockchip_sound_max98357a_ops = {
-- 
2.43.0

