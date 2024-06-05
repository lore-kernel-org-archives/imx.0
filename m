Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A894515FA7B
	for <imx@lists.linux.dev>; Wed,  5 Jun 2024 22:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717625701; cv=none; b=ZofnGDh609400aGHEjsyb3WKjCF/NbbtsJ3eO67lcyAeH4WGnDMtl6X2PDjDggzikgpAE3tpBZlpqCPWYY2weE4B6wz/J4M0QCHCPYskaNYKMh1bN4LN7mH55JjNfxXvk2gIW3OFXoZJBB4JqTrDslxU3VcyBnPT99fyVfDi0Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717625701; c=relaxed/simple;
	bh=81hqptQlE/LEM/MdYuEb48YnMieQd2hcNEosrso0DUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OXKeRVsAv/S64P554JK8vRQIOVHXNXYQemOe6nu+xpUEVta9qX4EsM8pZR221vhwG+svGyu10bYQVymroaLrNTvjGXEtrGtPyUu22wEFMKuV3phLBUz50/Xiy+hTgUmPPVcyoRbiqa+OKk9P268VPQZ8bclk6F+N7OODS6WkW7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kup0NZCF; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kup0NZCF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717625699; x=1749161699;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=81hqptQlE/LEM/MdYuEb48YnMieQd2hcNEosrso0DUw=;
  b=kup0NZCFwcyZr/sIyqIqRcaUXPnlKdY7KPDKq1KYSLFEXnUGJb3Xqt0k
   acO6T9IWunaii1j2Jdzs2Ke2XmXP13aAGXygacon8Q+68AYeQwAFD9TGq
   LayFQplSUaR8xLyWzn3LI+hSkqF2nE0+8cCY8IHzorevwUpWRjp4K4pBV
   q4CJKX3M2c607Y9PZWeXT3okYIjS/SN7A/xFShaooyojuSX7fUlHvr/tZ
   Cu+HM7Ej/bJY+4lDl0QEbPExUwIzYtinUmZeLmInGZCm7VlnlI6YhCsZX
   werOlcAs20GlFKqYhGxzTD5pkWln5CZVy4swDkpyvZY1k/zxXF9AKAA/P
   w==;
X-CSE-ConnectionGUID: oXgvm0AiTiuN6CJorNlQDA==
X-CSE-MsgGUID: a9r6AGd9QBWPJLyUE5tKTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14218712"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="14218712"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 15:14:58 -0700
X-CSE-ConnectionGUID: t3Uw16VJSqWd0O8yE01ocw==
X-CSE-MsgGUID: G+RGTNK3RGqRQhdhfEVyug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="37621428"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 05 Jun 2024 15:14:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C9DEC44F; Thu, 06 Jun 2024 01:14:47 +0300 (EEST)
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
Subject: [PATCH v2 3/6] ASoC: rockchip: Remove unused of_gpio.h
Date: Thu,  6 Jun 2024 00:27:26 +0300
Message-ID: <20240605221446.2624964-4-andriy.shevchenko@linux.intel.com>
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
 sound/soc/rockchip/rockchip_i2s.c   | 1 -
 sound/soc/rockchip/rockchip_spdif.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index b0c3ef030e06..b378f870b3ad 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -11,7 +11,6 @@
 #include <linux/mfd/syscon.h>
 #include <linux/delay.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/clk.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 1a24b78e9e02..eb9d5dee196e 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -11,7 +11,6 @@
 
 #include <linux/module.h>
 #include <linux/delay.h>
-#include <linux/of_gpio.h>
 #include <linux/clk.h>
 #include <linux/pm_runtime.h>
 #include <linux/mfd/syscon.h>
-- 
2.43.0.rc1.1336.g36b5255a03ac

