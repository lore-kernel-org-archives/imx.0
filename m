Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70AA370AC2
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 01:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792029011; cv=none; b=goTKCIJ5lDK23BC36tisWwQsBO4nzlTYcEk772qJSUDXwaaQesrj4vtO1ZNbr/42/dqWBgZKxX9RbOYJC/MeeMJ/YbA8aWwCJhCWtF6gRL/WMHV4Q9oaySTlVxJ+qRTWsNheLlexSvqefwE9dVlHlGY9QAk9QOP0YOPnkVtOQxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792029011; c=relaxed/simple;
	bh=Jq/bIFZc1Lkj9YX4s2p8d0qHl7/l0ulkAoIKK4tXhJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tiROIwTUntKpQSKe/E2TRc15mgcA0B5BOq222GF5P8F+2mWZ+BHy0EWW9y5QiphhskNjIHI0eO8D28XC+vq5hU8KyXVe/5sUQstg+t0Y/iiGzVMWq9NJqBls2XYoY0+f7W+aQ0r0z9NTi3nbfHnHSPm39MPUa9olKdcWYDzT+BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5ms3bou; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5ms3bou"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e95bd1c14cso1966475ad.2
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 18:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792029008; x=1792633808; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxE6KFVupvhvfG6m0kR0QYNTixMRnaDY+YvcWwq9JEM=;
        b=F5ms3bouAJO3yrDGCR6u24TVaKfVjDJY6rMRwBuAx07Su5ALt2vAosjknwuwCLRYRA
         8v6IHRmgcSWjm/CuvEUA0D841LOYCr4j/EStZkEd4MYGcdjVs/ujhsCEISLK3GYXpTqc
         ZvGa13Z4o2Y7d5ZpLe5kY3Hh7x36rjooAr8+8ahT5XuTItcLTeGnUE1qtTnN5C+jxBrI
         L2E7wyjiIrMzELusOGxbrIdtd2GMCeWnLgym1JJ9PhQDX+gpIgQP+grqH3rkS/X/zOi6
         vc0DItte1/uOL3U3fMoJ21z+KrZJNjMLgwxhhJb+BYM1Zr4a2llTE3QASsSKy/LfDhF6
         CDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792029008; x=1792633808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gxE6KFVupvhvfG6m0kR0QYNTixMRnaDY+YvcWwq9JEM=;
        b=Q/Iwod18znPdV6TqLAETDHp+dCoG0OX62BVZPNcWRhSap11CVjEKgaEdfPqgZIAZQB
         LXxWeZ47/qMWY8WZ0GQ7u8n9gxL8LKqenGWFomddUohOjvAC+cwq2rCRfbAUwl3iCefS
         dOBsxMLtZsINuO+a83uL1fNCmpTispnv9ZMIZ0Kj1GtComOMSTi1gwK0OqccYdLJEp4Q
         H0B8adskvlZS1Zhui+Cb68FclrnLr3nN+nk5FutUEQEqruU9jZCJ12rdmxVhIBXEOfGP
         mg+uW/tVfxxlvLuaYjSDF/NRY1sWTJ6zgne3YWD9YVH8DDDSVnUnA0f01hIp2dXN01lj
         wEPw==
X-Forwarded-Encrypted: i=1; AKwUvBwcyAxwokuSA5lOLU6S/vDrnEfSTnNdrfdGb1T7K2/eJveo9m8W6Si2xHoFlcdPULzTCIs=@lists.linux.dev
X-Gm-Message-State: AFq9FYIuqFSMBeBopcMFDrBvZ1F/qrgePCeRrFSYEPxGEzKG/47Z40gH
	MkobRJ8zGpd7LHiM1s+q8pind09GutBvy8QvLRoLP4apiKi5nczcgBXS
X-Gm-Gg: AYBFou0/CCrAB3IDTV5A9LHSIn0gUlbeHnKATVrVNg8vrLD9PTaxSwKjI4mIaUQgwa7
	PQxtwBZ+ImA7r7GVZuDC5JDdtimgeJCzYD8EC6hvgOW/9DJrRk+8WeoSxLTZ4MdX0/tz0x7qetG
	MweD3QneK8KC0PNDPhrh56Iawa2iKOQQdy53eTF0WRTw2GIXLK3ruBim7JMXgbnhGPsVaQBqbe1
	PQPcGT7RINdJhayDztufTEyZ1dbgiqtMhvsCEdJexH1SJ3oMMc2h+N7icE8PHLfgPMhz798CRFi
	DWoEZETns9N4JPzYcPvy4EQ35o++luZzwKQ8YkJWEariWb3/2CdAS5Mfc4cyxuBVzWWkIvn1E4P
	eV4L8KN4iYzUVWl6Qgtn2h7G01tjmiKYs5iHnhRXl/xaPXVbCSfX+4twzxAWxU0GD7QkL6aVnO6
	Fyf6fy3on0JbAO+epFdygg5f9cj3h+OrNjj69x2UU5szgcEn+jEDZMcsn4dOMSxNVj1JflBOx8R
	oDeuFHTedpt+Vn/9+5LA2m27Sk2KxqPHM3gHSRjsLpD79gttO0X+c2o/CorWxydFafJn/ZaSbOf
	jPBoJLBeRYKhaQ==
X-Received: by 2002:a17:902:d58f:b0:2e5:d33a:88da with SMTP id d9443c01a7336-2e842cd4632mr139407115ad.16.1792029007639;
        Wed, 14 Oct 2026 18:50:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:50:06 -0700 (PDT)
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
Subject: [PATCH v2 22/25] ASoC: renesas: rz-ssi: Ensure the component is marked as opened on success
Date: Thu, 15 Oct 2026 08:43:21 +0700
Message-ID: <20261015014324.5569-23-phucduc.bui@gmail.com>
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
from rz_ssi_pcm_open_pio(). ASoC only marks the component as opened when
.open() returns 0.

This currently has no functional impact, as the component driver has no
.close() callback. Still, return 0 explicitly on success to match what
ASoC expects and ensure the component is correctly marked as opened.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/rz-ssi.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index b1587f499cb8..5f4a53886541 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -937,10 +937,21 @@ static const struct snd_pcm_hardware rz_ssi_pcm_hardware = {
 static int rz_ssi_pcm_open_pio(struct snd_soc_component *component,
 			       struct snd_pcm_substream *substream)
 {
+	int ret;
+
 	snd_soc_set_runtime_hwparams(substream, &rz_ssi_pcm_hardware);
 
-	return snd_pcm_hw_constraint_integer(substream->runtime,
+	ret = snd_pcm_hw_constraint_integer(substream->runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure the component is correctly marked as opened.
+	 */
+	return 0;
 }
 
 static int rz_ssi_pcm_open_dma(struct snd_soc_component *component,
-- 
2.43.0

