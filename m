Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B8D1420D0
	for <imx@lists.linux.dev>; Fri, 31 May 2024 15:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717169455; cv=none; b=J5Nr61kv/kMh19qgBsgOVIXxXYMRjzCIK/cJjOzCEG9PvToYOWfh8ZkDcnyQsWmIHgGlJ9RoN5Hc4DxNsm/HgARKK/Id+MUAej8tgBBmBbDDFN3+Y/WKRSHn3k95cdZ9iONaCvQRtEUN/or96L6Zr6JiAMMfOuGNUUrlsXiAcr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717169455; c=relaxed/simple;
	bh=ZQKha7BG252KruQ9oU8AYSozYEYwH5AEwR9Xap5vJ0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=grPoQl6gNdzmXvLdcQE/zpqdFfBXHUpy5qiQR0VlO+PUJVhoQ4c1Cdkaf5mQBQi6ePFg1Dy0Kwj6ABRS1OAPaCclFCbeL++RiR5bo9FmlEvPxFwY/peV40PDEkwm1tbvmcpCe88x4LqNA361fjNQ5w+FG4xSeuTSkAoR7w6ei6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WBEGFTKi; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WBEGFTKi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717169453; x=1748705453;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZQKha7BG252KruQ9oU8AYSozYEYwH5AEwR9Xap5vJ0c=;
  b=WBEGFTKiJh6ZT1a5OnBNgAeDZiXHv/g+fMLP//71aSTeLqJkwJZwKr9Q
   qT2oB2v2z2OX+hvnboZD2iUj8Ejyc5lVepW63iQjx5no9gnOmRz1C50T/
   Rp7feHDAtHdoYdFC6zENSLm41Rz6jdNDtj9xEgKyGsFvAORdQb9jL5Kvp
   W/0vy0WbmahysoFxFCygr+iuRiOShZn1m55hb8P7rt/mcehhvhV6aaFrF
   r+zMBnBKJ1JEVfrXxPpaLfNeSCUbxb8GUSIQJeHtcQCqY9yFik1+sCWOE
   TNHpFjfkYwPZIMAvHSm2RaKbqenickN4Ax/eNXlRdwhg4h5tI5MlCczVY
   g==;
X-CSE-ConnectionGUID: xNhEun2BSBqxRoYZReDauA==
X-CSE-MsgGUID: 3kTOu2M9S7e7vsPPDyMtzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13839599"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="13839599"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 08:30:50 -0700
X-CSE-ConnectionGUID: 3R6qj3MvSkWKx9oZgpc3VQ==
X-CSE-MsgGUID: 2ty8IMICQ0iFA8vS+R6Azg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="40627260"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 31 May 2024 08:30:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D6770668; Fri, 31 May 2024 18:30:39 +0300 (EEST)
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
Subject: [PATCH v2 4/6] ASoC: codecs: Replace of_gpio.h by proper one
Date: Fri, 31 May 2024 18:29:31 +0300
Message-ID: <20240531153038.1590171-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240531153038.1590171-1-andriy.shevchenko@linux.intel.com>
References: <20240531153038.1590171-1-andriy.shevchenko@linux.intel.com>
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
 sound/soc/codecs/aw88395/aw88395.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/aw88395/aw88395.c b/sound/soc/codecs/aw88395/aw88395.c
index 3c459a67ad0c..be6ebcb51cca 100644
--- a/sound/soc/codecs/aw88395/aw88395.c
+++ b/sound/soc/codecs/aw88395/aw88395.c
@@ -8,9 +8,9 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/firmware.h>
-#include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <sound/soc.h>
 #include "aw88395.h"
-- 
2.43.0.rc1.1336.g36b5255a03ac

