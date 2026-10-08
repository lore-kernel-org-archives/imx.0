Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AC6492E2D
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 10:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456053; cv=none; b=pHnsUDIZukHWxfwQbXxc8AXQmpIlvmbZJ/x3YiaEzoVYXQxLWj3ffvQIuv5YPTkdGF6XKpOmFbB3BYCneO6+FSJfu0OQBpiQ+0DVI80OA4WPMFM2DonvwBW+COOxR4b95gL+cwIpJhDb98FTUVod7i0eyKO/UTCsGGECkuv6Slc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456053; c=relaxed/simple;
	bh=sAh2gdTD9duOj8WLvoGxiHxj5o2kOrdYeBV4NBuiVSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bo3bFv7YX+HJZ+vFF9mlBmZS2ZOu86XwkJviT5OI9pwomEhetJB1F5rvMALdmaE9SFQEAuPUOZ73BLg43UW4u5jM73FFyQaf6qSkgYOKntGVAe1TCkIcbxOfopro3KbjUZN0d2306pLuUWGdXwJvg/9GER52Ju8aH0LJG+OM3w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUSzOvQ7; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUSzOvQ7"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35120d43ecaso7720266eec.1
        for <imx@lists.linux.dev>; Thu, 08 Oct 2026 03:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456051; x=1792060851; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3hFCOdGFcpARJPE61Pz7wx4lXLyiEMweFG5G2TuDs0=;
        b=eUSzOvQ7nxC7qY9KYS/AjMOPtEvcpw8eoRMoTgx7mewhsKHJvW9F0Br4Aw7j+Mz8k2
         HxCf7+zJWNo/AoWRC4mZN4Yutj0NRi3Eot9AKlUyvNANi54e0CQLffMlqCR8fbdHJJnJ
         zH9WMru2zTzHZn2+U31q7pd4oh7VUfGlw7GEeawO7GWuc8csc5ChhgdNKfjwikZsTKCE
         Yi0DIvh7B8q7kKYKOvXP8Hr56x5dvuNB547gw0fyAblKwz69qfTQmDMt3JsAlePzOQW3
         7KgAFsWJgtYfp0aVKENK9bz989HZQXhRcklS+bVXWJWMLkXWeJ6Np4Ip7a0VNp8pu0PA
         Jpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456051; x=1792060851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A3hFCOdGFcpARJPE61Pz7wx4lXLyiEMweFG5G2TuDs0=;
        b=VNLywjoAAMBndhe5pZwYZ+LRNbsqNqqOkqjP9WFIDmdC3zw/NqHbsHvf3lR5XoBT/S
         nnBxATU5fLWHUxFlptEDz0SbbFnedDUXgYKwGaQa9cTtkfT23EasXsU/Qquh8BAMYRt3
         61O9PVqAyVyaQ7UCbvKEz3gAGnP5UoqOh82Z0M4lKfxXimjHt+8JUGN2EWo+ygEeMwqB
         vO+6HWt4R+XtqlRJxKHkegpN0S8v94GyioOWbu+fcKc2h6TlqQynq4xQ80H+zf7MQEYC
         KiLB3B9GSeM23p4Trab3uzJWO/6urhiT/AXRD+K3e+JAielyQGDb5rkCJuAC60PveSsH
         Ql0Q==
X-Forwarded-Encrypted: i=1; AKwUvBza2BkBD3pTpYQX47MO21wFq+o8NckWLE/v+IRKBSqlsm/ldTtSrqc4gmweTLwTpSRdW7M=@lists.linux.dev
X-Gm-Message-State: AFuF++kBpuke1rduKbiywZ8Ma8fpysl7vpZMJf5s8oIjgf+APM0aAaqS
	AUV+/hSprLDtBBavmDcJ/MlgaahiBeS6KqwptTFs6VjyX9wVpiFcG0PI
X-Gm-Gg: AYBFou1mjUkRX2AtC1QpwGwOXST30H0PqUIGATQeCcpRot0wWsvo0C3Fp7pFDS0PRld
	O/ueGJBF2gZZ3g+QG32uPFGCv6+H4ddT7R1sIXx+4j0p5mUVD8nngil3BBws1tatinvuPFUAfzW
	KzHm6pYc1ibQIcHGFYgGMKN0VOQBVbeFdA80RlrcPFKkhu4rsibCad4MWw5gd0yKqHRUomUtFkf
	T7HuOMVZIR2oiN/heIfDaDQprFGqQOZrJ2EzvPPobHZv28ct1mnBIcaTXdajtm+LpxFYxEbIYYZ
	SXBVAViiNMCKjZ8DBXuqN4snPo8LTb1Z0HByRw9fEGU88nbkjPt6f/tbCbdthH2fd4Vyt5OyIr6
	PTFQEZwXkPt4SbIEstQpNajR9fgQCy+8MgxXBFyUgq6174eBl5Q57v0GO9oUzAlbhA4VQ0ZUZSZ
	G7wcVm/6bfJvflm+AKi2dbignexTCyaEhjDUjsQNKQSD5y92rbIddK1L3QTNJyYBbByFVM6BKo9
	FnGhJqIvt3/txIDgamzN+AGEt9lilaQ+y2HqY6bCd0XT6f6Yp5s32c8blLmaBMtrV8OG1Aki3nb
	rJZ+KfOhgOjLQtXfr73wewNv
X-Received: by 2002:a05:693c:41d2:10b0:351:62fe:62 with SMTP id 5a478bee46e88-35162fe0200mr5293677eec.19.1791456050997;
        Thu, 08 Oct 2026 03:40:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:40:49 -0700 (PDT)
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
Subject: [PATCH 07/24] ASoC: amd: yc: Fix acp6x_pdm_dma_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:14 +0700
Message-ID: <20261008103831.542533-8-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from acp6x_pdm_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: ceb4fcc13ae5 ("ASoC: amd: add acp6x pdm driver dma ops")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/yc/acp6x-pdm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/yc/acp6x-pdm-dma.c b/sound/soc/amd/yc/acp6x-pdm-dma.c
index 40c4d833f4ed..afa9f66533e3 100644
--- a/sound/soc/amd/yc/acp6x-pdm-dma.c
+++ b/sound/soc/amd/yc/acp6x-pdm-dma.c
@@ -209,7 +209,7 @@ static int acp6x_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp6x_base = adata->acp6x_base;
 	runtime->private_data = pdm_data;
-	return ret;
+	return 0;
 }
 
 static int acp6x_pdm_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

