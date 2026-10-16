Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5632D37F732
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 04:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123887; cv=none; b=cpX5TppbkyZclYduxa6zSPgS6nnSiLgQ/PmI7hJ71VTMbDLWrW/xxWEm2yd/FmrJoc027lkCOiPjCYvnoy7/SeE/64OjuVm34O+VUV6zUabrvg1QmwTaaFKnCLXFZOkJIcFF3HkfKXWq6M6fFbNTl5j1AFw5Av+W1M+bBg86x9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123887; c=relaxed/simple;
	bh=8jX29D2gDGlcFjhAzB8ItddONnlX6s2Irul3cotnAzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eL8Wh1GUmkPAnRACLCAF32XxJtGZk2bLst+a6qzfIawzMVZSvBoPEgZElDw2er5TEUaVFhr8Zc8I9bhwlU2l6F6MumeUuOlbm6hLTokrY05cyyNbosottw8NfLdjmtrDciJkCZdKbqlQSTAdSxbYBPOUjMV+UQ20ZFqW0X0NcC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYvSNd6/; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYvSNd6/"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2db80fcdf8bso35128695ad.2
        for <imx@lists.linux.dev>; Thu, 15 Oct 2026 21:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123886; x=1792728686; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dFZz4n9YWSVULVEw1Vk7UW4bxuXJ2XFPuy179wpDhwk=;
        b=JYvSNd6/HKg3KeFKBRElTTvLk119o9M/gzXETNaf72TJv3sA4fHLyQiriGD2e9bBJy
         uBFGr3yEPTZjMgyf9BNCedpvu4drhBAOwR+1ckhE4Aj6G2Xo0Of3DSuAz+LYxB+4U7aG
         r7HHNKYus5H8gskan1MS6Utkquv52z72PtEU3Z/jDCxmv2yRLjHUPHjBBl1dSXL29Hck
         29rPs4kRZYXbONyz5+fXe+CsG4vFU8UaJVZr46eISYQqpdX+X18B0yegiAx40+HWTwT7
         u+SD9ot7TcAjnxVBEyxnPxMChHJ3ifDVLINF8UNr4w6S06+otoyTJ69UQeiFG+cGa7cE
         nFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123886; x=1792728686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dFZz4n9YWSVULVEw1Vk7UW4bxuXJ2XFPuy179wpDhwk=;
        b=HGr8owIS0/qKXlMP20U9gxsu/l3T3oZjgBzRgDv659WlAAvKoEVAOdDI61nv18KprV
         ywfN1nukVgt6SKvnedKyOWAjILJj+nkgr4/F6xr7QNddclhsR3U740AtY1TB2x18bf3X
         F0apbCLxFusBMuMz0UK7BSDRsZAjzlNlUaZnnrO8UfFpgIfMT2rca8UzVn3lnmWeOUEI
         PijfK8tKv2n4bnw4RErKLkYsDlP3gFa3oKxJXScyW1ADCRCBAHU0/ItKltSup1mfqdCd
         1lJa9YLjh/EDd155IdJxAQomyeUbZSqIukU87HkiLMCY2mdJ6mPQFFEjYifRN9cIxleA
         09CA==
X-Forwarded-Encrypted: i=1; AKwUvBzzu4xEaxIZvyYU06xVlevwdeHgA3Y/I7P3MnT0A78Gn0sNeUWxcqVZg+mric5QWxmf/3k=@lists.linux.dev
X-Gm-Message-State: AFq9FYIZrGjj4qYmiKb95JntZs2eo1p8Y9kqUOAKk6zfN8SyOfb4JAJC
	z3ndedETp6lHatNWCxgz+IUcQwYXJUP1LURVOrexz2iIHC45IChb9jwg
X-Gm-Gg: AYBFou01qlThdBYKYqXjvWUAcM9SKyPCaXy3rLbhqWz/mHZjgMiZML8/+TaiKfk/I0J
	cygI2IYb4wOs7h/auO+1dBIl9/hOMcbFJGZcctro8fvzxdfXWoS4EfrnooJOEjhW7ldeLKlgyU1
	f339uJ6NakoopBcox8AbriFbRqDfvg9UPNwpiOgbOgLMJMNrWG4CKyslPmyzsZyZKIeyLurWWyP
	J2c39aXiMdgm+m+VWdgHe1MNhOKmertUZrSovt8UlGwnF9UeEx1MhoNlsz8/c7cLnpfSsCFpDvf
	GHLeBr6IBfsT37wGm3uekixcDvALH/pmvztcRV3NEBTqKLfla+6e3Cabhe7kQ38CBfF2x6THBNX
	DWZxOFy/IYorrQGy3eqjljzFgy4qT0Do2cxqaTHI3RQ0P8l/b+IpEL9crYXZ+wEwcj+LKHyfS1J
	ZkxAH/gdd/4RM5Ku74HeGDPKSZIGlI7lA1tVVFqLtIzLbzti+TYIsuGAB8W9lyBE+wJL9HV/cSF
	bTgSGWWzsTXD7HIIe0GE9uBK6MmJku+l6wtu4tf47Mn1heQYvhnoPX2z9a6w1GVice+2G/WuKv/
	A1GireUwrqg4Ew==
X-Received: by 2002:a17:902:ebca:b0:2e9:401f:f0f4 with SMTP id d9443c01a7336-2e9401ffb38mr56691775ad.16.1792123885664;
        Thu, 15 Oct 2026 21:11:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:11:25 -0700 (PDT)
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
Subject: [PATCH 06/11] ASoC: intel: atom: Explain DAI startup return value handling
Date: Fri, 16 Oct 2026 11:09:41 +0700
Message-ID: <20261016040946.521195-7-phucduc.bui@gmail.com>
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

Add a comment explaining why .startup() must return 0 on success
to ensure proper rollback handling and prevent future changes
from reintroducing the issue.

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index db1fb3b26909..58681e007abf 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -341,6 +341,11 @@ static int sst_media_open(struct snd_pcm_substream *substream,
 
 	stream = NULL;
 
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .shutdown() is not skipped on rollback.
+	 */
 	return 0;
 }
 
-- 
2.43.0

