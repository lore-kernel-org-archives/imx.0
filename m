Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD8C26C385
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 01:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028692; cv=none; b=Yc3Br7ylxLc16l5tFAQpeq5Z1Bzv9kdqpvNcRckmfFYfP+Om/wdoYT7Dw/WKqUaib4JJpacci90mTI0sWguxEn7Hpu427ZuZyNHAYuo2CLtkWXoCk9+3xFyo/yhB5y31o+zwRDVYUZ3XERIlAnYJbSMmX+R+Z1rYZT/frd1Tvdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028692; c=relaxed/simple;
	bh=Km52EVNDvQaSKwDMYVVG/cG2sOqJGio6RIBlU/DT6nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tTQkLBsbDP4mPV19jRmWcfV2jdZJKo2QXb1VgBdzpMQs11MDSu5YC9V8iTedfVwOtWdXV/GCtJIlpOXwEk2azP98WQZ0WcfeP9jOJSGP224Cqwmgum6lfmkfmOWwfd3HROWAgrMfnzFIGR+YTVhCmPl/lzkQLsdqwdDaFlqSgvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fg1NLXca; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fg1NLXca"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e7e742a2c7so32161825ad.0
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 18:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028690; x=1792633490; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YmTMAPFx5up6qhPC8f6eIWZ+fqRc0pF4DtGB7TtfWew=;
        b=Fg1NLXca0VxVEBzRgyhLVWlNQgTIaJWJfzSiJoYSzmdYLo/7kgJKOGhw4gPgJ1RaRl
         86lzomUwX9fOhSyGw5Q/qlP0YMfKt/USHT5WRByY3+KNNG1G/EAZI6Zzy+OJ+/hjBw6h
         75HRlPuuDfcuJnMg6Tl2HK5xw8/vHygeIaQMMpcS7T/Qrz57bL/H3Xgl+NvCFjGhRxU1
         9BuIJ/oVZWcQwkzJqpMJWigXDL00Qq/LMh/Y924+/vs/FK66IH57pyRtKcWElOCA/PSP
         RlMM+KZTtNXfGtTWfQaB3YEIGGbuh8i/eBNXuyInnlKsIgGKuEPj7/ZVkXhO+wJGs26b
         hvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028690; x=1792633490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YmTMAPFx5up6qhPC8f6eIWZ+fqRc0pF4DtGB7TtfWew=;
        b=Zs7GB9vawzvbsgkTu+NaQl7lb+ew7gFo2JP0w5cwK7JItK6WnFcVuBzivNNMQ6LodQ
         fMoluTLqjPdscQlbmjbNger1MQRPQ66R/jDG6DQcIuyJkrZNPID26HXJ9reB36vY0rfJ
         ZPwkOsIAtVLWSZO8YM+SYVv2LBs5l06Auv3A2+FhvqyCv5/ZuQ/o6IdAe6v/MEJ2ls+J
         dMR4AWyKSw7QvINn3JaMKdTY9sCvKr/9rT4wXMYK5aCjvWSuVHtD5fVc8I38WNFmYaB2
         nMBpFUJW5n39gFron1NobU4Qy7LLrfhSVFeU/cZdDTsGUChttGUNmSlKjlIl+eGUmFTK
         oJPw==
X-Forwarded-Encrypted: i=1; AKwUvByB3kbprR1UZp2zg123f8C+fV4hIqDMhWH++Hdgb+nf9vF0OlR55e+NfAiQPdNt8c7iHD8=@lists.linux.dev
X-Gm-Message-State: AFq9FYIuA+VUpBj0QzO5zBNB8XxjORFAqF5r26nOpaqSLiCnf+jN2jdI
	Z4dwCwT0Jtk4P3KLC7hUsj/YHZQ9Knvgbut01dwt+N3hxmNLGFWXLWn+
X-Gm-Gg: AYBFou1vti89TvN4+sYXAlUHM7HFeSbBHmCw+bCa/5ygF7s+QcOWgfWeIdfgP4U7W6a
	SOltngWHXn4OgZ2ceIfO8iNWLrMoDUuu9PTM1cnNWG7XrbGCSUeZniMMPAbLJgIsfDCcFghAnQR
	TCRueCa5ZiQyLhC539VwR9L6zKws3XDSxuH/Pe4wbK1QXFWRBfciT3R4jxs2BYYaa6GrQS+Tzgf
	hkJybak4XVUhs01XT5DibCRtzbEIlEjbsI8O1Br/KITgV5M/0XMkfpvFpYcnV94rOW7jTOutddG
	tubma46ziQyoW0xjw0kN6+30US05++PgEYQvPBFp+/bdPpHXinQk/kXwKzFbJL84NtEpZiqzH1T
	y8CUBL4ZW84Q2FwoyXxNgoCQV29qYkpLsByuXgLfzxSvW5arGzB5YtOTkUJNtLNWRIkmwoDjjZO
	0w2771vNFNxQaQ/gspMGQAtryyhA31R6p1cC7ugjksUZPZ7Io11MGn1s516JWC5xTYwVjOHVwgk
	fJ9tmw8XDJQ5OzjwpZZ2e0MUfgPH5wo3nuKVJ1cvPBNnkbF2jBkjHSUpYkY3+xCmEBzdRivoQ0a
	Thol1zPFZ99PiQ==
X-Received: by 2002:a17:903:3295:b0:2e8:dd9c:99e0 with SMTP id d9443c01a7336-2e8dd9ca60cmr47644535ad.40.1792028690053;
        Wed, 14 Oct 2026 18:44:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:44:49 -0700 (PDT)
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
Subject: [PATCH v2 02/25] ASoC: amd: ps: Fix acp63_pdm_dma_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:01 +0700
Message-ID: <20261015014324.5569-3-phucduc.bui@gmail.com>
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
from acp63_pdm_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 5137305662ef ("ASoC: amd: add acp6.2 pdm driver dma ops")
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/ps/ps-pdm-dma.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/ps-pdm-dma.c b/sound/soc/amd/ps/ps-pdm-dma.c
index 04c014349347..12c341e89bce 100644
--- a/sound/soc/amd/ps/ps-pdm-dma.c
+++ b/sound/soc/amd/ps/ps-pdm-dma.c
@@ -211,7 +211,13 @@ static int acp63_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp63_base = adata->acp63_base;
 	runtime->private_data = pdm_data;
-	return ret;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static int acp63_pdm_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

