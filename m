Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2268F35C6A7
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 01:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028734; cv=none; b=d5mXl3Za8x7nhBZR1CXRqW3qMfLcjm36Kw1XUDKDSSaNa88s4418+8NhYPk03f32SuvPf+n1NjeDBsUrPOkRoZKDdJM90HeRT6hcuOC+j/vyLb1Vg/+KoYe2BN3ChiD82mo4toop93WHejfqtTBTBK/OTnhr+7up0GkAxyrExDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028734; c=relaxed/simple;
	bh=42Th3Qj56b43dUmPcGDSjuTLub8jxmLc2kGADA+KV8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZKxfE3gdCjlTR1+VCs9SeaTdkyTucUsNRMgWcoZ/fvVD3WRdMvBcW5plbHh9BIE5boYCAtuSY6pg3yWJQH662WN/qNdVY4HzRRBLAhqvG38Y+mjDTZqZ5DReKIY+bQCDT+RgrqunMEHIKs5B0ZcGoTVts5gfcaNTTAD4yxlOXgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBvo+iqc; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBvo+iqc"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e82462a3f1so9142605ad.3
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 18:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028732; x=1792633532; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eK8UF2f8kXq1TEqWl9Zyp8tJ5HPyvJ/UCpsqtpYFERs=;
        b=FBvo+iqcxvQdPsUwkZcihAZUJ8t4doq+AccxpqM8IlbwiNxZxck2E0jpmfrmlMVqF4
         OlhKBuZnVVec8J7P2SOYujbmDfV515hDl6U97RRgmUVz0PihaWdgSmV9X1h6j73AHRx6
         +5hUT/yJNexhcNWyO0N6K+FdHBgvy3pCDDS193FBllvrZumF8KxIJ1EhEl1MbA9hstMh
         W8AM5toRFJhtNPiwdvFVdonWYrZ0nFiaKgwUzrrx57mz3PbT1UG3NbTUkUXo1+0nW5al
         S52Ar3Jwofl9ngZTOF/RgXTmShwXua4+FBFGK4VpnpI/BGhs0Z8poV61jPGwRRb/XJuV
         Aqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028732; x=1792633532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eK8UF2f8kXq1TEqWl9Zyp8tJ5HPyvJ/UCpsqtpYFERs=;
        b=bk2Ooc84c7vR0tJMMok90TBMoHFFCkkPWzNXdLtp91o4pIM364ZKdsDHPEBtjRwqJX
         lEoWlvwYVqE1zyBw8XQsMUEpisayltUA7FWhdxs/60LuW+Rxez8glEH5mc5F+Er5GfeR
         oknzei3Wz5e1q10uFmcuH8pfURYEoh/mLVU2hC+NV1eMbv/5jJnit5LyFB31xoDWVaHL
         U83dcAXVu5w8YQmp/KqzvyP4h8BoqlglOqpqeW04Gz0hWoLj1M/1q8sr2Ym1G9AqjThF
         OV2y49PylIEr0Snj4qURuCe+qlZVSvmJ5pKUz3CTqMth3TOgrJex4ScxAz5gApazEwMM
         tI9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzjczqoiexUCwclm1MwIdk73F3aEjNkvY56fDIMZbLC2t/M18uXHJTTBXl4l8X01Prh7TU=@lists.linux.dev
X-Gm-Message-State: AFq9FYKNu3vFzcTZ+Em+1tZBcgwm/yJ38GuZe6S9NjLktJMIqsqWfjFr
	TbZlm5ICxwKTR4BP8lL2ehyX6+ueM8n0fS2MWQlkjljq8hC2nuDiRqWZ
X-Gm-Gg: AYBFou2S06QdkIYUxQ4O33SMcWoAurVQQ9wf5n8TacTws0Q5t+uOxj3RTw+sk3o8+9l
	VJLttXYiD5LnC/XL9Jz2bB3MNliMJ0y5u9vG0cQfnBArhcoQQkFfJN8nE9SDlTZzD+oH/xyz1IW
	LPrOUPS0z2EmjGtry8q993PGjhvxrv91wNLfd0K9ROY61yLiu+5D/0jx7zbSdnxBDYPKSdDt6Y4
	WnWIFaGBXaiwaTPibtDlmxH+JHyf8oOcLWFe0LSi1PKddim6Z611MimnnumuiKE2DXCMT/66EPt
	8H1P8AynLGXoZ/3atA63RBFpalSx7LLU6GlSdbgCSo0Gx5dIIq6i+w4h8YI19EYysBc6W07s/Kb
	rFVqpxFczlsXGVM/bCFLKxArD//92SjwhKvKgxv9KptHtYv/Oaz2PGkq7kFfJKw0vUDo59gM+uc
	lFab/ESHNskAJQTZDmugS8vXHo1xoJ3CbocZdqTWjr9FYPAkohgEGjrvErIyeBD6chxxKqUXgBa
	c5ql1WjGVQT3ynEoatUnz0VqKKDnlhyz6zkPcTeMFOjuxLDlmNMy9QtlQPn0jkHcQHvcQ3qWibj
	nD1mOoOyiYHdpw==
X-Received: by 2002:a17:903:19e8:b0:2e8:79d:15ec with SMTP id d9443c01a7336-2e84280afc4mr161680265ad.6.1792028732357;
        Wed, 14 Oct 2026 18:45:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:45:32 -0700 (PDT)
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
Subject: [PATCH v2 05/25] ASoC: amd: renoir: Fix acp_pdm_dma_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:04 +0700
Message-ID: <20261015014324.5569-6-phucduc.bui@gmail.com>
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
from acp_pdm_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 4a767b1d039a ("ASoC: amd: add acp3x pdm driver dma ops")
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index 3f59b753243d..89dc60849c06 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -233,7 +233,13 @@ static int acp_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp_base = adata->acp_base;
 	runtime->private_data = pdm_data;
-	return ret;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static int acp_pdm_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

