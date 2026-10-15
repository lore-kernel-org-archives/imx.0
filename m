Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA8C36EAA4
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 01:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028981; cv=none; b=a1CXMsvpGo+bxnOf/r5bP4llpyunOnoIXy/nMkwgg9rJ7ihVibjobrm8ofFLjvvoWPdXlPUJ3LI0QUqhYXb4p25XmLg9BIqtHNzfB+UOW/wO7irdIjisjjJq5bIJXkS2VS46GZzcRMy2Mxfb0OiORT7nsKLQprcRKVi974LOXlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028981; c=relaxed/simple;
	bh=jlEb+ienncM3LL+BnYDTqkV/y1oGhTtwElRku4Cmr6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KeATSsM50vWA+OFEV07cOfFb1LxoXQn8lrPEbb1UwPxsoVXqplD7wA785ZH9OxwA9TlNT6rsf2HT5unvi6l4tZIJyfNpE1syCbpSA2ohQlZpWGkPyFAs2AxdCGB+Rt7jaDOyZZwUVumcAc70hFBXYnI8ge52aIM0KQbmUieSKPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DAZc9AHm; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DAZc9AHm"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e7006bbf77so10086835ad.0
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 18:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028978; x=1792633778; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FVU2me1+3bnamRCjCl3aeaOsDD74U7zM2YYw6HaRgfo=;
        b=DAZc9AHm86aGpQW4wn0TPzj7cRqoziLXh1h32beVCljsYGNz4r/udtif0EhnB5ksYk
         0Pyl1gZ+B+6EDR/fRbjNaecxCtSywS9nXG+czaYKUnb0b7h/4YRDnFgzvYgeRsTnleTR
         EReCX8AClcYVy+uOVcp/4Rr+q8vEXkE9Q7EIDxYmSApzP7F2RirGPDC+6CVfw7qAlmbc
         edQ5zQzJcvdoTIW98xVuUBGhLTLIIVjZee2goPtyP30ptoC27Fgc3Gz5YogAMxx3Wusl
         Hsi8JPj6mRJHxS+P7PDvXBfn8UrNCqiqYr0ettRXTi6aMpQrv/NCxXi0gVTTlpxSxCxx
         YnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028978; x=1792633778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FVU2me1+3bnamRCjCl3aeaOsDD74U7zM2YYw6HaRgfo=;
        b=zq6+35TtLq4FUEIlh+MXpciWgVf1iHT1CXRACXmOG1dSAlwxdUif7IachpByFFTDBz
         4FwIGYNcFGUYKswl+uDkuQeM1/uEtwbgKtGmB+ANkLIcCAMzVNdtEj8LbITvfPyAXmkE
         FfKeVB6LyZq9hNjiQWRbid5wmp0kXbA3+ZAmt6/SO/4gSU10339bMGB5Sy96BU44x8/3
         B3TMBMl1o0xnd3thJFwiledY4wjN/joRRJzaVnWB1AClFcXbMp5gjVqhq1SLCrQ4L+n/
         iMcSUwbFMYSejv4CewV46manc4ZPc2GeMNBarHGH4CKs2M8N4RNWAmG7ldkMtXOY6s3Q
         g2sA==
X-Forwarded-Encrypted: i=1; AKwUvByqqGsHj+0ljNvjFqF13fkiQdyaebSTz6l4oPxnFd4dbZM36nB6ugGmSU6BSPzOA1VqLPY=@lists.linux.dev
X-Gm-Message-State: AFq9FYInQ7K+P2nXrwqxnNz1Hy+6ofzm9eLqlraEDBaEX15hmyK6SI0Y
	Nmx+fnlRj664gRmY5oPlcvaISn1Q6vI0gYCav0WfAYfd+wvm6BPMvHW+
X-Gm-Gg: AYBFou0LsrSqDnm8bcHpzSResZx6BpSeLXgKSiTsVbCp0yr2N/SaLJhkBRDRUSuAXQZ
	hmtYWT0MBmvq37juSJRitmedNz3qqgvLIcn5w6P34jYEOaVksvTqZoh7kCRw/P2Peb230M3nFD3
	9Jhechg9YUsldT1cBqvLKjKWTM2x5o6hqRBtvw711a0Mm+pPwTZOITO2i07DvCLeAVB3gOmYgoA
	FTy+m1HDyQlqG91LVQXZnQjwzN19riGTOg2KHJZxkXKorhv0MLdZQNHIbqHpQlTuLQnAhO3TtYs
	JEPu+qYKsXmUXervNDxQEnUn4SL2IvHLWuh+oClp/I+o3jzwrmMmhhPP2SP58Qwm4KIoBNBo+58
	nRPew4dDejE64S0auN4QWUiG9Eg0OkzA7SENI3uTbse98CtfdB9fs6zTmtC5NYDc8SqjA6iP3z1
	KlG7lw07S6XzwJ7Gv70U5F5A7xrCShkO4E2GtqU/xWnM8Y9zBoWPmjXM0T48dq5BssLuFiUJ8i2
	VJKOWq16w/74DoIQbNwPKV9QmfGhqzCJjxtMPJGggE4kPfmyZ38bm/yAbSIz02BtzqGeRSyDdsT
	kWD+RUjDu2KJeA==
X-Received: by 2002:a17:903:3243:b0:2dd:ad74:ac32 with SMTP id d9443c01a7336-2e842bc61a1mr152460415ad.27.1792028978441;
        Wed, 14 Oct 2026 18:49:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:49:37 -0700 (PDT)
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
Subject: [PATCH v2 20/25] ASoC: renesas: fsi: Ensure the component is marked as opened on success
Date: Thu, 15 Oct 2026 08:43:19 +0700
Message-ID: <20261015014324.5569-21-phucduc.bui@gmail.com>
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
from fsi_pcm_open(). ASoC only marks the component as opened when
.open() returns 0.

This currently has no functional impact, as fsi_soc_component has no
.close() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the component is correctly marked
as opened.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 23b7e63596d3..74e2ea002fbb 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1811,14 +1811,21 @@ static int fsi_pcm_open(struct snd_soc_component *component,
 			struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	int ret = 0;
+	int ret;
 
 	snd_soc_set_runtime_hwparams(substream, &fsi_pcm_hardware);
 
 	ret = snd_pcm_hw_constraint_integer(runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0)
+		return ret;
 
-	return ret;
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure the component is correctly marked as opened.
+	 */
+	return 0;
 }
 
 static snd_pcm_uframes_t fsi_pointer(struct snd_soc_component *component,
-- 
2.43.0

