Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E515E2F3622
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 04:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123812; cv=none; b=fQ+I7wtpLF4mMIm/KUKItgyExxGAyrW7eoexqN1ghwVb6dDomb5Zo9r/JzECmZsJfR8vYLNFijGUwTjVGsOEGBYzQoUln1JID5/L96zh/QS81DBBhAyNS4NjUoktSo9NU41IrZ03C1oK3QI0ygkVDAPBg7mffPWQqt0kvEu3G5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123812; c=relaxed/simple;
	bh=r3T6KsS5uqRgrtiSAYChS0Ck5zpfD1Or1gG0Bl9B9YY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CSFOQfPFurHrw+sepSBm71424LXt0F2BP1zWVoHoJRHI8neFXjKpPfwjLkdKyAz6jt7zTggq5Wp3xNRYQxOhWi2xApaMmwOeSt2Fh2T1f17+xDMSecz/dPctIUhl/F2UJZdMbsofUhAbmv0Z+7G0TqdVKN+2m6/H4TjvFxnt+9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MMpSZNC1; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMpSZNC1"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e60f9af6e6so22915325ad.3
        for <imx@lists.linux.dev>; Thu, 15 Oct 2026 21:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123809; x=1792728609; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SYnQxKBL88L7bG0SnRsZyN/ibAKxj/QjIVLFKTNculY=;
        b=MMpSZNC1XX8/G9uJc3rnzP3MFyrMDOkh29r4ewGcrX6t9ANJhxVcbiQzJdftYnEN1r
         TRFwxfYXmREHszJgq4biP/UgOUubNMZBfdgRBPQqAwmUJis4+KSqPFs2Cl8HBn3n3ZHC
         Nqvh7jfFVyl1p2GM7Tuz2OXOdLMMK5S570eTvRw9vYiIh3FeXUb1TwEKaC1WBBPtnm8D
         WySJFHFxRzRZ55k8e0AixydA7D+2GtW0pL8YB+WiMqaOWXKF0YUNWqG6lgHmzHYvR6b1
         65ujRk/cpgVubqsxEHZYqqDAvq3tGAAs7NAALxOQQGKWvOiO1hRvpsDnVK0HUstm1msp
         xNDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123809; x=1792728609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SYnQxKBL88L7bG0SnRsZyN/ibAKxj/QjIVLFKTNculY=;
        b=y8nOkAcDQHF0ce3Qkqr8mMWqDkf+lS3Jz/hvmDnd2EurLtFNSO+BDY6sPH15KqbJd/
         U2Pg1t4j1yVHqsa3pRyxZ3EdbvTddC9FgiYXh8HmsVg9gIv6xbvzy9CcmqxZy8Pk3zN5
         WS5TTCZXT8k6EWDpcyPk7JWLq2ZcYp/1+ajVI5eC6piJO+R0dyy0PDOD/tbU4U3jpc/O
         zTgnfQS5X1+f6Rr/GZhBqd16N+oGzfIesIV+Cjp6SDVbFmmAm0Y14j0Xcv61fBSlbNrI
         njbYKUJ5EofB+b7NEigwoJuX2qdqsJfIHyVU0k18OT1KyGNwDYGrDoshJievQjnjbusS
         vr5w==
X-Forwarded-Encrypted: i=1; AKwUvBxbb7FPy2fg5CZq1+sgsPXjLn+J+i+czdO6EUzNGZKTvp7toWGk6PkKZhLo6EHM/dmyeN0=@lists.linux.dev
X-Gm-Message-State: AFq9FYKpbSOvDPULT5zKtj7Fyb7LgltnCwa3rdURB5BrQN2IttgLw/AS
	swntLktBlZK7jNwhn86E6aUKb7h6Yne6K6ctjAMUsT/UH4NTsSCi2bzn
X-Gm-Gg: AYBFou1fAZIF/xr3FImIsU73iDboyhI0ipdnJwSfFryx/8w0mxDOGgJWYcKQBSlS9kF
	IZTlMI2un165r6xi1WE/x4gnSkpgWPVijB5UY2Ii/bqbIJOc0eHolAykoJjssM6xeuC1B3SOmF5
	qgYsrJy2XvtHmeHqGJIoFa42j3drZaHIOGeNcCxRqCO1ZubXztC3CyHA1lEP2cIFFpEUuLXSN7c
	c4q28yqyfZf/FTm9aQhnDhxLWxg5XUcC/GJOTWdllzIwmaU6HYpZOyGYRjDUtwHfYWo41RPRDLT
	cLUQU9u/DOncTBY9KsDTBfkvr6A68EKvWz0DoMcYniKiI9Rti30CUAgPw/6WpE5ntTXJi5mqH0a
	Vo1MkY276T/9pxzIxRmFY1l17PztZOASRfZfuEjs+cgeEGT/8lI3SI+e2KjNtiV/4H17JqseWAL
	6ANsewQ89GxYLPgHnEmCu4QCoXvfFbPzVJckjBxTWhqKWx/JAxhZ0MHnjR51OZ8bYkfrYb2qkIf
	c2P3rd4gnJzHwwwSbojYgRlCBIWqWW5SZdLIfBy9/9pcgST+ZLZoc5NUuQyMuIkytdaOx23+WFI
	YV/hvs3HuATtag==
