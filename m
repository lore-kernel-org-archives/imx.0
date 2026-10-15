Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9D3370AE6
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 01:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792029024; cv=none; b=G+QBk4f9DZ4joEFo3O/1zKwr1jEho3eyn62xggb7lrL12OvUhrYGFFDN0royOBN/KfNTdfXDKYDrKku2/UGsz5KhbgyA7b3hcWjTipWLCDwMFcXLhg7jOl72Flz+gqSM8QIFScVgh/dFz2nuxoluYtN9ARdtfgfMnoJF/6Fcz1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792029024; c=relaxed/simple;
	bh=FZEwana/OW3ODi6xFN55pPX+MLagNsoGOIMAf6UwyHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bkuNfeXzXtdSAbqwxiEXdNMpNEixj7S2hezCUMwe7M5dZQ/JAyk8DW+EZXn1lzpK4mndP2jKaDZKPz4dtSUPqt5SKnfzhZs9nlngZGjWDkBf6FTG0fsg7da3Loh+ir4PeQ62oDXPbfP6i9Ap7zhPsTcG8dRAnZnNTm2ebRF4wUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=suCtmaKt; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="suCtmaKt"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2db80fcdf8bso27577385ad.2
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 18:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792029022; x=1792633822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=adbLjE108wpHReKKgrEkXzgfA1DRZ6TN8trHQTyRjGk=;
        b=suCtmaKtrXVGs2/wP7PEekmD1UIaGpkmD5GKFYdTZRLOZnztOX/3JWQS+eKY/WcC3d
         Uc6gIYEwvvJ5TcmVSt6klpX77GOPMhlX4Nr81JUyDy6fERqLKjlAkYCYsO2o2pFSdcT/
         LsAfk1gyaXZ2+kNrFc+p0u0MmIWve2Lq0Bs5McVNRR8sGjyodxt5zVhd1ac3Xr81bRcM
         2hIITsli6kub539Gl500THnLeEZZef2Wyq5yPHBfeijn9HKmNOhiJhvMHoIjNSTK8xk4
         htHM6R9is6PighYXPFBRt7H4iw/X2ifnYTtaKL336LdM26S0XCanCCMPlUWoWGFUL2kn
         WMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792029022; x=1792633822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=adbLjE108wpHReKKgrEkXzgfA1DRZ6TN8trHQTyRjGk=;
        b=EKM4wWWFg2oFKAFNnkepBmbbqDjNOaFRHjhSlkVPViPZOD4qj3xHe0XEcBKgRAsZkk
         jjQ2HaH2hvUuO//SbhHsDYoxpCNQMSE/W0kh6eWZR4o/8H+CBdNjgNYbImhV1PhCdIo/
         t0s+K4Zv/srxtQyAabWumdD948sWfR/mnO84Zj2UCWJb1WI9+wNj5Cr5qoJA8CD8TptI
         ci0dlCmIxzVN8bVaZS54QJw7jRO8AT/EZzyk2VB+TO7e89dkfe2MFiLrRwiuo1JvE7sA
         xBAPzxlZRQYHf6TjTYVebY8EPomMKo348dN0p9PnsDGnrPnNbHxx0Sz4gf8YuBrIy19L
         p/5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzuOc9A/rmwiSL/cf4SlBcPKnLNcZ00ASZhF1bmxsFCZNsjVa6naG56qEU8hOZN66PFrK4=@lists.linux.dev
X-Gm-Message-State: AFq9FYJQDJqj6ka1g6enrBEbB/rtEBKPFylDWUWriaxclNpeJlUZTF7x
	1Z1gfhFuUujjz5iZFZSULHe7dZEUNMZZvd5dgmbHVHchrGOjCkcs7h1A
X-Gm-Gg: AYBFou0D/Gk7NPOduHX3ggqgjmh4gqyUemH4wmsVf5UQNxTrdd/DggZVHgF0oHyYAIP
	54Vl9mgY8JSM3PWvcM0i9I1l4slejjof0BYhF/vaKuZ91PnwOvtd+HX04DViZOOpNvhtbs/0a8D
	Y0MIOFdAOdTU3Quw0zqXmC8hNH/R8a7spY6pD3QL344WVu4dqfmnvrvbMeJtqh+4jnUPjNi7hZY
	KID68prK8aJ9wF8/rLWbPWvHfXuuLiHfo4oqKNe46z8+X5jBmtaZ3+Gg9+YqBmw/Kk98yS9kMh4
	bWIsGXnJjoq2b9TYx9FdI03gKNkKHY5A39Shz38zVHp57RcQM3RxCLMnrp3DBCPUmTZOS3Fc7UA
	gkcASevfrNRq3dsRovCCw4MSXisokD7qeSOtaSvSR8XV8MPVDWblgAuRND0Zv4V+o3mWCkmZXS+
	q6S+J9j8OWRnP+hAQVuJEd8mY+uQFutCgBcd9nQh9eXUGRLTb2jzCwfMWQdfePHIGiGKGCyNXPl
	EFNCdr9GbjvryhF3PZt+8GLy/FCkSyes6rmYtasA+UKTGxwMzBJlfDGGY46Ll/LeNuF3KqGuYpH
	UNHPufEOOH9I+g==
X-Received: by 2002:a17:902:ef44:b0:2dd:c100:7cbb with SMTP id d9443c01a7336-2e842bc6930mr140413355ad.55.1792029022012;
        Wed, 14 Oct 2026 18:50:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:50:20 -0700 (PDT)
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
Subject: [PATCH v2 23/25] ASoC: renesas: rz-ssi: Remove redundant component open callback
Date: Thu, 15 Oct 2026 08:43:22 +0700
Message-ID: <20261015014324.5569-24-phucduc.bui@gmail.com>
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

In DMA mode, the generic dmaengine PCM component already applies
the integer PERIODS constraint in snd_dmaengine_pcm_open().

Since rz_ssi_pcm_open_dma() only applies this constraint, remove
the redundant component .open callback.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/rz-ssi.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 5f4a53886541..9a0781bb072d 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -954,13 +954,6 @@ static int rz_ssi_pcm_open_pio(struct snd_soc_component *component,
 	return 0;
 }
 
-static int rz_ssi_pcm_open_dma(struct snd_soc_component *component,
-			       struct snd_pcm_substream *substream)
-{
-	return snd_pcm_hw_constraint_integer(substream->runtime,
-					     SNDRV_PCM_HW_PARAM_PERIODS);
-}
-
 static snd_pcm_uframes_t rz_ssi_pcm_pointer(struct snd_soc_component *component,
 					    struct snd_pcm_substream *substream)
 {
@@ -1011,7 +1004,6 @@ static const struct snd_soc_component_driver rz_ssi_soc_component_pio = {
 
 static const struct snd_soc_component_driver rz_ssi_soc_component_dma = {
 	.name			= "rz-ssi",
-	.open			= rz_ssi_pcm_open_dma,
 	.legacy_dai_naming	= 1,
 };
 
-- 
2.43.0

