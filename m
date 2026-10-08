Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE872492E2A
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 10:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455964; cv=none; b=u7xOXYUJL/zwe9oWdaMDyVR31V2zUp7fkUF8Ys3jhGtnBo9S2jvTtH80DgfIGV0waJn+GV1ZGRZjAuJEsBZndOpcxC8w7ogOp9brewI+foR1NG7epU1me0Ys/XdLcePk22PqS2cLKHe7aCNxD64xuv3yiU/En2bjlUJ76xxLpwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455964; c=relaxed/simple;
	bh=P0PnLczAmd/aMiJpLkV3Uc8hCTghUUniVfLHJq8xHow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o71pKHzl7T40jXYy/qkgFblBOGAQ16ltf0gx8cJ+yq34J0r9UEuR8WpXs+ee1Dcu5s55+BuJfZguxpTx2EIwFzAxFyTAAuiZH4EgvdThlyYjwU50hQ6PgzTKgf03e4rRzJ8msgRonf68ufqAuMPkmZFkwlWBQXS7tAD63sTqzTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ny6L+lUw; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ny6L+lUw"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3514e7cbbbaso5818875eec.1
        for <imx@lists.linux.dev>; Thu, 08 Oct 2026 03:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791455962; x=1792060762; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eUBcm/HidbDHRMMNHvpjEcX/Cn/b4904BqGN3eWGjuM=;
        b=Ny6L+lUw82dpyuGxaW8q/bxmSKiXpKRtheSAi5i+I6z5MTuwN5JyCmVpr0Jf5baDqS
         wfNbO8WCbVOVgICfmBAWjeT2t4d1lkgyyhZJAJhR8oTpGxlz5tA3jHXlILWsPDHm/qsu
         lqsNP2H/tUtIYQPf0ngDQ686NZXDK18nh9cTmo7lQ4a5KnAdsxQ9afxgh8/F+FSGypeO
         xgalxn+iBm5/q0NVt9HShQCdNa2K+TsKKAkux69NwIwln6ugtNlhb++Jus6q7GnepO+y
         zR+R9MnTaVkQRsxeyVZRIXKo5fiCMp7IYz6eN8Q6EIYVFc+0Dyl2j55OlQ7U6MiK/xeo
         dhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455962; x=1792060762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eUBcm/HidbDHRMMNHvpjEcX/Cn/b4904BqGN3eWGjuM=;
        b=pFMIiNioXJ805xEc0/GhGMReo2VdHUCJyzkfHVS/OtfDWwa8aBQM5kTbG5mmyLelHO
         yR2fKieIwmPOf01QyvMa5Ty+Z1zI9NW50YnAVv7oqLgQVBw6NypCLYknL8CdUHRZmDsc
         Cnt/2HT0NmbGobNkkqZdTpyPP8v6tXPVpjcU8/R3DjKl5Vdy+X9vAksoEchZdNKoixri
         AO9r0gAFow+UOyWw55slG2I0vUa/SqSX5/PgQBrJhp+pfm676kT40n6hKDNUDxECHa7R
         N6ffAcvs5qebiol6G6+U3X0y/GTxl7ae9yjDLVfSg8h5/NhA9MNZ7VmMKf1sdNaQG2t9
         gbow==
X-Forwarded-Encrypted: i=1; AKwUvBxXzti+Xjf5Hee9Q/Iokgup4pu1MoHeGKkGIgaMDz6RON51pzzQoGdXGN1Z1koKaLN5LiI=@lists.linux.dev
X-Gm-Message-State: AFuF++k+HaqJlbSZN+QBtXcXuKOLP4wietcG5epF7DihJPGRmEwoXnDG
	6fvGKazHfHsxAv8dPnkrmhI5hyUPZdImh8j9xhdcznE8GmR9XYmRMZSl
X-Gm-Gg: AYBFou0qB1oapNYq1+1ZFOHW4WBmW1ys/iugM5H2x81z2H98jUSK51fQ48PVkRBAigg
	9emtn+WMGpscQwfm0EoMgBmQYNwfSUh2KZzCon8QEcfsmtOnspwwuzW4PS2TujY6Bb5asCvnLg0
	PYZwI2PwHh8vZ+nK9EPOUrsxXj9v15h8q+aIxtBCDj3Clz4uWaN53bBfppq1dcEbYJpwPPw37Op
	eTpzpPZ0ehQN5Ba7X1AYz/qtbPVbTfqtpxQCSBUy4FV2RLR4vIRKdohQP8yIMEQpC31lH6u0TsF
	gYvAcH6j4biayu4k1giMb0BacWNMu+jKkww0jhszU14G3ZRVqmapLjIUou44aTzOP1WtCuZ4r7Z
	HCR9sNAyYvhfYg6t3PJiGVGg2sOu6GGshLuOCI6x6dAP49y91QlreN7YIG1NQPqc8Gv5RoOcLDV
	6+6NdS6mgP5SG6J35058LmIGz5AFoh14IfdHgaqUtFW6UqpcoKAQTvW8kDIv/96MFlqPAosyrBw
	todWjvRGM8iGwjzdE+iWM4R0bFjmc3xo9eP0DCRIhjUjWNgBaZMnZPZVtRU9nlcOI028BhzuIXa
	R9JLGyJmUB8Uyw==
X-Received: by 2002:a05:693c:41d1:20b0:351:b65:63e5 with SMTP id 5a478bee46e88-3515de8cbe2mr5796544eec.41.1791455961706;
        Thu, 08 Oct 2026 03:39:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:39:21 -0700 (PDT)
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
Subject: [PATCH 01/24] ASoC: amd: acp: Fix .close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:08 +0700
Message-ID: <20261008103831.542533-2-phucduc.bui@gmail.com>
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
from acp_dma_open(). ASoC only marks the component as opened when
.open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 623621a9f9e1 ("ASoC: amd: Add common framework to support I2S on ACP SOC")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/acp/acp-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 6b1e18b31c1c..ba6dfe8fb6b7 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -248,7 +248,7 @@ static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_subs
 	list_add_tail(&stream->list, &chip->stream_list);
 	spin_unlock_irq(&chip->acp_lock);
 
-	return ret;
+	return 0;
 }
 
 static int acp_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

