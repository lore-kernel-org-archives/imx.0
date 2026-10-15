Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655FB368D5E
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 01:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028792; cv=none; b=ZuqETSrlEno8LSiHhnoBJI+GzAFlIim7yMJx1txLl2e8sLg+o+vkOKrO1ImVxWtKbkJ33Ogc6BEJrKHqyi3sV7crBcKpR4DoDyHWu1btgQcR57nVDCvr6LiF3EJbCvE2HxGAWNFa9E31+9drcSycBQu+1gI3bTd6G5exp9GXAKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028792; c=relaxed/simple;
	bh=JyLcEpuVNYAJZZcS3MtfM//iTF4DoBGRH1sMBv09uo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kUiW0d65FBTwxL+ey8NELGn77lyAVrvlN5M2hotB7Xidvc78iV58QR6D/jqGM32ganWDoT2jRgLc3ZwklhONd04rlJjRuexOmmbirlRQAxrjOX/eRU+AHBZ8NiPHX6YAJMAv/3lOYgdqhq4rTLTP1oCeX6aVGUg/D3z6wg3L9CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PlftQLiW; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlftQLiW"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e942864693so5059235ad.1
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 18:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028788; x=1792633588; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FVoaE90uxAa4MGE2u5YmtFWHqpvVUok70EqIpA+eTKA=;
        b=PlftQLiWz1YvvJSfw23KXZfbZdlffswfTR+iylhIyMWQRfi6oJVXLH99Ysnez2Y2Q0
         lfh9w5FSVhHP3EVjbJmMxF9Hf32Un79PVrjt5walzaOqfxIX4wUuVHnwq/BI1tjz28f0
         NP5hE9YTh/ZLoaPvYwZ5eYHYJ+/fJUZU/vGnggAw6WN1JhQzUVQeaOl3W9yHvOoW/ryj
         7PEGipO3BNOMzvakkgU/2gt9nksLiA7RH0bvCBl6aQxfWLSnGCJZd9ZcanmWsovhnLCQ
         d5M3eisfyqQtVTGdFOyesi1gYF3OiLVPLpTUvy64TcvvCgQS9xSMa6wI0El2hYkrJxtt
         XSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028788; x=1792633588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FVoaE90uxAa4MGE2u5YmtFWHqpvVUok70EqIpA+eTKA=;
        b=I5Glw5tUPfIDNpvwv0BIQAEwOmbt3YQeINK/FbB5dkzp1q2Ttkyn59MtaQSfD6KTaG
         +4Ky6wtOq10QKU7gmaYtblRfUNYTuMf29ATE1hFhkxz5F/H6SO9AKVhwoysDjrftzLJT
         Oz5CTInc5rhaQkV8A7d3g4YN3K8lkBcKXbyA1zP36tCZV8VJJ1/UJYhHdZxuPHN8x7dy
         H37vJBgKzSXG6rj56CWr6xijxkfxEtk7FcAV4+hSLHTaHfpvqE8jV7uDcVBwYC8B5IY6
         TiCmUj5U6BiH4xhsGxJ+ig/yMuvfkkN2zaDd+YFWeX3g2o8MJ1WR+lQLAiukJ0NO9dmm
         OdCA==
X-Forwarded-Encrypted: i=1; AKwUvBzNjjdQT2ZfMTeQgN77c6fonKgVLfqFHcIgYWpMnubZg1R/HZQMWtZYoYlQbWqHTKoFqW4=@lists.linux.dev
X-Gm-Message-State: AFq9FYJR8l1D8luFM+C8shCqU+HFy0aV2RA/gBP+4WcDb0NAhDlxKxTi
	emvggc4Ewu2yTbSXzziE0umFx509C5RJ85Xv3VyEfeSleNcjltZihy6E
X-Gm-Gg: AYBFou0wHyR93Z1nMhatVbquK9pf200FSW3RzGtG5B8Ib1IgNmxWo/l8O9Zcz/G3TBR
	0JsH+B8Cs3BS2TsQhSnRrbnf1K3dDzebtcPTmEmxj61EmIhXxSWyxeEFTfsw4VAV1cL+VvM47Ff
	vovIUIjdK7xLp9o8cOaQP+XG15Mrxx0D756wXuiyLBF+N7laUyCzD47mSgFhb7cX/R4+JKqrGX3
	avAVu5URmqpr1uV5+6ELRoijS8mMwHtZ1FJqPDOv98dPHEywttJb5/epQ7sZDD7OG1HT6jDhQSc
	vbE+K0M1k3CMHyOeHi46OJger+/A+VHv88/arUZiPXn4Bl3PKmzWmqNCnr/reJATTZ52hUbkMf0
	4GKJyC5jvJRdHrg/eG6HeYL9629icSR946nCHzCy0eO4zg+txKrsLrxkCMD9occPMt36CHlCNAr
	nUoHIXh6/yAO14nUxX+VZpIQIJHkcrGaez1ct4p/0LkA3gxsDM5yhV2WiwWLzMgyV/98doitPLa
	EQ+R2U2Waot2iuIg1NsfOW4atYE/zDR2LHYPdrWJel7uzit3Bwewdl1CtKQhxPr5WTaW8N0hpKM
	+4DJwiReWksWvw==
X-Received: by 2002:a17:903:38c8:b0:2e5:e3da:be04 with SMTP id d9443c01a7336-2e84304792emr134212015ad.59.1792028788486;
        Wed, 14 Oct 2026 18:46:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:46:27 -0700 (PDT)
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
Subject: [PATCH v2 09/25] ASoC: atmel: atmel-pcm-pdc: Fix atmel_pcm_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:08 +0700
Message-ID: <20261015014324.5569-10-phucduc.bui@gmail.com>
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
from atmel_pcm_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 92dfa6198623 ("ASoC: atmel-pcm: split into two file")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-pcm-pdc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/atmel/atmel-pcm-pdc.c b/sound/soc/atmel/atmel-pcm-pdc.c
index 374f93fa6e0b..4cedf2ad934d 100644
--- a/sound/soc/atmel/atmel-pcm-pdc.c
+++ b/sound/soc/atmel/atmel-pcm-pdc.c
@@ -295,6 +295,13 @@ static int atmel_pcm_open(struct snd_soc_component *component,
 	}
 	runtime->private_data = prtd;
 
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
+
  out:
 	return ret;
 }
-- 
2.43.0