X-Received: by 2002:a17:902:cec2:b0:2db:7941:9e11 with SMTP id d9443c01a7336-2e842cd431cmr197979565ad.9.1792123809100;
        Thu, 15 Oct 2026 21:10:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:10:08 -0700 (PDT)
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
Subject: [PATCH 00/11] ASoC: Address remaining PCM constraint issues
Date: Fri, 16 Oct 2026 11:09:35 +0700
Message-ID: <20261016040946.521195-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

Since v1 has already been applied, this series provides incremental 
changes to address the remaining items from v2:
 - Add comments explaining why .open() and .startup() must return 0 
   on success to prevent the issue from being reintroduced.
 - Add Reviewed-by tags from Vijendar Mukunda and Chancel Liu, 
   and Acked-by tags from Morimoto-san and Cezary.
 - Remove redundant integer constraints already applied 
   by snd_dmaengine_pcm_open().

Link v1: 
https://lore.kernel.org/all/20261008103831.542533-1-phucduc.bui@gmail.com/
Link v2: 
https://lore.kernel.org/all/20261015014324.5569-1-phucduc.bui@gmail.com/

Compile-tested only.

Best regards,
Phuc

bui duc phuc (11):
  ASoC: amd: Explain component open return value handling
  ASoC: apple: Explain DAI startup return value handling
  ASoC: atmel: Explain component open return value handling
  ASoC: codecs: Explain DAI startup return value handling
  ASoC: imx-pcm-rpmsg: Explain component open return value handling
  ASoC: intel: atom: Explain DAI startup return value handling
  ASoC: renesas: msiof: Explain component open return value handling
  ASoC: renesas: msiof: Remove redundant period constraint
  ASoC: renesas: rz-ssi: Explain component open return value handling
  ASoC: renesas: rz-ssi: Remove redundant component open callback
  ASoC: rockchip: Explain DAI link startup return value handling

 sound/soc/amd/acp/acp-platform.c             |  5 +++++
 sound/soc/amd/ps/ps-pdm-dma.c                |  6 ++++++
 sound/soc/amd/ps/ps-sdw-dma.c                |  6 ++++++
 sound/soc/amd/raven/acp3x-pcm-dma.c          |  6 ++++++
 sound/soc/amd/renoir/acp3x-pdm-dma.c         |  6 ++++++
 sound/soc/amd/vangogh/acp5x-pcm-dma.c        |  6 ++++++
 sound/soc/amd/yc/acp6x-pdm-dma.c             |  6 ++++++
 sound/soc/apple/mca.c                        |  5 +++++
 sound/soc/atmel/atmel-pcm-pdc.c              |  5 +++++
 sound/soc/codecs/cs42l42.c                   |  5 +++++
 sound/soc/codecs/nau8325.c                   |  5 +++++
 sound/soc/codecs/nau8540.c                   |  5 +++++
 sound/soc/codecs/nau8821.c                   |  5 +++++
 sound/soc/codecs/nau8824.c                   |  5 +++++
 sound/soc/codecs/nau8825.c                   |  5 +++++
 sound/soc/codecs/wm8580.c                    |  5 +++++
 sound/soc/codecs/wm8782.c                    |  5 +++++
 sound/soc/fsl/imx-pcm-rpmsg.c                |  6 ++++++
 sound/soc/intel/atom/sst-mfld-platform-pcm.c |  5 +++++
 sound/soc/renesas/fsi.c                      |  5 +++++
 sound/soc/renesas/rcar/msiof.c               | 10 ++--------
 sound/soc/renesas/rz-ssi.c                   | 19 +++++--------------
 sound/soc/rockchip/rk3399_gru_sound.c        |  5 +++++
 sound/soc/rockchip/rockchip_max98090.c       |  5 +++++
 24 files changed, 124 insertions(+), 22 deletions(-)

-- 
2.43.0

