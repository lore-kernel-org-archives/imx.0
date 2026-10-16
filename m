Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE14038D01E
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 04:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123876; cv=none; b=eWcDzolV02mdVPrWfxttJeuoH90BmvfQLDgjZ0OSs4qPDaGf12OMu22HE63Hl0Vv7qjrW1irkclBk+l3rT28qXXODZXjhl2Vo80VDSQ/g6Q3+1yIx5jzBs2h6wOR829YX1wlmTmQMuINRyKh6B9mTyzlsypTSMHBHFkYzEWXcGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123876; c=relaxed/simple;
	bh=fvLkZCJ3WJpgMh2sp/BTiEgwAehjZvHvIEf8HbSdvgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VqaAQKWu5Kkaw7f98/Fod8XFp/2k+3s9l7C/M7u94ZNIN8hXsE9paVFK1djr4jEmVXa4XfrkY5psbsRzJFWW3QPiR7azaAVsO4FO7aDxteHp4dF214YNzEjk3xeAzm2SWpI1gfJCl27gJAHt0TPNW7ppzaMjOOlg7ntMpbVGXJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPGGAR0G; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPGGAR0G"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e5fb79ce82so34579445ad.0
        for <imx@lists.linux.dev>; Thu, 15 Oct 2026 21:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123873; x=1792728673; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QXlahNE+Wx5snJLp/MKBjKZg6Q+5VrSpbj2QDx2YWrA=;
        b=UPGGAR0G3B20tjvgrm41dj+GAct4UviX+euKdBe4tQpB+2pwVETq5bucNYr4j9WOwd
         dgkfDcyUlgd6t7qWCP48uQPK1UdtxoYhE3RPos2Y7YlK7/Lwqlp6G/gt0rPWQKAJv0sH
         d7Mvy3+RLsrr0pZEGkPIMzJmFQxpyKAtL0D271To1Zm6op2KtGTdrb0UJPj6kip9CEMz
         +NTB7gl8XPC3AdxGSb94iEsENOJa9OmUD3meRUB/vATCy3ZyJxatbjdLtNXh59ChcEaS
         CFqmbOyerzL1ekWzfe3O64YYFSdQBWvTV1wd3rqLc9A2iTlHYcD2mv9Vfy7o2EBw4bbA
         CWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123873; x=1792728673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QXlahNE+Wx5snJLp/MKBjKZg6Q+5VrSpbj2QDx2YWrA=;
        b=hPUZq15StcUUCQYhINJyVitGLmJbQoSB/RY2B34Gc7DKA76aijzKbcXAZ9cjDWuqGa
         jRUXMSyu/GDvro9GGZUiLd1axdrxWuBEm0GEUZSv8AM1D3vFTuctnsmzK1wayEsEPFQH
         bf6k26JpAzYCHbjCoBoijWN9GreaETXoksvq0rAMuvN2oX7CB935AY+r2E+GqcB08M/t
         6TRKzgVg66mH+OvVyIRKnLfNi2bfQjSzPhtfODKQ+nqABeUWRsHgse1krvH0x383icG3
         l+IQ6/1vABE8cI+yY4A+XZI5Ush90rsSHjKFWs619QadD/FGvi2bOdX0QtnVj3lVk8Hp
         yHRw==
X-Forwarded-Encrypted: i=1; AKwUvBw6NXwDMhdMRvfUJnUmQ1rXsLsMf24Fl603Je3lgL1uTwKf43k9zCVJ/4boIMtaTOkUHQk=@lists.linux.dev
X-Gm-Message-State: AFq9FYLqoDReGrFQmehrIPTwKQdF6Tqup+jAi7rdYDrSH1q6IqcfeMSN
	OTdWgq/1gkhIBcZ+y21rZi1qYbqu3XOUIIWjghXTPQxPs/Yb4xoaEhah
X-Gm-Gg: AYBFou2dtjlfWWcmSh7nQdaRhBC1s8DZmyKXqOPq6rRlupmZNCV3c0L+hSvw3O37B1v
	A14JpvmiQ7z1Yj7tGKetf0JM7kDYWeiA4Ii2wheGxsLgwOphkt3Xjy40VJVNtwO9eMkXQt6AiFy
	+bu11XzBgnjDtUAU9yOyrOiFnC8+BDK11AY19qfyGTtn5E2SFSwGsyuKv+946aqr87HjLuW5OHU
	CM6pSoz4mVU0783Pg3g7Yl3isU/SPT9LrBthUCm58u76IkfhcvnT/r47ykTQ+Ixcgu8ZhsDmWh4
	hieQsBY+K/GnnECJrMR78AODz/N+4t54t2Q4aCTASdn15cNCALmek+y6WvnhyIxGqg2AKWc3Ne4
	Y2flMqdN9UQIr5MF3DA8vPWcqNp3KdQQU1Nwmw6gXORabuGGKhPKFyjeFToZIO3NJ9+EB3X5lrD
	tLuuVLreBQcv3sQws6FBxdrT/RgNpXKCCUYJX/0MrWnZFcpozaE5baiLOgz865ZmH6QScCqIRbW
	EpA/L8d8V1hWZFvr1eaUEPLOAJW1p0DwS1mFADJGf9pXhr8gRmDaBzL7Cysm1sAmN/mdW8UZEEf
	hcEiXHI6KWRjNQ==
X-Received: by 2002:a17:903:19cf:b0:2dd:c100:4b76 with SMTP id d9443c01a7336-2e842ce7c78mr210820935ad.45.1792123873102;
        Thu, 15 Oct 2026 21:11:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:11:12 -0700 (PDT)
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
	bui duc phuc <phucduc.bui@gmail.com>,
	Chancel Liu <chancel.liu@gmail.com>
Subject: [PATCH 05/11] ASoC: imx-pcm-rpmsg: Explain component open return value handling
Date: Fri, 16 Oct 2026 11:09:40 +0700
Message-ID: <20261016040946.521195-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016040946.521195-1-phucduc.bui@gmail.com>
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Add a comment explaining why .open() must return 0 on success
to ensure proper rollback handling and prevent future changes
from reintroducing the issue.

Reviewed-by: Chancel Liu <chancel.liu@gmail.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 30e75fee5175..85b7c929a28a 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -269,6 +269,12 @@ static int imx_rpmsg_pcm_open(struct snd_soc_component *component,
 	info->stream_timer[substream->stream].substream = substream;
 	timer_setup(&info->stream_timer[substream->stream].timer,
 		    imx_rpmsg_timer_callback, 0);
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
 	return 0;
 }
 
-- 
2.43.0

