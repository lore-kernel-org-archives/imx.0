Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D86B37F01B
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 04:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123924; cv=none; b=tC1EarIweUQmjwop88ioOwV0WKZQYu9BgY5y2VwoVkUJNKuTrjCf0a29AZX3acDLQWslEWK1L/2bahIDjJ9XFCD0vM+kDHHCrwQvhjiDcTNS7nXHlo1+KdKQxBcwJpoTJvPGZM4XgkPLm8Yln2oyrUbW8Dtx8qRxC9+faAS7q3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123924; c=relaxed/simple;
	bh=J+EeYnRsgcM/YnSU55c+lLcyk00OoD5ti7bbsMzTw18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZrUpoUapRf0lMXlAhPcn/fvl/KGSCwS+uPegeMEq770LuuSMHjBtc7on2a9oY/7OLQxcv3gmJVH4/asak8vbnwpHDDPT06ciV8LCaQ+kaZOs9qa9OSaxNK3GYyiAHYZ/pvyxfmAIYLUcu4dDUY51JRTzFF1zkdQxNY8rC5QNnJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtSJTRwZ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtSJTRwZ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e946155442so20861825ad.3
        for <imx@lists.linux.dev>; Thu, 15 Oct 2026 21:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123922; x=1792728722; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7rWy1nSOU2shSy9HWS2JIxQi3sc/L3puAcABYmBjXjQ=;
        b=OtSJTRwZqj87qbq4XlFAcJM2rygoNb8t07UozZeQaNPuXrNZ0QD/hUNS119FeasF+Q
         5f2oNkupULi3aw8oY+OUZV6MgiTlY244KUwPq5iU+S+p1XjP87BWz0GD7FNorW4eHEnG
         U9YQ9envir6vJtPxQyz9KMC1iX/t2twBY1EB4nzTHTbDDlTqRNyvzXmnSuFLJHmss63J
         CwEs6Rb6evzSEaqFHwcChS72rnBzDIZNbofGcRo+8e+alSnnZcPi8pOYhhoiu2HqGiIo
         Rr1ZUrTEFYe6GR++e+NhXPyjwysgBQBGnksj8kJvvsZe2z+xBmUyBHq+xozbpfk93i2c
         luAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123922; x=1792728722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7rWy1nSOU2shSy9HWS2JIxQi3sc/L3puAcABYmBjXjQ=;
        b=08GAxVWw7DDuWhmZUc48l4lRfJ4zCTN12F4FUfNdL3ecP7VT3SwQzuzhgzqsdqXXp6
         QixkcgCozuA0Ub9tUCac6f2evFL4eWu/wzzg5OmybmujoqXz94UbdCoaNbJcxRh0vju+
         bbovWf7ROW6gZsQ7FazKkKSAIwYLWOPOvYGFOZ0Uhn3GDNuJI52RxKY0BX/J0os8KafG
         B6laSXpvA0PV+khQj4YIkI6sJ+t8npfsjEK9c1fU6WEImjcEp1bsQaEXeDhuW8klZcLq
         B6LcNHNXaoRqqOzX+OstYSXL9RJearhvrVs8sBCverxGYxzVrF0A+xm+9KC++ypQhimK
         czrQ==
X-Forwarded-Encrypted: i=1; AKwUvByBZK52I2MybCqBu/bzCswKhTDa3BPXP0MtKB1gq9lj9M7oitGsKhddfXc1ziS88ZRneqE=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ+5tvQ7Edwf6VJLoA0MKDd3ErsvpHy2hZ0JARW2jjyuZCsvxpM
	3axOOIRE/0pqEY5wWX6c8PJNG/rQvA9ec8P2QkmJFJhjUNhy4gHcdrc1
X-Gm-Gg: AYBFou2/Vqmx/8z6oaENgrUsrpYakmiDvXkuL6OZ+zTFgvt1QkhwgQGiCYfVmB56Lzd
	DYGEcG0qg4UzSmtYn6KfWG1DMj/tXSov/QT+60ZiD3bLlILVLHU8BET7VO4hqpswTT/C0qLhgjF
	WfzNA5qfq9qG+3K1U9PKxL+Kt7iTlDeTJjoDntPvRXL6KlI+fLorLjs0J2pMrvVYHSyhak05rmT
	sJqF4WssRIaDZlRzascP1ejQYu3nQa8JjSmQ97Oa7TYJYul6jfB8y5xouJL+advoekvL86HJlJy
	v7kEoYI3l9RB/RDwl3gcPhFmwYAqnLdnqCDQjKa/fFaly3qoOlbNsoILCQrkdnzjAIDEeNNt994
	Om1WDV3th5583YGQBMkATsglSw0ya4p3VXBvsBFFwc4WchAjwPq0HfpIO7kT7Ssziw5O7lW2Mlc
	e1mV5aCfpg/qxbml5YVnu0HipCRScb3ezNfcRerbDBs+LlXAU/8BsmPshLQPDvOLE65QrWsFMIv
	BDDCh8gyEOO3enm3/Arz9YEYrJU45zaPcqTsEjCzctoxEQtH3x0hZr9CvvdJt620Yqo1th929hX
	ZOhqwMifJpVfBg==
X-Received: by 2002:a17:903:4b4c:b0:2e9:66c4:1717 with SMTP id d9443c01a7336-2e966c41865mr35460075ad.61.1792123922489;
        Thu, 15 Oct 2026 21:12:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:12:02 -0700 (PDT)
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
Subject: [PATCH 09/11] ASoC: renesas: rz-ssi: Explain component open return value handling
Date: Fri, 16 Oct 2026 11:09:44 +0700
Message-ID: <20261016040946.521195-10-phucduc.bui@gmail.com>
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

Add a comment explaining why .open() must return 0 on success
to ensure the component is correctly marked as opened and
prevent future changes from reintroducing the issue.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/rz-ssi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 2e297f721bb6..9f36fe2c16d2 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -946,6 +946,11 @@ static int rz_ssi_pcm_open_pio(struct snd_soc_component *component,
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure the component is correctly marked as opened.
+	 */
 	return 0;
 }
 
-- 
2.43.0

