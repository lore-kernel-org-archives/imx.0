Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37D215251B
	for <imx@lists.linux.dev>; Thu, 30 May 2024 23:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717110052; cv=none; b=Y2mMW2XgouNKs7eYPw9rWnEaRjVvzV9KKum2S1TTz0PbFp09AJkpE95pxcimjc7/w1FZENeUp40mY4iFGGYKvyp80dK+wzAKqXVIJOjACR+QHMrXgX01savi+ItnEDVyGhd0NsEN7vexUThB0usbsVsZyXkhgR/oSL9mJhggxUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717110052; c=relaxed/simple;
	bh=j//q7PxjjHf16S9qzs6ZEZBUjOL4lL+BxQBw8TkTaeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JCgXlrQ9vvRjJfuN0yflXn9Pw5vZKttnNqZnh6q0ckty7ybJGx2b8sjHz8S5kHua7nM01pAqGv20t0Lmr6FqR/l+T8kofKERxA9Onu2gPswyr85bVyg9itgJqq4q4dffTdsj/p2KB1p6jGn+t0Uj98nPutgx9KbK63w6VB808GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kjegzmIn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kjegzmIn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717110052; x=1748646052;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j//q7PxjjHf16S9qzs6ZEZBUjOL4lL+BxQBw8TkTaeo=;
  b=kjegzmInc/rL48bOEXaLPtvtPGJtXh5u4V6bUYx7xRIFddKZvFBZMe3d
   tkyJyit+fLRUEgKEynG+c6mrBxqZnSx3yP7PiGaBaMsDHNbuXnZEcpSdB
   F90QfL9BK0YZkpboEYaRBRdgwRIa5x+YVHXkl0b2jWV9In8UCaetfxaNc
   K2bmxtdmntNdCPO65VFp3vevzPVOIIRnLbbWBDc76wSkHBsX9LcJdVmjD
   6321IQryHU00hPyVQiqJcV0fvjJ0/YbAOQA+ZADtc8LZPxtPBtqFbTFRi
   0jwEXJMWMyVdfaOL/n3bVpkQ6cAqqiX/NpS3IixGoWUhBi3VyKdM2zZgw
   Q==;
X-CSE-ConnectionGUID: tcKWcsMbSkqq55o+0Gg1gA==
X-CSE-MsgGUID: p2tk2lhUTXqxIA8KxhWFVQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24195264"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="24195264"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 16:00:51 -0700
X-CSE-ConnectionGUID: cGbSoxG4TkOhjSI0HA6DRA==
X-CSE-MsgGUID: VAH1aJ7mQbC9k70Lz6+POQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="40895195"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 30 May 2024 16:00:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3BB072DC; Fri, 31 May 2024 02:00:40 +0300 (EEST)
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
Subject: [PATCH v1 2/6] ASoC: fsl: Remove unused of_gpio.h
Date: Fri, 31 May 2024 01:58:48 +0300
Message-ID: <20240530230037.1156253-3-andriy.shevchenko@linux.intel.com>
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

