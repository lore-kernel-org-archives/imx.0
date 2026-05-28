Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87D839E6D4
	for <imx@lists.linux.dev>; Thu, 28 May 2026 09:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779959186; cv=none; b=Ab8EtCKm4ezAiUeFOq0VhyBA3uQ1oNrbwGkMZ00Dz98G95uPaK1k8oMi99bE9VMR3xUU8HG7Pk+nHTxgZN+5aEIeS9Q7+rt2oEJ69KdC+cwtYucquJo9YwLoZV+jJZ8EdRn3+oF6fSaba5VCCgQ7+EWzdslMdgMlgWTWyS5mdi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779959186; c=relaxed/simple;
	bh=pePpbntnwnsj7EYGTYln0S0Z1fUMMahUgMDQxO5w1uU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m0Ue7RDffvLNp88QQnKsXvtfGyEaffeHUi7eFVbfpc2CTqiEHaYojMlv/hlzghHKdzQBpcaxLxcoNdGWBiwu5pA949U7cP02b2WG9QCjzBtRJ+lsNpxmUOWIiPq0DJabUiuaeacmezO3ieCB4DVubPbU+UnE8xAw5DaadjOR91E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=j7tTIBEq; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="j7tTIBEq"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso107321085e9.0
        for <imx@lists.linux.dev>; Thu, 28 May 2026 02:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779959182; x=1780563982; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NCpVC/B+fK7iJncp3doDyeYOwNSb+lqrnGIijdp/R+8=;
        b=j7tTIBEq/dLQlAkUxLsuiqhjNloRS/01a0bQP3Qs8O1s9oAkwOUMZ9y6f1+F5S8ukm
         I0Whcygf+KDV45NbJ3XMgHnXJPz/CPGMPIFmmUEyNLEsDurbBUPWwO3io/V9gW+8kY9E
         tE7udaiXwJ86L/RdwgTRKQRu2O9MwnQBAlkzOwuzSxNDvXn4NY948HQSl6KyQkcd4M4K
         LIju2r+W8FdPX09pU1VYpYrOgO6dupMFVVI8Xc40e1mN4DlLWTDIgp3jQ1uwO+7jiQ8C
         QWDvWMZ8ikty+cPO6hy8R8Av1zrwW7SpVuizKNamssuJPg4za0iy7JvdFCHMjfnOJYzM
         dcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779959182; x=1780563982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCpVC/B+fK7iJncp3doDyeYOwNSb+lqrnGIijdp/R+8=;
        b=XbRRzmtPW0x66aBw7bzIe/f2Sg/EbYaoGT9/lzWR0nadxpYAIXmg7X33D4JFNe3amJ
         5wVQ9l30QVeIs4yY5PyZaXHbF9LbbB+ulNb2CIWIxpderVNiuy800opbs81q05vBBBkQ
         r/6KIRBhQA/5W58lVGgtCi5HhrSad95w35AoezNdDdKi67A3Twqcv7tpPhzhUfA2ddIE
         Nl0D8ZP3kkGbVCvD/KRGp26179ZQHFJfCOksl708D6Xxn4w+R31/SRI7Xx6s/gXW423a
         piQWA5L6DFnTpdyLqU4cvcngFqqsdZhXJg4Y9VLw4ztfjK6FnO1ZbQyCqLEIpCzQrgE8
         w/GQ==
X-Forwarded-Encrypted: i=1; AFNElJ+wv5qw2v/oNsrS/nB/E+CXsxz8ZktGNdFV5mLzoOiCc2K7kq0rjFmhZUOdgReBOuoeae8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMAGyNVIkMG9915ywy3HJHNc2z5p2PLo/opycEkfW/lP+dqXA/
	wgw9vvbkhnqOCPWr4Vn69fzYTej1Ql2NQQGGMRd517eeW9uqoxfubDcLJINRkgcQJ8g=
X-Gm-Gg: Acq92OF6mvnTOd45WU7n/blylvDSLWprMitfX15fDCvXqNgw/V+skRAnSA9pJiOBz9U
	/oMdobUQ6rWj3AVVL0OnghTu1kF9D3ybnul0r5ZkdQSFrYacvrgDBFqzadgJLhaJcYC3V6R8cMF
	3b1upzlSpS9bP9ytae0BNhcAtiKQcyAahHS+FjDH+HN25ACJoQx/vVn7pinTTdvMU/tSbsfxmQY
	rroZHDIScIU4Vcp/pILphPN/Cy2o7sfB+iSEV2G7gpl8AX/dTlGIxXTbYzJXdXZfwNVC/pQkPD4
	vSJnMFGdgCvLSdMIoiZYl2IAhHnOdbC6eXjeKkUMLTY5U8wlnCTalCY2m6NKNaF++xuc2cmp6IU
	CDdoHRqG5Gt2QsOCzpjGqq7fWeT+Bl66Y/xL3rkvGPNGH48WbeJlkvn6WgfHnLdfs92cCaJxGgZ
	lIUYZn/4FI6ZFX2lrBGbrq+ErTsq0qT0molJQCRTqLdBb8pzveaf2/08qqUTJlhbJ0R6crPMHQm
	4jMNO+L0sQHsN821jC8k14iAA==
