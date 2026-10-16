Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C67374A0A
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 04:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123938; cv=none; b=Vsqx/JW3oHve8mse9ccoODKX+t8LPGKr7rQs+MItZL1UuLRogzLbzK2/ojvV5BKmpyZg64s4j4f+yrYAcrysFp5SAgFDIJbr9hUW5I6RNtegMsC5CfT76rbeEdmCSQkrndf8/82Vpr2To2IY0ARCy52qWRuFNNv7ehtdoPARRE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123938; c=relaxed/simple;
	bh=Gs9t3eNuKnVFUO3uoF5nDdlII68A+pSb8mn+aZ2CHts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mJ3cycl8YgWB9XXX625Grimydnq9e/KVOOzLrULbI1xmTcKiQyOKtTLPge7KXHYcE3QbFZbQysoOmnCvFgjPAfZfLq7Xsnkj0rXMlcRZSdHyerZD74HRBP7kHuOptjQYkuK39T9A//vcyDVcAwu0SHI670Wxr3tZwuTOU7qkgDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGyeRkxU; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGyeRkxU"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e95bd1c14cso13869725ad.2
        for <imx@lists.linux.dev>; Thu, 15 Oct 2026 21:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123935; x=1792728735; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AZDJdjhNuFXFYn0yeoBtoVorlOWOlf41UfMI392qg0=;
        b=YGyeRkxUsZcADDijv8/I/MMNOe7ul7fkbQWf0/HEO3sFB4HrUttcHnqT5Itt6Kahhm
         tVcX4RoNjU4aNVNd7mMaSmqsJKuwcFvXgtunS2uCUDEKbciO2OhAPXvTOhZqfautVGtK
         zgg1Hr+Cu2Aom1IruhDiDYCEVV/kkipgPmaTFcrnwxz8z3zGIfvDrNUuWweEWR6jWB/F
         yHOABeWR/KrGwi7HyDrm1FVYTLC8J6gQBOEvP1a9yyHZD0sDVkvKFUmLS3Rknuh6IDkW
         DQ2EP9BKsiXSxJbpn8kvaHiC9LyfkELxxgpuPXCxR8xItugRxe822IZUCvvINWvMZ347
         FLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123935; x=1792728735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7AZDJdjhNuFXFYn0yeoBtoVorlOWOlf41UfMI392qg0=;
        b=HSJLdYi8ca/6VXkopZWutRNIMxZk4XnYYxZt55N0GansXikXEGCTY80vrbYfdLmwwd
         eJScwiOe9jKn9ggkTc1eUdKZaPprffJZhxb0xTG8Sq/8W+eOuJYFhMZRY2yxXG1PjCd9
         5c8P2W/IKbU70XH+qHYNST/BJUAMPrtQYMXE7KpozxvbpJikSla6Qf7ak6+9/7M+e2co
         LS0KxQkO/0MutwxU1QjCE5/BqFSXschPM6vA96n0Jg9e+FEFxBCbrfAr3Kn1xOS19rn8
         8/JEl5tNuW/F2C+ksR0g9JDzeNW5I1gsl+EyxUVUTSM3mPjVWdx01WQ4sDJ7jDpL9rpd
         H8aA==
X-Forwarded-Encrypted: i=1; AKwUvBzPH0SpUDB55F5XYh36DQYbeYQl0fzeJHU7YjUkqgkeKTcYvU13sOvVU3aP9RAT4ZVjwqk=@lists.linux.dev
X-Gm-Message-State: AFq9FYJzKzJD9qtw5ZE4KM3xBJ0iYO8U22vYPrRf8M/6BKZbQJjAC6ZM
	23Ai+BdIIqI5nita5WlGcl+eJ2p0i89B/d+bb5hUj0ntpyXb8h7e44ZF
X-Gm-Gg: AYBFou2qQeEAi1KUYL1IyoLv43L2nsh1ckJcrvOkN65KRzJsO1fLS/1gu+1gLxPc/GW
	tCqMYfskFUpMvkpO9xGwGpYFOmwfoT/WB+Ouiy7x2+Ia8quUii8MEfQZGnjsLo16uEwij4+3SJ3
	by65vyN2TasXMXhdOHikQ4a1pW9hiGgABldULPhR0juI7ZpzY82tOEiLGLyjtK4S51Im3VNqjPo
	rf3FA0RnKlHazxz8TgBBwrVbKECYzj+6UuvjVmgn5vj7B07mZCbuybu2XnGzMINpqmNUygP79iP
	HtjsKcFD2TZ4ZRjB/USZUQjpP18Dc/olXfZTbVA7NSno2w0D/M9cnL/8xmyeP0GV0Rzya7fz8El
	qfKLsG1oGTDR3Gg7NBW3YlFKp8CE18meXnA/JB3xV75bQ8z83aGErQcKkuwz9My9ao3lA/E3+mv
	m771upsEMq1TjghfXiO1+ryqYBoPsl4cwdC6oBL1VKc/GZECufabA46zE2lVPJdL0OYXFcfRgoJ
	xeArNXAthefGvpKtCyn5cnuLLKP3yHFHXCWtTpR0XxOMYiIO4/GMZla8jLe+cOHiVDiEeCENDyq
	3dtmWbkhc3DABA==
X-Received: by 2002:a17:902:f70f:b0:2e9:660a:7944 with SMTP id d9443c01a7336-2e9660a7bc6mr31481475ad.58.1792123934758;
        Thu, 15 Oct 2026 21:12:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:12:14 -0700 (PDT)
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
Subject: [PATCH 10/11] ASoC: renesas: rz-ssi: Remove redundant component open callback
Date: Fri, 16 Oct 2026 11:09:45 +0700
Message-ID: <20261016040946.521195-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016040946.521195-1-phucduc.bui@gmail.com>
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

In DMA mode, the generic dmaengine PCM component already applies
the integer PERIODS constraint in snd_dmaengine_pcm_open().

Since rz_ssi_pcm_open_dma() only applies this constraint, remove
the redundant component .open callback.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/rz-ssi.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 9f36fe2c16d2..9a0781bb072d 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -954,19 +954,6 @@ static int rz_ssi_pcm_open_pio(struct snd_soc_component *component,
 	return 0;
 }
 
-static int rz_ssi_pcm_open_dma(struct snd_soc_component *component,
-			       struct snd_pcm_substream *substream)
-{
-	int ret;
-
-	ret = snd_pcm_hw_constraint_integer(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
 static snd_pcm_uframes_t rz_ssi_pcm_pointer(struct snd_soc_component *component,
 					    struct snd_pcm_substream *substream)
 {
@@ -1017,7 +1004,6 @@ static const struct snd_soc_component_driver rz_ssi_soc_component_pio = {
 
 static const struct snd_soc_component_driver rz_ssi_soc_component_dma = {
 	.name			= "rz-ssi",
-	.open			= rz_ssi_pcm_open_dma,
 	.legacy_dai_naming	= 1,
 };
 
-- 
2.43.0

