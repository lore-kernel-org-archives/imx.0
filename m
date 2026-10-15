Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5855B353A66
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 01:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028747; cv=none; b=JV2BPH3m0iMNpqCLeVm6pIyVFZMfGx0zR4/TOJlKaikZBmSML7SjLaHOmXDOZQdF5Lh9ab9mV3UdXmdJzb8nscM1Q8gSufdsXhiGMag9oYlVFMryjmqZAaYbsls97FN6ZkvDVg4O23uyhjz3cDiwrG1btwNHn98oH2DFP65dZTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028747; c=relaxed/simple;
	bh=Qod46+lJKzs2otcbuUwfMMYT23zkjG47R07TZKGmCbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tcbKcNN8EvK8jnJxaqy8NbW7DAfdUmCE0t4TveX0O4I8vXFAuJ5mC0QmB3VDEO+DAPNLiZG+N2qdoRWPLbRklnGHnde+vN0Y/ehJYZxm8+cmLBmW35Fgix6MgmXeA+wggjvjpno6xdSGAV6pQWTRLIcolECc8oOGryz/tDCfQUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c49tDD2G; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c49tDD2G"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc147d86bebso2615691a12.0
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 18:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028745; x=1792633545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/n4smlFZhMXZJQElrsN5vEKX5hOiO4PseO+WVYrBqMc=;
        b=c49tDD2GaPVGlaCCXe679ndhofhmNkRkONYFLdPOPsprzXN6qr1SZ3IUdMnowEQ76/
         S3KFuYrAJaS1lkguyLqlkaJUDz9xsYDHyLOwhSZgIHFSbufI5cfcV1KUSPQ/hS+i4EXn
         Qg0jOVZQML9QbeBFhuI8k7atkdEoFm/llJYfLM8UAdMaDE1BJdCdnIkv/tc8lW2If5d8
         mP61pA+Pqae6TYOAIEDwkSDc8QBX2xngyMfVrDrQSmut3JfhcQ7q80JE2J3J5wJeBs+V
         Xk+lW4qY0BE9LEoXDdOBVYhJsbxQXiS93oTdC36UDMIVze3Un9cBx8kHiONfcB2L13GS
         O1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028745; x=1792633545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/n4smlFZhMXZJQElrsN5vEKX5hOiO4PseO+WVYrBqMc=;
        b=tP/FnWOXcfFiUA9Fv+PVuJiL2stbwWLR5fPyelOlv8nH8UBGQxE/MyqYG1FV+ecwaA
         F6WZfx4esHQhAWKir1nNbZQQpHnNBKwZ7r+cF/CgvUxonX+E5rSaS/Q9yYWYgzIiG4iQ
         qgFEZATlhmnC9l52rgB7RFt+r508p8kl7igFbm9pfd3Co2L56SUqnWW1Il0+MKx3c1On
         XoRUBAI4HbBxdr6tTrIk0rvmHjzwlmN2b1hclgENL/wobdiUUMmjKxxlmZQyPV5WEkql
         h02feRAoujmecob7vVD9vC3ZY3eTe/vNu9KiWes9u78sarF3yGBPGye/u6Hf1v9a4NPZ
         1Dxw==
X-Forwarded-Encrypted: i=1; AKwUvBySTAZlsYVUNp7+b+rZ+kGg5YUYwwkXz3FSQhOf+WxXxTHnfTYgUo1233qA1kRnH+bx+co=@lists.linux.dev
X-Gm-Message-State: AFq9FYLymedTcBLYl8XpW6nX2GCi0auJC4EVHK0yZHuz+v0yU/3+5sOo
	ZO1O/KQrfqoHK0MuqkMDD3owiNxD8yHtjoSv5GRGgS4vnhrUUx70tB1P
X-Gm-Gg: AYBFou1HwL8wGtXfCGCNgMMXA9pLx6nVe5Qf3si1EEZrUCsElR/QPkNcP4j/Myl3MIK
	dW0JAHnKp8UBTHC2xlj04TFfhS3VlXOe154yAzVgfp3pH+IJ9KbToKyk+cXi9OUSsqaCuoVwYRI
	hA6M7tmavalVqnL20MfA+kM2nUmRj8G5jrjRHbvbCevS55a9LvC3nxgVLZuEaI577zLh1l9vjH+
	ygXjLya9Q1wAlcLj2pHjdTnMoIWcToM8PcZFs7XhH5SlTst2VK5dKR6hR9DUwL3ZT05p4E7eaDB
	1EQhl8mq7N1wnTirHGrqPWqomNa5OjC76A3qTloV8uOjmiHUUm8RgCKl6d2F42xJSTmBYeSDBW2
	vX+e/VPatUimWaJBJMlfEQhIaA0LA/5K5WiMSEREW4bVmR+q64a6ID853kmlYyll+D0dKylOjRr
	4vLEcVunmv9fAdg3moalhlAgGa+QpuSb2Qr+pW8oJmCec5Z4rvpO7QACKhfodFt0tHdhKUXtb4s
	EO1IvGfIDIbHj7Z3OZ7Wiv1ULvWl2f35vTFefYyIqXmPFyRY24BaGAtBaHw2ecUYv6TLvqhLcA7
	ULe8q7lca8IRTw==
X-Received: by 2002:a17:903:1b70:b0:2e6:e9a:eb48 with SMTP id d9443c01a7336-2e842f2d257mr110492185ad.41.1792028745495;
        Wed, 14 Oct 2026 18:45:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:45:45 -0700 (PDT)
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
Subject: [PATCH v2 06/25] ASoC: amd: vangogh: Fix acp5x_dma_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:05 +0700
Message-ID: <20261015014324.5569-7-phucduc.bui@gmail.com>
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
from acp5x_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: cab396d8b22c ("ASoC: amd: add ACP5x pcm dma driver ops")
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index 831e30e9b042..72050fa2de80 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -231,7 +231,13 @@ static int acp5x_dma_open(struct snd_soc_component *component,
 	}
 	i2s_data->acp5x_base = adata->acp5x_base;
 	runtime->private_data = i2s_data;
-	return ret;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static int acp5x_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

