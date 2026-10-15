Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B6534750F
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 01:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028706; cv=none; b=ryzUm2FnyjFy2Sz7gwiZ1gPEVLAhTbElAuMhlUhc2jtLuFt9m4booj/xgov8Bk3ROAj2gihZyoy1L+qLrozaCxk8MnYMS8BJ+DyQATcgy4dwQZlZZBMKHDYu2Z98pbt2IO8pQS56nTcmF0kaAJAJrqY8Sktsb0hdCdfco8gQVlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028706; c=relaxed/simple;
	bh=GOpvHClNFcgwMbCGA4S9aUo3sNtP7+Tu6UirQoDa9Rs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GzedcG+9+E1qvq3MaOikGM89C4yUzeP4WpOqfpSpCjMwRCy3REdcAUZBfV/xj8LMT152Cj+98xRZYM9qZvKRO8M7NBjqkqGO8LF/pBTbsxhidYcYytXQGlVpqGy1yc7kECJo0LAc67ZdMeCGOZi9cG4OLpdx4ATmOyDZrKKH9oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bUwIMxrz; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bUwIMxrz"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e82462a3f1so9141335ad.3
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 18:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028705; x=1792633505; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHQEAftjxeSOQpgNapgwf4pKKw/+LL69dyB2CtXEGKE=;
        b=bUwIMxrz5lwMjVmvVOjYklWH8k5Kn7+ZP2kvQQRoB3M9pPXdWB4tuu2Kywdc33WO8f
         oRPyUXHhBc4tgzPx8bv5XyEwqQVbZEQmDEVzLHjy7ej9qeJEeVJxdh32tXtFTiyqF1OR
         LZiuxEIU0ur4hdIwgoBIyppaDgriK9W3N+jqcP+hQsvc81MkWP0e9XQb7VYYlUb3VKzz
         2X7MHh29mcgcOPKTFdWb5lQxO9/3fBlu+uFcCxQ9XZMJFS7/UK5Lg9T4uo78G3OYq06m
         OpYRSysMFMG8nvYfbYxXoggBIX5Cx+0SviDRU1LWp24fW4Ig8Am6lzhLGacEGMwwHKm1
         NA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028705; x=1792633505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tHQEAftjxeSOQpgNapgwf4pKKw/+LL69dyB2CtXEGKE=;
        b=cg/6gCjxQ1+ri4xC1XaOkCf6VJMdKk8/5lOVtJLN3XeqQJZwiBraXcTbPe0Qcy7ZLy
         p3Getd9sDOaiP+mkTBaykZCFe4rQsKgtMFzWF0FdaDXffTzGS0t/msMzE8a6OLZoPh9L
         ZkzsN5s49tX2Cxwsp29gInx9A/sUGBeNRPyVSui5Ozlm0KQa0XIWqRlmwhJu30PiW0by
         ooK2I/QnXryDBE3Nyq8acoIYQI5qqE7C20J0iD/spiaWhG4+FEj44/ECJASKiyUfCfGx
         ikEwILcixAZVUa0U+cwmKuqiMcKMUBJL8jze1RFwntkNCvB2CWjq8OdCBsP6wU7SqE3n
         eLdA==
X-Forwarded-Encrypted: i=1; AKwUvBxHBZKBCJiKtBmoy3tzospGs2xattRzneONOM9rMEDZVPV9iM53xfXn+gfd2AdSehtHEkI=@lists.linux.dev
X-Gm-Message-State: AFq9FYIBXUfLuiZaPHDH5Nm51GUA+o+uZYQ8ilRsD6ptWYf5gDVBmonl
	tBMtSTHQWNWuWuxrdlqh5DDwKdZCgE6gl6hBCgGPUdti4Y3Me+WHJ6Dh
X-Gm-Gg: AYBFou0AflwzDm8CuPWkhApS9ZbQhqcK0KYVGLHtyq8Q1n3knApnXgcXSVHjmIghJDU
	NPqsUUrQ3PuCnqKR9YtPIOzrH38ZI++uRJ0EIEasWqES/iyilZk76e+HbZmf+FrsoaAFHiPl/uL
	Ncsu1cu7q3e8kbr5FEIFXOtmCTw7e+5Tp1RX9f9HOzAMODZNSkk0p1PwhmH3OQH1ehH5qt5EZL3
	SGhPRfQOcquFcv7X4MIFmUohHLw9/kgsxzjzDU9OJIrk+gBf6A1rBy4lSBrWijdpZIzRprHjFXc
	E8Mjzox5Caw9VV3epOWFR+Dff95OEYpWaJ8CBICAgvm7Q5Kgfa2Uoak6dBoyl2ehKnO2GtyYS3k
	YOQ5wzgpyo/GH4dNGf9fqdjGjQK3EM0bevbEn63PbD2/ydQUTsTUAmGyHV0QANDjJzB3snm9r8U
	C1fkHpMa8P/q03Rgh1TKNOnV4inxjpuQnS3lU3Nyv0NGg6tcja+uuHBMgXsgx6rSaZKtEg1tZZl
	T30molb9l7EaajIRVwSIJ734SPjProoCBCYQe2o8sVG/Jv+BbUqU4tsJvO6i8lIV9VG1C2d1qf1
	kagQnCpzvAPjQQ==
X-Received: by 2002:a17:903:110e:b0:2e9:2a1a:8b69 with SMTP id d9443c01a7336-2e92a1a8ba7mr50722885ad.55.1792028704623;
        Wed, 14 Oct 2026 18:45:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:45:03 -0700 (PDT)
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
Subject: [PATCH v2 03/25] ASoC: amd: ps: Fix acp63_sdw_dma_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:02 +0700
Message-ID: <20261015014324.5569-4-phucduc.bui@gmail.com>
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
from acp63_sdw_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: f722917350ee ("ASoC: amd: ps: add SoundWire dma driver dma ops")
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/ps/ps-sdw-dma.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index f27ebbd21379..c2640985f54c 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -337,7 +337,13 @@ static int acp63_sdw_dma_open(struct snd_soc_component *component,
 	stream->stream_id = cpu_dai->id;
 	stream->instance = amd_manager->instance;
 	runtime->private_data = stream;
-	return ret;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static int acp63_sdw_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

