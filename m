Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29B835BDC7
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 01:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028762; cv=none; b=HSXffsWk4drq5zo2L0HyB3HkOo7pdssRag9F0HaPOPSd1B+JMRr/fvZCskFp06Tgvsun4vPlxm9gk2sJWQynMciekpsMJhTtyai1UtddlKY6rxR8K4DZrtJdXj/f5uhjqeNkWUh8MyXBji0Hy2W7d+EvvC+W960i+tJMzEwtxUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028762; c=relaxed/simple;
	bh=MChSqGnxO0vcLQoIbJBZYB9F790qawBg1rHdme95xaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+QCrR45FQn+9yeedSN6QPo3WEzlt9czbxKX6OFFTZcyEmpb7ltHaHnbHEagCA0xbopbDSt/7/B7xn2wlP+5iIgDLv5dTI5PRmHBLMDxXTv9SRnu7cWRhsxeeXpmNaBk2ZX9lcG8TmkxxlqhmegItRQ1PwVdvRoQa5sjUuvYsIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3NM4w8T; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3NM4w8T"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e942864693so5057625ad.1
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 18:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028760; x=1792633560; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+glVHzZv3mmREWfVKTa0Xbh8v/mgn1NgWb1AqzOGiM=;
        b=H3NM4w8TrDlMODTW6SwNHLhME++2JwmCfzlgJCDsHmL6hcqyjh8YkiDWSymclYh1OO
         oxZ1lrjFmXnkvcMWq/p6Hipnq44IVKGOS9Ex9JKdWw5yi7H5Q5Msh3p3gWYc5S2wnjFg
         1rmchxaCoVK7GSw0dTvdDxzWY3SSeYoqEJm+pzO0Da9HdtsJD+UWOxrX6zcZHJQNSOBQ
         Go6SKU8J0KYb9zdS1E1ZWN8G1crvzc1VI4HFiYGrRxA76BVk0G1wu16v6pBThvULsWNQ
         pTHTUScRUr3LX4oEv2iSqtqGdAvA7UGw1NTJR/6766QbR3/aDmeyUomjoRYIjg29xbw2
         hlUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028760; x=1792633560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l+glVHzZv3mmREWfVKTa0Xbh8v/mgn1NgWb1AqzOGiM=;
        b=GNlyW/8B/8ITynjLUk5i+yzMwOG81NJT5L5lRCtgpmlAz2pqZenqkLWZMbTC+flQql
         0MWdpaDZzgqXb+/QgqfPpsuPyMYrnmJjVMqYd0mOLdaA92D/Q3VNQFlInAc1ZuGt3jsf
         kU+GEPxIaxVXD4PMe0cD7Pt+4Qx5XLC7hSv1YR/WjAoji032QMHoyboAvTUxzvRFh+dy
         z8VS0CTfhZW/nXpeJRmTlDIKjhVdy/kZJ5NgS7/qzWGK9IFLBaeIsKDHShhsUZnWFfU8
         jHaxYert9EFaNswotNC4jKHX2KW+69TxsWEj76sdjVIcR9onvokfl8BezF5g3CzH1Fe6
         gTIw==
X-Forwarded-Encrypted: i=1; AKwUvBz6XjSZeB3WWaXaDBaclj0bLxcGZFV3cQVtOav2y+lmFadybfQuBiM9zQZIc84IeJtDNmg=@lists.linux.dev
X-Gm-Message-State: AFq9FYLP6UEfGDBGCLhB3AkN/7fpIerOE3oJtKPhXFh/qke6ImtN/ngV
	opieN/hYmR26cnAWD8G0jKZyfeFKqjJmi6xFSdumDKheO4ernSGDXdV3
X-Gm-Gg: AYBFou0282VadKXDp1Wi+yZfbxy8H+DXDpTKvTWSUzn/LCrKe4fPIPLRywASAF2esMk
	UTIuRGApDajG30eWc4lVDuM/XiRz5ePSr8iyEf2CEpeHZXCWqgZfh10/94AcFNYIjuEyTpunGHx
	ogYpLhVI/S5FPoXHGIIaq1/agt4nK7DPb2QMApA6996+5E+AZKkvvXbPRWCWXV9hFOg3gMTxfVR
	7dluxMCc8zWK+1t5sx5AEOrQ6Ui2xy9Qwl4VPYYmzIHrnajkcIFO9Og0fGUP/5xz047VKNjEMst
	bdJ61eHZfpzGA3FCVbUtcu03TsNiSQeMZQzbDLvwweMA7tvcrJAQ+4DDXQBiY73fj3QP46rYkBz
	ED42VWuwk7XWBy62NDZTbgkUsVwKMPCINT4AqrLb9BF5qCfj4YDitq56qXVHBbLsyx899/vdek2
	zcXL/BmSPumyqNBs72nZUO0ce6mg9iF7i0xboNmU5Ym4uilc8HlPqmHokGfo+kSWpd86O6WP90s
	hNj1xpdXwdLoZZHrO4d06noshZtw/oKacse4s5P7Fy/dnNPlfcZq6/06HSePrxvoATaPWNDF04c
	0F0NQ4UmSbSL8/I=
X-Received: by 2002:a17:902:ccc4:b0:2e8:695f:96d2 with SMTP id d9443c01a7336-2e8695f9ae1mr130100745ad.25.1792028760086;
        Wed, 14 Oct 2026 18:46:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:45:58 -0700 (PDT)
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
Subject: [PATCH v2 07/25] ASoC: amd: yc: Fix acp6x_pdm_dma_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:06 +0700
Message-ID: <20261015014324.5569-8-phucduc.bui@gmail.com>
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
from acp6x_pdm_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: ceb4fcc13ae5 ("ASoC: amd: add acp6x pdm driver dma ops")
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/yc/acp6x-pdm-dma.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/yc/acp6x-pdm-dma.c b/sound/soc/amd/yc/acp6x-pdm-dma.c
index 40c4d833f4ed..cba2509faaa1 100644
--- a/sound/soc/amd/yc/acp6x-pdm-dma.c
+++ b/sound/soc/amd/yc/acp6x-pdm-dma.c
@@ -209,7 +209,13 @@ static int acp6x_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp6x_base = adata->acp6x_base;
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
 
 static int acp6x_pdm_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

