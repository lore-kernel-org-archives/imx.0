Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E5E1DE8AF
	for <imx@lists.linux.dev>; Wed,  5 Feb 2025 14:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738767488; cv=none; b=QubOr828vXVAu2OX5Qv76DPHB0j7vFSAV5LkFV5z6k9RN1xW3Mqn/lsDgm5lnxwefZAr9H6Awxh0TFuTbWcOmxDgtrNhNfmBFq2AgFuM6rv5RatPBX2F4eJFPhjPFcG3LiXSwR4uXgY1HOOyKUg/dBcmKPIkRVLj6XVD7k2iG5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738767488; c=relaxed/simple;
	bh=uvnNcC/P2j4xylOfl/Tcg9K+1wXoPmdsdMK/xVegdEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mJKiiDwoseK2WdmCUwplX8rK5IyLDFEJZRdojYrxmm6C05H834TMbUWaVqWubxa5KkIJIsqlvVXNvfTdS12ciaDni9z240zXtzj3+bi+thVjs5+CpxEFCxxYiI+OG9X0Y8sAPqgdmTNAJGAaRiRECx/tCDgxZBiBrpwI6CNThuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LRnNL7Ar; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LRnNL7Ar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738767487; x=1770303487;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uvnNcC/P2j4xylOfl/Tcg9K+1wXoPmdsdMK/xVegdEE=;
  b=LRnNL7Aro+V1ef4bKjLUKtB4S/zVMNDh+FV2KKBX0tM76JfPj0bYNcZt
   KcvCBZRcYuR0GPIWCc/fmImrV+3ctn2Cxteemm8mrs8y27tYGk2r0EpIx
   2wSHHTUJMhnEFBcw7P628P23fSu1kMCf9pi9FHZ088rPZGdXZKvQGSk4b
   E+R1EPfGBT6twnUMXamLwx4xmMopRJ+rz/4nEW+txHqK85IB2ZRp5w1R9
   /9+Vm01G9VgdjX84b5dLUF3tBrvOw4xDtC/7zmR+3T694f9L8S2530/pa
   Ve0nBayh7MUX3fihjpEobKGg8cUIeJ8f+xHzHJstFdxZiNjYjdDVL/ilt
   A==;
X-CSE-ConnectionGUID: aWmqPyEFQ+ui4DSH3+iNfA==
X-CSE-MsgGUID: Cpo13TyoS+ecQfnjooKqvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39232348"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="39232348"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 06:58:04 -0800
X-CSE-ConnectionGUID: ve7rhMT8RhOcIscPbAcCeQ==
X-CSE-MsgGUID: 4IezkWDmRTGdOzeqUX5fIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111806976"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 05 Feb 2025 06:58:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id AE98D10A; Wed, 05 Feb 2025 16:57:58 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Frank Li <Frank.Li@nxp.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 1/4] dmaengine: Replace dma_request_slave_channel() by dma_request_chan()
Date: Wed,  5 Feb 2025 16:57:09 +0200
Message-ID: <20250205145757.889247-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250205145757.889247-1-andriy.shevchenko@linux.intel.com>
References: <20250205145757.889247-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace dma_request_slave_channel() by dma_request_chan() as suggested
since the former is deprecated.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/imx-sdma.c    | 5 ++---
 include/linux/dmaengine.h | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 3449006cd14b..02a85d6f1bea 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -1459,9 +1459,8 @@ static int sdma_alloc_chan_resources(struct dma_chan *chan)
 	 * dmatest, thus create 'struct imx_dma_data mem_data' for this case.
 	 * Please note in any other slave case, you have to setup chan->private
 	 * with 'struct imx_dma_data' in your own filter function if you want to
-	 * request dma channel by dma_request_channel() rather than
-	 * dma_request_slave_channel(). Othwise, 'MEMCPY in case?' will appear
-	 * to warn you to correct your filter function.
+	 * request DMA channel by dma_request_channel(), otherwise, 'MEMCPY in
+	 * case?' will appear to warn you to correct your filter function.
 	 */
 	if (!data) {
 		dev_dbg(sdmac->sdma->dev, "MEMCPY in case?\n");
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 346251bf1026..83cbf7197a76 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -1639,8 +1639,8 @@ static inline struct dma_chan
 {
 	struct dma_chan *chan;
 
-	chan = dma_request_slave_channel(dev, name);
-	if (chan)
+	chan = dma_request_chan(dev, name);
+	if (!IS_ERR(chan))
 		return chan;
 
 	if (!fn || !fn_param)
-- 
2.43.0.rc1.1336.g36b5255a03ac

