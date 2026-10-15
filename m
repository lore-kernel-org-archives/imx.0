Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08FA30ACF0
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 01:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028966; cv=none; b=ZX2c3wCMFdNsrWsLX+3zJzcDViodz28ijT9efmdlZbdjkjSkY+w4uYGBzK0SdqqJPaWYQiGU0bv+sbAZarqoQx/R/hXPHGEhIJAq41+FfPuArJgFw4PYB8OKVtH6hliYwUpKh8VhsiD7O/M3oZyKoglgNU3AbJiYSuNFfhdt99I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028966; c=relaxed/simple;
	bh=wpmHgU/SVIYOTBhjMxKFXWaiqOI+cwOYjPVM8h1oB/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=El8BvLiAU7pWHdN4bCKDQT+CTs2ONKQP31/F6dnmFIw3bW04t6yCwMeAMO3j7yjDePurIxvjdGxJUEsk11RHbrnmM5ziIWYCubmZF5yPzJGdNBr1Iok6SujdiHnX2DelPtXvZjWVtICARqJ7QjJIRrxN/KwoLUmWYFIiImhSQgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdrCuRfY; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdrCuRfY"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e934449bb0so11221905ad.0
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 18:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028964; x=1792633764; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uRhw/DGZE60v7F2bKWHVZMO73GmaBC+Vm8KSgOideNk=;
        b=NdrCuRfYtm57eO2dxl6CdVGKiuVwN81KYPZkiKxojz6OtXq/jhaD09+l+xZSqFll8f
         Z3TCeK9HkZD2HFar8pzVdAFmxGdqen6v9Ld2v1w4goEZooDTSO/xM0KifZttp+7MF9JG
         BvZ4IKNVfj8ZbzPjuPzWLTOC6N86tQh4j+NrWV8qDW+25dc/t7SufpLqdlhNiMMVzsa2
         T0eV29dybj2VBquZdQDkOouh2GlpWeSRXkp3YG1kFaufStG0fKjBTLyDIDbxqmKU2AtT
         7iddnl3cOBDnGf2b873rQbwdvHawncqRRyWRithUI+e75ekwrj0n9Jg46Dm/tn5ekZjW
         Xu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028964; x=1792633764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uRhw/DGZE60v7F2bKWHVZMO73GmaBC+Vm8KSgOideNk=;
        b=lq/3hUBOWu2X8H90NKTGmulrOUEmo/hppeUGSwpEc1rtm+BjoR9myfuJ1KmhHs0PyO
         2IpG03vMH5Uyv9X2oqXBMlBVwx2k03PxhSRzyggeyMfKME7AhafmycAqIC6AO+LrmlrL
         tMcHizTliwP2pEHsRkVewfasDkLTb6jrH+3LeouaDbn24v6izt3Q0P5Y3qy2SunCDpjL
         X0OPt0+KhKHmzxXiOprZZ4kumnIw8+Sc2w4Aoq9CIEJP+scrq0oQS+oupDUIwsE2iE58
         WP3XvN8zitrKIoWerogyXnUnY+zzxwMzkj0WcLfbmp7EvHQFobvabJ9keXmb5jaAv2iw
         8B5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwu9Qi+ZTsJeoXxz0vzPhabEJfCJMCCYh9HR2Hj4XMSickZLaVSx4NjmL/Thjd4tojE7zs=@lists.linux.dev
X-Gm-Message-State: AFq9FYKPobTbDQvfRJCzdS0eht3g/8E+WuPrsbMhn1zLsmvqCrpl8g3U
	m1U3fzLPNgvkfMw008pzhXAPcxVroBDbKcxhlY38sRTraiTmXyFQaNlv
X-Gm-Gg: AYBFou1d1XVGYp/MBiMTFIjgOdTSkbbcN1OAroUAlZV4zE6PugZmCRmzG5MfEZgbVoM
	2qDTzMWt1VmcrjUDG+J9KPxA2CjIyLra8h26rNrbUR5s01LjTo/ePO7mIPRKSYN5m+f9PYT8u/E
	i6gShAOhACbrrqxZPGqhMCy/kLnXfoBkLwdKBmvuAQINXOFnrnQCC3MY5We0ovIUfC9T2Pp1u4K
	kiA2k19D9StgwSFuA86beT94KMis5xnMgRAynu5uplO6bl8TW0/dxco66jyHy2S3LkNRL/9U1Dj
	Z1OOTDmWZQydf6RpPmNbfIfZq6KTGIA2xxqBX8KS8jXpE4tAvvokT9fKBGBw0KbL0t/IzZftSoY
	gUMNrawX5KpqxZcPnYOtcTG+0kp/uBrI3isUMf6+c91ztqRj1UzuQHA5r/8nzkVq6pO/dAZoq7n
	TMoG2euvRnts0KsEdPFS0MiO2YKY9BU97Bup+xKtaOlbIlTJ6E15R5uCOeK82XjPP9tSdkRfzsz
	pcu4yv8C3WP5lc4jlFFV6T7QGm+E7BNPOBU2SSixEcS27HKlH0bgTLP2oQtCdET/AT0jM1Nkq4/
	I6VZTCjFOQfLiQ==
X-Received: by 2002:a17:902:e548:b0:2e5:54c6:e5a2 with SMTP id d9443c01a7336-2e842820581mr176747665ad.6.1792028964152;
        Wed, 14 Oct 2026 18:49:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:49:22 -0700 (PDT)
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
Subject: [PATCH v2 19/25] ASoC: intel: atom: Fix .shutdown() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:18 +0700
Message-ID: <20261015014324.5569-20-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from sst_media_open(). ASoC only marks the DAI as started when
.startup() returns 0, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 4889a8a73f65 ("ASoC: intel: atom: Use __free(kfree) for stream pointer")
Fixes: 6cc0f4e63994 ("ASoC: Intel: mfld_pcm: move stream handling to dai_ops")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index a4c8cbfba096..58681e007abf 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -341,7 +341,12 @@ static int sst_media_open(struct snd_pcm_substream *substream,
 
 	stream = NULL;
 
-	return ret_val;
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .shutdown() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static void sst_media_close(struct snd_pcm_substream *substream,
-- 
2.43.0

