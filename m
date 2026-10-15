Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E8632C302
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 01:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028674; cv=none; b=cddiYLIBBEydFWs8UmttUMFSaDUBgrZCh1sLDlbFl9FGJMv/8sIuLWrVVLbd/ikD3okAx9SCKb5pFvy3b0wIDPv0o0RtA1h7xgtMHdLxcxLu+xWLnSF/QjMVxDQC6bPO0PtBWHJcl036l9AXFVELG8Cf3UVdk7UBOTRu91c1ZAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028674; c=relaxed/simple;
	bh=PxltNMQY4Mwf0miBiwGdcHoJbpALYxNGOELj9h3ky6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rvLqNeBpg4J0tTMvOE06r/IStaKR72dz24bpX9DY6un3jb46yCiB+bvkmsdJ6QoIxViunEdIPOahwTWFnQuGPSt9Y++lO+WDw0A6Cx4h6lrUyeNAPek8AZw+MLqWc037bmjRwLY2sxCNpz65gr1d9ZpRJGXXRIy4fUuAe4mdEUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uq5+qEYv; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uq5+qEYv"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e61ac64ec3so41079845ad.2
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 18:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028672; x=1792633472; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0f9CDxT7c2yfniMxJX6Z2S0DK8dovzfteRrAqStY2sw=;
        b=Uq5+qEYvwfWDk8Q0cEn3cjiTxsuEsWqqMF9aRESUlyCRQCAi6Q/7/uFLWTIiYMguvF
         njikad8iNQQrnR1BcuWVAxQd5VZs2XhOM4Pm1HYwMpkwVuTc+joXuwohlTUUcxtzoLEM
         rSYDist9KhrbBYFV6KMimYzhslVZYbhoh/K8xWa/BlL6CKvHrIsrAaeqBw43420ysoa0
         FYmbBWSKq42DbQt5zkV+m3x7XTAl8xCyDqeZiNNfjs7m3chkNsWU4zEVnRUJCq9TuAJ/
         ESySVUKpXL6leSSdr8ZX1UlOWzbIejmccNVgJpHGULSFKbSokQOKycuBu+++Efd+hOvr
         prbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028672; x=1792633472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0f9CDxT7c2yfniMxJX6Z2S0DK8dovzfteRrAqStY2sw=;
        b=AbrH7FqWpPCO7COUNwfgBhmYVACwo04rZwWaU8GsGO9l1S4tmwBmhpfXosrH+12P9i
         lzFF4uBQBZHcLxeLMUhIOZrIxI0X1K+hlgu2iD6uJNOsyN2OGkCEoknUZZhCq+zs/fKQ
         bPFaDX9xZCfwqdMDMEqzFuWW4OGNZFBj7B+6PPpTEhfPFBCokMQqFR1MyK2C9ZstTsmN
         CXd2t2YFpeCaZsmBAzZDTAvwcNrYdakMjISL1f/kRAxTCE8CwKm/98rMTknRSEpgTZQ5
         9nA5JS3MOuZpNn+DNVnmOXm/rFg756rp7dzkPgjz8omy6JieVvUZisIWV6cSfbcnh4id
         k1Lw==
X-Forwarded-Encrypted: i=1; AKwUvBz961W26VjWdAx7hVh2zCOXskSnq4C+z7jnOkLThI3iVG5exWMECi/3eTkqORAWun7Bv2c=@lists.linux.dev
X-Gm-Message-State: AFq9FYKNwSAqnV9ZR2ukQTnNTDPjHuIIs6SDnSlr0hUoqqalm51/Bwzm
	+slnaj7bAQvotznIe90OygQCxWmMaAKeghejKVsGJkDbTpJ7l1OiLSA4
X-Gm-Gg: AYBFou1KB3BmJknjdOzChpdrj1fL9YAwIZAfSFv2vJXJRlVKQ8yQt5XuygqqJWN9dTY
	FtFxims3UCNIZOJgh/N5uWBFoaqGr+/0DjSBdIYqcMeMVpnZetX1faarASIHjgpwvn0cEJze5wR
	zyA4e797a74Gs5b5/54cnovQ0+l3s+zhq6+c1c1XWo1IaNAqkEBHwqdlBocA3SODHfOtCZOXdkl
	fgzrev16zvY29iOIpn5atNbaNcYCk8tiJITIURvmGdUGf5w2SmDj2oWSGl15HXckuNor8qVDFs0
	Dr3U9DWzbLpED01ULM4tz9sA6QUocGMF269fvK2+UDSWn7o3GQXKcPRiCksJteq1YbktRPBMZZa
	3NTd7/RSNrZD2YtSTLoLj69byctoUxKEdlHUpByI2HKg1lMuzfOwJlrsNzdQQFPOt+ZZMtRnYKD
	HWV2zw+l00pewjTaNA7nyKuwFWhBM1MSKWK7jdTE2IEBAwWkeiBiT64tj85lmf/ZQnq1+fvry87
	Ha/ev/ySC9AcgecUSAQ+bSjjUvIe6qQ7yZfMuroIOFf3OBOq+spvQZq4W4CWeQr36VQjb6VDm9S
	MrK8tqVC6ntVpQ==
X-Received: by 2002:a17:902:f541:b0:2dd:ad73:c938 with SMTP id d9443c01a7336-2e842abebd7mr158700385ad.25.1792028671728;
        Wed, 14 Oct 2026 18:44:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:44:31 -0700 (PDT)
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
Subject: [PATCH v2 01/25] ASoC: amd: acp: Fix .close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:00 +0700
Message-ID: <20261015014324.5569-2-phucduc.bui@gmail.com>
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
from acp_dma_open(). ASoC only marks the component as opened when
.open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 623621a9f9e1 ("ASoC: amd: Add common framework to support I2S on ACP SOC")
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/acp/acp-platform.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 6b1e18b31c1c..f2c8853775ad 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -248,7 +248,12 @@ static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_subs
 	list_add_tail(&stream->list, &chip->stream_list);
 	spin_unlock_irq(&chip->acp_lock);
 
-	return ret;
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static int acp_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

