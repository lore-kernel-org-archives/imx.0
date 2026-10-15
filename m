Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0086A2D3ED1
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 01:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028995; cv=none; b=d560/LyjxUd6FeJR5+exA3cx1MsfMyuxANsuye0zUmPzuOQQ7vfAOcIYyLdBicbYSuFVTVafSJWsxqJvtC2dVezSNLQYAThIgcuTkvjTVswpySJy58qnhlpR8zRqrYU4Us8W90CwSaORO6aQE8f6926eRqk1wRad/+KDyTQS5f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028995; c=relaxed/simple;
	bh=AsRVQlxF+563JjvP+sFHOx3JXC5esmyVVxsSsw++eA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jhZf5jaOOyONNMjIu0jUN1DMzuyhDWehf62jQr7h6N0ahGbO/CgeuIpL6YUjGkNzOWAO6RV63sN6DBiRMF04Eh1catxDRo2a7jST9Yfs0cWmyzAJzFlWqDuNjtnwe0PHvwkhGPmp1qwGdZi1hQAPq0x8Zo7NNr372+tyLb0so5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o/GlKy0I; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o/GlKy0I"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e5378b281aso26430795ad.2
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 18:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028993; x=1792633793; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X8N5wvVyB4OZfrBnjP1FYFZJGH9J4CpZz0KjhM2upoM=;
        b=o/GlKy0IlPZj2VXcrcL7In/Mi5nUY2O3MsBpyh/AFNLRGhcBAf5zzMJ/vBg7+hZUCY
         lTq1wJvWbSn5QGntHlnK+9cR4UZR2Plaz7l+WKXGvX0703rB6EVXRs4f6WiaRlt7iaLb
         bfiTR2WICQqelyWhTfd48JtWgU6WFjy0ebPtCSIHZC87are+YOWVAA4GCJzzsn72Dk8m
         rOeQjc1ay+ZOEDOUAPRmaI0SWyCnEt7UArlkZ75YA91WykjVT+i9l9KTGoAWX9WfVIbM
         aEKAM3bBQik+pIcsnGlMvGqLIuF+jUa/9TEkQymh+VtC1430MZSZjTyKr/+FsdjD8rI2
         VTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028993; x=1792633793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X8N5wvVyB4OZfrBnjP1FYFZJGH9J4CpZz0KjhM2upoM=;
        b=h4PS6W43CxPX9jB/9Nlp8ckg40MbOm81HLqcSE4d+z3JfWzGsix5WZ/QYGfuDWnhRF
         0oFU1GdEjH0aqvTWP0VjyLtiV0ENh4jOj7XUqpy7r3cE86r64IrOJi+QPhsp8vk0tKdR
         GkY7nfFK6CJr7ixb2Kxo0OMW6/fRfR7WTSMTNJnsePNfz3ClnhAwRem8K93PZwrk+41K
         unN4XekYmzNorFq8EQ6c1jQczHgolrmZwAlh0VJptOWNv3KIV9tjS3lLbwFQXiMmQUOq
         wX8/8wCPhJgDI8OxttonKItsP0gTI9G3GlyNuyCRfKsYZplLGTJbtzCMp9oLeIxyfnWW
         I/NQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBEr8HBh2C4cFPO6wQmQVd7/zrD4OThAnnmhn9kPYq2t4HthRQ3gHwEX6HoAz2XGA7osI=@lists.linux.dev
X-Gm-Message-State: AFq9FYKoVkoXqvZ4KsycChKKDA/9mR4IX53r9ziOwl1hrPbaOzY5YD4z
	m1JQypMXFqvpk4ifZJ6EuzZYh6VZ5Hy4uDEeaA134Det8VjEyV0BJqyz
X-Gm-Gg: AYBFou1eabHi7rZT8y7Un5ac0sPRbe01Oy7663TB4FQKP9q6UBLzHyvbiBQ/ot9zq/6
	gvSlRuBWl0b4/5XcXi4xR4qd6wB3Fzfn8T8KMqxwbFLmZGGgD0iXhwOOyqvtajRM1g1nXojK2xJ
	UhVe6PoMY/BEIuUlDWZv1AO7SyT+sZmsnUEaeKvpOtWUEu+1Xy/v3B4QFPUFPMqrzOB5swt0V3W
	ETR80LDnJDVzoP9a8Qhne9C47BVCSPiZoJGTiyITkLhFRNMgRR7jRfRe4JCEut5ja9eMse4WlQl
	jFngDwuM/tCcrZ+SAFNCPu5qOZ1Bvx3J/jQZKbsG3Wue3BrI5W0OL64tL31s3yGaDxHfDchrrnn
	EOLqRXXND+hpriKSSVQ07U26uXd8xxQB/EPMzek9ekWyCQxAnEBDaY1k/w3V5PzmI5kSakdcE+9
	esWocWUgl8HwPGDlVysSdml9yMjEcPIrB4aCWgPWK7q6ifYWmcHim/BNOf+Kq9mROevZ4cEI7da
	nH+XgWvzDyulAtw+MfA1Nh4CXLHBIA7EtgoMkISNLz8d+ErhrJ479q+ol/3le8o/sIbN++uCteG
	im9HVLddFHF7bg==
X-Received: by 2002:a17:902:ef4f:b0:2e5:c563:c0dc with SMTP id d9443c01a7336-2e842cdb0f8mr158108285ad.42.1792028993312;
        Wed, 14 Oct 2026 18:49:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:49:52 -0700 (PDT)
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
Subject: [PATCH v2 21/25] ASoC: renesas: msiof: Remove redundant period constraint
Date: Thu, 15 Oct 2026 08:43:20 +0700
Message-ID: <20261015014324.5569-22-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_integer() is already called by
snd_dmaengine_pcm_open(). Calling it again in msiof_open() is
unnecessary, as the constraint is already applied and the second
call returns 0.

Remove the redundant constraint call.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2: 
 - Remove redundant integer constraints already applied by 
   snd_dmaengine_pcm_open().

 sound/soc/renesas/rcar/msiof.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index 128543fc4fc9..11a6f22ec0ad 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -419,18 +419,14 @@ static int msiof_open(struct snd_soc_component *component,
 		return PTR_ERR(chan);
 
 	ret = snd_dmaengine_pcm_open(substream, chan);
-	if (ret < 0)
-		goto open_err_dma;
-
-	snd_soc_set_runtime_hwparams(substream, &msiof_pcm_hardware);
-
-	ret = snd_pcm_hw_constraint_integer(substream->runtime, SNDRV_PCM_HW_PARAM_PERIODS);
-
-open_err_dma:
-	if (ret < 0)
+	if (ret < 0) {
 		dma_release_channel(chan);
+		return ret;
+	}
 
-	return ret;
+	snd_soc_set_runtime_hwparams(substream, &msiof_pcm_hardware);
+
+	return 0;
 }
 
 static int msiof_close(struct snd_soc_component *component,
-- 
2.43.0

