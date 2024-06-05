Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EF815F411
	for <imx@lists.linux.dev>; Wed,  5 Jun 2024 22:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717625700; cv=none; b=BI4Gu0l6bapJYayeouH4Bf+aJVnim6fhSt7IVqPxvgbzGGyNHPJigs8mzKF1UGGR36ZbvXJ7sHe5RlodUkfVICOfYstJNbWqtF7+A0fvcbmeRLuTbKFIUd2LKPivxjgrV1nQ/GGRHc/yoYuojjIu1P6ccynFGeqKQKxIR8h8S3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717625700; c=relaxed/simple;
	bh=j//q7PxjjHf16S9qzs6ZEZBUjOL4lL+BxQBw8TkTaeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q77pbOnegC7dYdUwv+0SIESgNA2Q84xS0DQA2TL3L8GVjUyvU7gy67FsyzUsR7LHwT9Z/e91tjZ7VKTdmrnUDCw2mvh6dI5eb7k5pUYmqK9z0BH0kNK7tPV2aw3769UdUIzgF0jaw3zStQQ//cXm9pbTrM645p7Iev0g9CHYr/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lIw/vnGT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIw/vnGT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717625699; x=1749161699;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j//q7PxjjHf16S9qzs6ZEZBUjOL4lL+BxQBw8TkTaeo=;
  b=lIw/vnGToKR/853h/Gm3TogWiJGKqVyNkFmetSnm7D5+vm1Xre99sWG7
   ZEeFfLGufQat7zRQBUVrkLz1INIzf2NAfQiCL+isPxzqzwuDbPePqT0BB
   hcuemyCB+1AD+F/xvJoa24kia1kOc2eNyVMYXbmZUAiftuJ0FyqTgZjSy
   MvMPtfDJ5DioU3UAsuAhRWnByfPoUDcZDoBbGEvFo8tSZQXC8ZGl9j3yu
   Eh0TrijJQuCb3sPoCMEy0KyfuA4m4K/E0C+60hxeHmOkBtSmBIBIhHo7p
   d3+bPYa5Gr8S1CUVe6eYcj4dcCQ7DCFjxLqRm+q8y3US8HWFQLqJw/oqd
   g==;
X-CSE-ConnectionGUID: dCeXtaeERJuPFg2+c/zm2w==
X-CSE-MsgGUID: 1JG7ZNHBQwOWYpe6gLr+6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="24895436"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="24895436"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 15:14:58 -0700
X-CSE-ConnectionGUID: HzH0miWtQ1OXdvC2WG594w==
X-CSE-MsgGUID: 8j0hPRi+QvK0cEgtvL2Q3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="38168540"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 05 Jun 2024 15:14:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B9E0434B; Thu, 06 Jun 2024 01:14:47 +0300 (EEST)
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
	linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v2 2/6] ASoC: fsl: Remove unused of_gpio.h
Date: Thu,  6 Jun 2024 00:27:25 +0300
Message-ID: <20240605221446.2624964-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240605221446.2624964-1-andriy.shevchenko@linux.intel.com>
References: <20240605221446.2624964-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_gpio.h is deprecated and subject to remove. The drivers in question
don't use it, simply remove the unused header.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/fsl/imx-es8328.c | 1 -
 sound/soc/fsl/imx-rpmsg.c  | 2 --
 2 files changed, 3 deletions(-)

diff --git a/sound/soc/fsl/imx-es8328.c b/sound/soc/fsl/imx-es8328.c
index 5b9648f3b087..3ef92f6dfc6b 100644
--- a/sound/soc/fsl/imx-es8328.c
+++ b/sound/soc/fsl/imx-es8328.c
@@ -8,7 +8,6 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/i2c.h>
-#include <linux/of_gpio.h>
 #include <sound/soc.h>
 #include <sound/jack.h>
 
diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 0f1ad7ad7d27..ce98d2288193 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -5,9 +5,7 @@
 #include <linux/of_platform.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/i2c.h>
-#include <linux/of_gpio.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
 #include <linux/clk.h>
 #include <sound/soc.h>
 #include <sound/jack.h>
-- 
2.43.0.rc1.1336.g36b5255a03ac

