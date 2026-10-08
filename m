Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20203E9C11
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 10:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456024; cv=none; b=FAd5lRjpTslE10UcMwngPJp7Hs2tnrV4tSyogyH1as0HQ5CNirfnQfsJ68vNikSY8niFvy2G/EL9h8VjgJc3fYAYb4K5FZLrpXxomuTWSnD0y9MmOsHC/Rns6vo9lOkZqUPMzMn0eMZ5Ge/80Y527TdmQGKBUpTOKDspS+Kd1bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456024; c=relaxed/simple;
	bh=aAJwqH/KKsd5BFgyPNOpN1XC3DMyvJ2Ee51+WOeaFBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RpfSltvLFTiurgropqXOVBif8Wqk2UeqU3YfasPx4JX6DSUAQNWRrg7WQOAUgPhEpnqFhCX+wFY3JOPQU4Kh57toDU+z/jZ4Fgc6d+8kiPZ7EG/EGan+TuytHzFCp1OkJMuof9Q9YeYlbSOGjTdYmJ/YNSOhljhTgJe7q2IX9Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAZBdd+N; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAZBdd+N"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35120d43ecaso7719424eec.1
        for <imx@lists.linux.dev>; Thu, 08 Oct 2026 03:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456022; x=1792060822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h9Ry8JRaSeFrVq0Ud0+uxs62YoBNOy3ejKA8MS9Fs2w=;
        b=FAZBdd+N01DkUu2hVTcRuAURqGbN6S6jJBDrK37WIHYIfe6NVAG23eNiYCE8t5oks0
         nU9pEDnjm0js3nV9YXxMa+yMFoAALd8wrQCq+5cMU24TdWrip3JPOVgfXWj8pdNyh4va
         SjuitGiBuxGjqyDmLnBRfws9COeDDXmmoN3cXa/XFpM/YHS+evCsY70rYRI80LrhuL+U
         pbPszXJVxIohAHBDF0Z1QZcTTeuMzc1Uc8bra6wp8SJ2LDTFP/nK3GZWIB9lUQTdOhE7
         6+TEKs3pmXdpZr8z8vGK2VJDwqTC01g1lCed8yxdWvXb1h0cgn9j4Hysp0FRFF9LJEOZ
         +uoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456022; x=1792060822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h9Ry8JRaSeFrVq0Ud0+uxs62YoBNOy3ejKA8MS9Fs2w=;
        b=iwSDWJ9OdRXzXoz97Xp+CUEKul/nLyicdWBKqGfqfZQMx0ixpAOmmzm/TnL36UN3so
         oM32fM1JSWqMatHOA4TsxgfC0zHxSaNzxSXqgSe4F3mbLs2eZt7oVdcZFzcA5/RymKLK
         PS0oIWqO98ieDHaS8HHwXGNQjTBpZ0/E1xgEmuIMQKg4a13t9v2Uw6tOjLj7ZoMvhz8f
         L5/jl1PCcCNNdp8e1uBjVGZHJNVSdhNUwGX8rAHz10jgutt8IMNCitTyME7Z0lCtro7V
         hnPdJjH1cfyMYfOkPCdJ7vV+kkmrOT7aKYFjKHDzHzDa1yfgpk40x3sfzLDDVPTDfUDU
         wFGg==
X-Forwarded-Encrypted: i=1; AKwUvBweRyaidKWMzzoi37JkBS96pt8H/bzZ8x4th3BGLPfspmJiA8c3mKD1H7fyp3EmOX5GNhE=@lists.linux.dev
X-Gm-Message-State: AFuF++mFB2wbvEIETUGvQMMC5wZu2rOPDLCKqf6WXv+r0gXjSOPVJTQ3
	/MkOwZgwAfPuJzpRFHWlBBmkTmKhR8dVOARBU+cHfa8Y2qKPJAWRND7j
X-Gm-Gg: AYBFou2PlbhSaDLvlIYmfAtJoVOPRowptJU8Ggx7nT30Iublh5Gwkk7wxqlgjBUksqB
	f4Rr/tNqFYa7gS1OVyNctjduHtk56r6SRSjHOLvkvPbzQoOZOaXVMOn2+Ti+psHWeQ5mAfy5Qiy
	/8GXEm9d3okDAAhGJzkEXkv31q1SlEsac8lkQ0DkFBwnaJLEXqetm9WvLzEdO3OTWAw0RTWCzLE
	nRuSD9KwQGLFntlY+oyJgdupf6cTMofm9SPBasambpZQnZa3wKE4lAxfbCubbUy4HfZ/nb69wdz
	FzQ1K5mv7raelTon7HYYVeuq44F/zYwSq1GO3W1mouHcZS36URIKT7GKhQdq6VdfzwBu3edGVWu
	DU9949M3vhotF0/8hPR7NT5zL9wEPK7ON70WVEs4W0zyW4wsrlMZLE4joCZPy9fql2Cg1Idlr3Q
	7JwxOdx/XOgahI/7ATikUKBSyARF1fH3EJNJH6+9pxh7fhRWxGDH7O57XafQzERwKuEH8wHD9Ro
	g/Z+2bP1s53CgjJEG2VSgt6PSEtAhLoPuGppua8xLCye6s0e1gAiZ+iZvJDaOg7Cd5zj1fuB3RX
	rZlQOO/moZJcT8zxvMnH4a7+
X-Received: by 2002:a05:693c:414b:20b0:351:1e2e:da4d with SMTP id 5a478bee46e88-3515def434bmr6671263eec.23.1791456022013;
        Thu, 08 Oct 2026 03:40:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:40:20 -0700 (PDT)
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
Subject: [PATCH 05/24] ASoC: amd: renoir: Fix acp_pdm_dma_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:12 +0700
Message-ID: <20261008103831.542533-6-phucduc.bui@gmail.com>
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
from acp_pdm_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 4a767b1d039a ("ASoC: amd: add acp3x pdm driver dma ops")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index 3f59b753243d..c0481a9ba858 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -233,7 +233,7 @@ static int acp_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp_base = adata->acp_base;
 	runtime->private_data = pdm_data;
-	return ret;
+	return 0;
 }
 
 static int acp_pdm_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

