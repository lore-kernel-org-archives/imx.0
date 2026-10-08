Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E693BB133
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456038; cv=none; b=Pzk+iZrfx1CxL3Kom6pBt4SyZY+1XDEz6egEoqR9vuscYWGxrK6tOZ+Jc09gHDY999M3mPBXdvZNNQji4/6kJ5eUWeWckeFRVLE9iyvhzIGV3EMXc809OGNCroA2oGJRFBieE+vR+XviEyzGRdCeN1+mUapNxvmU3ieA/X5sf9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456038; c=relaxed/simple;
	bh=nJhvrGr3lgVZ8FMtw/5ZoBJyNuHoH9T5gKcidfHw3xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lhwFzGTXssI/k5+8ffU0TbuSugBXSLYCnzh0XSqjJQgibmlbOl7yjDZXVQfejSlid9n62UoNVq7BjI/mGH+CwVMcALY20fm1+rKpifggq9VoRQlo9oi+MVv6eKRU0RaIYqWauLY89p2bfltJhwUyFkdqLJ4KMIW9ICcjGOoS1Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qpjElZLN; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qpjElZLN"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35120d43ecaso7719892eec.1
        for <imx@lists.linux.dev>; Thu, 08 Oct 2026 03:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456036; x=1792060836; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DCoq+QQx3kZdKIK7QgXRpmYJ03Qsfh2Iq2ERtZh+EYs=;
        b=qpjElZLNOixPJlGEPulZjQgLBpVtt9Gd9yP6J/2iTu2E+HMgEaILIkp3x+NTGQlDbN
         pf2p74Tl++8lWd+rObgJi/KLBGfhzq0LXA9q9C/drvOkjkQbci9Quu+Gl7AzNlIwDGOB
         g9mAKmXV+EVmXQ3nkjgmmIXB4zcpplW+j9lnXKqfStBRq+htEJlhfNF61DFUK+mH5e6J
         KnGPSNINUX9Pz/YpBB0+EdNdaF2IXVKJBFR+0n/3ILiFAwbNwqHK0+tpqlyl9wTSMwlk
         BJD4MprPI5GPbMvH3XeIjVEnxDpnMPNOMwKt8By+kMaS41xtkCMQFFovTn3uevQPB1C7
         yz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456036; x=1792060836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DCoq+QQx3kZdKIK7QgXRpmYJ03Qsfh2Iq2ERtZh+EYs=;
        b=wky5GZJKnY68YBoX5KLo/MVfvaOVaoqR6LZiwn14iY9IbN3f7hVGuEFUzmTaJUdGdI
         THEbZrvZQBsE6c6YWVvvwFFBnztINIML0vKb3h1UiB11Gcqj+bnS6pmCv8pWGI81XF4V
         Rusc5KNZym8/yM2QhnrV68G1nKmq563g8G+CLfJ2yNVXrn5FEFs8P13nZdDHe1UCJlBA
         Hmt61FF1HEQgtvR/MYmeW9DyV/nkXkt4rSnY6blGFqtsyxj1d0xoPuUFdmFcRL3O98tH
         /yXi2NsW0AvjTCE4F69Vm504vknlCAMiPL+ux9hALUETqiWtjT7ATaJ6fcW6gYeNKO95
         etaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKewN2JWcCinbIvJ7r/2meIU8eQwmPGayMfhFg3qLQteRi2LAXQvBwI283keCDxYt6Ws0=@lists.linux.dev
X-Gm-Message-State: AFq9FYLQJFDck4OdQrQNz3dYCuBFnj/Y6iIsm6pW7+IqBnigJByHUvvP
	NLdFL61mcT+j/ds1zx/XYkHI4U4W5gHaDEP5YwtGPJHlHXrKZFZn9abA
X-Gm-Gg: AYBFou3XfvOVxi7u+pk3ZUawvSpUYG2XrBKZMrArguMK4qzJgGlC9MYd5ICiFFLccPC
	TC+Wcw+XaO5pjsj0CUyPZ/jJ1Y72/fo/dYKrN8YDsH+sbV3RAi+JRHA+J49Zx+M3qeLgEfgsAof
	sSIcNJucDjll+N68+p2Eptre11zAcs5ZqCDhwQH21XGejQxiBGZW5yDdaN/46x0KQnuPVSHKcGY
	yOQbZZD29T9/oHAHUbV2kaDrTQhuvWZ+EsKlERmBFOM+ossye9ko3UhwZ9Cbjw3EvDjKjBqIYDS
	ttoqN2OTlftf4Wh2kZ+NdSqkHGNgoLgBz/zHXg3tF7MzA2+2VDdwNRFKf39mk6BglFGQ1a082ZG
	GqhTA5yEDH01X0weckgMBopbRwTm4SOu94eM4g3cy9vy/yAz/SiIzuyxAAsAuL03/jaJOHZAH1v
	S3mQqPeH6bPCwgOItRK5Q6k6i5R6yAZ1WijRSshB4gf4ZhLsks19dfU2Cf0feuXk61i+yWldmvE
	FFl/9x3rYicjoP87wG08618IDJ0K1rqMhW2m4i87+wBHlOfs0NUe+K8cXOvrk1fFrUTD2L1WURT
	fMP/smwb/6CVcEgYQO//jd52
X-Received: by 2002:a05:7300:b088:b0:34c:b75a:ac1e with SMTP id 5a478bee46e88-3515df70a46mr6358739eec.33.1791456036268;
        Thu, 08 Oct 2026 03:40:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:40:35 -0700 (PDT)
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
Subject: [PATCH 06/24] ASoC: amd: vangogh: Fix acp5x_dma_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:13 +0700
Message-ID: <20261008103831.542533-7-phucduc.bui@gmail.com>
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
from acp5x_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: cab396d8b22c ("ASoC: amd: add ACP5x pcm dma driver ops")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index 831e30e9b042..33d59d992ee0 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -231,7 +231,7 @@ static int acp5x_dma_open(struct snd_soc_component *component,
 	}
 	i2s_data->acp5x_base = adata->acp5x_base;
 	runtime->private_data = i2s_data;
-	return ret;
+	return 0;
 }
 
 static int acp5x_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

