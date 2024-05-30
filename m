Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC871836E3
	for <imx@lists.linux.dev>; Thu, 30 May 2024 23:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717110053; cv=none; b=iNCw5D88jU38voXFK27BYIv+SXKozZL8Ex2BQv2BM6Tg14JJfWmzI1kgwCOTOCbpNPJrqI4erKmJj4fdUa7/nbaN/awP/jQMdO3sfDM7GS0efHhE3NW1Ud+MUoGSZ9OoCDReKJ4GcV9dwCxVpDixm8ZcTrhnwr/JlLBcnvB6jmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717110053; c=relaxed/simple;
	bh=ZQKha7BG252KruQ9oU8AYSozYEYwH5AEwR9Xap5vJ0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KDQy3Flj97o5oWQoZwcywjLiFmHoTPQkw6rqR6luqA0ynke0C7hnb4dcjGKUXTBBc3uZufRKSdQER003AhQHqrNagMhdqCcNckB2NDPnOz+FplOQOr6yJJ5CZ2Umw3jNC9XcafbFh4+J5zGv39UNE+lL+z2v2aRK4vN68ikNXPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IH60+gx0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IH60+gx0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717110053; x=1748646053;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZQKha7BG252KruQ9oU8AYSozYEYwH5AEwR9Xap5vJ0c=;
  b=IH60+gx0jLtsi41GRU/wcmS4uPKCHLwZQwuIXToQhvTA+aTN0K1doXx5
   3g+KPHe/KtWU5z4C6W0KfD/J0PAGyua956evP1XenmU0PWtcw6ex90Tw1
   YY234etRq7aH3yhOxzU2u78cwqVL1UAs/9j7JOYCKxyUdZ+6Fel6ORFgQ
   XXLR5lIexdDKxLzvB007dWczndfazEogZO/ANYVgMtGxzPI68DR1/j0af
   HjUPGhStBzkzJLyxN/PYKkU1rQo47xMym3lPnEyjRIUH9vsvHoMtQXYbf
   bBYhxrafZk9NDJGsmeJRcRjzhsuN7OGPPpseK/NJOCDynd+cz2mqsefcU
   g==;
X-CSE-ConnectionGUID: SCgHyKsiQJSCVl64K3WqdA==
X-CSE-MsgGUID: 2VI1h0/DQkatfSinuCV2cw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24195244"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="24195244"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 16:00:51 -0700
X-CSE-ConnectionGUID: n2sq6o+KTKmqb2Ms3NcGVQ==
X-CSE-MsgGUID: xYZcJQfTQRiunh7Ud3EJJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="40895197"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 30 May 2024 16:00:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 569B74DE; Fri, 31 May 2024 02:00:40 +0300 (EEST)
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
Subject: [PATCH v1 4/6] ASoC: codecs: Replace of_gpio.h by proper one
Date: Fri, 31 May 2024 01:58:50 +0300
Message-ID: <20240530230037.1156253-5-andriy.shevchenko@linux.intel.com>
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

