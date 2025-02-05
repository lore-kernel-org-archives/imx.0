Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C15A1DF993
	for <imx@lists.linux.dev>; Wed,  5 Feb 2025 14:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738767488; cv=none; b=Nq77JhM2eFUa3ENBlOdm+0vKijVjyjwLn88FxWm898dWDoMFnRpeHDrJ3K2wT1H7w/lKTghYFwuqtDrpkiXLIGAB7njNE0tpdhWpcQNMxgpQsxr0gD1Hv6LxEoCr6869bQ0chpWSrY96zHYspQgWPB8yaxbtWSjx4FhU/RtpPlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738767488; c=relaxed/simple;
	bh=M41KJpPTgtZC1kvfB0ok8XtGl6qr+rtNSYSFho5CTIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G5ojyiSEnGHFY97dGgUSWSbDnjvV3LVggFNHF/LRuTio5aaufceHy+VupmhpDzNsJ6CBK07TkTPN0Sw86tdi0U5Hs9Zh2IEs15MMt4PA040U9eXMdsmzfTdSQYFFFmFEf3Ijx70uIwOj7NUUTI2g7P3tV1srJRXVkFMSNj4br8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kk6Pckv6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kk6Pckv6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738767488; x=1770303488;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M41KJpPTgtZC1kvfB0ok8XtGl6qr+rtNSYSFho5CTIc=;
  b=kk6Pckv6b3RqAkWvwZ6m1bhjBY65OCQIXDkhumiC4L9FZRuUVpFr0dBu
   sjrCA8j9LvtJdugxjZeb9q/Ewp8Hr1JH2vBCF2KB2uO77U+QjvXxx1LYQ
   xIh8hQQHesMZaKH54n0YrGAJOah0ryPumwFCisGjvSMiy+6TR9+bZsS4H
   PemQtn6kzehwFACz11ib5TzVZzcfLpz4hnUqC0n4PwCv/UObJeo9lOxiQ
   mm3utZVMCVvbe7MI1c3+rKSPjohdjEoWxNLjtblUNTSydczV7ZbelTno9
   X14z8NWWVl891k0O9yWXzcn1cMc0bJ7tnR6IoejAGZMbNzDU8WAh+eOK2
   Q==;
X-CSE-ConnectionGUID: xZR4ipiuTny0onyMM5mqLA==
X-CSE-MsgGUID: 2by5TVa6T3eLrQjCkA7axQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39232358"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="39232358"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 06:58:04 -0800
X-CSE-ConnectionGUID: +/C1jtaVQV+6by6EwWF+9w==
X-CSE-MsgGUID: hG1snVx5SUO/cR2QZ8CmNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111806975"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 05 Feb 2025 06:58:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C7EE5164; Wed, 05 Feb 2025 16:57:58 +0200 (EET)
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
Subject: [PATCH v3 3/4] dmaengine: Add a comment on why it's okay when kasprintf() fails
Date: Wed,  5 Feb 2025 16:57:11 +0200
Message-ID: <20250205145757.889247-4-andriy.shevchenko@linux.intel.com>
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

