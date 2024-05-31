Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F052276410
	for <imx@lists.linux.dev>; Fri, 31 May 2024 15:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717169452; cv=none; b=LVUM2i+9GrAjiCFFzxnc0gycnkDehPYvUcEEdYEUBXFnQuCwesFo42Ev6DP4T+g2PJTqQ0Bf1KNp1gHHnWskrmWPcVtNfQOcCwQWueakOlfKqh6+W7G/mBVd0sWNRocA3oSSt4zK/XaHsTIY1i+L8EQ11Z7HALywStoLOaBWvcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717169452; c=relaxed/simple;
	bh=hsjA0x6Srt7WNltFPQm36M1XEQClgGGCUWLHMkEXdTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IaJmpT0KYXmG0XWwJHC8IEeSxRZhjTH1dMxyMMVpLm76zQ8l/5tezi/V72bQDe/hMifbNvg6++hh/NV1H5AqIAikt6Pf6bVPaaPplnEA45wTFcVVbiYi+sVihlT+9hEAUPhHsIbudf3R92nAXryAfBWMZ6oqpV4FM/FnhWRa4s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gwHn53Ob; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gwHn53Ob"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717169451; x=1748705451;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hsjA0x6Srt7WNltFPQm36M1XEQClgGGCUWLHMkEXdTw=;
  b=gwHn53OboEuQaDjWp71F6SAV26buEj/aWbxkKyiN6Ak+/ouWpiKJupeJ
   ZD5ry+rTQsE2sslGSRWRtR11v0TumnVjwOuNjK9TsyutUHaTpulmfscUn
   g8NifyZKdMPIZ0o7PbEM1K12I6RtbE9z0Lw+c4W2NV8wVFd+8j32xBoBN
   sogIulYS4xgUTQJPIqejl64Mlqi9PbUhSPeS2P1Gio4aYn3QE6iN5x54P
   dMJNVdAUtZs0oQ0BwDNl10HmCiwnlwTAzBxB1ZJ67LlthO0J2HvQQBKGt
   0UOQmSaAmy5TmDOTsmeQE220YWZ9iAxuDK1j6fPCQPAa8cHb5bUr1yIoR
   Q==;
X-CSE-ConnectionGUID: 8sLGpxEYR2Gq+mXlGUCNkg==
X-CSE-MsgGUID: nQU0LZigRZW1pCNGEXPgHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13839581"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="13839581"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 08:30:50 -0700
X-CSE-ConnectionGUID: rj6obq2ERMO5QDiPGyKZ2g==
X-CSE-MsgGUID: q2N5xO0fShaiM6SvMI6SaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="40627259"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 31 May 2024 08:30:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8ED9F228; Fri, 31 May 2024 18:30:39 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Rob Herring <robh@kernel.org>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 0/6] ASoC: Drop or replace of_gpio.h
Date: Fri, 31 May 2024 18:29:27 +0300
Message-ID: <20240531153038.1590171-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace or drop the legacy header that is subject to remove.
Not all of them were compile-tested, the series might have
hidden compilation errors.

In v2:
- added tags (Kuninori, Charles)
- ripped out TAS2781 (it's a mess from GPIO handling perspective)

Andy Shevchenko (6):
  ASoC: codecs: Remove unused of_gpio.h
  ASoC: fsl: Remove unused of_gpio.h
  ASoC: rockchip: Remove unused of_gpio.h
  ASoC: codecs: Replace of_gpio.h by proper one
  ASoC: generic: Replace of_gpio.h by proper one
  ASoC: samsung: Replace of_gpio.h by proper one

 sound/soc/codecs/ak4118.c                           | 1 -
 sound/soc/codecs/ak4458.c                           | 1 -
 sound/soc/codecs/aw88395/aw88395.c                  | 2 +-
 sound/soc/codecs/aw88399.c                          | 1 -
 sound/soc/codecs/cs53l30.c                          | 1 -
 sound/soc/codecs/max98390.c                         | 1 -
 sound/soc/codecs/pcm3168a.c                         | 1 -
 sound/soc/codecs/rk817_codec.c                      | 1 -
 sound/soc/codecs/tas2552.c                          | 1 -
 sound/soc/codecs/tas2764.c                          | 1 -
 sound/soc/codecs/tas2770.c                          | 1 -
 sound/soc/codecs/tas2780.c                          | 1 -
 sound/soc/codecs/tlv320adc3xxx.c                    | 1 -
 sound/soc/codecs/tlv320adcx140.c                    | 1 -
 sound/soc/codecs/tlv320aic31xx.c                    | 1 -
 sound/soc/codecs/ts3a227e.c                         | 1 -
 sound/soc/codecs/wsa883x.c                          | 1 -
 sound/soc/fsl/imx-es8328.c                          | 1 -
 sound/soc/fsl/imx-rpmsg.c                           | 2 --
 sound/soc/generic/audio-graph-card2-custom-sample.c | 3 ++-
 sound/soc/rockchip/rockchip_i2s.c                   | 1 -
 sound/soc/rockchip/rockchip_spdif.c                 | 1 -
 sound/soc/samsung/aries_wm8994.c                    | 2 +-
 23 files changed, 4 insertions(+), 24 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac

