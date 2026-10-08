Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BBA38654F
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 10:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456111; cv=none; b=QguGXwRlumeW+2pyPt9DfbPi5Cl45mQuvUC4LSRbXCjJeBFXy6J2HegZ9MxyayTn3D2wnNjVcbCFJSMKMbx8HBaqYKddseZ3KTA3VdrkchoaqA0N+eN8U+6qpiS6EthX9RH+pqT77uj65Ofe3UNm0hsyldWZdkI6aw/Sl19DxlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456111; c=relaxed/simple;
	bh=71PUR7K91ZyD69iBNYAlBARrgyC4DA7DjLeiH7sGXns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FyqheP9wxG0ojbFEbXiN5FzuxdeeazaB0i+9SYpiyKaAsLu6l0ykbSJeD8Zmnzz9NNf/1gviJQrReWalNKN9/N+6P8Pmde1VmRpMxtHWgw9SBgBEPvg67AkeTe4U+DMSksyWAcpuDxFQE0riD7XttVlnLjPAn5IoXL4ia5xSVmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8WUGbGK; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8WUGbGK"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3115c4451c8so4254004eec.1
        for <imx@lists.linux.dev>; Thu, 08 Oct 2026 03:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456110; x=1792060910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dx+SAHqrRwjwnSaJfYRo4lbib/UhuPNUGHZg46FBeBY=;
        b=C8WUGbGKfhdsaW9AT0i5NJAn6t1kaXY73RoiTFsOiDOHN1dbadI4J08885jn4mvsAQ
         jB2s/hnxi9Y0O6rB5okjZ/4QrPU6zEI/81u5zVA+HjALxZqrQtmig2/3ZSvm4Qd8SHEb
         e161e+kEN2JqAkh2oGmQbxneNFVpHDySPHtPoutaMqll1xZs/sH6gQ3dXJkWpvdJRPVv
         Bbmw8w3IxjFpHwyoYKTz5RO4CgFMZJgZpUexn0HRD+0BJlrlsl8HdUG2U4yessdtUopZ
         GkeDLhTrgDAZkkJjeYLKdNY23Kql1RsXh6cdIM0WEWDuIouGWM2U3OWPCQSt0GjQ2tiY
         Ix9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456110; x=1792060910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dx+SAHqrRwjwnSaJfYRo4lbib/UhuPNUGHZg46FBeBY=;
        b=Rg9T16WK4ctcV1ASeb6q1lZhR5pJOtSvteBwatk7FIRs7WQoyp8COeWzrU5qhVfGSU
         HS1DBFt5s4tqNi3xs9SlJi0F84eHM50+5sBSQ/Os8ss6EZ3ZOsX1lF85cKVaYE7U/23B
         xjctcp9jR6tPJSspQEpBB5S0z5ohg3cjyCDi0HIJnEHS4hCTLbC2H3eA8ElxRs+jmhvB
         qa1dGO5/uWcc97lSPrIFgYDLSABYSoe/7lCTIt6tj87QrsCdbZMilT/2BaNelnsJZNQO
         a4v5XRA5yPnVQmiHYpOJDRs2EsY1SncYtj9+/HPd058uQWdITg6CXyY8a/ME8MHCrRIb
         dkdw==
X-Forwarded-Encrypted: i=1; AKwUvByLzso+JcuKb24k0Ggqoc5qf0jkq2uRb/7C2dUjWkO5V3VDDeZRLYYCH5Xg1hbMj+hXYNU=@lists.linux.dev
X-Gm-Message-State: AFq9FYKj7RWNx7Kr5CrKCBEYyXL5AukSVRSeA1PyWHOFtNWYhCldpxfA
	aYZcwfZBgu+xP1oY/cAeMbr9mlxEVJLEeVNMqqHJA4TOb/r4Pdui7azk
X-Gm-Gg: AYBFou3TUIBX9lotaRyCDDLB4YwB2DdKfW8R9B3+6P4QdMTZhd7x0mcjk+XCmMyNTNy
	R1Kd11sXdr7Q9P0WSfc35HRCgpxfj/+ogtHTj/n/803/AOR4lCyzGjujpY398DomKJ0gSYSFc3+
	I2k/U06mMrfOuKIf/nn24ESvJaprzv7XsStwbxei6QYZZZdpqpT6vdwLBa6Pzp1vSWVlm+pJzji
	8PsC6i5lOt3AqmPSJfLAByHP0sFejBYEyy3v8augZXSExBEKOqfRhoouKUDdl1WBXWmmH4DYhGH
	8I60gzyYravNotlXMAlQNPnzSIM1hacQG9ugPjb8EctCo/0pG3cNRtcGdLdiOjQ1TTcdiUzc6Ha
	fS+SUgGZldNfbzApefb2SINWy/otwwnH1w3KqxBELLuamCw5bCBCoC0cMEtn56OG4Xr6gURk7n2
	P/21RAkxJaspfTzInBk1H3YMFpahhj7zs4Hk/z3X6GYpksDUS2/G5CKJpCT6c61XmDP/XWFfsFH
	V0QFVf5C0xWQv0QqrNzFCfK4gHIrculfsstL9EYGUfdmDYp+O8F1VGWYhSxEmKHQD1KuY9NRWDF
	qWd9IADbaGGhEw==
X-Received: by 2002:a05:693c:87dc:10b0:353:58f7:9b41 with SMTP id 5a478bee46e88-35358f79b75mr44405eec.11.1791456109537;
        Thu, 08 Oct 2026 03:41:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:41:48 -0700 (PDT)
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
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
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
Subject: [PATCH 11/24] ASoC: codecs: nau8325: Ensure the DAI is marked as started on success
Date: Thu,  8 Oct 2026 17:38:18 +0700
Message-ID: <20261008103831.542533-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008103831.542533-1-phucduc.bui@gmail.com>
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_minmax() may return 1, which is then returned
from nau8325_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as nau8325_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/nau8325.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8325.c b/sound/soc/codecs/nau8325.c
index 2c95ed00a681..0902a7d7730d 100644
--- a/sound/soc/codecs/nau8325.c
+++ b/sound/soc/codecs/nau8325.c
@@ -489,14 +489,19 @@ static int nau8325_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct nau8325 *nau8325 = snd_soc_component_get_drvdata(component);
 	const struct nau8325_osr_attr *osr;
+	int ret;
 
 	osr = nau8325_get_osr(nau8325);
 	if (!osr || !osr->osr)
 		return -EINVAL;
 
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_RATE,
-					    0, CLK_DA_AD_MAX / osr->osr);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_RATE,
+					   0, CLK_DA_AD_MAX / osr->osr);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int nau8325_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

