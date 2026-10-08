Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A894973BE
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 10:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456237; cv=none; b=TSNqn0nMqnSWQPOSL2jba39dtrtyH7YLXLrlA/JULRd6ZftnEbx+Wu06t9CSX0jtfQJY7XOy32x+N9jIeWIBUg0jRYvXerXWWoXu8cvhKBUUmtFvyoJ4OfBhfDvbxObbzE5AlwdEMTHyqrNZ1koXJClvoUd4/sycV693i00FPc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456237; c=relaxed/simple;
	bh=vvcbfnXGCnf5gP2K0RdApQU8Qozupvn7TgtW31CYdg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rmoacpy/j+Fm9aeb2S32nhJ6dmcUIh1IlnGFS3KoPwL/GjETjEXpECB/eZyAkUAPNDDdMaNXkNkAbhrWuPy46OiwlN+9k0Jb39QeNZ6q0tjby7i43hWokHaLWXU7C1GtNg1tFfOIJJ++60URl7YT6hkEeHCiHpxWI/tRPZNakM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzG0dhqt; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzG0dhqt"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-351775aa1c0so1015665eec.0
        for <imx@lists.linux.dev>; Thu, 08 Oct 2026 03:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456235; x=1792061035; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YXFN+txE8KZkOhxhM5jNUs8Hv1tuj3AnGefbY7UN1PM=;
        b=hzG0dhqtfoZXP6z4gfZMoG3M2XJ9TsJ7M1V3upUZ7EmtOaJBJzwRSi27gQc426yS62
         NUZ27BJyNZ2DRxbeHiTZLcmMJrwLmCVeay3QUrOL8p1rR1B8bd6h92J9tXrmc6NduoZ+
         xR7D0n5/iS6OY+dO2KRk1Ayy56IYEPwqjMnwoJf/h2NjYEJBXAbRK7QmdC1y4CnbEBx0
         BksJ0aADFv+22L1MWX4tzLq2yOGJXg12dJdPiSfP7VJmu8OL/cxgoLpFFbkFsdS+DJjh
         dPYOjq3cgELjWewITtrTFqBgpO31zjz8bXdFbvGcehG1XxxSN9SB5UPWWVObYR6P0LkU
         mrtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456235; x=1792061035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YXFN+txE8KZkOhxhM5jNUs8Hv1tuj3AnGefbY7UN1PM=;
        b=doCQ8dZww2OI7cB+kv3NMNGpUphZ559ipZGWorsrJy5zMA8Znmtc5ParWSc2y81YVd
         XjRRRykZxdv4dy7Hj0FJRdItlp3Ej8c/x+U32USHpLDt7IdesLTYBbSYoBjoSmJBkDIi
         LZTsTXyCNKLQsjvuNNqeGKxoNhkldEr2Gl2+aOL0/fxiUWA0GgJ4/zvB2BgpH4wPefzM
         zY6+pDEHzFTFwFOHj4geRAK5Yo0gxqHpNcLlGFbF5PFZx6QzCDSHit4mM1uGOznz+dPB
         vyEyJjX85l4BYke4b3eaXkwFzkkqDvKgt2QM3tg7nyjovKBebxzh8JaORjt5oJENeHky
         yg/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxiWFUK3bzEvwAKyrTIKzBzXz2ULkKu/9YO+NS/46bjX7Vq9S80sgBhlv00KYkgpnDZYSY=@lists.linux.dev
X-Gm-Message-State: AFq9FYKLAgiHL+SYHH65BK3t2ajHvlusWG07WPj7gTo5vrrcgoqZAGBb
	HHje9uO4POUQv/2S14orcrr43rAgDFc+xPYixVyUp6av1cE/1ps7T2pT
X-Gm-Gg: AYBFou06hcQ6NdQwc45C4kzA8+kANv+n+q1uilFxe+5bGd9gjSay7vgdc9ZzVjQ3M3Z
	jW8Js7B6IdBJj/yEM2MxB7v/Z60G/mpTTjqPY4/dKSozzd/QqLbGOlPwZ6bkyObqKJo44MDtNjx
	MEQS8/TRJGTqNBUAsr2EfLK7QKniYHOSO1fS2vdKP/g2iFlz2hid963Ur8k+WdrlhMv/C3lm6Iw
	9ncer4+BMQGfHZnyC7RxIsELiSDb3KPkfo5mVtdMHWxrCz8HrCABFbpyZKq0cpQe5/sLxBODFAZ
	sy05n/YixNtxLY2mlCwmnxKRQpYaT9nHceKpfbdEWOm0UVCUPBpXa0Mnjai1rKiI6EnTnrw6YnO
	6a41PhQUmKz0B3SC9LQrz5IKcEWwYYCqXltLaqKsNFYzzARapSwYWhhkO7WzJ8Ferly76rS7T+R
	EfKPEaNhBGUj/JGHLthJ6VWqtrsZx+uHQPd3Mzk4zM7jm+wQ7xL6pyXqY46z/d+AvBdzOdMFwr1
	aT4rJRzMaKVji6Y6CAoT93EvWo2U+Jj1uSUzF0VtZC8tsOgGBeCAZk7QCoq88QU2HQjTeVhlOau
	kLKSwbLWYU/+2rnjJJUkB1kS4w==
X-Received: by 2002:a05:7300:fd0e:b0:352:3bdd:423b with SMTP id 5a478bee46e88-3523bdd4437mr1444746eec.21.1791456234716;
        Thu, 08 Oct 2026 03:43:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:43:54 -0700 (PDT)
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
Subject: [PATCH 19/24] ASoC: intel: atom: Fix .shutdown() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:26 +0700
Message-ID: <20261008103831.542533-20-phucduc.bui@gmail.com>
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
from sst_media_open(). ASoC only marks the DAI as started when
.startup() returns 0, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 4889a8a73f65 ("ASoC: intel: atom: Use __free(kfree) for stream pointer")
Fixes: 6cc0f4e63994 ("ASoC: Intel: mfld_pcm: move stream handling to dai_ops")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index a4c8cbfba096..db1fb3b26909 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -341,7 +341,7 @@ static int sst_media_open(struct snd_pcm_substream *substream,
 
 	stream = NULL;
 
-	return ret_val;
+	return 0;
 }
 
 static void sst_media_close(struct snd_pcm_substream *substream,
-- 
2.43.0

