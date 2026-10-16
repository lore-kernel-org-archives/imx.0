Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB72333939D
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 04:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123826; cv=none; b=oKb24JAfjlJSKk7ZQ8jcN0G7yB/ypxj1geUqFjpvI19jPjaeLcazdkby23aAnxHpx1vNpDPrxxlY0B8qph5t9YDARgefB0nLMO/oBD8RUYCRGmXAvQMxVqQOKZGbc5mKOtmVQcEqIhd2DZpzjP5zQUBVFVJ8COsdFQHGn3schh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123826; c=relaxed/simple;
	bh=V7YkcGOeqeXCi9lDzvM4uEOXSB2T7RzqTJxl6SF+/ug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Htrp4ICFnGLEab5RVxQAgg431LLpOnGbOd+WPffvGe1+ro9f60m7fSz2xLokPlHDTYqVbVHmW6+Ef5wDE3CO2136oYxb2leOblF3TCDZ+ud2o33nKDE9p8CUkx9ovYBIIrMOkgu+l8hDtjetx2L8peatDqf7Ebgm0whg4xWeRnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggccm3dJ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggccm3dJ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso18593925ad.3
        for <imx@lists.linux.dev>; Thu, 15 Oct 2026 21:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123824; x=1792728624; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LqPJpnpDl1bjZy/2WTSO/k4hLO3gGJGG3iYDq3mgh9U=;
        b=ggccm3dJt6F1UTq3VbUNWMJi4fWKAmAJWlUVJXqeT4I66BPrW55j5ffhomqLRPrTUe
         QS51U4sYrr3x3ZnwIRNmhtLGbzPIoMvkyTgZ5L5/65C3xYbHTfX84kpOdMOLfgj1c88H
         8WMkgOcjckZOflx5kPIbHuCAaxLB4olazNCoiwbdwWtXiO1kIAwT0CG/ILLEs6G0WZtq
         sDWleKZl5CBS55aF/SNMRMEPoEi/HLLO7z/xQ6Yz6C57AlQQOBwr57AxV8O/AQqK/xjQ
         4XgQw6TDx2y4RGhQO1TDFwVq5NIkkLtBRV2hVhhoxM1ihCW44yDHAIcTkS/tZ7TrHePW
         WLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123824; x=1792728624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LqPJpnpDl1bjZy/2WTSO/k4hLO3gGJGG3iYDq3mgh9U=;
        b=R5z4ZGwsq97UnGmgq2TMHWi7efuvnlpoOr/noJ/92XmWX7I02/l0FdPn+lTwstfX8D
         7QmokDuxxBtnEPlAWvbv9fygdu5WDVDYYFS8SFCspLMbF+wKKM9/iSo5/WSfUDdrFv95
         z1I28CL2/2sdkefcycHXDHM3JCxACPsuH0SseCt2HfcMBh2FMERERJw17+lRHIxVqtYM
         GUPEFKNXHvHpy5faGwR6iin61Ap+mfnxK4v+pnd3zp2wd1KttmqyFtNiqeBFLXrmmHu3
         f6Rcuqejth1Aknjfed4+caqyfu3c8HpHQj2r8zadOnEi5dge8Uq+KD049B4x5qjjR6Wy
         QVcA==
X-Forwarded-Encrypted: i=1; AKwUvBxwNUPWChK/pJUHQCuwpf6XjOsJ1i/fazmwdmgzG1LD31astLSN7uvRia6iXx4WqaVDNRg=@lists.linux.dev
X-Gm-Message-State: AFq9FYJFywwzjwyvCNq55DrKUG2ZMF4cI2jOFXS0Kf9ArJrtyU21uKR5
	p48hCaPkHO6FtspfgvqbIO0kJe01u37tAHK9iR3cmYENWTYyLOVoVfg6
