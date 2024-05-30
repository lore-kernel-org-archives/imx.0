Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B16183A75
	for <imx@lists.linux.dev>; Thu, 30 May 2024 23:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717110060; cv=none; b=Wfz9rXRoHDfU7T9pm4+kTK0NQlmOf12mf/O1Qf4H9PY3Umvi4gFuJH6VqhKms/PUvvMnZVPpwbQf74w7cj9Lm41rsiaYWb3d1QJlwbgsHjY156OBL812bzzzhk25PMUWGbBSeQv0tNNye8qNkMhW02ipTaHC64m0l9nNqxE2kW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717110060; c=relaxed/simple;
	bh=AuYIRZwuv1vWCs2uWjv6nHv7VSkA6+15BzU0BIBlcXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UOwrrruJKpVpQ5BJ20oF2YHV664Bl/rueAoAQhYOItMTk6mrZG2WLX1QCsX+C/+3A9hcwabluH9+MP1m+RofaiT6JhFeM7ehtZt347hLbpxJZtQWfWetK9km20yySAyDb876z25Gi8mVUpeCt4LszHrdnEqoTNvToyAuQHPlU24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mLbA9AUI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mLbA9AUI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717110061; x=1748646061;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AuYIRZwuv1vWCs2uWjv6nHv7VSkA6+15BzU0BIBlcXI=;
  b=mLbA9AUIsITTqfMOJuO53IlybMF9k28J6yt91uaqBAQtRVvpH44Hm9Zh
   0+1c/ShJxbczINJEJ4I7/ErZkYXHW4V8+XfVAqgH6fx18e9ihlvdrp8yS
   yfWnEXNzW3Qzv8y7Tx3lAnd0A/86vx+I7abZeqcOArY5WXrRYV7qSKrHT
   yoN+V+Awj5cpFzZjx/5Z+xHYFJlOu2eCvpMSER2FRWaUqqvOz4mA4PK6A
   qQMcAdkf0Fpxn5Fk70+VmhOYaVFDLWQygJTkmPTNLH7mI+8vZHUwMdJ14
   xeQfsOESn0K+GyDLqgcnFHJEDbfyztllXtmD3LIzPoRyrk7JIChCKkCkd
   Q==;
X-CSE-ConnectionGUID: uYqkzrlxRSaqbmFcjL82QQ==
X-CSE-MsgGUID: z17wIb1VT/+sHuaTd6aE1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24195380"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="24195380"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 16:01:00 -0700
X-CSE-ConnectionGUID: sobAkPNVTae+BISEGqSQCg==
X-CSE-MsgGUID: iCEpUl0ZQQiPRNOUAbqr4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="40895353"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 30 May 2024 16:00:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 69C1F6AB; Fri, 31 May 2024 02:00:40 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rob Herring <robh@kernel.org>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
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
	James Schulman <james.schulman@cirrus.com>,
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
Subject: [PATCH v1 5/6] ASoC: generic: Replace of_gpio.h by proper one
Date: Fri, 31 May 2024 01:58:51 +0300
Message-ID: <20240530230037.1156253-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240530230037.1156253-1-andriy.shevchenko@linux.intel.com>
References: <20240530230037.1156253-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_gpio.h is deprecated and subject to remove.
The driver doesn't use it directly, replace it
with what is really being used.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/generic/audio-graph-card2-custom-sample.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/generic/audio-graph-card2-custom-sample.c b/sound/soc/generic/audio-graph-card2-custom-sample.c
index 1b6ccd2de964..8e5a51098490 100644
--- a/sound/soc/generic/audio-graph-card2-custom-sample.c
+++ b/sound/soc/generic/audio-graph-card2-custom-sample.c
@@ -5,8 +5,9 @@
 // Copyright (C) 2020 Renesas Electronics Corp.
 // Copyright (C) 2020 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 //
+#include <linux/device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <sound/graph_card.h>
 
-- 
2.43.0.rc1.1336.g36b5255a03ac

