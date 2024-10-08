Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54A020A5FF
	for <imx@lists.linux.dev>; Tue,  8 Oct 2024 17:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728408889; cv=none; b=B3bImYn3pNFw6bBYYO9T6U9ji0+EGj7hnAfZSX+5e/OF0cv2hGuPH/lIHj9AICLEzu6w8NHMoKpbL4fBfSdumeRoctkyoti+6vfDjF1p9CGRP3pDhbTzhvXniz4pDDknKIVI0bRNzctV1Wc8iSdXtwWc19ziT75HnnJWzPGJpaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728408889; c=relaxed/simple;
	bh=M41KJpPTgtZC1kvfB0ok8XtGl6qr+rtNSYSFho5CTIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qnFL5lhUqKiRAPPXydNVWt/HPTKBx71WfsWj8+PMGJErnwuuxc/9C7rWtyxRzyVWmRuwAtN1iM81NWmkt3BSqmzTcNhUD6rn/PDqfJZeSScObmv1deyzEyS7JD8EwimuvhrOSoiT4tV85I8SuZFKCJdRd1H7M41eM3A/BZgv8qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FXAZjBZZ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FXAZjBZZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728408887; x=1759944887;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M41KJpPTgtZC1kvfB0ok8XtGl6qr+rtNSYSFho5CTIc=;
  b=FXAZjBZZ1KHv4VCWAQPyutEIbQFBcg1Dp4UmGK3bjuFPN3iEiEbF+WSF
   wllj4g9sbhkTW+nIf473LhoI96rkgWYNbb+1G5GRuisRZwVnuai/5YC4D
   FMUgchTijK6mBWuDJm6ZoyD0YHyOiBN6BG+QKmU495ocxnZg6424fTN+K
   jBtd6+L86gujYyE/Azk7WNZt+DlpVeXmRjSxuYfNbgc/9trUBR7ImBqD1
   54VzHOED4LTgCrG8MtLIYfg2ZW8LMwRH84vkQXpQiSOOfE01xYzlUZZdZ
   ot/RbpTSdRprA48UpEp8wNAkAJJ/QRffCSgMW8T9LhNYkUgVkR+xqytNK
   Q==;
X-CSE-ConnectionGUID: iGmwneQPT4mZuCL+ELUicQ==
X-CSE-MsgGUID: s7D3r5VeR6Ozcz0V6goeag==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27510136"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="27510136"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 10:34:11 -0700
X-CSE-ConnectionGUID: t8RFXAV7Sqyt6MzY8WQMWg==
X-CSE-MsgGUID: zeSFKaSOS52rpb6wYKZVXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="106677517"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 08 Oct 2024 10:34:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id AEE59347; Tue, 08 Oct 2024 20:34:06 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 3/4] dmaengine: Add a comment on why it's okay when kasprintf() fails
Date: Tue,  8 Oct 2024 20:27:46 +0300
Message-ID: <20241008173351.2246796-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20241008173351.2246796-1-andriy.shevchenko@linux.intel.com>
References: <20241008173351.2246796-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a comment in dma_request_chan() to clarify kasprintf() missing return
value check and it is correct functionality.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/dmaengine.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index c1357d7f3dc6..dd4224d90f07 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -854,8 +854,8 @@ struct dma_chan *dma_request_chan(struct device *dev, const char *name)
 
 found:
 #ifdef CONFIG_DEBUG_FS
-	chan->dbg_client_name = kasprintf(GFP_KERNEL, "%s:%s", dev_name(dev),
-					  name);
+	chan->dbg_client_name = kasprintf(GFP_KERNEL, "%s:%s", dev_name(dev), name);
+	/* No functional issue if it fails, users are supposed to test before use */
 #endif
 
 	chan->name = kasprintf(GFP_KERNEL, "dma:%s", name);
-- 
2.43.0.rc1.1336.g36b5255a03ac

