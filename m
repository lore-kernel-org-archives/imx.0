Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502F5136E2E
	for <imx@lists.linux.dev>; Fri, 31 May 2024 15:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717169453; cv=none; b=hp1OTfPM0seB+P6TUu1Cdz6aZlicriNJ8ciaVCaFkrRTB03mdD7kBF4x+HQPM//JNZyca1s39xZfwUMHaXAqov63+F9r+w7xIDGuZkDWHgoNZObgXVlRu8Tu6bhM4WMzetnfjSlh7XfLj/ePhJEt0JR/w/e6QtE8VGgOVzESHOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717169453; c=relaxed/simple;
	bh=81hqptQlE/LEM/MdYuEb48YnMieQd2hcNEosrso0DUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Li9Ymoz1Zp6mqtp+cqT+pkU0YoF3dRrfFET0LKG3DcUyPoGqd1WA5/Kx7Zw+3QapS2n1ZuSf+wxEpnhaRw/LVbtR85kcWQRnr8L94AflZJR6704FkqOMxvyKtKFSU4XjMYzzO/st+EYexY3neFL11+CTwr51AX4ollzq21TzBhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eodYEWVo; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eodYEWVo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717169452; x=1748705452;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=81hqptQlE/LEM/MdYuEb48YnMieQd2hcNEosrso0DUw=;
  b=eodYEWVohd2+pIs3ZeLQBmshbHSO0QhdMZR/2lV3YuPN/GDbo4JN9qWj
   zaK5giq7COEFzaBmEn/VgacaAffKRaSZmHgQAddnSWOXf9vmpRRIbhrdS
   k+YUkRGxEwq3yTxBZ961n2EOogFNE9500HQqpC+ZG15sfwgv/deq6oZeJ
   W68Whkws0JnmDLWGmpnpwdUT6A/tjzqRl3U+QokJdyqC44oP8SeAouWb7
   M4z+VP2vQ4NAhEJuxeNOjV9NNt3kQLAGAqSFaYtwpw6DwUMsUP7VTkMiq
   kILZeAxFGiaNUl//iptk3Y+Wb9t/aQo3dmXSN/3om0iRBP/9JVxBtZ8ZS
   w==;
X-CSE-ConnectionGUID: fp+JiHOnTNKn/cL9frAGrQ==
X-CSE-MsgGUID: YWwAa7nTTZ2upcj9aNeoHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24348136"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="24348136"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 08:30:49 -0700
X-CSE-ConnectionGUID: Htetr8d2SE+NM97c7xMEbw==
X-CSE-MsgGUID: eWxLHUYTTYGIR52qbo0oaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="73678757"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 31 May 2024 08:30:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C8D58650; Fri, 31 May 2024 18:30:39 +0300 (EEST)
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
Subject: [PATCH v2 3/6] ASoC: rockchip: Remove unused of_gpio.h
Date: Fri, 31 May 2024 18:29:30 +0300
Message-ID: <20240531153038.1590171-4-andriy.shevchenko@linux.intel.com>
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