X-Gm-Gg: AYBFou27mGHGDn6JDHRAFMilyXztSobxDZY8zlmfWbGjW9QZfvxbYwwG1VuFznGM7vA
	u7GL1lEdS0ypOzDpox8F6kR0JxPVg97mpUyMurkJmROK1Ii+FR79C3GGPzw6Z9Wk33qo7hDxO+S
	/0s2QgshMkM/ZXA4vgUpPvtGDF3nYL8ambjvo/XNAtNUrK75JyOswK0+c71MKyl0hD2J4boj4hu
	60sQoMiqskeHZyopextEONsT12jsNvQIzBVx2vfTL5xLeuwIqnBXItNUtrcVZlaVhv5ZzZv1pWA
	KirYJzErfyhGgUlbotNGwBrjmDBm0q1rIg2seTlN+F32eKrWXqI0q8v2fRWZSj6BIWCQ3e6EkGr
	EzW4wFY1YDpNesaIfZ5zcbPTMj3tc9anD50mws2APzGAl0ey449raw/xjOd0xDJyoXvY4BbvgvO
	ou22Tg2g+5GPKYc3/9qes/2I0EwRIIeOERYf5DdqLqOmKAw6awaovKAvCaNjRS2djwOO6MSmIGp
	y7XJ6IKUjKpAIinWZJos8KUnnViW5JwccQKUbtn9Li2ovFVO2SUOxejGmWXRKOc1fCkpG7wA6NZ
	QwvtBM4ABXXGlg==
X-Received: by 2002:a17:902:d4c8:b0:2e9:970c:2c5 with SMTP id d9443c01a7336-2e9970c073cmr381995ad.39.1792123823874;
        Thu, 15 Oct 2026 21:10:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:10:23 -0700 (PDT)
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
Subject: [PATCH 01/11] ASoC: amd: Explain component open return value handling
Date: Fri, 16 Oct 2026 11:09:36 +0700
Message-ID: <20261016040946.521195-2-phucduc.bui@gmail.com>
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

Add comments explaining why the .open() callbacks must return 0
on success to ensure proper rollback handling and prevent future
changes from reintroducing the issue.

Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/acp/acp-platform.c      | 5 +++++
 sound/soc/amd/ps/ps-pdm-dma.c         | 6 ++++++
 sound/soc/amd/ps/ps-sdw-dma.c         | 6 ++++++
 sound/soc/amd/raven/acp3x-pcm-dma.c   | 6 ++++++
 sound/soc/amd/renoir/acp3x-pdm-dma.c  | 6 ++++++
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 6 ++++++
 sound/soc/amd/yc/acp6x-pdm-dma.c      | 6 ++++++
 7 files changed, 41 insertions(+)

diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index ba6dfe8fb6b7..f2c8853775ad 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -248,6 +248,11 @@ static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_subs
 	list_add_tail(&stream->list, &chip->stream_list);
 	spin_unlock_irq(&chip->acp_lock);
 
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
 	return 0;
 }
 
diff --git a/sound/soc/amd/ps/ps-pdm-dma.c b/sound/soc/amd/ps/ps-pdm-dma.c
index 28e0686e9373..12c341e89bce 100644
--- a/sound/soc/amd/ps/ps-pdm-dma.c
+++ b/sound/soc/amd/ps/ps-pdm-dma.c
@@ -211,6 +211,12 @@ static int acp63_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp63_base = adata->acp63_base;
 	runtime->private_data = pdm_data;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
 	return 0;
 }
 
diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index 553fe11a2e50..c2640985f54c 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -337,6 +337,12 @@ static int acp63_sdw_dma_open(struct snd_soc_component *component,
 	stream->stream_id = cpu_dai->id;
 	stream->instance = amd_manager->instance;
 	runtime->private_data = stream;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
 	return 0;
 }
 
diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 072f3dc35d40..765057499021 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -237,6 +237,12 @@ static int acp3x_dma_open(struct snd_soc_component *component,
 
 	i2s_data->acp3x_base = adata->acp3x_base;
 	runtime->private_data = i2s_data;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
 	return 0;
 }
 
diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index c0481a9ba858..89dc60849c06 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -233,6 +233,12 @@ static int acp_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp_base = adata->acp_base;
 	runtime->private_data = pdm_data;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
 	return 0;
 }
 
diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index 33d59d992ee0..72050fa2de80 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -231,6 +231,12 @@ static int acp5x_dma_open(struct snd_soc_component *component,
 	}
 	i2s_data->acp5x_base = adata->acp5x_base;
 	runtime->private_data = i2s_data;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
 	return 0;
 }
 
diff --git a/sound/soc/amd/yc/acp6x-pdm-dma.c b/sound/soc/amd/yc/acp6x-pdm-dma.c
index afa9f66533e3..cba2509faaa1 100644
--- a/sound/soc/amd/yc/acp6x-pdm-dma.c
+++ b/sound/soc/amd/yc/acp6x-pdm-dma.c
@@ -209,6 +209,12 @@ static int acp6x_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp6x_base = adata->acp6x_base;
 	runtime->private_data = pdm_data;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
 	return 0;
 }
 
-- 
2.43.0