X-Received: by 2002:a05:600c:35c8:b0:490:44eb:c1e7 with SMTP id 5b1f17b1804b1-49044ebc2d5mr480016505e9.30.1779959181935;
        Thu, 28 May 2026 02:06:21 -0700 (PDT)
Received: from localhost (p200300f65f47db04e95e43453a0d1648.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e95e:4345:3a0d:1648])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49091d57c0dsm45855525e9.0.2026.05.28.02.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 02:06:21 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Hasun Park <hasunpark@gmail.com>,
	Li Qiang <liqiang01@kylinos.cn>,
	Kees Cook <kees@kernel.org>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Mac Chiang <mac.chiang@intel.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	=?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	linux-arm-msm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev
Subject: [PATCH v1 0/4] ASoC: Use named initializers for platform_device_id arrays
Date: Thu, 28 May 2026 11:05:59 +0200
Message-ID: <cover.1779958164.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2760; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=pePpbntnwnsj7EYGTYln0S0Z1fUMMahUgMDQxO5w1uU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqGAV3A/XGhyTdPC2Sbsk19+exJrBTv8hN9EsT0 GAAjGOFfiyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahgFdwAKCRCPgPtYfRL+ Tgg8B/9D5gNT6QFkJSSGOnZq876EyBKdLt05krj7I+eM9aYvKsGkdCLHcG7QZHsH64DDJCElr0r rkkvYPqCAgT0nB7gOzo9U0qtyp69Vifs5eRYtlUzz+MYNPrOw1HZyPhMUokS9DH1Pp+kkk1fj3S pf2IkbuFyVhLCrKlKWuXJYjCf8Go8i/nKubc2wg6igcHvdnyTzxT+83dJT/P31ERPelDR9wXr3g NwuRB3IaDbFvfetwIRZGEvJ38cIqOwdZWALeex3CzgiNZyJVzlnyX0/cb63x8sz08tUXTRpK9XZ iQM3C8HjSEsS1U3+EfHXzpVCPMgXHp9ra49eC3vLgqNt/Qh1
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

this series targets to use named initializers for platform_device_id
arrays. In general these are better readable for humans and more robust
to changes in the respective struct definition.

This robustness is needed as I want to do

	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
	--- a/include/linux/mod_devicetable.h
	+++ b/include/linux/mod_devicetable.h
	@@ -610,4 +610,7 @@ struct dmi_system_id {
	 struct platform_device_id {
		char name[PLATFORM_NAME_SIZE];
	-	kernel_ulong_t driver_data;
	+	union {
	+		kernel_ulong_t driver_data;
	+		const void *driver_data_ptr;
	+	};
	 };

which allows dropping several casts and eases porting CHERI to mainline
linux. When adapting e.g. sound/soc/amd/acp/acp-legacy-mach.c to that
and make use of driver_data_ptr, the added const makes it obvious that
acp_asoc_probe() modifies the structs linked in the id_table resulting
in issues if more than one device is probed using the same platform id.
sound/soc/amd/acp/acp-sof-mach.c has the same issue.

If you consider the last patch mostly churn, just drop it.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (4):
  ASoC: codecs: mt6357: Drop unused assignment of platform_device_id
    driver data
  ASoC: renesas: fsi: Simplify driver_data handling
  ASoC: Use named initializers for platform_device_id arrays
  ASOC: Unify code style for platform_device_id arrays

 sound/soc/amd/acp/acp-sdw-legacy-mach.c |  4 ++--
 sound/soc/amd/acp/acp-sdw-sof-mach.c    |  4 ++--
 sound/soc/amd/acp/acp-sof-mach.c        | 14 +++++++-------
 sound/soc/codecs/adau7118-hw.c          |  2 +-
 sound/soc/codecs/bt-sco.c               | 10 +++-------
 sound/soc/codecs/cs40l50-codec.c        |  4 ++--
 sound/soc/codecs/cs42l43.c              |  4 ++--
 sound/soc/codecs/mt6357.c               |  4 ++--
 sound/soc/codecs/wcd934x.c              |  6 ++----
 sound/soc/fsl/imx-pcm-rpmsg.c           |  6 +++---
 sound/soc/intel/avs/boards/da7219.c     |  6 ++----
 sound/soc/intel/avs/boards/dmic.c       |  6 ++----
 sound/soc/intel/avs/boards/es8336.c     |  6 ++----
 sound/soc/intel/avs/boards/hdaudio.c    |  6 ++----
 sound/soc/intel/avs/boards/i2s_test.c   |  6 ++----
 sound/soc/intel/avs/boards/max98357a.c  |  6 ++----
 sound/soc/intel/avs/boards/max98373.c   |  6 ++----
 sound/soc/intel/avs/boards/max98927.c   |  6 ++----
 sound/soc/intel/avs/boards/nau8825.c    |  6 ++----
 sound/soc/intel/avs/boards/pcm3168a.c   |  6 ++----
 sound/soc/intel/boards/sof_sdw.c        |  4 ++--
 sound/soc/renesas/fsi.c                 |  8 +++-----
 22 files changed, 51 insertions(+), 79 deletions(-)


base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
-- 
2.47.3

